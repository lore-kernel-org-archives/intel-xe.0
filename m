Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3521760A260C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 15:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cSK0FnsQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F4B10FE12;
	Wed, 18 Nov 2026 15:38:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6C910FE02;
 Wed, 18 Nov 2026 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016322; x=1826552322;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aMfSCJrRcVu0Qbw3IIAmefCVHQ8p1po0eDipJjPeIRs=;
 b=cSK0FnsQms/m8dbnlHlru02iRL+PAMc/P5xXg48L8XrBGJp/9I/dZR2u
 qgQxZPnIpq4/DCbAhLJ9y3OWhU2i9t6lSMOpsW9AIy13Q2WbfV0VyvJlN
 lDAS9xE0elg9N/YfeZajJayAvmFJhFor6XnaHsw+G2q78K/f2rjZzdnLV
 0G5Dj7i9rJKjXIemNNWumvxy0MbsTJpi1D0Lka4US6XylL4N1TSBA14jh
 /8P20jgz7N/g3CYECUTYmPBeWUSvZYF31V0NOalDExbURO8kCJp+qeQIn
 H/SxPF4+HyI1gtCOpSASMjvit4tITYlzSlPKaRvlN/ECjsqvBP+XoLAz2 Q==;
X-CSE-ConnectionGUID: X/KG+waTRraTpt1nqpodOw==
X-CSE-MsgGUID: iCKIe2KLStSgcxwX7e3iJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3822921"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3822921"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:38:42 -0800
X-CSE-ConnectionGUID: 7G7zDJf2RxKbxP2+NdaIoA==
X-CSE-MsgGUID: VfHxlzUkSgC+6q3C66D8vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10404409"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:38:41 -0800
Date: Wed, 18 Nov 2026 17:38:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/fb: move intel_dumb_fb_max_stride() to
 intel_fb.[ch]
Message-ID: <av3GffVIJ7ZoAViU@intel.com>
References: <20261118134101.3465842-1-jani.nikula@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118134101.3465842-1-jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Nov 18, 2026 at 03:41:01PM +0200, Jani Nikula wrote:
> Move intel_plane_fb_max_stride() and intel_dumb_fb_max_stride() to
> intel_fb.[ch], and make the former static as its users are now
> exclusively in intel_fb.c.
> 
> As a side effect, we can reduce the display include "surface" of
> i915_gem_create.c, as intel_display.h is quite a big header.

Eventually we should perhaps consider sucking all the exported
symbols into completely separate headers with nothing else
in them. But no rush with that I guess.

> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 35 -------------------
>  drivers/gpu/drm/i915/display/intel_display.h |  5 ---
>  drivers/gpu/drm/i915/display/intel_fb.c      | 36 ++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_fb.h      |  2 ++
>  drivers/gpu/drm/i915/gem/i915_gem_create.c   |  2 +-
>  5 files changed, 39 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index f4d9148efde3..19caae633d29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -590,41 +590,6 @@ void intel_disable_transcoder(const struct intel_crtc_state *old_crtc_state)
>  		intel_wait_for_pipe_off(old_crtc_state);
>  }
>  
> -u32 intel_plane_fb_max_stride(struct intel_display *display,
> -			      const struct drm_format_info *info,
> -			      u64 modifier)
> -{
> -	struct intel_crtc *crtc;
> -	struct intel_plane *plane;
> -
> -	/*
> -	 * We assume the primary plane for pipe A has
> -	 * the highest stride limits of them all,
> -	 * if in case pipe A is disabled, use the first pipe from pipe_mask.
> -	 */
> -	crtc = intel_first_crtc(display);
> -	if (!crtc)
> -		return 0;
> -
> -	plane = to_intel_plane(crtc->base.primary);
> -
> -	return plane->max_stride(plane, info, modifier,
> -				 DRM_MODE_ROTATE_0);
> -}
> -
> -u32 intel_dumb_fb_max_stride(struct drm_device *drm,
> -			     u32 pixel_format, u64 modifier)
> -{
> -	struct intel_display *display = to_intel_display(drm);
> -
> -	if (!HAS_DISPLAY(display))
> -		return 0;
> -
> -	return intel_plane_fb_max_stride(display,
> -					 drm_get_format_info(drm, pixel_format, modifier),
> -					 modifier);
> -}
> -
>  void intel_set_plane_visible(struct intel_crtc_state *crtc_state,
>  			     struct intel_plane_state *plane_state,
>  			     bool visible)
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index d53b7b4a80e7..8bb37dfe47fc 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -356,11 +356,6 @@ void intel_link_compute_m_n(u16 bpp, int nlanes,
>  			    int pixel_clock, int link_clock,
>  			    int bw_overhead,
>  			    struct intel_link_m_n *m_n);
> -u32 intel_plane_fb_max_stride(struct intel_display *display,
> -			      const struct drm_format_info *info,
> -			      u64 modifier);
> -u32 intel_dumb_fb_max_stride(struct drm_device *drm,
> -			     u32 pixel_format, u64 modifier);
>  enum drm_mode_status
>  intel_mode_valid_max_plane_size(struct intel_display *display,
>  				const struct drm_display_mode *mode,
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 9d71f594537f..2c63aeefaea8 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -12,6 +12,7 @@
>  #include <drm/drm_print.h>
>  
>  #include "intel_bo.h"
> +#include "intel_crtc.h"
>  #include "intel_display.h"
>  #include "intel_display_core.h"
>  #include "intel_display_types.h"
> @@ -1330,6 +1331,41 @@ static bool intel_plane_needs_remap(const struct intel_plane_state *plane_state)
>  	return stride > max_stride;
>  }
>  
> +static u32 intel_plane_fb_max_stride(struct intel_display *display,
> +				     const struct drm_format_info *info,
> +				     u64 modifier)
> +{
> +	struct intel_crtc *crtc;
> +	struct intel_plane *plane;
> +
> +	/*
> +	 * We assume the primary plane for pipe A has
> +	 * the highest stride limits of them all,
> +	 * if in case pipe A is disabled, use the first pipe from pipe_mask.
> +	 */
> +	crtc = intel_first_crtc(display);
> +	if (!crtc)
> +		return 0;
> +
> +	plane = to_intel_plane(crtc->base.primary);
> +
> +	return plane->max_stride(plane, info, modifier,
> +				 DRM_MODE_ROTATE_0);
> +}
> +
> +u32 intel_dumb_fb_max_stride(struct drm_device *drm,
> +			     u32 pixel_format, u64 modifier)
> +{
> +	struct intel_display *display = to_intel_display(drm);
> +
> +	if (!HAS_DISPLAY(display))
> +		return 0;
> +
> +	return intel_plane_fb_max_stride(display,
> +					 drm_get_format_info(drm, pixel_format, modifier),
> +					 modifier);
> +}
> +
>  static int convert_plane_offset_to_xy(const struct intel_framebuffer *fb, int color_plane,
>  				      int plane_width, int *x, int *y)
>  {
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
> index 0a027e2595b2..ebf6485fd2fd 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.h
> +++ b/drivers/gpu/drm/i915/display/intel_fb.h
> @@ -119,6 +119,8 @@ intel_user_framebuffer_create(struct drm_device *dev,
>  bool intel_fb_modifier_uses_dpt(struct intel_display *display, u64 modifier);
>  bool intel_fb_uses_dpt(const struct drm_framebuffer *fb);
>  
> +u32 intel_dumb_fb_max_stride(struct drm_device *drm, u32 pixel_format, u64 modifier);
> +
>  unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier);
>  
>  struct drm_gem_object *intel_fb_bo(const struct drm_framebuffer *fb);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index e12ec59afb8d..c7ebec72a5e5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -6,7 +6,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_print.h>
>  
> -#include "display/intel_display.h"
> +#include "display/intel_fb.h"
>  #include "gem/i915_gem_ioctls.h"
>  #include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
> -- 
> 2.47.3

-- 
Ville Syrjälä
Intel
