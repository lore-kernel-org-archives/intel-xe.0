Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0AAEBFD21
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 09:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031B310E39E;
	Mon, 13 Apr 2026 09:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvPcFiJS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B3E10E39C;
 Mon, 13 Apr 2026 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776072319; x=1807608319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NqA8WPVExYQ0KA6EKvmorE+t6bSk4QIvK4H8U54mxSA=;
 b=XvPcFiJSv1k8gBYiL8EyscodJLF/ywsOOvzIkWIqQVGakSdDUWuKY2vj
 /IxYzWvryDRQBtuMCJnfxXYkC4u6YZTyfmwnQSNcvPMS75Y14IBEqZgBI
 Mm1Y9DbeVB50cv+bmtnaChRpSzDfU3a2ZuuFNw70UzJhvcdDvEpy6bnNa
 laGkmO1T94cSpwM2fFgDUq/zzfc/cxWMrSB5QKG6QvUf5bvWuyZomT/Ty
 ycuO4iP+4vLQwbpwI0teBdSsGwhmMyOUIAzOr42Y2UkR+zmSkAq/8HecS
 lhufRymT4tnMQICx+H77JUVwE1IH/LB+l5DoVq8BFzv3S0eepTqjPMiO9 Q==;
X-CSE-ConnectionGUID: nUINjcCdTvm7v9QvbFt1Sw==
X-CSE-MsgGUID: spjqjCq6TumJfFyMpa4FYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="80884697"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="80884697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:25:19 -0700
X-CSE-ConnectionGUID: iBHKwYmwS8yi5aYFS0eEIQ==
X-CSE-MsgGUID: FgwZAYhmR/WicbycexuHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="231461418"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.235])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 02:25:17 -0700
Date: Mon, 13 Apr 2026 12:25:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 arun.r.murthy@intel.com
Subject: Re: [PATCH 02/12] drm/i915/vrr: Add helper to readback EMP_AS_SDP_TL
Message-ID: <ady2etQgkOzYOOA5@intel.com>
References: <20260413035349.1730312-1-ankit.k.nautiyal@intel.com>
 <20260413035349.1730312-3-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413035349.1730312-3-ankit.k.nautiyal@intel.com>
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

On Mon, Apr 13, 2026 at 09:23:39AM +0530, Ankit Nautiyal wrote:
> EMP_AS_SDP_TL is used to program both DP Adaptive Sync SDP and HDMI
> Video Timing EMP for VRR operation. Add a helper to read back the
> programmed transmission line from hardware so VRR code can populate
> the corresponding CRTC state fields during get_config.
> 
> This provides a common read-back path for VRR packet transmission
> line state.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vrr.c | 13 +++++++++++++
>  drivers/gpu/drm/i915/display/intel_vrr.h |  1 +
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 1fed597439b0..abdae7f1f8a8 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1218,3 +1218,16 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
>  
>  	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
>  }
> +
> +u16 intel_vrr_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
> +	u32 val;
> +
> +	if (!HAS_EMP_AS_SDP_TL(display))
> +		return 0;
> +
> +	val = intel_de_read(display, EMP_AS_SDP_TL(display, cpu_transcoder));
> +	return REG_FIELD_GET(EMP_AS_SDP_DB_TL_MASK, val);

This stuff really doesn't seem to belong in intel_vrr.c. We probably need
some kind of infoframe/SDP file where all the relevant stuff lives. Long
ago I did attempt to extract all the infoframe stuff from intel_hdmi.c
into intel_dip.c (or something like that), but there were still far too
many HDMI specifics in the result for my liking.

So I think what's really needed is an effort to distill the core of the
video DIP implementation (really just the low level buffer read/write
stuff, and I suspect now also this transmission line stuff) into a new
file. You could perhaps introduce that new file here, and then we'll
try to get to extracting the DIP buffer stuff later.

> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/drm/i915/display/intel_vrr.h
> index 4f16ca4af91f..6659a8a53432 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
> @@ -53,5 +53,6 @@ int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_sta
>  int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state);
>  int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state);
>  int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state);
> +u16 intel_vrr_read_emp_as_sdp_tl(const struct intel_crtc_state *crtc_state);
>  
>  #endif /* __INTEL_VRR_H__ */
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
