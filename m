Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5821FD45EF
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 20:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E67510E82C;
	Wed, 25 Feb 2026 20:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BOkgEjGq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A50910E82B
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Feb 2026 20:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772051269; x=1803587269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKL0TxmmAtvB8OdgfWT09Um7tBP7aHHU8St8klChQ3M=;
 b=BOkgEjGqwJgtZv5ac0WlY65pXiHDlQtO1Sc1ww1UBz3RVTyjpz1XfJeJ
 ozDoC2uZl7/p8UoN9YAuDtBgRF7lvgihn9P9TYVksiXnMMrb8Ku3Upovm
 yYPwpBGDW6+PmUKzOmH4R5VMVC2fcqeTpfXihRgc+/eXigVPx9Z1xR9gQ
 ICLOrl6sX7ilBRgy3THv2AxE6PMH2fwq3TFP+sh50s6DAfq/+x2t7Fxk+
 y725cJjbofIkcDLRKRtguKWgSRdv0aPL6C8rI88nRK+ePxwORsUszRRCu
 o3NAQeMvTjHtrh+0ev2DMs2iZpb0wVtPexyBTSw1+5D2YCXhKfpupWYU7 w==;
X-CSE-ConnectionGUID: nOnzuk4MShucRBF2MaD4zA==
X-CSE-MsgGUID: XxJkXuhQR1e/qni+HrKMDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="90515159"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="90515159"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:47 -0800
X-CSE-ConnectionGUID: jG+J4KwPTAu5jdgDyK/kvQ==
X-CSE-MsgGUID: fnOSl6RHQOmCP8p7KVoGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; d="scan'208";a="220845121"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 12:27:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 01/12] drm/xe: Fine grained page fault locking
Date: Wed, 25 Feb 2026 12:27:25 -0800
Message-Id: <20260225202736.2723250-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225202736.2723250-1-matthew.brost@intel.com>
References: <20260225202736.2723250-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/drm_gpusvm.c         |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h |   2 +
 drivers/gpu/drm/xe/xe_pagefault.c    | 100 +++++++++++++++------------
 drivers/gpu/drm/xe/xe_svm.c          |  92 +++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h          |  38 ++++++++++
 drivers/gpu/drm/xe/xe_userptr.c      |  20 +++++-
 drivers/gpu/drm/xe/xe_vm.c           |  40 +++++++++--
 drivers/gpu/drm/xe/xe_vm_types.h     |  24 ++++++-
 8 files changed, 237 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 35dd07297dd0..c71dba009d32 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1624,7 +1624,7 @@ void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 			    const struct drm_gpusvm_ctx *ctx)
 {
 	if (ctx->in_notifier)
-		lockdep_assert_held_write(&gpusvm->notifier_lock);
+		lockdep_assert_held(&gpusvm->notifier_lock);
 	else
 		drm_gpusvm_notifier_lock(gpusvm);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8f3ef836541e..1eb0fe118940 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -304,6 +304,8 @@ struct xe_device {
 		struct xarray asid_to_vm;
 		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
 		u32 next_asid;
+		/** @usm.current_pf_queue: current page fault queue */
+		u32 current_pf_queue;
 		/** @usm.lock: protects UM state */
 		struct rw_semaphore lock;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index ea4857acf28d..421262c2a63a 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -71,9 +71,9 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	int err, needs_vram;
+	int err = 0, needs_vram;
 
-	lockdep_assert_held_write(&vm->lock);
+	lockdep_assert_held(&vm->lock);
 
 	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
 	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
@@ -85,50 +85,52 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
 
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
@@ -171,10 +173,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	/*
-	 * TODO: Change to read lock? Using write lock for simplicity.
-	 */
-	down_write(&vm->lock);
+	down_read(&vm->lock);
 
 	if (xe_vm_is_closed(vm)) {
 		err = -ENOENT;
@@ -198,7 +197,7 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 unlock_vm:
 	if (!err)
 		vm->usm.last_fault_vma = vma;
-	up_write(&vm->lock);
+	up_read(&vm->lock);
 	xe_vm_put(vm);
 
 	return err;
@@ -418,6 +417,19 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
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
@@ -430,8 +442,8 @@ static bool xe_pagefault_queue_full(struct xe_pagefault_queue *pf_queue)
  */
 int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 {
-	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue +
-		(pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+	int queue_index = xe_pagefault_queue_index(xe);
+	struct xe_pagefault_queue *pf_queue = xe->usm.pf_queue + queue_index;
 	unsigned long flags;
 	bool full;
 
@@ -445,7 +457,7 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 	} else {
 		drm_warn(&xe->drm,
 			 "PageFault Queue (%d) full, shouldn't be possible\n",
-			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+			 queue_index);
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 002b6c22ad3f..3e59695e0c01 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -114,6 +114,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 		return NULL;
 
 	INIT_LIST_HEAD(&range->garbage_collector_link);
+	mutex_init(&range->lock);
 	xe_vm_get(gpusvm_to_vm(gpusvm));
 
 	return &range->base;
@@ -121,6 +122,7 @@ xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 
 static void xe_svm_range_free(struct drm_gpusvm_range *range)
 {
+	mutex_destroy(&to_xe_range(range)->lock);
 	xe_vm_put(range_to_vm(range));
 	kfree(range);
 }
@@ -135,11 +137,11 @@ xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
 
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
@@ -297,16 +299,24 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
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
 
-	drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+		scoped_guard(mutex, &vm->svm.range_lock)
+			drm_gpusvm_range_remove(&vm->svm.gpusvm, &range->base);
+	}
+
+	drm_gpusvm_range_put(&range->base);
 
 	return 0;
 }
@@ -378,13 +388,15 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
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
@@ -395,7 +407,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 		range_end = xe_svm_range_end(range);
 
 		list_del(&range->garbage_collector_link);
-		spin_unlock(&vm->svm.garbage_collector.lock);
+		spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 		err = __xe_svm_garbage_collector(vm, range);
 		if (err) {
@@ -414,7 +426,7 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
 				return err;
 		}
 	}
-	spin_unlock(&vm->svm.garbage_collector.lock);
+	spin_unlock(&vm->svm.garbage_collector.list_lock);
 
 	return ret;
 }
@@ -424,9 +436,8 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	struct xe_vm *vm = container_of(w, struct xe_vm,
 					svm.garbage_collector.work);
 
-	down_write(&vm->lock);
+	guard(rwsem_read)(&vm->lock);
 	xe_svm_garbage_collector(vm);
-	up_write(&vm->lock);
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
@@ -855,8 +866,11 @@ int xe_svm_init(struct xe_vm *vm)
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
@@ -878,7 +892,7 @@ int xe_svm_init(struct xe_vm *vm)
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
 				      ARRAY_SIZE(fault_chunk_sizes));
-		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->svm.range_lock);
 
 		if (err) {
 			xe_svm_put_pagemaps(vm);
@@ -918,7 +932,10 @@ void xe_svm_fini(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
 
-	drm_gpusvm_fini(&vm->svm.gpusvm);
+	scoped_guard(mutex, &vm->svm.range_lock)
+		drm_gpusvm_fini(&vm->svm.gpusvm);
+	mutex_destroy(&vm->svm.range_lock);
+	mutex_destroy(&vm->svm.garbage_collector.lock);
 }
 
 static bool xe_svm_range_has_pagemap_locked(const struct xe_svm_range *range,
@@ -1198,20 +1215,26 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	};
 	struct xe_validation_ctx vctx;
 	struct drm_exec exec;
-	struct xe_svm_range *range;
+	struct xe_svm_range *range = NULL;
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
@@ -1227,6 +1250,11 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_svm_range_fault_count_stats_incr(gt, range);
 
+	mutex_lock(&range->lock);
+
+	if (xe_svm_range_is_removed(range))
+		goto retry;
+
 	if (ctx.devmem_only && !range->base.pages.flags.migrate_devmem) {
 		err = -EACCES;
 		goto out;
@@ -1268,7 +1296,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 				drm_err(&vm->xe->drm,
 					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
 					vm->usm.asid, ERR_PTR(err));
-				return err;
+				goto err_out;
 			}
 		}
 	}
@@ -1330,6 +1358,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 out:
 	xe_svm_range_fault_us_stats_incr(gt, range, start);
+	mutex_unlock(&range->lock);
+	drm_gpusvm_range_put(&range->base);
 	return 0;
 
 err_out:
@@ -1339,6 +1369,9 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		goto retry;
 	}
 
+	mutex_unlock(&range->lock);
+	drm_gpusvm_range_put(&range->base);
+
 	return err;
 }
 
@@ -1421,9 +1454,9 @@ void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
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
@@ -1453,7 +1486,7 @@ int xe_svm_bo_evict(struct xe_bo *bo)
  * @ctx: GPU SVM context
  *
  * This function finds or inserts a newly allocated a SVM range based on the
- * address.
+ * address. Take a reference to SVM range on success.
  *
  * Return: Pointer to the SVM range on success, ERR_PTR() on failure.
  */
@@ -1462,11 +1495,15 @@ struct xe_svm_range *xe_svm_range_find_or_insert(struct xe_vm *vm, u64 addr,
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
 
@@ -1486,6 +1523,8 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
 {
 	int err = 0;
 
+	lockdep_assert_held(&range->lock);
+
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, &range->base, ctx);
 	if (err == -EOPNOTSUPP) {
 		range_debug(range, "PAGE FAULT - EVICT PAGES");
@@ -1602,6 +1641,7 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 	int err, retries = 1;
 	bool write_locked = false;
 
+	lockdep_assert_held(&range->lock);
 	xe_assert(range_to_vm(&range->base)->xe, range->base.pages.flags.migrate_devmem);
 	range_debug(range, "ALLOCATE VRAM");
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index b7b8eeacf196..7dcf8b084692 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -36,6 +36,13 @@ struct xe_svm_range {
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
@@ -46,8 +53,22 @@ struct xe_svm_range {
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
@@ -135,6 +156,19 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
 	return range->base.pages.flags.has_dma_mapping;
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
@@ -218,6 +252,10 @@ struct xe_svm_range {
 	u32 tile_invalidated;
 };
 
+static inline void xe_svm_range_put(struct xe_svm_range *range)
+{
+}
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return false;
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index e120323c43bc..bf6043de1b8e 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -48,6 +48,22 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
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
+#define xe_vma_userptr_lockdep(uvma)	\
+	lockdep_assert(__xe_vma_userptr_lockdep(uvma))
+#else
+#define xe_vma_userptr_lockdep(uvma)
+#endif
+
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 {
 	struct xe_vma *vma = &uvma->vma;
@@ -59,7 +75,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 		.allow_mixed = true,
 	};
 
-	lockdep_assert_held(&vm->lock);
+	xe_vma_userptr_lockdep(uvma);
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
@@ -167,7 +183,7 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 
 	/* Protect against concurrent userptr pinning */
-	lockdep_assert_held(&vm->lock);
+	xe_vma_userptr_lockdep(uvma);
 	/* Protect against concurrent notifiers */
 	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 548b0769b3ef..3332a86f464f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -597,6 +597,17 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
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
@@ -604,7 +615,7 @@ static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
 	vma = gpuva_to_vma(op->base.prefetch.va);
 
 	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
-		xa_destroy(&op->prefetch_range.range);
+		xe_vma_svm_prefetch_ranges_fini(op);
 }
 
 static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
@@ -838,6 +849,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	u8 id;
 	int err;
 
+	lockdep_assert_held(&range->lock);
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
@@ -920,6 +932,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	u8 id;
 	int err;
 
+	lockdep_assert_held(&range->lock);
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
@@ -1023,6 +1036,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			vma->gpuva.gem.obj = &bo->ttm.base;
 	}
 
+	mutex_init(&vma->fault_lock);
+
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
@@ -1095,6 +1110,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		xe_bo_put(xe_vma_bo(vma));
 	}
 
+	mutex_destroy(&vma->fault_lock);
 	xe_vma_free(vma);
 }
 
@@ -1115,11 +1131,18 @@ static void vma_destroy_cb(struct dma_fence *fence,
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
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 	xe_assert(vm->xe, list_empty(&vma->combined_links.destroy));
 
 	if (xe_vma_is_userptr(vma)) {
@@ -2462,7 +2485,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	struct xe_vma *vma;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	if (bo) {
 		err = 0;
@@ -2559,7 +2582,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -2650,7 +2673,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 	u8 id, tile_mask = 0;
 	int err = 0;
 
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	for_each_tile(tile, vm->xe, id)
 		tile_mask |= 0x1 << id;
@@ -2826,7 +2849,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
 {
-	lockdep_assert_held_write(&vm->lock);
+	xe_vm_assert_write_mode_or_garbage_collector(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -2956,6 +2979,11 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
+		guard(mutex)(&svm_range->lock);
+
+		if (xe_svm_range_is_removed(svm_range))
+			return -ENODATA;
+
 		if (!dpagemap)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1f6f7e30e751..9c91934ec47f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -119,6 +119,12 @@ struct xe_vma {
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
@@ -183,13 +189,27 @@ struct xe_vm {
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

