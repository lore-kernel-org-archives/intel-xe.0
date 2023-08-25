Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0DBC7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 25 Aug 2023 11:53:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A250810E660;
	Fri, 25 Aug 2023 11:53:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CF310E662
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Aug 2023 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692964392; x=1724500392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBbP2cF9wICN2yY4StPYCWTBlv0frbFYohKpIY4fhuQ=;
 b=XNG0XbEZ9w+KoelrJFWaZN5pdsDs+O2lXAQNXYXeUwucHH6mZm57FW/0
 sFLoq0EjovEiyV58t5pqg5kyzevorcf4Do+uaMYNkcbz3EIMK51u714nh
 TqtzP5aGTIyhjL5jY5MSrCyxomv2LL1WzQamcJTtpENvCA+r3w+vKZRf2
 EpUSi+ONm+vyzlxucQ0IQG0H3AmTgb6/tvu/6GxYntbf69Y/bGQBEIf9x
 XcMHE9lutLEnjW4xaAxj9jrOpnb6K1ftvd7SpHq58r2/vpRdyVk+2QaAR
 mTWnQzof3gc9bJ23NbxG1+SnI078T6rrWLhQL38tPN3dv3ZHfNNIuO8WO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405696122"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="405696122"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:53:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827569043"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="827569043"
Received: from janlundk-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.56.87])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2023 04:53:11 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 14:52:52 +0300
Message-Id: <20230825115255.1319907-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825115255.1319907-1-jouni.hogander@intel.com>
References: <20230825115255.1319907-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] fixup! drm/i915/display: Remaining changes
 to make xe compile
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

As a part of clean-up we want to revert changes touching FBC code
from this patch and introduce required changes as a set of patches.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 62 +++++-------------------
 1 file changed, 12 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index b0e676069677..7f70166f7035 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -56,32 +56,6 @@
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
 
-#ifdef I915
-
-#define i915_gem_stolen_initialized(i915) (drm_mm_initialized(&(i915)->mm.stolen))
-
-#else
-
-/* No stolen memory support in xe yet */
-static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, void *ptr, u32 size, u32 align, u32 start, u32 end)
-{
-	return -ENODEV;
-}
-
-static int i915_gem_stolen_insert_node(struct xe_device *xe, void *ptr, u32 size, u32 align)
-{
-	XE_WARN_ON(1);
-	return -ENODEV;
-}
-
-static void i915_gem_stolen_remove_node(struct xe_device *xe, void *ptr)
-{
-}
-
-#define i915_gem_stolen_initialized(xe) ((xe) && 0)
-
-#endif
-
 #define for_each_fbc_id(__dev_priv, __fbc_id) \
 	for ((__fbc_id) = INTEL_FBC_A; (__fbc_id) < I915_MAX_FBCS; (__fbc_id)++) \
 		for_each_if(DISPLAY_RUNTIME_INFO(__dev_priv)->fbc_mask & BIT(__fbc_id))
@@ -357,7 +331,6 @@ static void i8xx_fbc_nuke(struct intel_fbc *fbc)
 
 static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = fbc->i915;
 
 	GEM_BUG_ON(range_overflows_end_t(u64, i915_gem_stolen_area_address(i915),
@@ -370,7 +343,6 @@ static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 		       i915_gem_stolen_node_address(i915, &fbc->compressed_fb));
 	intel_de_write(i915, FBC_LL_BASE,
 		       i915_gem_stolen_node_address(i915, &fbc->compressed_llb));
-#endif
 }
 
 static const struct intel_fbc_funcs i8xx_fbc_funcs = {
@@ -478,7 +450,8 @@ static void g4x_fbc_program_cfb(struct intel_fbc *fbc)
 	struct drm_i915_private *i915 = fbc->i915;
 
 	intel_de_write(i915, DPFC_CB_BASE,
-		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
+		       i915_gem_stolen_node_offset(&fbc->compressed_fb));
+
 }
 
 static const struct intel_fbc_funcs g4x_fbc_funcs = {
@@ -530,7 +503,7 @@ static void ilk_fbc_program_cfb(struct intel_fbc *fbc)
 	struct drm_i915_private *i915 = fbc->i915;
 
 	intel_de_write(i915, ILK_DPFC_CB_BASE(fbc->id),
-		       i915_gem_stolen_compressed_offset(fbc->compressed_fb));
+		       i915_gem_stolen_node_offset(&fbc->compressed_fb));
 }
 
 static const struct intel_fbc_funcs ilk_fbc_funcs = {
@@ -637,10 +610,8 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-#ifdef I915
 	if (intel_gt_support_legacy_fencing(to_gt(i915)))
 		snb_fbc_program_fence(fbc);
-#endif
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | ivb_dpfc_ctl(fbc));
@@ -745,14 +716,10 @@ static u64 intel_fbc_stolen_end(struct drm_i915_private *i915)
 	 * reserved range size, so it always assumes the maximum (8mb) is used.
 	 * If we enable FBC using a CFB on that memory range we'll get FIFO
 	 * underruns, even if that range is not reserved by the BIOS. */
-#ifdef I915
 	if (IS_BROADWELL(i915) ||
 	    (DISPLAY_VER(i915) == 9 && !IS_BROXTON(i915)))
 		end = i915_gem_stolen_area_size(i915) - 8 * 1024 * 1024;
 	else
-#else
-	/* TODO */
-#endif
 		end = U64_MAX;
 
 	return min(end, intel_fbc_cfb_base_max(i915));
@@ -808,9 +775,9 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	int ret;
 
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_allocated(fbc->compressed_fb));
+		    i915_gem_stolen_node_allocated(&fbc->compressed_fb));
 	drm_WARN_ON(&i915->drm,
-		    i915_gem_stolen_allocated(fbc->compressed_llb));
+		    i915_gem_stolen_node_allocated(&fbc->compressed_llb));
 
 	if (DISPLAY_VER(i915) < 5 && !IS_G4X(i915)) {
 		ret = i915_gem_stolen_insert_node(i915, &fbc->compressed_llb,
@@ -830,12 +797,12 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 
 	drm_dbg_kms(&i915->drm,
 		    "reserved %llu bytes of contiguous stolen space for FBC, limit: %d\n",
-		    i915_gem_stolen_compressed_size(fbc->compressed_fb), fbc->limit);
+		    i915_gem_stolen_node_size(&fbc->compressed_fb), fbc->limit);
 
 	return 0;
 
 err_llb:
-	if (i915_gem_stolen_allocated(fbc->compressed_llb))
+	if (i915_gem_stolen_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
 err:
 	if (i915_gem_stolen_initialized(i915))
@@ -863,9 +830,9 @@ static void __intel_fbc_cleanup_cfb(struct intel_fbc *fbc)
 	if (WARN_ON(intel_fbc_hw_is_active(fbc)))
 		return;
 
-	if (i915_gem_stolen_allocated(fbc->compressed_llb))
+	if (i915_gem_stolen_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
-	if (i915_gem_stolen_allocated(fbc->compressed_fb))
+	if (i915_gem_stolen_node_allocated(&fbc->compressed_fb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_fb);
 }
 
@@ -1009,7 +976,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
 {
-	__maybe_unused struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state =
@@ -1024,7 +991,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 	/* FBC1 compression interval: arbitrary choice of 1 second */
 	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
-#ifdef I915
+
 	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
 
 	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
@@ -1033,7 +1000,6 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 	if (plane_state->flags & PLANE_HAS_FENCE)
 		fbc_state->fence_id =  i915_vma_fence_id(plane_state->ggtt_vma);
 	else
-#endif
 		fbc_state->fence_id = -1;
 
 	fbc_state->cfb_stride = intel_fbc_cfb_stride(plane_state);
@@ -1043,7 +1009,6 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 
 	/*
@@ -1061,9 +1026,6 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	return DISPLAY_VER(i915) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
 		 i915_vma_fence_id(plane_state->ggtt_vma) != -1);
-#else
-	return true;
-#endif
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
@@ -1073,7 +1035,7 @@ static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
 
 	return intel_fbc_min_limit(plane_state) <= fbc->limit &&
 		intel_fbc_cfb_size(plane_state) <= fbc->limit *
-			i915_gem_stolen_compressed_size(fbc->compressed_fb);
+			i915_gem_stolen_node_size(&fbc->compressed_fb);
 }
 
 static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
-- 
2.34.1

