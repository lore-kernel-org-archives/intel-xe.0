Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A109CD8C9F
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2833210F458;
	Mon,  8 Jun 2026 14:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evLQSwL3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B3910F458;
 Mon,  8 Jun 2026 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780927946; x=1812463946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSdHfduE5zGGPIGXDLCcZoefo58hmaf7zgkJf4g2R58=;
 b=evLQSwL3gQ6LFfne6c42PL/4bOTN5udRTpTjyD46RKNj01aSyvALSAFX
 QIO2LImHADltXIP2c/4HBSNo+YMje5+FRpoZHA3+vG5F6J7rXWVb2qQHk
 JinR5YGWqOb1o0v+j0r17B/yeMGZXscD5YNycwM+Jq4BCHh8rMWVbpGTz
 YPBQu3I64HDH6mF8ncZWr+VL/wFF2g8QWahXc/Kgu611S4rrz6qgXnB3E
 /N45ujf4aVNfEQFOwoiolf0ZqQb1/+vSi16EwelYFBKvT/z89c/1LcL6S
 Saij/tAxDrQSXtmYOek1VDIXaZpwwcvBwR24luR1AxRKFbWOUQb8yRpdU A==;
X-CSE-ConnectionGUID: I6vW5i2BTOy+8QLYCaw+2Q==
X-CSE-MsgGUID: m6+aNSWVQaqZRHmf7f2EKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81781320"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81781320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:26 -0700
X-CSE-ConnectionGUID: 8YQo9jdvTq6lrZQ8GCfviw==
X-CSE-MsgGUID: NmeHfQ80Qsq+/tCft7MuLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241113738"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:24 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 6/7] drm/i915/psr: Add PSR specific pre compute config
Date: Mon,  8 Jun 2026 17:11:23 +0300
Message-ID: <20260608141124.144878-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608141124.144878-1-jouni.hogander@intel.com>
References: <20260608141124.144878-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add _psr_pre_compute_config and move everything possible into it to unify
how Panel Replay and PSR compute config is implemented.

While changing this re-order psr_pre_compute_config a bit as well:

It is confusing to see "PSR disabled due to joiner" on a setup that doesn't
even support PSR or Panel Replay. Move checks for joiner and interlaced
mode after support for PSR/Panel Replay support is checked.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 39 +++++++++++++++++-------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index a61fa9d0ff82c..0cd183ffb0f91 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1779,9 +1779,6 @@ static bool _psr_compute_config(struct intel_dp *intel_dp,
 	const struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int entry_setup_frames;
 
-	if (!CAN_PSR(intel_dp) || !display->params.enable_psr)
-		return false;
-
 	/*
 	 * Currently PSR doesn't work reliably with VRR enabled.
 	 */
@@ -1907,6 +1904,15 @@ static bool _panel_replay_pre_compute_config(struct intel_dp *intel_dp,
 	return true;
 }
 
+static bool _psr_pre_compute_config(struct intel_dp *intel_dp,
+				    struct intel_crtc_state *crtc_state,
+				    struct drm_connector_state *conn_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	return CAN_PSR(intel_dp) && display->params.enable_psr;
+}
+
 static bool intel_psr_needs_wa_18037818876(struct intel_dp *intel_dp,
 					   struct intel_crtc_state *crtc_state)
 {
@@ -1952,19 +1958,30 @@ void intel_psr_pre_compute_config(struct intel_dp *intel_dp,
 
 	if (!psr_global_enabled(intel_dp)) {
 		drm_dbg_kms(display->drm, "PSR disabled by flag\n");
-		return;
+		goto out_psr_disable;
 	}
 
 	if (intel_dp->psr.sink_not_reliable) {
 		drm_dbg_kms(display->drm,
 			    "PSR sink implementation is not reliable\n");
-		return;
+		goto out_psr_disable;
 	}
 
+	crtc_state->has_psr = crtc_state->has_panel_replay =
+		_panel_replay_pre_compute_config(intel_dp, crtc_state,
+						 conn_state);
+
+	if (!crtc_state->has_psr)
+		crtc_state->has_psr = _psr_pre_compute_config(intel_dp, crtc_state,
+							      conn_state);
+
+	if (!crtc_state->has_psr)
+		goto out_psr_disable;
+
 	if (adjusted_mode->flags & DRM_MODE_FLAG_INTERLACE) {
 		drm_dbg_kms(display->drm,
 			    "PSR condition failed: Interlaced mode enabled\n");
-		return;
+		goto out_psr_disable;
 	}
 
 	/*
@@ -1975,13 +1992,13 @@ void intel_psr_pre_compute_config(struct intel_dp *intel_dp,
 	if (crtc_state->joiner_pipes) {
 		drm_dbg_kms(display->drm,
 			    "PSR disabled due to joiner\n");
-		return;
+		goto out_psr_disable;
 	}
 
-	crtc_state->has_psr = true;
-	crtc_state->has_panel_replay =
-		_panel_replay_pre_compute_config(intel_dp, crtc_state,
-						 conn_state);
+	return;
+
+out_psr_disable:
+	crtc_state->has_psr = crtc_state->has_panel_replay = false;
 }
 
 void intel_psr_compute_config(struct intel_dp *intel_dp,
-- 
2.43.0

