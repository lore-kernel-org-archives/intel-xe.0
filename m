Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED963C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jun 2023 10:43:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C587C10E65B;
	Fri,  2 Jun 2023 10:43:05 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2391910E65B
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jun 2023 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685702583; x=1717238583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EvOTWwV0HtxHw5WhPww25jPzjjSE2VXjLhFEl9dC0ls=;
 b=WFGKTnf5bOzVVAauw0lYAU2Q8jJk17mPL4ZhWnmVvhi0rHZ425E8N8uI
 Mdw1RIW+127cOrxkUz35B3tOb2hV9YuoEyG3gKMC24GWWmWc1YsMUJI5i
 lwfg32+x7s1LKppYjUHFC5KEiNwhUPnt/AFVBMv3G4SulzZnckhDX1qpg
 ORMUy57aXAs5CBIzDaLuxRQ+XuPPOjqUswbSw5/LKQ3BkNmxGrulzQHZI
 1pAj9fvGSz4Q4PXIPigFgN6EO/H+wQ38VQvc0554EIpf4QYS61bffr4ii
 13WZKSf0GC14mXHdtx5RyHr8LbhwcpOq3Rl6BZGaVWLv1sd7njz0nAkdQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442215548"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="442215548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="658237905"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; d="scan'208";a="658237905"
Received: from amelillo-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.209.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 03:43:01 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  2 Jun 2023 13:42:31 +0300
Message-Id: <20230602104237.1014684-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602104237.1014684-1-jouni.hogander@intel.com>
References: <20230602104237.1014684-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 04/10] fixup! drm/i915/display: Remaining
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
 drivers/gpu/drm/i915/display/intel_fbc.c | 47 ++----------------------
 1 file changed, 4 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 2b00b7373c08..11bb8cf9c9d0 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -54,32 +54,6 @@
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
 		for_each_if(RUNTIME_INFO(__dev_priv)->fbc_mask & BIT(__fbc_id))
@@ -356,7 +330,6 @@ static void i8xx_fbc_nuke(struct intel_fbc *fbc)
 
 static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = fbc->i915;
 
 	GEM_BUG_ON(range_overflows_end_t(u64, i915->dsm.stolen.start,
@@ -368,7 +341,6 @@ static void i8xx_fbc_program_cfb(struct intel_fbc *fbc)
 		       i915->dsm.stolen.start + fbc->compressed_fb.start);
 	intel_de_write(i915, FBC_LL_BASE,
 		       i915->dsm.stolen.start + fbc->compressed_llb.start);
-#endif
 }
 
 static const struct intel_fbc_funcs i8xx_fbc_funcs = {
@@ -633,10 +605,8 @@ static void ivb_fbc_activate(struct intel_fbc *fbc)
 	else if (DISPLAY_VER(i915) == 9)
 		skl_fbc_program_cfb_stride(fbc);
 
-#ifdef I915
 	if (to_gt(i915)->ggtt->num_fences)
 		snb_fbc_program_fence(fbc);
-#endif
 
 	intel_de_write(i915, ILK_DPFC_CONTROL(fbc->id),
 		       DPFC_CTL_EN | ivb_dpfc_ctl(fbc));
@@ -741,14 +711,10 @@ static u64 intel_fbc_stolen_end(struct drm_i915_private *i915)
 	 * reserved range size, so it always assumes the maximum (8mb) is used.
 	 * If we enable FBC using a CFB on that memory range we'll get FIFO
 	 * underruns, even if that range is not reserved by the BIOS. */
-#ifdef I915
 	if (IS_BROADWELL(i915) ||
 	    (DISPLAY_VER(i915) == 9 && !IS_BROXTON(i915)))
 		end = resource_size(&i915->dsm.stolen) - 8 * 1024 * 1024;
 	else
-#else
-	/* TODO */
-#endif
 		end = U64_MAX;
 
 	return min(end, intel_fbc_cfb_base_max(i915));
@@ -834,7 +800,7 @@ static int intel_fbc_alloc_cfb(struct intel_fbc *fbc,
 	if (drm_mm_node_allocated(&fbc->compressed_llb))
 		i915_gem_stolen_remove_node(i915, &fbc->compressed_llb);
 err:
-	if (i915_gem_stolen_initialized(i915))
+	if (drm_mm_initialized(&i915->mm.stolen))
 		drm_info_once(&i915->drm, "not enough stolen space for compressed buffer (need %d more bytes), disabling. Hint: you may be able to increase stolen memory size in the BIOS to avoid this.\n", size);
 	return -ENOSPC;
 }
@@ -1005,7 +971,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 				   struct intel_crtc *crtc,
 				   struct intel_plane *plane)
 {
-	__maybe_unused struct drm_i915_private *i915 = to_i915(state->base.dev);
+	struct drm_i915_private *i915 = to_i915(state->base.dev);
 	const struct intel_crtc_state *crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 	const struct intel_plane_state *plane_state =
@@ -1020,7 +986,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 	/* FBC1 compression interval: arbitrary choice of 1 second */
 	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
-#ifdef I915
+
 	fbc_state->fence_y_offset = intel_plane_fence_y_offset(plane_state);
 
 	drm_WARN_ON(&i915->drm, plane_state->flags & PLANE_HAS_FENCE &&
@@ -1030,7 +996,6 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 	    plane_state->ggtt_vma->fence)
 		fbc_state->fence_id = plane_state->ggtt_vma->fence->id;
 	else
-#endif
 		fbc_state->fence_id = -1;
 
 	fbc_state->cfb_stride = intel_fbc_cfb_stride(plane_state);
@@ -1040,7 +1005,6 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 
 static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 {
-#ifdef I915
 	struct drm_i915_private *i915 = to_i915(plane_state->uapi.plane->dev);
 
 	/*
@@ -1058,9 +1022,6 @@ static bool intel_fbc_is_fence_ok(const struct intel_plane_state *plane_state)
 	return DISPLAY_VER(i915) >= 9 ||
 		(plane_state->flags & PLANE_HAS_FENCE &&
 		 plane_state->ggtt_vma->fence);
-#else
-	return true;
-#endif
 }
 
 static bool intel_fbc_is_cfb_ok(const struct intel_plane_state *plane_state)
@@ -1746,7 +1707,7 @@ void intel_fbc_init(struct drm_i915_private *i915)
 {
 	enum intel_fbc_id fbc_id;
 
-	if (!i915_gem_stolen_initialized(i915))
+	if (!drm_mm_initialized(&i915->mm.stolen))
 		RUNTIME_INFO(i915)->fbc_mask = 0;
 
 	if (need_fbc_vtd_wa(i915))
-- 
2.34.1

