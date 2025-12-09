Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2773BD3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 09:42:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B145110E4EC;
	Tue,  9 Dec 2025 09:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVoV+ZCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EEE10E4EC
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 09:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765273361; x=1796809361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5RYNmoh+2q9N4fkgCk9w+p2wu4VdW9keStf5i3m8HAA=;
 b=SVoV+ZCw7CTa13gYIWndT4i23IiMdup24MsYUi8m4ePnHKf44kZ2Kx/F
 ehGbBjVfudmCrsCDCs8wzgf9LJ7mtHfelB47eyv/pZTJiLxM9mymC8mz3
 CPwwn5GLGIi80UV+GhRU6/AnqR9go+ZPil/s4Zj4lko4Vu7Rd1uDC+tjd
 W+JqGKluuC3H6S9B4hnWF4qvaN61FiMLLBfJnXxKPaPW2gAYyP5ZmwAnF
 n3AAOK3GmwRaBlll6KKCJAVCKp4FRSl4ZvLm7DQKbw7G1yBb9He1AGK3X
 5E5s9HbC6bV38JxRMb1LPk1TYaYqtXdfglKFhi82lIv6ptvU1Sl6CWoGk Q==;
X-CSE-ConnectionGUID: Vv+O8JEaREK5aKuOvLuDMw==
X-CSE-MsgGUID: Tu/dVKGhQLm6GdoJao38Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66949058"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="66949058"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 01:42:40 -0800
X-CSE-ConnectionGUID: W/3BZuE0Siihc1WCGyhv1w==
X-CSE-MsgGUID: pZ/3r0r4QqGwGyU1Id9u+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="195788109"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.194])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 01:42:37 -0800
Date: Tue, 9 Dec 2025 11:42:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v15 09/10] drm/i915/display: Detect AuxCCS support via
 display parent interface
Message-ID: <aTfvCxI7KTZsR3wm@intel.com>
References: <20251208191722.7194-1-tursulin@igalia.com>
 <20251208191722.7194-10-tursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208191722.7194-10-tursulin@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Dec 08, 2025 at 08:17:20PM +0100, Tvrtko Ursulin wrote:
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
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> References: cf48bddd31de ("drm/i915/display: Disable AuxCCS framebuffers if built for Xe")
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
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
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 11c2b2883f35..dc61c6560015 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -149,7 +149,6 @@ struct intel_display_platforms {
>  #define HAS_4TILE(__display)		((__display)->platform.dg2 || DISPLAY_VER(__display) >= 14)
>  #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
>  #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
> -#define HAS_AUX_CCS(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)
>  #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
>  #define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
>  #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index b34b4961fe1c..5b8e02ca2faf 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -21,6 +21,7 @@
>  #include "intel_fb_bo.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_panic.h"
> +#include "intel_parent.h"
>  #include "intel_plane.h"
>  
>  #define check_array_bounds(display, a, i) drm_WARN_ON((display)->drm, (i) >= ARRAY_SIZE(a))
> @@ -558,7 +559,7 @@ static bool plane_has_modifier(struct intel_display *display,
>  	 * where supported.
>  	 */
>  	if (intel_fb_is_ccs_modifier(md->modifier) &&
> -	    HAS_AUX_CCS(display) != !!md->ccs.packed_aux_planes)
> +	    intel_parent_has_auxccs(display) != !!md->ccs.packed_aux_planes)
>  		return false;
>  
>  	if (md->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS &&
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
> index 2ea310cc3509..7a55def19836 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.c
> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
> @@ -94,3 +94,8 @@ void intel_parent_fence_priority_display(struct intel_display *display, struct d
>  	if (display->parent->fence_priority_display)
>  		display->parent->fence_priority_display(fence);
>  }
> +
> +bool intel_parent_has_auxccs(struct intel_display *display)
> +{
> +	return display->parent->has_auxccs && display->parent->has_auxccs(display->drm);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
> index 8f91a6f75c53..f34ee81ed7a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.h
> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
> @@ -33,4 +33,6 @@ bool intel_parent_has_fenced_regions(struct intel_display *display);
>  
>  void intel_parent_fence_priority_display(struct intel_display *display, struct dma_fence *fence);
>  
> +bool intel_parent_has_auxccs(struct intel_display *display);
> +
>  #endif /* __INTEL_PARENT_H__ */
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
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
>  
>  	/* FLAT CCS doesn't need to program AUX_DIST */
> -	if (HAS_AUX_CCS(display))
> +	if (intel_parent_has_auxccs(display))

This is wrong. This is also used for planar formats on
pre-icl. I'd just leave it be so that we always write sensible
o PLANE_AUX_DIST.

>  		intel_de_write_dsb(display, dsb, PLANE_AUX_DIST(pipe, plane_id),
>  				   skl_plane_aux_dist(plane_state, color_plane));
>  
> @@ -2972,12 +2973,6 @@ skl_universal_plane_create(struct intel_display *display,
>  	else
>  		caps = skl_plane_caps(display, pipe, plane_id);
>  
> -	/* FIXME: xe has problems with AUX */
> -	if (!IS_ENABLED(I915) && HAS_AUX_CCS(display))
> -		caps &= ~(INTEL_PLANE_CAP_CCS_RC |
> -			  INTEL_PLANE_CAP_CCS_RC_CC |
> -			  INTEL_PLANE_CAP_CCS_MC);
> -
>  	modifiers = intel_fb_plane_get_modifiers(display, caps);
>  
>  	ret = drm_universal_plane_init(display->drm, &plane->base,
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index d98839427ef9..59e396a74ca4 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -757,6 +757,15 @@ static void fence_priority_display(struct dma_fence *fence)
>  		i915_gem_fence_wait_priority_display(fence);
>  }
>  
> +static bool has_auxccs(struct drm_device *drm)
> +{
> +	struct drm_i915_private *i915 = to_i915(drm);
> +
> +	return IS_GRAPHICS_VER(i915, 9, 12) ||
> +	       IS_ALDERLAKE_P(i915) ||
> +	       IS_METEORLAKE(i915);
> +}
> +
>  static const struct intel_display_parent_interface parent = {
>  	.hdcp = &i915_display_hdcp_interface,
>  	.rpm = &i915_display_rpm_interface,
> @@ -765,6 +774,7 @@ static const struct intel_display_parent_interface parent = {
>  	.vgpu_active = vgpu_active,
>  	.has_fenced_regions = has_fenced_regions,
>  	.fence_priority_display = fence_priority_display,
> +	.has_auxccs = has_auxccs,
>  };
>  
>  const struct intel_display_parent_interface *i915_driver_parent_interface(void)
> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
> index 61d1b22adc83..0d79f3c189c3 100644
> --- a/include/drm/intel/display_parent_interface.h
> +++ b/include/drm/intel/display_parent_interface.h
> @@ -80,6 +80,9 @@ struct intel_display_parent_interface {
>  
>  	/** @fence_priority_display: Set display priority. Optional. */
>  	void (*fence_priority_display)(struct dma_fence *fence);
> +
> +	/** @has_auxcss: Are AuxCCS formats supported by the parent. Optional. */
> +	bool (*has_auxccs)(struct drm_device *drm);
>  };
>  
>  #endif
> -- 
> 2.52.0

-- 
Ville Syrjälä
Intel
