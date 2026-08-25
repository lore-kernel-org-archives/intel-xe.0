Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9676C61DB6
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E95B10E8F3;
	Tue, 25 Aug 2026 06:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ce075+vn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217CD10E8CE;
 Tue, 25 Aug 2026 06:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787638781; x=1819174781;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kAQnLpkE5e14hYotzzBAjGAOmOrKUi0UNxepiLtb36Y=;
 b=ce075+vnaVvPJwH8PJUqo2CsHJ4E8HCPQsZmTyipK9iPxDJCCiZp1cSV
 Xdu/HZbin+mk5l8SU2lu9WuTLKh1dw0GQIhSQaSYNR7S0vFbDgAJNgLIM
 Rz5459+yDVKpoV3CvVsXovmY3vqh3s9msl5jLyttK02/qRG1dldIid2Fv
 IUPgJ+rZLqo8OjCy2TI9cjrIWd9B3XFeXt9KE501p3lGXgTZ5g5qR/T2+
 T7OKu7quHW+4HTKtLEQcjBkAyIZv1+cDWRa0PRwpswEsZ04xDGzYMNNfK
 9Ew2iUq1NzFHx0Q/FWE/QTWNv6po7vTt5Rpoptwggj5qp4//xpE35Ny66 Q==;
X-CSE-ConnectionGUID: hn523SYXQ1GOzWV0M3jEmQ==
X-CSE-MsgGUID: b4s4VL5ZQUavP/LGTg4z0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="88112698"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="88112698"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 23:19:41 -0700
X-CSE-ConnectionGUID: kJMPAx3hQq+4sZpM0b3URg==
X-CSE-MsgGUID: ZE7OD/EFTF6N9CNZEu4rxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="263913006"
Received: from unknown (HELO SRR4-3-Linux-101-amanna.iind.intel.com)
 ([10.190.238.88])
 by fmviesa007.fm.intel.com with ESMTP; 24 Aug 2026 23:19:38 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, jani.nikula@intel.com, suraj.kandpal@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 13/15] drm/i915/alpm: Introduce has_alpm to decouple from
 pr/psr2/lobf
Date: Tue, 25 Aug 2026 11:15:34 +0530
Message-Id: <20260825054536.3455704-14-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260825054536.3455704-1-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
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

For DP2.1, ALPM is optional and there can be scenario where panel replay
will be supported without ALPM. So decouple ALPM feature by has_alpm flag
from related display features.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c     | 19 +++------
 drivers/gpu/drm/i915/display/intel_alpm.h     |  2 -
 drivers/gpu/drm/i915/display/intel_cx0_phy.c  |  6 ++-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_lt_phy.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 39 +++++++++----------
 drivers/gpu/drm/i915/display/intel_psr.h      |  1 -
 7 files changed, 30 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index f3f6f40f9624..8c17da9883d6 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -37,13 +37,6 @@ bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp)
 	return intel_dp->alpm_dpcd & DP_ALPM_AUX_LESS_CAP;
 }
 
-bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
-				 const struct intel_crtc_state *crtc_state)
-{
-	return intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) ||
-		(crtc_state->has_lobf && intel_alpm_aux_less_wake_supported(intel_dp));
-}
-
 bool intel_alpm_source_supported(struct intel_connector *connector)
 {
 	struct intel_display *display = to_intel_display(connector);
@@ -513,6 +506,7 @@ void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
 
 	crtc_state->has_lobf = (crtc_state->set_context_latency + crtc_state->vrr.guardband) >
 			       (first_sdp_position + waketime_in_lines);
+	crtc_state->has_alpm = crtc_state->has_lobf;
 }
 
 void intel_alpm_lobf_compute_config(struct intel_dp *intel_dp,
@@ -575,8 +569,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	u32 alpm_ctl, alpm_ctl2, lttpr_count;
 
-	if (DISPLAY_VER(display) < 20 || (!intel_psr_needs_alpm(intel_dp, crtc_state) &&
-					  !crtc_state->has_lobf))
+	if (DISPLAY_VER(display) < 20 || !crtc_state->has_alpm)
 		return;
 
 	mutex_lock(&intel_dp->alpm.lock);
@@ -584,7 +577,7 @@ static void lnl_alpm_configure(struct intel_dp *intel_dp,
 	 * Panel Replay on eDP is always using ALPM aux less. I.e. no need to
 	 * check panel support at this point.
 	 */
-	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
+	if (intel_alpm_aux_less_wake_supported(intel_dp)) {
 		alpm_ctl = ALPM_CTL_ALPM_ENABLE |
 			ALPM_CTL_ALPM_AUX_LESS_ENABLE |
 			ALPM_CTL_AUX_LESS_SLEEP_HOLD_TIME_50_SYMBOLS;
@@ -648,10 +641,10 @@ void intel_alpm_port_configure(struct intel_dp *intel_dp,
 	enum port port = dp_to_dig_port(intel_dp)->base.port;
 	u32 alpm_ctl_val = 0, lfps_ctl_val = 0;
 
-	if (DISPLAY_VER(display) < 20)
+	if (DISPLAY_VER(display) < 20 || !crtc_state->has_alpm)
 		return;
 
-	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state)) {
+	if (intel_alpm_aux_less_wake_supported(intel_dp)) {
 		int lfps_cycle = get_lfps_cycle_count(crtc_state);
 		u32 lfps_cycle_val;
 
@@ -710,7 +703,7 @@ void intel_alpm_enable_sink(struct intel_dp *intel_dp,
 {
 	u8 val;
 
-	if (!intel_psr_needs_alpm(intel_dp, crtc_state) && !crtc_state->has_lobf)
+	if (!crtc_state->has_alpm)
 		return;
 
 	val = DP_ALPM_ENABLE | DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE;
diff --git a/drivers/gpu/drm/i915/display/intel_alpm.h b/drivers/gpu/drm/i915/display/intel_alpm.h
index b0f6e2a9eede..bca746d88da3 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.h
+++ b/drivers/gpu/drm/i915/display/intel_alpm.h
@@ -35,8 +35,6 @@ void intel_alpm_lobf_enable(const struct intel_crtc_state *new_crtc_state);
 void intel_alpm_lobf_debugfs_add(struct intel_connector *connector);
 bool intel_alpm_aux_wake_supported(struct intel_dp *intel_dp);
 bool intel_alpm_aux_less_wake_supported(struct intel_dp *intel_dp);
-bool intel_alpm_is_alpm_aux_less(struct intel_dp *intel_dp,
-				 const struct intel_crtc_state *crtc_state);
 void intel_alpm_disable(struct intel_dp *intel_dp);
 bool intel_alpm_get_error(struct intel_dp *intel_dp);
 void intel_alpm_lobf_compute_config_late(struct intel_dp *intel_dp,
diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
index dbebd7210848..4ad09a894eb2 100644
--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
@@ -3449,8 +3449,10 @@ void intel_lnl_mac_transmit_lfps(struct intel_encoder *encoder,
 	int i;
 	u8 owned_lane_mask;
 
-	if (DISPLAY_VER(display) < 20 ||
-	    !intel_alpm_is_alpm_aux_less(enc_to_intel_dp(encoder), crtc_state))
+	if (DISPLAY_VER(display) < 20 || !crtc_state->has_alpm)
+		return;
+
+	if (!intel_alpm_aux_less_wake_supported(enc_to_intel_dp(encoder)))
 		return;
 
 	owned_lane_mask = intel_cx0_get_owned_lane_mask(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 20a07ea06b5e..f8ac98ff8a87 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1442,6 +1442,7 @@ struct intel_crtc_state {
 		u8 silence_period_sym_clocks;
 		u8 lfps_half_cycle_num_of_syms;
 	} alpm_state;
+	bool has_alpm;
 
 	/* to track changes in plane color blocks */
 	bool plane_color_changed;
diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
index 4fe010df20be..62607284c350 100644
--- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
+++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
@@ -2371,7 +2371,7 @@ void intel_xe3plpd_mac_transmit_lfps(struct intel_encoder *encoder,
 	struct ref_tracker *wakeref;
 	u8 owned_lane_mask;
 
-	if (!intel_alpm_is_alpm_aux_less(intel_dp, crtc_state))
+	if (!crtc_state->has_alpm || !intel_alpm_aux_less_wake_supported(intel_dp))
 		return;
 
 	wakeref = intel_lt_phy_transaction_begin(encoder);
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 52836496040f..6a03bc624108 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1648,6 +1648,8 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
 	crtc_state->enable_psr2_su_region_et = psr2_su_region_et_valid(connector,
 								       crtc_state->has_panel_replay);
 
+	crtc_state->has_alpm = intel_alpm_is_possible(intel_dp);
+
 	return true;
 
 unsupported:
@@ -1735,11 +1737,17 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
 	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
+	if (intel_alpm_is_possible(intel_dp))
+		crtc_state->has_alpm = alpm_config_valid(intel_dp, crtc_state, true, true, false);
+
 	if (!intel_dp_is_edp(intel_dp))
 		return true;
 
 	/* Remaining checks are for eDP only */
 
+	if (!crtc_state->has_alpm)
+		return false;
+
 	if (to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_A &&
 	    to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_B)
 		return false;
@@ -1762,9 +1770,6 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 		return false;
 	}
 
-	if (!alpm_config_valid(intel_dp, crtc_state, true, true, false))
-		return false;
-
 	return true;
 }
 
@@ -4530,16 +4535,6 @@ void intel_psr_connector_debugfs_add(struct intel_connector *connector)
 				    connector, &i915_psr_status_fops);
 }
 
-bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state)
-{
-	/*
-	 * eDP Panel Replay uses always ALPM
-	 * PSR2 uses ALPM but PSR1 doesn't
-	 */
-	return intel_dp_is_edp(intel_dp) && (crtc_state->has_sel_update ||
-					     crtc_state->has_panel_replay);
-}
-
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state)
 {
@@ -4553,15 +4548,17 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 	int vblank = intel_crtc_vblank_length(crtc_state);
 	int wake_lines;
 
-	if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state))
-		wake_lines = crtc_state->alpm_state.aux_less_wake_lines;
-	else if (intel_psr_needs_alpm(intel_dp, crtc_state))
-		wake_lines = DISPLAY_VER(display) < 20 ?
-			     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
-						    crtc_state->alpm_state.fast_wake_lines) :
-			     crtc_state->alpm_state.io_wake_lines;
-	else
+	if (crtc_state->has_alpm) {
+		if (intel_alpm_aux_less_wake_supported(intel_dp))
+			wake_lines = crtc_state->alpm_state.aux_less_wake_lines;
+		else
+			wake_lines = DISPLAY_VER(display) < 20 ?
+				     psr2_block_count_lines(crtc_state->alpm_state.io_wake_lines,
+							    crtc_state->alpm_state.fast_wake_lines) :
+				     crtc_state->alpm_state.io_wake_lines;
+	} else {
 		wake_lines = 0;
+	}
 
 	/*
 	 * Disable the PSR features if wake lines exceed the available vblank.
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index d545fdaa0de7..4905ba4da4b8 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -79,7 +79,6 @@ void intel_psr_trigger_frame_change_event(struct intel_dsb *dsb,
 int intel_psr_min_set_context_latency(const struct intel_crtc_state *crtc_state);
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
-bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
 bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
 				   const struct intel_crtc_state *crtc_state);
 void intel_psr_compute_config_late(struct intel_dp *intel_dp,
-- 
2.29.0

