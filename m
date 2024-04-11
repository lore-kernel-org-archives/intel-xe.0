Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46772C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 14:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FD210EC7E;
	Thu, 11 Apr 2024 14:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdNu5Odk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25B210F126
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712845987; x=1744381987;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=k0oDTqm9l7Ua89T4u59a0hefuJbxaHgxlnB8xOzvXgk=;
 b=DdNu5OdkTupAvD0JW5ihe87zi31dXp4YQhHxaX6ntpC1rA3TKRuvmDXz
 6NTpeXvyrgVnwdJmhANLxh2RgV8mJs5SsAi9Nj+AYcxGNdpNaJQOROvs4
 yLYnrR8dsmC+pa+Eioe+QVtOnJmmCxXRTT1Olm6Jd69oXvPMS/82kQH15
 jirsnDHpZzpDmuXwFndXdnqWWe/rpTlrdWfTNSzz5Qm58W0JktwyFTAJp
 qygKFIs2iw1uvTh5UkbHTUok6bt2IaDpbXrGh9DFHE/5VNmeHH9iOpCLV
 edND5tLVWxk8HTX37qdbo/bTfmb3os0FdRmDOOYj/3Mq5TILydMq61TSn w==;
X-CSE-ConnectionGUID: UarWKPNvTtid195QaOZPAQ==
X-CSE-MsgGUID: jE9I2/n6SHCFLjgPgCsIew==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8115319"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8115319"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:32:56 -0700
X-CSE-ConnectionGUID: cMP4Fr13QoiaL1Rq/nIU/g==
X-CSE-MsgGUID: MfOpntusTrGIJz0j2BRZkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="44197774"
Received: from anishett-mobl2.gar.corp.intel.com (HELO [10.246.52.84])
 ([10.246.52.84])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:32:55 -0700
Message-ID: <b357a7f5-0124-485a-ac80-529426d450bd@linux.intel.com>
Date: Thu, 11 Apr 2024 16:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: "Souza, Jose" <jose.souza@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
 <1fec7a86-7100-4e60-919a-ef495d61f1e3@intel.com>
 <7addaf63-6945-434f-8f9f-8341e0fafa26@intel.com>
 <17cbfe83-fa8c-4494-ac96-9ff5630c40ee@intel.com>
 <26b269d21a11e2b2b5372993416bf689ef2c9eeb.camel@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <26b269d21a11e2b2b5372993416bf689ef2c9eeb.camel@intel.com>
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

Hi Jose,

On 4/11/2024 4:07 PM, Souza, Jose wrote:
> On Thu, 2024-04-11 at 17:00 +0300, Lionel Landwerlin wrote:
>> On 11/04/2024 16:42, Nirmoy Das wrote:
>>> Hi Lionel,
>>>
>>> On 4/11/2024 3:14 PM, Lionel Landwerlin wrote:
>>>> On 10/04/2024 20:03, Nirmoy Das wrote:
>>>>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>>>>>
>>>>> Given that simultaneous usage of device atomics and CPU atomics on
>>>>> the same SMEM buffer is not guaranteed to function without migration,
>>>>> and UMD expects no migration for SMEM-only buffer objects, so this
>>>>> provide
>>>>> a way to set device atomics when UMD is certain to use the buffer only
>>>>> for device atomics.
>>>>>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>>>>>    drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>>>>    include/uapi/drm/xe_drm.h        |  9 +++++----
>>>>>    3 files changed, 32 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>> index 8f3474c5f480..530b4bbc186c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>>>>>    #define VMA_CREATE_FLAG_READ_ONLY    BIT(0)
>>>>>    #define VMA_CREATE_FLAG_IS_NULL        BIT(1)
>>>>>    #define VMA_CREATE_FLAG_DUMPABLE    BIT(2)
>>>>> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS    BIT(3)
>>>>>      static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>>>>                        struct xe_bo *bo,
>>>>> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>>>>> *vm,
>>>>>        bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>>>>        bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>>>>        bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>>>>> +    bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
>>>>>          xe_assert(vm->xe, start < end);
>>>>>        xe_assert(vm->xe, end < vm->size);
>>>>> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>>>>> *vm,
>>>>>            xe_bo_assert_held(bo);
>>>>>              if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
>>>>> -            !IS_DGFX(vm->xe))
>>>>> +            !IS_DGFX(vm->xe) || enable_atomics)
>>>>>                vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>>>>              vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>>>>> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>>>>> struct xe_bo *bo,
>>>>>               operation, (ULL)addr, (ULL)range,
>>>>>               (ULL)bo_offset_or_userptr);
>>>>>    +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>>>>> +        (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
>>>>> +        drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is
>>>>> not supported for this platform");
>>>>> +        return ERR_PTR(-EINVAL);
>>>>> +    }
>>>>> +
>>>>> +    if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>>>>> +        !xe_bo_has_single_placement(bo))
>>>>> +        drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS
>>>>> can be only set if the BO has single placement");
>>>>> +        return ERR_PTR(-EINVAL);
>>>>> +    }
>>>>> +
>>>>>        switch (operation) {
>>>>>        case DRM_XE_VM_BIND_OP_MAP:
>>>>>        case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>>>>> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>>>>> struct xe_bo *bo,
>>>>>            if (__op->op == DRM_GPUVA_OP_MAP) {
>>>>>                op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>>>>                op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>>>>> +            op->map.enable_device_atomics = flags &
>>>>> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>>>>                op->map.pat_index = pat_index;
>>>>>            } else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>>>>                op->prefetch.region = prefetch_region;
>>>>> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>                    VMA_CREATE_FLAG_IS_NULL : 0;
>>>>>                flags |= op->map.dumpable ?
>>>>>                    VMA_CREATE_FLAG_DUMPABLE : 0;
>>>>> +            flags |= op->map.enable_device_atomics ?
>>>>> +                VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>>>                  vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>>>>                          flags);
>>>>> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>                    flags |= op->base.remap.unmap->va->flags &
>>>>>                        XE_VMA_DUMPABLE ?
>>>>>                        VMA_CREATE_FLAG_DUMPABLE : 0;
>>>>> +                flags |= op->base.remap.unmap->va->flags ?
>>>>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>>>                      vma = new_vma(vm, op->base.remap.prev,
>>>>>                              old->pat_index, flags);
>>>>> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct
>>>>> xe_vm *vm, struct xe_exec_queue *q,
>>>>>                    flags |= op->base.remap.unmap->va->flags &
>>>>>                        XE_VMA_DUMPABLE ?
>>>>>                        VMA_CREATE_FLAG_DUMPABLE : 0;
>>>>> +                flags |= op->base.remap.unmap->va->flags ?
>>>>> +                    VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>>>> +
>>>>>                      vma = new_vma(vm, op->base.remap.next,
>>>>>                              old->pat_index, flags);
>>>>> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct
>>>>> xe_vm *vm,
>>>>>        (DRM_XE_VM_BIND_FLAG_READONLY | \
>>>>>         DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>>>>         DRM_XE_VM_BIND_FLAG_NULL | \
>>>>> -     DRM_XE_VM_BIND_FLAG_DUMPABLE)
>>>>> +     DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>>>>> +     DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>>>>    #define XE_64K_PAGE_MASK 0xffffull
>>>>>    #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>>>>    diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>> b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>> index badf3945083d..7b9c68909c78 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>>>>> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>>>>>        bool dumpable;
>>>>>        /** @pat_index: The pat index to use for this operation. */
>>>>>        u16 pat_index;
>>>>> +    /** @enable_device_atomics: Whether the VMA will allow device
>>>>> atomics */
>>>>> +    bool enable_device_atomics;
>>>>>    };
>>>>>      /** struct xe_vma_op_remap - VMA remap operation */
>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>> index 1446c3bae515..bffe8b1c040c 100644
>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>>>>>        /** @op: Bind operation to perform */
>>>>>        __u32 op;
>>>>>    -#define DRM_XE_VM_BIND_FLAG_READONLY    (1 << 0)
>>>>> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE    (1 << 1)
>>>>> -#define DRM_XE_VM_BIND_FLAG_NULL    (1 << 2)
>>>>> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE    (1 << 3)
>>>>> +#define DRM_XE_VM_BIND_FLAG_READONLY        (1 << 0)
>>>>> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE        (1 << 1)
>>>>> +#define DRM_XE_VM_BIND_FLAG_NULL        (1 << 2)
>>>>> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE        (1 << 3)
>>>>
>>>> We should probably document that it's an error to add this flag if
>>>> the BO has a single memory region.
>>> It is an error if this flag is set on non single memory region as
>>> atomics on SMEM+LMEM  buffer will be handled with migration.
>>>
>>> Let me know if I got that wrong.
>>>
>>>> Are we supposed to the ability to set that flag or is there going to
>>>> be a query?
>>>>
>>>> A query might make sense since it's going to be rejected for some
>>>> platform.
>>> Can we use the rejection as a query ? I am using it in a IGT test
>>> https://patchwork.freedesktop.org/patch/588759/?series=132289&rev=1
>>>
>>>
> That was not acceptable for DRM_XE_VM_BIND_FLAG_DUMPABLE. At the end we were able to land DRM_XE_VM_BIND_FLAG_DUMPABLE in Linux 6.8 so we did not
> needed the query. But for this one will be needed.

If the rejection can't work as query, I can add one.  Would 
adding(DRM_XE_QUERY_CONFIG_SUPP_DEV_ATOMIC_ON_SMEM) a new flag into 
'struct drm_xe_query_config'  work ?


Regards,

Nirmoy

>
>
>>> Regards,
>>>
>>> Nirmoy
>>
>> Okay, sounds doable.
>>
>> Will try to put up an MR for Mesa soon.
>>
>>
>> -Lionel
>>
>>
>>>>
>>>> -Lionel
>>>>
>>>>
>>>>> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS    (1 << 4)
>>>>>        /** @flags: Bind flags */
>>>>>        __u32 flags;
>>>>
