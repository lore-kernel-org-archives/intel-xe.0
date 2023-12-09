Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E39C4167B
	for <intel-xe@archiver.kernel.org>; Sat,  9 Dec 2023 15:13:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D8010E0A9;
	Sat,  9 Dec 2023 15:13:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7609F10E0A9
 for <intel-xe@lists.freedesktop.org>; Sat,  9 Dec 2023 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702134809; x=1733670809;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3ga0oei0uH71woI23g/hTT/XOlJ6c4+bf3O/iNa3A6M=;
 b=NeJ13pJpTlDGaI7iabk9C7b+EPfzhTMKJil8kheaxZNzNHGVO0vnJsWM
 evdr4+xjF6umF7Xf3SiSA6Tui8waRTzwXfAN3yK8AJMDUB/NMmMtw5w6m
 pQtw574poeqKgEG/zncijKBxkQ4n/EPivn5AnIQdSQCDyJqIcYn9TWRT8
 I+jQEuLWQDh4R5fps+zlNJLAsmRlZ9mtpsTXnuCpiVRFSwmaV1kXWvJhY
 tisI6lJf7QSmdto0tfDhG/e81SKi3UW8VoVE7u08/nmVKMnAjQYadCeeS
 YxPUw3VVMe2Tf1TBaTPmRuwPByJM2JAoZLYUgQZ/bX3pzE0/WPKZ9v8kv g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="391686195"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="391686195"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 07:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="916280577"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; d="scan'208";a="916280577"
Received: from pplotits-mobl2.ccr.corp.intel.com (HELO [10.249.254.23])
 ([10.249.254.23])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2023 07:13:27 -0800
Message-ID: <4df7ed45-27bc-0135-6d8f-fbf216e1d426@linux.intel.com>
Date: Sat, 9 Dec 2023 16:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/2] drm/xe: Use NULL PTEs as scratch PTEs
Content-Language: en-US
To: "Welty, Brian" <brian.welty@intel.com>, intel-xe@lists.freedesktop.org
References: <20231208112918.15411-1-thomas.hellstrom@linux.intel.com>
 <20231208112918.15411-3-thomas.hellstrom@linux.intel.com>
 <d2bc8ed4-965b-40d2-aacd-915ed68a6e73@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <d2bc8ed4-965b-40d2-aacd-915ed68a6e73@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12/8/23 20:37, Welty, Brian wrote:
>
>
> On 12/8/2023 3:29 AM, Thomas Hellström wrote:
>> Currently scratch PTEs are write-enabled and points to a single scratch
>> page. This has the side effect that buggy applications with 
>> out-of-bounds
>> memory accesses may not notice the bad access since what's written may
>> be read back.
>>
>> Instead use NULL PTEs as scratch PTEs. These always return 0 when 
>> reading,
>> and writing has no effect. As a slight benefit, we can also use huge 
>> NULL
>> PTEs.
>>
>> One drawback pointed out is that debugging may be hampered since 
>> previously
>> when inspecting the content of the scratch page, it might be possible to
>> detect writes to out-of-bound addresses and possibly also
>> from where the out-of-bounds address originated. However since the 
>> scratch
>> page-table structure is kept, it will be easy to add back the single
>> RW-enabled scratch page under a debug define if needed.
>>
>> Also update the kerneldoc accordingly and move the function to create 
>> the
>> scratch page-tables from xe_pt.c to xe_pt.h since it is accessing
>> vm structure internals and this also makes it possible to make it 
>> static.
>>
>> v2:
>> - Don't try to encode scratch PTEs larger than 1GiB.
>> - Move xe_pt_create_scratch(), Update kerneldoc.
>>
>> Cc: Brian Welty <brian.welty@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com> #for general 
>> direction.
>
> Reviewed-by: Brian Welty <brian.welty@intel.com>
>
Thanks for reviewing, Brian.


> But one nit, and one question further below.
>
>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c       | 65 ++++---------------------
>>   drivers/gpu/drm/xe/xe_pt.h       |  3 --
>>   drivers/gpu/drm/xe/xe_vm.c       | 82 ++++++++++++++++++++++----------
>>   drivers/gpu/drm/xe/xe_vm.h       | 11 +++++
>>   drivers/gpu/drm/xe/xe_vm_types.h |  1 -
>>   5 files changed, 75 insertions(+), 87 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 699a255d75f5..bf33e56715d8 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -50,17 +50,19 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir 
>> *pt_dir, unsigned int index)
>>   static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>>                    unsigned int level)
>>   {
>> -    u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
>> +    struct xe_device *xe = tile_to_xe(tile);
>> +    u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>>       u8 id = tile->id;
>>   -    if (!vm->scratch_bo[id])
>> +    if (!xe_vm_has_scratch(vm))
>>           return 0;
>>   -    if (level > 0)
>> +    if (level > MAX_HUGEPTE_LEVEL)
>>           return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 
>> 1]->bo,
>>                            0, pat_index);
>>   -    return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, 
>> pat_index, 0);
>> +    return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, 
>> IS_DGFX(xe), 0) |
>> +        XE_PTE_NULL;
>
> Nit, but seems a little cleaner to utilize the flags argument?
>     return vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level, 
> IS_DGFX(xe), XE_PTE_NULL);
>
Yes, that's true. Although there is an assert in the function that 
blocks that.  I've been discussing with Lucas to change the interface of 
this function to take a set of generic generic flags.

>>   }
>>     /**
>> @@ -135,7 +137,7 @@ void xe_pt_populate_empty(struct xe_tile *tile, 
>> struct xe_vm *vm,
>>       u64 empty;
>>       int i;
>>   -    if (!vm->scratch_bo[tile->id]) {
>> +    if (!xe_vm_has_scratch(vm)) {
>>           /*
>>            * FIXME: Some memory is allocated already allocated to zero?
>>            * Find out which memory that is and avoid this memset...
>> @@ -194,57 +196,6 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, 
>> struct llist_head *deferred)
>>       kfree(pt);
>>   }
>>   -/**
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
>> -     * scratch entires, rather keep the scratch page in system 
>> memory on
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
>>   /**
>>    * DOC: Pagetable building
>>    *
>> @@ -1289,7 +1240,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct 
>> xe_vma *vma, struct xe_exec_queue
>>        * it needs to be done here.
>>        */
>>       if ((rebind && !xe_vm_in_lr_mode(vm) && 
>> !vm->batch_invalidate_tlb) ||
>> -        (!rebind && vm->scratch_bo[tile->id] && 
>> xe_vm_in_preempt_fence_mode(vm))) {
>> +        (!rebind && xe_vm_has_scratch(vm) && 
>> xe_vm_in_preempt_fence_mode(vm))) {
>>           ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>>           if (!ifence)
>>               return ERR_PTR(-ENOMEM);
>> diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
>> index ba2f3325c84d..71a4fbfcff43 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.h
>> +++ b/drivers/gpu/drm/xe/xe_pt.h
>> @@ -29,9 +29,6 @@ unsigned int xe_pt_shift(unsigned int level);
>>   struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
>>                  unsigned int level);
>>   -int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
>> -             struct xe_vm *vm);
>> -
>>   void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
>>                 struct xe_pt *pt);
>>   diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f585cc7df071..c58da0c390f5 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1329,10 +1329,61 @@ static const struct xe_pt_ops xelp_pt_ops = {
>>     static void vm_destroy_work_func(struct work_struct *w);
>>   +/**
>> + * xe_vm_create_scratch() - Setup a scratch memory pagetable tree 
>> for the
>> + * given tile and vm.
>> + * @xe: xe device.
>> + * @tile: tile to set up for.
>> + * @vm: vm to set up for.
>> + *
>> + * Sets up a pagetable tree with one page-table per level and a single
>> + * leaf PTE. All pagetable entries point to the single page-table or,
>> + * for MAX_HUGEPTE_LEVEL, a NULL huge PTE returning 0 on read and
>> + * writes become NOPs.
>> + *
>> + * Return: 0 on success, negative error code on error.
>> + */
>> +static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile 
>> *tile,
>> +                struct xe_vm *vm)
>> +{
>> +    u8 id = tile->id;
>> +    int i;
>> +
>> +    for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; i++) {
>> +        vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
>> +        if (IS_ERR(vm->scratch_pt[id][i]))
>> +            return PTR_ERR(vm->scratch_pt[id][i]);
>> +
>> +        xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_vm_free_scratch(struct xe_vm *vm)
>> +{
>> +    struct xe_tile *tile;
>> +    u8 id;
>> +
>> +    if (!xe_vm_has_scratch(vm))
>> +        return;
>> +
>> +    for_each_tile(tile, vm->xe, id) {
>> +        u32 i;
>> +
>> +        if (!vm->pt_root[id])
>> +            continue;
>> +
>> +        for (i = MAX_HUGEPTE_LEVEL; i < vm->pt_root[id]->level; ++i)
>> +            if (vm->scratch_pt[id][i])
>> +                xe_pt_destroy(vm->scratch_pt[id][i], vm->flags, NULL);
>> +    }
>> +}
>> +
>>   struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>>   {
>>       struct xe_vm *vm;
>> -    int err, i = 0, number_tiles = 0;
>> +    int err, number_tiles = 0;
>>       struct xe_tile *tile;
>>       u8 id;
>>   @@ -1397,12 +1448,12 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>           }
>>       }
>>   -    if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
>> +    if (xe_vm_has_scratch(vm)) {
>>           for_each_tile(tile, xe, id) {
>>               if (!vm->pt_root[id])
>>                   continue;
>>   -            err = xe_pt_create_scratch(xe, tile, vm);
>> +            err = xe_vm_create_scratch(xe, tile, vm);
>>               if (err)
>>                   goto err_scratch_pt;
>>           }
>> @@ -1466,18 +1517,7 @@ struct xe_vm *xe_vm_create(struct xe_device 
>> *xe, u32 flags)
>>       return vm;
>>     err_scratch_pt:
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
>> +    xe_vm_free_scratch(vm);
>>   err_destroy_root:
>>       for_each_tile(tile, xe, id) {
>>           if (vm->pt_root[id])
>> @@ -1563,17 +1603,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>>        * install a fence to resv. Hence it's safe to
>>        * destroy the pagetables immediately.
>>        */
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
>
> Just curious. Is user-space exec_queue able to still be performing 
> memory accesses and causing page table walks?  In other words, is
> the page table possibly being walked as we teardown here?

Yes, it is. But the page-table buffer objects aren't actually freed 
until any ongoing GPU activity on them is complete, so should be safe.


> Partly, I'm asking as I noticed you switched the order it tears down
> the levels.
>
Were still going from low- to high level in the teardown (but the error 
path on VM creation indeed had that reversed before). There should be no 
GPU accesses of the page tables in the VM creation error path though, so 
I figure it won't matter, but let's see what CI says..

/Thomas


>
>> +    xe_vm_free_scratch(vm);
>>       xe_vm_unlock(vm);
>>         /*
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 9a0ae19c47b7..6563ca33caf2 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -64,6 +64,17 @@ static inline bool 
>> xe_vm_is_closed_or_banned(struct xe_vm *vm)
>>   struct xe_vma *
>>   xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>>   +/**
>> + * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
>> + * @vm: The vm
>> + *
>> + * Return: whether the vm populates unmapped areas with scratch PTEs
>> + */
>> +static inline bool xe_vm_has_scratch(const struct xe_vm *vm)
>> +{
>> +    return vm->flags & XE_VM_FLAG_SCRATCH_PAGE;
>> +}
>> +
>>   static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
>>   {
>>       return container_of(gpuva->vm, struct xe_vm, gpuvm);
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h 
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 23abdfd8622f..f628a7081f27 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -158,7 +158,6 @@ struct xe_vm {
>>       u64 size;
>>         struct xe_pt *pt_root[XE_MAX_TILES_PER_DEVICE];
>> -    struct xe_bo *scratch_bo[XE_MAX_TILES_PER_DEVICE];
>>       struct xe_pt 
>> *scratch_pt[XE_MAX_TILES_PER_DEVICE][XE_VM_MAX_LEVEL];
>>         /**
