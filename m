Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62D4F43689
	for <intel-xe@archiver.kernel.org>; Fri, 17 Apr 2026 09:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A0610E99B;
	Fri, 17 Apr 2026 09:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W17sJ1pW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3A410E98F;
 Fri, 17 Apr 2026 09:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776418799; x=1807954799;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=8d4x6HIQKjA/6kTFS32505T4OlCQ4L2MOdTWEG2RAMI=;
 b=W17sJ1pWx+Bud6bFhP1VPhH/WmphwUUc5shiopqL+l/nGOdFQR4/+kao
 qIlbWq/lPVePESCRszYG0OpuRN2oJFSrJV0x0WS2sQDZaYgLYTGS07qK6
 Gdwn+eFya04fdIf23CboHVpLlrjsfh03OwZ4QO9Wz/hav/S9sgKef2R60
 xu+PrastG0Uw5+yrmM9b6Cq0QBgxlgpk6rSOU9D3otsZqqDdQJnBfJkEl
 SDQUcujw+4CVBo8a/HdFyR973PqSXBnQMluQd/TrsJnyJqtduKUhnUGOJ
 bN7GdA7fJlzV4UqX08QV+X8PPbZ9/GWWh884xPkUP9Vemf5A/KMPnhbsm Q==;
X-CSE-ConnectionGUID: Fc0u9RVHSsO+ji/URpsx9Q==
X-CSE-MsgGUID: DSB+WTr+RleQYCt5CmIJ6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="100080152"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="100080152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:39:58 -0700
X-CSE-ConnectionGUID: oZK4pDItTMqgnurTRi801w==
X-CSE-MsgGUID: YTp1OKySSMK/m2zdiADELg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="254212491"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 02:39:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 04/11] drm/i915: Introduce pin_params.needs_cpu_lmem_access
In-Reply-To: <20260416174448.28264-5-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416174448.28264-1-ville.syrjala@linux.intel.com>
 <20260416174448.28264-5-ville.syrjala@linux.intel.com>
Date: Fri, 17 Apr 2026 12:39:54 +0300
Message-ID: <8e03ca87134e5bebee44aabeccd5fb86a096d4fa@intel.com>
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

On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Add a new flag pin_params.neeeds_cpu_lmem_access so that the
> low level pinning code doesn't need to peek into the display
> driver's framebuffer structure.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fb_pin.h | 1 +
>  drivers/gpu/drm/i915/i915_fb_pin.c          | 4 +++-
>  drivers/gpu/drm/xe/display/xe_fb_pin.c      | 3 ++-
>  3 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.h b/drivers/gpu/dr=
m/i915/display/intel_fb_pin.h
> index e6271437459d..bcf5a1f46092 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb_pin.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb_pin.h
> @@ -19,6 +19,7 @@ struct intel_fb_pin_params {
>  	unsigned int alignment;
>  	unsigned int phys_alignment;
>  	unsigned int vtd_guard;
> +	bool needs_cpu_lmem_access;
>  };
>=20=20
>  struct i915_vma *
> diff --git a/drivers/gpu/drm/i915/i915_fb_pin.c b/drivers/gpu/drm/i915/i9=
15_fb_pin.c
> index 780be25ad43b..96ffc4b0d809 100644
> --- a/drivers/gpu/drm/i915/i915_fb_pin.c
> +++ b/drivers/gpu/drm/i915/i915_fb_pin.c
> @@ -61,7 +61,7 @@ intel_fb_pin_to_dpt(const struct drm_framebuffer *fb,
>  			 * ensure it is always in the mappable part of lmem, if this is
>  			 * a small-bar device.
>  			 */
> -			if (intel_fb_needs_cpu_access(fb))
> +			if (pin_params->needs_cpu_lmem_access)
>  				flags &=3D ~I915_BO_ALLOC_GPU_ONLY;
>  			ret =3D __i915_gem_object_migrate(obj, &ww, INTEL_REGION_LMEM_0,
>  							flags);
> @@ -275,6 +275,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plan=
e_state,
>  			.alignment =3D intel_plane_fb_min_alignment(plane_state),
>  			.phys_alignment =3D intel_plane_fb_min_phys_alignment(plane_state),
>  			.vtd_guard =3D intel_plane_fb_vtd_guard(plane_state),
> +			.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(&fb->base),

IIUC this path never uses .needs_cpu_lmem_access, but you initialize it
anyway. What I find confusing is initializing it here apparently
unnecessarily, but then leaving it out on a number of other paths that
don't need it.

Other than that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>  		};
>  		int fence_id =3D -1;
>=20=20
> @@ -289,6 +290,7 @@ int intel_plane_pin_fb(struct intel_plane_state *plan=
e_state,
>  		struct intel_fb_pin_params pin_params =3D {
>  			.view =3D &plane_state->view.gtt,
>  			.alignment =3D intel_plane_fb_min_alignment(plane_state),
> +			.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(&fb->base),
>  		};
>=20=20
>  		vma =3D i915_dpt_pin_to_ggtt(fb->dpt, pin_params.alignment / 512);
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/=
display/xe_fb_pin.c
> index 205492639dba..a4eb06cfa769 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -335,7 +335,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct =
intel_framebuffer *fb,
>=20=20
>  	refcount_set(&vma->ref, 1);
>  	if (IS_DGFX(to_xe_device(bo->ttm.base.dev)) &&
> -	    intel_fb_needs_cpu_access(&fb->base) &&
> +	    pin_params->needs_cpu_lmem_access &&
>  	    !(bo->flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)) {
>  		struct xe_vram_region *vram =3D xe_device_get_root_tile(xe)->mem.vram;
>=20=20
> @@ -474,6 +474,7 @@ int intel_plane_pin_fb(struct intel_plane_state *new_=
plane_state,
>  	struct intel_fb_pin_params pin_params =3D {
>  		.view =3D &new_plane_state->view.gtt,
>  		.alignment =3D plane->min_alignment(plane, fb, 0),
> +		.needs_cpu_lmem_access =3D intel_fb_needs_cpu_access(fb),
>  	};
>=20=20
>  	if (reuse_vma(new_plane_state, old_plane_state))

--=20
Jani Nikula, Intel
