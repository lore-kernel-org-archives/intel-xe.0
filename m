Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FF1CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 14:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B8F10E14B;
	Mon, 25 May 2026 14:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CL1h4CzJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D4610E14B;
 Mon, 25 May 2026 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779719065; x=1811255065;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2y/ZjBJb1gAJLubyOMSTFifXvT7yZi3cag5IrmhBzkE=;
 b=CL1h4CzJ26XGMtu6xcxMgjU2KPVLHxJiFnlsywzYs7aWvqk7TU+uRpJd
 qmwiC7KkloY3uF4pP4vYJic3z5TphwgEEriR2qRodEYo5A0OSKh/ObWK9
 +sOR9Tn4n1SxVp6gV3f5OEvDctvvxd0YeDXYnGhbsuiAHZwt1X/mSeJP7
 R8F98dgMLrPt1anZgUQDx5vaD4IKa7sia/pZ0ALbDVptAB1CRpUv0Y5Bp
 tVYLjsT2IO44sj3HKI+lZotB5QdlN5yAHWvFgRDQP6kKto8Mg21opC2PL
 rpwaZ3lyjBBlOp9k8vvFSYQX7XEM+N7oiiVgBy20iXnO0DgGU5VN1xF23 g==;
X-CSE-ConnectionGUID: FmQy7zQ8ScmOSq6z3yFiWA==
X-CSE-MsgGUID: SmqMuahZT86jP17YcAOV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="84161634"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="84161634"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:24:25 -0700
X-CSE-ConnectionGUID: R1F7CKNERlKx8LeeaU+1nw==
X-CSE-MsgGUID: Rxx+t6bBSXe7C0upvK+ufw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="246583029"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:24:23 -0700
Date: Mon, 25 May 2026 17:24:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com, animesh.manna@intel.com
Subject: Re: [PATCH 10/11] drm/i915/dp: Enable AS SDP whenever VRR is possible
Message-ID: <ahRblI0-e3jT80o1@intel.com>
References: <20260525052235.560741-1-ankit.k.nautiyal@intel.com>
 <20260525052235.560741-11-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260525052235.560741-11-ankit.k.nautiyal@intel.com>
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

On Mon, May 25, 2026 at 10:52:34AM +0530, Ankit Nautiyal wrote:
> Currently AS SDP is only configured when VRR is enabled. With the optimized
> guardband, the guardband must already account for AS SDP wakeup time
> whenever AS SDP can be sent, otherwise turning VRR on after the initial
> modeset could require a larger guardband and trigger a full modeset.
> 
> Switch the check in intel_dp_needs_as_sdp() from crtc_state->vrr.enable
> to intel_vrr_possible(crtc_state), so AS SDP is enabled (and accounted
> for in the guardband) on any configuration where VRR could be turned on,
> not only when it currently is.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index a3aa0dadf0e1..c01ce3403ad1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3181,7 +3181,7 @@ static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
>  	if (drm_dp_is_branch(intel_dp->dpcd))
>  		return false;
>  
> -	return crtc_state->vrr.enable;
> +	return intel_vrr_possible(crtc_state);

We need AS SDP for the panel replay !async case.

>  }
>  
>  static void intel_dp_compute_as_sdp(struct intel_dp *intel_dp,
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
