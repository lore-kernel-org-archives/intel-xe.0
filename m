Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDE4606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 10:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VwdkiS+o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4186810E511;
	Wed, 18 Nov 2026 10:14:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37A810E511;
 Wed, 18 Nov 2026 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794996845; x=1826532845;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=s/NUd1Fk+3GN/5IC7uLzOS4uvnbUM+3yz46OKXFrwoY=;
 b=VwdkiS+oZpu0qG58Ljxh5+Q/idcNaZOUs4vYK52i7PuiKDWHCQOGWvw+
 L8MdsBHxX7cpw4Rjn24cuTYrs0NiE34GkJCYK1T4kw2scJq+5gsv9n7ur
 6ftByf9DyqGDzdo0EvF/s2donqh2ktAmrlYNowSnB8AUX2bHmPoUuHoiQ
 XeWdBavOWo4KpAMxilhlAd7NHZu4D56qY7dJXJBx/6AJP76os3DWG6RJ+
 TFA7Q7h6pm5n5iQ9GbqfxVx2VTuS/LVNv6Zpb7xM14rqaY/9KHgoOegh6
 IC8/YJuXo9oHli6pYldyb/lC24M1k6hUVrc/rp4ql+FWdzCbOlww36jwS Q==;
X-CSE-ConnectionGUID: pXzgYrydR06fCekxufLJ/Q==
X-CSE-MsgGUID: ur5HO4AtQgG2unvceekU8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3693798"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3693798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:14:04 -0800
X-CSE-ConnectionGUID: oyG0ZwujQp++bIOzEcF/Xg==
X-CSE-MsgGUID: +k5L03NFRKOtjci51cLxGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9902777"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 02:14:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 7/8] drm/xe: Enable unclaimed register detection on xe
In-Reply-To: <20261113134355.14579-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261113134355.14579-1-ville.syrjala@linux.intel.com>
 <20261113134355.14579-8-ville.syrjala@linux.intel.com>
Date: Wed, 18 Nov 2026 12:14:00 +0200
Message-ID: <0f03330a05eaec97180540f2177c18f33a76a7c8@intel.com>
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
> Now that the unclaimed register detection code no longer relies
> on the lock we can enable it on xe, without bringing the lock
> along for the ride.
>
> xe only supports TGL+ class hardware, so that's all we have
> to care about here.
>
> Note that mmio is hideously expensive on all MTL+ systems, and
> enabling mmio_debug on will make it worse due to all the extra
> FPGA_DBG reads. But during development/testing it can be a very
> useful tool.
>
> One weird thing here is that the default value for the modparam
> still comes from i915's CONFIG_DRM_I915_DEBUG_MMIO. So xe will
> only get the modparam turned on by default if i915 is also
> included in the build.

Yeah, we'll need to move a bunch of kconfigs around when we have the
kconfig file for display.

As the CI results indicate, this is a change we want, however in the
mean time can't enable it because it craps all over CI.

I'm sure you've got an idea what to do already, but on the idea,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_de.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_de.c b/drivers/gpu/drm/i9=
15/display/intel_de.c
> index 9e2f6ce0ff7e..9399db0d8e1b 100644
> --- a/drivers/gpu/drm/i915/display/intel_de.c
> +++ b/drivers/gpu/drm/i915/display/intel_de.c
> @@ -502,7 +502,7 @@ static const struct intel_mmio_funcs tgl_mmio_funcs =
=3D {
>  	.check_for_unclaimed_mmio =3D hsw_check_for_unclaimed_mmio,
>  };
>=20=20
> -#define LNL_MMIO_FLAGS __MMIO_WAKELOCK
> +#define LNL_MMIO_FLAGS (__MMIO_WAKELOCK | __MMIO_UNCLAIMED)
>=20=20
>  static u32 lnl_mmio_read(struct intel_display *display, intel_reg_t reg)
>  {
> @@ -519,6 +519,7 @@ static void lnl_mmio_write(struct intel_display *disp=
lay, intel_reg_t reg, u32 v
>  static const struct intel_mmio_funcs lnl_mmio_funcs =3D {
>  	.read =3D lnl_mmio_read,
>  	.write =3D lnl_mmio_write,
> +	.check_for_unclaimed_mmio =3D hsw_check_for_unclaimed_mmio,
>  };
>=20=20
>  static bool driver_is_i915(void)
> @@ -557,7 +558,7 @@ void intel_de_init(struct intel_display *display)
>  		if (DISPLAY_VER(display) >=3D 20)
>  			display->mmio.funcs =3D &lnl_mmio_funcs;
>  		else
> -			display->mmio.funcs =3D &i9xx_mmio_funcs;
> +			display->mmio.funcs =3D &tgl_mmio_funcs;
>  	}
>=20=20
>  	if (display->mmio.funcs->check_for_unclaimed_mmio)

--=20
Jani Nikula, Intel
