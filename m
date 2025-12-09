Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3521BD3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 08:31:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E972C10E4A4;
	Tue,  9 Dec 2025 08:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuHEgHgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E7D10E4A4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765269091; x=1796805091;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZIx0n6mTw/NUrWgJwdG+7uOSfPS3EkFVobhhiGZwMIw=;
 b=cuHEgHgohTVRLLjI5k3MgKbARJKw7UPhYqMACHKlV7k52XhSdX824Gxf
 p9EqI6SMNPBAT3cPDnFUeMbsKVjxsAOHRFBv43nhlR72GIS8zI5oIOae9
 xxXBSXjWId3QGRfdf9EEcbv1rWE6jAJWSMtkrCxmKOMEIHI51ME5ilZbP
 44GPYmDYkT6stxE32Q7jJLmqS+K9SQ1Hlfvtba2GIIUAamgZ/xCD45jFP
 H6OYobf+QpMb1vQUZEwszRphyh19lneUxxeOvSKlSdsnqXU9neheBvbN1
 xkCzCyW/4qcoUMqfBGHYr/43zdWSSpvNpiKIctUKCOn3uclMfiQh4GKAp w==;
X-CSE-ConnectionGUID: vs4n5Bc2RhufaNPem0XJzg==
X-CSE-MsgGUID: 02b4VH3iRN2NsbWwcn4KdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="71077338"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="71077338"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 00:31:30 -0800
X-CSE-ConnectionGUID: 9iuB+zuLTTypJC7701pSnA==
X-CSE-MsgGUID: l30PGSLHQ2iBzdYWmTlSNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="219514692"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 00:31:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?utf-8?Q?Jos=C3=A9?=
 Roberto de Souza <jose.souza@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v15 09/10] drm/i915/display: Detect AuxCCS support via
 display parent interface
In-Reply-To: <20251208191722.7194-10-tursulin@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-10-tursulin@igalia.com>
Date: Tue, 09 Dec 2025 10:31:24 +0200
Message-ID: <c1ad658c6cef76700f12e11fc671fbd6eb302108@intel.com>
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

On Mon, 08 Dec 2025, Tvrtko Ursulin <tursulin@igalia.com> wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> Whether AuxCCS can be properly supported depends on the support both from
> the display side and non-display side of the driver.
>
> Let us therefore allow for the non-display part to be queried via the
> display parent interface.
>
> The new interface replaces the HAS_AUX_CCS macro and we also remove the
> FIXME from skl_universal_plane_create since now the xe will not advertise
> the AuxCCS caps to start with so they do not need to be removed after
> enumeration.
>
> Also, by removing this build specific FIXME we come a step closer to fully
> de-coupling display and non-display.

This could even be a separate prep patch.

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers =
if built for Xe")
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_device.h |  1 -
>  drivers/gpu/drm/i915/display/intel_fb.c             |  3 ++-
>  drivers/gpu/drm/i915/display/intel_parent.c         |  5 +++++
>  drivers/gpu/drm/i915/display/intel_parent.h         |  2 ++
>  drivers/gpu/drm/i915/display/skl_universal_plane.c  |  9 ++-------
>  drivers/gpu/drm/i915/i915_driver.c                  | 10 ++++++++++
>  include/drm/intel/display_parent_interface.h        |  3 +++
>  7 files changed, 24 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/driver=
s/gpu/drm/i915/display/intel_display_device.h
> index 11c2b2883f35..dc61c6560015 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -149,7 +149,6 @@ struct intel_display_platforms {
>  #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(=
__display) >=3D 14)
>  #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >=3D 5)
>  #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >=3D 13)
> -#define HAS_AUX_CCS(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__=
display)->platform.alderlake_p || (__display)->platform.meteorlake)
>  #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >=3D 11 && HAS_=
DSC(__display))
>  #define HAS_CASF(__display)		(DISPLAY_VER(__display) >=3D 20)
>  #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_c=
rawl)
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i9=
15/display/intel_fb.c
> index b34b4961fe1c..5b8e02ca2faf 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -21,6 +21,7 @@
>  #include "intel_fb_bo.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_panic.h"
> +#include "intel_parent.h"
>  #include "intel_plane.h"
>=20=20
>  #define check_array_bounds(display, a, i) drm_WARN_ON((display)->drm, (i=
) >=3D ARRAY_SIZE(a))
> @@ -558,7 +559,7 @@ static bool plane_has_modifier(struct intel_display *=
display,
>  	 * where supported.
>  	 */
>  	if (intel_fb_is_ccs_modifier(md->modifier) &&
> -	    HAS_AUX_CCS(display) !=3D !!md->ccs.packed_aux_planes)
> +	    intel_parent_has_auxccs(display) !=3D !!md->ccs.packed_aux_planes)
>  		return false;
>=20=20
>  	if (md->modifier =3D=3D I915_FORMAT_MOD_4_TILED_BMG_CCS &&
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/dr=
m/i915/display/intel_parent.c
> index 2ea310cc3509..7a55def19836 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.c
> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
> @@ -94,3 +94,8 @@ void intel_parent_fence_priority_display(struct intel_d=
isplay *display, struct d
>  	if (display->parent->fence_priority_display)
>  		display->parent->fence_priority_display(fence);
>  }
> +
> +bool intel_parent_has_auxccs(struct intel_display *display)
> +{
> +	return display->parent->has_auxccs && display->parent->has_auxccs(displ=
ay->drm);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/dr=
m/i915/display/intel_parent.h
> index 8f91a6f75c53..f34ee81ed7a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.h
> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
> @@ -33,4 +33,6 @@ bool intel_parent_has_fenced_regions(struct intel_displ=
ay *display);
>=20=20
>  void intel_parent_fence_priority_display(struct intel_display *display, =
struct dma_fence *fence);
>=20=20
> +bool intel_parent_has_auxccs(struct intel_display *display);
> +
>  #endif /* __INTEL_PARENT_H__ */
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers=
/gpu/drm/i915/display/skl_universal_plane.c
> index 6cd94f400e3f..7e5dce8cfec0 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -22,6 +22,7 @@
>  #include "intel_fbc.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_panic.h"
> +#include "intel_parent.h"
>  #include "intel_plane.h"
>  #include "intel_psr.h"
>  #include "intel_psr_regs.h"
> @@ -1602,7 +1603,7 @@ icl_plane_update_noarm(struct intel_dsb *dsb,
>  	}
>=20=20
>  	/* FLAT CCS doesn't need to program AUX_DIST */
> -	if (HAS_AUX_CCS(display))
> +	if (intel_parent_has_auxccs(display))
>  		intel_de_write_dsb(display, dsb, PLANE_AUX_DIST(pipe, plane_id),
>  				   skl_plane_aux_dist(plane_state, color_plane));
>=20=20
> @@ -2972,12 +2973,6 @@ skl_universal_plane_create(struct intel_display *d=
isplay,
>  	else
>  		caps =3D skl_plane_caps(display, pipe, plane_id);
>=20=20
> -	/* FIXME: xe has problems with AUX */
> -	if (!IS_ENABLED(I915) && HAS_AUX_CCS(display))
> -		caps &=3D ~(INTEL_PLANE_CAP_CCS_RC |
> -			  INTEL_PLANE_CAP_CCS_RC_CC |
> -			  INTEL_PLANE_CAP_CCS_MC);
> -
>  	modifiers =3D intel_fb_plane_get_modifiers(display, caps);
>=20=20
>  	ret =3D drm_universal_plane_init(display->drm, &plane->base,
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index d98839427ef9..59e396a74ca4 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -757,6 +757,15 @@ static void fence_priority_display(struct dma_fence =
*fence)
>  		i915_gem_fence_wait_priority_display(fence);
>  }
>=20=20
> +static bool has_auxccs(struct drm_device *drm)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(drm);
> +
> +	return IS_GRAPHICS_VER(i915, 9, 12) ||
> +	       IS_ALDERLAKE_P(i915) ||
> +	       IS_METEORLAKE(i915);
> +}
> +
>  static const struct intel_display_parent_interface parent =3D {
>  	.hdcp =3D &i915_display_hdcp_interface,
>  	.rpm =3D &i915_display_rpm_interface,
> @@ -765,6 +774,7 @@ static const struct intel_display_parent_interface pa=
rent =3D {
>  	.vgpu_active =3D vgpu_active,
>  	.has_fenced_regions =3D has_fenced_regions,
>  	.fence_priority_display =3D fence_priority_display,
> +	.has_auxccs =3D has_auxccs,
>  };
>=20=20
>  const struct intel_display_parent_interface *i915_driver_parent_interfac=
e(void)
> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/i=
ntel/display_parent_interface.h
> index 61d1b22adc83..0d79f3c189c3 100644
> --- a/include/drm/intel/display_parent_interface.h
> +++ b/include/drm/intel/display_parent_interface.h
> @@ -80,6 +80,9 @@ struct intel_display_parent_interface {
>=20=20
>  	/** @fence_priority_display: Set display priority. Optional. */
>  	void (*fence_priority_display)(struct dma_fence *fence);
> +
> +	/** @has_auxcss: Are AuxCCS formats supported by the parent. Optional. =
*/
> +	bool (*has_auxccs)(struct drm_device *drm);
>  };
>=20=20
>  #endif

--=20
Jani Nikula, Intel
