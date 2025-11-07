Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C75DCCFA19
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 19:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D77910EB62;
	Fri,  7 Nov 2025 19:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="PiVCVIxT";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE62310EB66
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1762544392;
 bh=yHsjUhkaKPH3TxCb30aB5MxMA3ORebE7+Gl5uOlZjIw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PiVCVIxTGBjq4/v+JK2SpBxOMDsbq3mR8afnwZmGfklbkRngooTTjGLGEfF+Oeig2
 NleW6UfyuRE2UmkVzqWg2OuNWKVkNqhyzgQJJZlUsVePbosqmY9NkV6G8Z5ldv/cvw
 RoFPypfCOzE8ezLV8jNo76RoZ6JNpcFJ9eNXb4mCchbQpm5E3cjk0RLFiGlDWP1tmM
 dALiCDworgdqXpyEe1lwK+uTRDbe/PIQed680pEEwiEAWujmo9Uj4SsV4yIDctlRE3
 SFW+sYHCkITcxPPbYPKO4aZ8h2v3Mx69/aORb6DLYANn/MTvdNrnQ1IYlERQdj52Tz
 ck3m31oR59ksQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI 09/10] drm/i915/display: Remove dirty_rect from fbc state
Date: Fri,  7 Nov 2025 20:39:44 +0100
Message-ID: <20251107193946.1075137-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251107193946.1075137-1-dev@lankhorst.se>
References: <20251107193946.1075137-1-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It's a terrible idea to serialize against &fbc->mutex during vblank
evasion. All the relevant state is already in plane_state, use
that instead and get rid of a lot of unnecessary bookkeeping.

Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: af23476af8a9 ("drm/i915/fbc: handle dirty rect coords for the first frame")
Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org> # v6.15+
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_display.c |   3 -
 drivers/gpu/drm/i915/display/intel_fbc.c     | 124 +++++--------------
 drivers/gpu/drm/i915/display/intel_fbc.h     |   3 +-
 drivers/gpu/drm/i915/display/intel_plane.c   |   2 +-
 4 files changed, 31 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 45b210050d8c0..716a2e4825b6d 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7392,9 +7392,6 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 	intel_atomic_prepare_plane_clear_colors(state);
 
-	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
-		intel_fbc_prepare_dirty_rect(state, crtc);
-
 	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i)
 		intel_atomic_dsb_finish(state, crtc);
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index a1e3083022ee7..dee7ca9eff20d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -91,7 +91,6 @@ struct intel_fbc_state {
 	u16 override_cfb_stride;
 	u16 interval;
 	s8 fence_id;
-	struct drm_rect dirty_rect;
 };
 
 struct intel_fbc {
@@ -1272,72 +1271,63 @@ static bool tiling_is_valid(const struct intel_plane_state *plane_state)
 		return i8xx_fbc_tiling_valid(plane_state);
 }
 
-static void
-intel_fbc_invalidate_dirty_rect(struct intel_fbc *fbc)
-{
-	lockdep_assert_held(&fbc->lock);
-
-	fbc->state.dirty_rect = DRM_RECT_INIT(0, 0, 0, 0);
-}
-
 static void
 intel_fbc_program_dirty_rect(struct intel_dsb *dsb, struct intel_fbc *fbc,
-			     const struct drm_rect *fbc_dirty_rect)
+			     const struct drm_rect *dirty_rect_fp)
 {
 	struct intel_display *display = fbc->display;
+	struct drm_rect dirty_rect;
+
+	drm_rect_fp_to_int(&dirty_rect, dirty_rect_fp);
 
-	drm_WARN_ON(display->drm, fbc_dirty_rect->y2 == 0);
+	drm_WARN_ON(display->drm, dirty_rect.y2 == 0);
 
 	intel_de_write_dsb(display, dsb, XE3_FBC_DIRTY_RECT(fbc->id),
-			   FBC_DIRTY_RECT_START_LINE(fbc_dirty_rect->y1) |
-			   FBC_DIRTY_RECT_END_LINE(fbc_dirty_rect->y2 - 1));
+			   FBC_DIRTY_RECT_START_LINE(dirty_rect.y1) |
+			   FBC_DIRTY_RECT_END_LINE(dirty_rect.y2 - 1));
 }
 
-static void
-intel_fbc_dirty_rect_update(struct intel_dsb *dsb, struct intel_fbc *fbc)
-{
-	const struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
-
-	lockdep_assert_held(&fbc->lock);
-
-	if (!drm_rect_visible(fbc_dirty_rect))
-		return;
-
-	intel_fbc_program_dirty_rect(dsb, fbc, fbc_dirty_rect);
-}
+static inline bool intel_fbc_is_ok(const struct intel_plane_state *plane_state);
 
 void
 intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
-				  struct intel_plane *plane)
+				  const struct intel_crtc_state *crtc_state,
+				  const struct intel_plane_state *plane_state)
 {
+	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
 	struct intel_display *display = to_intel_display(plane);
 	struct intel_fbc *fbc = plane->fbc;
+	const struct drm_rect *damage = &plane_state->damage;
+	struct drm_rect rect;
 
-	if (!HAS_FBC_DIRTY_RECT(display))
+	if (!HAS_FBC_DIRTY_RECT(display) ||
+	    READ_ONCE(fbc->state.plane) != plane ||
+	    intel_crtc_needs_modeset(crtc_state) ||
+	    !intel_fbc_is_ok(plane_state))
 		return;
 
-	mutex_lock(&fbc->lock);
+	if (!drm_rect_visible(damage)) {
+		int width = drm_rect_width(&plane_state->uapi.src);
+		int y_offset = plane_state->view.color_plane[0].y;
 
-	if (fbc->state.plane == plane)
-		intel_fbc_dirty_rect_update(dsb, fbc);
+		/* dirty rect must cover at least one line */
+		rect = DRM_RECT_INIT(0, y_offset << 16, width, 1 << 16);
+		damage = &rect;
+	}
 
-	mutex_unlock(&fbc->lock);
+	intel_fbc_program_dirty_rect(dsb, fbc, damage);
 }
 
 static void
 intel_fbc_hw_intialize_dirty_rect(struct intel_fbc *fbc,
 				  const struct intel_plane_state *plane_state)
 {
-	struct drm_rect src;
-
 	/*
 	 * Initializing the FBC HW with the whole plane area as the dirty rect.
 	 * This is to ensure that we have valid coords be written to the
 	 * HW as dirty rect.
 	 */
-	drm_rect_fp_to_int(&src, &plane_state->uapi.src);
-
-	intel_fbc_program_dirty_rect(NULL, fbc, &src);
+	intel_fbc_program_dirty_rect(NULL, fbc, &plane_state->uapi.src);
 }
 
 static void intel_fbc_update_state(struct intel_atomic_state *state,
@@ -1355,7 +1345,7 @@ static void intel_fbc_update_state(struct intel_atomic_state *state,
 	WARN_ON(plane_state->no_fbc_reason);
 	WARN_ON(fbc_state->plane && fbc_state->plane != plane);
 
-	fbc_state->plane = plane;
+	WRITE_ONCE(fbc_state->plane, plane);
 
 	/* FBC1 compression interval: arbitrary choice of 1 second */
 	fbc_state->interval = drm_mode_vrefresh(&crtc_state->hw.adjusted_mode);
@@ -1413,62 +1403,6 @@ static bool intel_fbc_is_ok(const struct intel_plane_state *plane_state)
 		intel_fbc_is_cfb_ok(plane_state);
 }
 
-static void
-__intel_fbc_prepare_dirty_rect(const struct intel_plane_state *plane_state,
-			       const struct intel_crtc_state *crtc_state)
-{
-	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
-	struct intel_fbc *fbc = plane->fbc;
-	struct drm_rect *fbc_dirty_rect = &fbc->state.dirty_rect;
-	int width = drm_rect_width(&plane_state->uapi.src) >> 16;
-	const struct drm_rect *damage = &plane_state->damage;
-	int y_offset = plane_state->view.color_plane[0].y;
-
-	lockdep_assert_held(&fbc->lock);
-
-	if (intel_crtc_needs_modeset(crtc_state) ||
-	    !intel_fbc_is_ok(plane_state)) {
-		intel_fbc_invalidate_dirty_rect(fbc);
-		return;
-	}
-
-	if (drm_rect_visible(damage))
-		*fbc_dirty_rect = *damage;
-	else
-		/* dirty rect must cover at least one line */
-		*fbc_dirty_rect = DRM_RECT_INIT(0, y_offset, width, 1);
-}
-
-void
-intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
-			     struct intel_crtc *crtc)
-{
-	struct intel_display *display = to_intel_display(state);
-	const struct intel_crtc_state *crtc_state =
-		intel_atomic_get_new_crtc_state(state, crtc);
-	struct intel_plane_state *plane_state;
-	struct intel_plane *plane;
-	int i;
-
-	if (!HAS_FBC_DIRTY_RECT(display))
-		return;
-
-	for_each_new_intel_plane_in_state(state, plane, plane_state, i) {
-		struct intel_fbc *fbc = plane->fbc;
-
-		if (!fbc || plane->pipe != crtc->pipe)
-			continue;
-
-		mutex_lock(&fbc->lock);
-
-		if (fbc->state.plane == plane)
-			__intel_fbc_prepare_dirty_rect(plane_state,
-						       crtc_state);
-
-		mutex_unlock(&fbc->lock);
-	}
-}
-
 static int _intel_fbc_min_cdclk(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
@@ -1771,15 +1705,13 @@ static void __intel_fbc_disable(struct intel_fbc *fbc)
 	drm_dbg_kms(display->drm, "Disabling FBC on [PLANE:%d:%s]\n",
 		    plane->base.base.id, plane->base.name);
 
-	intel_fbc_invalidate_dirty_rect(fbc);
-
 	__intel_fbc_cleanup_cfb(fbc);
 
 	/* wa_18038517565 Enable DPFC clock gating after FBC disable */
 	if (display->platform.dg2 || DISPLAY_VER(display) >= 14)
 		fbc_compressor_clkgate_disable_wa(fbc, false);
 
-	fbc->state.plane = NULL;
+	WRITE_ONCE(fbc->state.plane, NULL);
 	fbc->flip_pending = false;
 	fbc->busy_bits = 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.h b/drivers/gpu/drm/i915/display/intel_fbc.h
index 91424563206a3..65d73cd56bc7b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.h
+++ b/drivers/gpu/drm/i915/display/intel_fbc.h
@@ -52,7 +52,8 @@ void intel_fbc_debugfs_register(struct intel_display *display);
 void intel_fbc_prepare_dirty_rect(struct intel_atomic_state *state,
 				  struct intel_crtc *crtc);
 void intel_fbc_dirty_rect_update_noarm(struct intel_dsb *dsb,
-				       struct intel_plane *plane);
+				       const struct intel_crtc_state *crtc_state,
+				       const struct intel_plane_state *plane_state);
 bool
 intel_fbc_is_enable_pixel_normalizer(const struct intel_plane_state *plane_state);
 
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 5105e3278bc46..b22edc7e62d6d 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -797,7 +797,7 @@ void intel_plane_update_noarm(struct intel_dsb *dsb,
 	trace_intel_plane_update_noarm(plane_state, crtc);
 
 	if (plane->fbc)
-		intel_fbc_dirty_rect_update_noarm(dsb, plane);
+		intel_fbc_dirty_rect_update_noarm(dsb, crtc_state, plane_state);
 
 	if (plane->update_noarm)
 		plane->update_noarm(dsb, plane, crtc_state, plane_state);
-- 
2.51.0

