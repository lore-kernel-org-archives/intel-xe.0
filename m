Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB0CEA3F2B
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 09:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0134210E523;
	Tue, 10 Feb 2026 09:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YOR4dr4x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AD810E523
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 09:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770714946; x=1802250946;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=bsXLrhjxvEdND4XxmNtsUTCoE9JLbdDJUjaLSxIiVhw=;
 b=YOR4dr4xcBYTS4cIBDTlF5VGpnYjBLeLUU1vk8zyxhvBAMtnwjZRd0Gy
 2YjenH5l6dQfy5muvpSzG8nawCLSjSPmVU0Ap6dtmr1LYj1xTObF5bFdo
 hqOLV8JRoPeYwaYK1jeL0ndiaq3Zyi0Fop9CCQGXp9rDsFDOtxk+YD8a/
 hy2W0ukd6q3aQirKbWbrKgPhVY8Y3ncF8+cxmW4kYGRHpa5p/IzJ484IC
 qxCWKRJlB+XBVWUromLV7Mpb7E9JDDnF6jTCPOEMxTdjkHJxDYzZZ4Kkc
 rZtx1SaxOyNXH3dynxaJJc+qjhfHpy5j33raK9vayuIkxOGfHwPHZWkki A==;
X-CSE-ConnectionGUID: 0NiHh4GsQkqWXL5HU4mQAQ==
X-CSE-MsgGUID: nQeuY92+TJmiGMmKwCW8ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82568009"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82568009"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:15:46 -0800
X-CSE-ConnectionGUID: 9c4oVa4ISYuMK54iTCdYWw==
X-CSE-MsgGUID: VwmeoaVjQtO5pRhAGUeFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216030692"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:15:45 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Austin Hu <austin.hu@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/i915/color: Attach the 3D LUT block to required
 DE Plane.
In-Reply-To: <20260207001250.2448612-2-austin.hu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260207001250.2448612-1-austin.hu@intel.com>
 <20260207001250.2448612-2-austin.hu@intel.com>
Date: Tue, 10 Feb 2026 11:15:42 +0200
Message-ID: <2cb9becbee22538f4230aa5f716337ed07a7e250@intel.com>
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

On Fri, 06 Feb 2026, Austin Hu <austin.hu@intel.com> wrote:
> Or attach to Pipe directly for the unsupported Plane(s).

Insufficient commit message. Please don't add a period at the end of the
subject.

>
> Signed-off-by: Austin Hu <austin.hu@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c    | 29 ++++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_color.h    | 11 ++-----
>  drivers/gpu/drm/i915/display/intel_plane.c    |  4 +--
>  .../drm/i915/display/skl_universal_plane.c    |  2 +-
>  4 files changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index e79506554..dff33c9c1 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4090,7 +4090,10 @@ static void glk_load_lut_3d(struct intel_dsb *dsb,
>  	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), 0);
>  }
>  
> -static void glk_lut_3d_commit(struct intel_dsb *dsb, struct intel_crtc *crtc, bool enable)
> +static void glk_lut_3d_commit(struct intel_dsb *dsb,
> +		struct intel_crtc *crtc,
> +		struct intel_plane *plane,
> +		bool enable)

Please fix the indentation, that's not a style used anywhere.

>  {
>  	struct intel_display *display = to_intel_display(crtc);
>  	enum pipe pipe = crtc->pipe;
> @@ -4102,8 +4105,25 @@ static void glk_lut_3d_commit(struct intel_dsb *dsb, struct intel_crtc *crtc, bo
>  		return;
>  	}
>  
> -	if (enable)
> -		val = LUT_3D_ENABLE | LUT_3D_READY | LUT_3D_BIND_PLANE_1;
> +	if (enable) {
> +		val = LUT_3D_ENABLE | LUT_3D_READY;
> +
> +		switch (plane->id) {
> +		case PLANE_1:
> +			val |= LUT_3D_BIND_PLANE_1;
> +			break;
> +		case PLANE_2:
> +			val |= LUT_3D_BIND_PLANE_2;
> +			break;
> +		case PLANE_3:
> +			val |= LUT_3D_BIND_PLANE_3;
> +			break;
> +		default:
> +			/* Attached the 3D LUT block to Pipe. */

Attached? Or Attach? There's no need to capitalize pipe.

> +			val |= LUT_3D_BIND_PIPE;
> +			break;
> +		}
> +	}
>  
>  	intel_de_write_dsb(display, dsb, LUT_3D_CTL(pipe), val);
>  }
> @@ -4238,13 +4258,14 @@ static const struct intel_color_funcs ilk_color_funcs = {
>  };
>  
>  void intel_color_plane_commit_arm(struct intel_dsb *dsb,
> +				  struct intel_plane *plane,
>  				  const struct intel_plane_state *plane_state)
>  {
>  	struct intel_display *display = to_intel_display(plane_state);
>  	struct intel_crtc *crtc = to_intel_crtc(plane_state->uapi.crtc);
>  
>  	if (crtc && intel_color_crtc_has_3dlut(display, crtc->pipe))
> -		glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d);
> +		glk_lut_3d_commit(dsb, crtc, plane, !!plane_state->hw.lut_3d);

Just pass plane_state, and figure the rest out from that.

	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);

>  }
>  
>  static void
> diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
> index c21b9bdf7..bc8192d75 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -7,15 +7,7 @@
>  #define __INTEL_COLOR_H__
>  
>  #include <linux/types.h>
> -
> -struct intel_atomic_state;
> -struct intel_crtc_state;
> -struct intel_crtc;
> -struct intel_display;
> -struct intel_dsb;
> -struct intel_plane_state;
> -struct drm_property_blob;
> -enum pipe;
> +#include "intel_display_types.h"

Absolutely not.

Please never include header from headers unless you absolutely have
to. Use forward declarations instead.

We've put a lot of effort into reducing header interdependencies, which
improves incremental build times quite nicely.

Here, it would be sufficient to add

struct intel_plane;

forward declaration, *except* you can get the plane from the plane state
with no changes in the API:

	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);

>  void intel_color_init_hooks(struct intel_display *display);
>  int intel_color_init(struct intel_display *display);
> @@ -45,6 +37,7 @@ void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
>  void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>  					const struct intel_plane_state *plane_state);
>  void intel_color_plane_commit_arm(struct intel_dsb *dsb,
> +				  struct intel_plane *plane,
>  				  const struct intel_plane_state *plane_state);
>  bool intel_color_crtc_has_3dlut(struct intel_display *display, enum pipe pipe);
>  #endif /* __INTEL_COLOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> index ab6a58530..305e8e60f 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -345,11 +345,11 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
>  	if (intel_colorop->id == INTEL_PLANE_CB_CSC)
>  		return drm_property_replace_blob(&plane_state->hw.ctm, blob);
>  	else if (intel_colorop->id == INTEL_PLANE_CB_PRE_CSC_LUT)
> -		return	drm_property_replace_blob(&plane_state->hw.degamma_lut, blob);
> +		return drm_property_replace_blob(&plane_state->hw.degamma_lut, blob);
>  	else if (intel_colorop->id == INTEL_PLANE_CB_POST_CSC_LUT)
>  		return drm_property_replace_blob(&plane_state->hw.gamma_lut, blob);
>  	else if (intel_colorop->id == INTEL_PLANE_CB_3DLUT)
> -		return	drm_property_replace_blob(&plane_state->hw.lut_3d, blob);
> +		return drm_property_replace_blob(&plane_state->hw.lut_3d, blob);

Unrelated changes that don't belong in this patch.

>  
>  	return false;
>  }
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> index ee8e24497..b68e222c3 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> @@ -1673,7 +1673,7 @@ icl_plane_update_arm(struct intel_dsb *dsb,
>  
>  	icl_plane_update_sel_fetch_arm(dsb, plane, crtc_state, plane_state);
>  
> -	intel_color_plane_commit_arm(dsb, plane_state);
> +	intel_color_plane_commit_arm(dsb, plane, plane_state);
>  
>  	/*
>  	 * In order to have FBC for fp16 formats pixel normalizer block must be

-- 
Jani Nikula, Intel
