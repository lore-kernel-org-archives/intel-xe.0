Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD08E77188
	for <intel-xe@archiver.kernel.org>; Tue, 31 Dec 2024 16:21:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BC310E0AE;
	Tue, 31 Dec 2024 16:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hBQCuQnz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CBF10E0AE;
 Tue, 31 Dec 2024 16:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735662066; x=1767198066;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=1LXmgETpNd5EnGUlwcYBVtf0covD53xW0TaNE8mPMtM=;
 b=hBQCuQnzmMk8UshCuK+KQreBPs73EEYaKswDni8w8LvheEGyKi4hsJ30
 jChW0c51EX8Vmo/QAq4AU8P49Jbrilmmvvnm1Pgt4sSA/pxaNVbgCvO9k
 tKgoRh3295QSyMMQfLdHX0urSA6LEYm0wwi/Aj+ywyO05jwxZL4jRgjB2
 LFHXmEvnV3ZoBbD+lc+nRkeYIoSfCr3Y7vIHXzfpvVkGtTE9+tPwxCnZA
 MxzCnDZUw2Cj6jyyeBFtUv4z5/LLnQiZNV98f+ElammZAFyH6FWlE52Y/
 tGM458ISc2rXBmqbCQ40v6cB9zBtRPK6DzH4YzbZC2++aVQbxlvkB22If w==;
X-CSE-ConnectionGUID: GezNVRXCQ/WFuGUTtwke/Q==
X-CSE-MsgGUID: WPmJXWRXSziNsS9XvHPaiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="47358985"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="47358985"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:21:06 -0800
X-CSE-ConnectionGUID: OSBkek4uRZWQhiXLNaTUBQ==
X-CSE-MsgGUID: DGnIWSbYTPSczcnMu92aNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="101506151"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 08:21:06 -0800
Date: Tue, 31 Dec 2024 18:21:55 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 08/16] drm/i915/ddi: enable 128b/132b
 TRANS_DDI_FUNC_CTL mode for UHBR SST
Message-ID: <Z3QaIwXEtd_z0jz-@ideak-desk.fi.intel.com>
References: <cover.1734643485.git.jani.nikula@intel.com>
 <9591645d5ca1982ed2b617465382a00be6be76cc.1734643485.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9591645d5ca1982ed2b617465382a00be6be76cc.1734643485.git.jani.nikula@intel.com>
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

On Thu, Dec 19, 2024 at 11:33:57PM +0200, Jani Nikula wrote:
> 128b/132b SST needs 128b/132b mode enabled in the TRANS_DDI_FUNC_CTL
> register.
> 
> This is preparation for enabling 128b/132b SST. This path is not
> reachable yet.
> 
> v2: Use the MST path instead of SST to also set transport select (Imre)
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Imre Deak <imre.deak@intel.com>

> ---
>  drivers/gpu/drm/i915/display/intel_ddi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
> index 4f9c50996446..ce34a619d48a 100644
> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> @@ -561,7 +561,8 @@ intel_ddi_transcoder_func_reg_val_get(struct intel_encoder *encoder,
>  	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_ANALOG)) {
>  		temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
>  		temp |= (crtc_state->fdi_lanes - 1) << 1;
> -	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST)) {
> +	} else if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_DP_MST) ||
> +		   intel_dp_is_uhbr(crtc_state)) {
>  		if (intel_dp_is_uhbr(crtc_state))
>  			temp |= TRANS_DDI_MODE_SELECT_FDI_OR_128B132B;
>  		else
> -- 
> 2.39.5
> 
