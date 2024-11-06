Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54806D59F40
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 15:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085F710E1D2;
	Wed,  6 Nov 2024 15:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OWCdBpFf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE6A10E1D2
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Nov 2024 15:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730908105; x=1762444105;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RejooXwDgldGJdzRkv8LAIG4bcQNtJ3jsAQrkgc/7kc=;
 b=OWCdBpFfU5e1UYPF7lw5+pJU0mklkQHlD7de9Mp52s8QwuG7yen2Fdlw
 msd0IYUXldxlHK/jdbrQvbP5QfzqxFpChBKR+W6DYLAa6w09qfA97A5fS
 j948XeRPhp1t6atZssg6ghVTLfF+VttV9e0FbwLu8WUjkvdMC8Hkm6PdV
 LOmpIVAQJ30dThDMzTCpLTwuiy5OW9d2cerv2zDo0od5kUPTEhMeX8r8m
 a1a9qsyrt8qFzKU8hhdRnDT1dx4ZD+d8IRzHk59X8spXsRIvZx7/hvAHg
 Mp2lHEaw321IXvEuWg5+cBQhCkbyUqLePOPKqhfzrbP0jy8ba0Q9V2BzI A==;
X-CSE-ConnectionGUID: OGkyyO38QyeQiuOD6CR54Q==
X-CSE-MsgGUID: IB9mF+shROikMe1aCkCZfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48174883"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="48174883"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 07:48:25 -0800
X-CSE-ConnectionGUID: QgR7lzqbREil5sTfCzYHdw==
X-CSE-MsgGUID: 0X/sMBD3TD6BW3aB72k7qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; d="scan'208";a="84710277"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 06 Nov 2024 07:48:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 06 Nov 2024 17:48:22 +0200
Date: Wed, 6 Nov 2024 17:48:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Mika Kahola <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Pcode sets the CD clock frequency
 voltage levels
Message-ID: <ZyuPxvxO1VHd6GJv@intel.com>
References: <20241106152023.398748-1-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106152023.398748-1-mika.kahola@intel.com>
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

On Wed, Nov 06, 2024 at 05:20:23PM +0200, Mika Kahola wrote:
> On xe3lpd the CD clock frequency is set by the driver
> without setting voltage levels. Previously, we had 4
> levels of voltages to choose from. However, having only 4
> levels is rather coarse and we may end up consuming more
> power than necessary. Therefore, these are now removed
> and choosing the correct voltage level is now handed over
> to Pcode firmware which is able to set voltage level with
> higher granularity.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 48 +++++++++++-----------
>  drivers/gpu/drm/i915/i915_reg.h            |  3 ++
>  2 files changed, 28 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index 03c4eef3f92a..72da06e77815 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1627,16 +1627,6 @@ static u8 rplu_calc_voltage_level(int cdclk)
>  				  rplu_voltage_level_max_cdclk);
>  }
>  
> -static u8 xe3lpd_calc_voltage_level(int cdclk)
> -{
> -	/*
> -	 * Starting with xe3lpd power controller does not need the voltage
> -	 * index when doing the modeset update. This function is best left
> -	 * defined but returning 0 to the mask.
> -	 */
> -	return 0;
> -}

I think I prefer the original approach here. Avoids all those
ugly if statements all over the place.

> -
>  static void icl_readout_refclk(struct intel_display *display,
>  			       struct intel_cdclk_config *cdclk_config)
>  {
> @@ -1758,8 +1748,9 @@ static void bxt_get_cdclk(struct intel_display *display,
>  	 * Can't read this out :( Let's assume it's
>  	 * at least what the CDCLK frequency requires.
>  	 */
> -	cdclk_config->voltage_level =
> -		intel_cdclk_calc_voltage_level(display, cdclk_config->cdclk);
> +	if (DISPLAY_VER(display) < 30)
> +		cdclk_config->voltage_level =
> +			intel_cdclk_calc_voltage_level(display, cdclk_config->cdclk);
>  }
>  
>  static void bxt_de_pll_disable(struct intel_display *display)
> @@ -2209,7 +2200,7 @@ static void bxt_set_cdclk(struct intel_display *display,
>  
>  	intel_update_cdclk(display);
>  
> -	if (DISPLAY_VER(display) >= 11)
> +	if (DISPLAY_VER(display) >= 11 && DISPLAY_VER(display) < 30)
>  		/*
>  		 * Can't read out the voltage level :(
>  		 * Let's just assume everything is as expected.
> @@ -2288,8 +2279,10 @@ static void bxt_cdclk_init_hw(struct intel_display *display)
>  	 */
>  	cdclk_config.cdclk = bxt_calc_cdclk(display, 0);
>  	cdclk_config.vco = bxt_calc_cdclk_pll_vco(display, cdclk_config.cdclk);
> -	cdclk_config.voltage_level =
> -		intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
> +
> +	if (DISPLAY_VER(display) < 30)
> +		cdclk_config.voltage_level =
> +			intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
>  
>  	bxt_set_cdclk(display, &cdclk_config, INVALID_PIPE);
>  }
> @@ -2300,8 +2293,10 @@ static void bxt_cdclk_uninit_hw(struct intel_display *display)
>  
>  	cdclk_config.cdclk = cdclk_config.bypass;
>  	cdclk_config.vco = 0;
> -	cdclk_config.voltage_level =
> -		intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
> +
> +	if (DISPLAY_VER(display) < 30)
> +		cdclk_config.voltage_level =
> +			intel_cdclk_calc_voltage_level(display, cdclk_config.cdclk);
>  
>  	bxt_set_cdclk(display, &cdclk_config, INVALID_PIPE);
>  }
> @@ -2477,10 +2472,15 @@ void intel_cdclk_dump_config(struct intel_display *display,
>  			     const struct intel_cdclk_config *cdclk_config,
>  			     const char *context)
>  {
> -	drm_dbg_kms(display->drm, "%s %d kHz, VCO %d kHz, ref %d kHz, bypass %d kHz, voltage level %d\n",
> -		    context, cdclk_config->cdclk, cdclk_config->vco,
> -		    cdclk_config->ref, cdclk_config->bypass,
> -		    cdclk_config->voltage_level);
> +	if (DISPLAY_VER(display) == 30)
> +		drm_dbg_kms(display->drm, "%s %d kHz, VCO %d kHz, ref %d kHz, bypass %d kHz\n",
> +			    context, cdclk_config->cdclk, cdclk_config->vco,
> +			    cdclk_config->ref, cdclk_config->bypass);
> +	else
> +		drm_dbg_kms(display->drm, "%s %d kHz, VCO %d kHz, ref %d kHz, bypass %d kHz, voltage level %d\n",
> +			    context, cdclk_config->cdclk, cdclk_config->vco,
> +			    cdclk_config->ref, cdclk_config->bypass,
> +			    cdclk_config->voltage_level);
>  }
>  
>  static void intel_pcode_notify(struct intel_display *display,
> @@ -2497,7 +2497,10 @@ static void intel_pcode_notify(struct intel_display *display,
>  	if (!IS_DG2(i915))
>  		return;
>  
> -	update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
> +	if (DISPLAY_VER(i915) == 30)
> +		update_mask = DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count);
> +	else
> +		update_mask = DISPLAY_TO_PCODE_UPDATE_MASK(cdclk, active_pipe_count, voltage_level);
>  
>  	if (cdclk_update_valid)
>  		update_mask |= DISPLAY_TO_PCODE_CDCLK_VALID;
> @@ -3699,7 +3702,6 @@ static const struct intel_cdclk_funcs xe3lpd_cdclk_funcs = {
>  	.get_cdclk = bxt_get_cdclk,
>  	.set_cdclk = bxt_set_cdclk,
>  	.modeset_calc_cdclk = bxt_modeset_calc_cdclk,
> -	.calc_voltage_level = xe3lpd_calc_voltage_level,
>  };
>  
>  static const struct intel_cdclk_funcs rplu_cdclk_funcs = {
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index c160e087972a..5d0b13460631 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -3581,6 +3581,9 @@
>  		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
>  		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)) | \
>  		(DISPLAY_TO_PCODE_VOLTAGE(voltage_level)))
> +#define   DISPLAY30_TO_PCODE_UPDATE_MASK(cdclk, num_pipes) \
> +		((DISPLAY_TO_PCODE_CDCLK(cdclk)) | \
> +		(DISPLAY_TO_PCODE_PIPE_COUNT(num_pipes)))
>  #define   ICL_PCODE_SAGV_DE_MEM_SS_CONFIG	0xe
>  #define     ICL_PCODE_REP_QGV_MASK		REG_GENMASK(1, 0)
>  #define     ICL_PCODE_REP_QGV_SAFE		REG_FIELD_PREP(ICL_PCODE_REP_QGV_MASK, 0)
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
