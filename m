Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBD2606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZEmBOMjQ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EF910FF6A;
	Thu, 12 Nov 2026 09:30:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA3110FF5F;
 Thu, 12 Nov 2026 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794475841; x=1826011841;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=3vr0FgSTOYwr/Luhd++C1jNLcjxE/b8SGljgOK+A67U=;
 b=ZEmBOMjQ5LNVz1y5iKSfDrUUPeqBZn3BsISDqULrFoV08QPmjo3Sgj2P
 HG0gi/EUgwqihKXnt/ZFoVheBpB+zsZx6JtHojaVCukWszgE4sQ4SUWnn
 SAJIZh5JeQdEln6j7BotuygJFaCU4hU5z3zzEz+8rOsguRklA+iEu/yjb
 MUfHwD2B3ve2iUeBMGd+oYGsPYFkHoexNM/16vj+cZPzrl4dKwmgo3Qu7
 nLaUzu7mQ/SQuzFspo3dlMWLFgfER82vqdMDHh+3CpvwUxl7Aq3K9jxAB
 WiHKYPgVsbfuWtJ4Y7zoQPyVfYhMRTTVgwx2LrLUCQGrnGgzoA1Qsa6R7 g==;
X-CSE-ConnectionGUID: Szy/IxFTTbCcBTuskBhk9A==
X-CSE-MsgGUID: 6xZLrNn4R7+/Yq8LMPPlvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3352865"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3352865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:30:41 -0800
X-CSE-ConnectionGUID: 4PKHB1qvRqm1g26VCB2dXA==
X-CSE-MsgGUID: j7aRbW3CRuq0w8Zxom+01A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8933209"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:30:40 -0800
Date: Thu, 12 Nov 2026 10:30:33 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 12/15] drm/i915/pfit: Extract i9xx_pfit_vscale_ratio()
 and i9xx_pfit_is_one_line_mode()
Message-ID: <6rz54s7rvimi6xo77ktt57cqfbyqkuqhogfb6ow5bazbcdf2gv@a2uv4tkh6mfv>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-13-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019135309.23578-13-ville.syrjala@linux.intel.com>
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
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 04:53:06PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Move the raw pfit stuff from the overlay code into intel_pfit.c.
> For now we'll stick to the "read registers" approach in
> i9xx_pfit_vscale_ratio(), but really we should just use precomputed
> values there...
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> ---
>  drivers/gpu/drm/i915/display/intel_overlay.c | 31 ++++----------------
>  drivers/gpu/drm/i915/display/intel_pfit.c    | 30 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_pfit.h    |  3 ++
>  3 files changed, 38 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
> index a809aa2950ac..822eef96ea37 100644
> --- a/drivers/gpu/drm/i915/display/intel_overlay.c
> +++ b/drivers/gpu/drm/i915/display/intel_overlay.c
> @@ -37,7 +37,7 @@
>  #include "intel_frontbuffer.h"
>  #include "intel_overlay.h"
>  #include "intel_parent.h"
> -#include "intel_pfit_regs.h"
> +#include "intel_pfit.h"
>  
>  /* Limits for overlay size. According to intel doc, the real limits are:
>   * Y width: 4095, UV width (planar): 2047, Y height: 2047,
> @@ -614,28 +614,8 @@ static int check_overlay_possible_on_crtc(struct intel_overlay *overlay,
>  static void update_pfit_vscale_ratio(struct intel_overlay *overlay)
>  {
>  	struct intel_display *display = overlay->display;
> -	u32 ratio;
>  
> -	/* XXX: This is not the same logic as in the xorg driver, but more in
> -	 * line with the intel documentation for the i965
> -	 */
> -	if (DISPLAY_VER(display) >= 4) {
> -		u32 tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
> -
> -		/* on i965 use the PGM reg to read out the autoscaler values */
> -		ratio = REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, tmp);
> -	} else {
> -		u32 tmp;
> -
> -		if (intel_de_read(display, PFIT_CONTROL(display)) & PFIT_VERT_AUTO_SCALE)
> -			tmp = intel_de_read(display, PFIT_AUTO_RATIOS(display));
> -		else
> -			tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
> -
> -		ratio = REG_FIELD_GET(PFIT_VERT_SCALE_MASK, tmp);
> -	}
> -
> -	overlay->pfit_vscale_ratio = ratio;
> +	overlay->pfit_vscale_ratio = i9xx_pfit_vscale_ratio(display);
>  }
>  
>  static int check_overlay_dst(struct intel_overlay *overlay,
> @@ -838,13 +818,12 @@ int intel_overlay_put_image_ioctl(struct drm_device *dev, void *data,
>  		overlay->crtc = crtc;
>  		crtc->overlay = overlay;
>  
> -		/* line too wide, i.e. one-line-mode */
> -		if (drm_rect_width(&crtc->config->pipe_src) > 1024 &&
> -		    crtc->config->gmch_pfit.control & PFIT_ENABLE) {
> +		if (i9xx_pfit_is_one_line_mode(crtc->config)) {
>  			overlay->pfit_active = true;
>  			update_pfit_vscale_ratio(overlay);
> -		} else
> +		} else {
>  			overlay->pfit_active = false;
> +		}
>  	}
>  
>  	ret = check_overlay_dst(overlay, params);
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index d94301c80d57..d8daa463452e 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -960,3 +960,33 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
>  			ilk_pfit_get_config(crtc_state);
>  	}
>  }
> +
> +bool i9xx_pfit_is_one_line_mode(const struct intel_crtc_state *crtc_state)
> +{
> +	return crtc_state->gmch_pfit.control & PFIT_ENABLE &&
> +		drm_rect_width(&crtc_state->pipe_src) > 1024;
> +}
> +
> +u32 i9xx_pfit_vscale_ratio(struct intel_display *display)
> +{
> +	/* XXX: This is not the same logic as in the xorg driver, but more in
> +	 * line with the intel documentation for the i965
> +	 *
> +	 * FIXME don't read this from the hardware but use a computed value
> +	 */
> +	if (DISPLAY_VER(display) >= 4) {
> +		u32 tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
> +
> +		/* on i965 use the PGM reg to read out the autoscaler values */
> +		return REG_FIELD_GET(PFIT_VERT_SCALE_MASK_965, tmp);
> +	} else {
> +		u32 tmp;
> +
> +		if (intel_de_read(display, PFIT_CONTROL(display)) & PFIT_VERT_AUTO_SCALE)
> +			tmp = intel_de_read(display, PFIT_AUTO_RATIOS(display));
> +		else
> +			tmp = intel_de_read(display, PFIT_PGM_RATIOS(display));
> +
> +		return REG_FIELD_GET(PFIT_VERT_SCALE_MASK, tmp);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.h b/drivers/gpu/drm/i915/display/intel_pfit.h
> index f1162b37d407..e6cd3af2e2a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.h
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.h
> @@ -27,4 +27,7 @@ intel_pfit_mode_valid(struct intel_display *display,
>  		      const struct drm_display_mode *mode,
>  		      enum intel_output_format output_format,
>  		      int num_joined_pipes);
> +bool i9xx_pfit_is_one_line_mode(const struct intel_crtc_state *crtc_state);
> +u32 i9xx_pfit_vscale_ratio(struct intel_display *display);
> +
>  #endif /* __INTEL_PFIT_H__ */
> -- 
> 2.55.0
> 
> 
