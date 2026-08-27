Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51385C61DC6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 16:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E245910EFE6;
	Thu, 27 Aug 2026 16:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oa7hVMvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A92C10EFE6;
 Thu, 27 Aug 2026 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787849088; x=1819385088;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0EG3cOHTRtQPDMoJ1F3ucRDYKwUdBLX3LpdoqokBYFY=;
 b=Oa7hVMvykJ8TTXbTYLZSH7+I90V0M8UdJ2bLuurN6X6vvuAeoAu+B6OK
 BWP86wK4Lvw6E2iHnFIzB0OfhSI1tR3z1taZnToZ4v0Z1EOBWwXbK1Ecn
 U0BXbLoHQhmPWABD4EMN2Z8tZroCJJb4OgKzr7e5AgsqJ/M5cuoVwFt8M
 kENlIOY2t0fVyLUgVv0JJk+u1dETzRO/2wOnQNxXMU9pvaSN5AL0wR/lh
 6BLpnLKFrbiSU5HQSNfoO4wmKNw2mlE8L0+/WSpbJuJvL49cyeQa2kza7
 IuwFA05yGV+qCDNzFCX+MwwQKX8MTCN6iK88GGEBEV1FA+nD60s4gH6CF w==;
X-CSE-ConnectionGUID: NVO6cNm3QdKNA0vL5mpZlg==
X-CSE-MsgGUID: dUK1aZ2JQ9SIxIVoRPwtzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88276133"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88276133"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2026 09:44:48 -0700
X-CSE-ConnectionGUID: 6FPzmcgzQOKXFMqMPE6jBw==
X-CSE-MsgGUID: dHSTjINwQgmulxbVhPW0MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="306134063"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa001.jf.intel.com with ESMTP; 27 Aug 2026 09:44:46 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com,
	Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH v7 3/5] drm/i915/cursor: Handle secondary cursor state
Date: Thu, 27 Aug 2026 22:12:01 +0530
Message-Id: <20260827164203.2371794-4-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827164203.2371794-1-nemesa.garg@intel.com>
References: <20260827164203.2371794-1-nemesa.garg@intel.com>
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

Convert the primary-only vblank unpin block into a loop over the
joined_pipe_state[] array so each pipe's old cursor framebuffer is scheduled for
unpin (or unpinned inline when unchanged) independently. All unpin
work is armed on the primary crtc's vblank (&crtc->base), consistent
with the single primary vblank evasion used above.

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
v7: Squash patch 5 with this patch. [Chaitanya]

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cursor.c | 181 +++++++++++++-------
 1 file changed, 120 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index b57b446b9788..e4a7d4d2915a 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -847,6 +847,7 @@ intel_cursor_joiner_commits_idle(struct intel_display *display,
 
 static void
 intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
+					 const struct intel_plane_state *from_plane_state,
 					 struct drm_framebuffer *fb,
 					 struct intel_crtc *hw_crtc,
 					 int crtc_x, int crtc_y,
@@ -854,20 +855,34 @@ intel_cursor_fastpath_update_plane_state(struct intel_plane_state *plane_state,
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
@@ -883,11 +898,12 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	struct intel_display *display = to_intel_display(plane);
 	struct intel_plane_state *old_plane_state =
 		to_intel_plane_state(plane->base.state);
-	struct intel_plane_state *new_plane_state;
 	struct intel_crtc_state *crtc_state =
 		to_intel_crtc_state(crtc->base.state);
-	struct intel_crtc_state *new_crtc_state;
 	struct intel_vblank_evade_ctx evade;
+	struct intel_cursor_joiner_state joined_pipe_state[I915_MAX_PIPES] = {};
+	struct intel_crtc *pipe_crtc;
+	int num_pipes = 0;
 	int ret;
 
 	/*
@@ -933,38 +949,68 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
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
@@ -976,7 +1022,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 	 * planes atomically. If the cursor was part of the atomic update then
 	 * we would have taken the slowpath.
 	 */
-	crtc_state->active_planes = new_crtc_state->active_planes;
 
 	intel_vblank_evade_init(crtc_state, crtc_state, &evade);
 
@@ -998,9 +1043,11 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		local_irq_disable();
 	}
 
-	if (new_plane_state->uapi.visible) {
-		intel_plane_update_noarm(NULL, plane, crtc_state, new_plane_state);
-		intel_plane_update_arm(NULL, plane, crtc_state, new_plane_state);
+	if (joined_pipe_state[0].new_plane_state->uapi.visible) {
+		intel_plane_update_noarm(NULL, plane, crtc_state,
+					 joined_pipe_state[0].new_plane_state);
+		intel_plane_update_arm(NULL, plane, crtc_state,
+				       joined_pipe_state[0].new_plane_state);
 	} else {
 		intel_plane_disable_arm(NULL, plane, crtc_state);
 	}
@@ -1009,26 +1056,38 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	intel_psr_unlock(crtc_state);
 
-	if (old_plane_state->ggtt_vma != new_plane_state->ggtt_vma) {
-		drm_vblank_work_init(&old_plane_state->unpin_work, &crtc->base,
-				     intel_cursor_unpin_work);
-
-		drm_vblank_work_schedule(&old_plane_state->unpin_work,
-					 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
-					 false);
-
-		old_plane_state = NULL;
-	} else {
-		intel_plane_unpin_fb(old_plane_state);
+	/*
+	 * Schedule or immediately unpin old framebuffers.
+	 * Protect against concurrent access.
+	 */
+	for (int i = 0; i < num_pipes; i++) {
+		struct intel_plane_state *old = joined_pipe_state[i].old_plane_state;
+
+		if (old->ggtt_vma != joined_pipe_state[i].new_plane_state->ggtt_vma) {
+			drm_vblank_work_init(&old->unpin_work, &crtc->base,
+					     intel_cursor_unpin_work);
+			drm_vblank_work_schedule(&old->unpin_work,
+						 drm_crtc_accurate_vblank_count(&crtc->base) + 1,
+						 false);
+			joined_pipe_state[i].old_plane_state = NULL;
+		} else {
+			intel_plane_unpin_fb(old);
+		}
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

