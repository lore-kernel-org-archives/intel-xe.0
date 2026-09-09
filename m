Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002FBC79FB7
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 16:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CE910F217;
	Wed,  9 Sep 2026 16:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyPknwmh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D1E10F216;
 Wed,  9 Sep 2026 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788970696; x=1820506696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WHDBGee4WMqor9VXLt4Q1HiYHuLzZQt/q0Ah4W+W9/A=;
 b=kyPknwmhEd/tE4YYokJ9geTBGyDKGvCmhvRHHDvD557kdfaJXcJRdJu7
 L7q6jpIryfrFSQHYNawHRaZpZkd1A6D/463Ha4thBS0IVSy+yU+MELv47
 WT/Lm+rpfZl/fzVPWZw3mb8MIhvFhlReXDaBmFaTioDyPecuuF8i18EFR
 vm9p0nNevDYESFe/yS80zeRB5aGr3Q0nhehQeG2KBVncjpweQkv98RAgX
 FF+ItpdETCwMJHxF4cLBR6h4uOF9AHUwvLSo3lBwRPH4xquEKfSZUCZA/
 2jlKDN99dO9uobZh3mpmH1LTXlfFs3/xpEdjUM42MORnYYunu5llM15Hl g==;
X-CSE-ConnectionGUID: HHupfj24RGmbXhELALMzkw==
X-CSE-MsgGUID: iBRPv6MXTZ2tnluMqb7VaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93225085"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="93225085"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:15 -0700
X-CSE-ConnectionGUID: Ph1PKYeaQDSCtlXh4LlADQ==
X-CSE-MsgGUID: //xQht+UTmun1+EFrKZ42w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; d="scan'208";a="265155460"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.137])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2026 09:18:14 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 10/13] drm/i915: Introduce enum intel_commit_type
Date: Wed,  9 Sep 2026 19:17:27 +0300
Message-ID: <20260909161730.12969-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
References: <20260909161730.12969-1-ville.syrjala@linux.intel.com>
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

Currently we use two booleans (use_dsb and use_flipq)
to track how we are going to perform the actual commit.
That is rarher awkward, and potentially fragile as the
'use_dsb && use_flipq' combination isn't even legal.
Switch over to an enum instead.

v2: Rebase due to intel_crtc_needs_vblank_work() keeping
    the use_dsb check

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   |   3 +-
 drivers/gpu/drm/i915/display/intel_color.c    |   6 +-
 drivers/gpu/drm/i915/display/intel_crtc.c     |   7 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 101 ++++++++++--------
 .../drm/i915/display/intel_display_types.h    |   8 +-
 5 files changed, 72 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index b66c2d4ba2b3..b042c3cc78e1 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -275,8 +275,7 @@ intel_crtc_duplicate_state(struct drm_crtc *crtc)
 	crtc_state->update_planes = 0;
 	crtc_state->dsb_color = NULL;
 	crtc_state->dsb_commit = NULL;
-	crtc_state->use_dsb = false;
-	crtc_state->use_flipq = false;
+	crtc_state->commit_type = INTEL_COMMIT_MMIO;
 
 	return &crtc_state->uapi;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 26e92221fa19..aa2f2b22312a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -2029,14 +2029,14 @@ void intel_color_prepare_commit(struct intel_atomic_state *state,
 		crtc_state->dsb_color = intel_dsb_prepare(state, crtc, INTEL_DSB_1, 1024);
 
 	if (!intel_color_uses_dsb(crtc_state)) {
-		crtc_state->use_flipq = false;
-		crtc_state->use_dsb = false;
+		crtc_state->commit_type = INTEL_COMMIT_MMIO;
 		return;
 	}
 
 	display->color.funcs->load_luts(crtc_state);
 
-	if (crtc_state->use_dsb && intel_color_uses_chained_dsb(crtc_state)) {
+	if (crtc_state->commit_type == INTEL_COMMIT_DSB &&
+	    intel_color_uses_chained_dsb(crtc_state)) {
 		intel_vrr_send_push(crtc_state->dsb_color, crtc_state);
 		intel_dsb_wait_for_delayed_vblank(state, crtc_state->dsb_color);
 		intel_vrr_check_push_sent(crtc_state->dsb_color, crtc_state);
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index 0de24d221e48..829ff2a2c025 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -499,8 +499,7 @@ static bool intel_crtc_needs_vblank_work(const struct intel_crtc_state *crtc_sta
 		!crtc_state->preload_luts &&
 		!intel_crtc_needs_modeset(crtc_state) &&
 		!intel_color_uses_dsb(crtc_state) &&
-		!crtc_state->use_flipq &&
-		!crtc_state->use_dsb;
+		crtc_state->commit_type == INTEL_COMMIT_MMIO;
 }
 
 static void intel_crtc_vblank_work(struct kthread_work *base)
@@ -598,7 +597,7 @@ void intel_pipe_update_start(struct intel_atomic_state *state,
 	struct intel_vblank_evade_ctx evade;
 	int scanline;
 
-	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
+	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
 
 	intel_psr_lock(new_crtc_state);
 
@@ -737,7 +736,7 @@ void intel_pipe_update_end(struct intel_atomic_state *state,
 	u32 end_vbl_count = intel_crtc_get_vblank_counter(crtc);
 	ktime_t end_vbl_time = ktime_get();
 
-	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
+	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
 
 	if (new_crtc_state->do_async_flip)
 		goto out;
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d7bd1b862aa9..9a24eb16025a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6798,7 +6798,7 @@ static void commit_pipe_pre_planes(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	bool modeset = intel_crtc_needs_modeset(new_crtc_state);
 
-	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
+	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
 
 	/*
 	 * During modesets pipe configuration was programmed as the
@@ -6828,7 +6828,7 @@ static void commit_pipe_post_planes(struct intel_atomic_state *state,
 		intel_atomic_get_new_crtc_state(state, crtc);
 	bool modeset = intel_crtc_needs_modeset(new_crtc_state);
 
-	drm_WARN_ON(display->drm, new_crtc_state->use_dsb || new_crtc_state->use_flipq);
+	drm_WARN_ON(display->drm, new_crtc_state->commit_type != INTEL_COMMIT_MMIO);
 
 	/*
 	 * Disable the scaler(s) after the plane(s) so that we don't
@@ -6917,13 +6917,13 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
 
 	drm_WARN_ON(display->drm, !intel_display_power_is_enabled(display, POWER_DOMAIN_DC_OFF));
 
-	if (!modeset &&
-	    intel_crtc_needs_color_update(new_crtc_state) &&
-	    !new_crtc_state->use_dsb && !new_crtc_state->use_flipq)
-		intel_color_commit_noarm(NULL, new_crtc_state);
+	if (new_crtc_state->commit_type == INTEL_COMMIT_MMIO) {
+		if (!modeset &&
+		    intel_crtc_needs_color_update(new_crtc_state))
+			intel_color_commit_noarm(NULL, new_crtc_state);
 
-	if (!new_crtc_state->use_dsb && !new_crtc_state->use_flipq)
 		intel_crtc_planes_update_noarm(NULL, state, crtc);
+	}
 }
 
 static void intel_update_crtc(struct intel_atomic_state *state,
@@ -6934,18 +6934,23 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
-	if (new_crtc_state->use_flipq) {
+	switch (new_crtc_state->commit_type) {
+	case INTEL_COMMIT_FLIPQ:
 		intel_flipq_enable(new_crtc_state);
 
 		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->flipq_event);
 
 		intel_flipq_add(crtc, INTEL_FLIPQ_PLANE_1, 0, INTEL_DSB_0,
 				new_crtc_state->dsb_commit);
-	} else if (new_crtc_state->use_dsb) {
+		break;
+
+	case INTEL_COMMIT_DSB:
 		intel_crtc_prepare_vblank_event(new_crtc_state, &crtc->dsb_event);
 
 		intel_dsb_commit(new_crtc_state->dsb_commit);
-	} else {
+		break;
+
+	case INTEL_COMMIT_MMIO:
 		/* Perform vblank evasion around commit operation */
 		intel_pipe_update_start(state, crtc);
 
@@ -6959,6 +6964,7 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 		commit_pipe_post_planes(state, crtc);
 
 		intel_pipe_update_end(state, crtc);
+		break;
 	}
 
 	/*
@@ -7368,36 +7374,47 @@ static void intel_atomic_prepare_plane_clear_colors(struct intel_atomic_state *s
 	}
 }
 
-static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
-				     struct intel_crtc *crtc)
+static enum intel_commit_type
+intel_atomic_commit_type(struct intel_atomic_state *state,
+			 struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
 	if (!new_crtc_state->hw.active)
-		return;
+		return INTEL_COMMIT_MMIO;
 
 	if (state->base.legacy_cursor_update)
-		return;
+		return INTEL_COMMIT_MMIO;
 
 	/* FIXME deal with everything */
-	new_crtc_state->use_flipq =
-		intel_flipq_supported(display) &&
-		!new_crtc_state->do_async_flip &&
-		!new_crtc_state->vrr.enable &&
-		!new_crtc_state->has_psr &&
-		!intel_crtc_needs_modeset(new_crtc_state) &&
-		!intel_crtc_needs_fastset(new_crtc_state) &&
-		!intel_crtc_needs_color_update(new_crtc_state);
-
-	new_crtc_state->use_dsb =
-		intel_dsb_supported(display) &&
-		!new_crtc_state->use_flipq &&
-		!new_crtc_state->do_async_flip &&
-		(DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&
-		!intel_crtc_needs_modeset(new_crtc_state) &&
-		!intel_crtc_needs_fastset(new_crtc_state);
+	if (intel_flipq_supported(display) &&
+	    !new_crtc_state->do_async_flip &&
+	    !new_crtc_state->vrr.enable &&
+	    !new_crtc_state->has_psr &&
+	    !intel_crtc_needs_modeset(new_crtc_state) &&
+	    !intel_crtc_needs_fastset(new_crtc_state) &&
+	    !intel_crtc_needs_color_update(new_crtc_state))
+		return INTEL_COMMIT_FLIPQ;
+
+	if (intel_dsb_supported(display) &&
+	    !new_crtc_state->do_async_flip &&
+	    (DISPLAY_VER(display) >= 20 || !new_crtc_state->has_psr) &&
+	    !intel_crtc_needs_modeset(new_crtc_state) &&
+	    !intel_crtc_needs_fastset(new_crtc_state))
+		return INTEL_COMMIT_DSB;
+
+	return INTEL_COMMIT_MMIO;
+}
+
+static void intel_atomic_dsb_prepare(struct intel_atomic_state *state,
+				     struct intel_crtc *crtc)
+{
+	struct intel_crtc_state *new_crtc_state =
+		intel_atomic_get_new_crtc_state(state, crtc);
+
+	new_crtc_state->commit_type = intel_atomic_commit_type(state, crtc);
 
 	intel_color_prepare_commit(state, crtc);
 }
@@ -7406,7 +7423,7 @@ static unsigned int
 commit_dsb_max_cmds(const struct intel_crtc_state *crtc_state)
 {
 	/* just enough to start the chained DSB */
-	if (!crtc_state->use_dsb && !crtc_state->use_flipq)
+	if (crtc_state->commit_type == INTEL_COMMIT_MMIO)
 		return 16;
 
 	/*
@@ -7429,23 +7446,21 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 	struct intel_crtc_state *new_crtc_state =
 		intel_atomic_get_new_crtc_state(state, crtc);
 
-	if (!new_crtc_state->use_flipq &&
-	    !new_crtc_state->use_dsb &&
+	if (new_crtc_state->commit_type == INTEL_COMMIT_MMIO &&
 	    !new_crtc_state->dsb_color)
 		return;
 
 	new_crtc_state->dsb_commit = intel_dsb_prepare(state, crtc, INTEL_DSB_0,
 						       commit_dsb_max_cmds(new_crtc_state));
 	if (!new_crtc_state->dsb_commit) {
-		new_crtc_state->use_flipq = false;
-		new_crtc_state->use_dsb = false;
+		new_crtc_state->commit_type = INTEL_COMMIT_MMIO;
 		intel_color_cleanup_commit(new_crtc_state);
 		return;
 	}
 
-	if (new_crtc_state->use_flipq || new_crtc_state->use_dsb) {
+	if (new_crtc_state->commit_type != INTEL_COMMIT_MMIO) {
 		/* Wa_18034343758 */
-		if (new_crtc_state->use_flipq)
+		if (new_crtc_state->commit_type == INTEL_COMMIT_FLIPQ)
 			intel_flipq_wait_dmc_halt(new_crtc_state->dsb_commit, crtc);
 
 		if (new_crtc_state->vrr.dc_balance.enable) {
@@ -7477,7 +7492,7 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 		intel_psr_trigger_frame_change_event(new_crtc_state->dsb_commit,
 						     state, crtc);
 
-		if (new_crtc_state->use_dsb)
+		if (new_crtc_state->commit_type == INTEL_COMMIT_DSB)
 			intel_dsb_vblank_evade(state, new_crtc_state->dsb_commit);
 
 		if (intel_crtc_needs_color_update(new_crtc_state))
@@ -7495,7 +7510,7 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 					   new_crtc_state);
 
 		/* Wa_18034343758 */
-		if (new_crtc_state->use_flipq)
+		if (new_crtc_state->commit_type == INTEL_COMMIT_FLIPQ)
 			intel_flipq_unhalt_dmc(new_crtc_state->dsb_commit, crtc);
 	}
 
@@ -7506,7 +7521,8 @@ static void intel_atomic_dsb_finish(struct intel_atomic_state *state,
 		intel_dsb_gosub(new_crtc_state->dsb_commit,
 				new_crtc_state->dsb_color);
 
-	if (new_crtc_state->use_dsb && !intel_color_uses_chained_dsb(new_crtc_state)) {
+	if (new_crtc_state->commit_type == INTEL_COMMIT_DSB &&
+	    !intel_color_uses_chained_dsb(new_crtc_state)) {
 		/*
 		 * Dsb wait vblank may or may not skip. Let's remove it for PSR
 		 * trans push case to ensure we are not waiting two vblanks
@@ -7695,10 +7711,11 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 
 		intel_atomic_dsb_wait_commit(new_crtc_state);
 
-		if (!state->base.legacy_cursor_update && !new_crtc_state->use_dsb)
+		if (!state->base.legacy_cursor_update &&
+		    new_crtc_state->commit_type == INTEL_COMMIT_MMIO)
 			intel_vrr_check_push_sent(NULL, new_crtc_state);
 
-		if (new_crtc_state->use_flipq)
+		if (new_crtc_state->commit_type == INTEL_COMMIT_FLIPQ)
 			intel_flipq_disable(new_crtc_state);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 9016be52c7ea..11d68c951a3a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1389,8 +1389,12 @@ struct intel_crtc_state {
 
 	/* For DSB based pipe updates */
 	struct intel_dsb *dsb_color, *dsb_commit;
-	bool use_dsb;
-	bool use_flipq;
+
+	enum intel_commit_type {
+		INTEL_COMMIT_MMIO,
+		INTEL_COMMIT_DSB,
+		INTEL_COMMIT_FLIPQ,
+	} commit_type;
 
 	u32 psr2_man_track_ctl;
 
-- 
2.54.0

