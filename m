Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901DB606DA43
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jE/TnuUX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363AA10EE8F;
	Mon, 19 Oct 2026 15:49:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6944210EEC2;
 Mon, 19 Oct 2026 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792424944; x=1823960944;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oyuWe1UR70hbO7XOhqcv4GpHIUbbV+XMczIFL2DraFk=;
 b=jE/TnuUXHPeQ4ysodqtjxCpzbpnsJb9N5PLsC3ByU3tQWnUsnQ1CPgk+
 bi32ITDg2XQm60MlQf8vpm1F/nv2J8SIWEljN55oIL4OG0Uze2Co5zfq/
 u7XbFDiUPALakDNQOP5cidH6V2sxS1b44Ud/0RzHd/yLmNbPhKGHo611J
 NIa5RpxVyVsfUlkpn2BIMzFLVGpveYypqp7DI5MD6VW69qg99I95x3Ion
 NknNwwQm9wKyqugq5LRJVdzfkFJnLJCd8q6/gpabbxmPcFQGj4aSD0doM
 ZUCjpmrxVwL7Oai1VPQzZ6RNVD7w+brNsK6osewFPrlUr8O3/HWIW3riG Q==;
X-CSE-ConnectionGUID: S5hmZbglQM+ljpsRSEGF3w==
X-CSE-MsgGUID: MIz/IKakQ2iz7otqeLb0Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="994860"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="994860"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:49:04 -0700
X-CSE-ConnectionGUID: GFp1W8ZxQaaXwYuKUfhmWg==
X-CSE-MsgGUID: XDtiPsWeRrSt/JD8tltSew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2566890"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 08:49:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 02/15] drm/i915/pfit: s/intel_pch_pfit/ilk_pfit/
In-Reply-To: <20261019135309.23578-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-3-ville.syrjala@linux.intel.com>
Date: Mon, 19 Oct 2026 18:49:00 +0300
Message-ID: <9326f3d01f33e188109229f769e8f68192b0a56d@intel.com>
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
> The intel_pch_pfit_*() have nothing to do with PCH. Rename
> them to just ilk_pfit_*() to better reflect their meaning.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/=
i915/display/intel_pfit.c
> index 3e3c69233e58..aa4a4d10d124 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -16,7 +16,7 @@
>  #include "intel_pfit_regs.h"
>  #include "skl_scaler.h"
>=20=20
> -static int intel_pch_pfit_check_dst_window(const struct intel_crtc_state=
 *crtc_state)
> +static int ilk_pfit_check_dst_window(const struct intel_crtc_state *crtc=
_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -67,7 +67,7 @@ static int intel_pch_pfit_check_dst_window(const struct=
 intel_crtc_state *crtc_s
>  	return 0;
>  }
>=20=20
> -static int intel_pch_pfit_check_src_size(const struct intel_crtc_state *=
crtc_state)
> +static int ilk_pfit_check_src_size(const struct intel_crtc_state *crtc_s=
tate)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -105,7 +105,7 @@ static int intel_pch_pfit_check_src_size(const struct=
 intel_crtc_state *crtc_sta
>  	return 0;
>  }
>=20=20
> -static int intel_pch_pfit_check_scaling(const struct intel_crtc_state *c=
rtc_state)
> +static int ilk_pfit_check_scaling(const struct intel_crtc_state *crtc_st=
ate)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -140,7 +140,7 @@ static int intel_pch_pfit_check_scaling(const struct =
intel_crtc_state *crtc_stat
>  	return 0;
>  }
>=20=20
> -static int intel_pch_pfit_check_timings(const struct intel_crtc_state *c=
rtc_state)
> +static int ilk_pfit_check_timings(const struct intel_crtc_state *crtc_st=
ate)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -158,7 +158,7 @@ static int intel_pch_pfit_check_timings(const struct =
intel_crtc_state *crtc_stat
>  	return 0;
>  }
>=20=20
> -static int intel_pch_pfit_check_cloning(const struct intel_crtc_state *c=
rtc_state)
> +static int ilk_pfit_check_cloning(const struct intel_crtc_state *crtc_st=
ate)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
>  	struct intel_crtc *crtc =3D to_intel_crtc(crtc_state->uapi.crtc);
> @@ -182,7 +182,7 @@ static int intel_pch_pfit_check_cloning(const struct =
intel_crtc_state *crtc_stat
>  }
>=20=20
>  /* adjusted_mode has been preset to be the panel's fixed mode */
> -static int pch_panel_fitting(struct intel_crtc_state *crtc_state,
> +static int ilk_panel_fitting(struct intel_crtc_state *crtc_state,
>  			     const struct drm_connector_state *conn_state)
>  {
>  	struct intel_display *display =3D to_intel_display(crtc_state);
> @@ -282,23 +282,23 @@ static int pch_panel_fitting(struct intel_crtc_stat=
e *crtc_state,
>  	if (DISPLAY_VER(display) >=3D 9)
>  		return 0;
>=20=20
> -	ret =3D intel_pch_pfit_check_dst_window(crtc_state);
> +	ret =3D ilk_pfit_check_dst_window(crtc_state);
>  	if (ret)
>  		return ret;
>=20=20
> -	ret =3D intel_pch_pfit_check_src_size(crtc_state);
> +	ret =3D ilk_pfit_check_src_size(crtc_state);
>  	if (ret)
>  		return ret;
>=20=20
> -	ret =3D intel_pch_pfit_check_scaling(crtc_state);
> +	ret =3D ilk_pfit_check_scaling(crtc_state);
>  	if (ret)
>  		return ret;
>=20=20
> -	ret =3D intel_pch_pfit_check_timings(crtc_state);
> +	ret =3D ilk_pfit_check_timings(crtc_state);
>  	if (ret)
>  		return ret;
>=20=20
> -	ret =3D intel_pch_pfit_check_cloning(crtc_state);
> +	ret =3D ilk_pfit_check_cloning(crtc_state);
>  	if (ret)
>  		return ret;
>=20=20
> @@ -587,7 +587,7 @@ int intel_pfit_compute_config(struct intel_crtc_state=
 *crtc_state,
>  	if (HAS_GMCH(display))
>  		return gmch_panel_fitting(crtc_state, conn_state);
>  	else
> -		return pch_panel_fitting(crtc_state, conn_state);
> +		return ilk_panel_fitting(crtc_state, conn_state);
>  }
>=20=20
>  void ilk_pfit_enable(const struct intel_crtc_state *crtc_state)

--=20
Jani Nikula, Intel
