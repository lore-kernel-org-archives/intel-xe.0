Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28DACD5BB3
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 15:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996EF10E41E;
	Fri, 22 May 2026 15:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LZAQvZoj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D43910E276;
 Fri, 22 May 2026 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779463546; x=1810999546;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LeScTzrByUYmZWUS1pljtxMOYMtfPk2Txlu5PtQTKa0=;
 b=LZAQvZojjLDe5CVy4qDGleTvzo5IYzc6halAMbVrJKNbxRkqa/S7WXdn
 wCEaQ6lwSd+gbBjPu9eY8hXQ12NispAjoVKCej6TeSL777dCyE62PRxdK
 bdYWkI9Yrlm5oHl2mqdL/FXFxogiHB+ELJucBb3Olv/y1zPwjIyy42+Jy
 ZIKxcu0nwQRTJp6r4+Of8Bvs/ecoVyapQxUEIWOz0UWxbt0mlOrTVkiod
 a7/uPMS006d0R5RQ4o340vTGRePxjwxPy+CyA3HpINvg16NojGGZquY1x
 G8FmfqUPMDkwcPGWTYM1V8rjydegGuqzHApjs47CJ1UlWMpY2aYbaf0mE A==;
X-CSE-ConnectionGUID: wo4NOUH/TPm0uGDgjhZlkw==
X-CSE-MsgGUID: qsGc7ksTTu6WC+/3JGr44g==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80247724"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80247724"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 08:25:46 -0700
X-CSE-ConnectionGUID: jZnBqiJHRTmi3q+zDrnnkw==
X-CSE-MsgGUID: bFekQ4RMRIWetaaZl6iH8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="244980088"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 08:25:44 -0700
Date: Fri, 22 May 2026 18:25:40 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com, animesh.manna@intel.com
Subject: Re: [PATCH 11/11] drm/i915/dp: Always enable AS SDP if supported by
 source + sink
Message-ID: <ahB1dIPqMJcGTU1n@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
 <20260518035502.2909359-12-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518035502.2909359-12-ankit.k.nautiyal@intel.com>
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

On Mon, May 18, 2026 at 09:25:01AM +0530, Ankit Nautiyal wrote:
> Currently AS SDP is only configured when VRR is enabled. However, other
> use cases like CMRR, Panel Replay, etc. also send information to the sink
> via AS SDPs.
> 
> With optimized guardband, we also need to account for wakeup time and other
> relevant details that depend on the AS SDP position whenever AS SDP is
> enabled. If a feature enabling AS SDP gets turned on later (after modeset),
> the guardband might not be sufficient and may need to increase, triggering
> a full modeset.
> 
> To avoid this, always send AS SDP whenever:
>  - the source and sink both support it, AND,
>  - there is a possibility to use it for VRR and Panel Replay for
>    synchronization.
> 
> v2: Check if AS SDP can be used for synchronization for VRR or PR. (Ville)
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 69eb474fede7..2c1dbcb0a2ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3181,7 +3181,11 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
>  	if (drm_dp_is_branch(intel_dp->dpcd))
>  		return false;
>  
> -	return crtc_state->vrr.enable;
> +	if (intel_alpm_is_alpm_aux_less(intel_dp, crtc_state) &&

That also includes lobf stuff in the check which we presumably don't want.

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
