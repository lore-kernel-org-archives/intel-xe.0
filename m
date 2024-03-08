Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42145C54E5E
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47C210F966;
	Fri,  8 Mar 2024 05:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="co7o8fDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871C710FCE3
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874475; x=1741410475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vv0xPyb68KnTpdTI+lZHWxYskijWfLhDgs5zveePSX4=;
 b=co7o8fDq2/SJf0POFHvIRTK4P6pjZIKtiK1A0qfYvnfXwVO07a87GJEB
 KDeNymUhVsrD2IQb+9i7hjmBMYhYqSEe1+y+uE9q9wSFRtq+WBx6IN2ko
 kAXQJFvue+lFBsSmpE5W8pTiayYFdPzhnYUh37m4rsJ6K35NtlRU+zr8b
 zbj67YN7TlRCr4I/REbuxd38fIvHJAVSDX8ykZOW0DrT74AI3MMI2Nr4u
 5svfTHiSvw2eJPvfBIRatr2HM7X6GcxDpoXOn8/cRq2//yD8sdmvmrRwz
 fWgfqsX6Hv1ZK602/0nKByp+FkhJB5V/0e0WNweJ7cimMz5B8fkXOop7E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761981"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403047"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 26/30] drm/xe: CPU binds for jobs
Date: Thu,  7 Mar 2024 21:08:02 -0800
Message-Id: <20240308050806.577176-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
MIME-Version: 1.0
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

No reason to use the GPU for binds. In run_job use the CPU to do binds
once the bind job dependencies are resolved.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c              |   7 +-
 drivers/gpu/drm/xe/xe_bo.h              |   4 +-
 drivers/gpu/drm/xe/xe_bo_types.h        |   2 -
 drivers/gpu/drm/xe/xe_device.c          |  35 +++++
 drivers/gpu/drm/xe/xe_device.h          |   2 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c    |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  47 +++++-
 drivers/gpu/drm/xe/xe_migrate.c         | 198 +++---------------------
 drivers/gpu/drm/xe/xe_migrate.h         |   6 +
 drivers/gpu/drm/xe/xe_pt.c              |  36 +++--
 drivers/gpu/drm/xe/xe_pt.h              |   1 +
 drivers/gpu/drm/xe/xe_pt_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sched_job.c       |  37 +++--
 drivers/gpu/drm/xe/xe_sched_job_types.h |  31 +++-
 drivers/gpu/drm/xe/xe_vm.c              | 101 ++++++------
 drivers/gpu/drm/xe/xe_vm.h              |   5 +-
 17 files changed, 254 insertions(+), 272 deletions(-)

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
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 1ff5b5a68adc..14ef13b7b421 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -77,8 +77,6 @@ struct xe_bo {
 	} props;
 	/** @freed: List node for delayed put. */
 	struct llist_node freed;
-	/** @update_index: Update index if PT BO */
-	int update_index;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
 
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
index 9785eef2e5a4..3d86ab07a5cd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -315,6 +315,10 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @mem.deferred: deferred list to destroy PT entries */
+		struct llist_head deferred;
+		/** @mem.deferred_work: worker to destroy PT entries */
+		struct work_struct deferred_work;
 	} mem;
 
 	/** @sriov: device level virtualization data */
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index bd8688b2f462..b4320dba7d03 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -208,10 +208,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	xe_vm_populate_dummy_rebind(vm, vma, BIT(tile->id));
+	ret = xe_vm_populate_dummy_rebind(vm, vma, BIT(tile->id));
+	if (ret)
+		goto unlock_dma_resv;
 	vm->dummy_ops.vops.pt_update_ops[tile->id].q =
 		xe_tile_migrate_exec_queue(tile);
 	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
+	xe_vma_ops_free(&vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
 		goto unlock_dma_resv;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 19efdb2f881f..09775b1044f4 100644
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
@@ -33,7 +34,9 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mocs.h"
+#include "xe_pt.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -719,6 +722,29 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	}
 }
 
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
 static struct dma_fence *
 guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 {
@@ -734,15 +760,22 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_run(job);
 
 	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
-		if (!exec_queue_registered(q))
-			register_engine(q);
-		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
-			q->ring_ops->emit_job(job);
-		submit_exec_queue(q);
+		if (is_pt_job(job)) {
+			run_pt_job(xe, job);
+		} else {
+			if (!exec_queue_registered(q))
+				register_engine(q);
+			if (!lr)	/* LR jobs are emitted in the exec IOCTL */
+				q->ring_ops->emit_job(job);
+			submit_exec_queue(q);
+		}
+	} else if (is_pt_job(job)) {
+		cleanup_pt_job(xe, job);
 	}
 
-	if (lr) {
-		xe_sched_job_set_error(job, -EOPNOTSUPP);
+	if (lr || is_pt_job(job)) {
+		if (lr)
+			xe_sched_job_set_error(job, -EOPNOTSUPP);
 		return NULL;
 	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
 		return job->fence;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cb0d94c8debb..949e015250af 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1105,56 +1105,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	return fence;
 }
 
-static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
-			  const struct xe_vm_pgtable_update_op *pt_op,
-			  const struct xe_vm_pgtable_update *update,
-			  struct xe_migrate_pt_update *pt_update)
-{
-	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	struct xe_vm *vm = pt_update->vops->vm;
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
-		if (pt_op->bind)
-			ops->populate(tile, NULL, bb->cs + bb->len,
-				      ofs, chunk, update);
-		else
-			ops->clear(vm, tile, NULL, bb->cs + bb->len,
-				   ofs, chunk, update);
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
@@ -1170,11 +1120,10 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
-static void
-__xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
-				 const struct xe_migrate_pt_update_ops *ops,
-				 struct xe_vm_pgtable_update_op *pt_op,
-				 int num_ops)
+void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
+				      const struct xe_migrate_pt_update_ops *ops,
+				      struct xe_vm_pgtable_update_op *pt_op,
+				      int num_ops)
 {
 	u32 j, i;
 
@@ -1235,131 +1184,15 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
 	struct xe_tile *tile = m->tile;
-	struct xe_gt *gt = tile->primary_gt;
-	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	struct drm_suballoc *sa_bo = NULL;
-	struct xe_bb *bb;
-	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
-	u32 num_updates = 0, current_update = 0;
-	u64 addr;
-	int err = 0;
 	bool is_migrate = pt_update_ops->q == m->q;
-	bool usm = is_migrate && xe->info.has_usm;
-
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
-		struct xe_vm_pgtable_update *updates = pt_op->entries;
-
-		num_updates += pt_op->num_entries;
-		for (j = 0; j < pt_op->num_entries; ++j) {
-			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
-
-			/* align noop + MI_STORE_DATA_IMM cmd prefix */
-			batch_size += 4 * num_cmds + updates[j].qwords * 2;
-		}
-	}
-
-	/* fixed + PTE entries */
-	if (IS_DGFX(xe))
-		batch_size += 2;
-	else
-		batch_size += 6 + num_updates * 2;
-
-	bb = xe_bb_new(gt, batch_size, usm);
-	if (IS_ERR(bb))
-		return ERR_CAST(bb);
-
-	/* For sysmem PTE's, need to map them in our hole.. */
-	if (!IS_DGFX(xe)) {
-		ppgtt_ofs = NUM_KERNEL_PDE - 1;
-		if (!is_migrate) {
-			u32 num_units = DIV_ROUND_UP(num_updates,
-						     NUM_VMUSA_WRITES_PER_UNIT);
-
-			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
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
-		for (i = 0; i < pt_update_ops->num_ops; ++i) {
-			struct xe_vm_pgtable_update_op *pt_op =
-				&pt_update_ops->ops[i];
-			struct xe_vm_pgtable_update *updates = pt_op->entries;
-
-			for (j = 0; j < pt_op->num_entries; ++j, ++current_update) {
-				struct xe_vm *vm = pt_update->vops->vm;
-				struct xe_bo *pt_bo = updates[j].pt_bo;
-
-				xe_tile_assert(tile, pt_bo->size == SZ_4K);
-
-				/* Map a PT at most once */
-				if (pt_bo->update_index < 0)
-					pt_bo->update_index = current_update;
-
-				addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
-								 XE_CACHE_WB, 0);
-				bb->cs[bb->len++] = lower_32_bits(addr);
-				bb->cs[bb->len++] = upper_32_bits(addr);
-			}
-		}
-
-		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-		update_idx = bb->len;
-
-		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
-			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
-		for (i = 0; i < pt_update_ops->num_ops; ++i) {
-			struct xe_vm_pgtable_update_op *pt_op =
-				&pt_update_ops->ops[i];
-			struct xe_vm_pgtable_update *updates = pt_op->entries;
-
-			for (j = 0; j < pt_op->num_entries; ++j) {
-				struct xe_bo *pt_bo = updates[j].pt_bo;
-
-				write_pgtable(tile, bb, addr +
-					      pt_bo->update_index * XE_PAGE_SIZE,
-					      pt_op, &updates[j], pt_update);
-			}
-		}
-	} else {
-		/* phys pages, no preamble required */
-		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-		update_idx = bb->len;
-
-		for (i = 0; i < pt_update_ops->num_ops; ++i) {
-			struct xe_vm_pgtable_update_op *pt_op =
-				&pt_update_ops->ops[i];
-			struct xe_vm_pgtable_update *updates = pt_op->entries;
-
-			for (j = 0; j < pt_op->num_entries; ++j)
-				write_pgtable(tile, bb, 0, pt_op, &updates[j],
-					      pt_update);
-		}
-	}
+	int err;
 
 	if (is_migrate)
 		mutex_lock(&m->job_mutex);
 
-	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
-					 xe_migrate_batch_base(m, usm),
-					 update_idx);
+	job = xe_sched_job_create(pt_update_ops->q, NULL);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
 		goto err_bb;
@@ -1371,6 +1204,19 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
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
@@ -1378,9 +1224,6 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 
-	xe_bb_free(bb, fence);
-	drm_suballoc_free(sa_bo, fence);
-
 	return fence;
 
 err_job:
@@ -1388,9 +1231,6 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 err_bb:
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
-	xe_bb_free(bb, NULL);
-err:
-	drm_suballoc_free(sa_bo, NULL);
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 18f5a8e40b5c..f80c94bb8f4c 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -22,6 +22,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 /**
@@ -106,6 +107,11 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
+void __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
+				      const struct xe_migrate_pt_update_ops *ops,
+				      struct xe_vm_pgtable_update_op *pt_op,
+				      int num_ops);
+
 struct dma_fence *
 xe_migrate_update_pgtables(struct xe_migrate *m,
 			   struct xe_migrate_pt_update *pt_update);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c963ed48cf3b..c941a73d408a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -326,7 +326,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->pt = parent;
 	entry->flags = 0;
 	entry->qwords = 0;
-	entry->pt_bo->update_index = -1;
+	entry->level = parent->level;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_array(XE_PDES,
@@ -1493,7 +1493,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
 				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
 	if (map && map->is_iomem)
@@ -1913,7 +1913,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		goto free_ifence;
 	}
 
-	/* FIXME: Point of no return - VM killed if failure after this */
+	/* Point of no return - VM killed if failure after this */
 	for (i = 0; i < pt_update_ops->num_ops; ++i) {
 		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
 
@@ -1976,6 +1976,21 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	return ERR_PTR(err);
 }
 
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
 /**
  * xe_pt_update_ops_fini() - Finish PT update operations
  * @tile: Tile of PT update operations
@@ -1987,17 +2002,16 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
-	int i;
 
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
-
-		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
-	}
-	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
+	xe_bo_put_commit(tile_to_xe(tile), &pt_update_ops->deferred);
+	if (!pt_update_ops->skip_free)
+		xe_pt_update_ops_free(pt_update_ops->ops,
+				      pt_update_ops->num_ops);
+	else
+		pt_update_ops->ops = NULL;
 }
 
 /**
@@ -2032,5 +2046,5 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 					   pt_op->num_entries);
 	}
 
-	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
+	xe_pt_update_ops_fini(tile, vops);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..989c9b190fa0 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -40,6 +40,7 @@ struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 				       struct xe_vma_ops *vops);
 void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
+void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op, u32 num_ops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 384cc04de719..cfd0d35408a5 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -70,6 +70,9 @@ struct xe_vm_pgtable_update {
 	/** @pt_entries: Newly added pagetable entries */
 	struct xe_pt_entry *pt_entries;
 
+	/** @level: level of update */
+	unsigned int level;
+
 	/** @flags: Target flags */
 	u32 flags;
 };
@@ -120,6 +123,8 @@ struct xe_vm_pgtable_update_ops {
 	 * slots are idle.
 	 */
 	bool wait_vm_kernel;
+	/** @skip_free: Free @ops in submission backend rather than in IOCTL */
+	bool skip_free;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 8151ddafb940..373033d9ebd6 100644
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
@@ -108,7 +111,13 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	if (err)
 		goto err_free;
 
-	if (!xe_exec_queue_is_parallel(q)) {
+	if (!batch_addr) {
+		job->fence = dma_fence_allocate_private_stub(ktime_get());
+		if (!job->fence) {
+			err = -ENOMEM;
+			goto err_sched_job;
+		}
+	} else if (!xe_exec_queue_is_parallel(q)) {
 		job->fence = xe_lrc_create_seqno_fence(q->lrc);
 		if (IS_ERR(job->fence)) {
 			err = PTR_ERR(job->fence);
@@ -148,12 +157,14 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
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
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index cee90302b28d..dad8bd10d900 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -749,6 +749,45 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
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
 /**
  * xe_vm_populate_dummy_rebind() - Populate dummy rebind VMA ops
  * @vm: The VM.
@@ -756,9 +795,11 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
  * @tile_mask: tile mask for VMA ops
  *
  * Populate dummy VMA ops which can be used to issue a rebind for the VMA
+ *
+ * Return: 0 on success, -ENOMEM on failure
  */
-void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
-				 u8 tile_mask)
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask)
 {
 	int i;
 
@@ -792,12 +833,15 @@ void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
 	vm->dummy_ops.op.map.immediate = true;
 	vm->dummy_ops.op.map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
 	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
+
+	return xe_vma_ops_alloc(&vm->dummy_ops.vops);
 }
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence = NULL;
 	struct xe_vma *vma, *next;
+	int err;
 
 	lockdep_assert_held(&vm->lock);
 	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
@@ -815,8 +859,12 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		else
 			trace_xe_vma_rebind_exec(vma);
 
-		xe_vm_populate_dummy_rebind(vm, vma, vma->tile_present);
+		err = xe_vm_populate_dummy_rebind(vm, vma, vma->tile_present);
+		if (err)
+			return err;
+
 		fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
+		xe_vma_ops_free(&vm->dummy_ops.vops);
 		if (IS_ERR(fence))
 			return PTR_ERR(fence);
 	}
@@ -1326,45 +1374,6 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
-static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
-			    struct xe_exec_queue *q,
-			    struct xe_sync_entry *syncs, u32 num_syncs)
-{
-	memset(vops, 0, sizeof(*vops));
-	INIT_LIST_HEAD(&vops->list);
-	vops->vm = vm;
-	vops->q = q;
-	vops->syncs = syncs;
-	vops->num_syncs = num_syncs;
-}
-
-static int xe_vma_ops_alloc(struct xe_vma_ops *vops)
-{
-	int i;
-
-	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i) {
-		if (!vops->pt_update_ops[i].num_ops)
-			continue;
-
-		vops->pt_update_ops[i].ops =
-			kmalloc_array(vops->pt_update_ops[i].num_ops,
-				      sizeof(*vops->pt_update_ops[i].ops),
-				      GFP_KERNEL);
-		if (!vops->pt_update_ops[i].ops)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static void xe_vma_ops_fini(struct xe_vma_ops *vops)
-{
-	int i;
-
-	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
-		kfree(vops->pt_update_ops[i].ops);
-}
-
 static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
 {
 	int i;
@@ -1400,9 +1409,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
 	for (id = 0; id < XE_MAX_TILES_PER_DEVICE; ++id)
 		vm->dummy_ops.vops.pt_update_ops[id].num_ops = 1;
-	err = xe_vma_ops_alloc(&vm->dummy_ops.vops);
-	if (err)
-		goto err_free;
 
 	INIT_LIST_HEAD(&vm->rebind_list);
 
@@ -1532,9 +1538,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_device_mem_access_put(xe);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
-err_free:
 	mutex_destroy(&vm->snap_mutex);
-	xe_vma_ops_fini(&vm->dummy_ops.vops);
 	kfree(vm);
 	return ERR_PTR(err);
 }
@@ -1672,7 +1676,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
-	xe_vma_ops_fini(&vm->dummy_ops.vops);
 	kfree(vm);
 }
 
@@ -3061,7 +3064,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	if (err && err != -ENODATA)
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
-	xe_vma_ops_fini(&vops);
+	xe_vma_ops_free(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
 			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c849ad0d44b5..492237b60341 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -262,8 +262,9 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
  */
 #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
 
-void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
-				 u8 tile_mask);
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask);
+void xe_vma_ops_free(struct xe_vma_ops *vops);
 struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
 
 void xe_vm_kill(struct xe_vm *vm, bool unlocked);
-- 
2.34.1

