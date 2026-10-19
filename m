Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26461606AAC3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5N53cwD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D238710E9CE;
	Mon, 19 Oct 2026 15:53:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3A10E9CE;
 Mon, 19 Oct 2026 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792425187; x=1823961187;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Eq+voiAL5pHtOBGi8Dcd6yjT+u2WfS8raYgf1SHpa+s=;
 b=h5N53cwD+loW1JSvQgZqF84xkNfozbo1g49fvInQoERZELIT71aJoaMQ
 HKinZjSds+Qwu/Hiw7jtndR9Z/BfNDY3tv1jM5hXqHNEClS4BBEpyAcZ8
 jBblTc1LmkFq6MKqpvnJ0dbCx0UFYcdtwH837h2LzoqbrQ0kBMcOyQRW5
 DwXv9TZHDTXDqDn6y9d7PuB5Eq7L3ygR1qeVrk+Q3x/kn+j0pr3lCQNcZ
 U28TChsAlAU3unYGPQ3HM5CVnAbpMdaHSqd6B1RPB72UoFM/MR/bNyrLs
 spYJubAHIa1RTXN998WWXTDkXWE879GUIzU0e9RgUXshdSGk/OSUHeKUu g==;
X-CSE-ConnectionGUID: Rdh57ccsSg6YpTgkfu4+Vw==
X-CSE-MsgGUID: 7Yqb1QQKRWey48hHIFjQPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1148376"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1148376"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:53:06 -0700
X-CSE-ConnectionGUID: FpN4n4mwTKimtiC7BhuW9w==
X-CSE-MsgGUID: DizqHs7dTmiZq0HHmiBukQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2938443"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:53:06 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/15] drm/i915/pfit: Introduce intel_pfit_get_config()
In-Reply-To: <20261019135309.23578-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-5-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 18:53:02 +0300
Message-ID: <13d85cc5e224344205695f115659f55a859153c1@intel.com>
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
> Introduce a new intel_pfit_get_config() wrapper to better
> contain the pfit details inside intel_pfit.c.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 12 ++++--------
>  drivers/gpu/drm/i915/display/intel_pfit.c    | 16 ++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_pfit.h    |  3 +--
>  3 files changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/d=
rm/i915/display/intel_display.c
> index d1440cc6dba4..79c4aff1c633 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -3236,7 +3236,7 @@ static bool i9xx_get_pipe_config(struct intel_crtc =
*crtc,
>  	intel_get_transcoder_timings(crtc, pipe_config);
>  	intel_get_pipe_src_size(crtc, pipe_config);
>=20=20
> -	i9xx_pfit_get_config(pipe_config);
> +	intel_pfit_get_config(pipe_config);
>=20=20
>  	i9xx_dpll_get_hw_state(crtc, &pipe_config->dpll_hw_state);
>=20=20
> @@ -3586,7 +3586,7 @@ static bool ilk_get_pipe_config(struct intel_crtc *=
crtc,
>  	intel_get_transcoder_timings(crtc, pipe_config);
>  	intel_get_pipe_src_size(crtc, pipe_config);
>=20=20
> -	ilk_pfit_get_config(pipe_config);
> +	intel_pfit_get_config(pipe_config);
>=20=20
>  	ret =3D true;
>=20=20
> @@ -4153,12 +4153,8 @@ static bool hsw_get_pipe_config(struct intel_crtc =
*crtc,
>  			REG_FIELD_GET(HSW_IPS_LINETIME_MASK, tmp);
>=20=20
>  	if (intel_display_power_get_in_set_if_enabled(display, &crtc->hw_readou=
t_power_domains,
> -						      POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe))) {
> -		if (DISPLAY_VER(display) >=3D 9)
> -			skl_scaler_get_config(pipe_config);
> -		else
> -			ilk_pfit_get_config(pipe_config);
> -	}
> +						      POWER_DOMAIN_PIPE_PANEL_FITTER(crtc->pipe)))
> +		intel_pfit_get_config(pipe_config);
>=20=20
>  	hsw_ips_get_config(pipe_config);
>=20=20
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index aa4a4d10d124..b4a201dc8f7b 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -638,7 +638,7 @@ void ilk_pfit_disable(const struct intel_crtc_state *=
old_crtc_state)
>  	intel_de_write_fw(display, PF_WIN_SZ(pipe), 0);
>  }
>=20=20
> -void ilk_pfit_get_config(struct intel_crtc_state *crtc_state)
> +static void ilk_pfit_get_config(struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -724,7 +724,7 @@ static bool i9xx_has_pfit(struct intel_display *displ=
ay)
>  		display->platform.pineview || display->platform.mobile;
>  }
>=20=20
> -void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
> +static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -751,3 +751,15 @@ void i9xx_pfit_get_config(struct intel_crtc_state *c=
rtc_state)
>  	crtc_state->gmch_pfit.pgm_ratios =3D
>  		intel_de_read(display, PFIT_PGM_RATIOS(display));
>  }
> +
> +void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +
> +	if (HAS_GMCH(display))
> +		i9xx_pfit_get_config(crtc_state);
> +	else if (DISPLAY_VER(display) >=3D 9)
> +		skl_scaler_get_config(crtc_state);
> +	else
> +		ilk_pfit_get_config(crtc_state);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.h b/drivers/gpu/drm/=
i915/display/intel_pfit.h
> index c1bb0d1f344e..184e1932eae5 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.h
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.h
> @@ -17,10 +17,9 @@ int intel_pfit_compute_config(struct intel_crtc_state =
*crtc_state,
>  			      const struct drm_connector_state *conn_state);
>  void ilk_pfit_enable(const struct intel_crtc_state *crtc_state);
>  void ilk_pfit_disable(const struct intel_crtc_state *old_crtc_state);
> -void ilk_pfit_get_config(struct intel_crtc_state *crtc_state);
>  void i9xx_pfit_enable(const struct intel_crtc_state *crtc_state);
>  void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state);
> -void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state);
> +void intel_pfit_get_config(struct intel_crtc_state *crtc_state);
>  enum drm_mode_status
>  intel_pfit_mode_valid(struct intel_display *display,
>  		      const struct drm_display_mode *mode,

--=20
Jani Nikula, Intel
