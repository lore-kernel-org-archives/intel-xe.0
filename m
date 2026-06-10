Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996FECD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 17:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A86A10E528;
	Wed, 10 Jun 2026 17:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjpS82tt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268D010EB3D;
 Wed, 10 Jun 2026 17:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781113174; x=1812649174;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CKkYCWzA3rUmk+DtPETzFGM/8+X0Hd+gq/XRrX3sfmI=;
 b=NjpS82tt9osbpImVYso0HO46FYG4knwDjSUJxSLjbve1TFXch+OdpnbS
 mKUV6oZDsGHG0vf4lNeXM6PjD25RdtMlHi2/aexu3d6SXK8G2E3i2F+Aq
 0xtxH4ZuSC6EQKXpyrwK11o1rTtVp/CxjDAmPNQ7LPsH3L8nGR4Zdy6Jr
 oiwcyl+iXtbiIkOEQQsVKMp9Y7ZJJKafp3Kg4eAPYbbKSTsegMhtm8zEs
 cfyLEtmB11jS93nsywB9QExjuZ9ihlokr4YdDDv0bgBtQNm7tXoK3lwa9
 +FSn3ehnC1L8RFPnXyCmZaqLcT5F8iDYVhqWA0FQCrOcZTF2YrQv3wTQO g==;
X-CSE-ConnectionGUID: o7Qne+0cT5We+XpWQ6AVVQ==
X-CSE-MsgGUID: CODjRm6dT4OKUa/X2DTQbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69454544"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="69454544"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:39:34 -0700
X-CSE-ConnectionGUID: GPiCztEIQ7WPvPpKTULO5A==
X-CSE-MsgGUID: 7vM/6BIZQ+qAMcI9HRjrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="269916374"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 10:39:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 12/14] drm/i915/cdclk: Extract bxt_cdclk_pcode_{pre,
 post}_notify()
In-Reply-To: <20260610170652.5320-13-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260610170652.5320-1-ville.syrjala@linux.intel.com>
 <20260610170652.5320-13-ville.syrjala@linux.intel.com>
Date: Wed, 10 Jun 2026 20:39:30 +0300
Message-ID: <c8197592b12f863e4492cde2f5d2e39eb38e44b3@intel.com>
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
> Extract the BXT/GLK pcode notify stuff to a few small helpers.
> The plan is to unify these between all the platforms and turn
> them into vfuncs.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 42 +++++++++++++---------
>  1 file changed, 26 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm=
/i915/display/intel_cdclk.c
> index bb47fc4c86ee..749e366e60ab 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -2226,6 +2226,29 @@ static u32 bxt_cdclk_ctl(struct intel_display *dis=
play,
>  	return val;
>  }
>=20=20
> +static int bxt_cdclk_pcode_pre_notify(struct intel_display *display)
> +{
> +	/*
> +	 * BSpec requires us to wait up to 150usec, but that leads to
> +	 * timeouts; the 2ms used here is based on experiment.
> +	 */
> +	return intel_parent_pcode_write_timeout(display, HSW_PCODE_DE_WRITE_FRE=
Q_REQ,
> +						0x80000000, 2);
> +}
> +
> +static int bxt_cdclk_pcode_post_notify(struct intel_display *display,
> +				       const struct intel_cdclk_config *cdclk_config)
> +{
> +	/*
> +	 * The timeout isn't specified, the 2ms used here is based on
> +	 * experiment.
> +	 * FIXME: Waiting for the request completion could be delayed
> +	 * until the next PCODE request based on BSpec.
> +	 */
> +	return intel_parent_pcode_write_timeout(display, HSW_PCODE_DE_WRITE_FRE=
Q_REQ,
> +						cdclk_config->voltage_level, 2);
> +}
> +
>  static void _bxt_set_cdclk(struct intel_display *display,
>  			   const struct intel_cdclk_config *cdclk_config,
>  			   enum pipe pipe)
> @@ -2278,13 +2301,7 @@ static void bxt_set_cdclk(struct intel_display *di=
splay,
>  	else if (DISPLAY_VER(display) >=3D 11)
>  		ret =3D skl_cdclk_pcode_pre_notify(display);
>  	else
> -		/*
> -		 * BSpec requires us to wait up to 150usec, but that leads to
> -		 * timeouts; the 2ms used here is based on experiment.
> -		 */
> -		ret =3D intel_parent_pcode_write_timeout(display,
> -						       HSW_PCODE_DE_WRITE_FREQ_REQ,
> -						       0x80000000, 2);
> +		ret =3D bxt_cdclk_pcode_pre_notify(display);
>=20=20
>  	if (ret) {
>  		drm_err(display->drm,
> @@ -2311,15 +2328,8 @@ static void bxt_set_cdclk(struct intel_display *di=
splay,
>  	else if (DISPLAY_VER(display) >=3D 11)
>  		ret =3D skl_cdclk_pcode_post_notify(display, cdclk_config);
>  	else
> -		/*
> -		 * The timeout isn't specified, the 2ms used here is based on
> -		 * experiment.
> -		 * FIXME: Waiting for the request completion could be delayed
> -		 * until the next PCODE request based on BSpec.
> -		 */
> -		ret =3D intel_parent_pcode_write_timeout(display,
> -						       HSW_PCODE_DE_WRITE_FREQ_REQ,
> -						       cdclk_config->voltage_level, 2);
> +		ret =3D bxt_cdclk_pcode_post_notify(display, cdclk_config);
> +
>  	if (ret)
>  		drm_err(display->drm,
>  			"Failed to inform PCODE about end of CDCLK change (%d)\n", ret);

--=20
Jani Nikula, Intel
