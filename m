Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69994EA3F2A
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 09:00:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0128910E284;
	Tue, 10 Feb 2026 09:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PdDn4Zg8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0233910E284
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770714006; x=1802250006;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=s8mMRNUZXTl2k5DSn9dHxjJbJh/gE63QA2HgSBL5tk8=;
 b=PdDn4Zg80hK4zIV7opfbthNtc7CNC7agiEXdwfdelhssLkaV9bBO7KYk
 Y7JSK7uEhHSfCthRq9CKC40ZqTWKbuXPGjVb+IpfU4s9ncSe84AJEcrCZ
 lV6sNOojuuyH1En3yNo3Bx2nFwXgm1c0kfpeWnAltFto3kcYlqhPmcdAc
 +q1APUURGalKsYoCE1n41/wDK7MnVsG4CyQZIhYsUYUgxueo0Mn5WNQDL
 n0lBYYlIk1fIBANMndfM3/LB4CNurdgFaSPKSwHrPng2wvvzYwun5lgzS
 TYzSmmDeQhUfcHZrqPjZKZLT3mcspCWwLwuRJ/hCxd6JwPR5fdRNuNCg6 g==;
X-CSE-ConnectionGUID: 40aZ/P36Tae2gC7NkL2phw==
X-CSE-MsgGUID: rfglDyMATIKjZNn/e2lLkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71879715"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71879715"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:00:06 -0800
X-CSE-ConnectionGUID: vvu9ycdoS1K/mLDgYOnT3w==
X-CSE-MsgGUID: AxvNtNkgQmGlPGgrfc5p5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211691099"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:00:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Austin Hu <austin.hu@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/color: Add 3D LUT to color pipeline since
 Lunar Lake.
In-Reply-To: <20260207001250.2448612-1-austin.hu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260207001250.2448612-1-austin.hu@intel.com>
Date: Tue, 10 Feb 2026 11:00:01 +0200
Message-ID: <64e0a6952a6df72f3731d1023fc03b6f73b6f63e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 06 Feb 2026, Austin Hu <austin.hu@intel.com> wrote:
> Verified on PTL, where IGT case kms_color_pipeline passes for PipeA
> and PipeB.
>
> Signed-off-by: Austin Hu <austin.hu@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color_pipeline.c | 5 ++---
>  drivers/gpu/drm/i915/display/intel_display_device.c | 6 ++++++
>  drivers/gpu/drm/i915/display/intel_display_device.h | 2 ++
>  drivers/gpu/drm/i915/display/intel_display_regs.h   | 1 +
>  4 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 04af552b3..d26b0f134 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -47,9 +47,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop_en
>  	drm_colorop_set_next_property(prev_op, &colorop->base);
>  	prev_op = &colorop->base;
>  
> -	if (DISPLAY_VER(display) >= 35 &&
> -	    intel_color_crtc_has_3dlut(display, pipe) &&
> -	    plane->type == DRM_PLANE_TYPE_PRIMARY) {
> +	if ((DISPLAY_VER(display) >= 15) && HAS_3D_LUT(display) &&
> +			intel_color_crtc_has_3dlut(display, pipe)) {

intel_color_crtc_has_3dlut() should have the check for
HAS_3D_LUT(). Basically:

	if (HAS_3D_LUT())
		return pipe == PIPE_A || pipe == PIPE_B;
	else
		return false;

>  		colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>  
>  		ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, plane, 17,
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c b/drivers/gpu/drm/i915/display/intel_display_device.c
> index 1170afaa8..765fd08df 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> @@ -1903,6 +1903,12 @@ static void __intel_display_device_info_runtime_init(struct intel_display *displ
>  				if (display_runtime->num_scalers[pipe])
>  					display_runtime->num_scalers[pipe] = 1;
>  		}
> +
> +		if (REG_FIELD_GET(XE2LPD_DE_CAP_3DLUT_MASK, cap) ==
> +		    XE2LPD_DE_CAP_3DLUT_REMOVED)
> +			display_runtime->has_3d_lut = false;
> +		else
> +			display_runtime->has_3d_lut = true;

This won't work.

You'll need to initialize .has_3d_lut on the platforms that have it in
.__runtime_defaults.has_3d_lut. We can't have multiple truths for
whether a platform has a feature or not.

Initially, that means replacing the DISPLAY_VER(display) >= 12 check in
intel_color_crtc_has_3dlut() with .has_3d_lut. It could be a separate
patch.

Then disable the runtime value based on the capability.

BR,
Jani.

>  	}
>  
>  	if (DISPLAY_VER(display) >= 30)
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index b559ef43d..1dc24a86b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -171,6 +171,7 @@ struct intel_display_platforms {
>  #define HAS_DSC(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_dsc)
>  #define HAS_DSC_3ENGINES(__display)	(DISPLAY_VERx100(__display) == 1401 && HAS_DSC(__display))
>  #define HAS_DSC_MST(__display)		(DISPLAY_VER(__display) >= 12 && HAS_DSC(__display))
> +#define HAS_3D_LUT(__display)		(DISPLAY_RUNTIME_INFO(__display)->has_3d_lut)
>  #define HAS_FBC(__display)		(DISPLAY_RUNTIME_INFO(__display)->fbc_mask != 0)
>  #define HAS_FBC_DIRTY_RECT(__display)	(DISPLAY_VER(__display) >= 30)
>  #define HAS_FPGA_DBG_UNCLAIMED(__display)	(DISPLAY_INFO(__display)->has_fpga_dbg)
> @@ -277,6 +278,7 @@ struct intel_display_runtime_info {
>  	bool has_hdcp;
>  	bool has_dmc;
>  	bool has_dsc;
> +	bool has_3d_lut;
>  	bool edp_typec_support;
>  	bool has_dbuf_overlap_detection;
>  };
> diff --git a/drivers/gpu/drm/i915/display/intel_display_regs.h b/drivers/gpu/drm/i915/display/intel_display_regs.h
> index 9d71e26a4..016bd2846 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_regs.h
> @@ -1538,6 +1538,7 @@
>  
>  #define XE2LPD_DE_CAP			_MMIO(0x41100)
>  #define   XE2LPD_DE_CAP_3DLUT_MASK	REG_GENMASK(31, 30)
> +#define   XE2LPD_DE_CAP_3DLUT_REMOVED	1
>  #define   XE2LPD_DE_CAP_DSC_MASK	REG_GENMASK(29, 28)
>  #define   XE2LPD_DE_CAP_DSC_REMOVED	1
>  #define   XE2LPD_DE_CAP_SCALER_MASK	REG_GENMASK(27, 26)

-- 
Jani Nikula, Intel
