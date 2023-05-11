Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA40C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F82110E59E;
	Thu, 11 May 2023 03:47:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DEE10E590
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776850; x=1715312850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPr+znhNptO0Y5IdGhWqpvgBhTu0HtwjI4JHmWrGrIA=;
 b=TOeFAxRlrLmMTjUegXZFb06H/jT9CEGbj/fwSp8btPg+IZxJOUkLStie
 FD1Jj3JiEm5ZN8IMmzazhQUAhIX4WS9rdcaw/kk4FlRacphqwub1JgGoL
 SBpqwyNNy5oWsmZSw+CGwDYaHg/TAErpB45jRd/KLFna9RoKV9rZIa0+I
 bYpjR3KSwy1YJ5FJXbq7nCVM9/fqMBCgh+0GlzoR/EV4WRlXZAyq+MrZS
 wOVrhFCxKfo3hm8R8hEf4E3Ws+eH1F5sVhx/AN035SSERhqsaSdlhFoN8
 TYCxciTK6HYWwkFtytzl9hiJapaeokjR34+qUsr7R07nfPpPeasy+9iI0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850629"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850629"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203176"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203176"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:46:57 -0700
Message-Id: <20230511034722.1929038-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 01/26] drm/xe/mtl: Disable media GT
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Xe incorrectly conflates the concept of 'tile' and 'GT.'  Since MTL's
media support is not yet functioning properly, let's just disable it
completely for now while we fix the fundamental driver design.  Support
for media GTs on platforms like MTL will be re-added later.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_mcr.c |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c   |  2 --
 drivers/gpu/drm/xe/xe_pci.c    | 15 ++-------------
 3 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
index 3db550c85e32..be80fdc4b5a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_mcr.c
+++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
@@ -293,7 +293,7 @@ void xe_gt_mcr_init(struct xe_gt *gt)
 
 	spin_lock_init(&gt->mcr_lock);
 
-	if (gt->info.type == XE_GT_TYPE_MEDIA) {
+	if (xe_gt_is_media_type(gt)) {
 		drm_WARN_ON(&xe->drm, MEDIA_VER(xe) < 13);
 
 		gt->steering[OADDRM].ranges = xelpmp_oaddrm_steering_table;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index c7fbb1cc1f64..4804616a3c44 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -301,8 +301,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-	if (xe->info.media_verx100 >= 1300)
-		xe->info.tile_count *= 2;
 
 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
 		 xe->info.tile_count, adj_tile_count);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index a6858fc7fe8d..bf2c234c4f6e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -19,6 +19,7 @@
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
+#include "xe_gt.h"
 #include "xe_macros.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
@@ -271,20 +272,10 @@ static const struct xe_device_desc pvc_desc = {
 	.extra_gts = pvc_gts,
 };
 
-static const struct xe_gt_desc xelpmp_gts[] = {
-	{
-		.type = XE_GT_TYPE_MEDIA,
-		.vram_id = 0,
-		.mmio_adj_limit = 0x40000,
-		.mmio_adj_offset = 0x380000,
-	},
-};
-
 static const struct xe_device_desc mtl_desc = {
 	/* .graphics and .media determined via GMD_ID */
 	.require_force_probe = true,
 	PLATFORM(XE_METEORLAKE),
-	.extra_gts = xelpmp_gts,
 };
 
 #undef PLATFORM
@@ -528,8 +519,6 @@ static int xe_info_init(struct xe_device *xe,
 	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
-	if (MEDIA_VER(xe) >= 13)
-		xe->info.tile_count++;
 
 	xe->info.subplatform = subplatform_desc ?
 		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
@@ -553,7 +542,7 @@ static int xe_info_init(struct xe_device *xe,
 		} else {
 			gt->info.type = desc->extra_gts[id - 1].type;
 			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
-			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
+			gt->info.__engine_mask = xe_gt_is_media_type(gt) ?
 				media_desc->hw_engine_mask :
 				graphics_desc->hw_engine_mask;
 			gt->mmio.adj_limit =
-- 
2.40.0

