Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE711606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FBD2FqTi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4439112AA1;
	Fri, 23 Oct 2026 10:01:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E360112A9E;
 Fri, 23 Oct 2026 10:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792749669; x=1824285669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jA4kZ/YVrsciEPpdYezkywCI0T31sLaDE7PTVG2kTBc=;
 b=FBD2FqTidljIFG5+f5wcUvxOUDjZZTTUND9AQ/OHmXryWg1gM/bcG9va
 BGr/Blpn9ZP8KS90Mz4g5F57CvneVGIZ6JEYNtS+aM2j8Hbbq1FSjXO+4
 akHtOHYPWpMrsygOqaqExrvCUYTQYisvO+saH4Zf3R4d4P3snVKqi0wAx
 61PlY8N1n5D0yt74JC06mfnYqzpxF2eKPDHk9D66b6knvq6Zq8QMi6dLI
 5VSRw5JxzgAkV3tL81TPaSJMWETGTvSTRMxcqerGrFDLQZd4O7Tsp3xEI
 +oqr3kiaMF2LldoyZRcn2iy0b5YqIzPud157IVtLlq2F9HwXesLU9hSjD w==;
X-CSE-ConnectionGUID: hmZkijL1TXmrDd+KOen4nw==
X-CSE-MsgGUID: 5v4pnoSmTCijni4utxTbew==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1384283"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1384283"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 03:01:07 -0700
X-CSE-ConnectionGUID: a24AEV3FRzC7N3yx9YbpOg==
X-CSE-MsgGUID: iBnYGxlJTNyJRmTvyh4J9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3932746"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 03:01:06 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH v3 8/9] drm/i915/psr: Allow Panel Replay and PSR2 with joiner
Date: Fri, 23 Oct 2026 10:00:51 +0000
Message-ID: <20261023100052.683192-9-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023100052.683192-1-mika.kahola@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index f1d52c39d8834..288836d4a993c 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1598,6 +1598,13 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
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
@@ -1745,8 +1752,8 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 
 	/* Remaining checks are for eDP only */
 
-	if (to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_A &&
-	    to_intel_crtc(crtc_state->uapi.crtc)->pipe != PIPE_B)
+	/* Every joined pipe needs its own PSR/Panel Replay register block. */
+	if (intel_crtc_joined_pipe_mask(crtc_state) & ~(BIT(PIPE_A) | BIT(PIPE_B)))
 		return false;
 
 	/* 128b/132b Panel Replay is not supported on eDP */
@@ -1890,17 +1897,6 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
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
@@ -1912,6 +1908,14 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
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
@@ -4755,6 +4759,10 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
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

