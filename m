Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D67C7EE29
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C6C10E610;
	Thu,  1 Jun 2023 21:52:51 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091210E5DC
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656367; x=1717192367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVo3N3fsEOXufQSaktAV6ebhOaWuQX33VTZNUI9mUik=;
 b=UPgXLbfujhlKruEXSPDwnpb9JiWIrWBQvpnBPxzgvk3rU56yP4l/Axc2
 xRLFHTV3C52u6yl0iCQBsUs8t59iJckbmWoA47yQVwsmQpTC6JnEDNOlj
 5adI53k2yT7DzviWjiN2t62V1GdyxwYht1+qJd5j6l69VF1njOaYtbTOP
 mGQUGJLowtOq20fUEfdXMYWiThQez8+hvGgPPut180K/DclJKOpK3uBlg
 TN8FxOcBlCkQ/j12gowF0iXPj9l4n60pzmxIjafPSmNtjWKFpD7ziU2IC
 JcCQ7w+hKB1YlfzbC4KQv1X0rDzT22lg0/UtdN5dh6cipTypWyqBi0eE5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313584"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313584"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563550"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563550"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:14 -0700
Message-Id: <20230601215244.678611-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 01/31] drm/xe/mtl: Disable media GT
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

v2:
 - Drop some unrelated code cleanup that didn't belong in this patch.
   (Lucas)
v3:
 - Drop unnecessary xe_gt.h include.  (Gustavo)

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_mmio.c |  2 --
 drivers/gpu/drm/xe/xe_pci.c  | 12 ------------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d3b57669c9a7..ef2353eef6fe 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -340,8 +340,6 @@ static void xe_mmio_probe_tiles(struct xe_device *xe)
 	mtcfg = xe_mmio_read64(gt, XEHP_MTCFG_ADDR);
 	adj_tile_count = xe->info.tile_count =
 		REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
-	if (xe->info.media_verx100 >= 1300)
-		xe->info.tile_count *= 2;
 
 	drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
 		 xe->info.tile_count, adj_tile_count);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index d8f1213ae1d6..6f0c4203fca3 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -290,21 +290,11 @@ static const struct xe_device_desc pvc_desc = {
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
 	.has_display = true,
-	.extra_gts = xelpmp_gts,
 };
 
 #undef PLATFORM
@@ -566,8 +556,6 @@ static int xe_info_init(struct xe_device *xe,
 	 * treats it as the number of GTs rather than just the number of tiles.
 	 */
 	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
-	if (MEDIA_VER(xe) >= 13)
-		xe->info.tile_count++;
 
 	for (id = 0; id < xe->info.tile_count; ++id) {
 		gt = xe->gt + id;
-- 
2.40.1

