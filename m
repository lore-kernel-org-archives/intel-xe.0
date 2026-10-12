Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F82CA9EDE
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 12:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BCC10F09C;
	Mon, 12 Oct 2026 12:42:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266FC10F082;
 Mon, 12 Oct 2026 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791808917; x=1823344917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kj7LIOl/3UzsaDTuWZskB1h4srh9Noz/KhrBEdfPfBE=;
 b=KTmg408o+pc1/9jd6I2WyFNj2/nWgsKSQ3wbH3WLAQCq4FYHFrJTXogb
 BzqNslz7C63b/5Ism0MN25l9UjhakGISyGtL7lJ+v5ANEftyJHbYe3XgD
 6172Pwi/VLLXhaUc4lmPpPsQk1BL7ytzgghevg0fH+jOH6MpXQQoYa5ki
 gQFeVKMBedzevF1BQYxN14Pfz6hD2FvGRAnHmg098jdAwwhUO0T5D6qEB
 eIs41QwFGyU18PRd7/K2EL5lVis9GH6rec3/4R3ry6C/UeMdZO6ekgWte
 8Ylc6zWHEPtrYma8O3gKiTbDC4orbBDj7SHSqK4rPL4mq9PqmOrCSJFr6 w==;
X-CSE-ConnectionGUID: s68pX8m/Q1+zyHH2bV+C/Q==
X-CSE-MsgGUID: rpzxMutxRHiy6ZCX4jN/pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="506216"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="506216"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 05:41:56 -0700
X-CSE-ConnectionGUID: H4wcApCwTjO71kt7KZGlVA==
X-CSE-MsgGUID: ZqQRt0TmR+a6kSOrOz2iaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="808184"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa007.jf.intel.com with ESMTP; 12 Oct 2026 05:41:55 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v2 5/6] drm/i915/psr: Allow Panel Replay and PSR2 with joiner
Date: Mon, 12 Oct 2026 12:41:44 +0000
Message-ID: <20261012124145.1960050-6-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012124145.1960050-1-mika.kahola@intel.com>
References: <20261012124145.1960050-1-mika.kahola@intel.com>
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

PSR is rejected outright whenever the joiner is in use. Panel Replay and
PSR2 selective update do work with the joiner, so only keep rejecting
plain PSR1.

The eDP Panel Replay pipe A/B restriction only looks at the primary
pipe. joiner_pipes is a contiguous mask anchored at the primary pipe, so
a joined config on pipe B extends to pipe C, which has no PSR/Panel
Replay register block. Test the whole joined pipe mask instead, which is
a no-op without the joiner.

PSR1/PSR2 have no equivalent pipe A/B check today. That is a
pre-existing gap independent of the joiner and is left alone here.

v2: Drop psr_joiner_config_valid(), it duplicated the existing eDP Panel
    Replay pipe A/B check and wrongly applied it to DP Panel Replay (Jouni)
    Extend that existing check to the joined pipe mask instead (Jouni)
    Keep only the joiner specific checks: PSR1 and YUV 4:2:0 (Jouni)

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 34 +++++++++++++++---------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index c256d3c87626..d3fdd5c384c6 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1594,6 +1594,13 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_display *display = to_intel_display(intel_dp);
 
+	if (crtc_state->joiner_pipes && !crtc_state->dsc.compression_enable &&
+	    crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+		drm_dbg_kms(display->drm,
+			    "Selective update not enabled, uncompressed joiner does not support YUV 4:2:0\n");
+		goto unsupported;
+	}
+
 	if (HAS_PSR2_SEL_FETCH(display) &&
 	    !intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state) &&
 	    !HAS_PSR_HW_TRACKING(display)) {
@@ -1741,8 +1748,8 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 
 	/* Remaining checks are for eDP only */
 
-	if (to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_A &&
-	    to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_B)
+	/* Every joined pipe needs its own PSR/Panel Replay register block. */
+	if (intel_crtc_joined_pipe_mask(crtc_state) & ~(BIT(PIPE_A) | BIT(PIPE_B)))
 		return false;
 
 	/* 128b/132b Panel Replay is not supported on eDP */
@@ -1886,17 +1893,6 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 		return;
 	}
 
-	/*
-	 * FIXME figure out what is wrong with PSR+joiner and
-	 * fix it. Presumably something related to the fact that
-	 * PSR is a transcoder level feature.
-	 */
-	if (crtc_state->joiner_pipes) {
-		drm_dbg_kms(display->drm,
-			    "PSR disabled due to joiner\n");
-		return;
-	}
-
 	/* Only used for state verification. */
 	crtc_state->panel_replay_dsc_support = connector->dp.panel_replay_caps.dsc_support;
 	crtc_state->has_panel_replay = _panel_replay_compute_config(crtc_state, conn_state);
@@ -1908,6 +1904,14 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
 		return;
 
 	crtc_state->has_sel_update = intel_sel_update_config_valid(crtc_state, conn_state);
+
+	/* Plain PSR1 is not supported with joiner. */
+	if (crtc_state->joiner_pipes && !crtc_state->has_panel_replay &&
+	    !crtc_state->has_sel_update) {
+		drm_dbg_kms(display->drm,
+			    "PSR disabled, PSR1 not supported with joiner\n");
+		crtc_state->has_psr = false;
+	}
 }
 
 void intel_psr_get_config(struct intel_encoder *encoder,
@@ -4744,6 +4748,10 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 		crtc_state->has_sel_update = false;
 		crtc_state->enable_psr2_su_region_et = false;
 		crtc_state->enable_psr2_sel_fetch = false;
+
+		/* Plain PSR1 is not supported with joiner. */
+		if (crtc_state->joiner_pipes)
+			crtc_state->has_psr = false;
 	}
 
 	/* Wa_18037818876 */
-- 
2.43.0

