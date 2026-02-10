Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE143EA3F28
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 09:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C54110E284;
	Tue, 10 Feb 2026 09:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P381P70z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776F10E284
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770714251; x=1802250251;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=IsrVmpn2G7GBKXHYq0UtuGd0n+xmk6KuEymws+rPmHs=;
 b=P381P70zaCO6dohSltEgXh7gVdZI2RmY6NVW99kDAE4RAf/Hlga1N4jQ
 kflZfhZQL20rcBJdGEXg5gRd6BCxywVuaALZTTAOBDSyLBoMMPEdWCTAk
 g7eQwbIiC/DXsFVjEzIM59WgqVKLKcWXPpupqRncDl50ywFFgbAxOUvMf
 rikGxzG6RyG6v0y4ItoKJCSVeD+IAWj2Vw79882CnWGstpmkLcIEDT4Th
 BcodcwGL4TpUJBoI8c+gqhVjXh/uxCXtAcSBVk0Gb4DBgn13QnA4kJRtI
 WizLontsyuJBXw/sMnrjGhE8w2oqO4lAhQcj6Yc9c9axm2y+HjOmpIoj7 g==;
X-CSE-ConnectionGUID: xucs0NfVT1GSS+FJvJbzcg==
X-CSE-MsgGUID: 1ual1cEoTJqNW0jGu1EPwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="82940908"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="82940908"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:04:11 -0800
X-CSE-ConnectionGUID: 7UwEPlTUTIq9DaqxNNOodA==
X-CSE-MsgGUID: MJwCHsu2Q96+a4yfSvvvUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211691732"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:04:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Austin Hu <austin.hu@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/color: Add 3D LUT to color pipeline since
 Lunar Lake.
In-Reply-To: <20260207001250.2448612-1-austin.hu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260207001250.2448612-1-austin.hu@intel.com>
Date: Tue, 10 Feb 2026 11:04:06 +0200
Message-ID: <c327006711a055e336788fe3c5c0c9588f07d939@intel.com>
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

PS. The Subject should be a short description of the "what". But that
subject does not really match what the patch does. Probably the patch
needs to be split to handle adding the .has_3d_lut and fusing in one
patch, and expanding the platforms separately.

The commit message itself should expand on the "what", and include a
"why". The details about verification and IGT are less relevant, and
certainly that should not be the only part of the commit message.

BR,
Jani.

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
