Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24A2EBFD37
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 11:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A670D10E40B;
	Mon, 13 Apr 2026 11:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gx6uVqqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D6510E40B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776080011; x=1807616011;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IAgRGK37Cdi3SlKRcboFC06W7LVmobnBIMd4z7OMl9Q=;
 b=Gx6uVqqQfKSekQ16KQYKJ2izkUHvBjEDaE+2FMWof242EvKliYMa1pNW
 BYuI1uii+2hNnQJnRS+RJfGoLbeI8KaED0wLlWyR2L/OxgIe+INIjUbva
 Pxr++Ku7qZYBRAj+rQifClPBrsbVaC2dmQkYV2FxFR696ass4L2byUaUo
 euUzJB266Tt2XUh1aoFe0dUOSSgdOQ89fDw9a+Z5udCGhaOBMkWYHkJpL
 IaMwQIhlqph7+8gvZfscqu7kvSrIl/QkqfmipoNm3r4zYv1vX/DYtNsWU
 Cs8OW1d3YQk3axAzYQD7uXbaRLHkaxq2R4t+Wz+eyS6uBruiwnKPUQjK9 w==;
X-CSE-ConnectionGUID: F+8vZwDRTGKiUC3RFm6b3A==
X-CSE-MsgGUID: z1jbgK2QS82eSaFsp4yD8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="94585501"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="94585501"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 04:33:31 -0700
X-CSE-ConnectionGUID: hpVunGu6Ruyl7hLLEo4gVA==
X-CSE-MsgGUID: Eby+B0kjSYi2SJDC3w3RaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="223276745"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.245.62])
 ([10.245.245.62])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 04:33:29 -0700
Message-ID: <e05865cb-a097-43af-a24e-2b9f2e561bb7@intel.com>
Date: Mon, 13 Apr 2026 12:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Convert stolen memory over to ttm_range_manager
To: Matthew Brost <matthew.brost@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20260410120601.3234709-2-sanjay.kumar.yadav@intel.com>
 <admhoW9DCLOWbwpN@gsse-cloud1.jf.intel.com>
 <admqdKYQRACRj2mf@gsse-cloud1.jf.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <admqdKYQRACRj2mf@gsse-cloud1.jf.intel.com>
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

On 11/04/2026 02:57, Matthew Brost wrote:
> On Fri, Apr 10, 2026 at 06:19:29PM -0700, Matthew Brost wrote:
>> On Fri, Apr 10, 2026 at 05:36:02PM +0530, Sanjay Yadav wrote:
>>> The stolen memory manager was sharing the gpu_buddy allocator backend
>>> with the VRAM manager. However, stolen memory has fundamentally
>>> different allocation patterns that make the buddy allocator a poor fit.
>>>
>>> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>>>    next power-of-two block size, a ~17MB request can fail even with
>>>    ~22MB free, because the free space is fragmented across non-fitting
>>>    power-of-two blocks.
>>
>>
>> This sounds like a problem in the buddy allocator, right?
>>
>> Shouldn’t the buddy, in this case, try to find enough blocks for 16MB
>> and then 1MB?
>>
>> Regardless of fragmentation, the buddy allocator should always be able
>> to construct the blocks in your example—unless I’m completely missing
>> something.
>>
>> Matt Auld is an expert; maybe he can chime in.
>>
>>> - Hardware restrictions prevent using the first 4K page of stolen for
>>>    certain allocations (e.g., FBC). The display code sets fpfn=1 to
>>>    enforce this, but when fpfn != 0, gpu_buddy enables
>>>    GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>>>    coalescing path, further reducing allocation success.
>>
>> Can we not just allocate a dummy allocation on stolen manager init which
>> reserves fpfn=0? Then release it on fini? Then display can safely pass in
>> fpfn=0?
>>
>>>
>>> This combination caused FBC compressed framebuffer (CFB) allocation
>>> failures on platforms like NVL/PTL. In case of NVL where stolen memory
>>> is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
>>> leaving ~22MB for subsequent allocations.
>>>
>>> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
>>
>> Wouldn't drm_mm just have different set of fragmentation problems?
>>
>> Simple example: We have 20M.
>>
>> node[0] = alloc(5M);	/* this lands on 0-5M) */
>> node[1] = alloc(5M);	/* this lands on 5-10M) */
>> node[2] = alloc(5M);	/* this lands on 10M-15M) */
>> node[3] = alloc(5M);	/* this lands on 15M-20M) */
>>
>> free(node[1]);
>> free(node[3]);
>>
>> /* Now we have 10M free at 5-10M, 15M-20M */
>>
>> node[4] = alloc(6M);	/* We fail as no 6M hole */
>>
>> Matt
>>
>>> manager for stolen memory. This reuses the TTM core's ttm_range_manager
>>> callbacks, avoiding duplicate implementations.
>>>
>>> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
>>> contiguous free hole after initial plane framebuffer allocation, and
>>> FBC successfully allocates its CFB from that region. The corresponding
>>> IGT was previously skipped and now passes.
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
> 
> I just read the above link. My initial response was based on a
> misunderstanding: I did not realize that stolen memory generally
> requires contiguous allocations, as this was not mentioned in the commit
> message. Please add this clarification.
> 
> Assuming stolen memory does indeed require contiguous allocations, then
> the buddy allocator is, in fact, a very poor fit.

I think at runtime (post probe) the only stolen memory allocations are 
FBC on dgpu. It looks like you just write the physical stolen 
address/offset to some display register, as per program_cfb(), so must 
be contig. And on igpu there is additional display-page-table (DPT) 
stuff, which is also contig, at the very least due to pin_map(). But 
with DPT you can also just fallback to system memory, which I don't 
think is possible with FBC.

> 
> I glanced at the code itself, and it looks sane enough. However, we
> should first align on the requirements for the stolen memory manager.
> 
> Matt
> 
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c             | 12 +++++-
>>>   drivers/gpu/drm/xe/xe_device_types.h   |  3 ++
>>>   drivers/gpu/drm/xe/xe_res_cursor.h     | 14 ++++++-
>>>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 55 +++++++++++---------------
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 11 +++---
>>>   5 files changed, 53 insertions(+), 42 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index a7c2dc7f224c..cf22cf8ff9f0 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -601,9 +601,17 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>>>   
>>>   static bool xe_ttm_resource_visible(struct ttm_resource *mem)
>>>   {
>>> -	struct xe_ttm_vram_mgr_resource *vres =
>>> -		to_xe_ttm_vram_mgr_resource(mem);
>>> +	struct xe_ttm_vram_mgr_resource *vres;
>>>   
>>> +	/*
>>> +	 * Stolen uses a range allocator (not buddy) and doesn't track
>>> +	 * used_visible_size like VRAM.  Actual CPU accessibility is
>>> +	 * gated by io_base in xe_ttm_stolen_io_mem_reserve().
>>> +	 */
>>> +	if (mem->mem_type == XE_PL_STOLEN)
>>> +		return true;
>>> +
>>> +	vres = to_xe_ttm_vram_mgr_resource(mem);
>>>   	return vres->used_visible_size == mem->size;
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 150c76b2acaf..ffb84659c413 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -42,6 +42,7 @@ struct xe_ggtt;
>>>   struct xe_i2c;
>>>   struct xe_pat_ops;
>>>   struct xe_pxp;
>>> +struct xe_ttm_stolen_mgr;
>>>   struct xe_vram_region;
>>>   
>>>   /**
>>> @@ -278,6 +279,8 @@ struct xe_device {
>>>   		struct ttm_resource_manager sys_mgr;
>>>   		/** @mem.sys_mgr: system memory shrinker. */
>>>   		struct xe_shrinker *shrinker;
>>> +		/** @mem.stolen_mgr: stolen memory manager. */
>>> +		struct xe_ttm_stolen_mgr *stolen_mgr;
>>>   	} mem;
>>>   
>>>   	/** @sriov: device level virtualization data */
>>> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> index 5f4ab08c0686..0522caafd89d 100644
>>> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
>>> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
>>> @@ -101,7 +101,15 @@ static inline void xe_res_first(struct ttm_resource *res,
>>>   	cur->mem_type = res->mem_type;
>>>   
>>>   	switch (cur->mem_type) {
>>> -	case XE_PL_STOLEN:
>>> +	case XE_PL_STOLEN: {
>>> +		/* res->start is in pages (ttm_range_manager). */
>>> +		cur->start = (res->start << PAGE_SHIFT) + start;
>>> +		cur->size = size;
>>> +		cur->remaining = size;
>>> +		cur->node = NULL;
>>> +		cur->mm = NULL;
>>> +		break;
>>> +	}
>>>   	case XE_PL_VRAM0:
>>>   	case XE_PL_VRAM1: {
>>>   		struct gpu_buddy_block *block;
>>> @@ -289,6 +297,10 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>>>   
>>>   	switch (cur->mem_type) {
>>>   	case XE_PL_STOLEN:
>>> +		/* Just advance within the contiguous region. */
>>> +		cur->start += size;
>>> +		cur->size = cur->remaining;
>>> +		break;
>>>   	case XE_PL_VRAM0:
>>>   	case XE_PL_VRAM1:
>>>   		start = size - cur->size;
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> index 27c9d72222cf..7e204d5e9cbe 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> @@ -19,16 +19,12 @@
>>>   #include "xe_device.h"
>>>   #include "xe_gt_printk.h"
>>>   #include "xe_mmio.h"
>>> -#include "xe_res_cursor.h"
>>>   #include "xe_sriov.h"
>>>   #include "xe_ttm_stolen_mgr.h"
>>> -#include "xe_ttm_vram_mgr.h"
>>>   #include "xe_vram.h"
>>>   #include "xe_wa.h"
>>>   
>>>   struct xe_ttm_stolen_mgr {
>>> -	struct xe_ttm_vram_mgr base;
>>> -
>>>   	/* PCI base offset */
>>>   	resource_size_t io_base;
>>>   	/* GPU base offset */
>>> @@ -37,12 +33,6 @@ struct xe_ttm_stolen_mgr {
>>>   	void __iomem *mapping;
>>>   };
>>>   
>>> -static inline struct xe_ttm_stolen_mgr *
>>> -to_stolen_mgr(struct ttm_resource_manager *man)
>>> -{
>>> -	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
>>> -}
>>> -
>>>   /**
>>>    * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU access
>>>    * stolen, can we then fallback to mapping through the GGTT.
>>> @@ -210,12 +200,19 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>>>   #endif
>>>   }
>>>   
>>> +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void *arg)
>>> +{
>>> +	struct xe_device *xe = to_xe_device(dev);
>>> +
>>> +	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
>>> +}
>>> +
>>>   int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>   {
>>>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>   	struct xe_ttm_stolen_mgr *mgr;
>>>   	u64 stolen_size, io_size;
>>> -	int err;
>>> +	int ret;
>>>   
>>>   	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>>>   	if (!mgr)
>>> @@ -244,12 +241,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>   	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>>   		io_size = stolen_size;
>>>   
>>> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
>>> -				     io_size, PAGE_SIZE);
>>> -	if (err) {
>>> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
>>> -		return err;
>>> -	}
>>> +	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
>>> +					 stolen_size >> PAGE_SHIFT);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	xe->mem.stolen_mgr = mgr;
>>>   
>>>   	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>>>   		    stolen_size);
>>> @@ -257,36 +254,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>>>   	if (io_size)
>>>   		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>>>   
>>> -	return 0;
>>> +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_stolen_mgr_fini, mgr);
>>>   }
>>>   
>>>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>>>   {
>>>   	struct xe_device *xe = xe_bo_device(bo);
>>> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>>> -	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
>>> -	struct xe_res_cursor cur;
>>> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>>   
>>>   	XE_WARN_ON(!mgr->io_base);
>>>   
>>>   	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>>>   		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>>>   
>>> -	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
>>> -	return mgr->io_base + cur.start;
>>> +	/* Range allocator: res->start is in pages. */
>>> +	return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + offset;
>>>   }
>>>   
>>>   static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
>>>   					       struct xe_ttm_stolen_mgr *mgr,
>>>   					       struct ttm_resource *mem)
>>>   {
>>> -	struct xe_res_cursor cur;
>>> -
>>>   	if (!mgr->io_base)
>>>   		return -EIO;
>>>   
>>> -	xe_res_first(mem, 0, 4096, &cur);
>>> -	mem->bus.offset = cur.start;
>>> +	/* Range allocator always produces contiguous allocations. */
>>> +	mem->bus.offset = mem->start << PAGE_SHIFT;
>>>   
>>>   	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
>>>   
>>> @@ -329,8 +322,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
>>>   
>>>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>>>   {
>>> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
>>> -	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? to_stolen_mgr(ttm_mgr) : NULL;
>>> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>>>   
>>>   	if (!mgr || !mgr->io_base)
>>>   		return -EIO;
>>> @@ -343,8 +335,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>>>   
>>>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
>>>   {
>>> -	struct xe_ttm_stolen_mgr *mgr =
>>> -		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
>>> -
>>> -	return mgr->stolen_base;
>>> +	return xe->mem.stolen_mgr->stolen_base;
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index 5fd0d5506a7e..79ef8e1b5e5c 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>>>   			   u64 default_page_size)
>>>   {
>>>   	struct ttm_resource_manager *man = &mgr->manager;
>>> +	const char *name;
>>>   	int err;
>>>   
>>> -	if (mem_type != XE_PL_STOLEN) {
>>> -		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
>>> -		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
>>> -		if (IS_ERR(man->cg))
>>> -			return PTR_ERR(man->cg);
>>> -	}
>>> +	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
>>> +	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
>>> +	if (IS_ERR(man->cg))
>>> +		return PTR_ERR(man->cg);
>>>   
>>>   	man->func = &xe_ttm_vram_mgr_func;
>>>   	mgr->mem_type = mem_type;
>>> -- 
>>> 2.52.0
>>>

