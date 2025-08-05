Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D31CA0EC0
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7A10E656;
	Tue,  5 Aug 2025 23:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tnm1/+gG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DD010E2C7
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754437325; x=1785973325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dr8e/P113HWqvAkLSRswB17TK4ayfVzUsISCiu2GtFE=;
 b=Tnm1/+gGbQNdWEEqs1c4tHDnIsWD+LXDMZuegOB1Ey1jM9OPkeFvPoE5
 ZxFd3rVtGzC1uAqXr6wBRXaOL5Vk45o0HwzdnihwhG2x3qNVd9ONVLxIC
 6Ee+wBGDJXjcH4MIJwOY1QBoX77EhNxmQ+4ENICVVsDXPWqXnmqs+GUQG
 fCPXpkqv+sAGQBjDdiGWH5apmPXhzeoHiXmhyr4ypcZGhbM89OJqD9lvO
 zg1zjF1Pe4F8CKv0NQbO1d2FztfzISu/7wjLqtbz6Xnnp8cXt3JZJq2+b
 0LKXLM0UA0LX0AYsXuLG1JIbwArr68q6G156sr6nQiCKlQ4rkIIPi3ze8 A==;
X-CSE-ConnectionGUID: uzVBVR79TQSCnKWc1pXwAw==
X-CSE-MsgGUID: E0LI7b6oSUm4We7DYZca7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68119059"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="68119059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
X-CSE-ConnectionGUID: wZ3fCuxsQ028acCk2+NBeQ==
X-CSE-MsgGUID: pHX/RSTIT6mrI7XNH20pbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="164641622"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 16:42:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 03/15] drm/xe: CPU binds for jobs
Date: Tue,  5 Aug 2025 16:41:48 -0700
Message-Id: <20250805234200.1035609-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805234200.1035609-1-matthew.brost@intel.com>
References: <20250805234200.1035609-1-matthew.brost@intel.com>
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

No reason to use the GPU for binds. In run_job, use the CPU to perform
binds once the bind job's dependencies are resolved.

Benefits of CPU-based binds:
- Lower latency once dependencies are resolved, as there is no
  interaction with the GuC or a hardware context switch both of which
  are relatively slow.
- Large arrays of binds do not risk running out of migration PTEs,
  avoiding -ENOBUFS being returned to userspace.
- Kernel binds are decoupled from the migration exec queue (which issues
  copies and clears), so they cannot get stuck behind unrelated
  jobs—this can be a problem with parallel GPU faults.
- Enables ULLS on the migration exec queue, as this queue has exclusive
  access to the paging copy engine.

The basic idea of the implementation is to store the VM page table
update operations (struct xe_vm_pgtable_update_op *pt_op) and additional
arguments for the migrate layer’s CPU PTE update function in a job. The
submission backend can then call into the migrate layer using the CPU to
write the PTEs and free the stored resources for the PTE update.

PT job submission is implemented in the GuC backend for simplicity. A
follow-up could introduce a specific backend for PT jobs.

All code related to GPU-based binding has been removed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c   |   2 +
 drivers/gpu/drm/xe/xe_bo.c              |   7 +-
 drivers/gpu/drm/xe/xe_bo.h              |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h        |   2 -
 drivers/gpu/drm/xe/xe_drm_client.c      |   3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  36 +++-
 drivers/gpu/drm/xe/xe_migrate.c         | 251 +++---------------------
 drivers/gpu/drm/xe/xe_migrate.h         |   6 +
 drivers/gpu/drm/xe/xe_pt.c              | 188 ++++++++++++++----
 drivers/gpu/drm/xe/xe_pt.h              |   5 +-
 drivers/gpu/drm/xe/xe_pt_types.h        |  29 ++-
 drivers/gpu/drm/xe/xe_sched_job.c       |  78 +++++---
 drivers/gpu/drm/xe/xe_sched_job_types.h |  31 ++-
 drivers/gpu/drm/xe/xe_vm.c              |  46 ++---
 14 files changed, 343 insertions(+), 350 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index edd1e701aa1c..3ed145d546ea 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -239,6 +239,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		   (unsigned long)xe_bo_main_addr(m->pt_bo, XE_PAGE_SIZE));
 
 	/* First part of the test, are we updating our pagetable bo with a new entry? */
+#define NUM_KERNEL_PDE 15
 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
 		  0xdeaddeadbeefbeef);
 	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, xe->pat.idx[XE_CACHE_WB], 0);
@@ -266,6 +267,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 
 	emit_clear(tile->primary_gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
 		   IS_DGFX(xe));
+#undef NUM_KERNEL_PDE
 	run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetable",
 		       test);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1a72561f987c..1cfb5a3c75af 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -3064,8 +3064,13 @@ void xe_bo_put_commit(struct llist_head *deferred)
 	if (!freed)
 		return;
 
-	llist_for_each_entry_safe(bo, next, freed, freed)
+	llist_for_each_entry_safe(bo, next, freed, freed) {
+		struct xe_vm *vm = bo->vm;
+
 		drm_gem_object_free(&bo->ttm.base.refcount);
+		if (bo->flags & XE_BO_FLAG_PUT_VM_ASYNC)
+			xe_vm_put(vm);
+	}
 }
 
 static void xe_bo_dev_work_func(struct work_struct *work)
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8cce413b5235..ed6660d33954 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -48,6 +48,7 @@
 #define XE_BO_FLAG_GGTT2		BIT(22)
 #define XE_BO_FLAG_GGTT3		BIT(23)
 #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
+#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(25)
 
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
@@ -331,6 +332,7 @@ void __xe_bo_release_dummy(struct kref *kref);
  * @bo: The bo to put.
  * @deferred: List to which to add the buffer object if we cannot put, or
  * NULL if the function is to put unconditionally.
+ * @added: BO was added to deferred list
  *
  * Since the final freeing of an object includes both sleeping and (!)
  * memory allocation in the dma_resv individualization, it's not ok
@@ -350,7 +352,8 @@ void __xe_bo_release_dummy(struct kref *kref);
  * false otherwise.
  */
 static inline bool
-xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
+xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred,
+		   bool *added)
 {
 	if (!deferred) {
 		xe_bo_put(bo);
@@ -360,6 +363,7 @@ xe_bo_put_deferred(struct xe_bo *bo, struct llist_head *deferred)
 	if (!kref_put(&bo->ttm.base.refcount, __xe_bo_release_dummy))
 		return false;
 
+	*added = true;
 	return llist_add(&bo->freed, deferred);
 }
 
@@ -375,8 +379,9 @@ static inline void
 xe_bo_put_async(struct xe_bo *bo)
 {
 	struct xe_bo_dev *bo_device = &xe_bo_device(bo)->bo_device;
+	bool added = false;
 
-	if (xe_bo_put_deferred(bo, &bo_device->async_list))
+	if (xe_bo_put_deferred(bo, &bo_device->async_list, &added))
 		schedule_work(&bo_device->async_free);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index cf604adc13a3..2e9c30b15a77 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -69,8 +69,6 @@ struct xe_bo {
 
 	/** @freed: List node for delayed put. */
 	struct llist_node freed;
-	/** @update_index: Update index if PT BO */
-	int update_index;
 	/** @created: Whether the bo has passed initial creation */
 	bool created;
 
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index f931ff9b1ec0..f148a30add15 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -200,6 +200,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	LLIST_HEAD(deferred);
 	unsigned int id;
 	u32 mem_type;
+	bool added = false;
 
 	client = xef->client;
 
@@ -246,7 +247,7 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 			xe_assert(xef->xe, !list_empty(&bo->client_link));
 		}
 
-		xe_bo_put_deferred(bo, &deferred);
+		xe_bo_put_deferred(bo, &deferred, &added);
 	}
 	spin_unlock(&client->bos_lock);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 1185b23b1384..99baf6b83bd6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -19,6 +19,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "regs/xe_lrc_layout.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -38,8 +39,10 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
+#include "xe_migrate.h"
 #include "xe_mocs.h"
 #include "xe_pm.h"
+#include "xe_pt.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -799,6 +802,20 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 	}
 }
 
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return job->is_pt_job;
+}
+
+static void run_pt_job(struct xe_sched_job *job)
+{
+	__xe_migrate_update_pgtables_cpu(job->pt_update[0].vm,
+					 job->pt_update[0].tile,
+					 job->pt_update[0].ops,
+					 job->pt_update[0].pt_job_ops->ops,
+					 job->pt_update[0].pt_job_ops->current_op);
+}
+
 static struct dma_fence *
 guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 {
@@ -814,14 +831,21 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_run(job);
 
 	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
-		if (!exec_queue_registered(q))
-			register_exec_queue(q, GUC_CONTEXT_NORMAL);
-		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
-			q->ring_ops->emit_job(job);
-		submit_exec_queue(q);
+		if (is_pt_job(job)) {
+			run_pt_job(job);
+		} else {
+			if (!exec_queue_registered(q))
+				register_exec_queue(q, GUC_CONTEXT_NORMAL);
+			if (!lr)	/* LR jobs are emitted in the exec IOCTL */
+				q->ring_ops->emit_job(job);
+			submit_exec_queue(q);
+		}
 	}
 
-	if (lr) {
+	if (is_pt_job(job)) {
+		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
+		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
+	} else if (lr) {
 		xe_sched_job_set_error(job, -EOPNOTSUPP);
 		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 7e62f96c96e9..d6a9dc8fc554 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -60,18 +60,12 @@ struct xe_migrate {
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
 #define NUM_PT_SLOTS 32
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 #define MAX_NUM_PTE 512
@@ -96,7 +90,6 @@ static void xe_migrate_fini(void *arg)
 
 	dma_fence_put(m->fence);
 	xe_bo_put(m->pt_bo);
-	drm_suballoc_manager_fini(&m->vm_update_sa);
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
@@ -190,8 +183,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
 	/* Must be a multiple of 64K to support all platforms */
 	BUILD_BUG_ON(NUM_PT_SLOTS * XE_PAGE_SIZE % SZ_64K);
-	/* And one slot reserved for the 4KiB page table updates */
-	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
 
 	/* Need to be sure everything fits in the first PT, or create more */
 	xe_tile_assert(tile, m->batch_base_ofs + xe_bo_size(batch) < SZ_2M);
@@ -324,8 +315,6 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/*
 	 * Example layout created above, with root level = 3:
 	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
-	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
-	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
 	 * [PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31 = 2M vram identity map]
 	 *
 	 * This makes the lowest part of the VM point to the pagetables.
@@ -333,19 +322,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
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
 
 	m->pt_bo = bo;
 	return 0;
@@ -1360,56 +1340,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
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
@@ -1425,7 +1355,18 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
-static void
+/**
+ * __xe_migrate_update_pgtables_cpu() - Update a VM's PTEs via the CPU
+ * @vm: The VM being updated
+ * @tile: The tile being updated
+ * @ops: The migrate PT update ops
+ * @pt_ops: The VM PT update ops
+ * @num_ops: The number of The VM PT update ops
+ *
+ * Execute the VM PT update ops array which results in a VM's PTEs being updated
+ * via the CPU.
+ */
+void
 __xe_migrate_update_pgtables_cpu(struct xe_vm *vm, struct xe_tile *tile,
 				 const struct xe_migrate_pt_update_ops *ops,
 				 struct xe_vm_pgtable_update_op *pt_op,
@@ -1481,7 +1422,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	}
 
 	__xe_migrate_update_pgtables_cpu(vm, m->tile, ops,
-					 pt_update_ops->ops,
+					 pt_update_ops->pt_job_ops->ops,
 					 pt_update_ops->num_ops);
 
 	return dma_fence_get_stub();
@@ -1494,161 +1435,19 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
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
-		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
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
-					&pt_update_ops->ops[i];
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
 
-	job = xe_bb_create_migration_job(pt_update_ops->q, bb,
-					 xe_migrate_batch_base(m, usm),
-					 update_idx);
+	job = xe_sched_job_create(pt_update_ops->q, NULL);
 	if (IS_ERR(job)) {
 		err = PTR_ERR(job);
-		goto err_sa;
+		goto err_out;
 	}
 
+	xe_tile_assert(tile, job->is_pt_job);
+
 	if (ops->pre_commit) {
 		pt_update->job = job;
 		err = ops->pre_commit(pt_update);
@@ -1658,6 +1457,12 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
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
@@ -1665,17 +1470,11 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
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
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index facae7811161..f25112dfa609 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -23,6 +23,7 @@ struct xe_pt;
 struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
 struct xe_vma;
 
 enum xe_sriov_vf_ccs_rw_ctxs;
@@ -143,6 +144,11 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
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
index 96787713cfc3..ee603cb79b0e 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -200,7 +200,9 @@ unsigned int xe_pt_shift(unsigned int level)
  * and finally frees @pt. TODO: Can we remove the @flags argument?
  */
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
+
 {
+	bool added = false;
 	int i;
 
 	if (!pt)
@@ -208,7 +210,18 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 
 	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
 	xe_bo_unpin(pt->bo);
-	xe_bo_put_deferred(pt->bo, deferred);
+	xe_bo_put_deferred(pt->bo, deferred, &added);
+	if (added) {
+		/*
+		 * We need the VM present until the BO is destroyed as it shares
+		 * a dma-resv and BO destroy is async. Reinit BO refcount so
+		 * xe_bo_put_async can be used when the PT job ops refcount goes
+		 * to zero.
+		 */
+		xe_vm_get(pt->bo->vm);
+		pt->bo->flags |= XE_BO_FLAG_PUT_VM_ASYNC;
+		kref_init(&pt->bo->ttm.base.refcount);
+	}
 
 	if (pt->level > 0 && pt->num_live) {
 		struct xe_pt_dir *pt_dir = as_xe_pt_dir(pt);
@@ -361,7 +374,7 @@ xe_pt_new_shared(struct xe_walk_update *wupd, struct xe_pt *parent,
 	entry->pt = parent;
 	entry->flags = 0;
 	entry->qwords = 0;
-	entry->pt_bo->update_index = -1;
+	entry->level = parent->level;
 
 	if (alloc_entries) {
 		entry->pt_entries = kmalloc_array(XE_PDES,
@@ -1687,7 +1700,7 @@ xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
 				  u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
-	u64 empty = __xe_pt_empty_pte(tile, vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
 
 	if (map && map->is_iomem)
@@ -1753,13 +1766,20 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 	}
 }
 
+static struct xe_vm_pgtable_update_op *
+to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 current_op)
+{
+	return &pt_update_ops->pt_job_ops->ops[current_op];
+}
+
 static void
 xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 				 u64 start, u64 end)
 {
 	u64 last;
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
 	int i, level = 0;
 
 	for (i = 0; i < pt_op->num_entries; i++) {
@@ -1794,8 +1814,9 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
 			   struct xe_vma *vma, bool invalidate_on_bind)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
 	int err;
 
 	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
@@ -1824,7 +1845,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 xe_vma_start(vma),
 						 xe_vma_end(vma));
-		++pt_update_ops->current_op;
+		++pt_update_ops->pt_job_ops->current_op;
 		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 
 		/*
@@ -1861,8 +1882,9 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			      struct xe_vm_pgtable_update_ops *pt_update_ops,
 			      struct xe_vma *vma, struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
 	int err;
 
 	xe_tile_assert(tile, xe_vma_is_cpu_addr_mirror(vma));
@@ -1886,7 +1908,7 @@ static int bind_range_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_pt_update_ops_rfence_interval(pt_update_ops,
 						 range->base.itree.start,
 						 range->base.itree.last + 1);
-		++pt_update_ops->current_op;
+		++pt_update_ops->pt_job_ops->current_op;
 		pt_update_ops->needs_svm_lock = true;
 
 		pt_op->vma = vma;
@@ -1903,8 +1925,9 @@ static int unbind_op_prepare(struct xe_tile *tile,
 			     struct xe_vm_pgtable_update_ops *pt_update_ops,
 			     struct xe_vma *vma)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
 	int err;
 
 	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
@@ -1932,7 +1955,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma),
 					 xe_vma_end(vma));
-	++pt_update_ops->current_op;
+	++pt_update_ops->pt_job_ops->current_op;
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
 
@@ -1972,8 +1995,9 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				struct xe_vm_pgtable_update_ops *pt_update_ops,
 				struct xe_svm_range *range)
 {
-	u32 current_op = pt_update_ops->current_op;
-	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
+	u32 current_op = pt_update_ops->pt_job_ops->current_op;
+	struct xe_vm_pgtable_update_op *pt_op =
+		to_pt_op(pt_update_ops, current_op);
 
 	if (!(range->tile_present & BIT(tile->id)))
 		return 0;
@@ -1993,7 +2017,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 				pt_op->num_entries, false);
 	xe_pt_update_ops_rfence_interval(pt_update_ops, range->base.itree.start,
 					 range->base.itree.last + 1);
-	++pt_update_ops->current_op;
+	++pt_update_ops->pt_job_ops->current_op;
 	pt_update_ops->needs_svm_lock = true;
 	pt_update_ops->needs_invalidation |= xe_vm_has_scratch(vm) ||
 		xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
@@ -2099,7 +2123,6 @@ static int op_prepare(struct xe_vm *vm,
 static void
 xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
-	init_llist_head(&pt_update_ops->deferred);
 	pt_update_ops->start = ~0x0ull;
 	pt_update_ops->last = 0x0ull;
 }
@@ -2140,7 +2163,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 			return err;
 	}
 
-	xe_tile_assert(tile, pt_update_ops->current_op <=
+	xe_tile_assert(tile, pt_update_ops->pt_job_ops->current_op <=
 		       pt_update_ops->num_ops);
 
 #ifdef TEST_VM_OPS_ERROR
@@ -2373,7 +2396,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (!pt_update_ops->current_op) {
+	if (!pt_update_ops->pt_job_ops->current_op) {
 		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
 
 		return dma_fence_get_stub();
@@ -2434,12 +2457,16 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		goto free_rfence;
 	}
 
-	/* Point of no return - VM killed if failure after this */
-	for (i = 0; i < pt_update_ops->current_op; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+	/*
+	 * Point of no return - VM killed if failure after this
+	 */
+	for (i = 0; i < pt_update_ops->pt_job_ops->current_op; ++i) {
+		struct xe_vm_pgtable_update_op *pt_op =
+			to_pt_op(pt_update_ops, i);
 
 		xe_pt_commit(pt_op->vma, pt_op->entries,
-			     pt_op->num_entries, &pt_update_ops->deferred);
+			     pt_op->num_entries,
+			     &pt_update_ops->pt_job_ops->deferred);
 		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
 	}
 
@@ -2523,27 +2550,19 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
 
 /**
- * xe_pt_update_ops_fini() - Finish PT update operations
- * @tile: Tile of PT update operations
- * @vops: VMA operations
+ * xe_pt_update_ops_free() - Free PT update operations
+ * @pt_op: Array of PT update operations
+ * @num_ops: Number of PT update operations
  *
- * Finish PT update operations by committing to destroy page table memory
+ * Free PT update operations
  */
-void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
+static void xe_pt_update_ops_free(struct xe_vm_pgtable_update_op *pt_op,
+				  u32 num_ops)
 {
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&vops->pt_update_ops[tile->id];
-	int i;
-
-	lockdep_assert_held(&vops->vm->lock);
-	xe_vm_assert_held(vops->vm);
-
-	for (i = 0; i < pt_update_ops->current_op; ++i) {
-		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
+	u32 i;
 
+	for (i = 0; i < num_ops; ++i, ++pt_op)
 		xe_pt_free_bind(pt_op->entries, pt_op->num_entries);
-	}
-	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
 }
 
 /**
@@ -2564,9 +2583,9 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
 		struct xe_vm_pgtable_update_op *pt_op =
-			&pt_update_ops->ops[i];
+			to_pt_op(pt_update_ops, i);
 
-		if (!pt_op->vma || i >= pt_update_ops->current_op)
+		if (!pt_op->vma || i >= pt_update_ops->pt_job_ops->current_op)
 			continue;
 
 		if (pt_op->bind)
@@ -2577,6 +2596,89 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 			xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
 					   pt_op->num_entries);
 	}
+}
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
+	pt_job_ops = kmalloc(sizeof(*pt_job_ops), GFP_KERNEL);
+	if (!pt_job_ops)
+		return NULL;
+
+	pt_job_ops->ops = kvmalloc_array(num_ops, sizeof(*pt_job_ops->ops),
+					 GFP_KERNEL);
+	if (!pt_job_ops->ops) {
+		kvfree(pt_job_ops);
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
+		llist_for_each_entry_safe(bo, next, freed, freed)
+			/*
+			 * If called from run_job, we are in the dma-fencing
+			 * path and cannot take dma-resv locks so use an async
+			 * put.
+			 */
+			xe_bo_put_async(bo);
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
 
-	xe_pt_update_ops_fini(tile, vops);
+	kref_put(&pt_job_ops->refcount, xe_pt_job_ops_destroy);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 5ecf003d513c..c9904573db82 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -41,11 +41,14 @@ void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
 int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
 struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 				       struct xe_vma_ops *vops);
-void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 			  struct xe_svm_range *range);
 
+struct xe_pt_job_ops *xe_pt_job_ops_alloc(u32 num_ops);
+struct xe_pt_job_ops *xe_pt_job_ops_get(struct xe_pt_job_ops *pt_job_ops);
+void xe_pt_job_ops_put(struct xe_pt_job_ops *pt_job_ops);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 69eab6f37cfe..33d0d20e0ac6 100644
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
@@ -88,12 +91,28 @@ struct xe_vm_pgtable_update_op {
 	bool rebind;
 };
 
-/** struct xe_vm_pgtable_update_ops: page table update operations */
-struct xe_vm_pgtable_update_ops {
-	/** @ops: operations */
-	struct xe_vm_pgtable_update_op *ops;
+/**
+ * struct xe_pt_job_ops: page table update operations dynamic allocation
+ *
+ * This is the part of struct xe_vma_ops and struct xe_vm_pgtable_update_ops
+ * which is dynamic allocated as it must be available until the bind job is
+ * complete.
+ */
+struct xe_pt_job_ops {
+	/** @current_op: current operations */
+	u32 current_op;
+	/** @refcount: ref count ops allocation */
+	struct kref refcount;
 	/** @deferred: deferred list to destroy PT entries */
 	struct llist_head deferred;
+	/** @ops: operations */
+	struct xe_vm_pgtable_update_op *ops;
+};
+
+/** struct xe_vm_pgtable_update_ops: page table update operations */
+struct xe_vm_pgtable_update_ops {
+	/** @pt_job_ops: PT update operations dynamic allocation*/
+	struct xe_pt_job_ops *pt_job_ops;
 	/** @q: exec queue for PT operations */
 	struct xe_exec_queue *q;
 	/** @start: start address of ops */
@@ -102,8 +121,6 @@ struct xe_vm_pgtable_update_ops {
 	u64 last;
 	/** @num_ops: number of operations */
 	u32 num_ops;
-	/** @current_op: current operations */
-	u32 current_op;
 	/** @needs_svm_lock: Needs SVM lock */
 	bool needs_svm_lock;
 	/** @needs_userptr_lock: Needs userptr lock */
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index d21bf8f26964..09cdd14d9ef7 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -26,19 +26,22 @@ static struct kmem_cache *xe_sched_job_parallel_slab;
 
 int __init xe_sched_job_module_init(void)
 {
+	struct xe_sched_job *job;
+	size_t size;
+
+	size = struct_size(job, ptrs, 1);
 	xe_sched_job_slab =
-		kmem_cache_create("xe_sched_job",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(struct xe_job_ptrs), 0,
+		kmem_cache_create("xe_sched_job", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_slab)
 		return -ENOMEM;
 
+	size = max_t(size_t,
+		     struct_size(job, ptrs,
+				 XE_HW_ENGINE_MAX_INSTANCE),
+		     struct_size(job, pt_update, 1));
 	xe_sched_job_parallel_slab =
-		kmem_cache_create("xe_sched_job_parallel",
-				  sizeof(struct xe_sched_job) +
-				  sizeof(struct xe_job_ptrs) *
-				  XE_HW_ENGINE_MAX_INSTANCE, 0,
+		kmem_cache_create("xe_sched_job_parallel", size, 0,
 				  SLAB_HWCACHE_ALIGN, NULL);
 	if (!xe_sched_job_parallel_slab) {
 		kmem_cache_destroy(xe_sched_job_slab);
@@ -84,7 +87,7 @@ static void xe_sched_job_free_fences(struct xe_sched_job *job)
 {
 	int i;
 
-	for (i = 0; i < job->q->width; ++i) {
+	for (i = 0; !job->is_pt_job && i < job->q->width; ++i) {
 		struct xe_job_ptrs *ptrs = &job->ptrs[i];
 
 		if (ptrs->lrc_fence)
@@ -118,33 +121,44 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	if (err)
 		goto err_free;
 
-	for (i = 0; i < q->width; ++i) {
-		struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
-		struct dma_fence_chain *chain;
-
-		if (IS_ERR(fence)) {
-			err = PTR_ERR(fence);
-			goto err_sched_job;
-		}
-		job->ptrs[i].lrc_fence = fence;
-
-		if (i + 1 == q->width)
-			continue;
-
-		chain = dma_fence_chain_alloc();
-		if (!chain) {
+	if (!batch_addr) {
+		job->fence = dma_fence_allocate_private_stub(ktime_get());
+		if (!job->fence) {
 			err = -ENOMEM;
 			goto err_sched_job;
 		}
-		job->ptrs[i].chain_fence = chain;
+		job->is_pt_job = true;
+	} else {
+		for (i = 0; i < q->width; ++i) {
+			struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
+			struct dma_fence_chain *chain;
+
+			if (IS_ERR(fence)) {
+				err = PTR_ERR(fence);
+				goto err_sched_job;
+			}
+			job->ptrs[i].lrc_fence = fence;
+
+			if (i + 1 == q->width)
+				continue;
+
+			chain = dma_fence_chain_alloc();
+			if (!chain) {
+				err = -ENOMEM;
+				goto err_sched_job;
+			}
+			job->ptrs[i].chain_fence = chain;
+		}
 	}
 
-	width = q->width;
-	if (is_migration)
-		width = 2;
+	if (batch_addr) {
+		width = q->width;
+		if (is_migration)
+			width = 2;
 
-	for (i = 0; i < width; ++i)
-		job->ptrs[i].batch_addr = batch_addr[i];
+		for (i = 0; i < width; ++i)
+			job->ptrs[i].batch_addr = batch_addr[i];
+	}
 
 	xe_pm_runtime_get_noresume(job_to_xe(job));
 	trace_xe_sched_job_create(job);
@@ -243,7 +257,7 @@ bool xe_sched_job_completed(struct xe_sched_job *job)
 void xe_sched_job_arm(struct xe_sched_job *job)
 {
 	struct xe_exec_queue *q = job->q;
-	struct dma_fence *fence, *prev;
+	struct dma_fence *fence = job->fence, *prev;
 	struct xe_vm *vm = q->vm;
 	u64 seqno = 0;
 	int i;
@@ -263,6 +277,9 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		job->ring_ops_flush_tlb = true;
 	}
 
+	if (job->is_pt_job)
+		goto arm;
+
 	/* Arm the pre-allocated fences */
 	for (i = 0; i < q->width; prev = fence, ++i) {
 		struct dma_fence_chain *chain;
@@ -283,6 +300,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		fence = &chain->base;
 	}
 
+arm:
 	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
 	drm_sched_job_arm(&job->drm);
 }
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index dbf260dded8d..79a459f2a0a8 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -10,10 +10,29 @@
 
 #include <drm/gpu_scheduler.h>
 
-struct xe_exec_queue;
 struct dma_fence;
 struct dma_fence_chain;
 
+struct xe_exec_queue;
+struct xe_migrate_pt_update_ops;
+struct xe_pt_job_ops;
+struct xe_tile;
+struct xe_vm;
+
+/**
+ * struct xe_pt_update_args - PT update arguments
+ */
+struct xe_pt_update_args {
+	/** @vm: VM */
+	struct xe_vm *vm;
+	/** @tile: Tile */
+	struct xe_tile *tile;
+	/** @ops: Migrate PT update ops */
+	const struct xe_migrate_pt_update_ops *ops;
+	/** @pt_job_ops: PT update ops */
+	struct xe_pt_job_ops *pt_job_ops;
+};
+
 /**
  * struct xe_job_ptrs - Per hw engine instance data
  */
@@ -58,8 +77,14 @@ struct xe_sched_job {
 	bool ring_ops_flush_tlb;
 	/** @ggtt: mapped in ggtt. */
 	bool ggtt;
-	/** @ptrs: per instance pointers. */
-	struct xe_job_ptrs ptrs[];
+	/** @is_pt_job: is a PT job */
+	bool is_pt_job;
+	union {
+		/** @ptrs: per instance pointers. */
+		DECLARE_FLEX_ARRAY(struct xe_job_ptrs, ptrs);
+		/** @pt_update: PT update arguments */
+		DECLARE_FLEX_ARRAY(struct xe_pt_update_args, pt_update);
+	};
 };
 
 struct xe_sched_job_snapshot {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 83f507ea7f30..12a0ddd56fb4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -780,6 +780,19 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
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
+	vops->flags = 0;
+}
+
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -788,11 +801,9 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 		if (!vops->pt_update_ops[i].num_ops)
 			continue;
 
-		vops->pt_update_ops[i].ops =
-			kmalloc_array(vops->pt_update_ops[i].num_ops,
-				      sizeof(*vops->pt_update_ops[i].ops),
-				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
-		if (!vops->pt_update_ops[i].ops)
+		vops->pt_update_ops[i].pt_job_ops =
+			xe_pt_job_ops_alloc(vops->pt_update_ops[i].num_ops);
+		if (!vops->pt_update_ops[i].pt_job_ops)
 			return array_of_binds ? -ENOBUFS : -ENOMEM;
 	}
 
@@ -828,7 +839,7 @@ static void xe_vma_ops_fini(struct xe_vma_ops *vops)
 	xe_vma_svm_prefetch_ops_fini(vops);
 
 	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
-		kfree(vops->pt_update_ops[i].ops);
+		xe_pt_job_ops_put(vops->pt_update_ops[i].pt_job_ops);
 }
 
 static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask, int inc_val)
@@ -877,9 +888,6 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops);
-static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
-			    struct xe_exec_queue *q,
-			    struct xe_sync_entry *syncs, u32 num_syncs);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -3168,13 +3176,6 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 		fence = &cf->base;
 	}
 
-	for_each_tile(tile, vm->xe, id) {
-		if (!vops->pt_update_ops[id].num_ops)
-			continue;
-
-		xe_pt_update_ops_fini(tile, vops);
-	}
-
 	return fence;
 
 err_out:
@@ -3452,19 +3453,6 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
 	return err;
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
-	vops->flags = 0;
-}
-
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
 					u64 addr, u64 range, u64 obj_offset,
 					u16 pat_index, u32 op, u32 bind_flags)
-- 
2.34.1

