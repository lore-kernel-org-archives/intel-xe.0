Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46028C25B6D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 04:02:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F071510E751;
	Thu, 26 Oct 2023 04:02:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F77010E754
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Oct 2023 04:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698292914; x=1729828914;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=arS7zM2WtzwEkYDS6vMftfjU2bOuKu62DMQi//dsWeg=;
 b=h7R+Nz6W6jaw77An04NTUVdSoxJjgnq12Ye3QDMspNpvstNrweEGGW9M
 myjwrWKJIfOVT6Ob5Bl18KSdcuguMet/k8uYvXzfle3QvH99CHTRhkw2X
 fd1jcG/HTMzHa6ZYF6PTfJS2EO07PJ6jNF5MAerAjgHZedfN/8xxo/bKq
 03XCqwvfOLdk4IkdRaUlrTABF/LxMhQHhVnfbMEZptmr8gR/aFLR25JJs
 DRUfsmwg2gjGJ7SFNT2zXqJG5oaN8flJcIYBlNb01uXocJ4MHs1DjQxrJ
 QJYUtnc4VXigCj8SDwAvixnFplwd4VRzDyqH9ZNcbYnR4IwUHeGukwOoD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377822011"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377822011"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762682409"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762682409"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:01:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 21:02:07 -0700
Message-Id: <20231026040213.1272993-21-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026040213.1272993-1-matthew.brost@intel.com>
References: <20231026040213.1272993-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 20/26] drm/xe: Convert multiple bind ops into
 single job
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

This aligns with the uAPI of an array of binds or single bind that
results in multiple GPUVA ops to be considered a single atomic
operations.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo_types.h     |   2 +
 drivers/gpu/drm/xe/xe_exec.c         |  25 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 287 ++++----
 drivers/gpu/drm/xe/xe_migrate.h      |  32 +-
 drivers/gpu/drm/xe/xe_pt.c           | 957 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_pt.h           |   7 +
 drivers/gpu/drm/xe/xe_pt_types.h     |  34 +
 drivers/gpu/drm/xe/xe_vm.c           | 516 ++++-----------
 drivers/gpu/drm/xe/xe_vm.h           |   5 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |  29 +-
 11 files changed, 899 insertions(+), 1001 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 051fe990c133..1222b8bbbc6b 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -74,6 +74,8 @@ struct xe_bo {
 	} props;
 	/** @freed: List node for delayed put. */
 	struct llist_node freed;
+	/** @update_index: Update index if PT BO */
+	int update_index;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
 };
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f42d3274731b..747f8836806e 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -270,30 +270,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		err = PTR_ERR(rebind_fence);
 		goto err_put_job;
 	}
+	dma_fence_put(rebind_fence);
 
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
 	if (!xe_vm_no_dma_fences(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
 							  &vm->resv,
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e0fd96fa0160..3debfeb0b4bf 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -203,9 +203,9 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	xe_vm_populate_dummy_rebind(vm, vma);
-	vm->dummy_ops.op.tile_mask = BIT(tile->id);
-	vm->dummy_ops.op.q = xe_tile_migrate_exec_queue(tile);
+	xe_vm_populate_dummy_rebind(vm, vma, BIT(tile->id));
+	vm->dummy_ops.vops.pt_update_ops[tile->id].q =
+		xe_tile_migrate_exec_queue(tile);
 	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 188b9119aed9..5bdad9f82acf 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1052,6 +1052,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 }
 
 static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
+			  const struct xe_vm_pgtable_update_op *pt_op,
 			  const struct xe_vm_pgtable_update *update,
 			  struct xe_migrate_pt_update *pt_update)
 {
@@ -1086,8 +1087,12 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
 		bb->cs[bb->len++] = lower_32_bits(addr);
 		bb->cs[bb->len++] = upper_32_bits(addr);
-		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
-			      update);
+		if (pt_op->bind)
+			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
+				      ofs, chunk, update);
+		else
+			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
+				   ofs, chunk, update);
 
 		bb->len += chunk * 2;
 		ofs += chunk;
@@ -1112,104 +1117,58 @@ struct migrate_test_params {
 
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
+	u32 j, i;
 
 	if (XE_TEST_ONLY(test && test->force_gpu))
 		return ERR_PTR(-ETIME);
 
-	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
-					  DMA_RESV_USAGE_KERNEL))
-		return ERR_PTR(-ETIME);
-
-	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
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
 
-		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
-			      update->ofs, update->qwords, update);
-	}
-
-	if (vm) {
-		trace_xe_vm_cpu_bind(vm);
-		xe_device_wmb(vm->xe);
+	for (j = 0; j < pt_update_ops->num_ops; ++j) {
+		const struct xe_vm_pgtable_update_op *pt_op =
+			&pt_update_ops->ops[j];
+
+		for (i = 0; i < pt_op->num_entries; i++) {
+			const struct xe_vm_pgtable_update *update =
+				&pt_op->entries[i];
+
+			if (pt_op->bind)
+				ops->populate(pt_update, m->tile,
+					      &update->pt_bo->vmap, NULL,
+					      update->ofs, update->qwords,
+					      update);
+			else
+				ops->clear(pt_update, m->tile,
+					   &update->pt_bo->vmap, NULL,
+					   update->ofs, update->qwords, update);
+		}
 	}
 
-	fence = dma_fence_get_stub();
-
-	return fence;
-}
-
-static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
-{
-	int i;
-
-	for (i = 0; i < num_syncs; i++) {
-		struct dma_fence *fence = syncs[i].fence;
+	trace_xe_vm_cpu_bind(vm);
+	xe_device_wmb(vm->xe);
 
-		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				       &fence->flags))
-			return false;
-	}
-
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
@@ -1218,59 +1177,45 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
 	struct drm_suballoc *sa_bo = NULL;
-	struct xe_vma *vma = pt_update->vma;
 	struct xe_bb *bb;
-	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
+	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
+	u32 num_updates = 0, current_update = 0;
 	u64 addr;
 	int err = 0;
-	bool usm = !q && xe->info.supports_usm;
-	bool first_munmap_rebind = vma &&
-		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
-	struct xe_exec_queue *q_override = !q ? m->q : q;
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+	bool is_migrate = pt_update_ops->q == m->q;
+	bool usm = is_migrate && xe->info.supports_usm;
+
+	for (i = 0; i < pt_update_ops->num_ops; ++i) {
+		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+		struct xe_vm_pgtable_update *updates = pt_op->entries;
+
+		num_updates += pt_op->num_entries;
+		for (j = 0; j < pt_op->num_entries; ++j) {
+			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
 
-	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
-		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
-							num_updates,
-							first_munmap_rebind,
-							pt_update);
-		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
-			return fence;
+			/* align noop + MI_STORE_DATA_IMM cmd prefix */
+			batch_size += 4 * num_cmds + updates[j].qwords * 2;
+		}
 	}
 
 	/* fixed + PTE entries */
 	if (IS_DGFX(xe))
-		batch_size = 2;
+		batch_size += 2;
 	else
-		batch_size = 6 + num_updates * 2;
-
-	for (i = 0; i < num_updates; i++) {
-		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, 0x1ff);
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
+		batch_size += 6 + num_updates * 2;
 
-	bb = xe_bb_new(gt, batch_size, !q && xe->info.supports_usm);
+	bb = xe_bb_new(gt, batch_size, usm);
 	if (IS_ERR(bb))
 		return ERR_CAST(bb);
 
 	/* For sysmem PTE's, need to map them in our hole.. */
 	if (!IS_DGFX(xe)) {
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
-		if (q) {
-			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
+		if (!is_migrate) {
+			u32 num_units = DIV_ROUND_UP(num_updates,
+						     NUM_VMUSA_WRITES_PER_UNIT);
 
-			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
+			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
 						 GFP_KERNEL, true, 0);
 			if (IS_ERR(sa_bo)) {
 				err = PTR_ERR(sa_bo);
@@ -1293,14 +1238,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
 		bb->cs[bb->len++] = 0; /* upper_32_bits */
 
-		for (i = 0; i < num_updates; i++) {
-			struct xe_bo *pt_bo = updates[i].pt_bo;
+		for (i = 0; i < pt_update_ops->num_ops; ++i) {
+			struct xe_vm_pgtable_update_op *pt_op =
+				&pt_update_ops->ops[i];
+			struct xe_vm_pgtable_update *updates = pt_op->entries;
 
-			xe_tile_assert(tile, pt_bo->size == SZ_4K);
+			for (j = 0; j < pt_op->num_entries; ++j, ++current_update) {
+				struct xe_vm *vm = pt_update->vops->vm;
+				struct xe_bo *pt_bo = updates[j].pt_bo;
 
-			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
-			bb->cs[bb->len++] = lower_32_bits(addr);
-			bb->cs[bb->len++] = upper_32_bits(addr);
+				xe_tile_assert(tile, pt_bo->size == SZ_4K);
+
+				/* Map a PT at most once */
+				if (pt_bo->update_index < 0)
+					pt_bo->update_index = current_update;
+
+				addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
+								 XE_CACHE_WB, 0);
+				bb->cs[bb->len++] = lower_32_bits(addr);
+				bb->cs[bb->len++] = upper_32_bits(addr);
+			}
 		}
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
@@ -1308,9 +1265,19 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
 			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
-		for (i = 0; i < num_updates; i++)
-			write_pgtable(tile, bb, addr + i * XE_PAGE_SIZE,
-				      &updates[i], pt_update);
+		for (i = 0; i < pt_update_ops->num_ops; ++i) {
+			struct xe_vm_pgtable_update_op *pt_op =
+				&pt_update_ops->ops[i];
+			struct xe_vm_pgtable_update *updates = pt_op->entries;
+
+			for (j = 0; j < pt_op->num_entries; ++j) {
+				struct xe_bo *pt_bo = updates[j].pt_bo;
+
+				write_pgtable(tile, bb, addr +
+					      pt_bo->update_index * XE_PAGE_SIZE,
+					      pt_op, &updates[j], pt_update);
+			}
+		}
 	} else {
 		/* phys pages, no preamble required */
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
@@ -1318,14 +1285,21 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 		/* Preemption is enabled again by the ring ops. */
 		emit_arb_clear(bb);
-		for (i = 0; i < num_updates; i++)
-			write_pgtable(tile, bb, 0, &updates[i], pt_update);
+		for (i = 0; i < pt_update_ops->num_ops; ++i) {
+			struct xe_vm_pgtable_update_op *pt_op =
+				&pt_update_ops->ops[i];
+			struct xe_vm_pgtable_update *updates = pt_op->entries;
+
+			for (j = 0; j < pt_op->num_entries; ++j)
+				write_pgtable(tile, bb, 0, pt_op, &updates[j],
+					      pt_update);
+		}
 	}
 
-	if (!q)
+	if (is_migrate)
 		mutex_lock(&m->job_mutex);
 
-	job = xe_bb_create_migration_job(q ?: m->q, bb,
+	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
 					 xe_migrate_batch_base(m, usm),
 					 update_idx);
 	if (IS_ERR(job)) {
@@ -1333,31 +1307,6 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
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
-		err = job_add_deps(job, &vm->resv,
-				   DMA_RESV_USAGE_BOOKKEEP);
-		if (err)
-			goto err_job;
-	}
-
-	for (i = 0; !err && i < num_syncs; i++)
-		err = xe_sync_entry_add_deps(&syncs[i], job);
-
-	if (err)
-		goto err_job;
-
 	if (ops->pre_commit) {
 		pt_update->job = job;
 		err = ops->pre_commit(pt_update);
@@ -1368,7 +1317,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 
-	if (!q)
+	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 
 	xe_bb_free(bb, fence);
@@ -1379,7 +1328,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 err_job:
 	xe_sched_job_put(job);
 err_bb:
-	if (!q)
+	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 	xe_bb_free(bb, NULL);
 err:
@@ -1387,6 +1336,38 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
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
index 8b8eedce8499..7fbc21bd265e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -47,6 +47,24 @@ struct xe_migrate_pt_update_ops {
 			 struct xe_tile *tile, struct iosys_map *map,
 			 void *pos, u32 ofs, u32 num_qwords,
 			 const struct xe_vm_pgtable_update *update);
+	/**
+	 * @clear: Clear a command buffer or page-table with ptes.
+	 * @pt_update: Embeddable callback argument.
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
+	void (*clear)(struct xe_migrate_pt_update *pt_update,
+		      struct xe_tile *tile, struct iosys_map *map,
+		      void *pos, u32 ofs, u32 num_qwords,
+		      const struct xe_vm_pgtable_update *update);
 
 	/**
 	 * @pre_commit: Callback to be called just before arming the
@@ -67,14 +85,10 @@ struct xe_migrate_pt_update_ops {
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
@@ -95,12 +109,6 @@ struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
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
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 0050ab6aad05..73199b34820f 100644
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
@@ -364,6 +366,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->pt = parent;
 	entry->flags = 0;
 	entry->qwords = 0;
+	entry->pt_bo->update_index = -1;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_array(XE_PDES,
@@ -868,9 +871,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 
 	lockdep_assert_held(&vm->lock);
 
-	if (xe_vma_is_userptr(vma))
-		lockdep_assert_held_read(&vm->userptr.notifier_lock);
-	else if (!xe_vma_is_null(vma))
+	if (!xe_vma_is_userptr(vma) && !xe_vma_is_null(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	dma_resv_assert_held(&vm->resv);
@@ -892,10 +893,8 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 		if (!rebind)
 			pt->num_live += entries[i].qwords;
 
-		if (!pt->level) {
-			kfree(entries[i].pt_entries);
+		if (!pt->level)
 			continue;
-		}
 
 		pt_dir = as_xe_pt_dir(pt);
 		for (j = 0; j < entries[i].qwords; j++) {
@@ -908,10 +907,18 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 			pt_dir->dir.entries[j_] = &newpte->base;
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
@@ -956,66 +963,122 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
 {}
 #endif
 
-#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
+static int job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
+			enum dma_resv_usage usage)
+{
+	return drm_sched_job_add_resv_dependencies(&job->drm, resv, usage);
+}
 
-static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
+static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
 {
-	u32 divisor = vma->userptr.divisor ? vma->userptr.divisor : 2;
-	static u32 count;
+	int i;
 
-	if (count++ % divisor == divisor - 1) {
-		struct xe_vm *vm = xe_vma_vm(vma);
+	for (i = 0; i < num_syncs; i++) {
+		struct dma_fence *fence = syncs[i].fence;
 
-		vma->userptr.divisor = divisor << 1;
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&vma->userptr.invalidate_link,
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
-static bool xe_pt_userptr_inject_eagain(struct xe_vma *vma)
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
+
+	if (pt_update_ops->wait_vm_bookkeep) {
+		if (!job) {
+			if (!dma_resv_test_signaled(&vm->resv,
+						    DMA_RESV_USAGE_BOOKKEEP))
+				return -ETIME;
+		} else {
+			err = job_add_deps(job, &vm->resv,
+					   DMA_RESV_USAGE_BOOKKEEP);
+			if (err)
+				return err;
+		}
+	} else if (pt_update_ops->wait_vm_kernel) {
+		if (!job) {
+			if (!dma_resv_test_signaled(&vm->resv,
+						    DMA_RESV_USAGE_KERNEL))
+				return -ETIME;
+		} else {
+			err = job_add_deps(job, &vm->resv,
+					   DMA_RESV_USAGE_KERNEL);
+			if (err)
+				return err;
+		}
+	}
 
-	rtfence = xe_range_fence_tree_first(rftree, start, last);
+	rtfence = xe_range_fence_tree_first(rftree, pt_update_ops->start,
+					    pt_update_ops->last);
 	while (rtfence) {
 		fence = rtfence->fence;
 
@@ -1033,80 +1096,124 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
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
 
-	return xe_pt_vm_dependencies(pt_update->job, rftree,
-				     pt_update->start, pt_update->last);
+#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
+
+static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
+{
+	u32 divisor = vma->userptr.divisor ? vma->userptr.divisor : 2;
+	static u32 count;
+
+	if (count++ % divisor == divisor - 1) {
+		vma->userptr.divisor = divisor << 1;
+		return true;
+	}
+
+	return false;
 }
 
-static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+#else
+
+static bool xe_pt_userptr_inject_eagain(struct xe_vma *vma)
+{
+	return false;
+}
+
+#endif
+
+static void vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma)
 {
-	struct xe_pt_migrate_pt_update *userptr_update =
-		container_of(pt_update, typeof(*userptr_update), base);
-	struct xe_vma *vma = pt_update->vma;
 	unsigned long notifier_seq = vma->userptr.notifier_seq;
-	struct xe_vm *vm = xe_vma_vm(vma);
-	int err = xe_pt_vm_dependencies(pt_update->job,
-					&vm->rftree[pt_update->tile_id],
-					pt_update->start,
-					pt_update->last);
 
-	if (err)
-		return err;
+	lockdep_assert_held_read(&vm->userptr.notifier_lock);
 
-	userptr_update->locked = false;
+	if (vma->userptr.initial_bind || xe_vm_in_fault_mode(vm))
+		return;
 
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
-		if (!mmu_interval_read_retry(&vma->userptr.notifier,
-					     notifier_seq))
-			break;
+	if (!mmu_interval_read_retry(&vma->userptr.notifier,
+				     notifier_seq) &&
+	    !xe_pt_userptr_inject_eagain(vma))
+		return;
 
-		up_read(&vm->userptr.notifier_lock);
+	spin_lock(&vm->userptr.invalidated_lock);
+	list_move_tail(&vma->userptr.invalidate_link,
+		       &vm->userptr.invalidated);
+	spin_unlock(&vm->userptr.invalidated_lock);
+}
 
-		if (userptr_update->bind)
-			return -EAGAIN;
+static void op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	lockdep_assert_held_read(&vm->userptr.notifier_lock);
 
-		notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
-	} while (true);
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+			break;
 
-	/* Inject errors to test_whether they are handled correctly */
-	if (userptr_update->bind && xe_pt_userptr_inject_eagain(vma)) {
-		up_read(&vm->userptr.notifier_lock);
-		return -EAGAIN;
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
 	}
+}
 
-	userptr_update->locked = true;
+static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_vma_ops *vops = pt_update->vops;
+	struct xe_vma_op *op;
+	int err;
 
-	return 0;
-}
+	err = xe_pt_pre_commit(pt_update);
+	if (err)
+		return err;
 
-static const struct xe_migrate_pt_update_ops bind_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.pre_commit = xe_pt_pre_commit,
-};
+	down_read(&vm->userptr.notifier_lock);
 
-static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
-	.populate = xe_vm_populate_pgtable,
-	.pre_commit = xe_pt_userptr_pre_commit,
-};
+	list_for_each_entry(op, &vops->list, link)
+		op_check_userptr(vm, op);
+
+	return 0;
+}
 
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
@@ -1203,181 +1310,6 @@ static int invalidation_fence_init(struct xe_gt *gt,
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
-	if ((rebind && !xe_vm_no_dma_fences(vm) && !vm->batch_invalidate_tlb) ||
-	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
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
-			int err = invalidation_fence_init(tile->primary_gt,
-							  ifence, fence,
-							  xe_vma_start(vma),
-							  xe_vma_end(vma),
-							  xe_vma_vm(vma)->usm.asid);
-			if (err) {
-				dma_fence_put(fence);
-				kfree(ifence);
-				return ERR_PTR(err);
-			}
-			fence = &ifence->base.base;
-		}
-
-		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence, !rebind &&
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
-			vma->userptr.initial_bind = true;
-			up_read(&vm->userptr.notifier_lock);
-			xe_bo_put_commit(&deferred);
-		}
-		if (!rebind && last_munmap_rebind &&
-		    xe_vm_in_compute_mode(vm))
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
@@ -1528,8 +1460,8 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
 				  void *ptr, u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	struct xe_vma *vma = pt_update->vma;
-	u64 empty = __xe_pt_empty_pte(tile, xe_vma_vm(vma), update->pt->level);
+	struct xe_vm *vm = pt_update->vops->vm;
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
 	int i;
 
 	if (map && map->is_iomem)
@@ -1573,144 +1505,393 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 	}
 }
 
-static const struct xe_migrate_pt_update_ops unbind_ops = {
-	.populate = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_pre_commit,
-};
+static void
+xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
+				 struct xe_vma *vma)
+{
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	int i, level = 0;
+	u64 start, last;
 
-static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
-	.populate = xe_migrate_clear_pgtable_callback,
-	.pre_commit = xe_pt_userptr_pre_commit,
-};
+	for (i = 0; i < pt_op->num_entries; i++) {
+		const struct xe_vm_pgtable_update *entry = &pt_op->entries[i];
 
-/**
- * __xe_pt_unbind_vma() - Disconnect and free a page-table tree for the vma
- * address range.
- * @tile: The tile to unbind for.
- * @vma: The vma to unbind.
- * @q: The exec_queue with which to do pipelined page-table updates.
- * @syncs: Entries to sync on before disconnecting the tree to be destroyed.
- * @num_syncs: Number of @sync entries.
- *
- * This function builds a the xe_vm_pgtable_update entries abstracting the
- * operations needed to detach the page-table tree to be destroyed from the
- * man vm tree.
- * It then takes the relevant locks and submits the operations for
- * pipelined detachment of the gpu page-table from  the vm main tree,
- * (which can be done either by the cpu and the GPU), Finally it frees the
- * detached page-table tree.
- *
- * Return: A valid dma-fence representing the pipelined detachment operation
- * on success, an error pointer on error.
- */
-struct dma_fence *
-__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
-		   struct xe_sync_entry *syncs, u32 num_syncs)
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
-	struct xe_range_fence *rfence;
+	u32 current_op = pt_update_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	struct llist_head *deferred = &pt_update_ops->deferred;
+	int err;
 
-	LLIST_HEAD(deferred);
+	xe_bo_assert_held(xe_vma_bo(vma));
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "Preparing bind, with range [%llx...%llx)\n",
+	       xe_vma_start(vma), xe_vma_end(vma) - 1);
+
+	pt_op->bind = true;
+	pt_op->rebind = BIT(tile->id) & vma->tile_present;
+
+	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
+				 &pt_op->num_entries);
+	if (!err) {
+		xe_tile_assert(tile, pt_op->num_entries <=
+			       ARRAY_SIZE(pt_op->entries));
+		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
+					pt_op->num_entries);
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
+			(pt_op->rebind && !xe_vm_no_dma_fences(vm) &&
+			!vm->batch_invalidate_tlb) ||
+			(!pt_op->rebind && vm->scratch_bo[tile->id] &&
+			 xe_vm_in_compute_mode(vm));
+
+		/* FIXME: Don't commit right away */
+		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
+				  pt_op->rebind, deferred);
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
+	struct llist_head *deferred = &pt_update_ops->deferred;
 
 	xe_bo_assert_held(xe_vma_bo(vma));
-	xe_vm_assert_held(vm);
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
-	       xe_vma_start(vma), xe_vma_end(vma), q);
+	       "Preparing unbind, with range [%llx...%llx)\n",
+	       xe_vma_start(vma), xe_vma_end(vma) - 1);
 
-	num_entries = xe_pt_stage_unbind(tile, vma, entries);
-	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
+	pt_op->bind = false;
+	pt_op->rebind = false;
 
-	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
-	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
-				   num_entries);
+	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
 
-	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
-	if (!ifence)
-		return ERR_PTR(-ENOMEM);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+	++pt_update_ops->current_op;
+	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
+	pt_update_ops->needs_invalidation = true;
 
-	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
-	if (!rfence) {
-		kfree(ifence);
-		return ERR_PTR(-ENOMEM);
+	/* FIXME: Don't commit right away */
+	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
+			    deferred);
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
 		if (err)
-			dma_fence_wait(fence, false);
+			return err;
+	}
 
-		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
-					      xe_vma_start(vma),
-					      xe_vma_end(vma),
-					      xe_vma_vm(vma)->usm.asid);
-		if (err) {
-			dma_fence_put(fence);
-			kfree(ifence);
-			return ERR_PTR(err);
-		}
-		fence = &ifence->base.base;
 
-		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence,
-				   DMA_RESV_USAGE_BOOKKEEP);
+	xe_tile_assert(tile, pt_update_ops->current_op ==
+		       pt_update_ops->num_ops);
 
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
+	return 0;
+}
+
+static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
+			   struct xe_vm_pgtable_update_ops *pt_update_ops,
+			   struct xe_vma *vma, struct dma_fence *fence)
+{
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
+				   DMA_RESV_USAGE_BOOKKEEP);
+	vma->tile_present |= BIT(tile->id);
+	if (xe_vma_is_userptr(vma)) {
+		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+		vma->userptr.initial_bind = true;
 	}
+	if (pt_update_ops->wait_vm_bookkeep && xe_vm_in_compute_mode(vm))
+		xe_vm_queue_rebind_worker(vm);
+}
 
-	if (!vma->tile_present)
+static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
+			     struct xe_vma *vma, struct dma_fence *fence)
+{
+	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
+				   DMA_RESV_USAGE_BOOKKEEP);
+	vma->tile_present &= ~BIT(tile->id);
+	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
+		if (xe_vma_is_userptr(vma)) {
+			lockdep_assert_held_read(&vm->userptr.notifier_lock);
 
-	if (unbind_pt_update.locked) {
-		xe_tile_assert(tile, xe_vma_is_userptr(vma));
-
-		if (!vma->tile_present) {
 			spin_lock(&vm->userptr.invalidated_lock);
 			list_del_init(&vma->userptr.invalidate_link);
 			spin_unlock(&vm->userptr.invalidated_lock);
 		}
-		up_read(&vm->userptr.notifier_lock);
-		xe_bo_put_commit(&deferred);
+	}
+}
+
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
+		unbind_op_commit(vm, tile,
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
+		unbind_op_commit(vm, tile, gpuva_to_vma(op->base.unmap.va),
+				 fence);
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
+	.pre_commit = xe_pt_pre_commit,
+};
+
+static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
+	.populate = xe_vm_populate_pgtable,
+	.clear = xe_migrate_clear_pgtable_callback,
+	.pre_commit = xe_pt_userptr_pre_commit,
+};
+
+struct dma_fence *
+xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	struct xe_vm *vm = vops->vm;
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	struct dma_fence *fence;
+	struct invalidation_fence *ifence = NULL;
+	struct xe_range_fence *rfence;
+	struct xe_vma_op *op;
+	int err = 0;
+	struct xe_migrate_pt_update update = {
+		.ops = pt_update_ops->needs_userptr_lock ?
+			&userptr_migrate_ops :
+			&migrate_ops,
+		.vops = vops,
+		.tile_id = tile->id
+	};
+
+	lockdep_assert_held(&vm->lock);
+	xe_vm_assert_held(vm);
+
+	if (pt_update_ops->needs_invalidation) {
+		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
+		if (!ifence)
+			return ERR_PTR(-ENOMEM);
+	}
+
+	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
+	if (!rfence) {
+		err = -ENOMEM;
+		goto free_ifence;
 	}
 
+	fence = xe_migrate_update_pgtables(tile->migrate, &update);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		goto free_rfence;
+	}
+
+	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
+				    &xe_range_fence_kfree_ops,
+				    pt_update_ops->start,
+				    pt_update_ops->last, fence);
+	if (err)
+		dma_fence_wait(fence, false);
+
+	/* TLB invalidation must be done before signaling rebind */
+	if (ifence) {
+		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
+					      pt_update_ops->start,
+					      pt_update_ops->last,
+					      vm->usm.asid);
+		if (err)
+			goto put_fence;
+		fence = &ifence->base.base;
+	}
+
+	dma_resv_add_fence(&vm->resv, fence,
+			   pt_update_ops->wait_vm_bookkeep ?
+			   DMA_RESV_USAGE_KERNEL :
+			   DMA_RESV_USAGE_BOOKKEEP);
+
+	list_for_each_entry(op, &vops->list, link)
+		op_commit(vops->vm, tile, pt_update_ops, op, fence);
+
+	if (pt_update_ops->needs_userptr_lock)
+		up_read(&vm->userptr.notifier_lock);
+
 	return fence;
+
+put_fence:
+	if (pt_update_ops->needs_userptr_lock)
+		up_read(&vm->userptr.notifier_lock);
+	dma_fence_put(fence);
+free_rfence:
+	kfree(rfence);
+free_ifence:
+	kfree(ifence);
+
+	return ERR_PTR(err);
+}
+
+void xe_pt_update_ops_commit(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	struct xe_vm_pgtable_update_ops *pt_update_ops =
+		&vops->pt_update_ops[tile->id];
+	int i;
+
+	lockdep_assert_held(&vops->vm->lock);
+	xe_vm_assert_held(vops->vm);
+
+	/* FIXME: Not 100% correct */
+	for (i = 0; i < pt_update_ops->num_ops; ++i) {
+		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+
+		if (pt_op->bind)
+			xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
+	}
+	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
+}
+
+void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
+{
+	lockdep_assert_held(&vops->vm->lock);
+	xe_vm_assert_held(vops->vm);
+
+	/* FIXME: Just kill VM for now + cleanup PTs */
+	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
+	xe_vm_kill(vops->vm, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index d5460e58dbbf..547d0624685b 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -17,6 +17,7 @@ struct xe_sync_entry;
 struct xe_tile;
 struct xe_vm;
 struct xe_vma;
+struct xe_vma_ops;
 
 #define xe_pt_write(xe, map, idx, data) \
 	xe_map_wr(xe, map, (idx) * sizeof(u64), u64, data)
@@ -34,6 +35,12 @@ void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
+int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
+struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
+				       struct xe_vma_ops *vops);
+void xe_pt_update_ops_commit(struct xe_tile *tile, struct xe_vma_ops *vops);
+void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
+
 struct dma_fence *
 __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue *q,
 		 struct xe_sync_entry *syncs, u32 num_syncs,
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 33b2df72aad7..f4d308ce7985 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -85,4 +85,38 @@ struct xe_vm_pgtable_update_op {
 	bool rebind;
 };
 
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
+};
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e0e7a2646e43..98c339b37936 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -474,7 +474,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
-static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
+void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 {
 	struct xe_exec_queue *q;
 
@@ -638,13 +638,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		err = PTR_ERR(rebind_fence);
 		goto out_unlock;
 	}
+	dma_fence_put(rebind_fence);
 
-	if (rebind_fence) {
-		dma_fence_wait(rebind_fence, false);
-		dma_fence_put(rebind_fence);
-	}
-
-	/* Wait on munmap style VM unbinds */
+	/* Wait on rebinds */
 	wait = dma_resv_wait_timeout(&vm->resv,
 				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
@@ -829,8 +825,31 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
+void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				 u8 tile_mask)
 {
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
 	vm->dummy_ops.op.base.op = DRM_GPUVA_OP_MAP;
 	vm->dummy_ops.op.base.map.va.addr = vma->gpuva.va.addr;
 	vm->dummy_ops.op.base.map.va.range = vma->gpuva.va.range;
@@ -864,7 +883,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		else
 			trace_xe_vma_rebind_exec(vma);
 
-		xe_vm_populate_dummy_rebind(vm, vma);
+		xe_vm_populate_dummy_rebind(vm, vma, vma->tile_present);
 		fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 		if (IS_ERR(fence))
 			return fence;
@@ -1709,7 +1728,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 	xe_vm_unlock(vm);
 
 	trace_xe_vm_free(vm);
-	dma_fence_put(vm->rebind_fence);
 	dma_resv_fini(&vm->resv);
 	xe_vma_ops_fini(&vm->dummy_ops.vops);
 	kfree(vm);
@@ -1748,192 +1766,12 @@ to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	return q ? q : vm->q[0];
 }
 
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
-	int cur_fence = 0;
-	int number_tiles = hweight8(vma->tile_present);
-	int err;
-	u8 id;
-
-	trace_xe_vma_unbind(vma);
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
-	return cf ? &cf->base : !fence ?
-		xe_exec_queue_last_fence_get(wait_exec_queue, vm) : fence;
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
-	int cur_fence = 0;
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
-}
-
 static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
 {
 	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
 		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
 }
 
-static struct dma_fence *
-xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
-	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
-	   bool immediate, bool first_op, bool last_op)
-{
-	struct dma_fence *fence;
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(bo);
-
-	if (immediate) {
-		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
-				       last_op);
-		if (IS_ERR(fence))
-			return fence;
-	} else {
-		xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
-		fence = xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-	}
-
-	return fence;
-}
-
-static struct dma_fence *
-xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
-	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-	     u32 num_syncs, bool first_op, bool last_op)
-{
-	struct dma_fence *fence;
-
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(xe_vma_bo(vma));
-
-	fence = xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op, last_op);
-	if (IS_ERR(fence))
-		return fence;
-
-	return fence;
-}
-
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
 				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
 				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
@@ -2071,21 +1909,6 @@ static const u32 region_to_mem_type[] = {
 	XE_PL_VRAM1,
 };
 
-static struct dma_fence *
-xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
-	       struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-	       u32 num_syncs, bool first_op, bool last_op)
-{
-	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
-
-	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
-		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
-				  true, first_op, last_op);
-	} else {
-		return xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-	}
-}
-
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 {
 	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
@@ -2395,7 +2218,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 				   struct xe_vma_ops *vops, bool last,
 				   bool async)
 {
-	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
 	int err = 0;
 
@@ -2403,19 +2225,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
-		bool first = list_empty(&vops->list);
 
 		INIT_LIST_HEAD(&op->link);
 		list_add_tail(&op->link, &vops->list);
 
-		if (first) {
-			op->flags |= XE_VMA_OP_FIRST;
-			op->num_syncs = num_syncs;
-			op->syncs = syncs;
-		}
-
-		op->q = q;
-
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
 		{
@@ -2515,188 +2328,21 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		}
 		case DRM_GPUVA_OP_UNMAP:
 		case DRM_GPUVA_OP_PREFETCH:
+			/* FIXME: Need to skip some prefetch ops */
 			xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask);
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
-	XE_WARN_ON(!last_op && last && !list_empty(&vops->list));
-
-	if (!last_op)
-		return 0;
-
-	if (last) {
-		last_op->flags |= XE_VMA_OP_LAST;
-		last_op->num_syncs = num_syncs;
-		last_op->syncs = syncs;
-	}
-
 	return 0;
 }
 
-static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
-				    struct xe_vma_op *op)
-{
-	struct dma_fence *fence;
-
-	lockdep_assert_held(&vm->lock);
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(xe_vma_bo(vma));
-
-	switch (op->base.op) {
-	case DRM_GPUVA_OP_MAP:
-		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
-				   op->syncs, op->num_syncs,
-				   op->map.immediate ||
-				   !xe_vm_in_fault_mode(vm),
-				   op->flags & XE_VMA_OP_FIRST,
-				   op->flags & XE_VMA_OP_LAST);
-		break;
-	case DRM_GPUVA_OP_REMAP:
-	{
-		bool prev = !!op->remap.prev;
-		bool next = !!op->remap.next;
-
-		if (!op->remap.unmap_done) {
-			if (prev || next)
-				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
-			fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
-					     op->num_syncs,
-					     op->flags & XE_VMA_OP_FIRST,
-					     op->flags & XE_VMA_OP_LAST &&
-					     !prev && !next);
-			if (IS_ERR(fence))
-				break;
-			op->remap.unmap_done = true;
-		}
-
-		if (prev) {
-			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
-			fence = xe_vm_bind(vm, op->remap.prev, op->q,
-					   xe_vma_bo(op->remap.prev), op->syncs,
-					   op->num_syncs, true, false,
-					   op->flags & XE_VMA_OP_LAST && !next);
-			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (IS_ERR(fence))
-				break;
-			op->remap.prev = NULL;
-		}
-
-		if (next) {
-			op->remap.next->gpuva.flags |= XE_VMA_LAST_REBIND;
-			fence = xe_vm_bind(vm, op->remap.next, op->q,
-					   xe_vma_bo(op->remap.next),
-					   op->syncs, op->num_syncs,
-					   true, false,
-					   op->flags & XE_VMA_OP_LAST);
-			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (IS_ERR(fence))
-				break;
-			op->remap.next = NULL;
-		}
-
-		break;
-	}
-	case DRM_GPUVA_OP_UNMAP:
-		fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
-				     op->num_syncs, op->flags & XE_VMA_OP_FIRST,
-				     op->flags & XE_VMA_OP_LAST);
-		break;
-	case DRM_GPUVA_OP_PREFETCH:
-		fence = xe_vm_prefetch(vm, vma, op->q, op->syncs, op->num_syncs,
-				       op->flags & XE_VMA_OP_FIRST,
-				       op->flags & XE_VMA_OP_LAST);
-		break;
-	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-	}
-
-	if (IS_ERR(fence))
-		trace_xe_vma_fail(vma);
-
-	return fence;
-}
-
-static struct dma_fence *
-__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
-		    struct xe_vma_op *op)
-{
-	struct dma_fence *fence;
-	int err;
-
-retry_userptr:
-	fence = op_execute(vm, vma, op);
-	if (IS_ERR(fence) && PTR_ERR(fence) == -EAGAIN &&
-	    xe_vma_is_userptr(vma)) {
-		lockdep_assert_held_write(&vm->lock);
-		err = xe_vma_userptr_pin_pages(vma);
-		if (!err)
-			goto retry_userptr;
-
-		fence = ERR_PTR(err);
-		trace_xe_vma_fail(vma);
-	}
-
-	return fence;
-}
-
-static struct dma_fence *
-xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
-{
-	struct dma_fence *fence = ERR_PTR(-ENOMEM);
-
-	lockdep_assert_held(&vm->lock);
-
-#ifdef TEST_VM_ASYNC_OPS_ERROR
-	if (op->inject_error) {
-		op->inject_error = false;
-		return fence;
-	}
-#endif
-
-	switch (op->base.op) {
-	case DRM_GPUVA_OP_MAP:
-		fence = __xe_vma_op_execute(vm, op->map.vma, op);
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
-		fence = __xe_vma_op_execute(vm, vma, op);
-		break;
-	}
-	case DRM_GPUVA_OP_UNMAP:
-		fence = __xe_vma_op_execute(vm, gpuva_to_vma(op->base.unmap.va),
-					    op);
-		break;
-	case DRM_GPUVA_OP_PREFETCH:
-		fence = __xe_vma_op_execute(vm,
-					    gpuva_to_vma(op->base.prefetch.va),
-					    op);
-		break;
-	default:
-		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
-	}
-
-	return fence;
-}
-
 static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
@@ -2853,18 +2499,97 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 
 struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
 {
-	struct xe_vma_op *op, *next;
+	struct xe_exec_queue *q = vops->q;
+	struct xe_tile *tile;
 	struct dma_fence *fence = NULL;
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
+	int number_tiles = 0, current_fence = 0, err;
+	u8 id;
+
+	for_each_tile(tile, vm->xe, id) {
+		if (vops->pt_update_ops[id].num_ops)
+			++number_tiles;
 
-	list_for_each_entry_safe(op, next, &vops->list, link) {
-		fence = xe_vma_op_execute(vm, op);
-		if (IS_ERR(fence)) {
-			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
-				 op->base.op, PTR_ERR(fence));
-			return ERR_PTR(-ENOSPC);
+		if (vops->pt_update_ops[id].q)
+			continue;
+
+		if (q) {
+			vops->pt_update_ops[id].q = q;
+			if (vm->pt_root[id] && !list_empty(&q->multi_gt_list))
+				q = list_next_entry(q, multi_gt_list);
+		} else {
+			vops->pt_update_ops[id].q = vm->q[id];
 		}
 	}
 
+	if (number_tiles == 0)
+		return ERR_PTR(-ENODATA);
+
+	if (number_tiles > 1) {
+		fences = kmalloc_array(number_tiles, sizeof(*fences),
+				       GFP_KERNEL);
+		if (!fences)
+			return ERR_PTR(-ENOMEM);
+	}
+
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
+	}
+
+	for_each_tile(tile, vm->xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
+
+		xe_pt_update_ops_commit(tile, vops);
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
 	return fence;
 }
 
@@ -2908,13 +2633,10 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 			return err;
 
 		fence = xe_vm_ops_execute(vm, vops);
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			/* FIXME: Killing VM rather than proper error handling */
-			xe_vm_kill(vm, false);
-		} else {
-			vm_bind_ioctl_ops_install_fences(vm, vops, fence);
-		}
+		if (IS_ERR(fence))
+			return PTR_ERR(fence);
+
+		vm_bind_ioctl_ops_install_fences(vm, vops, fence);
 	}
 
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 7cbb512bcb10..34850f04d966 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -224,9 +224,12 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 		      unsigned int num_shared);
 
-void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma);
+void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				 u8 tile_mask);
 struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
 
+void xe_vm_kill(struct xe_vm *vm, bool unlocked);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aa72330f824f..adbd8199aa8b 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -169,29 +169,18 @@ struct xe_vma_op_prefetch {
 
 /** enum xe_vma_op_flags - flags for VMA operation */
 enum xe_vma_op_flags {
-	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
-	XE_VMA_OP_FIRST			= BIT(0),
-	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
-	XE_VMA_OP_LAST			= BIT(1),
 	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
-	XE_VMA_OP_COMMITTED		= BIT(2),
+	XE_VMA_OP_COMMITTED		= BIT(0),
 	/** @XE_VMA_OP_PREV_COMMITTED: Previous VMA operation committed */
-	XE_VMA_OP_PREV_COMMITTED	= BIT(3),
+	XE_VMA_OP_PREV_COMMITTED	= BIT(1),
 	/** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation committed */
-	XE_VMA_OP_NEXT_COMMITTED	= BIT(4),
+	XE_VMA_OP_NEXT_COMMITTED	= BIT(2),
 };
 
 /** struct xe_vma_op - VMA operation */
 struct xe_vma_op {
 	/** @base: GPUVA base operation */
 	struct drm_gpuva_op base;
-	/** @q: exec queue for this operation */
-	struct xe_exec_queue *q;
-	/**
-	 * @syncs: syncs for this operation, only used on first and last
-	 * operation
-	 */
-	struct xe_sync_entry *syncs;
 	/** @num_syncs: number of syncs */
 	u32 num_syncs;
 	/** @link: operation link */
@@ -222,19 +211,14 @@ struct xe_vma_ops {
 	struct list_head list;
 	/** @vm: VM */
 	struct xe_vm *vm;
-	/** @q: exec queue these operations */
+	/** @q: exec queue for VMA operations */
 	struct xe_exec_queue *q;
 	/** @syncs: syncs these operation */
 	struct xe_sync_entry *syncs;
 	/** @num_syncs: number of syncs */
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
-	struct {
-		/** @ops: operations */
-		struct xe_vm_pgtable_update_op *ops;
-		/** @num_ops: number of operations */
-		u32 num_ops;
-	} pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
 };
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
@@ -295,9 +279,6 @@ struct xe_vm {
 	 */
 	struct list_head rebind_list;
 
-	/** @rebind_fence: rebind fence from execbuf */
-	struct dma_fence *rebind_fence;
-
 	/**
 	 * @destroy_work: worker to destroy VM, needed as a dma_fence signaling
 	 * from an irq context can be last put and the destroy needs to be able
-- 
2.34.1

