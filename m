Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7997ECD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 11:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F7110E044;
	Mon, 18 Sep 2023 11:57:55 +0000 (UTC)
X-Greylist: delayed 516 seconds by postgrey-1.36 at gabe;
 Mon, 18 Sep 2023 11:57:52 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB1310E044
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 11:57:52 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695037723; bh=vJ9AGZPrxmTwhpY+SATP4NLy2TAQJ4R3hpci002hiis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eJV52hZG9a++oyJIk/bWpQy74MVz0yOHmxhIAJfIi9cKEn4AG6d41b3EbwWIDSpiQ
 7WXZ1uJ00DQ4WFR1E8HT8B9IxciQveS0IDT4wnfm0eLZ75L13EZJXwpTA+ZnI5SDcH
 YxZzk9eEHewX3/pi9bfB5ErGWAAHMQ8OpMMAYrSpCQ+YDQswVoVqDH2Ai4OLy8yTAY
 mOSfg1X9elJn6lIArVzp0w2slutu26ynzjl8hvrVASvGka23lCaQD7KBp8PAYkm2Z8
 hvK0PY+Q/HS+4SptHKpOdTqp6bHAB8iNa8rYRaTkJQs7MKIW47ax6MyCVDjCATGbCm
 iExrpLY1zotfQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 38IBn5fg067735
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 14:49:05 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 38IBn52g067734; 
 Mon, 18 Sep 2023 14:49:05 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 14:48:47 +0300
Message-Id: <20230918114848.67712-2-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918114848.67712-1-dliberman@habana.ai>
References: <20230918114848.67712-1-dliberman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe: change old msi irq api to a new one
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
Cc: Ohad Sharabi <osharabi@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As a preparation for msix support, changing for new msi irq api
which supports both msi and msix.

Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_irq.c | 34 +++++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_pci.c |  3 ---
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index dff9a1b40540..6052c944acda 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -566,23 +566,24 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
 {
 	struct xe_device *xe = arg;
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int irq = pdev->irq;
+	int irq;
 
 	if (!xe->irq.enabled)
 		return;
 
 	xe->irq.enabled = false;
 	xe_irq_reset(xe);
+
+	irq = pci_irq_vector(pdev, 0);
 	free_irq(irq, xe);
-	if (pdev->msi_enabled)
-		pci_disable_msi(pdev);
+	pci_free_irq_vectors(pdev);
 }
 
 int xe_irq_install(struct xe_device *xe)
 {
-	int irq = to_pci_dev(xe->drm.dev)->irq;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	irq_handler_t irq_handler;
-	int err;
+	int err, irq;
 
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
@@ -592,10 +593,18 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_reset(xe);
 
-	err = request_irq(irq, irq_handler,
-			  IRQF_SHARED, DRIVER_NAME, xe);
-	if (err < 0)
+	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	if (err < 0) {
+		drm_err(&xe->drm, "MSI: Failed to enable support %d\n", err);
 		return err;
+	}
+
+	irq = pci_irq_vector(pdev, 0);
+	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
+	if (err < 0) {
+		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		goto free_pci_irq_vectors;
+	}
 
 	xe->irq.enabled = true;
 
@@ -603,7 +612,14 @@ int xe_irq_install(struct xe_device *xe)
 
 	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
 	if (err)
-		return err;
+		goto free_irq_handler;
+
+	return 0;
+
+free_irq_handler:
+	free_irq(irq, xe);
+free_pci_irq_vectors:
+	pci_free_irq_vectors(pdev);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc233a1226bd..a11163b89a3f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -694,9 +694,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	pci_set_master(pdev);
 
-	if (pci_enable_msi(pdev) < 0)
-		drm_dbg(&xe->drm, "can't enable MSI");
-
 	err = xe_info_init(xe, desc, subplatform_desc);
 	if (err)
 		goto err_pci_disable;
-- 
2.34.1

