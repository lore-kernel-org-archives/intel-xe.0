Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6538C606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C+ZaDPa6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEE210FAA1;
	Wed, 18 Nov 2026 10:15:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCF710FAD1;
 Wed, 18 Nov 2026 10:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794996932; x=1826532932;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=x2KkdNU/TNh5wx13vVaqc9CRijY2qP88zA04yYjZCjQ=;
 b=C+ZaDPa6eSGIxlWrZKSSL4FfDk8WCBRS23WPnF1lc/Dk+jhWUM8tdtav
 xXC/29NjTjYbBCeKHfL3r290DkcOIKXZ243XjAuixFvCEtvxfRJZ6Qq0n
 N9ld8k9RONyp2cKdQVpiue6S1FMq4qis0UQkbHQPnq/LU+gM76ONSXrhi
 ybhbu0eQnHeHRZd0zboDAizVigDpqdfV6jIozNldl7OKisfwZiRoesjwh
 pybnah2AvzxxJIvURSOHVVrAiyG6b5GIPdK7ipTpGrIZtCrGip2i0npiQ
 Wl+qxwHLjLPhRTnEkv47+wfJHcPOlgV8jEV77tU1163WGL3aRdBIIO9LE g==;
X-CSE-ConnectionGUID: f09dmeEpRd6Zvks+R8oqSw==
X-CSE-MsgGUID: 8EmfWr2wQQOHc9u+aMaWWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3694003"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3694003"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:15:32 -0800
X-CSE-ConnectionGUID: Uu0D0DOhQIOSiVfDrCRz2Q==
X-CSE-MsgGUID: vuPulyEuRFmlEOLU4/0Trw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9903049"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:15:31 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 8/8] drm/i915/de: Nuke driver_is_i915()
In-Reply-To: <20261113134355.14579-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-9-ville.syrjala@linux.intel.com>
Date: Wed, 18 Nov 2026 12:15:28 +0200
Message-ID: <d90ec99f4f051b86c51ab53f1033c02000bc6048@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Now that both i915 and xe use the same mmio funcs for
> TGL+ we can unify the intel_de_init() if-ladders for
> the two drivers and get rid of driver_is_i915().
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Obviously need to adjust for xe unclaimed register flagging all over CI,
but other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 45 +++++++------------------
>  1 file changed, 13 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 9399db0d8e1b..3a8ee5141fdd 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -522,44 +522,25 @@ static const struct intel_mmio_funcs lnl_mmio_funcs=
 =3D {
>  	.check_for_unclaimed_mmio =3D hsw_check_for_unclaimed_mmio,
>  };
>=20=20
> -static bool driver_is_i915(void)
> -{
> -#ifdef I915
> -	return true;
> -#else
> -	return false;
> -#endif
> -}
> -
>  void intel_de_init(struct intel_display *display)
>  {
>  	display->mmio.uncore =3D to_intel_uncore(display->drm);
>=20=20
>  	spin_lock_init(&display->mmio.lock);
>=20=20
> -	/*
> -	 * TODO: enable unclaimed register detection
> -	 * (ideally without the lock) for xe and get
> -	 * rid of driver_is_i915().
> -	 */
> -	if (driver_is_i915()) {
> -		if (DISPLAY_VER(display) >=3D 12)
> -			display->mmio.funcs =3D &tgl_mmio_funcs;
> -		else if (DISPLAY_VER(display) >=3D 9 ||
> -			 display->platform.broadwell || display->platform.haswell)
> -			display->mmio.funcs =3D &hsw_mmio_funcs;
> -		else if (display->platform.valleyview || display->platform.cherryview)
> -			display->mmio.funcs =3D &vlv_mmio_funcs;
> -		else if (DISPLAY_VER(display) >=3D 6)
> -			display->mmio.funcs =3D &snb_mmio_funcs;
> -		else
> -			display->mmio.funcs =3D &i9xx_mmio_funcs;
> -	} else {
> -		if (DISPLAY_VER(display) >=3D 20)
> -			display->mmio.funcs =3D &lnl_mmio_funcs;
> -		else
> -			display->mmio.funcs =3D &tgl_mmio_funcs;
> -	}
> +	if (DISPLAY_VER(display) >=3D 20)
> +		display->mmio.funcs =3D &lnl_mmio_funcs;
> +	else if (DISPLAY_VER(display) >=3D 12)
> +		display->mmio.funcs =3D &tgl_mmio_funcs;
> +	else if (DISPLAY_VER(display) >=3D 9 ||
> +		 display->platform.broadwell || display->platform.haswell)
> +		display->mmio.funcs =3D &hsw_mmio_funcs;
> +	else if (display->platform.valleyview || display->platform.cherryview)
> +		display->mmio.funcs =3D &vlv_mmio_funcs;
> +	else if (DISPLAY_VER(display) >=3D 6)
> +		display->mmio.funcs =3D &snb_mmio_funcs;
> +	else
> +		display->mmio.funcs =3D &i9xx_mmio_funcs;
>=20=20
>  	if (display->mmio.funcs->check_for_unclaimed_mmio)
>  		WRITE_ONCE(display->mmio.unclaimed_mmio_check, true);

--=20
Jani Nikula, Intel
