Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF29CD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 14:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6D110F4FB;
	Fri,  8 May 2026 14:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kme4nHpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF1910F4FF;
 Fri,  8 May 2026 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778250889; x=1809786889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EQd/ruA5jaCTTHvWsDTZ2g3WIz1Igd3o6QcImbzgkGE=;
 b=Kme4nHplzEr7cNI+9hotN9DvNPk6Fz2/jTZWPggWXyV5rZbPwswJI5ZE
 un0qxMBtqItX0D7xnF5QOs3CqIZ3G6XngPg60oBy1PzdVx8DThidffiDF
 5ZSBy+8eVWx387jQ9VwqlEF/UfxJ3hqXJy5CJDlEG4jc6W4La0VOGW5xh
 240RwNOMjlX5hO54NdfzYDRX0pajD3NFADcBIqKmmxxzEg2o8iRiJtDkf
 jI3z9gI+sKe1F9nEylxJqWcNOzMn43fWwe3KOtqS7EWujYM4FW/oxXGSI
 ieQ1D1PFyZ5/DM2kW4dhOv9cGoWBr5wIapHWspVecZttpPjpxB00HrcWL A==;
X-CSE-ConnectionGUID: TJcI8ujxTvSShHV5lr4oIg==
X-CSE-MsgGUID: YBrPz9O+Tuy2IOOKmW9xXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89808861"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="89808861"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:34:49 -0700
X-CSE-ConnectionGUID: JYfb8t5KT6W+262DZf2euA==
X-CSE-MsgGUID: RwAjklZeRxuUOoJg+ZLkBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="237024111"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.104])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 07:34:47 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 04/16] drm/i915: Reorganize intel_plane_pin_fb() a bit
Date: Fri,  8 May 2026 17:34:14 +0300
Message-ID: <20260508143426.26504-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
References: <20260508143426.26504-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Move most of the plane state stuff out from the inner parts
of intel_plane_pin_fb(). The plan is to take those inner parts and
abstract them into the new fb_pin parent interface, and we don't
want any plane_state stuff there.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_fb_pin.c | 67 +++++++++++++++---------------
 1 file changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i915_fb_pin.c
index 400ad8768c11..bc2e185b4573 100644
--- a/drivers/gpu/drm/i915/i915_fb_pin.c
+++ b/drivers/gpu/drm/i915/i915_fb_pin.c
@@ -264,7 +264,10 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	const struct intel_framebuffer *fb =
 		to_intel_framebuffer(plane_state->hw.fb);
-	struct i915_vma *vma;
+	struct i915_vma *ggtt_vma = NULL;
+	struct i915_vma *dpt_vma = NULL;
+	int fence_id = -1;
+	u32 offset;
 
 	if (!intel_fb_uses_dpt(&fb->base)) {
 		struct intel_fb_pin_params pin_params = {
@@ -277,15 +280,25 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 			.needs_physical = intel_plane_needs_physical(plane),
 			.needs_fence = intel_plane_needs_fence(display),
 		};
-		int fence_id = -1;
 
-		vma = intel_fb_pin_to_ggtt(intel_fb_bo(&fb->base), &pin_params,
-					   intel_plane_uses_fence(plane_state) ? &fence_id : NULL);
-		if (IS_ERR(vma))
-			return PTR_ERR(vma);
+		ggtt_vma = intel_fb_pin_to_ggtt(intel_fb_bo(&fb->base), &pin_params,
+						intel_plane_uses_fence(plane_state) ? &fence_id : NULL);
+		if (IS_ERR(ggtt_vma))
+			return PTR_ERR(ggtt_vma);
+
+		/*
+		 * Pre-populate the dma address before we enter the vblank
+		 * evade critical section as i915_gem_object_get_dma_address()
+		 * will trigger might_sleep() even if it won't actually sleep,
+		 * which is the case when the fb has already been pinned.
+		 */
+		if (intel_plane_needs_physical(plane)) {
+			struct drm_i915_gem_object *obj = to_intel_bo(intel_fb_bo(&fb->base));
 
-		plane_state->ggtt_vma = vma;
-		plane_state->fence_id = fence_id;
+			offset = i915_gem_object_get_dma_address(obj, 0);
+		} else {
+			offset = i915_ggtt_offset(ggtt_vma);
+		}
 	} else {
 		struct intel_fb_pin_params pin_params = {
 			.view = &plane_state->view.gtt,
@@ -293,39 +306,25 @@ int intel_plane_pin_fb(struct intel_plane_state *plane_state,
 			.needs_cpu_lmem_access = intel_fb_needs_cpu_access(&fb->base),
 		};
 
-		vma = i915_dpt_pin_to_ggtt(fb->dpt, pin_params.alignment / 512);
-		if (IS_ERR(vma))
-			return PTR_ERR(vma);
-
-		plane_state->ggtt_vma = vma;
+		ggtt_vma = i915_dpt_pin_to_ggtt(fb->dpt, pin_params.alignment / 512);
+		if (IS_ERR(ggtt_vma))
+			return PTR_ERR(ggtt_vma);
 
-		vma = intel_fb_pin_to_dpt(intel_fb_bo(&fb->base), fb->dpt, &pin_params);
-		if (IS_ERR(vma)) {
+		dpt_vma = intel_fb_pin_to_dpt(intel_fb_bo(&fb->base), fb->dpt, &pin_params);
+		if (IS_ERR(dpt_vma)) {
 			i915_dpt_unpin_from_ggtt(fb->dpt);
-			plane_state->ggtt_vma = NULL;
-			return PTR_ERR(vma);
+			return PTR_ERR(dpt_vma);
 		}
 
-		plane_state->dpt_vma = vma;
+		WARN_ON(ggtt_vma == dpt_vma);
 
-		WARN_ON(plane_state->ggtt_vma == plane_state->dpt_vma);
+		offset = i915_ggtt_offset(ggtt_vma);
 	}
 
-	/*
-	 * Pre-populate the dma address before we enter the vblank
-	 * evade critical section as i915_gem_object_get_dma_address()
-	 * will trigger might_sleep() even if it won't actually sleep,
-	 * which is the case when the fb has already been pinned.
-	 */
-	if (intel_plane_needs_physical(plane)) {
-		struct drm_i915_gem_object *obj = to_intel_bo(intel_fb_bo(&fb->base));
-
-		plane_state->surf = i915_gem_object_get_dma_address(obj, 0) +
-			plane->surf_offset(plane_state);
-	} else {
-		plane_state->surf = i915_ggtt_offset(plane_state->ggtt_vma) +
-			plane->surf_offset(plane_state);
-	}
+	plane_state->dpt_vma = dpt_vma;
+	plane_state->ggtt_vma = ggtt_vma;
+	plane_state->fence_id = fence_id;
+	plane_state->surf = offset + plane->surf_offset(plane_state);
 
 	return 0;
 }
-- 
2.52.0

