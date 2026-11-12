Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B23D606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MQvFVbip
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE00110FF88;
	Thu, 12 Nov 2026 09:57:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DB010FF6A;
 Thu, 12 Nov 2026 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794477433; x=1826013433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6YSnhZ8LkQ7XFTpkUeBPF5HWzcbqMrn6eDgdELwmTlM=;
 b=MQvFVbipXZ//012yTVEnp1kFhXpVjTy+1eybyQmJtBdEK2EclrZRdP/f
 6oBXLLRCkrS4TRK3aJbBKq9qrCLp8YVLBTgV9h6NFUhufsWaLVHxzRJXl
 gf6Y/Z+UWi4Mtlgx/rp4jyyaMvOXgWXletwmcZBaR5OCrjW4qk3FSQT8J
 3p8p9XEJ+sc2FEVoUq473Gopd4qWGcaNMf/fszVcZC6uTzmjnegwpvOPQ
 QmHfG7m6iAUmNMRwIoupLpHgDTFusi/ABlr7dZErR1+x6Hr7dU6Gfg8Rx
 rCNRSDDXLg9dPWrl6/tVo7xPUNUYz8UdCWJNDmpnoTporW+i5JZiAKr6C w==;
X-CSE-ConnectionGUID: lpV1HxNnQ4uZb5w8+d88hg==
X-CSE-MsgGUID: 9m2nsV6VTxqp4lzbvFyvNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3127907"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3127907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:57:12 -0800
X-CSE-ConnectionGUID: XZo4O6fcRyiorKT/q8hQqQ==
X-CSE-MsgGUID: EwBG0a3vTZyiTAxl79RA3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8661934"
Received: from dev-417.igk.intel.com (HELO dev-417) ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 01:57:10 -0800
Date: Thu, 12 Nov 2026 10:57:03 +0100
From: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 06/15] drm/i915/pfit: Extract i965_pfit_get_config()
Message-ID: <pdge7elm432id5djkqfiuxtngxbj6v2nownf4iggduvb4ltznj@ouexxq5lzxvd>
References: <20261019135309.23578-7-ville.syrjala@linux.intel.com>
 <20261020183842.5218-1-ville.syrjala@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261020183842.5218-1-ville.syrjala@linux.intel.com>
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

On Tue, Oct 20, 2026 at 09:38:42PM GMT, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Split i965_pfit_get_config() out from i9xx_pfit_get_config() to
> unconfuse things a bit.
> 
> Note that we stop reading PFIT_PGM_RATIOS into
> crtc_state->gmch_pfit.pgm_ratios since wen ever use the
> progammed ratios on i965+. The .compute_config() path doesn't
> populate crtc_state->gmch_pfit.pgm_ratios either.

I got lost a bit here. Maybe:
s/wen ever/whenever we/
s/progammed/programmed/
s/i965+. The/i965+ the/

But that's just suggestion, not a blocker:
Reviewed-by: Michał Grzelak <michal.grzelak@linux.intel.com>

BR,
Michał

> 
> v2: Highlight the crtc_state->gmch_pfit.pgm_ratios change (Jani)
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_pfit.c | 58 +++++++++++++++--------
>  1 file changed, 38 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_pfit.c b/drivers/gpu/drm/i915/display/intel_pfit.c
> index 972218346362..82804159d0a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_pfit.c
> +++ b/drivers/gpu/drm/i915/display/intel_pfit.c
> @@ -720,38 +720,51 @@ void i9xx_pfit_disable(const struct intel_crtc_state *old_crtc_state)
>  	intel_de_write(display, PFIT_CONTROL(display), 0);
>  }
>  
> -static bool i9xx_has_pfit(struct intel_display *display)
> +static void i965_pfit_get_config(struct intel_crtc_state *crtc_state)
>  {
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	enum pipe pipe;
> +	u32 tmp;
> +
> +	tmp = intel_de_read(display, PFIT_CONTROL(display));
> +	if (!(tmp & PFIT_ENABLE))
> +		return;
> +
> +	/* Check whether the pfit is attached to our pipe. */
> +	pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> +	if (pipe != crtc->pipe)
> +		return;
> +
> +	crtc_state->gmch_pfit.control = tmp;
> +}
> +
> +static bool i9xx_has_pfit(struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc);
> +
> +	if (crtc->pipe != PIPE_B)
> +		return false;
> +
>  	if (display->platform.i830)
>  		return false;
>  
> -	return DISPLAY_VER(display) >= 4 ||
> -		display->platform.pineview || display->platform.mobile;
> +	return display->platform.pineview || display->platform.mobile;
>  }
>  
>  static void i9xx_pfit_get_config(struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
>  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> -	enum pipe pipe;
>  	u32 tmp;
>  
> -	if (!i9xx_has_pfit(display))
> +	if (!i9xx_has_pfit(crtc))
>  		return;
>  
>  	tmp = intel_de_read(display, PFIT_CONTROL(display));
>  	if (!(tmp & PFIT_ENABLE))
>  		return;
>  
> -	/* Check whether the pfit is attached to our pipe. */
> -	if (DISPLAY_VER(display) >= 4)
> -		pipe = REG_FIELD_GET(PFIT_PIPE_MASK, tmp);
> -	else
> -		pipe = PIPE_B;
> -
> -	if (pipe != crtc->pipe)
> -		return;
> -
>  	crtc_state->gmch_pfit.control = tmp;
>  	crtc_state->gmch_pfit.pgm_ratios =
>  		intel_de_read(display, PFIT_PGM_RATIOS(display));
> @@ -761,10 +774,15 @@ void intel_pfit_get_config(struct intel_crtc_state *crtc_state)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
>  
> -	if (HAS_GMCH(display))
> -		i9xx_pfit_get_config(crtc_state);
> -	else if (DISPLAY_VER(display) >= 9)
> -		skl_scaler_get_config(crtc_state);
> -	else
> -		ilk_pfit_get_config(crtc_state);
> +	if (HAS_GMCH(display)) {
> +		if (DISPLAY_VER(display) >= 4)
> +			i965_pfit_get_config(crtc_state);
> +		else
> +			i9xx_pfit_get_config(crtc_state);
> +	} else {
> +		if (DISPLAY_VER(display) >= 9)
> +			skl_scaler_get_config(crtc_state);
> +		else
> +			ilk_pfit_get_config(crtc_state);
> +	}
>  }
> -- 
> 2.55.0
> 
> 
