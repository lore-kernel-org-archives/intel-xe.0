Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E5A6075522
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HZTn/ZKz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E1A10E9D5;
	Mon, 19 Oct 2026 16:01:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D0510E96B;
 Mon, 19 Oct 2026 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792425697; x=1823961697;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZNKhGN0xHHX3uI4whMcwn5PtNqLq8ligYOjC329MJAg=;
 b=HZTn/ZKz28Sul3fLRUlytOW+dTM2157swp6m5tdmyeDjeQSaBOWSxqTz
 st8UWg9Wbfov5VQ07SWbDiazMvISxP4m99kLt6em4GtVrMCzjaHHmrYfs
 n8bQ7TifuL+fgTa2c8ziWuRNLrqcbKkTC8ukb1F14a2IWyrigf7o9L9/S
 XWnnUPPm7Rj6MpfOVzbgVRgAwdD9/PZJMdqMdwQv94Zmcc7+/NPc0dpnh
 NJsIS55MFTNeD6Wz5OUYrfpno2F1th3VY6HqNO+U4xc4ufGg85+inkNZ1
 EJSln58FmoD9sx7ZlecHq35+5/fMt9HAT+YYlzGnFjDILXfrAr0HE9mju Q==;
X-CSE-ConnectionGUID: l2KwC5k9RYWFD9KupJc3gA==
X-CSE-MsgGUID: 3cl1pcXFRcSPBTZ4cZ9mjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1126388"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1126388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:54:36 -0700
X-CSE-ConnectionGUID: ymh+qgt1Q3WAtEdGzOmPTg==
X-CSE-MsgGUID: pb/40nSRSvqm5e3Q7U7iGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2672124"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:54:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 05/15] drm/i915/pfit: Rename some pfit functions
In-Reply-To: <20261019135309.23578-6-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-6-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 18:54:32 +0300
Message-ID: <3f8fb4d487b934bb5dd4ed128cf5ac9fb488b9c5@intel.com>
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
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Most pfit functions are called {ilk,i9xx}_pfit_*(). Rename
> {gmch,ilk}_panel_fitting() and intel_gmch_pfit_check_timings()
> to match.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index b4a201dc8f7b..972218346362 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -182,8 +182,8 @@ static int ilk_pfit_check_cloning(const struct intel_=
crtc_state *crtc_state)
>  }
>=20=20
>  /* adjusted_mode has been preset to be the panel's fixed mode */
> -static int ilk_panel_fitting(struct intel_crtc_state *crtc_state,
> -			     const struct drm_connector_state *conn_state)
> +static int ilk_pfit_compute_config(struct intel_crtc_state *crtc_state,
> +				   const struct drm_connector_state *conn_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -438,7 +438,7 @@ static void i9xx_scale_aspect(struct intel_crtc_state=
 *crtc_state,
>  	}
>  }
>=20=20
> -static int intel_gmch_pfit_check_timings(const struct intel_crtc_state *=
crtc_state)
> +static int i9xx_pfit_check_timings(const struct intel_crtc_state *crtc_s=
tate)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -470,8 +470,8 @@ static int intel_gmch_pfit_check_timings(const struct=
 intel_crtc_state *crtc_sta
>  	return 0;
>  }
>=20=20
> -static int gmch_panel_fitting(struct intel_crtc_state *crtc_state,
> -			      const struct drm_connector_state *conn_state)
> +static int i9xx_pfit_compute_config(struct intel_crtc_state *crtc_state,
> +				    const struct drm_connector_state *conn_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -479,6 +479,7 @@ static int gmch_panel_fitting(struct intel_crtc_state=
 *crtc_state,
>  	struct drm_display_mode *adjusted_mode =3D &crtc_state->hw.adjusted_mod=
e;
>  	int pipe_src_w =3D drm_rect_width(&crtc_state->pipe_src);
>  	int pipe_src_h =3D drm_rect_height(&crtc_state->pipe_src);
> +	int ret;
>=20=20
>  	/* Native modes don't need fitting */
>  	if (adjusted_mode->crtc_hdisplay =3D=3D pipe_src_w &&
> @@ -566,7 +567,11 @@ static int gmch_panel_fitting(struct intel_crtc_stat=
e *crtc_state,
>  	if ((pfit_control & PFIT_ENABLE) =3D=3D 0)
>  		return 0;
>=20=20
> -	return intel_gmch_pfit_check_timings(crtc_state);
> +	ret =3D i9xx_pfit_check_timings(crtc_state);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
>  }
>=20=20
>  enum drm_mode_status
> @@ -585,9 +590,9 @@ int intel_pfit_compute_config(struct intel_crtc_state=
 *crtc_state,
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>=20=20
>  	if (HAS_GMCH(display))
> -		return gmch_panel_fitting(crtc_state, conn_state);
> +		return i9xx_pfit_compute_config(crtc_state, conn_state);
>  	else
> -		return ilk_panel_fitting(crtc_state, conn_state);
> +		return ilk_pfit_compute_config(crtc_state, conn_state);
>  }
>=20=20
>  void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)

--=20
Jani Nikula, Intel
