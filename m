Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31364C77B71
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 14:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 112C710E117;
	Fri, 21 Apr 2023 14:54:36 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F049710E117
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682088875; x=1713624875;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tcGLMoaZ2bYYM/UhbLIHS2l4EwRFWTbWB+Go4DPE+74=;
 b=bKSDyUUDdRhFZPzJNUxF1NF4CCNJy/41SYXdakOO8E1wLt/qpMeSYK7r
 Lt3s9j4WpDzEGONUBi82Ejm16Tj6tmfEHllE9dw4zjTRAllx4z0TAbR8j
 15fE9yc6ejALKz4TXiFQsohyJQFkYJ72uzJp3RMdUv32BU47Fiwqx1nsV
 4dEjJrfkoVt01LhBbb9tbFrp50ucqVmSRIYPwPtD32wW63SRbvL7zXCcE
 IUWBBGjCf3mNWFn1M8Sro9CnC0KDwRCd7ZTxtuofJP3HIWh7Hl+PglK0P
 wElFp9U/vvKfAzA/xHk3Uf9+NfikgBgQHH/qjCiGeKhpzjDOwm8L7jY3F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="326339324"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="326339324"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="685742941"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="685742941"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.125])
 ([10.249.254.125])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:54:32 -0700
Message-ID: <a4f3a1b7-f670-07e9-0afa-a44db06b607e@linux.intel.com>
Date: Fri, 21 Apr 2023 16:54:30 +0200
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
>
...
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index bdf82d34eb66..fddbe8d5f984 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -25,10 +25,8 @@
>   #include "xe_preempt_fence.h"
>   #include "xe_pt.h"
>   #include "xe_res_cursor.h"
> -#include "xe_sync.h"
>   #include "xe_trace.h"
> -
> -#define TEST_VM_ASYNC_OPS_ERROR
> +#include "xe_sync.h"
>   
>   /**
>    * xe_vma_userptr_check_repin() - Advisory check for repin needed
> @@ -51,20 +49,19 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma)
>   
>   int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>   {
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	struct xe_device *xe = vm->xe;
> -	const unsigned long num_pages =
> -		(vma->end - vma->start + 1) >> PAGE_SHIFT;
> +	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
>   	struct page **pages;
>   	bool in_kthread = !current->mm;
>   	unsigned long notifier_seq;
>   	int pinned, ret, i;
> -	bool read_only = vma->pte_flags & PTE_READ_ONLY;
> +	bool read_only = xe_vma_read_only(vma);
>   
>   	lockdep_assert_held(&vm->lock);
>   	XE_BUG_ON(!xe_vma_is_userptr(vma));
>   retry:
> -	if (vma->destroyed)
> +	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>   		return 0;
>   
>   	notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
> @@ -94,7 +91,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>   	}
>   
>   	while (pinned < num_pages) {
> -		ret = get_user_pages_fast(vma->userptr.ptr + pinned * PAGE_SIZE,
> +		ret = get_user_pages_fast(xe_vma_userptr(vma) +
> +					  pinned * PAGE_SIZE,
>   					  num_pages - pinned,
>   					  read_only ? 0 : FOLL_WRITE,
>   					  &pages[pinned]);
> @@ -295,7 +293,7 @@ void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
>   	struct xe_vma *vma;
>   
>   	list_for_each_entry(vma, &vm->extobj.list, extobj.link)
> -		dma_resv_add_fence(vma->bo->ttm.base.resv, fence, usage);
> +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence, usage);
>   }
>   
>   static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
> @@ -444,7 +442,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>   	INIT_LIST_HEAD(objs);
>   	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
>   		tv_bo->num_shared = num_shared;
> -		tv_bo->bo = &vma->bo->ttm;
> +		tv_bo->bo = &xe_vma_bo(vma)->ttm;
>   
>   		list_add_tail(&tv_bo->head, objs);
>   		tv_bo++;
> @@ -459,10 +457,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>   	spin_lock(&vm->notifier.list_lock);
>   	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
>   				 notifier.rebind_link) {
> -		xe_bo_assert_held(vma->bo);
> +		xe_bo_assert_held(xe_vma_bo(vma));
>   
>   		list_del_init(&vma->notifier.rebind_link);
> -		if (vma->gt_present && !vma->destroyed)
> +		if (vma->gt_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
>   			list_move_tail(&vma->rebind_link, &vm->rebind_list);
>   	}
>   	spin_unlock(&vm->notifier.list_lock);
> @@ -583,10 +581,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   		goto out_unlock;
>   
>   	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> -		if (xe_vma_is_userptr(vma) || vma->destroyed)
> +		if (xe_vma_is_userptr(vma) ||
> +		    vma->gpuva.flags & XE_VMA_DESTROYED)
>   			continue;
>   
> -		err = xe_bo_validate(vma->bo, vm, false);
> +		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
>   		if (err)
>   			goto out_unlock;
>   	}
> @@ -645,17 +644,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   	trace_xe_vm_rebind_worker_exit(vm);
>   }
>   
> -struct async_op_fence;
> -static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> -			struct xe_engine *e, struct xe_sync_entry *syncs,
> -			u32 num_syncs, struct async_op_fence *afence);
> -
>   static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>   				   const struct mmu_notifier_range *range,
>   				   unsigned long cur_seq)
>   {
>   	struct xe_vma *vma = container_of(mni, struct xe_vma, userptr.notifier);
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
>   	long err;
> @@ -679,7 +673,8 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>   	 * Tell exec and rebind worker they need to repin and rebind this
>   	 * userptr.
>   	 */
> -	if (!xe_vm_in_fault_mode(vm) && !vma->destroyed && vma->gt_present) {
> +	if (!xe_vm_in_fault_mode(vm) &&
> +	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->gt_present) {
introduce an xe_vma_destroyed()?
>   		spin_lock(&vm->userptr.invalidated_lock);
>   		list_move_tail(&vma->userptr.invalidate_link,
>   			       &vm->userptr.invalidated);
> @@ -784,7 +779,8 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
>   
>   static struct dma_fence *
>   xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
> -	       struct xe_sync_entry *syncs, u32 num_syncs);
> +	       struct xe_sync_entry *syncs, u32 num_syncs,
> +	       bool first_op, bool last_op);
>   
>   struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   {
> @@ -805,7 +801,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   			trace_xe_vma_rebind_worker(vma);
>   		else
>   			trace_xe_vma_rebind_exec(vma);
> -		fence = xe_vm_bind_vma(vma, NULL, NULL, 0);
> +		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
>   		if (IS_ERR(fence))
>   			return fence;
>   	}
> @@ -833,6 +829,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   		return vma;
>   	}
>   
> +	/* FIXME: Way to many lists, should be able to reduce this */
Unrelated.
>   	INIT_LIST_HEAD(&vma->rebind_link);
>   	INIT_LIST_HEAD(&vma->unbind_link);
>   	INIT_LIST_HEAD(&vma->userptr_link);
> @@ -840,11 +837,12 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>   	INIT_LIST_HEAD(&vma->extobj.link);
>   
> -	vma->vm = vm;
> -	vma->start = start;
> -	vma->end = end;
> +	INIT_LIST_HEAD(&vma->gpuva.head);
> +	vma->gpuva.mgr = &vm->mgr;
> +	vma->gpuva.va.addr = start;
> +	vma->gpuva.va.range = end - start + 1;

Hm. This comment really belongs to one of the gpuva patches, but while 
range in statistics indeed means the difference between the highest and 
lowest values, I associate range in computer science with the set of 
first and last value or first value and size. Why isn't "size" used 
here, and similarly for some arguments below.

>   	if (read_only)
> -		vma->pte_flags = PTE_READ_ONLY;
> +		vma->gpuva.flags |= XE_VMA_READ_ONLY;
>   
>   	if (gt_mask) {
>   		vma->gt_mask = gt_mask;
> @@ -855,22 +853,24 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   	}
>   
>   	if (vm->xe->info.platform == XE_PVC)
> -		vma->use_atomic_access_pte_bit = true;
> +		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
>   
>   	if (bo) {
>   		xe_bo_assert_held(bo);
> -		vma->bo_offset = bo_offset_or_userptr;
> -		vma->bo = xe_bo_get(bo);
> -		list_add_tail(&vma->bo_link, &bo->vmas);
> +
> +		drm_gem_object_get(&bo->ttm.base);
> +		vma->gpuva.gem.obj = &bo->ttm.base;
> +		vma->gpuva.gem.offset = bo_offset_or_userptr;
> +		drm_gpuva_link(&vma->gpuva);
>   	} else /* userptr */ {
>   		u64 size = end - start + 1;
>   		int err;
>   
> -		vma->userptr.ptr = bo_offset_or_userptr;
> +		vma->gpuva.gem.offset = bo_offset_or_userptr;
>   
>   		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
>   						   current->mm,
> -						   vma->userptr.ptr, size,
> +						   xe_vma_userptr(vma), size,
>   						   &vma_userptr_notifier_ops);
>   		if (err) {
>   			kfree(vma);
> @@ -888,16 +888,16 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   static void vm_remove_extobj(struct xe_vma *vma)
>   {
>   	if (!list_empty(&vma->extobj.link)) {
> -		vma->vm->extobj.entries--;
> +		xe_vma_vm(vma)->extobj.entries--;
>   		list_del_init(&vma->extobj.link);
>   	}
>   }
>   
>   static void xe_vma_destroy_late(struct xe_vma *vma)
>   {
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	struct xe_device *xe = vm->xe;
> -	bool read_only = vma->pte_flags & PTE_READ_ONLY;
> +	bool read_only = xe_vma_read_only(vma);
>   
>   	if (xe_vma_is_userptr(vma)) {
>   		if (vma->userptr.sg) {
> @@ -917,7 +917,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>   		mmu_interval_notifier_remove(&vma->userptr.notifier);
>   		xe_vm_put(vm);
>   	} else {
> -		xe_bo_put(vma->bo);
> +		xe_bo_put(xe_vma_bo(vma));
>   	}
>   
>   	kfree(vma);
> @@ -942,21 +942,22 @@ static void vma_destroy_cb(struct dma_fence *fence,
>   
>   static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   {
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   
>   	lockdep_assert_held_write(&vm->lock);
>   	XE_BUG_ON(!list_empty(&vma->unbind_link));
>   
>   	if (xe_vma_is_userptr(vma)) {
> -		XE_WARN_ON(!vma->destroyed);
> +		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
> +
>   		spin_lock(&vm->userptr.invalidated_lock);
>   		list_del_init(&vma->userptr.invalidate_link);
>   		spin_unlock(&vm->userptr.invalidated_lock);
>   		list_del(&vma->userptr_link);
>   	} else {
> -		xe_bo_assert_held(vma->bo);
> -		list_del(&vma->bo_link);
> -		if (!vma->bo->vm)
> +		xe_bo_assert_held(xe_vma_bo(vma));
> +		drm_gpuva_unlink(&vma->gpuva);
> +		if (!xe_vma_bo(vma)->vm)
>   			vm_remove_extobj(vma);
>   	}
>   
> @@ -981,13 +982,13 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>   {
>   	struct ttm_validate_buffer tv[2];
>   	struct ww_acquire_ctx ww;
> -	struct xe_bo *bo = vma->bo;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>   	LIST_HEAD(objs);
>   	LIST_HEAD(dups);
>   	int err;
>   
>   	memset(tv, 0, sizeof(tv));
> -	tv[0].bo = xe_vm_ttm_bo(vma->vm);
> +	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
>   	list_add(&tv[0].head, &objs);
>   
>   	if (bo) {
> @@ -1004,77 +1005,61 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>   		xe_bo_put(bo);
>   }
>   
> -static struct xe_vma *to_xe_vma(const struct rb_node *node)
> -{
> -	BUILD_BUG_ON(offsetof(struct xe_vma, vm_node) != 0);
> -	return (struct xe_vma *)node;
> -}
> -
> -static int xe_vma_cmp(const struct xe_vma *a, const struct xe_vma *b)
> -{
> -	if (a->end < b->start) {
> -		return -1;
> -	} else if (b->end < a->start) {
> -		return 1;
> -	} else {
> -		return 0;
> -	}
> -}
> -
> -static bool xe_vma_less_cb(struct rb_node *a, const struct rb_node *b)
> -{
> -	return xe_vma_cmp(to_xe_vma(a), to_xe_vma(b)) < 0;
> -}
> -
> -int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node)
> -{
> -	struct xe_vma *cmp = to_xe_vma(node);
> -	const struct xe_vma *own = key;
> -
> -	if (own->start > cmp->end)
> -		return 1;
> -
> -	if (own->end < cmp->start)
> -		return -1;
> -
> -	return 0;
> -}
> -
>   struct xe_vma *
> -xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
> +xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
>   {
> -	struct rb_node *node;
> +	struct drm_gpuva *gpuva;
>   
>   	if (xe_vm_is_closed(vm))
>   		return NULL;
>   
> -	XE_BUG_ON(vma->end >= vm->size);
> +	XE_BUG_ON(start + range > vm->size);
>   	lockdep_assert_held(&vm->lock);
>   
> -	node = rb_find(vma, &vm->vmas, xe_vma_cmp_vma_cb);
> +	gpuva = drm_gpuva_find_first(&vm->mgr, start, range);
>   
> -	return node ? to_xe_vma(node) : NULL;
> +	return gpuva ? gpuva_to_vma(gpuva) : NULL;
>   }
>   
>   static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
>   {
> -	XE_BUG_ON(vma->vm != vm);
> +	int err;
> +
> +	XE_BUG_ON(xe_vma_vm(vma) != vm);
>   	lockdep_assert_held(&vm->lock);
>   
> -	rb_add(&vma->vm_node, &vm->vmas, xe_vma_less_cb);
> +	err = drm_gpuva_insert(&vm->mgr, &vma->gpuva);
> +	XE_WARN_ON(err);
>   }
>   
> -static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
> +static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma, bool remove)
>   {
> -	XE_BUG_ON(vma->vm != vm);
> +	XE_BUG_ON(xe_vma_vm(vma) != vm);
>   	lockdep_assert_held(&vm->lock);
>   
> -	rb_erase(&vma->vm_node, &vm->vmas);
> +	if (remove)
> +		drm_gpuva_remove(&vma->gpuva);
>   	if (vm->usm.last_fault_vma == vma)
>   		vm->usm.last_fault_vma = NULL;
>   }
>   
> -static void async_op_work_func(struct work_struct *w);
> +static struct drm_gpuva_op *xe_vm_op_alloc(void)
> +{
> +	struct xe_vma_op *op;
> +
> +	op = kzalloc(sizeof(*op), GFP_KERNEL);
> +
> +	if (unlikely(!op))
> +		return NULL;
> +
> +	return &op->base;
> +}
> +
> +static struct drm_gpuva_fn_ops gpuva_ops = {
> +	.op_alloc = xe_vm_op_alloc,
> +};
> +
> +static void xe_vma_op_work_func(struct work_struct *w);
>   static void vm_destroy_work_func(struct work_struct *w);
>   
>   struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> @@ -1094,7 +1079,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	vm->size = 1ull << xe_pt_shift(xe->info.vm_max_level + 1);
>   
> -	vm->vmas = RB_ROOT;
>   	vm->flags = flags;
>   
>   	init_rwsem(&vm->lock);
> @@ -1110,7 +1094,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	spin_lock_init(&vm->notifier.list_lock);
>   
>   	INIT_LIST_HEAD(&vm->async_ops.pending);
> -	INIT_WORK(&vm->async_ops.work, async_op_work_func);
> +	INIT_WORK(&vm->async_ops.work, xe_vma_op_work_func);
>   	spin_lock_init(&vm->async_ops.lock);
>   
>   	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
> @@ -1130,6 +1114,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	if (err)
>   		goto err_put;
>   
> +	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
> +			       &gpuva_ops, 0);
>   	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
>   		vm->flags |= XE_VM_FLAGS_64K;
>   
> @@ -1235,6 +1221,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>   	}
>   	dma_resv_unlock(&vm->resv);
> +	drm_gpuva_manager_destroy(&vm->mgr);
>   err_put:
>   	dma_resv_fini(&vm->resv);
>   	kfree(vm);
> @@ -1284,14 +1271,18 @@ static void vm_error_capture(struct xe_vm *vm, int err,
>   
>   void xe_vm_close_and_put(struct xe_vm *vm)
>   {
> -	struct rb_root contested = RB_ROOT;
> +	struct list_head contested;
>   	struct ww_acquire_ctx ww;
>   	struct xe_device *xe = vm->xe;
>   	struct xe_gt *gt;
> +	struct xe_vma *vma, *next_vma;
> +	DRM_GPUVA_ITER(it, &vm->mgr, 0);
>   	u8 id;
>   
>   	XE_BUG_ON(vm->preempt.num_engines);
>   
> +	INIT_LIST_HEAD(&contested);
> +
>   	vm->size = 0;
>   	smp_mb();
>   	flush_async_ops(vm);
> @@ -1308,24 +1299,25 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   
>   	down_write(&vm->lock);
>   	xe_vm_lock(vm, &ww, 0, false);
> -	while (vm->vmas.rb_node) {
> -		struct xe_vma *vma = to_xe_vma(vm->vmas.rb_node);
> +	drm_gpuva_iter_for_each(it) {
> +		vma = gpuva_to_vma(it.va);
>   
>   		if (xe_vma_is_userptr(vma)) {
>   			down_read(&vm->userptr.notifier_lock);
> -			vma->destroyed = true;
> +			vma->gpuva.flags |= XE_VMA_DESTROYED;
>   			up_read(&vm->userptr.notifier_lock);
>   		}
>   
> -		rb_erase(&vma->vm_node, &vm->vmas);
> +		xe_vm_remove_vma(vm, vma, false);
> +		drm_gpuva_iter_remove(&it);
>   
>   		/* easy case, remove from VMA? */
> -		if (xe_vma_is_userptr(vma) || vma->bo->vm) {
> +		if (xe_vma_is_userptr(vma) || xe_vma_bo(vma)->vm) {
>   			xe_vma_destroy(vma, NULL);
>   			continue;
>   		}
>   
> -		rb_add(&vma->vm_node, &contested, xe_vma_less_cb);
> +		list_add_tail(&vma->unbind_link, &contested);
>   	}
>   
>   	/*
> @@ -1348,19 +1340,14 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	}
>   	xe_vm_unlock(vm, &ww);
>   
> -	if (contested.rb_node) {
> -
> -		/*
> -		 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
> -		 * Since we hold a refcount to the bo, we can remove and free
> -		 * the members safely without locking.
> -		 */
> -		while (contested.rb_node) {
> -			struct xe_vma *vma = to_xe_vma(contested.rb_node);
> -
> -			rb_erase(&vma->vm_node, &contested);
> -			xe_vma_destroy_unlocked(vma);
> -		}
> +	/*
> +	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
> +	 * Since we hold a refcount to the bo, we can remove and free
> +	 * the members safely without locking.
> +	 */
> +	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> +		list_del_init(&vma->unbind_link);
> +		xe_vma_destroy_unlocked(vma);
>   	}
>   
>   	if (vm->async_ops.error_capture.addr)
> @@ -1369,6 +1356,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	XE_WARN_ON(!list_empty(&vm->extobj.list));
>   	up_write(&vm->lock);
>   
> +	drm_gpuva_manager_destroy(&vm->mgr);
> +
>   	mutex_lock(&xe->usm.lock);
>   	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
>   		xe->usm.num_vm_in_fault_mode--;
> @@ -1456,13 +1445,14 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_gt *full_gt)
>   
>   static struct dma_fence *
>   xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
> -		 struct xe_sync_entry *syncs, u32 num_syncs)
> +		 struct xe_sync_entry *syncs, u32 num_syncs,
> +		 bool first_op, bool last_op)
>   {
>   	struct xe_gt *gt;
>   	struct dma_fence *fence = NULL;
>   	struct dma_fence **fences = NULL;
>   	struct dma_fence_array *cf = NULL;
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	int cur_fence = 0, i;
>   	int number_gts = hweight_long(vma->gt_present);
>   	int err;
> @@ -1483,7 +1473,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
>   
>   		XE_BUG_ON(xe_gt_is_media_type(gt));
>   
> -		fence = __xe_pt_unbind_vma(gt, vma, e, syncs, num_syncs);
> +		fence = __xe_pt_unbind_vma(gt, vma, e, first_op ? syncs : NULL,
> +					   first_op ? num_syncs : 0);
>   		if (IS_ERR(fence)) {
>   			err = PTR_ERR(fence);
>   			goto err_fences;
> @@ -1509,7 +1500,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
>   		}
>   	}
>   
> -	for (i = 0; i < num_syncs; i++)
> +	for (i = 0; last_op && i < num_syncs; i++)
>   		xe_sync_entry_signal(&syncs[i], NULL, cf ? &cf->base : fence);
>   
>   	return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
> @@ -1528,13 +1519,14 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
>   
>   static struct dma_fence *
>   xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
> -	       struct xe_sync_entry *syncs, u32 num_syncs)
> +	       struct xe_sync_entry *syncs, u32 num_syncs,
> +	       bool first_op, bool last_op)
>   {
>   	struct xe_gt *gt;
>   	struct dma_fence *fence;
>   	struct dma_fence **fences = NULL;
>   	struct dma_fence_array *cf = NULL;
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	int cur_fence = 0, i;
>   	int number_gts = hweight_long(vma->gt_mask);
>   	int err;
> @@ -1554,7 +1546,8 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
>   			goto next;
>   
>   		XE_BUG_ON(xe_gt_is_media_type(gt));
> -		fence = __xe_pt_bind_vma(gt, vma, e, syncs, num_syncs,
> +		fence = __xe_pt_bind_vma(gt, vma, e, first_op ? syncs : NULL,
Do we need that conditional operator expression? Always use "syncs" ?
> +					 first_op ? num_syncs : 0,
>   					 vma->gt_present & BIT(id));
>   		if (IS_ERR(fence)) {
>   			err = PTR_ERR(fence);
> @@ -1581,7 +1574,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
>   		}
>   	}
>   
> -	for (i = 0; i < num_syncs; i++)
> +	for (i = 0; last_op && i < num_syncs; i++)
>   		xe_sync_entry_signal(&syncs[i], NULL, cf ? &cf->base : fence);
>   
>   	return cf ? &cf->base : fence;
> @@ -1680,15 +1673,27 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence)
>   
>   static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
>   			struct xe_engine *e, struct xe_sync_entry *syncs,
> -			u32 num_syncs, struct async_op_fence *afence)
> +			u32 num_syncs, struct async_op_fence *afence,
> +			bool immediate, bool first_op, bool last_op)
>   {
>   	struct dma_fence *fence;
>   
>   	xe_vm_assert_held(vm);
>   
> -	fence = xe_vm_bind_vma(vma, e, syncs, num_syncs);
> -	if (IS_ERR(fence))
> -		return PTR_ERR(fence);
> +	if (immediate) {
> +		fence = xe_vm_bind_vma(vma, e, syncs, num_syncs, first_op,
> +				       last_op);
> +		if (IS_ERR(fence))
> +			return PTR_ERR(fence);
> +	} else {
> +		int i;
> +
> +		XE_BUG_ON(!xe_vm_in_fault_mode(vm));
> +
> +		fence = dma_fence_get_stub();
> +		for (i = 0; last_op && i < num_syncs; i++)
This construct is often misread, people missing the last_op condition. 
Can we do if (last_op) {}?
> +			xe_sync_entry_signal(&syncs[i], NULL, fence);
> +	}
>   	if (afence)
>   		add_async_op_fence_cb(vm, fence, afence);
>   
> @@ -1698,32 +1703,35 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
>   
>   static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_engine *e,
>   		      struct xe_bo *bo, struct xe_sync_entry *syncs,
> -		      u32 num_syncs, struct async_op_fence *afence)
> +		      u32 num_syncs, struct async_op_fence *afence,
> +		      bool immediate, bool first_op, bool last_op)

Hm. I wonder whether we could do the in-syncs - out-syncs split further 
out so we don't have to pass the first_op, last_op at all? Or is 
something prohibiting this?

>   {
>   	int err;
>   
>   	xe_vm_assert_held(vm);
>   	xe_bo_assert_held(bo);
>   
> -	if (bo) {
> +	if (bo && immediate) {
>   		err = xe_bo_validate(bo, vm, true);
>   		if (err)
>   			return err;
>   	}
>   
> -	return __xe_vm_bind(vm, vma, e, syncs, num_syncs, afence);
> +	return __xe_vm_bind(vm, vma, e, syncs, num_syncs, afence, immediate,
> +			    first_op, last_op);
>   }
>   
>   static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
>   			struct xe_engine *e, struct xe_sync_entry *syncs,
> -			u32 num_syncs, struct async_op_fence *afence)
> +			u32 num_syncs, struct async_op_fence *afence,
> +			bool first_op, bool last_op)
>   {
>   	struct dma_fence *fence;
>   
>   	xe_vm_assert_held(vm);
> -	xe_bo_assert_held(vma->bo);
> +	xe_bo_assert_held(xe_vma_bo(vma));
>   
> -	fence = xe_vm_unbind_vma(vma, e, syncs, num_syncs);
> +	fence = xe_vm_unbind_vma(vma, e, syncs, num_syncs, first_op, last_op);
>   	if (IS_ERR(fence))
>   		return PTR_ERR(fence);
>   	if (afence)
> @@ -1946,26 +1954,27 @@ static const u32 region_to_mem_type[] = {
>   static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>   			  struct xe_engine *e, u32 region,
>   			  struct xe_sync_entry *syncs, u32 num_syncs,
> -			  struct async_op_fence *afence)
> +			  struct async_op_fence *afence, bool first_op,
> +			  bool last_op)
>   {
>   	int err;
>   
>   	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
>   
>   	if (!xe_vma_is_userptr(vma)) {
> -		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
> +		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
>   		if (err)
>   			return err;
>   	}
>   
>   	if (vma->gt_mask != (vma->gt_present & ~vma->usm.gt_invalidated)) {
> -		return xe_vm_bind(vm, vma, e, vma->bo, syncs, num_syncs,
> -				  afence);
> +		return xe_vm_bind(vm, vma, e, xe_vma_bo(vma), syncs, num_syncs,
> +				  afence, true, first_op, last_op);
>   	} else {
>   		int i;
>   
>   		/* Nothing to do, signal fences now */
> -		for (i = 0; i < num_syncs; i++)
> +		for (i = 0; last_op && i < num_syncs; i++)

Here is another instance of that construct.

>   			xe_sync_entry_signal(&syncs[i], NULL,
>   					     dma_fence_get_stub());
>   		if (afence)
> @@ -1976,29 +1985,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>   
>   #define VM_BIND_OP(op)	(op & 0xffff)
>   
> -static int __vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
> -			   struct xe_engine *e, struct xe_bo *bo, u32 op,
> -			   u32 region, struct xe_sync_entry *syncs,
> -			   u32 num_syncs, struct async_op_fence *afence)
> -{
> -	switch (VM_BIND_OP(op)) {
> -	case XE_VM_BIND_OP_MAP:
> -		return xe_vm_bind(vm, vma, e, bo, syncs, num_syncs, afence);
> -	case XE_VM_BIND_OP_UNMAP:
> -	case XE_VM_BIND_OP_UNMAP_ALL:
> -		return xe_vm_unbind(vm, vma, e, syncs, num_syncs, afence);
> -	case XE_VM_BIND_OP_MAP_USERPTR:
> -		return xe_vm_bind(vm, vma, e, NULL, syncs, num_syncs, afence);
> -	case XE_VM_BIND_OP_PREFETCH:
> -		return xe_vm_prefetch(vm, vma, e, region, syncs, num_syncs,
> -				      afence);
> -		break;
> -	default:
> -		XE_BUG_ON("NOT POSSIBLE");
> -		return -EINVAL;
> -	}
> -}
> -

Will continue on Monday.


