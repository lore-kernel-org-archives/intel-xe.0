Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B0CEACC4
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 13:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B712B10E1DE;
	Tue,  1 Oct 2024 13:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0YK0Io9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3977310E1DE
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727791157; x=1759327157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zuY/JpW0gEOaYaaJQDCr4/m+c07xFpqy+FJIVSZameI=;
 b=U0YK0Io9Q/UY9NbVWod+mjyRKsjGwm+H2av1Lww4mQFmVUlyugWWp3yh
 9XIvea7fdg9j2DB3FlqTPKGjr6CYPLotX4AyRQy3FztRrEF9hUySpzGym
 CDF5vmLbeLb4+U++LwQwk/Ui8/5zX0J2ly+69Tf/0/qWys+fHDKQ05Ua8
 sWpXUfecVqwUxP7scOxQapJ3DE053fNvkl41dwa8JJR0WKGkXHQDOhul9
 MApXBYkYvJl6d3wYRwDVm0DEj2wi1jaslLxMY/cNvJnsQwe5q2TvT46us
 VxCp6mFEgus/NZo0xF4hvSEXvCeN4fDz7vpkVKElz8Ia/PAX36TtavVrH g==;
X-CSE-ConnectionGUID: JDSOiBE9Tv6yWeomJP4sJw==
X-CSE-MsgGUID: oxo8EXazSxeTQ4NDDwR7tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27066180"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27066180"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:59:10 -0700
X-CSE-ConnectionGUID: LWMle+XnS46s9Ui5zy7lYA==
X-CSE-MsgGUID: eWz1A3UBTPOZyZZz6NftfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73796206"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 01 Oct 2024 06:59:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Oct 2024 16:59:06 +0300
Date: Tue, 1 Oct 2024 16:59:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 13/15] drm/xe/display: Use async flip for flipping
 initial fb.
Message-ID: <ZvwAKivxnl0mUik4@intel.com>
References: <20240930195749.318998-1-maarten.lankhorst@linux.intel.com>
 <20240930195749.318998-14-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930195749.318998-14-maarten.lankhorst@linux.intel.com>
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

On Mon, Sep 30, 2024 at 09:57:47PM +0200, Maarten Lankhorst wrote:
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
> +	plane->async_flip(plane, to_intel_crtc_state(crtc->base.state), plane_state, true);
> +
> +	/* Wait 40 ms (1 frame at 25 fps) for async flip to complete */
> +	if (intel_wait_for_register_fw(&xe->uncore, PLANE_SURFLIVE(plane->pipe, PLANE_1), XE_PAGE_SIZE - 1, vma->node->base.start, 40) < 0)
> +		drm_warn(&xe->drm, "async flip timed out\n");

Please wrap that in a function...

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

... and use it here instead of abusing async flips.

But perhaps it would actually be best to suck that vblank wait into
.fixup_plane_config(). That would keep the SURF write and SURFLIVE
read close by at least.

Although it would require some kind of "are interrupts enabled yet?"
check which will need some kind of abstract interface in the end,
but for now I guess for now we could go with a IS_ENABLED() check
since we already have one of those in skl_universal_plane.c.
Hmm, or I guess we could just pass in a parameter to
.fixup_initial_plane_config() indicating what to do, since we
currently call this from driver specific code anyway.

-- 
Ville Syrjälä
Intel
