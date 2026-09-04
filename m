Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13151C79F85
	for <intel-xe@archiver.kernel.org>; Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9300A10FB4D;
	Fri,  4 Sep 2026 21:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j1z5QDQ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1A810FB3A
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 21:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788556581; x=1820092581;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=IR2ZvF/GoWfQY0oOEmPuRogtElr9FRFVvkoa/S2Nhjk=;
 b=j1z5QDQ3tgkfleebIuWeArFyiU0zRcSRhTD448H4P9vwgN1sU14P41I5
 UHRfO0/qxjgBf6hCj+h+OL3AtAgbmElH/mQ2807kEmeEVjLLdx9Z7BfRn
 3J6pfg9NbC6EI1tFQC2OOeMmWS+lqIsbj2JYNzVZwy0kZ4Fn/q7XqofS/
 n6hvUUFm2fYAeQeOyo+lsxEl6tPFEsb5xYQDq/IePWFAxvYB6IawbnMh+
 pDAenSO9IJVEinUQKYkOedQCCcJSPDJtottBymIKibArz0TOuHUHkykLw
 DUyn3y1VRG2617YXAJA5jhiBLFiiKcuuxuYdK4sjsgQ7U/+vQ/iXNmaGf A==;
X-CSE-ConnectionGUID: a9Jt4Ny2RlGAZMJFz9RaAw==
X-CSE-MsgGUID: Hi2QNVM0TamQ8zq8GMbsgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="89096806"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="89096806"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:20 -0700
X-CSE-ConnectionGUID: x4mlnmHYSYyCSH37tB1H6g==
X-CSE-MsgGUID: 0+bj0RhWSNGfZlVptgsLOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="267563427"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 14:16:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 09/24] drm/xe: Add struct xe_pt_job_ops
Date: Fri,  4 Sep 2026 14:15:58 -0700
Message-Id: <20260904211613.3934307-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904211613.3934307-1-matthew.brost@intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
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

Add struct xe_pt_job_ops, a dynamically refcounted object that contains
the information required to issue a CPU bind via a job after the initial
bind IOCTL returns.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-10-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_migrate.c  |  10 +--
 drivers/gpu/drm/xe/xe_pt.c       | 136 +++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_pt.h       |   4 +
 drivers/gpu/drm/xe/xe_pt_types.h |  27 ++++--
 drivers/gpu/drm/xe/xe_vm.c       |  10 +--
 5 files changed, 152 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 68a0b05f56ec..217e526526e0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1875,7 +1875,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	}
 
 	xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
-					       pt_update_ops->ops,
+					       pt_update_ops->pt_job_ops->ops,
 					       pt_update_ops->num_ops);
 
 	return dma_fence_get_stub();
@@ -1902,7 +1902,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	bool usm = is_migrate && xe->info.has_usm;
 
 	for (i = 0; i < pt_update_ops->num_ops; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->pt_job_ops->ops[i];
 		struct xe_vm_pgtable_update *updates = pt_op->entries;
 
 		num_updates += pt_op->num_entries;
@@ -1971,7 +1971,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 			for (; i < pt_update_ops->num_ops; ++i) {
 				struct xe_vm_pgtable_update_op *pt_op =
-					&pt_update_ops->ops[i];
+					&pt_update_ops->pt_job_ops->ops[i];
 				struct xe_vm_pgtable_update *updates = pt_op->entries;
 
 				for (; j < pt_op->num_entries; ++j, ++current_update, ++idx) {
@@ -2008,7 +2008,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
 		for (i = 0; i < pt_update_ops->num_ops; ++i) {
 			struct xe_vm_pgtable_update_op *pt_op =
-				&pt_update_ops->ops[i];
+				&pt_update_ops->pt_job_ops->ops[i];
 			struct xe_vm_pgtable_update *updates = pt_op->entries;
 
 			for (j = 0; j < pt_op->num_entries; ++j) {
@@ -2026,7 +2026,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 		for (i = 0; i < pt_update_ops->num_ops; ++i) {
 			struct xe_vm_pgtable_update_op *pt_op =
-				&pt_update_ops->ops[i];
+				&pt_update_ops->pt_job_ops->ops[i];
 			struct xe_vm_pgtable_update *updates = pt_op->entries;
 
 			for (j = 0; j < pt_op->num_entries; ++j)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index e560f167fdf1..30127ebf1b60 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -206,6 +206,7 @@ unsigned int xe_pt_shift(unsigned int level)
  */
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 {
+	bool added = false;
 	int i;
 
 	if (!pt)
@@ -213,7 +214,19 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 
 	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
 	xe_bo_unpin(pt->bo);
-	xe_bo_put_deferred(pt->bo, deferred, NULL);
+	xe_bo_put_deferred(pt->bo, deferred, &added);
+	if (added) {
+		xe_assert(pt->bo->vm->xe, !kref_read(&pt->bo->ttm.base.refcount));
+
+		/*
+		 * We need the VM present until the BO is destroyed as it shares
+		 * a dma-resv and BO destroy is async. Reinit BO refcount so
+		 * xe_bo_put_async can be used when the PT job ops refcount goes
+		 * to zero.
+		 */
+		xe_vm_get(pt->bo->vm);
+		pt->bo->flags |= XE_BO_FLAG_PUT_VM_ASYNC;
+	}
 
 	if (pt->level > 0 && pt->num_live) {
 		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
@@ -2081,13 +2094,13 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 static struct xe_vm_pgtable_update_op *
 to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 op_idx)
 {
-	return &pt_update_ops->ops[op_idx];
+	return &pt_update_ops->pt_job_ops->ops[op_idx];
 }
 
 static u32
 get_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
-	return pt_update_ops->current_op;
+	return pt_update_ops->pt_job_ops->current_op;
 }
 
 static struct xe_vm_pgtable_update_op *
@@ -2099,7 +2112,7 @@ to_current_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
 static void
 incr_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
-	++pt_update_ops->current_op;
+	++pt_update_ops->pt_job_ops->current_op;
 }
 
 static void
@@ -2473,8 +2486,7 @@ static int op_prepare(struct xe_vm *vm,
 static void
 xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
-	init_llist_head(&pt_update_ops->deferred);
-	pt_update_ops->current_op = 0;
+	pt_update_ops->pt_job_ops->current_op = 0;
 	pt_update_ops->start = ~0x0ull;
 	pt_update_ops->last = 0x0ull;
 	pt_update_ops->needs_svm_lock = false;
@@ -2824,7 +2836,8 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 			to_pt_op(pt_update_ops, i);
 
 		xe_pt_commit(pt_op->vma, pt_op->entries,
-			     pt_op->num_entries, &pt_update_ops->deferred);
+			     pt_op->num_entries,
+			     &pt_update_ops->pt_job_ops->deferred);
 		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
 	}
 
@@ -2912,19 +2925,8 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
 {
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
-	int i;
 
 	xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
-
-	lockdep_assert_held(&vops->vm->lock);
-	xe_vm_assert_held(vops->vm);
-
-	for (i = 0; i < pt_update_ops->current_op; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
-
-		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
-	}
-	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
 }
 
 /**
@@ -2961,3 +2963,101 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	xe_pt_update_ops_fini(tile, vops);
 }
+
+/**
+ * xe_pt_job_ops_alloc() - Allocate PT job ops
+ * @num_ops: Number of VM PT update ops
+ *
+ * Allocate PT job ops and internal array of VM PT update ops.
+ *
+ * Return: Pointer to PT job ops or NULL
+ */
+struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops)
+{
+	struct xe_pt_job_ops *pt_job_ops;
+
+	pt_job_ops = kmalloc_obj(*pt_job_ops);
+	if (!pt_job_ops)
+		return NULL;
+
+	pt_job_ops->ops = kvmalloc_array(num_ops, sizeof(*pt_job_ops->ops),
+					 GFP_KERNEL);
+	if (!pt_job_ops->ops) {
+		kfree(pt_job_ops);
+		return NULL;
+	}
+
+	pt_job_ops->current_op = 0;
+	kref_init(&pt_job_ops->refcount);
+	init_llist_head(&pt_job_ops->deferred);
+
+	return pt_job_ops;
+}
+
+/**
+ * xe_pt_job_ops_get() - Get PT job ops
+ * @pt_job_ops: PT job ops to get
+ *
+ * Take a reference to PT job ops
+ *
+ * Return: Pointer to PT job ops or NULL
+ */
+struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops *pt_job_ops)
+{
+	if (pt_job_ops)
+		kref_get(&pt_job_ops->refcount);
+
+	return pt_job_ops;
+}
+
+static void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op,
+				  u32 num_ops)
+{
+	u32 i;
+
+	for (i = 0; i < num_ops; ++i, ++pt_op)
+		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
+}
+
+static void xe_pt_job_ops_destroy(struct kref *ref)
+{
+	struct xe_pt_job_ops *pt_job_ops =
+		container_of(ref, struct xe_pt_job_ops, refcount);
+	struct llist_node *freed;
+	struct xe_bo *bo, *next;
+
+	xe_pt_update_ops_free(pt_job_ops->ops,
+			      pt_job_ops->current_op);
+
+	freed = llist_del_all(&pt_job_ops->deferred);
+	if (freed) {
+		llist_for_each_entry_safe(bo, next, freed, freed) {
+			struct xe_bo_dev *bo_device =
+				&xe_bo_device(bo)->bo_device;
+			/*
+			 * If called from run_job, we are in the dma-fencing
+			 * path and cannot take dma-resv locks so use an async
+			 * put.
+			 */
+			if (llist_add(&bo->freed, &bo_device->async_list))
+				schedule_work(&bo_device->async_free);
+		}
+	}
+
+	kvfree(pt_job_ops->ops);
+	kfree(pt_job_ops);
+}
+
+/**
+ * xe_pt_job_ops_put() - Put PT job ops
+ * @pt_job_ops: PT job ops to put
+ *
+ * Drop a reference to PT job ops
+ */
+void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops)
+{
+	if (!pt_job_ops)
+		return;
+
+	kref_put(&pt_job_ops->refcount, xe_pt_job_ops_destroy);
+}
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 4daeebaab5a1..5faddb8e700c 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -49,4 +49,8 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 			  struct xe_svm_range *range);
 
+struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops);
+struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops *pt_job_ops);
+void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index a7d1bb708b69..39c5b89ce9b7 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -91,12 +91,29 @@ struct xe_vm_pgtable_update_op {
 	bool rebind;
 };
 
+/**
+ * struct xe_pt_job_ops - Page-table update operations (dynamically allocated)
+ *
+ * This is the portion of &struct xe_vma_ops and
+ * &struct xe_vm_pgtable_update_ops that is dynamically allocated, as it
+ * must remain valid until the associated bind job completes. A reference
+ * count controls its lifetime.
+ */
+struct xe_pt_job_ops {
+	/** @current_op: current page-table update operation */
+	u32 current_op;
+	/** @refcount: reference count */
+	struct kref refcount;
+	/** @deferred: list of deferred PT entries to destroy */
+	struct llist_head deferred;
+	/** @ops: page-table update operations */
+	struct xe_vm_pgtable_update_op *ops;
+};
+
 /** struct xe_vm_pgtable_update_ops: page table update operations */
 struct xe_vm_pgtable_update_ops {
-	/** @ops: operations */
-	struct xe_vm_pgtable_update_op *ops;
-	/** @deferred: deferred list to destroy PT entries */
-	struct llist_head deferred;
+	/** @pt_job_ops: PT update operations dynamic allocation*/
+	struct xe_pt_job_ops *pt_job_ops;
 	/** @q: exec queue for PT operations */
 	struct xe_exec_queue *q;
 	/** @prl: embedded page reclaim list */
@@ -107,8 +124,6 @@ struct xe_vm_pgtable_update_ops {
 	u64 last;
 	/** @num_ops: number of operations */
 	u32 num_ops;
-	/** @current_op: current operations */
-	u32 current_op;
 	/** @needs_svm_lock: Needs SVM lock */
 	bool needs_svm_lock;
 	/** @needs_invalidation: Needs invalidation */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 753a5fc55baa..2737bd25f39a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -681,11 +681,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 		if (!vops->pt_update_ops[i].num_ops)
 			continue;
 
-		vops->pt_update_ops[i].ops =
-			kmalloc_objs(*vops->pt_update_ops[i].ops,
-				     vops->pt_update_ops[i].num_ops,
-				     GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
-		if (!vops->pt_update_ops[i].ops)
+		vops->pt_update_ops[i].pt_job_ops =
+			xe_pt_job_ops_alloc(vops->pt_update_ops[i].num_ops);
+		if (!vops->pt_update_ops[i].pt_job_ops)
 			return array_of_binds ? -ENOBUFS : -ENOMEM;
 	}
 
@@ -732,7 +730,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 	xe_vma_svm_prefetch_ops_fini(vops);
 
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
-		kfree(vops->pt_update_ops[i].ops);
+		xe_pt_job_ops_put(vops->pt_update_ops[i].pt_job_ops);
 }
 
 static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, int inc_val)
-- 
2.34.1

