Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F7AC4345F
	for <intel-xe@archiver.kernel.org>; Thu, 11 Apr 2024 14:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E5C10F0F1;
	Thu, 11 Apr 2024 14:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FL0gPwCc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3D10F0F1
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Apr 2024 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712844060; x=1744380060;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BS6oMj41RXFPWxR7a3kWIx2Oisary6IEoF8MVquZXIY=;
 b=FL0gPwCc9WIljyMaWafsqyfT4KKF6wD9GO67EFhdDtFw1M7C8RjIND/+
 mFj17P0tgS00vq1c9zPmyQLn9X+iJbcJEoH5kBQl2MSnlx4jqf8y+6HoV
 ieHT6QDQ2R6PiHNytHOkGE6P10y6Wc99nE/A1ObLenWTTd5/ySmk1Ajo2
 ZiHdrGyHUh7LcEHrH2W0og+mePr4oi8EZnDuEIfch6ih23te9VagJR5cu
 +DQ7lYBkb2lbKpbfJNxFYEexpMkF5rslqzlbZP75LoxoOKL+E4XAl1MbT
 lj+MRiphnrzHWvlyK8TR+NltI58NzEkbp5RHQ5bKAhNdqIdUerYqkLqWj g==;
X-CSE-ConnectionGUID: 3U/hYBXzRBSwROVdwbFECg==
X-CSE-MsgGUID: Q5vOB3IAQrard6S5S9vSMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12032750"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="12032750"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:00:59 -0700
X-CSE-ConnectionGUID: lCzBE88FSGSnP+MI7XMLwA==
X-CSE-MsgGUID: NqZ4lCFIRaKyOQkCjBgXig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="51877144"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.52.84])
 ([10.246.52.84])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:00:58 -0700
Message-ID: <379cd420-f3c0-4d50-98b7-ba2ed98e11b3@linux.intel.com>
Date: Thu, 11 Apr 2024 16:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <20240410170308.409-4-nirmoy.das@intel.com>
 <ZhbN0oKKhrc4z0Il@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <ZhbN0oKKhrc4z0Il@DUT025-TGLU.fm.intel.com>
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

Hi Matt,

Sorry, my previous reply wasn't complete, addressing remaining reviews 
here.

On 4/10/2024 7:35 PM, Matthew Brost wrote:
> On Wed, Apr 10, 2024 at 07:03:08PM +0200, Nirmoy Das wrote:
>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>>
>> Given that simultaneous usage of device atomics and CPU atomics on
>> the same SMEM buffer is not guaranteed to function without migration,
>> and UMD expects no migration for SMEM-only buffer objects, so this provide
>> a way to set device atomics when UMD is certain to use the buffer only
>> for device atomics.
>>
> For new uAPI we will need a UMD PR using it and provide a link to the PR
> in the commit message.
>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 27 +++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>   include/uapi/drm/xe_drm.h        |  9 +++++----
>>   3 files changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 8f3474c5f480..530b4bbc186c 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -851,6 +851,7 @@ static void xe_vma_free(struct xe_vma *vma)
>>   #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
>>   #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
>>   #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
>> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
>>   
>>   static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   				    struct xe_bo *bo,
>> @@ -864,6 +865,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>   	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>   	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>> +	bool enable_atomics = (flags & VMA_CREATE_FLAG_IS_NULL);
> s/flags & VMA_CREATE_FLAG_IS_NULL/flags & VMA_CREATE_FLAG_DEVICE_ATOMICS/
Strange that the test worked with this wrong change. Probably made this 
mistake later on. I will fix it.
>
>>   
>>   	xe_assert(vm->xe, start < end);
>>   	xe_assert(vm->xe, end < vm->size);
>> @@ -912,7 +914,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		xe_bo_assert_held(bo);
>>   
>>   		if (GRAPHICS_VER(vm->xe) >= 20 || xe_bo_is_vram(bo) ||
>> -		    !IS_DGFX(vm->xe))
>> +		    !IS_DGFX(vm->xe) || enable_atomics)
>>   			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>   
>>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>> @@ -2174,6 +2176,18 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   	       operation, (ULL)addr, (ULL)range,
>>   	       (ULL)bo_offset_or_userptr);
>>   
>> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +	    (vm->xe->info.platform == XE_PVC && !xe_bo_is_vram(bo))) {
>> +		drm_warn(&vm->xe->drm, "Setting device atomics on SMEM is not supported for this platform");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	if (bo && (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +	    !xe_bo_has_single_placement(bo))
>> +		drm_warn(&vm->xe->drm, "DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS can be only set if the BO has single placement");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
> A few things here.
>
> - These check should go in xe_vm_bind_ioctl() in the loop that looks up
>    the BOs and parses them. Probably move implementation to a helper(s)
>    too as it is already a pretty big ugly loop in xe_vm_bind_ioctl and
>    adding more logic will make it uglier. Search for
>    drm_gem_object_lookup in xe_vm_bind_ioctl() for the loop I am refering
>    to.
>
> - Rather than drm_warns just use XE_IOCTL_DBG for these checks, that is
>    the style or input to IOCTLs when we return -EINVAL in Xe.
I will do that, thanks for pointing out.
>
> - Are these checks valid? At one point on PVC I had to code to do
>    atomics between CPU and GPU by migrating the BO back and forth on page
>    faults. I think the i915 does this too? Are we abandoning that idea?

Currently we only set PTE_AE on LMEM for all dgfx. With this flag, we 
can set that pte bit  for SMEM only BO

which isn't valid for PVC as you pointed out above. UMD expects no 
migration for SMEM-only so on PVC,  we can't set this

bit for SMEM only BO which is why I am returning an error.

>
> - Lastly if these check are valid, rather than a platform check in the
>    code I'd rather see a bit in intel_device_info.
Ok makes  sense. I will add one.
>
>>   	switch (operation) {
>>   	case DRM_XE_VM_BIND_OP_MAP:
>>   	case DRM_XE_VM_BIND_OP_MAP_USERPTR:
>> @@ -2216,6 +2230,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   		if (__op->op == DRM_GPUVA_OP_MAP) {
>>   			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>> +			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>   			op->map.pat_index = pat_index;
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>   			op->prefetch.region = prefetch_region;
>> @@ -2412,6 +2427,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				VMA_CREATE_FLAG_IS_NULL : 0;
>>   			flags |= op->map.dumpable ?
>>   				VMA_CREATE_FLAG_DUMPABLE : 0;
>> +			flags |= op->map.enable_device_atomics ?
>> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>   
>>   			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>   				      flags);
>> @@ -2439,6 +2456,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>   
>>   				vma = new_vma(vm, op->base.remap.prev,
>>   					      old->pat_index, flags);
>> @@ -2476,6 +2495,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>> +
> Extra newline.
>
>>   
>>   				vma = new_vma(vm, op->base.remap.next,
>>   					      old->pat_index, flags);
>> @@ -2831,7 +2853,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>   	 DRM_XE_VM_BIND_FLAG_NULL | \
>> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
>> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>   #define XE_64K_PAGE_MASK 0xffffull
>>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index badf3945083d..7b9c68909c78 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -282,6 +282,8 @@ struct xe_vma_op_map {
>>   	bool dumpable;
>>   	/** @pat_index: The pat index to use for this operation. */
>>   	u16 pat_index;
>> +	/** @enable_device_atomics: Whether the VMA will allow device atomics */
>> +	bool enable_device_atomics;
> Put this next to the other bools in xe_vma_op_map.
Will do that.
>
>>   };
>>   
>>   /** struct xe_vma_op_remap - VMA remap operation */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 1446c3bae515..bffe8b1c040c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -969,10 +969,11 @@ struct drm_xe_vm_bind_op {
>>   	/** @op: Bind operation to perform */
>>   	__u32 op;
>>   
>> -#define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
>> -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>> -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>> -#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
>> +#define DRM_XE_VM_BIND_FLAG_READONLY		(1 << 0)
>> +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 << 1)
>> +#define DRM_XE_VM_BIND_FLAG_NULL		(1 << 2)
>> +#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 << 3)
>> +#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 << 4)
> Kernel doc for new flag.

Will add in my next revision .


Thanks,

Nirmoy

>
> Matt
>
>>   	/** @flags: Bind flags */
>>   	__u32 flags;
>>   
>> -- 
>> 2.42.0
>>
