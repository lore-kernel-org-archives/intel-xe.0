Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FAC5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 07:45:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA8610E8A8;
	Tue,  4 Aug 2026 07:45:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOJ3/Nsb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FC110E8A3
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 07:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785829505; x=1817365505;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nvZE4Mbhz8nTAbWQzdY2uVuWIS51H8tSEWLAueBhUWs=;
 b=bOJ3/NsbTl5yTdaGVYY/ctyGswmQg6gf3qqueWFobeJN/j7iqamh6lTl
 Nm2QCCaMbzG8jYRqHV70RuxvZSZyAMVqP6d8cy5d6eb/g/kNofqMozwrv
 wFKUEY+szbvz6XOh6ylrSYxMtlH0bJDJZveq5k6rguc2U3riJlBwc7eRf
 pQatCgj5pZ+tbdW/1CzowBUdeZUYQ2P6oamW/bpBFgYn3Rkp9ID+Nb+hy
 UetnyoDsAiC6fepDkDZ1qxRVk1svfmZWEOmk0C/QdPfw/MBiBI2nTPjpu
 ArdbMB7DKMwC+WZlJhc5Sw5fiHybDaWdB7WUqL50MnHXIwZD3BWZAgqgm w==;
X-CSE-ConnectionGUID: +e1cwqC9QsKIpuA+TO53YQ==
X-CSE-MsgGUID: Ed6FJNJaS5S+G4xhtEQpZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86384844"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86384844"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:45:04 -0700
X-CSE-ConnectionGUID: zjQ6RqPOQye59oiSRhXFGQ==
X-CSE-MsgGUID: bVFhWKaNR96qWHtvDXAe6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="264933909"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.172])
 ([10.245.245.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 00:45:03 -0700
Message-ID: <0a0db7a1-a3ad-45a3-9b59-723d539fbe88@intel.com>
Date: Tue, 4 Aug 2026 08:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/xe/guc_ads: allocate UM queues in VRAM on dGFX
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, stable@vger.kernel.org
References: <20260803200838.98826-1-jia.yao@intel.com>
 <20260803200838.98826-3-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260803200838.98826-3-jia.yao@intel.com>
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

On 03/08/2026 21:08, Jia Yao wrote:
> On iGPU, the UM queue BO is allocated in system memory. On dGFX, the BO
> was previously created in system memory and later reallocated in
> xe_guc_realloc_post_hwconfig().  Allocate the UM queue BO directly in
> VRAM on dGFX, where it is ultimately required.
> 
> Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Signed-off-by: Jia Yao <jia.yao@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_guc.c     |  6 ------
>   drivers/gpu/drm/xe/xe_guc_ads.c | 17 ++++++++++-------
>   2 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4f132bf8539d..4286bd05c686 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -732,12 +732,6 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
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
> index ef8e9cc35c8c..a69ec584cc0f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -446,19 +446,22 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   		/*
>   		 * Allocate a separate BO for the HW fault ring (UM queues).
>   		 *
> -		 * Round the size up to the next power of two so that
> +		 * Round the size up to the next power of two so that on iGPU
>   		 * (system memory, no IOMMU) the TTM pool issues a single
>   		 * alloc_pages(order=N) call, maximising the chance of getting
>   		 * a physically contiguous block.  GuC requires contiguous DPA.
>   		 */
> -		size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
> +		size_t um_size = IS_DGFX(xe) ?
> +				 GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX :
> +				 roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
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

