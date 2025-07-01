Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E26C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E6910E616;
	Tue,  1 Jul 2025 20:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KSLN6dK4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46EF10E135
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751400812; x=1782936812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wgCrz+F1RkjblpjHskqASvgxXARm24h3OUsTryV/Hc0=;
 b=KSLN6dK4Fb0wgHUwOypLzQSsBYzKVxInoCxVbVSDcEGDVxlATXGHQrSF
 etfxw0T6wOwyjaNi11GzP/2ezV7VpD/lcKXHZY3FE9B7l2/Tu5FTEZlq4
 Rnht8MWRyzoZl032woPe4XS+yIBMfp/obykwm/6negCtsKroicRBcKlmC
 raOo20dy2tIJvu6kq0lFIQVsSaZ25+3AbOxLNbJx1U64ijzMfqj/pKnvt
 nDvj6/zyZsFHG62WgDn66TEhrePHQN7g4n0qaqLLhhOowdYwvhk1yHuLJ
 tfp4bNscSFm7JmCSKMeSskzl3SNbVQK8L/q3x/iqXXuWLcVmUDZB1SloY g==;
X-CSE-ConnectionGUID: TcY33S2MTbq9W1Pl3ZtxGw==
X-CSE-MsgGUID: +4HuQwArRmGvEjHXVkc9Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53545994"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53545994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:32 -0700
X-CSE-ConnectionGUID: w0BXjrgRS/WtJlDzms2fpQ==
X-CSE-MsgGUID: LD8BYlEFTWOFMrcta5tf7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177539673"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:13:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 3/7] drm/xe: Track maximum GTs per tile on a per-platform
 basis
Date: Tue,  1 Jul 2025 13:13:24 -0700
Message-ID: <20250701201320.2514369-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701201320.2514369-9-matthew.d.roper@intel.com>
References: <20250701201320.2514369-9-matthew.d.roper@intel.com>
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

Today all of our platforms fall into one of three cases:
 * Single tile platforms with a single (primary) GT
 * Single tile platforms with two GTs (primary + media)
 * Two-tile platforms with a single GT (primary) in each

Our numbering of GTs has been a bit inconsistent between platforms
(e.g., GT1 is the media GT on some platforms, but the second tile's
primary GT on others).  In the future we'll likely have platforms that
are both multi-tile and multi-GT, which will make the situation more
confusing.  We could also wind up with more than just two types of GTs
at some point in the future.

Going forward we should standardize the way we assign uapi GT IDs to
internal GT structures.  Let's declare that for userspace GT ID n,

  GT[n]'s tile             = n / (max gt per tile)
  GT[n]'s slot within tile = n % (max gt per tile)

We don't want the GT numbering to change for any of our current
platforms since the current IDs are part of our ABI contract with
userspace so this means we should track the 'max gt per tile' value on a
per-platform basis rather than just using a single value across the
driver.  Encode this into device descriptors in xe_pci.c and use the
per-platform number for various checks in the code.  Constant
XE_MAX_GT_PER_TILE will remain just as the maximum across all platforms
for easy of sizing array allocations.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h       | 41 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 18 ++++++++++++
 drivers/gpu/drm/xe/xe_query.c        |  2 +-
 4 files changed, 40 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e4da797a984b..4e719d398c88 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -60,35 +60,32 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
 	return &xe->tiles[0];
 }
 
+/*
+ * Highest GT/tile count for any platform.  Used only for memory allocation
+ * sizing.  Any logic looping over GTs or mapping userspace GT IDs into GT
+ * structures should use the per-platform xe->info.max_gt_per_tile instead.
+ */
 #define XE_MAX_GT_PER_TILE 2
 
-static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
-{
-	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id >= XE_MAX_GT_PER_TILE))
-		gt_id = 0;
-
-	return gt_id ? tile->media_gt : tile->primary_gt;
-}
-
 static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 {
-	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 
-	/*
-	 * FIXME: This only works for now because multi-tile and standalone
-	 * media are mutually exclusive on the platforms we have today.
-	 *
-	 * id => GT mapping may change once we settle on how we want to handle
-	 * our UAPI.
-	 */
-	if (MEDIA_VER(xe) >= 13) {
-		gt = xe_tile_get_gt(root_tile, gt_id);
-	} else {
-		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
-			gt_id = 0;
+	if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile)
+		return NULL;
 
-		gt = xe->tiles[gt_id].primary_gt;
+	tile = &xe->tiles[gt_id / xe->info.max_gt_per_tile];
+	switch (gt_id % xe->info.max_gt_per_tile) {
+	default:
+		xe_assert(xe, false);
+		fallthrough;
+	case 0:
+		gt = tile->primary_gt;
+		break;
+	case 1:
+		gt = tile->media_gt;
+		break;
 	}
 
 	if (!gt)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 7e4f6d846af6..78c4acafd268 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -294,6 +294,8 @@ struct xe_device {
 		u8 vram_flags;
 		/** @info.tile_count: Number of tiles */
 		u8 tile_count;
+		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
+		u8 max_gt_per_tile;
 		/** @info.gt_count: Total number of GTs for entire device */
 		u8 gt_count;
 		/** @info.vm_max_level: Max VM level */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..316031854c26 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -57,6 +57,7 @@ struct xe_device_desc {
 
 	u8 dma_mask_size;
 	u8 max_remote_tiles:2;
+	u8 max_gt_per_tile:2;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -208,6 +209,7 @@ static const struct xe_device_desc tgl_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -218,6 +220,7 @@ static const struct xe_device_desc rkl_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -231,6 +234,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
@@ -248,6 +252,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
@@ -263,6 +268,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -278,6 +284,7 @@ static const struct xe_device_desc dg1_desc = {
 	.has_display = true,
 	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -301,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -312,6 +320,7 @@ static const struct xe_device_desc dg2_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -328,6 +337,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.has_display = false,
 	.has_gsc_nvm = 1,
 	.has_heci_gscfi = 1,
+	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
 	.has_mbx_power_limits = false,
@@ -340,6 +350,7 @@ static const struct xe_device_desc mtl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_pxp = true,
+	.max_gt_per_tile = 2,
 };
 
 static const struct xe_device_desc lnl_desc = {
@@ -347,6 +358,7 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_pxp = true,
+	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 };
 
@@ -359,6 +371,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_mbx_power_limits = true,
 	.has_gsc_nvm = 1,
 	.has_heci_cscfi = 1,
+	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 };
 
@@ -367,6 +380,7 @@ static const struct xe_device_desc ptl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_sriov = true,
+	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.needs_scratch = true,
 };
@@ -616,6 +630,10 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
 				 xe_modparam.probe_display &&
 				 desc->has_display;
+
+	xe_assert(xe, desc->max_gt_per_tile > 0);
+	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
+	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
 	xe->info.tile_count = 1 + desc->max_remote_tiles;
 
 	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..e615b0916217 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -141,7 +141,7 @@ query_engine_cycles(struct xe_device *xe,
 		return -EINVAL;
 
 	eci = &resp.eci;
-	if (eci->gt_id >= XE_MAX_GT_PER_TILE)
+	if (eci->gt_id >= xe->info.max_gt_per_tile)
 		return -EINVAL;
 
 	gt = xe_device_get_gt(xe, eci->gt_id);
-- 
2.49.0

