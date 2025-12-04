Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4DBD2068D
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 13:25:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B6310E964;
	Thu,  4 Dec 2025 13:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WjHSWTk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D1A10E964
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764854719; x=1796390719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=97xuv7qZp9yvIF3UoyIFq72m2GBqIuk5vVXeli6Wu3E=;
 b=WjHSWTk/EItO/gRe5hbuM2YOXLi/zzh+Ept6rw57cXTeXAF2twOHOPZv
 DwXATqLlJ9h5pB6SIoxCGnebh/oaROskcNNEzt8bWZ+x79NL7LkTMUc0f
 Wk/WTODbPwzCZoE1RvRIxDDmfjJTXHbb+JDCIvsbXTQchMBJWugYlqG2w
 lGp16hHMYTV+f+OCFizCEK4FL4+bvApD8zfz46C120XBwVEGswu+O3K0r
 4e4PBs2NdPW6SsR1xZF4ScGs4yhOU3/hTteUtzU7Vo3GinofetAROd9pi
 J0oLOgKe5/3CPioiI2mG9lk/sIXfsR4mjsA29yPHxS+/iwhMMqbKx/oH4 A==;
X-CSE-ConnectionGUID: rZMNdHWNRuiGy0xBa7/gtw==
X-CSE-MsgGUID: 0T6wDQ4hSfOyQrler7L7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="92350375"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92350375"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:25:19 -0800
X-CSE-ConnectionGUID: /jGb/69ZSRa3NckEu6G7ww==
X-CSE-MsgGUID: 6/N1fl0lQAubinQDErsV1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199461824"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO kuha) ([10.124.220.149])
 by orviesa004.jf.intel.com with SMTP; 04 Dec 2025 05:25:17 -0800
Received: by kuha (sSMTP sendmail emulation); Thu, 04 Dec 2025 15:25:07 +0200
Date: Thu, 4 Dec 2025 15:25:07 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 andi.shyti@linux.intel.com
Subject: Re: [PATCH v1] drm/xe/cri: Enable I2C controller
Message-ID: <aTGLsyt61I9RE5Mj@kuha>
References: <20251128084414.306265-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128084414.306265-1-raag.jadav@intel.com>
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

Fri, Nov 28, 2025 at 02:14:14PM +0530, Raag Jadav kirjoitti:
> Enable I2C controller for Crescent Island and while at it, rely on
> has_i2c flag instead of manual platform checks.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

FWIW:

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>  drivers/gpu/drm/xe/xe_i2c.c          | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c          | 3 +++
>  drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>  4 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9a9a8eb84a78..e23c50273c28 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -299,6 +299,8 @@ struct xe_device {
>  		u8 has_heci_cscfi:1;
>  		/** @info.has_heci_gscfi: device has heci gscfi */
>  		u8 has_heci_gscfi:1;
> +		/** @info.has_i2c: Device has I2C controller */
> +		u8 has_i2c:1;
>  		/** @info.has_late_bind: Device has firmware late binding support */
>  		u8 has_late_bind:1;
>  		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index 0b5452be0c87..8eccbae05705 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -319,7 +319,7 @@ int xe_i2c_probe(struct xe_device *xe)
>  	struct xe_i2c *i2c;
>  	int ret;
>  
> -	if (xe->info.platform != XE_BATTLEMAGE)
> +	if (!xe->info.has_i2c)
>  		return 0;
>  
>  	if (IS_SRIOV_VF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 763f588521d0..2e2e9158d621 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -366,6 +366,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_mbx_power_limits = true,
>  	.has_gsc_nvm = 1,
>  	.has_heci_cscfi = 1,
> +	.has_i2c = true,
>  	.has_late_bind = true,
>  	.has_sriov = true,
>  	.has_mem_copy_instr = true,
> @@ -411,6 +412,7 @@ static const struct xe_device_desc cri_desc = {
>  	.dma_mask_size = 52,
>  	.has_display = false,
>  	.has_flat_ccs = false,
> +	.has_i2c = true,
>  	.has_mbx_power_limits = true,
>  	.has_mert = true,
>  	.has_sriov = true,
> @@ -676,6 +678,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>  	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>  	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> +	xe->info.has_i2c = desc->has_i2c;
>  	xe->info.has_late_bind = desc->has_late_bind;
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_mert = desc->has_mert;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index f19f35359696..6de23ddf6f68 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -44,6 +44,7 @@ struct xe_device_desc {
>  	u8 has_gsc_nvm:1;
>  	u8 has_heci_gscfi:1;
>  	u8 has_heci_cscfi:1;
> +	u8 has_i2c:1;
>  	u8 has_late_bind:1;
>  	u8 has_llc:1;
>  	u8 has_mbx_power_limits:1;
> -- 
> 2.43.0

-- 
heikki
