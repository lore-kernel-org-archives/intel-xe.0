Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3256FC4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A5310E4B2;
	Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5434E10E4BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334758; x=1730870758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d5DcK27kG0W2artoHJLKlehp/M3D86nD5PSMoS6CDK8=;
 b=m0lMl0tklBIvD4E9ATAf3QPKUMWDoIoEDanh09Ehmba3LoD59Zp990dA
 a1P2qb7d5CUZWag/GrHy/7rGvNSFB/Czbb31U3y4U8QT9HukvIZbdkkt1
 ZT9zlsmSV7ZTC14ubO3xQiAM3Y6aaIJHaiPFiviyI8/wJ+MEg5b1DWyGt
 sFs/yupOpaAyyBn0U9KLMetFpzVMb53aDJXFGp5uhEciKgFGlSVhJGWJZ
 ShKr0lbWIhiFACg3TeXwDxu+OdAe/dpj4QuOUjnViBCUtzN9x3JZjCrb4
 bKuwyyAxLuKO/cYMk36JHxao34DHaaQM6P3dttxeuXNIEXd7TlSTj0LHO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769537"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769537"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689890"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689890"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:26:01 -0800
Message-Id: <20231107052603.124361-26-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 25/27] drm/xe: CPU binds for jobs
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

No reason to use the GPU for binds, rather in run_job use the CPU to do
binds once the bind job dependencies are resolved.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c              |   7 +-
 drivers/gpu/drm/xe/xe_bo.h              |   6 +-
 drivers/gpu/drm/xe/xe_device.c          |  23 +++
 drivers/gpu/drm/xe/xe_device.h          |   7 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c    |   5 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  43 ++++-
 drivers/gpu/drm/xe/xe_migrate.c         | 201 +++---------------------
 drivers/gpu/drm/xe/xe_migrate.h         |   6 +
 drivers/gpu/drm/xe/xe_pt.c              |  31 ++--
 drivers/gpu/drm/xe/xe_pt.h              |   1 +
 drivers/gpu/drm/xe/xe_pt_types.h        |   5 +
 drivers/gpu/drm/xe/xe_sched_job.c       |   4 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |  31 +++-
 drivers/gpu/drm/xe/xe_vm.c              |  97 ++++++------
 drivers/gpu/drm/xe/xe_vm.h              |   5 +-
 16 files changed, 223 insertions(+), 253 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1ae0543882a0..d63620008e96 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2097,16 +2097,16 @@ void __xe_bo_release_dummy(struct kref *kref)
 
 /**
  * xe_bo_put_commit() - Put bos whose put was deferred by xe_bo_put_deferred().
+ ( @xe: Xe device
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
@@ -2115,8 +2115,7 @@ void xe_bo_put_commit(struct llist_head *deferred)
 	if (!freed)
 		return;
 
-	llist_for_each_entry_safe(bo, next, freed, freed)
-		drm_gem_object_free(&bo->ttm.base.refcount);
+	xe_device_put_deferred(xe, freed);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 98ed35cf39a3..4bdf4875b2e9 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -10,7 +10,7 @@
 
 #include "xe_bo_types.h"
 #include "xe_macros.h"
-#include "xe_vm_types.h"
+#include "xe_vm.h"
 
 #define XE_DEFAULT_GTT_SIZE_MB          3072ULL /* 3GB by default */
 
@@ -285,10 +285,12 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
 		return false;
 
+	xe_vm_get(bo->vm);
+
 	return llist_add(&bo->freed, deferred);
 }
 
-void xe_bo_put_commit(struct llist_head *deferred);
+void xe_bo_put_commit(struct xe_device *xe, struct llist_head *deferred);
 
 struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 515cdf599fab..35662c0e9cd1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -188,6 +188,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 {
 	struct xe_device *xe = to_xe_device(dev);
 
+	flush_work(&xe->mem.deferred_work);
+
 	if (xe->ordered_wq)
 		destroy_workqueue(xe->ordered_wq);
 
@@ -197,6 +199,24 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	ttm_device_fini(&xe->ttm);
 }
 
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
@@ -250,6 +270,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 		goto err_put;
 	}
 
+	init_llist_head(&xe->mem.deferred);
+	INIT_WORK(&xe->mem.deferred_work, deferred_work);
+
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
 		goto err_put;
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index c4232de40ae0..dfc3e6876008 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -160,4 +160,11 @@ static inline bool xe_device_has_flat_ccs(struct xe_device *xe)
 
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
+static inline void xe_device_put_deferred(struct xe_device *xe,
+					  struct llist_node *deferred)
+{
+	llist_add(deferred, &xe->mem.deferred);
+	queue_work(system_wq, &xe->mem.deferred_work);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4119ef03fb7e..ce6bbfc92c56 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -295,6 +295,10 @@ struct xe_device {
 		struct xe_mem_region vram;
 		/** @sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
+		/** @deferred: deferred list to destroy PT entries */
+		struct llist_head deferred;
+		/** @deferred_work: worker to destroy PT entries */
+		struct work_struct deferred_work;
 	} mem;
 
 	/** @usm: unified memory state */
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index d383b5a3eaa2..3a3b06d6a4b0 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -203,10 +203,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
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
index 870dc5c532fa..2790ed0c4ffb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -15,6 +15,7 @@
 
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -29,7 +30,9 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mocs.h"
+#include "xe_pt.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -668,6 +671,30 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	}
 }
 
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return test_bit(JOB_FLAG_PT, &job->fence->flags);
+}
+
+static void cleanup_pt_job(struct xe_device *xe, struct xe_sched_job *job)
+{
+	xe_hw_fence_signal(job->fence);
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
@@ -683,11 +710,17 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
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
 
 	if (lr) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index d1022d5544b2..d56448dbf135 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1052,56 +1052,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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
-	xe_tile_assert(tile, update->qwords <= 0x1ff);
-	if (!ppgtt_ofs)
-		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
-						xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE));
-
-	do {
-		u64 addr = ppgtt_ofs + ofs * 8;
-
-		chunk = min(update->qwords, 0x1ffU);
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
@@ -1117,11 +1067,10 @@ struct migrate_test_params {
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
 
@@ -1182,131 +1131,16 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
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
-	bool usm = is_migrate && xe->info.supports_usm;
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
+	u64 batch_addr[2] = {0, 0};
+	int err;
 
 	if (is_migrate)
 		mutex_lock(&m->job_mutex);
 
-	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
-					 xe_migrate_batch_base(m, usm),
-					 update_idx);
+	job = xe_sched_job_create(pt_update_ops->q, batch_addr);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
 		goto err_bb;
@@ -1318,6 +1152,21 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 		if (err)
 			goto err_job;
 	}
+
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
+	pt_update_ops->ops = NULL;
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -1325,9 +1174,6 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 
-	xe_bb_free(bb, fence);
-	drm_suballoc_free(sa_bo, fence);
-
 	return fence;
 
 err_job:
@@ -1335,9 +1181,6 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 err_bb:
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
-	xe_bb_free(bb, NULL);
-err:
-	drm_suballoc_free(sa_bo, NULL);
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 805c780d3ab6..0b8f307d3970 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -22,6 +22,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 /**
@@ -105,6 +106,11 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
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
index 7d9bd7d1dabb..fdb307e81cd6 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -366,6 +366,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->pt = parent;
 	entry->flags = 0;
 	entry->qwords = 0;
+	entry->level = parent->level;
 	entry->pt_bo->update_index = -1;
 
 	if (alloc_entries) {
@@ -1459,7 +1460,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
 				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
 	if (map && map->is_iomem)
@@ -1865,31 +1866,43 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	return ERR_PTR(err);
 }
 
+void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op, u32 num_ops)
+{
+	u32 i;
+
+	for (i = 0; i < num_ops; ++i, ++pt_op)
+		if (pt_op->bind)
+			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
+}
+
 void xe_pt_update_ops_commit(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
-	int i;
 
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
 	/* FIXME: Not 100% correct */
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
 
-		if (pt_op->bind)
-			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
-	}
-	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
+	xe_bo_put_commit(tile_to_xe(tile), &pt_update_ops->deferred);
+	if (!pt_update_ops->skip_free)
+		xe_pt_update_ops_free(pt_update_ops->ops,
+				      pt_update_ops->num_ops);
 }
 
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
 	/* FIXME: Just kill VM for now + cleanup PTs */
-	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
+	xe_bo_put_commit(tile_to_xe(tile), &pt_update_ops->deferred);
+	if (!pt_update_ops->skip_free)
+		xe_pt_update_ops_free(pt_update_ops->ops,
+				      pt_update_ops->num_ops);
 	xe_vm_kill(vops->vm, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 547d0624685b..4f474b0bd2aa 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -40,6 +40,7 @@ struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 				       struct xe_vma_ops *vops);
 void xe_pt_update_ops_commit(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
+void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op, u32 num_ops);
 
 struct dma_fence *
 __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index f4d308ce7985..46fbb4325400 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -69,6 +69,9 @@ struct xe_vm_pgtable_update {
 	/** @pt_entries: Newly added pagetable entries */
 	struct xe_pt_entry *pt_entries;
 
+	/** @level: level of update */
+	unsigned int level;
+
 	/** @flags: Target flags */
 	u32 flags;
 };
@@ -117,6 +120,8 @@ struct xe_vm_pgtable_update_ops {
 	 * slots are idle.
 	 */
 	bool wait_vm_kernel;
+	/** @skip_free: Free @ops in submission backend rather than in IOCTL */
+	bool skip_free;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index adbd82f8744e..0e28532c5048 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -34,8 +34,10 @@ int __init xe_sched_job_module_init(void)
 	xe_sched_job_parallel_slab =
 		kmem_cache_create("xe_sched_job_parallel",
 				  sizeof(struct xe_sched_job) +
+				  max_t(size_t,
 				  sizeof(u64) *
-				  XE_HW_ENGINE_MAX_INSTANCE, 0,
+				  XE_HW_ENGINE_MAX_INSTANCE,
+				  sizeof(struct pt_update_args)), 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_parallel_slab) {
 		kmem_cache_destroy(xe_sched_job_slab);
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 71213ba9735b..b2d986e87ef3 100644
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
+		u64 batch_addr[0];
+		/** @pt_update: PT update arguments */
+		struct pt_update_args pt_update[0];
+	};
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7d53b266a116..52f563580fc3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -825,7 +825,46 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
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
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				 u8 tile_mask)
 {
 	int i;
@@ -860,12 +899,15 @@ void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
 	vm->dummy_ops.op.map.immediate = true;
 	vm->dummy_ops.op.map.read_only = xe_vma_read_only(vma);
 	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
+
+	return xe_vma_ops_alloc(&vm->dummy_ops.vops);
 }
 
 struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence = NULL;
 	struct xe_vma *vma, *next;
+	int err;
 
 	lockdep_assert_held(&vm->lock);
 	if (xe_vm_no_dma_fences(vm) && !rebind_worker)
@@ -883,8 +925,12 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		else
 			trace_xe_vma_rebind_exec(vma);
 
-		xe_vm_populate_dummy_rebind(vm, vma, vma->tile_present);
+		err = xe_vm_populate_dummy_rebind(vm, vma, vma->tile_present);
+		if (err)
+			return ERR_PTR(err);
+
 		fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
+		xe_vma_ops_free(&vm->dummy_ops.vops);
 		if (IS_ERR(fence))
 			return fence;
 	}
@@ -1355,45 +1401,6 @@ static const struct xe_pt_ops xelp_pt_ops = {
 
 static void vm_destroy_work_func(struct work_struct *w);
 
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
@@ -1429,9 +1436,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	list_add(&vm->dummy_ops.op.link, &vm->dummy_ops.vops.list);
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
 		vm->dummy_ops.vops.pt_update_ops[i].num_ops = 1;
-	err = xe_vma_ops_alloc(&vm->dummy_ops.vops);
-	if (err)
-		goto err_free;
 
 	INIT_LIST_HEAD(&vm->rebind_list);
 
@@ -1574,8 +1578,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	dma_resv_fini(&vm->resv);
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
-err_free:
-	xe_vma_ops_fini(&vm->dummy_ops.vops);
 	kfree(vm);
 	return ERR_PTR(err);
 }
@@ -1729,7 +1731,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	trace_xe_vm_free(vm);
 	dma_resv_fini(&vm->resv);
-	xe_vma_ops_fini(&vm->dummy_ops.vops);
 	kfree(vm);
 }
 
@@ -2968,7 +2969,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	if (err && err != -ENODATA)
 		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
-	xe_vma_ops_fini(&vops);
+	xe_vma_ops_free(&vops);
 	for (i = args->num_binds - 1; i >= 0; --i)
 		if (ops[i])
 			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 34850f04d966..a61e23ea5b1a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -224,8 +224,9 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 		      unsigned int num_shared);
 
-void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
-				 u8 tile_mask);
+int xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask);
+void xe_vma_ops_free(struct xe_vma_ops *vops);
 struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
 
 void xe_vm_kill(struct xe_vm *vm, bool unlocked);
-- 
2.34.1

