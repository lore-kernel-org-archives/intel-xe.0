Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62358C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 21:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED37F10F20E;
	Thu, 23 Jul 2026 21:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eONW/bZw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB60410F20A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 21:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784843269; x=1816379269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pZ7dILvWWRMMZk5cd7KLh0C+K8Rl/IATOcifdkem7cc=;
 b=eONW/bZwEc2+nhKoxR2UUPjVs6Kv3MZ+g0kaHqV6Gp8DnoRbpIH1wjzZ
 3aUm5m695kAkhW5brTUynzlUA0v4/zzoYoQsxZPeJJFWBb9fIIUNid+j5
 EB7O7Ds2UKYIF276nJKGOMuZdLGJsrzDd0KX997DI7xo0ULuNEcV51jSN
 mGQiltzZlJUz/8UsugtOvxc3f116BManeQCH1yUKNAnjhg76MGWe0ZgZN
 LAI/LiXZ8JqMzmVfrhfDP1LJ1WhGi70IgJ7zZ43lDIrfbk9SDNkz1Q5BA
 yharH/O9MguveuYL/pvLWB/0L+huqMeN+kW/kanJKOD6IFxbf/DRv8dKG g==;
X-CSE-ConnectionGUID: ZKbdLcwASUq1bwa4ty12MA==
X-CSE-MsgGUID: jFOnThzUR0CWLXETURXrpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="88050503"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="88050503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 14:47:48 -0700
X-CSE-ConnectionGUID: i5paty61QfmHhdXZ+s43Ig==
X-CSE-MsgGUID: voW/eWKlQP6zINO9vpDLiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="254593756"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 14:47:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v5 03/12] drm/xe: Thread prefetch of SVM ranges
Date: Thu, 23 Jul 2026 14:47:34 -0700
Message-Id: <20260723214743.1498125-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723214743.1498125-1-matthew.brost@intel.com>
References: <20260723214743.1498125-1-matthew.brost@intel.com>
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

The migrate_vma_* functions are very CPU-intensive; as a result,
prefetching SVM ranges is limited by CPU performance rather than paging
copy engine bandwidth. To accelerate SVM range prefetching, the step
that calls migrate_vma_* is now threaded. Reuses the page fault work
queue for threading.

Running xe_exec_system_allocator --r prefetch-benchmark, which tests
64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
this patch on drm-tip. Enabling high SLPC further increases throughput
to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s. Both
of these optimizations are upcoming.

v2:
 - Use dedicated prefetch workqueue
 - Pick dedicated prefetch thread count based on profiling
 - Skip threaded prefetch for only 1 range or if prefetching to SRAM
 - Fully tested
v3:
 - Use page fault work queue

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c |  32 ++++++-
 drivers/gpu/drm/xe/xe_svm.c       |  23 ++++-
 drivers/gpu/drm/xe/xe_svm.h       |   6 +-
 drivers/gpu/drm/xe/xe_vm.c        | 150 +++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm_types.h  |  15 +--
 5 files changed, 175 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 80196e874e06..c4df3b746dae 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -186,7 +186,17 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	down_read(&vm->lock);
+	/*
+	 * We can't block threaded prefetches from completing. down_read() can
+	 * block on a pending down_write(), so without a trylock here, we could
+	 * deadlock, since the page fault workqueue is shared with prefetches,
+	 * prefetches flush work items onto the same workqueue, and a
+	 * down_write() could be pending.
+	 */
+	if (!down_read_trylock(&vm->lock)) {
+		err = -EAGAIN;
+		goto put_vm;
+	}
 
 	if (xe_vm_is_closed(vm)) {
 		err = -ENOENT;
@@ -215,11 +225,23 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 
 unlock_vm:
 	up_read(&vm->lock);
+put_vm:
 	xe_vm_put(vm);
 
 	return err;
 }
 
+static void xe_pagefault_queue_retry(struct xe_pagefault_queue *pf_queue,
+				     struct xe_pagefault *pf)
+{
+	spin_lock_irq(&pf_queue->lock);
+	if (!pf_queue->tail)
+		pf_queue->tail = pf_queue->size - xe_pagefault_entry_size();
+	else
+		pf_queue->tail -= xe_pagefault_entry_size();
+	spin_unlock_irq(&pf_queue->lock);
+}
+
 static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
 				   struct xe_pagefault *pf)
 {
@@ -303,8 +325,12 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 
 		err = xe_pagefault_service(&pf);
 		if (err) {
-			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
-			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
+			if (err == -EAGAIN) {
+				xe_pagefault_queue_retry(pf_queue, &pf);
+				queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
+				break;
+			} else if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
+				xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf);
 				xe_pagefault_print(&pf);
 				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
 					   ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 8d604aa095f0..705363bf3339 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -453,8 +453,19 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	struct xe_vm *vm = container_of(w, struct xe_vm,
 					svm.garbage_collector.work);
 
-	guard(rwsem_read)(&vm->lock);
-	xe_svm_garbage_collector(vm);
+	/*
+	 * We can't block threaded prefetches from completing. down_read() can
+	 * block on a pending down_write(), so without a trylock here, we could
+	 * deadlock, since the page fault workqueue is shared with prefetches,
+	 * prefetches flush work items onto the same workqueue, and a
+	 * down_write() could be pending.
+	 */
+	if (down_read_trylock(&vm->lock)) {
+		xe_svm_garbage_collector(vm);
+		up_read(&vm->lock);
+	} else {
+		queue_work(vm->xe->usm.pf_wq, &vm->svm.garbage_collector.work);
+	}
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
@@ -1041,6 +1052,7 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
  * @tile_mask: Mask representing the tiles to be checked
  * @dpagemap: if !%NULL, the range is expected to be present
  * in device memory identified by this parameter.
+ * @valid_pages: Pages are valid, result written back to caller
  *
  * The xe_svm_range_validate() function checks if a range is
  * valid and located in the desired memory region.
@@ -1049,7 +1061,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
  */
 bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
-			   u8 tile_mask, const struct drm_pagemap *dpagemap)
+			   u8 tile_mask, const struct drm_pagemap *dpagemap,
+			   bool *valid_pages)
 {
 	bool ret;
 
@@ -1061,6 +1074,8 @@ bool xe_svm_range_validate(struct xe_vm *vm,
 	else
 		ret = ret && !range->pages.dpagemap;
 
+	*valid_pages = xe_svm_range_pages_valid(range);
+
 	xe_svm_notifier_unlock(vm);
 
 	return ret;
@@ -2123,5 +2138,5 @@ struct drm_pagemap *xe_drm_pagemap_from_fd(int fd, u32 region_instance)
 void xe_svm_flush(struct xe_vm *vm)
 {
 	if (xe_vm_in_fault_mode(vm))
-		flush_work(&vm->svm.garbage_collector.work);
+		__flush_workqueue(vm->xe->usm.pf_wq);
 }
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 0d1f1107af5f..46be2e5c6f7f 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -134,7 +134,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range);
 
 bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
-			   u8 tile_mask, const struct drm_pagemap *dpagemap);
+			   u8 tile_mask, const struct drm_pagemap *dpagemap,
+			   bool *valid_pages);
 
 u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
 
@@ -376,7 +377,8 @@ void xe_svm_range_migrate_to_smem(struct xe_vm *vm, struct xe_svm_range *range)
 static inline
 bool xe_svm_range_validate(struct xe_vm *vm,
 			   struct xe_svm_range *range,
-			   u8 tile_mask, bool devmem_preferred)
+			   u8 tile_mask, const struct drm_pagemap *dpagemap,
+			   bool *valid_pages)
 {
 	return false;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9e3e354adc4c..64caf8290517 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2513,6 +2513,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 			struct drm_pagemap *dpagemap = NULL;
 			u8 id, tile_mask = 0;
 			u32 i;
+			bool valid_pages;
 
 			if (xe_vma_is_userptr(vma))
 				vops->flags |= XE_VMA_OPS_FLAG_MODIFIES_GPUVA;
@@ -2560,9 +2561,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				goto unwind_prefetch_ops;
 			}
 
-			if (xe_svm_range_validate(vm, svm_range, tile_mask, dpagemap)) {
+			if (xe_svm_range_validate(vm, svm_range, tile_mask,
+						  dpagemap, &valid_pages)) {
 				xe_svm_range_put(svm_range);
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
+				xe_assert(vm->xe, valid_pages);
 				goto check_next_range;
 			}
 
@@ -2577,6 +2580,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 
 			op->prefetch_range.ranges_count++;
 			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
+			if (valid_pages)
+				vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE;
 			xe_svm_range_debug(svm_range, "PREFETCH - RANGE CREATED");
 check_next_range:
 			if (range_end > xe_svm_range_end(svm_range) &&
@@ -3142,16 +3147,83 @@ static int check_ufence(struct xe_vma *vma)
 	return 0;
 }
 
-static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
+struct prefetch_thread {
+	struct work_struct work;
+	struct drm_gpusvm_ctx *ctx;
+	struct xe_vma *vma;
+	struct xe_svm_range *svm_range;
+	struct drm_pagemap *dpagemap;
+	int err;
+};
+
+static void prefetch_thread_func(struct prefetch_thread *thread)
+{
+	struct xe_vma *vma = thread->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_svm_range *svm_range = thread->svm_range;
+	struct drm_pagemap *dpagemap = thread->dpagemap;
+	int err = 0;
+
+	guard(mutex)(&svm_range->lock);
+
+	if (xe_svm_range_is_removed(svm_range)) {
+		thread->err = -ENODATA;
+		return;
+	}
+
+	if (!dpagemap)
+		xe_svm_range_migrate_to_smem(vm, svm_range);
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
+		drm_dbg(&vm->xe->drm,
+			"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
+			dpagemap ? dpagemap->drm->unique : "system",
+			xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
+	}
+
+	if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
+		err = xe_svm_alloc_vram(svm_range, thread->ctx, dpagemap);
+		if (err) {
+			drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
+				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+			thread->err = -ENODATA;
+			return;
+		}
+		xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
+	}
+
+	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
+	if (err) {
+		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
+			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
+		if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
+			err = -ENODATA;
+		thread->err = err;
+		return;
+	}
+	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
+}
+
+static void prefetch_work_func(struct work_struct *w)
+{
+	struct prefetch_thread *thread =
+		container_of(w, struct prefetch_thread, work);
+
+	prefetch_thread_func(thread);
+}
+
+static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops,
+			   struct xe_vma_op *op)
 {
 	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 	struct drm_pagemap *dpagemap = op->prefetch_range.dpagemap;
-	int err = 0;
-
 	struct xe_svm_range *svm_range;
 	struct drm_gpusvm_ctx ctx = {};
+	struct prefetch_thread stack_thread, *thread, *prefetches;
 	unsigned long i;
+	int err = 0, idx = 0;
+	bool skip_threads;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
@@ -3161,42 +3233,49 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !dpagemap);
 
-	/* TODO: Threading the migration */
-	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		guard(mutex)(&svm_range->lock);
-
-		if (xe_svm_range_is_removed(svm_range))
-			return -ENODATA;
+	skip_threads =  op->prefetch_range.ranges_count == 1 ||
+		(!dpagemap && !(vops->flags &
+				XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE)) ||
+		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
+	thread = skip_threads ? &stack_thread : NULL;
 
-		if (!dpagemap)
-			xe_svm_range_migrate_to_smem(vm, svm_range);
+	if (!skip_threads) {
+		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
+					    sizeof(*prefetches), GFP_KERNEL);
+		if (!prefetches)
+			return -ENOMEM;
+	}
 
-		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)) {
-			drm_dbg(&vm->xe->drm,
-				"Prefetch pagemap is %s start 0x%016lx end 0x%016lx\n",
-				dpagemap ? dpagemap->drm->unique : "system",
-				xe_svm_range_start(svm_range), xe_svm_range_end(svm_range));
+	xa_for_each(&op->prefetch_range.range, i, svm_range) {
+		if (!skip_threads) {
+			thread = prefetches + idx++;
+			INIT_WORK(&thread->work, prefetch_work_func);
 		}
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, dpagemap)) {
-			err = xe_svm_alloc_vram(svm_range, &ctx, dpagemap);
-			if (err) {
-				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
-					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-				return -ENODATA;
-			}
-			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
+		thread->ctx = &ctx;
+		thread->vma = vma;
+		thread->svm_range = svm_range;
+		thread->dpagemap = dpagemap;
+		thread->err = 0;
+
+		if (skip_threads) {
+			prefetch_thread_func(thread);
+			if (thread->err)
+				return thread->err;
+		} else {
+			queue_work(vm->xe->usm.pf_wq, &thread->work);
 		}
+	}
 
-		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
-		if (err) {
-			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
-				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
-				err = -ENODATA;
-			return err;
+	if (!skip_threads) {
+		for (i = 0; i < idx; ++i) {
+			thread = prefetches + i;
+
+			flush_work(&thread->work);
+			if (thread->err && (!err || err == -ENODATA))
+				err = thread->err;
 		}
-		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
+		kvfree(prefetches);
 	}
 
 	return err;
@@ -3327,7 +3406,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	return err;
 }
 
-static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
+static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
+					     struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op;
 	int err;
@@ -3337,7 +3417,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
 
 	list_for_each_entry(op, &vops->list, link) {
 		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
-			err = prefetch_ranges(vm, op);
+			err = prefetch_ranges(vm, vops, op);
 			if (err)
 				return err;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 2f5f74fed9d2..68588b624212 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -556,13 +556,14 @@ struct xe_vma_ops {
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 	/** @flag: signify the properties within xe_vma_ops*/
-#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
-#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
-#define XE_VMA_OPS_ARRAY_OF_BINDS	 BIT(2)
-#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT	 BIT(3)
-#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP  BIT(4)
-#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA	 BIT(5)
-#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK	 BIT(6)
+#define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
+#define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
+#define XE_VMA_OPS_ARRAY_OF_BINDS		BIT(2)
+#define XE_VMA_OPS_FLAG_SKIP_TLB_WAIT		BIT(3)
+#define XE_VMA_OPS_FLAG_ALLOW_SVM_UNMAP		BIT(4)
+#define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
+#define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
+#define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

