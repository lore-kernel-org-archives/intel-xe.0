Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165A606AAD9
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PIoviE7T
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C07410E9C4;
	Mon, 19 Oct 2026 16:02:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99C810E9D2;
 Mon, 19 Oct 2026 16:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792425729; x=1823961729;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=MHDEmiAMTaJW4Df05tBuUP7urfxofgdfoh/3R3DscMU=;
 b=PIoviE7TXIu6G7NYrrmUA9K9PKSn2ZMDwe/1Ec7U6R+nkHqQeK30ofnI
 U5bQabudqPlSs/BJHTY9lMwY+h4POv6MZOp++d+mgn8zQVWd4i7gDXK9Z
 CJ2rHtQe9htzdQvRcfJICxZrDF2skQZpyZ+ZchN4nZP69wyRWg1hEuhk9
 2jIS0NcgJBsbCV2w47JGvlZ+lp8hODpjdR+J75WQTsWVxPZuIOHs9Vg2g
 JEjgrEPGunoxwYKkXxV9SgvUbRCWwcTfLoV/76lrdt09X8iD0WckjumS0
 7TOg4187C0IUYKKT8KZnS3RLv/G757jypjIavfSoBaiMdDlAtcKP6+MKM Q==;
X-CSE-ConnectionGUID: Yb8eq5y1RnWvsBZuc1DDVA==
X-CSE-MsgGUID: QcBu2eZTQHKAWEZhrjeUqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1009769"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1009769"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:02:08 -0700
X-CSE-ConnectionGUID: sT+MBRqJQNWQVcvZBhj9bA==
X-CSE-MsgGUID: q0P3FjzZRLW9bKbF9nqo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2558057"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 09:02:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 06/15] drm/i915/pfit: Extract i965_pfit_get_config()
In-Reply-To: <20261019135309.23578-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-7-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 19:02:04 +0300
Message-ID: <46d5472ad05b1bffc3580dc5cb3194aa0e966446@intel.com>
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
> Split i965_pfit_get_config() out from i9xx_pfit_get_config() to
> unconfuse things a bit.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 66 ++++++++++++++---------
>  1 file changed, 42 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index 972218346362..82804159d0a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -720,39 +720,52 @@ void i9xx_pfit_disable(const struct intel_crtc_stat=
e *old_crtc_state)
>  	intel_de_write(display, PFIT_CONTROL(display), 0);
>  }
>=20=20
> -static bool i9xx_has_pfit(struct intel_display *display)
> -{
> -	if (display->platform.i830)
> -		return false;
> -
> -	return DISPLAY_VER(display) >=3D 4 ||
> -		display->platform.pineview || display->platform.mobile;
> -}
> -
> -static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
> +static void i965_pfit_get_config(struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
>  	enum pipe pipe;
>  	u32 tmp;
>=20=20
> -	if (!i9xx_has_pfit(display))
> -		return;
> -
>  	tmp =3D intel_de_read(display, PFIT_CONTROL(display));
>  	if (!(tmp & PFIT_ENABLE))
>  		return;
>=20=20
>  	/* Check whether the pfit is attached to our pipe. */
> -	if (DISPLAY_VER(display) >=3D 4)
> -		pipe =3D REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> -	else
> -		pipe =3D PIPE_B;
> -
> +	pipe =3D REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
>  	if (pipe !=3D crtc->pipe)
>  		return;
>=20=20
>  	crtc_state->gmch_pfit.control =3D tmp;

This drops PFIT_PGM_RATIOS read.

With that fixed,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +}
> +
> +static bool i9xx_has_pfit(struct intel_crtc *crtc)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc);
> +
> +	if (crtc->pipe !=3D PIPE_B)
> +		return false;
> +
> +	if (display->platform.i830)
> +		return false;
> +
> +	return display->platform.pineview || display->platform.mobile;
> +}
> +
> +static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 tmp;
> +
> +	if (!i9xx_has_pfit(crtc))
> +		return;
> +
> +	tmp =3D intel_de_read(display, PFIT_CONTROL(display));
> +	if (!(tmp & PFIT_ENABLE))
> +		return;
> +
> +	crtc_state->gmch_pfit.control =3D tmp;
>  	crtc_state->gmch_pfit.pgm_ratios =3D
>  		intel_de_read(display, PFIT_PGM_RATIOS(display));
>  }
> @@ -761,10 +774,15 @@ void intel_pfit_get_config(struct intel_crtc_state =
*crtc_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>=20=20
> -	if (HAS_GMCH(display))
> -		i9xx_pfit_get_config(crtc_state);
> -	else if (DISPLAY_VER(display) >=3D 9)
> -		skl_scaler_get_config(crtc_state);
> -	else
> -		ilk_pfit_get_config(crtc_state);
> +	if (HAS_GMCH(display)) {
> +		if (DISPLAY_VER(display) >=3D 4)
> +			i965_pfit_get_config(crtc_state);
> +		else
> +			i9xx_pfit_get_config(crtc_state);
> +	} else {
> +		if (DISPLAY_VER(display) >=3D 9)
> +			skl_scaler_get_config(crtc_state);
> +		else
> +			ilk_pfit_get_config(crtc_state);
> +	}
>  }

--=20
Jani Nikula, Intel
