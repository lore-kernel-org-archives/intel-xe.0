Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35D9CCF2E3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 13:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ADB10E17A;
	Mon, 19 Oct 2026 13:53:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1987210E17A;
 Mon, 19 Oct 2026 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792417997; x=1823953997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5MkubjcDFTVbuRdN1onmHfNM4bYmzTpDVgoMOY/CJQc=;
 b=K08kMC5HFe5ObDO1vTNO2r48SLv/cGNzZ1QBofh8V3CYot+F1oCWCurl
 ipyn7l5YXgKDy5S7sFn9NR9wpBcFqRP0pu41tG11xJM78ndvkrWQ1i/nU
 r7Y9bDrXs5p9F16XV9WsN0mVv7Sbgca+L9lxjEp8jQUKGeT66aMqPYfqd
 fD3F11QBjrrbXF7zI85TCRu7FkNsWuJQwswShKRUKS5/aun4Fe4U9ljBl
 S8aEVZ0kV9T7USc3+zP49gaMV0ha4O1Q99IrUW0/jswiFXmY9YEK17mOb
 c9/NtLvXOM+o/c9Za230CWz1Pct7YtRtQwHM9Dnanq7fHL8Mj+j2Ku6HK g==;
X-CSE-ConnectionGUID: C3ZjwzXmTYiUttRw2NOydQ==
X-CSE-MsgGUID: DL9CGqU3Q4SWxs9SYTZnAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="979671"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="979671"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:17 -0700
X-CSE-ConnectionGUID: QpYbte6YSvWjPVComE4gRg==
X-CSE-MsgGUID: SjiBte81RqmvlXtTbSGqrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2418397"
Received: from alekseim-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.34])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 06:53:15 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: [PATCH 01/15] drm/i915/pfit: s/pch_pfit/pfit/
Date: Mon, 19 Oct 2026 16:52:55 +0300
Message-ID: <20261019135309.23578-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
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

Rename crtc_state->pch_fit to just crtc_state->pfit in
anticipation of using it also on GMCH platforms.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_casf.c     | 28 ++++++-------
 .../drm/i915/display/intel_crtc_state_dump.c  | 14 +++----
 drivers/gpu/drm/i915/display/intel_ddi.c      |  6 +--
 drivers/gpu/drm/i915/display/intel_display.c  | 36 ++++++++---------
 .../drm/i915/display/intel_display_types.h    |  4 +-
 drivers/gpu/drm/i915/display/intel_pfit.c     | 18 ++++-----
 drivers/gpu/drm/i915/display/skl_scaler.c     | 40 +++++++++----------
 7 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
index cafd21a03632..64d99d6480ac 100644
--- a/drivers/gpu/drm/i915/display/intel_casf.c
+++ b/drivers/gpu/drm/i915/display/intel_casf.c
@@ -81,11 +81,11 @@ static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
 	u32 total_pixels = mode->hdisplay * mode->vdisplay;
 
 	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
-		crtc_state->pch_pfit.casf.win_size = SHARPNESS_FILTER_SIZE_3X3;
+		crtc_state->pfit.casf.win_size = SHARPNESS_FILTER_SIZE_3X3;
 	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
-		crtc_state->pch_pfit.casf.win_size = SHARPNESS_FILTER_SIZE_5X5;
+		crtc_state->pfit.casf.win_size = SHARPNESS_FILTER_SIZE_5X5;
 	else
-		crtc_state->pch_pfit.casf.win_size = SHARPNESS_FILTER_SIZE_7X7;
+		crtc_state->pfit.casf.win_size = SHARPNESS_FILTER_SIZE_7X7;
 }
 
 static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state);
@@ -103,7 +103,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 		return -EINVAL;
 	}
 
-	crtc_state->pch_pfit.casf.enable = true;
+	crtc_state->pfit.casf.enable = true;
 
 	/*
 	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
@@ -113,7 +113,7 @@ int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
 	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
 	 * Also 85 + 16 = 101.
 	 */
-	crtc_state->pch_pfit.casf.strength =
+	crtc_state->pfit.casf.strength =
 		min(crtc_state->hw.sharpness_strength, 0xEF) + 0x10;
 
 	intel_casf_compute_win_size(crtc_state);
@@ -133,12 +133,12 @@ void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
 	if (sharp & FILTER_EN) {
 		if (drm_WARN_ON(display->drm,
 				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
-			crtc_state->pch_pfit.casf.strength = 0;
+			crtc_state->pfit.casf.strength = 0;
 		else
-			crtc_state->pch_pfit.casf.strength =
+			crtc_state->pfit.casf.strength =
 				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp);
-		crtc_state->pch_pfit.casf.enable = true;
-		crtc_state->pch_pfit.casf.win_size =
+		crtc_state->pfit.casf.enable = true;
+		crtc_state->pfit.casf.win_size =
 			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
 	}
 }
@@ -153,7 +153,7 @@ static u32 casf_coeff(const struct intel_crtc_state *crtc_state, int tap)
 	struct scaler_filter_coeff value;
 	u32 coeff;
 
-	value = crtc_state->pch_pfit.casf.coeff[tap];
+	value = crtc_state->pfit.casf.coeff[tap];
 	value.sign = 0;
 
 	coeff = value.sign << 15 | value.exp << 12 | value.mantissa << 3;
@@ -163,7 +163,7 @@ static u32 casf_coeff(const struct intel_crtc_state *crtc_state, int tap)
 /*
  * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
  * To enable casf: program scaler coefficients with the coefficients
- * that are calculated and stored in pch_pfit.casf.coeff as per
+ * that are calculated and stored in pfit.casf.coeff as per
  * SCALER_COEFFICIENT_FORMAT
  */
 static void intel_casf_write_coeff(const struct intel_crtc_state *crtc_state)
@@ -221,9 +221,9 @@ static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
 	u16 sum_coeff = 0;
 	int i;
 
-	if (crtc_state->pch_pfit.casf.win_size == 0)
+	if (crtc_state->pfit.casf.win_size == 0)
 		filtercoeff = filtercoeff_1;
-	else if (crtc_state->pch_pfit.casf.win_size == 1)
+	else if (crtc_state->pfit.casf.win_size == 1)
 		filtercoeff = filtercoeff_2;
 	else
 		filtercoeff = filtercoeff_3;
@@ -233,7 +233,7 @@ static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crtc_state)
 
 	for (i = 0; i < SCALER_FILTER_NUM_TAPS; i++) {
 		filter_coeff[i] = (*(filtercoeff + i) * 100 / sum_coeff);
-		convert_sharpness_coeff_binary(&crtc_state->pch_pfit.casf.coeff[i],
+		convert_sharpness_coeff_binary(&crtc_state->pfit.casf.coeff[i],
 					      filter_coeff[i]);
 	}
 }
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index 92675a88b969..f30d07bc6b07 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -356,15 +356,15 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
 			   pipe_config->gmch_pfit.pgm_ratios,
 			   pipe_config->gmch_pfit.lvds_border_bits);
 	else
-		drm_printf(&p, "pch pfit: " DRM_RECT_FMT ", %s, force thru: %s\n",
-			   DRM_RECT_ARG(&pipe_config->pch_pfit.dst),
-			   str_enabled_disabled(pipe_config->pch_pfit.enabled),
-			   str_yes_no(pipe_config->pch_pfit.force_thru));
+		drm_printf(&p, "pfit: " DRM_RECT_FMT ", %s, force thru: %s\n",
+			   DRM_RECT_ARG(&pipe_config->pfit.dst),
+			   str_enabled_disabled(pipe_config->pfit.enabled),
+			   str_yes_no(pipe_config->pfit.force_thru));
 
 	drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
-		   pipe_config->pch_pfit.casf.strength,
-		   pipe_config->pch_pfit.casf.win_size,
-		   pipe_config->pch_pfit.casf.enable);
+		   pipe_config->pfit.casf.strength,
+		   pipe_config->pfit.casf.win_size,
+		   pipe_config->pfit.casf.enable);
 
 	drm_printf(&p, "ips: %i, double wide: %i, drrs: %i\n",
 		   pipe_config->ips_enabled, pipe_config->double_wide,
diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a46ab5d3d70f..2c09fccecbbf 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -562,7 +562,7 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
 			 * eDP when not using the panel fitter, and when not
 			 * using motion blur mitigation (which we don't
 			 * support). */
-			if (crtc_state->pch_pfit.force_thru)
+			if (crtc_state->pfit.force_thru)
 				temp |= TRANS_DDI_EDP_INPUT_A_ONOFF;
 			else
 				temp |= TRANS_DDI_EDP_INPUT_A_ON;
@@ -4560,8 +4560,8 @@ static int intel_ddi_compute_config(struct intel_atomic_state *state,
 
 	if (display->platform.haswell && crtc->pipe == PIPE_A &&
 	    pipe_config->cpu_transcoder == TRANSCODER_EDP)
-		pipe_config->pch_pfit.force_thru =
-			pipe_config->pch_pfit.enabled ||
+		pipe_config->pfit.force_thru =
+			pipe_config->pfit.enabled ||
 			pipe_config->crc_enabled;
 
 	if (display->platform.geminilake || display->platform.broxton)
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d5d4453f283b..723dec35402a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -1130,7 +1130,7 @@ static void intel_post_plane_update(struct intel_atomic_state *state,
 		intel_encoders_audio_enable(state, crtc);
 
 	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011503117)) {
-		if (old_crtc_state->pch_pfit.enabled != new_crtc_state->pch_pfit.enabled)
+		if (old_crtc_state->pfit.enabled != new_crtc_state->pfit.enabled)
 			adl_scaler_ecc_unmask(new_crtc_state);
 	}
 
@@ -1652,7 +1652,7 @@ static bool glk_need_scaler_clock_gating_wa(const struct intel_crtc_state *crtc_
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
-	return DISPLAY_VER(display) == 10 && crtc_state->pch_pfit.enabled;
+	return DISPLAY_VER(display) == 10 && crtc_state->pfit.enabled;
 }
 
 static void glk_pipe_scaler_clock_gating_wa(struct intel_crtc *crtc, bool enable)
@@ -2052,8 +2052,8 @@ static void get_crtc_power_domains(struct intel_crtc_state *crtc_state,
 
 	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
 	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
-	if (crtc_state->pch_pfit.enabled ||
-	    crtc_state->pch_pfit.force_thru)
+	if (crtc_state->pfit.enabled ||
+	    crtc_state->pfit.force_thru)
 		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
 
 	drm_for_each_encoder_mask(encoder, display->drm,
@@ -2288,14 +2288,14 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
 	 * PF-ID we'll need to adjust the pixel_rate here.
 	 */
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pfit.enabled)
 		return pixel_rate;
 
 	drm_rect_init(&src, 0, 0,
 		      drm_rect_width(&crtc_state->pipe_src) << 16,
 		      drm_rect_height(&crtc_state->pipe_src) << 16);
 
-	return intel_adjusted_rate(&src, &crtc_state->pch_pfit.dst,
+	return intel_adjusted_rate(&src, &crtc_state->pfit.dst,
 				   pixel_rate);
 }
 
@@ -2311,14 +2311,14 @@ static u32 ilk_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
 	 * PF-ID we'll need to adjust the pixel_rate here.
 	 */
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pfit.enabled)
 		return pixel_rate;
 
 	drm_rect_init(&src, 0, 0,
 		      drm_rect_width(&crtc_state->pipe_src) << 16,
 		      drm_rect_height(&crtc_state->pipe_src) << 16);
 
-	return intel_adjusted_rate_cdclk(&src, &crtc_state->pch_pfit.dst,
+	return intel_adjusted_rate_cdclk(&src, &crtc_state->pfit.dst,
 					 pixel_rate, ppc);
 }
 
@@ -4012,7 +4012,7 @@ static bool hsw_get_transcoder_state(struct intel_crtc *crtc,
 				    TRANS_DDI_FUNC_CTL(display, pipe_config->cpu_transcoder));
 
 		if ((tmp & TRANS_DDI_EDP_INPUT_MASK) == TRANS_DDI_EDP_INPUT_A_ONOFF)
-			pipe_config->pch_pfit.force_thru = true;
+			pipe_config->pfit.force_thru = true;
 	}
 
 	tmp = intel_de_read(display,
@@ -5475,16 +5475,16 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	 * Changing the EDP transcoder input mux
 	 * (A_ONOFF vs. A_ON) requires a full modeset.
 	 */
-	PIPE_CONF_CHECK_BOOL(pch_pfit.force_thru);
+	PIPE_CONF_CHECK_BOOL(pfit.force_thru);
 
 	if (!fastset) {
 		PIPE_CONF_CHECK_RECT(pipe_src);
 
-		PIPE_CONF_CHECK_BOOL(pch_pfit.enabled);
-		PIPE_CONF_CHECK_RECT(pch_pfit.dst);
-		PIPE_CONF_CHECK_BOOL(pch_pfit.casf.enable);
-		PIPE_CONF_CHECK_I(pch_pfit.casf.win_size);
-		PIPE_CONF_CHECK_I(pch_pfit.casf.strength);
+		PIPE_CONF_CHECK_BOOL(pfit.enabled);
+		PIPE_CONF_CHECK_RECT(pfit.dst);
+		PIPE_CONF_CHECK_BOOL(pfit.casf.enable);
+		PIPE_CONF_CHECK_I(pfit.casf.win_size);
+		PIPE_CONF_CHECK_I(pfit.casf.strength);
 
 		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
 		PIPE_CONF_CHECK_I(pixel_rate_cdclk);
@@ -6775,12 +6775,12 @@ static void intel_pipe_fastset(const struct intel_crtc_state *old_crtc_state,
 
 	/* on skylake this is done by detaching scalers */
 	if (DISPLAY_VER(display) >= 9) {
-		if (new_crtc_state->pch_pfit.enabled)
+		if (new_crtc_state->pfit.enabled)
 			skl_pfit_enable(new_crtc_state);
 	} else if (HAS_PCH_SPLIT(display)) {
-		if (new_crtc_state->pch_pfit.enabled)
+		if (new_crtc_state->pfit.enabled)
 			ilk_pfit_enable(new_crtc_state);
-		else if (old_crtc_state->pch_pfit.enabled)
+		else if (old_crtc_state->pfit.enabled)
 			ilk_pfit_disable(old_crtc_state);
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 0e3083e852d5..b3d55993e41a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1251,13 +1251,13 @@ struct intel_crtc_state {
 		u32 lvds_border_bits;
 	} gmch_pfit;
 
-	/* Panel fitter placement and size for Ironlake+ */
+	/* Panel fitter placement and size */
 	struct {
 		struct intel_casf casf;
 		struct drm_rect dst;
 		bool enabled;
 		bool force_thru;
-	} pch_pfit;
+	} pfit;
 
 	/* FDI configuration, only valid if has_pch_encoder is set. */
 	int fdi_lanes;
diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
index 5b170c74a510..3e3c69233e58 100644
--- a/drivers/gpu/drm/i915/display/intel_pfit.c
+++ b/drivers/gpu/drm/i915/display/intel_pfit.c
@@ -22,7 +22,7 @@ static int intel_pch_pfit_check_dst_window(const struct intel_crtc_state *crtc_s
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
-	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
+	const struct drm_rect *dst = &crtc_state->pfit.dst;
 	int width = drm_rect_width(dst);
 	int height = drm_rect_height(dst);
 	int x = dst->x1;
@@ -109,7 +109,7 @@ static int intel_pch_pfit_check_scaling(const struct intel_crtc_state *crtc_stat
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
+	const struct drm_rect *dst = &crtc_state->pfit.dst;
 	int pipe_src_w = drm_rect_width(&crtc_state->pipe_src);
 	int pipe_src_h = drm_rect_height(&crtc_state->pipe_src);
 	int hscale, vscale, max_scale = 0x12000; /* 1.125 */
@@ -271,9 +271,9 @@ static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
 		return -EINVAL;
 	}
 
-	drm_rect_init(&crtc_state->pch_pfit.dst,
+	drm_rect_init(&crtc_state->pfit.dst,
 		      x, y, width, height);
-	crtc_state->pch_pfit.enabled = true;
+	crtc_state->pfit.enabled = true;
 
 	/*
 	 * SKL+ have unified scalers for pipes/planes so the
@@ -594,14 +594,14 @@ void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
-	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
+	const struct drm_rect *dst = &crtc_state->pfit.dst;
 	enum pipe pipe = crtc->pipe;
 	int width = drm_rect_width(dst);
 	int height = drm_rect_height(dst);
 	int x = dst->x1;
 	int y = dst->y1;
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pfit.enabled)
 		return;
 
 	/*
@@ -630,7 +630,7 @@ void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state)
 	 * To avoid upsetting the power well on haswell only disable the pfit if
 	 * it's in use. The hw state code will make sure we get this right.
 	 */
-	if (!old_crtc_state->pch_pfit.enabled)
+	if (!old_crtc_state->pfit.enabled)
 		return;
 
 	intel_de_write_fw(display, PF_CTL(pipe), 0);
@@ -654,12 +654,12 @@ void ilk_pfit_get_config(struct intel_crtc_state *crtc_state)
 	else
 		pipe = crtc->pipe;
 
-	crtc_state->pch_pfit.enabled = true;
+	crtc_state->pfit.enabled = true;
 
 	pos = intel_de_read(display, PF_WIN_POS(crtc->pipe));
 	size = intel_de_read(display, PF_WIN_SZ(crtc->pipe));
 
-	drm_rect_init(&crtc_state->pch_pfit.dst,
+	drm_rect_init(&crtc_state->pfit.dst,
 		      REG_FIELD_GET(PF_WIN_XPOS_MASK, pos),
 		      REG_FIELD_GET(PF_WIN_YPOS_MASK, pos),
 		      REG_FIELD_GET(PF_WIN_XSIZE_MASK, size),
diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 7994b983d509..0be6808bc2e4 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -276,9 +276,9 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
 	if (ret)
 		return ret;
 
-	if (crtc_state->pch_pfit.enabled) {
-		width = drm_rect_width(&crtc_state->pch_pfit.dst);
-		height = drm_rect_height(&crtc_state->pch_pfit.dst);
+	if (crtc_state->pfit.enabled) {
+		width = drm_rect_width(&crtc_state->pfit.dst);
+		height = drm_rect_height(&crtc_state->pfit.dst);
 	} else {
 		width = pipe_mode->crtc_hdisplay;
 		height = pipe_mode->crtc_vdisplay;
@@ -289,7 +289,7 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
 				 drm_rect_width(&crtc_state->pipe_src),
 				 drm_rect_height(&crtc_state->pipe_src),
 				 width, height, NULL, 0,
-				 crtc_state->pch_pfit.enabled);
+				 crtc_state->pfit.enabled);
 }
 
 /**
@@ -482,7 +482,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 		}
 	}
 
-	if (crtc_state->pch_pfit.enabled) {
+	if (crtc_state->pfit.enabled) {
 		struct drm_rect src;
 		int max_hscale, max_vscale;
 
@@ -503,9 +503,9 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 			max_vscale = 0x10000;
 		}
 
-		hscale = drm_rect_calc_hscale(&src, &crtc_state->pch_pfit.dst,
+		hscale = drm_rect_calc_hscale(&src, &crtc_state->pfit.dst,
 					      0, max_hscale);
-		vscale = drm_rect_calc_vscale(&src, &crtc_state->pch_pfit.dst,
+		vscale = drm_rect_calc_vscale(&src, &crtc_state->pfit.dst,
 					      0, max_vscale);
 
 		if (hscale < 0 || vscale < 0) {
@@ -513,7 +513,7 @@ static int intel_atomic_setup_scaler(struct intel_crtc_state *crtc_state,
 				    "Scaler %d doesn't support required pipe scaling\n",
 				    *scaler_id);
 			drm_rect_debug_print("src: ", &src, true);
-			drm_rect_debug_print("dst: ", &crtc_state->pch_pfit.dst, false);
+			drm_rect_debug_print("dst: ", &crtc_state->pfit.dst, false);
 
 			return -EINVAL;
 		}
@@ -542,7 +542,7 @@ static int setup_crtc_scaler(struct intel_atomic_state *state,
 					 hweight32(scaler_state->scaler_users),
 					 crtc, "CRTC", crtc->base.base.id,
 					 NULL, &scaler_state->scaler_id,
-					 crtc_state->pch_pfit.casf.enable);
+					 crtc_state->pfit.casf.enable);
 }
 
 static int setup_plane_scaler(struct intel_atomic_state *state,
@@ -760,12 +760,12 @@ static void skl_scaler_setup_filter(struct intel_display *display,
 
 static u32 casf_sharpness_ctl(const struct intel_crtc_state *crtc_state)
 {
-	if (!crtc_state->pch_pfit.casf.enable)
+	if (!crtc_state->pfit.casf.enable)
 		return 0;
 
 	return FILTER_EN |
-		FILTER_STRENGTH(crtc_state->pch_pfit.casf.strength) |
-		crtc_state->pch_pfit.casf.win_size;
+		FILTER_STRENGTH(crtc_state->pfit.casf.strength) |
+		crtc_state->pfit.casf.win_size;
 }
 
 void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
@@ -774,7 +774,7 @@ void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	const struct intel_crtc_scaler_state *scaler_state =
 		&crtc_state->scaler_state;
-	const struct drm_rect *dst = &crtc_state->pch_pfit.dst;
+	const struct drm_rect *dst = &crtc_state->pfit.dst;
 	u16 uv_rgb_hphase, uv_rgb_vphase;
 	enum pipe pipe = crtc->pipe;
 	int width = drm_rect_width(dst);
@@ -786,7 +786,7 @@ void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 	int id;
 	u32 ps_ctrl;
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pfit.enabled)
 		return;
 
 	if (drm_WARN_ON(display->drm,
@@ -810,11 +810,11 @@ void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
 
 	ps_ctrl = PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].mode |
 		skl_scaler_get_filter_select(crtc_state->hw.scaling_filter,
-					     crtc_state->pch_pfit.casf.enable);
+					     crtc_state->pfit.casf.enable);
 
 	trace_intel_pipe_scaler_update_arm(crtc, id, x, y, width, height);
 
-	if (crtc_state->pch_pfit.casf.enable)
+	if (crtc_state->pfit.casf.enable)
 		intel_casf_setup(crtc_state);
 	else
 		skl_scaler_setup_filter(display, NULL, pipe, id, 0,
@@ -977,12 +977,12 @@ void skl_scaler_get_config(struct intel_crtc_state *crtc_state)
 	if (scaler_has_casf(display, scaler_id))
 		intel_casf_sharpness_get_config(crtc_state);
 
-	crtc_state->pch_pfit.enabled = true;
+	crtc_state->pfit.enabled = true;
 
 	pos = intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, scaler_id));
 	size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, scaler_id));
 
-	drm_rect_init(&crtc_state->pch_pfit.dst,
+	drm_rect_init(&crtc_state->pfit.dst,
 		      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
 		      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
 		      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
@@ -998,7 +998,7 @@ void adl_scaler_ecc_mask(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_display *display = to_intel_display(crtc_state);
 
-	if (!crtc_state->pch_pfit.enabled)
+	if (!crtc_state->pfit.enabled)
 		return;
 
 	intel_de_write(display, XELPD_DISPLAY_ERR_FATAL_MASK, ~0);
@@ -1056,7 +1056,7 @@ unsigned int skl_scaler_2nd_prefill_lines(const struct intel_crtc_state *crtc_st
 		&crtc_state->scaler_state;
 	int num_scalers = hweight32(scaler_state->scaler_users);
 
-	if (num_scalers > 1 && crtc_state->pch_pfit.enabled)
+	if (num_scalers > 1 && crtc_state->pfit.enabled)
 		return 4 << 16;
 
 	return 0;
-- 
2.55.0

