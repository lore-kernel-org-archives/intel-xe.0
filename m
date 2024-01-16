Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E050AC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 13:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CC010E584;
	Tue, 16 Jan 2024 13:19:16 +0000 (UTC)
X-Greylist: delayed 646 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 13:19:14 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF87B10E00A
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jan 2024 13:19:14 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1705410502; bh=9ay4LfsoM7DZic5Y4/XjDh1E0Ts15QGfiT/jhd9/y6w=;
 h=From:To:Cc:Subject:Date:From;
 b=jQ9goE51DATaLo+8zYTZeHsRfMmaDip0+LwW7Z2RKKySH1/SSwZxhwdCw/q2Up/5i
 mmT9anRzC1Tq8YAqiGGsDgpX06sWM0rfKdfe5Mx8R53kzP6sBOq7gkgvRcnITbbOai
 McysOBID+ZmmgZ3UMx3PtSV9Nu6wrS97ft2sTH2sb5DZUxCXh7/ne2wUKjx1IAsFQ3
 TV4xcNUw1Y+7Po2yEmWXIpGr7WbXznNOduheL+ClJwNWgFY4x13l6j5MzDXuNMwsfn
 XW7eL3NhmxBlAOR5Ozv9JQZ2IIoupnFdf01oZ16WQ+RyqWfNSlLAuf/ivsFKddszeA
 84JX33Bdo1paQ==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 40GD8GsK1678134
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 15:08:16 +0200
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 40GD8GSv1678133; 
 Tue, 16 Jan 2024 15:08:16 +0200
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/irq: allocate all possible msix interrupts
Date: Tue, 16 Jan 2024 15:07:36 +0200
Message-Id: <20240116130736.1678104-1-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
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

For future platforms which will support msix, need to allocate all
possible interrupts.

Signed-off-by: Dani Liberman <dliberman@habana.ai>
Cc: Ohad Sharabi <osharabi@habana.ai>
---
 drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 907c8ff0fa21..62722809a01d 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -662,7 +662,7 @@ int xe_irq_install(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	irq_handler_t irq_handler;
-	int err, irq;
+	int err, irq, nvec;
 
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
@@ -672,7 +672,18 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_reset(xe);
 
-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	if (pdev->msix_cap) {
+		nvec = pci_msix_vec_count(pdev);
+		if (nvec <= 0) {
+			drm_err(&xe->drm, "MSIX: Failed getting count\n");
+			return -EINVAL;
+		}
+	} else {
+		/* device supports only msi */
+		nvec = 1;
+	}
+
+	err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (err < 0) {
 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
-- 
2.34.1

