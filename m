Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8760BC79F87
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285E110FB65;
	Fri,  4 Sep 2026 21:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HK8FjoSU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2904510E580
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556582; x=1820092582;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xd8H3RL2y//Qzvr6ccWUQZmhfGw23HGuUUr53avVuGo=;
 b=HK8FjoSUKz3t+6oSVxkFZ0LC4QbqdRXFbNja/hNsmmU5vLdsSNXBpCNz
 i4d41cu28+0+guKbgD/Dxa79N+vYKiNNME9bWkXeilkDebRNug7fnwf0H
 1EkzOBIgwdUR6DdMcaukkXHada8YrmrbbCHtmss9/Rhr81C5VK1hMfEGe
 4/gfJl/UZqaWUVV6JUCEM2zwnItTEP6NbLGzDA6spruYEfjwHqQnvEjWA
 Qj/2X9jU1gjrJWRVwkRtnrNSjvschVXc0sg3UtTqHrGgXMlKZyalay9RX
 7QGC4NnFcphVEhhg1L3FMnVMp5ckyNirG8+QNq2o23VS2lYy6QxpCirQH A==;
X-CSE-ConnectionGUID: 6oaNrIAzT7e45M1sRE5ihg==
X-CSE-MsgGUID: Qg2DTjRNSk6BemkwA7IjPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096810"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:21 -0700
X-CSE-ConnectionGUID: U0iSevRPSkC3zwZMmJUtIw==
X-CSE-MsgGUID: ivvZfhiYQsCJF962o8Ah8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563433"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 13/24] drm/xe: Enable CPU binds for jobs
Date: Fri,  4 Sep 2026 14:16:02 -0700
Message-Id: <20260904211613.3934307-14-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

No reason to use the GPU for binds.

Benefits of CPU-based binds:
- Lower latency once dependencies are resolved, as there is no
  interaction with the GuC or a hardware context switch both of which
  are relatively slow.
- Large arrays of binds do not risk running out of migration PTEs,
  avoiding -ENOBUFS being returned to userspace.
- Kernel binds are decoupled from the migration exec queue (which issues
  copies and clears), so they cannot get stuck behind unrelated
  jobs—this can be a problem with parallel GPU faults.
- Paves the for path decouping binds from tiles and individual engines
- Enables ULLS on the migration exec queue, as this queue has exclusive
  access to the paging copy engine.

Update migration layer to formulate a PT job which will issue CPU bind
in the submission backend.

All code related to GPU-based binding has been removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-14-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_bo_types.h |   2 -
 drivers/gpu/drm/xe/xe_migrate.c  | 249 +++----------------------------
 drivers/gpu/drm/xe/xe_pt.c       |   1 -
 3 files changed, 17 insertions(+), 235 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 0eb93052c1d5..8ec4a01a0092 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -90,8 +90,6 @@ struct xe_bo {
 
 	/** @freed: List node for delayed put. */
 	struct llist_node freed;
-	/** @update_index: Update index if PT BO */
-	int update_index;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ba8e195afcc8..e5c46e0fa960 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -77,18 +77,12 @@ struct xe_migrate {
 	 * Protected by @job_mutex.
 	 */
 	struct dma_fence *fence;
-	/**
-	 * @vm_update_sa: For integrated, used to suballocate page-tables
-	 * out of the pt_bo.
-	 */
-	struct drm_suballoc_manager vm_update_sa;
 	/** @min_chunk_size: For dgfx, Minimum chunk size */
 	u64 min_chunk_size;
 };
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
 #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */
-#define NUM_KERNEL_PDE 15
 #define NUM_PT_SLOTS 48
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 #define MAX_NUM_PTE 512
@@ -113,7 +107,6 @@ static void xe_migrate_fini(void *arg)
 
 	dma_fence_put(m->fence);
 	xe_bo_put(m->pt_bo);
-	drm_suballoc_manager_fini(&m->vm_update_sa);
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
@@ -234,8 +227,6 @@ static int xe_migrate_pt_bo_alloc(struct xe_tile *tile, struct xe_migrate *m,
 	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
 	/* Must be a multiple of 64K to support all platforms */
 	BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
-	/* And one slot reserved for the 4KiB page table updates */
-	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
 
 	/* Need to be sure everything fits in the first PT, or create more */
 	xe_tile_assert(tile, m->batch_base_ofs + xe_bo_size(batch) < SZ_2M);
@@ -391,17 +382,9 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		}
 	}
 
-	if (ofs)
-		*ofs = map_ofs;
-}
-
-static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
-{
 	/*
 	 * Example layout created above, with root level = 3:
 	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
-	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
-	 * [PT9...PT40]: Userspace PT's for VM_BIND, 4 KiB PTE's
 	 * [PT41 = PDE 0] [PT44...PT47 = 4K and 2M vram identity maps]
 	 *
 	 * This makes the lowest part of the VM point to the pagetables.
@@ -409,19 +392,13 @@ static void xe_migrate_suballoc_manager_init(struct xe_migrate *m, u32 map_ofs)
 	 * and flushes, other parts of the VM can be used either for copying and
 	 * clearing.
 	 *
-	 * For performance, the kernel reserves PDE's, so about 20 are left
-	 * for async VM updates.
-	 *
 	 * To make it easier to work, each scratch PT is put in slot (1 + PT #)
 	 * everywhere, this allows lockless updates to scratch pages by using
 	 * the different addresses in VM.
 	 */
-#define NUM_VMUSA_UNIT_PER_PAGE	32
-#define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
-#define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
-	drm_suballoc_manager_init(&m->vm_update_sa,
-				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
-				  NUM_VMUSA_UNIT_PER_PAGE, 0);
+
+	if (ofs)
+		*ofs = map_ofs;
 }
 
 static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
@@ -466,7 +443,6 @@ static int xe_migrate_lock_prepare_vm(struct xe_tile *tile, struct xe_migrate *m
 			return err;
 
 		xe_migrate_prepare_vm(tile, m, vm, &map_ofs);
-		xe_migrate_suballoc_manager_init(m, map_ofs);
 		drm_exec_retry_on_contention(&exec);
 		xe_validation_retry_on_oom(&ctx, &err);
 	}
@@ -1169,6 +1145,9 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
 	return migrate->q->lrc[0];
 }
 
+/* XXX: With CPU binds this can be removed in a follow up */
+#define NUM_KERNEL_PDE 15
+
 static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
 {
 	/*
@@ -1788,56 +1767,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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
-							   XE_PAGE_SIZE), false);
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
@@ -1938,162 +1867,18 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
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
 	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
-	bool usm = is_migrate && xe->info.has_usm;
-
-	for (i = 0; i < pt_update_ops->num_ops; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->pt_job_ops->ops[i];
-		struct xe_vm_pgtable_update *updates = pt_op->entries;
-
-		num_updates += pt_op->num_entries;
-		for (j = 0; j < pt_op->num_entries; ++j) {
-			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords,
-						    MAX_PTE_PER_SDI);
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
-		batch_size += 6 * (num_updates / MAX_PTE_PER_SDI + 1) +
-			num_updates * 2;
-
-	bb = xe_bb_new(gt, batch_size, usm);
-	if (IS_ERR(bb))
-		return ERR_CAST(bb);
-
-	/* For sysmem PTE's, need to map them in our hole.. */
-	if (!IS_DGFX(xe)) {
-		u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
-		u32 ptes, ofs;
-
-		ppgtt_ofs = NUM_KERNEL_PDE - 1;
-		if (!is_migrate) {
-			u32 num_units = DIV_ROUND_UP(num_updates,
-						     NUM_VMUSA_WRITES_PER_UNIT);
-
-			if (num_units > m->vm_update_sa.size) {
-				err = -ENOBUFS;
-				goto err_bb;
-			}
-			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
-						 GFP_KERNEL, true, 0);
-			if (IS_ERR(sa_bo)) {
-				err = PTR_ERR(sa_bo);
-				goto err_bb;
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
-		i = 0;
-		j = 0;
-		ptes = num_updates;
-		ofs = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
-		while (ptes) {
-			u32 chunk = min(MAX_PTE_PER_SDI, ptes);
-			u32 idx = 0;
-
-			bb->cs[bb->len++] = MI_STORE_DATA_IMM |
-				MI_SDI_NUM_QW(chunk);
-			bb->cs[bb->len++] = ofs;
-			bb->cs[bb->len++] = 0; /* upper_32_bits */
-
-			for (; i < pt_update_ops->num_ops; ++i) {
-				struct xe_vm_pgtable_update_op *pt_op =
-					&pt_update_ops->pt_job_ops->ops[i];
-				struct xe_vm_pgtable_update *updates = pt_op->entries;
-
-				for (; j < pt_op->num_entries; ++j, ++current_update, ++idx) {
-					struct xe_vm *vm = pt_update->vops->vm;
-					struct xe_bo *pt_bo = updates[j].pt_bo;
-
-					if (idx == chunk)
-						goto next_cmd;
-
-					xe_tile_assert(tile, xe_bo_size(pt_bo) == SZ_4K);
-
-					/* Map a PT at most once */
-					if (pt_bo->update_index < 0)
-						pt_bo->update_index = current_update;
-
-					addr = vm->pt_ops->pte_encode_bo(pt_bo, 0,
-									 pat_index, 0);
-					bb->cs[bb->len++] = lower_32_bits(addr);
-					bb->cs[bb->len++] = upper_32_bits(addr);
-				}
-
-				j = 0;
-			}
-
-next_cmd:
-			ptes -= chunk;
-			ofs += chunk * sizeof(u64);
-		}
-
-		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
-		update_idx = bb->len;
-
-		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
-			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
-		for (i = 0; i < pt_update_ops->num_ops; ++i) {
-			struct xe_vm_pgtable_update_op *pt_op =
-				&pt_update_ops->pt_job_ops->ops[i];
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
-				&pt_update_ops->pt_job_ops->ops[i];
-			struct xe_vm_pgtable_update *updates = pt_op->entries;
-
-			for (j = 0; j < pt_op->num_entries; ++j)
-				write_pgtable(tile, bb, 0, pt_op, &updates[j],
-					      pt_update);
-		}
-	}
+	int err;
 
-	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
-					 xe_migrate_batch_base(m, usm),
-					 update_idx);
+	job = xe_sched_job_create(pt_update_ops->q, NULL);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
-		goto err_sa;
+		goto err_out;
 	}
 
-	xe_sched_job_add_migrate_flush(job, MI_INVALIDATE_TLB);
+	xe_tile_assert(tile, job->is_pt_job);
 
 	if (ops->pre_commit) {
 		pt_update->job = job;
@@ -2104,6 +1889,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (is_migrate)
 		mutex_lock(&m->job_mutex);
 
+	job->pt_update[0].vm = pt_update->vops->vm;
+	job->pt_update[0].tile = tile;
+	job->pt_update[0].ops = ops;
+	job->pt_update[0].pt_job_ops =
+		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
+
 	xe_sched_job_arm(job);
 	fence = dma_fence_get(&job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -2111,17 +1902,11 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
 
-	xe_bb_free(bb, fence);
-	drm_suballoc_free(sa_bo, fence);
-
 	return fence;
 
 err_job:
 	xe_sched_job_put(job);
-err_sa:
-	drm_suballoc_free(sa_bo, NULL);
-err_bb:
-	xe_bb_free(bb, NULL);
+err_out:
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 16126ffc2ec1..24190ba4f533 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -387,7 +387,6 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->pt = parent;
 	entry->flags = 0;
 	entry->qwords = 0;
-	entry->pt_bo->update_index = -1;
 	entry->level = parent->level;
 
 	if (alloc_entries) {
-- 
2.34.1

