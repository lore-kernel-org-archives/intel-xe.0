Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAEAC5320E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 09:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560D110E236;
	Tue, 27 Aug 2024 09:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFnH8uC9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9316610E236
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Aug 2024 09:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724751919; x=1756287919;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xCdh+lJk+5WmlRTL1Nvur6j4cV76wElceGPHkV/5gQ0=;
 b=lFnH8uC9/FfRc95d4EfaAkN9yc/Gtte2n6TaIzDayr3j2iP1QtHXMP7/
 WlsUdo0/dg+Bjm3j5V76KkvOssEdlf0o1sq+EONsdOoIszSc5R0hubBU6
 7AlXPCsICgvx4pj/4EGbaTpq+qnOOQdV/LqEqutYWCHkL9Fi9rEqqEnzK
 ByAZEsNECY6Cg+L0qTxMOOHLBmBI7ae1Y9zHfhin6kJ3Exu+H6TPMcPbd
 ciZN8nFRAcqgM86opN8VDIQX4oiyimzALoDWysQvEL2POiSE0VYFVQy4Y
 vZEHoXhXj7RtV8UyCd3iF0HF9505t0yLKHf61NRpvCJBorLG7IaYYxacw A==;
X-CSE-ConnectionGUID: QIMDvzwwTtuDDQSYbW2GJg==
X-CSE-MsgGUID: hLiXDg2yQne7SgrIgwmu4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="40688460"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="40688460"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:45:19 -0700
X-CSE-ConnectionGUID: z/rRqKWIT0mv5u5V0Ki2bA==
X-CSE-MsgGUID: qJshb3WbTOOqQ+GjsmNq4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63526023"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.32])
 ([10.245.192.32])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 02:45:17 -0700
Message-ID: <989f101b-270d-45cb-ace0-475f295c2365@linux.intel.com>
Date: Tue, 27 Aug 2024 11:45:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
To: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240822124244.10554-1-nirmoy.das@intel.com>
 <7645111403a453311b16ff2b11d49cb63a74518f.camel@linux.intel.com>
 <a20245c6-7628-470d-bd6e-4e719dbd198f@linux.intel.com>
 <e76049b03dca87599346ec1db3ac6bfec97efee3.camel@linux.intel.com>
 <e817dc4d-b26c-46af-81bc-3cf62597a88b@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <e817dc4d-b26c-46af-81bc-3cf62597a88b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 8/27/2024 11:04 AM, Matthew Auld wrote:
> On 26/08/2024 09:36, Thomas Hellström wrote:
>> On Mon, 2024-08-26 at 10:26 +0200, Nirmoy Das wrote:
>>> Hi Thomas,
>>>
>>> On 8/23/2024 11:38 AM, Thomas Hellström wrote:
>>>> Hi, Nirmoy,
>>>>
>>>> On Thu, 2024-08-22 at 14:42 +0200, Nirmoy Das wrote:
>>>>> Implement GPU clear-on-free for pooled system pages in Xe.
>>>>>
>>>>> Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
>>>>> ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU
>>>>> clear
>>>>> fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
>>>>>
>>>>> Clear-on-free is only relevant for pooled pages as driver needs
>>>>> to
>>>>> give
>>>>> back those pages. So do clear-on-free only for such BOs and keep
>>>>> doing
>>>>> clear-on-alloc for ttm_cached type BOs
>>>>>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>> While this would probably work, I don't immediately see the benefit
>>>> over CPU clearing, since we have no way of combining this with the
>>>> CCS
>>>> clear, right?
>>>
>>>
>>> If XE/ttm could do clear-on-free(data+CCS) with GPU all the time then
>>> I
>>> think we could
>>>
>>> skip ccs clearing on alloc, assuming only GPU access modifies a CCS
>>> state and on boot CCS region
>>>
>>> is zeroed. I think that can't be guaranteed so we have to clear ccs
>>> on
>>> alloc. I agree, there won't be much
>>>
>>> latency benefit of doing clear-on-free for ccs devices. I will still
>>> try
>>> to run some tests to validate it, I have done that for this RFC.
>>
>> OK, yes this would probably work. Do we need to clear all CCS on module
>> load or can we safely assume that no useful info is left in the CCS
>> memory at that time?
>
> Maybe another thing to check is if we can skip ccs clearing for wb, 
> assuming we don't already.

Still in my todo list.


> I think compression is always coh_none (not compatible with wb), 


Yes, HW treats such(1,2-way) access as compression-disabled.

> and I think that to copy the ccs directly would require mapping the 
> src with compression enabled.


Yes for igfx.


Regards,

Nirmoy

>
> I'm pretty sure that is the case, otherwire userptr/imported external 
> dma-buf would be an issue today, assuming user could manually copy the 
> uncleared ccs.
>
>>
>>>
>>>
>>> I've discussed this with Ron and it seems there is on going
>>> conversation
>>> if there is a way to avoid ccs clearing if data is zeroed.
>>>
>>> Let's see how that goes.
>>>
>>>
>>>>    So the clearing latency will most probably be increased,
>>>> but the bo releasing thread won't see that because the waiting for
>>>> clear is offloaded to the TTM delayed destroy mechanism.
>>>>
>>>> Also, once we've dropped the gem refcount to zero, the gem members
>>>> of
>>>> the object, including bo_move, are strictly not valid anymore and
>>>> shouldn't be used.
>>>
>>>
>>> Could you please  expand this? I am not seeing the connection between
>>> bo_move and refcount.
>>>
>>> Are you saying release_notify is not the right place to do this ?
>>
>> Yes. At release_notify, the gem refcount has dropped to zero, and we
>> don't allow calling bo_move at that point, as the driver might want to
>> do some cleanup in the gem_release before putting the last ttm_bo
>> reference.
>>
>> Thanks,
>> Thomas
>>
>>
>>>
>>>> If we want to try to improve freeing latency by offloading the
>>>> clearing
>>>> on free to a separate CPU thread, though, maybe we could discuss
>>>> with
>>>> Christian to always (or if a flag in the ttm device requests it)
>>>> take
>>>> the TTM delayed destruction path for bos with pooled pages, rather
>>>> than
>>>> to free them sync, something along the lines of:
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 320592435252..fca69ec1740d 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -271,7 +271,7 @@ static void ttm_bo_release(struct kref *kref)
>>>>                      if (!dma_resv_test_signaled(bo->base.resv,
>>>> DMA_RESV_USAGE_BOOKKEEP) ||
>>>> -                   (want_init_on_free() && (bo->ttm != NULL)) ||
>>>> +                   (bo->ttm && (want_init_on_free() || bo->ttm-
>>>>> caching != ttm_cached)) ||
>>>>                       bo->type == ttm_bo_type_sg ||
>>>>                       !dma_resv_trylock(bo->base.resv)) {
>>>>                           /* The BO is not idle, resurrect it for
>>>> delayed
>>>> destroy */
>>>>
>>>> Would ofc require some substantial proven latency gain, though.
>>>> Overall
>>>> system cpu usage would probably not improve.
>>>
>>>
>>> I will run some tests with the above change and get back.
>>>
>>>
>>> Thanks,
>>>
>>> Nirmoy
>>>
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_bo.c | 101
>>>>> +++++++++++++++++++++++++++++++++--
>>>>> -- 
>>>>>    1 file changed, 91 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>>>> b/drivers/gpu/drm/xe/xe_bo.c
>>>>> index 6ed0e1955215..e7bc74f8ae82 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>>>> @@ -283,6 +283,8 @@ struct xe_ttm_tt {
>>>>>        struct device *dev;
>>>>>        struct sg_table sgt;
>>>>>        struct sg_table *sg;
>>>>> +    bool sys_clear_on_free;
>>>>> +    bool sys_clear_on_alloc;
>>>>>    };
>>>>>       static int xe_tt_map_sg(struct ttm_tt *tt)
>>>>> @@ -401,8 +403,23 @@ static struct ttm_tt
>>>>> *xe_ttm_tt_create(struct
>>>>> ttm_buffer_object *ttm_bo,
>>>>>         * flag. Zeroed pages are only required for
>>>>> ttm_bo_type_device so
>>>>>         * unwanted data is not leaked to userspace.
>>>>>         */
>>>>> -    if (ttm_bo->type == ttm_bo_type_device && xe-
>>>>>> mem.gpu_page_clear_sys)
>>>>> -        page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>> +    if (ttm_bo->type == ttm_bo_type_device && xe-
>>>>>> mem.gpu_page_clear_sys) {
>>>>> +        /*
>>>>> +         * Non-pooled BOs are always clear on alloc when
>>>>> possible.
>>>>> +         * clear-on-free is not needed as there is no
>>>>> pool
>>>>> to give pages back.
>>>>> +         */
>>>>> +        if (caching == ttm_cached) {
>>>>> +            tt->sys_clear_on_alloc = true;
>>>>> +            tt->sys_clear_on_free = false;
>>>>> +        } else {
>>>>> +        /*
>>>>> +         * For pooled BO, clear-on-alloc is done by the
>>>>> CPU
>>>>> for now and
>>>>> +         * GPU will do clear on free when releasing the
>>>>> BO.
>>>>> +         */
>>>>> +            tt->sys_clear_on_alloc = false;
>>>>> +            tt->sys_clear_on_free = true;
>>>>> +        }
>>>>> +    }
>>>>>           err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags,
>>>>> caching,
>>>>> extra_pages);
>>>>>        if (err) {
>>>>> @@ -416,8 +433,10 @@ static struct ttm_tt
>>>>> *xe_ttm_tt_create(struct
>>>>> ttm_buffer_object *ttm_bo,
>>>>>    static int xe_ttm_tt_populate(struct ttm_device *ttm_dev,
>>>>> struct
>>>>> ttm_tt *tt,
>>>>>                      struct ttm_operation_ctx *ctx)
>>>>>    {
>>>>> +    struct xe_ttm_tt *xe_tt;
>>>>>        int err;
>>>>>    +    xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>>>>>        /*
>>>>>         * dma-bufs are not populated with pages, and the dma-
>>>>>         * addresses are set up when moved to XE_PL_TT.
>>>>> @@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct
>>>>> ttm_device
>>>>> *ttm_dev, struct ttm_tt *tt,
>>>>>            return 0;
>>>>>           /* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
>>>>> system pages */
>>>>> -    if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>>>>> +    if (xe_tt->sys_clear_on_alloc)
>>>>>            tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>>>>>           err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>>>>> @@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct
>>>>> ttm_device
>>>>> *ttm_dev, struct ttm_tt *tt,
>>>>>       static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev,
>>>>> struct
>>>>> ttm_tt *tt)
>>>>>    {
>>>>> +    struct xe_ttm_tt *xe_tt;
>>>>> +
>>>>> +    xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>>>>> +
>>>>>        if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>>>>>            return;
>>>>>           xe_tt_unmap_sg(tt);
>>>>>    +    /* Hint TTM pool that pages are already cleared */
>>>>> +    if (xe_tt->sys_clear_on_free)
>>>>> +        tt->page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>> +
>>>>>        return ttm_pool_free(&ttm_dev->pool, tt);
>>>>>    }
>>>>>    @@ -664,6 +691,7 @@ static int xe_bo_move(struct
>>>>> ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>        struct ttm_resource *old_mem = ttm_bo->resource;
>>>>>        u32 old_mem_type = old_mem ? old_mem->mem_type :
>>>>> XE_PL_SYSTEM;
>>>>>        struct ttm_tt *ttm = ttm_bo->ttm;
>>>>> +    struct xe_ttm_tt *xe_tt;
>>>>>        struct xe_migrate *migrate = NULL;
>>>>>        struct dma_fence *fence;
>>>>>        bool move_lacks_source;
>>>>> @@ -674,12 +702,13 @@ static int xe_bo_move(struct
>>>>> ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>        bool clear_system_pages;
>>>>>        int ret = 0;
>>>>>    +    xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>>>>> ttm);
>>>>>        /*
>>>>>         * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
>>>>> when
>>>>>         * moving to system as the bo doesn't have dma_mapping.
>>>>>         */
>>>>>        if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
>>>>> -        ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>> +        xe_tt->sys_clear_on_alloc = false;
>>>>>           /* Bo creation path, moving to system or TT. */
>>>>>        if ((!old_mem && ttm) && !handle_system_ccs) {
>>>>> @@ -703,10 +732,9 @@ static int xe_bo_move(struct
>>>>> ttm_buffer_object
>>>>> *ttm_bo, bool evict,
>>>>>        move_lacks_source = handle_system_ccs ? (!bo-
>>>>>> ccs_cleared)
>>>>> :
>>>>>                            (!mem_type_is_vr
>>>>> am(o
>>>>> ld_mem_type) && !tt_has_data);
>>>>>    -    clear_system_pages = ttm && (ttm->page_flags &
>>>>> TTM_TT_FLAG_CLEARED_ON_FREE);
>>>>> +    clear_system_pages = ttm && xe_tt->sys_clear_on_alloc;
>>>>>        needs_clear = (ttm && ttm->page_flags &
>>>>> TTM_TT_FLAG_ZERO_ALLOC) ||
>>>>> -        (!ttm && ttm_bo->type == ttm_bo_type_device) ||
>>>>> -        clear_system_pages;
>>>>> +        (!ttm && ttm_bo->type == ttm_bo_type_device) ||
>>>>> clear_system_pages;
>>>>>           if (new_mem->mem_type == XE_PL_TT) {
>>>>>            ret = xe_tt_map_sg(ttm);
>>>>> @@ -1028,10 +1056,47 @@ static bool
>>>>> xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>>>>>        return locked;
>>>>>    }
>>>>>    +static struct dma_fence *xe_ttm_bo_clear_on_free(struct
>>>>> ttm_buffer_object *ttm_bo)
>>>>> +{
>>>>> +    struct xe_bo *bo  = ttm_to_xe_bo(ttm_bo);
>>>>> +    struct xe_device *xe = xe_bo_device(bo);
>>>>> +    struct xe_migrate *migrate;
>>>>> +    struct xe_ttm_tt *xe_tt;
>>>>> +    struct dma_fence *clear_fence;
>>>>> +
>>>>> +    /* return early if nothing to clear */
>>>>> +    if (!ttm_bo->ttm)
>>>>> +        return NULL;
>>>>> +
>>>>> +    xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>>>>> ttm);
>>>>> +    /* return early if nothing to clear */
>>>>> +    if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
>>>>> +        return NULL;
>>>>> +
>>>>> +    if (XE_WARN_ON(!xe_tt->sg))
>>>>> +        return NULL;
>>>>> +
>>>>> +    if (bo->tile)
>>>>> +        migrate = bo->tile->migrate;
>>>>> +    else
>>>>> +        migrate = xe->tiles[0].migrate;
>>>>> +
>>>>> +    xe_assert(xe, migrate);
>>>>> +
>>>>> +    clear_fence = xe_migrate_clear(migrate, bo, bo-
>>>>>> ttm.resource,
>>>>> +
>>>>> XE_MIGRATE_CLEAR_FLAG_FULL);
>>>>> +    if (IS_ERR(clear_fence))
>>>>> +        return NULL;
>>>>> +
>>>>> +    xe_tt->sys_clear_on_free = false;
>>>>> +
>>>>> +    return clear_fence;
>>>>> +}
>>>>> +
>>>>>    static void xe_ttm_bo_release_notify(struct ttm_buffer_object
>>>>> *ttm_bo)
>>>>>    {
>>>>>        struct dma_resv_iter cursor;
>>>>> -    struct dma_fence *fence;
>>>>> +    struct dma_fence *clear_fence, *fence;
>>>>>        struct dma_fence *replacement = NULL;
>>>>>        struct xe_bo *bo;
>>>>>    @@ -1041,15 +1106,31 @@ static void
>>>>> xe_ttm_bo_release_notify(struct
>>>>> ttm_buffer_object *ttm_bo)
>>>>>        bo = ttm_to_xe_bo(ttm_bo);
>>>>>        xe_assert(xe_bo_device(bo), !(bo->created &&
>>>>> kref_read(&ttm_bo->base.refcount)));
>>>>>    +    clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
>>>>> +
>>>>>        /*
>>>>>         * Corner case where TTM fails to allocate memory and
>>>>> this
>>>>> BOs resv
>>>>>         * still points the VMs resv
>>>>>         */
>>>>> -    if (ttm_bo->base.resv != &ttm_bo->base._resv)
>>>>> +    if (ttm_bo->base.resv != &ttm_bo->base._resv) {
>>>>> +        if (clear_fence)
>>>>> +            dma_fence_wait(clear_fence, false);
>>>>>            return;
>>>>> +    }
>>>>>    -    if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
>>>>> +    if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
>>>>> +        if (clear_fence)
>>>>> +            dma_fence_wait(clear_fence, false);
>>>>>            return;
>>>>> +    }
>>>>> +
>>>>> +    if (clear_fence) {
>>>>> +        if (dma_resv_reserve_fences(ttm_bo->base.resv,
>>>>> 1))
>>>>> +            dma_fence_wait(clear_fence, false);
>>>>> +        else
>>>>> +            dma_resv_add_fence(ttm_bo->base.resv,
>>>>> clear_fence,
>>>>> +
>>>>> DMA_RESV_USAGE_KERNEL);
>>>>> +    }
>>>>>           /*
>>>>>         * Scrub the preempt fences if any. The unbind fence is
>>>>> already
>>
