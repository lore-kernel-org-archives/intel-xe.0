Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EAC30659
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 12:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E9F10E029;
	Thu, 27 Jun 2024 12:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="wpITjZ4S";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E634410E029
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 12:41:11 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719492070; bh=uJCWZvIVwjgs6zi9LJFCEfPpGm4UaeNdw979uNPhUSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wpITjZ4SDUoj1NHMRc/1qJYl4z+LKC4djlkDx5r03jtrVhboTknDVdDn0hRF1WEQN
 NJrdZVj7rtqSDZUxnEOT/5WRLKlTRG/74I0qubncZJcqAshkO/Rs3kdKBvBDetDSX8
 +h4XzNA4elCYU96KL+7wkfL+PoGejRjfOiAQi5LKCxCsB+t0/7GZgo9X+7DZrS6mtD
 0UR98qnSRA2TM+766aIms24liE5bVopLx8hYJIXcpJHuokprh3oLfTVeyFmD90TAWO
 YRxdckBpum1Dtfh6j0k0iEWzHa6G9aJYNiNxbgcms6wkQbZz7nGhDHXqdQUg2M3QBi
 q581OlZqtkLlQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45RCew622923626
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 15:40:58 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45RCewSx2923625; 
 Thu, 27 Jun 2024 15:40:58 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai, rodrigo.vivi@intel.com
Subject: [PATCH v2 2/8] drm/xe/irq: add msix allocator
Date: Thu, 27 Jun 2024 15:40:37 +0300
Message-Id: <20240627124043.2923586-3-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627124043.2923586-1-dliberman@habana.ai>
References: <20240627124043.2923586-1-dliberman@habana.ai>
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

MSIX interrupts are considered as a system resource. There are
several interrupts that will be assigned statically, and the rest
will be allocated and released dynamically.

Add MSIX allocator to manage all interrupts allocations.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_device_types.h |  4 ++
 drivers/gpu/drm/xe/xe_irq.c          | 78 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_irq.h          |  5 ++
 3 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 09ce7ba1b4ed..0d772f8d4b40 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -308,6 +308,10 @@ struct xe_device {
 		bool enabled;
 		/** @irq.msix_enabled: msix interrupts enabled on this device */
 		bool msix_enabled;
+		/** @irq.num_of_interrupts: number of msix interrupts */
+		u32 num_of_interrupts;
+		/** @irq.msix_indexes: used to allocate msix indexes */
+		struct xarray msix_indexes;
 	} irq;
 
 	/** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index c0fc75592022..b552af53db2f 100644
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
@@ -816,3 +820,77 @@ void xe_irq_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_irq_enable_hwe(gt);
 }
+
+static int xe_irq_alloc_msix(struct xe_device *xe, void *irq_buf, bool dynamic_msix, u32 *msix)
+{
+	struct xa_limit limit;
+	int ret = 0;
+	u32 id;
+
+	limit = (dynamic_msix) ? XA_LIMIT(NUM_OF_STATIC_MSIX, xe->irq.num_of_interrupts) :
+				 XA_LIMIT(*msix, *msix);
+
+	ret = xa_alloc(&xe->irq.msix_indexes, &id, irq_buf, limit, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	if (dynamic_msix)
+		*msix = id;
+
+	return 0;
+}
+
+static void xe_irq_release_msix(struct xe_device *xe, u32 msix)
+{
+	xa_erase(&xe->irq.msix_indexes, msix);
+}
+
+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
+		   bool dynamic_msix, u32 *msix)
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
+void xe_free_irq(struct xe_device *xe, u32 msix)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	void *irq_buf;
+	int irq;
+
+	irq_buf = xa_load(&xe->irq.msix_indexes, msix);
+	if (!irq_buf) {
+		drm_err(&xe->drm, "MSIX %u can't be released since it wasn't allocated\n", msix);
+		return;
+	}
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
index 067514e13675..6529dff90f76 100644
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
+int xe_request_irq(struct xe_device *xe, irq_handler_t handler, void *irq_buf, const char *name,
+		   bool dynamic_msix, u32 *msix);
+void xe_free_irq(struct xe_device *xe, u32 msix);
 
 #endif
-- 
2.34.1

