Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FDED35159
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 07:53:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E6710E2DA;
	Wed,  1 Apr 2026 07:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VudGaiWC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880E210E2DA
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Apr 2026 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775030034; x=1806566034;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=9abtjgsTPxxgKkaMU2joS72qKVuHEgfUmFpO7hZxoHU=;
 b=VudGaiWCg3wF5i5s69gG6z8FLoVeG9yOUWfg3eMro3ohk0b2VTj1nsff
 255Rkw7Qc6AR1Ahg2lPiwS/sHem56M3kTpi21z7nlz2laKdCr6xB7ouYq
 ZUQXbYBo/AO7J4dRxlaXHNvcHcqh70N9GWN2w2L1yugbhguaFioGJgrwi
 2TLdGcTNsEw8dsHGH4I5k1AhJ9P3tdMg/TNiVbbn3k3K7ppxYIPhzF3pM
 hmLShTfuX909xuG3SugPoQRBkdABsi+k3zicWsSFXrEHQUPCuS7c12N4w
 t/2+mTI0As3qkqMaXv9hIBSKUBTSroYyJBhBYK5KVJ+QAOPeacqUVXP05 A==;
X-CSE-ConnectionGUID: kj/s7x1iTNCqoOxFIro1aA==
X-CSE-MsgGUID: Cp32wXVlSk6EBW8wkSDO+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76073993"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76073993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:53:53 -0700
X-CSE-ConnectionGUID: SK6MsuXTQK6LrSQNTO+8VA==
X-CSE-MsgGUID: HxM2TvLYQFu50QA7KzviGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228216906"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 00:53:50 -0700
Date: Wed, 1 Apr 2026 09:53:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH 3/5] drm/xe/ras: Add flag for Xe RAS
Message-ID: <aczPDEvv1w4HGqFH@black.igk.intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-4-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320102607.1017511-4-riana.tauro@intel.com>
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

On Fri, Mar 20, 2026 at 03:55:58PM +0530, Riana Tauro wrote:
> Add a flag for RAS. If enabled, XE driver registers with
> DRM RAS and exposes supported counters.
> 
> Currently this is enabled for PVC and CRI.

This looks like it should be the last patch in the series.

Raag

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_hw_error.c     | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c          | 3 +++
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  4 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 150c76b2acaf..bfb23d6c0511 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -191,6 +191,8 @@ struct xe_device {
>  		u8 has_ctx_tlb_inval:1;
>  		/** @info.has_range_tlb_inval: Has range based TLB invalidations */
>  		u8 has_range_tlb_inval:1;
> +		/** @info.has_ras: Device supports RAS (Reliability, Availability, Serviceability) */
> +		u8 has_ras:1;
>  		/** @info.has_soc_remapper_sysctrl: Has SoC remapper system controller */
>  		u8 has_soc_remapper_sysctrl:1;
>  		/** @info.has_soc_remapper_telem: Has SoC remapper telemetry support */
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 2a31b430570e..3ab0fceb151f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -520,7 +520,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>  
>  static int hw_error_info_init(struct xe_device *xe)
>  {
> -	if (xe->info.platform != XE_PVC)
> +	if (!xe->info.has_ras)
>  		return 0;
>  
>  	return xe_drm_ras_init(xe);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index f5dd77b6680f..e44003b5aee3 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -364,6 +364,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>  	.vm_max_level = 4,
>  	.vram_flags = XE_VRAM_FLAGS_NEED64K,
>  	.has_mbx_power_limits = false,
> +	.has_ras = true,
>  };
>  
>  static const struct xe_device_desc mtl_desc = {
> @@ -471,6 +472,7 @@ static const struct xe_device_desc cri_desc = {
>  	.require_force_probe = true,
>  	.va_bits = 57,
>  	.vm_max_level = 4,
> +	.has_ras = true,
>  };
>  
>  static const struct xe_device_desc nvlp_desc = {
> @@ -761,6 +763,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
>  	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
>  	xe->info.has_pxp = desc->has_pxp;
> +	xe->info.has_ras = desc->has_ras;
>  	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
>  	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 08386c5eca27..cb7d79f51753 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -54,6 +54,7 @@ struct xe_device_desc {
>  	u8 has_pre_prod_wa:1;
>  	u8 has_page_reclaim_hw_assist:1;
>  	u8 has_pxp:1;
> +	u8 has_ras:1;
>  	u8 has_soc_remapper_sysctrl:1;
>  	u8 has_soc_remapper_telem:1;
>  	u8 has_sriov:1;
> -- 
> 2.47.1
> 
