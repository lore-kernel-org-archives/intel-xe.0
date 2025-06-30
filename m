Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC094C8302D
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 17:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A667210E4A9;
	Mon, 30 Jun 2025 17:34:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DV/hhkyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461D810E4A8
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 17:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751304886; x=1782840886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFUGzeC1dQQVjPUBUdcJHblrG3V0EWcEXHSOlVLF7Cg=;
 b=DV/hhkyLDcuJgg4WsNyZFkSRxAsdqncFeHWJvj6APyo1Q0Du0cEeasCs
 MlAbw3zmxat1sGv98pHFgAH4KN4SlZEMWjCEVoU5cczxiWE7E84Cj1caD
 82YgwoOGIscZCbET6VR3dooLfotZMj07pFIXcMtDG37uMnDd2SmpL+I4e
 I9Hn/Kum9bD9QkL5urU4Q8IRLj0FmNVC4CRF8qVfWPxfVGy5DyC8yoO0d
 8OrsxsLl2YFCLN43TcUtJ9A+tOT8ebwW0HrcKjMDc0qytvAUZZ+3EL6z6
 krk+l6Cvs873AsS0dP4bowwrD3LIgNSdXZirMAinFp6PW4ehMvBGSa+4y w==;
X-CSE-ConnectionGUID: 7Lq+j9CAQciCBvZzsnxg3w==
X-CSE-MsgGUID: xdk8Bnj8S7eAj6tyKK/Q1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="57223396"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="57223396"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:46 -0700
X-CSE-ConnectionGUID: stGgdqdtSRelvpPuRKaXzg==
X-CSE-MsgGUID: 1KL9DeJMTW2azAlNcKevZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="184543706"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 10:34:44 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 2/6] drm/xe: Track maximum GTs per tile on a per-platform
 basis
Date: Mon, 30 Jun 2025 10:34:41 -0700
Message-ID: <20250630173438.2342706-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630173438.2342706-8-matthew.d.roper@intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
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
 drivers/gpu/drm/xe/xe_pmu.c          |  4 ++-
 drivers/gpu/drm/xe/xe_query.c        |  2 +-
 5 files changed, 43 insertions(+), 24 deletions(-)

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
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 69df0e3520a5..94a8e1db71e4 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -160,7 +160,9 @@ static bool event_gt_forcewake(struct perf_event *event)
 static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
 			    unsigned int id)
 {
-	if (gt >= XE_MAX_GT_PER_TILE)
+	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
+
+	if (gt >= xe->info.max_gt_per_tile)
 		return false;
 
 	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
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

