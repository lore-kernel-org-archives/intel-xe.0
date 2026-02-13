Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090F3EF48CC
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 04:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6410510E13C;
	Fri, 13 Feb 2026 04:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZfntIUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E5F10E13C;
 Fri, 13 Feb 2026 04:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770958503; x=1802494503;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xddnAtqIRenZJ+H3ktshp0crY834H3SxlsLVYyXDh5g=;
 b=CZfntIUMLjS+jLvF1RlrWxSvnppn3DcICa0ksk/Iu9wZD/y2OgZ4DFmN
 JD+wCMaM/iHkRJpcbvpm0gP8gLY5lINdEzOVpT6y8xMyzi4+W9pQYfwY3
 09BI9G8KEFymvE3XN0kfI2Z3+MOzB81LVCIhhYu5QLaQQ6ivUoWKQ3R0+
 senijN1W+P6BDcihNCv86G436q1wVF/dtv0whtp07SzJc6tEuI4T0B45Y
 HoUTWclROR6nI62oww/f++GTsF5pk+pOsNAY1MPtADDZ2/HYOFi5KDt33
 NK0ZA2TSWbECh1xAMj+3VWxzgkP4PDdZ2jlfk15ghIF2VQSHMPatv/ClG g==;
X-CSE-ConnectionGUID: TqcXF1tGRB6E8R6FIIMZuQ==
X-CSE-MsgGUID: fwnu2GF1SbuNrNh04zexog==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72045167"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72045167"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 20:55:02 -0800
X-CSE-ConnectionGUID: upVVMSPiTWOhtE1MSWeeYA==
X-CSE-MsgGUID: oUKTccpIQAuNzmAhVSmH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212070602"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.239])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 20:55:01 -0800
Date: Fri, 13 Feb 2026 06:54:58 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Luca Coelho <luciano.coelho@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 01/15] drm/i915/display: convert audio workaround to
 new framework
Message-ID: <aY6uooHNa6cfXAOr@intel.com>
References: <20260212184737.352515-1-luciano.coelho@intel.com>
 <20260212184737.352515-2-luciano.coelho@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212184737.352515-2-luciano.coelho@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Thu, Feb 12, 2026 at 08:45:59PM +0200, Luca Coelho wrote:
> Convert the low-hanging fruits of workaround checks to the workaround
> framework.  Instead of having display structure checks for the
> workarounds all over, concentrate the checks in intel_wa.c.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_audio.c      | 16 +++-------------
>  drivers/gpu/drm/i915/display/intel_display_wa.c |  4 ++++
>  drivers/gpu/drm/i915/display/intel_display_wa.h |  1 +
>  3 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
> index 5f3c175afdd2..be4b5dbd36fe 100644
> --- a/drivers/gpu/drm/i915/display/intel_audio.c
> +++ b/drivers/gpu/drm/i915/display/intel_audio.c
> @@ -37,6 +37,7 @@
>  #include "intel_crtc.h"
>  #include "intel_de.h"
>  #include "intel_display_types.h"
> +#include "intel_display_wa.h"
>  #include "intel_lpe_audio.h"
>  
>  /**
> @@ -184,17 +185,6 @@ static const struct hdmi_aud_ncts hdmi_aud_ncts_36bpp[] = {
>  	{ 192000, TMDS_445_5M, 20480, 371250 },
>  };
>  
> -/*
> - * WA_14020863754: Implement Audio Workaround
> - * Corner case with Min Hblank Fix can cause audio hang

We are now losing the description of the problem. Not great.
Not that the description here is super clear, but at least it
gives me some idea what this is about.

Perhaps such descriptions should remain with the implementation?

> - */
> -static bool needs_wa_14020863754(struct intel_display *display)
> -{
> -	return DISPLAY_VERx100(display) == 3000 ||
> -		DISPLAY_VERx100(display) == 2000 ||
> -		DISPLAY_VERx100(display) == 1401;
> -}
> -
>  /* get AUD_CONFIG_PIXEL_CLOCK_HDMI_* value for mode */
>  static u32 audio_config_hdmi_pixel_clock(const struct intel_crtc_state *crtc_state)
>  {
> @@ -440,7 +430,7 @@ static void hsw_audio_codec_disable(struct intel_encoder *encoder,
>  	intel_de_rmw(display, HSW_AUD_PIN_ELD_CP_VLD,
>  		     AUDIO_OUTPUT_ENABLE(cpu_transcoder), 0);
>  
> -	if (needs_wa_14020863754(display))
> +	if (intel_display_wa(display, 14020863754))

This thing is still a major disaster. There is no way to get from
here to the list of affected platforms without jumping through crazy
hoops.

At the very least the intel_display_wa() macro magic needs to die
and this should just take the enum directly. Then I could at least
jump to places where said enum value is used fairly quickly with
cscope.

>  		intel_de_rmw(display, AUD_CHICKENBIT_REG3, DACBE_DISABLE_MIN_HBLANK_FIX, 0);
>  
>  	intel_audio_sdp_split_update(old_crtc_state, false);
> @@ -572,7 +562,7 @@ static void hsw_audio_codec_enable(struct intel_encoder *encoder,
>  
>  	intel_audio_sdp_split_update(crtc_state, true);
>  
> -	if (needs_wa_14020863754(display))
> +	if (intel_display_wa(display, 14020863754))
>  		intel_de_rmw(display, AUD_CHICKENBIT_REG3, 0, DACBE_DISABLE_MIN_HBLANK_FIX);
>  
>  	/* Enable audio presence detect */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.c b/drivers/gpu/drm/i915/display/intel_display_wa.c
> index c2ccdca2c2f3..99ccc383ee70 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.c
> @@ -74,6 +74,10 @@ bool __intel_display_wa(struct intel_display *display, enum intel_display_wa wa,
>  			DISPLAY_VERx100(display) == 3500;
>  	case INTEL_DISPLAY_WA_14011503117:
>  		return DISPLAY_VER(display) == 13;
> +	case INTEL_DISPLAY_WA_14020863754:
> +		return DISPLAY_VERx100(display) == 3000 ||
> +			DISPLAY_VERx100(display) == 2000 ||
> +			DISPLAY_VERx100(display) == 1401;
>  	case INTEL_DISPLAY_WA_14025769978:
>  		return DISPLAY_VER(display) == 35;
>  	case INTEL_DISPLAY_WA_15018326506:
> diff --git a/drivers/gpu/drm/i915/display/intel_display_wa.h b/drivers/gpu/drm/i915/display/intel_display_wa.h
> index 767420d5f406..bb1382148b6e 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_wa.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_wa.h
> @@ -29,6 +29,7 @@ bool intel_display_needs_wa_16023588340(struct intel_display *display);
>  enum intel_display_wa {
>  	INTEL_DISPLAY_WA_13012396614,
>  	INTEL_DISPLAY_WA_14011503117,
> +	INTEL_DISPLAY_WA_14020863754,
>  	INTEL_DISPLAY_WA_14025769978,
>  	INTEL_DISPLAY_WA_15018326506,
>  	INTEL_DISPLAY_WA_16023588340,
> -- 
> 2.51.0

-- 
Ville Syrjälä
Intel
