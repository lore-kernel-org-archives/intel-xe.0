Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067FFC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 10:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32A710E209;
	Tue, 15 Jul 2025 10:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K2lRh+jy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02B310E209
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752575568; x=1784111568;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JZ57VuBNTkzImkwVYksAAAW1Y+imC8YPHANXGgedqg0=;
 b=K2lRh+jyj6ad3rg8fvAsCSVNCzWvjZU229jMvt71GYU4YSVIfAxNub15
 j936tJ8cX14jXmfZ2c6mZOGoqv+fvYGowUloP28vTPIL689YvVDXL+nLh
 C7hKS7t8KQTPYSuA45WZilGjHYLC9YhfIWAQhkWWINjNWEtJKbLoJGC3S
 PyQCkQjbO0R2DuI8ZF3bPOyr+P+lRVwhT8Z0X8xDcC0YRij7H5gSGONor
 ZI00KCnnMMMCY0uLbEilZOfD1XMUquBDGB5vdGIo1RoqaDgeUYN9wtSOU
 JTHDjZmQPtspvgR3KlgqimLLpfVj8AqbMN/ml4IAug9rg2Rh+fM/daSrl Q==;
X-CSE-ConnectionGUID: 3Qs0hccDRxCbWBemnujl1g==
X-CSE-MsgGUID: iC3l9huRTd63gdr7F1V5iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58555741"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="58555741"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:32:48 -0700
X-CSE-ConnectionGUID: pydsTY4GToWvr+Z5xxSfbA==
X-CSE-MsgGUID: 2rjDJrroR9SAiJQxMTY79A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="188174772"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.193])
 ([10.245.244.193])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 03:32:48 -0700
Message-ID: <9b3fd3ce-851b-44e0-81b9-d1712aa13826@intel.com>
Date: Tue, 15 Jul 2025 11:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/xe: Implement clear VRAM on free
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com
References: <20250623151929.2422584-1-matthew.brost@intel.com>
 <20250623151929.2422584-5-matthew.brost@intel.com>
 <47e9d188-aa97-4eb1-a5cb-d4de3c944188@intel.com>
 <aHWWZksco/qfSQBT@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <aHWWZksco/qfSQBT@lstrano-desk.jf.intel.com>
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

On 15/07/2025 00:44, Matthew Brost wrote:
> On Fri, Jul 04, 2025 at 10:17:24AM +0100, Matthew Auld wrote:
>> On 23/06/2025 16:19, Matthew Brost wrote:
>>> Clearing on free should hide latency of BO clears on new user BO
>>> allocations.
>>>
>>> Implemented via calling xe_migrate_clear in release notify and updating
>>> iterator in xe_migrate_clear to skip cleared buddy blocks. Only user BOs
>>> cleared in release notify as kernel BOs could still be in use (e.g., PT
>>> BOs need to wait for dma-resv to be idle).
>>>
>>> v2:
>>>    - Update to new xe_migrate_clear arguments (Thomas)
>>>    - Wait on BOOKKEEP slots for clear onn free (Thomas)
>>>    - s/XE_MIGRATE_CLEAR_NON_DIRTY/XE_MIGRATE_CLEAR_FLAG_ON_FREE
>>>    - Do not requested clear memory in VRAM manager if BO as TT data (Auld)
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_bo.c           | 48 ++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_migrate.c      | 31 ++++++++++++------
>>>    drivers/gpu/drm/xe/xe_migrate.h      |  1 +
>>>    drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
>>>    drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  6 +++-
>>>    drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
>>>    6 files changed, 108 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 7a412121477e..900f67deef9d 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -1453,6 +1453,52 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>>>    	return locked;
>>>    }
>>> +static void xe_ttm_bo_release_clear(struct ttm_buffer_object *ttm_bo)
>>> +{
>>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>>> +	struct dma_fence *fence;
>>> +	int err, idx;
>>> +
>>> +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
>>> +
>>> +	if (ttm_bo->type != ttm_bo_type_device)
>>> +		return;
>>> +
>>> +	if (xe_device_wedged(xe))
>>> +		return;
>>> +
>>> +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo->resource->mem_type))
>>> +		return;
>>> +
>>> +	if (!drm_dev_enter(&xe->drm, &idx))
>>> +		return;
>>> +
>>> +	if (!xe_pm_runtime_get_if_active(xe))
>>> +		goto unbind;
>>> +
>>> +	err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
>>> +	if (err)
>>> +		goto put_pm;
>>> +
>>> +	fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo->resource->mem_type),
>>> +				 ttm_bo->resource, &ttm_bo->base._resv, NULL,
>>> +				 bo->size, XE_MIGRATE_CLEAR_FLAG_FULL |
>>> +				 XE_MIGRATE_CLEAR_FLAG_ON_FREE, &bo->ccs_cleared);
>>> +	if (XE_WARN_ON(IS_ERR(fence)))
>>
>> Should we chuck a warn for this? I think there might be some intr waits in
>> there which could legit trigger?
>>
> 
> Unless I'm missing something, nothing xe_migrate_clear in interruptable.
> All the locks are non-interruptable, same with waits. Also this should
> be a kernel contetxt, not interrutable user context, right?

I was looking in xe_bb_new(), I think I see some potential intr waits? I 
think we can get here via any bo_put, which could happen inside an ioctl?

> 
>>> +		goto put_pm;
>>> +
>>> +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
>>> +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
>>> +			   DMA_RESV_USAGE_KERNEL);
>>> +	dma_fence_put(fence);
>>> +
>>> +put_pm:
>>> +	xe_pm_runtime_put(xe);
>>> +unbind:
>>> +	drm_dev_exit(idx);
>>> +}
>>> +
>>>    static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>>>    {
>>>    	struct dma_resv_iter cursor;
>>> @@ -1497,6 +1543,8 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>>>    	}
>>>    	dma_fence_put(replacement);
>>> +	xe_ttm_bo_release_clear(ttm_bo);
>>> +
>>>    	dma_resv_unlock(ttm_bo->base.resv);
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>> index 18030f9613ae..7620f4eb8fb3 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -1067,7 +1067,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>    	struct xe_gt *gt = m->tile->primary_gt;
>>>    	struct xe_device *xe = gt_to_xe(gt);
>>>    	bool clear_only_system_ccs = false;
>>> -	struct dma_fence *fence = NULL;
>>> +	struct dma_fence *fence = dma_fence_get_stub();
>>>    	struct xe_res_cursor src_it;
>>>    	struct ttm_resource *src = dst;
>>>    	int err;
>>> @@ -1078,10 +1078,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>    	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
>>>    		clear_only_system_ccs = true;
>>> -	if (!clear_vram)
>>> +	if (!clear_vram) {
>>>    		xe_res_first_sg(sgt, 0, size, &src_it);
>>> -	else
>>> +	} else {
>>>    		xe_res_first(src, 0, size, &src_it);
>>> +		if (!(clear_flags & XE_MIGRATE_CLEAR_FLAG_ON_FREE))
>>> +			size -= xe_res_next_dirty(&src_it);
>>> +	}
>>>    	while (size) {
>>>    		u64 clear_L0_ofs;
>>> @@ -1128,6 +1131,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>    			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
>>>    				 &src_it, clear_L0, dst);
>>> +		if (clear_vram && !(clear_flags & XE_MIGRATE_CLEAR_FLAG_ON_FREE))
>>> +			size -= xe_res_next_dirty(&src_it);
>>> +
>>>    		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>>>    		update_idx = bb->len;
>>> @@ -1149,15 +1155,22 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>    		}
>>>    		xe_sched_job_add_migrate_flush(job, flush_flags);
>>> -		if (!fence) {
>>> +		if (fence == dma_fence_get_stub()) {
>>
>> Does this get() always have a matching put()? Say fence != stub?
>>
> 
> Maybe not, but I think that is ok given you don't want a dma-fence to be
> destroyed. This is a bit of backwwards checkout though as
> dma_fence_get_stub takes a spin_lock and increments a ref count. Let me
> rework this a bit.
> 
> Matt
> 
>>> +			enum dma_resv_usage usage =
>>> +			       (clear_flags & XE_MIGRATE_CLEAR_FLAG_ON_FREE) ?
>>> +			       DMA_RESV_USAGE_BOOKKEEP : DMA_RESV_USAGE_KERNEL;
>>> +
>>>    			/*
>>> -			 * There can't be anything userspace related at this
>>> -			 * point, so we just need to respect any potential move
>>> -			 * fences, which are always tracked as
>>> +			 * For initial clears, there can't be anything userspace
>>> +			 * related at this point, so we just need to respect any
>>> +			 * potential move fences, which are always tracked as
>>>    			 * DMA_RESV_USAGE_KERNEL.
>>> +			 *
>>> +			 * For clear on free need to respect all fences as
>>> +			 * memory could still be in use by the GPU which is
>>> +			 * tracked in DMA_RESV_USAGE_BOOKKEEP.
>>>    			 */
>>> -			err = xe_sched_job_add_deps(job, resv,
>>> -						    DMA_RESV_USAGE_KERNEL);
>>> +			err = xe_sched_job_add_deps(job, resv, usage);
>>>    			if (err)
>>>    				goto err_job;
>>>    		}
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
>>> index 04b3cd86ba90..104c61812ba1 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.h
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.h
>>> @@ -120,6 +120,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>>>    #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
>>>    #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
>>> +#define XE_MIGRATE_CLEAR_FLAG_ON_FREE		BIT(2)
>>>    #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
>>>    					XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
>>>    struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> index d1a403cfb628..630082e809ba 100644
>>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> @@ -315,6 +315,32 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>>>    	}
>>>    }
>>> +/**
>>> + * xe_res_next_dirty - advance the cursor to next dirty buddy block
>>> + *
>>> + * @cur: the cursor to advance
>>> + *
>>> + * Move the cursor until dirty buddy block is found.
>>> + *
>>> + * Return: Number of bytes cursor has been advanced
>>> + */
>>> +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
>>> +{
>>> +	struct drm_buddy_block *block = cur->node;
>>> +	u64 bytes = 0;
>>> +
>>> +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
>>> +		   cur->mem_type != XE_PL_VRAM1);
>>> +
>>> +	while (cur->remaining && drm_buddy_block_is_clear(block)) {
>>> +		bytes += cur->size;
>>> +		xe_res_next(cur, cur->size);
>>> +		block = cur->node;
>>> +	}
>>> +
>>> +	return bytes;
>>> +}
>>> +
>>>    /**
>>>     * xe_res_dma - return dma address of cursor at current position
>>>     *
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index 9e375a40aee9..838739e47815 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -84,6 +84,10 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>>    	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
>>>    		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>>> +	if (tbo->type == ttm_bo_type_device &&
>>> +	    !xe_bo_tt_has_data(ttm_to_xe_bo(tbo)))
>>> +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
>>> +
>>>    	if (WARN_ON(!vres->base.size)) {
>>>    		err = -EINVAL;
>>>    		goto error_fini;
>>> @@ -187,7 +191,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
>>>    	struct drm_buddy *mm = &mgr->mm;
>>>    	mutex_lock(&mgr->lock);
>>> -	drm_buddy_free_list(mm, &vres->blocks, 0);
>>> +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
>>>    	mgr->visible_avail += vres->used_visible_size;
>>>    	mutex_unlock(&mgr->lock);
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> index cc76050e376d..dfc0e6890b3c 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
>>> @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>>>    	return container_of(res, struct xe_ttm_vram_mgr_resource, base);
>>>    }
>>> +static inline void
>>> +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
>>> +{
>>> +	to_xe_ttm_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
>>> +}
>>> +
>>>    static inline struct xe_ttm_vram_mgr *
>>>    to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
>>>    {
>>

