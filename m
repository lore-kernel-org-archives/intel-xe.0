Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E588C5472D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Aug 2024 08:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECF110E4D9;
	Wed, 28 Aug 2024 08:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaKPzgGp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5550D10E4D9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Aug 2024 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724833481; x=1756369481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9GQ30QZPO/CVzJ/KYP/Icx7kHNpPPU38N2OgQxMwda0=;
 b=CaKPzgGpvC61se9vlDfn/Tn1vp/Dlkk+WiL9wOMF87h86ow3a+dC8fgp
 H/NJiA+m/uailSCglQnsmUPntEX0uL4Q4O921LrOMfWk3nppyCxPRSHa2
 JwkpmCffIGzU1qpoPwSD8mtNBs8iCmgyCendaP2rKTPnx48ffQiaOX6CT
 aTvNffVHVejxM9RKg6VyuIHv701KvQfhjJoo/iE5I5BFVEpjrpUzI9Bvu
 4NNmluO+RTe5unxHHvsrU7iE2XOt+Uby9t/DBJw4Z3nCr3JMRhvnSnheg
 MBs8ErSIXU8uYZTViLQRszV+VcfSd7D3oPr9U+CDKYq9q8OuzKLIwWRW+ w==;
X-CSE-ConnectionGUID: Cx0ztcOHQJyjHuzfvVTYPA==
X-CSE-MsgGUID: cDyQYyScQ+OGgyfSPwY5Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="22871146"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="22871146"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:24:41 -0700
X-CSE-ConnectionGUID: lSQwTnmWR+O97/fxMF8wrw==
X-CSE-MsgGUID: XGoWEbrCSv+6l2kxw1C3Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; d="scan'208";a="62989990"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.103])
 ([10.245.192.103])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 01:24:39 -0700
Message-ID: <3f06394d-6db1-404a-adaa-e6ed7bedf0b0@linux.intel.com>
Date: Wed, 28 Aug 2024 10:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/xe/lnl: Offload system clear page
 activity to GPU"
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240827154910.24841-1-nirmoy.das@intel.com>
 <20240827154910.24841-2-nirmoy.das@intel.com>
 <Zs4twWpSuu2yHqHO@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <Zs4twWpSuu2yHqHO@DUT025-TGLU.fm.intel.com>
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


On 8/27/2024 9:49 PM, Matthew Brost wrote:
> On Tue, Aug 27, 2024 at 05:49:10PM +0200, Nirmoy Das wrote:
>> This optimization relied on having to clear CCS on allocations.
>> If there is no need to clear CCS on allocations then this would mostly
>> help in reducing CPU utilization.
>>
>> Revert this patch because of:
>> 1 Currently Xe can't do clear on free and using a invalid ttm flag,
>> TTM_TT_FLAG_CLEARED_ON_FREE which could poison global ttm pool on
>> multi-device setup.
>>
>> 2 BO with WB caching type can't have compression enabled so there
>> is no need to do clear CCS for such allocation. Reducing CPU
>> utilization is a plus but latency is more important.
>>
>> Without this patch:
>> UsmMemoryAllocation(api=l0 type=Host size=4KB)  113.1 us
>> UsmMemoryAllocation(api=l0 type=Host size=1GB)  91452.6 us
>> 13.93% api_overhead_be  [kernel.kallsyms] [k] pages_are_mergeable
>> 7.59%  api_overhead_be  [kernel.kallsyms] [k] __lock_acquire
>> 3.86%  api_overhead_be  [kernel.kallsyms] [k] lock_is_held_type
>> 3.39%  api_overhead_be  [kernel.kallsyms] [k] rcu_is_watching
>> 3.37%  api_overhead_be  [xe]              [k] emit_pte
>>
>> With this patch:
>> UsmMemoryAllocation(api=l0 type=Host size=4KB) 91.7 us
>> UsmMemoryAllocation(api=l0 type=Host size=1GB) 89486.5 us
>> 91.86%  api_overhead_be [kernel.kallsyms [k] clear_page_erms
>> 1.81%  api_overhead_be  [kernel.kallsyms [k] pages_are_mergeable
>> 0.99%  api_overhead_be  [kernel.kallsyms [k] get_page_from_freelist
>> 0.63%  api_overhead_be  [kernel.kallsyms [k] __free_pages_ok
>> 0.50%  api_overhead_be  [kernel.kallsyms [k] __lock_acquire
>>
> Cool stats. How did you collect these. I'll likely need to collect
> similar stats very soon for some of the working I'm doing.


I am using https://github.com/intel/compute-benchmarks along with perf tool.

This also needs NEO libs, so I generally pick a taskML of the latest NEO 
build and then compile above.

>
>> For larger memory the delta is very low so it is likely worth
>> doing gpu based system page clear that can be reconsidered in the
>> future.
>>
>> This reverts commit 23683061805be368c8d1c7e7ff52abc470cac275 with
>> minor conflict fixes.
>>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> Anyways:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>


Thanks,

Nirmoy

>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 26 ++------------------------
>>   drivers/gpu/drm/xe/xe_device_types.h |  2 --
>>   drivers/gpu/drm/xe/xe_ttm_sys_mgr.c  | 12 ------------
>>   3 files changed, 2 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 24701272e3af..fd4b2b2dfd8d 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -397,14 +397,6 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>   		caching = ttm_uncached;
>>   	}
>>   
>> -	/*
>> -	 * If the device can support gpu clear system pages then set proper ttm
>> -	 * flag. Zeroed pages are only required for ttm_bo_type_device so
>> -	 * unwanted data is not leaked to userspace.
>> -	 */
>> -	if (ttm_bo->type == ttm_bo_type_device && xe->mem.gpu_page_clear_sys)
>> -		page_flags |= TTM_TT_FLAG_CLEARED_ON_FREE;
>> -
>>   	/* compression is not allowed for cached BO so ccs clear can be skipped. */
>>   	tt->skip_ccs_clear = caching == ttm_cached;
>>   	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
>> @@ -428,10 +420,6 @@ static int xe_ttm_tt_populate(struct ttm_device *ttm_dev, struct ttm_tt *tt,
>>   	if (tt->page_flags & TTM_TT_FLAG_EXTERNAL)
>>   		return 0;
>>   
>> -	/* Clear TTM_TT_FLAG_ZERO_ALLOC when GPU is set to clear system pages */
>> -	if (tt->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE)
>> -		tt->page_flags &= ~TTM_TT_FLAG_ZERO_ALLOC;
>> -
>>   	err = ttm_pool_alloc(&ttm_dev->pool, tt, ctx);
>>   	if (err)
>>   		return err;
>> @@ -677,16 +665,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>>   				  ttm && ttm_tt_is_populated(ttm) &&
>>   				  !xe_tt->skip_ccs_clear) ? true : false;
>> -	bool clear_system_pages;
>>   	int ret = 0;
>>   
>> -	/*
>> -	 * Clear TTM_TT_FLAG_CLEARED_ON_FREE on bo creation path when
>> -	 * moving to system as the bo doesn't have dma_mapping.
>> -	 */
>> -	if (!old_mem && ttm && !ttm_tt_is_populated(ttm))
>> -		ttm->page_flags &= ~TTM_TT_FLAG_CLEARED_ON_FREE;
>> -
>>   	/* Bo creation path, moving to system or TT. */
>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>   		if (new_mem->mem_type == XE_PL_TT)
>> @@ -709,10 +689,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
>>   						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>>   
>> -	clear_system_pages = ttm && (ttm->page_flags & TTM_TT_FLAG_CLEARED_ON_FREE);
>>   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>> -		(!ttm && ttm_bo->type == ttm_bo_type_device) ||
>> -		clear_system_pages;
>> +		(!ttm && ttm_bo->type == ttm_bo_type_device);
>>   
>>   	if (new_mem->mem_type == XE_PL_TT) {
>>   		ret = xe_tt_map_sg(ttm);
>> @@ -824,7 +802,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		if (move_lacks_source) {
>>   			u32 flags = 0;
>>   
>> -			if (mem_type_is_vram(new_mem->mem_type) || clear_system_pages)
>> +			if (mem_type_is_vram(new_mem->mem_type))
>>   				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
>>   			else if (handle_system_ccs)
>>   				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 4ecd620921a3..e73fb0c23932 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -333,8 +333,6 @@ struct xe_device {
>>   		struct xe_mem_region vram;
>>   		/** @mem.sys_mgr: system TTM manager */
>>   		struct ttm_resource_manager sys_mgr;
>> -		/** @mem.gpu_page_clear_sys: clear system pages offloaded to GPU */
>> -		bool gpu_page_clear_sys;
>>   	} mem;
>>   
>>   	/** @sriov: device level virtualization data */
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> index e0ac20f20758..9844a8edbfe1 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_sys_mgr.c
>> @@ -117,17 +117,5 @@ int xe_ttm_sys_mgr_init(struct xe_device *xe)
>>   	ttm_resource_manager_init(man, &xe->ttm, gtt_size >> PAGE_SHIFT);
>>   	ttm_set_driver_manager(&xe->ttm, XE_PL_TT, man);
>>   	ttm_resource_manager_set_used(man, true);
>> -
>> -	/*
>> -	 * On iGFX device with flat CCS, we clear CCS metadata, let's extend that
>> -	 * and use GPU to clear pages as well.
>> -	 *
>> -	 * Disable this when init_on_free and/or init_on_alloc is on to avoid double
>> -	 * zeroing pages with CPU and GPU.
>> -	 */
>> -	if (xe_device_has_flat_ccs(xe) && !IS_DGFX(xe) &&
>> -	    !want_init_on_alloc(GFP_USER) && !want_init_on_free())
>> -		xe->mem.gpu_page_clear_sys = true;
>> -
>>   	return drmm_add_action_or_reset(&xe->drm, ttm_sys_mgr_fini, xe);
>>   }
>> -- 
>> 2.42.0
>>
