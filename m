Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB7CC0218F
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 13:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3605010EAD1;
	Fri, 31 Jan 2025 13:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leFtKMs0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6C410E064;
 Fri, 31 Jan 2025 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738331797; x=1769867797;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=B4uqIsYuO7LVxZONME42hP1aAtEircn5DvXTvAkX5HY=;
 b=leFtKMs0cddHR8HYXaENTQ+o9B6GWOAoTVaYmjhy6yRsrRecfv08Azkg
 FSk69aE21Mvplq0NPTSTf2+QE4K0ULQlUqjNOAzZitgY/bOPxv0t4CSF3
 YFOEbEwx9HSi5IACfEUMqW8JKdi6kgj8VF1YKBBSYYg4+blxhBwhZKUhh
 yiJ9BolASnEM/TDcLtxwLZIcymmCnshvU26OQFGdd1A9xIOnqlJuwUtfh
 W0RQIY31nEO2/QZZq6dfolAmM7DPz3hCu8qFOcV7qCod8FFtTbxsc9n6R
 KaL7JsVVTzDCsTElaFkWa1HbjqB+fbBeE7skI95H6G4zT3CUxqHjoD4oq Q==;
X-CSE-ConnectionGUID: Hb2aCgnsSJSDeqVSDGzGCA==
X-CSE-MsgGUID: IQMPMJKwTRS9ejIfITEh+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38604703"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="38604703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:56:37 -0800
X-CSE-ConnectionGUID: NnQjJxq8T3acmfzn8tlZoA==
X-CSE-MsgGUID: SqvMCrjRSVG7IShNVAonxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="140518629"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:56:35 -0800
Date: Fri, 31 Jan 2025 15:57:32 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 03/14] drm/i915/dp: Rename some variables in
 xelpd_dsc_compute_link_config()
Message-ID: <Z5zWzMut77dSqlp4@ideak-desk.fi.intel.com>
References: <cover.1738327620.git.jani.nikula@intel.com>
 <91dd6ef53683b624a978101cca7322ea3e5e2f7b.1738327620.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91dd6ef53683b624a978101cca7322ea3e5e2f7b.1738327620.git.jani.nikula@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2025 at 02:49:56PM +0200, Jani Nikula wrote:
> Use the _x16 suffix for all .4 fixed point variables. Drop compressed_
> prefix, as it's implied from the precision suffix.
> 
> As dsc_min_bpp and dsc_max_bpp change domain from int to .4 in the
> middle of the function, they remain the same for now.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a7a5bb2075da..02d1a5453b46 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2126,31 +2126,28 @@ xelpd_dsc_compute_link_config(struct intel_dp *intel_dp,
>  {
>  	struct intel_display *display = to_intel_display(intel_dp);
>  	int output_bpp = intel_dp_output_bpp(pipe_config->output_format, pipe_bpp);
> -	u16 compressed_bppx16;
> -	u8 bppx16_step;
> +	int bpp_x16, bpp_step_x16;
>  	int ret;
>  
> -	bppx16_step = intel_dp_dsc_bpp_step_x16(connector);
> +	bpp_step_x16 = intel_dp_dsc_bpp_step_x16(connector);
>  
>  	/* Compressed BPP should be less than the Input DSC bpp */
> -	dsc_max_bpp = min(dsc_max_bpp << 4, (output_bpp << 4) - bppx16_step);
> +	dsc_max_bpp = min(dsc_max_bpp << 4, (output_bpp << 4) - bpp_step_x16);
>  	dsc_min_bpp = dsc_min_bpp << 4;
>  
> -	for (compressed_bppx16 = dsc_max_bpp;
> -	     compressed_bppx16 >= dsc_min_bpp;
> -	     compressed_bppx16 -= bppx16_step) {
> +	for (bpp_x16 = dsc_max_bpp; bpp_x16 >= dsc_min_bpp; bpp_x16 -= bpp_step_x16) {
>  		if (intel_dp->force_dsc_fractional_bpp_en &&
> -		    !fxp_q4_to_frac(compressed_bppx16))
> +		    !fxp_q4_to_frac(bpp_x16))
>  			continue;
>  		ret = dsc_compute_link_config(intel_dp,
>  					      pipe_config,
>  					      limits,
> -					      compressed_bppx16,
> +					      bpp_x16,
>  					      timeslots);
>  		if (ret == 0) {
> -			pipe_config->dsc.compressed_bpp_x16 = compressed_bppx16;
> +			pipe_config->dsc.compressed_bpp_x16 = bpp_x16;
>  			if (intel_dp->force_dsc_fractional_bpp_en &&
> -			    fxp_q4_to_frac(compressed_bppx16))
> +			    fxp_q4_to_frac(bpp_x16))
>  				drm_dbg_kms(display->drm,
>  					    "Forcing DSC fractional bpp\n");
>  
> -- 
> 2.39.5
> 
