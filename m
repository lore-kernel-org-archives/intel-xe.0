Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE3FC47422
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jan 2024 09:02:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3A410E1EE;
	Sun, 21 Jan 2024 09:02:41 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAEF10E1EE
 for <intel-xe@lists.freedesktop.org>; Sun, 21 Jan 2024 09:02:40 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1705827753; bh=zBFNik1DY80WVlaQEY+WZ0aT6/23AjbTGL3mnDkexnc=;
 h=From:To:Cc:Subject:Date:From;
 b=I9YyTiKnbYC07AO1cNweUV+h7rmVod78K1wo3THMW4nuOatISgBjHMM34gRSi4LKq
 oH09wKh/DZsLWg9b/l1f6RRz2MwrE6HvTmn6RPJ7/Ca1CSGUz0+ipbvpaYg2kPUUE2
 QKq8vakkcg5i/z63+ZCluzYK4X7z6YYtMIgnvewjJj7mJKJ8bYOlw0nEJgSDJYgVP3
 dBSu/dDGD8rZkTuo3Q+ShHPaLVMqvXZsENLdj8/nBTbkV3hFdsL6crxdB4oekwPbFv
 yJ09mRoqVYlZ54RvkRp/tDFOERB1Ca5Vnf2VfeqbLlCtgclHSCKdOgOssd0rNoIqIK
 1X2aGJIpZJDhw==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 40L92SdP2072938
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 21 Jan 2024 11:02:28 +0200
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 40L92R8q2072937; 
 Sun, 21 Jan 2024 11:02:27 +0200
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/irq: allocate all possible msix interrupts
Date: Sun, 21 Jan 2024 11:02:14 +0200
Message-Id: <20240121090214.2072923-1-dliberman@habana.ai>
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

Cc: Ohad Sharabi <osharabi@habana.ai>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_irq.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 907c8ff0fa21..7a23d25c1062 100644
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
+	nvec = pci_msix_vec_count(pdev);
+	if (nvec <= 0) {
+		if (nvec == -EINVAL) {
+			/* MSIX capability is not supported in the device, using MSI */
+			nvec = 1;
+		} else {
+			drm_err(&xe->drm, "MSIX: Failed getting count\n");
+			return nvec;
+		}
+	}
+
+	err = pci_alloc_irq_vectors(pdev, nvec, nvec, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (err < 0) {
 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
-- 
2.34.1

