Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBC4C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 10:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2469E10F457;
	Mon, 22 Apr 2024 10:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SdxKxa0v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC86310F50E
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713780759; x=1745316759;
 h=message-id:date:mime-version:from:subject:to:references:
 in-reply-to:content-transfer-encoding;
 bh=tN5VGQQk1S1ieU0S0B1wXq0bWCx7AKgjbG8hu24LXG4=;
 b=SdxKxa0vGqOi9O6vn/oeKG1aX3RVp43Mq5uXg0obp4sB5qXXdr4Nk8af
 7oq9/Wa3p9itlVcsX5qz4Mx+r25/NR8VDaQnzpNnXWJdXxw3L9Et4HJ2/
 9te5jbkkfNCPRD8Ek//xP+LqPCsxoxvLufKSCeIGHxgRDt5p63ZUm/4HM
 bNteNnTIB8S/edjTSpl5NHgYXZYqSn86aA/0+tzRHAklBmg94PM0oAKbi
 URmFCtXB7IomAuaQLbRMA7/OLlBm+Mf44KYhpv8WI3RbfGDCXF4FItLOb
 oRLe2Y1krFBULw5PJQL1HwUDBipyPX3eqlDCwKTItUTe/w/L3SvRvt1zi g==;
X-CSE-ConnectionGUID: pqw/cTVzQJ2tg7eNuxSBZA==
X-CSE-MsgGUID: TGePwLGURq644UOWgwpjwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20005426"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20005426"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:12:38 -0700
X-CSE-ConnectionGUID: VgfbGRwYSJyBFdzO0zLnTQ==
X-CSE-MsgGUID: 6lEHY0lATPuKwNGQxhif0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24053874"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.249.155])
 ([10.94.249.155])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 03:12:38 -0700
Message-ID: <930a47b5-112e-4451-b7c7-51501122b8f3@linux.intel.com>
Date: Mon, 22 Apr 2024 12:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nirmoy Das <nirmoy.das@linux.intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: "Zeng, Oak" <oak.zeng@intel.com>, "Das, Nirmoy" <nirmoy.das@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-7-nirmoy.das@intel.com>
 <SA1PR11MB69914921FA73C83445D0898C920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SA1PR11MB69914921FA73C83445D0898C920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
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

Hi Oak,

On 4/19/2024 11:04 PM, Zeng, Oak wrote:
>> -----Original Message-----
>> From: Intel-xe<intel-xe-bounces@lists.freedesktop.org>  On Behalf Of
>> Nirmoy Das
>> Sent: Monday, April 15, 2024 10:52 AM
>> To:intel-xe@lists.freedesktop.org
>> Cc: Das, Nirmoy<nirmoy.das@intel.com>
>> Subject: [PATCH v3 6/7] drm/xe/uapi: Introduce VMA bind flag for device
>> atomics
>>
>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
> I think we can drop " on SMEM only buffers". We are introducing a vm bind flag and its behavior should be defined for all the allocations: device allocation, host allocation, shared allocation (and the future system allocator)


Applying this flag to device allocation will have no effect. I was 
thinking of returning an error for shared allocation (multi-region BO), 
but I agree with your point that the flag should be applied to all 
allocations. So, for shared allocation too, it should have no effect, as 
such allocations by default supports device atomics.

>> Given that simultaneous usage of device atomics and CPU atomics on
>> the same SMEM buffer is not guaranteed to function without migration,
>> and UMD expects no migration for SMEM-only buffer objects, so this provide
>> a way to set device atomics when UMD is certain to use the buffer only
>> for device atomics.
> I think it a little differently. We are providing a device_atomic flag. We should validate whether this vma support device_atomic or not, based on the allocation type (device, host or shared or system allocator) on specific HW platform. If vma doesn't support device atomic, we should report error to user.


Agreed. This patch is doing it partially, will modify this to reflect it.

> Regarding whether we should set the AE bit in pte, I think we can set it regardless the user setting. As long as this vma *can* support device atomic on this platform, we can set the AE bit, regardless whether user set the DEVICE_ATOMIC flag or not.


The user setting is for modifying the default behavior. In the case of 
SMEM only BO, the default behavior is no device atomics.

> Now regarding the SMEM-only buffer (aka host only allocation), on XE2 platform, we can perform device atomic, so it is safe to set AE bit regardless user setting DEVICE_ATOMIC flag or not.

It's true that XE2 supports device atomics on SMEM. However, the issue 
lies with SMEM-only BO that an application can freely utilize it for CPU 
atomics without any restrictions. So the default behavior for such BO 
excludes device atomics to prevent cpu/gpu

atomics on the same buffer. So we need this flag to change the default 
behavior.


> On platform before XE2, the set of DEVICE_ATOMIC on SMEM-only VMA should fail.


To keep query uAPI simple, I think this flag should get ignored on 
platforms that doesn't have AE pte bit as  device atomics is supported 
on SMEM for those platforms.

Otherwise we will need two flags, one for platform with AE pte bit but 
doesn't support device atomics on SMEM-only BO, PVC.

Another for platform that doesn't have this bit like dg2.

> In the future, we might also introduce a SYSTEM_ATOMIC flag which should not affect AE bit setting also, but can affect migration behavior.


Migration needs gpu fault which can only happen if  AE=0 so I don't get 
your above point.

> If platform doesn't support system atomic on smem-only buffer, the setting should return error to user.

Yes, this patch is returning error on PVC.

>
> So I think the AE bit can be set as long as allocation type (device, host or share) allow device atomic operation on this platform. Not affected by user vm bind flag (or madvise api).


We have to consider what is default behavior of an allocation and the 
atomic vm bind  flag(DEVICE_ATOMICS/SYSTEM_ATOMICS) to decide what to do 
with AE bit.


Thanks,

Nirmoy

>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 28 ++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>>   include/uapi/drm/xe_drm.h        | 17 +++++++++++++----
>>   3 files changed, 39 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 8380f1d23074..b0907a7bb88b 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -753,6 +753,7 @@ static void xe_vma_free(struct xe_vma *vma)
>>   #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
>>   #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
>>   #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
>> +#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
>>
>>   static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   				    struct xe_bo *bo,
>> @@ -766,6 +767,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>> *vm,
>>   	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>   	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>   	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>> +	bool enable_atomics = (flags &
>> VMA_CREATE_FLAG_DEVICE_ATOMICS);
>>
>>   	xe_assert(vm->xe, start < end);
>>   	xe_assert(vm->xe, end < vm->size);
>> @@ -814,7 +816,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm
>> *vm,
>>   		xe_bo_assert_held(bo);
>>
>>   		if (vm->xe->info.has_atomic_enable_pte_bit &&
>> -		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
>> +		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe) ||
>> enable_atomics))
> As explained above, I don't think AE should be affected by DEVICE_ATOMIC flag. It is safe to set AE as long as this bo support device atomic on this hw platform, regardless user setting.
>
>
>>   			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>
>>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo-
>>> ttm.base);
>> @@ -2116,6 +2118,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
>> struct xe_bo *bo,
>>   		if (__op->op == DRM_GPUVA_OP_MAP) {
>>   			op->map.is_null = flags &
>> DRM_XE_VM_BIND_FLAG_NULL;
>>   			op->map.dumpable = flags &
>> DRM_XE_VM_BIND_FLAG_DUMPABLE;
>> +			op->map.enable_device_atomics = flags &
>> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>   			op->map.pat_index = pat_index;
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>   			op->prefetch.region = prefetch_region;
>> @@ -2312,6 +2315,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
>> *vm, struct xe_exec_queue *q,
>>   				VMA_CREATE_FLAG_IS_NULL : 0;
>>   			flags |= op->map.dumpable ?
>>   				VMA_CREATE_FLAG_DUMPABLE : 0;
>> +			flags |= op->map.enable_device_atomics ?
>> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>
>>   			vma = new_vma(vm, &op->base.map, op-
>>> map.pat_index,
>>   				      flags);
>> @@ -2339,6 +2344,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
>> *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags
>> &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +
>> 	VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>
>>   				vma = new_vma(vm, op->base.remap.prev,
>>   					      old->pat_index, flags);
>> @@ -2376,6 +2383,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm
>> *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags
>> &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +
>> 	VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>
>>   				vma = new_vma(vm, op->base.remap.next,
>>   					      old->pat_index, flags);
>> @@ -2731,7 +2740,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm
>> *vm,
>>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>   	 DRM_XE_VM_BIND_FLAG_NULL | \
>> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
>> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>   #define XE_64K_PAGE_MASK 0xffffull
>>   #define ALL_DRM_XE_SYNCS_FLAGS
>> (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>
>> @@ -2874,7 +2884,7 @@ static int vm_bind_ioctl_signal_fences(struct
>> xe_vm *vm,
>>
>>   static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo
>> *bo,
>>   					u64 addr, u64 range, u64 obj_offset,
>> -					u16 pat_index)
>> +					u16 pat_index, u32 flags)
>>   {
>>   	u16 coh_mode;
>>
>> @@ -2909,6 +2919,15 @@ static int xe_vm_bind_ioctl_validate_bo(struct
>> xe_device *xe, struct xe_bo *bo,
>>   		return  -EINVAL;
>>   	}
>>
>> +	if (XE_IOCTL_DBG(xe, (flags &
>> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +			 (!xe->info.has_device_atomics_on_smem &&
>> +			  !xe_bo_is_vram(bo))))
>> +		return -EINVAL;
> Above check is good for host allocation.
>
> For shared allocation, if bo's current placement is in SMEM, we can't return error, see below
>
>
>> +
>> +	if (XE_IOCTL_DBG(xe, (flags &
>> DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +			 !xe_bo_has_single_placement(bo)))
>> +		return -EINVAL;
> A shared allocation can have DEVICE_ATOMIC flag perfectly. This is not an error. Performing device atomic on shared allocation also have real use case: just imagine multiple workgroups/thread on device, or on multiple devices perform device atomic to the buffer, so they can be synchronized.
>
> For all shared allocation, since the final backing store can be optionally in device memory, so we have to allow user to set the DEVICE_ATOMIC to any shared allocation. Driver can migrate shared allocation to device memory if needed for such case.
>
>
>> +
>>   	return 0;
>>   }
>>
>> @@ -3007,7 +3026,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void
>> *data, struct drm_file *file)
>>   		bos[i] = gem_to_xe_bo(gem_obj);
>>
>>   		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
>> -						   obj_offset, pat_index);
>> +						   obj_offset, pat_index,
>> +						   bind_ops[i].flags);
>>   		if (err)
>>   			goto put_obj;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
>> b/drivers/gpu/drm/xe/xe_vm_types.h
>> index badf3945083d..5a20bd80c456 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -276,6 +276,8 @@ struct xe_vm {
>>   struct xe_vma_op_map {
>>   	/** @vma: VMA to map */
>>   	struct xe_vma *vma;
>> +	/** @enable_device_atomics: Whether the VMA will allow device
>> atomics */
>> +	bool enable_device_atomics;
>>   	/** @is_null: is NULL binding */
>>   	bool is_null;
>>   	/** @dumpable: whether BO is dumped on GPU hang */
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 1446c3bae515..ca4447e10ac9 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -883,6 +883,14 @@ struct drm_xe_vm_destroy {
>>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>>    *    implement VK sparse bindings.
>> + *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set
>> for
>> + *    a VA range, all the corresponding PTEs will have atomic access bit
>> + *    set. This will allow device atomics operation for that VA range.
>> + *    This flag only works for single placement buffer objects
> As explained, we are introducing an API which should be general enough. It should target for shared allocation (multiple placement) buffer object
>
>
>   and
>> + *    mainly for SMEM only buffer objects where CPU atomics can be
>> perform
>> + *    by an application and so KMD can not set device atomics on such buffers
>> + *    by default.
> As long as this platform support device atomic to smem, it is safe for kmd to set AE.
>
> The not allowed case is: if smem doesn't support system atomic but user want to set a SYSTEM_ATOMIC (not introduced yet) flag, we should return error to user.
>
>
> Oak
>
>
> This flag has no effect on LMEM only placed buffers as
>> atomic
>> + *    access bit is always set for LMEM backed PTEs.
>>    */
>>   struct drm_xe_vm_bind_op {
>>   	/** @extensions: Pointer to the first extension struct, if any */
>> @@ -969,10 +977,11 @@ struct drm_xe_vm_bind_op {
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
>>   	/** @flags: Bind flags */
>>   	__u32 flags;
>>
>> --
>> 2.42.0
