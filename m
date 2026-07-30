Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3391EC54FD2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 10:28:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC67A10EE74;
	Thu, 30 Jul 2026 10:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BV7FH/Zj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68210EE74
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785407309; x=1816943309;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lCt8k9cCmP42z9gip6x+5sUeErFe77Lz70jYVzrKhEA=;
 b=BV7FH/ZjE3DCj+5xo2fCXp6n3QfQw7g2/WCDQhm94M6JHr5AlW5SkDxs
 tldUzq16KZcJ8cSHOTTpbuwbNC3DlDUPElAletyrpogiTgoPKuVLxQGJG
 CVAku9KKZKS6ItpwA7RAMDxcyms04qgfD/zupki0kJeGUXQsXK14Yf7W4
 /tMAAOUK35JH6EUU8qiB9iiO7cnmcelOgNx/Ws154yf50tQmaHIY1k3q+
 JPV5E6UZwdxwHze0rItbknmBHUL5hW0xN8VGjqrgIJXhjYx2RN2AzdNC5
 6075lGG4XkFOr5Mf5O5efq/2LLoJeBF5H7FK71dYpYhpwg+ghYkcQrs+6 Q==;
X-CSE-ConnectionGUID: fm7gCKiqSs+yalGDUGhToQ==
X-CSE-MsgGUID: IFVFPYfvRUajQG6+s/Ve1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85878054"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="85878054"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:28:29 -0700
X-CSE-ConnectionGUID: GDC9UcR2Rl+TdqPKMHw8FA==
X-CSE-MsgGUID: qbWhKjBORzy/inxQb/qSfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298475397"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.197])
 ([10.245.245.197])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:28:27 -0700
Message-ID: <5b6e3ecb-046a-4cab-a0c8-a0fc4bdf436a@intel.com>
Date: Thu, 30 Jul 2026 11:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drm/xe/guc_ads: allocate UM queues in a separate BO
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, stable@vger.kernel.org
References: <20260722053410.2767369-1-jia.yao@intel.com>
 <20260730004735.344627-1-jia.yao@intel.com>
 <20260730004735.344627-2-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260730004735.344627-2-jia.yao@intel.com>
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
> xe_guc_ads_populate() calls xe_map_memset() on the ADS BO on every GT
> reset.  The UM queue ring buffers were embedded in that same BO, so the
> memset discards fault descriptors already written by the GPU, causing
> GuC to forward an all-zero descriptor (Faulted Address = 0, ASID = 0).
> 
> Move the UM queue ring buffers into a dedicated BO so they are not
> affected by the ADS memset.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c           |  6 ++
>   drivers/gpu/drm/xe/xe_guc_ads.c       | 98 ++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_guc_ads_types.h |  5 ++
>   3 files changed, 84 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 4023700ff2a9..21cf3edef922 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -714,6 +714,12 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
>   	if (ret)
>   		return ret;
>   
> +	if (guc->ads.um_queue_bo) {
> +		ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.um_queue_bo);
> +		if (ret)
> +			return ret;
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c98454545a85..7f371f9c7268 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -16,6 +16,7 @@
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_guc_regs.h"
>   #include "xe_bo.h"
> +#include "xe_res_cursor.h"
>   #include "xe_gt.h"
>   #include "xe_gt_ccs_mode.h"
>   #include "xe_gt_mcr.h"
> @@ -155,16 +156,6 @@ static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(ads->capture_size);
>   }
>   
> -static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
> -{
> -	struct xe_device *xe = ads_to_xe(ads);
> -
> -	if (!xe->info.has_usm)
> -		return 0;
> -
> -	return GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX;
> -}
> -
>   static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
>   {
>   	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
> @@ -205,22 +196,12 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
>   	return PAGE_ALIGN(offset);
>   }
>   
> -static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
> -{
> -	u32 offset;
> -
> -	offset = guc_ads_capture_offset(ads) +
> -		 guc_ads_capture_size(ads);
> -
> -	return PAGE_ALIGN(offset);
> -}
> -
>   static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
>   {
>   	size_t offset;
>   
> -	offset = guc_ads_um_queues_offset(ads) +
> -		guc_ads_um_queues_size(ads);
> +	offset = guc_ads_capture_offset(ads) +
> +		guc_ads_capture_size(ads);
>   
>   	return PAGE_ALIGN(offset);
>   }
> @@ -409,6 +390,67 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>   
>   	ads->bo = bo;
>   
> +	if (xe->info.has_usm) {
> +		/*
> +		 * Allocate a separate BO for the HW fault ring (UM queues).
> +		 *
> +		 * xe_guc_ads_populate() clears the entire ADS BO via
> +		 * xe_map_memset() on every GT reset.  Keeping the UM queues
> +		 * in a dedicated BO prevents that memset from discarding fault
> +		 * descriptors the GPU has already written into the ring,
> +		 * which would cause GuC to forward an all-zero descriptor to
> +		 * the driver (Faulted Address = 0, ASID = 0).
> +		 *
> +		 * Round the size up to the next power of two so that on iGPU
> +		 * (system memory, no IOMMU) the TTM pool issues a single
> +		 * alloc_pages(order=N) call, maximising the chance of getting
> +		 * a physically contiguous block.  GuC requires contiguous DPA.
> +		 */

 From our offline discussion I think is this is correct, however there 
is no mention of this fix/change in the commit message? It only mentions 
memset issue.


> +		size_t um_size = roundup_pow_of_two(GUC_UM_QUEUE_SIZE *
> +						    GUC_UM_HW_QUEUE_MAX);
> +
> +		bo = xe_managed_bo_create_pin_map(xe, tile, um_size,
> +						  XE_BO_FLAG_SYSTEM |
> +						  XE_BO_FLAG_GGTT |
> +						  XE_BO_FLAG_GGTT_INVALIDATE |
> +						  XE_BO_FLAG_PINNED_NORESTORE);
> +		if (IS_ERR(bo))
> +			return PTR_ERR(bo);
> +
> +		/*
> +		 * On pre-Xe3p platforms, GAM (not GuC) accesses the UM queue
> +		 * ring via base_dpa, which must be a contiguous device physical
> +		 * address range.  Without IOMMU, DMA addresses equal physical
> +		 * addresses and the allocator may return non-contiguous pages;
> +		 * verify contiguity.  With IOMMU, the DMA mapping is a single
> +		 * contiguous IOVA so no check is needed.
> +		 */
> +		if (unlikely(!device_iommu_mapped(xe->drm.dev)) &&

I think maybe drop the iommu check?  Not sure if we can safely assume it 
will always give single contig dma blob.

> +		    !xe_bo_is_vram(bo) &&
> +		    !xe_guc_using_main_gamctrl_queues(ads_to_guc(ads))) {
> +			struct xe_res_cursor cur;
> +			int i;
> +
> +		xe_res_first_sg(xe_bo_sg(bo), 0,
> +				GUC_UM_QUEUE_SIZE * GUC_UM_HW_QUEUE_MAX, &cur);
> +			for (i = 1; i < GUC_UM_HW_QUEUE_MAX; i++) {
> +				dma_addr_t expected = xe_res_dma(&cur) +
> +						      GUC_UM_QUEUE_SIZE;

I think we can maybe simplify with:

if (drm_prime_get_contiguous_size(xe_bo_sg(bo)) < queue size)
	...

> +
> +				xe_res_next(&cur, GUC_UM_QUEUE_SIZE);
> +				if (xe_res_dma(&cur) != expected) {
> +					drm_err(&xe->drm,
> +						"UM fault queue %d is physically non-contiguous (got %pad, expected %pad); GAM requires contiguous DPA. Enable IOMMU (intel_iommu=on) to fix.\n",
> +						i, &(dma_addr_t){xe_res_dma(&cur)},
> +						&expected);
> +					return -ENOMEM;
> +				}
> +			}
> +		}
> +
> +		ads->um_queue_bo = bo;
> +	}
> +
>   	return 0;
>   }
>   ALLOW_ERROR_INJECTION(xe_guc_ads_init, ERRNO); /* See xe_pci_probe() */
> @@ -820,7 +862,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>   
>   static void guc_um_init_params(struct xe_guc_ads *ads)
>   {
> -	u32 um_queue_offset = guc_ads_um_queues_offset(ads);
> +	struct xe_bo *um_bo = ads->um_queue_bo;
>   	struct xe_guc *guc = ads_to_guc(ads);
>   	struct xe_device *xe = ads_to_xe(ads);
>   	u64 base_dpa;
> @@ -830,8 +872,14 @@ static void guc_um_init_params(struct xe_guc_ads *ads)
>   
>   	with_dpa = !xe_guc_using_main_gamctrl_queues(guc);
>   
> -	base_ggtt = xe_bo_ggtt_addr(ads->bo) + um_queue_offset;
> -	base_dpa = xe_bo_main_addr(ads->bo, PAGE_SIZE) + um_queue_offset;
> +	if (um_bo) {
> +		/* All USM platforms: UM queues in dedicated um_queue_bo */
> +		base_ggtt = xe_bo_ggtt_addr(um_bo);
> +		base_dpa = xe_bo_main_addr(um_bo, PAGE_SIZE);
> +	} else {
> +		/* Platform does not support USM: no UM queues, nothing to do */
> +		return;
> +	}
>   
>   	for (i = 0; i < GUC_UM_HW_QUEUE_MAX; ++i) {
>   		/*
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> index 48a8e092023f..845c1fbd93a4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
> @@ -16,6 +16,11 @@ struct xe_bo;
>   struct xe_guc_ads {
>   	/** @bo: Xe BO for GuC ads blob */
>   	struct xe_bo *bo;
> +	/**
> +	 * @um_queue_bo: Dedicated BO for the HW fault ring (UM queues).
> +	 * NULL if the platform does not support USM.
> +	 */
> +	struct xe_bo *um_queue_bo;
>   	/** @golden_lrc_size: golden LRC size */
>   	size_t golden_lrc_size;
>   	/** @regset_size: size of register set passed to GuC for save/restore */

