Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B557C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 08:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D441410F4D5;
	Mon, 22 Apr 2024 08:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfGAW1Pc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D0110F4D5
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 08:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713775148; x=1745311148;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=/2nCN8dVkZv5vplcwnxMrihrL0Qi7MLAPLtBBZCXdIo=;
 b=BfGAW1Pcfzm3o/MO2i2IHpbPgdPs+L2vfdrZYLJ5jDiUR1yws6QFhdQv
 IRwoSus2iaXC5CJEXwFoIZiXNvDD/JLqyAA2daAJ46mTAXZrM7WXOI6v9
 Ej9TtfRRzhu0VYHE9lUhAXY3gr3hh8JTAuTFDtBOCFVA93pJY9trTKADC
 +Q3sfDV700NcOzCD3YomcM4XduEbIEiTKjXBMpYcwWSZeoDbFKabZ9vXJ
 OnO2zfqSj93pmy9MIbVCpJy0eOqA1bQDxdMJr8jcka2eKtlg4+rJ57reR
 Eyz8bg0HRiS/lfcxkW2/7ElHscRzljHHBR8K8epuXqDU9msO5LgoOit39 g==;
X-CSE-ConnectionGUID: Jd78rR0GRKKpfhM3lW6wAA==
X-CSE-MsgGUID: Qx77PQ7gQtaKYpA4fqNM3Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9412698"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208,217";a="9412698"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 01:39:08 -0700
X-CSE-ConnectionGUID: wYv4PlNpTWirTZ+EDy3cKA==
X-CSE-MsgGUID: 5Rz3QpENTt6lO/F1MkaMZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208,217";a="28717625"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.180])
 ([10.246.48.180])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 01:39:07 -0700
Content-Type: multipart/alternative;
 boundary="------------0V9F1SiB3tRbttPCWyeOGb0R"
Message-ID: <2c71fbdd-3214-44d6-94d6-e99aee8639aa@linux.intel.com>
Date: Mon, 22 Apr 2024 10:39:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] drm/xe/uapi: Introduce VMA bind flag for device
 atomics
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-7-nirmoy.das@intel.com>
 <f763388c-2d45-4780-90c0-8ac8c359e090@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <f763388c-2d45-4780-90c0-8ac8c359e090@intel.com>
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

This is a multi-part message in MIME format.
--------------0V9F1SiB3tRbttPCWyeOGb0R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lionel,

On 4/19/2024 9:16 AM, Lionel Landwerlin wrote:
> On 15/04/2024 17:52, Nirmoy Das wrote:
>> Adds a new VMA bind flag to enable device atomics on SMEM only buffers.
>>
>> Given that simultaneous usage of device atomics and CPU atomics on
>> the same SMEM buffer is not guaranteed to function without migration,
>> and UMD expects no migration for SMEM-only buffer objects, so this provide
>> a way to set device atomics when UMD is certain to use the buffer only
>> for device atomics.
>>
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
>> @@ -766,6 +767,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   	bool read_only = (flags & VMA_CREATE_FLAG_READ_ONLY);
>>   	bool is_null = (flags & VMA_CREATE_FLAG_IS_NULL);
>>   	bool dumpable = (flags & VMA_CREATE_FLAG_DUMPABLE);
>> +	bool enable_atomics = (flags & VMA_CREATE_FLAG_DEVICE_ATOMICS);
>>   
>>   	xe_assert(vm->xe, start < end);
>>   	xe_assert(vm->xe, end < vm->size);
>> @@ -814,7 +816,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		xe_bo_assert_held(bo);
>>   
>>   		if (vm->xe->info.has_atomic_enable_pte_bit &&
>> -		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))
>> +		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe) || enable_atomics))
>>   			vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>>   
>>   		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
>> @@ -2116,6 +2118,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   		if (__op->op == DRM_GPUVA_OP_MAP) {
>>   			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
>>   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
>> +			op->map.enable_device_atomics = flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
>>   			op->map.pat_index = pat_index;
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>>   			op->prefetch.region = prefetch_region;
>> @@ -2312,6 +2315,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				VMA_CREATE_FLAG_IS_NULL : 0;
>>   			flags |= op->map.dumpable ?
>>   				VMA_CREATE_FLAG_DUMPABLE : 0;
>> +			flags |= op->map.enable_device_atomics ?
>> +				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>   
>>   			vma = new_vma(vm, &op->base.map, op->map.pat_index,
>>   				      flags);
>> @@ -2339,6 +2344,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>   
>>   				vma = new_vma(vm, op->base.remap.prev,
>>   					      old->pat_index, flags);
>> @@ -2376,6 +2383,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>>   				flags |= op->base.remap.unmap->va->flags &
>>   					XE_VMA_DUMPABLE ?
>>   					VMA_CREATE_FLAG_DUMPABLE : 0;
>> +				flags |= op->base.remap.unmap->va->flags ?
>> +					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
>>   
>>   				vma = new_vma(vm, op->base.remap.next,
>>   					      old->pat_index, flags);
>> @@ -2731,7 +2740,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>>   	 DRM_XE_VM_BIND_FLAG_NULL | \
>> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
>> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
>> +	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
>>   #define XE_64K_PAGE_MASK 0xffffull
>>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>>   
>> @@ -2874,7 +2884,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
>>   
>>   static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>>   					u64 addr, u64 range, u64 obj_offset,
>> -					u16 pat_index)
>> +					u16 pat_index, u32 flags)
>>   {
>>   	u16 coh_mode;
>>   
>> @@ -2909,6 +2919,15 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>>   		return  -EINVAL;
>>   	}
>>   
>> +	if (XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +			 (!xe->info.has_device_atomics_on_smem &&
>> +			  !xe_bo_is_vram(bo))))
>> +		return -EINVAL;
>
>
> Is the check correct?
>
> I'm not sure what you're trying to forbid here.
>
I should have added a comment. I will add more details in my next revision.

I wanted to forbid setting this flag on platform that doesn't support

device atomics on SMEM only BO like PVC.


>
> I would have guessed :
>
>
>   (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>   (!xe->info.has_device_atomics_on_smem || !xe_bo_is_vram(bo))
>
>
>> +
>> +	if (XE_IOCTL_DBG(xe, (flags & DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &&
>> +			 !xe_bo_has_single_placement(bo)))
>> +		return -EINVAL;
>> +
>>   	return 0;
>>   }
>>   
>> @@ -3007,7 +3026,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		bos[i] = gem_to_xe_bo(gem_obj);
>>   
>>   		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
>> -						   obj_offset, pat_index);
>> +						   obj_offset, pat_index,
>> +						   bind_ops[i].flags);
>>   		if (err)
>>   			goto put_obj;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index badf3945083d..5a20bd80c456 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -276,6 +276,8 @@ struct xe_vm {
>>   struct xe_vma_op_map {
>>   	/** @vma: VMA to map */
>>   	struct xe_vma *vma;
>> +	/** @enable_device_atomics: Whether the VMA will allow device atomics */
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
>> + *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set for
>> + *    a VA range, all the corresponding PTEs will have atomic access bit
>> + *    set. This will allow device atomics operation for that VA range.
>> + *    This flag only works for single placement buffer objects and
>> + *    mainly for SMEM only buffer objects where CPU atomics can be perform
>> + *    by an application and so KMD can not set device atomics on such buffers
>> + *    by default. This flag has no effect on LMEM only placed buffers as atomic
>> + *    access bit is always set for LMEM backed PTEs.
>
>
> Maybe we should be more explicit about when this flag is allowed :
>
>   - error ifDRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM is not 
> reported
>
> - error on multi region BOs
>
> - ignored for LMEM only BOs
>

Agreed, the comment probably is not very clear. I will add more explicit 
requirements for this flag by expanding this comment.


Regards,

Nirmoy

> -Lionel
>
>
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
>
>
--------------0V9F1SiB3tRbttPCWyeOGb0R
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Lionel,<br>
    </p>
    <div class="moz-cite-prefix">On 4/19/2024 9:16 AM, Lionel Landwerlin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:f763388c-2d45-4780-90c0-8ac8c359e090@intel.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div class="moz-cite-prefix">On 15/04/2024 17:52, Nirmoy Das
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:20240415145214.25641-7-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">Adds a new VMA bind flag to enable device atomics on SMEM only buffers.

Given that simultaneous usage of device atomics and CPU atomics on
the same SMEM buffer is not guaranteed to function without migration,
and UMD expects no migration for SMEM-only buffer objects, so this provide
a way to set device atomics when UMD is certain to use the buffer only
for device atomics.

Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E"
        href="mailto:nirmoy.das@intel.com" moz-do-not-send="true">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c       | 28 ++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 include/uapi/drm/xe_drm.h        | 17 +++++++++++++----
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8380f1d23074..b0907a7bb88b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -753,6 +753,7 @@ static void xe_vma_free(struct xe_vma *vma)
 #define VMA_CREATE_FLAG_READ_ONLY	BIT(0)
 #define VMA_CREATE_FLAG_IS_NULL		BIT(1)
 #define VMA_CREATE_FLAG_DUMPABLE	BIT(2)
+#define VMA_CREATE_FLAG_DEVICE_ATOMICS	BIT(3)
 
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
@@ -766,6 +767,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	bool read_only = (flags &amp; VMA_CREATE_FLAG_READ_ONLY);
 	bool is_null = (flags &amp; VMA_CREATE_FLAG_IS_NULL);
 	bool dumpable = (flags &amp; VMA_CREATE_FLAG_DUMPABLE);
+	bool enable_atomics = (flags &amp; VMA_CREATE_FLAG_DEVICE_ATOMICS);
 
 	xe_assert(vm-&gt;xe, start &lt; end);
 	xe_assert(vm-&gt;xe, end &lt; vm-&gt;size);
@@ -814,7 +816,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		xe_bo_assert_held(bo);
 
 		if (vm-&gt;xe-&gt;info.has_atomic_enable_pte_bit &amp;&amp;
-		    (xe_bo_is_vram(bo) || !IS_DGFX(vm-&gt;xe)))
+		    (xe_bo_is_vram(bo) || !IS_DGFX(vm-&gt;xe) || enable_atomics))
 			vma-&gt;gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 		vm_bo = drm_gpuvm_bo_obtain(vma-&gt;gpuva.vm, &amp;bo-&gt;ttm.base);
@@ -2116,6 +2118,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		if (__op-&gt;op == DRM_GPUVA_OP_MAP) {
 			op-&gt;map.is_null = flags &amp; DRM_XE_VM_BIND_FLAG_NULL;
 			op-&gt;map.dumpable = flags &amp; DRM_XE_VM_BIND_FLAG_DUMPABLE;
+			op-&gt;map.enable_device_atomics = flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS;
 			op-&gt;map.pat_index = pat_index;
 		} else if (__op-&gt;op == DRM_GPUVA_OP_PREFETCH) {
 			op-&gt;prefetch.region = prefetch_region;
@@ -2312,6 +2315,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				VMA_CREATE_FLAG_IS_NULL : 0;
 			flags |= op-&gt;map.dumpable ?
 				VMA_CREATE_FLAG_DUMPABLE : 0;
+			flags |= op-&gt;map.enable_device_atomics ?
+				VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 			vma = new_vma(vm, &amp;op-&gt;base.map, op-&gt;map.pat_index,
 				      flags);
@@ -2339,6 +2344,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags &amp;
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 				vma = new_vma(vm, op-&gt;base.remap.prev,
 					      old-&gt;pat_index, flags);
@@ -2376,6 +2383,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags &amp;
 					XE_VMA_DUMPABLE ?
 					VMA_CREATE_FLAG_DUMPABLE : 0;
+				flags |= op-&gt;base.remap.unmap-&gt;va-&gt;flags ?
+					VMA_CREATE_FLAG_DEVICE_ATOMICS : 0;
 
 				vma = new_vma(vm, op-&gt;base.remap.next,
 					      old-&gt;pat_index, flags);
@@ -2731,7 +2740,8 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	(DRM_XE_VM_BIND_FLAG_READONLY | \
 	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
 	 DRM_XE_VM_BIND_FLAG_NULL | \
-	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
+	 DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS)
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -2874,7 +2884,7 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u64 addr, u64 range, u64 obj_offset,
-					u16 pat_index)
+					u16 pat_index, u32 flags)
 {
 	u16 coh_mode;
 
@@ -2909,6 +2919,15 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 		return  -EINVAL;
 	}
 
+	if (XE_IOCTL_DBG(xe, (flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &amp;&amp;
+			 (!xe-&gt;info.has_device_atomics_on_smem &amp;&amp;
+			  !xe_bo_is_vram(bo))))
+		return -EINVAL;</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Is the check correct?</p>
      <p>I'm not sure what you're trying to forbid here.</p>
    </blockquote>
    <p>I should have added a comment. I will add more details in my next
      revision.</p>
    <p>I wanted to forbid setting this flag on platform that doesn't
      support</p>
    <p>device atomics on SMEM only BO like PVC. <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:f763388c-2d45-4780-90c0-8ac8c359e090@intel.com">
      <p><br>
      </p>
      <p>I would have guessed :</p>
      <p>   <br>
      </p>
      <pre class="moz-quote-pre" wrap=""> (flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &amp;&amp;
 (!xe-&gt;info.has_device_atomics_on_smem || !xe_bo_is_vram(bo))
</pre>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:20240415145214.25641-7-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">+
+	if (XE_IOCTL_DBG(xe, (flags &amp; DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS) &amp;&amp;
+			 !xe_bo_has_single_placement(bo)))
+		return -EINVAL;
+
 	return 0;
 }
 
@@ -3007,7 +3026,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		bos[i] = gem_to_xe_bo(gem_obj);
 
 		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
-						   obj_offset, pat_index);
+						   obj_offset, pat_index,
+						   bind_ops[i].flags);
 		if (err)
 			goto put_obj;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index badf3945083d..5a20bd80c456 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -276,6 +276,8 @@ struct xe_vm {
 struct xe_vma_op_map {
 	/** @vma: VMA to map */
 	struct xe_vma *vma;
+	/** @enable_device_atomics: Whether the VMA will allow device atomics */
+	bool enable_device_atomics;
 	/** @is_null: is NULL binding */
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 1446c3bae515..ca4447e10ac9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -883,6 +883,14 @@ struct drm_xe_vm_destroy {
  *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
  *    handle MBZ, and the BO offset MBZ. This flag is intended to
  *    implement VK sparse bindings.
+ *  - %DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS - When this flag is set for
+ *    a VA range, all the corresponding PTEs will have atomic access bit
+ *    set. This will allow device atomics operation for that VA range.
+ *    This flag only works for single placement buffer objects and
+ *    mainly for SMEM only buffer objects where CPU atomics can be perform
+ *    by an application and so KMD can not set device atomics on such buffers
+ *    by default. This flag has no effect on LMEM only placed buffers as atomic
+ *    access bit is always set for LMEM backed PTEs.</pre>
      </blockquote>
      <p><br>
      </p>
      <p>Maybe we should be more explicit about when this flag is
        allowed :</p>
      <p>  - error if<span style="white-space: pre-wrap"> DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM is not reported</span></p>
      <p><span style="white-space: pre-wrap">  - error on multi region BOs</span></p>
      <p><span style="white-space: pre-wrap">  - ignored for LMEM only BOs</span></p>
    </blockquote>
    <p><br>
    </p>
    <p>Agreed, the comment probably is not very clear. I will add more explicit
      requirements for this flag by expanding this comment. </p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite"
      cite="mid:f763388c-2d45-4780-90c0-8ac8c359e090@intel.com">
      <p><span style="white-space: pre-wrap">
</span></p>
      <p><span style="white-space: pre-wrap">
</span></p>
      <p><span style="white-space: pre-wrap">-Lionel
</span></p>
      <p><br>
      </p>
      <blockquote type="cite"
        cite="mid:20240415145214.25641-7-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">  */
 struct drm_xe_vm_bind_op {
 	/** @extensions: Pointer to the first extension struct, if any */
@@ -969,10 +977,11 @@ struct drm_xe_vm_bind_op {
 	/** @op: Bind operation to perform */
 	__u32 op;
 
-#define DRM_XE_VM_BIND_FLAG_READONLY	(1 &lt;&lt; 0)
-#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 &lt;&lt; 1)
-#define DRM_XE_VM_BIND_FLAG_NULL	(1 &lt;&lt; 2)
-#define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 &lt;&lt; 3)
+#define DRM_XE_VM_BIND_FLAG_READONLY		(1 &lt;&lt; 0)
+#define DRM_XE_VM_BIND_FLAG_IMMEDIATE		(1 &lt;&lt; 1)
+#define DRM_XE_VM_BIND_FLAG_NULL		(1 &lt;&lt; 2)
+#define DRM_XE_VM_BIND_FLAG_DUMPABLE		(1 &lt;&lt; 3)
+#define DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS	(1 &lt;&lt; 4)
 	/** @flags: Bind flags */
 	__u32 flags;
 
</pre>
      </blockquote>
      <p><br>
      </p>
    </blockquote>
  </body>
</html>

--------------0V9F1SiB3tRbttPCWyeOGb0R--
