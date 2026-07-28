Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B283C54F54
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 15:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD0010E713;
	Tue, 28 Jul 2026 15:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNZYgnqO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A2D10E6E9;
 Tue, 28 Jul 2026 15:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785251482; x=1816787482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BzZe8mEAPwIQJERAk5KAy2SGvuwwrvSa/dQn9qkKLKs=;
 b=dNZYgnqOWriW/Fwxd9YgcUEUbxojNHNQ79vJ3sXC8JbfG//1rIEMFYoc
 YTW4Wajfgl/SL6bSc87UOq9iXdTqItoODWgPtVFpR11UcOj9FEBdtuQCa
 9Wi95dIrd5+kJuu93mbeR7PfPHG8fFJZyPW0DZDQ67cMjYsIlGglz1H1u
 rM0tWhILrjZeTZSD/BPI/wcDPcYq167I1DqgAb1AkvuqzUm3sMz581XC4
 qOnG6f61jtajGpiArIMvoyUUImB//EfUdCAjy7KVTd+c+BEY9+D4qZDTp
 i30wdmZaZeXr3XVBjpZeLwvOOnVD4Mp2Dptl1T7xzOrnwPsRXmiBgH+xn A==;
X-CSE-ConnectionGUID: ZLzD+hJZTzSmaSis7Y7v0w==
X-CSE-MsgGUID: uNEAOCAyQtCfilMfe/fucw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88376935"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="88376935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 08:10:06 -0700
X-CSE-ConnectionGUID: Tn8LdoLMRnyh17Xtik1j8w==
X-CSE-MsgGUID: 2mxwrvrrQAqBSBzVCrGSnA==
X-ExtLoop1: 1
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa003.fm.intel.com with ESMTP; 28 Jul 2026 08:10:04 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 ankit.k.nautiyal@intel.com, chaitanya.kumar.borah@intel.com
Subject: [PATCH v7 05/10] drm/i915/display: Move CMRR crtc_state members under
 VRR
Date: Tue, 28 Jul 2026 20:29:37 +0530
Message-ID: <20260728145943.3848704-6-mitulkumar.ajitkumar.golani@intel.com>
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

Move CMRR crtc state members under VRR infrastructure as
it is enabled during fixed-refresh-rate VRR timing generator
is enabled.

--v2:
- Move cmrr structure under vrr umbrella.
- Remove dups. (Jani)

--v3:
- Update commit message

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_cmtg.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 10 +++----
 .../drm/i915/display/intel_display_types.h    | 12 ++++----
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      | 30 +++++++++----------
 6 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_cmtg.c b/drivers/gpu/drm/i915/display/intel_cmtg.c
index c8e0f90af910..3c0f5b2fb2e7 100644
--- a/drivers/gpu/drm/i915/display/intel_cmtg.c
+++ b/drivers/gpu/drm/i915/display/intel_cmtg.c
@@ -326,7 +326,7 @@ void intel_cmtg_set_vrr_ctl(const struct intel_crtc_state *crtc_state)
 		  XELPD_VRR_CTL_VRR_GUARDBAND(crtc_state->vrr.guardband);
 
 	/* TODO: The code below may need to be revisited once CMRR is enabled */
-	if (crtc_state->cmrr.enable)
+	if (crtc_state->vrr.cmrr.enable)
 		vrr_ctl |= VRR_CTL_CMRR_ENABLE;
 
 	intel_de_write(display, TRANS_VRR_CTL(display, cmtg_transcoder), vrr_ctl);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 9dfd095f325f..8ce762188665 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -950,8 +950,8 @@ static bool vrr_params_changed(const struct intel_crtc_state *old_crtc_state,
 static bool cmrr_params_changed(const struct intel_crtc_state *old_crtc_state,
 				const struct intel_crtc_state *new_crtc_state)
 {
-	return old_crtc_state->cmrr.cmrr_m != new_crtc_state->cmrr.cmrr_m ||
-		old_crtc_state->cmrr.cmrr_n != new_crtc_state->cmrr.cmrr_n;
+	return old_crtc_state->vrr.cmrr.cmrr_m != new_crtc_state->vrr.cmrr.cmrr_m ||
+		old_crtc_state->vrr.cmrr.cmrr_n != new_crtc_state->vrr.cmrr.cmrr_n;
 }
 
 static bool intel_crtc_vrr_enabling(struct intel_atomic_state *state,
@@ -5536,9 +5536,9 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 		PIPE_CONF_CHECK_I(vrr.flipline);
 		PIPE_CONF_CHECK_I(vrr.vsync_start);
 		PIPE_CONF_CHECK_I(vrr.vsync_end);
-		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
-		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
-		PIPE_CONF_CHECK_BOOL(cmrr.enable);
+		PIPE_CONF_CHECK_LLI(vrr.cmrr.cmrr_m);
+		PIPE_CONF_CHECK_LLI(vrr.cmrr.cmrr_n);
+		PIPE_CONF_CHECK_BOOL(vrr.cmrr.enable);
 		PIPE_CONF_CHECK_I(vrr.dc_balance.vmin);
 		PIPE_CONF_CHECK_I(vrr.dc_balance.vmax);
 		PIPE_CONF_CHECK_I(vrr.dc_balance.guardband);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 46dd980b315a..20a07ea06b5e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1408,13 +1408,13 @@ struct intel_crtc_state {
 			u16 max_increase, max_decrease;
 			u16 vblank_target;
 		} dc_balance;
-	} vrr;
 
-	/* Content Match Refresh Rate state */
-	struct {
-		bool enable;
-		u64 cmrr_n, cmrr_m;
-	} cmrr;
+		/* Content Match Refresh Rate state */
+		struct {
+			bool enable;
+			u64 cmrr_n, cmrr_m;
+		} cmrr;
+	} vrr;
 
 	/* Stream Splitter for eDP MSO */
 	struct {
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9e2db310b7d8..7f13595f40c1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3143,7 +3143,7 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
 	as_sdp->revision = 0x2;
 	as_sdp->vtotal = intel_vrr_vmin_vtotal(crtc_state);
 
-	if (crtc_state->cmrr.enable) {
+	if (crtc_state->vrr.cmrr.enable) {
 		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
 		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
 
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 5ddcede6db27..d2009e317024 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1491,7 +1491,7 @@ static bool intel_psr2_config_valid(struct intel_dp *intel_dp,
 	int crtc_vdisplay = crtc_state->hw.adjusted_mode.crtc_vdisplay;
 	int psr_max_h = 0, psr_max_v = 0, max_bpp = 0;
 
-	if (crtc_state->cmrr.enable) {
+	if (crtc_state->vrr.cmrr.enable) {
 		drm_dbg_kms(display->drm,
 			    "Selective update cannot be enabled when CMRR is enabled\n");
 		return false;
diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
index 615c8fa8c063..6d3333fd5281 100644
--- a/drivers/gpu/drm/i915/display/intel_vrr.c
+++ b/drivers/gpu/drm/i915/display/intel_vrr.c
@@ -235,12 +235,12 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
 		multiplier_n = 1000;
 	}
 
-	crtc_state->cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
-					      multiplier_n);
+	crtc_state->vrr.cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
+						  multiplier_n);
 	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
-				  crtc_state->cmrr.cmrr_n);
+				  crtc_state->vrr.cmrr.cmrr_n);
 	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
-	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
+	crtc_state->vrr.cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->vrr.cmrr.cmrr_n);
 
 	return vtotal;
 }
@@ -258,7 +258,7 @@ void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
 	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
 	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
 
-	crtc_state->cmrr.enable = true;
+	crtc_state->vrr.cmrr.enable = true;
 	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
 }
 
@@ -651,15 +651,15 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
 		return;
 	}
 
-	if (crtc_state->cmrr.enable) {
+	if (crtc_state->vrr.cmrr.enable) {
 		intel_de_write(display, TRANS_CMRR_M_HI(display, cpu_transcoder),
-			       upper_32_bits(crtc_state->cmrr.cmrr_m));
+			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_m));
 		intel_de_write(display, TRANS_CMRR_M_LO(display, cpu_transcoder),
-			       lower_32_bits(crtc_state->cmrr.cmrr_m));
+			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_m));
 		intel_de_write(display, TRANS_CMRR_N_HI(display, cpu_transcoder),
-			       upper_32_bits(crtc_state->cmrr.cmrr_n));
+			       upper_32_bits(crtc_state->vrr.cmrr.cmrr_n));
 		intel_de_write(display, TRANS_CMRR_N_LO(display, cpu_transcoder),
-			       lower_32_bits(crtc_state->cmrr.cmrr_n));
+			       lower_32_bits(crtc_state->vrr.cmrr.cmrr_n));
 	}
 
 	intel_vrr_set_fixed_rr_timings(crtc_state, cpu_transcoder);
@@ -980,7 +980,7 @@ void intel_vrr_enable(const struct intel_crtc_state *crtc_state)
 	intel_vrr_enable_dc_balancing(crtc_state);
 
 	if (!intel_vrr_always_use_vrr_tg(display))
-		intel_vrr_tg_enable(crtc_state, crtc_state->cmrr.enable);
+		intel_vrr_tg_enable(crtc_state, crtc_state->vrr.cmrr.enable);
 }
 
 void intel_vrr_disable(const struct intel_crtc_state *old_crtc_state)
@@ -1077,12 +1077,12 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
 				      TRANS_VRR_CTL(display, cpu_transcoder));
 
 	if (intel_vrr_cmrr_possible(crtc_state))
-		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
+		crtc_state->vrr.cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
 
-	if (crtc_state->cmrr.enable) {
-		crtc_state->cmrr.cmrr_n =
+	if (crtc_state->vrr.cmrr.enable) {
+		crtc_state->vrr.cmrr.cmrr_n =
 			intel_de_read64_2x32(display, TRANS_CMRR_N_LO(display, cpu_transcoder));
-		crtc_state->cmrr.cmrr_m =
+		crtc_state->vrr.cmrr.cmrr_m =
 			intel_de_read64_2x32(display, TRANS_CMRR_M_LO(display, cpu_transcoder));
 	}
 
-- 
2.48.1

