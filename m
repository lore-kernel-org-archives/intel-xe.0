Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D56C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 16:16:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EC310EAAD;
	Tue, 21 Jul 2026 16:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA/0MB/2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCB110E71D;
 Tue, 21 Jul 2026 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784650585; x=1816186585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fJBrB0YjY57PnBeIZ4XYpFNOK8lMk8shU9dx0kWCxzQ=;
 b=JA/0MB/2zbe7MXV+8vRpOj7iWAFh2SOfu0tlnnETuTlV2zRM6zRH9pUT
 vHFYADcUs9Sb0xZlMwkdp0n/3kHcKbada7MgGkKyX5J+Wh+Ft7XLcPnqL
 jXAdrh62VIY9RXG9veImNe42uZ2BfVfR3w4Klq4JvcXqE/axqgKehkrhk
 t4B6SUl3RYpRLkEYK33KXqPh42b4ANLLRmOuOQzYInXEPIi0+fpQQWroA
 +x0lDiuoyiVnql++ksGw2G7K1hx8hX/Lc9IO6Nw6Uerf5NkRodjb5H+fc
 NR+oyapWOj7aYvCEE7oJaDI+EdVoZ6ccj9jp0E23KHIOVxXOio4ZcEfNG Q==;
X-CSE-ConnectionGUID: fFxjonxnQHicaDnFxew9/w==
X-CSE-MsgGUID: MaAAV2lESbS3LYIRN/eVug==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="95853562"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="95853562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 09:16:25 -0700
X-CSE-ConnectionGUID: Wjb9MdaFSla87gRHeVuqqA==
X-CSE-MsgGUID: nmWA4vEaRQuVRuJVfpxKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="253904863"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa010.fm.intel.com with ESMTP; 21 Jul 2026 09:16:23 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v5 6/9] drm/i915/vrr: Compute CMRR fractional timings
 generically
Date: Tue, 21 Jul 2026 21:35:52 +0530
Message-ID: <20260721160556.3144646-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260721160556.3144646-1-mitulkumar.ajitkumar.golani@intel.com>
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

--v4:
- Update cmrr_n calculation to aviod aggressive dithering
- Use div64_u64 to truncate value to floor value, as DIV_ROUND_UP_ULL
rounding to ceil value.
- Add TODO comment at cmrr_n calculation
- Add condition for custom refresh rate request
- Update CMRR computational comment block in copute config

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 137 ++++++++++++-----------
 1 file changed, 71 insertions(+), 66 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 2cf60f116a09..bcb8d5ff829a 100644
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
@@ -191,69 +188,79 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
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
-
-static
-void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
-{
 	/*
-	 * TODO: Compute precise target refresh rate to determine
-	 * if video_mode_required should be true. Currently set to
-	 * false due to uncertainty about the precise target
-	 * refresh Rate.
+	 * A 1:1 ratio (denominator == 1000) means no video timing is required
+	 * Any other ratio (e.g. 1000/1001) requires the video timing.
 	 */
-	crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state, false);
-	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
-	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
+	video_mode = crtc->force_cmrr.denominator != 1000;
+	if (video_mode) {
+		rr_multiplier = 1000;
+		rr_divider = 1001;
+	} else if (crtc->force_cmrr.numerator == current_refresh_rate * 1000) {
+		drm_dbg_kms(display->drm,
+			    "[CRTC:%d:%s] Requested mode refresh rate %d Hz can be driven without CMRR\n",
+				crtc->base.base.id, crtc->base.name,
+				requested_refresh_rate);
+		return;
+	}
 
-	crtc_state->vrr.cmrr.enable = true;
-	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+	/*
+	 * Let pixel_clock_hz = adjusted_mode->crtc_clock * 1000.
+	 *
+	 * cmrr_n = (numerator_mHz x htotal x rr_multiplier) / 1000
+	 * cmrr_m = (pixel_clock_hz x rr_divider) % cmrr_n
+	 *
+	 * where numerator_mHz is the requested refresh rate in milli-Hz
+	 * and rr_multiplier/rr_divider = 1000/1001 when the video timing
+	 * is required, else 1/1. The integer vtotal term is tracked in SW
+	 * (it is the programmed mode vtotal) while the fractional part
+	 * represented by cmrr_m/cmrr_n is tracked in HW.
+	 *
+	 * TODO: Using the actual desired rate for cmrr_n in video
+	 * mode produces more aggressive vtotal dithering than
+	 * expected; revisit once the Bspec algorithm is clarified.
+	 */
+	crtc_state->vrr.cmrr.cmrr_n =
+		div64_u64((u64)crtc->force_cmrr.numerator *
+			   adjusted_mode->crtc_htotal * rr_multiplier, 1000);
+	dividend = (u64)adjusted_mode->crtc_clock * rr_divider * 1000;
+	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
+						   crtc_state->vrr.cmrr.cmrr_n,
+						   &crtc_state->vrr.cmrr.cmrr_m);
 }
 
 static
@@ -429,8 +436,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
-	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	bool is_edp = intel_dp_is_edp(intel_dp);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int vmin, vmax;
 
@@ -464,12 +469,17 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
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
@@ -1136,11 +1146,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 
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

