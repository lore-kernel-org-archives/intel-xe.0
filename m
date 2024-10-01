Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91078CE7CE7
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 09:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF7E10E00E;
	Tue,  1 Oct 2024 09:09:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6apPnzd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4014D10E00E
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 09:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727773767; x=1759309767;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GyscPJIIAr3PSZwpQaAAeEsAPqQgjlHMPKcrBMj2hcY=;
 b=V6apPnzdS1sd4nvQIAMWPq9evOZ9+7dsEzo0rCmpHVAVXuQXLT/iicwb
 blEX92aRD/r3Iw164bCyUG9gdZ+Qvht980/6VUOtsumYnCF7W/6kKyJ8o
 jwOPl265N1qpdTxBpAN8GY2oePmZfaEk3FNWKIRFYVMLq42ZQb7u18qPY
 yWYe7GsYciJVbaE1bCNKCNFNiZeB6gZ6Q9e6ZaBPDZdLKcNdC83KsAqzR
 oFASpGJ37kUPjKsn6Tj9h4NLgKPXIS0AO15ihfFIE/LQmqjwm9hm26sLh
 lcmrX4jey2J8Z7jfxDSmaOeILNyYffJYYpoyXFeeGZji6tW11SOAxBQgg w==;
X-CSE-ConnectionGUID: EVMGKGJ0Rv6dnE3CNxSwlw==
X-CSE-MsgGUID: S45uHMTBR/i0tRcd07UrWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="30601213"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="30601213"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:09:26 -0700
X-CSE-ConnectionGUID: 9zHCE2jCS2WMUAUfUUN5jw==
X-CSE-MsgGUID: Kc694f0KRh6eY5thOE6WuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73218166"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 02:09:24 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 13/15] drm/xe/display: Use async flip for flipping
 initial fb.
In-Reply-To: <20240930195749.318998-14-maarten.lankhorst@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
 <20240930195749.318998-14-maarten.lankhorst@linux.intel.com>
Date: Tue, 01 Oct 2024 12:09:09 +0300
Message-ID: <87zfnour4a.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 30 Sep 2024, Maarten Lankhorst <maarten.lankhorst@linux.intel.com> wrote:
> Since memirq requires a ggtt allocation, irqs will be initialised
> later. This means we cannot rely on drm_wait_for_vblank any more as
> it requires interrupts.
>
> Fortunately there's still SURFLIVE
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_plane_initial.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> index 4660db0aecb68..3fd0fe2dbc27a 100644
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
> @@ -235,6 +238,14 @@ intel_find_initial_plane_obj(struct intel_crtc *crtc,
>  	plane_state->uapi.crtc = &crtc->base;
>  	intel_plane_copy_uapi_to_hw_state(plane_state, plane_state, crtc);
>  
> +	/* Flip async, we don't have interrupts yet */
> +	plane_state->ctl = intel_uncore_read(&xe->uncore, PLANE_CTL(plane->pipe, PLANE_1));

Shouldn't xe code use xe stuff directly instead of the compat layer?

BR,
Jani.

> +	plane->async_flip(plane, to_intel_crtc_state(crtc->base.state), plane_state, true);
> +
> +	/* Wait 40 ms (1 frame at 25 fps) for async flip to complete */
> +	if (intel_wait_for_register_fw(&xe->uncore, PLANE_SURFLIVE(plane->pipe, PLANE_1), XE_PAGE_SIZE - 1, vma->node->base.start, 40) < 0)
> +		drm_warn(&xe->drm, "async flip timed out\n");
> +
>  	atomic_or(plane->frontbuffer_bit, &to_intel_frontbuffer(fb)->bits);
>  
>  	plane_config->vma = vma;
> @@ -292,9 +303,6 @@ void intel_initial_plane_config(struct drm_i915_private *i915)
>  		 */
>  		intel_find_initial_plane_obj(crtc, plane_configs);
>  
> -		if (i915->display.funcs.display->fixup_initial_plane_config(crtc, plane_config))
> -			intel_crtc_wait_for_next_vblank(crtc);
> -
>  		plane_config_fini(plane_config);
>  	}
>  }

-- 
Jani Nikula, Intel
