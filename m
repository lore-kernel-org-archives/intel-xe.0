Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354BBC54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 06:36:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B038C10F82F;
	Fri,  8 Mar 2024 06:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcuA2JaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7D210F82F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 06:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709879763; x=1741415763;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dgc+ZIaAhiFa2xxZC7IHEcjqlQ2gwLi6aJIBstassPk=;
 b=lcuA2JaSFWvw6JZTKj4oDSlCZSXUbzVAyIbuaWhoJfHntfdiP6qq96zA
 AWZhhNkQk3IWgd6MNZ76T/a61azSd2fUa+TENzsg3zr/e98xdkb1H3xHu
 WS2L4HEcXk6QftKHwhHmxrirT71jREqXAG74kHQfhREsn422nvpp/Ox91
 xDpEbh4ELZ4CQuEFkheKtoQ1hCP3AOjPE9DpFZowlpFaKrndnoRYRM9D0
 AiKi7euYmANjefCD3M5XUMfmkyzXQXlq51Wvjan+EN/QziUMtWRIi1NU0
 gm/ISdwZ86cs3yjQFx2h+mKFjKsS237K/e7osqvqMx64gjNEDLbnFWw0u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15996902"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="15996902"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 22:35:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10367500"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 22:35:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [CI] drm/xe: Refactor VM bind code
Date: Thu,  7 Mar 2024 22:36:14 -0800
Message-Id: <20240308063614.582599-1-matthew.brost@intel.com>
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

Squash of [1], attempt to fix CI failure [2] [3].

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

[1] https://patchwork.freedesktop.org/series/125608/
[2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
[3] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125608v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
---
 drivers/gpu/drm/xe/Makefile                 |    1 +
 drivers/gpu/drm/xe/tests/xe_migrate.c       |   86 --
 drivers/gpu/drm/xe/xe_bo.c                  |    7 +-
 drivers/gpu/drm/xe/xe_bo.h                  |    4 +-
 drivers/gpu/drm/xe/xe_device.c              |   35 +
 drivers/gpu/drm/xe/xe_device.h              |    2 +
 drivers/gpu/drm/xe/xe_device_types.h        |   16 +
 drivers/gpu/drm/xe/xe_exec.c                |   41 +-
 drivers/gpu/drm/xe/xe_exec_queue.c          |  120 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h    |   20 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   10 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   59 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |    3 +
 drivers/gpu/drm/xe/xe_guc_submit.c          |   22 +-
 drivers/gpu/drm/xe/xe_migrate.c             |  385 ++----
 drivers/gpu/drm/xe/xe_migrate.h             |   46 +-
 drivers/gpu/drm/xe/xe_pt.c                  | 1236 ++++++++++++-------
 drivers/gpu/drm/xe/xe_pt.h                  |   15 +-
 drivers/gpu/drm/xe/xe_pt_exec_queue.c       |  180 +++
 drivers/gpu/drm/xe/xe_pt_exec_queue.h       |   14 +
 drivers/gpu/drm/xe/xe_pt_types.h            |   53 +
 drivers/gpu/drm/xe/xe_sched_job.c           |   68 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h     |   31 +-
 drivers/gpu/drm/xe/xe_sync.c                |   15 +
 drivers/gpu/drm/xe/xe_sync.h                |    1 +
 drivers/gpu/drm/xe/xe_trace.h               |   21 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 1124 ++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                  |    9 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  198 +--
 29 files changed, 2118 insertions(+), 1704 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..bf43a3690e13 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -118,6 +118,7 @@ xe-y += xe_bb.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
+	xe_pt_exec_queue.o \
 	xe_pt_walk.o \
 	xe_query.o \
 	xe_range_fence.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index ce531498f57f..de2c1b7ec371 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -62,36 +62,6 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 	return 0;
 }
 
-static void
-sanity_populate_cb(struct xe_migrate_pt_update *pt_update,
-		   struct xe_tile *tile, struct iosys_map *map, void *dst,
-		   u32 qword_ofs, u32 num_qwords,
-		   const struct xe_vm_pgtable_update *update)
-{
-	struct migrate_test_params *p =
-		to_migrate_test_params(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));
-	int i;
-	u64 *ptr = dst;
-	u64 value;
-
-	for (i = 0; i < num_qwords; i++) {
-		value = (qword_ofs + i - update->ofs) * 0x1111111111111111ULL;
-		if (map)
-			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
-				  sizeof(u64), u64, value);
-		else
-			ptr[i] = value;
-	}
-
-	kunit_info(xe_cur_kunit(), "Used %s.\n", map ? "CPU" : "GPU");
-	if (p->force_gpu && map)
-		KUNIT_FAIL(xe_cur_kunit(), "GPU pagetable update used CPU.\n");
-}
-
-static const struct xe_migrate_pt_update_ops sanity_ops = {
-	.populate = sanity_populate_cb,
-};
-
 #define check(_retval, _expected, str, _test)				\
 	do { if ((_retval) != (_expected)) {				\
 			KUNIT_FAIL(_test, "Sanity check failed: " str	\
@@ -209,57 +179,6 @@ static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
 	test_copy(m, bo, test, region);
 }
 
-static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
-			   struct kunit *test, bool force_gpu)
-{
-	struct xe_device *xe = tile_to_xe(m->tile);
-	struct dma_fence *fence;
-	u64 retval, expected;
-	ktime_t then, now;
-	int i;
-
-	struct xe_vm_pgtable_update update = {
-		.ofs = 1,
-		.qwords = 0x10,
-		.pt_bo = pt,
-	};
-	struct xe_migrate_pt_update pt_update = {
-		.ops = &sanity_ops,
-	};
-	struct migrate_test_params p = {
-		.base.id = XE_TEST_LIVE_MIGRATE,
-		.force_gpu = force_gpu,
-	};
-
-	test->priv = &p;
-	/* Test xe_migrate_update_pgtables() updates the pagetable as expected */
-	expected = 0xf0f0f0f0f0f0f0f0ULL;
-	xe_map_memset(xe, &pt->vmap, 0, (u8)expected, pt->size);
-
-	then = ktime_get();
-	fence = xe_migrate_update_pgtables(m, m->q->vm, NULL, m->q, &update, 1,
-					   NULL, 0, &pt_update);
-	now = ktime_get();
-	if (sanity_fence_failed(xe, fence, "Migration pagetable update", test))
-		return;
-
-	kunit_info(test, "Updating without syncing took %llu us,\n",
-		   (unsigned long long)ktime_to_us(ktime_sub(now, then)));
-
-	dma_fence_put(fence);
-	retval = xe_map_rd(xe, &pt->vmap, 0, u64);
-	check(retval, expected, "PTE[0] must stay untouched", test);
-
-	for (i = 0; i < update.qwords; i++) {
-		retval = xe_map_rd(xe, &pt->vmap, (update.ofs + i) * 8, u64);
-		check(retval, i * 0x1111111111111111ULL, "PTE update", test);
-	}
-
-	retval = xe_map_rd(xe, &pt->vmap, 8 * (update.ofs + update.qwords),
-			   u64);
-	check(retval, expected, "PTE[0x11] must stay untouched", test);
-}
-
 static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 {
 	struct xe_tile *tile = m->tile;
@@ -398,11 +317,6 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		test_copy_vram(m, big, test);
 	}
 
-	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
-	test_pt_update(m, pt, test, false);
-	kunit_info(test, "Testing page table update using GPU\n");
-	test_pt_update(m, pt, test, true);
-
 out:
 	xe_bb_free(bb, NULL);
 free_tiny:
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index b89ac6db68a1..7a90d269d4dd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2265,16 +2265,16 @@ void __xe_bo_release_dummy(struct kref *kref)
 
 /**
  * xe_bo_put_commit() - Put bos whose put was deferred by xe_bo_put_deferred().
+ * @xe: Xe device
  * @deferred: The lockless list used for the call to xe_bo_put_deferred().
  *
  * Puts all bos whose put was deferred by xe_bo_put_deferred().
  * The @deferred list can be either an onstack local list or a global
  * shared list used by a workqueue.
  */
-void xe_bo_put_commit(struct llist_head *deferred)
+void xe_bo_put_commit(struct xe_device *xe, struct llist_head *deferred)
 {
 	struct llist_node *freed;
-	struct xe_bo *bo, *next;
 
 	if (!deferred)
 		return;
@@ -2283,8 +2283,7 @@ void xe_bo_put_commit(struct llist_head *deferred)
 	if (!freed)
 		return;
 
-	llist_for_each_entry_safe(bo, next, freed, freed)
-		drm_gem_object_free(&bo->ttm.base.refcount);
+	xe_device_put_deferred(xe, freed);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c59ad15961ce..10b2b14b4c0d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -10,7 +10,6 @@
 
 #include "xe_bo_types.h"
 #include "xe_macros.h"
-#include "xe_vm_types.h"
 #include "xe_vm.h"
 
 /**
@@ -309,10 +308,11 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
 		return false;
 
+	xe_vm_get(bo->vm);
 	return llist_add(&bo->freed, deferred);
 }
 
-void xe_bo_put_commit(struct llist_head *deferred);
+void xe_bo_put_commit(struct xe_device *xe, struct llist_head *deferred);
 
 struct sg_table *xe_bo_sg(struct xe_bo *bo);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 919ad88f0495..80628bdcfd48 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -226,6 +226,9 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	flush_work(&xe->mem.deferred_work);
+	xe_assert(xe, !llist_del_all(&xe->mem.deferred));
+
 	if (xe->ordered_wq)
 		destroy_workqueue(xe->ordered_wq);
 
@@ -235,6 +238,35 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
+void xe_device_put_deferred(struct xe_device *xe, struct llist_node *deferred)
+{
+	struct xe_bo *bo, *next;
+
+	llist_for_each_entry_safe(bo, next, deferred, freed) {
+		init_llist_node(&bo->freed);
+		llist_add(&bo->freed, &xe->mem.deferred);
+	}
+	queue_work(system_wq, &xe->mem.deferred_work);
+}
+
+static void deferred_work(struct work_struct *w)
+{
+	struct xe_device *xe = container_of(w, struct xe_device,
+					    mem.deferred_work);
+	struct llist_node *freed = llist_del_all(&xe->mem.deferred);
+	struct xe_bo *bo, *next;
+
+	if (!freed)
+		return;
+
+	llist_for_each_entry_safe(bo, next, freed, freed) {
+		struct xe_vm *vm = bo->vm;
+
+		drm_gem_object_free(&bo->ttm.base.refcount);
+		xe_vm_put(vm);
+	}
+}
+
 struct xe_device *xe_device_create(struct pci_dev *pdev,
 				   const struct pci_device_id *ent)
 {
@@ -299,6 +331,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err;
 	}
 
+	init_llist_head(&xe->mem.deferred);
+	INIT_WORK(&xe->mem.deferred_work, deferred_work);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 14be34d9f543..74eb9833d4d8 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -176,4 +176,6 @@ void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
 u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
 u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address);
 
+void xe_device_put_deferred(struct xe_device *xe, struct llist_node *deferred);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9785eef2e5a4..e73b9a086718 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -22,6 +22,10 @@
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define TEST_VM_OPS_ERROR
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "soc/intel_pch.h"
 #include "intel_display_core.h"
@@ -315,6 +319,10 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.deferred: deferred list to destroy PT entries */
+		struct llist_head deferred;
+		/** @mem.deferred_work: worker to destroy PT entries */
+		struct work_struct deferred_work;
 	} mem;
 
 	/** @sriov: device level virtualization data */
@@ -455,6 +463,14 @@ struct xe_device {
 	/** @needs_flr_on_fini: requests function-reset on fini */
 	bool needs_flr_on_fini;
 
+#ifdef TEST_VM_OPS_ERROR
+	/**
+	 * @vm_inject_error_position: inject errors at different places in VM
+	 * bind IOCTL based on this value
+	 */
+	u8 vm_inject_error_position;
+#endif
+
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 952496c6260d..64dc412f84a6 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -135,6 +135,10 @@ static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 			return ret;
 	}
 
+	ret = xe_vm_rebind(vm, false);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -152,7 +156,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs = 0, num_ufence = 0;
 	struct xe_sched_job *job;
-	struct dma_fence *rebind_fence;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
 	ktime_t end = 0;
@@ -167,7 +170,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_PT))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
@@ -285,39 +288,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
-	/*
-	 * Rebind any invalidated userptr or evicted BOs in the VM, non-compute
-	 * VM mode only.
-	 */
-	rebind_fence = xe_vm_rebind(vm, false);
-	if (IS_ERR(rebind_fence)) {
-		err = PTR_ERR(rebind_fence);
-		goto err_put_job;
-	}
-
-	/*
-	 * We store the rebind_fence in the VM so subsequent execs don't get
-	 * scheduled before the rebinds of userptrs / evicted BOs is complete.
-	 */
-	if (rebind_fence) {
-		dma_fence_put(vm->rebind_fence);
-		vm->rebind_fence = rebind_fence;
-	}
-	if (vm->rebind_fence) {
-		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-			     &vm->rebind_fence->flags)) {
-			dma_fence_put(vm->rebind_fence);
-			vm->rebind_fence = NULL;
-		} else {
-			dma_fence_get(vm->rebind_fence);
-			err = drm_sched_job_add_dependency(&job->drm,
-							   vm->rebind_fence);
-			if (err)
-				goto err_put_job;
-		}
-	}
-
-	/* Wait behind munmap style rebinds */
+	/* Wait for rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
 							  xe_vm_resv(vm),
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6a83bc57826a..149b6ffcda6e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -19,6 +19,7 @@
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -43,6 +44,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	struct xe_gt *gt = hwe->gt;
 	int err;
 
+	xe_assert(xe, !(flags & EXEC_QUEUE_FLAG_PT));
+
 	/* only kernel queues can be permanent */
 	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
 
@@ -53,6 +56,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	kref_init(&q->refcount);
 	q->flags = flags;
 	q->hwe = hwe;
+	q->xe = xe;
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
@@ -61,7 +65,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->compute.link);
-	INIT_LIST_HEAD(&q->multi_gt_link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -106,7 +109,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_device *xe = q->xe;
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
@@ -127,7 +130,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	 * can perform GuC CT actions when needed. Caller is expected to have
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !q->vm)
 		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
 
 	return 0;
@@ -198,15 +201,8 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
-	struct xe_exec_queue *eq, *next;
 
 	xe_exec_queue_last_fence_put_unlocked(q);
-	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
-		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
-					 multi_gt_link)
-			xe_exec_queue_put(eq);
-	}
-
 	q->ops->fini(q);
 }
 
@@ -216,7 +212,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
+	if (q->gt && !(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !q->vm)
 		xe_device_mem_access_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
@@ -454,35 +450,6 @@ find_hw_engine(struct xe_device *xe,
 			       eci.engine_instance, true);
 }
 
-static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
-					struct drm_xe_engine_class_instance *eci,
-					u16 width, u16 num_placements)
-{
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
-	u32 logical_mask = 0;
-
-	if (XE_IOCTL_DBG(xe, width != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, num_placements != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
-		return 0;
-
-	eci[0].engine_class = DRM_XE_ENGINE_CLASS_COPY;
-
-	for_each_hw_engine(hwe, gt, id) {
-		if (xe_hw_engine_is_reserved(hwe))
-			continue;
-
-		if (hwe->class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
-			logical_mask |= BIT(hwe->logical_instance);
-	}
-
-	return logical_mask;
-}
-
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
@@ -544,7 +511,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
-	struct xe_vm *vm, *migrate_vm;
+	struct xe_vm *vm;
 	struct xe_gt *gt;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
@@ -570,48 +537,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
-		for_each_gt(gt, xe, id) {
-			struct xe_exec_queue *new;
-			u32 flags;
-
-			if (xe_gt_is_media_type(gt))
-				continue;
-
-			eci[0].gt_id = gt->info.id;
-			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
-								    args->width,
-								    args->num_placements);
-			if (XE_IOCTL_DBG(xe, !logical_mask))
-				return -EINVAL;
+		if (XE_IOCTL_DBG(xe, args->extensions))
+			return -EINVAL;
 
-			hwe = find_hw_engine(xe, eci[0]);
-			if (XE_IOCTL_DBG(xe, !hwe))
-				return -EINVAL;
-
-			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
-
-			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
-
-			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
-			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
-						   args->width, hwe, flags,
-						   args->extensions);
-
-			xe_device_mem_access_put(xe); /* now held by engine */
-
-			xe_vm_put(migrate_vm);
-			if (IS_ERR(new)) {
-				err = PTR_ERR(new);
-				if (q)
-					goto put_exec_queue;
-				return err;
-			}
-			if (id == 0)
-				q = new;
-			else
-				list_add_tail(&new->multi_gt_list,
-					      &q->multi_gt_link);
+		xe_device_mem_access_get(xe);
+		q = xe_pt_exec_queue_create(xe);
+		xe_device_mem_access_put(xe); /* now held by exec queue */
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			return err;
 		}
 	} else {
 		gt = xe_device_get_gt(xe, eci[0].gt_id);
@@ -714,8 +648,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
  */
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 {
-	return q->vm && xe_vm_in_lr_mode(q->vm) &&
-		!(q->flags & EXEC_QUEUE_FLAG_VM);
+	return q->vm && xe_vm_in_lr_mode(q->vm);
 }
 
 static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
@@ -753,6 +686,12 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
+	if (q->flags & EXEC_QUEUE_FLAG_PT) {
+		struct dma_fence *fence = q->last_fence ?: dma_fence_get_stub();
+
+		return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
+	}
+
 	if (xe_exec_queue_is_parallel(q)) {
 		int i;
 
@@ -771,16 +710,9 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *eq = q, *next;
-
-	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
-				 multi_gt_link) {
-		q->ops->kill(eq);
-		xe_vm_remove_compute_exec_queue(q->vm, eq);
-	}
-
 	q->ops->kill(q);
-	xe_vm_remove_compute_exec_queue(q->vm, q);
+	if (q->vm)
+		xe_vm_remove_compute_exec_queue(q->vm, q);
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
@@ -812,7 +744,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
+	if (q->flags & EXEC_QUEUE_FLAG_PT)
 		lockdep_assert_held(&vm->lock);
 	else
 		xe_vm_assert_held(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 62b3d9d1d7cd..3a2dcaed561f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -19,6 +19,7 @@ struct xe_execlist_exec_queue;
 struct xe_gt;
 struct xe_guc_exec_queue;
 struct xe_hw_engine;
+struct xe_pt_exec_queue;
 struct xe_vm;
 
 enum xe_exec_queue_priority {
@@ -38,6 +39,8 @@ enum xe_exec_queue_priority {
  * a kernel object.
  */
 struct xe_exec_queue {
+	/** @xe: Xe device */
+	struct xe_device *xe;
 	/** @gt: graphics tile this exec queue can submit to */
 	struct xe_gt *gt;
 	/**
@@ -78,12 +81,10 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
 /* queue keeps running pending jobs after destroy ioctl */
 #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
-/* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(4)
-/* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
+/* for PT jobs. Caller needs to hold rpm ref when creating queue with this flag */
+#define EXEC_QUEUE_FLAG_PT			BIT(4)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(6)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
@@ -91,18 +92,13 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
-	union {
-		/** @multi_gt_list: list head for VM bind engines if multi-GT */
-		struct list_head multi_gt_list;
-		/** @multi_gt_link: link for VM bind engines if multi-GT */
-		struct list_head multi_gt_link;
-	};
-
 	union {
 		/** @execlist: execlist backend specific state for exec queue */
 		struct xe_execlist_exec_queue *execlist;
 		/** @guc: GuC backend specific state for exec queue */
 		struct xe_guc_exec_queue *guc;
+		/** @pt: PT backend specific state for exec queue */
+		struct xe_pt_exec_queue *pt;
 	};
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 73c535193a98..e4f5a80a46fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -19,7 +19,6 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
-#include "xe_pt.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -209,8 +208,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	fence = __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile), NULL, 0,
-				 vma->tile_present & BIT(tile->id));
+	ret = xe_vm_populate_dummy_rebind(vm, vma, BIT(tile->id));
+	if (ret)
+		goto unlock_dma_resv;
+	vm->dummy_ops.vops.pt_update_ops[tile->id].q =
+		xe_tile_migrate_bind_exec_queue(tile);
+	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
+	xe_vma_ops_free(&vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
 		goto unlock_dma_resv;
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index a3c4ffba679d..ac2bf86de39a 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -264,11 +264,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 }
 
 /**
- * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
+ * xe_gt_tlb_invalidation_range - Issue a TLB invalidation on this GT for an
+ * address range
+ *
  * @gt: graphics tile
  * @fence: invalidation fence which will be signal on TLB invalidation
  * completion, can be NULL
- * @vma: VMA to invalidate
+ * @start: start address
+ * @end: end address
+ * @asid: address space id
  *
  * Issue a range based TLB invalidation if supported, if not fallback to a full
  * TLB invalidation. Completion of TLB is asynchronous and caller can either use
@@ -278,17 +282,15 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
  * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
  * negative error code on error.
  */
-int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
-			       struct xe_gt_tlb_invalidation_fence *fence,
-			       struct xe_vma *vma)
+int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
+				 struct xe_gt_tlb_invalidation_fence *fence,
+				 u64 start, u64 end, u32 asid)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 #define MAX_TLB_INVALIDATION_LEN	7
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
 
-	xe_gt_assert(gt, vma);
-
 	/* Execlists not supported */
 	if (gt_to_xe(gt)->info.force_execlist) {
 		if (fence)
@@ -302,8 +304,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	if (!xe->info.has_range_tlb_invalidation) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 start = xe_vma_start(vma);
-		u64 length = xe_vma_size(vma);
+		u64 orig_start = start;
+		u64 length = end - start;
 		u64 align, end;
 
 		if (length < SZ_4K)
@@ -316,12 +318,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 * address mask covering the required range.
 		 */
 		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(xe_vma_start(vma), align);
-		end = ALIGN(xe_vma_end(vma), align);
+		start = ALIGN_DOWN(start, align);
+		end = ALIGN(end, align);
 		length = align;
 		while (start + length < end) {
 			length <<= 1;
-			start = ALIGN_DOWN(xe_vma_start(vma), length);
+			start = ALIGN_DOWN(orig_start, length);
 		}
 
 		/*
@@ -330,16 +332,17 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 */
 		if (length >= SZ_2M) {
 			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(xe_vma_start(vma), length);
+			start = ALIGN_DOWN(orig_start, length);
 		}
 
 		xe_gt_assert(gt, length >= SZ_4K);
 		xe_gt_assert(gt, is_power_of_2(length));
-		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1)));
+		xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M) - 1,
+						    ilog2(SZ_2M) + 1)));
 		xe_gt_assert(gt, IS_ALIGNED(start, length));
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
-		action[len++] = xe_vma_vm(vma)->usm.asid;
+		action[len++] = asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
 		action[len++] = ilog2(length) - ilog2(SZ_4K);
@@ -350,6 +353,32 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
 
+/**
+ * xe_gt_tlb_invalidation_vma - Issue a TLB invalidation on this GT for a VMA
+ * @gt: graphics tile
+ * @fence: invalidation fence which will be signal on TLB invalidation
+ * completion, can be NULL
+ * @vma: VMA to invalidate
+ *
+ * Issue a range based TLB invalidation if supported, if not fallback to a full
+ * TLB invalidation. Completion of TLB is asynchronous and caller can either use
+ * the invalidation fence or seqno + xe_gt_tlb_invalidation_wait to wait for
+ * completion.
+ *
+ * Return: Seqno which can be passed to xe_gt_tlb_invalidation_wait on success,
+ * negative error code on error.
+ */
+int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
+			       struct xe_gt_tlb_invalidation_fence *fence,
+			       struct xe_vma *vma)
+{
+	xe_gt_assert(gt, vma);
+
+	return xe_gt_tlb_invalidation_range(gt, fence, xe_vma_start(vma),
+					    xe_vma_end(vma),
+					    xe_vma_vm(vma)->usm.asid);
+}
+
 /**
  * xe_gt_tlb_invalidation_wait - Wait for TLB to complete
  * @gt: graphics tile
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
index fbb743d80d2c..bf3bebd9f985 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
@@ -20,6 +20,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt);
 int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			       struct xe_gt_tlb_invalidation_fence *fence,
 			       struct xe_vma *vma);
+int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
+				 struct xe_gt_tlb_invalidation_fence *fence,
+				 u64 start, u64 end, u32 asid);
 int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
 int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19efdb2f881f..83dc799589db 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -17,6 +17,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -719,6 +720,11 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	}
 }
 
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return test_bit(JOB_FLAG_PT, &job->fence->flags);
+}
+
 static struct dma_fence *
 guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 {
@@ -728,6 +734,8 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(guc);
 	bool lr = xe_exec_queue_is_lr(q);
 
+	xe_assert(xe, !is_pt_job(job));
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PT));
 	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		  exec_queue_banned(q) || exec_queue_suspended(q));
 
@@ -929,6 +937,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int err = -ETIME;
 	int i = 0;
 
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PT));
+
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled.
@@ -943,8 +953,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		   xe_sched_job_seqno(job), q->guc->id, q->flags);
 	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
 		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-		   "VM job timed out on non-killed execqueue\n");
 
 	simple_error_capture(q);
 	xe_devcoredump(job);
@@ -958,8 +966,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Kernel jobs should never fail, nor should VM jobs if they do
 	 * somethings has gone wrong and the GT needs a reset
 	 */
-	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
+	if (q->flags & EXEC_QUEUE_FLAG_KERNEL) {
 		if (!xe_sched_invalidate_job(job, 2)) {
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
@@ -1439,11 +1446,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	trace_xe_exec_queue_stop(q);
 
 	/*
-	 * Ban any engine (aside from kernel and engines used for VM ops) with a
-	 * started but not complete job or if a job has gone through a GT reset
-	 * more than twice.
+	 * Ban any engine (aside from kernel) with a started but not complete
+	 * job or if a job has gone through a GT reset more than twice.
 	 */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 
 		if (job) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ee1bb938c493..82b63bdb9c47 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -28,6 +28,7 @@
 #include "xe_map.h"
 #include "xe_mocs.h"
 #include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
@@ -41,6 +42,8 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
+	/** @bind_q: Default exec queue used for binds */
+	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -84,19 +87,24 @@ struct xe_migrate {
 #define MAX_PTE_PER_SDI 0x1FE
 
 /**
- * xe_tile_migrate_engine() - Get this tile's migrate engine.
+ * xe_tile_migrate_exec_queue() - Get this tile's migrate exec queue.
  * @tile: The tile.
  *
- * Returns the default migrate engine of this tile.
+ * Returns the default migrate exec queue of this tile.
  * TODO: Perhaps this function is slightly misplaced, and even unneeded?
  *
- * Return: The default migrate engine
+ * Return: The default migrate exec queue
  */
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile)
 {
 	return tile->migrate->q;
 }
 
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile)
+{
+	return tile->migrate->bind_q;
+}
+
 static void xe_migrate_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_migrate *m = arg;
@@ -111,6 +119,8 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	if (m->bind_q)
+		xe_exec_queue_put(m->bind_q);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
@@ -368,6 +378,12 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
+		m->bind_q = xe_pt_exec_queue_create(xe);
+		if (IS_ERR(m->bind_q)) {
+			xe_vm_close_and_put(vm);
+			return ERR_CAST(m->bind_q);
+		}
+
 		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
 					    EXEC_QUEUE_FLAG_KERNEL |
 					    EXEC_QUEUE_FLAG_PERMANENT |
@@ -379,6 +395,8 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 						  EXEC_QUEUE_FLAG_PERMANENT);
 	}
 	if (IS_ERR(m->q)) {
+		if (m->bind_q)
+			xe_exec_queue_put(m->bind_q);
 		xe_vm_close_and_put(vm);
 		return ERR_CAST(m->q);
 	}
@@ -1105,50 +1123,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	return fence;
 }
 
-static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
-			  const struct xe_vm_pgtable_update *update,
-			  struct xe_migrate_pt_update *pt_update)
-{
-	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	u32 chunk;
-	u32 ofs = update->ofs, size = update->qwords;
-
-	/*
-	 * If we have 512 entries (max), we would populate it ourselves,
-	 * and update the PDE above it to the new pointer.
-	 * The only time this can only happen if we have to update the top
-	 * PDE. This requires a BO that is almost vm->size big.
-	 *
-	 * This shouldn't be possible in practice.. might change when 16K
-	 * pages are used. Hence the assert.
-	 */
-	xe_tile_assert(tile, update->qwords < MAX_NUM_PTE);
-	if (!ppgtt_ofs)
-		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
-						xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE));
-
-	do {
-		u64 addr = ppgtt_ofs + ofs * 8;
-
-		chunk = min(size, MAX_PTE_PER_SDI);
-
-		/* Ensure populatefn can do memset64 by aligning bb->cs */
-		if (!(bb->len & 1))
-			bb->cs[bb->len++] = MI_NOOP;
-
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
-		bb->cs[bb->len++] = lower_32_bits(addr);
-		bb->cs[bb->len++] = upper_32_bits(addr);
-		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
-			      update);
-
-		bb->len += chunk * 2;
-		ofs += chunk;
-		size -= chunk;
-	} while (size);
-}
-
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m)
 {
 	return xe_vm_get(m->q->vm);
@@ -1164,289 +1138,152 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
+void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
+				      const struct xe_migrate_pt_update_ops *ops,
+				      struct xe_vm_pgtable_update_op *pt_op,
+				      int num_ops)
+{
+	u32 j, i;
+
+	for (j = 0; j < num_ops; ++j, ++pt_op) {
+		for (i = 0; i < pt_op->num_entries; i++) {
+			const struct xe_vm_pgtable_update *update =
+				&pt_op->entries[i];
+
+			if (pt_op->bind)
+				ops->populate(tile, &update->pt_bo->vmap,
+					      NULL, update->ofs, update->qwords,
+					      update);
+			else
+				ops->clear(vm, tile, &update->pt_bo->vmap,
+					   NULL, update->ofs, update->qwords,
+					   update);
+		}
+	}
+
+	trace_xe_vm_cpu_bind(vm);
+	xe_device_wmb(vm->xe);
+}
+
 static struct dma_fence *
 xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
-			       struct xe_vm *vm, struct xe_bo *bo,
-			       const struct  xe_vm_pgtable_update *updates,
-			       u32 num_updates, bool wait_vm,
 			       struct xe_migrate_pt_update *pt_update)
 {
 	XE_TEST_DECLARE(struct migrate_test_params *test =
 			to_migrate_test_params
 			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	struct dma_fence *fence;
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&pt_update->vops->pt_update_ops[pt_update->tile_id];
 	int err;
-	u32 i;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
 
-	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
-					  DMA_RESV_USAGE_KERNEL))
-		return ERR_PTR(-ETIME);
-
-	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
-					       DMA_RESV_USAGE_BOOKKEEP))
-		return ERR_PTR(-ETIME);
-
 	if (ops->pre_commit) {
 		pt_update->job = NULL;
 		err = ops->pre_commit(pt_update);
 		if (err)
 			return ERR_PTR(err);
 	}
-	for (i = 0; i < num_updates; i++) {
-		const struct xe_vm_pgtable_update *update = &updates[i];
-
-		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
-			      update->ofs, update->qwords, update);
-	}
-
-	if (vm) {
-		trace_xe_vm_cpu_bind(vm);
-		xe_device_wmb(vm->xe);
-	}
-
-	fence = dma_fence_get_stub();
-
-	return fence;
-}
-
-static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
-			struct xe_sync_entry *syncs, u32 num_syncs)
-{
-	struct dma_fence *fence;
-	int i;
-
-	for (i = 0; i < num_syncs; i++) {
-		fence = syncs[i].fence;
 
-		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				       &fence->flags))
-			return false;
-	}
-	if (q) {
-		fence = xe_exec_queue_last_fence_get(q, vm);
-		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
-			dma_fence_put(fence);
-			return false;
-		}
-		dma_fence_put(fence);
-	}
+	__xe_migrate_update_pgtables_cpu(vm, m->tile, ops,
+					 pt_update_ops->ops,
+					 pt_update_ops->num_ops);
 
-	return true;
+	return dma_fence_get_stub();
 }
 
-/**
- * xe_migrate_update_pgtables() - Pipelined page-table update
- * @m: The migrate context.
- * @vm: The vm we'll be updating.
- * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
- * @q: The exec queue to be used for the update or NULL if the default
- * migration engine is to be used.
- * @updates: An array of update descriptors.
- * @num_updates: Number of descriptors in @updates.
- * @syncs: Array of xe_sync_entry to await before updating. Note that waits
- * will block the engine timeline.
- * @num_syncs: Number of entries in @syncs.
- * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
- * pointers to callback functions and, if subclassed, private arguments to
- * those.
- *
- * Perform a pipelined page-table update. The update descriptors are typically
- * built under the same lock critical section as a call to this function. If
- * using the default engine for the updates, they will be performed in the
- * order they grab the job_mutex. If different engines are used, external
- * synchronization is needed for overlapping updates to maintain page-table
- * consistency. Note that the meaing of "overlapping" is that the updates
- * touch the same page-table, which might be a higher-level page-directory.
- * If no pipelining is needed, then updates may be performed by the cpu.
- *
- * Return: A dma_fence that, when signaled, indicates the update completion.
- */
-struct dma_fence *
-xe_migrate_update_pgtables(struct xe_migrate *m,
-			   struct xe_vm *vm,
-			   struct xe_bo *bo,
-			   struct xe_exec_queue *q,
-			   const struct xe_vm_pgtable_update *updates,
-			   u32 num_updates,
-			   struct xe_sync_entry *syncs, u32 num_syncs,
-			   struct xe_migrate_pt_update *pt_update)
+static struct dma_fence *
+__xe_migrate_update_pgtables(struct xe_migrate *m,
+			     struct xe_migrate_pt_update *pt_update,
+			     struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
 	struct xe_tile *tile = m->tile;
-	struct xe_gt *gt = tile->primary_gt;
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	struct drm_suballoc *sa_bo = NULL;
-	struct xe_vma *vma = pt_update->vma;
-	struct xe_bb *bb;
-	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
-	u64 addr;
-	int err = 0;
-	bool usm = !q && xe->info.has_usm;
-	bool first_munmap_rebind = vma &&
-		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
-	struct xe_exec_queue *q_override = !q ? m->q : q;
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
-
-	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
-		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
-							num_updates,
-							first_munmap_rebind,
-							pt_update);
-		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
-			return fence;
-	}
-
-	/* fixed + PTE entries */
-	if (IS_DGFX(xe))
-		batch_size = 2;
-	else
-		batch_size = 6 + num_updates * 2;
-
-	for (i = 0; i < num_updates; i++) {
-		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
-
-		/* align noop + MI_STORE_DATA_IMM cmd prefix */
-		batch_size += 4 * num_cmds + updates[i].qwords * 2;
-	}
-
-	/*
-	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
-	 *
-	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
-	 * Should be reasonably bound..
-	 */
-	xe_tile_assert(tile, batch_size < SZ_128K);
-
-	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
-	if (IS_ERR(bb))
-		return ERR_CAST(bb);
-
-	/* For sysmem PTE's, need to map them in our hole.. */
-	if (!IS_DGFX(xe)) {
-		ppgtt_ofs = NUM_KERNEL_PDE - 1;
-		if (q) {
-			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
-
-			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
-						 GFP_KERNEL, true, 0);
-			if (IS_ERR(sa_bo)) {
-				err = PTR_ERR(sa_bo);
-				goto err;
-			}
-
-			ppgtt_ofs = NUM_KERNEL_PDE +
-				(drm_suballoc_soffset(sa_bo) /
-				 NUM_VMUSA_UNIT_PER_PAGE);
-			page_ofs = (drm_suballoc_soffset(sa_bo) %
-				    NUM_VMUSA_UNIT_PER_PAGE) *
-				VM_SA_UPDATE_UNIT_SIZE;
-		}
-
-		/* Map our PT's to gtt */
-		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
-		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
-		bb->cs[bb->len++] = 0; /* upper_32_bits */
-
-		for (i = 0; i < num_updates; i++) {
-			struct xe_bo *pt_bo = updates[i].pt_bo;
-
-			xe_tile_assert(tile, pt_bo->size == SZ_4K);
-
-			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
-			bb->cs[bb->len++] = lower_32_bits(addr);
-			bb->cs[bb->len++] = upper_32_bits(addr);
-		}
-
-		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-		update_idx = bb->len;
-
-		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
-			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
-		for (i = 0; i < num_updates; i++)
-			write_pgtable(tile, bb, addr + i * XE_PAGE_SIZE,
-				      &updates[i], pt_update);
-	} else {
-		/* phys pages, no preamble required */
-		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-		update_idx = bb->len;
-
-		for (i = 0; i < num_updates; i++)
-			write_pgtable(tile, bb, 0, &updates[i], pt_update);
-	}
+	bool is_migrate = pt_update_ops->q == m->bind_q;
+	int err;
 
-	if (!q)
+	if (is_migrate)
 		mutex_lock(&m->job_mutex);
 
-	job = xe_bb_create_migration_job(q ?: m->q, bb,
-					 xe_migrate_batch_base(m, usm),
-					 update_idx);
+	job = xe_sched_job_create(pt_update_ops->q, NULL);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
 		goto err_bb;
 	}
 
-	/* Wait on BO move */
-	if (bo) {
-		err = job_add_deps(job, bo->ttm.base.resv,
-				   DMA_RESV_USAGE_KERNEL);
-		if (err)
-			goto err_job;
-	}
-
-	/*
-	 * Munmap style VM unbind, need to wait for all jobs to be complete /
-	 * trigger preempts before moving forward
-	 */
-	if (first_munmap_rebind) {
-		err = job_add_deps(job, xe_vm_resv(vm),
-				   DMA_RESV_USAGE_BOOKKEEP);
-		if (err)
-			goto err_job;
-	}
-
-	err = xe_sched_job_last_fence_add_dep(job, vm);
-	for (i = 0; !err && i < num_syncs; i++)
-		err = xe_sync_entry_add_deps(&syncs[i], job);
-
-	if (err)
-		goto err_job;
-
 	if (ops->pre_commit) {
 		pt_update->job = job;
 		err = ops->pre_commit(pt_update);
 		if (err)
 			goto err_job;
 	}
+
+	set_bit(JOB_FLAG_PT, &job->fence->flags);
+	job->pt_update[0].vm = pt_update->vops->vm;
+	job->pt_update[0].tile = tile;
+	job->pt_update[0].ops = ops;
+	job->pt_update[0].pt_op = pt_update_ops->ops;
+	job->pt_update[0].num_ops = pt_update_ops->num_ops;
+	job->pt_update[0].deferred = pt_update_ops->deferred;
+
+	/* Submission backend now owns freeing of pt_update_ops->ops */
+	init_llist_head(&pt_update_ops->deferred);
+	pt_update_ops->skip_free = true;
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
-	if (!q)
+	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 
-	xe_bb_free(bb, fence);
-	drm_suballoc_free(sa_bo, fence);
-
 	return fence;
 
 err_job:
 	xe_sched_job_put(job);
 err_bb:
-	if (!q)
+	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
-	xe_bb_free(bb, NULL);
-err:
-	drm_suballoc_free(sa_bo, NULL);
 	return ERR_PTR(err);
 }
 
+/**
+ * xe_migrate_update_pgtables() - Pipelined page-table update
+ * @m: The migrate context.
+ * @pt_update: PT update arguments
+ *
+ * Perform a pipelined page-table update. The update descriptors are typically
+ * built under the same lock critical section as a call to this function. If
+ * using the default engine for the updates, they will be performed in the
+ * order they grab the job_mutex. If different engines are used, external
+ * synchronization is needed for overlapping updates to maintain page-table
+ * consistency. Note that the meaing of "overlapping" is that the updates
+ * touch the same page-table, which might be a higher-level page-directory.
+ * If no pipelining is needed, then updates may be performed by the cpu.
+ *
+ * Return: A dma_fence that, when signaled, indicates the update completion.
+ */
+struct dma_fence *
+xe_migrate_update_pgtables(struct xe_migrate *m,
+			   struct xe_migrate_pt_update *pt_update)
+
+{
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&pt_update->vops->pt_update_ops[pt_update->tile_id];
+	struct dma_fence *fence;
+
+	fence =  xe_migrate_update_pgtables_cpu(m, pt_update);
+	if (!IS_ERR(fence))
+		return fence;
+
+	return __xe_migrate_update_pgtables(m, pt_update, pt_update_ops);
+}
+
 /**
  * xe_migrate_wait() - Complete all operations using the xe_migrate context
  * @m: Migrate context to wait for.
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 951f19318ea4..701bb27349b0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -22,6 +22,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 /**
@@ -31,7 +32,6 @@ struct xe_vma;
 struct xe_migrate_pt_update_ops {
 	/**
 	 * @populate: Populate a command buffer or page-table with ptes.
-	 * @pt_update: Embeddable callback argument.
 	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
 	 * @pos: If @map is NULL, map into the memory to be populated.
@@ -43,10 +43,27 @@ struct xe_migrate_pt_update_ops {
 	 * page-table system to populate command buffers or shared
 	 * page-tables with PTEs.
 	 */
-	void (*populate)(struct xe_migrate_pt_update *pt_update,
-			 struct xe_tile *tile, struct iosys_map *map,
+	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
 			 void *pos, u32 ofs, u32 num_qwords,
 			 const struct xe_vm_pgtable_update *update);
+	/**
+	 * @clear: Clear a command buffer or page-table with ptes.
+	 * @vm: VM being updated
+	 * @tile: The tile for the current operation.
+	 * @map: struct iosys_map into the memory to be populated.
+	 * @pos: If @map is NULL, map into the memory to be populated.
+	 * @ofs: qword offset into @map, unused if @map is NULL.
+	 * @num_qwords: Number of qwords to write.
+	 * @update: Information about the PTEs to be inserted.
+	 *
+	 * This interface is intended to be used as a callback into the
+	 * page-table system to populate command buffers or shared
+	 * page-tables with PTEs.
+	 */
+	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
+		      struct iosys_map *map, void *pos, u32 ofs,
+		      u32 num_qwords,
+		      const struct xe_vm_pgtable_update *update);
 
 	/**
 	 * @pre_commit: Callback to be called just before arming the
@@ -67,14 +84,10 @@ struct xe_migrate_pt_update_ops {
 struct xe_migrate_pt_update {
 	/** @ops: Pointer to the struct xe_migrate_pt_update_ops callbacks */
 	const struct xe_migrate_pt_update_ops *ops;
-	/** @vma: The vma we're updating the pagetable for. */
-	struct xe_vma *vma;
+	/** @vops: VMA operations */
+	struct xe_vma_ops *vops;
 	/** @job: The job if a GPU page-table update. NULL otherwise */
 	struct xe_sched_job *job;
-	/** @start: Start of update for the range fence */
-	u64 start;
-	/** @last: Last of update for the range fence */
-	u64 last;
 	/** @tile_id: Tile ID of the update */
 	u8 tile_id;
 };
@@ -94,17 +107,18 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
+void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
+				      const struct xe_migrate_pt_update_ops *ops,
+				      struct xe_vm_pgtable_update_op *pt_op,
+				      int num_ops);
+
 struct dma_fence *
 xe_migrate_update_pgtables(struct xe_migrate *m,
-			   struct xe_vm *vm,
-			   struct xe_bo *bo,
-			   struct xe_exec_queue *q,
-			   const struct xe_vm_pgtable_update *updates,
-			   u32 num_updates,
-			   struct xe_sync_entry *syncs, u32 num_syncs,
 			   struct xe_migrate_pt_update *pt_update);
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_exec_queue(struct xe_tile *tile);
+struct xe_exec_queue *xe_tile_migrate_bind_exec_queue(struct xe_tile *tile);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7f54bc3e389d..e0b0f6593ddc 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -8,12 +8,14 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_tlb_invalidation.h"
 #include "xe_migrate.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
+#include "xe_sync.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -324,6 +326,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->pt = parent;
 	entry->flags = 0;
 	entry->qwords = 0;
+	entry->level = parent->level;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_array(XE_PDES,
@@ -791,9 +794,8 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static void
-xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
-		       struct iosys_map *map, void *data,
-		       u32 qword_ofs, u32 num_qwords,
+xe_vm_populate_pgtable(struct xe_tile *tile, struct iosys_map *map,
+		       void *data, u32 qword_ofs, u32 num_qwords,
 		       const struct xe_vm_pgtable_update *update)
 {
 	struct xe_pt_entry *ptes = update->pt_entries;
@@ -809,19 +811,27 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *t
 	}
 }
 
-static void xe_pt_abort_bind(struct xe_vma *vma,
-			     struct xe_vm_pgtable_update *entries,
-			     u32 num_entries)
+static void xe_pt_cancel_bind(struct xe_vma *vma,
+			      struct xe_vm_pgtable_update *entries,
+			      u32 num_entries)
 {
 	u32 i, j;
 
 	for (i = 0; i < num_entries; i++) {
-		if (!entries[i].pt_entries)
+		struct xe_pt *pt = entries[i].pt;
+
+		if (!pt)
 			continue;
 
-		for (j = 0; j < entries[i].qwords; j++)
-			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
+		if (pt->level) {
+			for (j = 0; j < entries[i].qwords; j++)
+				xe_pt_destroy(entries[i].pt_entries[j].pt,
+					      xe_vma_vm(vma)->flags, NULL);
+		}
+
 		kfree(entries[i].pt_entries);
+		entries[i].pt_entries = NULL;
+		entries[i].qwords = 0;
 	}
 }
 
@@ -831,18 +841,15 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 
 	lockdep_assert_held(&vm->lock);
 
-	if (xe_vma_is_userptr(vma))
-		lockdep_assert_held_read(&vm->userptr.notifier_lock);
-	else if (!xe_vma_is_null(vma))
+	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	xe_vm_assert_held(vm);
 }
 
-static void xe_pt_commit_bind(struct xe_vma *vma,
-			      struct xe_vm_pgtable_update *entries,
-			      u32 num_entries, bool rebind,
-			      struct llist_head *deferred)
+static void xe_pt_commit(struct xe_vma *vma,
+			 struct xe_vm_pgtable_update *entries,
+			 u32 num_entries, struct llist_head *deferred)
 {
 	u32 i, j;
 
@@ -850,31 +857,90 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 	for (i = 0; i < num_entries; i++) {
 		struct xe_pt *pt = entries[i].pt;
+
+		if (!pt->level)
+			continue;
+
+		for (j = 0; j < entries[i].qwords; j++) {
+			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
+
+			xe_pt_destroy(oldpte, xe_vma_vm(vma)->flags, deferred);
+		}
+	}
+}
+
+static void xe_pt_abort_bind(struct xe_vma *vma,
+			     struct xe_vm_pgtable_update *entries,
+			     u32 num_entries, bool rebind)
+{
+	int i, j;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (i = num_entries - 1; i >= 0; --i) {
+		struct xe_pt *pt = entries[i].pt;
 		struct xe_pt_dir *pt_dir;
 
 		if (!rebind)
-			pt->num_live += entries[i].qwords;
+			pt->num_live -= entries[i].qwords;
 
-		if (!pt->level) {
-			kfree(entries[i].pt_entries);
+		if (!pt->level)
 			continue;
+
+		pt_dir = as_xe_pt_dir(pt);
+		for (j = 0; j < entries[i].qwords; j++) {
+			u32 j_ = j + entries[i].ofs;
+			struct xe_pt *newpte = xe_pt_entry(pt_dir, j_);
+			struct xe_pt *oldpte = entries[i].pt_entries[j].pt;
+
+			pt_dir->children[j_] = oldpte ? &oldpte->base : 0;
+			xe_pt_destroy(newpte, xe_vma_vm(vma)->flags, NULL);
 		}
+	}
+}
+
+static void xe_pt_commit_prepare_bind(struct xe_vma *vma,
+				      struct xe_vm_pgtable_update *entries,
+				      u32 num_entries, bool rebind)
+{
+	u32 i, j;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (i = 0; i < num_entries; i++) {
+		struct xe_pt *pt = entries[i].pt;
+		struct xe_pt_dir *pt_dir;
+
+		if (!rebind)
+			pt->num_live += entries[i].qwords;
+
+		if (!pt->level)
+			continue;
 
 		pt_dir = as_xe_pt_dir(pt);
 		for (j = 0; j < entries[i].qwords; j++) {
 			u32 j_ = j + entries[i].ofs;
 			struct xe_pt *newpte = entries[i].pt_entries[j].pt;
+			struct xe_pt *oldpte = NULL;
 
 			if (xe_pt_entry(pt_dir, j_))
-				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
-					      xe_vma_vm(vma)->flags, deferred);
+				oldpte = xe_pt_entry(pt_dir, j_);
 
 			pt_dir->children[j_] = &newpte->base;
+			entries[i].pt_entries[j].pt = oldpte;
 		}
-		kfree(entries[i].pt_entries);
 	}
 }
 
+static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
+			    u32 num_entries)
+{
+	u32 i;
+
+	for (i = 0; i < num_entries; i++)
+		kfree(entries[i].pt_entries);
+}
+
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
@@ -885,20 +951,19 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
-	else /* abort! */
-		xe_pt_abort_bind(vma, entries, *num_entries);
 
 	return err;
 }
 
 static void xe_vm_dbg_print_entries(struct xe_device *xe,
 				    const struct xe_vm_pgtable_update *entries,
-				    unsigned int num_entries)
+				    unsigned int num_entries, bool bind)
 #if (IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM))
 {
 	unsigned int i;
 
-	vm_dbg(&xe->drm, "%u entries to update\n", num_entries);
+	vm_dbg(&xe->drm, "%s: %u entries to update\n", bind ? "bind" : "unbind",
+	       num_entries);
 	for (i = 0; i < num_entries; i++) {
 		const struct xe_vm_pgtable_update *entry = &entries[i];
 		struct xe_pt *xe_pt = entry->pt;
@@ -919,66 +984,122 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
 {}
 #endif
 
-#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
+static int job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
+			enum dma_resv_usage usage)
+{
+	return drm_sched_job_add_resv_dependencies(&job->drm, resv, usage);
+}
 
-static int xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
+static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
 {
-	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
-	static u32 count;
+	int i;
 
-	if (count++ % divisor == divisor - 1) {
-		struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+	for (i = 0; i < num_syncs; i++) {
+		struct dma_fence *fence = syncs[i].fence;
 
-		uvma->userptr.divisor = divisor << 1;
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&uvma->userptr.invalidate_link,
-			       &vm->userptr.invalidated);
-		spin_unlock(&vm->userptr.invalidated_lock);
-		return true;
+		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+				       &fence->flags))
+			return false;
 	}
 
-	return false;
+	return true;
 }
 
-#else
-
-static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
+static int vma_add_deps(struct xe_vma *vma, struct xe_sched_job *job)
 {
-	return false;
+	struct xe_bo *bo = xe_vma_bo(vma);
+
+	xe_bo_assert_held(bo);
+
+	if (bo && !bo->vm) {
+		if (!job) {
+			if (!dma_resv_test_signaled(bo->ttm.base.resv,
+						    DMA_RESV_USAGE_KERNEL))
+				return -ETIME;
+		} else {
+			return job_add_deps(job, bo->ttm.base.resv,
+					    DMA_RESV_USAGE_KERNEL);
+		}
+	}
+
+	return 0;
 }
 
-#endif
+static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
+		       struct xe_sched_job *job)
+{
+	int err = 0;
 
-/**
- * struct xe_pt_migrate_pt_update - Callback argument for pre-commit callbacks
- * @base: Base we derive from.
- * @bind: Whether this is a bind or an unbind operation. A bind operation
- *        makes the pre-commit callback error with -EAGAIN if it detects a
- *        pending invalidation.
- * @locked: Whether the pre-commit callback locked the userptr notifier lock
- *          and it needs unlocking.
- */
-struct xe_pt_migrate_pt_update {
-	struct xe_migrate_pt_update base;
-	bool bind;
-	bool locked;
-};
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		err = vma_add_deps(op->map.vma, job);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.prev)
+			err = vma_add_deps(op->remap.prev, job);
+		if (!err && op->remap.next)
+			err = vma_add_deps(op->remap.next, job);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		err = vma_add_deps(gpuva_to_vma(op->base.prefetch.va), job);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+
+	return err;
+}
 
-/*
- * This function adds the needed dependencies to a page-table update job
- * to make sure racing jobs for separate bind engines don't race writing
- * to the same page-table range, wreaking havoc. Initially use a single
- * fence for the entire VM. An optimization would use smaller granularity.
- */
 static int xe_pt_vm_dependencies(struct xe_sched_job *job,
-				 struct xe_range_fence_tree *rftree,
-				 u64 start, u64 last)
+				 struct xe_vm *vm,
+				 struct xe_vma_ops *vops,
+				 struct xe_vm_pgtable_update_ops *pt_update_ops,
+				 struct xe_range_fence_tree *rftree)
 {
 	struct xe_range_fence *rtfence;
 	struct dma_fence *fence;
-	int err;
+	struct xe_vma_op *op;
+	int err = 0, i;
+
+	xe_vm_assert_held(vm);
+
+	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
+		return -ETIME;
+
+	if (!job && !xe_exec_queue_is_idle(pt_update_ops->q))
+		return -ETIME;
 
-	rtfence = xe_range_fence_tree_first(rftree, start, last);
+	if (pt_update_ops->wait_vm_bookkeep) {
+		if (!job) {
+			if (!dma_resv_test_signaled(xe_vm_resv(vm),
+						    DMA_RESV_USAGE_BOOKKEEP))
+				return -ETIME;
+		} else {
+			err = job_add_deps(job, xe_vm_resv(vm),
+					   DMA_RESV_USAGE_BOOKKEEP);
+			if (err)
+				return err;
+		}
+	} else if (pt_update_ops->wait_vm_kernel) {
+		if (!job) {
+			if (!dma_resv_test_signaled(xe_vm_resv(vm),
+						    DMA_RESV_USAGE_KERNEL))
+				return -ETIME;
+		} else {
+			err = job_add_deps(job, xe_vm_resv(vm),
+					   DMA_RESV_USAGE_KERNEL);
+			if (err)
+				return err;
+		}
+	}
+
+	rtfence = xe_range_fence_tree_first(rftree, pt_update_ops->start,
+					    pt_update_ops->last);
 	while (rtfence) {
 		fence = rtfence->fence;
 
@@ -996,88 +1117,146 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 				return err;
 		}
 
-		rtfence = xe_range_fence_tree_next(rtfence, start, last);
+		rtfence = xe_range_fence_tree_next(rtfence,
+						   pt_update_ops->start,
+						   pt_update_ops->last);
 	}
 
-	return 0;
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_add_deps(vm, op, job);
+		if (err)
+			return err;
+	}
+
+	for (i = 0; job && !err && i < vops->num_syncs; i++)
+		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
+
+	return err;
 }
 
 static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
-	struct xe_range_fence_tree *rftree =
-		&xe_vma_vm(pt_update->vma)->rftree[pt_update->tile_id];
+	struct xe_vma_ops *vops = pt_update->vops;
+	struct xe_vm *vm = vops->vm;
+	struct xe_range_fence_tree *rftree = &vm->rftree[pt_update->tile_id];
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[pt_update->tile_id];
+
+	return xe_pt_vm_dependencies(pt_update->job, vm, pt_update->vops,
+				     pt_update_ops, rftree);
+}
+
+#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
+
+static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
+{
+	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
+	static u32 count;
+
+	if (count++ % divisor == divisor - 1) {
+		uvma->userptr.divisor = divisor << 1;
+		return true;
+	}
 
-	return xe_pt_vm_dependencies(pt_update->job, rftree,
-				     pt_update->start, pt_update->last);
+	return false;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+#else
+
+static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
 {
-	struct xe_pt_migrate_pt_update *userptr_update =
-		container_of(pt_update, typeof(*userptr_update), base);
-	struct xe_userptr_vma *uvma = to_userptr_vma(pt_update->vma);
-	unsigned long notifier_seq = uvma->userptr.notifier_seq;
-	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
-	int err = xe_pt_vm_dependencies(pt_update->job,
-					&vm->rftree[pt_update->tile_id],
-					pt_update->start,
-					pt_update->last);
+	return false;
+}
 
-	if (err)
-		return err;
+#endif
 
-	userptr_update->locked = false;
+static void vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma)
+{
+	struct xe_userptr_vma *uvma = to_userptr_vma(vma);
+	unsigned long notifier_seq = uvma->userptr.notifier_seq;
 
-	/*
-	 * Wait until nobody is running the invalidation notifier, and
-	 * since we're exiting the loop holding the notifier lock,
-	 * nobody can proceed invalidating either.
-	 *
-	 * Note that we don't update the vma->userptr.notifier_seq since
-	 * we don't update the userptr pages.
-	 */
-	do {
-		down_read(&vm->userptr.notifier_lock);
-		if (!mmu_interval_read_retry(&uvma->userptr.notifier,
-					     notifier_seq))
-			break;
+	lockdep_assert_held_read(&vm->userptr.notifier_lock);
 
-		up_read(&vm->userptr.notifier_lock);
+	if (uvma->userptr.initial_bind || xe_vm_in_fault_mode(vm))
+		return;
 
-		if (userptr_update->bind)
-			return -EAGAIN;
+	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
+				     notifier_seq) &&
+	    !xe_pt_userptr_inject_eagain(uvma))
+		return;
 
-		notifier_seq = mmu_interval_read_begin(&uvma->userptr.notifier);
-	} while (true);
+	spin_lock(&vm->userptr.invalidated_lock);
+	list_move_tail(&uvma->userptr.invalidate_link,
+		       &vm->userptr.invalidated);
+	spin_unlock(&vm->userptr.invalidated_lock);
 
-	/* Inject errors to test_whether they are handled correctly */
-	if (userptr_update->bind && xe_pt_userptr_inject_eagain(uvma)) {
-		up_read(&vm->userptr.notifier_lock);
-		return -EAGAIN;
+	if (xe_vm_in_preempt_fence_mode(vm)) {
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
+
+		dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
+				    DMA_RESV_USAGE_BOOKKEEP);
+		dma_resv_for_each_fence_unlocked(&cursor, fence)
+			dma_fence_enable_sw_signaling(fence);
+		dma_resv_iter_end(&cursor);
 	}
+}
 
-	userptr_update->locked = true;
+static void op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	lockdep_assert_held_read(&vm->userptr.notifier_lock);
 
-	return 0;
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		vma_check_userptr(vm, op->map.vma);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.prev)
+			vma_check_userptr(vm, op->remap.prev);
+		if (op->remap.next)
+			vma_check_userptr(vm, op->remap.next);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va));
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
 }
 
-static const struct xe_migrate_pt_update_ops bind_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.pre_commit = xe_pt_pre_commit,
-};
+static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_vma_ops *vops = pt_update->vops;
+	struct xe_vma_op *op;
+	int err;
 
-static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.pre_commit = xe_pt_userptr_pre_commit,
-};
+	err = xe_pt_pre_commit(pt_update);
+	if (err)
+		return err;
+
+	down_read(&vm->userptr.notifier_lock);
+
+	list_for_each_entry(op, &vops->list, link)
+		op_check_userptr(vm, op);
+
+	return 0;
+}
 
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
 	struct xe_gt *gt;
-	struct xe_vma *vma;
 	struct dma_fence *fence;
 	struct dma_fence_cb cb;
 	struct work_struct work;
+	u64 start;
+	u64 end;
+	u32 asid;
 };
 
 static const char *
@@ -1105,7 +1284,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
 
 	trace_xe_gt_tlb_invalidation_fence_cb(&ifence->base);
 	if (!ifence->fence->error) {
-		queue_work(system_wq, &ifence->work);
+		queue_work(ifence->gt->ordered_wq, &ifence->work);
 	} else {
 		ifence->base.base.error = ifence->fence->error;
 		dma_fence_signal(&ifence->base.base);
@@ -1120,13 +1299,14 @@ static void invalidation_fence_work_func(struct work_struct *w)
 		container_of(w, struct invalidation_fence, work);
 
 	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
-	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
+	xe_gt_tlb_invalidation_range(ifence->gt, &ifence->base, ifence->start,
+				     ifence->end, ifence->asid);
 }
 
 static int invalidation_fence_init(struct xe_gt *gt,
 				   struct invalidation_fence *ifence,
 				   struct dma_fence *fence,
-				   struct xe_vma *vma)
+				   u64 start, u64 end, u32 asid)
 {
 	int ret;
 
@@ -1144,7 +1324,9 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	dma_fence_get(&ifence->base.base);	/* Ref for caller */
 	ifence->fence = fence;
 	ifence->gt = gt;
-	ifence->vma = vma;
+	ifence->start = start;
+	ifence->end = end;
+	ifence->asid = asid;
 
 	INIT_WORK(&ifence->work, invalidation_fence_work_func);
 	ret = dma_fence_add_callback(fence, &ifence->cb, invalidation_fence_cb);
@@ -1161,178 +1343,6 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	return ret && ret != -ENOENT ? ret : 0;
 }
 
-static void xe_pt_calc_rfence_interval(struct xe_vma *vma,
-				       struct xe_pt_migrate_pt_update *update,
-				       struct xe_vm_pgtable_update *entries,
-				       u32 num_entries)
-{
-	int i, level = 0;
-
-	for (i = 0; i < num_entries; i++) {
-		const struct xe_vm_pgtable_update *entry = &entries[i];
-
-		if (entry->pt->level > level)
-			level = entry->pt->level;
-	}
-
-	/* Greedy (non-optimal) calculation but simple */
-	update->base.start = ALIGN_DOWN(xe_vma_start(vma),
-					0x1ull << xe_pt_shift(level));
-	update->base.last = ALIGN(xe_vma_end(vma),
-				  0x1ull << xe_pt_shift(level)) - 1;
-}
-
-/**
- * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
- * address range.
- * @tile: The tile to bind for.
- * @vma: The vma to bind.
- * @q: The exec_queue with which to do pipelined page-table updates.
- * @syncs: Entries to sync on before binding the built tree to the live vm tree.
- * @num_syncs: Number of @sync entries.
- * @rebind: Whether we're rebinding this vma to the same address range without
- * an unbind in-between.
- *
- * This function builds a page-table tree (see xe_pt_stage_bind() for more
- * information on page-table building), and the xe_vm_pgtable_update entries
- * abstracting the operations needed to attach it to the main vm tree. It
- * then takes the relevant locks and updates the metadata side of the main
- * vm tree and submits the operations for pipelined attachment of the
- * gpu page-table to the vm main tree, (which can be done either by the
- * cpu and the GPU).
- *
- * Return: A valid dma-fence representing the pipelined attachment operation
- * on success, an error pointer on error.
- */
-struct dma_fence *
-__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		 struct xe_sync_entry *syncs, u32 num_syncs,
-		 bool rebind)
-{
-	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
-	struct xe_pt_migrate_pt_update bind_pt_update = {
-		.base = {
-			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
-			.vma = vma,
-			.tile_id = tile->id,
-		},
-		.bind = true,
-	};
-	struct xe_vm *vm = xe_vma_vm(vma);
-	u32 num_entries;
-	struct dma_fence *fence;
-	struct invalidation_fence *ifence = NULL;
-	struct xe_range_fence *rfence;
-	int err;
-
-	bind_pt_update.locked = false;
-	xe_bo_assert_held(xe_vma_bo(vma));
-	xe_vm_assert_held(vm);
-
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
-	       xe_vma_start(vma), xe_vma_end(vma), q);
-
-	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries);
-	if (err)
-		goto err;
-	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-
-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
-	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
-				   num_entries);
-
-	/*
-	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
-	 * cached PTEs point to freed memory. on LR vms this is done
-	 * automatically when the context is re-enabled by the rebind worker,
-	 * or in fault mode it was invalidated on PTE zapping.
-	 *
-	 * If !rebind, and scratch enabled VMs, there is a chance the scratch
-	 * PTE is already cached in the TLB so it needs to be invalidated.
-	 * on !LR VMs this is done in the ring ops preceding a batch, but on
-	 * non-faulting LR, in particular on user-space batch buffer chaining,
-	 * it needs to be done here.
-	 */
-	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
-	    (!rebind && xe_vm_has_scratch(vm) && xe_vm_in_preempt_fence_mode(vm))) {
-		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-		if (!ifence)
-			return ERR_PTR(-ENOMEM);
-	}
-
-	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
-	if (!rfence) {
-		kfree(ifence);
-		return ERR_PTR(-ENOMEM);
-	}
-
-	fence = xe_migrate_update_pgtables(tile->migrate,
-					   vm, xe_vma_bo(vma), q,
-					   entries, num_entries,
-					   syncs, num_syncs,
-					   &bind_pt_update.base);
-	if (!IS_ERR(fence)) {
-		bool last_munmap_rebind = vma->gpuva.flags & XE_VMA_LAST_REBIND;
-		LLIST_HEAD(deferred);
-		int err;
-
-		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
-					    &xe_range_fence_kfree_ops,
-					    bind_pt_update.base.start,
-					    bind_pt_update.base.last, fence);
-		if (err)
-			dma_fence_wait(fence, false);
-
-		/* TLB invalidation must be done before signaling rebind */
-		if (ifence) {
-			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
-							  vma);
-			if (err) {
-				dma_fence_put(fence);
-				kfree(ifence);
-				return ERR_PTR(err);
-			}
-			fence = &ifence->base.base;
-		}
-
-		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
-				   last_munmap_rebind ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
-
-		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
-					   DMA_RESV_USAGE_BOOKKEEP);
-		xe_pt_commit_bind(vma, entries, num_entries, rebind,
-				  bind_pt_update.locked ? &deferred : NULL);
-
-		/* This vma is live (again?) now */
-		vma->tile_present |= BIT(tile->id);
-
-		if (bind_pt_update.locked) {
-			to_userptr_vma(vma)->userptr.initial_bind = true;
-			up_read(&vm->userptr.notifier_lock);
-			xe_bo_put_commit(&deferred);
-		}
-		if (!rebind && last_munmap_rebind &&
-		    xe_vm_in_preempt_fence_mode(vm))
-			xe_vm_queue_rebind_worker(vm);
-	} else {
-		kfree(rfence);
-		kfree(ifence);
-		if (bind_pt_update.locked)
-			up_read(&vm->userptr.notifier_lock);
-		xe_pt_abort_bind(vma, entries, num_entries);
-	}
-
-	return fence;
-
-err:
-	return ERR_PTR(err);
-}
-
 struct xe_pt_stage_unbind_walk {
 	/** @base: The pagewalk base-class. */
 	struct xe_pt_walk base;
@@ -1430,7 +1440,7 @@ xe_pt_stage_unbind_post_descend(struct xe_ptw *parent, pgoff_t offset,
 				     &end_offset))
 		return 0;
 
-	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, false);
+	(void)xe_pt_new_shared(&xe_walk->wupd, xe_child, offset, true);
 	xe_walk->wupd.updates[level].update->qwords = end_offset - offset;
 
 	return 0;
@@ -1478,13 +1488,12 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 }
 
 static void
-xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
-				  struct xe_tile *tile, struct iosys_map *map,
-				  void *ptr, u32 qword_ofs, u32 num_qwords,
+xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
+				  struct iosys_map *map, void *ptr,
+				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	struct xe_vma *vma = pt_update->vma;
-	u64 empty = __xe_pt_empty_pte(tile, xe_vma_vm(vma), update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
 	if (map && map->is_iomem)
@@ -1498,171 +1507,556 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
 		memset64(ptr, empty, num_qwords);
 }
 
+static void xe_pt_abort_unbind(struct xe_vma *vma,
+			       struct xe_vm_pgtable_update *entries,
+			       u32 num_entries)
+{
+	int j, i;
+
+	xe_pt_commit_locks_assert(vma);
+
+	for (j = num_entries - 1; j >= 0; --j) {
+		struct xe_vm_pgtable_update *entry = &entries[j];
+		struct xe_pt *pt = entry->pt;
+		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
+
+		pt->num_live += entry->qwords;
+
+		if (!pt->level)
+			continue;
+
+		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++)
+			pt_dir->children[i] =
+				entries[j].pt_entries[i - entry->ofs].pt ?
+				&entries[j].pt_entries[i - entry->ofs].pt->base : 0;
+	}
+}
+
 static void
-xe_pt_commit_unbind(struct xe_vma *vma,
-		    struct xe_vm_pgtable_update *entries, u32 num_entries,
-		    struct llist_head *deferred)
+xe_pt_commit_prepare_unbind(struct xe_vma *vma,
+			    struct xe_vm_pgtable_update *entries,
+			    u32 num_entries)
 {
-	u32 j;
+	int j, i;
 
 	xe_pt_commit_locks_assert(vma);
 
 	for (j = 0; j < num_entries; ++j) {
 		struct xe_vm_pgtable_update *entry = &entries[j];
 		struct xe_pt *pt = entry->pt;
+		struct xe_pt_dir *pt_dir;
 
 		pt->num_live -= entry->qwords;
-		if (pt->level) {
-			struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
-			u32 i;
+		if (!pt->level)
+			continue;
 
-			for (i = entry->ofs; i < entry->ofs + entry->qwords;
-			     i++) {
-				if (xe_pt_entry(pt_dir, i))
-					xe_pt_destroy(xe_pt_entry(pt_dir, i),
-						      xe_vma_vm(vma)->flags, deferred);
+		pt_dir = as_xe_pt_dir(pt);
+		for (i = entry->ofs; i < entry->ofs + entry->qwords; i++) {
+			if (xe_pt_entry(pt_dir, i))
+				entries[j].pt_entries[i - entry->ofs].pt =
+					xe_pt_entry(pt_dir, i);
+			else
+				entries[j].pt_entries[i - entry->ofs].pt = NULL;
+			pt_dir->children[i] = NULL;
+		}
+	}
+}
 
-				pt_dir->children[i] = NULL;
-			}
+static void
+xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
+				 struct xe_vma *vma)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	int i, level = 0;
+	u64 start, last;
+
+	for (i = 0; i < pt_op->num_entries; i++) {
+		const struct xe_vm_pgtable_update *entry = &pt_op->entries[i];
+
+		if (entry->pt->level > level)
+			level = entry->pt->level;
+	}
+
+	/* Greedy (non-optimal) calculation but simple */
+	start = ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
+	last = ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
+
+	if (start < pt_update_ops->start)
+		pt_update_ops->start = start;
+	if (last > pt_update_ops->last)
+		pt_update_ops->last = last;
+}
+
+static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
+			   struct xe_vm_pgtable_update_ops *pt_update_ops,
+			   struct xe_vma *vma)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	int err;
+
+	xe_bo_assert_held(xe_vma_bo(vma));
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "Preparing bind, with range [%llx...%llx)\n",
+	       xe_vma_start(vma), xe_vma_end(vma) - 1);
+
+	pt_op->vma = NULL;
+	pt_op->bind = true;
+	pt_op->rebind = BIT(tile->id) & vma->tile_present;
+
+	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
+				 &pt_op->num_entries);
+	if (!err) {
+		xe_tile_assert(tile, pt_op->num_entries <=
+			       ARRAY_SIZE(pt_op->entries));
+		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+					pt_op->num_entries, true);
+
+		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+		++pt_update_ops->current_op;
+		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+
+		/*
+		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
+		 * cached PTEs point to freed memory. on LR vms this is done
+		 * automatically when the context is re-enabled by the rebind
+		 * worker, or in fault mode it was invalidated on PTE zapping.
+		 *
+		 * If !rebind, and scratch enabled VMs, there is a chance the
+		 * scratch PTE is already cached in the TLB so it needs to be
+		 * invalidated. on !LR VMs this is done in the ring ops
+		 * preceding a batch, but on non-faulting LR, in particular on
+		 * user-space batch buffer chaining, it needs to be done here.
+		 */
+		pt_update_ops->needs_invalidation |=
+			(pt_op->rebind && xe_vm_in_lr_mode(vm) &&
+			!vm->batch_invalidate_tlb) ||
+			(!pt_op->rebind && vm->scratch_pt[tile->id] &&
+			 xe_vm_in_preempt_fence_mode(vm));
+
+		pt_op->vma = vma;
+		xe_pt_commit_prepare_bind(vma, pt_op->entries,
+					  pt_op->num_entries, pt_op->rebind);
+	} else {
+		xe_pt_cancel_bind(vma, pt_op->entries, pt_op->num_entries);
+	}
+
+	return err;
+}
+
+static int unbind_op_prepare(struct xe_tile *tile,
+			     struct xe_vm_pgtable_update_ops *pt_update_ops,
+			     struct xe_vma *vma)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+
+	xe_bo_assert_held(xe_vma_bo(vma));
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "Preparing unbind, with range [%llx...%llx)\n",
+	       xe_vma_start(vma), xe_vma_end(vma) - 1);
+
+	pt_op->vma = vma;
+	pt_op->bind = false;
+	pt_op->rebind = false;
+
+	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
+
+	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+				pt_op->num_entries, false);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+	++pt_update_ops->current_op;
+	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+	pt_update_ops->needs_invalidation = true;
+
+	xe_pt_commit_prepare_unbind(vma, pt_op->entries, pt_op->num_entries);
+
+	return 0;
+}
+
+static int op_prepare(struct xe_vm *vm,
+		      struct xe_tile *tile,
+		      struct xe_vm_pgtable_update_ops *pt_update_ops,
+		      struct xe_vma_op *op)
+{
+	int err = 0;
+
+	xe_vm_assert_held(vm);
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
+		pt_update_ops->wait_vm_kernel = true;
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		err = unbind_op_prepare(tile, pt_update_ops,
+					gpuva_to_vma(op->base.remap.unmap->va));
+
+		if (!err && op->remap.prev) {
+			err = bind_op_prepare(vm, tile, pt_update_ops,
+					      op->remap.prev);
+			pt_update_ops->wait_vm_bookkeep = true;
+		}
+		if (!err && op->remap.next) {
+			err = bind_op_prepare(vm, tile, pt_update_ops,
+					      op->remap.next);
+			pt_update_ops->wait_vm_bookkeep = true;
+		}
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		err = unbind_op_prepare(tile, pt_update_ops,
+					gpuva_to_vma(op->base.unmap.va));
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		err = bind_op_prepare(vm, tile, pt_update_ops,
+				      gpuva_to_vma(op->base.prefetch.va));
+		pt_update_ops->wait_vm_kernel = true;
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+
+	return err;
+}
+
+static void
+xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
+{
+	init_llist_head(&pt_update_ops->deferred);
+	pt_update_ops->start = ~0x0ull;
+	pt_update_ops->last = 0x0ull;
+}
+
+/**
+ * xe_pt_update_ops_prepare() - Prepare PT update operations
+ * @tile: Tile of PT update operations
+ * @vops: VMA operationa
+ *
+ * Prepare PT update operations which includes updating internal PT state,
+ * allocate memory for page tables, populate page table being pruned in, and
+ * create PT update operations for leaf insertion / removal.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	struct xe_vma_op *op;
+	int err;
+
+	lockdep_assert_held(&vops->vm->lock);
+	xe_vm_assert_held(vops->vm);
+
+	xe_pt_update_ops_init(pt_update_ops);
+
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_prepare(vops->vm, tile, pt_update_ops, op);
+
+		if (err)
+			return err;
+	}
+
+	xe_tile_assert(tile, pt_update_ops->current_op ==
+		       pt_update_ops->num_ops);
+
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
+		return -ENOSPC;
+#endif
+
+	return 0;
+}
+
+static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
+			   struct xe_vm_pgtable_update_ops *pt_update_ops,
+			   struct xe_vma *vma, struct dma_fence *fence)
+{
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+	vma->tile_present |= BIT(tile->id);
+	if (xe_vma_is_userptr(vma)) {
+		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+		to_userptr_vma(vma)->userptr.initial_bind = true;
+	}
+
+	/*
+	 * Kick rebind worker if this bind triggers preempt fences and not in
+	 * the rebind worker
+	 */
+	if (pt_update_ops->wait_vm_bookkeep &&
+	    xe_vm_in_preempt_fence_mode(vm) &&
+	    !current->mm)
+		xe_vm_queue_rebind_worker(vm);
+}
+
+static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
+			     struct xe_vm_pgtable_update_ops *pt_update_ops,
+			     struct xe_vma *vma, struct dma_fence *fence)
+{
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
+				   pt_update_ops->wait_vm_bookkeep ?
+				   DMA_RESV_USAGE_KERNEL :
+				   DMA_RESV_USAGE_BOOKKEEP);
+	vma->tile_present &= ~BIT(tile->id);
+	if (!vma->tile_present) {
+		list_del_init(&vma->combined_links.rebind);
+		if (xe_vma_is_userptr(vma)) {
+			lockdep_assert_held_read(&vm->userptr.notifier_lock);
+
+			spin_lock(&vm->userptr.invalidated_lock);
+			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
+			spin_unlock(&vm->userptr.invalidated_lock);
 		}
 	}
 }
 
-static const struct xe_migrate_pt_update_ops unbind_ops = {
-	.populate = xe_migrate_clear_pgtable_callback,
+static void op_commit(struct xe_vm *vm,
+		      struct xe_tile *tile,
+		      struct xe_vm_pgtable_update_ops *pt_update_ops,
+		      struct xe_vma_op *op, struct dma_fence *fence)
+{
+	xe_vm_assert_held(vm);
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
+
+		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		unbind_op_commit(vm, tile, pt_update_ops,
+				 gpuva_to_vma(op->base.remap.unmap->va), fence);
+
+		if (op->remap.prev)
+			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
+				       fence);
+		if (op->remap.next)
+			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
+				       fence);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		unbind_op_commit(vm, tile, pt_update_ops,
+				 gpuva_to_vma(op->base.unmap.va), fence);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		bind_op_commit(vm, tile, pt_update_ops,
+			       gpuva_to_vma(op->base.prefetch.va), fence);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+}
+
+static const struct xe_migrate_pt_update_ops migrate_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.clear = xe_migrate_clear_pgtable_callback,
 	.pre_commit = xe_pt_pre_commit,
 };
 
-static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
-	.populate = xe_migrate_clear_pgtable_callback,
+static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.clear = xe_migrate_clear_pgtable_callback,
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
 /**
- * __xe_pt_unbind_vma() - Disconnect and free a page-table tree for the vma
- * address range.
- * @tile: The tile to unbind for.
- * @vma: The vma to unbind.
- * @q: The exec_queue with which to do pipelined page-table updates.
- * @syncs: Entries to sync on before disconnecting the tree to be destroyed.
- * @num_syncs: Number of @sync entries.
+ * xe_pt_update_ops_run() - Run PT update operations
+ * @tile: Tile of PT update operations
+ * @vops: VMA operationa
  *
- * This function builds a the xe_vm_pgtable_update entries abstracting the
- * operations needed to detach the page-table tree to be destroyed from the
- * man vm tree.
- * It then takes the relevant locks and submits the operations for
- * pipelined detachment of the gpu page-table from  the vm main tree,
- * (which can be done either by the cpu and the GPU), Finally it frees the
- * detached page-table tree.
+ * Run PT update operations which includes committing internal PT state changes,
+ * creating job for PT update operations for leaf insertion / removal, and
+ * installing job fence in various places.
  *
- * Return: A valid dma-fence representing the pipelined detachment operation
- * on success, an error pointer on error.
+ * Return: fence on success, negative ERR_PTR on error.
  */
 struct dma_fence *
-__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		   struct xe_sync_entry *syncs, u32 num_syncs)
+xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
-	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
-	struct xe_pt_migrate_pt_update unbind_pt_update = {
-		.base = {
-			.ops = xe_vma_is_userptr(vma) ? &userptr_unbind_ops :
-			&unbind_ops,
-			.vma = vma,
-			.tile_id = tile->id,
-		},
-	};
-	struct xe_vm *vm = xe_vma_vm(vma);
-	u32 num_entries;
-	struct dma_fence *fence = NULL;
-	struct invalidation_fence *ifence;
+	struct xe_vm *vm = vops->vm;
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	struct dma_fence *fence;
+	struct invalidation_fence *ifence = NULL;
 	struct xe_range_fence *rfence;
+	struct xe_vma_op *op;
+	int err = 0, i;
+	struct xe_migrate_pt_update update = {
+		.ops = pt_update_ops->needs_userptr_lock ?
+			&userptr_migrate_ops :
+			&migrate_ops,
+		.vops = vops,
+		.tile_id = tile->id
+	};
 
-	LLIST_HEAD(deferred);
-
-	xe_bo_assert_held(xe_vma_bo(vma));
+	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
-	       xe_vma_start(vma), xe_vma_end(vma), q);
-
-	num_entries = xe_pt_stage_unbind(tile, vma, entries);
-	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
-
-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
-	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
-				   num_entries);
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
+		return ERR_PTR(-ENOSPC);
+#endif
 
-	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-	if (!ifence)
-		return ERR_PTR(-ENOMEM);
+	if (pt_update_ops->needs_invalidation) {
+		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+		if (!ifence) {
+			err = -ENOMEM;
+			goto kill_vm_tile1;
+		}
+	}
 
 	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
 	if (!rfence) {
-		kfree(ifence);
-		return ERR_PTR(-ENOMEM);
+		err = -ENOMEM;
+		goto free_ifence;
 	}
 
-	/*
-	 * Even if we were already evicted and unbind to destroy, we need to
-	 * clear again here. The eviction may have updated pagetables at a
-	 * lower level, because it needs to be more conservative.
-	 */
-	fence = xe_migrate_update_pgtables(tile->migrate,
-					   vm, NULL, q ? q :
-					   vm->q[tile->id],
-					   entries, num_entries,
-					   syncs, num_syncs,
-					   &unbind_pt_update.base);
-	if (!IS_ERR(fence)) {
-		int err;
-
-		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
-					    &xe_range_fence_kfree_ops,
-					    unbind_pt_update.base.start,
-					    unbind_pt_update.base.last, fence);
+	/* Point of no return - VM killed if failure after this */
+	for (i = 0; i < pt_update_ops->num_ops; ++i) {
+		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+
+		xe_pt_commit(pt_op->vma, pt_op->entries,
+			     pt_op->num_entries, &pt_update_ops->deferred);
+		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
+	}
+
+	fence = xe_migrate_update_pgtables(tile->migrate, &update);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto kill_vm_tile0;
+	}
+
+	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
+				    &xe_range_fence_kfree_ops,
+				    pt_update_ops->start,
+				    pt_update_ops->last, fence);
+	if (err)
+		dma_fence_wait(fence, false);
+
+	/* tlb invalidation must be done before signaling rebind */
+	if (ifence) {
+		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
+					      pt_update_ops->start,
+					      pt_update_ops->last,
+					      vm->usm.asid);
 		if (err)
-			dma_fence_wait(fence, false);
-
-		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
-		if (err) {
-			dma_fence_put(fence);
-			kfree(ifence);
-			return ERR_PTR(err);
-		}
+			goto put_fence;
 		fence = &ifence->base.base;
+	}
 
-		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(xe_vm_resv(vm), fence,
-				   DMA_RESV_USAGE_BOOKKEEP);
+	dma_resv_add_fence(xe_vm_resv(vm), fence,
+			   pt_update_ops->wait_vm_bookkeep ?
+			   DMA_RESV_USAGE_KERNEL :
+			   DMA_RESV_USAGE_BOOKKEEP);
 
-		/* This fence will be installed by caller when doing eviction */
-		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
-					   DMA_RESV_USAGE_BOOKKEEP);
-		xe_pt_commit_unbind(vma, entries, num_entries,
-				    unbind_pt_update.locked ? &deferred : NULL);
-		vma->tile_present &= ~BIT(tile->id);
-	} else {
-		kfree(rfence);
-		kfree(ifence);
-	}
+	list_for_each_entry(op, &vops->list, link)
+		op_commit(vops->vm, tile, pt_update_ops, op, fence);
 
-	if (!vma->tile_present)
-		list_del_init(&vma->combined_links.rebind);
+	if (pt_update_ops->needs_userptr_lock)
+		up_read(&vm->userptr.notifier_lock);
 
-	if (unbind_pt_update.locked) {
-		xe_tile_assert(tile, xe_vma_is_userptr(vma));
+	return fence;
 
-		if (!vma->tile_present) {
-			spin_lock(&vm->userptr.invalidated_lock);
-			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
-			spin_unlock(&vm->userptr.invalidated_lock);
-		}
+put_fence:
+	if (pt_update_ops->needs_userptr_lock)
 		up_read(&vm->userptr.notifier_lock);
-		xe_bo_put_commit(&deferred);
+	dma_fence_put(fence);
+kill_vm_tile0:
+	if (!tile->id)
+		xe_vm_kill(vops->vm, false);
+	kfree(rfence);
+free_ifence:
+	kfree(ifence);
+kill_vm_tile1:
+	if (tile->id)
+		xe_vm_kill(vops->vm, false);
+
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_pt_update_ops_free() - Free PT update operations
+ * @pt_op: Array of PT update operations
+ * @num_ops: Number of PT update operations
+ *
+ * Free PT update operations
+ */
+void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op, u32 num_ops)
+{
+	u32 i;
+
+	for (i = 0; i < num_ops; ++i, ++pt_op)
+		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
+}
+
+/**
+ * xe_pt_update_ops_fini() - Finish PT update operations
+ * @tile: Tile of PT update operations
+ * @vops: VMA operations
+ *
+ * Finish PT update operations by committing to destroy page table memory
+ */
+void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+
+	lockdep_assert_held(&vops->vm->lock);
+	xe_vm_assert_held(vops->vm);
+
+	xe_bo_put_commit(tile_to_xe(tile), &pt_update_ops->deferred);
+	if (!pt_update_ops->skip_free)
+		xe_pt_update_ops_free(pt_update_ops->ops,
+				      pt_update_ops->num_ops);
+	else
+		pt_update_ops->ops = NULL;
+}
+
+/**
+ * xe_pt_update_ops_abort() - Abort PT update operations
+ * @tile: Tile of PT update operations
+ * @vops: VMA operationa
+ *
+ *  Abort PT update operations by unwinding internal PT state
+ */
+void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	int i;
+
+	lockdep_assert_held(&vops->vm->lock);
+	xe_vm_assert_held(vops->vm);
+
+	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			&pt_update_ops->ops[i];
+
+		if (!pt_op->vma || i >= pt_update_ops->current_op)
+			continue;
+
+		if (pt_op->bind)
+			xe_pt_abort_bind(pt_op->vma, pt_op->entries,
+					 pt_op->num_entries,
+					 pt_op->rebind);
+		else
+			xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
+					   pt_op->num_entries);
 	}
 
-	return fence;
+	xe_pt_update_ops_fini(tile, vops);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 71a4fbfcff43..989c9b190fa0 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -17,6 +17,7 @@ struct xe_sync_entry;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
+struct xe_vma_ops;
 
 /* Largest huge pte is currently 1GiB. May become device dependent. */
 #define MAX_HUGEPTE_LEVEL 2
@@ -34,14 +35,12 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
-struct dma_fence *
-__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		 struct xe_sync_entry *syncs, u32 num_syncs,
-		 bool rebind);
-
-struct dma_fence *
-__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		   struct xe_sync_entry *syncs, u32 num_syncs);
+int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
+struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
+				       struct xe_vma_ops *vops);
+void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
+void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
+void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op, u32 num_ops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_pt_exec_queue.c b/drivers/gpu/drm/xe/xe_pt_exec_queue.c
new file mode 100644
index 000000000000..2a6ae6267594
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_exec_queue.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/gpu_scheduler.h>
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_migrate.h"
+#include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
+#include "xe_sched_job.h"
+#include "xe_trace.h"
+
+/**
+ * struct xe_pt_exec_queue - PT specific state for an xe_exec_queue
+ */
+struct xe_pt_exec_queue {
+	/** @q: Backpointer to parent xe_exec_queue */
+	struct xe_exec_queue *q;
+	/** @sched: GPU scheduler for this xe_exec_queue */
+	struct drm_gpu_scheduler sched;
+	/** @entity: Scheduler entity for this xe_exec_queue */
+	struct drm_sched_entity entity;
+	/** @fini_async: do final fini async from this worker */
+	struct work_struct fini_async;
+};
+
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return test_bit(JOB_FLAG_PT, &job->fence->flags);
+}
+
+static void cleanup_pt_job(struct xe_device *xe, struct xe_sched_job *job)
+{
+	xe_pt_update_ops_free(job->pt_update[0].pt_op,
+			      job->pt_update[0].num_ops);
+	xe_bo_put_commit(xe, &job->pt_update[0].deferred);
+	kfree(job->pt_update[0].pt_op);
+}
+
+static void run_pt_job(struct xe_device *xe, struct xe_sched_job *job)
+{
+	__xe_migrate_update_pgtables_cpu(job->pt_update[0].vm,
+					 job->pt_update[0].tile,
+					 job->pt_update[0].ops,
+					 job->pt_update[0].pt_op,
+					 job->pt_update[0].num_ops);
+	cleanup_pt_job(xe, job);
+}
+
+static struct dma_fence *
+pt_exec_queue_run_job(struct drm_sched_job *drm_job)
+{
+	struct xe_sched_job *job = to_xe_sched_job(drm_job);
+	struct xe_exec_queue *q = job->q;
+	struct xe_device *xe = q->xe;
+
+	xe_assert(xe, is_pt_job(job));
+	xe_assert(xe, q->flags & EXEC_QUEUE_FLAG_PT);
+
+	trace_xe_sched_job_run(job);
+	run_pt_job(xe, job);
+
+	return NULL;
+}
+
+static void pt_exec_queue_free_job(struct drm_sched_job *drm_job)
+{
+	struct xe_sched_job *job = to_xe_sched_job(drm_job);
+
+	trace_xe_sched_job_free(job);
+	xe_sched_job_put(job);
+}
+
+static const struct drm_sched_backend_ops drm_sched_ops = {
+	.run_job = pt_exec_queue_run_job,
+	.free_job = pt_exec_queue_free_job,
+};
+
+static void pt_exec_queue_kill(struct xe_exec_queue *q)
+{
+}
+
+static void __pt_exec_queue_fini_async(struct work_struct *w)
+{
+	struct xe_pt_exec_queue *pe =
+		container_of(w, struct xe_pt_exec_queue, fini_async);
+	struct xe_exec_queue *q = pe->q;
+
+	trace_xe_exec_queue_destroy(q);
+
+	drm_sched_entity_fini(&pe->entity);
+	drm_sched_fini(&pe->sched);
+
+	kfree(pe);
+
+	xe_device_mem_access_put(q->xe);
+	xe_exec_queue_fini(q);
+}
+
+static void pt_exec_queue_fini(struct xe_exec_queue *q)
+{
+	INIT_WORK(&q->pt->fini_async, __pt_exec_queue_fini_async);
+	queue_work(system_wq, &q->pt->fini_async);
+}
+
+static bool pt_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	return false;
+}
+
+static const struct xe_exec_queue_ops pt_exec_queue_ops = {
+	.kill = pt_exec_queue_kill,
+	.fini = pt_exec_queue_fini,
+	.reset_status = pt_exec_queue_reset_status,
+};
+
+struct xe_exec_queue *xe_pt_exec_queue_create(struct xe_device *xe)
+{
+	struct drm_gpu_scheduler *sched;
+	struct xe_exec_queue *q;
+	struct xe_pt_exec_queue *pe;
+	int err;
+
+	q = kzalloc(sizeof(*q), GFP_KERNEL);
+	if (!q)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&q->refcount);
+	q->flags = EXEC_QUEUE_FLAG_PT;
+	q->ops = &pt_exec_queue_ops;
+
+	pe = kzalloc(sizeof(*pe), GFP_KERNEL);
+	if (!pe) {
+		err = -ENOMEM;
+		goto err_free;
+	}
+
+	err = drm_sched_init(&pe->sched, &drm_sched_ops, system_wq, 1, 64, 64,
+			     MAX_SCHEDULE_TIMEOUT, system_wq, NULL,
+			     q->name, xe->drm.dev);
+	if (err)
+		goto err_free;
+
+	sched = &pe->sched;
+	err = drm_sched_entity_init(&pe->entity, 0, &sched, 1, NULL);
+	if (err)
+		goto err_sched;
+
+	q->xe = xe;
+	q->pt = pe;
+	pe->q = q;
+	q->entity = &pe->entity;
+
+	xe_exec_queue_assign_name(q, 0);
+	trace_xe_exec_queue_create(q);
+
+	/*
+	 * Normally the user vm holds an rpm ref to keep the device
+	 * awake, and the context holds a ref for the vm, however for
+	 * some engines we use the kernels migrate vm underneath which offers no
+	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
+	 * can perform GuC CT actions when needed. Caller is expected to have
+	 * already grabbed the rpm ref outside any sensitive locks.
+	 */
+	drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+
+	return q;
+
+err_sched:
+	drm_sched_fini(&pe->sched);
+err_free:
+	kfree(pe);
+	kfree(q);
+
+	return ERR_PTR(err);
+}
diff --git a/drivers/gpu/drm/xe/xe_pt_exec_queue.h b/drivers/gpu/drm/xe/xe_pt_exec_queue.h
new file mode 100644
index 000000000000..a4d16b845418
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_exec_queue.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_PT_EXEC_QUEUE_H_
+#define _XE_PT_EXEC_QUEUE_H_
+
+struct xe_device;
+struct xe_exec_queue;
+
+struct xe_exec_queue *xe_pt_exec_queue_create(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index cee70cb0f014..cfd0d35408a5 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -70,8 +70,61 @@ struct xe_vm_pgtable_update {
 	/** @pt_entries: Newly added pagetable entries */
 	struct xe_pt_entry *pt_entries;
 
+	/** @level: level of update */
+	unsigned int level;
+
 	/** @flags: Target flags */
 	u32 flags;
 };
 
+/** struct xe_vm_pgtable_update_op - Page table update operation */
+struct xe_vm_pgtable_update_op {
+	/** @entries: entries to update for this operation */
+	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
+	/** @vma: VMA for operation, operation not valid if NULL */
+	struct xe_vma *vma;
+	/** @num_entries: number of entries for this update operation */
+	u32 num_entries;
+	/** @bind: is a bind */
+	bool bind;
+	/** @rebind: is a rebind */
+	bool rebind;
+};
+
+/** struct xe_vm_pgtable_update_ops: page table update operations */
+struct xe_vm_pgtable_update_ops {
+	/** @ops: operations */
+	struct xe_vm_pgtable_update_op *ops;
+	/** @deferred: deferred list to destroy PT entries */
+	struct llist_head deferred;
+	/** @q: exec queue for PT operations */
+	struct xe_exec_queue *q;
+	/** @start: start address of ops */
+	u64 start;
+	/** @last: last address of ops */
+	u64 last;
+	/** @num_ops: number of operations */
+	u32 num_ops;
+	/** @current_op: current operations */
+	u32 current_op;
+	/** @needs_userptr_lock: Needs userptr lock */
+	bool needs_userptr_lock;
+	/** @needs_invalidation: Needs invalidation */
+	bool needs_invalidation;
+	/**
+	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
+	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
+	 * behind these operations (install PT operations into VM kernel
+	 * dma-resv slot).
+	 */
+	bool wait_vm_bookkeep;
+	/**
+	 * @wait_vm_kernel: PT operations need to wait until VM kernel dma-resv
+	 * slots are idle.
+	 */
+	bool wait_vm_kernel;
+	/** @skip_free: Free @ops in submission backend rather than in IOCTL */
+	bool skip_free;
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 8151ddafb940..fc24e675f922 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -23,19 +23,22 @@ static struct kmem_cache *xe_sched_job_parallel_slab;
 
 int __init xe_sched_job_module_init(void)
 {
+	struct xe_sched_job *job;
+	size_t size;
+
+	size = struct_size(job, batch_addr, 1);
 	xe_sched_job_slab =
-		kmem_cache_create("xe_sched_job",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(u64), 0,
+		kmem_cache_create("xe_sched_job", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_slab)
 		return -ENOMEM;
 
+	size = max_t(size_t,
+		     struct_size(job, batch_addr,
+				 XE_HW_ENGINE_MAX_INSTANCE),
+		     struct_size(job, pt_update, 1));
 	xe_sched_job_parallel_slab =
-		kmem_cache_create("xe_sched_job_parallel",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(u64) *
-				  XE_HW_ENGINE_MAX_INSTANCE, 0,
+		kmem_cache_create("xe_sched_job_parallel", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_parallel_slab) {
 		kmem_cache_destroy(xe_sched_job_slab);
@@ -62,18 +65,21 @@ bool xe_sched_job_is_migration(struct xe_exec_queue *q)
 	return q->vm && (q->vm->flags & XE_VM_FLAG_MIGRATION);
 }
 
-static void job_free(struct xe_sched_job *job)
+static bool parallel_slab(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *q = job->q;
-	bool is_migration = xe_sched_job_is_migration(q);
+	return !q->width || xe_exec_queue_is_parallel(q) ||
+		xe_sched_job_is_migration(q);
+}
 
-	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
-			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
+static void job_free(struct xe_sched_job *job)
+{
+	kmem_cache_free(parallel_slab(job->q) ? xe_sched_job_parallel_slab :
+			xe_sched_job_slab, job);
 }
 
 static struct xe_device *job_to_xe(struct xe_sched_job *job)
 {
-	return gt_to_xe(job->q->gt);
+	return job->q->xe;
 }
 
 struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
@@ -86,17 +92,19 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	int i, j;
 	u32 width;
 
-	/* only a kernel context can submit a vm-less job */
-	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
+	/* only a kernel and pt exec queue can submit a vm-less job */
+	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL) &&
+		   !(q->flags & EXEC_QUEUE_FLAG_PT));
 
-	/* Migration and kernel engines have their own locking */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	/* Kernel and pt exec queues have their own locking */
+	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL) &&
+	    !(q->flags & EXEC_QUEUE_FLAG_PT)) {
 		lockdep_assert_held(&q->vm->lock);
 		if (!xe_vm_in_lr_mode(q->vm))
 			xe_vm_assert_held(q->vm);
 	}
 
-	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
+	job = job_alloc(parallel_slab(q));
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
@@ -108,7 +116,15 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	if (err)
 		goto err_free;
 
-	if (!xe_exec_queue_is_parallel(q)) {
+	if (!batch_addr) {
+		xe_assert(q->xe, q->flags & EXEC_QUEUE_FLAG_PT);
+
+		job->fence = dma_fence_allocate_private_stub(ktime_get());
+		if (!job->fence) {
+			err = -ENOMEM;
+			goto err_sched_job;
+		}
+	} else if (!xe_exec_queue_is_parallel(q)) {
 		job->fence = xe_lrc_create_seqno_fence(q->lrc);
 		if (IS_ERR(job->fence)) {
 			err = PTR_ERR(job->fence);
@@ -148,12 +164,14 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 		job->fence = &cf->base;
 	}
 
-	width = q->width;
-	if (is_migration)
-		width = 2;
+	if (batch_addr) {
+		width = q->width;
+		if (is_migration)
+			width = 2;
 
-	for (i = 0; i < width; ++i)
-		job->batch_addr[i] = batch_addr[i];
+		for (i = 0; i < width; ++i)
+			job->batch_addr[i] = batch_addr[i];
+	}
 
 	/* All other jobs require a VM to be open which has a ref */
 	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
@@ -282,7 +300,7 @@ struct xe_sched_job_snapshot *
 xe_sched_job_snapshot_capture(struct xe_sched_job *job)
 {
 	struct xe_exec_queue *q = job->q;
-	struct xe_device *xe = q->gt->tile->xe;
+	struct xe_device *xe = job_to_xe(job);
 	struct xe_sched_job_snapshot *snapshot;
 	size_t len = sizeof(*snapshot) + (sizeof(u64) * q->width);
 	u16 i;
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index b1d83da50a53..29ca43d1eb65 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -11,6 +11,28 @@
 #include <drm/gpu_scheduler.h>
 
 struct xe_exec_queue;
+struct xe_migrate_pt_update_ops;
+struct xe_tile;
+struct xe_vm;
+struct xe_vm_pgtable_update_op;
+
+/**
+ * struct pt_update_args - PT update arguments
+ */
+struct pt_update_args {
+	/** @vm: VM */
+	struct xe_vm *vm;
+	/** @tile: Tile */
+	struct xe_tile *tile;
+	/** @ops: Migrate PT update ops */
+	const struct xe_migrate_pt_update_ops *ops;
+	/** @pt_op: PT update ops */
+	struct xe_vm_pgtable_update_op *pt_op;
+	/** @deferred: deferred list to destroy PT entries */
+	struct llist_head deferred;
+	/** @num_ops: number of PT update ops */
+	int num_ops;
+};
 
 /**
  * struct xe_sched_job - XE schedule job (batch buffer tracking)
@@ -27,6 +49,7 @@ struct xe_sched_job {
 	 * can safely reference fence, fence cannot safely reference job.
 	 */
 #define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
+#define JOB_FLAG_PT		(DMA_FENCE_FLAG_USER_BITS << 1)
 	struct dma_fence *fence;
 	/** @user_fence: write back value when BB is complete */
 	struct {
@@ -39,8 +62,12 @@ struct xe_sched_job {
 	} user_fence;
 	/** @migrate_flush_flags: Additional flush flags for migration jobs */
 	u32 migrate_flush_flags;
-	/** @batch_addr: batch buffer address of job */
-	u64 batch_addr[];
+	union {
+		/** @batch_addr: batch buffer address of job */
+		DECLARE_FLEX_ARRAY(u64, batch_addr);
+		/** @pt_update: PT update arguments */
+		DECLARE_FLEX_ARRAY(struct pt_update_args, pt_update);
+	};
 };
 
 struct xe_sched_job_snapshot {
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 02c9577fe418..07aa65d9bcab 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -343,6 +343,21 @@ xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
 	return ERR_PTR(-ENOMEM);
 }
 
+/**
+ * __xe_sync_ufence_get() - Get user fence from user fence
+ * @ufence: input user fence
+ *
+ * Get a user fence reference from user fence
+ *
+ * Return: xe_user_fence pointer with reference
+ */
+struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence)
+{
+	user_fence_get(ufence);
+
+	return ufence;
+}
+
 /**
  * xe_sync_ufence_get() - Get user fence from sync
  * @sync: input sync
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 0fd0d51208e6..26e9ec9de1a8 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -38,6 +38,7 @@ static inline bool xe_sync_is_ufence(struct xe_sync_entry *sync)
 	return !!sync->ufence;
 }
 
+struct xe_user_fence *__xe_sync_ufence_get(struct xe_user_fence *ufence);
 struct xe_user_fence *xe_sync_ufence_get(struct xe_sync_entry *sync);
 void xe_sync_ufence_put(struct xe_user_fence *ufence);
 int xe_sync_ufence_get_status(struct xe_user_fence *ufence);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 4ddc55527f9a..c4704c5f3c72 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -147,8 +147,9 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			   __entry->logical_mask = q->logical_mask;
 			   __entry->gt_id = q->gt->info.id;
 			   __entry->width = q->width;
-			   __entry->guc_id = q->guc->id;
-			   __entry->guc_state = atomic_read(&q->guc->state);
+			   __entry->guc_id = q->guc ? q->guc->id : 0;
+			   __entry->guc_state = q->guc ?
+			   atomic_read(&q->guc->state) : 0;
 			   __entry->flags = q->flags;
 			   ),
 
@@ -264,9 +265,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 
 		    TP_fast_assign(
 			   __entry->seqno = xe_sched_job_seqno(job);
-			   __entry->guc_id = job->q->guc->id;
-			   __entry->guc_state =
-			   atomic_read(&job->q->guc->state);
+			   __entry->guc_id = job->q->guc ? job->q->guc->id : 0;
+			   __entry->guc_state = job->q->guc ?
+			   atomic_read(&job->q->guc->state) : 0;
 			   __entry->flags = job->q->flags;
 			   __entry->error = job->fence->error;
 			   __entry->fence = (unsigned long)job->fence;
@@ -423,11 +424,6 @@ DEFINE_EVENT(xe_vma, xe_vma_acc,
 	     TP_ARGS(vma)
 );
 
-DEFINE_EVENT(xe_vma, xe_vma_fail,
-	     TP_PROTO(struct xe_vma *vma),
-	     TP_ARGS(vma)
-);
-
 DEFINE_EVENT(xe_vma, xe_vma_bind,
 	     TP_PROTO(struct xe_vma *vma),
 	     TP_ARGS(vma)
@@ -541,6 +537,11 @@ DEFINE_EVENT(xe_vm, xe_vm_rebind_worker_exit,
 	     TP_ARGS(vm)
 );
 
+DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
+	     TP_PROTO(struct xe_vm *vm),
+	     TP_ARGS(vm)
+);
+
 /* GuC */
 DECLARE_EVENT_CLASS(xe_guc_ct_flow_control,
 		    TP_PROTO(u32 _head, u32 _tail, u32 size, u32 space, u32 len),
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 643b3701a738..8ba037e7ce5c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace.h"
@@ -413,19 +414,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
-static void xe_vm_kill(struct xe_vm *vm)
+void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 {
 	struct xe_exec_queue *q;
 
 	lockdep_assert_held(&vm->lock);
 
-	xe_vm_lock(vm, false);
+	if (unlocked)
+		xe_vm_lock(vm, false);
+
 	vm->flags |= XE_VM_FLAG_BANNED;
 	trace_xe_vm_kill(vm);
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
 		q->ops->kill(q);
-	xe_vm_unlock(vm);
+
+	if (unlocked)
+		xe_vm_unlock(vm);
 
 	/* TODO: Inform user the VM is banned */
 }
@@ -515,14 +520,19 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	return drm_gpuvm_validate(&vm->gpuvm, exec);
+	err = drm_gpuvm_validate(&vm->gpuvm, exec);
+	if (err)
+		return err;
+
+	err = xe_vm_rebind(vm, true);
+
+	return err;
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
 	struct drm_exec exec;
-	struct dma_fence *rebind_fence;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
 	ktime_t end = 0;
@@ -568,18 +578,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	if (err)
 		goto out_unlock;
 
-	rebind_fence = xe_vm_rebind(vm, true);
-	if (IS_ERR(rebind_fence)) {
-		err = PTR_ERR(rebind_fence);
-		goto out_unlock;
-	}
-
-	if (rebind_fence) {
-		dma_fence_wait(rebind_fence, false);
-		dma_fence_put(rebind_fence);
-	}
-
-	/* Wait on munmap style VM unbinds */
+	/* Wait on rebinds */
 	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
@@ -621,7 +620,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 	if (err) {
 		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
-		xe_vm_kill(vm);
+		xe_vm_kill(vm, true);
 	}
 	up_write(&vm->lock);
 
@@ -751,19 +750,103 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-static struct dma_fence *
-xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
-	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op);
+static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
+			    struct xe_exec_queue *q,
+			    struct xe_sync_entry *syncs, u32 num_syncs)
+{
+	memset(vops, 0, sizeof(*vops));
+	INIT_LIST_HEAD(&vops->list);
+	vops->vm = vm;
+	vops->q = q;
+	vops->syncs = syncs;
+	vops->num_syncs = num_syncs;
+}
+
+static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
+		if (!vops->pt_update_ops[i].num_ops)
+			continue;
+
+		vops->pt_update_ops[i].ops =
+			kmalloc_array(vops->pt_update_ops[i].num_ops,
+				      sizeof(*vops->pt_update_ops[i].ops),
+				      GFP_KERNEL);
+		if (!vops->pt_update_ops[i].ops)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
+void xe_vma_ops_free(struct xe_vma_ops *vops)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		kfree(vops->pt_update_ops[i].ops);
+}
+
+/**
+ * xe_vm_populate_dummy_rebind() - Populate dummy rebind VMA ops
+ * @vm: The VM.
+ * @vma: VMA to populate dummy VMA ops
+ * @tile_mask: tile mask for VMA ops
+ *
+ * Populate dummy VMA ops which can be used to issue a rebind for the VMA
+ *
+ * Return: 0 on success, -ENOMEM on failure
+ */
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
+		if (BIT(i) & tile_mask) {
+			struct xe_vm_pgtable_update_op *pt_op =
+				vm->dummy_ops.vops.pt_update_ops[i].ops;
+
+			memset(&vm->dummy_ops.vops.pt_update_ops[i], 0,
+			       sizeof(vm->dummy_ops.vops.pt_update_ops[i]));
+			vm->dummy_ops.vops.pt_update_ops[i].ops = pt_op;
+			vm->dummy_ops.vops.pt_update_ops[i].num_ops = 1;
+
+			/*
+			 * Wait for VM to be idle / schedule execs + resume
+			 * behind rebinds
+			 */
+			vm->dummy_ops.vops.pt_update_ops[i].wait_vm_bookkeep =
+				true;
+		} else {
+			vm->dummy_ops.vops.pt_update_ops[i].num_ops = 0;
+		}
+	}
+	vm->dummy_ops.op.base.op = DRM_GPUVA_OP_MAP;
+	vm->dummy_ops.op.base.map.va.addr = vma->gpuva.va.addr;
+	vm->dummy_ops.op.base.map.va.range = vma->gpuva.va.range;
+	vm->dummy_ops.op.base.map.gem.obj = vma->gpuva.gem.obj;
+	vm->dummy_ops.op.base.map.gem.offset = vma->gpuva.gem.offset;
+	vm->dummy_ops.op.tile_mask = vma->tile_mask;
+	vm->dummy_ops.op.map.vma = vma;
+	vm->dummy_ops.op.map.immediate = true;
+	vm->dummy_ops.op.map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
+	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
+
+	return xe_vma_ops_alloc(&vm->dummy_ops.vops);
+}
 
-struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
+int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence = NULL;
 	struct xe_vma *vma, *next;
+	int err;
 
 	lockdep_assert_held(&vm->lock);
 	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
-		return NULL;
+		return 0;
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry_safe(vma, next, &vm->rebind_list,
@@ -776,12 +859,19 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_worker(vma);
 		else
 			trace_xe_vma_rebind_exec(vma);
-		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
+
+		err = xe_vm_populate_dummy_rebind(vm, vma, vma->tile_present);
+		if (err)
+			return err;
+
+		fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
+		xe_vma_ops_free(&vm->dummy_ops.vops);
 		if (IS_ERR(fence))
-			return fence;
+			return PTR_ERR(fence);
 	}
 
-	return fence;
+	dma_fence_put(fence);
+	return 0;
 }
 
 static void xe_vma_free(struct xe_vma *vma)
@@ -1285,6 +1375,15 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
+static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
+{
+	int i;
+
+	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
+		if (BIT(i) & tile_mask)
+			++vops->pt_update_ops[i].num_ops;
+}
+
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct drm_gem_object *vm_resv_obj;
@@ -1306,6 +1405,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->lock);
 	mutex_init(&vm->snap_mutex);
 
+	xe_vma_ops_init(&vm->dummy_ops.vops, vm, NULL, NULL, 0);
+	INIT_LIST_HEAD(&vm->dummy_ops.op.link);
+	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
+	for (id = 0; id < XE_MAX_TILES_PER_DEVICE; ++id)
+		vm->dummy_ops.vops.pt_update_ops[id].num_ops = 1;
+
 	INIT_LIST_HEAD(&vm->rebind_list);
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
@@ -1381,32 +1486,20 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			continue;
 
 		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
+		number_tiles++;
 	}
 	dma_resv_unlock(xe_vm_resv(vm));
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
-		for_each_tile(tile, xe, id) {
-			struct xe_gt *gt = tile->primary_gt;
-			struct xe_vm *migrate_vm;
-			struct xe_exec_queue *q;
-			u32 create_flags = EXEC_QUEUE_FLAG_VM;
+		struct xe_exec_queue *q;
 
-			if (!vm->pt_root[id])
-				continue;
-
-			migrate_vm = xe_migrate_get_vm(tile->migrate);
-			q = xe_exec_queue_create_class(xe, gt, migrate_vm,
-						       XE_ENGINE_CLASS_COPY,
-						       create_flags);
-			xe_vm_put(migrate_vm);
-			if (IS_ERR(q)) {
-				err = PTR_ERR(q);
-				goto err_close;
-			}
-			vm->q[id] = q;
-			number_tiles++;
+		q = xe_pt_exec_queue_create(xe);
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			goto err_close;
 		}
+		vm->q = q;
 	}
 
 	if (number_tiles > 1)
@@ -1430,12 +1523,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	return ERR_PTR(err);
 
 err_no_resv:
-	mutex_destroy(&vm->snap_mutex);
+	if (!(flags & XE_VM_FLAG_MIGRATION))
+		xe_device_mem_access_put(xe);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
+	mutex_destroy(&vm->snap_mutex);
 	kfree(vm);
-	if (!(flags & XE_VM_FLAG_MIGRATION))
-		xe_device_mem_access_put(xe);
 	return ERR_PTR(err);
 }
 
@@ -1461,19 +1554,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
-	down_write(&vm->lock);
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id])
-			xe_exec_queue_last_fence_put(vm->q[id], vm);
-	}
-	up_write(&vm->lock);
+	if (vm->q) {
+		down_write(&vm->lock);
+		xe_exec_queue_last_fence_put(vm->q, vm);
+		up_write(&vm->lock);
 
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id]) {
-			xe_exec_queue_kill(vm->q[id]);
-			xe_exec_queue_put(vm->q[id]);
-			vm->q[id] = NULL;
-		}
+		xe_exec_queue_kill(vm->q);
+		xe_exec_queue_put(vm->q);
 	}
 
 	down_write(&vm->lock);
@@ -1572,7 +1659,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
-	dma_fence_put(vm->rebind_fence);
 	kfree(vm);
 }
 
@@ -1606,168 +1692,7 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 static struct xe_exec_queue *
 to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	return q ? q : vm->q[0];
-}
-
-static struct dma_fence *
-xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
-		 struct xe_sync_entry *syncs, u32 num_syncs,
-		 bool first_op, bool last_op)
-{
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-	struct xe_tile *tile;
-	struct dma_fence *fence = NULL;
-	struct dma_fence **fences = NULL;
-	struct dma_fence_array *cf = NULL;
-	int cur_fence = 0, i;
-	int number_tiles = hweight8(vma->tile_present);
-	int err;
-	u8 id;
-
-	trace_xe_vma_unbind(vma);
-
-	if (vma->ufence) {
-		struct xe_user_fence * const f = vma->ufence;
-
-		if (!xe_sync_ufence_get_status(f))
-			return ERR_PTR(-EBUSY);
-
-		vma->ufence = NULL;
-		xe_sync_ufence_put(f);
-	}
-
-	if (number_tiles > 1) {
-		fences = kmalloc_array(number_tiles, sizeof(*fences),
-				       GFP_KERNEL);
-		if (!fences)
-			return ERR_PTR(-ENOMEM);
-	}
-
-	for_each_tile(tile, vm->xe, id) {
-		if (!(vma->tile_present & BIT(id)))
-			goto next;
-
-		fence = __xe_pt_unbind_vma(tile, vma, q ? q : vm->q[id],
-					   first_op ? syncs : NULL,
-					   first_op ? num_syncs : 0);
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			goto err_fences;
-		}
-
-		if (fences)
-			fences[cur_fence++] = fence;
-
-next:
-		if (q && vm->pt_root[id] && !list_empty(&q->multi_gt_list))
-			q = list_next_entry(q, multi_gt_list);
-	}
-
-	if (fences) {
-		cf = dma_fence_array_create(number_tiles, fences,
-					    vm->composite_fence_ctx,
-					    vm->composite_fence_seqno++,
-					    false);
-		if (!cf) {
-			--vm->composite_fence_seqno;
-			err = -ENOMEM;
-			goto err_fences;
-		}
-	}
-
-	fence = cf ? &cf->base : !fence ?
-		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL, fence);
-	}
-
-	return fence;
-
-err_fences:
-	if (fences) {
-		while (cur_fence)
-			dma_fence_put(fences[--cur_fence]);
-		kfree(fences);
-	}
-
-	return ERR_PTR(err);
-}
-
-static struct dma_fence *
-xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
-	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op)
-{
-	struct xe_tile *tile;
-	struct dma_fence *fence;
-	struct dma_fence **fences = NULL;
-	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = xe_vma_vm(vma);
-	int cur_fence = 0, i;
-	int number_tiles = hweight8(vma->tile_mask);
-	int err;
-	u8 id;
-
-	trace_xe_vma_bind(vma);
-
-	if (number_tiles > 1) {
-		fences = kmalloc_array(number_tiles, sizeof(*fences),
-				       GFP_KERNEL);
-		if (!fences)
-			return ERR_PTR(-ENOMEM);
-	}
-
-	for_each_tile(tile, vm->xe, id) {
-		if (!(vma->tile_mask & BIT(id)))
-			goto next;
-
-		fence = __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
-					 first_op ? syncs : NULL,
-					 first_op ? num_syncs : 0,
-					 vma->tile_present & BIT(id));
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			goto err_fences;
-		}
-
-		if (fences)
-			fences[cur_fence++] = fence;
-
-next:
-		if (q && vm->pt_root[id] && !list_empty(&q->multi_gt_list))
-			q = list_next_entry(q, multi_gt_list);
-	}
-
-	if (fences) {
-		cf = dma_fence_array_create(number_tiles, fences,
-					    vm->composite_fence_ctx,
-					    vm->composite_fence_seqno++,
-					    false);
-		if (!cf) {
-			--vm->composite_fence_seqno;
-			err = -ENOMEM;
-			goto err_fences;
-		}
-	}
-
-	if (last_op) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL,
-					     cf ? &cf->base : fence);
-	}
-
-	return cf ? &cf->base : fence;
-
-err_fences:
-	if (fences) {
-		while (cur_fence)
-			dma_fence_put(fences[--cur_fence]);
-		kfree(fences);
-	}
-
-	return ERR_PTR(err);
+	return q ? q : vm->q;
 }
 
 static struct xe_user_fence *
@@ -1785,89 +1710,6 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 	return NULL;
 }
 
-static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-			u32 num_syncs, bool immediate, bool first_op,
-			bool last_op)
-{
-	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-	struct xe_user_fence *ufence;
-
-	xe_vm_assert_held(vm);
-
-	ufence = find_ufence_get(syncs, num_syncs);
-	if (vma->ufence && ufence)
-		xe_sync_ufence_put(vma->ufence);
-
-	vma->ufence = ufence ?: vma->ufence;
-
-	if (immediate) {
-		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
-				       last_op);
-		if (IS_ERR(fence))
-			return PTR_ERR(fence);
-	} else {
-		int i;
-
-		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
-
-		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-		if (last_op) {
-			for (i = 0; i < num_syncs; i++)
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
-		}
-	}
-
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	dma_fence_put(fence);
-
-	return 0;
-}
-
-static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
-		      struct xe_bo *bo, struct xe_sync_entry *syncs,
-		      u32 num_syncs, bool immediate, bool first_op,
-		      bool last_op)
-{
-	int err;
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(bo);
-
-	if (bo && immediate) {
-		err = xe_bo_validate(bo, vm, true);
-		if (err)
-			return err;
-	}
-
-	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
-			    last_op);
-}
-
-static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-			u32 num_syncs, bool first_op, bool last_op)
-{
-	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(xe_vma_bo(vma));
-
-	fence = xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op, last_op);
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
-
-	xe_vma_destroy(vma, fence);
-	if (last_op)
-		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	dma_fence_put(fence);
-
-	return 0;
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
 				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
@@ -2008,43 +1850,6 @@ static const u32 region_to_mem_type[] = {
 	XE_PL_VRAM1,
 };
 
-static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
-			  struct xe_exec_queue *q, u32 region,
-			  struct xe_sync_entry *syncs, u32 num_syncs,
-			  bool first_op, bool last_op)
-{
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-	int err;
-
-	xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
-
-	if (!xe_vma_has_no_bo(vma)) {
-		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
-		if (err)
-			return err;
-	}
-
-	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
-		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
-				  true, first_op, last_op);
-	} else {
-		int i;
-
-		/* Nothing to do, signal fences now */
-		if (last_op) {
-			for (i = 0; i < num_syncs; i++) {
-				struct dma_fence *fence =
-					xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-
-				xe_sync_entry_signal(&syncs[i], NULL, fence);
-				dma_fence_put(fence);
-			}
-		}
-
-		return 0;
-	}
-}
-
 static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 			     bool post_commit)
 {
@@ -2168,6 +1973,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
 		if (__op->op == DRM_GPUVA_OP_MAP) {
+			op->map.immediate = !xe_vm_in_fault_mode(vm);
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
@@ -2329,35 +2135,30 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 	return err;
 }
 
-
 static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct drm_gpuva_ops *ops,
 				   struct xe_sync_entry *syncs, u32 num_syncs,
-				   struct list_head *ops_list, bool last)
+				   struct xe_vma_ops *vops, bool last)
 {
 	struct xe_device *xe = vm->xe;
-	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
+	struct xe_tile *tile;
+	u8 id, tile_mask = 0;
 	int err = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
+	for_each_tile(tile, vm->xe, id)
+		tile_mask |= 0x1 << id;
+
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 		struct xe_vma *vma;
-		bool first = list_empty(ops_list);
 		unsigned int flags = 0;
 
 		INIT_LIST_HEAD(&op->link);
-		list_add_tail(&op->link, ops_list);
-
-		if (first) {
-			op->flags |= XE_VMA_OP_FIRST;
-			op->num_syncs = num_syncs;
-			op->syncs = syncs;
-		}
-
-		op->q = q;
+		list_add_tail(&op->link, &vops->list);
+		op->tile_mask = tile_mask;
 
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
@@ -2373,6 +2174,9 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
+			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+				xe_vma_ops_incr_pt_update_ops(vops,
+							      op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP:
@@ -2417,6 +2221,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					vm_dbg(&xe->drm, "REMAP:SKIP_PREV: addr=0x%016llx, range=0x%016llx",
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
 
@@ -2453,228 +2259,30 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 					vm_dbg(&xe->drm, "REMAP:SKIP_NEXT: addr=0x%016llx, range=0x%016llx",
 					       (ULL)op->remap.start,
 					       (ULL)op->remap.range);
+				} else {
+					xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 				}
 			}
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		}
 		case DRM_GPUVA_OP_UNMAP:
 		case DRM_GPUVA_OP_PREFETCH:
-			/* Nothing to do */
+			/* FIXME: Need to skip some prefetch ops */
+			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
 			break;
 		default:
 			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 		}
 
-		last_op = op;
-
 		err = xe_vma_op_commit(vm, op);
 		if (err)
 			return err;
 	}
 
-	/* FIXME: Unhandled corner case */
-	XE_WARN_ON(!last_op && last && !list_empty(ops_list));
-
-	if (!last_op)
-		return 0;
-
-	last_op->ops = ops;
-	if (last) {
-		last_op->flags |= XE_VMA_OP_LAST;
-		last_op->num_syncs = num_syncs;
-		last_op->syncs = syncs;
-	}
-
 	return 0;
 }
 
-static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
-		      struct xe_vma *vma, struct xe_vma_op *op)
-{
-	int err;
-
-	lockdep_assert_held_write(&vm->lock);
-
-	err = xe_vm_prepare_vma(exec, vma, 1);
-	if (err)
-		return err;
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(xe_vma_bo(vma));
-
-	switch (op->base.op) {
-	case DRM_GPUVA_OP_MAP:
-		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
-				 op->syncs, op->num_syncs,
-				 !xe_vm_in_fault_mode(vm),
-				 op->flags & XE_VMA_OP_FIRST,
-				 op->flags & XE_VMA_OP_LAST);
-		break;
-	case DRM_GPUVA_OP_REMAP:
-	{
-		bool prev = !!op->remap.prev;
-		bool next = !!op->remap.next;
-
-		if (!op->remap.unmap_done) {
-			if (prev || next)
-				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
-			err = xe_vm_unbind(vm, vma, op->q, op->syncs,
-					   op->num_syncs,
-					   op->flags & XE_VMA_OP_FIRST,
-					   op->flags & XE_VMA_OP_LAST &&
-					   !prev && !next);
-			if (err)
-				break;
-			op->remap.unmap_done = true;
-		}
-
-		if (prev) {
-			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
-			err = xe_vm_bind(vm, op->remap.prev, op->q,
-					 xe_vma_bo(op->remap.prev), op->syncs,
-					 op->num_syncs, true, false,
-					 op->flags & XE_VMA_OP_LAST && !next);
-			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (err)
-				break;
-			op->remap.prev = NULL;
-		}
-
-		if (next) {
-			op->remap.next->gpuva.flags |= XE_VMA_LAST_REBIND;
-			err = xe_vm_bind(vm, op->remap.next, op->q,
-					 xe_vma_bo(op->remap.next),
-					 op->syncs, op->num_syncs,
-					 true, false,
-					 op->flags & XE_VMA_OP_LAST);
-			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (err)
-				break;
-			op->remap.next = NULL;
-		}
-
-		break;
-	}
-	case DRM_GPUVA_OP_UNMAP:
-		err = xe_vm_unbind(vm, vma, op->q, op->syncs,
-				   op->num_syncs, op->flags & XE_VMA_OP_FIRST,
-				   op->flags & XE_VMA_OP_LAST);
-		break;
-	case DRM_GPUVA_OP_PREFETCH:
-		err = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
-				     op->syncs, op->num_syncs,
-				     op->flags & XE_VMA_OP_FIRST,
-				     op->flags & XE_VMA_OP_LAST);
-		break;
-	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-	}
-
-	if (err)
-		trace_xe_vma_fail(vma);
-
-	return err;
-}
-
-static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
-			       struct xe_vma_op *op)
-{
-	struct drm_exec exec;
-	int err;
-
-retry_userptr:
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec) {
-		err = op_execute(&exec, vm, vma, op);
-		drm_exec_retry_on_contention(&exec);
-		if (err)
-			break;
-	}
-	drm_exec_fini(&exec);
-
-	if (err == -EAGAIN) {
-		lockdep_assert_held_write(&vm->lock);
-
-		if (op->base.op == DRM_GPUVA_OP_REMAP) {
-			if (!op->remap.unmap_done)
-				vma = gpuva_to_vma(op->base.remap.unmap->va);
-			else if (op->remap.prev)
-				vma = op->remap.prev;
-			else
-				vma = op->remap.next;
-		}
-
-		if (xe_vma_is_userptr(vma)) {
-			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
-			if (!err)
-				goto retry_userptr;
-
-			trace_xe_vma_fail(vma);
-		}
-	}
-
-	return err;
-}
-
-static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
-{
-	int ret = 0;
-
-	lockdep_assert_held_write(&vm->lock);
-
-	switch (op->base.op) {
-	case DRM_GPUVA_OP_MAP:
-		ret = __xe_vma_op_execute(vm, op->map.vma, op);
-		break;
-	case DRM_GPUVA_OP_REMAP:
-	{
-		struct xe_vma *vma;
-
-		if (!op->remap.unmap_done)
-			vma = gpuva_to_vma(op->base.remap.unmap->va);
-		else if (op->remap.prev)
-			vma = op->remap.prev;
-		else
-			vma = op->remap.next;
-
-		ret = __xe_vma_op_execute(vm, vma, op);
-		break;
-	}
-	case DRM_GPUVA_OP_UNMAP:
-		ret = __xe_vma_op_execute(vm, gpuva_to_vma(op->base.unmap.va),
-					  op);
-		break;
-	case DRM_GPUVA_OP_PREFETCH:
-		ret = __xe_vma_op_execute(vm,
-					  gpuva_to_vma(op->base.prefetch.va),
-					  op);
-		break;
-	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-	}
-
-	return ret;
-}
-
-static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
-{
-	bool last = op->flags & XE_VMA_OP_LAST;
-
-	if (last) {
-		while (op->num_syncs--)
-			xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
-		kfree(op->syncs);
-		if (op->q)
-			xe_exec_queue_put(op->q);
-	}
-	if (!list_empty(&op->link))
-		list_del(&op->link);
-	if (op->ops)
-		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
-	if (last)
-		xe_vm_put(vm);
-}
-
 static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
@@ -2751,38 +2359,354 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 					 op->flags & XE_VMA_OP_PREV_COMMITTED,
 					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 		}
+	}
+}
+
+static int vma_lock(struct drm_exec *exec, struct xe_vma *vma, bool validate)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	int err = 0;
+
+	if (bo) {
+		if (!bo->vm)
+			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
+		if (!err && validate)
+			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+	}
+
+	return err;
+}
+
+static int check_ufence(struct xe_vma *vma)
+{
+	if (vma->ufence) {
+		struct xe_user_fence * const f = vma->ufence;
+
+		if (!xe_sync_ufence_get_status(f))
+			return -EBUSY;
+
+		vma->ufence = NULL;
+		xe_sync_ufence_put(f);
+	}
+
+	return 0;
+}
+
+static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
+		   struct xe_vma_op *op)
+{
+	int err = 0;
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		err = vma_lock(exec, op->map.vma, !xe_vm_in_fault_mode(vm));
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
+		if (err)
+			break;
+
+		err = vma_lock(exec, gpuva_to_vma(op->base.remap.unmap->va),
+			       false);
+		if (!err && op->remap.prev)
+			err = vma_lock(exec, op->remap.prev, true);
+		if (!err && op->remap.next)
+			err = vma_lock(exec, op->remap.next, true);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
+		if (err)
+			break;
+
+		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+		u32 region = op->prefetch.region;
+
+		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+
+		err = vma_lock(exec, vma, false);
+		if (!err && !xe_vma_has_no_bo(vma))
+			err = xe_bo_migrate(xe_vma_bo(vma), region);
+		break;
+	}
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+
+	return err;
+}
+
+static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
+				  struct xe_vm *vm,
+				  struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+	int err;
+
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
+	if (err)
+		return err;
+
+	list_for_each_entry(op, &vops->list, link) {
+		err = op_lock(exec, vm, op);
+		if (err)
+			return err;
+	}
+
+#ifdef TEST_VM_OPS_ERROR
+	if (vops->inject_error &&
+	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
+		return -ENOSPC;
+#endif
+
+	return 0;
+}
+
+static void op_trace(struct xe_vma_op *op)
+{
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		trace_xe_vma_bind(op->map.vma);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		trace_xe_vma_unbind(gpuva_to_vma(op->base.remap.unmap->va));
+		if (op->remap.prev)
+			trace_xe_vma_bind(op->remap.prev);
+		if (op->remap.next)
+			trace_xe_vma_bind(op->remap.next);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		trace_xe_vma_unbind(gpuva_to_vma(op->base.unmap.va));
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		trace_xe_vma_bind(gpuva_to_vma(op->base.prefetch.va));
+		break;
+	default:
+		XE_WARN_ON("NOT POSSIBLE");
+	}
+}
+
+static void trace_xe_vm_ops_execute(struct xe_vma_ops *vops)
+{
+	struct xe_vma_op *op;
+
+	list_for_each_entry(op, &vops->list, link)
+		op_trace(op);
+}
+
+static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
+{
+	struct xe_tile *tile;
+	int number_tiles = 0;
+	u8 id;
+
+	for_each_tile(tile, vm->xe, id) {
+		if (vops->pt_update_ops[id].num_ops)
+			++number_tiles;
+
+		if (vops->pt_update_ops[id].q)
+			continue;
+
+		vops->pt_update_ops[id].q = vops->q ?: vm->q;
+	}
+
+	return number_tiles;
+}
+
+/**
+ * xe_vm_ops_execute() - Execute VMA ops
+ * @vm: The VM.
+ * @vops: VMA ops to execute
+ *
+ * Execute VMA ops binding / unbinding VMAs
+ *
+ * Return: A fence for VMA ops on success, ERR_PTR on failure
+ */
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
+{
+	struct xe_tile *tile;
+	struct dma_fence *fence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
+	int number_tiles = 0, current_fence = 0, err;
+	u8 id;
+
+	number_tiles = vm_ops_setup_tile_args(vm, vops);
+	if (number_tiles == 0)
+		return ERR_PTR(-ENODATA);
+
+	if (number_tiles > 1) {
+		fences = kmalloc_array(number_tiles, sizeof(*fences),
+				       GFP_KERNEL);
+		if (!fences) {
+			fence = ERR_PTR(-ENOMEM);
+			goto err_trace;
+		}
+	}
 
-		drm_gpuva_ops_free(&vm->gpuvm, __ops);
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		err = xe_pt_update_ops_prepare(tile, vops);
+		if (err) {
+			fence = ERR_PTR(err);
+			goto err_out;
+		}
+	}
+
+	trace_xe_vm_ops_execute(vops);
+
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		fence = xe_pt_update_ops_run(tile, vops);
+		if (IS_ERR(fence))
+			goto err_out;
+
+		if (fences)
+			fences[current_fence++] = fence;
+	}
+
+	if (fences) {
+		cf = dma_fence_array_create(number_tiles, fences,
+					    vm->composite_fence_ctx,
+					    vm->composite_fence_seqno++,
+					    false);
+		if (!cf) {
+			--vm->composite_fence_seqno;
+			fence = ERR_PTR(-ENOMEM);
+			goto err_out;
+		}
+		fence = &cf->base;
 	}
+
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		xe_pt_update_ops_fini(tile, vops);
+	}
+
+	return fence;
+
+err_out:
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		xe_pt_update_ops_abort(tile, vops);
+	}
+	while (current_fence)
+		dma_fence_put(fences[--current_fence]);
+	kfree(fences);
+	kfree(cf);
+
+err_trace:
+	trace_xe_vm_ops_fail(vm);
+	return fence;
+}
+
+static void vma_add_ufence(struct xe_vma *vma, struct xe_user_fence *ufence)
+{
+	if (vma->ufence)
+		xe_sync_ufence_put(vma->ufence);
+	vma->ufence = __xe_sync_ufence_get(ufence);
+}
+
+static void op_add_ufence(struct xe_vm *vm, struct xe_vma_op *op,
+			  struct xe_user_fence *ufence)
+{
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		vma_add_ufence(op->map.vma, ufence);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		if (op->remap.prev)
+			vma_add_ufence(op->remap.prev, ufence);
+		if (op->remap.next)
+			vma_add_ufence(op->remap.next, ufence);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		vma_add_ufence(gpuva_to_vma(op->base.prefetch.va), ufence);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+}
+
+static void vm_bind_ioctl_ops_install_fences(struct xe_vm *vm,
+					     struct xe_vma_ops *vops,
+					     struct dma_fence *fence)
+{
+	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, vops->q);
+	struct xe_user_fence *ufence;
+	struct xe_vma_op *op;
+	int i;
+
+	ufence = find_ufence_get(vops->syncs, vops->num_syncs);
+	list_for_each_entry(op, &vops->list, link) {
+		if (ufence)
+			op_add_ufence(vm, op, ufence);
+
+		if (op->base.op == DRM_GPUVA_OP_UNMAP)
+			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), fence);
+		else if (op->base.op == DRM_GPUVA_OP_REMAP)
+			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va),
+				       fence);
+	}
+	if (ufence)
+		xe_sync_ufence_put(ufence);
+	for (i = 0; i < vops->num_syncs; i++)
+		xe_sync_entry_signal(vops->syncs + i, NULL, fence);
+	xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
+	dma_fence_put(fence);
 }
 
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
-				     struct list_head *ops_list)
+				     struct xe_vma_ops *vops)
 {
-	struct xe_vma_op *op, *next;
+	struct drm_exec exec;
+	struct dma_fence *fence;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	list_for_each_entry_safe(op, next, ops_list, link) {
-		err = xe_vma_op_execute(vm, op);
-		if (err) {
-			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
-				 op->base.op, err);
-			/*
-			 * FIXME: Killing VM rather than proper error handling
-			 */
-			xe_vm_kill(vm);
-			return -ENOSPC;
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+		      DRM_EXEC_IGNORE_DUPLICATES, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = vm_bind_ioctl_ops_lock(&exec, vm, vops);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			goto unlock;
+
+		fence = xe_vm_ops_execute(vm, vops);
+		if (IS_ERR(fence)) {
+			err = PTR_ERR(fence);
+			goto unlock;
 		}
-		xe_vma_op_cleanup(vm, op);
+
+		vm_bind_ioctl_ops_install_fences(vm, vops, fence);
 	}
 
-	return 0;
+unlock:
+	drm_exec_fini(&exec);
+	return err;
 }
 
+#ifdef TEST_VM_OPS_ERROR
+#define SUPPORTED_FLAGS	(FORCE_OP_ERROR | DRM_XE_VM_BIND_FLAG_NULL | \
+	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+#else
 #define SUPPORTED_FLAGS	(DRM_XE_VM_BIND_FLAG_NULL | \
 	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
+#endif
 #define XE_64K_PAGE_MASK 0xffffull
 #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
 
@@ -2936,7 +2860,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 num_syncs, num_ufence = 0;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
-	LIST_HEAD(ops_list);
+	struct xe_vma_ops vops;
 	int err;
 	int i;
 
@@ -2951,7 +2875,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_objs;
 		}
 
-		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
+		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_PT))) {
 			err = -EINVAL;
 			goto put_exec_queue;
 		}
@@ -3087,6 +3011,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto free_syncs;
 	}
 
+	xe_vma_ops_init(&vops, vm, q, syncs, num_syncs);
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3106,42 +3031,39 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 
 		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
-					      &ops_list,
-					      i == args->num_binds - 1);
+					      &vops, i == args->num_binds - 1);
 		if (err)
 			goto unwind_ops;
+
+#ifdef TEST_VM_OPS_ERROR
+		if (flags & FORCE_OP_ERROR) {
+			vops.inject_error = true;
+			vm->xe->vm_inject_error_position =
+				(vm->xe->vm_inject_error_position + 1) %
+				FORCE_OP_ERROR_COUNT;
+		}
+#endif
 	}
 
 	/* Nothing to do */
-	if (list_empty(&ops_list)) {
+	if (list_empty(&vops.list)) {
 		err = -ENODATA;
 		goto unwind_ops;
 	}
 
-	xe_vm_get(vm);
-	if (q)
-		xe_exec_queue_get(q);
-
-	err = vm_bind_ioctl_ops_execute(vm, &ops_list);
-
-	up_write(&vm->lock);
-
-	if (q)
-		xe_exec_queue_put(q);
-	xe_vm_put(vm);
-
-	for (i = 0; bos && i < args->num_binds; ++i)
-		xe_bo_put(bos[i]);
-
-	kvfree(bos);
-	kvfree(ops);
-	if (args->num_binds > 1)
-		kvfree(bind_ops);
+	err = xe_vma_ops_alloc(&vops);
+	if (err)
+		goto unwind_ops;
 
-	return err;
+	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
 unwind_ops:
-	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	if (err && err != -ENODATA)
+		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	xe_vma_ops_free(&vops);
+	for (i = args->num_binds - 1; i >= 0; --i)
+		if (ops[i])
+			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
 free_syncs:
 	if (err == -ENODATA)
 		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6df1f1c7f85d..492237b60341 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -207,7 +207,7 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
-struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
+int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
@@ -262,6 +262,13 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
  */
 #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
 
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask);
+void xe_vma_ops_free(struct xe_vma_ops *vops);
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
+
+void xe_vm_kill(struct xe_vm *vm, bool unlocked);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 79b5cab57711..d0a08e927db7 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -18,9 +18,21 @@
 #include "xe_range_fence.h"
 
 struct xe_bo;
+struct xe_device;
 struct xe_sync_entry;
 struct xe_user_fence;
 struct xe_vm;
+struct xe_vm_pgtable_update_op;
+
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
+#define TEST_VM_OPS_ERROR
+#define FORCE_OP_ERROR	BIT(31)
+
+#define FORCE_OP_ERROR_LOCK	0
+#define FORCE_OP_ERROR_PREPARE	1
+#define FORCE_OP_ERROR_RUN	2
+#define FORCE_OP_ERROR_COUNT	3
+#endif
 
 #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
 #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
@@ -124,7 +136,96 @@ struct xe_userptr_vma {
 	struct xe_userptr userptr;
 };
 
-struct xe_device;
+/** struct xe_vma_op_map - VMA map operation */
+struct xe_vma_op_map {
+	/** @vma: VMA to map */
+	struct xe_vma *vma;
+	/** @immediate: Immediate bind */
+	bool immediate;
+	/** @is_null: is NULL binding */
+	bool is_null;
+	/** @dumpable: whether BO is dumped on GPU hang */
+	bool dumpable;
+	/** @pat_index: The pat index to use for this operation. */
+	u16 pat_index;
+};
+
+/** struct xe_vma_op_remap - VMA remap operation */
+struct xe_vma_op_remap {
+	/** @prev: VMA preceding part of a split mapping */
+	struct xe_vma *prev;
+	/** @next: VMA subsequent part of a split mapping */
+	struct xe_vma *next;
+	/** @start: start of the VMA unmap */
+	u64 start;
+	/** @range: range of the VMA unmap */
+	u64 range;
+	/** @skip_prev: skip prev rebind */
+	bool skip_prev;
+	/** @skip_next: skip next rebind */
+	bool skip_next;
+	/** @unmap_done: unmap operation in done */
+	bool unmap_done;
+};
+
+/** struct xe_vma_op_prefetch - VMA prefetch operation */
+struct xe_vma_op_prefetch {
+	/** @region: memory region to prefetch to */
+	u32 region;
+};
+
+/** enum xe_vma_op_flags - flags for VMA operation */
+enum xe_vma_op_flags {
+	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
+	XE_VMA_OP_COMMITTED		= BIT(0),
+	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
+	XE_VMA_OP_PREV_COMMITTED	= BIT(1),
+	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
+	XE_VMA_OP_NEXT_COMMITTED	= BIT(2),
+};
+
+/** struct xe_vma_op - VMA operation */
+struct xe_vma_op {
+	/** @base: GPUVA base operation */
+	struct drm_gpuva_op base;
+	/** @num_syncs: number of syncs */
+	u32 num_syncs;
+	/** @link: async operation link */
+	struct list_head link;
+	/** @flags: operation flags */
+	enum xe_vma_op_flags flags;
+	/** @tile_mask: Tile mask for operation */
+	u8 tile_mask;
+
+	union {
+		/** @map: VMA map operation specific data */
+		struct xe_vma_op_map map;
+		/** @remap: VMA remap operation specific data */
+		struct xe_vma_op_remap remap;
+		/** @prefetch: VMA prefetch operation specific data */
+		struct xe_vma_op_prefetch prefetch;
+	};
+};
+
+/** struct xe_vma_ops - VMA operations */
+struct xe_vma_ops {
+	/** @list: list of VMA operations */
+	struct list_head list;
+	/** @vm: VM */
+	struct xe_vm *vm;
+	/** @q: exec queue for VMA operations */
+	struct xe_exec_queue *q;
+	/** @syncs: syncs these operation */
+	struct xe_sync_entry *syncs;
+	/** @num_syncs: number of syncs */
+	u32 num_syncs;
+	/** @pt_update_ops: page table update operations */
+	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+#ifdef TEST_VM_OPS_ERROR
+	/** @inject_error: inject error to test error handling */
+	bool inject_error;
+#endif
+};
 
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
@@ -133,7 +234,7 @@ struct xe_vm {
 	struct xe_device *xe;
 
 	/* exec queue used for (un)binding vma's */
-	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
+	struct xe_exec_queue *q;
 
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
@@ -180,9 +281,6 @@ struct xe_vm {
 	 */
 	struct list_head rebind_list;
 
-	/** @rebind_fence: rebind fence from execbuf */
-	struct dma_fence *rebind_fence;
-
 	/**
 	 * @destroy_work: worker to destroy VM, needed as a dma_fence signaling
 	 * from an irq context can be last put and the destroy needs to be able
@@ -267,92 +365,18 @@ struct xe_vm {
 		bool capture_once;
 	} error_capture;
 
+	/** @dummy_ops: dummy VMA ops to issue rebinds */
+	struct {
+		/** @dummy_ops.ops: dummy VMA ops */
+		struct xe_vma_ops vops;
+		/** @dummy_ops.op: dummy VMA op */
+		struct xe_vma_op op;
+	} dummy_ops;
+
 	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
 };
 
-/** struct xe_vma_op_map - VMA map operation */
-struct xe_vma_op_map {
-	/** @vma: VMA to map */
-	struct xe_vma *vma;
-	/** @is_null: is NULL binding */
-	bool is_null;
-	/** @dumpable: whether BO is dumped on GPU hang */
-	bool dumpable;
-	/** @pat_index: The pat index to use for this operation. */
-	u16 pat_index;
-};
-
-/** struct xe_vma_op_remap - VMA remap operation */
-struct xe_vma_op_remap {
-	/** @prev: VMA preceding part of a split mapping */
-	struct xe_vma *prev;
-	/** @next: VMA subsequent part of a split mapping */
-	struct xe_vma *next;
-	/** @start: start of the VMA unmap */
-	u64 start;
-	/** @range: range of the VMA unmap */
-	u64 range;
-	/** @skip_prev: skip prev rebind */
-	bool skip_prev;
-	/** @skip_next: skip next rebind */
-	bool skip_next;
-	/** @unmap_done: unmap operation in done */
-	bool unmap_done;
-};
-
-/** struct xe_vma_op_prefetch - VMA prefetch operation */
-struct xe_vma_op_prefetch {
-	/** @region: memory region to prefetch to */
-	u32 region;
-};
-
-/** enum xe_vma_op_flags - flags for VMA operation */
-enum xe_vma_op_flags {
-	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
-	XE_VMA_OP_FIRST			= BIT(0),
-	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
-	XE_VMA_OP_LAST			= BIT(1),
-	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
-	XE_VMA_OP_COMMITTED		= BIT(2),
-	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
-	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
-	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
-	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
-};
-
-/** struct xe_vma_op - VMA operation */
-struct xe_vma_op {
-	/** @base: GPUVA base operation */
-	struct drm_gpuva_op base;
-	/**
-	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
-	 * operations is processed
-	 */
-	struct drm_gpuva_ops *ops;
-	/** @q: exec queue for this operation */
-	struct xe_exec_queue *q;
-	/**
-	 * @syncs: syncs for this operation, only used on first and last
-	 * operation
-	 */
-	struct xe_sync_entry *syncs;
-	/** @num_syncs: number of syncs */
-	u32 num_syncs;
-	/** @link: async operation link */
-	struct list_head link;
-	/** @flags: operation flags */
-	enum xe_vma_op_flags flags;
-
-	union {
-		/** @map: VMA map operation specific data */
-		struct xe_vma_op_map map;
-		/** @remap: VMA remap operation specific data */
-		struct xe_vma_op_remap remap;
-		/** @prefetch: VMA prefetch operation specific data */
-		struct xe_vma_op_prefetch prefetch;
-	};
-};
 #endif
-- 
2.34.1

