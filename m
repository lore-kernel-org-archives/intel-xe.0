Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19325C49EA1
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 10:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACD510E574;
	Thu, 25 Jul 2024 10:22:52 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2473B10E527
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 10:22:48 +0000 (UTC)
Received: internal info suppressed
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 46PAMDbW2182929; Thu, 25 Jul 2024 13:22:34 +0300
From: Ilia Levi <ilia.levi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: ilia.levi@intel.com, dliberman@habana.ai,
 niranjana.vishwanathapura@intel.com, michal.wajdeczko@intel.com
Subject: [PATCH v4 01/11] drm/xe/irq: refactor irq flows to support also msix
Date: Thu, 25 Jul 2024 13:22:03 +0300
Message-ID: <20240725102213.2182896-2-ilia.levi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725102213.2182896-1-ilia.levi@intel.com>
References: <20240725102213.2182896-1-ilia.levi@intel.com>
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

When enabling MSIX, there is no need for HW to aggregate interrupts.
Added a separate MSIX flow that skips unnecessary code in irq init,
reset, and fini.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_device.h       |  5 ++
 drivers/gpu/drm/xe/xe_device_types.h |  5 ++
 drivers/gpu/drm/xe/xe_irq.c          | 97 +++++++++++++++++++++-------
 3 files changed, 83 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index db6cc8d0d6b8..d4c6ca1da8e8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -159,6 +159,11 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
 	return GRAPHICS_VERx100(xe) >= 1250;
 }
 
+static inline bool xe_device_has_msix(struct xe_device *xe)
+{
+	return xe->irq.msix.enabled;
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5b7292a9a66d..909c83651103 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -313,6 +313,11 @@ struct xe_device {
 
 		/** @irq.enabled: interrupts enabled on this device */
 		bool enabled;
+		/** @irq.msix: irq info for platforms that support MSI-X */
+		struct {
+			/** @irq.msix.enabled: msix interrupts enabled on this device */
+			bool enabled;
+		} msix;
 	} irq;
 
 	/** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5f2c368c35ad..6230e4938004 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -668,28 +668,45 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
 		return xelp_irq_handler;
 }
 
-static void irq_uninstall(void *arg)
+static void xe_irq_msi_free(struct xe_device *xe)
 {
-	struct xe_device *xe = arg;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	int irq;
 
+	irq = pci_irq_vector(pdev, 0);
+	free_irq(irq, xe);
+}
+
+static void xe_irq_msix_free(struct xe_device *xe)
+{
+}
+
+static void xe_irq_free(struct xe_device *xe)
+{
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_free(xe);
+	else
+		xe_irq_msi_free(xe);
+}
+
+static void irq_uninstall(void *arg)
+{
+	struct xe_device *xe = arg;
+
 	if (!xe->irq.enabled)
 		return;
 
 	xe->irq.enabled = false;
 	xe_irq_reset(xe);
 
-	irq = pci_irq_vector(pdev, 0);
-	free_irq(irq, xe);
+	xe_irq_free(xe);
 }
 
-int xe_irq_install(struct xe_device *xe)
+static int xe_irq_msi_request(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	unsigned int irq_flags = PCI_IRQ_MSIX;
 	irq_handler_t irq_handler;
-	int err, irq, nvec;
+	int irq, err;
 
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
@@ -697,32 +714,55 @@ int xe_irq_install(struct xe_device *xe)
 		return -EINVAL;
 	}
 
-	xe_irq_reset(xe);
+	irq = pci_irq_vector(pdev, 0);
+	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
+	if (err < 0) {
+		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int xe_irq_msix_request(struct xe_device *xe)
+{
+	return 0;
+}
+
+int xe_irq_install(struct xe_device *xe)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int irq_flags = PCI_IRQ_MSIX;
+
+	int err, nvec;
 
 	nvec = pci_msix_vec_count(pdev);
-	if (nvec <= 0) {
-		if (nvec == -EINVAL) {
-			/* MSIX capability is not supported in the device, using MSI */
-			irq_flags = PCI_IRQ_MSI;
-			nvec = 1;
-		} else {
-			drm_err(&xe->drm, "MSIX: Failed getting count\n");
-			return nvec;
-		}
+	if (nvec > 0) {
+		xe->irq.msix.enabled = true;
+	} else if (nvec == -EINVAL) {
+		/* MSIX capability is not supported in the device, using MSI */
+		irq_flags = PCI_IRQ_MSI;
+		nvec = 1;
+	} else {
+		drm_err(&xe->drm, "MSIX: Failed getting count\n");
+		return nvec;
 	}
 
+	xe_irq_reset(xe);
+
 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err < 0) {
 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
 	}
 
-	irq = pci_irq_vector(pdev, 0);
-	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
-	if (err < 0) {
-		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
+	if (xe_device_has_msix(xe))
+		err = xe_irq_msix_request(xe);
+	else
+		err = xe_irq_msi_request(xe);
+
+	if (err)
 		return err;
-	}
 
 	xe->irq.enabled = true;
 
@@ -735,11 +775,15 @@ int xe_irq_install(struct xe_device *xe)
 	return 0;
 
 free_irq_handler:
-	free_irq(irq, xe);
+	xe_irq_free(xe);
 
 	return err;
 }
 
+static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
+{
+}
+
 void xe_irq_suspend(struct xe_device *xe)
 {
 	int irq = to_pci_dev(xe->drm.dev)->irq;
@@ -748,7 +792,12 @@ void xe_irq_suspend(struct xe_device *xe)
 	xe->irq.enabled = false; /* no new irqs */
 	spin_unlock_irq(&xe->irq.lock);
 
-	synchronize_irq(irq); /* flush irqs */
+	/* flush irqs */
+	if (xe_device_has_msix(xe))
+		xe_irq_msix_synchronize_irq(xe);
+	else
+		synchronize_irq(irq);
+
 	xe_irq_reset(xe); /* turn irqs off */
 }
 
-- 
2.43.2

