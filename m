Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27F8C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 08:35:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4968510E24F;
	Thu, 16 Nov 2023 08:35:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED02E10E099
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 08:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700123746; x=1731659746;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+H3mq2YcuZD9QCZX1PBz2ePVX6FEJ3gdQpCIK4FCGXg=;
 b=HpBs0pmp67zMQObNVhfUQ5LClsSje+9+jdGrLmrAQ+hboKqBPmSVhH4m
 GrbIpRCYv65m0SEpPM3pJMtpOTso9TyMNYYRswP0/kQUmmSPkha5MG6lK
 wrNTafA4AbKCAoXLvMbs8dp7oLANrZeX+BRLVlfL9U0XMZZY1AYOPgGrR
 fbejC2OROo6yr8LJ555crew8cCkeYarNAtXpkPOLoLvEYrJ/qfOXiuVAM
 k5iSS+tkHEOvOerg8aM3qkjQ3c14IXMpNkK1TQW2gre1SwR4lQU5eO9Da
 I9Z6p6NZ5x6AKdMAoeRDNqMG33pWZFwvIzfEOkL/75GwOA8fJhOhdWXDq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="390835830"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="390835830"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 00:35:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="835683579"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; d="scan'208";a="835683579"
Received: from mcoffey-mobl.ger.corp.intel.com (HELO [10.252.22.213])
 ([10.252.22.213])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 00:35:43 -0800
Message-ID: <9c98a779-4fb5-4594-ac59-3005a599132f@intel.com>
Date: Thu, 16 Nov 2023 08:35:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Zhang, Carl" <carl.zhang@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231103154309.402159-5-matthew.auld@intel.com>
 <20231103154309.402159-8-matthew.auld@intel.com>
 <PH0PR11MB557988AD87070687F251415F87AFA@PH0PR11MB5579.namprd11.prod.outlook.com>
 <c909bc80-1581-4ed7-9a78-6adcb4e9ad5c@intel.com>
 <PH0PR11MB5579D0C0AAC48F74B968CC1087B3A@PH0PR11MB5579.namprd11.prod.outlook.com>
 <145c1899-a4f2-68d3-25fc-5587d673d65a@intel.com>
 <PH0PR11MB5579C15EB596248A216C6C7387B0A@PH0PR11MB5579.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <PH0PR11MB5579C15EB596248A216C6C7387B0A@PH0PR11MB5579.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v9 3/3] drm/xe/uapi: support pat_index
 selection with vm_bind
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "Xu,
 Zhengguo" <zhengguo.xu@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Yu, Effie" <effie.yu@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 16/11/2023 03:59, Zhang, Carl wrote:
>> -----Original Message-----
>> From: Auld, Matthew <matthew.auld@intel.com>
>> Sent: Monday, November 13, 2023 5:17 PM
>>
>> On 13/11/2023 06:16, Zhang, Carl wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>> Sent: Thursday, November 9, 2023 11:42 PM
>>>>
>>>> Hi,
>>>>
>>>> On 09/11/2023 15:03, Zhang, Carl wrote:
>>>>> Hi Matthew,
>>>>> Sorry for the delay response, questions about this statement:
>>>>> "For imported dma-buf (from  a different device) the coherency mode
>>>>> is also
>>>> implicit and must also be either 1WAY or 2WAY."
>>>>> 1. how about imported dma-buf from a same device/GPU? Same
>>>> requirement?
>>>>
>>>> For self-import (i.e same device) you can also use coh_none, however
>>>> it only works if it makes sense given the original cpu_caching. See
>>>> the prime_self_import_coh test here:
>>>>
>>>> https://patchwork.freedesktop.org/patch/566785/?series=124667&rev=9
>>>>
>>>>    From KMD pov there is not much difference between self-import and
>>>> just some normal userspace object.
>>>>
>>>>> 2. how about the exporting side? If it was created as a UC, the
>>>>> coherency will
>>>> be treated as NONE,  then it was exported , and imported by another
>>>> component, it should be implicit and be 1-way or 2way. KMD will
>>>> handle these difference?
>>>>
>>>> If it was imported from a difference device then KMD has no concept
>>>> of cpu_caching for that object. For now that means requiring 1way+.
>>>>
>>>> See the prime_external_import_coh test for example, in the same link
>>>> above. It uses vgem to create some object (but in principle it could
>>>> also be i915, amdgpu,
>>>> etc) which Xe then imports and maps using vm_bind
>>>> 1way+.
>>>>
>>>>> 3. about dma-buf, producer and consumer maybe set different
>>>>> cpu_caching?  As you know,  in producer side, may not know whether
>>>>> it will be exported during creation or
>>>>
>>>> With dma-buf only the producer controls the cpu_caching or equivalent.
>>>> The consumer can only control how they wish to map it on the gpu, i.e
>>>> the PAT index.
>>>>
>>>
>>> Actually, my question is focus on whether producer and consumer could
>>> set different PAT_index, from current discussion:
>>> it is "yes" for GPU caching part
>>> but is "no" for CPU caching part  & coherency part? --- if it also is
>>> "yes", there
>>
>> The coherency part was removed from the uapi (i.e gem_create.coh_mode),
>> which just leaves the gem_create.cpu_caching. The cpu_caching is not a PAT
>> index attribute on the GPU, it is just about controlling how the KMD is meant
>> allocate the memory. The memory is allocated as either wb or wc, which is
>> then immutable.
>>
>>> are no any concern. Producer and consumer could use totally different
>>> PAT_index without conflict .
>>
>> Right, producer and consumer could use different PAT index.
>>
>>>
>>> I use one example to describe my question (same device):
>>> Media decode one frame, then share it to compute to do AI inference.
>>> Media does not know whether compute will do some additional CPU access.
>>>
>>> Media create the surfaces (CPU caching : None,  coherency: None,
>>
>> Not sure what is "CPU caching : None"? Or is this just cpu_caching=wc ?
>> There is no "CPU caching" PAT index attribute AFAICT. You can just set the
>> caching policy for l3/l4, which can be things like: wb, wt, uc, wb-transient.
>>
> I mean "CPU caching: None"  UC
> 
>>> Compression: no, GPU cache: L3 ...) then share it to compute, which
>>> field should be kept same?
>>
>> KMD only cares about the "coherency:" field. But since this is same-device, in
>> this particular case you can use either none or 1-way on the importer side.
>>
>>> then , export it to dma buffer fd.
>>> Compute side: import it and create another bo, vmbind with different
>>> VM, Then , it should be (CPU caching: WB, coherency: 1-way,
>>> compression: no, GPU cache: any value)
>>
>> Not sure what is this "CPU caching: WB", but ignoring that above should work I
>> think.
>>
> 
> Consumer side does not know CPU caching setting which is handled by producer
> During the bo creation stage,   but consumer could always set 1-way , because no matter
> It is WB or UC, it could work , maybe impact perf.  Is it the design?
> 
> What I am thinking is ,  if it is no-coherency,  could consumer also know it is "no-coherency" originally.
> And also call vmbind as "no-coherency" to get a better perf?

Yeah, 1way+ will always work for consumer. You could try coh_none first 
if that is preferred on some platforms, and if that is rejected you fall 
back to 1way+, but that only really works for self-import.

> 
> 
>>>
>>>> vmbind, it may be determined by application after these operations.
>>>>> 3 looks a bit duplicate with 2.
>>>>>
>>>>> Thanks
>>>>> Carl
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Auld, Matthew <matthew.auld@intel.com>
>>>>>> Sent: Friday, November 3, 2023 11:43 PM
>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>> Cc: Mishra, Pallavi <pallavi.mishra@intel.com>; Thomas Hellström
>>>>>> <thomas.hellstrom@linux.intel.com>; Joonas Lahtinen
>>>>>> <joonas.lahtinen@linux.intel.com>; De Marchi, Lucas
>>>>>> <lucas.demarchi@intel.com>; Roper, Matthew D
>>>>>> <matthew.d.roper@intel.com>; Souza, Jose <jose.souza@intel.com>;
>>>>>> Hazubski, Filip <filip.hazubski@intel.com>; Zhang, Carl
>>>>>> <carl.zhang@intel.com>; Yu, Effie <effie.yu@intel.com>; Xu,
>>>>>> Zhengguo <zhengguo.xu@intel.com>; Dugast, Francois
>>>>>> <francois.dugast@intel.com>
>>>>>> Subject: [PATCH v9 3/3] drm/xe/uapi: support pat_index selection
>>>>>> with vm_bind
>>>>>>
>>>>>> Allow userspace to directly control the pat_index for a given vm
>>>>>> binding. This should allow directly controlling the coherency,
>>>>>> caching behaviour, compression and potentially other stuff in the
>>>>>> future for
>>>> the ppGTT binding.
>>>>>>
>>>>>> The exact meaning behind the pat_index is very platform specific
>>>>>> (see BSpec or
>>>>>> PRMs) but effectively maps to some predefined memory attributes.
>>>>>>  From the KMD pov we only care about the coherency that is provided
>>>>>> by the pat_index, which falls into either NONE, 1WAY or 2WAY.
>>>>>> The vm_bind coherency mode for the given pat_index needs to be at
>>>>>> least 1way coherent when using cpu_caching with
>>>>>> DRM_XE_GEM_CPU_CACHING_WB. For platforms that lack the explicit
>>>>>> coherency mode attribute, we treat UC/WT/WC as NONE and WB as
>>>>>> AT_LEAST_1WAY.
>>>>>>
>>>>>> For userptr mappings we lack a corresponding gem object, so the
>>>>>> expected coherency mode is instead implicit and must fall into
>>>>>> either 1WAY
>>>> or 2WAY.
>>>>>> Trying to use NONE will be rejected by the kernel. For imported
>>>>>> dma-buf (from a different device) the coherency mode is also
>>>>>> implicit and must also be either 1WAY or 2WAY.
>>>>>>
>>>>>> v2:
>>>>>>      - Undefined coh_mode(pat_index) can now be treated as programmer
>>>>>>        error. (Matt Roper)
>>>>>>      - We now allow gem_create.coh_mode <= coh_mode(pat_index),
>>>>>> rather
>>>> than
>>>>>>        having to match exactly. This ensures imported dma-buf can always
>>>>>>        just use 1way (or even 2way), now that we also bundle 1way/2way
>> into
>>>>>>        at_least_1way. We still require 1way/2way for external dma-buf, but
>>>>>>        the policy can now be the same for self-import, if desired.
>>>>>>      - Use u16 for pat_index in uapi. u32 is massive overkill. (José)
>>>>>>      - Move as much of the pat_index validation as we can into
>>>>>>        vm_bind_ioctl_check_args. (José)
>>>>>> v3 (Matt Roper):
>>>>>>      - Split the pte_encode() refactoring into separate patch.
>>>>>> v4:
>>>>>>      - Rebase
>>>>>> v5:
>>>>>>      - Check for and reject !coh_mode which would indicate hw reserved
>>>>>>        pat_index on xe2.
>>>>>> v6:
>>>>>>      - Rebase on removal of coh_mode from uapi. We just need to reject
>>>>>>        cpu_caching=wb + pat_index with coh_none.
>>>>>>
>>>>>> Testcase: igt@xe_pat
>>>>>> Bspec: 45101, 44235 #xe
>>>>>> Bspec: 70552, 71582, 59400 #xe2
>>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>>> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>>> Cc: José Roberto de Souza <jose.souza@intel.com>
>>>>>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>>>>>> Cc: Carl Zhang <carl.zhang@intel.com>
>>>>>> Cc: Effie Yu <effie.yu@intel.com>
>>>>>> Cc: Zhengguo Xu <zhengguo.xu@intel.com>
>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>> Tested-by: José Roberto de Souza <jose.souza@intel.com>
>>>>>> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/xe/xe_pt.c       | 11 +-----
>>>>>>     drivers/gpu/drm/xe/xe_vm.c       | 68
>> ++++++++++++++++++++++++++++----
>>>>>>     drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++
>>>>>>     include/uapi/drm/xe_drm.h        | 42 +++++++++++++++++++-
>>>>>>     4 files changed, 110 insertions(+), 18 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c
>>>>>> b/drivers/gpu/drm/xe/xe_pt.c index
>>>>>> 31afab617b4e..a0f31f991f34 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>>>> @@ -290,8 +290,6 @@ struct xe_pt_stage_bind_walk {
>>>>>>     	struct xe_vm *vm;
>>>>>>     	/** @tile: The tile we're building for. */
>>>>>>     	struct xe_tile *tile;
>>>>>> -	/** @cache: Desired cache level for the ptes */
>>>>>> -	enum xe_cache_level cache;
>>>>>>     	/** @default_pte: PTE flag only template. No address is associated */
>>>>>>     	u64 default_pte;
>>>>>>     	/** @dma_offset: DMA offset to add to the PTE. */ @@ -511,7
>>>>>> +509,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t
>> offset,  {
>>>>>>     	struct xe_pt_stage_bind_walk *xe_walk =
>>>>>>     		container_of(walk, typeof(*xe_walk), base);
>>>>>> -	u16 pat_index = tile_to_xe(xe_walk->tile)->pat.idx[xe_walk->cache];
>>>>>> +	u16 pat_index = xe_walk->vma->pat_index;
>>>>>>     	struct xe_pt *xe_parent = container_of(parent,
>>>>>> typeof(*xe_parent), base);
>>>>>>     	struct xe_vm *vm = xe_walk->vm;
>>>>>>     	struct xe_pt *xe_child;
>>>>>> @@ -657,13 +655,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct
>>>>>> xe_vma *vma,
>>>>>>     	if (is_devmem) {
>>>>>>     		xe_walk.default_pte |= XE_PPGTT_PTE_DM;
>>>>>>     		xe_walk.dma_offset = vram_region_gpu_offset(bo-
>>>>>>> ttm.resource);
>>>>>> -		xe_walk.cache = XE_CACHE_WB;
>>>>>> -	} else {
>>>>>> -		if (!xe_vma_has_no_bo(vma) && bo->flags &
>>>>>> XE_BO_SCANOUT_BIT)
>>>>>> -			xe_walk.cache = XE_CACHE_WT;
>>>>>> -		else
>>>>>> -			xe_walk.cache = XE_CACHE_WB;
>>>>>>     	}
>>>>>> +
>>>>>>     	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
>>>>>>     		xe_walk.dma_offset =
>>>>>> xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>>>>> b/drivers/gpu/drm/xe/xe_vm.c index
>>>>>> d26c90f0d702..0723974f1fc8 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> @@ -6,6 +6,7 @@
>>>>>>     #include "xe_vm.h"
>>>>>>
>>>>>>     #include <linux/dma-fence-array.h>
>>>>>> +#include <linux/nospec.h>
>>>>>>
>>>>>>     #include <drm/drm_exec.h>
>>>>>>     #include <drm/drm_print.h>
>>>>>> @@ -26,6 +27,7 @@
>>>>>>     #include "xe_gt_pagefault.h"
>>>>>>     #include "xe_gt_tlb_invalidation.h"
>>>>>>     #include "xe_migrate.h"
>>>>>> +#include "xe_pat.h"
>>>>>>     #include "xe_pm.h"
>>>>>>     #include "xe_preempt_fence.h"
>>>>>>     #include "xe_pt.h"
>>>>>> @@ -864,7 +866,8 @@ static struct xe_vma *xe_vma_create(struct
>>>>>> xe_vm *vm,
>>>>>>     				    u64 start, u64 end,
>>>>>>     				    bool read_only,
>>>>>>     				    bool is_null,
>>>>>> -				    u8 tile_mask)
>>>>>> +				    u8 tile_mask,
>>>>>> +				    u16 pat_index)
>>>>>>     {
>>>>>>     	struct xe_vma *vma;
>>>>>>     	struct xe_tile *tile;
>>>>>> @@ -906,6 +909,8 @@ static struct xe_vma *xe_vma_create(struct
>>>>>> xe_vm *vm,
>>>>>>     	if (GRAPHICS_VER(vm->xe) >= 20 || vm->xe->info.platform ==
>> XE_PVC)
>>>>>>     		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>>>>>
>>>>>> +	vma->pat_index = pat_index;
>>>>>> +
>>>>>>     	if (bo) {
>>>>>>     		xe_bo_assert_held(bo);
>>>>>>
>>>>>> @@ -2167,7 +2172,8 @@ static void print_op(struct xe_device *xe,
>>>>>> struct drm_gpuva_op *op)  static struct drm_gpuva_ops *
>>>>>> vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>>>>>     			 u64 bo_offset_or_userptr, u64 addr, u64 range,
>>>>>> -			 u32 operation, u32 flags, u8 tile_mask, u32 region)
>>>>>> +			 u32 operation, u32 flags, u8 tile_mask, u32 region,
>>>>>> +			 u16 pat_index)
>>>>>>     {
>>>>>>     	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>>>>>>     	struct drm_gpuva_ops *ops;
>>>>>> @@ -2194,6 +2200,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>>>>>> struct xe_bo *bo,
>>>>>>     			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>>>>>
>>>>>>     			op->tile_mask = tile_mask;
>>>>>> +			op->pat_index = pat_index;
>>>>>>     			op->map.immediate =
>>>>>>     				flags & XE_VM_BIND_FLAG_IMMEDIATE;
>>>>>>     			op->map.read_only =
>>>>>> @@ -2221,6 +2228,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>>>>>> struct xe_bo *bo,
>>>>>>     			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>>>>>>
>>>>>>     			op->tile_mask = tile_mask;
>>>>>> +			op->pat_index = pat_index;
>>>>>>     			op->prefetch.region = region;
>>>>>>     		}
>>>>>>     		break;
>>>>>> @@ -2263,7 +2271,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>>>>>> struct xe_bo *bo,  }
>>>>>>
>>>>>>     static struct xe_vma *new_vma(struct xe_vm *vm, struct
>>>>>> drm_gpuva_op_map *op,
>>>>>> -			      u8 tile_mask, bool read_only, bool is_null)
>>>>>> +			      u8 tile_mask, bool read_only, bool is_null,
>>>>>> +			      u16 pat_index)
>>>>>>     {
>>>>>>     	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) :
>> NULL;
>>>>>>     	struct xe_vma *vma;
>>>>>> @@ -2279,7 +2288,7 @@ static struct xe_vma *new_vma(struct xe_vm
>>>> *vm,
>>>>>> struct drm_gpuva_op_map *op,
>>>>>>     	vma = xe_vma_create(vm, bo, op->gem.offset,
>>>>>>     			    op->va.addr, op->va.addr +
>>>>>>     			    op->va.range - 1, read_only, is_null,
>>>>>> -			    tile_mask);
>>>>>> +			    tile_mask, pat_index);
>>>>>>     	if (bo)
>>>>>>     		xe_bo_unlock(bo);
>>>>>>
>>>>>> @@ -2425,7 +2434,7 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>>
>>>>>>     			vma = new_vma(vm, &op->base.map,
>>>>>>     				      op->tile_mask, op->map.read_only,
>>>>>> -				      op->map.is_null);
>>>>>> +				      op->map.is_null, op->pat_index);
>>>>>>     			if (IS_ERR(vma))
>>>>>>     				return PTR_ERR(vma);
>>>>>>
>>>>>> @@ -2451,7 +2460,7 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>>
>>>>>>     				vma = new_vma(vm, op->base.remap.prev,
>>>>>>     					      op->tile_mask, read_only,
>>>>>> -					      is_null);
>>>>>> +					      is_null, op->pat_index);
>>>>>>     				if (IS_ERR(vma))
>>>>>>     					return PTR_ERR(vma);
>>>>>>
>>>>>> @@ -2485,7 +2494,7 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>>
>>>>>>     				vma = new_vma(vm, op->base.remap.next,
>>>>>>     					      op->tile_mask, read_only,
>>>>>> -					      is_null);
>>>>>> +					      is_null, op->pat_index);
>>>>>>     				if (IS_ERR(vma))
>>>>>>     					return PTR_ERR(vma);
>>>>>>
>>>>>> @@ -2883,6 +2892,26 @@ static int vm_bind_ioctl_check_args(struct
>>>>>> xe_device *xe,
>>>>>>     		u64 obj_offset = (*bind_ops)[i].obj_offset;
>>>>>>     		u32 region = (*bind_ops)[i].region;
>>>>>>     		bool is_null = flags & XE_VM_BIND_FLAG_NULL;
>>>>>> +		u16 pat_index = (*bind_ops)[i].pat_index;
>>>>>> +		u16 coh_mode;
>>>>>> +
>>>>>> +		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
>>>>>> +			err = -EINVAL;
>>>>>> +			goto free_bind_ops;
>>>>>> +		}
>>>>>> +
>>>>>> +		pat_index = array_index_nospec(pat_index, xe-
>>> pat.n_entries);
>>>>>> +		(*bind_ops)[i].pat_index = pat_index;
>>>>>> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>>>>>> +		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
>>>>>> +			err = -EINVAL;
>>>>>> +			goto free_bind_ops;
>>>>>> +		}
>>>>>> +
>>>>>> +		if (XE_WARN_ON(coh_mode > XE_COH_AT_LEAST_1WAY)) {
>>>>>> +			err = -EINVAL;
>>>>>> +			goto free_bind_ops;
>>>>>> +		}
>>>>>>
>>>>>>     		if (i == 0) {
>>>>>>     			*async = !!(flags & XE_VM_BIND_FLAG_ASYNC); @@
>> -
>>>>>> 2913,6 +2942,8 @@ static int vm_bind_ioctl_check_args(struct
>>>>>> xe_device
>>>> *xe,
>>>>>>     				 op == XE_VM_BIND_OP_UNMAP_ALL) ||
>>>>>>     		    XE_IOCTL_DBG(xe, obj &&
>>>>>>     				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
>>>>>> +		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>>>>>> +				 op == XE_VM_BIND_OP_MAP_USERPTR) ||
>>>>>>     		    XE_IOCTL_DBG(xe, obj &&
>>>>>>     				 op == XE_VM_BIND_OP_PREFETCH) ||
>>>>>>     		    XE_IOCTL_DBG(xe, region && @@ -3046,6 +3077,8 @@ int
>>>>>> xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct
>>>>>> drm_file *file)
>>>>>>     		u64 addr = bind_ops[i].addr;
>>>>>>     		u32 obj = bind_ops[i].obj;
>>>>>>     		u64 obj_offset = bind_ops[i].obj_offset;
>>>>>> +		u16 pat_index = bind_ops[i].pat_index;
>>>>>> +		u16 coh_mode;
>>>>>>
>>>>>>     		if (!obj)
>>>>>>     			continue;
>>>>>> @@ -3073,6 +3106,24 @@ int xe_vm_bind_ioctl(struct drm_device
>> *dev,
>>>>>> void *data, struct drm_file *file)
>>>>>>     				goto put_obj;
>>>>>>     			}
>>>>>>     		}
>>>>>> +
>>>>>> +		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>>>>>> +		if (bos[i]->cpu_caching) {
>>>>>> +			if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE
>>>>>> &&
>>>>>> +					 bos[i]->cpu_caching ==
>>>>>> DRM_XE_GEM_CPU_CACHING_WB)) {
>>>>>> +				err = -EINVAL;
>>>>>> +				goto put_obj;
>>>>>> +			}
>>>>>> +		} else if (XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE)) {
>>>>>> +			/*
>>>>>> +			 * Imported dma-buf from a different device should
>>>>>> +			 * require 1way or 2way coherency since we don't
>>>>>> know
>>>>>> +			 * how it was mapped on the CPU. Just assume is it
>>>>>> +			 * potentially cached on CPU side.
>>>>>> +			 */
>>>>>> +			err = -EINVAL;
>>>>>> +			goto put_obj;
>>>>>> +		}
>>>>>>     	}
>>>>>>
>>>>>>     	if (args->num_syncs) {
>>>>>> @@ -3100,10 +3151,11 @@ int xe_vm_bind_ioctl(struct drm_device
>>>>>> *dev, void *data, struct drm_file *file)
>>>>>>     		u64 obj_offset = bind_ops[i].obj_offset;
>>>>>>     		u8 tile_mask = bind_ops[i].tile_mask;
>>>>>>     		u32 region = bind_ops[i].region;
>>>>>> +		u16 pat_index = bind_ops[i].pat_index;
>>>>>>
>>>>>>     		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>>>>>>     						  addr, range, op, flags,
>>>>>> -						  tile_mask, region);
>>>>>> +						  tile_mask, region,
>>>>>> pat_index);
>>>>>>     		if (IS_ERR(ops[i])) {
>>>>>>     			err = PTR_ERR(ops[i]);
>>>>>>     			ops[i] = NULL;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> index aaf0c7101019..9ca84e1783ed 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>>> @@ -110,6 +110,11 @@ struct xe_vma {
>>>>>>     	 */
>>>>>>     	u8 tile_present;
>>>>>>
>>>>>> +	/**
>>>>>> +	 * @pat_index: The pat index to use when encoding the PTEs for
>>>>>> +this
>>>>>> vma.
>>>>>> +	 */
>>>>>> +	u16 pat_index;
>>>>>> +
>>>>>>     	struct {
>>>>>>     		struct list_head rebind_link;
>>>>>>     	} notifier;
>>>>>> @@ -402,6 +407,8 @@ struct xe_vma_op {
>>>>>>     	struct list_head link;
>>>>>>     	/** @tile_mask: gt mask for this operation */
>>>>>>     	u8 tile_mask;
>>>>>> +	/** @pat_index: The pat index to use for this operation. */
>>>>>> +	u16 pat_index;
>>>>>>     	/** @flags: operation flags */
>>>>>>     	enum xe_vma_op_flags flags;
>>>>>>
>>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>> index
>>>>>> e064ed475bf6..6f4af6d6c415 100644
>>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>>> @@ -643,8 +643,48 @@ struct drm_xe_vm_bind_op {
>>>>>>     	 */
>>>>>>     	__u32 obj;
>>>>>>
>>>>>> +	/**
>>>>>> +	 * @pat_index: The platform defined @pat_index to use for this
>>>>>> mapping.
>>>>>> +	 * The index basically maps to some predefined memory attributes,
>>>>>> +	 * including things like caching, coherency, compression etc.  The exact
>>>>>> +	 * meaning of the pat_index is platform specific and defined in the
>>>>>> +	 * Bspec and PRMs.  When the KMD sets up the binding the index
>>>>>> +here
>>>>>> is
>>>>>> +	 * encoded into the ppGTT PTE.
>>>>>> +	 *
>>>>>> +	 * For coherency the @pat_index needs to be at least 1way
>>>>>> +coherent
>>>>>> when
>>>>>> +	 * drm_xe_gem_create.cpu_caching is
>>>>>> DRM_XE_GEM_CPU_CACHING_WB. The KMD
>>>>>> +	 * will extract the coherency mode from the @pat_index and reject if
>>>>>> +	 * there is a mismatch (see note below for pre-MTL platforms).
>>>>>> +	 *
>>>>>> +	 * Note: On pre-MTL platforms there is only a caching mode and no
>>>>>> +	 * explicit coherency mode, but on such hardware there is always a
>>>>>> +	 * shared-LLC (or is dgpu) so all GT memory accesses are coherent
>> with
>>>>>> +	 * CPU caches even with the caching mode set as uncached.  It's
>>>>>> +only
>>>>>> the
>>>>>> +	 * display engine that is incoherent (on dgpu it must be in VRAM which
>>>>>> +	 * is always mapped as WC on the CPU). However to keep the uapi
>>>>>> somewhat
>>>>>> +	 * consistent with newer platforms the KMD groups the different
>> cache
>>>>>> +	 * levels into the following coherency buckets on all pre-MTL
>> platforms:
>>>>>> +	 *
>>>>>> +	 *	ppGTT UC -> COH_NONE
>>>>>> +	 *	ppGTT WC -> COH_NONE
>>>>>> +	 *	ppGTT WT -> COH_NONE
>>>>>> +	 *	ppGTT WB -> COH_AT_LEAST_1WAY
>>>>>> +	 *
>>>>>> +	 * In practice UC/WC/WT should only ever used for scanout surfaces
>> on
>>>>>> +	 * such platforms (or perhaps in general for dma-buf if shared with
>>>>>> +	 * another device) since it is only the display engine that is actually
>>>>>> +	 * incoherent.  Everything else should typically use WB given that we
>>>>>> +	 * have a shared-LLC.  On MTL+ this completely changes and the HW
>>>>>> +	 * defines the coherency mode as part of the @pat_index, where
>>>>>> +	 * incoherent GT access is possible.
>>>>>> +	 *
>>>>>> +	 * Note: For userptr and externally imported dma-buf the kernel
>>>>>> expects
>>>>>> +	 * either 1WAY or 2WAY for the @pat_index.
>>>>>> +	 */
>>>>>> +	__u16 pat_index;
>>>>>> +
>>>>>>     	/** @pad: MBZ */
>>>>>> -	__u32 pad;
>>>>>> +	__u16 pad;
>>>>>>
>>>>>>     	union {
>>>>>>     		/**
>>>>>> --
>>>>>> 2.41.0
>>>>>
