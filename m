Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B94D2AB0A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 09:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6A3310E26F;
	Tue, 29 Oct 2024 09:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N/GRi9jp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B5A10E26F
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Oct 2024 09:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730195076; x=1761731076;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=a0FDX7zTZMn8i3BHSVCn0wAd44MUQsAMIyAGRLeS3z4=;
 b=N/GRi9jpzFmtwWdL3V3K6ajqeq3SH6aqRqzsvhGZpJP8wf8FwLLTyewV
 LbBlH840qqkpY1mUYS1QeqVLlltUBysb0Wu3LjxRwq9PxCmpP5lch640Y
 ViqbVbt85NGDwJCa8EDKgmOFSI0JBYxRMXw2l1nDjYZKlRgJ+92pC2dHa
 KG9kFBONd/HcIkzw22/RPJGxh656vpr9lKdzv52eku9Bkfsz+4DY0R6gA
 yQGGxPUcemfp8kO8PSf3q/l2ywn6vW2DwnBZ4T3ma4pcmXjjcyBpm+RzU
 8ZIPAj4yymcfFgHxIUwOY0rzczY7VmaAVC/8NjG7B1UkNc+tpzfCj5F45 Q==;
X-CSE-ConnectionGUID: HDlA/VvnRLW3NblqXLZCvg==
X-CSE-MsgGUID: Z4BX1vLgQTm5wd2j4Qto2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40360672"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40360672"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 02:44:36 -0700
X-CSE-ConnectionGUID: iEsZbPsxRbqU+bHD3R/BNA==
X-CSE-MsgGUID: +KGfKSYNTm6nO7HqBR/+tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; d="scan'208";a="112712120"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.40])
 ([10.245.244.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 02:44:35 -0700
Message-ID: <326aaf08-60ef-4eb8-8565-093488b4c9d3@intel.com>
Date: Tue, 29 Oct 2024 09:44:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Restore system memory GGTT mappings
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 riana.tauro@intel.com
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241029003224.2257439-3-matthew.brost@intel.com>
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

On 29/10/2024 00:32, Matthew Brost wrote:
> GGTT mappings reside on the device and this state is lost during suspend
> / d3cold thus this state must be restored resume regardless if the BO is
> in system memory or VRAM.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I think this needs fixes?

> ---
>   drivers/gpu/drm/xe/xe_bo.c       | 14 +++++++++++---
>   drivers/gpu/drm/xe/xe_bo_evict.c |  1 -
>   2 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index bd747e53eb9b..6c8fd5ced2a2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -890,8 +890,8 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>   	if (WARN_ON(!xe_bo_is_pinned(bo)))
>   		return -EINVAL;
>   
> -	if (WARN_ON(!xe_bo_is_vram(bo)))
> -		return -EINVAL;
> +	if (!xe_bo_is_vram(bo))
> +		return 0;

In the suspend flow in xe_bo_evict_all() there is:

	if (!IS_DGFX(xe))
		return 0;

But seems like we now need this flow for igpu, so need to also drop that 
check?

>   
>   	if (bo->flags & XE_BO_FLAG_PINNED_WONTNEED) {
>   		ttm_bo_move_null(&bo->ttm, NULL);
> @@ -946,6 +946,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>   		.interruptible = false,
>   	};
>   	struct ttm_resource *new_mem;
> +	struct ttm_place *place = &(bo->placements[0]);
>   	int ret;
>   
>   	xe_bo_assert_held(bo);
> @@ -961,6 +962,9 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>   			return -EINVAL;
>   	}
>   
> +	if (!mem_type_is_vram(place->mem_type))
> +		return 0;
> +
>   	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
>   	if (ret)
>   		return ret;
> @@ -1814,7 +1818,10 @@ int xe_bo_pin(struct xe_bo *bo)
>   			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
>   				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
>   			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
> +		}
>   
> +		if (mem_type_is_vram(place->mem_type) ||
> +		    bo->flags & XE_BO_FLAG_GGTT) {
>   			spin_lock(&xe->pinned.lock);
>   			list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>   			spin_unlock(&xe->pinned.lock);
> @@ -1875,7 +1882,8 @@ void xe_bo_unpin(struct xe_bo *bo)
>   	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
>   		struct ttm_place *place = &(bo->placements[0]);
>   
> -		if (mem_type_is_vram(place->mem_type)) {
> +		if (mem_type_is_vram(place->mem_type) ||
> +		    bo->flags & XE_BO_FLAG_GGTT) {
>   			spin_lock(&xe->pinned.lock);
>   			xe_assert(xe, !list_empty(&bo->pinned_link));
>   			list_del_init(&bo->pinned_link);
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 541b49007d73..32043e1e5a86 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -159,7 +159,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>   		 * should setup the iosys map.
>   		 */
>   		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
> -		xe_assert(xe, xe_bo_is_vram(bo));
>   
>   		xe_bo_put(bo);
>   
