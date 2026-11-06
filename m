Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B40A606A32F
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 14:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JM1UVquM
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEAD10EB77;
	Fri,  6 Nov 2026 14:50:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D5F10EB77;
 Fri,  6 Nov 2026 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793976624; x=1825512624;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9PNkyh2MugYYTqfvG4arVXQT/DEEnGIPhrf7BaBy7cU=;
 b=JM1UVquMubn+/8djognD/rJSe6pc5WX96GPAvkjkakphRI8lvc9pDr5K
 vwuhqTApyzEfVB2l5ufZ6p661mSV/P9HRTwlgoT4ZtJxVM7aT3vNOpgS0
 /o2hoB/Qx/5ubrKsbtVv5SKXFD80vl2O2PjusQbBwMhRclD4XCeDH4HVJ
 6zRIg0QKjkPtTtNjD6OCYb4NDW0cMOQxBuAk0nui0rp5JfBlrVPCC5mIU
 L6Jcn8QV2BhUsd+7rCUBLLbj4aDMpHG9s2ZE+NmAU2K8RWFOj1eN+9nK+
 pvwmOWWnvXEHUqW9ie83WF1HAtH4KabWQ6FY4mIlhIIRF5J0og8egjBae g==;
X-CSE-ConnectionGUID: dFqmVTojQX+ryljAncWR2Q==
X-CSE-MsgGUID: tzrwArfiRGSgdFTQuUyNMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2818108"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2818108"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:50:23 -0800
X-CSE-ConnectionGUID: zCUqR9MISZ2LufSBrYsFQw==
X-CSE-MsgGUID: d00GO1u2Tgu2KI33lCrI+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7327840"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:50:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/9] drm/i915/de: Convert intel_de_{read,write}() into
 vfuncs
In-Reply-To: <20261104221842.18799-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-3-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 16:50:19 +0200
Message-ID: <f51fb847cb0bbe5d17eaba71d16fb03059444626@intel.com>
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

On Thu, 05 Nov 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Different platforms will need to do different things in
> their mmio accessors. The plan is to trade the overhead
> of runtime platform checks into no runtime checks and
> the cost of a vfunc call. This seems to provide slightly
> better overall performance.

What's the plan for the 8- and 16-bit counterparts?

> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.c         | 17 +++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_de.h         |  9 +++++++--
>  .../gpu/drm/i915/display/intel_display_core.h   |  2 ++
>  3 files changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 6b3d06147e58..4f423a684ec2 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -163,7 +163,24 @@ u16 intel_de_read16(struct intel_display *display, i=
ntel_reg_t reg)
>  	return intel_uncore_read16(__to_uncore(display), reg);
>  }
>=20=20
> +static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
> +{
> +	return intel_uncore_read(__to_uncore(display), reg);
> +}
> +
> +static void i9xx_mmio_write(struct intel_display *display, intel_reg_t r=
eg, u32 val)
> +{
> +	intel_uncore_write(__to_uncore(display), reg, val);
> +}
> +
> +static const struct intel_mmio_funcs i9xx_mmio_funcs =3D {
> +	.read =3D i9xx_mmio_read,
> +	.write =3D i9xx_mmio_write,
> +};
> +
>  void intel_de_init(struct intel_display *display)
>  {
>  	display->mmio.uncore =3D to_intel_uncore(display->drm);
> +
> +	display->mmio.funcs =3D &i9xx_mmio_funcs;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i9=
15/display/intel_de.h
> index f1135ee5071b..63aef17e6ed3 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.h
> +++ b/drivers/gpu/drm/i915/display/intel_de.h
> @@ -12,6 +12,11 @@
>  #include "intel_uncore.h"
>  #include "intel_uncore_trace.h"
>=20=20
> +struct intel_mmio_funcs {
> +	u32 (*read)(struct intel_display *display, intel_reg_t reg);
> +	void (*write)(struct intel_display *display, intel_reg_t reg, u32 val);
> +};
> +

Wondering if this should be in intel_display_core.h as all the other
ones are. But let's see how it pans out.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>  static inline struct intel_uncore *__to_uncore(struct intel_display *dis=
play)
>  {
>  	return display->mmio.uncore;
> @@ -30,7 +35,7 @@ intel_de_read(struct intel_display *display, intel_reg_=
t reg)
>=20=20
>  	intel_dmc_wl_get(display, reg);
>=20=20
> -	val =3D intel_uncore_read(__to_uncore(display), reg);
> +	val =3D display->mmio.funcs->read(display, reg);
>=20=20
>  	intel_dmc_wl_put(display, reg);
>=20=20
> @@ -60,7 +65,7 @@ intel_de_write(struct intel_display *display, intel_reg=
_t reg, u32 val)
>  {
>  	intel_dmc_wl_get(display, reg);
>=20=20
> -	intel_uncore_write(__to_uncore(display), reg, val);
> +	display->mmio.funcs->write(display, reg, val);
>=20=20
>  	intel_dmc_wl_put(display, reg);
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_display_core.h b/drivers/=
gpu/drm/i915/display/intel_display_core.h
> index 35409f9abb2f..3a48119f7890 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
> @@ -49,6 +49,7 @@ struct intel_fbdev;
>  struct intel_fdi_funcs;
>  struct intel_hotplug_irq_funcs;
>  struct intel_initial_plane_config;
> +struct intel_mmio_funcs;
>  struct intel_opregion;
>  struct intel_overlay;
>  struct intel_uncore;
> @@ -533,6 +534,7 @@ struct intel_display {
>=20=20
>  	struct {
>  		struct intel_uncore *uncore;
> +		const struct intel_mmio_funcs *funcs;
>  	} mmio;
>=20=20
>  	struct {

--=20
Jani Nikula, Intel
