Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74EBC27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 10:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FE310E833;
	Wed, 26 Jun 2024 10:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="newJODU7";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E70510E270
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 10:34:12 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1719398055; bh=ffT3Bz5JUdsmvxA5/timJ+hOGtaKYrgi2WXFub9kzv4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=newJODU7k3fC6It/RnTEYFc13BFuYgGZszpona7uDWBzuLXReU2OQAt9JDrszQiKE
 4tloMEVjP4a0yYcy9c6/+GH3R/QSUCjLIN4TX4Je0rpGad64d3vQh65jSabPHUWK7Z
 l1pg7CCcBnuuAmJKNm6gpNJqLec0aOEQtG4UBDqqlRTMtDT8KHcUd7ZciPADDjK7zp
 Hw9qjB/wsYJtxB6PVyX29FhKGlPsHTl0xjqTZnrOeBm2IUtXS1eEx++Rfz5VtY1/yj
 9zmRrk//KGItdVXNN9jsj9W4C6HPMq5ti/6FonlcSlTCSTd2UPdqPnq4oOTYKNTCqc
 vIiq7Ki8iSeIA==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 45QAY3Oc2801782
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 13:34:03 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 45QAY3dw2801781; 
 Wed, 26 Jun 2024 13:34:03 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: dliberman@habana.ai, illevi@habana.ai
Subject: [PATCH 1/8] drm/xe/irq: refactor irq flows to support also msix
Date: Wed, 26 Jun 2024 13:33:38 +0300
Message-Id: <20240626103345.2801735-2-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626103345.2801735-1-dliberman@habana.ai>
References: <20240626103345.2801735-1-dliberman@habana.ai>
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

When enabling MSIX, there is no need for HW to aggregate interrupts.
Added a separate MSIX flow that skips unnecessary code in irq init,
reset, and fini.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_irq.c          | 99 +++++++++++++++++++++-------
 2 files changed, 77 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..09ce7ba1b4ed 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -306,6 +306,8 @@ struct xe_device {
 
 		/** @irq.enabled: interrupts enabled on this device */
 		bool enabled;
+		/** @irq.msix_enabled: msix interrupts enabled on this device */
+		bool msix_enabled;
 	} irq;
 
 	/** @ttm: ttm device */
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index ab3d5b7a1e8c..663a86edecc0 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -666,28 +666,46 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
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
+
+}
+
+static void xe_irq_free(struct xe_device *xe)
+{
+	if (xe->irq.msix_enabled)
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
@@ -695,32 +713,55 @@ int xe_irq_install(struct xe_device *xe)
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
+		xe->irq.msix_enabled = true;
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
+	if (xe->irq.msix_enabled)
+		err = xe_irq_msix_request(xe);
+	else
+		err = xe_irq_msi_request(xe);
+
+	if (err)
 		return err;
-	}
 
 	xe->irq.enabled = true;
 
@@ -733,7 +774,7 @@ int xe_irq_install(struct xe_device *xe)
 	return 0;
 
 free_irq_handler:
-	free_irq(irq, xe);
+	xe_irq_free(xe);
 
 	return err;
 }
@@ -743,6 +784,11 @@ void xe_irq_shutdown(struct xe_device *xe)
 	irq_uninstall(xe);
 }
 
+static void xe_irq_msix_synchronize_irq(struct xe_device *xe)
+{
+
+}
+
 void xe_irq_suspend(struct xe_device *xe)
 {
 	int irq = to_pci_dev(xe->drm.dev)->irq;
@@ -751,7 +797,12 @@ void xe_irq_suspend(struct xe_device *xe)
 	xe->irq.enabled = false; /* no new irqs */
 	spin_unlock_irq(&xe->irq.lock);
 
-	synchronize_irq(irq); /* flush irqs */
+	/* flush irqs */
+	if (xe->irq.msix_enabled)
+		xe_irq_msix_synchronize_irq(xe);
+	else
+		synchronize_irq(irq);
+
 	xe_irq_reset(xe); /* turn irqs off */
 }
 
-- 
2.34.1

