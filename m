Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38554CD98C6
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB9D10EB46;
	Wed, 10 Jun 2026 17:38:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkPzaIYI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA5810E6C0;
 Wed, 10 Jun 2026 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781113135; x=1812649135;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=t7m/SkIUP3at+KRcdDUw8ZbV0EvETxcnnQ5bfPW/p2U=;
 b=WkPzaIYIt/743moIT0RSAKgdtJy8mxbEsxbbUvB9mkC8izeyzou1t3Cx
 Pli6X4DdqAt2xanvcfc1ZT8Wejd+SkgzfgaaCwJvas8MxK3e83WO9/49n
 phx4dQwTACKrCWAhRWCkJTpLqbI5xJOB2uwLkroZH0yD6z2LyW+t4joAl
 5zk0UMao92VuKVkH94/pEVh65FUpnnFYj4rGdF0PODIqGdx9B7JFl0aRC
 09terJELa5umf2RpkHQG+xzYEOBvJntgm2gENnCNZ4JXmZQ7A1EBbeYwh
 d3hlirc+EpvIQWEp6ANsTITZsP1fwc00lAkPix+5aCqoBD/ZbZKU7bheB w==;
X-CSE-ConnectionGUID: z0DfEvQbQJyeNp0ymjI7eA==
X-CSE-MsgGUID: rZcm3g0STF23iV7mw721OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82024299"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="82024299"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:38:55 -0700
X-CSE-ConnectionGUID: M5X4EX/5QWOOGoptG8qfYg==
X-CSE-MsgGUID: JbF0waf6ROWXqte5jqt7wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="250152470"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:38:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 11/14] drm/i915/cdclk: Extract skl_cdclk_pcode_{pre,
 post}_notify()
In-Reply-To: <20260610170652.5320-12-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-12-ville.syrjala@linux.intel.com>
Date: Wed, 10 Jun 2026 20:38:50 +0300
Message-ID: <8e57317fbcbf5dba0923c386881045705744503c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 10 Jun 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Extract the SKL/ICL+ pcode notify stuff to a few small helpers.
> The plan is to unify these between all the platforms and turn
> them into vfuncs.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 32 +++++++++++++---------
>  1 file changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index 041b1fc8b3ee..bb47fc4c86ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1170,6 +1170,21 @@ static u32 skl_cdclk_freq_sel(struct intel_display=
 *display,
>  	}
>  }
>=20=20
> +static int skl_cdclk_pcode_pre_notify(struct intel_display *display)
> +{
> +	return intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
> +					  SKL_CDCLK_PREPARE_FOR_CHANGE,
> +					  SKL_CDCLK_READY_FOR_CHANGE,
> +					  SKL_CDCLK_READY_FOR_CHANGE, 3);
> +}
> +
> +static int skl_cdclk_pcode_post_notify(struct intel_display *display,
> +				       const struct intel_cdclk_config *cdclk_config)
> +{
> +	return intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
> +					cdclk_config->voltage_level);
> +}
> +
>  static void skl_set_cdclk(struct intel_display *display,
>  			  const struct intel_cdclk_config *cdclk_config,
>  			  enum pipe pipe)
> @@ -1190,10 +1205,7 @@ static void skl_set_cdclk(struct intel_display *di=
splay,
>  	drm_WARN_ON_ONCE(display->drm,
>  			 display->platform.skylake && vco =3D=3D 8640000);
>=20=20
> -	ret =3D intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
> -					 SKL_CDCLK_PREPARE_FOR_CHANGE,
> -					 SKL_CDCLK_READY_FOR_CHANGE,
> -					 SKL_CDCLK_READY_FOR_CHANGE, 3);
> +	ret =3D skl_cdclk_pcode_pre_notify(display);
>  	if (ret) {
>  		drm_err(display->drm,
>  			"Failed to inform PCODE about start of CDCLK change (%d)\n", ret);
> @@ -1235,9 +1247,7 @@ static void skl_set_cdclk(struct intel_display *dis=
play,
>  	intel_de_write(display, CDCLK_CTL, cdclk_ctl);
>  	intel_de_posting_read(display, CDCLK_CTL);
>=20=20
> -	/* inform PCU of the change */
> -	ret =3D intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
> -				       cdclk_config->voltage_level);
> +	ret =3D skl_cdclk_pcode_post_notify(display, cdclk_config);
>  	if (ret)
>  		drm_err(display->drm,
>  			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);
> @@ -2266,10 +2276,7 @@ static void bxt_set_cdclk(struct intel_display *di=
splay,
>  	if (DISPLAY_VER(display) >=3D 14 || display->platform.dg2)
>  		ret =3D 0; /* NOOP */
>  	else if (DISPLAY_VER(display) >=3D 11)
> -		ret =3D intel_parent_pcode_request(display, SKL_PCODE_CDCLK_CONTROL,
> -						 SKL_CDCLK_PREPARE_FOR_CHANGE,
> -						 SKL_CDCLK_READY_FOR_CHANGE,
> -						 SKL_CDCLK_READY_FOR_CHANGE, 3);
> +		ret =3D skl_cdclk_pcode_pre_notify(display);
>  	else
>  		/*
>  		 * BSpec requires us to wait up to 150usec, but that leads to
> @@ -2302,8 +2309,7 @@ static void bxt_set_cdclk(struct intel_display *dis=
play,
>  	if (DISPLAY_VER(display) >=3D 14 || display->platform.dg2)
>  		ret =3D 0; /* NOOP */
>  	else if (DISPLAY_VER(display) >=3D 11)
> -		ret =3D intel_parent_pcode_write(display, SKL_PCODE_CDCLK_CONTROL,
> -					       cdclk_config->voltage_level);
> +		ret =3D skl_cdclk_pcode_post_notify(display, cdclk_config);
>  	else
>  		/*
>  		 * The timeout isn't specified, the 2ms used here is based on

--=20
Jani Nikula, Intel
