Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C14606A330
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GulYrx8c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8784B10E3C7;
	Fri,  6 Nov 2026 14:52:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C5710E3C7;
 Fri,  6 Nov 2026 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793976750; x=1825512750;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=m5ZG4KxUzh1Y+BI68TpTHTtNvdfvXJWTUhXGGS8lQfY=;
 b=GulYrx8cQyXhv0fA3cEObFhJrTUCrOXlYDm/5n0bNZGMmLBqgkSvcsh4
 q0Hlbmy2uS8BhAvk1lm3XAdX/3SgiTFNxxxGLwKy1B5pBp1URsftJuwPb
 IFN1ceOdrD5Mt4QorhNge+spj77I+hkylSi+bHYutsCCkyySBRbxkhPqf
 0LB1RrSM9+R9hshmCLeocbuCoS8RMhZcXo044dYFZ8Ah2wmlttpkwrx7W
 wvnfeAgtWwVwkE9nEJsCVGFqSF9ZR894jUzvNcgz4hU0OIzbWEuPVaFt0
 kkmKc2HCIOSChEv/hBOr7zmHvMqXWZb8EcM3s9qX7OrLEVZ5G3fzuXI4U g==;
X-CSE-ConnectionGUID: FaIax6VKSNCtDAiGkZi5YQ==
X-CSE-MsgGUID: Tdy6o/cGSH6ISjSlrjYvYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2831213"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2831213"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:52:29 -0800
X-CSE-ConnectionGUID: HT+xvg9qSVm0GPao7pYS0g==
X-CSE-MsgGUID: z9k35UN7RW27XqrYOvoFDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7401394"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.101])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 06:52:25 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/9] drm/i915/de: Introduce mmio read/write templates
In-Reply-To: <20261104221842.18799-4-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261104221842.18799-1-ville.syrjala@linux.intel.com>
 <20261104221842.18799-4-ville.syrjala@linux.intel.com>
Date: Fri, 06 Nov 2026 16:52:22 +0200
Message-ID: <283ba9737e27cff4d70b7ee2ab3b0ec287d573de@intel.com>
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
> In order to eliminate runtime platform check overhead from
> the mmio read/write functions, we'll need a good way to construct
> optimal variants for each platform. Do that in the form of
> __intel_de_{read,write}() that can be customized via (compile time
> constnt) mmio_flags. The compiler will eliminate all the stuff
> we don't want.

Are the __always_inline required?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> For now there is nothing to eliminate but next we'll start
> moving more stuff in to make that possible.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 26 +++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 4f423a684ec2..cde2886fe2ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -163,16 +163,38 @@ u16 intel_de_read16(struct intel_display *display, =
intel_reg_t reg)
>  	return intel_uncore_read16(__to_uncore(display), reg);
>  }
>=20=20
> +static __always_inline u32
> +__intel_de_read(struct intel_display *display, intel_reg_t reg,
> +		const unsigned int mmio_flags)
> +{
> +	u32 val;
> +
> +	val =3D intel_uncore_read(__to_uncore(display), reg);
> +
> +	return val;
> +}
> +
> +static __always_inline void
> +__intel_de_write(struct intel_display *display, intel_reg_t reg, u32 val,
> +		 const unsigned int mmio_flags)
> +{
> +	intel_uncore_write(__to_uncore(display), reg, val);
> +}
> +
> +#define I9XX_MMIO_FLAGS 0
> +
>  static u32 i9xx_mmio_read(struct intel_display *display, intel_reg_t reg)
>  {
> -	return intel_uncore_read(__to_uncore(display), reg);
> +	return __intel_de_read(display, reg, I9XX_MMIO_FLAGS);
>  }
>=20=20
>  static void i9xx_mmio_write(struct intel_display *display, intel_reg_t r=
eg, u32 val)
>  {
> -	intel_uncore_write(__to_uncore(display), reg, val);
> +	__intel_de_write(display, reg, val, I9XX_MMIO_FLAGS);
>  }
>=20=20
> +#undef I9XX_MMIO_FLAGS
> +
>  static const struct intel_mmio_funcs i9xx_mmio_funcs =3D {
>  	.read =3D i9xx_mmio_read,
>  	.write =3D i9xx_mmio_write,

--=20
Jani Nikula, Intel
