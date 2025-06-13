Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F1AC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 00:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A21410E058;
	Fri, 13 Jun 2025 00:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L54JVun8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A5710E058
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749773693; x=1781309693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WwodPP4/vQLwIkPj0jtPPTEd+QuDtIU3V3Z3GhQu2NY=;
 b=L54JVun8xTwxfZd/sE08f4+La3zHmUfO4jTPmVFG5iVS1rceFLR7qEWI
 KTeAlu56HF1EgsDCwQB143hNYK2yEwlPSQ0gvjpsBNs9oJpkzCy+0Juuh
 9k8vY6XOaWPj3lxfkqhUpl0KayZtqi7EuqR/Dh4FtqFO4gKhBh4JFR1uU
 /vcAr0O9ZkN4q25+CxXgdVjsEowyln18bZpx+gt4wiUU1kTwiMUikfm8p
 i0R828MrLvTrYnGvA5FN26qvBAk8D/DBGzH3gXyzXL15OAcodBwQBDIYh
 sAyTUniqQqG0PTO1gRMCwVlHCqDsXZemQuX7qEQ0EkO5lNXmJm0qTRwWG A==;
X-CSE-ConnectionGUID: blk2vzlDQQ6yI3aWMVf/EA==
X-CSE-MsgGUID: FsQ0EBzPQfakqO5e4KSClg==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51204673"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="51204673"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
X-CSE-ConnectionGUID: BLGg4jv9RGq3/h3EmqmCcw==
X-CSE-MsgGUID: SzbXZkeEQL+6b0C+iPtwtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="151491068"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 17:14:52 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com
Subject: [PATCH 2/5] drm/xe: Track maximum GTs per tile on a per-platform basis
Date: Thu, 12 Jun 2025 17:14:41 -0700
Message-ID: <20250613001438.678728-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613001438.678728-7-matthew.d.roper@intel.com>
References: <20250613001438.678728-7-matthew.d.roper@intel.com>
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

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h       | 41 +++++++++++++---------------
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_pci.c          | 18 ++++++++++++
 drivers/gpu/drm/xe/xe_pmu.c          |  4 ++-
 drivers/gpu/drm/xe/xe_query.c        |  2 +-
 5 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 0bc3bc8e6803..6e8d912df357 100644
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
index ac27389ccb8b..5fae3a66a992 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -293,6 +293,8 @@ struct xe_device {
 		u8 vram_flags;
 		/** @info.tile_count: Number of tiles */
 		u8 tile_count;
+		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
+		u8 max_gt_per_tile;
 		/** @info.gt_count: Total number of GTs for entire device */
 		u8 gt_count;
 		/** @info.vm_max_level: Max VM level */
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 5d24cc320d72..3b997c941bbc 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -57,6 +57,7 @@ struct xe_device_desc {
 
 	u8 dma_mask_size;
 	u8 max_remote_tiles:2;
+	u8 max_gt_per_tile:2;
 
 	u8 require_force_probe:1;
 	u8 is_dgfx:1;
@@ -205,6 +206,7 @@ static const struct xe_device_desc tgl_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -215,6 +217,7 @@ static const struct xe_device_desc rkl_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_llc = true,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -228,6 +231,7 @@ static const struct xe_device_desc adl_s_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
@@ -245,6 +249,7 @@ static const struct xe_device_desc adl_p_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 	.subplatforms = (const struct xe_subplatform_desc[]) {
 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
@@ -260,6 +265,7 @@ static const struct xe_device_desc adl_n_desc = {
 	.has_display = true,
 	.has_llc = true,
 	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -274,6 +280,7 @@ static const struct xe_device_desc dg1_desc = {
 	.dma_mask_size = 39,
 	.has_display = true,
 	.has_heci_gscfi = 1,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 };
 
@@ -296,6 +303,7 @@ static const struct xe_device_desc ats_m_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -307,6 +315,7 @@ static const struct xe_device_desc dg2_desc = {
 	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
 	.pre_gmdid_media_ip = &media_ip_xehpm,
 	.dma_mask_size = 46,
+	.max_gt_per_tile = 1,
 	.require_force_probe = true,
 
 	DG2_FEATURES,
@@ -322,6 +331,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_heci_gscfi = 1,
+	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
 	.has_mbx_power_limits = false,
@@ -334,6 +344,7 @@ static const struct xe_device_desc mtl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_pxp = true,
+	.max_gt_per_tile = 2,
 };
 
 static const struct xe_device_desc lnl_desc = {
@@ -341,6 +352,7 @@ static const struct xe_device_desc lnl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_pxp = true,
+	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 };
 
@@ -352,6 +364,7 @@ static const struct xe_device_desc bmg_desc = {
 	.has_fan_control = true,
 	.has_mbx_power_limits = true,
 	.has_heci_cscfi = 1,
+	.max_gt_per_tile = 2,
 	.needs_scratch = true,
 };
 
@@ -360,6 +373,7 @@ static const struct xe_device_desc ptl_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_sriov = true,
+	.max_gt_per_tile = 2,
 	.require_force_probe = true,
 	.needs_scratch = true,
 };
@@ -608,6 +622,10 @@ static int xe_info_init_early(struct xe_device *xe,
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
index 2dbf4066d86f..6220a5a36b83 100644
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

