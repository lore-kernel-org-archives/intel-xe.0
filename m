Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F26C87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 14:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782110E585;
	Mon,  4 Aug 2025 14:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHjHVoJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F6810E585
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754318885; x=1785854885;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=k/njzan931HP3byW9j9sN6OhpM3EemeBO8GO9JuN/t0=;
 b=UHjHVoJK4jE/8enCh/0MkvuJZN2Kc84p6mCHeoLcQjid+lSgRQOW4fFt
 7ZA3JnjuzCvA9C1LgiabTLfH2Xu2YubeoHRaI4MLAqQ3igp+2Y5eUe+rf
 qjZqjPwW8xk/INCGwtjMSDF/ucI2alMVfz4jRHVvU1tu/+23Il0FuBJSN
 LGnnMvO/8tWBBD5sRmlpcB/cD6yu0wnwPofgdgYAvy6lkhM2pyxRaavrr
 YiENJCsBFES9mlDkKSJn2TXRfBAbeINfS0Vy+XXHjFBUk7nNdMttjaZkp
 npl7qdIVkv9lXzSSXUrZBRNkcBdB1RFH7esaWqKGH5g1BYToprcHwUT74 A==;
X-CSE-ConnectionGUID: yskrasEYQ8a4C22elNYUMA==
X-CSE-MsgGUID: oTr6HJe6Sy2qKPxy++akmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="55787675"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="55787675"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:48:05 -0700
X-CSE-ConnectionGUID: iib2Ba7uQZOXg1mdZggVoA==
X-CSE-MsgGUID: AIOJ3uNoSiqobF8WG+vzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="164180053"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.97])
 ([10.245.245.97])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 07:48:04 -0700
Message-ID: <377ba1f8-a66a-4ca3-a753-330fa4e008f8@intel.com>
Date: Mon, 4 Aug 2025 15:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: rework PDE PAT index selection
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: "Brost, Matthew" <matthew.brost@intel.com>
References: <20250801152142.276935-2-matthew.auld@intel.com>
 <362719b99f5926f2dc6797f19be869b9d0de651e.camel@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <362719b99f5926f2dc6797f19be869b9d0de651e.camel@intel.com>
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

Hi,

On 01/08/2025 20:31, Summers, Stuart wrote:
> On Fri, 2025-08-01 at 16:21 +0100, Matthew Auld wrote:
>> For non-leaf paging structures we end up selecting a random index
>> between [0, 3], depending on the first user if the page-table is
>> shared,
>> since non-leaf structures only have two bits in the HW for encoding
>> the
>> PAT index, and here we are just passing along the full user provided
>> index, which can be an index as large as ~31 on xe2+. The user
>> provided
>> index is meant for the leaf node, which maps the actual BO pages
>> where
>> we have more PAT bits, and not the non-leaf nodes which are only
>> mapping
>> other paging structures, and so only needs a minimal PAT index range.
>> Also the chosen index might need to consider how the driver mapped
>> the
>> paging structures on the host side, like wc vs wb, which is separate
>> from the user provided index.
>>
>> With that move the PDE PAT index selection under driver control. For
>> now
>> just use a coherent index on platforms with page-tables that are
>> cached
>> on host side, and incoherent otherwise. Using a coherent index could
>> potentially be expensive, and would be overkill if we know the page-
>> table
>> is always uncached on host side.
>>
>> BSpec: 59510
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Hey Matt,
> 
> Do we have any known failures related here? Or what is the motivation
> for this change generally?

There shouldn't be any failures, I hope. My thinking is that while 
nothing bad happens today, that might change on future HW, depending on 
what that exact index does, which is very platform specific. Having a 
well defined value here under driver control seems sensible to me. Also 
as per the commit message the coherency of the PAT index should really 
be tied to the allocation type of the page table (or at least we pick 
something which is always safe), which is also under driver control and 
is an internal detail, and IMO should not be chosen randomly depending 
on the first two bits of the user provided PAT index.

> 
> I see on the LRC side we always set to WB, even on discrete. Why not
> use that here too rather than force UC?

That is one option, but AFAICT main difference there is that lrc is 
allocated as cached on host side, if igpu, so at least 1way coherency is 
needed, which WB happens to give. But enabling 1way/2way coherency is 
also usually not free. On dgpu the host coherency of the PAT index 
doesn't do anything, but also the lrc is allocated in VRAM.

> 
> The patch is doing what you're saying, I'm just not sure why we need
> this change now when to my knowledge things have been working for the
> user-defined PAT cases.
> 
> Thanks,
> Stuart
> 
>> ---
>>   drivers/gpu/drm/xe/xe_migrate.c  | 10 ++++------
>>   drivers/gpu/drm/xe/xe_pt.c       |  4 ++--
>>   drivers/gpu/drm/xe/xe_pt_types.h |  3 +--
>>   drivers/gpu/drm/xe/xe_vm.c       | 15 +++++++++++----
>>   4 files changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>> b/drivers/gpu/drm/xe/xe_migrate.c
>> index 3a276e2348a2..43599d4419a7 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -151,8 +151,7 @@ static void xe_migrate_program_identity(struct
>> xe_device *xe, struct xe_vm *vm,
>>          for (pos = dpa_base; pos < vram_limit;
>>               pos += SZ_1G, ofs += 8) {
>>                  if (pos + SZ_1G >= vram_limit) {
>> -                       entry = vm->pt_ops->pde_encode_bo(bo,
>> pt_2m_ofs,
>> -                                                         pat_index);
>> +                       entry = vm->pt_ops->pde_encode_bo(bo,
>> pt_2m_ofs);
>>                          xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
>>   
>>                          flags = vm->pt_ops->pte_encode_addr(xe, 0,
>> @@ -206,7 +205,7 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> *tile, struct xe_migrate *m,
>>   
>>          /* PT30 & PT31 reserved for 2M identity map */
>>          pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
>> -       entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
>> +       entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
>>          xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>>   
>>          map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
>> @@ -274,15 +273,14 @@ static int xe_migrate_prepare_vm(struct xe_tile
>> *tile, struct xe_migrate *m,
>>                          flags = XE_PDE_64K;
>>   
>>                  entry = vm->pt_ops->pde_encode_bo(bo, map_ofs +
>> (u64)(level - 1) *
>> -                                                 XE_PAGE_SIZE,
>> pat_index);
>> +                                                 XE_PAGE_SIZE);
>>                  xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE *
>> level, u64,
>>                            entry | flags);
>>          }
>>   
>>          /* Write PDE's that point to our BO. */
>>          for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
>> -               entry = vm->pt_ops->pde_encode_bo(bo, (u64)i *
>> XE_PAGE_SIZE,
>> -                                                 pat_index);
>> +               entry = vm->pt_ops->pde_encode_bo(bo, (u64)i *
>> XE_PAGE_SIZE);
>>   
>>                  xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>>                            (i + 1) * 8, u64, entry);
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 330cc0f54a3f..f3a39e734a90 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -69,7 +69,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile,
>> struct xe_vm *vm,
>>   
>>          if (level > MAX_HUGEPTE_LEVEL)
>>                  return vm->pt_ops->pde_encode_bo(vm-
>>> scratch_pt[id][level - 1]->bo,
>> -                                                0, pat_index);
>> +                                                0);
>>   
>>          return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
>> IS_DGFX(xe), 0) |
>>                  XE_PTE_NULL;
>> @@ -616,7 +616,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent,
>> pgoff_t offset,
>>                          xe_child->is_compact = true;
>>                  }
>>   
>> -               pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
>> pat_index) | flags;
>> +               pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0) |
>> flags;
>>                  ret = xe_pt_insert_entry(xe_walk, xe_parent, offset,
>> xe_child,
>>                                           pte);
>>          }
>> diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
>> b/drivers/gpu/drm/xe/xe_pt_types.h
>> index 69eab6f37cfe..17cdd7c7e9f5 100644
>> --- a/drivers/gpu/drm/xe/xe_pt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pt_types.h
>> @@ -45,8 +45,7 @@ struct xe_pt_ops {
>>          u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
>>                                 u16 pat_index,
>>                                 u32 pt_level, bool devmem, u64 flags);
>> -       u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>> -                            u16 pat_index);
>> +       u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset);
>>   };
>>   
>>   struct xe_pt_entry {
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 432ea325677d..42e3b1b8be5b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1512,13 +1512,21 @@ static u64 pte_encode_ps(u32 pt_level)
>>          return 0;
>>   }
>>   
>> -static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> -                             const u16 pat_index)
>> +static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset)
>>   {
>> +       struct xe_device *xe = xe_bo_device(bo);
>> +       u16 pat_index;
>>          u64 pde;
>>   
>>          pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
>>          pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>> +
>> +       if (!xe_bo_is_vram(bo) && bo->ttm.ttm->caching == ttm_cached)
>> +               pat_index = xe->pat.idx[XE_CACHE_WB];
>> +       else
>> +               pat_index = xe->pat.idx[XE_CACHE_NONE];
>> +
>> +       xe_assert(xe, pat_index <= 3);
>>          pde |= pde_encode_pat_index(pat_index);
>>   
>>          return pde;
>> @@ -2024,8 +2032,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef,
>> u32 id)
>>   
>>   u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
>>   {
>> -       return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo,
>> 0,
>> -                                        tile_to_xe(tile)-
>>> pat.idx[XE_CACHE_WB]);
>> +       return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo,
>> 0);
>>   }
>>   
>>   static struct xe_exec_queue *
> 

