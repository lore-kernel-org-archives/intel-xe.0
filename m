Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271E1C531CC
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 01:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02D610F282;
	Fri, 24 Jul 2026 01:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oatd7hWU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9DF10F275
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 01:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784855393; x=1816391393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W+eP9lwWjObfOpa+Yy35HUv4/aVRIu8ewAW2TDOF8dI=;
 b=Oatd7hWU2gRhuB4d7+xeLZBngivUTxoSrqZRQCqIqy+C+SfDcae751jF
 xDhSh9btF4d3FOGKTSMMJ/LrnccvmxtVuVhfnxyXNt7Bvg4Om/MTde2vU
 KQM2z2Ur0PaVO9W7q67M/3iqP/6Xfb7Vpc1jBkxp+kWbhMcCjb/Nh3AZ7
 4IGJ8MerhUEUCggR8pwYTPcLzbALUjof3Zpt6L5iRpSmdh2H6Yi/uT/ga
 keDZLHTe/bDXOVfCJTCcj4D1+etdaaX6bGY6yLJ4ijZix2ZNg7k/GsBKZ
 4a56IRwRpmMkSdfC37mkcC/muoIKEeQgF6GHuV4ij0i6LD1DhSRUf+L8q g==;
X-CSE-ConnectionGUID: /nfDdY70QgiynxoiP+cSFg==
X-CSE-MsgGUID: PwsHT52SQa+WMMVd6tfGXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73064788"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="73064788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 18:09:52 -0700
X-CSE-ConnectionGUID: yXGUODgKQMuTrPWu47Wvhg==
X-CSE-MsgGUID: 3Q+dmKi9QiSjj+5tP7jIJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="255929081"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 18:09:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: [PATCH v6 01/12] drm/xe: Fine grained page fault locking
Date: Thu, 23 Jul 2026 18:09:36 -0700
Message-Id: <20260724010947.1573757-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260724010947.1573757-1-matthew.brost@intel.com>
References: <20260724010947.1573757-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Enable page faults to be serviced while holding vm->lock in read mode.

Introduce additional locks to:
 - Ensure only one page fault thread services a given range or VMA
 - Serialize SVM garbage collection
 - Protect SVM range insertion and removal

While these locks may contend during page faults, expensive operations
like migration can now run in parallel within a single VM.

In addition to new locking, ranges must be reference-counted after
lookup, as another thread could immediately remove them from the GPU SVM
tree, potentially dropping the last reference.

Lastly, decouple the VM’s ASID from the page fault queue selection to
allow parallel page fault handling within the same VM.

Lays the groundwork for prefetch IOCTLs to use threaded migration too.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_pagefault.c    | 102 ++++++++++++----------
 drivers/gpu/drm/xe/xe_svm.c          | 122 +++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_svm.h          |  44 ++++++++++
 drivers/gpu/drm/xe/xe_userptr.c      |  21 ++++-
 drivers/gpu/drm/xe/xe_vm.c           |  81 ++++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h     |  29 +++++--
 7 files changed, 277 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 860ad322237f..b8d1726c0513 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -303,6 +303,8 @@ struct xe_device {
 		struct xarray asid_to_vm;
 		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
 		u32 next_asid;
+		/** @usm.current_pf_queue: current page fault queue */
+		u32 current_pf_queue;
 		/** @usm.lock: protects UM state */
 		struct rw_semaphore lock;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..80196e874e06 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -84,9 +84,9 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	int err, needs_vram;
+	int err = 0, needs_vram;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
 	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
@@ -98,50 +98,52 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 
 	trace_xe_vma_pagefault(vma);
 
+	guard(mutex)(&vma->fault_lock);
+
 	/* Check if VMA is valid, opportunistic check only */
 	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
 					vma->tile_invalidated) && !atomic)
 		return 0;
 
-retry_userptr:
-	if (xe_vma_is_userptr(vma) &&
-	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
-		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+	do {
+		if (xe_vma_is_userptr(vma) &&
+		    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
+			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 
-		err = xe_vma_userptr_pin_pages(uvma);
-		if (err)
-			return err;
-	}
+			err = xe_vma_userptr_pin_pages(uvma);
+			if (err)
+				return err;
+		}
 
-	/* Lock VM and BOs dma-resv */
-	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, (struct xe_val_flags) {});
-	drm_exec_until_all_locked(&exec) {
-		err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
-					 needs_vram == 1);
-		drm_exec_retry_on_contention(&exec);
-		xe_validation_retry_on_oom(&ctx, &err);
-		if (err)
-			goto unlock_dma_resv;
-
-		/* Bind VMA only to the GT that has faulted */
-		trace_xe_vma_pf_bind(vma);
-		xe_vm_set_validation_exec(vm, &exec);
-		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
-		xe_vm_set_validation_exec(vm, NULL);
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
+		/* Lock VM and BOs dma-resv */
+		xe_validation_ctx_init(&ctx, &vm->xe->val, &exec,
+				       (struct xe_val_flags) {});
+		drm_exec_until_all_locked(&exec) {
+			err = xe_pagefault_begin(&exec, vma, tile->mem.vram,
+						 needs_vram == 1);
+			drm_exec_retry_on_contention(&exec);
 			xe_validation_retry_on_oom(&ctx, &err);
-			goto unlock_dma_resv;
+			if (err)
+				break;
+
+			/* Bind VMA only to the GT that has faulted */
+			trace_xe_vma_pf_bind(vma);
+			xe_vm_set_validation_exec(vm, &exec);
+			fence = xe_vma_rebind(vm, vma, BIT(tile->id));
+			xe_vm_set_validation_exec(vm, NULL);
+			if (IS_ERR(fence)) {
+				err = PTR_ERR(fence);
+				xe_validation_retry_on_oom(&ctx, &err);
+				break;
+			}
 		}
-	}
+		xe_validation_ctx_fini(&ctx);
+	} while (err == -EAGAIN);
 
-	dma_fence_wait(fence, false);
-	dma_fence_put(fence);
-
-unlock_dma_resv:
-	xe_validation_ctx_fini(&ctx);
-	if (err == -EAGAIN)
-		goto retry_userptr;
+	if (!err) {
+		dma_fence_wait(fence, false);
+		dma_fence_put(fence);
+	}
 
 	return err;
 }
@@ -184,10 +186,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	/*
-	 * TODO: Change to read lock? Using write lock for simplicity.
-	 */
-	down_write(&vm->lock);
+	down_read(&vm->lock);
 
 	if (xe_vm_is_closed(vm)) {
 		err = -ENOENT;
@@ -215,9 +214,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 		err = xe_pagefault_handle_vma(gt, vma, atomic);
 
 unlock_vm:
-	if (!err)
-		vm->usm.last_fault_vma = vma;
-	up_write(&vm->lock);
+	up_read(&vm->lock);
 	xe_vm_put(vm);
 
 	return err;
@@ -462,6 +459,19 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
 		xe_pagefault_entry_size();
 }
 
+/*
+ * This function can race with multiple page fault producers, but worst case we
+ * stick a page fault on the same queue for consumption.
+ */
+static int xe_pagefault_queue_index(struct xe_device *xe)
+{
+	u32 old_pf_queue = READ_ONCE(xe->usm.current_pf_queue);
+
+	WRITE_ONCE(xe->usm.current_pf_queue, (old_pf_queue + 1));
+
+	return old_pf_queue % XE_PAGEFAULT_QUEUE_COUNT;
+}
+
 /**
  * xe_pagefault_handler() - Page fault handler
  * @xe: xe device instance
@@ -474,8 +484,8 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
  */
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
-	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
-		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+	int queue_index = xe_pagefault_queue_index(xe);
+	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
 	unsigned long flags;
 	bool full;
 
@@ -489,7 +499,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 	} else {
 		drm_warn(&xe->drm,
 			 "PageFault Queue (%d) full, shouldn't be possible\n",
-			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+			 queue_index);
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index b228a737cfd6..cc36addb4f4f 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -115,6 +115,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 		return NULL;
 
 	INIT_LIST_HEAD(&range->garbage_collector_link);
+	mutex_init(&range->lock);
 	drm_gpusvm_init_pages(&range->pages, &gpusvm_to_vm(gpusvm)->xe->drm);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
 
@@ -125,6 +126,7 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
 {
 	drm_gpusvm_free_pages(range->gpusvm, &(to_xe_range(range)->pages),
 			      drm_gpusvm_range_size(range) >> PAGE_SHIFT);
+	mutex_destroy(&to_xe_range(range)->lock);
 	xe_vm_put(range_to_vm(range));
 	kfree(to_xe_range(range));
 }
@@ -140,11 +142,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 	drm_gpusvm_range_set_unmapped(&range->base, &range->pages, 1,
 				      mmu_range);
 
-	spin_lock(&vm->svm.garbage_collector.lock);
+	spin_lock(&vm->svm.garbage_collector.list_lock);
 	if (list_empty(&range->garbage_collector_link))
 		list_add_tail(&range->garbage_collector_link,
 			      &vm->svm.garbage_collector.range_list);
-	spin_unlock(&vm->svm.garbage_collector.lock);
+	spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
 }
@@ -309,18 +311,30 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 
 	range_debug(range, "GARBAGE COLLECTOR");
 
-	xe_vm_lock(vm, false);
-	fence = xe_vm_range_unbind(vm, range);
-	xe_vm_unlock(vm);
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
-	dma_fence_put(fence);
+	scoped_guard(mutex, &range->lock) {
+		drm_gpusvm_range_get(&range->base);
+		range->removed = true;
+
+		range_debug(range, "GARBAGE COLLECTOR");
+
+		xe_vm_lock(vm, false);
+		fence = xe_vm_range_unbind(vm, range);
+		xe_vm_unlock(vm);
+		if (IS_ERR(fence)) {
+			drm_gpusvm_range_put(&range->base);
+			return PTR_ERR(fence);
+		}
+		dma_fence_put(fence);
+
+		drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &range->pages,
+				       drm_gpusvm_range_size(&range->base) >> PAGE_SHIFT,
+				       &ctx);
 
-	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &range->pages,
-			       drm_gpusvm_range_size(&range->base) >> PAGE_SHIFT,
-			       &ctx);
+		scoped_guard(mutex, &vm->svm.range_lock)
+			drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+	}
 
-	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+	drm_gpusvm_range_put(&range->base);
 
 	return 0;
 }
@@ -393,13 +407,15 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 	u64 range_end;
 	int err, ret = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	if (xe_vm_is_closed_or_banned(vm))
 		return -ENOENT;
 
+	guard(mutex)(&vm->svm.garbage_collector.lock);
+
 	for (;;) {
-		spin_lock(&vm->svm.garbage_collector.lock);
+		spin_lock(&vm->svm.garbage_collector.list_lock);
 		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
 						 typeof(*range),
 						 garbage_collector_link);
@@ -410,7 +426,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		range_end = xe_svm_range_end(range);
 
 		list_del(&range->garbage_collector_link);
-		spin_unlock(&vm->svm.garbage_collector.lock);
+		spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 		err = __xe_svm_garbage_collector(vm, range);
 		if (err) {
@@ -429,7 +445,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 				return err;
 		}
 	}
-	spin_unlock(&vm->svm.garbage_collector.lock);
+	spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 	return ret;
 }
@@ -439,9 +455,8 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	struct xe_vm *vm = container_of(w, struct xe_vm,
 					svm.garbage_collector.work);
 
-	down_write(&vm->lock);
+	guard(rwsem_read)(&vm->lock);
 	xe_svm_garbage_collector(vm);
-	up_write(&vm->lock);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
@@ -893,8 +908,11 @@ int xe_svm_init(struct xe_vm *vm)
 {
 	int err;
 
+	mutex_init(&vm->svm.range_lock);
+	mutex_init(&vm->svm.garbage_collector.lock);
+
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE) {
-		spin_lock_init(&vm->svm.garbage_collector.lock);
+		spin_lock_init(&vm->svm.garbage_collector.list_lock);
 		INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
 		INIT_WORK(&vm->svm.garbage_collector.work,
 			  xe_svm_garbage_collector_work_func);
@@ -903,12 +921,12 @@ int xe_svm_init(struct xe_vm *vm)
 		err = drm_pagemap_acquire_owner(&vm->svm.peer, &xe_owner_list,
 						xe_has_interconnect);
 		if (err)
-			return err;
+			goto out_err;
 
 		err = xe_svm_get_pagemaps(vm);
 		if (err) {
 			drm_pagemap_release_owner(&vm->svm.peer);
-			return err;
+			goto out_err;
 		}
 
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM",
@@ -916,19 +934,27 @@ int xe_svm_init(struct xe_vm *vm)
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
 				      ARRAY_SIZE(fault_chunk_sizes));
-		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->svm.range_lock);
 
 		if (err) {
 			xe_svm_put_pagemaps(vm);
 			drm_pagemap_release_owner(&vm->svm.peer);
-			return err;
+			goto out_err;
 		}
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
 				      NULL, 0, 0, 0, NULL,
 				      NULL, 0);
+		if (err)
+			goto out_err;
 	}
 
+	return 0;
+
+out_err:
+	mutex_destroy(&vm->svm.range_lock);
+	mutex_destroy(&vm->svm.garbage_collector.lock);
+
 	return err;
 }
 
@@ -969,7 +995,10 @@ void xe_svm_fini(struct xe_vm *vm)
 					       &ctx);
 	}
 
-	drm_gpusvm_fini(&vm->svm.gpusvm);
+	scoped_guard(mutex, &vm->svm.range_lock)
+		drm_gpusvm_fini(&vm->svm.gpusvm);
+	mutex_destroy(&vm->svm.range_lock);
+	mutex_destroy(&vm->svm.garbage_collector.lock);
 }
 
 static bool xe_svm_range_has_pagemap_locked(const struct xe_svm_range *range,
@@ -1246,21 +1275,27 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	};
 	struct xe_validation_ctx vctx;
 	struct drm_exec exec;
-	struct xe_svm_range *range;
+	struct xe_svm_range *range = NULL;
 	struct drm_gpusvm_range_flags range_flags;
 	struct dma_fence *fence;
 	struct drm_pagemap *dpagemap;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t start = xe_gt_stats_ktime_get(), bind_start, get_pages_start;
-	int err;
+	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
 
 retry:
+	/* Release old range */
+	if (range) {
+		mutex_unlock(&range->lock);
+		drm_gpusvm_range_put(&range->base);
+	}
+
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
 	if (err)
@@ -1276,10 +1311,17 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_svm_range_fault_count_stats_incr(gt, range);
 
+	mutex_lock(&range->lock);
+
+	if (xe_svm_range_is_removed(range))
+		goto retry;
+
 	/* READ_ONCE pairs with WRITE_ONCE in drm_gpusvm_range_set_unmapped() */
 	range_flags.__flags = READ_ONCE(range->base.flags.__flags);
-	if (ctx.devmem_only && !range_flags.migrate_devmem)
-		return -EACCES;
+	if (ctx.devmem_only && !range_flags.migrate_devmem) {
+		err = -EACCES;
+		goto err_out;
+	}
 
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only, dpagemap)) {
 		xe_svm_range_valid_fault_count_stats_incr(gt, range);
@@ -1317,7 +1359,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				drm_err(&vm->xe->drm,
 					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
 					vm->usm.asid, ERR_PTR(err));
-				return err;
+				goto err_out;
 			}
 		}
 	}
@@ -1344,7 +1386,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	}
 	if (err) {
 		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
-		goto out;
+		goto err_out;
 	} else if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
 		drm_dbg(&vm->xe->drm, "After page collect data location is %sin \"%s\".\n",
 			xe_svm_range_has_pagemap(range, dpagemap) ? "" : "NOT ",
@@ -1379,6 +1421,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 out:
 	xe_svm_range_fault_us_stats_incr(gt, range, start);
+	mutex_unlock(&range->lock);
+	drm_gpusvm_range_put(&range->base);
 	return 0;
 
 err_out:
@@ -1388,6 +1432,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		goto retry;
 	}
 
+	mutex_unlock(&range->lock);
+	drm_gpusvm_range_put(&range->base);
+
 	return err;
 }
 
@@ -1470,9 +1517,9 @@ void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
 				drm_gpusvm_range_get(range);
 				__xe_svm_garbage_collector(vm, to_xe_range(range));
 				if (!list_empty(&to_xe_range(range)->garbage_collector_link)) {
-					spin_lock(&vm->svm.garbage_collector.lock);
+					spin_lock(&vm->svm.garbage_collector.list_lock);
 					list_del(&to_xe_range(range)->garbage_collector_link);
-					spin_unlock(&vm->svm.garbage_collector.lock);
+					spin_unlock(&vm->svm.garbage_collector.list_lock);
 				}
 				drm_gpusvm_range_put(range);
 			}
@@ -1502,7 +1549,7 @@ int xe_svm_bo_evict(struct xe_bo *bo)
  * @ctx: GPU SVM context
  *
  * This function finds or inserts a newly allocated a SVM range based on the
- * address.
+ * address. Take a reference to SVM range on success.
  *
  * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
  */
@@ -1511,11 +1558,15 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
 {
 	struct drm_gpusvm_range *r;
 
+	guard(mutex)(&vm->svm.range_lock);
+
 	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
 					    xe_vma_start(vma), xe_vma_end(vma), ctx);
 	if (IS_ERR(r))
 		return ERR_CAST(r);
 
+	drm_gpusvm_range_get(r);
+
 	return to_xe_range(r);
 }
 
@@ -1535,6 +1586,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 {
 	int err = 0;
 
+	lockdep_assert_held(&range->lock);
+
 	err = drm_gpusvm_get_pages(&vm->svm.gpusvm, &range->pages,
 				   vm->svm.gpusvm.mm,
 				   &range->base.notifier->notifier,
@@ -1659,6 +1712,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 		.__flags = READ_ONCE(range->base.flags.__flags),
 	};
 
+	lockdep_assert_held(&range->lock);
 	xe_assert(range_to_vm(&range->base)->xe, flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index a921556d3466..0d1f1107af5f 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -38,6 +38,13 @@ struct xe_svm_range {
 	 * list. Protected by VM's garbage collect lock.
 	 */
 	struct list_head garbage_collector_link;
+	/**
+	 * @lock: Protects fault handler, garbage collector, and prefetch
+	 * critical sections, ensuring only one thread operates on a range at a
+	 * time. Locking order: inside vm->lock and garbage collector, outside
+	 * dma-resv locks, vm->svm.range_lock.
+	 */
+	struct mutex lock;
 	/**
 	 * @tile_present: Tile mask of binding is present for this range.
 	 * Protected by GPU SVM notifier lock.
@@ -48,8 +55,22 @@ struct xe_svm_range {
 	 * range. Protected by GPU SVM notifier lock.
 	 */
 	u8 tile_invalidated;
+	/**
+	 * @removed: Range has been removed from GPU SVM tree, protected by
+	 * @lock.
+	 */
+	bool removed;
 };
 
+/**
+ * xe_svm_range_put() - SVM range put
+ * @range: SVM range
+ */
+static inline void xe_svm_range_put(struct xe_svm_range *range)
+{
+	drm_gpusvm_range_put(&range->base);
+}
+
 /**
  * struct xe_pagemap - Manages xe device_private memory for SVM.
  * @pagemap: The struct dev_pagemap providing the struct pages.
@@ -137,6 +158,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->pages.flags.has_dma_mapping;
 }
 
+/**
+ * xe_svm_range_is_removed() - SVM range is removed from GPU SVM tree
+ * @range: SVM range
+ *
+ * Return: True if SVM range is removed from GPU SVM tree, False otherwise
+ */
+static inline bool xe_svm_range_is_removed(struct xe_svm_range *range)
+{
+	lockdep_assert_held(&range->lock);
+
+	return range->removed;
+}
+
 /**
  * to_xe_range - Convert a drm_gpusvm_range pointer to a xe_svm_range
  * @r: Pointer to the drm_gpusvm_range structure
@@ -216,10 +250,15 @@ struct xe_svm_range {
 	struct {
 		const struct drm_pagemap_addr *dma_addr;
 	} pages;
+	struct mutex lock;
 	u32 tile_present;
 	u32 tile_invalidated;
 };
 
+static inline void xe_svm_range_put(struct xe_svm_range *range)
+{
+}
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return false;
@@ -389,6 +428,11 @@ static inline struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_inst
 	return ERR_PTR(-ENOENT);
 }
 
+static inline bool xe_svm_range_is_removed(struct xe_svm_range *range)
+{
+	return false;
+}
+
 #define xe_svm_range_has_dma_mapping(...) false
 #endif /* CONFIG_DRM_XE_GPUSVM */
 
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 8b2d461ea0b2..ec1e3e9d0d2e 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -57,6 +57,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+static bool __xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma)
+{
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	return lockdep_is_held_type(&vm->lock, 0) ||
+		(lockdep_is_held_type(&vm->lock, 1) &&
+		 lockdep_is_held_type(&vma->fault_lock, 0));
+}
+
+#define xe_vma_userptr_lockdep(uvma)	\
+	lockdep_assert(__xe_vma_userptr_lockdep(uvma))
+#else
+#define xe_vma_userptr_lockdep(uvma)
+#endif
+
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 {
 	struct xe_vma *vma = &uvma->vma;
@@ -68,7 +85,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 		.allow_mixed = true,
 	};
 
-	lockdep_assert_held(&vm->lock);
+	xe_vma_userptr_lockdep(uvma);
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
@@ -273,7 +290,7 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 
 	/* Protect against concurrent userptr pinning */
-	lockdep_assert_held(&vm->lock);
+	xe_vma_userptr_lockdep(uvma);
 	/* Protect against concurrent notifiers */
 	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e0176861cb6..260a9c534aa4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -689,6 +689,17 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 }
 ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
 
+static void xe_vma_svm_prefetch_ranges_fini(struct xe_vma_op *op)
+{
+	struct xe_svm_range *svm_range;
+	unsigned long i;
+
+	xa_for_each(&op->prefetch_range.range, i, svm_range)
+		xe_svm_range_put(svm_range);
+
+	xa_destroy(&op->prefetch_range.range);
+}
+
 static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
 {
 	struct xe_vma *vma;
@@ -696,7 +707,7 @@ static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
 	vma = gpuva_to_vma(op->base.prefetch.va);
 
 	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
-		xa_destroy(&op->prefetch_range.range);
+		xe_vma_svm_prefetch_ranges_fini(op);
 }
 
 static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
@@ -930,6 +941,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	u8 id;
 	int err;
 
+	lockdep_assert_held(&range->lock);
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
@@ -1012,6 +1024,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	u8 id;
 	int err;
 
+	lockdep_assert_held(&range->lock);
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
@@ -1187,6 +1200,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		xe_vm_get(vm);
 	}
 
+	mutex_init(&vma->fault_lock);
+
 	return vma;
 }
 
@@ -1211,6 +1226,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		xe_bo_put(bo);
 	}
 
+	mutex_destroy(&vma->fault_lock);
 	xe_vma_free(vma);
 }
 
@@ -1231,12 +1247,19 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	queue_work(system_dfl_wq, &vma->destroy_work);
 }
 
+static void xe_vm_assert_write_mode_or_garbage_collector(struct xe_vm *vm)
+{
+	lockdep_assert(lockdep_is_held_type(&vm->lock, 0) ||
+		       (lockdep_is_held_type(&vm->lock, 1) &&
+			lockdep_is_held_type(&vm->svm.garbage_collector.lock, 0)));
+}
+
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_bo *bo = xe_vma_bo(vma);
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
 
 	if (xe_vma_is_userptr(vma)) {
@@ -1348,8 +1371,6 @@ static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 	mutex_lock(&vm->snap_mutex);
 	drm_gpuva_remove(&vma->gpuva);
 	mutex_unlock(&vm->snap_mutex);
-	if (vm->usm.last_fault_vma == vma)
-		vm->usm.last_fault_vma = NULL;
 }
 
 static struct drm_gpuva_op *xe_vm_op_alloc(void)
@@ -2244,7 +2265,7 @@ int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_
 	if (XE_IOCTL_DBG(xe, !vm))
 		return -EINVAL;
 
-	err = down_read_interruptible(&vm->lock);
+	err = down_write_killable(&vm->lock);
 	if (err)
 		goto put_vm;
 
@@ -2278,21 +2299,12 @@ int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_
 free_mem_attrs:
 	kvfree(mem_attrs);
 unlock_vm:
-	up_read(&vm->lock);
+	up_write(&vm->lock);
 put_vm:
 	xe_vm_put(vm);
 	return err;
 }
 
-static bool vma_matches(struct xe_vma *vma, u64 page_addr)
-{
-	if (page_addr > xe_vma_end(vma) - 1 ||
-	    page_addr + SZ_4K - 1 < xe_vma_start(vma))
-		return false;
-
-	return true;
-}
-
 /**
  * xe_vm_find_vma_by_addr() - Find a VMA by its address
  *
@@ -2301,16 +2313,7 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
  */
 struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr)
 {
-	struct xe_vma *vma = NULL;
-
-	if (vm->usm.last_fault_vma) {   /* Fast lookup */
-		if (vma_matches(vm->usm.last_fault_vma, page_addr))
-			vma = vm->usm.last_fault_vma;
-	}
-	if (!vma)
-		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
-
-	return vma;
+	return xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
 }
 
 static const u32 region_to_mem_type[] = {
@@ -2423,7 +2426,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 	u64 range_end = addr + range;
 	int err;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	vm_dbg(&vm->xe->drm,
 	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
@@ -2510,7 +2513,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			if (!xe_vma_is_cpu_addr_mirror(vma)) {
 				op->prefetch.region = prefetch_region;
-				break;
+				continue;
 			}
 
 			ctx.read_only = xe_vma_read_only(vma);
@@ -2553,6 +2556,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
+				xe_svm_range_put(svm_range);
 				goto check_next_range;
 			}
 
@@ -2560,8 +2564,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				       &i, svm_range, xa_limit_32b,
 				       GFP_KERNEL);
 
-			if (err)
+			if (err) {
+				xe_svm_range_put(svm_range);
 				goto unwind_prefetch_ops;
+			}
 
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
@@ -2596,7 +2602,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	struct xe_vma *vma;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	if (bo) {
 		err = 0;
@@ -2693,7 +2699,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -2785,7 +2791,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 	u8 id, tile_mask = 0;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	for_each_tile(tile, vm->xe, id)
 		tile_mask |= 0x1 << id;
@@ -2964,7 +2970,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
 {
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -3139,6 +3145,11 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
+		guard(mutex)(&svm_range->lock);
+
+		if (xe_svm_range_is_removed(svm_range))
+			continue;
+
 		if (!dpagemap)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
@@ -4735,7 +4746,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 	u16 default_pat;
 	int err;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	if (is_madvise)
 		ops = drm_gpuvm_madvise_ops_create(&vm->gpuvm, map_req);
@@ -4869,7 +4880,7 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
 		.map.va.range = range,
 	};
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
 
@@ -4933,7 +4944,7 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 		.map.va.range = range,
 	};
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	vm_dbg(&vm->xe->drm, "CPU_ADDR_MIRROR_VMA_OPS_CREATE: addr=0x%016llx, size=0x%016llx",
 	       start, range);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..b94eb018d532 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -132,6 +132,12 @@ struct xe_vma {
 		struct work_struct destroy_work;
 	};
 
+	/**
+	 * @fault_lock: Synchronizes fault processing. Locking order: inside
+	 * vm->lock, outside dma-resv.
+	 */
+	struct mutex fault_lock;
+
 	/**
 	 * @tile_invalidated: Tile mask of binding are invalidated for this VMA.
 	 * protected by BO's resv and for userptrs, vm->svm.gpusvm.notifier_lock in
@@ -214,13 +220,27 @@ struct xe_vm {
 	struct {
 		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
 		struct drm_gpusvm gpusvm;
+		/**
+		 * @svm.range_lock: Protects insertion and removal of ranges
+		 * from GPU SVM tree.
+		 */
+		struct mutex range_lock;
 		/**
 		 * @svm.garbage_collector: Garbage collector which is used unmap
 		 * SVM range's GPU bindings and destroy the ranges.
 		 */
 		struct {
-			/** @svm.garbage_collector.lock: Protect's range list */
-			spinlock_t lock;
+			/**
+			 * @svm.garbage_collector.lock: Ensures only one thread
+			 * runs the garbage collector at a time. Locking order:
+			 * inside vm->lock, outside range->lock and dma-resv.
+			 */
+			struct mutex lock;
+			/**
+			 * @svm.garbage_collector.list_lock: Protect's range
+			 * list
+			 */
+			spinlock_t list_lock;
 			/**
 			 * @svm.garbage_collector.range_list: List of SVM ranges
 			 * in the garbage collector.
@@ -350,11 +370,6 @@ struct xe_vm {
 	struct {
 		/** @asid: address space ID, unique to each VM */
 		u32 asid;
-		/**
-		 * @last_fault_vma: Last fault VMA, used for fast lookup when we
-		 * get a flood of faults to the same VMA
-		 */
-		struct xe_vma *last_fault_vma;
 	} usm;
 
 	/** @error_capture: allow to track errors */
-- 
2.34.1

