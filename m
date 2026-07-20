Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A743BC4452A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E6810E85E;
	Mon, 20 Jul 2026 09:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YECALXUL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D222C10E844;
 Mon, 20 Jul 2026 09:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784538731; x=1816074731;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZAhdd9owW6AlvTKlBEGQvORBdrE21WIAMAgpeBd8f6E=;
 b=YECALXULUfqpsrD8vT69nJN2ie0MLbHP9FLPLTaMg4C6DbaQifvb0wkC
 a+9FBnMyrnF2sxqNqqt2EKBdo1Qn3OglZqq9zvYUrv6BigDVRBhmKv2bT
 re2vMOMmQq3Q6UptYxf3DZZ1LZit5QVaaddBeXzEq6dqnG2CKRRMPhs+Z
 Icp0Kp/aQ5lBMR4froLdsLDeUGUMw83+r0TXW+aVDxtaw9CUuciHKsd3t
 4cn++vROqdY8gdxKTkWtM9TZkTH/3lpjeU3seox+Ea4psqkU9eHlctAdF
 4u3J+qszngujqKGpt9jHlgCdmmqq7Hi0d5n/+ZpN9ACu8mxaPidTMvgrI A==;
X-CSE-ConnectionGUID: XQq0zEu4RZCrrEEZvF+u7Q==
X-CSE-MsgGUID: h4YsaC0RRo+1yLgORSM/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="102664805"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="102664805"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 02:12:10 -0700
X-CSE-ConnectionGUID: uQHgFA2AR7SQ3o50WVuKfA==
X-CSE-MsgGUID: SXPD57h/QCuhoQTc/4xXyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="260963456"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa003.jf.intel.com with ESMTP; 20 Jul 2026 02:12:09 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v4 6/9] drm/i915/vrr: Compute CMRR fractional timings
 generically
Date: Mon, 20 Jul 2026 14:31:38 +0530
Message-ID: <20260720090142.2864289-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260720090142.2864289-1-mitulkumar.ajitkumar.golani@intel.com>
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

Rework the fractional-CMRR computation into a generic,
transcoder-agnostic helper driven by an explicit per-CRTC debugfs
target, replacing the previous disabled, eDP-only code path. Compute
CMRR_M and CMRR_N timings based on the video mode requirement. Note the
CMRR enable path is wired up separately; this patch only lays down the
generic computation. Remove computing mode_flags, I915_MODE_FLAG_VRR
as we are moving CMRR to fixed refresh rate path. Also return early
from CMRR computation if existing computation is well sufficient.

--v2:
- Derive video_mode locally instead of caching it in persistent
  struct intel_crtc state (Jani, Chaitanya)
- Fix numerator unit in comment: milli-Hz, not kHz (Chaitanya)
- Fix "reqirement" typo and clarify CMRR is not yet enabled in the
  commit message (Chaitanya)
- Fix precision issue while computing M/N ration (Chaitanya)
- Multiplier_m and n naming update to increase readability. (Chaitanya)
- Compute vtotal as it is required to deither as per algo
implementation. (Chaitanya)
- Replace misleading adjusted_pixel_rate to dividend which is somewhat
relatable.

--v3:
- Mention rationale for not to compute I915_MODE_FLAG_VRR. (Chaitanya)
- Remove redundant return statement from last line of cmrr compute.
(Chaitanya)
- Correct cmrr_n calculation. (Chaitanya)
- Add early return condition is current computaion is well sufficient
to drive without CMRR. (Chaitanya)
- Take round up for requested_refresh_rate. (Validation)
- Correct integer overflow

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 133 ++++++++++++-----------
 1 file changed, 68 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 2cf60f116a09..fa9d1a57f438 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -27,9 +27,6 @@
 #include "skl_prefill.h"
 #include "skl_watermark.h"
 
-#define FIXED_POINT_PRECISION		100
-#define CMRR_PRECISION_TOLERANCE	10
-
 /*
  * Tunable parameters for DC Balance correction.
  * These are captured based on experimentations.
@@ -191,69 +188,77 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
 	return intel_vrr_vmax_vtotal(crtc_state) - crtc_state->vrr.guardband;
 }
 
-static bool
-is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
+static void
+intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
-	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	u64 dividend;
+	int requested_refresh_rate, current_refresh_rate;
+	int rr_multiplier = 1, rr_divider = 1;
+	bool video_mode;
 
-	/* Avoid CMRR for now till we have VRR with fixed timings working */
-	if (!(HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display)) || true)
-		return false;
-
-	actual_refresh_k =
-		drm_mode_vrefresh(adjusted_mode) * FIXED_POINT_PRECISION;
-	pixel_clock_per_line =
-		adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
-	calculated_refresh_k =
-		pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
-
-	if ((actual_refresh_k - calculated_refresh_k) < CMRR_PRECISION_TOLERANCE)
-		return false;
-
-	return true;
-}
-
-static unsigned int
-cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
-{
-	int multiplier_m = 1, multiplier_n = 1, vtotal, desired_refresh_rate;
-	u64 adjusted_pixel_rate;
-	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	if (!(HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display)))
+		return;
 
-	desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
+	/* No CMRR ratio configured through debugfs */
+	if (!crtc->force_cmrr.numerator)
+		return;
 
-	if (video_mode_required) {
-		multiplier_m = 1001;
-		multiplier_n = 1000;
+	/*
+	 * The numerator encodes the requested refresh rate in milli-Hz, so the
+	 * requested refresh rate in Hz is numerator / 1000. It must match the
+	 * refresh rate of the current mode.
+	 */
+	requested_refresh_rate = DIV_ROUND_UP_ULL(crtc->force_cmrr.numerator, 1000);
+	current_refresh_rate = drm_mode_vrefresh(adjusted_mode);
+
+	if (requested_refresh_rate != current_refresh_rate) {
+		drm_dbg_kms(display->drm,
+			    "[CRTC:%d:%s] CMRR requested refresh rate %d Hz does not match current mode refresh rate %d Hz\n",
+				crtc->base.base.id, crtc->base.name,
+				requested_refresh_rate, current_refresh_rate);
+		return;
 	}
 
-	crtc_state->vrr.cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
-						  multiplier_n);
-	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
-				  crtc_state->vrr.cmrr.cmrr_n);
-	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
-	crtc_state->vrr.cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->vrr.cmrr.cmrr_n);
-
-	return vtotal;
-}
+	/*
+	 * A 1:1 ratio (denominator == 1000) means no video timing is required
+	 * Any other ratio (e.g. 1000/1001) requires the video timing.
+	 */
+	video_mode = crtc->force_cmrr.denominator != 1000;
+	if (video_mode) {
+		rr_multiplier = 1000;
+		rr_divider = 1001;
+	} else {
+		drm_dbg_kms(display->drm,
+			    "[CRTC:%d:%s] Requested mode refresh rate %d Hz can be driven without CMRR\n",
+				crtc->base.base.id, crtc->base.name,
+				requested_refresh_rate);
+		return;
+	}
 
-static
-void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
-{
 	/*
-	 * TODO: Compute precise target refresh rate to determine
-	 * if video_mode_required should be true. Currently set to
-	 * false due to uncertainty about the precise target
-	 * refresh Rate.
+	 * Let pixel_clock_hz = adjusted_mode->crtc_clock * 1000.
+	 *
+	 * cmrr_n = requested_refresh_rate x htotal x rr_multiplier
+	 * cmrr_m = (pixel_clock_hz x scale_m) % cmrr_n
+	 *
+	 * where rr_multiplier/rr_divider = 1000/1001 when the
+	 * video timing is required, else 1/1. The integer vtotal
+	 * term is tracked in SW (it is the programmed mode vtotal)
+	 * while the fractional part represented by cmrr_m/cmrr_n
+	 * is tracked in HW.
 	 */
-	crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state, false);
-	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
-	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
 
-	crtc_state->vrr.cmrr.enable = true;
-	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+	crtc_state->vrr.cmrr.cmrr_n =
+		DIV_ROUND_UP_ULL((u64)crtc->force_cmrr.numerator *
+					      adjusted_mode->crtc_htotal * rr_multiplier,
+						  crtc->force_cmrr.denominator);
+	dividend = (u64)adjusted_mode->crtc_clock * rr_divider * 1000;
+	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
+						   crtc_state->vrr.cmrr.cmrr_n,
+						   &crtc_state->vrr.cmrr.cmrr_m);
 }
 
 static
@@ -429,8 +434,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
-	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	bool is_edp = intel_dp_is_edp(intel_dp);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int vmin, vmax;
 
@@ -464,12 +467,17 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 		vmax = vmin;
 	}
 
-	if (crtc_state->uapi.vrr_enabled && vmin < vmax)
+	if (crtc_state->uapi.vrr_enabled && vmin < vmax) {
 		intel_vrr_compute_vrr_timings(crtc_state, vmin, vmax);
-	else if (is_cmrr_frac_required(crtc_state) && is_edp)
-		intel_vrr_compute_cmrr_timings(crtc_state);
-	else
+	} else {
+		/*
+		 * CMRR is a fixed average Vtotal mode and is only computed on
+		 * the fixed refresh rate path. It is generic across transcoders
+		 * and gated on platform support and a valid debugfs ratio.
+		 */
+		intel_vrr_cmrr_compute_config(crtc_state);
 		intel_vrr_compute_fixed_rr_timings(crtc_state);
+	}
 
 	if (HAS_AS_SDP(display)) {
 		crtc_state->vrr.vsync_start =
@@ -1136,11 +1144,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 
 	intel_vrr_get_dc_balance_config(crtc_state);
 
-	/*
-	 * #TODO: For Both VRR and CMRR the flag I915_MODE_FLAG_VRR is set for mode_flags.
-	 * Since CMRR is currently disabled, set this flag for VRR for now.
-	 * Need to keep this in mind while re-enabling CMRR.
-	 */
 	if (crtc_state->vrr.enable)
 		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 
-- 
2.48.1

