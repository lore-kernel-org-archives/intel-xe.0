Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4830C7115C
	for <intel-xe@archiver.kernel.org>; Fri, 20 Jun 2025 13:08:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7000D10E22B;
	Fri, 20 Jun 2025 13:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5VVkDix";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1D510E22B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Jun 2025 13:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750424890; x=1781960890;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WuQKl5V/DbasJt/uMx4dQmdf2ZveEbo+3JNQNyh6C0s=;
 b=h5VVkDixD7skY5rJNwkjZhdZUTbN+1Z2KCI6b0hyuoN/S0l5UNB+1lXW
 dyUfc8E1HxcpFUWXIW2bLNGekz3g7+85NhHtYhxbleyPGxScotjNvRRd+
 f/78fBIC8rCGIhlSRXGecrP5mkBrv93nSeJj+nvQHYTw4WWnTZb6M1CNa
 ze88r4cfGle2YhYL9sLKr00D0zI3U3RIfAJPXo2dQelMct0aCjHdJdw07
 d0HRYMLfu4CsFvO4PslTROdeUFlmvfyFXYj8vhIw4cDeS2gP0PIO1oHqp
 YqBY0UBAW2yiY4BkVo0LlPY18CJuRLgJPjTHCbJl7fBVcWk7N66LSzKtZ w==;
X-CSE-ConnectionGUID: /pjWPxCTQnKnzhaPktZiQQ==
X-CSE-MsgGUID: Z8R+i/q4Q5us9PXYpOyUCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52563058"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="52563058"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:08:09 -0700
X-CSE-ConnectionGUID: Ju+aHL1mQsyIAuiFhRU2WA==
X-CSE-MsgGUID: cX9o+Mk7TbWhcsnfVCjD8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="151048237"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.64])
 ([10.245.245.64])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:08:07 -0700
Message-ID: <52e8452f-cad6-47c0-9a4c-0e7ff333641c@intel.com>
Date: Fri, 20 Jun 2025 14:08:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Implement clear VRAM on free
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20250611054235.3540936-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250611054235.3540936-1-matthew.brost@intel.com>
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

On 11/06/2025 06:42, Matthew Brost wrote:
> Clearing on free should hide latency of BO clears on new user BO
> allocations.
> 
> Implemented via calling xe_migrate_clear in release notify and updating
> iterator in xe_migrate_clear to skip cleared buddy blocks. Only user BOs
> cleared in release notify as kernel BOs could still be in use (e.g., PT
> BOs need to wait for dma-resv to be idle).
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_migrate.c      | 14 ++++++---
>   drivers/gpu/drm/xe/xe_migrate.h      |  1 +
>   drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  5 ++-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
>   6 files changed, 94 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021a..74470f4d418d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1434,6 +1434,51 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>   	return locked;
>   }
>   
> +static void xe_ttm_bo_release_clear(struct ttm_buffer_object *ttm_bo)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct dma_fence *fence;
> +	int err, idx;
> +
> +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> +
> +	if (ttm_bo->type != ttm_bo_type_device)
> +		return;
> +
> +	if (xe_device_wedged(xe))
> +		return;
> +
> +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo->resource->mem_type))
> +		return;
> +
> +	if (!drm_dev_enter(&xe->drm, &idx))
> +		return;
> +
> +	if (!xe_pm_runtime_get_if_active(xe))
> +		goto unbind;
> +
> +	err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> +	if (err)
> +		goto put_pm;
> +
> +	fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo->resource->mem_type),
> +				 ttm_to_xe_bo(ttm_bo), ttm_bo->resource,
> +				 XE_MIGRATE_CLEAR_FLAG_FULL |
> +				 XE_MIGRATE_CLEAR_NON_DIRTY);
> +	if (XE_WARN_ON(IS_ERR(fence)))
> +		goto put_pm;
> +
> +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> +			   DMA_RESV_USAGE_KERNEL);
> +	dma_fence_put(fence);
> +
> +put_pm:
> +	xe_pm_runtime_put(xe);
> +unbind:
> +	drm_dev_exit(idx);
> +}
> +
>   static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>   {
>   	struct dma_resv_iter cursor;
> @@ -1478,6 +1523,8 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>   	}
>   	dma_fence_put(replacement);
>   
> +	xe_ttm_bo_release_clear(ttm_bo);
> +
>   	dma_resv_unlock(ttm_bo->base.resv);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..39d7200cb366 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1063,7 +1063,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	struct xe_device *xe = gt_to_xe(gt);
>   	bool clear_only_system_ccs = false;
> -	struct dma_fence *fence = NULL;
> +	struct dma_fence *fence = dma_fence_get_stub();


>   	u64 size = bo->size;
>   	struct xe_res_cursor src_it;
>   	struct ttm_resource *src = dst;
> @@ -1075,10 +1075,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
>   		clear_only_system_ccs = true;
>   
> -	if (!clear_vram)
> +	if (!clear_vram) {
>   		xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &src_it);
> -	else
> +	} else {
>   		xe_res_first(src, 0, bo->size, &src_it);
> +		if (!(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> +			size -= xe_res_next_dirty(&src_it);
> +	}
>   
>   	while (size) {
>   		u64 clear_L0_ofs;
> @@ -1125,6 +1128,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
>   				 &src_it, clear_L0, dst);
>   
> +		if (clear_vram && !(clear_flags & XE_MIGRATE_CLEAR_NON_DIRTY))
> +			size -= xe_res_next_dirty(&src_it);
> +
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
>   
> @@ -1146,7 +1152,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		}
>   
>   		xe_sched_job_add_migrate_flush(job, flush_flags);
> -		if (!fence) {
> +		if (fence == dma_fence_get_stub()) {
>   			/*
>   			 * There can't be anything userspace related at this
>   			 * point, so we just need to respect any potential move
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..58a7b747ef11 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -118,6 +118,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>   
>   #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
>   #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> +#define XE_MIGRATE_CLEAR_NON_DIRTY		BIT(2)
>   #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
>   					XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
>   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index d1a403cfb628..630082e809ba 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -315,6 +315,32 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>   	}
>   }
>   
> +/**
> + * xe_res_next_dirty - advance the cursor to next dirty buddy block
> + *
> + * @cur: the cursor to advance
> + *
> + * Move the cursor until dirty buddy block is found.
> + *
> + * Return: Number of bytes cursor has been advanced
> + */
> +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> +{
> +	struct drm_buddy_block *block = cur->node;
> +	u64 bytes = 0;
> +
> +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> +		   cur->mem_type != XE_PL_VRAM1);
> +
> +	while (cur->remaining && drm_buddy_block_is_clear(block)) {
> +		bytes += cur->size;
> +		xe_res_next(cur, cur->size);
> +		block = cur->node;
> +	}
> +
> +	return bytes;
> +}
> +
>   /**
>    * xe_res_dma - return dma address of cursor at current position
>    *
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 9e375a40aee9..120046941c1e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -84,6 +84,9 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>   	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
> +	if (tbo->type == ttm_bo_type_device)
> +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;

Would it make sense to also somehow check if the bo has tt pages at this 
stage, and skip asking for cleared memory? If we have tt pages, that 
would mean we are moving to vram, so we are about to copy over the 
memory anyway, so ideally leave any pre-cleared pages for another user?

> +
>   	if (WARN_ON(!vres->base.size)) {
>   		err = -EINVAL;
>   		goto error_fini;
> @@ -187,7 +190,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>   	struct drm_buddy *mm = &mgr->mm;
>   
>   	mutex_lock(&mgr->lock);
> -	drm_buddy_free_list(mm, &vres->blocks, 0);
> +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>   	mgr->visible_avail += vres->used_visible_size;
>   	mutex_unlock(&mgr->lock);
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index cc76050e376d..dfc0e6890b3c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>   	return container_of(res, struct xe_ttm_vram_mgr_resource, base);
>   }
>   
> +static inline void
> +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> +{
> +	to_xe_ttm_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> +}
> +
>   static inline struct xe_ttm_vram_mgr *
>   to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
>   {

