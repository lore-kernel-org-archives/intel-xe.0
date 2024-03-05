Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D9C54E41
	for <intel-xe@archiver.kernel.org>; Tue,  5 Mar 2024 11:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E8A112A37;
	Tue,  5 Mar 2024 11:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAfFroQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECEC112A37
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Mar 2024 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709637486; x=1741173486;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fW4mF/lnv49jONSlNCeEUm15HRQd2lcXNVZkRwYeS6g=;
 b=RAfFroQAhaKP/BRNnFxDu3ugTj7su771azbDelHFE8JK6b+KddIeW8Nh
 aGwoCr06f1gKyibexBvnt8m2RbjH5K7NUIwJJQwVonYNke9QHNCus0S1Q
 rcFgRtMSAo+B5UVXeuyfpREewS52rwqb8PZNeKDRL0yJ3rTC9ni1mt2JL
 zGAOMsJolWMLnXglHpQFV3PsAaJo8iKbIDTEY6EcsM/SIgW26yJHxYyBh
 c1p7DrLXgNCWMpj5LBPnzYWcWeax9N1u57Vt/Ok4UB2b+5/Qp3giGAr4n
 Wmxn2xUO32QWG4a+6QXYZTvvE1SCMKAQw3WkTKKBACWQdps6bzMTmB3el g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4062163"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4062163"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:18:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9311933"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 03:18:04 -0800
Message-ID: <9ac966a8-423e-44c9-a904-06ce632a5357@intel.com>
Date: Tue, 5 Mar 2024 11:18:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] drm/xe: Kill xe_device_mem_access_{get*,put}
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240304182154.42611-1-rodrigo.vivi@intel.com>
 <20240304182154.42611-9-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240304182154.42611-9-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 04/03/2024 18:21, Rodrigo Vivi wrote:
> Let's simply convert all the current callers towards direct
> xe_pm_runtime access and remove this extra layer of indirection.
> 
> v2: Convert all the current callers instead of a big refactor
> at once.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c |  7 ++---
>   drivers/gpu/drm/xe/xe_bo.c             |  8 +++---
>   drivers/gpu/drm/xe/xe_device.c         | 36 --------------------------
>   drivers/gpu/drm/xe/xe_device.h         |  3 ---
>   drivers/gpu/drm/xe/xe_device_types.h   |  3 ---
>   drivers/gpu/drm/xe/xe_exec_queue.c     |  6 ++---
>   drivers/gpu/drm/xe/xe_ggtt.c           |  9 ++++---
>   drivers/gpu/drm/xe/xe_sched_job.c      |  5 ++--
>   drivers/gpu/drm/xe/xe_vm.c             |  6 ++---
>   9 files changed, 22 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index 722c84a56607..403ed2d42f6b 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -10,6 +10,7 @@
>   #include "intel_fb_pin.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> +#include "xe_pm.h"
>   
>   #include <drm/ttm/ttm_bo.h>
>   
> @@ -190,7 +191,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>   	/* TODO: Consider sharing framebuffer mapping?
>   	 * embed i915_vma inside intel_framebuffer
>   	 */
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>   	ret = mutex_lock_interruptible(&ggtt->lock);
>   	if (ret)
>   		goto out;
> @@ -242,7 +243,7 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
>   out_unlock:
>   	mutex_unlock(&ggtt->lock);
>   out:
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
>   	return ret;
>   }
>   
> @@ -381,4 +382,4 @@ struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
>   void intel_dpt_destroy(struct i915_address_space *vm)
>   {
>   	return;
> -}
> \ No newline at end of file
> +}
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index def68528cd40..cdcc46933811 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -738,7 +738,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   
>   	xe_assert(xe, migrate);
>   	trace_xe_bo_move(bo, new_mem->mem_type, old_mem_type, move_lacks_source);
> -	xe_device_mem_access_get(xe);
> +	xe_pm_runtime_get_noresume(xe);
>   
>   	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>   		/*
> @@ -762,7 +762,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   
>   				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
>   					ret = -EINVAL;
> -					xe_device_mem_access_put(xe);
> +					xe_pm_runtime_put(xe);
>   					goto out;
>   				}
>   
> @@ -780,7 +780,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   						new_mem, handle_system_ccs);
>   		if (IS_ERR(fence)) {
>   			ret = PTR_ERR(fence);
> -			xe_device_mem_access_put(xe);
> +			xe_pm_runtime_put(xe);
>   			goto out;
>   		}
>   		if (!move_lacks_source) {
> @@ -805,7 +805,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		dma_fence_put(fence);
>   	}
>   
> -	xe_device_mem_access_put(xe);
> +	xe_pm_runtime_put(xe);
>   
>   out:
>   	return ret;
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 58815e9bf242..e2e6b6dc8534 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -655,42 +655,6 @@ void xe_device_assert_mem_access(struct xe_device *xe)
>   	XE_WARN_ON(xe_pm_runtime_suspended(xe));
>   }
>   
> -void xe_device_mem_access_get(struct xe_device *xe)
> -{
> -	int ref;
> -
> -	/*
> -	 * This looks racy, but should be fine since the pm_callback_task only
> -	 * transitions from NULL -> current (and back to NULL again), during the
> -	 * runtime_resume() or runtime_suspend() callbacks, for which there can
> -	 * only be a single one running for our device. We only need to prevent
> -	 * recursively calling the runtime_get or runtime_put from those
> -	 * callbacks, as well as preventing triggering any access_ongoing
> -	 * asserts.
> -	 */
> -	if (xe_pm_read_callback_task(xe) == current)
> -		return;
> -
> -	xe_pm_runtime_get_noresume(xe);
> -	ref = atomic_inc_return(&xe->mem_access.ref);
> -
> -	xe_assert(xe, ref != S32_MAX);
> -
> -}
> -
> -void xe_device_mem_access_put(struct xe_device *xe)
> -{
> -	int ref;
> -
> -	if (xe_pm_read_callback_task(xe) == current)
> -		return;
> -
> -	ref = atomic_dec_return(&xe->mem_access.ref);
> -	xe_pm_runtime_put(xe);
> -
> -	xe_assert(xe, ref >= 0);
> -}
> -
>   void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p)
>   {
>   	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index b45592b0bf19..355bddfc8274 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -133,9 +133,6 @@ static inline struct xe_force_wake *gt_to_fw(struct xe_gt *gt)
>   	return &gt->mmio.fw;
>   }
>   
> -void xe_device_mem_access_get(struct xe_device *xe);
> -void xe_device_mem_access_put(struct xe_device *xe);
> -
>   void xe_device_assert_mem_access(struct xe_device *xe);
>   
>   static inline bool xe_device_in_fault_mode(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 9785eef2e5a4..4bec8b90a37c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -377,9 +377,6 @@ struct xe_device {
>   	 * triggering additional actions when they occur.
>   	 */
>   	struct {
> -		/** @mem_access.ref: ref count of memory accesses */
> -		atomic_t ref;
> -
>   		/**
>   		 * @mem_access.vram_userfault: Encapsulate vram_userfault
>   		 * related stuff
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cb83bfb2cb6d..499be61ce33d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -217,7 +217,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   	for (i = 0; i < q->width; ++i)
>   		xe_lrc_finish(q->lrc + i);
>   	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> -		xe_device_mem_access_put(gt_to_xe(q->gt));
> +		xe_pm_runtime_put(gt_to_xe(q->gt));
>   	__xe_exec_queue_free(q);
>   }
>   
> @@ -597,7 +597,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   				return -EINVAL;
>   
>   			/* The migration vm doesn't hold rpm ref */
> -			xe_device_mem_access_get(xe);
> +			xe_pm_runtime_get_noresume(xe);
>   
>   			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>   
> @@ -606,7 +606,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   						   args->width, hwe, flags,
>   						   args->extensions);
>   
> -			xe_device_mem_access_put(xe); /* now held by engine */
> +			xe_pm_runtime_put(xe); /* now held by engine */
>   
>   			xe_vm_put(migrate_vm);
>   			if (IS_ERR(new)) {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 355e4bb987cb..3e761646993e 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -20,6 +20,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_map.h"
> +#include "xe_pm.h"
>   #include "xe_sriov.h"
>   #include "xe_wopcm.h"
>   
> @@ -416,14 +417,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   	if (err)
>   		return err;
>   
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>   	mutex_lock(&ggtt->lock);
>   	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
>   					  alignment, 0, start, end, 0);
>   	if (!err)
>   		xe_ggtt_map_bo(ggtt, bo);
>   	mutex_unlock(&ggtt->lock);
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
>   
>   	return err;
>   }
> @@ -441,7 +442,7 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   
>   void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>   {
> -	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>   	mutex_lock(&ggtt->lock);
>   
>   	xe_ggtt_clear(ggtt, node->start, node->size);
> @@ -451,7 +452,7 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
>   	xe_ggtt_invalidate(ggtt);
>   
>   	mutex_unlock(&ggtt->lock);
> -	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
> +	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
>   }
>   
>   void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 8151ddafb940..8ba35b1698ed 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -15,6 +15,7 @@
>   #include "xe_hw_fence.h"
>   #include "xe_lrc.h"
>   #include "xe_macros.h"
> +#include "xe_pm.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> @@ -157,7 +158,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   
>   	/* All other jobs require a VM to be open which has a ref */
>   	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_get(job_to_xe(job));
> +		xe_pm_runtime_get_noresume(job_to_xe(job));
>   	xe_device_assert_mem_access(job_to_xe(job));

assert_mem_access() should be removed or renamed?

I guess just a question of what CI says,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   
>   	trace_xe_sched_job_create(job);
> @@ -190,7 +191,7 @@ void xe_sched_job_destroy(struct kref *ref)
>   		container_of(ref, struct xe_sched_job, refcount);
>   
>   	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_put(job_to_xe(job));
> +		xe_pm_runtime_put(job_to_xe(job));
>   	xe_exec_queue_put(job->q);
>   	dma_fence_put(job->fence);
>   	drm_sched_job_cleanup(&job->drm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 643b3701a738..84360f4a1b60 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1324,7 +1324,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	vm->pt_ops = &xelp_pt_ops;
>   
>   	if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_get(xe);
> +		xe_pm_runtime_get_noresume(xe);
>   
>   	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
>   	if (!vm_resv_obj) {
> @@ -1435,7 +1435,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
>   	kfree(vm);
>   	if (!(flags & XE_VM_FLAG_MIGRATION))
> -		xe_device_mem_access_put(xe);
> +		xe_pm_runtime_put(xe);
>   	return ERR_PTR(err);
>   }
>   
> @@ -1558,7 +1558,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>   	mutex_destroy(&vm->snap_mutex);
>   
>   	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
> -		xe_device_mem_access_put(xe);
> +		xe_pm_runtime_put(xe);
>   
>   		if (xe->info.has_asid && vm->usm.asid) {
>   			mutex_lock(&xe->usm.lock);
