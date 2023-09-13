Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12257CA5534
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 10:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7B010E498;
	Wed, 13 Sep 2023 10:07:17 +0000 (UTC)
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E9110E497
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 10:07:15 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1694599001; bh=hMX/A9Ja9PWFkS+1DHN2faSTs3RuE9KoeRSLE7g6M2M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZePChzl+GG5E38d6/VizvSxX5YVU2f4+z7AoDVn9skQTbTD8jHQ2vlZ8hQxLxzR32
 5JdX055e8romPZ07Dm65OsrIJes6vc6CZuF0tFRcS+UYKuv1ZMWzOJxwUE9ewre+Yw
 ferh9Nw4R1r28guuB5B8vTUiF1emRZLmrlFb+tBOp2RCGI9a6mdYVPzX3zLo2eF7nx
 I+hUCzetGQkP2BNY85j4/P9kohRUqrlyz667erch89ZRj8tv4ZEM3Er4Svgkb70zY9
 NWfL+vwr2zyau5DltoxchBHjkYc7y4GXUydEW2o1ggRA+6pECRe78916uIRU0NIUpw
 ++VtD+osnsqzg==
Received: from kelbaz-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by kelbaz-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP
 id 38D9w0R11661142; Wed, 13 Sep 2023 12:58:13 +0300
From: Koby Elbaz <kelbaz@habana.ai>
To: intel-xe@lists.freedesktop.org
Date: Wed, 13 Sep 2023 12:57:57 +0300
Message-Id: <20230913095800.1661119-4-kelbaz@habana.ai>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913095800.1661119-1-kelbaz@habana.ai>
References: <20230913095800.1661119-1-kelbaz@habana.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/6] drm/xe: add a flag to bypass multi-tile
 config from MTCFG reg
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
Cc: Moti Haimovski <mhaimovski@habana.ai>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Skip reading this register as it is not relevant in the new devices.

Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
Reviewed-by: Ofir Bitton <obitton@habana.ai>
Reviewed-by: Moti Haimovski <mhaimovski@habana.ai>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_mmio.c         | 24 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 5890b63639e7..7b8852c5ea4c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -250,6 +250,8 @@ struct xe_device {
 		u8 has_link_copy_engine:1;
 		/** @enable_display: display enabled */
 		u8 enable_display:1;
+		/** @bypass_mtcfg: Bypass Multi-Tile configuration from MTCFG register */
+		u8 bypass_mtcfg:1;
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 		const struct intel_display_device_info *display;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 3ccc0af4430b..054ad752303f 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -318,26 +318,28 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 
 static void xe_mmio_probe_tiles(struct xe_device *xe)
 {
+	u8 adj_tile_count = xe->info.tile_count;
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
 	u32 mtcfg;
-	u8 adj_tile_count;
 	u8 id;
 
 	if (xe->info.tile_count == 1)
 		return;
 
-	mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
-	adj_tile_count = xe->info.tile_count =
-		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
+	if (!xe->info.bypass_mtcfg) {
+		mtcfg = xe_mmio_read64_2x32(gt, XEHP_MTCFG_ADDR);
+		adj_tile_count = xe->info.tile_count =
+			REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
 
-	/*
-	 * FIXME: Needs some work for standalone media, but should be impossible
-	 * with multi-tile for now.
-	 */
-	xe->info.gt_count = xe->info.tile_count;
+		/*
+		 * FIXME: Needs some work for standalone media, but should be impossible
+		 * with multi-tile for now.
+		 */
+		xe->info.gt_count = xe->info.tile_count;
 
-	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-		 xe->info.tile_count, adj_tile_count);
+		drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
+			 xe->info.tile_count, adj_tile_count);
+	}
 
 	if (xe->info.tile_count > 1) {
 		const int mmio_bar = 0;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index dc233a1226bd..4e7fbabca6a5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -59,6 +59,7 @@ struct xe_device_desc {
 	u8 has_display:1;
 
 	u8 has_llc:1;
+	u8 bypass_mtcfg:1;
 };
 
 __diag_push();
@@ -565,6 +566,7 @@ static int xe_info_init(struct xe_device *xe,
 	xe->info.graphics_name = graphics_desc->name;
 	xe->info.media_name = media_desc ? media_desc->name : "none";
 	xe->info.has_llc = desc->has_llc;
+	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
 
 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
 	xe->info.vram_flags = graphics_desc->vram_flags;
-- 
2.34.1

