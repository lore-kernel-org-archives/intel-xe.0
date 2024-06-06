Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91727C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 12:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB9810E93E;
	Thu,  6 Jun 2024 12:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="T2B99RB4";
	dkim-atps=neutral
X-Greylist: delayed 675 seconds by postgrey-1.36 at gabe;
 Thu, 06 Jun 2024 12:58:34 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A4910E93E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 12:58:34 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1717678044; bh=aL1Vsq4T+7/TBIyqVb+hrKFjXJNYJJjFvlOfVUtOc0M=;
 h=From:To:Cc:Subject:Date:From;
 b=T2B99RB4LWmUStVMcL+xFamWPs+65qgY/AqDPo1RotEVqdtOoqxlRI/RU/p5wRMXF
 8jOuPjQHXLSnjoFyG7JhLjvS/iCt/XwT+4Y85hSO5nH9j8P86DXtenPDLI1vTVZMnM
 dJ5voMXHbytFNVQpU3cJz/wdyduIge/UWma5e+xttmk6ohogHrv8YmvMxfdp74DjN2
 zEKDpEhy30psKVaSvCUW+zGgch8H+IcX/e9m5yb6/i9K8pPY9RPYB3vmAQFPjjrGcJ
 bq97lplBEGxHxp/sX5zAc//F5DfIpwlEHdAmTCpxgLqV1F1qH9YmEq5Y07/0m5pOJo
 mwmae1uF3Pu6Q==
Received: from illevi-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by illevi-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 456Cl5Et822462; Thu, 6 Jun 2024 15:47:05 +0300
From: Ilia Levi <illevi@habana.ai>
To: intel-xe@lists.freedesktop.org
Cc: illevi@habana.ai, obitton@habana.ai, dliberman@habana.ai,
 dmeriin@habana.ai, matthew.auld@intel.com, matthew.brost@intel.com
Subject: [PATCH] drm/xe/irq: remove xe_irq_shutdown
Date: Thu,  6 Jun 2024 15:47:05 +0300
Message-ID: <20240606124705.822451-1-illevi@habana.ai>
X-Mailer: git-send-email 2.43.2
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

The cleanup is done by devres in irq_uninstall.

Commit bbc9651fe9f4 ("drm/xe/irq: move irq_uninstall over to devm")
resolved the ordering issue where irq_uninstall (registered with drmm)
was called after pci_free_irq_vectors (registered with devm upon calling
pci_alloc_irq_vectors). This happened because drmm action list is
registered with devm very early in the init flow - before
pci_alloc_irq_vectors.

Now that irq_uninstall is registered with devm, it will be called before
pci_free_irq_vectors and we can remove xe_irq_shutdown.

Signed-off-by: Ilia Levi <illevi@habana.ai>
---
 drivers/gpu/drm/xe/xe_device.c | 12 ++++--------
 drivers/gpu/drm/xe/xe_irq.c    |  5 -----
 drivers/gpu/drm/xe/xe_irq.h    |  1 -
 3 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 94dbfe5cf19c..035576bb20ec 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -619,16 +619,16 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_device_set_has_flat_ccs(xe);
 	if (err)
-		goto err_irq_shutdown;
+		goto err;
 
 	err = xe_vram_probe(xe);
 	if (err)
-		goto err_irq_shutdown;
+		goto err;
 
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
-			goto err_irq_shutdown;
+			goto err;
 	}
 
 	/* Allocate and map stolen after potential VRAM resize */
@@ -642,7 +642,7 @@ int xe_device_probe(struct xe_device *xe)
 	 */
 	err = xe_display_init_noaccel(xe);
 	if (err)
-		goto err_irq_shutdown;
+		goto err;
 
 	for_each_gt(gt, xe, id) {
 		last_gt = id;
@@ -681,8 +681,6 @@ int xe_device_probe(struct xe_device *xe)
 			break;
 	}
 
-err_irq_shutdown:
-	xe_irq_shutdown(xe);
 err:
 	xe_display_fini(xe);
 	return err;
@@ -709,8 +707,6 @@ void xe_device_remove(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id)
 		xe_gt_remove(gt);
-
-	xe_irq_shutdown(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 8ee3c300c5e4..cccecaa0dffd 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -735,11 +735,6 @@ int xe_irq_install(struct xe_device *xe)
 	return err;
 }
 
-void xe_irq_shutdown(struct xe_device *xe)
-{
-	irq_uninstall(xe);
-}
-
 void xe_irq_suspend(struct xe_device *xe)
 {
 	int irq = to_pci_dev(xe->drm.dev)->irq;
diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
index bc42bc90d967..067514e13675 100644
--- a/drivers/gpu/drm/xe/xe_irq.h
+++ b/drivers/gpu/drm/xe/xe_irq.h
@@ -11,7 +11,6 @@ struct xe_tile;
 struct xe_gt;
 
 int xe_irq_install(struct xe_device *xe);
-void xe_irq_shutdown(struct xe_device *xe);
 void xe_irq_suspend(struct xe_device *xe);
 void xe_irq_resume(struct xe_device *xe);
 void xe_irq_enable_hwe(struct xe_gt *gt);
-- 
2.43.2

