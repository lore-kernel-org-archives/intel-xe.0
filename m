Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB86C4332F
	for <intel-xe@archiver.kernel.org>; Sun, 29 Oct 2023 17:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B1010E188;
	Sun, 29 Oct 2023 17:53:41 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343D210E188
 for <intel-xe@lists.freedesktop.org>; Sun, 29 Oct 2023 17:53:39 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1698602009; bh=EMMMS/8SksVYNPeiuzIaqjn2lXRCUQ7SuCyRUtytOv4=;
 h=From:To:Cc:Subject:Date:From;
 b=rwnYvPaiVcHWjIjvafrGL/yxUgjEC8D2Xf6qMcYcMRCF8YDdvlZL+d0Nig2+m4l4V
 qpuhWjxK406gBqiviCsye+bleiYcMNDr1zruvWfy2exN+AP1SSZtfeU4iQ5xpKwTN5
 1UCeqVhqUy9Ea8eH8GEGFL08heTs3J92Wj5zan0tUODdr8S6Il5V848q7r9kUtNMJ0
 cocBSHESYY7XbCK2C3tdCqIB0homLP9IBVy4lzc5zClPU+/Ajp12aY/AenlJIfiN8E
 hhtft5iUULsR11JGdgam/TsgnJwTSZ6bl5kU1H0lhItTOmWwlXNCqBHQ8n5f7r3IBu
 0Uqd5LkjdBSdA==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 39THrQYs626756; Sun, 29 Oct 2023 19:53:26 +0200
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Sun, 29 Oct 2023 19:53:26 +0200
Message-Id: <20231029175326.626745-1-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2] drm/xe: move the lmem verification code into
 a separate function
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

If lmem (VRAM) is not fully initialized, the punit will power down
the GT, which will prevent register access from the driver side.
That code moved into a corresponding function (xe_verify_lmem_ready)
to make the code clearer.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
---
Changes in v2:
 - Removed a redundant comment

 drivers/gpu/drm/xe/xe_mmio.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 0da4f75c07bf..d8f9fabf715e 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -381,10 +381,27 @@ static void mmio_fini(struct drm_device *drm, void *arg)
 		iounmap(xe->mem.vram.mapping);
 }
 
+static int xe_verify_lmem_ready(struct xe_device *xe)
+{
+	struct xe_gt *gt = xe_root_mmio_gt(xe);
+
+	/*
+	 * The boot firmware initializes local memory and assesses its health.
+	 * If memory training fails, the punit will have been instructed to
+	 * keep the GT powered down; we won't be able to communicate with it
+	 * and we should not continue with driver initialization.
+	 */
+	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
+		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
 int xe_mmio_init(struct xe_device *xe)
 {
 	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
-	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	const int mmio_bar = 0;
 	int err;
 
@@ -409,16 +426,9 @@ int xe_mmio_init(struct xe_device *xe)
 	root_tile->mmio.size = xe->mmio.size;
 	root_tile->mmio.regs = xe->mmio.regs;
 
-	/*
-	 * The boot firmware initializes local memory and assesses its health.
-	 * If memory training fails, the punit will have been instructed to
-	 * keep the GT powered down; we won't be able to communicate with it
-	 * and we should not continue with driver initialization.
-	 */
-	if (IS_DGFX(xe) && !(xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT)) {
-		drm_err(&xe->drm, "VRAM not initialized by firmware\n");
-		return -ENODEV;
-	}
+	err = xe_verify_lmem_ready(xe);
+	if (err)
+		return err;
 
 	err = xe_set_dma_info(xe);
 	if (err)
-- 
2.34.1

