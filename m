Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F8ACCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 12:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6A310E388;
	Mon, 10 Nov 2025 12:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C3WE6Gr7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD7910E386
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 12:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762777569; x=1794313569;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=X0W510wcIsQKVfka0+km5jiNo+QKUt0N3ciXWhJO8Sg=;
 b=C3WE6Gr7dTfou6rvBnsy22oZhJQfcFSUi7XI/i+Jdb773isOrgYdisEM
 3MQ/g9/TyBWUrZ7xNOURp9fkFa4PHX46Ehe+v0o5oJ5Z+icW9hCRunGH3
 UNER2wD60WvCtwhqxnrZc2lBDIlY7vl37ElmB2eS38SxmHou37gWuvJE3
 fZxYT9XJihTqBbpI7CPs9agYiT5YEzTOoXX0iY8blJ6kYxJYAPeV33Mmn
 LStF+6/btSAeVoSpnTM9MUJGPM+W6L3HsUBFkJJRVUaX18pRWO6rCP85o
 HYVUhG7trzc/zFK5Ln243E6QTnXnQ2G1HCxX8GaiaIRBlbMoM2PuTmnl1 A==;
X-CSE-ConnectionGUID: GXKe5vbtT8u2I/12rBFnGA==
X-CSE-MsgGUID: bepcaf7PT1ag1WY6GKoGxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="52383792"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="52383792"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:26:08 -0800
X-CSE-ConnectionGUID: s0s8De/HTNSrmOjAC5WUxg==
X-CSE-MsgGUID: UlxLyEbBThC7/040pOVZbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188909105"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.9])
 ([10.245.244.9])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 04:26:07 -0800
Message-ID: <40c255c5-3861-4aac-b5d0-7caa6c9ae624@intel.com>
Date: Mon, 10 Nov 2025 12:26:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] drm/xe: implement VM_BIND decompression in
 vm_bind_ioctl
From: Matthew Auld <matthew.auld@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>, matthew.brost@intel.com
Cc: intel-xe@lists.freedesktop.org, michal.mrozek@intel.com
References: <20251107114757.561671-5-nitin.r.gote@intel.com>
 <20251107114757.561671-8-nitin.r.gote@intel.com>
 <a6d92296-31b3-41bf-9ae1-d3942bd017c4@intel.com>
Content-Language: en-GB
In-Reply-To: <a6d92296-31b3-41bf-9ae1-d3942bd017c4@intel.com>
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

On 10/11/2025 11:46, Matthew Auld wrote:
> On 07/11/2025 11:48, Nitin Gote wrote:
>> Implement handling of VM_BIND(..., DECOMPRESS) in xe_vm_bind_ioctl.
>>
>> Key changes:
>> - Parse and record per-op intent (op->map.request_decompress) when the
>>    DECOMPRESS flag is present.
>> - Introduce xe_pat_index_get_comp_en() helper to check if a PAT index
>>    has compression enabled via the XE2_COMP_EN bit.
>> - Validate DECOMPRESS preconditions in the ioctl path:
>>    - Only valid for MAP ops.
>>    - The provided pat_index must select the device's "no-compression" 
>> PAT.
>>    - Only meaningful on devices with flat CCS and the required XE2+
>>      otherwise return -EOPNOTSUPP.
>>    - Use XE_IOCTL_DBG for uAPI sanity checks.
>> - Implement xe_bo_decompress():
>>    For VRAM BOs run xe_bo_move_notify(), reserve one fence slot,
>>    schedule xe_migrate_resolve(), and attach the returned fence
>>    with DMA_RESV_USAGE_KERNEL. Non-VRAM cases are silent no-ops.
>> - Wire scheduling into vma_lock_and_validate() so VM_BIND will schedule
>>    decompression when request_decompress is set.
>> - Handle fault-mode VMs by performing decompression synchronously during
>>    the bind process, ensuring that the resolve is completed before the 
>> bind
>>    finishes.
>>
>> This schedules an in-place GPU resolve (xe_migrate_resolve) for
>> decompression.
>>
>> v5: (Matt)
>>     - Correct the condition check of xe_pat_index_get_comp_en
>>
>> v4: (Matt)
>>     - Introduce xe_pat_index_get_comp_en(), which checks
>>       XE2_COMP_EN for the pat_index
>>     - .interruptible should be true, everything else false
>>
>> v3: (Matt)
>>     - s/xe_bo_schedule_decompress/xe_bo_decompress
>>     - skip the decrompress step if the BO isn't in VRAM
>>     - start/size not required in xe_bo_schedule_decompress
>>     - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
>>       with respect to invalidation.
>>     - Nits
>>
>> v2:
>>     - Move decompression work out of vm_bind ioctl. (Matt)
>>     - Put that work in a small helper at the BO/migrate layer invoke it
>>       from vma_lock_and_validate which already runs under drm_exec.
>>     - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Acked-by: Michal Mrozek <michal.mrozek@intel.com>
>> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
>> ---
>> Hi Matt,
>>
>> You're correct. The polarity of the xe_pat_index_get_comp_en
>> check was wrong. I misread it, sorry for the confusion.
>> Corrected it in this version.
>>
>> Thank you,
>> -Nitin
>>
>>
>>   drivers/gpu/drm/xe/xe_bo.c       | 52 ++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo.h       |  2 ++
>>   drivers/gpu/drm/xe/xe_pat.c      |  6 ++++
>>   drivers/gpu/drm/xe/xe_pat.h      | 10 ++++++
>>   drivers/gpu/drm/xe/xe_vm.c       | 40 +++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>   6 files changed, 101 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index b0bd31d14bb9..95331285c418 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -3330,6 +3330,58 @@ int xe_gem_mmap_offset_ioctl(struct drm_device 
>> *dev, void *data,
>>       return 0;
>>   }
>> +/**
>> + * xe_bo_decompress - schedule in-place decompress and install fence
>> + * @bo:   buffer object (caller should hold drm_exec reservations for 
>> VM+BO)
>> + * @vm:   VM containing the VMA range
>> + *
>> + * Schedules an in-place resolve via the migrate layer and installs the
>> + * returned dma_fence into the BO kernel reservation slot 
>> (DMA_RESV_USAGE_KERNEL).
>> + * In preempt fence mode, this operation interrupts hardware execution
>> + * which is expensive. Page fault mode is recommended for better 
>> performance.
> 
> Maybe add a comment somewhere here that this only currently works on 
> dgpu? In case someone tries to use this on igpu also, which below will 
> silently skip.
> 
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm)
>> +{
>> +    struct xe_tile *tile = xe_device_get_root_tile(vm->xe);
> 
> Look like we could extract this from the bo instead:
> 
> xe = xe_bo_device(bo);
> xe_device_get_root_tile(xe);
> 
> And we can then drop the vm arg?
> 
>> +    struct dma_fence *decomp_fence = NULL;
>> +    int err = 0;
> 
> Nit: Please put err at the end of the block. Reverse Christmas tree.
> 
>> +    struct ttm_operation_ctx op_ctx = {
>> +        .interruptible = true,
>> +        .no_wait_gpu = false,
>> +        .gfp_retry_mayfail = false,
>> +    };
>> +
>> +    /* Silently skip decompression for non-VRAM buffers */
>> +    if (!bo->ttm.resource || !mem_type_is_vram(bo->ttm.resource- 
>> >mem_type))
>> +        return 0;
>> +
>> +    /* Notify before scheduling resolve */
>> +    err = xe_bo_move_notify(bo, &op_ctx);
>> +    if (err)
>> +        return err;
>> +
>> +    /* Reserve fence slot before scheduling */
>> +    err = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
>> +    if (err)
>> +        return err;
>> +
>> +    /* Schedule the in-place decompression */
>> +    decomp_fence = xe_migrate_resolve(tile->migrate,
>> +                      bo,
>> +                      bo->ttm.resource);
>> +
>> +    if (IS_ERR(decomp_fence))
>> +        return PTR_ERR(decomp_fence);
>> +
>> +    /* Install kernel-usage fence */
>> +    dma_resv_add_fence(bo->ttm.base.resv, decomp_fence, 
>> DMA_RESV_USAGE_KERNEL);
>> +    dma_fence_put(decomp_fence);
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * xe_bo_lock() - Lock the buffer object's dma_resv object
>>    * @bo: The struct xe_bo whose lock is to be taken
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 911d5b90461a..346b50a1247c 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -309,6 +309,8 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>   bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
>> +int xe_bo_decompress(struct xe_bo *bo, struct xe_vm *vm);
>> +
>>   static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
>>   {
>>       return PAGE_ALIGN(xe_bo_size(bo));
>> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
>> index 68171cceea18..1b4d5d3def0f 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.c
>> +++ b/drivers/gpu/drm/xe/xe_pat.c
>> @@ -196,6 +196,12 @@ u16 xe_pat_index_get_coh_mode(struct xe_device 
>> *xe, u16 pat_index)
>>       return xe->pat.table[pat_index].coh_mode;
>>   }
>> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
>> +{
>> +    WARN_ON(pat_index >= xe->pat.n_entries);
>> +    return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
>> +}
> 
> Looks like there no now three in-flight series each implementing a 
> helper like this. But all slightly different. Also not sure which is 
> going be be merged first. I personally prefer making this the same as 
> coh_mode above, and have a comp_en field, but either works.
> 
> https://patchwork.freedesktop.org/series/156658/
> https://patchwork.freedesktop.org/series/157036/
> 
> Wondering if it would make sense to split this helper into a separate 
> patch and merge that first, and then have all three series converge on 
> that? Also hopefully prevents accidently merging multiple helpers for 
> this, depending on the merge order?
> 
> + Sanjay & Xin
> 
>> +
>>   static void program_pat(struct xe_gt *gt, const struct 
>> xe_pat_table_entry table[],
>>               int n_entries)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
>> index 05dae03a5f54..b8559120989e 100644
>> --- a/drivers/gpu/drm/xe/xe_pat.h
>> +++ b/drivers/gpu/drm/xe/xe_pat.h
>> @@ -58,4 +58,14 @@ int xe_pat_dump(struct xe_gt *gt, struct 
>> drm_printer *p);
>>    */
>>   u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>> +/**
>> + * xe_pat_index_get_comp_en - Extract the compression enable flag for
>> + * the given pat_index.
>> + * @xe: xe device
>> + * @pat_index: The pat_index to query
>> + *
>> + * Return: true if compression is enabled for this pat_index, false 
>> otherwise.
>> + */
>> +bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 8fb5cc6a69ec..a9927e665ad0 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2302,6 +2302,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, 
>> struct xe_vma_ops *vops,
>>                   op->map.vma_flags |= XE_VMA_DUMPABLE;
>>               if (flags & DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
>>                   op->map.vma_flags |= XE_VMA_MADV_AUTORESET;
>> +            op->map.request_decompress = flags & 
>> DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>>               op->map.pat_index = pat_index;
>>               op->map.invalidate_on_bind =
>>                   __xe_vm_needs_clear_scratch_pages(vm, flags);
>> @@ -2838,7 +2839,7 @@ static void vm_bind_ioctl_ops_unwind(struct 
>> xe_vm *vm,
>>   }
>>   static int vma_lock_and_validate(struct drm_exec *exec, struct 
>> xe_vma *vma,
>> -                 bool res_evict, bool validate)
>> +                 bool res_evict, bool validate, bool request_decompress)
>>   {
>>       struct xe_bo *bo = xe_vma_bo(vma);
>>       struct xe_vm *vm = xe_vma_vm(vma);
>> @@ -2851,6 +2852,12 @@ static int vma_lock_and_validate(struct 
>> drm_exec *exec, struct xe_vma *vma,
>>               err = xe_bo_validate(bo, vm,
>>                            !xe_vm_in_preempt_fence_mode(vm) &&
>>                            res_evict, exec);
>> +
>> +        if (err)
>> +            return err;
>> +
>> +        if (request_decompress)
>> +            err = xe_bo_decompress(bo, vm);
>>       }
>>       return err;
>> @@ -2938,7 +2945,8 @@ static int op_lock_and_prep(struct drm_exec 
>> *exec, struct xe_vm *vm,
>>               err = vma_lock_and_validate(exec, op->map.vma,
>>                               res_evict,
>>                               !xe_vm_in_fault_mode(vm) ||
>> -                            op->map.immediate);
>> +                            op->map.immediate,
>> +                            op->map.request_decompress);
>>           break;
>>       case DRM_GPUVA_OP_REMAP:
>>           err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
>> @@ -2947,13 +2955,13 @@ static int op_lock_and_prep(struct drm_exec 
>> *exec, struct xe_vm *vm,
>>           err = vma_lock_and_validate(exec,
>>                           gpuva_to_vma(op->base.remap.unmap->va),
>> -                        res_evict, false);
>> +                        res_evict, false, false);
>>           if (!err && op->remap.prev)
>>               err = vma_lock_and_validate(exec, op->remap.prev,
>> -                            res_evict, true);
>> +                            res_evict, true, false);
>>           if (!err && op->remap.next)
>>               err = vma_lock_and_validate(exec, op->remap.next,
>> -                            res_evict, true);
>> +                            res_evict, true, false);
>>           break;
>>       case DRM_GPUVA_OP_UNMAP:
>>           err = check_ufence(gpuva_to_vma(op->base.unmap.va));
>> @@ -2962,7 +2970,7 @@ static int op_lock_and_prep(struct drm_exec 
>> *exec, struct xe_vm *vm,
>>           err = vma_lock_and_validate(exec,
>>                           gpuva_to_vma(op->base.unmap.va),
>> -                        res_evict, false);
>> +                        res_evict, false, false);
>>           break;
>>       case DRM_GPUVA_OP_PREFETCH:
>>       {
>> @@ -2977,7 +2985,7 @@ static int op_lock_and_prep(struct drm_exec 
>> *exec, struct xe_vm *vm,
>>           err = vma_lock_and_validate(exec,
>>                           gpuva_to_vma(op->base.prefetch.va),
>> -                        res_evict, false);
>> +                        res_evict, false, false);
>>           if (!err && !xe_vma_has_no_bo(vma))
>>               err = xe_bo_migrate(xe_vma_bo(vma),
>>                           region_to_mem_type[region],
>> @@ -3299,7 +3307,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, 
>> ERRNO);
>>        DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>>        DRM_XE_VM_BIND_FLAG_CHECK_PXP | \
>>        DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR | \
>> -     DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET)
>> +     DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET | \
>> +     DRM_XE_VM_BIND_FLAG_DECOMPRESS)
>>   #ifdef TEST_VM_OPS_ERROR
>>   #define SUPPORTED_FLAGS    (SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
>> @@ -3357,6 +3366,7 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>           bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>           bool is_cpu_addr_mirror = flags &
>>               DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
>> +        bool is_decompress = flags & DRM_XE_VM_BIND_FLAG_DECOMPRESS;
>>           u16 pat_index = (*bind_ops)[i].pat_index;
>>           u16 coh_mode;
>> @@ -3391,7 +3401,9 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>               XE_IOCTL_DBG(xe, obj_offset && (is_null ||
>>                               is_cpu_addr_mirror)) ||
>>               XE_IOCTL_DBG(xe, op != DRM_XE_VM_BIND_OP_MAP &&
>> -                 (is_null || is_cpu_addr_mirror)) ||
>> +                 (is_decompress || is_null || is_cpu_addr_mirror)) ||
>> +            XE_IOCTL_DBG(xe, is_decompress &&
>> +                 xe_pat_index_get_comp_en(xe, pat_index)) ||
>>               XE_IOCTL_DBG(xe, !obj &&
>>                    op == DRM_XE_VM_BIND_OP_MAP &&
>>                    !is_null && !is_cpu_addr_mirror) ||
>> @@ -3411,8 +3423,8 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>                    op == DRM_XE_VM_BIND_OP_PREFETCH) ||
>>               XE_IOCTL_DBG(xe, prefetch_region &&
>>                    op != DRM_XE_VM_BIND_OP_PREFETCH) ||
>> -            XE_IOCTL_DBG(xe,  (prefetch_region != 
>> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
>> -                       !(BIT(prefetch_region) & xe- 
>> >info.mem_region_mask))) ||
>> +            XE_IOCTL_DBG(xe, (prefetch_region != 
>> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
>> +                      !(BIT(prefetch_region) & xe- 
>> >info.mem_region_mask))) ||
> 
> Is this just fixing whitespace? If so, please consider splitting 
> unrelated styling/cosmetic fixes into a separate patch.
> 
> Otherwise lgtm,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
>>               XE_IOCTL_DBG(xe, obj &&
>>                    op == DRM_XE_VM_BIND_OP_UNMAP) ||
>>               XE_IOCTL_DBG(xe, (flags & 
>> DRM_XE_VM_BIND_FLAG_MADVISE_AUTORESET) &&
>> @@ -3429,6 +3441,12 @@ static int vm_bind_ioctl_check_args(struct 
>> xe_device *xe, struct xe_vm *vm,
>>               err = -EINVAL;
>>               goto free_bind_ops;
>>           }
>> +
>> +        if (is_decompress && (XE_IOCTL_DBG(xe, ! 
>> xe_device_has_flat_ccs(xe)) ||
>> +                      XE_IOCTL_DBG(xe, GRAPHICS_VER(xe) < 20))) {

Hmm, reading the IGT, wondering if maybe we should rather reject this on 
igpu, instead of silently skipping? It gives the impression that it 
"worked", but it actually did nothing.

Also xe_device_has_flat_ccs() can sometimes be false on igpu due some 
setting in the BIOS to turn off compression on igpu, but I don't think 
UMD has a way to know that, and they might be surprised with this 
suddenly failing on xe2+ igpu, on some configurations. On the other hand 
if we always reject on igpu there are no surprises?

>> +            err = -EOPNOTSUPP;
>> +            goto free_bind_ops;
>> +        }
>>       }
>>       return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/ 
>> xe_vm_types.h
>> index ccd6cc090309..f4962ca0df09 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -346,6 +346,8 @@ struct xe_vma_op_map {
>>       bool immediate;
>>       /** @read_only: Read only */
>>       bool invalidate_on_bind;
>> +    /** @request_decompress: schedule decompression for GPU map */
>> +    bool request_decompress;
>>       /** @pat_index: The pat index to use for this operation. */
>>       u16 pat_index;
>>   };
> 

