Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFF6C98309
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 12:00:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04FD10F00B;
	Wed, 23 Sep 2026 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQEEPdgN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0760510F006;
 Wed, 23 Sep 2026 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790164830; x=1821700830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RiEGIBSlHetG6q4spG6s4fqN6dK4yI0PK0xkHt0pfog=;
 b=hQEEPdgN3XWpy8pMaDYhmWIE5nWtsCSOXklk+Zd1aoEhv78EBF7TR6BR
 l+3dLQOxlmgSwjl56xaXZgjSwKViVn+iJ4AfzdRBLQ0LkJJd12APi8vIH
 mDSGuveSQhYK++qZLa0cRB8ddMGA+bb93oG/oXpuKyO1PJmd4GexAIDtQ
 lohq9OcAA0m8zfAt+C9RQ4t/SFa9U/rKPwhL0KOc7NYRNxWUB8LscsHii
 1NovXrBCDKiAC7AT4FDlIG2abfiCFWPpf5IKt1MXP+jC64PZLvCJQJoy4
 JG8HX4YqYVCWdBubpGKga/hIUVEdUhEZfDLs82uiyiGvEIGrjTTeo8+iR A==;
X-CSE-ConnectionGUID: beREUdQUQzGlwmb3IiQ3yw==
X-CSE-MsgGUID: vZF+yWouS2+oy8YYWvOTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90965154"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="90965154"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 04:59:49 -0700
X-CSE-ConnectionGUID: 94vrxPCYQySwAVl6OaKf7w==
X-CSE-MsgGUID: nmgxOrK1RRSLUL2y1UUG9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4665833"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 04:59:49 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com,
	Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH] drm/i915/psr: Allow Panel Replay and PSR2 with joiner
Date: Wed, 23 Sep 2026 11:59:40 +0000
Message-ID: <20260923115941.746934-5-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923115941.746934-1-mika.kahola@intel.com>
References: <20260923115941.746934-1-mika.kahola@intel.com>
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

Each joined pipe has its own PSR register block, so Panel Replay and
PSR2 selective update work with the pipe A/B joiner. Plain PSR1 does
not, keep rejecting that.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 73 ++++++++++++++++++++----
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 4743b5b91743..c830332b33f2 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1587,6 +1587,50 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	return true;
 }
 
+/*
+ * Joiner needs a per-pipe PSR/Panel Replay register block, only
+ * supported on pipe A/B.
+ */
+static bool psr_joiner_config_valid(struct intel_dp *intel_dp,
+				    const struct intel_crtc_state *crtc_state,
+				    const char *what)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (!crtc_state->joiner_pipes)
+		return true;
+
+	if (crtc_state->joiner_pipes & ~(BIT(PIPE_A) | BIT(PIPE_B))) {
+		drm_dbg_kms(display->drm,
+			    "%s not enabled, joiner only supported on pipe A/B\n", what);
+		return false;
+	}
+
+	return true;
+}
+
+/*
+ * PSR2 selective fetch and Panel Replay Selective Update share the same
+ * joiner limits, plus no uncompressed joiner configuration in YUV 4:2:0.
+ */
+static bool psr2_joiner_config_valid(struct intel_dp *intel_dp,
+				     const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	if (!psr_joiner_config_valid(intel_dp, crtc_state, "Selective update"))
+		return false;
+
+	if (crtc_state->joiner_pipes && !crtc_state->dsc.compression_enable &&
+	    crtc_state->output_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
+		drm_dbg_kms(display->drm,
+			    "Selective update not enabled, uncompressed joiner does not support YUV 4:2:0\n");
+		return false;
+	}
+
+	return true;
+}
+
 static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
 					  struct drm_connector_state *conn_state)
 {
@@ -1594,6 +1638,9 @@ static bool intel_sel_update_config_valid(struct intel_crtc_state *crtc_state,
 	struct intel_dp *intel_dp = intel_attached_dp(connector);
 	struct intel_display *display = to_intel_display(intel_dp);
 
+	if (!psr2_joiner_config_valid(intel_dp, crtc_state))
+		goto unsupported;
+
 	if (HAS_PSR2_SEL_FETCH(display) &&
 	    !intel_psr2_sel_fetch_config_valid(intel_dp, crtc_state) &&
 	    !HAS_PSR_HW_TRACKING(display)) {
@@ -1733,6 +1780,9 @@ static bool _panel_replay_compute_config(struct intel_crtc_state *crtc_state,
 		return false;
 	}
 
+	if (!psr_joiner_config_valid(intel_dp, crtc_state, "Panel Replay"))
+		return false;
+
 	crtc_state->link_off_after_as_sdp_when_pr_active = compute_link_off_after_as_sdp_when_pr_active(connector);
 	crtc_state->disable_as_sdp_when_pr_active = compute_disable_as_sdp_when_pr_active(connector);
 
@@ -1886,17 +1936,6 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
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
@@ -1908,6 +1947,14 @@ void intel_psr_compute_config(struct intel_dp *intel_dp,
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
@@ -4728,6 +4775,10 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
 		crtc_state->has_sel_update = false;
 		crtc_state->enable_psr2_su_region_et = false;
 		crtc_state->enable_psr2_sel_fetch = false;
+
+		/* Plain PSR1 is not supported with joiner. */
+		if (crtc_state->joiner_pipes)
+			crtc_state->has_psr = false;
 	}
 
 	/* Wa_18037818876 */
