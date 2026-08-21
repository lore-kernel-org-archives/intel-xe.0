Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB83C5DF7D
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 04:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2286E10F210;
	Fri, 21 Aug 2026 04:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heW89z+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3910B10F20C;
 Fri, 21 Aug 2026 04:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787287867; x=1818823867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mUbKhRrPXFN5yBABlkOqNJttSBFTPKT41bN4c72D7zM=;
 b=heW89z+WfCrg2nDxT4Nd+GwRSzrnqC1s80tq3W1cCj4WgcMJ0PYakioP
 xSzg1lSw+Eew+7oQfS+n9TTZjw3aXzdthTzA4lG38d5fAA68USwJeIcF8
 SvGmV1Ojn3HW1EVEfnexaULEBIOQvEOjlpbPR68fbWn9qP/ajEIrL1a9u
 lUX23wzMp2I/iPtu+tmXg4OdT9sK3oMPZEssSkMI6l3SXn1DRyBlyrtAr
 Oy+l3WW+DFMBK0Oenq6j10T2be1SALqRQYDPWkwOukjoaQAap+pLytlN/
 QzeRutkl1Q7QdiyjK8s6+4lLNzTN1B61o8jaOSPdcLXRnOmMhehZMPckR Q==;
X-CSE-ConnectionGUID: FcvZ3BlzQjiZxg+6tSJJxQ==
X-CSE-MsgGUID: 2i3kiUEMRBO4uSSgfxURgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87893832"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87893832"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 21:51:07 -0700
X-CSE-ConnectionGUID: 8Fr4S/y/RKu7qHJjjo5nwQ==
X-CSE-MsgGUID: FaOLPXonTuS5xJrep6aA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="266291106"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa007.jf.intel.com with ESMTP; 20 Aug 2026 21:51:06 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 3/6] drm/i915/cursor: Handle secondary cursor state
Date: Fri, 21 Aug 2026 10:17:52 +0530
Message-Id: <20260821044755.2234490-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260821044755.2234490-1-nemesa.garg@intel.com>
References: <20260821044755.2234490-1-nemesa.garg@intel.com>
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

In joiner mode the fast path cursor update must handle
secondary pipes. Iterate over all joined pipes uniformly
to duplicate plane state, run check_plane(), pin the
framebuffer and on success swap in the new plane state
for each secondary cursor.

Track every successfully prepared pipe in a joined_pipe_state[] array
of struct intel_cursor_joiner_state so that later frontbuffer, unpin
and error-cleanup paths treat primary and secondaries uniformly,
and ensures the primary's pinned framebuffer is released if a
secondary fails partway through.

v2: Use intel_crtc_joined_pipe_mask(). [Ville]
    Add locking mechanism. [Ville]
v3: Drop the per-pipe fastpath mutex array. [sashiko]
v4: Fold parallel arrays into struct intel_cursor_joiner_state joined_pipe_state[].
    unify primary/secondary in a single loop.
    use bare check_plane(). [Chaitanya]
v5: Fix secondary uapi.crtc to each pipe's own crtc.
    Rename intel_cursor_pipe to intel_cursor_joiner_state and
    joined[] to joined_pipe_state[]. [Chaitanya]
v6: Mirror primary uapi into secondary hw state, don't set uapi.crtc. [sashiko]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 153 ++++++++++++++------
 1 file changed, 105 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index db4eaa74fc58..9cb8b0a8537c 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -842,6 +842,7 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
 
 static void
 intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
+					 const struct intel_plane_state *from_plane_state,
 					 struct drm_framebuffer *fb,
 					 struct intel_crtc *hw_crtc,
 					 int crtc_x, int crtc_y,
@@ -849,20 +850,34 @@ intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
 					 u32 src_x, u32 src_y,
 					 u32 src_w, u32 src_h)
 {
-	drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
-
-	plane_state->uapi.src_x = src_x;
-	plane_state->uapi.src_y = src_y;
-	plane_state->uapi.src_w = src_w;
-	plane_state->uapi.src_h = src_h;
-	plane_state->uapi.crtc_x = crtc_x;
-	plane_state->uapi.crtc_y = crtc_y;
-	plane_state->uapi.crtc_w = crtc_w;
-	plane_state->uapi.crtc_h = crtc_h;
-
-	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, plane_state, hw_crtc);
+	/*
+	 * Only the primary owns its uapi state; a secondary mirrors it, so
+	 * its uapi.crtc/fb stay NULL and hw.crtc comes from hw_crtc.
+	 */
+	if (plane_state == from_plane_state) {
+		drm_atomic_set_fb_for_plane(&plane_state->uapi, fb);
+
+		plane_state->uapi.src_x = src_x;
+		plane_state->uapi.src_y = src_y;
+		plane_state->uapi.src_w = src_w;
+		plane_state->uapi.src_h = src_h;
+		plane_state->uapi.crtc_x = crtc_x;
+		plane_state->uapi.crtc_y = crtc_y;
+		plane_state->uapi.crtc_w = crtc_w;
+		plane_state->uapi.crtc_h = crtc_h;
+	}
+
+	intel_plane_copy_uapi_to_hw_state(NULL, plane_state, from_plane_state, hw_crtc);
 }
 
+struct intel_cursor_joiner_state {
+	struct intel_plane *plane;
+	struct intel_crtc *crtc;
+	struct intel_crtc_state *crtc_state;
+	struct intel_plane_state *old_plane_state;
+	struct intel_plane_state *new_plane_state;
+};
+
 static int
 intel_legacy_cursor_update(struct drm_plane *_plane,
 			   struct drm_crtc *_crtc,
@@ -878,11 +893,13 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_display *display = to_intel_display(plane);
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(plane->base.state);
-	struct intel_plane_state *new_plane_state;
+	struct intel_plane_state *new_plane_state = NULL;
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
-	struct intel_crtc_state *new_crtc_state;
 	struct intel_vblank_evade_ctx evade;
+	struct intel_cursor_joiner_state joined_pipe_state[I915_MAX_PIPES] = {};
+	struct intel_crtc *pipe_crtc;
+	int num_pipes = 0;
 	int ret;
 
 	/*
@@ -928,38 +945,69 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
 		goto slow;
 
-	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
-	if (!new_plane_state)
-		return -ENOMEM;
-
-	new_crtc_state = to_intel_crtc_state(intel_crtc_duplicate_state(&crtc->base));
-	if (!new_crtc_state) {
-		ret = -ENOMEM;
-		goto out_free;
-	}
+	/*
+	 * Iterate over all joined pipes (primary and secondary) uniformly.
+	 * The joined pipe mask includes both the primary pipe and all
+	 * secondary joiner pipes, allowing us to handle them all the same way.
+	 */
+	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
+					 intel_crtc_joined_pipe_mask(crtc_state)) {
+		struct intel_cursor_joiner_state *j = &joined_pipe_state[num_pipes];
+
+		j->plane = intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
+		j->crtc = pipe_crtc;
+		j->crtc_state = to_intel_crtc_state(pipe_crtc->base.state);
+		j->old_plane_state = to_intel_plane_state(j->plane->base.state);
+		j->new_plane_state =
+			to_intel_plane_state(intel_plane_duplicate_state(&j->plane->base));
+
+		if (!j->new_plane_state) {
+			ret = -ENOMEM;
+			goto out_free;
+		}
 
-	intel_cursor_fastpath_update_plane_state(new_plane_state, fb,
-						 crtc,
-						 crtc_x, crtc_y, crtc_w, crtc_h,
-						 src_x, src_y, src_w, src_h);
+		intel_cursor_fastpath_update_plane_state(j->new_plane_state,
+							 joined_pipe_state[0].new_plane_state,
+							 fb, pipe_crtc,
+							 crtc_x, crtc_y,
+							 crtc_w, crtc_h,
+							 src_x, src_y,
+							 src_w, src_h);
+
+		ret = j->plane->check_plane(j->crtc_state, j->new_plane_state);
+		if (ret) {
+			intel_plane_destroy_state(&j->plane->base,
+						  &j->new_plane_state->uapi);
+			goto out_free;
+		}
 
-	ret = intel_plane_atomic_check_with_state(crtc_state, new_crtc_state,
-						  old_plane_state, new_plane_state);
-	if (ret)
-		goto out_free;
+		ret = intel_plane_pin_fb(j->new_plane_state, j->old_plane_state);
+		if (ret) {
+			intel_plane_destroy_state(&j->plane->base,
+						  &j->new_plane_state->uapi);
+			goto out_free;
+		}
 
-	ret = intel_plane_pin_fb(new_plane_state, old_plane_state);
-	if (ret)
-		goto out_free;
+		num_pipes++;
+	}
 
-	intel_frontbuffer_flush(to_intel_frontbuffer(new_plane_state->hw.fb),
+	new_plane_state = joined_pipe_state[0].new_plane_state;
+	intel_frontbuffer_flush(to_intel_frontbuffer(joined_pipe_state[0].new_plane_state->hw.fb),
 				ORIGIN_CURSOR_UPDATE);
-	intel_frontbuffer_track(to_intel_frontbuffer(old_plane_state->hw.fb),
-				to_intel_frontbuffer(new_plane_state->hw.fb),
-				plane->frontbuffer_bit);
 
-	/* Swap plane state */
-	plane->base.state = &new_plane_state->uapi;
+	for (int i = 0; i < num_pipes; i++)
+		intel_frontbuffer_track(to_intel_frontbuffer(joined_pipe_state[i].old_plane_state->hw.fb),
+					to_intel_frontbuffer(joined_pipe_state[i].new_plane_state->hw.fb),
+					joined_pipe_state[i].plane->frontbuffer_bit);
+
+	for (int i = 0; i < num_pipes; i++) {
+		joined_pipe_state[i].plane->base.state = &joined_pipe_state[i].new_plane_state->uapi;
+
+		if (joined_pipe_state[i].new_plane_state->uapi.visible)
+			joined_pipe_state[i].crtc_state->active_planes |= BIT(PLANE_CURSOR);
+		else
+			joined_pipe_state[i].crtc_state->active_planes &= ~BIT(PLANE_CURSOR);
+	}
 
 	/*
 	 * We cannot swap crtc_state as it may be in use by an atomic commit or
@@ -971,7 +1019,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * planes atomically. If the cursor was part of the atomic update then
 	 * we would have taken the slowpath.
 	 */
-	crtc_state->active_planes = new_crtc_state->active_planes;
 
 	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
 
@@ -1004,6 +1051,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	intel_psr_unlock(crtc_state);
 
+	/*
+	 * Schedule or immediately unpin old framebuffers.
+	 * Protect against concurrent access.
+	 */
 	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
 		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
 				     intel_cursor_unpin_work);
@@ -1012,18 +1063,24 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
 					 false);
 
-		old_plane_state = NULL;
+		joined_pipe_state[0].old_plane_state = NULL;
 	} else {
 		intel_plane_unpin_fb(old_plane_state);
 	}
 
 out_free:
-	if (new_crtc_state)
-		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
-	if (ret)
-		intel_plane_destroy_state(&plane->base, &new_plane_state->uapi);
-	else if (old_plane_state)
-		intel_plane_destroy_state(&plane->base, &old_plane_state->uapi);
+	if (ret) {
+		for (int i = 0; i < num_pipes; i++) {
+			intel_plane_unpin_fb(joined_pipe_state[i].new_plane_state);
+			intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
+						  &joined_pipe_state[i].new_plane_state->uapi);
+		}
+	} else {
+		for (int i = 0; i < num_pipes; i++)
+			if (joined_pipe_state[i].old_plane_state)
+				intel_plane_destroy_state(&joined_pipe_state[i].plane->base,
+							  &joined_pipe_state[i].old_plane_state->uapi);
+	}
 	return ret;
 
 slow:
-- 
2.25.1

