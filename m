Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6E6606A32F
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AriXRZHd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E57110EA6C;
	Fri,  6 Nov 2026 14:53:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E5B10EA68;
 Fri,  6 Nov 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793976806; x=1825512806;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=h2NfC1AyqkgRKdV3VX8yznj3M3r5G7gnscOzCGkJBaA=;
 b=AriXRZHdGFEcadKcI0JDKy5h0KRGWLz4nOUvnNwC348ZXqbeY/6uYz0H
 PXgHSq2B9H+7mCJNpDX29ILpkmRat4MXlwK0APuyCmKnko4CJx9+okVkn
 5Wh5ua9yv7Y600hdMoW10YTQ4zwX6KohY4dcvs3cK6ihXXGbHN5tpq8wg
 CUd0yQgoK8cCvwB8qFKZKaBcmitXFjUlM7OvrYTjxUuwYQm2yNkdZxJbc
 WXbgt7h6zG5MOKp+1e5SITJ6OBghShhITEsdnw3tjCJx1YwxREbqHbFGe
 p7hpBukCsfPfAMRqJe/r8RdYWdeRYDadvbG4SoYru5zx+kxTZxUU0EdRw A==;
X-CSE-ConnectionGUID: ugBC4Sc5Rw6pvq6syvVZuA==
X-CSE-MsgGUID: BWjD+PsVRa+QFNGRx5d1Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2818389"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2818389"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:53:26 -0800
X-CSE-ConnectionGUID: hpbR28rwRHm4bjtC5Va8QQ==
X-CSE-MsgGUID: OQ0sfInBRO6FdSBY/qvVJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7858873"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:53:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/i915/de: Eliminate runtime overhead from DMC
 wakelock on pre-LNL platforms
In-Reply-To: <20261104221842.18799-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-5-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 16:53:22 +0200
Message-ID: <70b722310125f1db281fb4336fb70f311b43caff@intel.com>
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

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Now that we have the mmio read/write vfuncs we can get rid of
> any runtime overhead from the DMC wakelock checks for the
> platforms that don't support wakelock (pre-LNL).
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 50 ++++++++++++++++++++++++-
>  drivers/gpu/drm/i915/display/intel_de.h | 15 +-------
>  2 files changed, 50 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index cde2886fe2ca..66de0d6be569 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -163,14 +163,36 @@ u16 intel_de_read16(struct intel_display *display, =
intel_reg_t reg)
>  	return intel_uncore_read16(__to_uncore(display), reg);
>  }
>=20=20
> +#define __MMIO_WAKELOCK		BIT(0)
> +
> +static __always_inline void
> +__mmio_wakelock_pre(struct intel_display *display, intel_reg_t reg,
> +		    const unsigned int mmio_flags)
> +{
> +	if (mmio_flags & __MMIO_WAKELOCK)
> +		intel_dmc_wl_get(display, reg);
> +}
> +
> +static __always_inline void
> +__mmio_wakelock_post(struct intel_display *display, intel_reg_t reg,
> +		     const unsigned int mmio_flags)
> +{
> +	if (mmio_flags & __MMIO_WAKELOCK)
> +		intel_dmc_wl_put(display, reg);
> +}
> +
>  static __always_inline u32
>  __intel_de_read(struct intel_display *display, intel_reg_t reg,
>  		const unsigned int mmio_flags)
>  {
>  	u32 val;
>=20=20
> +	__mmio_wakelock_pre(display, reg, mmio_flags);
> +
>  	val =3D intel_uncore_read(__to_uncore(display), reg);
>=20=20
> +	__mmio_wakelock_post(display, reg, mmio_flags);
> +
>  	return val;
>  }
>=20=20
> @@ -178,7 +200,11 @@ static __always_inline void
>  __intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
>  		 const unsigned int mmio_flags)
>  {
> +	__mmio_wakelock_pre(display, reg, mmio_flags);
> +
>  	intel_uncore_write(__to_uncore(display), reg, val);
> +
> +	__mmio_wakelock_post(display, reg, mmio_flags);
>  }
>=20=20
>  #define I9XX_MMIO_FLAGS 0
> @@ -200,9 +226,31 @@ static const struct intel_mmio_funcs i9xx_mmio_funcs=
 =3D {
>  	.write =3D i9xx_mmio_write,
>  };
>=20=20
> +#define LNL_MMIO_FLAGS __MMIO_WAKELOCK
> +
> +static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
> +{
> +	return __intel_de_read(display, reg, LNL_MMIO_FLAGS);
> +}
> +
> +static void lnl_mmio_write(struct intel_display *display, intel_reg_t re=
g, u32 val)
> +{
> +	__intel_de_write(display, reg, val, LNL_MMIO_FLAGS);
> +}
> +
> +#undef LNL_MMIO_FLAGS
> +
> +static const struct intel_mmio_funcs lnl_mmio_funcs =3D {
> +	.read =3D lnl_mmio_read,
> +	.write =3D lnl_mmio_write,
> +};
> +
>  void intel_de_init(struct intel_display *display)
>  {
>  	display->mmio.uncore =3D to_intel_uncore(display->drm);
>=20=20
> -	display->mmio.funcs =3D &i9xx_mmio_funcs;
> +	if (DISPLAY_VER(display) >=3D 20)
> +		display->mmio.funcs =3D &lnl_mmio_funcs;
> +	else
> +		display->mmio.funcs =3D &i9xx_mmio_funcs;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index 63aef17e6ed3..760b8bc31f9b 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -7,7 +7,6 @@
>  #define __INTEL_DE_H__
>=20=20
>  #include "intel_display_core.h"
> -#include "intel_dmc_wl.h"
>  #include "intel_dsb.h"
>  #include "intel_uncore.h"
>  #include "intel_uncore_trace.h"
> @@ -31,15 +30,7 @@ u16 intel_de_read16(struct intel_display *display, int=
el_reg_t reg);
>  static inline u32
>  intel_de_read(struct intel_display *display, intel_reg_t reg)
>  {
> -	u32 val;
> -
> -	intel_dmc_wl_get(display, reg);
> -
> -	val =3D display->mmio.funcs->read(display, reg);
> -
> -	intel_dmc_wl_put(display, reg);
> -
> -	return val;
> +	return display->mmio.funcs->read(display, reg);
>  }
>=20=20
>  static inline u64
> @@ -63,11 +54,7 @@ intel_de_posting_read(struct intel_display *display, i=
ntel_reg_t reg)
>  static inline void
>  intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val)
>  {
> -	intel_dmc_wl_get(display, reg);
> -
>  	display->mmio.funcs->write(display, reg, val);
> -
> -	intel_dmc_wl_put(display, reg);
>  }
>=20=20
>  static inline u32

--=20
Jani Nikula, Intel
