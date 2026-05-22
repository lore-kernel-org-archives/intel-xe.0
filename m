Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BB4CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 14:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5EA10E60E;
	Fri, 22 May 2026 14:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XR9yMSgY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC9C10E60E;
 Fri, 22 May 2026 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779459034; x=1810995034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=p8z19EWPQMIiHkO0U3BEC1s4wTBCLCPDwJTtkM5Jciw=;
 b=XR9yMSgYERRdDCgelw8FdF8DcQGZR5Yi1vTfloHXVLJoc5YegnBFNys2
 5so0eU/Q7d3/mRGxAzl3nu/+8oRuXG2eijcnUwvP1OUzwnnyINjEZft0i
 thB6NiGMvJPynIXzjyArRollgA+A1kbZdv7uuLgIahoPXUV5iovQ+x/NK
 0+atsYaUZD1bK16QIa4prnhC4tNsSy/oC9RpMeDQcr6URxhv/X6NJRmbY
 d8Fqk6vtohvzOKLdUqfjcA1f1wvT99N+p10FAfDm8uQpDsyGfQAmB9RmL
 qmJhGMh0hY22z+pSfI8KKPwcBjJYo9v0vQHXS4x793Sq3HVMheUHqEm/A A==;
X-CSE-ConnectionGUID: C/qGmN1xTkCWINKBVpg+hw==
X-CSE-MsgGUID: ALfWKheXRXC4nb2vkeJUDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91858593"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="91858593"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 07:10:33 -0700
X-CSE-ConnectionGUID: 6T6JJLyuRZq9C7EykbDAkA==
X-CSE-MsgGUID: omguaRRLQh6JdAIfsDCH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="271272448"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 07:10:31 -0700
Date: Fri, 22 May 2026 17:10:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jouni.hogander@intel.com, animesh.manna@intel.com
Subject: Re: [PATCH 03/11] drm/i915/dp: Allow AS SDP only if v2 is supported
Message-ID: <ahBj093abE2m1HLw@intel.com>
References: <20260518035502.2909359-1-ankit.k.nautiyal@intel.com>
 <20260518035502.2909359-4-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518035502.2909359-4-ankit.k.nautiyal@intel.com>
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

On Mon, May 18, 2026 at 09:24:53AM +0530, Ankit Nautiyal wrote:
> We do not support AS SDP version 1, so allow AS SDP only if AS SDP v2 is
> supported.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 92a650a728d8..d1b40db7e2a3 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -3172,7 +3172,7 @@ static void intel_dp_compute_vsc_colorimetry(const struct intel_crtc_state *crtc
>  static bool intel_dp_needs_as_sdp(struct intel_dp *intel_dp,
>  				  struct intel_crtc_state *crtc_state)
>  {
> -	if (!intel_dp->as_sdp_supported)
> +	if (!intel_dp->as_sdp_v2_supported)

Should perhaps add a TODO here about adding AS SDP v1 support for PCONs.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  		return false;
>  
>  	/*
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
