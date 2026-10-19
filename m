Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36F060774FB
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RaBvAcqY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794B210EE81;
	Mon, 19 Oct 2026 15:48:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EC710EE9B;
 Mon, 19 Oct 2026 15:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792424897; x=1823960897;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VuCDLNfB1Emo5cDvQJCQsQtSN3qQDOf5omsFIuyf9lE=;
 b=RaBvAcqYtbdFS1UExndXWboJHb+nxhXwJMKIFSjhya8ymp7B0FI6hmrK
 j7At581hF3I+jyLiYfK1BuXCNWmj+ffQMgV4DpWji8+l3spj43uQm1JZY
 EdzMcesC8vC4f8/Qe+J7zznAIya7c7+KaAXNuCwDreZMdVG1/XtyAZIsA
 8qi6CZDFz2WxFtGw+VqVtN9102DcGjLd9HzD7fjxE+OhPyFX5LKXiZQSu
 SERjt6lwYG+8DnyMZ2Ef43VL0J6dnY9gHT8tW+BDoUvNYx6SyQP4Wpuyp
 BpN9pbK7GFGtV8RK2zUL4yuwH5jyuTjEgh/5YiRISvLxXLSkojY5fOPjY Q==;
X-CSE-ConnectionGUID: EGl5YTIgSCCkKnUd0mghXQ==
X-CSE-MsgGUID: lBot6nrvQCSn1RDAiaWHbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="994796"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="994796"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:48:17 -0700
X-CSE-ConnectionGUID: kx6bliH4RMuEcbuVhNZcnQ==
X-CSE-MsgGUID: t9ZxbeTZSg2/rVwaGXd+NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2455822"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:48:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 01/15] drm/i915/pfit: s/pch_pfit/pfit/
In-Reply-To: <20261019135309.23578-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-2-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 18:48:12 +0300
Message-ID: <6dcdbc5f207a59a2a89e7f799b01a63c5bfa269c@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Rename crtc_state->pch_fit to just crtc_state->pfit in
> anticipation of using it also on GMCH platforms.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_casf.c     | 28 ++++++-------
>  .../drm/i915/display/intel_crtc_state_dump.c  | 14 +++----
>  drivers/gpu/drm/i915/display/intel_ddi.c      |  6 +--
>  drivers/gpu/drm/i915/display/intel_display.c  | 36 ++++++++---------
>  .../drm/i915/display/intel_display_types.h    |  4 +-
>  drivers/gpu/drm/i915/display/intel_pfit.c     | 18 ++++-----
>  drivers/gpu/drm/i915/display/skl_scaler.c     | 40 +++++++++----------
>  7 files changed, 73 insertions(+), 73 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/=
i915/display/intel_casf.c
> index cafd21a03632..64d99d6480ac 100644
> --- a/drivers/gpu/drm/i915/display/intel_casf.c
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -81,11 +81,11 @@ static void intel_casf_compute_win_size(struct intel_=
crtc_state *crtc_state)
>  	u32 total_pixels =3D mode->hdisplay * mode->vdisplay;
>=20=20
>  	if (total_pixels <=3D MAX_PIXELS_FOR_3_TAP_FILTER)
> -		crtc_state->pch_pfit.casf.win_size =3D SHARPNESS_FILTER_SIZE_3X3;
> +		crtc_state->pfit.casf.win_size =3D SHARPNESS_FILTER_SIZE_3X3;
>  	else if (total_pixels <=3D MAX_PIXELS_FOR_5_TAP_FILTER)
> -		crtc_state->pch_pfit.casf.win_size =3D SHARPNESS_FILTER_SIZE_5X5;
> +		crtc_state->pfit.casf.win_size =3D SHARPNESS_FILTER_SIZE_5X5;
>  	else
> -		crtc_state->pch_pfit.casf.win_size =3D SHARPNESS_FILTER_SIZE_7X7;
> +		crtc_state->pfit.casf.win_size =3D SHARPNESS_FILTER_SIZE_7X7;
>  }
>=20=20
>  static void intel_casf_scaler_compute_coeff(struct intel_crtc_state *crt=
c_state);
> @@ -103,7 +103,7 @@ int intel_casf_compute_config(struct intel_crtc_state=
 *crtc_state)
>  		return -EINVAL;
>  	}
>=20=20
> -	crtc_state->pch_pfit.casf.enable =3D true;
> +	crtc_state->pfit.casf.enable =3D true;
>=20=20
>  	/*
>  	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> @@ -113,7 +113,7 @@ int intel_casf_compute_config(struct intel_crtc_state=
 *crtc_state)
>  	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
>  	 * Also 85 + 16 =3D 101.
>  	 */
> -	crtc_state->pch_pfit.casf.strength =3D
> +	crtc_state->pfit.casf.strength =3D
>  		min(crtc_state->hw.sharpness_strength, 0xEF) + 0x10;
>=20=20
>  	intel_casf_compute_win_size(crtc_state);
> @@ -133,12 +133,12 @@ void intel_casf_sharpness_get_config(struct intel_c=
rtc_state *crtc_state)
>  	if (sharp & FILTER_EN) {
>  		if (drm_WARN_ON(display->drm,
>  				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
> -			crtc_state->pch_pfit.casf.strength =3D 0;
> +			crtc_state->pfit.casf.strength =3D 0;
>  		else
> -			crtc_state->pch_pfit.casf.strength =3D
> +			crtc_state->pfit.casf.strength =3D
>  				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp);
> -		crtc_state->pch_pfit.casf.enable =3D true;
> -		crtc_state->pch_pfit.casf.win_size =3D
> +		crtc_state->pfit.casf.enable =3D true;
> +		crtc_state->pfit.casf.win_size =3D
>  			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
>  	}
>  }
> @@ -153,7 +153,7 @@ static u32 casf_coeff(const struct intel_crtc_state *=
crtc_state, int tap)
>  	struct scaler_filter_coeff value;
>  	u32 coeff;
>=20=20
> -	value =3D crtc_state->pch_pfit.casf.coeff[tap];
> +	value =3D crtc_state->pfit.casf.coeff[tap];
>  	value.sign =3D 0;
>=20=20
>  	coeff =3D value.sign << 15 | value.exp << 12 | value.mantissa << 3;
> @@ -163,7 +163,7 @@ static u32 casf_coeff(const struct intel_crtc_state *=
crtc_state, int tap)
>  /*
>   * 17 phase of 7 taps requires 119 coefficients in 60 dwords per set.
>   * To enable casf: program scaler coefficients with the coefficients
> - * that are calculated and stored in pch_pfit.casf.coeff as per
> + * that are calculated and stored in pfit.casf.coeff as per
>   * SCALER_COEFFICIENT_FORMAT
>   */
>  static void intel_casf_write_coeff(const struct intel_crtc_state *crtc_s=
tate)
> @@ -221,9 +221,9 @@ static void intel_casf_scaler_compute_coeff(struct in=
tel_crtc_state *crtc_state)
>  	u16 sum_coeff =3D 0;
>  	int i;
>=20=20
> -	if (crtc_state->pch_pfit.casf.win_size =3D=3D 0)
> +	if (crtc_state->pfit.casf.win_size =3D=3D 0)
>  		filtercoeff =3D filtercoeff_1;
> -	else if (crtc_state->pch_pfit.casf.win_size =3D=3D 1)
> +	else if (crtc_state->pfit.casf.win_size =3D=3D 1)
>  		filtercoeff =3D filtercoeff_2;
>  	else
>  		filtercoeff =3D filtercoeff_3;
> @@ -233,7 +233,7 @@ static void intel_casf_scaler_compute_coeff(struct in=
tel_crtc_state *crtc_state)
>=20=20
>  	for (i =3D 0; i < SCALER_FILTER_NUM_TAPS; i++) {
>  		filter_coeff[i] =3D (*(filtercoeff + i) * 100 / sum_coeff);
> -		convert_sharpness_coeff_binary(&crtc_state->pch_pfit.casf.coeff[i],
> +		convert_sharpness_coeff_binary(&crtc_state->pfit.casf.coeff[i],
>  					      filter_coeff[i]);
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drive=
rs/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 92675a88b969..f30d07bc6b07 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -356,15 +356,15 @@ void intel_crtc_state_dump(const struct intel_crtc_=
state *pipe_config,
>  			   pipe_config->gmch_pfit.pgm_ratios,
>  			   pipe_config->gmch_pfit.lvds_border_bits);
>  	else
> -		drm_printf(&p, "pch pfit: " DRM_RECT_FMT ", %s, force thru: %s\n",
> -			   DRM_RECT_ARG(&pipe_config->pch_pfit.dst),
> -			   str_enabled_disabled(pipe_config->pch_pfit.enabled),
> -			   str_yes_no(pipe_config->pch_pfit.force_thru));
> +		drm_printf(&p, "pfit: " DRM_RECT_FMT ", %s, force thru: %s\n",
> +			   DRM_RECT_ARG(&pipe_config->pfit.dst),
> +			   str_enabled_disabled(pipe_config->pfit.enabled),
> +			   str_yes_no(pipe_config->pfit.force_thru));
>=20=20
>  	drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpne=
ss enable: %d\n",
> -		   pipe_config->pch_pfit.casf.strength,
> -		   pipe_config->pch_pfit.casf.win_size,
> -		   pipe_config->pch_pfit.casf.enable);
> +		   pipe_config->pfit.casf.strength,
> +		   pipe_config->pfit.casf.win_size,
> +		   pipe_config->pfit.casf.enable);
>=20=20
>  	drm_printf(&p, "ips: %i, double wide: %i, drrs: %i\n",
>  		   pipe_config->ips_enabled, pipe_config->double_wide,
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i=
915/display/intel_ddi.c
> index a46ab5d3d70f..2c09fccecbbf 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -562,7 +562,7 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_en=
coder *encoder,
>  			 * eDP when not using the panel fitter, and when not
>  			 * using motion blur mitigation (which we don't
>  			 * support). */
> -			if (crtc_state->pch_pfit.force_thru)
> +			if (crtc_state->pfit.force_thru)
>  				temp |=3D TRANS_DDI_EDP_INPUT_A_ONOFF;
>  			else
>  				temp |=3D TRANS_DDI_EDP_INPUT_A_ON;
> @@ -4560,8 +4560,8 @@ static int intel_ddi_compute_config(struct intel_at=
omic_state *state,
>=20=20
>  	if (display->platform.haswell && crtc->pipe =3D=3D PIPE_A &&
>  	    pipe_config->cpu_transcoder =3D=3D TRANSCODER_EDP)
> -		pipe_config->pch_pfit.force_thru =3D
> -			pipe_config->pch_pfit.enabled ||
> +		pipe_config->pfit.force_thru =3D
> +			pipe_config->pfit.enabled ||
>  			pipe_config->crc_enabled;
>=20=20
>  	if (display->platform.geminilake || display->platform.broxton)
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index d5d4453f283b..723dec35402a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1130,7 +1130,7 @@ static void intel_post_plane_update(struct intel_at=
omic_state *state,
>  		intel_encoders_audio_enable(state, crtc);
>=20=20
>  	if (intel_display_wa(display, INTEL_DISPLAY_WA_14011503117)) {
> -		if (old_crtc_state->pch_pfit.enabled !=3D new_crtc_state->pch_pfit.ena=
bled)
> +		if (old_crtc_state->pfit.enabled !=3D new_crtc_state->pfit.enabled)
>  			adl_scaler_ecc_unmask(new_crtc_state);
>  	}
>=20=20
> @@ -1652,7 +1652,7 @@ static bool glk_need_scaler_clock_gating_wa(const s=
truct intel_crtc_state *crtc_
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>=20=20
> -	return DISPLAY_VER(display) =3D=3D 10 && crtc_state->pch_pfit.enabled;
> +	return DISPLAY_VER(display) =3D=3D 10 && crtc_state->pfit.enabled;
>  }
>=20=20
>  static void glk_pipe_scaler_clock_gating_wa(struct intel_crtc *crtc, boo=
l enable)
> @@ -2052,8 +2052,8 @@ static void get_crtc_power_domains(struct intel_crt=
c_state *crtc_state,
>=20=20
>  	set_bit(POWER_DOMAIN_PIPE(pipe), mask->bits);
>  	set_bit(POWER_DOMAIN_TRANSCODER(cpu_transcoder), mask->bits);
> -	if (crtc_state->pch_pfit.enabled ||
> -	    crtc_state->pch_pfit.force_thru)
> +	if (crtc_state->pfit.enabled ||
> +	    crtc_state->pfit.force_thru)
>  		set_bit(POWER_DOMAIN_PIPE_PANEL_FITTER(pipe), mask->bits);
>=20=20
>  	drm_for_each_encoder_mask(encoder, display->drm,
> @@ -2288,14 +2288,14 @@ static u32 ilk_pipe_pixel_rate(const struct intel=
_crtc_state *crtc_state)
>  	 * PF-ID we'll need to adjust the pixel_rate here.
>  	 */
>=20=20
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pfit.enabled)
>  		return pixel_rate;
>=20=20
>  	drm_rect_init(&src, 0, 0,
>  		      drm_rect_width(&crtc_state->pipe_src) << 16,
>  		      drm_rect_height(&crtc_state->pipe_src) << 16);
>=20=20
> -	return intel_adjusted_rate(&src, &crtc_state->pch_pfit.dst,
> +	return intel_adjusted_rate(&src, &crtc_state->pfit.dst,
>  				   pixel_rate);
>  }
>=20=20
> @@ -2311,14 +2311,14 @@ static u32 ilk_pipe_pixel_rate_cdclk(const struct=
 intel_crtc_state *crtc_state)
>  	 * PF-ID we'll need to adjust the pixel_rate here.
>  	 */
>=20=20
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pfit.enabled)
>  		return pixel_rate;
>=20=20
>  	drm_rect_init(&src, 0, 0,
>  		      drm_rect_width(&crtc_state->pipe_src) << 16,
>  		      drm_rect_height(&crtc_state->pipe_src) << 16);
>=20=20
> -	return intel_adjusted_rate_cdclk(&src, &crtc_state->pch_pfit.dst,
> +	return intel_adjusted_rate_cdclk(&src, &crtc_state->pfit.dst,
>  					 pixel_rate, ppc);
>  }
>=20=20
> @@ -4012,7 +4012,7 @@ static bool hsw_get_transcoder_state(struct intel_c=
rtc *crtc,
>  				    TRANS_DDI_FUNC_CTL(display, pipe_config->cpu_transcoder));
>=20=20
>  		if ((tmp & TRANS_DDI_EDP_INPUT_MASK) =3D=3D TRANS_DDI_EDP_INPUT_A_ONOF=
F)
> -			pipe_config->pch_pfit.force_thru =3D true;
> +			pipe_config->pfit.force_thru =3D true;
>  	}
>=20=20
>  	tmp =3D intel_de_read(display,
> @@ -5475,16 +5475,16 @@ intel_pipe_config_compare(const struct intel_crtc=
_state *current_config,
>  	 * Changing the EDP transcoder input mux
>  	 * (A_ONOFF vs. A_ON) requires a full modeset.
>  	 */
> -	PIPE_CONF_CHECK_BOOL(pch_pfit.force_thru);
> +	PIPE_CONF_CHECK_BOOL(pfit.force_thru);
>=20=20
>  	if (!fastset) {
>  		PIPE_CONF_CHECK_RECT(pipe_src);
>=20=20
> -		PIPE_CONF_CHECK_BOOL(pch_pfit.enabled);
> -		PIPE_CONF_CHECK_RECT(pch_pfit.dst);
> -		PIPE_CONF_CHECK_BOOL(pch_pfit.casf.enable);
> -		PIPE_CONF_CHECK_I(pch_pfit.casf.win_size);
> -		PIPE_CONF_CHECK_I(pch_pfit.casf.strength);
> +		PIPE_CONF_CHECK_BOOL(pfit.enabled);
> +		PIPE_CONF_CHECK_RECT(pfit.dst);
> +		PIPE_CONF_CHECK_BOOL(pfit.casf.enable);
> +		PIPE_CONF_CHECK_I(pfit.casf.win_size);
> +		PIPE_CONF_CHECK_I(pfit.casf.strength);
>=20=20
>  		PIPE_CONF_CHECK_I(scaler_state.scaler_id);
>  		PIPE_CONF_CHECK_I(pixel_rate_cdclk);
> @@ -6775,12 +6775,12 @@ static void intel_pipe_fastset(const struct intel=
_crtc_state *old_crtc_state,
>=20=20
>  	/* on skylake this is done by detaching scalers */
>  	if (DISPLAY_VER(display) >=3D 9) {
> -		if (new_crtc_state->pch_pfit.enabled)
> +		if (new_crtc_state->pfit.enabled)
>  			skl_pfit_enable(new_crtc_state);
>  	} else if (HAS_PCH_SPLIT(display)) {
> -		if (new_crtc_state->pch_pfit.enabled)
> +		if (new_crtc_state->pfit.enabled)
>  			ilk_pfit_enable(new_crtc_state);
> -		else if (old_crtc_state->pch_pfit.enabled)
> +		else if (old_crtc_state->pfit.enabled)
>  			ilk_pfit_disable(old_crtc_state);
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index 0e3083e852d5..b3d55993e41a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1251,13 +1251,13 @@ struct intel_crtc_state {
>  		u32 lvds_border_bits;
>  	} gmch_pfit;
>=20=20
> -	/* Panel fitter placement and size for Ironlake+ */
> +	/* Panel fitter placement and size */
>  	struct {
>  		struct intel_casf casf;
>  		struct drm_rect dst;
>  		bool enabled;
>  		bool force_thru;
> -	} pch_pfit;
> +	} pfit;
>=20=20
>  	/* FDI configuration, only valid if has_pch_encoder is set. */
>  	int fdi_lanes;
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index 5b170c74a510..3e3c69233e58 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -22,7 +22,7 @@ static int intel_pch_pfit_check_dst_window(const struct=
 intel_crtc_state *crtc_s
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  	const struct drm_display_mode *adjusted_mode =3D
>  		&crtc_state->hw.adjusted_mode;
> -	const struct drm_rect *dst =3D &crtc_state->pch_pfit.dst;
> +	const struct drm_rect *dst =3D &crtc_state->pfit.dst;
>  	int width =3D drm_rect_width(dst);
>  	int height =3D drm_rect_height(dst);
>  	int x =3D dst->x1;
> @@ -109,7 +109,7 @@ static int intel_pch_pfit_check_scaling(const struct =
intel_crtc_state *crtc_stat
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> -	const struct drm_rect *dst =3D &crtc_state->pch_pfit.dst;
> +	const struct drm_rect *dst =3D &crtc_state->pfit.dst;
>  	int pipe_src_w =3D drm_rect_width(&crtc_state->pipe_src);
>  	int pipe_src_h =3D drm_rect_height(&crtc_state->pipe_src);
>  	int hscale, vscale, max_scale =3D 0x12000; /* 1.125 */
> @@ -271,9 +271,9 @@ static int pch_panel_fitting(struct intel_crtc_state =
*crtc_state,
>  		return -EINVAL;
>  	}
>=20=20
> -	drm_rect_init(&crtc_state->pch_pfit.dst,
> +	drm_rect_init(&crtc_state->pfit.dst,
>  		      x, y, width, height);
> -	crtc_state->pch_pfit.enabled =3D true;
> +	crtc_state->pfit.enabled =3D true;
>=20=20
>  	/*
>  	 * SKL+ have unified scalers for pipes/planes so the
> @@ -594,14 +594,14 @@ void ilk_pfit_enable(const struct intel_crtc_state =
*crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> -	const struct drm_rect *dst =3D &crtc_state->pch_pfit.dst;
> +	const struct drm_rect *dst =3D &crtc_state->pfit.dst;
>  	enum pipe pipe =3D crtc->pipe;
>  	int width =3D drm_rect_width(dst);
>  	int height =3D drm_rect_height(dst);
>  	int x =3D dst->x1;
>  	int y =3D dst->y1;
>=20=20
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pfit.enabled)
>  		return;
>=20=20
>  	/*
> @@ -630,7 +630,7 @@ void ilk_pfit_disable(const struct intel_crtc_state *=
old_crtc_state)
>  	 * To avoid upsetting the power well on haswell only disable the pfit if
>  	 * it's in use. The hw state code will make sure we get this right.
>  	 */
> -	if (!old_crtc_state->pch_pfit.enabled)
> +	if (!old_crtc_state->pfit.enabled)
>  		return;
>=20=20
>  	intel_de_write_fw(display, PF_CTL(pipe), 0);
> @@ -654,12 +654,12 @@ void ilk_pfit_get_config(struct intel_crtc_state *c=
rtc_state)
>  	else
>  		pipe =3D crtc->pipe;
>=20=20
> -	crtc_state->pch_pfit.enabled =3D true;
> +	crtc_state->pfit.enabled =3D true;
>=20=20
>  	pos =3D intel_de_read(display, PF_WIN_POS(crtc->pipe));
>  	size =3D intel_de_read(display, PF_WIN_SZ(crtc->pipe));
>=20=20
> -	drm_rect_init(&crtc_state->pch_pfit.dst,
> +	drm_rect_init(&crtc_state->pfit.dst,
>  		      REG_FIELD_GET(PF_WIN_XPOS_MASK, pos),
>  		      REG_FIELD_GET(PF_WIN_YPOS_MASK, pos),
>  		      REG_FIELD_GET(PF_WIN_XSIZE_MASK, size),
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/=
i915/display/skl_scaler.c
> index 7994b983d509..0be6808bc2e4 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -276,9 +276,9 @@ int skl_update_scaler_crtc(struct intel_crtc_state *c=
rtc_state)
>  	if (ret)
>  		return ret;
>=20=20
> -	if (crtc_state->pch_pfit.enabled) {
> -		width =3D drm_rect_width(&crtc_state->pch_pfit.dst);
> -		height =3D drm_rect_height(&crtc_state->pch_pfit.dst);
> +	if (crtc_state->pfit.enabled) {
> +		width =3D drm_rect_width(&crtc_state->pfit.dst);
> +		height =3D drm_rect_height(&crtc_state->pfit.dst);
>  	} else {
>  		width =3D pipe_mode->crtc_hdisplay;
>  		height =3D pipe_mode->crtc_vdisplay;
> @@ -289,7 +289,7 @@ int skl_update_scaler_crtc(struct intel_crtc_state *c=
rtc_state)
>  				 drm_rect_width(&crtc_state->pipe_src),
>  				 drm_rect_height(&crtc_state->pipe_src),
>  				 width, height, NULL, 0,
> -				 crtc_state->pch_pfit.enabled);
> +				 crtc_state->pfit.enabled);
>  }
>=20=20
>  /**
> @@ -482,7 +482,7 @@ static int intel_atomic_setup_scaler(struct intel_crt=
c_state *crtc_state,
>  		}
>  	}
>=20=20
> -	if (crtc_state->pch_pfit.enabled) {
> +	if (crtc_state->pfit.enabled) {
>  		struct drm_rect src;
>  		int max_hscale, max_vscale;
>=20=20
> @@ -503,9 +503,9 @@ static int intel_atomic_setup_scaler(struct intel_crt=
c_state *crtc_state,
>  			max_vscale =3D 0x10000;
>  		}
>=20=20
> -		hscale =3D drm_rect_calc_hscale(&src, &crtc_state->pch_pfit.dst,
> +		hscale =3D drm_rect_calc_hscale(&src, &crtc_state->pfit.dst,
>  					      0, max_hscale);
> -		vscale =3D drm_rect_calc_vscale(&src, &crtc_state->pch_pfit.dst,
> +		vscale =3D drm_rect_calc_vscale(&src, &crtc_state->pfit.dst,
>  					      0, max_vscale);
>=20=20
>  		if (hscale < 0 || vscale < 0) {
> @@ -513,7 +513,7 @@ static int intel_atomic_setup_scaler(struct intel_crt=
c_state *crtc_state,
>  				    "Scaler %d doesn't support required pipe scaling\n",
>  				    *scaler_id);
>  			drm_rect_debug_print("src: ", &src, true);
> -			drm_rect_debug_print("dst: ", &crtc_state->pch_pfit.dst, false);
> +			drm_rect_debug_print("dst: ", &crtc_state->pfit.dst, false);
>=20=20
>  			return -EINVAL;
>  		}
> @@ -542,7 +542,7 @@ static int setup_crtc_scaler(struct intel_atomic_stat=
e *state,
>  					 hweight32(scaler_state->scaler_users),
>  					 crtc, "CRTC", crtc->base.base.id,
>  					 NULL, &scaler_state->scaler_id,
> -					 crtc_state->pch_pfit.casf.enable);
> +					 crtc_state->pfit.casf.enable);
>  }
>=20=20
>  static int setup_plane_scaler(struct intel_atomic_state *state,
> @@ -760,12 +760,12 @@ static void skl_scaler_setup_filter(struct intel_di=
splay *display,
>=20=20
>  static u32 casf_sharpness_ctl(const struct intel_crtc_state *crtc_state)
>  {
> -	if (!crtc_state->pch_pfit.casf.enable)
> +	if (!crtc_state->pfit.casf.enable)
>  		return 0;
>=20=20
>  	return FILTER_EN |
> -		FILTER_STRENGTH(crtc_state->pch_pfit.casf.strength) |
> -		crtc_state->pch_pfit.casf.win_size;
> +		FILTER_STRENGTH(crtc_state->pfit.casf.strength) |
> +		crtc_state->pfit.casf.win_size;
>  }
>=20=20
>  void skl_pfit_enable(const struct intel_crtc_state *crtc_state)
> @@ -774,7 +774,7 @@ void skl_pfit_enable(const struct intel_crtc_state *c=
rtc_state)
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  	const struct intel_crtc_scaler_state *scaler_state =3D
>  		&crtc_state->scaler_state;
> -	const struct drm_rect *dst =3D &crtc_state->pch_pfit.dst;
> +	const struct drm_rect *dst =3D &crtc_state->pfit.dst;
>  	u16 uv_rgb_hphase, uv_rgb_vphase;
>  	enum pipe pipe =3D crtc->pipe;
>  	int width =3D drm_rect_width(dst);
> @@ -786,7 +786,7 @@ void skl_pfit_enable(const struct intel_crtc_state *c=
rtc_state)
>  	int id;
>  	u32 ps_ctrl;
>=20=20
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pfit.enabled)
>  		return;
>=20=20
>  	if (drm_WARN_ON(display->drm,
> @@ -810,11 +810,11 @@ void skl_pfit_enable(const struct intel_crtc_state =
*crtc_state)
>=20=20
>  	ps_ctrl =3D PS_SCALER_EN | PS_BINDING_PIPE | scaler_state->scalers[id].=
mode |
>  		skl_scaler_get_filter_select(crtc_state->hw.scaling_filter,
> -					     crtc_state->pch_pfit.casf.enable);
> +					     crtc_state->pfit.casf.enable);
>=20=20
>  	trace_intel_pipe_scaler_update_arm(crtc, id, x, y, width, height);
>=20=20
> -	if (crtc_state->pch_pfit.casf.enable)
> +	if (crtc_state->pfit.casf.enable)
>  		intel_casf_setup(crtc_state);
>  	else
>  		skl_scaler_setup_filter(display, NULL, pipe, id, 0,
> @@ -977,12 +977,12 @@ void skl_scaler_get_config(struct intel_crtc_state =
*crtc_state)
>  	if (scaler_has_casf(display, scaler_id))
>  		intel_casf_sharpness_get_config(crtc_state);
>=20=20
> -	crtc_state->pch_pfit.enabled =3D true;
> +	crtc_state->pfit.enabled =3D true;
>=20=20
>  	pos =3D intel_de_read(display, SKL_PS_WIN_POS(crtc->pipe, scaler_id));
>  	size =3D intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, scaler_id));
>=20=20
> -	drm_rect_init(&crtc_state->pch_pfit.dst,
> +	drm_rect_init(&crtc_state->pfit.dst,
>  		      REG_FIELD_GET(PS_WIN_XPOS_MASK, pos),
>  		      REG_FIELD_GET(PS_WIN_YPOS_MASK, pos),
>  		      REG_FIELD_GET(PS_WIN_XSIZE_MASK, size),
> @@ -998,7 +998,7 @@ void adl_scaler_ecc_mask(const struct intel_crtc_stat=
e *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>=20=20
> -	if (!crtc_state->pch_pfit.enabled)
> +	if (!crtc_state->pfit.enabled)
>  		return;
>=20=20
>  	intel_de_write(display, XELPD_DISPLAY_ERR_FATAL_MASK, ~0);
> @@ -1056,7 +1056,7 @@ unsigned int skl_scaler_2nd_prefill_lines(const str=
uct intel_crtc_state *crtc_st
>  		&crtc_state->scaler_state;
>  	int num_scalers =3D hweight32(scaler_state->scaler_users);
>=20=20
> -	if (num_scalers > 1 && crtc_state->pch_pfit.enabled)
> +	if (num_scalers > 1 && crtc_state->pfit.enabled)
>  		return 4 << 16;
>=20=20
>  	return 0;

--=20
Jani Nikula, Intel
