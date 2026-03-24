Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D15F54ABA
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 13:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 129BD10E6E3;
	Tue, 24 Mar 2026 13:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faGia5t+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824AC10E6E3;
 Tue, 24 Mar 2026 13:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774360168; x=1805896168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sF0Dncp6QEfvuMX5CVFBgsDOcxf5K+GxDanHwnwi5+E=;
 b=faGia5t+YR+hL+gMSN31HkvDm7v++V8OtXzFYvrqlLE0aGHte6zDF+Df
 JZhubWcOQi9eC+4+fFM/EY3e9u7BhbkzE/Evb4KQwy2U+q6BNqFVDMAiP
 iBLs/X3iLQEzGYa5o1FJS2A+evd8ESJMnL+kqMxI8FJZDQvHpiYGvmTHN
 aZmVsUbA8TMonxyymCx1kozT6DZqGmAXtmbmnJx/NeHpkdYhystlbUaJt
 edKf3+E9R8XUou3+Ejcm3LI/Oi+bszvxyLt1l/+IgpZWCwAoOwOd03fEA
 vFcnPHcZOlKi3W/CCw7zxjqNzEPKR+r1pJgNyfsYQINV2x5jkpWYLY6GI w==;
X-CSE-ConnectionGUID: TTFp77r6R4S9XTQ1fMObdA==
X-CSE-MsgGUID: 1fHPdL1gT6G9L1pv5IWa8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100819051"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="100819051"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:49:28 -0700
X-CSE-ConnectionGUID: CEJTX7OQR9O6z3Wg1Sf5eQ==
X-CSE-MsgGUID: urpiQTVbT8yt61EHVfoZdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229105230"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.220])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 06:49:26 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 9/9] drm/i915/wm: Allow SAGV with multiple pipes on pre-icl
Date: Tue, 24 Mar 2026 15:48:43 +0200
Message-ID: <20260324134843.2364-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
References: <20260324134843.2364-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

There was never any documented reason for limiting SAGV to
single active pipe configuration on pre-icl. Allow SAGV
with multiple active pipes.

At least my CFL NUC seems happy with this when using
multiple displays. The machine actually has working
SAGV because the memory clock can be observed changing
via SA_PERF_STATUS/mchbar:0x5918.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_bw.c | 40 -------------------------
 1 file changed, 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 07b4531a4376..bf7683ddcb67 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -28,9 +28,6 @@ struct intel_bw_state {
 	 */
 	u8 pipe_sagv_reject;
 
-	/* bitmask of active pipes */
-	u8 active_pipes;
-
 	/*
 	 * From MTL onwards, to lock a QGV point, punit expects the peak BW of
 	 * the selected QGV point as the parameter in multiples of 100MB/s
@@ -1265,31 +1262,6 @@ static int intel_bw_check_data_rate(struct intel_atomic_state *state, bool *chan
 	return 0;
 }
 
-static int intel_bw_modeset_checks(struct intel_atomic_state *state)
-{
-	const struct intel_bw_state *old_bw_state;
-	struct intel_bw_state *new_bw_state;
-	int ret;
-
-	if (!intel_any_crtc_active_changed(state))
-		return 0;
-
-	new_bw_state = intel_atomic_get_bw_state(state);
-	if (IS_ERR(new_bw_state))
-		return PTR_ERR(new_bw_state);
-
-	old_bw_state = intel_atomic_get_old_bw_state(state);
-
-	new_bw_state->active_pipes =
-		intel_calc_active_pipes(state, old_bw_state->active_pipes);
-
-	ret = intel_atomic_lock_global_state(&new_bw_state->base);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int intel_bw_check_sagv_mask(struct intel_atomic_state *state)
 {
 	struct intel_display *display = to_intel_display(state);
@@ -1346,10 +1318,6 @@ int intel_bw_atomic_check(struct intel_atomic_state *state)
 	if (DISPLAY_VER(display) < 9)
 		return 0;
 
-	ret = intel_bw_modeset_checks(state);
-	if (ret)
-		return ret;
-
 	ret = intel_bw_check_sagv_mask(state);
 	if (ret)
 		return ret;
@@ -1410,7 +1378,6 @@ void intel_bw_update_hw_state(struct intel_display *display)
 	if (DISPLAY_VER(display) < 9)
 		return;
 
-	bw_state->active_pipes = 0;
 	bw_state->pipe_sagv_reject = 0;
 
 	for_each_intel_crtc(display->drm, crtc) {
@@ -1418,9 +1385,6 @@ void intel_bw_update_hw_state(struct intel_display *display)
 			to_intel_crtc_state(crtc->base.state);
 		enum pipe pipe = crtc->pipe;
 
-		if (crtc_state->hw.active)
-			bw_state->active_pipes |= BIT(pipe);
-
 		if (DISPLAY_VER(display) >= 11)
 			intel_bw_crtc_update(bw_state, crtc_state);
 
@@ -1504,10 +1468,6 @@ bool intel_bw_pmdemand_needs_update(struct intel_atomic_state *state)
 bool intel_bw_can_enable_sagv(struct intel_display *display,
 			      const struct intel_bw_state *bw_state)
 {
-	if (DISPLAY_VER(display) < 11 &&
-	    bw_state->active_pipes && !is_power_of_2(bw_state->active_pipes))
-		return false;
-
 	return bw_state->pipe_sagv_reject == 0;
 }
 
-- 
2.52.0

