Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D131C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 11:41:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB79110E062;
	Tue, 25 Apr 2023 11:41:28 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12FD10E062
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 11:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682422886; x=1713958886;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fOQlwcjxpOEkQlxctQifQA0cDyASDXSYoyteU3UvtT0=;
 b=CZRvNqcfwkBap4Fbw3GPKTrP9vaT+/E0MFKFvJAWEmXGl9i5NeM5ZRpM
 Fe63ot24d6ccOf2KlDs4vFYY/Il8XhDJmNLfaQIFV7QgMokJRThm2KTfE
 MaOvNvSYdRPDDyXSvfVSzidFPeGtWCC0UaNO/3i9KpKAbz8jf1qayxV1D
 GKoMqj7Ua2SiUOVcFwjMn8q50M3WoVKQbswSJE7AvcBGw1FfYqk37fT1E
 /guVkmvbCvebpt/gf7p/dy/fawZo+67mfy5ws9KWTsvTKkH02hroIfVhc
 OHdFUIxpAzH8+HUKfTyLNyEKvbMq30mpMG7tbsdlABxgtdRi69iMOLzqL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="335642441"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="335642441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 04:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="762819735"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="762819735"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.18])
 ([10.249.254.18])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 04:41:24 -0700
Message-ID: <7070af58-dfb3-2ca3-881e-af9c281baffa@linux.intel.com>
Date: Tue, 25 Apr 2023 13:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230404014228.3738347-1-matthew.brost@intel.com>
 <20230404014228.3738347-5-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230404014228.3738347-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v5 4/8] drm/xe: Port Xe to GPUVA
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


On 4/4/23 03:42, Matthew Brost wrote:
> Rather than open coding VM binds and VMA tracking, use the GPUVA
> library. GPUVA provides a common infrastructure for VM binds to use mmap
> / munmap semantics and support for VK sparse bindings.
>
> The concepts are:
>
> 1) xe_vm inherits from drm_gpuva_manager
> 2) xe_vma inherits from drm_gpuva
> 3) xe_vma_op inherits from drm_gpuva_op
> 4) VM bind operations (MAP, UNMAP, PREFETCH, UNMAP_ALL) call into the
> GPUVA code to generate an VMA operations list which is parsed, commited,
> and executed.
>
> v2 (CI): Add break after default in case statement.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
>   drivers/gpu/drm/xe/xe_device.c              |    2 +-
>   drivers/gpu/drm/xe/xe_exec.c                |    2 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   23 +-
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
>   drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
>   drivers/gpu/drm/xe/xe_pt.c                  |  106 +-
>   drivers/gpu/drm/xe/xe_trace.h               |   10 +-
>   drivers/gpu/drm/xe/xe_vm.c                  | 1799 +++++++++----------
>   drivers/gpu/drm/xe/xe_vm.h                  |   66 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
>   drivers/gpu/drm/xe/xe_vm_types.h            |  165 +-
>   13 files changed, 1126 insertions(+), 1172 deletions(-)
...
>   struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
>   {
>   	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> @@ -2014,834 +2000,816 @@ static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
>   	tv->bo = xe_vm_ttm_bo(vm);
>   }
>   
> -static bool is_map_op(u32 op)
> +static void vm_set_async_error(struct xe_vm *vm, int err)
>   {
> -	return VM_BIND_OP(op) == XE_VM_BIND_OP_MAP ||
> -		VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR;
> +	lockdep_assert_held(&vm->lock);
> +	vm->async_ops.error = err;
>   }
>   
> -static bool is_unmap_op(u32 op)
> +static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
> +				 struct xe_vma *ignore)
>   {
> -	return VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP ||
> -		VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL;
> +	struct ww_acquire_ctx ww;
> +	struct drm_gpuva *gpuva;
> +	struct drm_gem_object *obj = &bo->ttm.base;
> +	bool ret = false;
> +
> +	xe_bo_lock(bo, &ww, 0, false);
> +	drm_gem_for_each_gpuva(gpuva, obj) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +
> +		if (vma != ignore && xe_vma_vm(vma) == vm &&
> +		    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
> +			ret = true;
> +			break;
> +		}
> +	}
> +	xe_bo_unlock(bo, &ww);
> +
> +	return ret;
>   }
>   
> -static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
> -			 struct xe_engine *e, struct xe_bo *bo,
> -			 struct drm_xe_vm_bind_op *bind_op,
> -			 struct xe_sync_entry *syncs, u32 num_syncs,
> -			 struct async_op_fence *afence)
> +static int vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
>   {
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> -	struct xe_bo *vbo;
> -	int err, i;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>   
> -	lockdep_assert_held(&vm->lock);
> -	XE_BUG_ON(!list_empty(&vma->unbind_link));
> +	lockdep_assert_held_write(&vm->lock);
>   
> -	/* Binds deferred to faults, signal fences now */
> -	if (xe_vm_in_fault_mode(vm) && is_map_op(bind_op->op) &&
> -	    !(bind_op->op & XE_VM_BIND_FLAG_IMMEDIATE)) {
> -		for (i = 0; i < num_syncs; i++)
> -			xe_sync_entry_signal(&syncs[i], NULL,
> -					     dma_fence_get_stub());
> -		if (afence)
> -			dma_fence_signal(&afence->fence);
> +	if (bo_has_vm_references(bo, vm, vma))
>   		return 0;
> -	}
>   
> -	xe_vm_tv_populate(vm, &tv_vm);
> -	list_add_tail(&tv_vm.head, &objs);
> -	vbo = vma->bo;
> -	if (vbo) {
> -		/*
> -		 * An unbind can drop the last reference to the BO and
> -		 * the BO is needed for ttm_eu_backoff_reservation so
> -		 * take a reference here.
> -		 */
> -		xe_bo_get(vbo);
> +	list_add(&vma->extobj.link, &vm->extobj.list);
> +	vm->extobj.entries++;
>   
> -		tv_bo.bo = &vbo->ttm;
> -		tv_bo.num_shared = 1;
> -		list_add(&tv_bo.head, &objs);
> -	}
> +	return 0;
> +}
>   
> -again:
> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> -	if (!err) {
> -		err = __vm_bind_ioctl(vm, vma, e, bo,
> -				      bind_op->op, bind_op->region, syncs,
> -				      num_syncs, afence);
> -		ttm_eu_backoff_reservation(&ww, &objs);
> -		if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> -			lockdep_assert_held_write(&vm->lock);
> -			err = xe_vma_userptr_pin_pages(vma);
> -			if (!err)
> -				goto again;
> -		}
> +static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
> +				      u64 addr, u64 range, u32 op)
> +{
> +	struct xe_device *xe = vm->xe;
> +	struct xe_vma *vma;
> +	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	return 0;
> +
> +	switch (VM_BIND_OP(op)) {
> +	case XE_VM_BIND_OP_MAP:
> +	case XE_VM_BIND_OP_MAP_USERPTR:
> +		vma = xe_vm_find_overlapping_vma(vm, addr, range);
> +		if (XE_IOCTL_ERR(xe, vma))
> +			return -EBUSY;
> +		break;
> +	case XE_VM_BIND_OP_UNMAP:
> +	case XE_VM_BIND_OP_PREFETCH:
> +		vma = xe_vm_find_overlapping_vma(vm, addr, range);
> +		if (XE_IOCTL_ERR(xe, !vma) ||
> +		    XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
> +				 xe_vma_end(vma) != addr + range) && !async))
> +			return -EINVAL;
Perhaps unrelated, but erroring if the range doesn't contain any vmas is 
inconsistent with cpu munmap().
> +		break;
> +	case XE_VM_BIND_OP_UNMAP_ALL:
> +		if (XE_IOCTL_ERR(xe, list_empty(&bo->ttm.base.gpuva.list)))
> +			return -EINVAL;
Same here.
> +		break;
> +	default:
> +		XE_BUG_ON("NOT POSSIBLE");
> +		return -EINVAL;
>   	}
> -	xe_bo_put(vbo);
>   
> -	return err;
> +	return 0;
>   }
>   
> -struct async_op {
> -	struct xe_vma *vma;
> -	struct xe_engine *engine;
> -	struct xe_bo *bo;
> -	struct drm_xe_vm_bind_op bind_op;
> -	struct xe_sync_entry *syncs;
> -	u32 num_syncs;
> -	struct list_head link;
> -	struct async_op_fence *fence;
> -};
> -
> -static void async_op_cleanup(struct xe_vm *vm, struct async_op *op)
> +static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
> +			     bool post_commit)
>   {
> -	while (op->num_syncs--)
> -		xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
> -	kfree(op->syncs);
> -	xe_bo_put(op->bo);
> -	if (op->engine)
> -		xe_engine_put(op->engine);
> -	xe_vm_put(vm);
> -	if (op->fence)
> -		dma_fence_put(&op->fence->fence);
> -	kfree(op);
> +	down_read(&vm->userptr.notifier_lock);
> +	vma->gpuva.flags |= XE_VMA_DESTROYED;
> +	up_read(&vm->userptr.notifier_lock);
> +	if (post_commit)
> +		xe_vm_remove_vma(vm, vma, true);
>   }
>   
> -static struct async_op *next_async_op(struct xe_vm *vm)
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
> +static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>   {
> -	return list_first_entry_or_null(&vm->async_ops.pending,
> -					struct async_op, link);
> -}
> +	struct xe_vma *vma;
>   
> -static void vm_set_async_error(struct xe_vm *vm, int err)
> +	switch (op->op) {
> +	case DRM_GPUVA_OP_MAP:
> +		vm_dbg(&xe->drm, "MAP: addr=0x%016llx, range=0x%016llx",
> +		       op->map.va.addr, op->map.va.range);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		vma = gpuva_to_vma(op->remap.unmap->va);
> +		vm_dbg(&xe->drm, "REMAP:UNMAP: addr=0x%016llx, range=0x%016llx, keep=%d",
Prints unsigned long long but arguments are u64. Not guaranteed to 
match. Same below. I'd cast to unsigned long long.
> +		       xe_vma_start(vma), xe_vma_size(vma),
> +		       op->unmap.keep ? 1 : 0);
> +		if (op->remap.prev)
> +			vm_dbg(&xe->drm,
> +			       "REMAP:PREV: addr=0x%016llx, range=0x%016llx",
> +			       op->remap.prev->va.addr,
> +			       op->remap.prev->va.range);
> +		if (op->remap.next)
> +			vm_dbg(&xe->drm,
> +			       "REMAP:NEXT: addr=0x%016llx, range=0x%016llx",
> +			       op->remap.next->va.addr,
> +			       op->remap.next->va.range);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		vma = gpuva_to_vma(op->unmap.va);
> +		vm_dbg(&xe->drm, "UNMAP: addr=0x%016llx, range=0x%016llx, keep=%d",
> +		       xe_vma_start(vma), xe_vma_size(vma),
> +		       op->unmap.keep ? 1 : 0);
> +		break;
> +	default:
> +		XE_BUG_ON("NOT_POSSIBLE");
s/NOT_POSSIBLE/NOT POSSIBLE/ for consistency?
> +	}
> +}
> +#else
> +static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
>   {
> -	lockdep_assert_held(&vm->lock);
> -	vm->async_ops.error = err;
>   }
> +#endif
>   
> -static void async_op_work_func(struct work_struct *w)
> +/*
> + * Create operations list from IOCTL arguments, setup operations fields so parse
> + * and commit steps are decoupled from IOCTL arguments. This step can fail.
> + */
> +static struct drm_gpuva_ops *
> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> +			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> +			 u32 operation, u64 gt_mask, u32 region)
>   {
> -	struct xe_vm *vm = container_of(w, struct xe_vm, async_ops.work);
> -
> -	for (;;) {
> -		struct async_op *op;
> -		int err;
> -
> -		if (vm->async_ops.error && !xe_vm_is_closed(vm))
> -			break;
> +	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> +	struct ww_acquire_ctx ww;
> +	struct drm_gpuva_ops *ops;
> +	struct drm_gpuva_op *__op;
> +	struct xe_vma_op *op;
> +	int err;
>   
> -		spin_lock_irq(&vm->async_ops.lock);
> -		op = next_async_op(vm);
> -		if (op)
> -			list_del_init(&op->link);
> -		spin_unlock_irq(&vm->async_ops.lock);
> +	lockdep_assert_held_write(&vm->lock);
>   
> -		if (!op)
> -			break;
> +	vm_dbg(&vm->xe->drm,
> +	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
unsigned long long again.
> +	       VM_BIND_OP(operation), addr, range, bo_offset_or_userptr);
>   
> -		if (!xe_vm_is_closed(vm)) {
> -			bool first, last;
> +	switch (VM_BIND_OP(operation)) {
> +	case XE_VM_BIND_OP_MAP:
> +	case XE_VM_BIND_OP_MAP_USERPTR:
> +		ops = drm_gpuva_sm_map_ops_create(&vm->mgr, addr, range,
> +						  obj, bo_offset_or_userptr);
> +		drm_gpuva_for_each_op(__op, ops) {
> +			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>   
> -			down_write(&vm->lock);
> -again:
> -			first = op->vma->first_munmap_rebind;
> -			last = op->vma->last_munmap_rebind;
> -#ifdef TEST_VM_ASYNC_OPS_ERROR
> -#define FORCE_ASYNC_OP_ERROR	BIT(31)
> -			if (!(op->bind_op.op & FORCE_ASYNC_OP_ERROR)) {
> -				err = vm_bind_ioctl(vm, op->vma, op->engine,
> -						    op->bo, &op->bind_op,
> -						    op->syncs, op->num_syncs,
> -						    op->fence);
> -			} else {
> -				err = -ENOMEM;
> -				op->bind_op.op &= ~FORCE_ASYNC_OP_ERROR;
> -			}
> -#else
> -			err = vm_bind_ioctl(vm, op->vma, op->engine, op->bo,
> -					    &op->bind_op, op->syncs,
> -					    op->num_syncs, op->fence);
> -#endif
> -			/*
> -			 * In order for the fencing to work (stall behind
> -			 * existing jobs / prevent new jobs from running) all
> -			 * the dma-resv slots need to be programmed in a batch
> -			 * relative to execs / the rebind worker. The vm->lock
> -			 * ensure this.
> -			 */
> -			if (!err && ((first && VM_BIND_OP(op->bind_op.op) ==
> -				      XE_VM_BIND_OP_UNMAP) ||
> -				     vm->async_ops.munmap_rebind_inflight)) {
> -				if (last) {
> -					op->vma->last_munmap_rebind = false;
> -					vm->async_ops.munmap_rebind_inflight =
> -						false;
> -				} else {
> -					vm->async_ops.munmap_rebind_inflight =
> -						true;
> -
> -					async_op_cleanup(vm, op);
> -
> -					spin_lock_irq(&vm->async_ops.lock);
> -					op = next_async_op(vm);
> -					XE_BUG_ON(!op);
> -					list_del_init(&op->link);
> -					spin_unlock_irq(&vm->async_ops.lock);
> -
> -					goto again;
> -				}
> -			}
> -			if (err) {
> -				trace_xe_vma_fail(op->vma);
> -				drm_warn(&vm->xe->drm, "Async VM op(%d) failed with %d",
> -					 VM_BIND_OP(op->bind_op.op),
> -					 err);
> +			op->gt_mask = gt_mask;
> +			op->map.immediate =
> +				operation & XE_VM_BIND_FLAG_IMMEDIATE;
> +			op->map.read_only =
> +				operation & XE_VM_BIND_FLAG_READONLY;
> +		}
> +		break;
> +	case XE_VM_BIND_OP_UNMAP:
> +		ops = drm_gpuva_sm_unmap_ops_create(&vm->mgr, addr, range);
> +		drm_gpuva_for_each_op(__op, ops) {
Looks like drm_gpuva_..._ops_create() may error in which case this blows 
up. Same below.
> +			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>   
> -				spin_lock_irq(&vm->async_ops.lock);
> -				list_add(&op->link, &vm->async_ops.pending);
> -				spin_unlock_irq(&vm->async_ops.lock);
> +			op->gt_mask = gt_mask;
> +		}
> +		break;
> +	case XE_VM_BIND_OP_PREFETCH:
> +		ops = drm_gpuva_prefetch_ops_create(&vm->mgr, addr, range);
> +		drm_gpuva_for_each_op(__op, ops) {
> +			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>   
> -				vm_set_async_error(vm, err);
> -				up_write(&vm->lock);
> +			op->gt_mask = gt_mask;
> +			op->prefetch.region = region;
> +		}
> +		break;
> +	case XE_VM_BIND_OP_UNMAP_ALL:
> +		XE_BUG_ON(!bo);
>   
> -				if (vm->async_ops.error_capture.addr)
> -					vm_error_capture(vm, err,
> -							 op->bind_op.op,
> -							 op->bind_op.addr,
> -							 op->bind_op.range);
> -				break;
> -			}
> -			up_write(&vm->lock);
> -		} else {
> -			trace_xe_vma_flush(op->vma);
> +		err = xe_bo_lock(bo, &ww, 0, true);
> +		if (err)
> +			return ERR_PTR(err);
> +		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
> +		xe_bo_unlock(bo, &ww);
>   
> -			if (is_unmap_op(op->bind_op.op)) {
> -				down_write(&vm->lock);
> -				xe_vma_destroy_unlocked(op->vma);
> -				up_write(&vm->lock);
> -			}
> +		drm_gpuva_for_each_op(__op, ops) {
> +			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>   
> -			if (op->fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -						   &op->fence->fence.flags)) {
> -				if (!xe_vm_no_dma_fences(vm)) {
> -					op->fence->started = true;
> -					smp_wmb();
> -					wake_up_all(&op->fence->wq);
> -				}
> -				dma_fence_signal(&op->fence->fence);
> -			}
> +			op->gt_mask = gt_mask;
>   		}
> +		break;
> +	default:
> +		XE_BUG_ON("NOT POSSIBLE");
> +		ops = ERR_PTR(-EINVAL);
> +	}
>   
> -		async_op_cleanup(vm, op);
> +#ifdef TEST_VM_ASYNC_OPS_ERROR
> +	if (operation & FORCE_ASYNC_OP_ERROR) {
> +		op = list_first_entry_or_null(&ops->list, struct xe_vma_op,
> +					      base.entry);
> +		if (op)
> +			op->inject_error = true;
>   	}
> +#endif
> +
> +	if (!IS_ERR(ops))
> +		drm_gpuva_for_each_op(__op, ops)
> +			print_op(vm->xe, __op);
> +
> +	return ops;
>   }
>   
> -static int __vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
> -				 struct xe_engine *e, struct xe_bo *bo,
> -				 struct drm_xe_vm_bind_op *bind_op,
> -				 struct xe_sync_entry *syncs, u32 num_syncs)
> +static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> +			      u64 gt_mask, bool read_only)
>   {
> -	struct async_op *op;
> -	bool installed = false;
> -	u64 seqno;
> -	int i;
> +	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> +	struct xe_vma *vma;
> +	struct ww_acquire_ctx ww;
> +	int err;
>   
> -	lockdep_assert_held(&vm->lock);
> +	lockdep_assert_held_write(&vm->lock);
>   
> -	op = kmalloc(sizeof(*op), GFP_KERNEL);
> -	if (!op) {
> -		return -ENOMEM;
> -	}
> +	if (bo) {
> +		err = xe_bo_lock(bo, &ww, 0, true);
> +		if (err)
> +			return ERR_PTR(err);
> +	}
> +	vma = xe_vma_create(vm, bo, op->gem.offset,
> +			    op->va.addr, op->va.addr +
> +			    op->va.range - 1, read_only,
> +			    gt_mask);
> +	if (bo)
> +		xe_bo_unlock(bo, &ww);
>   
> -	if (num_syncs) {
> -		op->fence = kmalloc(sizeof(*op->fence), GFP_KERNEL);
> -		if (!op->fence) {
> -			kfree(op);
> -			return -ENOMEM;
> +	if (xe_vma_is_userptr(vma)) {
> +		err = xe_vma_userptr_pin_pages(vma);
> +		if (err) {
> +			xe_vma_destroy(vma, NULL);
> +			return ERR_PTR(err);
>   		}
> +	} else if(!bo->vm) {
> +		vm_insert_extobj(vm, vma);
> +		err = add_preempt_fences(vm, bo);
> +		if (err) {
> +			xe_vma_destroy(vma, NULL);
> +			return ERR_PTR(err);
> +		}
> +	}
> +
> +	return vma;
> +}
> +
> +/*
> + * Parse operations list and create any resources needed for the operations
> + * prior to fully commiting to the operations. This setp can fail.
s/setp/setup/
> + */
> +static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
> +				   struct drm_gpuva_ops **ops, int num_ops_list,
> +				   struct xe_sync_entry *syncs, u32 num_syncs,
> +				   struct list_head *ops_list, bool async)
> +{
> +	struct xe_vma_op *last_op = NULL;
> +	struct list_head *async_list = NULL;
> +	struct async_op_fence *fence = NULL;
> +	int err, i;
> +
> +	lockdep_assert_held_write(&vm->lock);
> +	XE_BUG_ON(num_ops_list > 1 && !async);
> +
> +	if (num_syncs && async) {
> +		u64 seqno;
> +
> +		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> +		if (!fence)
> +			return -ENOMEM;
>   
>   		seqno = e ? ++e->bind.fence_seqno : ++vm->async_ops.fence.seqno;
> -		dma_fence_init(&op->fence->fence, &async_op_fence_ops,
> +		dma_fence_init(&fence->fence, &async_op_fence_ops,
>   			       &vm->async_ops.lock, e ? e->bind.fence_ctx :
>   			       vm->async_ops.fence.context, seqno);
>   
>   		if (!xe_vm_no_dma_fences(vm)) {
> -			op->fence->vm = vm;
> -			op->fence->started = false;
> -			init_waitqueue_head(&op->fence->wq);
> +			fence->vm = vm;
> +			fence->started = false;
> +			init_waitqueue_head(&fence->wq);
>   		}
> -	} else {
> -		op->fence = NULL;
>   	}
> -	op->vma = vma;
> -	op->engine = e;
> -	op->bo = bo;
> -	op->bind_op = *bind_op;
> -	op->syncs = syncs;
> -	op->num_syncs = num_syncs;
> -	INIT_LIST_HEAD(&op->link);
> -
> -	for (i = 0; i < num_syncs; i++)
> -		installed |= xe_sync_entry_signal(&syncs[i], NULL,
> -						  &op->fence->fence);
>   
> -	if (!installed && op->fence)
> -		dma_fence_signal(&op->fence->fence);
> +	for (i = 0; i < num_ops_list; ++i) {
> +		struct drm_gpuva_ops *__ops = ops[i];
> +		struct drm_gpuva_op *__op;
>   
> -	spin_lock_irq(&vm->async_ops.lock);
> -	list_add_tail(&op->link, &vm->async_ops.pending);
> -	spin_unlock_irq(&vm->async_ops.lock);
> +		drm_gpuva_for_each_op(__op, __ops) {
> +			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +			bool first = !async_list;
>   
> -	if (!vm->async_ops.error)
> -		queue_work(system_unbound_wq, &vm->async_ops.work);
> +			XE_BUG_ON(!first && !async);
>   
> -	return 0;
> -}
> +			INIT_LIST_HEAD(&op->link);
> +			if (first)
> +				async_list = ops_list;
> +			list_add_tail(&op->link, async_list);
>   
> -static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
> -			       struct xe_engine *e, struct xe_bo *bo,
> -			       struct drm_xe_vm_bind_op *bind_op,
> -			       struct xe_sync_entry *syncs, u32 num_syncs)
> -{
> -	struct xe_vma *__vma, *next;
> -	struct list_head rebind_list;
> -	struct xe_sync_entry *in_syncs = NULL, *out_syncs = NULL;
> -	u32 num_in_syncs = 0, num_out_syncs = 0;
> -	bool first = true, last;
> -	int err;
> -	int i;
> +			if (first) {
> +				op->flags |= XE_VMA_OP_FIRST;
> +				op->num_syncs = num_syncs;
> +				op->syncs = syncs;
> +			}
>   
> -	lockdep_assert_held(&vm->lock);
> +			op->engine = e;
>   
> -	/* Not a linked list of unbinds + rebinds, easy */
> -	if (list_empty(&vma->unbind_link))
> -		return __vm_bind_ioctl_async(vm, vma, e, bo, bind_op,
> -					     syncs, num_syncs);
> +			switch (op->base.op) {
> +			case DRM_GPUVA_OP_MAP:
> +			{
> +				struct xe_vma *vma;
>   
> -	/*
> -	 * Linked list of unbinds + rebinds, decompose syncs into 'in / out'
> -	 * passing the 'in' to the first operation and 'out' to the last. Also
> -	 * the reference counting is a little tricky, increment the VM / bind
> -	 * engine ref count on all but the last operation and increment the BOs
> -	 * ref count on each rebind.
> -	 */
> +				vma = new_vma(vm, &op->base.map,
> +					      op->gt_mask, op->map.read_only);
> +				if (IS_ERR(vma)) {
> +					err = PTR_ERR(vma);
> +					goto free_fence;
> +				}
>   
> -	XE_BUG_ON(VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_UNMAP &&
> -		  VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_UNMAP_ALL &&
> -		  VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_PREFETCH);
> +				op->map.vma = vma;
> +				break;
> +			}
> +			case DRM_GPUVA_OP_REMAP:
> +				if (op->base.remap.prev) {
> +					struct xe_vma *vma;
> +					bool read_only =
> +						op->base.remap.unmap->va->flags &
> +						XE_VMA_READ_ONLY;
> +
> +					vma = new_vma(vm, op->base.remap.prev,
> +						      op->gt_mask, read_only);
> +					if (IS_ERR(vma)) {
> +						err = PTR_ERR(vma);
> +						goto free_fence;
> +					}
> +
> +					op->remap.prev = vma;
> +				}
>   
> -	/* Decompose syncs */
> -	if (num_syncs) {
> -		in_syncs = kmalloc(sizeof(*in_syncs) * num_syncs, GFP_KERNEL);
> -		out_syncs = kmalloc(sizeof(*out_syncs) * num_syncs, GFP_KERNEL);
> -		if (!in_syncs || !out_syncs) {
> -			err = -ENOMEM;
> -			goto out_error;
> -		}
> +				if (op->base.remap.next) {
> +					struct xe_vma *vma;
> +					bool read_only =
> +						op->base.remap.unmap->va->flags &
> +						XE_VMA_READ_ONLY;
>   
> -		for (i = 0; i < num_syncs; ++i) {
> -			bool signal = syncs[i].flags & DRM_XE_SYNC_SIGNAL;
> +					vma = new_vma(vm, op->base.remap.next,
> +						      op->gt_mask, read_only);
> +					if (IS_ERR(vma)) {
> +						err = PTR_ERR(vma);
> +						goto free_fence;
> +					}
>   
> -			if (signal)
> -				out_syncs[num_out_syncs++] = syncs[i];
> -			else
> -				in_syncs[num_in_syncs++] = syncs[i];
> -		}
> -	}
> +					op->remap.next = vma;
> +				}
>   
> -	/* Do unbinds + move rebinds to new list */
> -	INIT_LIST_HEAD(&rebind_list);
> -	list_for_each_entry_safe(__vma, next, &vma->unbind_link, unbind_link) {
> -		if (__vma->destroyed ||
> -		    VM_BIND_OP(bind_op->op) == XE_VM_BIND_OP_PREFETCH) {
> -			list_del_init(&__vma->unbind_link);
> -			xe_bo_get(bo);
> -			err = __vm_bind_ioctl_async(xe_vm_get(vm), __vma,
> -						    e ? xe_engine_get(e) : NULL,
> -						    bo, bind_op, first ?
> -						    in_syncs : NULL,
> -						    first ? num_in_syncs : 0);
> -			if (err) {
> -				xe_bo_put(bo);
> -				xe_vm_put(vm);
> -				if (e)
> -					xe_engine_put(e);
> -				goto out_error;
> +				/* XXX: Support no doing remaps */
What does this comment mean?
> +				op->remap.start =
> +					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
> +				op->remap.range =
> +					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
Perhaps have a remap_vma?
> +				break;
> +			case DRM_GPUVA_OP_UNMAP:
> +				op->unmap.start =
> +					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
> +				op->unmap.range =
> +					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
> +				break;
> +			case DRM_GPUVA_OP_PREFETCH:
> +				/* Nothing to do */
> +				break;
> +			default:
> +				XE_BUG_ON("NOT POSSIBLE");
>   			}
> -			in_syncs = NULL;
> -			first = false;
> -		} else {
> -			list_move_tail(&__vma->unbind_link, &rebind_list);
> -		}
> -	}
> -	last = list_empty(&rebind_list);
> -	if (!last) {
> -		xe_vm_get(vm);
> -		if (e)
> -			xe_engine_get(e);
> -	}
> -	err = __vm_bind_ioctl_async(vm, vma, e,
> -				    bo, bind_op,
> -				    first ? in_syncs :
> -				    last ? out_syncs : NULL,
> -				    first ? num_in_syncs :
> -				    last ? num_out_syncs : 0);
> -	if (err) {
> -		if (!last) {
> -			xe_vm_put(vm);
> -			if (e)
> -				xe_engine_put(e);
> -		}
> -		goto out_error;
> -	}
> -	in_syncs = NULL;
>   
> -	/* Do rebinds */
> -	list_for_each_entry_safe(__vma, next, &rebind_list, unbind_link) {
> -		list_del_init(&__vma->unbind_link);
> -		last = list_empty(&rebind_list);
> -
> -		if (xe_vma_is_userptr(__vma)) {
> -			bind_op->op = XE_VM_BIND_FLAG_ASYNC |
> -				XE_VM_BIND_OP_MAP_USERPTR;
> -		} else {
> -			bind_op->op = XE_VM_BIND_FLAG_ASYNC |
> -				XE_VM_BIND_OP_MAP;
> -			xe_bo_get(__vma->bo);
> -		}
> -
> -		if (!last) {
> -			xe_vm_get(vm);
> -			if (e)
> -				xe_engine_get(e);
> +			last_op = op;
>   		}
>   
> -		err = __vm_bind_ioctl_async(vm, __vma, e,
> -					    __vma->bo, bind_op, last ?
> -					    out_syncs : NULL,
> -					    last ? num_out_syncs : 0);
> -		if (err) {
> -			if (!last) {
> -				xe_vm_put(vm);
> -				if (e)
> -					xe_engine_put(e);
> -			}
> -			goto out_error;
> -		}
> +		last_op->ops = __ops;
>   	}
>   
> -	kfree(syncs);
> -	return 0;
> +	XE_BUG_ON(!last_op);	/* FIXME: This is not an error, handle */

Please handle this properly if this can actually happen.


>   
> -out_error:
> -	kfree(in_syncs);
> -	kfree(out_syncs);
> -	kfree(syncs);
> +	last_op->flags |= XE_VMA_OP_LAST;
> +	last_op->num_syncs = num_syncs;
> +	last_op->syncs = syncs;
> +	last_op->fence = fence;
> +
> +	return 0;
>   
> +free_fence:
> +	kfree(fence);
>   	return err;
>   }
>   
> -static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
> -				 struct xe_vma *ignore)
> +static void xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>   {
> -	struct ww_acquire_ctx ww;
> -	struct xe_vma *vma;
> -	bool ret = false;
> +	lockdep_assert_held_write(&vm->lock);
>   
> -	xe_bo_lock(bo, &ww, 0, false);
> -	list_for_each_entry(vma, &bo->vmas, bo_link) {
> -		if (vma != ignore && vma->vm == vm && !vma->destroyed) {
> -			ret = true;
> -			break;
> -		}
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		xe_vm_insert_vma(vm, op->map.vma);
Hmm, xe_vm_insert_vma() calls drm_gpuva_insert() which may error 
(-ENOMEM). We just warn on that error without any comments? Please add a 
detailed discussion why that can't fail, or propagate the error.

> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
> +				 true);
> +		if (op->remap.prev)
> +			xe_vm_insert_vma(vm, op->remap.prev);
> +		if (op->remap.next)
> +			xe_vm_insert_vma(vm, op->remap.next);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		/* Nothing to do */
> +		break;
> +	default:
> +		XE_BUG_ON("NOT POSSIBLE");
>   	}
> -	xe_bo_unlock(bo, &ww);
> -
> -	return ret;
>   }
>   
> -static int vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
> +static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
> +			       struct xe_vma_op *op)
>   {
> -	struct xe_bo *bo = vma->bo;
> +	LIST_HEAD(objs);
> +	LIST_HEAD(dups);
> +	struct ttm_validate_buffer tv_bo, tv_vm;
> +	struct ww_acquire_ctx ww;
> +	struct xe_bo *vbo;
> +	int err;
>   
>   	lockdep_assert_held_write(&vm->lock);
>   
> -	if (bo_has_vm_references(bo, vm, vma))
> -		return 0;
> +	xe_vm_tv_populate(vm, &tv_vm);
> +	list_add_tail(&tv_vm.head, &objs);
> +	vbo = xe_vma_bo(vma);
> +	if (vbo) {
> +		/*
> +		 * An unbind can drop the last reference to the BO and
> +		 * the BO is needed for ttm_eu_backoff_reservation so
> +		 * take a reference here.
> +		 */
> +		xe_bo_get(vbo);
>   
> -	list_add(&vma->extobj.link, &vm->extobj.list);
> -	vm->extobj.entries++;
> +		tv_bo.bo = &vbo->ttm;
> +		tv_bo.num_shared = 1;
> +		list_add(&tv_bo.head, &objs);
> +	}
>   
> -	return 0;
> -}
> +again:
> +	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> +	if (err) {
> +		xe_bo_put(vbo);
> +		return err;
> +	}
>   
> -static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
> -				      u64 addr, u64 range, u32 op)
> -{
> -	struct xe_device *xe = vm->xe;
> -	struct xe_vma *vma, lookup;
> -	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
> +	xe_vm_assert_held(vm);
> +	xe_bo_assert_held(xe_vma_bo(vma));
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		err = xe_vm_bind(vm, vma, op->engine, xe_vma_bo(vma),
> +				 op->syncs, op->num_syncs, op->fence,
> +				 op->map.immediate || !xe_vm_in_fault_mode(vm),
> +				 op->flags & XE_VMA_OP_FIRST,
> +				 op->flags & XE_VMA_OP_LAST);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +	{
> +		bool prev = !!op->remap.prev;
> +		bool next = !!op->remap.next;
> +
> +		if (!op->remap.unmap_done) {
> +			vm->async_ops.munmap_rebind_inflight = true;
> +			if (prev || next)
> +				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
> +			err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
> +					   op->num_syncs,
> +					   !prev && !next ? op->fence : NULL,
> +					   op->flags & XE_VMA_OP_FIRST,
> +					   op->flags & XE_VMA_OP_LAST && !prev &&
> +					   !next);
> +			if (err)
> +				break;
> +			op->remap.unmap_done = true;
> +		}
>   
> -	lockdep_assert_held(&vm->lock);
> +		if (prev) {
> +			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
> +			err = xe_vm_bind(vm, op->remap.prev, op->engine,
> +					 xe_vma_bo(op->remap.prev), op->syncs,
> +					 op->num_syncs,
> +					 !next ? op->fence : NULL, true, false,
> +					 op->flags & XE_VMA_OP_LAST && !next);
> +			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
> +			if (err)
> +				break;
> +			op->remap.prev = NULL;
> +		}
>   
> -	lookup.start = addr;
> -	lookup.end = addr + range - 1;
> +		if (next) {
> +			op->remap.next->gpuva.flags |= XE_VMA_LAST_REBIND;
> +			err = xe_vm_bind(vm, op->remap.next, op->engine,
> +					 xe_vma_bo(op->remap.next),
> +					 op->syncs, op->num_syncs,
> +					 op->fence, true, false,
> +					 op->flags & XE_VMA_OP_LAST);
> +			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
> +			if (err)
> +				break;
> +			op->remap.next = NULL;
> +		}
> +		vm->async_ops.munmap_rebind_inflight = false;
>   
> -	switch (VM_BIND_OP(op)) {
> -	case XE_VM_BIND_OP_MAP:
> -	case XE_VM_BIND_OP_MAP_USERPTR:
> -		vma = xe_vm_find_overlapping_vma(vm, &lookup);
> -		if (XE_IOCTL_ERR(xe, vma))
> -			return -EBUSY;
>   		break;
> -	case XE_VM_BIND_OP_UNMAP:
> -	case XE_VM_BIND_OP_PREFETCH:
> -		vma = xe_vm_find_overlapping_vma(vm, &lookup);
> -		if (XE_IOCTL_ERR(xe, !vma) ||
> -		    XE_IOCTL_ERR(xe, (vma->start != addr ||
> -				 vma->end != addr + range - 1) && !async))
> -			return -EINVAL;
> +	}
> +	case DRM_GPUVA_OP_UNMAP:
> +		err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
> +				   op->num_syncs, op->fence,
> +				   op->flags & XE_VMA_OP_FIRST,
> +				   op->flags & XE_VMA_OP_LAST);
>   		break;
> -	case XE_VM_BIND_OP_UNMAP_ALL:
> +	case DRM_GPUVA_OP_PREFETCH:
> +		err = xe_vm_prefetch(vm, vma, op->engine, op->prefetch.region,
> +				     op->syncs, op->num_syncs, op->fence,
> +				     op->flags & XE_VMA_OP_FIRST,
> +				     op->flags & XE_VMA_OP_LAST);
>   		break;
>   	default:
>   		XE_BUG_ON("NOT POSSIBLE");
> -		return -EINVAL;
>   	}
>   
> -	return 0;
> -}
> -
> -static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma)
> -{
> -	down_read(&vm->userptr.notifier_lock);
> -	vma->destroyed = true;
> -	up_read(&vm->userptr.notifier_lock);
> -	xe_vm_remove_vma(vm, vma);
> -}
> -
> -static int prep_replacement_vma(struct xe_vm *vm, struct xe_vma *vma)
> -{
> -	int err;
> -
> -	if (vma->bo && !vma->bo->vm) {
> -		vm_insert_extobj(vm, vma);
> -		err = add_preempt_fences(vm, vma->bo);
> -		if (err)
> -			return err;
> +	ttm_eu_backoff_reservation(&ww, &objs);
> +	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> +		lockdep_assert_held_write(&vm->lock);
> +		err = xe_vma_userptr_pin_pages(vma);
> +		if (!err)
> +			goto again;
>   	}
> +	xe_bo_put(vbo);
>   
> -	return 0;
> +	if (err)
> +		trace_xe_vma_fail(vma);
> +
> +	return err;
>   }
>   
> -/*
> - * Find all overlapping VMAs in lookup range and add to a list in the returned
> - * VMA, all of VMAs found will be unbound. Also possibly add 2 new VMAs that
> - * need to be bound if first / last VMAs are not fully unbound. This is akin to
> - * how munmap works.
> - */
> -static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
> -					    struct xe_vma *lookup)
> +static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
>   {
> -	struct xe_vma *vma = xe_vm_find_overlapping_vma(vm, lookup);
> -	struct rb_node *node;
> -	struct xe_vma *first = vma, *last = vma, *new_first = NULL,
> -		      *new_last = NULL, *__vma, *next;
> -	int err = 0;
> -	bool first_munmap_rebind = false;
> +	int ret = 0;
>   
> -	lockdep_assert_held(&vm->lock);
> -	XE_BUG_ON(!vma);
> -
> -	node = &vma->vm_node;
> -	while ((node = rb_next(node))) {
> -		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> -			__vma = to_xe_vma(node);
> -			list_add_tail(&__vma->unbind_link, &vma->unbind_link);
> -			last = __vma;
> -		} else {
> -			break;
> -		}
> -	}
> +	lockdep_assert_held_write(&vm->lock);
>   
> -	node = &vma->vm_node;
> -	while ((node = rb_prev(node))) {
> -		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> -			__vma = to_xe_vma(node);
> -			list_add(&__vma->unbind_link, &vma->unbind_link);
> -			first = __vma;
> -		} else {
> -			break;
> -		}
> +#ifdef TEST_VM_ASYNC_OPS_ERROR
> +	if (op->inject_error) {
> +		op->inject_error = false;
> +		return -ENOMEM;
>   	}
> +#endif
>   
> -	if (first->start != lookup->start) {
> -		struct ww_acquire_ctx ww;
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		ret = __xe_vma_op_execute(vm, op->map.vma, op);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +	{
> +		struct xe_vma *vma;
> +
> +		if (!op->remap.unmap_done)
> +			vma = gpuva_to_vma(op->base.remap.unmap->va);
> +		else if(op->remap.prev)
> +			vma = op->remap.prev;
> +		else
> +			vma = op->remap.next;
>   
> -		if (first->bo)
> -			err = xe_bo_lock(first->bo, &ww, 0, true);
> -		if (err)
> -			goto unwind;
> -		new_first = xe_vma_create(first->vm, first->bo,
> -					  first->bo ? first->bo_offset :
> -					  first->userptr.ptr,
> -					  first->start,
> -					  lookup->start - 1,
> -					  (first->pte_flags & PTE_READ_ONLY),
> -					  first->gt_mask);
> -		if (first->bo)
> -			xe_bo_unlock(first->bo, &ww);
> -		if (!new_first) {
> -			err = -ENOMEM;
> -			goto unwind;
> -		}
> -		if (!first->bo) {
> -			err = xe_vma_userptr_pin_pages(new_first);
> -			if (err)
> -				goto unwind;
> -		}
> -		err = prep_replacement_vma(vm, new_first);
> -		if (err)
> -			goto unwind;
> +		ret = __xe_vma_op_execute(vm, vma, op);
> +		break;
> +	}
> +	case DRM_GPUVA_OP_UNMAP:
> +		ret = __xe_vma_op_execute(vm, gpuva_to_vma(op->base.unmap.va),
> +					  op);
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		ret = __xe_vma_op_execute(vm,
> +					  gpuva_to_vma(op->base.prefetch.va),
> +					  op);
> +		break;
> +	default:
> +		XE_BUG_ON("NOT POSSIBLE");
>   	}
>   
> -	if (last->end != lookup->end) {
> -		struct ww_acquire_ctx ww;
> -		u64 chunk = lookup->end + 1 - last->start;
> +	return ret;
> +}
>   
> -		if (last->bo)
> -			err = xe_bo_lock(last->bo, &ww, 0, true);
> -		if (err)
> -			goto unwind;
> -		new_last = xe_vma_create(last->vm, last->bo,
> -					 last->bo ? last->bo_offset + chunk :
> -					 last->userptr.ptr + chunk,
> -					 last->start + chunk,
> -					 last->end,
> -					 (last->pte_flags & PTE_READ_ONLY),
> -					 last->gt_mask);
> -		if (last->bo)
> -			xe_bo_unlock(last->bo, &ww);
> -		if (!new_last) {
> -			err = -ENOMEM;
> -			goto unwind;
> -		}
> -		if (!last->bo) {
> -			err = xe_vma_userptr_pin_pages(new_last);
> -			if (err)
> -				goto unwind;
> -		}
> -		err = prep_replacement_vma(vm, new_last);
> -		if (err)
> -			goto unwind;
> -	}
> +static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
> +{
> +	bool last = op->flags & XE_VMA_OP_LAST;
>   
> -	prep_vma_destroy(vm, vma);
> -	if (list_empty(&vma->unbind_link) && (new_first || new_last))
> -		vma->first_munmap_rebind = true;
> -	list_for_each_entry(__vma, &vma->unbind_link, unbind_link) {
> -		if ((new_first || new_last) && !first_munmap_rebind) {
> -			__vma->first_munmap_rebind = true;
> -			first_munmap_rebind = true;
> -		}
> -		prep_vma_destroy(vm, __vma);
> -	}
> -	if (new_first) {
> -		xe_vm_insert_vma(vm, new_first);
> -		list_add_tail(&new_first->unbind_link, &vma->unbind_link);
> -		if (!new_last)
> -			new_first->last_munmap_rebind = true;
> +	if (last) {
> +		while (op->num_syncs--)
> +			xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
> +		kfree(op->syncs);
> +		if (op->engine)
> +			xe_engine_put(op->engine);
> +		if (op->fence)
> +			dma_fence_put(&op->fence->fence);
>   	}
> -	if (new_last) {
> -		xe_vm_insert_vma(vm, new_last);
> -		list_add_tail(&new_last->unbind_link, &vma->unbind_link);
> -		new_last->last_munmap_rebind = true;
> +	if (!list_empty(&op->link)) {
> +		spin_lock_irq(&vm->async_ops.lock);
> +		list_del(&op->link);
> +		spin_unlock_irq(&vm->async_ops.lock);
>   	}
> +	if (op->ops)
> +		drm_gpuva_ops_free(&vm->mgr, op->ops);
> +	if (last)
> +		xe_vm_put(vm);
> +}
>   
> -	return vma;
> +static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
> +			     bool post_commit)
> +{
> +	lockdep_assert_held_write(&vm->lock);
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		prep_vma_destroy(vm, op->map.vma, post_commit);
> +		xe_vma_destroy(op->map.vma, NULL);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +	{
> +		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
>   
> -unwind:
> -	list_for_each_entry_safe(__vma, next, &vma->unbind_link, unbind_link)
> -		list_del_init(&__vma->unbind_link);
> -	if (new_last) {
> -		prep_vma_destroy(vm, new_last);
> -		xe_vma_destroy_unlocked(new_last);
> +		down_read(&vm->userptr.notifier_lock);
> +		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
> +		up_read(&vm->userptr.notifier_lock);
> +		if (post_commit)
> +			xe_vm_insert_vma(vm, vma);

Can error, so not suitable for unwind?

> +		break;
>   	}
> -	if (new_first) {
> -		prep_vma_destroy(vm, new_first);
> -		xe_vma_destroy_unlocked(new_first);
> +	case DRM_GPUVA_OP_PREFETCH:
> +	case DRM_GPUVA_OP_REMAP:
> +		/* Nothing to do */
> +		break;
> +	default:
> +		XE_BUG_ON("NOT POSSIBLE");
>   	}
> +}
>   
> -	return ERR_PTR(err);
> +static struct xe_vma_op *next_vma_op(struct xe_vm *vm)
> +{
> +	return list_first_entry_or_null(&vm->async_ops.pending,
> +					struct xe_vma_op, link);
>   }
>   
> -/*
> - * Similar to vm_unbind_lookup_vmas, find all VMAs in lookup range to prefetch
> - */
> -static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
> -					      struct xe_vma *lookup,
> -					      u32 region)
> +static void xe_vma_op_work_func(struct work_struct *w)

Won't review this function since it's going away.

>   {
> -	struct xe_vma *vma = xe_vm_find_overlapping_vma(vm, lookup), *__vma,
> -		      *next;
> -	struct rb_node *node;
> +	struct xe_vm *vm = container_of(w, struct xe_vm, async_ops.work);
>   
> -	if (!xe_vma_is_userptr(vma)) {
> -		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
> -			return ERR_PTR(-EINVAL);
> -	}
> +	for (;;) {
> +		struct xe_vma_op *op;
> +		int err;
>   
> -	node = &vma->vm_node;
> -	while ((node = rb_next(node))) {
> -		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> -			__vma = to_xe_vma(node);
> -			if (!xe_vma_is_userptr(__vma)) {
> -				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> -					goto flush_list;
> -			}
> -			list_add_tail(&__vma->unbind_link, &vma->unbind_link);
> -		} else {
> +		if (vm->async_ops.error && !xe_vm_is_closed(vm))
>   			break;
> -		}
> -	}
>   
> -	node = &vma->vm_node;
> -	while ((node = rb_prev(node))) {
> -		if (!xe_vma_cmp_vma_cb(lookup, node)) {
> -			__vma = to_xe_vma(node);
> -			if (!xe_vma_is_userptr(__vma)) {
> -				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
> -					goto flush_list;
> -			}
> -			list_add(&__vma->unbind_link, &vma->unbind_link);
> -		} else {
> +		spin_lock_irq(&vm->async_ops.lock);
> +		op = next_vma_op(vm);
> +		spin_unlock_irq(&vm->async_ops.lock);
> +
> +		if (!op)
>   			break;
> -		}
> -	}
>   
> -	return vma;
> +		if (!xe_vm_is_closed(vm)) {
> +			down_write(&vm->lock);
> +			err = xe_vma_op_execute(vm, op);
> +			if (err) {
> +				drm_warn(&vm->xe->drm, "Async VM op(%d) failed with %d",
> +					 0, err);
>   
> -flush_list:
> -	list_for_each_entry_safe(__vma, next, &vma->unbind_link,
> -				 unbind_link)
> -		list_del_init(&__vma->unbind_link);
> +				vm_set_async_error(vm, err);
> +				up_write(&vm->lock);
>   
> -	return ERR_PTR(-EINVAL);
> -}
> +				if (vm->async_ops.error_capture.addr)
> +					vm_error_capture(vm, err, 0, 0, 0);
> +				break;
> +			}
> +			up_write(&vm->lock);
> +		} else {
> +			struct xe_vma *vma;
>   
> -static struct xe_vma *vm_unbind_all_lookup_vmas(struct xe_vm *vm,
> -						struct xe_bo *bo)
> -{
> -	struct xe_vma *first = NULL, *vma;
> +			switch (op->base.op) {
> +			case DRM_GPUVA_OP_REMAP:
> +				vma = gpuva_to_vma(op->base.remap.unmap->va);
> +				trace_xe_vma_flush(vma);
>   
> -	lockdep_assert_held(&vm->lock);
> -	xe_bo_assert_held(bo);
> +				down_write(&vm->lock);
> +				xe_vma_destroy_unlocked(vma);
> +				up_write(&vm->lock);
> +				break;
> +			case DRM_GPUVA_OP_UNMAP:
> +				vma = gpuva_to_vma(op->base.unmap.va);
> +				trace_xe_vma_flush(vma);
>   
> -	list_for_each_entry(vma, &bo->vmas, bo_link) {
> -		if (vma->vm != vm)
> -			continue;
> +				down_write(&vm->lock);
> +				xe_vma_destroy_unlocked(vma);
> +				up_write(&vm->lock);
> +				break;
> +			default:
> +				/* Nothing to do */
> +				break;
> +			}
>   
> -		prep_vma_destroy(vm, vma);
> -		if (!first)
> -			first = vma;
> -		else
> -			list_add_tail(&vma->unbind_link, &first->unbind_link);
> -	}
> +			if (op->fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> +						   &op->fence->fence.flags)) {
> +				if (!xe_vm_no_dma_fences(vm)) {
> +					op->fence->started = true;
> +					smp_wmb();
> +					wake_up_all(&op->fence->wq);
> +				}
> +				dma_fence_signal(&op->fence->fence);
> +			}
> +		}
>   
> -	return first;
> +		xe_vma_op_cleanup(vm, op);
> +	}
>   }
>   
> -static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
> -					       struct xe_bo *bo,
> -					       u64 bo_offset_or_userptr,
> -					       u64 addr, u64 range, u32 op,
> -					       u64 gt_mask, u32 region)
> +/*
> + * Commit operations list, this step cannot fail in async mode, can fail if the
> + * bind operation fails in sync mode.
> + */

But can fail in async mode as mentioned above?


> +static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
> +				    struct list_head *ops_list, bool async)
>   {
> -	struct ww_acquire_ctx ww;
> -	struct xe_vma *vma, lookup;
> -	int err;
> -
> -	lockdep_assert_held(&vm->lock);
> +	struct xe_vma_op *op, *last_op;
> +	int err = 0;
>   
> -	lookup.start = addr;
> -	lookup.end = addr + range - 1;
> +	lockdep_assert_held_write(&vm->lock);
>   
> -	switch (VM_BIND_OP(op)) {
> -	case XE_VM_BIND_OP_MAP:
> -		XE_BUG_ON(!bo);
> +	list_for_each_entry(op, ops_list, link) {
> +		last_op = op;
> +		xe_vma_op_commit(vm, op);
> +	}
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +	if (!async) {
> +		err = xe_vma_op_execute(vm, last_op);
>   		if (err)
> -			return ERR_PTR(err);
> -		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
> -				    addr + range - 1,
> -				    op & XE_VM_BIND_FLAG_READONLY,
> -				    gt_mask);
> -		xe_bo_unlock(bo, &ww);
> -		if (!vma)
> -			return ERR_PTR(-ENOMEM);
> +			xe_vma_op_unwind(vm, last_op, true);
> +		xe_vma_op_cleanup(vm, last_op);
> +	} else {
> +		int i;
> +		bool installed = false;
>   
> -		xe_vm_insert_vma(vm, vma);
> -		if (!bo->vm) {
> -			vm_insert_extobj(vm, vma);
> -			err = add_preempt_fences(vm, bo);
> -			if (err) {
> -				prep_vma_destroy(vm, vma);
> -				xe_vma_destroy_unlocked(vma);
> +		for (i = 0; i < last_op->num_syncs; i++)
> +			installed |= xe_sync_entry_signal(&last_op->syncs[i],
> +							  NULL,
> +							  &last_op->fence->fence);
> +		if (!installed && last_op->fence)
> +			dma_fence_signal(&last_op->fence->fence);
>   
> -				return ERR_PTR(err);
> -			}
> -		}
> -		break;
> -	case XE_VM_BIND_OP_UNMAP:
> -		vma = vm_unbind_lookup_vmas(vm, &lookup);
> -		break;
> -	case XE_VM_BIND_OP_PREFETCH:
> -		vma = vm_prefetch_lookup_vmas(vm, &lookup, region);
> -		break;
> -	case XE_VM_BIND_OP_UNMAP_ALL:
> -		XE_BUG_ON(!bo);
> +		spin_lock_irq(&vm->async_ops.lock);
> +		list_splice_tail(ops_list, &vm->async_ops.pending);
> +		spin_unlock_irq(&vm->async_ops.lock);
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> -		if (err)
> -			return ERR_PTR(err);
> -		vma = vm_unbind_all_lookup_vmas(vm, bo);
> -		if (!vma)
> -			vma = ERR_PTR(-EINVAL);
> -		xe_bo_unlock(bo, &ww);
> -		break;
> -	case XE_VM_BIND_OP_MAP_USERPTR:
> -		XE_BUG_ON(bo);
> +		if (!vm->async_ops.error)
> +			queue_work(system_unbound_wq, &vm->async_ops.work);
> +	}
>   
> -		vma = xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
> -				    addr + range - 1,
> -				    op & XE_VM_BIND_FLAG_READONLY,
> -				    gt_mask);
> -		if (!vma)
> -			return ERR_PTR(-ENOMEM);
> +	return err;
> +}
>   
> -		err = xe_vma_userptr_pin_pages(vma);
> -		if (err) {
> -			prep_vma_destroy(vm, vma);
> -			xe_vma_destroy_unlocked(vma);
> +/*
> + * Unwind operations list, called after a failure of vm_bind_ioctl_ops_create or
> + * vm_bind_ioctl_ops_parse.
> + */
> +static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
> +				     struct drm_gpuva_ops **ops,
> +				     int num_ops_list)
> +{
> +	int i;
>   
> -			return ERR_PTR(err);
> -		} else {
> -			xe_vm_insert_vma(vm, vma);
> +	for (i = 0; i < num_ops_list; ++i) {
> +		struct drm_gpuva_ops *__ops = ops[i];
> +		struct drm_gpuva_op *__op;
> +
> +		if (!__ops)
> +			continue;
> +
> +		drm_gpuva_for_each_op(__op, __ops) {
> +			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +			xe_vma_op_unwind(vm, op, false);
>   		}
> -		break;
> -	default:
> -		XE_BUG_ON("NOT POSSIBLE");
> -		vma = ERR_PTR(-EINVAL);
>   	}
> -
> -	return vma;
>   }
>   
>   #ifdef TEST_VM_ASYNC_OPS_ERROR
> @@ -2971,15 +2939,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct drm_xe_vm_bind *args = data;
>   	struct drm_xe_sync __user *syncs_user;
>   	struct xe_bo **bos = NULL;
> -	struct xe_vma **vmas = NULL;
> +	struct drm_gpuva_ops **ops = NULL;
>   	struct xe_vm *vm;
>   	struct xe_engine *e = NULL;
>   	u32 num_syncs;
>   	struct xe_sync_entry *syncs = NULL;
>   	struct drm_xe_vm_bind_op *bind_ops;
> +	LIST_HEAD(ops_list);
>   	bool async;
>   	int err;
> -	int i, j = 0;
> +	int i;
>   
>   	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
>   	if (err)
> @@ -3067,8 +3036,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto put_engine;
>   	}
>   
> -	vmas = kzalloc(sizeof(*vmas) * args->num_binds, GFP_KERNEL);
> -	if (!vmas) {
> +	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
> +	if (!ops) {
>   		err = -ENOMEM;
>   		goto put_engine;
>   	}
> @@ -3148,128 +3117,40 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		u64 gt_mask = bind_ops[i].gt_mask;
>   		u32 region = bind_ops[i].region;
>   
> -		vmas[i] = vm_bind_ioctl_lookup_vma(vm, bos[i], obj_offset,
> -						   addr, range, op, gt_mask,
> -						   region);
> -		if (IS_ERR(vmas[i])) {
> -			err = PTR_ERR(vmas[i]);
> -			vmas[i] = NULL;
> -			goto destroy_vmas;
> -		}
> -	}
> -
> -	for (j = 0; j < args->num_binds; ++j) {
> -		struct xe_sync_entry *__syncs;
> -		u32 __num_syncs = 0;
> -		bool first_or_last = j == 0 || j == args->num_binds - 1;
> -
> -		if (args->num_binds == 1) {
> -			__num_syncs = num_syncs;
> -			__syncs = syncs;
> -		} else if (first_or_last && num_syncs) {
> -			bool first = j == 0;
> -
> -			__syncs = kmalloc(sizeof(*__syncs) * num_syncs,
> -					  GFP_KERNEL);
> -			if (!__syncs) {
> -				err = ENOMEM;
> -				break;
> -			}
> -
> -			/* in-syncs on first bind, out-syncs on last bind */
> -			for (i = 0; i < num_syncs; ++i) {
> -				bool signal = syncs[i].flags &
> -					DRM_XE_SYNC_SIGNAL;
> -
> -				if ((first && !signal) || (!first && signal))
> -					__syncs[__num_syncs++] = syncs[i];
> -			}
> -		} else {
> -			__num_syncs = 0;
> -			__syncs = NULL;
> -		}
> -
> -		if (async) {
> -			bool last = j == args->num_binds - 1;
> -
> -			/*
> -			 * Each pass of async worker drops the ref, take a ref
> -			 * here, 1 set of refs taken above
> -			 */
> -			if (!last) {
> -				if (e)
> -					xe_engine_get(e);
> -				xe_vm_get(vm);
> -			}
> -
> -			err = vm_bind_ioctl_async(vm, vmas[j], e, bos[j],
> -						  bind_ops + j, __syncs,
> -						  __num_syncs);
> -			if (err && !last) {
> -				if (e)
> -					xe_engine_put(e);
> -				xe_vm_put(vm);
> -			}
> -			if (err)
> -				break;
> -		} else {
> -			XE_BUG_ON(j != 0);	/* Not supported */
> -			err = vm_bind_ioctl(vm, vmas[j], e, bos[j],
> -					    bind_ops + j, __syncs,
> -					    __num_syncs, NULL);
> -			break;	/* Needed so cleanup loops work */
> +		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> +						  addr, range, op, gt_mask,
> +						  region);
> +		if (IS_ERR(ops[i])) {
> +			err = PTR_ERR(ops[i]);
> +			ops[i] = NULL;
> +			goto unwind_ops;
>   		}
>   	}
>   
> -	/* Most of cleanup owned by the async bind worker */
> -	if (async && !err) {
> -		up_write(&vm->lock);
> -		if (args->num_binds > 1)
> -			kfree(syncs);
> -		goto free_objs;
> -	}
> +	err = vm_bind_ioctl_ops_parse(vm, e, ops, args->num_binds,
> +				      syncs, num_syncs, &ops_list, async);
> +	if (err)
> +		goto unwind_ops;
>   
> -destroy_vmas:
> -	for (i = j; err && i < args->num_binds; ++i) {
> -		u32 op = bind_ops[i].op;
> -		struct xe_vma *vma, *next;
> +	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
> +	up_write(&vm->lock);
>   
> -		if (!vmas[i])
> -			break;
> +	for (i = 0; i < args->num_binds; ++i)
> +		xe_bo_put(bos[i]);
>   
> -		list_for_each_entry_safe(vma, next, &vma->unbind_link,
> -					 unbind_link) {
> -			list_del_init(&vma->unbind_link);
> -			if (!vma->destroyed) {
> -				prep_vma_destroy(vm, vma);
> -				xe_vma_destroy_unlocked(vma);
> -			}
> -		}
> +	return err;
>   
> -		switch (VM_BIND_OP(op)) {
> -		case XE_VM_BIND_OP_MAP:
> -			prep_vma_destroy(vm, vmas[i]);
> -			xe_vma_destroy_unlocked(vmas[i]);
> -			break;
> -		case XE_VM_BIND_OP_MAP_USERPTR:
> -			prep_vma_destroy(vm, vmas[i]);
> -			xe_vma_destroy_unlocked(vmas[i]);
> -			break;
> -		}
> -	}
> +unwind_ops:
> +	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
>   release_vm_lock:
>   	up_write(&vm->lock);
>   free_syncs:
> -	while (num_syncs--) {
> -		if (async && j &&
> -		    !(syncs[num_syncs].flags & DRM_XE_SYNC_SIGNAL))
> -			continue;	/* Still in async worker */
> +	while (num_syncs--)
>   		xe_sync_entry_cleanup(&syncs[num_syncs]);
> -	}
>   
>   	kfree(syncs);
>   put_obj:
> -	for (i = j; i < args->num_binds; ++i)
> +	for (i = 0; i < args->num_binds; ++i)
>   		xe_bo_put(bos[i]);
>   put_engine:
>   	if (e)
> @@ -3278,7 +3159,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	xe_vm_put(vm);
>   free_objs:
>   	kfree(bos);
> -	kfree(vmas);
> +	kfree(ops);
>   	if (args->num_binds > 1)
>   		kfree(bind_ops);
>   	return err;
> @@ -3322,14 +3203,14 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
>    */
>   int xe_vm_invalidate_vma(struct xe_vma *vma)
>   {
> -	struct xe_device *xe = vma->vm->xe;
> +	struct xe_device *xe = xe_vma_vm(vma)->xe;
>   	struct xe_gt *gt;
>   	u32 gt_needs_invalidate = 0;
>   	int seqno[XE_MAX_GT];
>   	u8 id;
>   	int ret;
>   
> -	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
> +	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
>   	trace_xe_vma_usm_invalidate(vma);
>   
>   	/* Check that we don't race with page-table updates */
> @@ -3338,11 +3219,11 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   			WARN_ON_ONCE(!mmu_interval_check_retry
>   				     (&vma->userptr.notifier,
>   				      vma->userptr.notifier_seq));
> -			WARN_ON_ONCE(!dma_resv_test_signaled(&vma->vm->resv,
> +			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
>   							     DMA_RESV_USAGE_BOOKKEEP));
>   
>   		} else {
> -			xe_bo_assert_held(vma->bo);
> +			xe_bo_assert_held(xe_vma_bo(vma));
>   		}
>   	}
>   
> @@ -3372,7 +3253,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   #if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
>   int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>   {
> -	struct rb_node *node;
> +	DRM_GPUVA_ITER(it, &vm->mgr, 0);
>   	bool is_vram;
>   	uint64_t addr;
>   
> @@ -3385,8 +3266,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>   		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
>   	}
>   
> -	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
> -		struct xe_vma *vma = to_xe_vma(node);
> +	drm_gpuva_iter_for_each(it) {
> +		struct xe_vma* vma = gpuva_to_vma(it.va);
>   		bool is_userptr = xe_vma_is_userptr(vma);
>   
>   		if (is_userptr) {
> @@ -3395,10 +3276,10 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>   			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE, &cur);
>   			addr = xe_res_dma(&cur);
>   		} else {
> -			addr = xe_bo_addr(vma->bo, 0, GEN8_PAGE_SIZE, &is_vram);
> +			addr = xe_bo_addr(xe_vma_bo(vma), 0, GEN8_PAGE_SIZE, &is_vram);
>   		}
>   		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
> -			   vma->start, vma->end, vma->end - vma->start + 1ull,
> +			   xe_vma_start(vma), xe_vma_end(vma), xe_vma_size(vma),
>   			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
>   	}
>   	up_read(&vm->lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 748dc16ebed9..21b1054949c4 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -6,6 +6,7 @@
>   #ifndef _XE_VM_H_
>   #define _XE_VM_H_
>   
> +#include "xe_bo_types.h"
>   #include "xe_macros.h"
>   #include "xe_map.h"
>   #include "xe_vm_types.h"
> @@ -25,7 +26,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
>   void xe_vm_free(struct kref *ref);
>   
>   struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
> -int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
>   
>   static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
>   {
> @@ -50,7 +50,67 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
>   }
>   
>   struct xe_vma *
> -xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
> +xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
> +
> +static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
> +{
> +	return container_of(gpuva->mgr, struct xe_vm, mgr);
> +}
> +
> +static inline struct xe_vma *gpuva_to_vma(struct drm_gpuva *gpuva)
> +{
> +	return container_of(gpuva, struct xe_vma, gpuva);
> +}
> +
> +static inline struct xe_vma_op *gpuva_op_to_vma_op(struct drm_gpuva_op *op)
> +{
> +	return container_of(op, struct xe_vma_op, base);
> +}
> +
> +/*
> + * Let's abstract start, size, end, bo_offset, vm, and bo as the underlying
> + * implementation may change
> + */
> +static inline u64 xe_vma_start(struct xe_vma *vma)
> +{
> +	return vma->gpuva.va.addr;
> +}
> +
> +static inline u64 xe_vma_size(struct xe_vma *vma)
> +{
> +	return vma->gpuva.va.range;
> +}
> +
> +static inline u64 xe_vma_end(struct xe_vma *vma)
> +{
> +	return xe_vma_start(vma) + xe_vma_size(vma);
> +}
> +
> +static inline u64 xe_vma_bo_offset(struct xe_vma *vma)
> +{
> +	return vma->gpuva.gem.offset;
> +}
> +
> +static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
> +{
> +	return !vma->gpuva.gem.obj ? NULL :
> +		container_of(vma->gpuva.gem.obj, struct xe_bo, ttm.base);
> +}
> +
> +static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
> +{
> +	return container_of(vma->gpuva.mgr, struct xe_vm, mgr);
> +}
> +
> +static inline bool xe_vma_read_only(struct xe_vma *vma)
> +{
> +	return vma->gpuva.flags & XE_VMA_READ_ONLY;
> +}
> +
> +static inline u64 xe_vma_userptr(struct xe_vma *vma)
> +{
> +	return vma->gpuva.gem.offset;
> +}
>   
>   #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
>   
> @@ -117,7 +177,7 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>   
>   static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>   {
> -	return !vma->bo;
> +	return !xe_vma_bo(vma);
>   }
>   
>   int xe_vma_userptr_pin_pages(struct xe_vma *vma);
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 29815852985a..46d1b8d7b72f 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -30,7 +30,7 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
>   		struct xe_bo *bo;
>   		struct ww_acquire_ctx ww;
>   
> -		bo = vmas[i]->bo;
> +		bo = xe_vma_bo(vmas[i]);
>   
>   		err = xe_bo_lock(bo, &ww, 0, true);
>   		if (err)
> @@ -55,7 +55,7 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
>   		struct xe_bo *bo;
>   		struct ww_acquire_ctx ww;
>   
> -		bo = vmas[i]->bo;
> +		bo = xe_vma_bo(vmas[i]);
>   
>   		err = xe_bo_lock(bo, &ww, 0, true);
>   		if (err)
> @@ -91,7 +91,7 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
>   		struct xe_bo *bo;
>   		struct ww_acquire_ctx ww;
>   
> -		bo = vmas[i]->bo;
> +		bo = xe_vma_bo(vmas[i]);
>   
>   		err = xe_bo_lock(bo, &ww, 0, true);
>   		if (err)
> @@ -114,7 +114,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>   		struct xe_bo *bo;
>   		struct ww_acquire_ctx ww;
>   
> -		bo = vmas[i]->bo;
> +		bo = xe_vma_bo(vmas[i]);
>   		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
>   			return -EINVAL;
>   
> @@ -145,7 +145,7 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
>   		struct xe_bo *bo;
>   		struct ww_acquire_ctx ww;
>   
> -		bo = vmas[i]->bo;
> +		bo = xe_vma_bo(vmas[i]);
>   		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
>   				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
>   			return -EINVAL;
> @@ -176,7 +176,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
>   		struct xe_bo *bo;
>   		struct ww_acquire_ctx ww;
>   
> -		bo = vmas[i]->bo;
> +		bo = xe_vma_bo(vmas[i]);
>   
>   		err = xe_bo_lock(bo, &ww, 0, true);
>   		if (err)
> @@ -210,19 +210,12 @@ static const madvise_func madvise_funcs[] = {
>   	[DRM_XE_VM_MADVISE_PIN] = madvise_pin,
>   };
>   
> -static struct xe_vma *node_to_vma(const struct rb_node *node)
> -{
> -	BUILD_BUG_ON(offsetof(struct xe_vma, vm_node) != 0);
> -	return (struct xe_vma *)node;
> -}
> -
>   static struct xe_vma **
>   get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
>   {
> -	struct xe_vma **vmas;
> -	struct xe_vma *vma, *__vma, lookup;
> +	struct xe_vma **vmas, **__vmas;
>   	int max_vmas = 8;
> -	struct rb_node *node;
> +	DRM_GPUVA_ITER(it, &vm->mgr, addr);
>   
>   	lockdep_assert_held(&vm->lock);
>   
> @@ -230,64 +223,24 @@ get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
>   	if (!vmas)
>   		return NULL;
>   
> -	lookup.start = addr;
> -	lookup.end = addr + range - 1;
> +	drm_gpuva_iter_for_each_range(it, addr + range) {
> +		struct xe_vma *vma = gpuva_to_vma(it.va);
>   
> -	vma = xe_vm_find_overlapping_vma(vm, &lookup);
> -	if (!vma)
> -		return vmas;
> +		if (xe_vma_is_userptr(vma))
> +			continue;
>   
> -	if (!xe_vma_is_userptr(vma)) {
> +		if (*num_vmas == max_vmas) {
> +			max_vmas <<= 1;
> +			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas),
> +					  GFP_KERNEL);
> +			if (!__vmas)
> +				return NULL;
> +			vmas = __vmas;
> +		}
>   		vmas[*num_vmas] = vma;
>   		*num_vmas += 1;
>   	}
>   
> -	node = &vma->vm_node;
> -	while ((node = rb_next(node))) {
> -		if (!xe_vma_cmp_vma_cb(&lookup, node)) {
> -			__vma = node_to_vma(node);
> -			if (xe_vma_is_userptr(__vma))
> -				continue;
> -
> -			if (*num_vmas == max_vmas) {
> -				struct xe_vma **__vmas =
> -					krealloc(vmas, max_vmas * sizeof(*vmas),
> -						 GFP_KERNEL);
> -
> -				if (!__vmas)
> -					return NULL;
> -				vmas = __vmas;
> -			}
> -			vmas[*num_vmas] = __vma;
> -			*num_vmas += 1;
> -		} else {
> -			break;
> -		}
> -	}
> -
> -	node = &vma->vm_node;
> -	while ((node = rb_prev(node))) {
> -		if (!xe_vma_cmp_vma_cb(&lookup, node)) {
> -			__vma = node_to_vma(node);
> -			if (xe_vma_is_userptr(__vma))
> -				continue;
> -
> -			if (*num_vmas == max_vmas) {
> -				struct xe_vma **__vmas =
> -					krealloc(vmas, max_vmas * sizeof(*vmas),
> -						 GFP_KERNEL);
> -
> -				if (!__vmas)
> -					return NULL;
> -				vmas = __vmas;
> -			}
> -			vmas[*num_vmas] = __vma;
> -			*num_vmas += 1;
> -		} else {
> -			break;
> -		}
> -	}
> -
>   	return vmas;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index fada7896867f..a81dc9a1a7a6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_VM_TYPES_H_
>   #define _XE_VM_TYPES_H_
>   
> +#include <drm/drm_gpuva_mgr.h>
> +
>   #include <linux/dma-resv.h>
>   #include <linux/kref.h>
>   #include <linux/mmu_notifier.h>
> @@ -14,28 +16,23 @@
>   #include "xe_device_types.h"
>   #include "xe_pt_types.h"
>   
> +struct async_op_fence;
>   struct xe_bo;
> +struct xe_sync_entry;
>   struct xe_vm;
>   
> -struct xe_vma {
> -	struct rb_node vm_node;
> -	/** @vm: VM which this VMA belongs to */
> -	struct xe_vm *vm;
> +#define TEST_VM_ASYNC_OPS_ERROR
> +#define FORCE_ASYNC_OP_ERROR	BIT(31)
>   
> -	/**
> -	 * @start: start address of this VMA within its address domain, end -
> -	 * start + 1 == VMA size
> -	 */
> -	u64 start;
> -	/** @end: end address of this VMA within its address domain */
> -	u64 end;
> -	/** @pte_flags: pte flags for this VMA */
> -	u32 pte_flags;
> +#define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
> +#define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
> +#define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
> +#define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
> +#define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
BUILD_BUG_ON() somewhere that we don't overflow the number of userbits?
>   
> -	/** @bo: BO if not a userptr, must be NULL is userptr */
> -	struct xe_bo *bo;
> -	/** @bo_offset: offset into BO if not a userptr, unused for userptr */
> -	u64 bo_offset;
> +struct xe_vma {
> +	/** @gpuva: Base GPUVA object */
> +	struct drm_gpuva gpuva;
>   
>   	/** @gt_mask: GT mask of where to create binding for this VMA */
>   	u64 gt_mask;
> @@ -49,40 +46,8 @@ struct xe_vma {
>   	 */
>   	u64 gt_present;
>   
> -	/**
> -	 * @destroyed: VMA is destroyed, in the sense that it shouldn't be
> -	 * subject to rebind anymore. This field must be written under
> -	 * the vm lock in write mode and the userptr.notifier_lock in
> -	 * either mode. Read under the vm lock or the userptr.notifier_lock in
> -	 * write mode.
> -	 */
> -	bool destroyed;
> -
> -	/**
> -	 * @first_munmap_rebind: VMA is first in a sequence of ops that triggers
> -	 * a rebind (munmap style VM unbinds). This indicates the operation
> -	 * using this VMA must wait on all dma-resv slots (wait for pending jobs
> -	 * / trigger preempt fences).
> -	 */
> -	bool first_munmap_rebind;
> -
> -	/**
> -	 * @last_munmap_rebind: VMA is first in a sequence of ops that triggers
> -	 * a rebind (munmap style VM unbinds). This indicates the operation
> -	 * using this VMA must install itself into kernel dma-resv slot (blocks
> -	 * future jobs) and kick the rebind work in compute mode.
> -	 */
> -	bool last_munmap_rebind;
> -
> -	/** @use_atomic_access_pte_bit: Set atomic access bit in PTE */
> -	bool use_atomic_access_pte_bit;
> -
> -	union {
> -		/** @bo_link: link into BO if not a userptr */
> -		struct list_head bo_link;
> -		/** @userptr_link: link into VM repin list if userptr */
> -		struct list_head userptr_link;
> -	};
> +	/** @userptr_link: link into VM repin list if userptr */
> +	struct list_head userptr_link;
>   
>   	/**
>   	 * @rebind_link: link into VM if this VMA needs rebinding, and
> @@ -105,8 +70,6 @@ struct xe_vma {
>   
>   	/** @userptr: user pointer state */
>   	struct {
> -		/** @ptr: user pointer */
> -		uintptr_t ptr;
>   		/** @invalidate_link: Link for the vm::userptr.invalidated list */
>   		struct list_head invalidate_link;
>   		/**
> @@ -154,6 +117,9 @@ struct xe_device;
>   #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
>   
>   struct xe_vm {
> +	/** @mgr: base GPUVA used to track VMAs */
> +	struct drm_gpuva_manager mgr;
> +
>   	struct xe_device *xe;
>   
>   	struct kref refcount;
> @@ -165,7 +131,6 @@ struct xe_vm {
>   	struct dma_resv resv;
>   
>   	u64 size;
> -	struct rb_root vmas;
>   
>   	struct xe_pt *pt_root[XE_MAX_GT];
>   	struct xe_bo *scratch_bo[XE_MAX_GT];
> @@ -339,4 +304,96 @@ struct xe_vm {
>   	} error_capture;
>   };
>   
> +/** struct xe_vma_op_map - VMA map operation */
> +struct xe_vma_op_map {
> +	/** @vma: VMA to map */
> +	struct xe_vma *vma;
> +	/** @immediate: Immediate bind */
> +	bool immediate;
> +	/** @read_only: Read only */
> +	bool read_only;
> +};
> +
> +/** struct xe_vma_op_unmap - VMA unmap operation */
> +struct xe_vma_op_unmap {
> +	/** @start: start of the VMA unmap */
> +	u64 start;
> +	/** @range: range of the VMA unmap */
> +	u64 range;
> +};
> +
> +/** struct xe_vma_op_remap - VMA remap operation */
> +struct xe_vma_op_remap {
> +	/** @prev: VMA preceding part of a split mapping */
> +	struct xe_vma *prev;
> +	/** @next: VMA subsequent part of a split mapping */
> +	struct xe_vma *next;
> +	/** @start: start of the VMA unmap */
> +	u64 start;
> +	/** @range: range of the VMA unmap */
> +	u64 range;
> +	/** @unmap_done: unmap operation in done */
> +	bool unmap_done;
> +};
> +
> +/** struct xe_vma_op_prefetch - VMA prefetch operation */
> +struct xe_vma_op_prefetch {
> +	/** @region: memory region to prefetch to */
> +	u32 region;
> +};
> +
> +/** enum xe_vma_op_flags - flags for VMA operation */
> +enum xe_vma_op_flags {
> +	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
> +	XE_VMA_OP_FIRST		= (0x1 << 0),
> +	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
> +	XE_VMA_OP_LAST		= (0x1 << 1),
> +};
> +
> +/** struct xe_vma_op - VMA operation */
> +struct xe_vma_op {
> +	/** @base: GPUVA base operation */
> +	struct drm_gpuva_op base;
> +	/**
> +	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> +	 * operations is processed
> +	 */
> +	struct drm_gpuva_ops *ops;
> +	/** @engine: engine for this operation */
> +	struct xe_engine *engine;
> +	/**
> +	 * @syncs: syncs for this operation, only used on first and last
> +	 * operation
> +	 */
> +	struct xe_sync_entry *syncs;
> +	/** @num_syncs: number of syncs */
> +	u32 num_syncs;
> +	/** @link: async operation link */
> +	struct list_head link;
> +	/**
> +	 * @fence: async operation fence, signaled on last operation complete
> +	 */
> +	struct async_op_fence *fence;
> +	/** @gt_mask: gt mask for this operation */
> +	u64 gt_mask;
> +	/** @flags: operation flags */
> +	enum xe_vma_op_flags flags;
> +
> +#ifdef TEST_VM_ASYNC_OPS_ERROR
> +	/** @inject_error: inject error to test async op error handling */
> +	bool inject_error;
> +#endif
> +
> +	union {
> +		/** @map: VMA map operation specific data */
> +		struct xe_vma_op_map map;
> +		/** @unmap: VMA unmap operation specific data */
> +		struct xe_vma_op_unmap unmap;
> +		/** @remap: VMA remap operation specific data */
> +		struct xe_vma_op_remap remap;
> +		/** @prefetch: VMA prefetch operation specific data */
> +		struct xe_vma_op_prefetch prefetch;
> +	};
> +};
> +
>   #endif
