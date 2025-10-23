Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB08CCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3250510E91C;
	Thu, 23 Oct 2025 15:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ijrGihXc";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 615F210E91C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1761233651;
 bh=+YB4AM18eG9EacqrOL/5AyRAkecqNXyF0Sj7+aBKzxY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ijrGihXc37FKvyrEqhdn0YtTb//c81HITqWQj4MQ4ntfh0c6TaU1P+4gIMdmyw+Nm
 +00/2cR6j3DaaKZgWZGw1Po7OuLqKTwRQbFQBifq4/l7cOd2oa5r+Hu6WLcByDXyuD
 gwtf+BET7N51/f6/ARDYsHfj2gWk2vSfw1NkXyDR25du2U+ny1GAsskcyMDIRoBVo5
 M0jM7WQ2cEHMS8qNlww1PXA6NA386LHNieUMc2410bA/r/qFN13KlY/4N4W83Ou3l2
 lSJXKQMvrTkIttqIFLI/IM0/m1bQM9s+XQ9/taqA38HgMRguQ2JvMR7gq1yYzA/K8q
 3fz71fenjWNvg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR CI 4/5] drm/xe/display: Disable preemption in the most critical
 section
Date: Thu, 23 Oct 2025 17:34:05 +0200
Message-ID: <20251023153407.7547-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023153407.7547-1-dev@lankhorst.se>
References: <20251023153407.7547-1-dev@lankhorst.se>
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

Lets see what happens if we only disable preemption in the critical
section to ensure we do run as fast as possible without disabling
too much.

Second attempt: Disable preemption, but keep interrupts enabled.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/i915/display/intel_crtc.c   | 14 ++++++
 drivers/gpu/drm/i915/display/intel_cursor.c | 18 +++++++-
 drivers/gpu/drm/i915/display/intel_vblank.c | 47 ++++++++++++---------
 3 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index f34745b5ea497..939ef48859f16 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -569,6 +569,10 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_disable();
+#ifndef I915
+	else
+		preempt_disable();
+#endif
 
 	crtc->debug.min_vbl = evade.min;
 	crtc->debug.max_vbl = evade.max;
@@ -588,6 +592,11 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 irq_disable:
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_disable();
+#ifndef I915
+	else
+		preempt_disable();
+#endif
+
 }
 
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_VBLANK_EVADE)
@@ -686,6 +695,10 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	    intel_crtc_has_type(new_crtc_state, INTEL_OUTPUT_DSI))
 		icl_dsi_frame_update(new_crtc_state);
 
+#if !defined(I915) && IS_ENABLED(CONFIG_PREEMPT_RT)
+	preempt_enable();
+#endif
+
 	/* We're still in the vblank-evade critical section, this can't race.
 	 * Would be slightly nice to just grab the vblank count and arm the
 	 * event outside of the critical section - the spinlock might spin for a
@@ -733,6 +746,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	if (!state->base.legacy_cursor_update)
 		intel_vrr_send_push(NULL, new_crtc_state);
 
+	/* Re-enable irqs here for !RT */
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_enable();
 
diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
index 780fcae77a984..50ca39eb09145 100644
--- a/drivers/gpu/drm/i915/display/intel_cursor.c
+++ b/drivers/gpu/drm/i915/display/intel_cursor.c
@@ -912,6 +912,7 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	intel_psr_lock(crtc_state);
 
+	bool vblanked = false;
 	if (!drm_WARN_ON(display->drm, drm_crtc_vblank_get(&crtc->base))) {
 		/*
 		 * TODO: maybe check if we're still in PSR
@@ -921,13 +922,21 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 			local_irq_disable();
+#ifndef I915
+		else
+			preempt_disable();
+#endif
 
 		intel_vblank_evade(&evade);
 
-		drm_crtc_vblank_put(&crtc->base);
+		vblanked = true;
 	} else {
 		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 			local_irq_disable();
+#ifndef I915
+		else
+			preempt_disable();
+#endif
 	}
 
 	if (new_plane_state->uapi.visible) {
@@ -939,6 +948,10 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 
 	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
 		local_irq_enable();
+#ifndef I915
+	else
+		preempt_enable();
+#endif
 
 	intel_psr_unlock(crtc_state);
 
@@ -955,6 +968,9 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
 		intel_plane_unpin_fb(old_plane_state);
 	}
 
+	if (vblanked)
+		drm_crtc_vblank_put(&crtc->base);
+
 out_free:
 	if (new_crtc_state)
 		intel_crtc_destroy_state(&crtc->base, &new_crtc_state->uapi);
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 7826f29619a14..448ae8e5b6e90 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -729,6 +729,13 @@ void intel_vblank_evade_init(const struct intel_crtc_state *old_crtc_state,
 		evade->min -= vblank_delay;
 }
 
+static inline int vblank_evadable(struct intel_vblank_evade_ctx *evade, int *scanline)
+{
+	*scanline = intel_get_crtc_scanline(evade->crtc);
+
+	return *scanline < evade->min || *scanline > evade->max;
+}
+
 /* must be called with vblank interrupt already enabled! */
 int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 {
@@ -736,23 +743,33 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 	struct intel_display *display = to_intel_display(crtc);
 	long timeout = msecs_to_jiffies_timeout(1);
 	wait_queue_head_t *wq = drm_crtc_vblank_waitqueue(&crtc->base);
-	DEFINE_WAIT(wait);
 	int scanline;
 
 	if (evade->min <= 0 || evade->max <= 0)
 		return 0;
 
-	for (;;) {
-		/*
-		 * prepare_to_wait() has a memory barrier, which guarantees
-		 * other CPUs can see the task state update by the time we
-		 * read the scanline.
-		 */
+	while (!vblank_evadable(evade, &scanline)) {
+		DEFINE_WAIT(wait);
+
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_enable();
+#ifndef I915
+		else
+			preempt_enable();
+#endif
+
 		prepare_to_wait(wq, &wait, TASK_UNINTERRUPTIBLE);
+		if (!vblank_evadable(evade, &scanline))
+			timeout = schedule_timeout(timeout);
 
-		scanline = intel_get_crtc_scanline(crtc);
-		if (scanline < evade->min || scanline > evade->max)
-			break;
+		finish_wait(wq, &wait);
+
+		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+			local_irq_disable();
+#ifndef I915
+		else
+			preempt_disable();
+#endif
 
 		if (!timeout) {
 			drm_dbg_kms(display->drm,
@@ -760,18 +777,8 @@ int intel_vblank_evade(struct intel_vblank_evade_ctx *evade)
 				    pipe_name(crtc->pipe));
 			break;
 		}
-
-		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-			local_irq_enable();
-
-		timeout = schedule_timeout(timeout);
-
-		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
-			local_irq_disable();
 	}
 
-	finish_wait(wq, &wait);
-
 	/*
 	 * On VLV/CHV DSI the scanline counter would appear to
 	 * increment approx. 1/3 of a scanline before start of vblank.
-- 
2.51.0

