Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DBECD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 14:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8E510F453;
	Mon,  8 Jun 2026 14:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NhuSUjZQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831B410F452;
 Mon,  8 Jun 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780927941; x=1812463941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IDamyXpLBmJF3+gwTmGGaZjpT+TmkaIWHl+Y5S5HoJw=;
 b=NhuSUjZQ8MLZevvVCOCJeykMNT5EkFJFH3ZNpauMf1vIHI7ENVQ60CAz
 nwZi0/d7ARZ9Gzb0zm/VcRalefRdPFmTHB8OcG1Ng6B1BdSIzfFBs1jr4
 NzIixiy6nqY1x9A/5w6olvfQ3HDIsEBSdvK0/rkCPHlepo1CbVLxdR6Tk
 iUwP0r4Xpp4tqn5VompaExgQArgJbl7XgPoXfWeTc3bnLGFAVOjh93Grs
 Gws8/d/pAY909EL0SUR3V+N2tJEZbIAVep3i0514nOit3oAxErHrskpjc
 JIL66EmPifIPhQoEop4F7bwUNuGrk+XPKoYEc6JfI6nPSdLO+CYIXKSKY g==;
X-CSE-ConnectionGUID: JnQOejtzQgG+1gYTnzmGPw==
X-CSE-MsgGUID: G4PUGhAFTf+qphT2/QeseQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="81781302"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="81781302"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:21 -0700
X-CSE-ConnectionGUID: vHjlC0EDQl6SMzM1rDnLcQ==
X-CSE-MsgGUID: 1Kie6jQWSpiJ8zYGp7VhKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; d="scan'208";a="241113704"
Received: from carterle-desk.ger.corp.intel.com (HELO
 jhogande-mobl3.intel.com) ([10.245.246.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 07:12:19 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 3/7] drm/i915/display: Rename compression_enabled_on_link and
 link_dsc_pipes
Date: Mon,  8 Jun 2026 17:11:20 +0300
Message-ID: <20260608141124.144878-4-jouni.hogander@intel.com>
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

Compression_enabled_on_link is really about FEC being enabled on link and
link_dsc_pipes about pipes where FEC is enabled. We are about to use
existing mechanism to enabled FEC for DP Panel Replay:
rename compression_enabled_on_link as fec_enabled_on_link and
link_dsc_pipes as link_fec_pipes.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c     |  2 +-
 .../gpu/drm/i915/display/intel_display_types.h   |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c          |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c      | 16 ++++++++--------
 drivers/gpu/drm/i915/display/intel_link_bw.c     | 16 ++++++++--------
 drivers/gpu/drm/i915/display/intel_link_bw.h     |  2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c        |  6 +++---
 7 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 8e269b71f18e4..cef85f1b0b16e 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4712,7 +4712,7 @@ intel_modeset_pipe_config(struct intel_atomic_state *state,
 	if (ret)
 		return ret;
 
-	crtc_state->dsc.compression_enabled_on_link = limits->link_dsc_pipes & BIT(crtc->pipe);
+	crtc_state->dsc.fec_enabled_on_link = limits->link_fec_pipes & BIT(crtc->pipe);
 	crtc_state->max_link_bpp_x16 = limits->max_bpp_x16[crtc->pipe];
 
 	if (crtc_state->pipe_bpp > fxp_q4_to_int(crtc_state->max_link_bpp_x16)) {
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c21e0c0ef0b12..ef112d8cca598 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1335,7 +1335,7 @@ struct intel_crtc_state {
 	/* Display Stream compression state */
 	struct {
 		/* Only used for state computation, not read out from the HW. */
-		bool compression_enabled_on_link;
+		bool fec_enabled_on_link;
 		bool compression_enable;
 		struct intel_dsc_slice_config {
 			int pipes_per_line;
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 85d3aa3b9894c..0bbbdf10c427d 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -2494,7 +2494,7 @@ bool intel_dp_needs_8b10b_fec(const struct intel_crtc_state *crtc_state,
 	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP))
 		return false;
 
-	return dsc_enabled_on_crtc || intel_dsc_enabled_on_link(crtc_state);
+	return dsc_enabled_on_crtc || intel_fec_enabled_on_link(crtc_state);
 }
 
 void intel_dp_dsc_reset_config(struct intel_crtc_state *crtc_state)
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index bcdc504913471..f96f26067ab71 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -825,14 +825,14 @@ static u8 get_pipes_downstream_of_mst_port(struct intel_atomic_state *state,
 	return mask;
 }
 
-static int intel_dp_mst_check_dsc_change(struct intel_atomic_state *state,
+static int intel_dp_mst_check_fec_change(struct intel_atomic_state *state,
 					 struct drm_dp_mst_topology_mgr *mst_mgr,
 					 struct intel_link_bw_limits *limits)
 {
 	struct intel_display *display = to_intel_display(state);
 	struct intel_crtc *crtc;
 	u8 mst_pipe_mask;
-	u8 dsc_pipe_mask = 0;
+	u8 fec_pipe_mask = 0;
 	int ret;
 
 	mst_pipe_mask = get_pipes_downstream_of_mst_port(state, mst_mgr, NULL);
@@ -845,16 +845,16 @@ static int intel_dp_mst_check_dsc_change(struct intel_atomic_state *state,
 		if (drm_WARN_ON(display->drm, !crtc_state))
 			return -EINVAL;
 
-		if (intel_dsc_enabled_on_link(crtc_state))
-			dsc_pipe_mask |= BIT(crtc->pipe);
+		if (intel_fec_enabled_on_link(crtc_state))
+			fec_pipe_mask |= BIT(crtc->pipe);
 	}
 
-	if (!dsc_pipe_mask || mst_pipe_mask == dsc_pipe_mask)
+	if (!fec_pipe_mask || mst_pipe_mask == fec_pipe_mask)
 		return 0;
 
-	limits->link_dsc_pipes |= mst_pipe_mask;
+	limits->link_fec_pipes |= mst_pipe_mask;
 
-	ret = intel_modeset_pipes_in_mask_early(state, "MST DSC",
+	ret = intel_modeset_pipes_in_mask_early(state, "MST FEC",
 						mst_pipe_mask);
 
 	return ret ? : -EAGAIN;
@@ -908,7 +908,7 @@ int intel_dp_mst_atomic_check_link(struct intel_atomic_state *state,
 	int i;
 
 	for_each_new_mst_mgr_in_state(&state->base, mgr, mst_state, i) {
-		ret = intel_dp_mst_check_dsc_change(state, mgr, limits);
+		ret = intel_dp_mst_check_fec_change(state, mgr, limits);
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.c b/drivers/gpu/drm/i915/display/intel_link_bw.c
index b47474a3e9fec..83544bb13616e 100644
--- a/drivers/gpu/drm/i915/display/intel_link_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_link_bw.c
@@ -56,7 +56,7 @@ void intel_link_bw_init_limits(struct intel_atomic_state *state,
 	struct intel_display *display = to_intel_display(state);
 	enum pipe pipe;
 
-	limits->link_dsc_pipes = 0;
+	limits->link_fec_pipes = 0;
 	limits->bpp_limit_reached_pipes = 0;
 	for_each_pipe(display, pipe) {
 		struct intel_crtc *crtc = intel_crtc_for_pipe(display, pipe);
@@ -66,8 +66,8 @@ void intel_link_bw_init_limits(struct intel_atomic_state *state,
 
 		if (state->base.duplicated && crtc_state) {
 			limits->max_bpp_x16[pipe] = crtc_state->max_link_bpp_x16;
-			if (intel_dsc_enabled_on_link(crtc_state))
-				limits->link_dsc_pipes |= BIT(pipe);
+			if (intel_fec_enabled_on_link(crtc_state))
+				limits->link_fec_pipes |= BIT(pipe);
 		} else {
 			limits->max_bpp_x16[pipe] = INT_MAX;
 		}
@@ -266,10 +266,10 @@ assert_link_limit_change_valid(struct intel_display *display,
 	bool bpps_changed = false;
 	enum pipe pipe;
 
-	/* DSC can't be disabled after it was enabled. */
+	/* FEC can't be disabled after it was enabled. */
 	if (drm_WARN_ON(display->drm,
-			(old_limits->link_dsc_pipes & new_limits->link_dsc_pipes) !=
-			old_limits->link_dsc_pipes))
+			(old_limits->link_fec_pipes & new_limits->link_fec_pipes) !=
+			old_limits->link_fec_pipes))
 		return false;
 
 	for_each_pipe(display, pipe) {
@@ -287,8 +287,8 @@ assert_link_limit_change_valid(struct intel_display *display,
 	/* At least one limit must change. */
 	if (drm_WARN_ON(display->drm,
 			!bpps_changed &&
-			new_limits->link_dsc_pipes ==
-			old_limits->link_dsc_pipes))
+			new_limits->link_fec_pipes ==
+			old_limits->link_fec_pipes))
 		return false;
 
 	return true;
diff --git a/drivers/gpu/drm/i915/display/intel_link_bw.h b/drivers/gpu/drm/i915/display/intel_link_bw.h
index cb18e171037cf..7404d2ba1b96b 100644
--- a/drivers/gpu/drm/i915/display/intel_link_bw.h
+++ b/drivers/gpu/drm/i915/display/intel_link_bw.h
@@ -15,7 +15,7 @@ struct intel_connector;
 struct intel_crtc_state;
 
 struct intel_link_bw_limits {
-	u8 link_dsc_pipes;
+	u8 link_fec_pipes;
 	u8 bpp_limit_reached_pipes;
 	/* in 1/16 bpp units */
 	int max_bpp_x16[I915_MAX_PIPES];
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index 35c93fcbb6427..b8f3448ce96be 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -427,7 +427,7 @@ int intel_dsc_compute_params(struct intel_crtc_state *pipe_config)
 
 void intel_dsc_enable_on_crtc(struct intel_crtc_state *crtc_state)
 {
-	crtc_state->dsc.compression_enabled_on_link = true;
+	crtc_state->dsc.fec_enabled_on_link = true;
 	crtc_state->dsc.compression_enable = true;
 }
 
@@ -436,9 +436,9 @@ bool intel_fec_enabled_on_link(const struct intel_crtc_state *crtc_state)
 	struct intel_display *display = to_intel_display(crtc_state);
 
 	drm_WARN_ON(display->drm, crtc_state->dsc.compression_enable &&
-		    !crtc_state->dsc.compression_enabled_on_link);
+		    !crtc_state->dsc.fec_enabled_on_link);
 
-	return crtc_state->dsc.compression_enabled_on_link;
+	return crtc_state->dsc.fec_enabled_on_link;
 }
 
 enum intel_display_power_domain
-- 
2.43.0

