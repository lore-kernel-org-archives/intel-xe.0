Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193ECCD98F2
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 18:29:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD45210F3A0;
	Thu, 18 Jun 2026 18:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KN4ibnsV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4173B10F3A0;
 Thu, 18 Jun 2026 18:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781807351; x=1813343351;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=g9HcZkUW5dzCPLPq69u48NenimbkSSOpk7p7wtFFjt0=;
 b=KN4ibnsVtgMKAd7/njeFu/88ZNI2lrc7ONiwW9cu3oDS2OXEvmtSBH6b
 wT5B2i3BV4Y8WBwnX/cRRy3vBQvJ8K7KYR6ePQjMWUZ7ObU+MEFPq5H46
 sotsF0e8GriK0A6ky8kcCq3OrSeqlwitSrlTApqpQD+WLv7VPxgKLQ/Ta
 YZNKp0b7WRH2NNsDtbNOQDtsjmnL9lStsQ/H5biPpHmxQgjn1/ThEfYnl
 LPa3OABNoduWRJVBV0iVA7s8GpdxkHXHe+2dAWK9nTevgGh8ZnPRxYNfo
 +D++rICXnEWH7MRFuqAsvXqM/LMsRrwb+jnOFVeYUUmB1YaIcPe2Zp4jx A==;
X-CSE-ConnectionGUID: /mufREn+TFO+Ob6mTKdgXA==
X-CSE-MsgGUID: k7gxCCvLRVaRdFOxKSc9Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="100081592"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="100081592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:29:11 -0700
X-CSE-ConnectionGUID: VeAjKpkbSOmfh+1Z2uGgNQ==
X-CSE-MsgGUID: QJjnJCTPTh+dqVy3Kneg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="244089631"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.79])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 11:29:09 -0700
Date: Thu, 18 Jun 2026 21:29:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 2/2] drm/i915/dsb: Use safe window path when VRR TG is
 used
Message-ID: <ajQ48VoKc1Do6pre@intel.com>
References: <20260608123711.1121908-3-ankit.k.nautiyal@intel.com>
 <20260617051417.2223526-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260617051417.2223526-1-ankit.k.nautiyal@intel.com>
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

On Wed, Jun 17, 2026 at 10:44:17AM +0530, Ankit Nautiyal wrote:
> When the VRR timing generator is always used, the hardware behaves
> as VRR-active regardless of crtc_state->vrr.enable.
> 
> The DSB paths that depend on the VRR safe window therefore need to follow
> the VRR code paths in that case too:
> - dsb_chicken(): program the SAFE_WINDOW chicken bits,
> - intel_dsb_vblank_evade(): use vmin/vmax vblank starts for the
>   wait window,
> - intel_dsb_wait_for_delayed_vblank(): wait inside the vmin safe window
>   before the scanline-based delayed vblank wait.
> 
> Introduce helper pre_commit_use_safe_window() and use it in the three sites
> 
> v2: Instead of modifying pre_commit_is_vrr_active() use a new helper and
>     use it only in the required places. (Ville).
> 
> v3: -Keep using pre_commit_is_vrr_active() for DCB path. (Ville)
>     -Add a separate check for fixed RR with VRR TG and use
>      fixed mode vblank start there. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dsb.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
> index 07dd6318d9cc..d9a270362a82 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsb.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsb.c
> @@ -210,6 +210,18 @@ static int dsb_scanline_to_hw(struct intel_atomic_state *state,
>  	return (scanline + vtotal - intel_crtc_scanline_offset(crtc_state)) % vtotal;
>  }
>  
> +static
> +bool pre_commit_use_safe_window(struct intel_atomic_state *state,
> +				struct intel_crtc *crtc)
> +{
> +	struct intel_display *display = to_intel_display(crtc->base.dev);
> +
> +	if (intel_vrr_always_use_vrr_tg(display))
> +		return true;
> +
> +	return pre_commit_is_vrr_active(state, crtc);
> +}
> +
>  /*
>   * Bspec suggests that we should always set DSB_SKIP_WAITS_EN. We have approach
>   * different from what is explained in Bspec on how flip is considered being
> @@ -229,7 +241,7 @@ static u32 dsb_chicken(struct intel_atomic_state *state,
>  	u32 chicken = intel_psr_use_trans_push(new_crtc_state) ?
>  		DSB_SKIP_WAITS_EN : 0;
>  
> -	if (pre_commit_is_vrr_active(state, crtc))
> +	if (pre_commit_use_safe_window(state, crtc))
>  		chicken |= DSB_CTRL_WAIT_SAFE_WINDOW |
>  			DSB_CTRL_NO_WAIT_VBLANK |
>  			DSB_INST_WAIT_SAFE_WINDOW |
> @@ -798,6 +810,12 @@ void intel_dsb_vblank_evade(struct intel_atomic_state *state,
>  		end = intel_vrr_vmax_vblank_start(crtc_state);
>  		start = end - vblank_delay - latency;
>  		intel_dsb_wait_scanline_out(state, dsb, start, end);
> +	} else if (pre_commit_use_safe_window(state, crtc)) {
> +		int vblank_delay = crtc_state->set_context_latency;
> +
> +		end = intel_mode_vblank_start(&crtc_state->hw.adjusted_mode);
> +		start = end - vblank_delay - latency;
> +		intel_dsb_wait_scanline_out(state, dsb, start, end);
>  	} else {
>  		int vblank_delay = intel_mode_vblank_delay(&crtc_state->hw.adjusted_mode);
>  
> @@ -891,7 +909,7 @@ void intel_dsb_wait_for_delayed_vblank(struct intel_atomic_state *state,
>  		&crtc_state->hw.adjusted_mode;
>  	int wait_scanlines;
>  
> -	if (pre_commit_is_vrr_active(state, crtc)) {
> +	if (pre_commit_use_safe_window(state, crtc)) {
>  		/*
>  		 * If the push happened before the vmin decision boundary
>  		 * we don't know how far we are from the undelayed vblank.
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
