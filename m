Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA939C3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 07:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E6E10E9C8;
	Wed, 17 Jul 2024 07:33:28 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C8B10E9C5
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 07:33:22 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46H7WN0q1135105; Wed, 17 Jul 2024 10:33:08 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v3 02/11] drm/xe/irq: add msix allocator
Date: Wed, 17 Jul 2024 10:32:14 +0300
Message-ID: <20240717073223.1135072-3-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240717073223.1135072-1-ilia.levi@intel.com>
References: <20240717073223.1135072-1-ilia.levi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Dani Liberman <dliberman@habana.ai>

MSIX interrupts are considered as a system resource. There are
several interrupts that will be assigned statically, and the rest
will be allocated and released dynamically.

Add MSIX allocator to manage all interrupts allocations.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_irq.c          | 99 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq.h          |  5 ++
 3 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7184e785e242..9b08291a2b66 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -314,6 +314,10 @@ struct xe_device {
 		struct {
 			/** @irq.msix.enabled: msix interrupts enabled on this device */
 			bool enabled;
+			/** @irq.msix.num_of_interrupts: number of msix interrupts */
+			u16 num_of_interrupts;
+			/** @irq.msix.indexes: used to allocate msix indexes */
+			struct xarray indexes;
 		} msix;
 	} irq;
 
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index d43af4df1369..7bfccc731a8d 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -30,6 +30,10 @@
 #define IIR(offset)				XE_REG(offset + 0x8)
 #define IER(offset)				XE_REG(offset + 0xc)
 
+enum static_msix_allocations {
+	NUM_OF_STATIC_MSIX,
+};
+
 static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
 {
 	u32 val = xe_mmio_read32(mmio, reg);
@@ -677,6 +681,13 @@ static void xe_irq_msi_free(struct xe_device *xe)
 
 static void xe_irq_msix_free(struct xe_device *xe)
 {
+	unsigned long idx;
+	u32 *dummy;
+
+	xa_for_each(&xe->irq.msix.indexes, idx, dummy)
+		xe_irq_free_irq(xe, idx);
+
+	xa_destroy(&xe->irq.msix.indexes);
 }
 
 static void xe_irq_free(struct xe_device *xe)
@@ -737,6 +748,8 @@ int xe_irq_install(struct xe_device *xe)
 	nvec = pci_msix_vec_count(pdev);
 	if (nvec > 0) {
 		xe->irq.msix.enabled = true;
+		xe->irq.msix.num_of_interrupts = nvec;
+		xa_init_flags(&xe->irq.msix.indexes, XA_FLAGS_ALLOC);
 	} else if (nvec == -EINVAL) {
 		/* MSIX capability is not supported in the device, using MSI */
 		irq_flags = PCI_IRQ_MSI;
@@ -780,6 +793,12 @@ int xe_irq_install(struct xe_device *xe)
 
 static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
 {
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned long msix_irq;
+	u32 *dummy;
+
+	xa_for_each(&xe->irq.msix.indexes, msix_irq, dummy)
+		synchronize_irq(pci_irq_vector(pdev, msix_irq));
 }
 
 void xe_irq_suspend(struct xe_device *xe)
@@ -816,3 +835,83 @@ void xe_irq_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_irq_enable_hwe(gt);
 }
+
+static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf, bool dynamic_msix, u16 *msix)
+{
+	struct xa_limit limit;
+	int ret = 0;
+	u32 id;
+
+	limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.msix.num_of_interrupts) :
+				 XA_LIMIT(*msix, *msix);
+
+	ret = xa_alloc(&xe->irq.msix.indexes, &id, irq_buf, limit, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	if (dynamic_msix)
+		*msix = id;
+
+	return 0;
+}
+
+static void xe_irq_release_msix(struct xe_device *xe, u16 msix)
+{
+	xa_erase(&xe->irq.msix.indexes, msix);
+}
+
+int xe_irq_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
+		       const char *name, bool dynamic_msix, u16 *msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int ret, irq;
+
+	ret = xe_irq_alloc_msix(xe, irq_buf, dynamic_msix, msix);
+	if (ret < 0)
+		return ret;
+
+	irq = pci_irq_vector(pdev, *msix);
+	if (irq < 0) {
+		ret = irq;
+		goto release_msix;
+	}
+
+	ret = request_irq(irq, handler, IRQF_SHARED, name, irq_buf);
+	if (ret < 0)
+		goto release_msix;
+
+	return 0;
+
+release_msix:
+	drm_err(&xe->drm, "Failed to request irq for MSIX %u\n", *msix);
+	xe_irq_release_msix(xe, *msix);
+	return ret;
+}
+
+void xe_irq_free_irq(struct xe_device *xe, u16 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	void *irq_buf;
+	int irq;
+
+	/*
+	 * When removing the driver this function can be called twice for each msix that was
+	 * allocated for exec queue. First from irq_uninstall() and then from exec queue free.
+	 * Hence, it is possible that the xarray was already destroyed or the member was removed.
+	 */
+	if (xa_empty(&xe->irq.msix.indexes))
+		return;
+
+	irq_buf = xa_load(&xe->irq.msix.indexes, msix);
+	if (!irq_buf)
+		return;
+
+	irq = pci_irq_vector(pdev, msix);
+	if (irq < 0) {
+		drm_err(&xe->drm, "MSIX %u can't be released, there is no matching IRQ\n", msix);
+		return;
+	}
+
+	free_irq(irq, irq_buf);
+	xe_irq_release_msix(xe, msix);
+}
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index 067514e13675..78d3321da6e3 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -6,6 +6,8 @@
 #ifndef _XE_IRQ_H_
 #define _XE_IRQ_H_
 
+#include <linux/interrupt.h>
+
 struct xe_device;
 struct xe_tile;
 struct xe_gt;
@@ -14,5 +16,8 @@ int xe_irq_install(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
 void xe_irq_enable_hwe(struct xe_gt *gt);
+int xe_irq_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf,
+		       const char *name, bool dynamic_msix, u16 *msix);
+void xe_irq_free_irq(struct xe_device *xe, u16 msix);
 
 #endif
-- 
2.43.2

