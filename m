Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4B2CDD1BA
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 15:14:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681A010E03C;
	Fri, 27 Sep 2024 15:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFoeIe43";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B07A10E03C
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727450068; x=1758986068;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OZhZFl879kY/GvxUswMMvB0y0sAN+mrdMc0EzeiGVQw=;
 b=lFoeIe430leG1u7hMy3yqpm+Wfj/ZsBuBN8wrZtGv9Drj1X6CdARlYq+
 IdiyvXitcQsjTaEYwz6ltPqRKwqBpK5qgpr5zHM92RBeKv9ZdmT3awU4C
 vMAmfidvSmf+I2fJR8yYgiwUtXX4O1/A2gTo3dHOyMFjzzrV9d7AbIXmx
 LdlUk5JW92zM4gADbsh5SZrUR1eENxHiM3K9rGSjH+mWQ77I76boBQlK1
 OzEdNdsgpb41caYi1m96JAtpWXOkVD7slc1VRfrEPEOwggoYlHbNUSpse
 iNlF1wLJvL+4P3l9vRo1O6rRd6+wjJZdRXSjrJs8aOYbG0BcGDmKpGM8t g==;
X-CSE-ConnectionGUID: SOYrwF/gSDWF2cVbQ6f9uw==
X-CSE-MsgGUID: PgW5wbQ+SA6PN9BoZwjPVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26399986"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26399986"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 08:14:27 -0700
X-CSE-ConnectionGUID: uvUeCBvAQ2OkJe4BLUyLuA==
X-CSE-MsgGUID: 6XgUa03BTguCG1vKG0QRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72720641"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 27 Sep 2024 08:14:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Sep 2024 18:14:24 +0300
Date: Fri, 27 Sep 2024 18:14:24 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 12/14] drm/xe/display: Use async flip for flipping
 initial fb.
Message-ID: <ZvbL0GUZ3c5-07qJ@intel.com>
References: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
 <20240927141404.163317-13-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240927141404.163317-13-maarten.lankhorst@linux.intel.com>
X-Patchwork-Hint: comment
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

On Fri, Sep 27, 2024 at 04:14:02PM +0200, Maarten Lankhorst wrote:
> Since memirq requires a ggtt allocation, irqs will be initialised
> later. This means we cannot rely on drm_wait_for_vblank any more as
> it requires interrupts.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> TODO: Check for flip completion?
> ---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 4660db0aecb6..bad074540b55 100644
> --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> @@ -17,6 +17,8 @@
>  #include "intel_fb_pin.h"
>  #include "intel_frontbuffer.h"
>  #include "intel_plane_initial.h"
> +#include "intel_uncore.h"
> +#include "skl_universal_plane_regs.h"
>  #include "xe_bo.h"
>  #include "xe_wa.h"
>  
> @@ -187,6 +189,7 @@ static void
>  intel_find_initial_plane_obj(struct intel_crtc *crtc,
>  			     struct intel_initial_plane_config plane_configs[])
>  {
> +	struct xe_device *xe = to_xe_device(crtc->base.dev);
>  	struct intel_initial_plane_config *plane_config =
>  		&plane_configs[crtc->pipe];
>  	struct intel_plane *plane =
> @@ -235,6 +238,10 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
>  	plane_state->uapi.crtc = &crtc->base;
>  	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
>  
> +	/* Flip async, we don't have interrupts yet */
> +	plane_state->ctl = intel_uncore_read(&xe->uncore, PLANE_CTL(plane->pipe, PLANE_1));
> +	plane->async_flip(plane, to_intel_crtc_state(crtc->base.state), plane_state, true);
> +
>  	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
>  
>  	plane_config->vma = vma;
> @@ -292,9 +299,6 @@ void intel_initial_plane_config(struct drm_i915_private *i915)
>  		 */
>  		intel_find_initial_plane_obj(crtc, plane_configs);
>  
> -		if (i915->display.funcs.display->fixup_initial_plane_config(crtc, plane_config))
> -			intel_crtc_wait_for_next_vblank(crtc);

Argh. I think the best solution would probably be to provide
an intel_crtc_wait_for_next_vblank_early()/etc. that just
falls back to polling the status bit if interrupts aren't
available.

Or we could also just poll the live surface register
instead (though that is not available on ancient hardware
so would have to assert that it's not used there).

I suppose another option might be to just usleep() in
the fallback. This would have the benefit of not needing
any hardware specific implementations. This doesn't really
need to be that accurate as long it guarantees that we
wait for at least one frame duration.

> -
>  		plane_config_fini(plane_config);
>  	}
>  }
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
