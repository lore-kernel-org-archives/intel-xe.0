Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22DFC4167B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 16:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA7710E918;
	Thu,  7 Dec 2023 16:25:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA32710E918
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 16:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701966306; x=1733502306;
 h=message-id:date:mime-version:from:subject:cc:references:
 in-reply-to:content-transfer-encoding;
 bh=AdXe0IxWiheYhJQHLb2Uw3DcznK2DQRXL8Nku0Sx4ow=;
 b=QwcEr+rDg8GuXOM295WwQGxbG7ORFhj4EbZRmTHDsOBaqe6j/wW4x3o7
 /iwzpMzok2dIs3KZYvrV+A0Fs6U1tKBdyUHkofrbiBBFY2mdRoV2BZwdH
 yBCnvzlMHmspAchJ+DfLovXN081GSmEC/bNHbKDHrcVVwZiX2lq8WoRMk
 XVmzTGiMbhCsWS3cFs3Vx7N/tr1JF1WY6ngOOhDxfkd9Zcw5FbwzIdYwR
 U1RMr1iT/bg5oJdiiqJ5DMsHAru4PC42hAEZD6LPhV3B4cJYcQOcvUgVB
 xTDA91eF8WVcHt3N0FW+4aeR8+pCL8lpzyr0dVIhor4bSh201P/fthqzo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1085981"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1085981"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:25:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889801141"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; d="scan'208";a="889801141"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 08:25:04 -0800
Message-ID: <301e0414-c632-dd88-b67c-87a3d24544a9@linux.intel.com>
Date: Thu, 7 Dec 2023 17:25:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Replace the scratch pages with NULL PTEs
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231207154423.35666-1-thomas.hellstrom@linux.intel.com>
 <dktre5juul24vbetvhi67r3n2gnlnjihppf74vddyrobxetxc7@5nha57x4mdwb>
Content-Language: en-US
In-Reply-To: <dktre5juul24vbetvhi67r3n2gnlnjihppf74vddyrobxetxc7@5nha57x4mdwb>
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

+ intel-xe cc.


On 12/7/23 17:17, Lucas De Marchi wrote:
> On Thu, Dec 07, 2023 at 04:44:23PM +0100, Thomas Hellström wrote:
>> Replace the scratch pages with NULL PTEs that return 0 when reading and
>> do nothing when writing.
>
> but don't we want to keep scratch so we can check when things go wrong
> and writes go where they shouldn't?

The argument against that was that apps that incorrectly writes to 
scratch and then reads back the same value wouldn't notice that it did 
something wrong, and the case you mention would to some extent be 
captured by not having a scratch page at all and check for pagefaults?

I admit I haven't been following the discussions around scratch pages 
long enough to know the historical uses for it. Cc'ing Joonas for 
further discussion.

/Thomas


>
> Lucas De Marchi
>
>>
>> Cc: Brian Welty <brian.welty@intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pt.c       | 68 ++++----------------------------
>> drivers/gpu/drm/xe/xe_pt.h       |  3 --
>> drivers/gpu/drm/xe/xe_vm.c       | 45 +--------------------
>> drivers/gpu/drm/xe/xe_vm.h       |  5 +++
>> drivers/gpu/drm/xe/xe_vm_types.h |  2 -
>> 5 files changed, 14 insertions(+), 109 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 35bd7940a571..ce2846d56b04 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -50,17 +50,14 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir 
>> *pt_dir, unsigned int index)
>> static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>                  unsigned int level)
>> {
>> -    u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
>> -    u8 id = tile->id;
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>>
>> -    if (!vm->scratch_bo[id])
>> +    if (!xe_vm_has_scratch(vm))
>>         return 0;
>>
>> -    if (level > 0)
>> -        return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 
>> 1]->bo,
>> -                         0, pat_index);
>> -
>> -    return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, 
>> pat_index, 0);
>> +    return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, 
>> IS_DGFX(xe),
>> +                       0) | XE_PTE_NULL;
>> }
>>
>> /**
>> @@ -135,7 +132,7 @@ void xe_pt_populate_empty(struct xe_tile *tile, 
>> struct xe_vm *vm,
>>     u64 empty;
>>     int i;
>>
>> -    if (!vm->scratch_bo[tile->id]) {
>> +    if (!xe_vm_has_scratch(vm)) {
>>         /*
>>          * FIXME: Some memory is allocated already allocated to zero?
>>          * Find out which memory that is and avoid this memset...
>> @@ -194,57 +191,6 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, 
>> struct llist_head *deferred)
>>     kfree(pt);
>> }
>>
>> -/**
>> - * xe_pt_create_scratch() - Setup a scratch memory pagetable tree 
>> for the
>> - * given tile and vm.
>> - * @xe: xe device.
>> - * @tile: tile to set up for.
>> - * @vm: vm to set up for.
>> - *
>> - * Sets up a pagetable tree with one page-table per level and a single
>> - * leaf bo. All pagetable entries point to the single page-table or,
>> - * for L0, the single bo one level below.
>> - *
>> - * Return: 0 on success, negative error code on error.
>> - */
>> -int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>> -             struct xe_vm *vm)
>> -{
>> -    u8 id = tile->id;
>> -    unsigned int flags;
>> -    int i;
>> -
>> -    /*
>> -     * So we don't need to worry about 64K TLB hints when dealing with
>> -     * scratch entires, rather keep the scratch page in system memory on
>> -     * platforms where 64K pages are needed for VRAM.
>> -     */
>> -    flags = XE_BO_CREATE_PINNED_BIT;
>> -    if (vm->flags & XE_VM_FLAG_64K)
>> -        flags |= XE_BO_CREATE_SYSTEM_BIT;
>> -    else
>> -        flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
>> -
>> -    vm->scratch_bo[id] = xe_bo_create_pin_map(xe, tile, vm, SZ_4K,
>> -                          ttm_bo_type_kernel,
>> -                          flags);
>> -    if (IS_ERR(vm->scratch_bo[id]))
>> -        return PTR_ERR(vm->scratch_bo[id]);
>> -
>> -    xe_map_memset(vm->xe, &vm->scratch_bo[id]->vmap, 0, 0,
>> -              vm->scratch_bo[id]->size);
>> -
>> -    for (i = 0; i < vm->pt_root[id]->level; i++) {
>> -        vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
>> -        if (IS_ERR(vm->scratch_pt[id][i]))
>> -            return PTR_ERR(vm->scratch_pt[id][i]);
>> -
>> -        xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
>> -    }
>> -
>> -    return 0;
>> -}
>> -
>> /**
>>  * DOC: Pagetable building
>>  *
>> @@ -1286,7 +1232,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct 
>> xe_vma *vma, struct xe_exec_queue
>>      * it needs to be done here.
>>      */
>>     if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
>> -        (!rebind && vm->scratch_bo[tile->id] && 
>> xe_vm_in_preempt_fence_mode(vm))) {
>> +        (!rebind && xe_vm_has_scratch(vm) && 
>> xe_vm_in_preempt_fence_mode(vm))) {
>>         ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>>         if (!ifence)
>>             return ERR_PTR(-ENOMEM);
>> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>> index d5460e58dbbf..6f7359ac55bd 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.h
>> +++ b/drivers/gpu/drm/xe/xe_pt.h
>> @@ -26,9 +26,6 @@ unsigned int xe_pt_shift(unsigned int level);
>> struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>>                unsigned int level);
>>
>> -int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>> -             struct xe_vm *vm);
>> -
>> void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>>               struct xe_pt *pt);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index e09050f16f07..868b9a2a5d02 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1332,7 +1332,7 @@ static void vm_destroy_work_func(struct 
>> work_struct *w);
>> struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>> {
>>     struct xe_vm *vm;
>> -    int err, i = 0, number_tiles = 0;
>> +    int err, number_tiles = 0;
>>     struct xe_tile *tile;
>>     u8 id;
>>
>> @@ -1397,17 +1397,8 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>         }
>>     }
>>
>> -    if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
>> -        for_each_tile(tile, xe, id) {
>> -            if (!vm->pt_root[id])
>> -                continue;
>> -
>> -            err = xe_pt_create_scratch(xe, tile, vm);
>> -            if (err)
>> -                goto err_scratch_pt;
>> -        }
>> +    if (xe_vm_has_scratch(vm))
>>         vm->batch_invalidate_tlb = true;
>> -    }
>>
>>     if (flags & XE_VM_FLAG_LR_MODE) {
>>         INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
>> @@ -1415,7 +1406,6 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>         vm->batch_invalidate_tlb = false;
>>     }
>>
>> -    /* Fill pt_root after allocating scratch tables */
>>     for_each_tile(tile, xe, id) {
>>         if (!vm->pt_root[id])
>>             continue;
>> @@ -1465,19 +1455,6 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>
>>     return vm;
>>
>> -err_scratch_pt:
>> -    for_each_tile(tile, xe, id) {
>> -        if (!vm->pt_root[id])
>> -            continue;
>> -
>> -        i = vm->pt_root[id]->level;
>> -        while (i)
>> -            if (vm->scratch_pt[id][--i])
>> -                xe_pt_destroy(vm->scratch_pt[id][i],
>> -                          vm->flags, NULL);
>> -        xe_bo_unpin(vm->scratch_bo[id]);
>> -        xe_bo_put(vm->scratch_bo[id]);
>> -    }
>> err_destroy_root:
>>     for_each_tile(tile, xe, id) {
>>         if (vm->pt_root[id])
>> @@ -1556,24 +1533,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>         vma->gpuva.flags |= XE_VMA_DESTROYED;
>>     }
>>
>> -    /*
>> -     * All vm operations will add shared fences to resv.
>> -     * The only exception is eviction for a shared object,
>> -     * but even so, the unbind when evicted would still
>> -     * install a fence to resv. Hence it's safe to
>> -     * destroy the pagetables immediately.
>> -     */
>> -    for_each_tile(tile, xe, id) {
>> -        if (vm->scratch_bo[id]) {
>> -            u32 i;
>> -
>> -            xe_bo_unpin(vm->scratch_bo[id]);
>> -            xe_bo_put(vm->scratch_bo[id]);
>> -            for (i = 0; i < vm->pt_root[id]->level; i++)
>> -                xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
>> -                          NULL);
>> -        }
>> -    }
>>     xe_vm_unlock(vm);
>>
>>     /*
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 9a0ae19c47b7..b92d8f54011d 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -61,6 +61,11 @@ static inline bool 
>> xe_vm_is_closed_or_banned(struct xe_vm *vm)
>>     return xe_vm_is_closed(vm) || xe_vm_is_banned(vm);
>> }
>>
>> +static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
>> +{
>> +    return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
>> +}
>> +
>> struct xe_vma *
>> xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 23abdfd8622f..a5762e99e6aa 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -158,8 +158,6 @@ struct xe_vm {
>>     u64 size;
>>
>>     struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
>> -    struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
>> -    struct xe_pt *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>>
>>     /**
>>      * @flags: flags for this VM, statically setup a creation time aside
>> -- 2.42.0
>>
