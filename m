Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACC6E7DEFD
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 16:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771B210E526;
	Mon,  2 Feb 2026 16:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQnbwgj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0674010E526;
 Mon,  2 Feb 2026 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770048902; x=1801584902;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MNtshAPjRtVYIcKAHTqWNLU0nQa9mBXz4LVFP2FXAQE=;
 b=HQnbwgj+Bxl2LVkIE2HfipMdlLWBaOBzh4vA+Vf8XBKTW+tSe+0bwLkM
 SwbxtSQ9HRC63Fj0hWWWhwKMAJbtAJAaVOZq3+fUzEeUlKEPCONTTe8JE
 DgsCyjzAoSVROEcoOaQfaex6+08IN6htXi2QfQX5GmdN3pz48v3PQwO4g
 nMM1t08amlOzK/OQjSRto3sMvU9Ljf1n3gHviang599qvGz1+AAo1t3s0
 ASdBW2eHDYQwPQs0+MKBYkZk69BSHC5Y1BrXOW59Yv2n4MKFRelapODpj
 PpBEHAcS5FVhZlSs4dgLkTHp4wuRHG0Sz91/bkXFeikGHHdxRcovbhhAy g==;
X-CSE-ConnectionGUID: ozxky5V1RIizo/WB62+2Bw==
X-CSE-MsgGUID: 04NKYq/gQJC2E/iLZa04UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71262815"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="71262815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:14:22 -0800
X-CSE-ConnectionGUID: soP2zpFRRvaCj35G8AFABA==
X-CSE-MsgGUID: 42HwYyEFS5uGcXECEdG/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="213678310"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.247])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 08:14:15 -0800
Date: Mon, 2 Feb 2026 18:14:05 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com
Subject: Re: [PATCH 3/4] drm/i915/dp: Allow AS_SDP only if panel replay +
 auxless alpm is supported
Message-ID: <aYDNTXVr1CUQZcKn@intel.com>
References: <20251111093007.3771409-1-ankit.k.nautiyal@intel.com>
 <20251111093007.3771409-4-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251111093007.3771409-4-ankit.k.nautiyal@intel.com>
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

On Tue, Nov 11, 2025 at 03:00:06PM +0530, Ankit Nautiyal wrote:
> Adaptive Sync SDP is required when Panel replay is active and for
> supporting VRR on PCON.
> 
> Since VRR on PCON still needs some effort, enable adaptive sync SDP only
> when Panel replay with ALPM-Auxless is supported.
> 
> Set the AS_SDP mode for Fixed Vtotal mode for fixed refresh rate case.
> 
> v2: Remove redundant target_rr assignments. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 92a553a76b57..2852a1d9f157 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2935,7 +2935,15 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>  	const struct drm_display_mode *adjusted_mode =
>  		&crtc_state->hw.adjusted_mode;
>  
> -	if (!crtc_state->vrr.enable || !intel_dp->as_sdp_supported)
> +	if (!intel_dp->as_sdp_supported)
> +		return;
> +
> +	/*
> +	 * Support Adaptive-Sync SDP only for PR+AUX-less ALPM for now.
> +	 * It can be enabled for PCON + VRR, but that is currently not supported.
> +	 */
> +	if (!CAN_PANEL_REPLAY(intel_dp) ||
> +	    !intel_alpm_aux_less_wake_supported(intel_dp))
>  		return;
>  
>  	crtc_state->infoframes.enable |= intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC);
> @@ -2949,9 +2957,10 @@ static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
>  		as_sdp->mode = DP_AS_SDP_FAVT_TRR_REACHED;
>  		as_sdp->target_rr = drm_mode_vrefresh(adjusted_mode);
>  		as_sdp->target_rr_divider = true;
> -	} else {
> +	} else if (crtc_state->vrr.enable) {
>  		as_sdp->mode = DP_AS_SDP_AVT_DYNAMIC_VTOTAL;
> -		as_sdp->target_rr = 0;
> +	} else {
> +		as_sdp->mode = DP_AS_SDP_AVT_FIXED_VTOTAL;

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

But we're still not configuring DOWNSPREAD_CTRL correctly so PR+VRR
seems to be busted.

>  	}
>  }
>  
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
