Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6738CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 11:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4606910E044;
	Mon, 18 Sep 2023 11:56:43 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C04D10E044
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 11:56:39 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1695037751; bh=wAWKFkJzJWt/HfyYVYZFK3SbAFv78rzCCSVcDchVTs8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EanMMdoqkxmdz+Nctt4GoGRari2Ykbeu7pd/i85Kxei2H6Vx2tcUV52VaQuZsYezD
 HQKxh5aeng0EM08TQ/7yw2EbUih5qMZcb+JxAjDTxq0Rhj+l4yY002gWCN15IGQklA
 1chljTb5pGfjYgsWJyAAj+aP8h2dhcdZoja8922yPnhK5qXBjFJ2SnyGHXbliQqUKn
 h9ChFuuE2UrAmdy/Ag3lWdAcBi1P4O9FfCrk9hsQiOHw1sYKQc2xJE2Eq/qVlHQWb6
 yeuHI7o+fPhW9AMbgjCJgHblKp6wj9+DAY5S9BszGnj86stA0tW8bV8cgtWdmbiqTO
 WKBlpQV9RF7fg==
Received: from dliberman-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTPS id 38IBnGrw067741
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 18 Sep 2023 14:49:16 +0300
Received: (from dliberman@localhost)
 by dliberman-vm-u22.habana-labs.com (8.15.2/8.15.2/Submit) id 38IBnGgF067740; 
 Mon, 18 Sep 2023 14:49:16 +0300
From: Dani Liberman <dliberman@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Mon, 18 Sep 2023 14:48:48 +0300
Message-Id: <20230918114848.67712-3-dliberman@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918114848.67712-1-dliberman@habana.ai>
References: <20230918114848.67712-1-dliberman@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: add msix support
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

In future devices we will need to support msix interrupts.

Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
Signed-off-by: Dani Liberman <dliberman@habana.ai>
---
 drivers/gpu/drm/xe/xe_irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 6052c944acda..504cb94d0ee8 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -593,16 +593,16 @@ int xe_irq_install(struct xe_device *xe)
 
 	xe_irq_reset(xe);
 
-	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
+	err = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI | PCI_IRQ_MSIX);
 	if (err < 0) {
-		drm_err(&xe->drm, "MSI: Failed to enable support %d\n", err);
+		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
 		return err;
 	}
 
 	irq = pci_irq_vector(pdev, 0);
 	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
 	if (err < 0) {
-		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
+		drm_err(&xe->drm, "Failed to request MSI/MSIX IRQ %d\n", err);
 		goto free_pci_irq_vectors;
 	}
 
-- 
2.34.1

