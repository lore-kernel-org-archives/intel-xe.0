Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF9CC47422
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jan 2024 07:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174F910F666;
	Wed, 24 Jan 2024 07:51:18 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3B610F339
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Jan 2024 07:51:16 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1706082667; bh=N8GpoI1KKdO8bku8wC+ToyP5AZeF4BOYWRt6HZJizes=;
 h=From:To:Cc:Subject:Date:From;
 b=wZqIImNh6iy0nce1OgM5vDWiLR6FCRVZY6bhDOUcefZJSWPWwYHoxBQ4rAU/zHc9P
 yPd9GNwsyNY3ao2kCC1mCCWWQW9xdFKPB4Z12dpZeVpRsuk27txrjHPBkRlN3iWinO
 qtTwPNiOVQphd5g2ALOAbpJZr9KM4fZVZU6ZMyYJM81gO6FUBiYC9zikpCGL4hxFpj
 Oj4esjg/vlyj7teIDhE2PTP5QKKlZPamQiIW9gNaMmNBCyvsQCLdvtPQKnPUgNdv+M
 wnKbQIRq955ndb95TCBktTVgy/WDieQRbFIg+fQ2jqebLTOSaiTiQGvcfYDfS6qd3i
 CNazp6xwYSibg==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 40O7p1OS2302249
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 24 Jan 2024 09:51:01 +0200
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 40O7p1VC2302248; 
 Wed, 24 Jan 2024 09:51:01 +0200
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe/irq: allocate all possible msix interrupts
Date: Wed, 24 Jan 2024 09:50:58 +0200
Message-Id: <20240124075058.2302235-1-dliberman@habana.ai>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If platform supports MSIX, driver needs to allocate all possible
interrupts.

v2:
  - drop msix_cap and use the api return code instead.
  - fix commit message.

v3:
  - pass specific type in irq flags.

Cc: Ohad Sharabi <osharabi@habana.ai>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_irq.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 2fd8cc26fc9f..d9e23aae9e7a 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -683,8 +683,9 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
 int xe_irq_install(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	unsigned int irq_flags = PCI_IRQ_MSIX;
 	irq_handler_t irq_handler;
-	int err, irq;
+	int err, irq, nvec;
 
 	irq_handler = xe_irq_handler(xe);
 	if (!irq_handler) {
@@ -694,7 +695,19 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_reset(xe);
 
-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
+	nvec = pci_msix_vec_count(pdev);
+	if (nvec <= 0) {
+		if (nvec == -EINVAL) {
+			/* MSIX capability is not supported in the device, using MSI */
+			irq_flags = PCI_IRQ_MSI;
+			nvec = 1;
+		} else {
+			drm_err(&xe->drm, "MSIX: Failed getting count\n");
+			return nvec;
+		}
+	}
+
+	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
 	if (err < 0) {
 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
-- 
2.34.1

