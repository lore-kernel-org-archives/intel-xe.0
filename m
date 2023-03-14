Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA80C6FD1C
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 11:43:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED86910E162;
	Tue, 14 Mar 2023 11:43:45 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A17010E162
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 11:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678794224; x=1710330224;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tfcQpyW35MT+32TFx1PBGGkcFmSM9GIuS4zQMj53B+I=;
 b=dChMjvzNaxqvFoiG11GyMmfF1gSi/whxc1yeV1qW+WSotU/LtSU8aj3+
 hsGToW0Q4kMIZGVQXQxcY9CVBNmRhBxMF9x4YsYlYzTpmfAcRBFMNbfvl
 WlGmfaCHuA6pNUQJb182hz2trC5LH5qlkrd6eK2RYfubO98kAutd5/5wP
 GkiBuxUicWWxknThtMOILR5TKb7XUpu71cmd46M0fEtL+PjJOmj80y8RG
 WOI2pqaKtX8n7Q/yc2NbFUxZvsoD03uhroAIfwjA4GFnXJI4LEvpZyKsh
 QODyTkpq7LWXf8z9DSJPZsz/rfNurapOowh6bvRj+IySov1VtIfF6ol8N w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423671605"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="423671605"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 04:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="656306917"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="656306917"
Received: from vperevez-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.61.84])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 04:43:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
In-Reply-To: <20230309191923.670451-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309191923.670451-1-jani.nikula@intel.com>
Date: Tue, 14 Mar 2023 13:43:38 +0200
Message-ID: <877cvj7e39.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC] drm/i915: add kconfig option to enable/disable
 legacy platform support
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
> Add config option DRM_I915_LEGACY to enable/disable legacy platform
> support. This is primarily for the benefit of the drm/xe driver, and
> legacy is defined in terms of the platforms drm/xe does not support,
> i.e. anything before Tigerlake.
>
> While the kconfig option will be CONFIG_DRM_I915_LEGACY, the intention
> is that it's not used in code. Instead, we'll pass -DI915_LEGACY=3D1 in
> the i915 Makefile for CONFIG_DRM_I915_LEGACY=3Dy, while the xe Makefile
> does no such thing, regardless of the kconfig value.
>
> Initially, the knob does the bare minimum: drops the legacy platforms
> from module PCI ID table (and the compiler in turn automagically drops
> all the unreferenced device infos).
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

The discussion stalled a bit.

Do we have consensus to start adding this to upstream i915?


BR,
Jani.


> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> *** NOTE ***
>
> For now, I'm only sending this to the intel-xe mailing list with a bunch
> of Cc's for first impressions.
>
> The xe driver reuses i915 display code, but there's a lot of unnecessary
> and/or incompatible code for platforms xe does not support. Currently
> this is handled with a bunch of #ifdef I915 added to i915 in the xe
> branch that isn't really upstreamble, and I'm thinking this patch might
> be a better option.
>
> This patch alone does what the commit message says, and drops the legacy
> platform support, although all the code is left in place. Everything
> beyond this is basically an optimization of what more to drop out of the
> build. It doesn't really need to be perfect for starters but we could
> start converting the legacy platform related #ifdefs from I915 to
> I915_LEGACY, and that could be upstreamable to i915.
>
> Not all of the #ifdef I915 in the xe branch are related to legacy
> platforms, and they need to be handled differently. But this kconfig
> knob would hopefully be a future compatible start to clean up one aspect
> of them.
>
> Thoughts?
>
> BR,
> Jani.
> ---
>  drivers/gpu/drm/i915/Kconfig    | 11 +++++++++++
>  drivers/gpu/drm/i915/Makefile   |  7 +++++++
>  drivers/gpu/drm/i915/i915_pci.c |  2 ++
>  3 files changed, 20 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 8eb3e60aeec9..a569c1606f51 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -53,6 +53,17 @@ config DRM_I915
>=20=20
>  	  If "M" is selected, the module will be called i915.
>=20=20
> +config DRM_I915_LEGACY
> +	bool "Support legacy hardware in i915"
> +	depends on DRM_I915
> +	depends on EXPERT
> +	default y
> +	help
> +	  Disable this option if you want the i915 driver to only support modern
> +	  Intel Graphics, starting from Tigerlake.
> +
> +	  If in doubt, say "Y".
> +
>  config DRM_I915_FORCE_PROBE
>  	string "Force probe i915 for selected Intel hardware IDs"
>  	depends on DRM_I915
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index a6e7cd2185c2..653d43e5b534 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -23,6 +23,13 @@ subdir-ccflags-y +=3D $(call cc-disable-warning, unuse=
d-but-set-variable)
>  subdir-ccflags-y +=3D $(call cc-disable-warning, frame-address)
>  subdir-ccflags-$(CONFIG_DRM_I915_WERROR) +=3D -Werror
>=20=20
> +# Legacy platform support.
> +#
> +# Note: Source code needs to check for I915_LEGACY instead of
> +# CONFIG_DRM_I915_LEGACY to allow Xe driver build without legacy support
> +# independent of the Kconfig setting.
> +subdir-ccflags-$(CONFIG_DRM_I915_LEGACY) +=3D -DI915_LEGACY=3D1
> +
>  # Fine grained warnings disable
>  CFLAGS_i915_pci.o =3D $(call cc-disable-warning, override-init)
>  CFLAGS_display/intel_fbdev.o =3D $(call cc-disable-warning, override-ini=
t)
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_=
pci.c
> index bc6fc268739d..9f421015d2bb 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1162,6 +1162,7 @@ static const struct intel_device_info mtl_info =3D {
>   * PCI ID matches, otherwise we'll use the wrong info struct above.
>   */
>  static const struct pci_device_id pciidlist[] =3D {
> +#if IS_ENABLED(I915_LEGACY)
>  	INTEL_I830_IDS(&i830_info),
>  	INTEL_I845G_IDS(&i845g_info),
>  	INTEL_I85X_IDS(&i85x_info),
> @@ -1225,6 +1226,7 @@ static const struct pci_device_id pciidlist[] =3D {
>  	INTEL_ICL_11_IDS(&icl_info),
>  	INTEL_EHL_IDS(&ehl_info),
>  	INTEL_JSL_IDS(&jsl_info),
> +#endif
>  	INTEL_TGL_12_IDS(&tgl_info),
>  	INTEL_RKL_IDS(&rkl_info),
>  	INTEL_ADLS_IDS(&adl_s_info),

--=20
Jani Nikula, Intel Open Source Graphics Center
