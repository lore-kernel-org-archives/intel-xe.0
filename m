Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04DDCD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 12:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1BF10E266;
	Wed, 27 May 2026 12:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYC5/zRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3AFF10E266;
 Wed, 27 May 2026 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779885839; x=1811421839;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ryFvF2A6rag22LBzt9AhOddzooqAxaTNHmhr4DeZwiE=;
 b=jYC5/zRCQOa1PWLoCvp+EoAJl8kA/gwZ0yrn2JZ4lGxr44W6X4n1C8VA
 ZcKrHXzpLquZ9rGDYTwx6YiAFmlspH/WQe8Fu7QtgfN2tywBYJQggw94G
 oqirC9ouWduxIYNGnPxBrc/PRtETEob1PykSvblSSkN8AIWZUo54nVVin
 BLk3/pR1sAMaVYkL1mjarcbNT1FIAdn68vStpbwtS1QTyrS300fV/Ws7G
 QSXIIZwpx5X/zxm3VA9pgFOCPDgaDykee9CxtfFM97rnj8it9n36w5XOK
 Fm+uB9u2Y6YhXVcFW67MtEPjTIDxHNiiNZX/rk+dKFZrxZTjBEihvmOpR w==;
X-CSE-ConnectionGUID: RPrfQGrYSmyuBbJafYeg8A==
X-CSE-MsgGUID: La2ypY2YSayf+pUuxi1KUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80696570"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80696570"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 05:43:59 -0700
X-CSE-ConnectionGUID: MCTVSCbTSw264KqepFJwnQ==
X-CSE-MsgGUID: 0m4/oQUORsy1BlqwbiIF1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="272566457"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.80])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 05:43:56 -0700
Date: Wed, 27 May 2026 15:43:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com, animesh.manna@intel.com
Subject: Re: [PATCH 11/12] drm/i915/dp: Enable AS SDP whenever VRR is
 possible or PR !async
Message-ID: <ahbnCRbvwftnXy9P@intel.com>
References: <20260527041050.601735-1-ankit.k.nautiyal@intel.com>
 <20260527041050.601735-12-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260527041050.601735-12-ankit.k.nautiyal@intel.com>
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

On Wed, May 27, 2026 at 09:40:49AM +0530, Ankit Nautiyal wrote:
> Currently AS SDP is only configured when VRR is enabled.
> With optimized guardband, we also need to account for wakeup time and other
> relevant details that depend on the AS SDP position whenever AS SDP is
> enabled. If a feature enabling AS SDP gets turned on later (after modeset),
> the guardband might not be sufficient and may need to increase, triggering
> a full modeset.
> 
> Additionally, for Panel Replay with Aux-less ALPM where the sink does
> not support asynchronous video timing in PR active, the source must
> keep transmitting Adaptive-Sync SDPs while PR is active.
> 
> So, always send AS SDP whenever there is a possibility to use it for VRR
> OR for Panel Replay for synchronization.
> 
> v2: Check if AS SDP can be used for synchronization for VRR or PR. (Ville)
> v3: Use intel_psr_needs_alpm_aux_less() instead of
>     intel_alpm_is_alpm_aux_less() to avoid including the LOBF case. (Ville)
>     Modify the commit message and subject.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index af52ba636f55..a84fd6bb4053 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3181,7 +3181,11 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
>  	if (drm_dp_is_branch(intel_dp->dpcd))
>  		return false;
>  
> -	return crtc_state->vrr.enable;
> +	if (intel_psr_needs_alpm_aux_less(intel_dp, crtc_state) &&
> +	    !intel_psr_pr_async_video_timing_supported(intel_dp))
> +		return true;
> +
> +	return intel_vrr_possible(crtc_state);
>  }
>  
>  static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
