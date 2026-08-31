Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B722C61DFD
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 21:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE6F10EB54;
	Mon, 31 Aug 2026 21:14:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hPDuW4uk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B20B10EB5C;
 Mon, 31 Aug 2026 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788210874; x=1819746874;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/2MvVZ6qyeZOWODrzuKdBm4K9WX9U2/Hh8b/cqEDTwU=;
 b=hPDuW4ukJ+40B32zdeFXPkJ3fyApplv+E14/2KOrhLYTH1CUVlII0AFn
 KBIjTWTKhB8bv9JbKx86+pa5xjUfPv/1UIV1gWJNpi88r/KIHMYOgHzbB
 DehR74To4nFSeqrXlh7MYm78alm9mzb8+H7n5U2kGYjQ7VLjBk60cTwJi
 a9wzTKXoZG9xCREnBYvPcZ784aA2Fbi/5xiA5GIDnNuOYH80XQJ2qEEb9
 jFw4BWVOr9+lmfUMqqFDjqiCSO/jnumqUusDhyUOzyctEO34aoEVP/jZr
 zT4F9I01zs+Pz/k7yMApLQw6NPkr6TRm/b7sS1QEBGeP7/cwkAjtP1Ml3 w==;
X-CSE-ConnectionGUID: kw/lAcO0QsiMu28f0cPgyw==
X-CSE-MsgGUID: Fbr6iVz+QAmuYqWmaIjDEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="87762512"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="87762512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 14:14:34 -0700
X-CSE-ConnectionGUID: 6IUUFBvnT46qfuCXkfMO6Q==
X-CSE-MsgGUID: dIarxbV0R+a3CugnEPXndQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="264612825"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 31 Aug 2026 14:14:32 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 3/4] drm/i915/display: Reprogram AS SDP skip frames on seamless
 VRR transitions
Date: Tue,  1 Sep 2026 03:04:20 +0530
Message-ID: <20260831213421.1804635-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831213421.1804635-1-uma.shankar@intel.com>
References: <20260831213421.1804635-1-uma.shankar@intel.com>
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

The AS SDP skip-frame count is written to PR_ALPM_CTL only from
lnl_alpm_configure(), which runs from intel_psr_enable_locked() on a
Panel Replay disabled->enabled transition. VRR, however, can be enabled
and disabled seamlessly - without a modeset and without cycling Panel
Replay (intel_crtc_vrr_enabling()/disabling() in the pipe update path).

As a result, when a panel comes up with VRR off the non-zero skip count
is programmed, and when VRR is later turned on seamlessly PR stays
enabled, lnl_alpm_configure() is not re-invoked, and the stale skip
count is left in the register. This also leaves the coupled AS SDP
transmission / DC3CO idle-protocol bits inconsistent with the DC3co
state, which is recomputed on every commit.

Factor the PR_ALPM_CTL AS SDP programming out of lnl_alpm_configure()
into intel_alpm_configure_pr_as_sdp() and expose
intel_alpm_pr_as_sdp_update(), which recomputes those fields for the
current VRR state. Call it from the seamless VRR enable and disable
sites (non-modeset only; a modeset re-runs PR enable anyway) so the skip
counter always matches whether VRR is actively driving the refresh rate.

v2: Fixed Sashiko review comments

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c    | 119 +++++++++++++------
 drivers/gpu/drm/i915/display/intel_alpm.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display.c |  18 +++
 3 files changed, 100 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 0a33a89975bc..c784e77f610b 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -427,6 +427,85 @@ bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
 	return intel_pr_as_sdp_skip_frames(intel_dp) > 0;
 }
 
+/*
+ * Program the AS SDP portion of PR_ALPM_CTL: the transmission position, the
+ * skip-frame counter and the coupled AS SDP transmission / DC3CO idle-protocol
+ * bits. This is a full recompute of those fields (the base value is built from
+ * scratch, not read back), so it can be called both at PR enable time and when
+ * VRR is toggled seamlessly - which changes whether periodic AS SDP is used.
+ *
+ * Caller must hold intel_dp->alpm.lock.
+ */
+static void intel_alpm_configure_pr_as_sdp(struct intel_dp *intel_dp,
+					   const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
+	u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
+	u32 skip_frames = 0;
+
+	if (intel_alpm_pr_as_sdp_skip_frames_enabled(intel_dp, crtc_state))
+		skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
+
+	if (crtc_state->link_off_after_as_sdp_when_pr_active)
+		pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
+
+	/*
+	 * Skip frames needs the AS SDP to keep flowing during PR active, so it
+	 * is mutually exclusive with disabling AS SDP transmission in active and
+	 * with the DC3CO idle protocol.
+	 */
+	if (skip_frames) {
+		pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
+		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
+		pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+	} else {
+		pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
+
+		if (crtc_state->disable_as_sdp_when_pr_active)
+			pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
+
+		if (intel_display_power_dc3co_allowed(display))
+			pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
+	}
+
+	intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder), pr_alpm_ctl);
+}
+
+/*
+ * VRR can be enabled or disabled seamlessly, i.e. without a modeset and without
+ * cycling Panel Replay, so the AS SDP skip-frame programming done at PR enable
+ * time would otherwise go stale across a VRR toggle. Reprogram it here so the
+ * skip counter (and the coupled bits) matches the new VRR state.
+ */
+void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_encoder *encoder;
+
+	/* AS SDP skip frames field only exists on Xe3p_LPD+ */
+	if (DISPLAY_VER(display) < 35)
+		return;
+
+	for_each_intel_encoder_mask(display->drm, encoder,
+				    crtc_state->uapi.encoder_mask) {
+		struct intel_dp *intel_dp;
+
+		if (!intel_encoder_is_dp(encoder))
+			continue;
+
+		intel_dp = enc_to_intel_dp(encoder);
+
+		if (!intel_dp->as_sdp_supported ||
+		    !intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
+			continue;
+
+		mutex_lock(&intel_dp->alpm.lock);
+		intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
+		mutex_unlock(&intel_dp->alpm.lock);
+	}
+}
+
 static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			       const struct intel_crtc_state *crtc_state)
 {
@@ -449,44 +528,8 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
 			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
 
-		if (intel_dp->as_sdp_supported) {
-			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
-			u32 skip_frames = 0;
-
-			/*
-			 * AS SDP skip frames field only exists on Xe3p_LPD+, and
-			 * periodic AS SDP is a Panel Replay feature that is only
-			 * used when VRR is not actively driving the refresh rate.
-			 */
-			if (DISPLAY_VER(display) >= 35 && crtc_state->has_panel_replay &&
-			    !crtc_state->vrr.enable)
-				skip_frames = intel_pr_as_sdp_skip_frames(intel_dp);
-
-			if (crtc_state->link_off_after_as_sdp_when_pr_active)
-				pr_alpm_ctl |= PR_ALPM_CTL_ALLOW_LINK_OFF_BETWEEN_AS_SDP_AND_SU;
-
-			/*
-			 * Skip frames needs the AS SDP to keep flowing during PR
-			 * active, so it is mutually exclusive with disabling AS SDP
-			 * transmission in active and with the DC3CO idle protocol.
-			 */
-			if (skip_frames) {
-				pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_SKIP_FRAMES(skip_frames);
-				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
-				pr_alpm_ctl &= ~PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
-			} else {
-				pr_alpm_ctl &= ~PR_ALPM_CTL_AS_SDP_SKIP_FRAMES_MASK;
-
-				if (crtc_state->disable_as_sdp_when_pr_active)
-					pr_alpm_ctl |= PR_ALPM_CTL_AS_SDP_TRANSMISSION_IN_ACTIVE_DISABLE;
-
-				if (intel_display_power_dc3co_allowed(display))
-					pr_alpm_ctl |= PR_ALPM_CTL_USE_DC3CO_IDLE_PROTOCOL;
-			}
-
-			intel_de_write(display, PR_ALPM_CTL(display, cpu_transcoder),
-				       pr_alpm_ctl);
-		}
+		if (intel_dp->as_sdp_supported)
+			intel_alpm_configure_pr_as_sdp(intel_dp, crtc_state);
 
 	} else {
 		alpm_ctl = ALPM_CTL_EXTENDED_FAST_WAKE_ENABLE |
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index 328920027f1c..f8f605d94f96 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -36,6 +36,7 @@ bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
 				 const struct intel_crtc_state *crtc_state);
 bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
 					      const struct intel_crtc_state *crtc_state);
+void intel_alpm_pr_as_sdp_update(const struct intel_crtc_state *crtc_state);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index fc30a455bed3..9151ea6c15ab 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1232,6 +1232,14 @@ static void intel_pre_plane_update(struct intel_atomic_state *state,
 		intel_vrr_disable(old_crtc_state);
 		intel_vrr_dcb_reset(old_crtc_state, crtc);
 		intel_crtc_update_active_timings(old_crtc_state, false);
+
+		/*
+		 * VRR is being disabled seamlessly (no modeset, Panel Replay
+		 * stays enabled), so re-apply the AS SDP skip-frame programming
+		 * for the new (VRR off) state.
+		 */
+		if (!intel_crtc_needs_modeset(new_crtc_state))
+			intel_alpm_pr_as_sdp_update(new_crtc_state);
 	}
 
 	if (audio_disabling(old_crtc_state, new_crtc_state))
@@ -6971,6 +6979,16 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 		intel_crtc_update_active_timings(new_crtc_state,
 						 new_crtc_state->vrr.enable);
 
+	/*
+	 * VRR is being enabled seamlessly (no modeset, Panel Replay stays
+	 * enabled), so re-apply the AS SDP skip-frame programming for the new
+	 * (VRR on) state. Done here, outside the vblank-evasion critical section
+	 * (which runs with interrupts disabled), because it takes alpm.lock.
+	 */
+	if (intel_crtc_vrr_enabling(state, crtc) &&
+	    !intel_crtc_needs_modeset(new_crtc_state))
+		intel_alpm_pr_as_sdp_update(new_crtc_state);
+
 	if (new_crtc_state->vrr.dc_balance.enable)
 		intel_vrr_dcb_increment_flip_count(new_crtc_state, crtc);
 
-- 
2.50.1

