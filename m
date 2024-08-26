Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C6C5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 08:26:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6120F10E132;
	Mon, 26 Aug 2024 08:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxtU6n7c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC5810E132
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Aug 2024 08:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724660795; x=1756196795;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S1z0if+sMW30uCibolbhIiQRgbqKM87at1D2MTe8j90=;
 b=kxtU6n7cPuxUpobol4euwu9gXydkJ7UHJLGKZjR1G87WwJosuS2/wdD7
 N0okHy7SwMWqP6QW58vQVPaOa02267GpuMiFckz9/PYslNkcOZDDgGMlg
 dIXd5rGzpaRFTdJtcKm031y8L8NAkHoVK0jWItd56cPyPJEwWfMWL7uKk
 bYGk+dPwQJjj8s2jl0UKcLLPfRKR+pbtyH9mY+/3RrTJ+rBn1BrDRgltH
 Fc/pc6NKcrwhuQy+KONi+QRqjFvdZWUgRj39KceoENvQScTnP8LxwepFw
 bICEyiCLZkdwNApU4NgSSXQuY046o/rsIbl024GQDBa71OZSRsnyE7Baz g==;
X-CSE-ConnectionGUID: a+jqMo1PRA6XAKgXKtGezw==
X-CSE-MsgGUID: Jp2lkUGgQxeHOv18q3PEMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="23196895"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="23196895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 01:26:30 -0700
X-CSE-ConnectionGUID: UEUp9ZSDSyOmTgKQz2KQJQ==
X-CSE-MsgGUID: M0rW2U3FSwejEb+IgjUABw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62272574"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.24.124])
 ([10.246.24.124])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 01:26:28 -0700
Message-ID: <a20245c6-7628-470d-bd6e-4e719dbd198f@linux.intel.com>
Date: Mon, 26 Aug 2024 10:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/xe/lnl: Implement clear-on-free for pooled BOs
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240822124244.10554-1-nirmoy.das@intel.com>
 <7645111403a453311b16ff2b11d49cb63a74518f.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <7645111403a453311b16ff2b11d49cb63a74518f.camel@linux.intel.com>
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

Hi Thomas,

On 8/23/2024 11:38 AM, Thomas Hellström wrote:
> Hi, Nirmoy,
>
> On Thu, 2024-08-22 at 14:42 +0200, Nirmoy Das wrote:
>> Implement GPU clear-on-free for pooled system pages in Xe.
>>
>> Ensure proper use of TTM_TT_FLAG_CLEARED_ON_FREE by leveraging
>> ttm_device_funcs.release_notify() for GPU clear-on-free. If GPU clear
>> fails, xe_ttm_tt_unpopulate() will fallback to CPU clear.
>>
>> Clear-on-free is only relevant for pooled pages as driver needs to
>> give
>> back those pages. So do clear-on-free only for such BOs and keep
>> doing
>> clear-on-alloc for ttm_cached type BOs
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> While this would probably work, I don't immediately see the benefit
> over CPU clearing, since we have no way of combining this with the CCS
> clear, right?


If XE/ttm could do clear-on-free(data+CCS) with GPU all the time then I 
think we could

skip ccs clearing on alloc, assuming only GPU access modifies a CCS 
state and on boot CCS region

is zeroed. I think that can't be guaranteed so we have to clear ccs on 
alloc. I agree, there won't be much

latency benefit of doing clear-on-free for ccs devices. I will still try 
to run some tests to validate it, I have done that for this RFC.


I've discussed this with Ron and it seems there is on going conversation 
if there is a way to avoid ccs clearing if data is zeroed.

Let's see how that goes.


>   So the clearing latency will most probably be increased,
> but the bo releasing thread won't see that because the waiting for
> clear is offloaded to the TTM delayed destroy mechanism.
>
> Also, once we've dropped the gem refcount to zero, the gem members of
> the object, including bo_move, are strictly not valid anymore and
> shouldn't be used.


Could you please  expand this? I am not seeing the connection between 
bo_move and refcount.

Are you saying release_notify is not the right place to do this ?

> If we want to try to improve freeing latency by offloading the clearing
> on free to a separate CPU thread, though, maybe we could discuss with
> Christian to always (or if a flag in the ttm device requests it) take
> the TTM delayed destruction path for bos with pooled pages, rather than
> to free them sync, something along the lines of:
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
> b/drivers/gpu/drm/ttm/ttm_bo.c
> index 320592435252..fca69ec1740d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -271,7 +271,7 @@ static void ttm_bo_release(struct kref *kref)
>   
>                  if (!dma_resv_test_signaled(bo->base.resv,
>                                              DMA_RESV_USAGE_BOOKKEEP) ||
> -                   (want_init_on_free() && (bo->ttm != NULL)) ||
> +                   (bo->ttm && (want_init_on_free() || bo->ttm-
>> caching != ttm_cached)) ||
>                      bo->type == ttm_bo_type_sg ||
>                      !dma_resv_trylock(bo->base.resv)) {
>                          /* The BO is not idle, resurrect it for delayed
> destroy */
>
> Would ofc require some substantial proven latency gain, though. Overall
> system cpu usage would probably not improve.


I will run some tests with the above change and get back.


Thanks,

Nirmoy

>
> /Thomas
>
>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 101 +++++++++++++++++++++++++++++++++--
>> --
>>   1 file changed, 91 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 6ed0e1955215..e7bc74f8ae82 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -283,6 +283,8 @@ struct xe_ttm_tt {
>>   	struct device *dev;
>>   	struct sg_table sgt;
>>   	struct sg_table *sg;
>> +	bool sys_clear_on_free;
>> +	bool sys_clear_on_alloc;
>>   };
>>   
>>   static int xe_tt_map_sg(struct ttm_tt *tt)
>> @@ -401,8 +403,23 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>> ttm_buffer_object *ttm_bo,
>>   	 * flag. Zeroed pages are only required for
>> ttm_bo_type_device so
>>   	 * unwanted data is not leaked to userspace.
>>   	 */
>> -	if (ttm_bo->type == ttm_bo_type_device && xe-
>>> mem.gpu_page_clear_sys)
>> -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>> +	if (ttm_bo->type == ttm_bo_type_device && xe-
>>> mem.gpu_page_clear_sys) {
>> +		/*
>> +		 * Non-pooled BOs are always clear on alloc when
>> possible.
>> +		 * clear-on-free is not needed as there is no pool
>> to give pages back.
>> +		 */
>> +		if (caching == ttm_cached) {
>> +			tt->sys_clear_on_alloc = true;
>> +			tt->sys_clear_on_free = false;
>> +		} else {
>> +		/*
>> +		 * For pooled BO, clear-on-alloc is done by the CPU
>> for now and
>> +		 * GPU will do clear on free when releasing the BO.
>> +		 */
>> +			tt->sys_clear_on_alloc = false;
>> +			tt->sys_clear_on_free = true;
>> +		}
>> +	}
>>   
>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching,
>> extra_pages);
>>   	if (err) {
>> @@ -416,8 +433,10 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>> ttm_buffer_object *ttm_bo,
>>   static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct
>> ttm_tt *tt,
>>   			      struct ttm_operation_ctx *ctx)
>>   {
>> +	struct xe_ttm_tt *xe_tt;
>>   	int err;
>>   
>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>>   	/*
>>   	 * dma-bufs are not populated with pages, and the dma-
>>   	 * addresses are set up when moved to XE_PL_TT.
>> @@ -426,7 +445,7 @@ static int xe_ttm_tt_populate(struct ttm_device
>> *ttm_dev, struct ttm_tt *tt,
>>   		return 0;
>>   
>>   	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear
>> system pages */
>> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>> +	if (xe_tt->sys_clear_on_alloc)
>>   		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>>   
>>   	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>> @@ -438,11 +457,19 @@ static int xe_ttm_tt_populate(struct ttm_device
>> *ttm_dev, struct ttm_tt *tt,
>>   
>>   static void xe_ttm_tt_unpopulate(struct ttm_device *ttm_dev, struct
>> ttm_tt *tt)
>>   {
>> +	struct xe_ttm_tt *xe_tt;
>> +
>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>> +
>>   	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>>   		return;
>>   
>>   	xe_tt_unmap_sg(tt);
>>   
>> +	/* Hint TTM pool that pages are already cleared */
>> +	if (xe_tt->sys_clear_on_free)
>> +		tt->page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>> +
>>   	return ttm_pool_free(&ttm_dev->pool, tt);
>>   }
>>   
>> @@ -664,6 +691,7 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   	struct ttm_resource *old_mem = ttm_bo->resource;
>>   	u32 old_mem_type = old_mem ? old_mem->mem_type :
>> XE_PL_SYSTEM;
>>   	struct ttm_tt *ttm = ttm_bo->ttm;
>> +	struct xe_ttm_tt *xe_tt;
>>   	struct xe_migrate *migrate = NULL;
>>   	struct dma_fence *fence;
>>   	bool move_lacks_source;
>> @@ -674,12 +702,13 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   	bool clear_system_pages;
>>   	int ret = 0;
>>   
>> +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
>>   	/*
>>   	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path
>> when
>>   	 * moving to system as the bo doesn't have dma_mapping.
>>   	 */
>>   	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
>> -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>> +		xe_tt->sys_clear_on_alloc = false;
>>   
>>   	/* Bo creation path, moving to system or TT. */
>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>> @@ -703,10 +732,9 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)
>> :
>>   						(!mem_type_is_vram(o
>> ld_mem_type) && !tt_has_data);
>>   
>> -	clear_system_pages = ttm && (ttm->page_flags &
>> TTM_TT_FLAG_CLEARED_ON_FREE);
>> +	clear_system_pages = ttm && xe_tt->sys_clear_on_alloc;
>>   	needs_clear = (ttm && ttm->page_flags &
>> TTM_TT_FLAG_ZERO_ALLOC) ||
>> -		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>> -		clear_system_pages;
>> +		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>> clear_system_pages;
>>   
>>   	if (new_mem->mem_type == XE_PL_TT) {
>>   		ret = xe_tt_map_sg(ttm);
>> @@ -1028,10 +1056,47 @@ static bool
>> xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>>   	return locked;
>>   }
>>   
>> +static struct dma_fence *xe_ttm_bo_clear_on_free(struct
>> ttm_buffer_object *ttm_bo)
>> +{
>> +	struct xe_bo *bo  = ttm_to_xe_bo(ttm_bo);
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +	struct xe_migrate *migrate;
>> +	struct xe_ttm_tt *xe_tt;
>> +	struct dma_fence *clear_fence;
>> +
>> +	/* return early if nothing to clear */
>> +	if (!ttm_bo->ttm)
>> +		return NULL;
>> +
>> +	xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt, ttm);
>> +	/* return early if nothing to clear */
>> +	if (!xe_tt->sys_clear_on_free || !bo->ttm.resource)
>> +		return NULL;
>> +
>> +	if (XE_WARN_ON(!xe_tt->sg))
>> +		return NULL;
>> +
>> +	if (bo->tile)
>> +		migrate = bo->tile->migrate;
>> +	else
>> +		migrate = xe->tiles[0].migrate;
>> +
>> +	xe_assert(xe, migrate);
>> +
>> +	clear_fence = xe_migrate_clear(migrate, bo, bo-
>>> ttm.resource,
>> +				       XE_MIGRATE_CLEAR_FLAG_FULL);
>> +	if (IS_ERR(clear_fence))
>> +		return NULL;
>> +
>> +	xe_tt->sys_clear_on_free = false;
>> +
>> +	return clear_fence;
>> +}
>> +
>>   static void xe_ttm_bo_release_notify(struct ttm_buffer_object
>> *ttm_bo)
>>   {
>>   	struct dma_resv_iter cursor;
>> -	struct dma_fence *fence;
>> +	struct dma_fence *clear_fence, *fence;
>>   	struct dma_fence *replacement = NULL;
>>   	struct xe_bo *bo;
>>   
>> @@ -1041,15 +1106,31 @@ static void xe_ttm_bo_release_notify(struct
>> ttm_buffer_object *ttm_bo)
>>   	bo = ttm_to_xe_bo(ttm_bo);
>>   	xe_assert(xe_bo_device(bo), !(bo->created &&
>> kref_read(&ttm_bo->base.refcount)));
>>   
>> +	clear_fence = xe_ttm_bo_clear_on_free(ttm_bo);
>> +
>>   	/*
>>   	 * Corner case where TTM fails to allocate memory and this
>> BOs resv
>>   	 * still points the VMs resv
>>   	 */
>> -	if (ttm_bo->base.resv != &ttm_bo->base._resv)
>> +	if (ttm_bo->base.resv != &ttm_bo->base._resv) {
>> +		if (clear_fence)
>> +			dma_fence_wait(clear_fence, false);
>>   		return;
>> +	}
>>   
>> -	if (!xe_ttm_bo_lock_in_destructor(ttm_bo))
>> +	if (!xe_ttm_bo_lock_in_destructor(ttm_bo)) {
>> +		if (clear_fence)
>> +			dma_fence_wait(clear_fence, false);
>>   		return;
>> +	}
>> +
>> +	if (clear_fence) {
>> +		if (dma_resv_reserve_fences(ttm_bo->base.resv, 1))
>> +			dma_fence_wait(clear_fence, false);
>> +		else
>> +			dma_resv_add_fence(ttm_bo->base.resv,
>> clear_fence,
>> +					   DMA_RESV_USAGE_KERNEL);
>> +	}
>>   
>>   	/*
>>   	 * Scrub the preempt fences if any. The unbind fence is
>> already
