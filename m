Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2958C001DE
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jul 2023 21:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF4A10E531;
	Wed, 19 Jul 2023 21:12:08 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443D010E3FC
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jul 2023 21:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689801125; x=1721337125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=565UPE0wCNgxd7gk6WqJQi6ljYmv39Hl4ZLgPNbskms=;
 b=MAt+hhGz/oTU3mvadCPABmpi5Ldz+sRpGQYkMHvi8TjF1b7s9ef6aqhF
 B+05YSlgDPcQ9aueQ0Cgk2qglJqsUxr7dbLXL1Dus/ADHF6e6/UKTH5oM
 GzXS2AI30aL3Kt+5aEqZ28zHxPxNvxx2It5qoglswIZ7NQ6LhuPaopixK
 cr45QPI8o1Yd4Cxpu8dRd/ROo4f0v8P/st6A42cPeqHhOeCMFZaGUpDaQ
 G84AyYsz5xJ9mnCASmKyjoj75wkXe5L/2g4+K5U8rP7yvd0osnbQdPB7+
 J0maEviW0MVXz3E8LcZ39vwYC8xaPDMA4Z2uiWcKKbPZIsbI2oev7kK3O Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="369221244"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="369221244"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 14:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674457455"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="674457455"
Received: from unknown (HELO lstrano-desk.jf.intel.com) ([10.24.89.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 14:10:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 19 Jul 2023 14:10:51 -0700
Message-Id: <20230719211051.84708-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719211051.84708-1-matthew.brost@intel.com>
References: <20230719211051.84708-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe: Make bind engines safe
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

We currently have a race between bind engines which can result in
corrupted page tables leading to faults.

A simple example:
bind A 0x0000-0x1000, engine A, has unsatisfied in-fence
bind B 0x1000-0x2000, engine B, no in-fences
exec A uses 0x1000-0x2000

Bind B will pass bind A and exec A will fault. This occurs as bind A
programs the root of the page table in a bind job which is held up by an
in-fence. Bind B in this case just programs a leaf entry of the
structure.

To fix use range-fence utility to track cross bind engine conflicts. In
the above example bind A would insert an dependency into the range-fence
tree with a key of 0x0-0x7fffffffff, bind B would find that dependency
and its bind job would scheduled behind the unsatisfied in-fence and
bind A's job.

Reviewed-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c  |   2 +
 drivers/gpu/drm/xe/xe_migrate.h  |   8 +++
 drivers/gpu/drm/xe/xe_pt.c       | 115 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       |   8 +++
 drivers/gpu/drm/xe/xe_vm_types.h |   7 ++
 5 files changed, 140 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 4c6f299fd024..bc7dac4e2086 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1074,6 +1074,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 		return ERR_PTR(-ETIME);
 
 	if (ops->pre_commit) {
+		pt_update->job = NULL;
 		err = ops->pre_commit(pt_update);
 		if (err)
 			return ERR_PTR(err);
@@ -1295,6 +1296,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		goto err_job;
 
 	if (ops->pre_commit) {
+		pt_update->job = job;
 		err = ops->pre_commit(pt_update);
 		if (err)
 			goto err_job;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 204337ea3b4e..da20b1a0e596 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -69,6 +69,14 @@ struct xe_migrate_pt_update {
 	const struct xe_migrate_pt_update_ops *ops;
 	/** @vma: The vma we're updating the pagetable for. */
 	struct xe_vma *vma;
+	/** @job: The job if a GPU page-table update. NULL otherwise */
+	struct xe_sched_job *job;
+	/** @start: Start of update for the range fence */
+	u64 start;
+	/** @last: Last of update for the range fence */
+	u64 last;
+	/** tild_id: Tile ID of the update */
+	u8 tile_id;
 };
 
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 851ea7c01b91..a458224a88ca 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1116,6 +1116,53 @@ struct xe_pt_migrate_pt_update {
 	bool locked;
 };
 
+/*
+ * This function adds the needed dependencies to a page-table update job
+ * to make sure racing jobs for separate bind engines don't race writing
+ * to the same page-table range, wreaking havoc. Initially use a single
+ * fence for the entire VM. An optimization would use smaller granularity.
+ */
+static int xe_pt_vm_dependencies(struct xe_sched_job *job,
+				 struct xe_range_fence_tree *rftree,
+				 u64 start, u64 last)
+{
+	struct xe_range_fence *rtfence;
+	struct dma_fence *fence;
+	int err;
+
+	rtfence = xe_range_fence_tree_first(rftree, start, last);
+	while (rtfence) {
+		fence = rtfence->fence;
+
+		if (!dma_fence_is_signaled(fence)) {
+			/*
+			 * Is this a CPU update? GPU is busy updating, so return
+			 * an error
+			 */
+			if (!job)
+				return -ETIME;
+
+			dma_fence_get(fence);
+			err = drm_sched_job_add_dependency(&job->drm, fence);
+			if (err)
+				return err;
+		}
+
+		rtfence = xe_range_fence_tree_next(rtfence, start, last);
+	}
+
+	return 0;
+}
+
+static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
+{
+	struct xe_range_fence_tree *rftree =
+		&xe_vma_vm(pt_update->vma)->rftree[pt_update->tile_id];
+
+	return xe_pt_vm_dependencies(pt_update->job, rftree,
+				     pt_update->start, pt_update->last);
+}
+
 static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_pt_migrate_pt_update *userptr_update =
@@ -1123,6 +1170,13 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	struct xe_vma *vma = pt_update->vma;
 	unsigned long notifier_seq = vma->userptr.notifier_seq;
 	struct xe_vm *vm = xe_vma_vm(vma);
+	int err = xe_pt_vm_dependencies(pt_update->job,
+					&vm->rftree[pt_update->tile_id],
+					pt_update->start,
+					pt_update->last);
+
+	if (err)
+		return err;
 
 	userptr_update->locked = false;
 
@@ -1161,6 +1215,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 
 static const struct xe_migrate_pt_update_ops bind_ops = {
 	.populate = xe_vm_populate_pgtable,
+	.pre_commit = xe_pt_pre_commit,
 };
 
 static const struct xe_migrate_pt_update_ops userptr_bind_ops = {
@@ -1258,6 +1313,27 @@ static int invalidation_fence_init(struct xe_gt *gt,
 	return ret && ret != -ENOENT ? ret : 0;
 }
 
+static void xe_pt_calc_rfence_interval(struct xe_vma *vma,
+				       struct xe_pt_migrate_pt_update *update,
+				       struct xe_vm_pgtable_update *entries,
+				       u32 num_entries)
+{
+	int i, level = 0;
+
+	for (i = 0; i < num_entries; i++) {
+		const struct xe_vm_pgtable_update *entry = &entries[i];
+
+		if (entry->pt->level > level)
+			level = entry->pt->level;
+	}
+
+	/* Greedy (non-optimal) calculation but simple */
+	update->base.start = ALIGN_DOWN(xe_vma_start(vma),
+					0x1ull << xe_pt_shift(level));
+	update->base.last = ALIGN(xe_vma_end(vma),
+				  0x1ull << xe_pt_shift(level)) - 1;
+}
+
 /**
  * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
  * address range.
@@ -1290,6 +1366,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		.base = {
 			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
 			.vma = vma,
+			.tile_id = tile->id,
 		},
 		.bind = true,
 	};
@@ -1297,6 +1374,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	u32 num_entries;
 	struct dma_fence *fence;
 	struct invalidation_fence *ifence = NULL;
+	struct xe_range_fence *rfence;
 	int err;
 
 	bind_pt_update.locked = false;
@@ -1313,6 +1391,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
+	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
+				   num_entries);
 
 	/*
 	 * If rebind, we have to invalidate TLB on !LR vms to invalidate
@@ -1333,6 +1413,12 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 			return ERR_PTR(-ENOMEM);
 	}
 
+	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
+	if (!rfence) {
+		kfree(ifence);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	fence = xe_migrate_update_pgtables(tile->migrate,
 					   vm, xe_vma_bo(vma),
 					   e ? e : vm->eng[tile->id],
@@ -1342,6 +1428,14 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	if (!IS_ERR(fence)) {
 		bool last_munmap_rebind = vma->gpuva.flags & XE_VMA_LAST_REBIND;
 		LLIST_HEAD(deferred);
+		int err;
+
+		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
+					    &xe_range_fence_kfree_ops,
+					    bind_pt_update.base.start,
+					    bind_pt_update.base.last, fence);
+		if (err)
+			dma_fence_wait(fence, false);
 
 		/* TLB invalidation must be done before signaling rebind */
 		if (ifence) {
@@ -1380,6 +1474,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 			queue_work(vm->xe->ordered_wq,
 				   &vm->preempt.rebind_work);
 	} else {
+		kfree(rfence);
 		kfree(ifence);
 		if (bind_pt_update.locked)
 			up_read(&vm->userptr.notifier_lock);
@@ -1589,6 +1684,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 
 static const struct xe_migrate_pt_update_ops unbind_ops = {
 	.populate = xe_migrate_clear_pgtable_callback,
+	.pre_commit = xe_pt_pre_commit,
 };
 
 static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
@@ -1626,12 +1722,15 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 			.ops = xe_vma_is_userptr(vma) ? &userptr_unbind_ops :
 			&unbind_ops,
 			.vma = vma,
+			.tile_id = tile->id,
 		},
 	};
 	struct xe_vm *vm = xe_vma_vm(vma);
 	u32 num_entries;
 	struct dma_fence *fence = NULL;
 	struct invalidation_fence *ifence;
+	struct xe_range_fence *rfence;
+
 	LLIST_HEAD(deferred);
 
 	xe_bo_assert_held(xe_vma_bo(vma));
@@ -1645,11 +1744,19 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
+	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
+				   num_entries);
 
 	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 	if (!ifence)
 		return ERR_PTR(-ENOMEM);
 
+	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
+	if (!rfence) {
+		kfree(ifence);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	/*
 	 * Even if we were already evicted and unbind to destroy, we need to
 	 * clear again here. The eviction may have updated pagetables at a
@@ -1664,6 +1771,13 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	if (!IS_ERR(fence)) {
 		int err;
 
+		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
+					    &xe_range_fence_kfree_ops,
+					    unbind_pt_update.base.start,
+					    unbind_pt_update.base.last, fence);
+		if (err)
+			dma_fence_wait(fence, false);
+
 		/* TLB invalidation must be done before signaling unbind */
 		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
 		if (err) {
@@ -1685,6 +1799,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 				    unbind_pt_update.locked ? &deferred : NULL);
 		vma->tile_present &= ~BIT(tile->id);
 	} else {
+		kfree(rfence);
 		kfree(ifence);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fc2a09087d98..f8e6f1fda1fe 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1229,6 +1229,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	INIT_LIST_HEAD(&vm->preempt.engines);
 	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
 
+	for_each_tile(tile, xe, id)
+		xe_range_fence_tree_init(&vm->rftree[id]);
+
 	INIT_LIST_HEAD(&vm->extobj.list);
 
 	if (!(flags & XE_VM_FLAG_MIGRATION))
@@ -1348,6 +1351,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	drm_gpuva_manager_destroy(&vm->mgr);
 err_put:
 	dma_resv_fini(&vm->resv);
+	for_each_tile(tile, xe, id)
+		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_put(xe);
@@ -1490,6 +1495,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe->usm.num_vm_in_non_fault_mode--;
 	mutex_unlock(&xe->usm.lock);
 
+	for_each_tile(tile, xe, id)
+		xe_range_fence_tree_fini(&vm->rftree[id]);
+
 	xe_vm_put(vm);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 379c5d617d72..bcbcad1929d6 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -15,6 +15,7 @@
 
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
+#include "xe_range_fence.h"
 
 struct async_op_fence;
 struct xe_bo;
@@ -182,6 +183,12 @@ struct xe_vm {
 	 */
 	struct work_struct destroy_work;
 
+	/**
+	 * @rftree: range fence tree to track updates to page table structure.
+	 * Used to implement conflict tracking between independent bind engines.
+	 */
+	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
+
 	/** @extobj: bookkeeping for external objects. Protected by the vm lock */
 	struct {
 		/** @enties: number of external BOs attached this VM */
-- 
2.34.1

