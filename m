Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775D8C624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 12:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2EA10E7E6;
	Mon, 31 Aug 2026 12:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZdal32l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A460510E81B;
 Mon, 31 Aug 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788179967; x=1819715967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bfDmNTz/YMXg75uoSmWLCq4vPw0qBfDXOk7L1Are2Z8=;
 b=GZdal32lcNZ/bzv2hB066ll61X2gOiCLT4RcO2zeB9JOGX2Gupp6GYXU
 BMDbOImzGl7QUMKNqwKoAjw+mJs+iF0XRZGiZzTyM6RR1lQt+g+WPB9IW
 ZXNwJS0+g5EmRyhSDTECzlwKvGKDhp0lJcINitgrRIWMe0T3GvheMP7jS
 9DAS/JGr8AAUtO1BXC6Nw8ZH4NUmkv2AyPTluPT000ahg15Ke+T5ZzUqo
 U8jER6WFExMdf1hXBz6+Oy5rouobhpeAJ0XDto1qGmk3Q+TxZH6973Hyo
 aJNirfj19obKDhTstJl/iZfyCJWa9j92Ml/PXukPujwu5EWRup60rRLkz A==;
X-CSE-ConnectionGUID: NXdye9U9QnuUVyu+/q8eBQ==
X-CSE-MsgGUID: Qf0DBlF0QJy5PuBdrSHSJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88513953"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="88513953"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:39:27 -0700
X-CSE-ConnectionGUID: 5OjreZqfR9ao7q4sYc6vVw==
X-CSE-MsgGUID: S5OVvrBGRAG4MY3kz21+4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="292289525"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 31 Aug 2026 05:39:25 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dibin.moolakadan.subrahmanian@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 3/4] drm/i915/display: Reprogram AS SDP skip frames on seamless
 VRR transitions
Date: Mon, 31 Aug 2026 18:29:12 +0530
Message-ID: <20260831125914.1736501-4-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831125914.1736501-1-uma.shankar@intel.com>
References: <20260831125914.1736501-1-uma.shankar@intel.com>
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

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c    | 122 +++++++++++++------
 drivers/gpu/drm/i915/display/intel_alpm.h    |   1 +
 drivers/gpu/drm/i915/display/intel_display.c |  19 ++-
 3 files changed, 104 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 5f635f14a588..03d5bf5c526f 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -427,6 +427,89 @@ bool intel_alpm_pr_as_sdp_skip_frames_enabled(struct intel_dp *intel_dp,
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
+	/*
+	 * AS SDP skip frames field only exists on Xe3LPD+, and periodic AS SDP
+	 * is only used when VRR is not actively driving the refresh rate.
+	 */
+	if (DISPLAY_VER(display) >= 35 && !crtc_state->vrr.enable)
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
+	/* AS SDP skip frames field only exists on Xe3LPD+ */
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
@@ -449,43 +532,8 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS |
 			ALPM_CTL_AUX_LESS_WAKE_TIME(crtc_state->alpm_state.aux_less_wake_lines);
 
-		if (intel_dp->as_sdp_supported) {
-			u32 pr_alpm_ctl = get_pr_alpm_as_sdp_transmission_time(crtc_state);
-			u32 skip_frames = 0;
-
-			/*
-			 * AS SDP skip frames field only exists on Xe3LPD+, and
-			 * periodic AS SDP is only used when VRR is not actively
-			 * driving the refresh rate.
-			 */
-			if (DISPLAY_VER(display) >= 35 && !crtc_state->vrr.enable)
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
index fc30a455bed3..d0e74378670d 100644
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
@@ -6844,8 +6852,17 @@ static void commit_pipe_post_planes(struct intel_atomic_state *state,
 	    HAS_DOUBLE_BUFFERED_LUT(display))
 		intel_color_load_luts(new_crtc_state);
 
-	if (intel_crtc_vrr_enabling(state, crtc))
+	if (intel_crtc_vrr_enabling(state, crtc)) {
 		intel_vrr_enable(new_crtc_state);
+
+		/*
+		 * VRR is being enabled seamlessly (no modeset, Panel Replay
+		 * stays enabled), so re-apply the AS SDP skip-frame programming
+		 * for the new (VRR on) state.
+		 */
+		if (!modeset)
+			intel_alpm_pr_as_sdp_update(new_crtc_state);
+	}
 }
 
 static void intel_enable_crtc(struct intel_atomic_state *state,
-- 
2.50.1

