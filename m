Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76327606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BNOcuk8s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6AC10FF81;
	Thu, 12 Nov 2026 09:48:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32010FF8E;
 Thu, 12 Nov 2026 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794476876; x=1826012876;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k8+jYxtpWS/AN3gg/uvzACBE6cKDM6tD9Q7nTN+gEIY=;
 b=BNOcuk8sbChFfWifyG3l5PDtBH8goxNfAXQ9+zeUpLLL33Q8FQjSYjp3
 6yvlBzWbqLeyoe1cQz35kiuFft4oazfaEoSDrx0Qo+rEhL6sP9nsrmDd8
 cFM7nhf7ZsAWdocuORDiIoBekHj3SdQAyB3sak+9HGnvu0Cdex4uYqxaS
 5VH4qwaCHFJWbtYo1w21cf3MqgJddzaOgBeKcvIyp3TZXOY9bFOdGPsjF
 ulKTvvRryQzMHjlttxaho6aNP6ahZxVJaNG8DbNdYcvhJIphuNiKrmpvk
 VzJO2NLwHNLR01KZM7UiBEzra4H1Q6i4TxOGXvaW4gyBnhHp7zycOOvQk w==;
X-CSE-ConnectionGUID: oDOUMCRPRVCj8uDxO5CHnw==
X-CSE-MsgGUID: a71U1gd0SxCxV33rxCCFlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3286542"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3286542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:47:55 -0800
X-CSE-ConnectionGUID: GFFRj1YmQlOu2xp4z/0g9g==
X-CSE-MsgGUID: JmgjeILSQTWJqWX4DxzpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8960932"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:47:55 -0800
Date: Thu, 12 Nov 2026 10:47:47 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 14/15] drm/i915/pfit: Account for pfit downscaling in
 pixel rate on GMCH platforms
Message-ID: <shbezg62hmcqseiclkdfdgmcqef2x6dcqzg4xwh6lorkshydkq@2ihuuarp5vj7>
References: <20261019135309.23578-1-ville.syrjala@linux.intel.com>
 <20261019135309.23578-15-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019135309.23578-15-ville.syrjala@linux.intel.com>
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

On Mon, Oct 19, 2026 at 04:53:08PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Now that we have crtc_state->pch.dst populated on GMCH platforms
> we can use the existing ILK+ code to calculate the downscale
> adjusted pixel rate correctly on GMCH platforms.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 23 +++++++-------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 200426bf0c59..6b813efff955 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2278,7 +2278,8 @@ static bool intel_crtc_supports_double_wide(const struct intel_crtc *crtc)
>  		(crtc->pipe == PIPE_A || display->platform.i915g);
>  }
>  
> -static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
> +static unsigned int

Is there any consensus on when to use u32 and when unsigned int? I see
that here it is because of pixel_rate_cdclk being defined as unsigned
int, but asking for general guidance.

Since that's a side question:

Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> +intel_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
>  {
>  	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
>  	struct drm_rect src;
> @@ -2299,7 +2300,8 @@ static u32 ilk_pipe_pixel_rate(const struct intel_crtc_state *crtc_state)
>  				   pixel_rate);
>  }
>  
> -static u32 ilk_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
> +static unsigned int
> +intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
>  	u32 pixel_rate = crtc_state->hw.pipe_mode.crtc_clock;
> @@ -2345,19 +2347,10 @@ static void intel_mode_from_crtc_timings(struct drm_display_mode *mode,
>  
>  static void intel_crtc_compute_pixel_rate(struct intel_crtc_state *crtc_state)
>  {
> -	struct intel_display *display = to_intel_display(crtc_state);
> -
> -	if (HAS_GMCH(display)) {
> -		/* FIXME calculate proper pipe pixel rate for GMCH pfit */
> -		crtc_state->pixel_rate =
> -			crtc_state->hw.pipe_mode.crtc_clock;
> -		crtc_state->pixel_rate_cdclk = crtc_state->pixel_rate;
> -	} else {
> -		crtc_state->pixel_rate =
> -			ilk_pipe_pixel_rate(crtc_state);
> -		crtc_state->pixel_rate_cdclk =
> -			ilk_pipe_pixel_rate_cdclk(crtc_state);
> -	}
> +	crtc_state->pixel_rate =
> +		intel_pipe_pixel_rate(crtc_state);
> +	crtc_state->pixel_rate_cdclk =
> +		intel_pipe_pixel_rate_cdclk(crtc_state);
>  }
>  
>  static void intel_joiner_adjust_timings(const struct intel_crtc_state *crtc_state,
> -- 
> 2.55.0
> 
> 
