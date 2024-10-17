Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C5AD2A53A
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 12:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6908910E32C;
	Thu, 17 Oct 2024 12:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IpAV2I+7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6EC10E1D2;
 Thu, 17 Oct 2024 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729167203; x=1760703203;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=M/Guv2ibOzP4W8R462v3zpIVKL2++wVaM8jZzeZ4t1k=;
 b=IpAV2I+75c4E37Ve5XmkIsYY5wtlOiFO4YkwPKFFSnKfrNKAxYj+nwhv
 3wzHST0NabTMSjlgJdVZeV4p+j3WqO9RAr+gFjj7/JqVpNF536DFq3wAz
 LcwR1V9SopMgSEt+tMtmjxZe5SLVuYf94KByd8lWWkkEG/f3jMC5FBUw3
 d9keyctGl4W6SzqdhBep2YOAH04N3ng8qkwT1eq/8G1dz8QFTW8FfshjS
 77SC7otIABqotVjlcQdXu0dAZv01Su9OZHK5K8b069717WDS7dqe8PKrt
 YprFs50qQHf6JGYkl+D1Z/dfU7qsSzkMazc2N75gfoYTFJX4e18CiTVZe Q==;
X-CSE-ConnectionGUID: bRXDfAMzTqy27d34wF625Q==
X-CSE-MsgGUID: Z0wZ3kLZQu+Sa3x59c1X9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="28119073"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="28119073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 05:13:22 -0700
X-CSE-ConnectionGUID: edv1XVzcTnS1vLsxHsDqTA==
X-CSE-MsgGUID: hMTlyzFBRVCQmK0XL0lItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="79359133"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 05:13:20 -0700
Date: Thu, 17 Oct 2024 15:13:50 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 suraj.kandpal@intel.com, jani.nikula@linux.intel.com
Subject: Re: [PATCH 1/7] drm/i915/dp: Use HAS_DSC macro in
 intel_dp_dsc_max_src_input_bpc
Message-ID: <ZxD_fiyWKZTO5f_3@ideak-desk.fi.intel.com>
References: <20241003104343.984060-1-ankit.k.nautiyal@intel.com>
 <20241003104343.984060-2-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003104343.984060-2-ankit.k.nautiyal@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 03, 2024 at 04:13:37PM +0530, Ankit Nautiyal wrote:
> Use HAS_DSC macro to take into account platforms for which DSC is fused.
> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index c4fdae5097ec..c47748905506 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -1766,6 +1766,9 @@ intel_dp_compute_link_config_wide(struct intel_dp *intel_dp,
>  static
>  u8 intel_dp_dsc_max_src_input_bpc(struct drm_i915_private *i915)
>  {
> +	if (!HAS_DSC(i915))

This is checked already earlier via intel_dp_has_dsc(), couldn't we rely
on that instead of checking it in these lower level functions?

> +		return 0;
> +
>  	/* Max DSC Input BPC for ICL is 10 and for TGL+ is 12 */
>  	if (DISPLAY_VER(i915) >= 12)
>  		return 12;
> -- 
> 2.45.2
> 
