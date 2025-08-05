Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF545CA0EC5
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896BD10E6F4;
	Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UkF2sYf0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF1910E2C9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437325; x=1785973325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYJZ0lI0amtn4PIAHx/ezU6+7frJadXSBwaZzDT/d/Q=;
 b=UkF2sYf02RFWhGcB6OZhHhYJyC0kSiJnI+aQ4sfU00t7YFFWfWgGOLiV
 PZDoYWdDGv+SqTgVZ5iJaDBCFkCV8H4LuQoavfex8n8KyR1OT3BiVw7+x
 rn41c0BsbR3bP4aog07PqJ2qSbKloraRbf9ie9gWti+K+nZpf6xzTlcB2
 T2MavZ/VnuEut8yMtSbVpI2AgNHzw8UAY40a2C2ydsFF1m8oqkldcYcFp
 J5BMqJoRjq43Udep0mjOqkdC1L3Bw/y2H57i30Z/lc4IkEiHIhv0bX1vO
 4niLtoHMVrgKJY0EeYz6SKYOwG2LDcLtJfVfLCbAjiUMpqaJcspQcEL4R Q==;
X-CSE-ConnectionGUID: eJgwkMKSR8meKiip8EvBGA==
X-CSE-MsgGUID: Ffe8B9wiSO+mPl0zqsTwyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119061"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119061"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
X-CSE-ConnectionGUID: ToTPseleRle9Oy59YfG8LA==
X-CSE-MsgGUID: vhEag5yhQm+2xikBjFVoFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641624"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 05/15] drm/xe: Don't use migrate exec queue for page fault
 binds
Date: Tue,  5 Aug 2025 16:41:50 -0700
Message-Id: <20250805234200.1035609-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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

Now that the CPU is always used for binds even in jobs, CPU bind jobs
can pass GPU jobs in the same exec queue resulting dma-fences signaling
out-of-order. Use a dedicated exec queue for binds issued from page
faults to avoid ordering issues and avoid blocking kernel binds on
unrelated copies / clears.

v2:
 - Always create a bind queue regardless if USM is supported

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 47 ++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_migrate.h |  1 +
 drivers/gpu/drm/xe/xe_svm.c     | 11 ++++++++
 drivers/gpu/drm/xe/xe_vm.c      | 17 +++++++-----
 4 files changed, 67 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 72ae98f2b257..0ec9d407acb7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -43,6 +43,8 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
+	/** @bind_q: Default exec queue used for binds */
+	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -93,6 +95,7 @@ static void xe_migrate_fini(void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
+	xe_exec_queue_put(m->bind_q);
 }
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
@@ -412,6 +415,16 @@ int xe_migrate_init(struct xe_migrate *m)
 			goto err_out;
 		}
 
+		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
+						 EXEC_QUEUE_FLAG_KERNEL |
+						 EXEC_QUEUE_FLAG_PERMANENT |
+						 EXEC_QUEUE_FLAG_HIGH_PRIORITY |
+						 EXEC_QUEUE_FLAG_MIGRATE, 0);
+		if (IS_ERR(m->bind_q)) {
+			err = PTR_ERR(m->bind_q);
+			goto err_out;
+		}
+
 		/*
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
 		 * PVC, may want to revisit if performance is needed.
@@ -422,6 +435,16 @@ int xe_migrate_init(struct xe_migrate *m)
 					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
 					    EXEC_QUEUE_FLAG_MIGRATE, 0);
 	} else {
+		m->bind_q = xe_exec_queue_create_class(xe, primary_gt, vm,
+						       XE_ENGINE_CLASS_COPY,
+						       EXEC_QUEUE_FLAG_KERNEL |
+						       EXEC_QUEUE_FLAG_PERMANENT |
+						       EXEC_QUEUE_FLAG_MIGRATE, 0);
+		if (IS_ERR(m->bind_q)) {
+			err = PTR_ERR(m->bind_q);
+			goto err_out;
+		}
+
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
 						  EXEC_QUEUE_FLAG_KERNEL |
@@ -458,6 +481,8 @@ int xe_migrate_init(struct xe_migrate *m)
 	return err;
 
 err_out:
+	if (!IS_ERR_OR_NULL(m->bind_q))
+		xe_exec_queue_put(m->bind_q);
 	xe_vm_close_and_put(vm);
 	return err;
 
@@ -1087,6 +1112,17 @@ struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate)
 	return migrate->q;
 }
 
+/**
+ * xe_get_migrate_bind_queue() - Get the bind queue from migrate context.
+ * @migrate: Migrate context.
+ *
+ * Return: Pointer to bind queue on success, error on failure
+ */
+struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate)
+{
+	return migrate->bind_q;
+}
+
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1428,6 +1464,11 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	return dma_fence_get_stub();
 }
 
+static bool is_migrate_queue(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	return m->bind_q == q;
+}
+
 static struct dma_fence *
 __xe_migrate_update_pgtables(struct xe_migrate *m,
 			     struct xe_migrate_pt_update *pt_update,
@@ -1437,7 +1478,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 	struct xe_tile *tile = m->tile;
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
-	bool is_migrate = pt_update_ops->q == m->q;
+	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
 	int err;
 
 	job = xe_sched_job_create(pt_update_ops->q, NULL);
@@ -1904,7 +1945,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
  */
 void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
 {
-	bool is_migrate = q == m->q;
+	bool is_migrate = is_migrate_queue(m, q);
 
 	if (is_migrate)
 		mutex_lock(&m->job_mutex);
@@ -1922,7 +1963,7 @@ void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
  */
 void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
 {
-	bool is_migrate = q == m->q;
+	bool is_migrate = is_migrate_queue(m, q);
 
 	if (is_migrate)
 		mutex_unlock(&m->job_mutex);
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index ff00c4a2ccfb..e4f08a58fc56 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -126,6 +126,7 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
+struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate);
 int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 			     unsigned long offset, void *buf, int len,
 			     int write);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 10c8a1bcb86e..759f61eacbd0 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -689,6 +689,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct list_head *blocks;
 	struct xe_bo *bo;
 	ktime_t time_end = 0;
+	long timeout;
 	int err, idx;
 
 	if (!drm_dev_enter(&xe->drm, &idx))
@@ -726,6 +727,16 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 		xe_svm_devmem_release(&bo->devmem_allocation);
 
 	xe_bo_unlock(bo);
+
+	/*
+	 * Corner case where none of CPU pages were faulted in and we need to
+	 * wait for the clear to finish.
+	 */
+	timeout = dma_resv_wait_timeout(bo->ttm.base.resv,
+					DMA_RESV_USAGE_KERNEL, false,
+					MAX_SCHEDULE_TIMEOUT);
+	XE_WARN_ON(timeout <= 0);
+
 	xe_bo_put(bo);
 
 out_pm_put:
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 12a0ddd56fb4..eb2810bb7414 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -895,7 +895,9 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	struct xe_vma *vma, *next;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
-	int err, i;
+	struct xe_tile *tile;
+	u8 id;
+	int err;
 
 	lockdep_assert_held(&vm->lock);
 	if ((xe_vm_in_lr_mode(vm) && !rebind_worker) ||
@@ -903,8 +905,11 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		return 0;
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
-		vops.pt_update_ops[i].wait_vm_bookkeep = true;
+	for_each_tile(tile, vm->xe, id) {
+		vops.pt_update_ops[id].wait_vm_bookkeep = true;
+		vops.pt_update_ops[id].q =
+			xe_migrate_bind_queue(tile->migrate);
+	}
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
@@ -961,7 +966,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_migrate_bind_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
@@ -1051,7 +1056,7 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_migrate_bind_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
@@ -1134,7 +1139,7 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	for_each_tile(tile, vm->xe, id) {
 		vops.pt_update_ops[id].wait_vm_bookkeep = true;
 		vops.pt_update_ops[tile->id].q =
-			xe_migrate_exec_queue(tile->migrate);
+			xe_migrate_bind_queue(tile->migrate);
 	}
 
 	err = xe_vm_ops_add_range_unbind(&vops, range);
-- 
2.34.1

