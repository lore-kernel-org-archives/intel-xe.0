Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6D3606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CTYxC8F8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB9910FA92;
	Wed, 18 Nov 2026 10:11:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42510E13A;
 Wed, 18 Nov 2026 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794996714; x=1826532714;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=CNeGqLxhNQGgOh+5ws1m6hJ9092VAiASNsR5VyG27xM=;
 b=CTYxC8F8YPHTGUJcogbbPmUo+BKZ+HFSdNpztx0V8tYE5BBQU/FV6zBN
 FYgSFwLXM948pt4cWgc9A9gg2ocm1gvzime7soZp4K5KXDz/hFurBmelw
 vWaHtc0iWxGbUmRWzsNXRj0Ftg3KY23fov9Iheg+4EfSqzrduyjNrZwAQ
 byq5e8MDr0Ql8OtkHaKLmpOuYorWhEQ1sqsRukXL2cZfdHVDOEVgXvrJj
 WSLXzX1TDRfD9YTpS18xceKN6rF9ZbuX+XyVjgWb+udVmlLbvWEEpHW0f
 bp2Pu0r2BQMreYpbvwZWvmKCVVNfp1dodLZoPghAu9c7f9t0tEZ9bpz7f A==;
X-CSE-ConnectionGUID: yJPwH4KdQF6+xYe3a2CG0w==
X-CSE-MsgGUID: 2HAsb0TGRmyLJbEHpFqHjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3693697"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3693697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:11:53 -0800
X-CSE-ConnectionGUID: OtpffHJjR9uevbMZ/c9Syw==
X-CSE-MsgGUID: Sah0Hrk1RfWQUloC73SFdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10123846"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:11:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/8] drm/i915/de: Make display registers unlocked for
 TGL+ on i915
In-Reply-To: <20261113134355.14579-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-7-ville.syrjala@linux.intel.com>
Date: Wed, 18 Nov 2026 12:11:49 +0200
Message-ID: <e6b11fe164dcf28f719f020bcdbbc0d592acc945@intel.com>
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Now that the unclaimed register detection should survive
> without the lock there should be no reason to use the lock
> on most platforms.
>
> Start by weaning TGL+ off the lock. Since some people have
> been using the (lockless) xe driver on TGL/etc. it should
> be fairly well established that serializing all register
> accesses is not needed on these platforms.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 26 +++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 81fd1569bb65..9e2f6ce0ff7e 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -482,6 +482,26 @@ static const struct intel_mmio_funcs vlv_mmio_funcs =
=3D {
>  	.check_for_unclaimed_mmio_needs_lock =3D true,
>  };
>=20=20
> +#define TGL_MMIO_FLAGS __MMIO_UNCLAIMED
> +
> +static u32 tgl_mmio_read(struct intel_display *display, intel_reg_t reg)
> +{
> +	return __intel_de_read(display, reg, TGL_MMIO_FLAGS);
> +}
> +
> +static void tgl_mmio_write(struct intel_display *display, intel_reg_t re=
g, u32 val)
> +{
> +	__intel_de_write(display, reg, val, TGL_MMIO_FLAGS);
> +}
> +
> +#undef TGL_MMIO_FLAGS
> +
> +static const struct intel_mmio_funcs tgl_mmio_funcs =3D {
> +	.read =3D tgl_mmio_read,
> +	.write =3D tgl_mmio_write,
> +	.check_for_unclaimed_mmio =3D hsw_check_for_unclaimed_mmio,
> +};
> +
>  #define LNL_MMIO_FLAGS __MMIO_WAKELOCK
>=20=20
>  static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
> @@ -522,8 +542,10 @@ void intel_de_init(struct intel_display *display)
>  	 * rid of driver_is_i915().
>  	 */
>  	if (driver_is_i915()) {
> -		if (DISPLAY_VER(display) >=3D 9 ||
> -		    display->platform.broadwell || display->platform.haswell)
> +		if (DISPLAY_VER(display) >=3D 12)
> +			display->mmio.funcs =3D &tgl_mmio_funcs;
> +		else if (DISPLAY_VER(display) >=3D 9 ||
> +			 display->platform.broadwell || display->platform.haswell)
>  			display->mmio.funcs =3D &hsw_mmio_funcs;
>  		else if (display->platform.valleyview || display->platform.cherryview)
>  			display->mmio.funcs =3D &vlv_mmio_funcs;

--=20
Jani Nikula, Intel
