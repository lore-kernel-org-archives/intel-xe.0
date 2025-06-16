Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24A9C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991EF10E2AF;
	Mon, 16 Jun 2025 06:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RG+wNkyf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EF010E2AF
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750056340; x=1781592340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UTmS0TgRpv+batIr6a1EEMIP2/MJ1eYt1iThV3iRcxY=;
 b=RG+wNkyfS4+sYZc6Lo7YVkPDhjTrfvVq2SqDennrTIsap7DEUW/+NGmb
 QrVBERY2/TwQ0V7Hc4QVotN6afUv7QBcJt1fGwI1JcYq/qYpKfCY4y0rE
 RCQsesby+KkqeUrFqYNvBEx/8k+EZjlf2EIp7/r9JI8Q9/isOXus9dIMf
 4Eq6N/XnyVIXfef43Ql8SWpEIp9PFclSctuILXyRXxteNp+TpKT5C6b4c
 HThBdmpWRYKPr70xvQxx7o4Shdzue2r+fnV6idRVVcauyqO2CePaIufFJ
 zhVRitC+Ve4OkX4MtxLHlqxuxJGam6dhnH7bNrfxPhqxcYFaCU8dMKnxB w==;
X-CSE-ConnectionGUID: JVZ/LaLtTzm6ntxEI6yzHQ==
X-CSE-MsgGUID: LYYRXWAxRIyK76ppy2AEDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="55988865"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="55988865"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:45:38 -0700
X-CSE-ConnectionGUID: 18mKAsZ+S/Oko8k7KDAArw==
X-CSE-MsgGUID: GQYIE2l0TG2vi2jyD0JEaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="152216949"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:45:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH] drm/xe: Thread prefetch of SVM ranges
Date: Sun, 15 Jun 2025 23:47:12 -0700
Message-Id: <20250616064712.2060879-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
that calls migrate_vma_* is now threaded. This uses a dedicated
workqueue, as the page fault workqueue cannot be shared without risking
deadlocks—due to the prefetch IOCTL holding the VM lock in write mode
while work items in the page fault workqueue also require the VM lock.

The prefetch workqueue is currently allocated in GT, similar to the page
fault workqueue. While this is likely not the ideal location for either,
refactoring will be deferred to a later patch.

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

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  31 ++++++-
 drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
 drivers/gpu/drm/xe/xe_vm.c           | 128 +++++++++++++++++++++------
 3 files changed, 135 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e2d975b2fddb..941cca3371f2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -400,6 +400,8 @@ static void pagefault_fini(void *arg)
 
 	destroy_workqueue(gt->usm.acc_wq);
 	destroy_workqueue(gt->usm.pf_wq);
+	if (gt->usm.prefetch_wq)
+		destroy_workqueue(gt->usm.prefetch_wq);
 }
 
 static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
@@ -438,10 +440,24 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 	return 0;
 }
 
+static int prefetch_thread_count(struct xe_device *xe)
+{
+	if (!IS_DGFX(xe))
+		return 0;
+
+	/*
+	 * Based on profiling large aligned 2M prefetches, this is the optimial
+	 * number of threads on BMG (only platform currently supported). This
+	 * should be tuned for each supported platform and can change on per
+	 * platform basis as optimizations land (e.g., large device pages).
+	 */
+	return 5;
+}
+
 int xe_gt_pagefault_init(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
-	int i, ret = 0;
+	int i, count, ret = 0;
 
 	if (!xe->info.has_usm)
 		return 0;
@@ -462,10 +478,23 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
 	if (!gt->usm.pf_wq)
 		return -ENOMEM;
 
+	count = prefetch_thread_count(xe);
+	if (count) {
+		gt->usm.prefetch_wq = alloc_workqueue("xe_gt_prefetch_work_queue",
+						      WQ_UNBOUND | WQ_HIGHPRI,
+						      count);
+		if (!gt->usm.prefetch_wq) {
+			destroy_workqueue(gt->usm.pf_wq);
+			return -ENOMEM;
+		}
+	}
+
 	gt->usm.acc_wq = alloc_workqueue("xe_gt_access_counter_work_queue",
 					 WQ_UNBOUND | WQ_HIGHPRI,
 					 NUM_ACC_QUEUE);
 	if (!gt->usm.acc_wq) {
+		if (gt->usm.prefetch_wq)
+			destroy_workqueue(gt->usm.prefetch_wq);
 		destroy_workqueue(gt->usm.pf_wq);
 		return -ENOMEM;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 7def0959da35..d9ba4921b8ce 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -239,6 +239,8 @@ struct xe_gt {
 		u16 reserved_bcs_instance;
 		/** @usm.pf_wq: page fault work queue, unbound, high priority */
 		struct workqueue_struct *pf_wq;
+		/** @usm.prefetch_wq: prefetch work queue, unbound, high priority */
+		struct workqueue_struct *prefetch_wq;
 		/** @usm.acc_wq: access counter work queue, unbound, high priority */
 		struct workqueue_struct *acc_wq;
 		/**
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6ef8c4dab647..1ae8e03aead6 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2885,52 +2885,130 @@ static int check_ufence(struct xe_vma *vma)
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
+static void prefetch_work_func(struct work_struct *w)
 {
-	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
-	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	struct prefetch_thread *thread =
+		container_of(w, struct prefetch_thread, work);
+	struct xe_vma *vma = thread->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_svm_range *svm_range = thread->svm_range;
+	u32 region = thread->region;
+	struct xe_tile *tile = thread->tile;
 	int err = 0;
 
-	struct xe_svm_range *svm_range;
+	if (!region) {
+		xe_svm_range_migrate_to_smem(vm, svm_range);
+	} else if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
+		err = xe_svm_alloc_vram(vm, tile, svm_range, thread->ctx);
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
+static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	u32 j, region = op->prefetch_range.region;
 	struct drm_gpusvm_ctx ctx = {};
-	struct xe_tile *tile;
+	struct prefetch_thread stack_thread;
+	struct xe_svm_range *svm_range;
+	struct xarray prefetches;
+	bool sram = region_to_mem_type[region] == XE_PL_TT;
+	struct xe_tile *tile = sram ? xe_device_get_root_tile(vm->xe) :
+		&vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
 	unsigned long i;
-	u32 region;
+	bool devmem_possible = IS_DGFX(vm->xe) &&
+		IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
+	bool skip_threads = op->prefetch_range.ranges_count == 1 || sram;
+	struct prefetch_thread *thread = skip_threads ? &stack_thread : NULL;
+	int err = 0;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
 
-	region = op->prefetch_range.region;
+	if (!skip_threads)
+		xa_init_flags(&prefetches, XA_FLAGS_ALLOC);
 
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 
-	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!region)
-			xe_svm_range_migrate_to_smem(vm, svm_range);
+		if (!skip_threads) {
+			thread = kmalloc(sizeof(*thread), GFP_KERNEL);
+			if (!thread)
+				goto wait_threads;
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
-			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
+			err = xa_alloc(&prefetches, &j, thread, xa_limit_32b,
+				       GFP_KERNEL);
 			if (err) {
-				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
-					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-				return -ENODATA;
+				kfree(thread);
+				goto wait_threads;
 			}
-			xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
 		}
 
-		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
-		if (err) {
-			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
-				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
-			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
-				err = -ENODATA;
-			return err;
+		INIT_WORK(&thread->work, prefetch_work_func);
+		thread->ctx = &ctx;
+		thread->vma = vma;
+		thread->svm_range = svm_range;
+		thread->tile = tile;
+		thread->region = region;
+		thread->err = 0;
+
+		if (skip_threads) {
+			prefetch_work_func(&thread->work);
+			if (thread->err)
+				return thread->err;
+		} else {
+			/*
+			 * Prefetch uses a dedicated workqueue, as the page
+			 * fault workqueue cannot be shared without risking
+			 * deadlocks—due to holding the VM lock in write mode
+			 * here while work items in the page fault workqueue
+			 * also require the VM lock.
+			 */
+			queue_work(tile->primary_gt->usm.prefetch_wq,
+				   &thread->work);
+		}
+	}
+
+wait_threads:
+	if (!skip_threads) {
+		xa_for_each(&prefetches, i, thread) {
+			flush_work(&thread->work);
+			if (thread->err && (!err || err == -ENODATA))
+				err = thread->err;
+			kfree(thread);
 		}
-		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES DONE");
+		xa_destroy(&prefetches);
 	}
 
 	return err;
-- 
2.34.1

