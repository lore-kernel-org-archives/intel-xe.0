Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC45CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 06:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAD810E66D;
	Mon, 18 May 2026 06:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PxvJSPsR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF15F10E5B7;
 Mon, 18 May 2026 06:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779085187; x=1810621187;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IdRnxShBV3d/U9wRyHHz8WlMK7Ikrri4YVqpMxVl3z8=;
 b=PxvJSPsRSfyIcH4pHPvMlKphHNZ5i2yvKp6zJ8L3rUxad9b0y5BbnMWO
 bNB/Jl33C4YaebXNKIo4aif3Qo2ASLEK0ayJoOd1wT3AiILng09Ks3NcA
 ezl1dYG2V12Vm9kAQAgFIfIpSksp6Z3QISnDtISouLCbOOEEY9+PNu2RS
 WX1M5/4Z/RPDQHS46uoC3SBrHGaB3zJ5kJw3+C2Iu4OOSqcCK4rgyJxNu
 vADz3LhcGMsUdrTcKOPqk9edkQViclX1YBUIER5aHQIygbq2ds7GWfvWi
 qobK1ue842YX23Dt13P/gtJn+z6qS7q21W9SxJ0D5ywWNoOzvmqzC54XN g==;
X-CSE-ConnectionGUID: A1yyt83jRL+euibbEFFRGA==
X-CSE-MsgGUID: 29bgtWneTgyXBUuKKtHtfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="67458527"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="67458527"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 23:19:47 -0700
X-CSE-ConnectionGUID: InnbjboHSWKzQ/p0zVPYlA==
X-CSE-MsgGUID: k0bhEuRaQhup1B4vym4n+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="244311984"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 23:19:46 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH] drm/i915/display: use set_context_latency for DSB W2-line
 waits
Date: Mon, 18 May 2026 11:35:22 +0530
Message-ID: <20260518060522.2945720-1-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
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

set_context_latency represents W2 window/latency lines.
Earlier, delayed and undelayed vblank coincided, so this matched the
distance from vactive end to undelayed vblank start.

After guardband optimization changes, delayed vblank start can move
away from undelayed vblank. In DSB non-VRR paths, the older
intel_mode_vblank_delay() is still used in some code paths.

Fix this by using set_context_latency directly for W2-line waits.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index fec8a56e21ea..8521f5969aca 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -745,6 +745,7 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
 		intel_pre_commit_crtc_state(state, crtc);
 	int latency = intel_usecs_to_scanlines(&crtc_state->hw.adjusted_mode,
 					       intel_dsb_arm_exec_time_us());
+	int vblank_delay = crtc_state->set_context_latency;
 	int start, end;
 
 	/*
@@ -760,7 +761,6 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
 		intel_dsb_emit_wait_dsl(dsb, DSB_OPCODE_WAIT_DSL_OUT, 0, 0);
 
 	if (pre_commit_is_vrr_active(state, crtc) && crtc_state->vrr.dc_balance.enable) {
-		int vblank_delay = crtc_state->set_context_latency;
 		int vmin_vblank_start, vmax_vblank_start;
 
 		vmin_vblank_start = intel_vrr_dcb_vmin_vblank_start_next(crtc_state);
@@ -789,8 +789,6 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
 		start = end - vblank_delay - latency;
 		intel_dsb_wait_scanline_out(state, dsb, start, end);
 	} else if (pre_commit_is_vrr_active(state, crtc)) {
-		int vblank_delay = crtc_state->set_context_latency;
-
 		end = intel_vrr_vmin_vblank_start(crtc_state);
 		start = end - vblank_delay - latency;
 		intel_dsb_wait_scanline_out(state, dsb, start, end);
@@ -799,8 +797,6 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
 		start = end - vblank_delay - latency;
 		intel_dsb_wait_scanline_out(state, dsb, start, end);
 	} else {
-		int vblank_delay = intel_mode_vblank_delay(&crtc_state->hw.adjusted_mode);
-
 		end = intel_mode_vblank_start(&crtc_state->hw.adjusted_mode);
 		start = end - vblank_delay - latency;
 		intel_dsb_wait_scanline_out(state, dsb, start, end);
@@ -889,7 +885,7 @@ void intel_dsb_wait_for_delayed_vblank(struct intel_atomic_state *state,
 		intel_pre_commit_crtc_state(state, crtc);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
-	int wait_scanlines;
+	int wait_scanlines = crtc_state->set_context_latency + 1;
 
 	if (pre_commit_is_vrr_active(state, crtc)) {
 		/*
@@ -912,9 +908,6 @@ void intel_dsb_wait_for_delayed_vblank(struct intel_atomic_state *state,
 		 * scanline until the delayed vblank occurs after
 		 * TRANS_PUSH has been written.
 		 */
-		wait_scanlines = crtc_state->set_context_latency + 1;
-	} else {
-		wait_scanlines = intel_mode_vblank_delay(adjusted_mode);
 	}
 
 	intel_dsb_wait_usec(dsb, intel_scanlines_to_usecs(adjusted_mode, wait_scanlines));
-- 
2.45.2

