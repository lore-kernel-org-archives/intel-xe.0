Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9EFCD5BB5
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ABF10E1ED;
	Fri, 22 May 2026 14:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n/xR56Ix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A8A10E0A3;
 Fri, 22 May 2026 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779458790; x=1810994790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JJzk4SbWHJpFgY9FFaly28BwpaJem2tBNip6ZHvr5Ug=;
 b=n/xR56Ixq+RdSfNwmL0UVJ1vOROzEtF5wc63A108Bk96yvWw7o3Oztj9
 hbfjS86xd9SxqMZEaNkb/uIsVLLD2iPPsgekRtipj9X0Xn4AobEjIQUul
 tsDmN8RxBY2JADedas78iC49WW1Xg63zVa0xp2+kHfDJn4ut1ehqKuQzh
 wf3Keodn322y1xgkuS9iVQQoZPglaxjyB+M16uJdAg+PlDweAtu3xlsqf
 LmDpatlPwo227kn1uao4gCWbOAOaLUMWP84+JlPnKtHP81Y1akMbAFaDM
 J+Hu61BJizXEamDYXVpB58SMeyEFreMIZFrh+CaMTxL5RP+BO9YTNsw1/ A==;
X-CSE-ConnectionGUID: CDQtBrr1SMejt+v3scL6BQ==
X-CSE-MsgGUID: dZVsszUXSha3vDLUyJSdFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91857392"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91857392"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:06:29 -0700
X-CSE-ConnectionGUID: hCyiywXjQpCDs0Ywd16VbQ==
X-CSE-MsgGUID: u/oeo+KWTUGQFnstJMy+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="279034366"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:06:27 -0700
Date: Fri, 22 May 2026 17:06:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com, animesh.manna@intel.com
Subject: Re: [PATCH 01/11] drm/i915/psr: Add helper to get Async Video timing
 support in PR active
Message-ID: <ahBi34ck_mjXDrAs@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
 <20260518035502.2909359-2-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518035502.2909359-2-ankit.k.nautiyal@intel.com>
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

On Mon, May 18, 2026 at 09:24:51AM +0530, Ankit Nautiyal wrote:
> Introduce a helper to check if Panel Replay has Async Video Timing support
> during PR Active state.
> 
> v2: Confirm that Panel Replay is supported before checking for
>     Async Video Timing Support during PR active. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_psr.c | 11 +++++++++++
>  drivers/gpu/drm/i915/display/intel_psr.h |  1 +
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
> index 892d209dce1b..431468103f51 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.c
> +++ b/drivers/gpu/drm/i915/display/intel_psr.c
> @@ -4655,3 +4655,14 @@ bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state)
>  
>  	return HAS_PSR_TRANS_PUSH_FRAME_CHANGE(display) && crtc_state->has_psr;
>  }
> +
> +bool intel_psr_pr_async_video_timing_supported(struct intel_dp *intel_dp)
> +{
> +	struct intel_connector *connector = intel_dp->attached_connector;
> +	u8 *dpcd = connector->dp.panel_replay_caps.dpcd;
> +	u8 pr_support = dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_SUPPORT)];
> +	u8 pr_cap = dpcd[INTEL_PR_DPCD_INDEX(DP_PANEL_REPLAY_CAP_CAPABILITY)];
> +
> +	return (pr_support & DP_PANEL_REPLAY_SUPPORT) &&
> +		!(pr_cap & DP_PANEL_REPLAY_ASYNC_VIDEO_TIMING_NOT_SUPPORTED_IN_PR);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
> index 394b641840b3..29723e63888f 100644
> --- a/drivers/gpu/drm/i915/display/intel_psr.h
> +++ b/drivers/gpu/drm/i915/display/intel_psr.h
> @@ -86,5 +86,6 @@ void intel_psr_compute_config_late(struct intel_dp *intel_dp,
>  				   struct intel_crtc_state *crtc_state);
>  int intel_psr_min_guardband(struct intel_crtc_state *crtc_state);
>  bool intel_psr_use_trans_push(const struct intel_crtc_state *crtc_state);
> +bool intel_psr_pr_async_video_timing_supported(struct intel_dp *intel_dp);
>  
>  #endif /* __INTEL_PSR_H__ */
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
