Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90321C54FDF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 10:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5092F10EEB9;
	Thu, 30 Jul 2026 10:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FXk4rZEe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8710EE95
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785408687; x=1816944687;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=duBEpRbPoWtSq71eeoRnMnFzJjraE5Vu4U1c21a3VPU=;
 b=FXk4rZEenPIsr42mtDDp+nOvaWMiDSoVgzEqxvQ5iqouXA+f/lmfCNLW
 ygyTm+00kMBEDqRVgpUKq6dKGnekASFNpMOkBhC+6bxLskn0zQphLdSBR
 73WZdg2BouXK5V4p+nbiUWZEnWHJbm1soeUKT3KLZ9q4duTmH8ai4eg57
 K8jCEC7Pn1vIXZSvHqUOGJ9+mrSezPAjx6eoMF6OsoTMnnZ3Lz5ZjSapV
 Okntidl3jxJNsz3j1IjLf+3/RHv4vda4QGKpf6uPn/H7i6VyMKiTbMTMC
 EeQ8M8FnfFlMK1lhogAjdblwihkMqfoifg6NvNf1Sw1lzZLU4lhqlhr5i g==;
X-CSE-ConnectionGUID: kCZ2k0GISHyzDEzmbOIHXA==
X-CSE-MsgGUID: yL695a27SzCRj2ZoKOyg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96384524"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="96384524"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:51:26 -0700
X-CSE-ConnectionGUID: K4uw1dYtSAmG6pMvoLZHUg==
X-CSE-MsgGUID: PjtqN71TR921XkTYo/6Bxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="253940882"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:51:25 -0700
Message-ID: <148b38ae-eae7-40d5-837c-fddda1299d9f@intel.com>
Date: Thu, 30 Jul 2026 11:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, stable@vger.kernel.org
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730004735.344627-1-jia.yao@intel.com>
 <20260730004735.344627-3-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260730004735.344627-3-jia.yao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 30/07/2026 01:47, Jia Yao wrote:
> On dGFX the original ADS BO is explicitly migrated to VRAM by
> xe_guc_realloc_post_hwconfig() so that xe_bo_main_addr() returns a
> real device-physical address (DPA) rather than an IOMMU IOVA.  A
> separate SYSTEM BO for the UM queues would not go through that migration
> path, so its IOVA would differ from the physical address on systems
> where pages are allocated above 4 GB.  GuC/GAM accesses the UM queue
> ring via base_dpa (with_dpa=true on pre-Xe3p), so an incorrect DPA
> causes all-zero fault descriptors to be forwarded to the driver.

I feel like I don't fully understand the explanation here. Is the issue 
not just the contig requirement for base_dpa? We now use attempt a best 
effort approach for system memory, however for dgpu we can go further 
and use VRAM to guarantee that requirement. If that is all this is doing 
then commit message can be simplified with something like:

"To fully guarantee the contig requirement for base_dpa, we can instead 
just use VRAM for the um queue, on dgpu..."

> 
> Use XE_BO_FLAG_VRAM_IF_DGFX() for the UM queue BO so that on dGFX the
> BO is allocated directly in VRAM and xe_bo_main_addr() returns the
> correct DPA without needing a post-hwconfig migration step.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c     |  6 ------
>   drivers/gpu/drm/xe/xe_guc_ads.c | 11 ++++++-----
>   2 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 21cf3edef922..4023700ff2a9 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -714,12 +714,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> -	if (guc->ads.um_queue_bo) {
> -		ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.um_queue_bo);
> -		if (ret)
> -			return ret;
> -	}
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 7f371f9c7268..53636333fb45 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -409,11 +409,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   		size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
>   						    GUC_UM_HW_QUEUE_MAX);
>   
> -		bo = xe_managed_bo_create_pin_map(xe, tile, um_size,
> -						  XE_BO_FLAG_SYSTEM |
> -						  XE_BO_FLAG_GGTT |
> -						  XE_BO_FLAG_GGTT_INVALIDATE |
> -						  XE_BO_FLAG_PINNED_NORESTORE);
> +		u32 um_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> +			       XE_BO_FLAG_GGTT |
> +			       XE_BO_FLAG_GGTT_INVALIDATE |
> +			       XE_BO_FLAG_PINNED_NORESTORE;
> +
> +		bo = xe_managed_bo_create_pin_map(xe, tile, um_size, um_flags);
>   		if (IS_ERR(bo))
>   			return PTR_ERR(bo);
>   

