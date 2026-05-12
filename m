Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CFDCD4F25
	for <intel-xe@archiver.kernel.org>; Tue, 12 May 2026 14:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A792610EB40;
	Tue, 12 May 2026 14:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M78axyHH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080710EB47;
 Tue, 12 May 2026 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778594640; x=1810130640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ccqoOs+azxNEBebmmjtRou/R1BAxi9oNjEiyd1iUo4w=;
 b=M78axyHHSbGym4Ef6pDwi/HsySvuniXqCrx+HhktU8MWddl1fBEl71H4
 s6HsrUunVRNt1d3g4fODi8bsNv8p8tkhx5zZ+aaXjr07CCzBYCiaRU6DC
 H1hUxEQN+fazTUR3YqNjzdxgWxUCA9xpGsgS80lfW1Zxh6KkOu4SaAxvk
 1QIF/ofqUy81HdHMmz9y77rB9QFVGzT8BS3FrclpZKCdoWfrRDPcFm5gP
 w2aGNNalR7OteF4uUoGKNE+clCkM1GqtNF369bzNC2RN/tXhse2twzSAF
 3u8VHyreCu5gFGTY4F2qEXQohSpQ1NHQp6oXjzp3UJygf1aCSnd7KXNC5 g==;
X-CSE-ConnectionGUID: bjJYzURNT6GneAxn1FncMg==
X-CSE-MsgGUID: +oM+ieMcSbGFMScB2ms7VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89806390"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="89806390"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 07:04:00 -0700
X-CSE-ConnectionGUID: GH/6PlicS4WQIxOeXXkjtg==
X-CSE-MsgGUID: 5H/7Et94QBiG+aYmbv59iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="233311426"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa006.fm.intel.com with ESMTP; 12 May 2026 07:03:57 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 Animesh Manna <animesh.manna@intel.com>
Subject: [PATCH v5 14/15] drm/i915/cmtg: Add trigger to enable/disable cmtg
Date: Tue, 12 May 2026 19:02:07 +0530
Message-Id: <20260512133208.1363116-15-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20260512133208.1363116-1-animesh.manna@intel.com>
References: <20260512133208.1363116-1-animesh.manna@intel.com>
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

Enable CMTG with fixed refresh rate mode and with dynamic
dc state enabled.

Disable CMTG with transcoder disable or if there is a transition
to vrr mode from fixed refresh rate mode.

v2:
- Move the enabled flag update to avoid issue in the disable timeout
path. [Uma]

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     |  5 +++++
 drivers/gpu/drm/i915/display/intel_display.c  | 20 +++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |  4 ++++
 3 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index 5935f5f2fd7c..c86e1d1d4aa6 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -185,12 +185,15 @@ static void intel_cmtg_disable_all(struct intel_display *display,
 void intel_cmtg_disable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 	enum transcoder cmtg_transcoder = to_cmtg_transcoder(crtc_state->cpu_transcoder);
 
 	if (!intel_cmtg_is_supported(crtc_state))
 		return;
 
+	crtc->cmtg.enabled = false;
+
 	intel_de_rmw(display, TRANS_VRR_CTL(display, cmtg_transcoder),
 		     VRR_CTL_VRR_ENABLE | VRR_CTL_FLIP_LINE_EN, 0);
 
@@ -398,6 +401,7 @@ void intel_cmtg_enable_sync(const struct intel_crtc_state *crtc_state)
 void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
 
 	if (!intel_cmtg_is_allowed(crtc_state))
@@ -406,6 +410,7 @@ void intel_cmtg_enable_ddi(const struct intel_crtc_state *crtc_state)
 	intel_de_rmw(display, TRANS_DDI_FUNC_CTL2(display, cpu_transcoder), 0, CMTG_SECONDARY_MODE);
 	intel_de_rmw(display, CMTG_SCANLINE_GB1(cpu_transcoder), 0, CMTG_HW_GB_ENABLE);
 
+	crtc->cmtg.enabled = true;
 	drm_dbg_kms(display->drm, "CMTG: %s enabled\n", transcoder_name(cpu_transcoder));
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index dd53049898ea..6dc561713c35 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1771,6 +1771,8 @@ static void hsw_crtc_disable(struct intel_atomic_state *state,
 	struct intel_crtc *pipe_crtc;
 	int i;
 
+	if (crtc->cmtg.enabled)
+		intel_cmtg_disable(old_crtc_state);
 	/*
 	 * FIXME collapse everything to one hook.
 	 * Need care with mst->ddi interactions.
@@ -6857,6 +6859,12 @@ static void intel_update_crtc(struct intel_atomic_state *state,
 	if (intel_crtc_needs_fastset(new_crtc_state) &&
 	    old_crtc_state->inherited)
 		intel_crtc_arm_fifo_underrun(crtc, new_crtc_state);
+
+	if (crtc->cmtg.enabled && (intel_crtc_vrr_enabling(state, crtc) ||
+				   !intel_cmtg_is_allowed(new_crtc_state))) {
+		intel_cmtg_disable(new_crtc_state);
+		intel_cmtg_disable_interrupt(new_crtc_state);
+	}
 }
 
 static void intel_old_crtc_state_disables(struct intel_atomic_state *state,
@@ -7534,6 +7542,18 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	/* FIXME probably need to sequence this properly */
 	intel_program_dpkgc_latency(state);
 
+	for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
+		bool modeset = intel_crtc_needs_modeset(new_crtc_state);
+
+		/* CMTG needs to be restored on DC6 exit and on modset*/
+		if (modeset && new_crtc_state->hw.active && !crtc->cmtg.enabled) {
+			intel_cmtg_enable_sync(new_crtc_state);
+			intel_cmtg_set_hwgb(new_crtc_state);
+			intel_cmtg_enable_ddi(new_crtc_state);
+			intel_cmtg_enable_interrupt(new_crtc_state);
+		}
+	}
+
 	intel_wait_for_vblank_workers(state);
 
 	/* FIXME: We should call drm_atomic_helper_commit_hw_done() here
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 26e59110e743..0e627c7bf2b9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1571,6 +1571,10 @@ struct intel_crtc {
 #endif
 
 	bool vblank_psr_notify;
+
+	struct {
+		bool enabled;
+	} cmtg;
 };
 
 struct intel_plane_error {
-- 
2.29.0

