Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C79E784AC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 14:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7927110E05A;
	Mon,  2 Oct 2023 14:02:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA5D10E2C3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696255319; x=1727791319;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=YbWTe1y5nKt+cXSPd5U8h/O08I5naCBiOI6pU5sdsh0=;
 b=iRaONZUdoA5y2/olKrdvJghyafmDFq7gJ/tePLCdzNnubplCga+vgyXD
 KtBRghMGC6pnzcXzfgav6PYxHHHFUSrh5BFb4uZNeah+VttsVKCwdRNBm
 +ICmwvolCpdt9oQEEAS3weyKpDcghWudfhFblGXzb1jBSyCTz5/IZ6K5q
 YKdryFMVDvvSUT9TAVxODoCGICIf4smudeAbf5QlslpYjge4j/xbg+E0i
 LUXMYwkAXo+1NGp6kSIbcHr1n2+OxBsnPXptDFWYPD5rD5sUUJ6V/5ShU
 fKLQQcSl4Rz6y0+bYdM2Vg4tsqRUr3DwgkwCdY46rtfbMId26nTHGgXQN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="4222278"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; 
   d="scan'208";a="4222278"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="744120387"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="744120387"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:01:37 -0700
Message-ID: <343dcf76-539d-ee19-4244-0a1b082e3370@linux.intel.com>
Date: Mon, 2 Oct 2023 16:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20230929204637.1202492-1-rodrigo.vivi@intel.com>
 <20230929204637.1202492-3-rodrigo.vivi@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230929204637.1202492-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH 2/4] fixup! drm/xe: Port Xe to GPUVA
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


On 9/29/23 22:44, Rodrigo Vivi wrote:
> ---
>   drivers/gpu/drm/xe/Kconfig         |  1 +
>   drivers/gpu/drm/xe/xe_vm.c         | 30 +++++++++++++++---------------
>   drivers/gpu/drm/xe/xe_vm.h         |  4 ++--
>   drivers/gpu/drm/xe/xe_vm_madvise.c |  2 +-
>   drivers/gpu/drm/xe/xe_vm_types.h   |  6 +++---
>   5 files changed, 22 insertions(+), 21 deletions(-)

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index d57181ff47e6..97ed2a00f862 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -34,6 +34,7 @@ config DRM_XE
>   	select VMAP_PFN
>   	select DRM_TTM
>   	select DRM_TTM_HELPER
> +	select DRM_GPUVM
>   	select DRM_SCHED
>   	select MMU_NOTIFIER
>   	select WANT_DEV_COREDUMP
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 57ffac324564..3a761608bb68 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -882,7 +882,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	INIT_LIST_HEAD(&vma->extobj.link);
>   
>   	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
> -	vma->gpuva.mgr = &vm->mgr;
> +	vma->gpuva.vm = &vm->gpuvm;
>   	vma->gpuva.va.addr = start;
>   	vma->gpuva.va.range = end - start + 1;
>   	if (read_only)
> @@ -1147,7 +1147,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
>   
>   	xe_assert(vm->xe, start + range <= vm->size);
>   
> -	gpuva = drm_gpuva_find_first(&vm->mgr, start, range);
> +	gpuva = drm_gpuva_find_first(&vm->gpuvm, start, range);
>   
>   	return gpuva ? gpuva_to_vma(gpuva) : NULL;
>   }
> @@ -1159,7 +1159,7 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
>   	xe_assert(vm->xe, xe_vma_vm(vma) == vm);
>   	lockdep_assert_held(&vm->lock);
>   
> -	err = drm_gpuva_insert(&vm->mgr, &vma->gpuva);
> +	err = drm_gpuva_insert(&vm->gpuvm, &vma->gpuva);
>   	XE_WARN_ON(err);	/* Shouldn't be possible */
>   
>   	return err;
> @@ -1187,7 +1187,7 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
>   	return &op->base;
>   }
>   
> -static struct drm_gpuva_fn_ops gpuva_ops = {
> +static struct drm_gpuvm_ops gpuvm_ops = {
>   	.op_alloc = xe_vm_op_alloc,
>   };
>   
> @@ -1372,8 +1372,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	if (err)
>   		goto err_put;
>   
> -	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
> -			       &gpuva_ops);
> +	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, vm->size, 0, 0,
> +		       &gpuvm_ops);
>   	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>   		vm->flags |= XE_VM_FLAG_64K;
>   
> @@ -1479,7 +1479,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>   	}
>   	dma_resv_unlock(&vm->resv);
> -	drm_gpuva_manager_destroy(&vm->mgr);
> +	drm_gpuvm_destroy(&vm->gpuvm);
>   err_put:
>   	dma_resv_fini(&vm->resv);
>   	for_each_tile(tile, xe, id)
> @@ -1560,7 +1560,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   
>   	down_write(&vm->lock);
>   	xe_vm_lock(vm, false);
> -	drm_gpuva_for_each_va_safe(gpuva, next, &vm->mgr) {
> +	drm_gpuvm_for_each_va_safe(gpuva, next, &vm->gpuvm) {
>   		vma = gpuva_to_vma(gpuva);
>   
>   		if (xe_vma_has_no_bo(vma)) {
> @@ -1619,7 +1619,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	xe_assert(xe, list_empty(&vm->extobj.list));
>   	up_write(&vm->lock);
>   
> -	drm_gpuva_manager_destroy(&vm->mgr);
> +	drm_gpuvm_destroy(&vm->gpuvm);
>   
>   	mutex_lock(&xe->usm.lock);
>   	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
> @@ -2409,7 +2409,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	switch (VM_BIND_OP(operation)) {
>   	case XE_VM_BIND_OP_MAP:
>   	case XE_VM_BIND_OP_MAP_USERPTR:
> -		ops = drm_gpuva_sm_map_ops_create(&vm->mgr, addr, range,
> +		ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, addr, range,
>   						  obj, bo_offset_or_userptr);
>   		if (IS_ERR(ops))
>   			return ops;
> @@ -2426,7 +2426,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   		}
>   		break;
>   	case XE_VM_BIND_OP_UNMAP:
> -		ops = drm_gpuva_sm_unmap_ops_create(&vm->mgr, addr, range);
> +		ops = drm_gpuvm_sm_unmap_ops_create(&vm->gpuvm, addr, range);
>   		if (IS_ERR(ops))
>   			return ops;
>   
> @@ -2437,7 +2437,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   		}
>   		break;
>   	case XE_VM_BIND_OP_PREFETCH:
> -		ops = drm_gpuva_prefetch_ops_create(&vm->mgr, addr, range);
> +		ops = drm_gpuvm_prefetch_ops_create(&vm->gpuvm, addr, range);
>   		if (IS_ERR(ops))
>   			return ops;
>   
> @@ -2454,7 +2454,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   		err = xe_bo_lock(bo, true);
>   		if (err)
>   			return ERR_PTR(err);
> -		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
> +		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
>   		xe_bo_unlock(bo);
>   		if (IS_ERR(ops))
>   			return ops;
> @@ -2971,7 +2971,7 @@ static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
>   		spin_unlock_irq(&vm->async_ops.lock);
>   	}
>   	if (op->ops)
> -		drm_gpuva_ops_free(&vm->mgr, op->ops);
> +		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
>   	if (last)
>   		xe_vm_put(vm);
>   }
> @@ -3664,7 +3664,7 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>   			   is_vram ? "VRAM" : "SYS");
>   	}
>   
> -	drm_gpuva_for_each_va(gpuva, &vm->mgr) {
> +	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
>   		struct xe_vma *vma = gpuva_to_vma(gpuva);
>   		bool is_userptr = xe_vma_is_userptr(vma);
>   		bool is_null = xe_vma_is_null(vma);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index f966ed39b711..4b32ce9cf9b1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -66,7 +66,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>   
>   static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
>   {
> -	return container_of(gpuva->mgr, struct xe_vm, mgr);
> +	return container_of(gpuva->vm, struct xe_vm, gpuvm);
>   }
>   
>   static inline struct xe_vma *gpuva_to_vma(struct drm_gpuva *gpuva)
> @@ -111,7 +111,7 @@ static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
>   
>   static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
>   {
> -	return container_of(vma->gpuva.mgr, struct xe_vm, mgr);
> +	return container_of(vma->gpuva.vm, struct xe_vm, gpuvm);
>   }
>   
>   static inline bool xe_vma_read_only(struct xe_vma *vma)
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index d2fd99462756..0ef7d483d050 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -217,7 +217,7 @@ get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
>   	if (!vmas)
>   		return NULL;
>   
> -	drm_gpuva_for_each_va_range(gpuva, &vm->mgr, addr, addr + range) {
> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, addr, addr + range) {
>   		struct xe_vma *vma = gpuva_to_vma(gpuva);
>   
>   		if (xe_vma_is_userptr(vma))
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1c5553b842d7..da5e6cb6f094 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -6,7 +6,7 @@
>   #ifndef _XE_VM_TYPES_H_
>   #define _XE_VM_TYPES_H_
>   
> -#include <drm/drm_gpuva_mgr.h>
> +#include <drm/drm_gpuvm.h>
>   
>   #include <linux/dma-resv.h>
>   #include <linux/kref.h>
> @@ -135,8 +135,8 @@ struct xe_device;
>   #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
>   
>   struct xe_vm {
> -	/** @mgr: base GPUVA used to track VMAs */
> -	struct drm_gpuva_manager mgr;
> +	/** @gpuvm: base GPUVM used to track VMAs */
> +	struct drm_gpuvm gpuvm;
>   
>   	struct xe_device *xe;
>   
