Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD81EDEC7B
	for <intel-xe@archiver.kernel.org>; Wed, 13 Sep 2023 15:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6FA10E465;
	Wed, 13 Sep 2023 15:50:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C2910E47D
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Sep 2023 15:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694620207; x=1726156207;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+TibWTKRrCXOvPqYJwZOhUeHHfnG183+msIEMEqgJDw=;
 b=ae9dRDCq7I7fn2zleueWEXbEx4guJjXFoTttppRPzSQplm0YgJC3GF60
 wjjvjel+WfXgxDXyVYHZaQ3bqRpTmdPhh+3Im3vy0DXnYSoys2Knx0r4m
 zdZtDaA9r8a5WjA+aZdwlRIbi3/GSZeR0jsXZInQ6TIFske7mrgse2+pQ
 Qj1E2Be2x+eTa9uW9AVHrotsbHLzIskAYaCGCBmcfgEFoBNVPhb0uY+O4
 OsXFNL3h5mYWX8PBnIpHWYByHc23GT4a8wwCejjWHAIYEyha0BlhtZDf2
 4vzk2QJdqbThzYCu9DQlpPqLrX9IYdpMrfY0lYJffaKQ++U0VPt4BmQgp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445139707"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="445139707"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 08:50:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="737559330"
X-IronPort-AV: E=Sophos;i="6.02,143,1688454000"; d="scan'208";a="737559330"
Received: from kieranda-mobl.ger.corp.intel.com (HELO [10.252.8.246])
 ([10.252.8.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2023 08:50:05 -0700
Message-ID: <4d6d3579-5d54-d5ef-039b-27500214efba@intel.com>
Date: Wed, 13 Sep 2023 16:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-12-matthew.auld@intel.com>
 <43819243fdde89dcccd93350c154bb738de697eb.camel@intel.com>
 <3b6f7fc0-4a3a-e295-9bc4-45ccb6e7c6f0@intel.com>
 <bb7929f84dde684441b5c28f4b69399da1100e96.camel@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <bb7929f84dde684441b5c28f4b69399da1100e96.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC 5/5] drm/xe/uapi: support pat_index selection
 with vm_bind
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

On 13/09/2023 16:35, Souza, Jose wrote:
> On Fri, 2023-09-08 at 07:51 +0100, Matthew Auld wrote:
>> On 07/09/2023 19:56, Souza, Jose wrote:
>>> On Tue, 2023-08-29 at 17:28 +0100, Matthew Auld wrote:
>>>> Allow userspace to directly control the pat_index for a given vm
>>>> binding. This should allow directly controlling the coherency, caching
>>>> and potentially other stuff in the future for the ppGTT binding.
>>>>
>>>> The exact meaning behind the pat_index is very platform specific (see
>>>> BSpec or PRMs) but effectively maps to some predefined memory
>>>> attributes. From the KMD pov we only care about the coherency that is
>>>> provided by the pat_index, which falls into either NONE, 1WAY or 2WAY.
>>>> The vm_bind coherency mode for the given pat_index needs to match the
>>>> given coh_mode that was set at object creation. For platforms that lack
>>>> the explicit coherency mode, we treat UC/WT/WC as NONE and WB as 2WAY.
>>>>
>>>> For userptr mappings we lack a corresponding gem object, so the expected
>>>> coherency mode is instead implicit and must fall into either 1WAY or
>>>> 2WAY. Trying to use NONE will be rejected by the kernel. For imported
>>>> dma-buf (from a different device) the coherency mode is also implicit
>>>> and must also be either 1WAY or 2WAY.
>>>>
>>>> As part of adding pat_index support with vm_bind we also need stop using
>>>> xe_cache_level and instead use the pat_index in various places. We still
>>>> make use of xe_cache_level, but only as a convenience for kernel
>>>> internal objectsi (internally it maps to some reasonable pat_index). For
>>>> now this is just a 1:1 conversion of the existing code, however for
>>>> platforms like MTL+ we might need to give more control through bo_create
>>>> or stop using WB on the CPU side if we need CPU access.
>>>
>>> xe_ttm_tt_create() caching should not also take into consideration the PAT index?
>>
>> Which PAT index? At least for userspace objects we might not know the
>> pat_index at this stage, also the pat_index is more per vma, while the
>> CPU caching mode in xe_ttm_tt_create() is per object. At gem create we
>> only need to consider the overall coh_mode of every pat_index that will
>> map the object to determine if the CPU caching mode is "valid".
> 
> Yeah it is too late.
> I should not consider smem_caching in drm_xe_gem_create? It that what will be used as caching mode for mmap?

You will need pick something for smem_caching, unless it's vram-only in 
which case just leave as zero. And yes, the mmap caching mode will be 
whatever you picked for smem_caching.

> 
>>
>>>
>>>>
>>>> Bspec: 45101, 44235 #xe
>>>> Bspec: 70552, 71582, 59400 #xe2
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>>>> Cc: Carl Zhang <carl.zhang@intel.com>
>>>> Cc: Effie Yu <effie.yu@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/i915/gt/intel_gtt.h   |  2 +-
>>>>    drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
>>>>    drivers/gpu/drm/xe/xe_ggtt.c          |  7 ++-
>>>>    drivers/gpu/drm/xe/xe_ggtt_types.h    |  2 +-
>>>>    drivers/gpu/drm/xe/xe_migrate.c       | 14 ++---
>>>>    drivers/gpu/drm/xe/xe_pt.c            | 32 +++++-------
>>>>    drivers/gpu/drm/xe/xe_pt.h            |  6 +--
>>>>    drivers/gpu/drm/xe/xe_vm.c            | 73 +++++++++++++++++++++------
>>>>    drivers/gpu/drm/xe/xe_vm_types.h      | 13 +++--
>>>>    include/uapi/drm/xe_drm.h             | 41 ++++++++++++++-
>>>>    10 files changed, 134 insertions(+), 58 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> index 4d6296cdbcfd..bb4c182048c3 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
>>>> @@ -302,7 +302,7 @@ struct i915_address_space {
>>>>    		(*alloc_scratch_dma)(struct i915_address_space *vm, int sz);
>>>>    
>>>>    	u64 (*pte_encode)(dma_addr_t addr,
>>>> -			  unsigned int pat_index,
>>>> +			  u32 pat_index,
>>>>    			  u32 flags); /* Create a valid PTE */
>>>>    #define PTE_READ_ONLY	BIT(0)
>>>>    #define PTE_LM		BIT(1)
>>>> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>> index 5c8d5e78d9bc..7a128fd20a29 100644
>>>> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>> @@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
>>>>    	/* First part of the test, are we updating our pagetable bo with a new entry? */
>>>>    	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
>>>>    		  0xdeaddeadbeefbeef);
>>>> -	expected = xe_pte_encode(pt, 0, XE_CACHE_WB, 0);
>>>> +	expected = xe_pte_encode(pt, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>>>>    	if (m->q->vm->flags & XE_VM_FLAG_64K)
>>>>    		expected |= XE_PTE_PS64;
>>>>    	if (xe_bo_is_vram(pt))
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> index 209fa053d9fb..4134c26150a5 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>>>> @@ -41,7 +41,8 @@ u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset)
>>>>    		pte |= XE_GGTT_PTE_DM;
>>>>    
>>>>    	if ((ggtt->pat_encode).pte_encode)
>>>> -		pte = (ggtt->pat_encode).pte_encode(xe, pte, XE_CACHE_WB_1_WAY);
>>>> +		pte = (ggtt->pat_encode).pte_encode(xe, pte,
>>>> +						    xe_pat_get_index(xe, XE_CACHE_WB_1_WAY));
>>>>    
>>>>    	return pte;
>>>>    }
>>>> @@ -102,10 +103,8 @@ static void primelockdep(struct xe_ggtt *ggtt)
>>>>    }
>>>>    
>>>>    static u64 xelpg_ggtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>>>> -						enum xe_cache_level cache)
>>>> +				     u32 pat_index)
>>>>    {
>>>> -	u32 pat_index = xe_pat_get_index(xe, cache);
>>>> -
>>>>    	pte_pat &= ~(XELPG_GGTT_PTE_PAT_MASK);
>>>>    
>>>>    	if (pat_index & BIT(0))
>>>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>>>> index 7e55fac1a8a9..0bc40cb072e3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>>>> @@ -31,7 +31,7 @@ struct xe_ggtt {
>>>>    
>>>>    	struct {
>>>>    		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
>>>> -						enum xe_cache_level cache);
>>>> +				  u32 pat_index);
>>>>    	} pat_encode;
>>>>    };
>>>>    
>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>> index a782ea282cb6..54585e98452a 100644
>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>> @@ -24,6 +24,7 @@
>>>>    #include "xe_lrc.h"
>>>>    #include "xe_map.h"
>>>>    #include "xe_mocs.h"
>>>> +#include "xe_pat.h"
>>>>    #include "xe_pt.h"
>>>>    #include "xe_res_cursor.h"
>>>>    #include "xe_sched_job.h"
>>>> @@ -162,6 +163,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>>>    	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
>>>>    	u32 map_ofs, level, i;
>>>>    	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
>>>> +	u32 pat_index = xe_pat_get_index(xe, XE_CACHE_WB);
>>>>    	u64 entry;
>>>>    	int ret;
>>>>    
>>>> @@ -189,14 +191,14 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>>>    		return ret;
>>>>    	}
>>>>    
>>>> -	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
>>>> +	entry = xe_pde_encode(bo, bo->size - XE_PAGE_SIZE, pat_index);
>>>>    	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>>>>    
>>>>    	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
>>>>    
>>>>    	/* Map the entire BO in our level 0 pt */
>>>>    	for (i = 0, level = 0; i < num_entries; level++) {
>>>> -		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, XE_CACHE_WB, 0);
>>>> +		entry = xe_pte_encode(bo, i * XE_PAGE_SIZE, pat_index, 0);
>>>>    
>>>>    		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>>>>    
>>>> @@ -214,7 +216,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>>>    		for (i = 0; i < batch->size;
>>>>    		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
>>>>    		     XE_PAGE_SIZE) {
>>>> -			entry = xe_pte_encode(batch, i, XE_CACHE_WB, 0);
>>>> +			entry = xe_pte_encode(batch, i, pat_index, 0);
>>>>    
>>>>    			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
>>>>    				  entry);
>>>> @@ -239,7 +241,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>>>    			flags = XE_PDE_64K;
>>>>    
>>>>    		entry = xe_pde_encode(bo, map_ofs + (level - 1) *
>>>> -					XE_PAGE_SIZE, XE_CACHE_WB);
>>>> +					XE_PAGE_SIZE, pat_index);
>>>>    		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>>>>    			  entry | flags);
>>>>    	}
>>>> @@ -247,7 +249,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>>>    	/* Write PDE's that point to our BO. */
>>>>    	for (i = 0; i < num_entries - num_level; i++) {
>>>>    		entry = xe_pde_encode(bo, i * XE_PAGE_SIZE,
>>>> -				      XE_CACHE_WB);
>>>> +				      pat_index);
>>>>    
>>>>    		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>>>>    			  (i + 1) * 8, u64, entry);
>>>> @@ -1256,7 +1258,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>>>>    
>>>>    			XE_WARN_ON(pt_bo->size != SZ_4K);
>>>>    
>>>> -			addr = xe_pte_encode(pt_bo, 0, XE_CACHE_WB, 0);
>>>> +			addr = xe_pte_encode(pt_bo, 0, xe_pat_get_index(xe, XE_CACHE_WB), 0);
>>>>    			bb->cs[bb->len++] = lower_32_bits(addr);
>>>>    			bb->cs[bb->len++] = upper_32_bits(addr);
>>>>    		}
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>>> index 64713f400d94..019af2920078 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>> @@ -10,6 +10,7 @@
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_tlb_invalidation.h"
>>>>    #include "xe_migrate.h"
>>>> +#include "xe_pat.h"
>>>>    #include "xe_pt_types.h"
>>>>    #include "xe_pt_walk.h"
>>>>    #include "xe_res_cursor.h"
>>>> @@ -57,24 +58,22 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
>>>>     *
>>>>     * Return: An encoded page directory entry. No errors.
>>>>     */
>>>> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>>> -		  const enum xe_cache_level cache)
>>>> +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset, u32 pat_index)
>>>>    {
>>>>    	u64 pde;
>>>>    	struct xe_vm *vm = bo->vm;
>>>>    	struct xe_device *xe = vm->xe;
>>>>    
>>>> -
>>>>    	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>>>    	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>>>>    
>>>>    	if ((vm->pat_encode).pde_encode)
>>>> -		pde = (vm->pat_encode).pde_encode(xe, pde, cache);
>>>> +		pde = (vm->pat_encode).pde_encode(xe, pde, pat_index);
>>>>    
>>>>    	return pde;
>>>>    }
>>>>    
>>>> -static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>>> +static u64 __pte_encode(u64 pte, u32 pat_index,
>>>>    			struct xe_vma *vma, u32 pt_level)
>>>>    {
>>>>    	struct xe_vm *vm = xe_vma_vm(vma);
>>>> @@ -89,7 +88,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>>>    		pte |= XE_PTE_NULL;
>>>>    
>>>>    	if ((vm->pat_encode).pte_encode)
>>>> -		pte = (vm->pat_encode).pte_encode(xe, pte, cache);
>>>> +		pte = (vm->pat_encode).pte_encode(xe, pte, pat_index);
>>>>    
>>>>    	if (pt_level == 1)
>>>>    		pte |= XE_PDE_PS_2M;
>>>> @@ -112,7 +111,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
>>>>     *
>>>>     * Return: An encoded page-table entry. No errors.
>>>>     */
>>>> -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>>>> +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, u32 pat_index,
>>>>    		  u32 pt_level)
>>>>    {
>>>>    	u64 pte;
>>>> @@ -121,7 +120,7 @@ u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>>>>    	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>>>>    		pte |= XE_PPGTT_PTE_DM;
>>>>    
>>>> -	return __pte_encode(pte, cache, NULL, pt_level);
>>>> +	return __pte_encode(pte, pat_index, NULL, pt_level);
>>>>    }
>>>>    
>>>>    static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>>> @@ -134,12 +133,12 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>>>    
>>>>    	if (level == 0) {
>>>>    		u64 empty = xe_pte_encode(vm->scratch_bo[id], 0,
>>>> -					  XE_CACHE_WB, 0);
>>>> +					  xe_pat_get_index(vm->xe, XE_CACHE_WB), 0);
>>>>    
>>>>    		return empty;
>>>>    	} else {
>>>>    		return xe_pde_encode(vm->scratch_pt[id][level - 1]->bo, 0,
>>>> -				     XE_CACHE_WB);
>>>> +				     xe_pat_get_index(vm->xe, XE_CACHE_WB));
>>>>    	}
>>>>    }
>>>>    
>>>> @@ -368,8 +367,6 @@ struct xe_pt_stage_bind_walk {
>>>>    	struct xe_vm *vm;
>>>>    	/** @tile: The tile we're building for. */
>>>>    	struct xe_tile *tile;
>>>> -	/** @cache: Desired cache level for the ptes */
>>>> -	enum xe_cache_level cache;
>>>>    	/** @default_pte: PTE flag only template. No address is associated */
>>>>    	u64 default_pte;
>>>>    	/** @dma_offset: DMA offset to add to the PTE. */
>>>> @@ -604,7 +601,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>>>    
>>>>    		pte = __pte_encode(is_null ? 0 :
>>>>    				   xe_res_dma(curs) + xe_walk->dma_offset,
>>>> -				   xe_walk->cache, xe_walk->vma, level);
>>>> +				   xe_walk->vma->pat_index, xe_walk->vma, level);
>>>>    		pte |= xe_walk->default_pte;
>>>>    
>>>>    		/*
>>>> @@ -669,7 +666,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>>>    			xe_child->is_compact = true;
>>>>    		}
>>>>    
>>>> -		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->cache) | flags;
>>>> +		pte = xe_pde_encode(xe_child->bo, 0, xe_walk->vma->pat_index) | flags;
>>>>    		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
>>>>    					 pte);
>>>>    	}
>>>> @@ -730,13 +727,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>>>    		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>>>>    			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
>>>>    		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
>>>> -		xe_walk.cache = XE_CACHE_WB;
>>>> -	} else {
>>>> -		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
>>>> -			xe_walk.cache = XE_CACHE_WT;
>>>> -		else
>>>> -			xe_walk.cache = XE_CACHE_WB;
>>>>    	}
>>>> +
>>>>    	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
>>>>    		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
>>>>    
>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>>>> index 01be7ab08f87..1d433a5a96b4 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pt.h
>>>> @@ -45,10 +45,8 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>>>>    
>>>>    bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
>>>>    
>>>> -u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
>>>> -		  const enum xe_cache_level level);
>>>> +u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset, u32 pat_index);
>>>>    
>>>> -u64 xe_pte_encode(struct xe_bo *bo, u64 offset, enum xe_cache_level cache,
>>>> -		  u32 pt_level);
>>>> +u64 xe_pte_encode(struct xe_bo *bo, u64 offset, u32 pat_index, u32 pt_level);
>>>>    
>>>>    #endif
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>> index 7eeeed0411f3..34603a7e84b0 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>> @@ -6,6 +6,7 @@
>>>>    #include "xe_vm.h"
>>>>    
>>>>    #include <linux/dma-fence-array.h>
>>>> +#include <linux/nospec.h>
>>>>    
>>>>    #include <drm/drm_print.h>
>>>>    #include <drm/ttm/ttm_execbuf_util.h>
>>>> @@ -874,7 +875,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>>    				    u64 start, u64 end,
>>>>    				    bool read_only,
>>>>    				    bool is_null,
>>>> -				    u8 tile_mask)
>>>> +				    u8 tile_mask,
>>>> +				    u32 pat_index)
>>>>    {
>>>>    	struct xe_vma *vma;
>>>>    	struct xe_tile *tile;
>>>> @@ -913,6 +915,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>>    			vma->tile_mask |= 0x1 << id;
>>>>    	}
>>>>    
>>>> +	vma->pat_index = pat_index;
>>>> +
>>>>    	if (vm->xe->info.platform == XE_PVC)
>>>>    		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>>>    
>>>> @@ -1194,10 +1198,8 @@ static void xe_vma_op_work_func(struct work_struct *w);
>>>>    static void vm_destroy_work_func(struct work_struct *w);
>>>>    
>>>>    static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat,
>>>> -						enum xe_cache_level cache)
>>>> +				     u32 pat_index)
>>>>    {
>>>> -	u32 pat_index = xe_pat_get_index(xe, cache);
>>>> -
>>>>    	pde_pat &= ~(XELP_PDE_PAT_MASK);
>>>>    
>>>>    	if (pat_index & BIT(0))
>>>> @@ -1213,10 +1215,8 @@ static u64 xelp_ppgtt_pde_encode_pat(struct xe_device *xe, u64 pde_pat,
>>>>    }
>>>>    
>>>>    static u64 xelp_ppgtt_pte_encode_pat(struct xe_device *xe, u64 pte_pat,
>>>> -						enum xe_cache_level cache)
>>>> +				     u32 pat_index)
>>>>    {
>>>> -	u32 pat_index = xe_pat_get_index(xe, cache);
>>>> -
>>>>    	pte_pat &= ~(XELP_PTE_PAT_MASK);
>>>>    
>>>>    	if (pat_index & BIT(0))
>>>> @@ -1622,7 +1622,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
>>>>    u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>>>>    {
>>>>    	return xe_pde_encode(vm->pt_root[tile->id]->bo, 0,
>>>> -			     XE_CACHE_WB);
>>>> +			     xe_pat_get_index(vm->xe, XE_CACHE_WB));
>>>>    }
>>>>    
>>>>    static struct dma_fence *
>>>> @@ -2311,7 +2311,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>>>>    static struct drm_gpuva_ops *
>>>>    vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>>>    			 u64 bo_offset_or_userptr, u64 addr, u64 range,
>>>> -			 u32 operation, u8 tile_mask, u32 region)
>>>> +			 u32 operation, u8 tile_mask, u32 region, u32 pat_index)
>>>>    {
>>>>    	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>>>>    	struct ww_acquire_ctx ww;
>>>> @@ -2339,6 +2339,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>>>    			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>>>    
>>>>    			op->tile_mask = tile_mask;
>>>> +			op->pat_index = pat_index;
>>>>    			op->map.immediate =
>>>>    				operation & XE_VM_BIND_FLAG_IMMEDIATE;
>>>>    			op->map.read_only =
>>>> @@ -2366,6 +2367,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>>>    			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>>>    
>>>>    			op->tile_mask = tile_mask;
>>>> +			op->pat_index = pat_index;
>>>>    			op->prefetch.region = region;
>>>>    		}
>>>>    		break;
>>>> @@ -2408,7 +2410,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>>>    }
>>>>    
>>>>    static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>>> -			      u8 tile_mask, bool read_only, bool is_null)
>>>> +			      u8 tile_mask, bool read_only, bool is_null,
>>>> +			      u32 pat_index)
>>>>    {
>>>>    	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>>>>    	struct xe_vma *vma;
>>>> @@ -2425,7 +2428,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>>>    	vma = xe_vma_create(vm, bo, op->gem.offset,
>>>>    			    op->va.addr, op->va.addr +
>>>>    			    op->va.range - 1, read_only, is_null,
>>>> -			    tile_mask);
>>>> +			    tile_mask, pat_index);
>>>>    	if (bo)
>>>>    		xe_bo_unlock(bo, &ww);
>>>>    
>>>> @@ -2539,7 +2542,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>>>    
>>>>    				vma = new_vma(vm, &op->base.map,
>>>>    					      op->tile_mask, op->map.read_only,
>>>> -					      op->map.is_null);
>>>> +					      op->map.is_null, op->pat_index);
>>>>    				if (IS_ERR(vma)) {
>>>>    					err = PTR_ERR(vma);
>>>>    					goto free_fence;
>>>> @@ -2567,7 +2570,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>>>    
>>>>    					vma = new_vma(vm, op->base.remap.prev,
>>>>    						      op->tile_mask, read_only,
>>>> -						      is_null);
>>>> +						      is_null, op->pat_index);
>>>>    					if (IS_ERR(vma)) {
>>>>    						err = PTR_ERR(vma);
>>>>    						goto free_fence;
>>>> @@ -2603,7 +2606,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>>>    
>>>>    					vma = new_vma(vm, op->base.remap.next,
>>>>    						      op->tile_mask, read_only,
>>>> -						      is_null);
>>>> +						      is_null, op->pat_index);
>>>>    					if (IS_ERR(vma)) {
>>>>    						err = PTR_ERR(vma);
>>>>    						goto free_fence;
>>>> @@ -3158,8 +3161,14 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>>>>    		u32 obj = (*bind_ops)[i].obj;
>>>>    		u64 obj_offset = (*bind_ops)[i].obj_offset;
>>>>    		u32 region = (*bind_ops)[i].region;
>>>> +		u32 pat_index = (*bind_ops)[i].pat_index;
>>>>    		bool is_null = op & XE_VM_BIND_FLAG_NULL;
>>>>    
>>>> +		if (XE_IOCTL_DBG(xe, pat_index >= xe->info.pat_table_n_entries)) {
>>>> +			err = -EINVAL;
>>>> +			goto free_bind_ops;
>>>> +		}
>>>> +
>>>>    		if (i == 0) {
>>>>    			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
>>>>    		} else if (XE_IOCTL_DBG(xe, !*async) ||
>>>> @@ -3346,8 +3355,25 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    		struct drm_gem_object *gem_obj;
>>>>    		u64 range = bind_ops[i].range;
>>>>    		u64 addr = bind_ops[i].addr;
>>>> +		u32 op = bind_ops[i].op;
>>>>    		u32 obj = bind_ops[i].obj;
>>>>    		u64 obj_offset = bind_ops[i].obj_offset;
>>>> +		u32 pat_index = bind_ops[i].pat_index;
>>>> +		u16 coh_mode;
>>>> +
>>>> +		pat_index = array_index_nospec(pat_index,
>>>> +					       xe->info.pat_table_n_entries);
>>>> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>>>> +		if (XE_IOCTL_DBG(xe, !coh_mode)) {
>>>> +			err = -EINVAL;
>>>> +			goto put_obj;
>>>> +		}
>>>> +
>>>> +		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR &&
>>>> +				 coh_mode == XE_GEM_COHERENCY_NONE)) {
>>>> +			err = -EINVAL;
>>>> +			goto put_obj;
>>>> +		}
>>>>    
>>>>    		if (!obj)
>>>>    			continue;
>>>> @@ -3375,6 +3401,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    				goto put_obj;
>>>>    			}
>>>>    		}
>>>> +
>>>> +		if (bos[i]->coh_mode) {
>>>> +			if (XE_IOCTL_DBG(xe, bos[i]->coh_mode != coh_mode)) {
>>>> +				err = -EINVAL;
>>>> +				goto put_obj;
>>>> +			}
>>>> +		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_GEM_COHERENCY_NONE)) {
>>>> +			/*
>>>> +			 * Imported dma-buf from a different device should
>>>> +			 * require 1way or 2way coherency since we don't know
>>>> +			 * how it was mapped on CPU. Just assume is it
>>>> +			 * potentially cached on CPU side.
>>>> +			 */
>>>> +			err = -EINVAL;
>>>> +			goto put_obj;
>>>> +		}
>>>>    	}
>>>>    
>>>>    	if (args->num_syncs) {
>>>> @@ -3412,10 +3454,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>    		u64 obj_offset = bind_ops[i].obj_offset;
>>>>    		u8 tile_mask = bind_ops[i].tile_mask;
>>>>    		u32 region = bind_ops[i].region;
>>>> +		u32 pat_index = bind_ops[i].pat_index;
>>>>    
>>>>    		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>>>>    						  addr, range, op, tile_mask,
>>>> -						  region);
>>>> +						  region, pat_index);
>>>>    		if (IS_ERR(ops[i])) {
>>>>    			err = PTR_ERR(ops[i]);
>>>>    			ops[i] = NULL;
>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> index 83a1f87b6537..508679ed3c74 100644
>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>> @@ -111,6 +111,11 @@ struct xe_vma {
>>>>    	 */
>>>>    	u8 tile_present;
>>>>    
>>>> +	/**
>>>> +	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
>>>> +	 */
>>>> +	u32 pat_index;
>>>> +
>>>>    	struct {
>>>>    		struct list_head rebind_link;
>>>>    	} notifier;
>>>> @@ -338,10 +343,8 @@ struct xe_vm {
>>>>    	bool batch_invalidate_tlb;
>>>>    
>>>>    	struct {
>>>> -		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat,
>>>> -						enum xe_cache_level cache);
>>>> -		u64 (*pde_encode)(struct xe_device *xe, u64 pde_pat,
>>>> -						enum xe_cache_level cache);
>>>> +		u64 (*pte_encode)(struct xe_device *xe, u64 pte_pat, u32 pat_index);
>>>> +		u64 (*pde_encode)(struct xe_device *xe, u64 pde_pat, u32 pat_index);
>>>>    	} pat_encode;
>>>>    };
>>>>    
>>>> @@ -417,6 +420,8 @@ struct xe_vma_op {
>>>>    	struct async_op_fence *fence;
>>>>    	/** @tile_mask: gt mask for this operation */
>>>>    	u8 tile_mask;
>>>> +	/** @pat_index: The pat index to use for this operation. */
>>>> +	u32 pat_index;
>>>>    	/** @flags: operation flags */
>>>>    	enum xe_vma_op_flags flags;
>>>>    
>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>> index 64bc66d4b550..0c15b6f32447 100644
>>>> --- a/include/uapi/drm/xe_drm.h
>>>> +++ b/include/uapi/drm/xe_drm.h
>>>> @@ -600,8 +600,45 @@ struct drm_xe_vm_bind_op {
>>>>    	 */
>>>>    	__u32 obj;
>>>>    
>>>> -	/** @pad: MBZ */
>>>> -	__u32 pad;
>>>> +	/**
>>>> +	 * @pat_index: The platform defined @pat_index to use for this mapping.
>>>> +	 * The index basically maps to some predefined memory attributes,
>>>> +	 * including things like caching, coherency and likely other stuff in
>>>> +	 * the future.  The exact meaning of the pat_index is platform specific
>>>> +	 * and defined in the Bspec and PRMs.  When the KMD sets up the binding
>>>> +	 * the index here is encoded into the ppGTT PTE.
>>>> +	 *
>>>> +	 * For coherency the @pat_index needs to match the
>>>> +	 * drm_xe_gem_create.coh_mode, so either XE_GEM_COHERENCY_NONE,
>>>> +	 * XE_GEM_COHERENCY_1WAY or XE_GEM_COHERENCY_2WAY. The KMD will extract
>>>> +	 * the coherency mode from the @pat_index and reject if there is a
>>>> +	 * mismatch (see note below for pre-MTL platforms).
>>>> +	 *
>>>> +	 * Note: On pre-MTL platforms there is only a caching mode and no
>>>> +	 * explicit coherency mode, but on such hardware there is always a
>>>> +	 * shared-LLC (or is dgpu) so all GT memory accesses are coherent with
>>>> +	 * CPU caches even with the caching mode set as uncached.  It's only the
>>>> +	 * display engine that is incoherent (on dgpu it must be in VRAM which
>>>> +	 * is always mapped as WC on the CPU). However to keep the uapi somewhat
>>>> +	 * consistent with newer platforms the KMD groups the different cache
>>>> +	 * levels into the following coherency buckets on all pre-MTL platforms:
>>>> +	 *
>>>> +	 *	ppGTT UC -> XE_GEM_COHERENCY_NONE
>>>> +	 *	ppGTT WC -> XE_GEM_COHERENCY_NONE
>>>> +	 *	ppGTT WT -> XE_GEM_COHERENCY_NONE
>>>> +	 *	ppGTT WB -> XE_GEM_COHERENCY_2WAY
>>>> +	 *
>>>> +	 * In practice UC/WC/WT should only ever used for scanout surfaces on
>>>> +	 * such platforms since it is only the display engine that is actually
>>>> +	 * incoherent. Everything else should typically use WB given that we
>>>> +	 * have a shared-LLC.  On MTL+ this completely changes (also potentially
>>>> +	 * no shared-LLC) and the HW defines the coherency mode as part of the
>>>> +	 * @pat_index.
>>>> +	 *
>>>> +	 * Note: For userptr and externally imported dma-buf the kernel expects
>>>> +	 * either 1WAY or 2WAY for the @pat_index.
>>>> +	 */
>>>> +	__u32 pat_index;
>>>>    
>>>>    	union {
>>>>    		/**
>>>
> 
