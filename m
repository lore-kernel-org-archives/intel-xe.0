Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F56C87FCA
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 06:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713F510E725;
	Wed,  6 Aug 2025 06:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BhMb5LFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5394C10E3A6
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 06:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754461368; x=1785997368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nj3s9h6bjQQmK3Z69ClY69HXExKk6tvinP9hwVU5OTc=;
 b=BhMb5LFTU355c2oeuGixmZjY2PFwsCGH9/xwqZk3ngGWf8dq7+eE0leo
 2ZGqIQ+Eaes8pl147PJzRNmFMK2rgfokyKJHoV+/+r5+Pj6nnWCJxBbsE
 EuNSyOU1LL1PLjIhX4JsQUsiFBjXXn4Z+H8RyqfEx2P17uKU8CzL+awpY
 WhnXiA6m1Fd5MLxXvaKlIMbYkZv5+oWfw9inEPzUgwB36Iie9OMhedAEY
 iKKds9usnqIyLX894sAsh/oDKk+q8izg5yTH8xuUY6Xnnr+AsNHU4jAoW
 HWqO06ZyAeAGoTryE3xWLtPV/jIXsm+Cf+o3mZHGDbM/glaYur7J5uFZe g==;
X-CSE-ConnectionGUID: 9DzofxFNQmSMroDY+6Hs1w==
X-CSE-MsgGUID: gCynZ1AkQF+S0ZLM3UMP+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="79316939"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="79316939"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
X-CSE-ConnectionGUID: pI4jj6vvQlK3ZrxyuZlkfQ==
X-CSE-MsgGUID: 5XV7bSdJT7i3bXHETapHcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="201868963"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 23:22:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, michal.mrozek@intel.com
Subject: [PATCH 10/11] drm/xe: Thread prefetch of SVM ranges
Date: Tue,  5 Aug 2025 23:22:41 -0700
Message-Id: <20250806062242.1090416-11-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_pagefault.c |  30 ++++++-
 drivers/gpu/drm/xe/xe_svm.c       |  17 +++-
 drivers/gpu/drm/xe/xe_vm.c        | 144 +++++++++++++++++++++++-------
 3 files changed, 152 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 95d2eb8566fb..f11c70ca6dd9 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -177,7 +177,17 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
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
@@ -202,11 +212,23 @@ static int xe_pagefault_service(struct xe_pagefault *pf)
 	if (!err)
 		vm->usm.last_fault_vma = vma;
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
@@ -259,7 +281,11 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 			continue;
 
 		err = xe_pagefault_service(&pf);
-		if (err) {
+		if (err == -EAGAIN) {
+			xe_pagefault_queue_retry(pf_queue, &pf);
+			queue_work(gt_to_xe(pf.gt)->usm.pf_wq, w);
+			break;
+		} else if (err) {
 			xe_pagefault_print(&pf);
 			xe_gt_dbg(pf.gt, "Fault response: Unsuccessful %pe\n",
 				  ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6e5d9ce7c76e..069ede2c7991 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -306,8 +306,19 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
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
@@ -1148,5 +1159,5 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 void xe_svm_flush(struct xe_vm *vm)
 {
 	if (xe_vm_in_fault_mode(vm))
-		flush_work(&vm->svm.garbage_collector.work);
+		__flush_workqueue(vm->xe->usm.pf_wq);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3211827ef6d7..147b900b1f0b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2962,57 +2962,132 @@ static int check_ufence(struct xe_vma *vma)
 	return 0;
 }
 
-static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
+struct prefetch_thread {
+	struct work_struct work;
+	struct drm_gpusvm_ctx *ctx;
+	struct xe_vma *vma;
+	struct xe_svm_range *svm_range;
+	struct xe_tile *tile;
+	u32 region;
+	int err;
+};
+
+static void prefetch_thread_func(struct prefetch_thread *thread)
 {
-	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
-	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	struct xe_vma *vma = thread->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_svm_range *svm_range = thread->svm_range;
+	u32 region = thread->region;
+	struct xe_tile *tile = thread->tile;
 	int err = 0;
 
-	struct xe_svm_range *svm_range;
+	guard(mutex)(&svm_range->lock);
+
+	if (xe_svm_range_is_removed(svm_range)) {
+		thread->err = -ENODATA;
+		return;
+	}
+
+	if (!region) {
+		xe_svm_range_migrate_to_smem(vm, svm_range);
+	} else if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+		err = xe_svm_alloc_vram(tile, svm_range, thread->ctx);
+		if (err) {
+			drm_dbg(&vm->xe->drm,
+				"VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
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
+
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
+{
+	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	u32 region = op->prefetch_range.region;
 	struct drm_gpusvm_ctx ctx = {};
-	struct xe_tile *tile;
+	struct prefetch_thread stack_thread;
+	struct xe_svm_range *svm_range;
+	struct prefetch_thread *prefetches;
+	bool sram = region_to_mem_type[region] == XE_PL_TT;
+	struct xe_tile *tile = sram ? xe_device_get_root_tile(vm->xe) :
+		&vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 	unsigned long i;
-	u32 region;
+	bool devmem_possible = IS_DGFX(vm->xe) &&
+		IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
+	bool skip_threads = op->prefetch_range.ranges_count == 1 || sram ||
+		!(vops->flags & XE_VMA_OPS_FLAG_DOWNGRADE_LOCK);
+	struct prefetch_thread *thread = skip_threads ? &stack_thread : NULL;
+	int err = 0, idx = 0;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
 
-	region = op->prefetch_range.region;
+	if (!skip_threads) {
+		prefetches = kvmalloc_array(op->prefetch_range.ranges_count,
+					    sizeof(*prefetches), GFP_KERNEL);
+		if (!prefetches)
+			return -ENOMEM;
+	}
 
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 
-	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		guard(mutex)(&svm_range->lock);
-
-		if (xe_svm_range_is_removed(svm_range))
-			return -ENODATA;
-
-		if (!region)
-			xe_svm_range_migrate_to_smem(vm, svm_range);
+		if (!skip_threads) {
+			thread = prefetches + idx++;
+			INIT_WORK(&thread->work, prefetch_work_func);
+		}
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
-			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
-			if (err) {
-				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
-					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-				return -ENODATA;
-			}
-			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
+		thread->ctx = &ctx;
+		thread->vma = vma;
+		thread->svm_range = svm_range;
+		thread->tile = tile;
+		thread->region = region;
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
@@ -3079,7 +3154,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 	return err;
 }
 
-static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
+static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm,
+					     struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op;
 	int err;
@@ -3089,7 +3165,7 @@ static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops
 
 	list_for_each_entry(op, &vops->list, link) {
 		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
-			err = prefetch_ranges(vm, op);
+			err = prefetch_ranges(vm, vops, op);
 			if (err)
 				return err;
 		}
-- 
2.34.1

