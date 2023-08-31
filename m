Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C95C83F01
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 09:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151A710E5E6;
	Thu, 31 Aug 2023 09:52:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6815E10E5E4
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693475531; x=1725011531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QBbP2cF9wICN2yY4StPYCWTBlv0frbFYohKpIY4fhuQ=;
 b=aOtvVd0tdT6KbqnybfBK6Jok9gd4nBjcfsJJjkzddl72WMyvnGRuYRN+
 7tntVw4yQO1YTKTHrAwaap9dpZCbK3nE4kWodsSrnfk2H8GFqXDFjsMd1
 8vnf/MZCsofsrCK7Mx1wgjJfHiwKgd4h/GA2CY92NgTSA4i9+pnZumO5z
 rZJ655JrnpdP55Fy9WSsOWISD3i2LseRHNll8Jt0mWObPG7MzZN62SA0t
 MJBrAh415klUX2fmtqszZGrk9jMyedo7zF2lA7YtkhXIkzj51tWn8bAqo
 /ihuJpwUqncqIYlUBB6rK3Ps7jcDuglKC0c0RlthNt2gP7h1TZe8RDbqp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373284399"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="373284399"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739440779"
X-IronPort-AV: E=Sophos;i="6.02,216,1688454000"; d="scan'208";a="739440779"
Received: from zlevit-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.252.47.221])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 02:52:09 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 31 Aug 2023 12:51:51 +0300
Message-Id: <20230831095154.3121578-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831095154.3121578-1-jouni.hogander@intel.com>
References: <20230831095154.3121578-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/5] fixup! drm/i915/display: Remaining
 changes to make xe compile
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

