Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA71C54F4D
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8704D10E6E9;
	Tue, 28 Jul 2026 15:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpoKd5Bg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BDB10E5A3;
 Tue, 28 Jul 2026 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251482; x=1816787482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I/1plry/2iUlcW7p43kVxGeN9TyaQxXIEiD3BalWjPc=;
 b=UpoKd5BghsVzmmvtwy8rk005BVrA6FjVD/OYhx8utzFPpT4+zlO6wmp4
 HpH4CbY3AKVLNGt6hy6mRKli8vphLck7mRvedWLwvet2EKL5U7biVDaVi
 yz2Fw0DFSOd08YLM5LP1JDImeYduYGTwTpdLC9w/Dy3Q8Mk26JnnuufTV
 3qsc9MLeGsdVCutD1bFlTmQfs/5aa2FNAEw1x7cCJy4dnG/33oLwA9R4w
 i+6cSNwRQqe+QMFdbkuZXAjKKdgjPV/5IOx19RZuC0x6VKKTGHVbdr7aa
 g6O8wA5jCFUAUXV7g8XA95RzgG4nItEOk/715I6cJse97o9Q4+ioWiKpD g==;
X-CSE-ConnectionGUID: DwJAsvAgQSCvfAu/k2ZjKw==
X-CSE-MsgGUID: WdufLD02ShyGg/l4jrv3Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376940"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:10:08 -0700
X-CSE-ConnectionGUID: aZioPwjCQRSKxQ2GC346SQ==
X-CSE-MsgGUID: u+Y7QQRkS0+IOwG2BwqXnA==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:10:06 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 06/10] drm/i915/vrr: Compute CMRR fractional timings
 generically
Date: Tue, 28 Jul 2026 20:29:38 +0530
Message-ID: <20260728145943.3848704-7-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
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

Rework the fractional CMRR computation into a generic,
transcoder-agnostic helper driven by an explicit per-CRTC debugfs
target, replacing the previous disabled, eDP-only code path. Compute
CMRR_M and CMRR_N timings based on the video mode requirements. Note
that the CMRR enable path is wired up separately; this patch only lays
down the generic computation. Remove computation of mode_flags,
I915_MODE_FLAG_VRR, as CMRR is being moved to the fixed refresh rate
path. Also return early from the CMRR computation if the existing
computation is already sufficient.

--v2:
- Derive video_mode locally instead of caching it in the persistent
  struct intel_crtc state (Jani, Chaitanya)
- Fix numerator unit in comment: milli-Hz, not kHz (Chaitanya)
- Fix "requirement" typo and clarify that CMRR is not yet enabled in
  the commit message (Chaitanya)
- Fix precision issue while computing the M/N ratio (Chaitanya)
- Rename multiplier_m and multiplier_n to improve readability
  (Chaitanya)
- Compute vtotal as it is required for dithering as per the algorithm
  implementation (Chaitanya)
- Replace the misleading adjusted_pixel_rate with dividend, which is
  more descriptive

--v3:
- Mention the rationale for not computing I915_MODE_FLAG_VRR
  (Chaitanya)
- Remove the redundant return statement at the end of the CMRR
  computation (Chaitanya)
- Correct cmrr_n calculation (Chaitanya)
- Add an early return if the current computation is already sufficient
  to drive the mode without CMRR (Chaitanya)
- Round up requested_refresh_rate (Validation)
- Fix integer overflow

--v4:
- Update cmrr_n calculation to avoid aggressive dithering
- Use div64_u64 to truncate to the floor value instead of
  DIV_ROUND_UP_ULL, which rounds up to the ceiling value
- Add a TODO comment to the cmrr_n calculation
- Add a condition for custom refresh rate requests
- Update the CMRR computation comment block in compute_config

--v5:
- Simplify computation
- Correct typo in commit message (Chaitanya)
- Compute early return condition (Chaitanya)

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
---
 drivers/gpu/drm/i915/display/intel_vrr.c | 143 ++++++++++++-----------
 1 file changed, 78 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 6d3333fd5281..7746b2ead7d1 100644
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
@@ -198,68 +195,86 @@ static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
 	return HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display);
 }
 
-static bool
-is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
+static void
+intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
 {
-	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
+	struct intel_display *display = to_intel_display(crtc_state);
+	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
+	u64 dividend;
+	u32 mode_rate_mhz;
+	u32 requested_rate_mhz = crtc->force_cmrr.numerator;
+	int rr_multiplier = 1, rr_divider = 1;
 
-	/* Avoid CMRR for now till we have VRR with fixed timings working */
-	if (!intel_vrr_cmrr_possible(crtc_state) || true)
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
+	if (!intel_vrr_cmrr_possible(crtc_state))
+		return;
 
-	desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
+	/* No CMRR ratio configured through debugfs */
+	if (!requested_rate_mhz)
+		return;
 
-	if (video_mode_required) {
-		multiplier_m = 1001;
-		multiplier_n = 1000;
+	/* Requested rate must match the mode's nominal (integer) refresh rate */
+	if (DIV_ROUND_CLOSEST(requested_rate_mhz, 1000) !=
+			drm_mode_vrefresh(adjusted_mode)) {
+		drm_dbg_kms(display->drm,
+			    "[CRTC:%d:%s] CMRR requested %u.%03u Hz doesn't match mode %d Hz\n",
+			    crtc->base.base.id, crtc->base.name,
+			    requested_rate_mhz / 1000, requested_rate_mhz % 1000,
+			    drm_mode_vrefresh(adjusted_mode));
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
+	/* Actual rate produced by the current timings, in milli-Hz */
+	mode_rate_mhz =
+		DIV_ROUND_CLOSEST_ULL((u64)adjusted_mode->crtc_clock * 1000 * 1000,
+				      adjusted_mode->crtc_vtotal *
+				      adjusted_mode->crtc_htotal);
 
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
+	if (crtc->force_cmrr.denominator == 1000) {
+		rr_multiplier = 1;
+		rr_divider = 1;
+
+		/* Mode already hits the exact rate -> CMRR not needed */
+		if (DIV_ROUND_CLOSEST(mode_rate_mhz, 10) ==
+		    DIV_ROUND_CLOSEST(requested_rate_mhz, 10)) {
+			drm_dbg_kms(display->drm,
+				    "[CRTC:%d:%s] %u.%03u Hz can be driven without CMRR\n",
+				    crtc->base.base.id, crtc->base.name,
+				    requested_rate_mhz / 1000, requested_rate_mhz % 1000);
+			return;
+		}
+	} else {
+		rr_multiplier = 1000;
+		rr_divider = 1001;
+	}
 
-	crtc_state->vrr.cmrr.enable = true;
-	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
+	/*
+	 * Let pixel_clock_hz = adjusted_mode->crtc_clock * 1000.
+	 *
+	 * cmrr_n = (requested_rate_mhz x htotal x rr_multiplier) / 1000
+	 * cmrr_m = (pixel_clock_hz x rr_divider) % cmrr_n
+	 *
+	 * where requested_rate_mhz is the requested refresh rate in milli-Hz
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
+		div64_u64((u64)requested_rate_mhz *
+			  adjusted_mode->crtc_htotal * rr_multiplier, 1000);
+	dividend = (u64)adjusted_mode->crtc_clock * rr_divider * 1000;
+	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
+						   crtc_state->vrr.cmrr.cmrr_n,
+						   &crtc_state->vrr.cmrr.cmrr_m);
 }
 
 static
@@ -435,8 +450,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_connector *connector =
 		to_intel_connector(conn_state->connector);
-	struct intel_dp *intel_dp = intel_attached_dp(connector);
-	bool is_edp = intel_dp_is_edp(intel_dp);
 	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
 	int vmin, vmax;
 
@@ -470,12 +483,17 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
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
@@ -1142,11 +1160,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 
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

