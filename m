Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017ABC87FDA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D4810E737;
	Wed,  6 Aug 2025 06:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hmhdMaJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3991A10E2FE
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=28mxNAiH9A8b4QIKbIhxs8wImUlOmjDx59WbyQl0lxk=;
 b=hmhdMaJeWY+xs3kdOeTOSNeM6cpAai7BjvOMIPtGCfbuPrhZI5wjFCDR
 fKq1yCla8kxZ6MJt1/iZMWNKi8K2sAeEo1cvu9eG4t4CVjNT0stN8yxdc
 zazdHb7FTbhjME41uzvHngrH73odkaqVrhHqPefOBGkEt82xBhcNdySxk
 1GR2WrawVT9mtlQ0XUVwcpK4zeix0Ywm82kVggRlZODMu+72tA+XtOyb1
 HIybOxsAP3wDXbMRPs3u+nzd7VIjwLRgSItnG4tSEMKLAG69QRvWWDZss
 vCJXaBPhH7oQnn8vE7EwcEydXK4kWb2/6YBO4b36z3TGvKi0dDSmPWpep A==;
X-CSE-ConnectionGUID: MusHV133RfeIDa6vpk6VQA==
X-CSE-MsgGUID: Pz6xRVjsSo2o7dLURxihoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316937"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316937"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: yodAqI8vT7iC+YSFkF3wUw==
X-CSE-MsgGUID: iQkt79f1RIaZuXNNkADT6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868957"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 08/11] drm/xe: Fine grained page fault locking
Date: Tue,  5 Aug 2025 23:22:39 -0700
Message-Id: <20250806062242.1090416-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250806062242.1090416-1-matthew.brost@intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <atthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 +
 drivers/gpu/drm/xe/xe_hmm.c          |  4 +-
 drivers/gpu/drm/xe/xe_pagefault.c    | 33 +++++++---
 drivers/gpu/drm/xe/xe_svm.c          | 96 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_svm.h          | 38 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c           | 88 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_vm.h           |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h     | 24 ++++++-
 8 files changed, 230 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aa119026ce9..02b91a698500 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -393,6 +393,8 @@ struct xe_device {
 		struct xarray asid_to_vm;
 		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
 		u32 next_asid;
+		/** @usm.current_pf_queue: current page fault queue */
+		u32 current_pf_queue;
 		/** @usm.lock: protects UM state */
 		struct rw_semaphore lock;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
index 57b71956ddf4..c9d53ffae843 100644
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ b/drivers/gpu/drm/xe/xe_hmm.c
@@ -136,7 +136,7 @@ static void xe_hmm_userptr_set_mapped(struct xe_userptr_vma *uvma)
 	struct xe_userptr *userptr = &uvma->userptr;
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert(xe_vma_userptr_lockdep(uvma));
 	lockdep_assert_held(&vm->userptr.notifier_lock);
 
 	mutex_lock(&userptr->unmap_mutex);
@@ -154,7 +154,7 @@ void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 
 	if (!lockdep_is_held_type(&vm->userptr.notifier_lock, 0) &&
-	    !lockdep_is_held_type(&vm->lock, 0) &&
+	    !xe_vma_userptr_lockdep(uvma) &&
 	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
 		/* Don't unmap in exec critical section. */
 		xe_vm_assert_held(vm);
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 474412c21ec3..95d2eb8566fb 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -79,7 +79,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	ktime_t end = 0;
 	int err;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_COUNT, 1);
 	xe_gt_stats_incr(gt, XE_GT_STATS_ID_VMA_PAGEFAULT_KB,
@@ -87,6 +87,8 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 
 	trace_xe_vma_pagefault(vma);
 
+	guard(mutex)(&vma->fault_lock);
+
 	/* Check if VMA is valid, opportunistic check only */
 	if (xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
 					vma->tile_invalidated) && !atomic)
@@ -122,10 +124,13 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 			goto unlock_dma_resv;
 		}
 	}
+	drm_exec_fini(&exec);
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
 
+	return err;
+
 unlock_dma_resv:
 	drm_exec_fini(&exec);
 	if (err == -EAGAIN)
@@ -172,10 +177,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	/*
-	 * TODO: Change to read lock? Using write lock for simplicity.
-	 */
-	down_write(&vm->lock);
+	down_read(&vm->lock);
 
 	if (xe_vm_is_closed(vm)) {
 		err = -ENOENT;
@@ -199,7 +201,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 unlock_vm:
 	if (!err)
 		vm->usm.last_fault_vma = vma;
-	up_write(&vm->lock);
+	up_read(&vm->lock);
 	xe_vm_put(vm);
 
 	return err;
@@ -404,6 +406,19 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
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
@@ -416,8 +431,8 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
  */
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
-	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
-		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+	int queue_index = xe_pagefault_queue_index(xe);
+	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
 	unsigned long flags;
 	bool full;
 
@@ -431,7 +446,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 	} else {
 		drm_warn(&xe->drm,
 			 "PageFault Queue (%d) full, shouldn't be possible\n",
-			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+			 queue_index);
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 1bcf3ba3b350..6e5d9ce7c76e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -82,6 +82,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 		return NULL;
 
 	INIT_LIST_HEAD(&range->garbage_collector_link);
+	mutex_init(&range->lock);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
 
 	return &range->base;
@@ -89,6 +90,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 
 static void xe_svm_range_free(struct drm_gpusvm_range *range)
 {
+	mutex_destroy(&to_xe_range(range)->lock);
 	xe_vm_put(range_to_vm(range));
 	kfree(range);
 }
@@ -103,11 +105,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 
 	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
 
-	spin_lock(&vm->svm.garbage_collector.lock);
+	spin_lock(&vm->svm.garbage_collector.list_lock);
 	if (list_empty(&range->garbage_collector_link))
 		list_add_tail(&range->garbage_collector_link,
 			      &vm->svm.garbage_collector.range_list);
-	spin_unlock(&vm->svm.garbage_collector.lock);
+	spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 	queue_work(xe->usm.pf_wq, &vm->svm.garbage_collector.work);
 }
@@ -238,16 +240,24 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 {
 	struct dma_fence *fence;
 
-	range_debug(range, "GARBAGE COLLECTOR");
+	scoped_guard(mutex, &range->lock) {
+		drm_gpusvm_range_get(&range->base);
+		range->removed = true;
 
-	xe_vm_lock(vm, false);
-	fence = xe_vm_range_unbind(vm, range);
-	xe_vm_unlock(vm);
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
-	dma_fence_put(fence);
+		range_debug(range, "GARBAGE COLLECTOR");
+
+		xe_vm_lock(vm, false);
+		fence = xe_vm_range_unbind(vm, range);
+		xe_vm_unlock(vm);
+		if (IS_ERR(fence))
+			return PTR_ERR(fence);
+		dma_fence_put(fence);
+
+		scoped_guard(mutex, &vm->svm.range_lock)
+			drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+	}
 
-	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+	drm_gpusvm_range_put(&range->base);
 
 	return 0;
 }
@@ -257,12 +267,14 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 	struct xe_svm_range *range;
 	int err;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	if (xe_vm_is_closed_or_banned(vm))
 		return -ENOENT;
 
-	spin_lock(&vm->svm.garbage_collector.lock);
+	guard(mutex)(&vm->svm.garbage_collector.lock);
+
+	spin_lock(&vm->svm.garbage_collector.list_lock);
 	for (;;) {
 		range = list_first_entry_or_null(&vm->svm.garbage_collector.range_list,
 						 typeof(*range),
@@ -271,7 +283,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			break;
 
 		list_del(&range->garbage_collector_link);
-		spin_unlock(&vm->svm.garbage_collector.lock);
+		spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 		err = __xe_svm_garbage_collector(vm, range);
 		if (err) {
@@ -282,9 +294,9 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 			return err;
 		}
 
-		spin_lock(&vm->svm.garbage_collector.lock);
+		spin_lock(&vm->svm.garbage_collector.list_lock);
 	}
-	spin_unlock(&vm->svm.garbage_collector.lock);
+	spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 	return 0;
 }
@@ -294,9 +306,8 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	struct xe_vm *vm = container_of(w, struct xe_vm,
 					svm.garbage_collector.work);
 
-	down_write(&vm->lock);
+	guard(rwsem_read)(&vm->lock);
 	xe_svm_garbage_collector(vm);
-	up_write(&vm->lock);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
@@ -560,7 +571,9 @@ int xe_svm_init(struct xe_vm *vm)
 {
 	int err;
 
-	spin_lock_init(&vm->svm.garbage_collector.lock);
+	mutex_init(&vm->svm.range_lock);
+	mutex_init(&vm->svm.garbage_collector.lock);
+	spin_lock_init(&vm->svm.garbage_collector.list_lock);
 	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
 	INIT_WORK(&vm->svm.garbage_collector.work,
 		  xe_svm_garbage_collector_work_func);
@@ -573,7 +586,7 @@ int xe_svm_init(struct xe_vm *vm)
 	if (err)
 		return err;
 
-	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->svm.range_lock);
 
 	return 0;
 }
@@ -600,7 +613,10 @@ void xe_svm_fini(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
 
-	drm_gpusvm_fini(&vm->svm.gpusvm);
+	scoped_guard(mutex, &vm->svm.range_lock)
+		drm_gpusvm_fini(&vm->svm.gpusvm);
+	mutex_destroy(&vm->svm.range_lock);
+	mutex_destroy(&vm->svm.garbage_collector.lock);
 }
 
 static bool xe_svm_range_is_valid(struct xe_svm_range *range,
@@ -804,19 +820,25 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			IS_ENABLED(CONFIG_DRM_XE_PAGEMAP) ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
 	};
-	struct xe_svm_range *range;
+	struct xe_svm_range *range = NULL;
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
 	ktime_t end = 0;
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
@@ -830,8 +852,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (ctx.devmem_only && !range->base.flags.migrate_devmem)
 		return -EACCES;
 
+	mutex_lock(&range->lock);
+
+	if (xe_svm_range_is_removed(range))
+		goto retry;
+
 	if (xe_svm_range_is_valid(range, tile, ctx.devmem_only))
-		return 0;
+		goto err_out;
 
 	range_debug(range, "PAGE FAULT");
 
@@ -849,7 +876,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				drm_err(&vm->xe->drm,
 					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
 					vm->usm.asid, ERR_PTR(err));
-				return err;
+				goto err_out;
 			}
 		}
 	}
@@ -899,6 +926,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	dma_fence_put(fence);
 
 err_out:
+	mutex_unlock(&range->lock);
+	drm_gpusvm_range_put(&range->base);
 
 	return err;
 }
@@ -933,27 +962,34 @@ int xe_svm_bo_evict(struct xe_bo *bo)
 }
 
 /**
- * xe_svm_range_find_or_insert- Find or insert GPU SVM range
+ * xe_svm_range_find_or_insert() - Find or insert GPU SVM range
  * @vm: xe_vm pointer
  * @addr: address for which range needs to be found/inserted
  * @vma:  Pointer to struct xe_vma which mirrors CPU
  * @ctx: GPU SVM context
  *
  * This function finds or inserts a newly allocated a SVM range based on the
- * address.
+ * address., Take a reference to SVM range on success.
  *
  * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
  */
 struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
-						 struct xe_vma *vma, struct drm_gpusvm_ctx *ctx)
+						 struct xe_vma *vma,
+						 struct drm_gpusvm_ctx *ctx)
 {
 	struct drm_gpusvm_range *r;
 
-	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm, max(addr, xe_vma_start(vma)),
-					    xe_vma_start(vma), xe_vma_end(vma), ctx);
+	guard(mutex)(&vm->svm.range_lock);
+
+	r = drm_gpusvm_range_find_or_insert(&vm->svm.gpusvm,
+					    max(addr, xe_vma_start(vma)),
+					    xe_vma_start(vma),
+					    xe_vma_end(vma), ctx);
 	if (IS_ERR(r))
 		return ERR_PTR(PTR_ERR(r));
 
+	drm_gpusvm_range_get(r);
+
 	return to_xe_range(r);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index da9a69ea0bb1..939043d6fbf1 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -29,6 +29,13 @@ struct xe_svm_range {
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
@@ -39,8 +46,22 @@ struct xe_svm_range {
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
  * xe_svm_range_pages_valid() - SVM range pages valid
  * @range: SVM range
@@ -102,6 +123,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.flags.has_dma_mapping;
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
@@ -184,6 +218,10 @@ struct xe_svm_range {
 	u32 tile_invalidated;
 };
 
+static inline void xe_svm_range_put(struct xe_svm_range *range)
+{
+}
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return false;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index c9ae13c32117..2498cff58fe7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -65,13 +65,41 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
 		-EAGAIN : 0;
 }
 
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+/**
+ * xe_vma_userptr_lockdep() - Lockdep rules for modifying userptr pages
+ * @uvma: The userptr
+ *
+ * We need either:
+ * 1. vm->lock in write mode
+ * 2. vm->lock in read mode and vma->fault_lock
+ *
+ * Return: True is lockdep rules are met, False otherwise.
+ */
+bool xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma)
+{
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	return lockdep_is_held_type(&vm->lock, 0) ||
+		(lockdep_is_held_type(&vm->lock, 1) &&
+		 lockdep_is_held_type(&vma->fault_lock, 0));
+}
+#else
+bool xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma)
+{
+	return true;
+}
+#endif
+
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 {
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
 
-	lockdep_assert_held(&vm->lock);
+	lockdep_assert(xe_vma_userptr_lockdep(uvma));
+
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
 	return xe_hmm_userptr_populate_range(uvma, false);
@@ -799,6 +827,17 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
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
@@ -806,7 +845,7 @@ static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
 	vma = gpuva_to_vma(op->base.prefetch.va);
 
 	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
-		xa_destroy(&op->prefetch_range.range);
+		xe_vma_svm_prefetch_ranges_fini(op);
 }
 
 static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
@@ -1205,6 +1244,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->gpuva.gem.obj = &bo->ttm.base;
 	}
 
+	mutex_init(&vma->fault_lock);
+
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
@@ -1299,6 +1340,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		xe_bo_put(xe_vma_bo(vma));
 	}
 
+	mutex_destroy(&vma->fault_lock);
 	xe_vma_free(vma);
 }
 
@@ -1319,11 +1361,18 @@ static void vma_destroy_cb(struct dma_fence *fence,
 	queue_work(system_unbound_wq, &vma->destroy_work);
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
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
 
 	if (xe_vma_is_userptr(vma)) {
@@ -2384,14 +2433,17 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			for_each_tile(tile, vm->xe, id)
 				tile_mask |= 0x1 << id;
 
-			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
+			xa_init_flags(&op->prefetch_range.range,
+				      XA_FLAGS_ALLOC);
 			op->prefetch_range.region = prefetch_region;
 			op->prefetch_range.ranges_count = 0;
 alloc_next_range:
-			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
+			svm_range = xe_svm_range_find_or_insert(vm, addr, vma,
+								&ctx);
 
 			if (PTR_ERR(svm_range) == -ENOENT) {
-				u64 ret = xe_svm_find_vma_start(vm, addr, range_end, vma);
+				u64 ret = xe_svm_find_vma_start(vm, addr,
+								range_end, vma);
 
 				addr = ret == ULONG_MAX ? 0 : ret;
 				if (addr)
@@ -2405,21 +2457,24 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				goto unwind_prefetch_ops;
 			}
 
-			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region)) {
-				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
+			if (xe_svm_range_validate(vm, svm_range, tile_mask,
+						  !!prefetch_region)) {
+				xe_svm_range_debug(svm_range,
+						   "PREFETCH - RANGE IS VALID");
+				xe_svm_range_put(svm_range);
 				goto check_next_range;
 			}
 
 			err = xa_alloc(&op->prefetch_range.range,
 				       &i, svm_range, xa_limit_32b,
 				       GFP_KERNEL);
-
 			if (err)
 				goto unwind_prefetch_ops;
 
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
-			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
+			xe_svm_range_debug(svm_range,
+					   "PREFETCH - RANGE CREATED");
 check_next_range:
 			if (range_end > xe_svm_range_end(svm_range) &&
 			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
@@ -2449,7 +2504,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	struct xe_vma *vma;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	if (bo) {
 		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
@@ -2529,7 +2584,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -2597,7 +2652,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 	u8 id, tile_mask = 0;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	for_each_tile(tile, vm->xe, id)
 		tile_mask |= 0x1 << id;
@@ -2776,7 +2831,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
 {
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -2907,6 +2962,11 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
+		guard(mutex)(&svm_range->lock);
+
+		if (xe_svm_range_is_removed(svm_range))
+			return -ENODATA;
+
 		if (!region)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..4b097b9f981d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -262,6 +262,8 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
+bool xe_vma_userptr_lockdep(struct xe_userptr_vma *uvma);
+
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bed6088e1bb3..1aabdedbfa92 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -100,6 +100,12 @@ struct xe_vma {
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
 	 * protected by BO's resv and for userptrs, vm->userptr.notifier_lock in
@@ -157,13 +163,27 @@ struct xe_vm {
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
-- 
2.34.1

