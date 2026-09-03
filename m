Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F7BC624DE
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D0410F7FF;
	Thu,  3 Sep 2026 23:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bt9DzX8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769610E198
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=eLa5BwjCtHZo9DFDxBFbHwZZ7rOebLPFPqWERyXo0yA=;
 b=Bt9DzX8cly5/+wqSCwGpmIkXzQqxf/5FajC9wvzNFUWNJge9Un2qZKkc
 umMvKeMRd3N+jl0KVcYk7NQzan94+zIpq5xFFq1Q5CQ0q4TzC78gEct9w
 t49wB/VmWn57acsqqIud9eqJqFpXgGKzojwPIaEwxayTDVwudwmR+eBXz
 KdXsryp9uPsa73JdDuFQfA2fzkBaQrrKE0hynoRO+PaymMswYZxsZvOTO
 P+c5vecoFg25bUkuc8L2EhrxlgpmC8HVST66uF5RaxNPVOLpWg2wS1TyB
 8YjSSktc1HNlv6UWNIN7zVs9Lfawe38MZ4MhwqWPzMeLyQkTGdE7wrRga g==;
X-CSE-ConnectionGUID: 30lmSWfETN+D1Pn7YaWbYg==
X-CSE-MsgGUID: RCO8lBgjRQmh8TvFfw0Clw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637816"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637816"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: CTrArT2rTnKn1n8eW1aykQ==
X-CSE-MsgGUID: zUh8FoAyStOCDCnAppGaig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029058"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 16/25] drm/xe: Add CPU bind layer
Date: Thu,  3 Sep 2026 16:58:33 -0700
Message-Id: <20260903235842.3401722-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

With CPU binds, it no longer makes sense to implement CPU bind handling
in the migrate layer, as these operations are entirely decoupled from
hardware. Introduce a dedicated CPU bind layer stored at the device
level.

Since CPU binds are tile-independent, update the PT layer to generate a
single bind job even when pages are mirrored across tiles.

This patch is large because the refactor touches multiple file / layers
and ensures functional equivalence before and after the change.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-17-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/Makefile             |   1 +
 drivers/gpu/drm/xe/xe_cpu_bind.c        | 295 +++++++++++++
 drivers/gpu/drm/xe/xe_cpu_bind.h        | 118 +++++
 drivers/gpu/drm/xe/xe_device.c          |   5 +
 drivers/gpu/drm/xe/xe_device_types.h    |   4 +
 drivers/gpu/drm/xe/xe_exec_queue.c      |   3 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      |  41 +-
 drivers/gpu/drm/xe/xe_migrate.c         | 246 -----------
 drivers/gpu/drm/xe/xe_migrate.h         |  94 ----
 drivers/gpu/drm/xe/xe_pt.c              | 549 ++++++++++++------------
 drivers/gpu/drm/xe/xe_pt.h              |   8 +-
 drivers/gpu/drm/xe/xe_pt_types.h        |  14 -
 drivers/gpu/drm/xe/xe_sched_job.c       |  10 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h |  11 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  13 +-
 drivers/gpu/drm/xe/xe_tlb_inval_job.h   |   2 -
 drivers/gpu/drm/xe/xe_vm.c              | 155 ++-----
 drivers/gpu/drm/xe/xe_vm_types.h        |  10 +-
 18 files changed, 810 insertions(+), 769 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.c
 create mode 100644 drivers/gpu/drm/xe/xe_cpu_bind.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 67b8b5477639..0670a3f08ec8 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -35,6 +35,7 @@ $(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe
 xe-y += xe_bb.o \
 	xe_bo.o \
 	xe_bo_evict.o \
+	xe_cpu_bind.o \
 	xe_dep_scheduler.o \
 	xe_devcoredump.o \
 	xe_device.o \
diff --git a/drivers/gpu/drm/xe/xe_cpu_bind.c b/drivers/gpu/drm/xe/xe_cpu_bind.c
new file mode 100644
index 000000000000..ed79e229151b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cpu_bind.c
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+#include <linux/mutex.h>
+
+#include "xe_cpu_bind.h"
+#include "xe_device_types.h"
+#include "xe_exec_queue.h"
+#include "xe_pt.h"
+#include "xe_sched_job.h"
+#include "xe_trace_bo.h"
+#include "xe_vm.h"
+
+/**
+ * struct xe_cpu_bind - cpu_bind context.
+ */
+struct xe_cpu_bind {
+	/** @xe: Xe device */
+	struct xe_device *xe;
+	/** @q: Default exec queue used for kernel binds */
+	struct xe_exec_queue *q;
+	/** @job_mutex: Timeline mutex for @q. */
+	struct mutex job_mutex;
+};
+
+static bool is_cpu_bind_queue(struct xe_cpu_bind *cpu_bind,
+			      struct xe_exec_queue *q)
+{
+	return cpu_bind->q == q;
+}
+
+static void xe_cpu_bind_fini(void *arg)
+{
+	struct xe_cpu_bind *cpu_bind = arg;
+
+	mutex_destroy(&cpu_bind->job_mutex);
+	xe_exec_queue_put(cpu_bind->q);
+}
+
+/**
+ * xe_cpu_bind_init() - Initialize a cpu_bind context
+ * @xe: &xe_device
+ *
+ * Return: 0 if successful, negative error code on failure
+ */
+int xe_cpu_bind_init(struct xe_device *xe)
+{
+	struct xe_cpu_bind *cpu_bind =
+		drmm_kzalloc(&xe->drm, sizeof(*cpu_bind), GFP_KERNEL);
+	struct xe_exec_queue *q;
+
+	q = xe_exec_queue_create_bind(xe, xe_device_get_root_tile(xe), NULL,
+				      EXEC_QUEUE_FLAG_KERNEL |
+				      EXEC_QUEUE_FLAG_MIGRATE, 0);
+	if (IS_ERR(q))
+		return PTR_ERR(q);
+
+	cpu_bind->xe = xe;
+	cpu_bind->q = q;
+	xe->cpu_bind = cpu_bind;
+
+	mutex_init(&cpu_bind->job_mutex);
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&cpu_bind->job_mutex);
+	fs_reclaim_release(GFP_KERNEL);
+
+	return devm_add_action_or_reset(cpu_bind->xe->drm.dev, xe_cpu_bind_fini,
+					cpu_bind);
+}
+
+/**
+ * xe_cpu_bind_queue() - Get the bind queue from cpu_bind context.
+ * @cpu_bind: The cpu bind context.
+ *
+ * Return: Pointer to bind queue on success, error on failure
+ */
+struct xe_exec_queue *xe_cpu_bind_queue(struct xe_cpu_bind *cpu_bind)
+{
+	return cpu_bind->q;
+}
+
+/**
+ * xe_cpu_bind_update_pgtables_execute() - Update a VM's PTEs via the CPU
+ * @vm: The VM being updated
+ * @tile: The tile being updated
+ * @ops: The migrate PT update ops
+ * @pt_op: The VM PT update op
+ * @num_ops: The number of The VM PT update ops
+ *
+ * Execute the VM PT update ops array which results in a VM's PTEs being updated
+ * via the CPU.
+ */
+void
+xe_cpu_bind_update_pgtables_execute(struct xe_vm *vm, struct xe_tile *tile,
+				    const struct xe_cpu_bind_pt_update_ops *ops,
+				    struct xe_vm_pgtable_update_op *pt_op,
+				    int num_ops)
+{
+	u32 j, i;
+
+	for (j = 0; j < num_ops; ++j, ++pt_op) {
+		for (i = 0; i < pt_op->num_entries; i++) {
+			const struct xe_vm_pgtable_update *update =
+				&pt_op->entries[i];
+
+			xe_assert(vm->xe, update);
+			xe_assert(vm->xe, update->pt_bo);
+			xe_assert(vm->xe, !iosys_map_is_null(&update->pt_bo->vmap));
+
+			if (pt_op->bind)
+				ops->populate(tile, &update->pt_bo->vmap,
+					      update->ofs, update->qwords,
+					      update);
+			else
+				ops->clear(vm, tile, &update->pt_bo->vmap,
+					   update->ofs, update->qwords,
+					   update);
+		}
+	}
+
+	trace_xe_vm_cpu_bind(vm);
+	xe_device_wmb(vm->xe);
+}
+
+static struct dma_fence *
+xe_cpu_bind_update_pgtables_no_job(struct xe_cpu_bind *cpu_bind,
+				   struct xe_cpu_bind_pt_update *pt_update)
+{
+	const struct xe_cpu_bind_pt_update_ops *ops = pt_update->ops;
+	struct xe_vm *vm = pt_update->vops->vm;
+	struct xe_tile *tile;
+	int err, id;
+
+	if (ops->pre_commit) {
+		pt_update->job = NULL;
+		err = ops->pre_commit(pt_update);
+		if (err)
+			return ERR_PTR(err);
+	}
+
+	for_each_tile(tile, vm->xe, id) {
+		struct xe_vm_pgtable_update_ops *pt_update_ops =
+			&pt_update->vops->pt_update_ops[tile->id];
+
+		if (!pt_update_ops->pt_job_ops)
+			continue;
+
+		xe_cpu_bind_update_pgtables_execute(vm, tile, ops,
+						    pt_update_ops->pt_job_ops->ops,
+						    pt_update_ops->pt_job_ops->current_op);
+	}
+
+	return dma_fence_get_stub();
+}
+
+static struct dma_fence *
+xe_cpu_bind_update_pgtables_job(struct xe_cpu_bind *cpu_bind,
+				struct xe_cpu_bind_pt_update *pt_update)
+{
+	const struct xe_cpu_bind_pt_update_ops *ops = pt_update->ops;
+	struct xe_exec_queue *q = pt_update->vops->q;
+	struct xe_device *xe = cpu_bind->xe;
+	struct xe_sched_job *job;
+	struct dma_fence *fence;
+	struct xe_tile *tile;
+	int err, id;
+	bool is_cpu_bind = is_cpu_bind_queue(cpu_bind, q);
+
+	job = xe_sched_job_create(q, NULL);
+	if (IS_ERR(job))
+		return ERR_CAST(job);
+
+	xe_assert(xe, job->is_pt_job);
+
+	if (ops->pre_commit) {
+		pt_update->job = job;
+		err = ops->pre_commit(pt_update);
+		if (err)
+			goto err_job;
+	}
+
+	if (is_cpu_bind)
+		mutex_lock(&cpu_bind->job_mutex);
+
+	job->pt_update[0].vm = pt_update->vops->vm;
+	job->pt_update[0].ops = ops;
+	for_each_tile(tile, xe, id) {
+		struct xe_vm_pgtable_update_ops *pt_update_ops =
+			&pt_update->vops->pt_update_ops[tile->id];
+
+		job->pt_update[0].pt_job_ops[tile->id] =
+			xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
+	}
+
+	xe_sched_job_arm(job);
+	fence = dma_fence_get(&job->drm.s_fence->finished);
+	xe_sched_job_push(job);
+
+	if (is_cpu_bind)
+		mutex_unlock(&cpu_bind->job_mutex);
+
+	return fence;
+
+err_job:
+	xe_sched_job_put(job);
+	return ERR_PTR(err);
+}
+
+/**
+ * xe_cpu_bind_update_pgtables() - Pipelined page-table update
+ * @cpu_bind: The cpu bind context.
+ * @pt_update: PT update arguments
+ *
+ * Perform a pipelined page-table update. The update descriptors are typically
+ * built under the same lock critical section as a call to this function. If
+ * using the default engine for the updates, they will be performed in the
+ * order they grab the job_mutex. If different engines are used, external
+ * synchronization is needed for overlapping updates to maintain page-table
+ * consistency. Note that the meaning of "overlapping" is that the updates
+ * touch the same page-table, which might be a higher-level page-directory.
+ * If no pipelining is needed, then updates may be performed by the cpu.
+ *
+ * Return: A dma_fence that, when signaled, indicates the update completion.
+ */
+struct dma_fence *
+xe_cpu_bind_update_pgtables(struct xe_cpu_bind *cpu_bind,
+			    struct xe_cpu_bind_pt_update *pt_update)
+{
+	struct dma_fence *fence;
+
+	fence = xe_cpu_bind_update_pgtables_no_job(cpu_bind, pt_update);
+
+	/* -ETIME indicates a job is needed, anything else is legit error */
+	if (!IS_ERR(fence) || PTR_ERR(fence) != -ETIME)
+		return fence;
+
+	return xe_cpu_bind_update_pgtables_job(cpu_bind, pt_update);
+}
+
+/**
+ * xe_cpu_bind_job_lock() - Lock cpu_bind job lock
+ * @cpu_bind: The cpu bind context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Lock the cpu_bind job lock if the queue is a cpu bind queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_cpu_bind_job_lock(struct xe_cpu_bind *cpu_bind,
+			  struct xe_exec_queue *q)
+{
+	bool is_cpu_bind = is_cpu_bind_queue(cpu_bind, q);
+
+	if (is_cpu_bind)
+		mutex_lock(&cpu_bind->job_mutex);
+	else
+		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
+}
+
+/**
+ * xe_cpu_bind_job_unlock() - Unlock cpu_bind job lock
+ * @cpu_bind: The cpu bind context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Unlock the cpu_bind job lock if the queue is a cpu bind queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_cpu_bind_job_unlock(struct xe_cpu_bind *cpu_bind,
+			    struct xe_exec_queue *q)
+{
+	bool is_cpu_bind = is_cpu_bind_queue(cpu_bind, q);
+
+	if (is_cpu_bind)
+		mutex_unlock(&cpu_bind->job_mutex);
+	else
+		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
+}
+
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+/**
+ * xe_cpu_bind_job_lock_assert() - Assert cpu_bind job lock held of queue
+ * @q: cpu bind queue
+ */
+void xe_cpu_bind_job_lock_assert(struct xe_exec_queue *q)
+{
+	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_cpu_bind *cpu_bind = xe->cpu_bind;
+
+	xe_assert(xe, q == cpu_bind->q);
+	lockdep_assert_held(&cpu_bind->job_mutex);
+}
+#endif
diff --git a/drivers/gpu/drm/xe/xe_cpu_bind.h b/drivers/gpu/drm/xe/xe_cpu_bind.h
new file mode 100644
index 000000000000..95996a6a5c20
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_cpu_bind.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_CPU_BIND_H_
+#define _XE_CPU_BIND_H_
+
+#include <linux/types.h>
+
+struct dma_fence;
+struct iosys_map;
+struct xe_cpu_bind;
+struct xe_cpu_bind_pt_update;
+struct xe_device;
+struct xe_tlb_inval_job;
+struct xe_tile;
+struct xe_vm;
+struct xe_vm_pgtable_update;
+struct xe_vm_pgtable_update_op;
+struct xe_vma_ops;
+
+/**
+ * struct xe_cpu_bind_pt_update_ops - Callbacks for the
+ * xe_cpu_bind_update_pgtables() function.
+ */
+struct xe_cpu_bind_pt_update_ops {
+	/**
+	 * @populate: Populate a command buffer or page-table with ptes.
+	 * @tile: The tile for the current operation.
+	 * @map: struct iosys_map into the memory to be populated.
+	 * @ofs: qword offset into @map, unused if @map is NULL.
+	 * @num_qwords: Number of qwords to write.
+	 * @update: Information about the PTEs to be inserted.
+	 *
+	 * This interface is intended to be used as a callback into the
+	 * page-table system to populate command buffers or shared
+	 * page-tables with PTEs.
+	 */
+	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
+			 u32 ofs, u32 num_qwords,
+			 const struct xe_vm_pgtable_update *update);
+	/**
+	 * @clear: Clear a command buffer or page-table with ptes.
+	 * @vm: VM being updated
+	 * @tile: The tile for the current operation.
+	 * @map: struct iosys_map into the memory to be populated.
+	 * @ofs: qword offset into @map, unused if @map is NULL.
+	 * @num_qwords: Number of qwords to write.
+	 * @update: Information about the PTEs to be inserted.
+	 *
+	 * This interface is intended to be used as a callback into the
+	 * page-table system to populate command buffers or shared
+	 * page-tables with PTEs.
+	 */
+	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
+		      struct iosys_map *map, u32 ofs, u32 num_qwords,
+		      const struct xe_vm_pgtable_update *update);
+
+	/**
+	 * @pre_commit: Callback to be called just before arming the
+	 * sched_job.
+	 * @pt_update: Pointer to embeddable callback argument.
+	 *
+	 * Return: 0 on success, negative error code on error.
+	 */
+	int (*pre_commit)(struct xe_cpu_bind_pt_update *pt_update);
+};
+
+/**
+ * struct xe_cpu_bind_pt_update - Argument to the struct
+ * xe_cpu_bind_pt_update_ops callbacks.
+ *
+ * Intended to be subclassed to support additional arguments if necessary.
+ */
+struct xe_cpu_bind_pt_update {
+	/** @ops: Pointer to the struct xe_cpu_bind_pt_update_ops callbacks */
+	const struct xe_cpu_bind_pt_update_ops *ops;
+	/** @vops: VMA operations */
+	struct xe_vma_ops *vops;
+	/** @job: The job if a GPU page-table update. NULL otherwise */
+	struct xe_sched_job *job;
+	/**
+	 * @ijobs: The TLB invalidation jobs, individual instances can be NULL
+	 */
+#define XE_CPU_BIND_INVAL_JOB_COUNT	4
+	struct xe_tlb_inval_job *ijobs[XE_CPU_BIND_INVAL_JOB_COUNT];
+};
+
+int xe_cpu_bind_init(struct xe_device *xe);
+
+struct xe_exec_queue *xe_cpu_bind_queue(struct xe_cpu_bind *cpu_bind);
+
+void
+xe_cpu_bind_update_pgtables_execute(struct xe_vm *vm, struct xe_tile *tile,
+				    const struct xe_cpu_bind_pt_update_ops *ops,
+				    struct xe_vm_pgtable_update_op *pt_op,
+				    int num_ops);
+
+struct dma_fence *
+xe_cpu_bind_update_pgtables(struct xe_cpu_bind *cpu_bind,
+			    struct xe_cpu_bind_pt_update *pt_update);
+
+void xe_cpu_bind_job_lock(struct xe_cpu_bind *cpu_bind,
+			  struct xe_exec_queue *q);
+
+void xe_cpu_bind_job_unlock(struct xe_cpu_bind *cpu_bind,
+			    struct xe_exec_queue *q);
+
+#if IS_ENABLED(CONFIG_PROVE_LOCKING)
+void xe_cpu_bind_job_lock_assert(struct xe_exec_queue *q);
+#else
+static inline void xe_cpu_bind_job_lock_assert(struct xe_exec_queue *q)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 8583b2e9ecf4..ade971de1652 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -27,6 +27,7 @@
 #include "xe_bo_evict.h"
 #include "xe_configfs.h"
 #include "xe_debugfs.h"
+#include "xe_cpu_bind.h"
 #include "xe_defaults.h"
 #include "xe_devcoredump.h"
 #include "xe_device_sysfs.h"
@@ -1075,6 +1076,10 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
+	err = xe_cpu_bind_init(xe);
+	if (err)
+		return err;
+
 	err = xe_pagefault_init(xe);
 	if (err)
 		return err;
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 180d450a6deb..bc60833c39a7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -38,6 +38,7 @@
 struct drm_pagemap_shrinker;
 struct intel_display;
 struct intel_dg_nvm_dev;
+struct xe_cpu_bind;
 struct xe_ggtt;
 struct xe_i2c;
 struct xe_pat_ops;
@@ -559,6 +560,9 @@ struct xe_device {
 	/** @sc: System Controller */
 	struct xe_sysctrl sc;
 
+	/** @cpu_bind: CPU bind object */
+	struct xe_cpu_bind *cpu_bind;
+
 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
 	u32 atomic_svm_timeslice_ms;
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index afc5e37faa1b..e89802ff4f0e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -14,6 +14,7 @@
 #include <uapi/drm/xe_drm.h>
 
 #include "xe_bo.h"
+#include "xe_cpu_bind.h"
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
@@ -1598,7 +1599,7 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
 	if (q->flags & EXEC_QUEUE_FLAG_MIGRATE) {
-		xe_migrate_job_lock_assert(q);
+		xe_cpu_bind_job_lock_assert(q);
 	} else if (q->flags & EXEC_QUEUE_FLAG_VM) {
 		lockdep_assert_held(&vm->lock);
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 528869928c1d..dcb4b8a4f3b7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -18,6 +18,7 @@
 #include "abi/guc_klvs_abi.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_cpu_bind.h"
 #include "xe_devcoredump.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
@@ -37,7 +38,6 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
-#include "xe_migrate.h"
 #include "xe_mocs.h"
 #include "xe_module.h"
 #include "xe_pm.h"
@@ -1243,13 +1243,36 @@ static bool is_pt_job(struct xe_sched_job *job)
 	return job->is_pt_job;
 }
 
-static void run_pt_job(struct xe_sched_job *job)
+static void run_pt_job(struct xe_device *xe, struct xe_sched_job *job)
 {
-	xe_migrate_update_pgtables_cpu_execute(job->pt_update[0].vm,
-					       job->pt_update[0].tile,
-					       job->pt_update[0].ops,
-					       job->pt_update[0].pt_job_ops->ops,
-					       job->pt_update[0].pt_job_ops->current_op);
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_pt_job_ops *pt_job_ops =
+			job->pt_update[0].pt_job_ops[id];
+
+		if (!pt_job_ops || !pt_job_ops->current_op)
+			continue;
+
+		xe_cpu_bind_update_pgtables_execute(job->pt_update[0].vm, tile,
+						    job->pt_update[0].ops,
+						    pt_job_ops->ops,
+						    pt_job_ops->current_op);
+	}
+}
+
+static void put_pt_job(struct xe_device *xe, struct xe_sched_job *job)
+{
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_pt_job_ops *pt_job_ops =
+			job->pt_update[0].pt_job_ops[id];
+
+		xe_pt_job_ops_put(pt_job_ops);
+	}
 }
 
 static struct dma_fence *
@@ -1279,7 +1302,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 		if (is_pt_job(job)) {
 			xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
-			run_pt_job(job);
+			run_pt_job(guc_to_xe(guc), job);
 		} else {
 			if (!exec_queue_registered(q))
 				register_exec_queue(q, GUC_CONTEXT_NORMAL);
@@ -1291,7 +1314,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	}
 
 	if (is_pt_job(job)) {
-		xe_pt_job_ops_put(job->pt_update[0].pt_job_ops);
+		put_pt_job(guc_to_xe(guc), job);
 		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 66e77de4e192..f7e1a81434b2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -51,8 +51,6 @@
 struct xe_migrate {
 	/** @q: Default exec queue used for migration */
 	struct xe_exec_queue *q;
-	/** @bind_q: Default exec queue used for binds */
-	struct xe_exec_queue *bind_q;
 	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
 	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
@@ -110,7 +108,6 @@ static void xe_migrate_fini(void *arg)
 	mutex_destroy(&m->job_mutex);
 	xe_vm_close_and_put(m->q->vm);
 	xe_exec_queue_put(m->q);
-	xe_exec_queue_put(m->bind_q);
 }
 
 static inline u16 xe_migrate_pat_index(struct xe_device *xe,
@@ -483,15 +480,6 @@ int xe_migrate_init(struct xe_migrate *m)
 			goto err_out;
 		}
 
-		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
-						 EXEC_QUEUE_FLAG_KERNEL |
-						 EXEC_QUEUE_FLAG_HIGH_PRIORITY |
-						 EXEC_QUEUE_FLAG_MIGRATE, 0);
-		if (IS_ERR(m->bind_q)) {
-			err = PTR_ERR(m->bind_q);
-			goto err_out;
-		}
-
 		/*
 		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
 		 * PVC, may want to revisit if performance is needed.
@@ -502,15 +490,6 @@ int xe_migrate_init(struct xe_migrate *m)
 					    EXEC_QUEUE_FLAG_MIGRATE |
 					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
 	} else {
-		m->bind_q = xe_exec_queue_create_class(xe, primary_gt, vm,
-						       XE_ENGINE_CLASS_COPY,
-						       EXEC_QUEUE_FLAG_KERNEL |
-						       EXEC_QUEUE_FLAG_MIGRATE, 0);
-		if (IS_ERR(m->bind_q)) {
-			err = PTR_ERR(m->bind_q);
-			goto err_out;
-		}
-
 		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
 						  XE_ENGINE_CLASS_COPY,
 						  EXEC_QUEUE_FLAG_KERNEL |
@@ -546,8 +525,6 @@ int xe_migrate_init(struct xe_migrate *m)
 	return err;
 
 err_out:
-	if (!IS_ERR_OR_NULL(m->bind_q))
-		xe_exec_queue_put(m->bind_q);
 	xe_vm_close_and_put(vm);
 	return err;
 
@@ -1507,17 +1484,6 @@ static u32 blt_mem_set_cmd_len(struct xe_device *xe)
 	return 7;
 }
 
-/**
- * xe_get_migrate_bind_queue() - Get the bind queue from migrate context.
- * @migrate: Migrate context.
- *
- * Return: Pointer to bind queue on success, error on failure
- */
-struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate)
-{
-	return migrate->bind_q;
-}
-
 static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
 				 u32 size, u32 pitch)
 {
@@ -1782,168 +1748,6 @@ struct migrate_test_params {
 	container_of(_priv, struct migrate_test_params, base)
 #endif
 
-/**
- * xe_migrate_update_pgtables_cpu_execute() - Update a VM's PTEs via the CPU
- * @vm: The VM being updated
- * @tile: The tile being updated
- * @ops: The migrate PT update ops
- * @pt_ops: The VM PT update ops
- * @num_ops: The number of The VM PT update ops
- *
- * Execute the VM PT update ops array which results in a VM's PTEs being updated
- * via the CPU.
- */
-void
-xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
-				       const struct xe_migrate_pt_update_ops *ops,
-				       struct xe_vm_pgtable_update_op *pt_op,
-				       int num_ops)
-{
-	u32 j, i;
-
-	for (j = 0; j < num_ops; ++j, ++pt_op) {
-		for (i = 0; i < pt_op->num_entries; i++) {
-			const struct xe_vm_pgtable_update *update =
-				&pt_op->entries[i];
-
-			xe_tile_assert(tile, update);
-			xe_tile_assert(tile, update->pt_bo);
-			xe_tile_assert(tile, !iosys_map_is_null(&update->pt_bo->vmap));
-
-			if (pt_op->bind)
-				ops->populate(tile, &update->pt_bo->vmap,
-					      update->ofs, update->qwords,
-					      update);
-			else
-				ops->clear(vm, tile, &update->pt_bo->vmap,
-					   update->ofs, update->qwords,
-					   update);
-		}
-	}
-
-	trace_xe_vm_cpu_bind(vm);
-	xe_device_wmb(vm->xe);
-}
-
-static struct dma_fence *
-xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
-			       struct xe_migrate_pt_update *pt_update)
-{
-	XE_TEST_DECLARE(struct migrate_test_params *test =
-			to_migrate_test_params
-			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
-	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	struct xe_vm *vm = pt_update->vops->vm;
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&pt_update->vops->pt_update_ops[pt_update->tile_id];
-	int err;
-
-	if (XE_TEST_ONLY(test && test->force_gpu))
-		return ERR_PTR(-ETIME);
-
-	if (ops->pre_commit) {
-		pt_update->job = NULL;
-		err = ops->pre_commit(pt_update);
-		if (err)
-			return ERR_PTR(err);
-	}
-
-	xe_migrate_update_pgtables_cpu_execute(vm, m->tile, ops,
-					       pt_update_ops->pt_job_ops->ops,
-					       pt_update_ops->num_ops);
-
-	return dma_fence_get_stub();
-}
-
-static bool is_migrate_queue(struct xe_migrate *m, struct xe_exec_queue *q)
-{
-	return m->bind_q == q;
-}
-
-static struct dma_fence *
-__xe_migrate_update_pgtables(struct xe_migrate *m,
-			     struct xe_migrate_pt_update *pt_update,
-			     struct xe_vm_pgtable_update_ops *pt_update_ops)
-{
-	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	struct xe_tile *tile = m->tile;
-	struct xe_sched_job *job;
-	struct dma_fence *fence;
-	bool is_migrate = is_migrate_queue(m, pt_update_ops->q);
-	int err;
-
-	job = xe_sched_job_create(pt_update_ops->q, NULL);
-	if (IS_ERR(job)) {
-		err = PTR_ERR(job);
-		goto err_out;
-	}
-
-	xe_tile_assert(tile, job->is_pt_job);
-
-	if (ops->pre_commit) {
-		pt_update->job = job;
-		err = ops->pre_commit(pt_update);
-		if (err)
-			goto err_job;
-	}
-	if (is_migrate)
-		mutex_lock(&m->job_mutex);
-
-	job->pt_update[0].vm = pt_update->vops->vm;
-	job->pt_update[0].tile = tile;
-	job->pt_update[0].ops = ops;
-	job->pt_update[0].pt_job_ops =
-		xe_pt_job_ops_get(pt_update_ops->pt_job_ops);
-
-	xe_sched_job_arm(job);
-	fence = dma_fence_get(&job->drm.s_fence->finished);
-	xe_sched_job_push(job);
-
-	if (is_migrate)
-		mutex_unlock(&m->job_mutex);
-
-	return fence;
-
-err_job:
-	xe_sched_job_put(job);
-err_out:
-	return ERR_PTR(err);
-}
-
-/**
- * xe_migrate_update_pgtables() - Pipelined page-table update
- * @m: The migrate context.
- * @pt_update: PT update arguments
- *
- * Perform a pipelined page-table update. The update descriptors are typically
- * built under the same lock critical section as a call to this function. If
- * using the default engine for the updates, they will be performed in the
- * order they grab the job_mutex. If different engines are used, external
- * synchronization is needed for overlapping updates to maintain page-table
- * consistency. Note that the meaning of "overlapping" is that the updates
- * touch the same page-table, which might be a higher-level page-directory.
- * If no pipelining is needed, then updates may be performed by the cpu.
- *
- * Return: A dma_fence that, when signaled, indicates the update completion.
- */
-struct dma_fence *
-xe_migrate_update_pgtables(struct xe_migrate *m,
-			   struct xe_migrate_pt_update *pt_update)
-
-{
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&pt_update->vops->pt_update_ops[pt_update->tile_id];
-	struct dma_fence *fence;
-
-	fence =  xe_migrate_update_pgtables_cpu(m, pt_update);
-
-	/* -ETIME indicates a job is needed, anything else is legit error */
-	if (!IS_ERR(fence) || PTR_ERR(fence) != -ETIME)
-		return fence;
-
-	return __xe_migrate_update_pgtables(m, pt_update, pt_update_ops);
-}
-
 /**
  * xe_migrate_wait() - Complete all operations using the xe_migrate context
  * @m: Migrate context to wait for.
@@ -2445,56 +2249,6 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
 }
 
-/**
- * xe_migrate_job_lock() - Lock migrate job lock
- * @m: The migration context.
- * @q: Queue associated with the operation which requires a lock
- *
- * Lock the migrate job lock if the queue is a migration queue, otherwise
- * assert the VM's dma-resv is held (user queue's have own locking).
- */
-void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
-{
-	bool is_migrate = is_migrate_queue(m, q);
-
-	if (is_migrate)
-		mutex_lock(&m->job_mutex);
-	else
-		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
-}
-
-/**
- * xe_migrate_job_unlock() - Unlock migrate job lock
- * @m: The migration context.
- * @q: Queue associated with the operation which requires a lock
- *
- * Unlock the migrate job lock if the queue is a migration queue, otherwise
- * assert the VM's dma-resv is held (user queue's have own locking).
- */
-void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
-{
-	bool is_migrate = is_migrate_queue(m, q);
-
-	if (is_migrate)
-		mutex_unlock(&m->job_mutex);
-	else
-		xe_vm_assert_held(q->user_vm);	/* User queues VM's should be locked */
-}
-
-#if IS_ENABLED(CONFIG_PROVE_LOCKING)
-/**
- * xe_migrate_job_lock_assert() - Assert migrate job lock held of queue
- * @q: Migrate queue
- */
-void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
-{
-	struct xe_migrate *m = gt_to_tile(q->gt)->migrate;
-
-	xe_gt_assert(q->gt, q == m->bind_q);
-	lockdep_assert_held(&m->job_mutex);
-}
-#endif
-
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 48896fae1fbd..67e5ba1f8284 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -34,78 +34,6 @@ enum xe_migrate_copy_dir {
 	XE_MIGRATE_COPY_TO_SRAM,
 };
 
-/**
- * struct xe_migrate_pt_update_ops - Callbacks for the
- * xe_migrate_update_pgtables() function.
- */
-struct xe_migrate_pt_update_ops {
-	/**
-	 * @populate: Populate a command buffer or page-table with ptes.
-	 * @tile: The tile for the current operation.
-	 * @map: struct iosys_map into the memory to be populated.
-	 * @ofs: qword offset into @map, unused if @map is NULL.
-	 * @num_qwords: Number of qwords to write.
-	 * @update: Information about the PTEs to be inserted.
-	 *
-	 * This interface is intended to be used as a callback into the
-	 * page-table system to populate command buffers or shared
-	 * page-tables with PTEs.
-	 */
-	void (*populate)(struct xe_tile *tile, struct iosys_map *map,
-			 u32 ofs, u32 num_qwords,
-			 const struct xe_vm_pgtable_update *update);
-	/**
-	 * @clear: Clear a command buffer or page-table with ptes.
-	 * @vm: VM being updated
-	 * @tile: The tile for the current operation.
-	 * @map: struct iosys_map into the memory to be populated.
-	 * @ofs: qword offset into @map, unused if @map is NULL.
-	 * @num_qwords: Number of qwords to write.
-	 * @update: Information about the PTEs to be inserted.
-	 *
-	 * This interface is intended to be used as a callback into the
-	 * page-table system to populate command buffers or shared
-	 * page-tables with PTEs.
-	 */
-	void (*clear)(struct xe_vm *vm, struct xe_tile *tile,
-		      struct iosys_map *map, u32 ofs, u32 num_qwords,
-		      const struct xe_vm_pgtable_update *update);
-
-	/**
-	 * @pre_commit: Callback to be called just before arming the
-	 * sched_job.
-	 * @pt_update: Pointer to embeddable callback argument.
-	 *
-	 * Return: 0 on success, negative error code on error.
-	 */
-	int (*pre_commit)(struct xe_migrate_pt_update *pt_update);
-};
-
-/**
- * struct xe_migrate_pt_update - Argument to the
- * struct xe_migrate_pt_update_ops callbacks.
- *
- * Intended to be subclassed to support additional arguments if necessary.
- */
-struct xe_migrate_pt_update {
-	/** @ops: Pointer to the struct xe_migrate_pt_update_ops callbacks */
-	const struct xe_migrate_pt_update_ops *ops;
-	/** @vops: VMA operations */
-	struct xe_vma_ops *vops;
-	/** @job: The job if a GPU page-table update. NULL otherwise */
-	struct xe_sched_job *job;
-	/**
-	 * @ijob: The TLB invalidation job for primary GT. NULL otherwise
-	 */
-	struct xe_tlb_inval_job *ijob;
-	/**
-	 * @mjob: The TLB invalidation job for media GT. NULL otherwise
-	 */
-	struct xe_tlb_inval_job *mjob;
-	/** @tile_id: Tile ID of the update */
-	u8 tile_id;
-};
-
 struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
 int xe_migrate_init(struct xe_migrate *m);
 
@@ -143,7 +71,6 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
 
 struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate);
 struct xe_exec_queue *xe_migrate_exec_queue(struct xe_migrate *migrate);
-struct xe_exec_queue *xe_migrate_bind_queue(struct xe_migrate *migrate);
 struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_offset,
 					     struct xe_bo *sysmem_bo, u64 sysmem_offset,
 					     u64 size, enum xe_migrate_copy_dir dir);
@@ -163,29 +90,8 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 struct xe_vm *xe_migrate_get_vm(struct xe_migrate *m);
 
 
-void
-xe_migrate_update_pgtables_cpu_execute(struct xe_vm *vm, struct xe_tile *tile,
-				       const struct xe_migrate_pt_update_ops *ops,
-				       struct xe_vm_pgtable_update_op *pt_op,
-				       int num_ops);
-
-struct dma_fence *
-xe_migrate_update_pgtables(struct xe_migrate *m,
-			   struct xe_migrate_pt_update *pt_update);
-
 void xe_migrate_wait(struct xe_migrate *m);
 
-#if IS_ENABLED(CONFIG_PROVE_LOCKING)
-void xe_migrate_job_lock_assert(struct xe_exec_queue *q);
-#else
-static inline void xe_migrate_job_lock_assert(struct xe_exec_queue *q)
-{
-}
-#endif
-
-void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
-void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
-
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 int xe_migrate_debug_ccs_overlap(struct xe_migrate *m,
 				 struct xe_bo *scratch_bo,
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 7c7cd7a0365b..821edeaecaed 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -7,12 +7,12 @@
 
 #include "regs/xe_gtt_defs.h"
 #include "xe_bo.h"
+#include "xe_cpu_bind.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_stats.h"
-#include "xe_migrate.h"
 #include "xe_page_reclaim.h"
 #include "xe_pat.h"
 #include "xe_pt_types.h"
@@ -1402,11 +1402,9 @@ static int op_add_deps(struct xe_vm *vm, struct xe_vma_op *op,
 }
 
 static int xe_pt_vm_dependencies(struct xe_sched_job *job,
-				 struct xe_tlb_inval_job *ijob,
-				 struct xe_tlb_inval_job *mjob,
+				 struct xe_tlb_inval_job **ijobs,
 				 struct xe_vm *vm,
 				 struct xe_vma_ops *vops,
-				 struct xe_vm_pgtable_update_ops *pt_update_ops,
 				 struct xe_range_fence_tree *rftree)
 {
 	struct xe_range_fence *rtfence;
@@ -1419,20 +1417,22 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	if (!job && !no_in_syncs(vops->syncs, vops->num_syncs))
 		return -ETIME;
 
-	if (!job && !xe_exec_queue_is_idle(pt_update_ops->q))
+	if (!job && !xe_exec_queue_is_idle(vops->q))
 		return -ETIME;
 
-	if (pt_update_ops->wait_vm_bookkeep || pt_update_ops->wait_vm_kernel) {
-		err = job_test_add_deps(job, xe_vm_resv(vm),
-					pt_update_ops->wait_vm_bookkeep ?
-					DMA_RESV_USAGE_BOOKKEEP :
-					DMA_RESV_USAGE_KERNEL);
+	if (vops->flags & (XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP |
+			   XE_VMA_OPS_FLAG_WAIT_VM_KERNEL)) {
+		enum dma_resv_usage usage = DMA_RESV_USAGE_KERNEL;
+
+		if (vops->flags & XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP)
+			usage = DMA_RESV_USAGE_BOOKKEEP;
+
+		err = job_test_add_deps(job, xe_vm_resv(vm), usage);
 		if (err)
 			return err;
 	}
 
-	rtfence = xe_range_fence_tree_first(rftree, pt_update_ops->start,
-					    pt_update_ops->last);
+	rtfence = xe_range_fence_tree_first(rftree, vops->start, vops->last);
 	while (rtfence) {
 		fence = rtfence->fence;
 
@@ -1450,9 +1450,8 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 				return err;
 		}
 
-		rtfence = xe_range_fence_tree_next(rtfence,
-						   pt_update_ops->start,
-						   pt_update_ops->last);
+		rtfence = xe_range_fence_tree_next(rtfence, vops->start,
+						   vops->last);
 	}
 
 	list_for_each_entry(op, &vops->list, link) {
@@ -1465,14 +1464,11 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
 
 	if (job) {
-		if (ijob) {
-			err = xe_tlb_inval_job_alloc_dep(ijob);
-			if (err)
-				return err;
-		}
+		for (i = 0; i < XE_CPU_BIND_INVAL_JOB_COUNT; ++i) {
+			if (!ijobs[i])
+				continue;
 
-		if (mjob) {
-			err = xe_tlb_inval_job_alloc_dep(mjob);
+			err = xe_tlb_inval_job_alloc_dep(ijobs[i]);
 			if (err)
 				return err;
 		}
@@ -1481,17 +1477,14 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 	return err;
 }
 
-static int xe_pt_pre_commit(struct xe_migrate_pt_update *pt_update)
+static int xe_pt_pre_commit(struct xe_cpu_bind_pt_update *pt_update)
 {
 	struct xe_vma_ops *vops = pt_update->vops;
 	struct xe_vm *vm = vops->vm;
-	struct xe_range_fence_tree *rftree = &vm->rftree[pt_update->tile_id];
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&vops->pt_update_ops[pt_update->tile_id];
+	struct xe_range_fence_tree *rftree = &vm->rftree;
 
-	return xe_pt_vm_dependencies(pt_update->job, pt_update->ijob,
-				     pt_update->mjob, vm, pt_update->vops,
-				     pt_update_ops, rftree);
+	return xe_pt_vm_dependencies(pt_update->job, pt_update->ijobs,
+				     vm, vops, rftree);
 }
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
@@ -1551,8 +1544,7 @@ static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
 
 #endif
 
-static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
-			     struct xe_vm_pgtable_update_ops *pt_update)
+static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma)
 {
 	struct xe_userptr_vma *uvma;
 	unsigned long notifier_seq;
@@ -1582,8 +1574,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	return 0;
 }
 
-static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
-				struct xe_vm_pgtable_update_ops *pt_update)
+static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	int err = 0;
 
@@ -1594,13 +1585,13 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
 			break;
 
-		err = vma_check_userptr(vm, op->map.vma, pt_update);
+		err = vma_check_userptr(vm, op->map.vma);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		if (op->remap.prev && !op->remap.skip_prev)
-			err = vma_check_userptr(vm, op->remap.prev, pt_update);
+			err = vma_check_userptr(vm, op->remap.prev);
 		if (!err && op->remap.next && !op->remap.skip_next)
-			err = vma_check_userptr(vm, op->remap.next, pt_update);
+			err = vma_check_userptr(vm, op->remap.next);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		break;
@@ -1620,7 +1611,7 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 				}
 			}
 		} else {
-			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
+			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va));
 		}
 		break;
 #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
@@ -1646,12 +1637,10 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 	return err;
 }
 
-static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
+static int xe_pt_svm_userptr_pre_commit(struct xe_cpu_bind_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
 	struct xe_vma_ops *vops = pt_update->vops;
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&vops->pt_update_ops[pt_update->tile_id];
 	struct xe_vma_op *op;
 	int err;
 
@@ -1662,7 +1651,7 @@ static int xe_pt_svm_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	xe_pt_svm_userptr_notifier_lock(vm);
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_check_svm_userptr(vm, op, pt_update_ops);
+		err = op_check_svm_userptr(vm, op);
 		if (err) {
 			xe_pt_svm_userptr_notifier_unlock(vm);
 			break;
@@ -2009,10 +1998,10 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 }
 
 static void
-xe_migrate_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
-				  struct iosys_map *map, u32 qword_ofs,
-				  u32 num_qwords,
-				  const struct xe_vm_pgtable_update *update)
+xe_pt_clear_pgtable_callback(struct xe_vm *vm, struct xe_tile *tile,
+			     struct iosys_map *map, u32 qword_ofs,
+			     u32 num_qwords,
+			     const struct xe_vm_pgtable_update *update)
 {
 	u64 empty = __xe_pt_empty_pte(tile, vm, update->level);
 	int i;
@@ -2090,6 +2079,9 @@ to_pt_op(struct xe_vm_pgtable_update_ops *pt_update_ops, u32 op_idx)
 static u32
 get_current_op(struct xe_vm_pgtable_update_ops *pt_update_ops)
 {
+	if (!pt_update_ops->pt_job_ops)
+		return 0;
+
 	return pt_update_ops->pt_job_ops->current_op;
 }
 
@@ -2379,6 +2371,7 @@ static int unbind_range_prepare(struct xe_vm *vm,
 
 static int op_prepare(struct xe_vm *vm,
 		      struct xe_tile *tile,
+		      struct xe_vma_ops *vops,
 		      struct xe_vm_pgtable_update_ops *pt_update_ops,
 		      struct xe_vma_op *op)
 {
@@ -2395,7 +2388,7 @@ static int op_prepare(struct xe_vm *vm,
 
 		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
 				      op->map.invalidate_on_bind);
-		pt_update_ops->wait_vm_kernel = true;
+		vops->flags |= XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
 		break;
 	case DRM_GPUVA_OP_REMAP:
 	{
@@ -2409,12 +2402,12 @@ static int op_prepare(struct xe_vm *vm,
 		if (!err && op->remap.prev && !op->remap.skip_prev) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
 					      op->remap.prev, false);
-			pt_update_ops->wait_vm_bookkeep = true;
+			vops->flags |= XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
 		}
 		if (!err && op->remap.next && !op->remap.skip_next) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
 					      op->remap.next, false);
-			pt_update_ops->wait_vm_bookkeep = true;
+			vops->flags |= XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
 		}
 		break;
 	}
@@ -2450,7 +2443,7 @@ static int op_prepare(struct xe_vm *vm,
 			}
 		} else {
 			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
-			pt_update_ops->wait_vm_kernel = true;
+			vops->flags |= XE_VMA_OPS_FLAG_WAIT_VM_KERNEL;
 		}
 		break;
 	}
@@ -2484,18 +2477,8 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
 	xe_page_reclaim_list_init(&pt_update_ops->prl);
 }
 
-/**
- * xe_pt_update_ops_prepare() - Prepare PT update operations
- * @tile: Tile of PT update operations
- * @vops: VMA operationa
- *
- * Prepare PT update operations which includes updating internal PT state,
- * allocate memory for page tables, populate page table being pruned in, and
- * create PT update operations for leaf insertion / removal.
- *
- * Return: 0 on success, negative error code on error.
- */
-int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
+static int __xe_pt_update_ops_prepare(struct xe_tile *tile,
+				      struct xe_vma_ops *vops)
 {
 	struct xe_vm_pgtable_update_ops *pt_update_ops =
 		&vops->pt_update_ops[tile->id];
@@ -2514,7 +2497,7 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 		return err;
 
 	list_for_each_entry(op, &vops->list, link) {
-		err = op_prepare(vops->vm, tile, pt_update_ops, op);
+		err = op_prepare(vops->vm, tile, vops, pt_update_ops, op);
 
 		if (err)
 			return err;
@@ -2523,6 +2506,16 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 	xe_tile_assert(tile, get_current_op(pt_update_ops) <=
 		       pt_update_ops->num_ops);
 
+	/* Propagate individual tile state up to VMA operation */
+	if (pt_update_ops->start < vops->start)
+		vops->start = pt_update_ops->start;
+	if (pt_update_ops->last > vops->last)
+		vops->last = pt_update_ops->last;
+	if (pt_update_ops->needs_invalidation)
+		vops->flags |= XE_VMA_OPS_FLAG_NEEDS_INVALIDATION;
+	if (pt_update_ops->needs_svm_lock)
+		vops->flags |= XE_VMA_OPS_FLAG_NEEDS_SVM_LOCK;
+
 #ifdef TEST_VM_OPS_ERROR
 	if (vops->inject_error &&
 	    vops->vm->xe->vm_inject_error_position == FORCE_OP_ERROR_PREPARE)
@@ -2531,35 +2524,68 @@ int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	return 0;
 }
-ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
 
-static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
-			   struct xe_vm_pgtable_update_ops *pt_update_ops,
-			   struct xe_vma *vma, struct dma_fence *fence,
-			   struct dma_fence *fence2, bool invalidate_on_bind)
+/**
+ * xe_pt_update_ops_prepare() - Prepare PT update operations
+ * @xe: xe device.
+ * @vops: VMA operationa
+ *
+ * Prepare PT update operations which includes updating internal PT state,
+ * allocate memory for page tables, populate page table being pruned in, and
+ * create PT update operations for leaf insertion / removal.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
 {
-	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
+	struct xe_tile *tile;
+	int id, err;
+
+	for_each_tile(tile, xe, id) {
+		if (!vops->pt_update_ops[id].num_ops)
+			continue;
 
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
-		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
-		if (fence2)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
-					   pt_update_ops->wait_vm_bookkeep ?
-					   DMA_RESV_USAGE_KERNEL :
-					   DMA_RESV_USAGE_BOOKKEEP);
+		err = __xe_pt_update_ops_prepare(tile, vops);
+		if (err)
+			return err;
 	}
+
+	return 0;
+}
+ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
+
+static void vma_add_fences(struct xe_vma *vma, struct dma_fence **fences,
+			   int fence_count, enum dma_resv_usage usage)
+{
+	int i;
+
+	if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm)
+		return;
+
+	for (i = 0; i < fence_count; ++i)
+		if (fences[i])
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv,
+					   fences[i], usage);
+}
+
+static void bind_op_commit(struct xe_vm *vm, struct xe_vma *vma,
+			   struct dma_fence **fences, int fence_count,
+			   enum dma_resv_usage usage, u8 tile_mask,
+			   bool invalidate_on_bind)
+{
+	xe_assert(vm->xe, !xe_vma_is_cpu_addr_mirror(vma));
+
+	vma_add_fences(vma, fences, fence_count, usage);
+
 	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
-	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile->id));
+	WRITE_ONCE(vma->tile_present, vma->tile_present | tile_mask);
 	if (invalidate_on_bind)
 		WRITE_ONCE(vma->tile_invalidated,
-			   vma->tile_invalidated | BIT(tile->id));
+			   vma->tile_invalidated | tile_mask);
 	else
 		WRITE_ONCE(vma->tile_invalidated,
-			   vma->tile_invalidated & ~BIT(tile->id));
-	vma->tile_staged &= ~BIT(tile->id);
+			   vma->tile_invalidated & ~tile_mask);
+	vma->tile_staged &= ~tile_mask;
 	if (xe_vma_is_userptr(vma)) {
 		xe_svm_assert_held_read_or_inject_write(vm);
 		to_userptr_vma(vma)->userptr.initial_bind = true;
@@ -2569,31 +2595,21 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	 * Kick rebind worker if this bind triggers preempt fences and not in
 	 * the rebind worker
 	 */
-	if (pt_update_ops->wait_vm_bookkeep &&
+	if (usage == DMA_RESV_USAGE_KERNEL &&
 	    xe_vm_in_preempt_fence_mode(vm) &&
 	    !current->mm)
 		xe_vm_queue_rebind_worker(vm);
 }
 
-static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
-			     struct xe_vm_pgtable_update_ops *pt_update_ops,
-			     struct xe_vma *vma, struct dma_fence *fence,
-			     struct dma_fence *fence2)
+static void unbind_op_commit(struct xe_vm *vm, struct xe_vma *vma,
+			     struct dma_fence **fences, int fence_count,
+			     enum dma_resv_usage usage, u8 tile_mask)
 {
-	xe_tile_assert(tile, !xe_vma_is_cpu_addr_mirror(vma));
+	xe_assert(vm->xe, !xe_vma_is_cpu_addr_mirror(vma));
 
-	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
-		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
-		if (fence2)
-			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence2,
-					   pt_update_ops->wait_vm_bookkeep ?
-					   DMA_RESV_USAGE_KERNEL :
-					   DMA_RESV_USAGE_BOOKKEEP);
-	}
-	vma->tile_present &= ~BIT(tile->id);
+	vma_add_fences(vma, fences, fence_count, usage);
+
+	vma->tile_present &= ~tile_mask;
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
 		if (xe_vma_is_userptr(vma)) {
@@ -2608,21 +2624,19 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 
 static void range_present_and_invalidated_tile(struct xe_vm *vm,
 					       struct xe_svm_range *range,
-					       u8 tile_id)
+					       u8 tile_mask)
 {
 	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 
 	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
 
-	WRITE_ONCE(range->tile_present, range->tile_present | BIT(tile_id));
-	WRITE_ONCE(range->tile_invalidated, range->tile_invalidated & ~BIT(tile_id));
+	WRITE_ONCE(range->tile_present, range->tile_present | tile_mask);
+	WRITE_ONCE(range->tile_invalidated, range->tile_invalidated & ~tile_mask);
 }
 
-static void op_commit(struct xe_vm *vm,
-		      struct xe_tile *tile,
-		      struct xe_vm_pgtable_update_ops *pt_update_ops,
-		      struct xe_vma_op *op, struct dma_fence *fence,
-		      struct dma_fence *fence2)
+static void op_commit(struct xe_vm *vm, struct xe_vma_op *op,
+		      struct dma_fence **fences, int fence_count,
+		      enum dma_resv_usage usage, u8 tile_mask)
 {
 	xe_vm_assert_held(vm);
 
@@ -2632,8 +2646,8 @@ static void op_commit(struct xe_vm *vm,
 		    (op->map.vma_flags & XE_VMA_SYSTEM_ALLOCATOR))
 			break;
 
-		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
-			       fence2, op->map.invalidate_on_bind);
+		bind_op_commit(vm, op->map.vma, fences, fence_count, usage,
+			       tile_mask, op->map.invalidate_on_bind);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 	{
@@ -2642,14 +2656,15 @@ static void op_commit(struct xe_vm *vm,
 		if (xe_vma_is_cpu_addr_mirror(old))
 			break;
 
-		unbind_op_commit(vm, tile, pt_update_ops, old, fence, fence2);
+		unbind_op_commit(vm, old, fences, fence_count, usage,
+				 tile_mask);
 
 		if (op->remap.prev && !op->remap.skip_prev)
-			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
-				       fence, fence2, false);
+			bind_op_commit(vm, op->remap.prev, fences, fence_count,
+				       usage, tile_mask, false);
 		if (op->remap.next && !op->remap.skip_next)
-			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
-				       fence, fence2, false);
+			bind_op_commit(vm, op->remap.next, fences, fence_count,
+				       usage, tile_mask, false);
 		break;
 	}
 	case DRM_GPUVA_OP_UNMAP:
@@ -2657,8 +2672,8 @@ static void op_commit(struct xe_vm *vm,
 		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
 		if (!xe_vma_is_cpu_addr_mirror(vma))
-			unbind_op_commit(vm, tile, pt_update_ops, vma, fence,
-					 fence2);
+			unbind_op_commit(vm, vma, fences, fence_count,
+					 tile_mask, usage);
 		break;
 	}
 	case DRM_GPUVA_OP_PREFETCH:
@@ -2670,10 +2685,11 @@ static void op_commit(struct xe_vm *vm,
 			unsigned long i;
 
 			xa_for_each(&op->prefetch_range.range, i, range)
-				range_present_and_invalidated_tile(vm, range, tile->id);
+				range_present_and_invalidated_tile(vm, range,
+								   tile_mask);
 		} else {
-			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
-				       fence2, false);
+			bind_op_commit(vm, vma, fences, fence_count, usage,
+				       tile_mask, false);
 		}
 		break;
 	}
@@ -2681,11 +2697,12 @@ static void op_commit(struct xe_vm *vm,
 	{
 		/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
-			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
+			range_present_and_invalidated_tile(vm, op->map_range.range,
+							   tile_mask);
 		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
 			WRITE_ONCE(op->unmap_range.range->tile_present,
 				   op->unmap_range.range->tile_present &
-				   ~BIT(tile->id));
+				   ~tile_mask);
 
 		break;
 	}
@@ -2694,40 +2711,25 @@ static void op_commit(struct xe_vm *vm,
 	}
 }
 
-static const struct xe_migrate_pt_update_ops migrate_ops = {
+static const struct xe_cpu_bind_pt_update_ops cpu_bind_ops = {
 	.populate = xe_vm_populate_pgtable,
-	.clear = xe_migrate_clear_pgtable_callback,
+	.clear = xe_pt_clear_pgtable_callback,
 	.pre_commit = xe_pt_pre_commit,
 };
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
-static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops = {
+static const struct xe_cpu_bind_pt_update_ops svm_userptr_cpu_bind_ops = {
 	.populate = xe_vm_populate_pgtable,
-	.clear = xe_migrate_clear_pgtable_callback,
+	.clear = xe_pt_clear_pgtable_callback,
 	.pre_commit = xe_pt_svm_userptr_pre_commit,
 };
 #else
-static const struct xe_migrate_pt_update_ops svm_userptr_migrate_ops;
+static const struct xe_cpu_bind_pt_update_ops svm_userptr_cpu_bind_ops;
 #endif
 
-static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q,
-						 struct xe_tile *tile,
-						 struct xe_gt *gt,
-						 unsigned int *type)
-{
-	int tile_ofs = tile->id * (XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT + 1);
-
-	if (xe_gt_is_media_type(gt))
-		*type = tile_ofs + XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT;
-	else
-		*type = tile_ofs + XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT;
-
-	return q->tlb_inval[*type].dep_scheduler;
-}
-
 /**
  * xe_pt_update_ops_run() - Run PT update operations
- * @tile: Tile of PT update operations
+ * @xe: xe device.
  * @vops: VMA operationa
  *
  * Run PT update operations which includes committing internal PT state changes,
@@ -2737,82 +2739,83 @@ static struct xe_dep_scheduler *to_dep_scheduler(struct xe_exec_queue *q,
  * Return: fence on success, negative ERR_PTR on error.
  */
 struct dma_fence *
-xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
+xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
 {
 	struct xe_vm *vm = vops->vm;
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&vops->pt_update_ops[tile->id];
-	struct xe_exec_queue *q = pt_update_ops->q;
-	struct dma_fence *fence, *ifence = NULL, *mfence = NULL;
-	struct xe_tlb_inval_job *ijob = NULL, *mjob = NULL;
+	struct xe_exec_queue *q = vops->q;
+	struct dma_fence *fence;
+	struct dma_fence *ifences[XE_CPU_BIND_INVAL_JOB_COUNT] = {};
 	struct xe_range_fence *rfence;
+	enum dma_resv_usage usage = DMA_RESV_USAGE_BOOKKEEP;
 	struct xe_vma_op *op;
-	unsigned int type;
-	int err = 0, i;
-	struct xe_migrate_pt_update update = {
-		.ops = pt_update_ops->needs_svm_lock ?
-			&svm_userptr_migrate_ops :
-			&migrate_ops,
+	struct xe_tile *tile;
+	int err = 0, total_ops = 0, i, j;
+	u8 tile_mask = 0;
+	bool needs_invalidation = vops->flags &
+		XE_VMA_OPS_FLAG_NEEDS_INVALIDATION;
+	bool needs_svm_lock = vops->flags &
+		XE_VMA_OPS_FLAG_NEEDS_SVM_LOCK;
+	struct xe_cpu_bind_pt_update update = {
+		.ops = needs_svm_lock ? &svm_userptr_cpu_bind_ops :
+			&cpu_bind_ops,
 		.vops = vops,
-		.tile_id = tile->id,
 	};
 
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 
-	if (!get_current_op(pt_update_ops)) {
-		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
+	for_each_tile(tile, xe, j) {
+		struct xe_vm_pgtable_update_ops *pt_update_ops =
+			&vops->pt_update_ops[j];
 
+		total_ops += get_current_op(pt_update_ops);
+	}
+	if (!total_ops) {
+		xe_assert(xe, xe_vm_in_fault_mode(vm));
 		return dma_fence_get_stub();
 	}
 
 #ifdef TEST_VM_OPS_ERROR
 	if (vops->inject_error &&
-	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
+	    xe->vm_inject_error_position == FORCE_OP_ERROR_RUN)
 		return ERR_PTR(-ENOSPC);
 #endif
 
-	if (pt_update_ops->needs_invalidation) {
-		struct xe_dep_scheduler *dep_scheduler =
-			to_dep_scheduler(q, tile, tile->primary_gt, &type);
-
-		ijob = xe_tlb_inval_job_create(q, &tile->primary_gt->tlb_inval,
-					       dep_scheduler, vm,
-					       pt_update_ops->start,
-					       pt_update_ops->last,
-					       type);
-		if (IS_ERR(ijob)) {
-			err = PTR_ERR(ijob);
-			goto kill_vm_tile1;
-		}
-		update.ijob = ijob;
-		/*
-		 * Only add page reclaim for the primary GT. Media GT does not have
-		 * any PPC to flush, so enabling the PPC flush bit for media is
-		 * effectively a NOP and provides no performance benefit nor
-		 * interfere with primary GT.
-		 */
-		if (xe_page_reclaim_list_valid(&pt_update_ops->prl)) {
-			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
-			/* Release ref from alloc, job will now handle it */
-			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
-		}
-
-		if (tile->media_gt) {
-			dep_scheduler = to_dep_scheduler(q, tile,
-							 tile->media_gt, &type);
-
-			mjob = xe_tlb_inval_job_create(q,
-						       &tile->media_gt->tlb_inval,
-						       dep_scheduler, vm,
-						       pt_update_ops->start,
-						       pt_update_ops->last,
-						       type);
-			if (IS_ERR(mjob)) {
-				err = PTR_ERR(mjob);
+	if (needs_invalidation) {
+		for_each_tlb_inval(q, i) {
+			struct xe_dep_scheduler *dep_scheduler =
+				q->tlb_inval[i].dep_scheduler;
+			struct xe_tile *tile =
+				&xe->tiles[i / XE_MAX_GT_PER_TILE];
+			struct xe_vm_pgtable_update_ops *pt_update_ops =
+				&vops->pt_update_ops[tile->id];
+			struct xe_page_reclaim_list *prl = &pt_update_ops->prl;
+			struct xe_tlb_inval_job *ijob;
+			struct xe_gt *gt = i % XE_MAX_GT_PER_TILE ?
+				tile->media_gt : tile->primary_gt;
+
+			ijob = xe_tlb_inval_job_create(q, &gt->tlb_inval,
+						       dep_scheduler,
+						       vm, pt_update_ops->start,
+						       pt_update_ops->last, i);
+			if (IS_ERR(ijob)) {
+				err = PTR_ERR(ijob);
 				goto free_ijob;
 			}
-			update.mjob = mjob;
+
+			update.ijobs[i] = ijob;
+
+			/*
+			 * Only add page reclaim for the primary GT. Media GT
+			 * does not have any PPC to flush, so enabling the PPC
+			 * flush bit for media is effectively a NOP and provides
+			 * no performance benefit nor interfere with primary GT.
+			 */
+			if (xe_page_reclaim_list_valid(prl)) {
+				xe_tlb_inval_job_add_page_reclaim(ijob, prl);
+				/* Release ref from alloc, job will now handle it */
+				xe_page_reclaim_list_invalidate(prl);
+			}
 		}
 	}
 
@@ -2822,67 +2825,61 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 		goto free_ijob;
 	}
 
-	fence = xe_migrate_update_pgtables(tile->migrate, &update);
+	fence = xe_cpu_bind_update_pgtables(xe->cpu_bind, &update);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 		goto free_rfence;
 	}
 
 	/* Point of no return - VM killed if failure after this */
-	for (i = 0; i < get_current_op(pt_update_ops); ++i) {
-		struct xe_vm_pgtable_update_op *pt_op =
-			to_pt_op(pt_update_ops, i);
-
-		xe_pt_commit(pt_op->vma, pt_op->entries,
-			     pt_op->num_entries,
-			     &pt_update_ops->pt_job_ops->deferred);
-		pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
+	for_each_tile(tile, xe, j) {
+		struct xe_vm_pgtable_update_ops *pt_update_ops =
+			&vops->pt_update_ops[j];
+
+		for (i = 0; i < get_current_op(pt_update_ops); ++i) {
+			struct xe_vm_pgtable_update_op *pt_op =
+				to_pt_op(pt_update_ops, i);
+
+			xe_pt_commit(pt_op->vma, pt_op->entries,
+				     pt_op->num_entries,
+				     &pt_update_ops->pt_job_ops->deferred);
+			pt_op->vma = NULL;	/* skip in xe_pt_update_ops_abort */
+			tile_mask |= BIT(tile->id);
+		}
 	}
 
-	if (xe_range_fence_insert(&vm->rftree[tile->id], rfence,
+	if (xe_range_fence_insert(&vm->rftree, rfence,
 				  &xe_range_fence_kfree_ops,
-				  pt_update_ops->start,
-				  pt_update_ops->last, fence))
+				  vops->start, vops->last, fence))
 		dma_fence_wait(fence, false);
 
-	if (ijob)
-		ifence = xe_tlb_inval_job_push(ijob, tile->migrate, fence);
-	if (mjob)
-		mfence = xe_tlb_inval_job_push(mjob, tile->migrate, fence);
+	if (vops->flags & XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP)
+		usage = DMA_RESV_USAGE_KERNEL;
 
-	if (!mjob && !ijob) {
-		dma_resv_add_fence(xe_vm_resv(vm), fence,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
-
-		list_for_each_entry(op, &vops->list, link)
-			op_commit(vops->vm, tile, pt_update_ops, op, fence, NULL);
-	} else if (ijob && !mjob) {
-		dma_resv_add_fence(xe_vm_resv(vm), ifence,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
+	if (!needs_invalidation) {
+		dma_resv_add_fence(xe_vm_resv(vm), fence, usage);
 
 		list_for_each_entry(op, &vops->list, link)
-			op_commit(vops->vm, tile, pt_update_ops, op, ifence, NULL);
+			op_commit(vops->vm, op, &fence, 1, usage, tile_mask);
 	} else {
-		dma_resv_add_fence(xe_vm_resv(vm), ifence,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
+		for (i = 0; i < XE_CPU_BIND_INVAL_JOB_COUNT; ++i) {
+			if (!update.ijobs[i])
+				continue;
+
+			ifences[i] = xe_tlb_inval_job_push(update.ijobs[i],
+							   fence);
+			xe_assert(xe, !IS_ERR_OR_NULL(ifences[i]));
 
-		dma_resv_add_fence(xe_vm_resv(vm), mfence,
-				   pt_update_ops->wait_vm_bookkeep ?
-				   DMA_RESV_USAGE_KERNEL :
-				   DMA_RESV_USAGE_BOOKKEEP);
+			dma_resv_add_fence(xe_vm_resv(vm), ifences[i], usage);
+		}
 
 		list_for_each_entry(op, &vops->list, link)
-			op_commit(vops->vm, tile, pt_update_ops, op, ifence,
-				  mfence);
+			op_commit(vops->vm, op, ifences,
+				  XE_CPU_BIND_INVAL_JOB_COUNT, usage,
+				  tile_mask);
 	}
 
-	if (pt_update_ops->needs_svm_lock)
+	if (needs_svm_lock)
 		xe_pt_svm_userptr_notifier_unlock(vm);
 
 	/*
@@ -2892,21 +2889,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	if (!(q->flags & EXEC_QUEUE_FLAG_MIGRATE))
 		xe_exec_queue_last_fence_set(q, vm, fence);
 
-	xe_tlb_inval_job_put(mjob);
-	xe_tlb_inval_job_put(ijob);
-	dma_fence_put(ifence);
-	dma_fence_put(mfence);
+	for (i = 0; i < XE_CPU_BIND_INVAL_JOB_COUNT; ++i) {
+		xe_tlb_inval_job_put(update.ijobs[i]);
+		dma_fence_put(ifences[i]);
+	}
 
 	return fence;
 
 free_rfence:
 	kfree(rfence);
 free_ijob:
-	xe_tlb_inval_job_put(mjob);
-	xe_tlb_inval_job_put(ijob);
-kill_vm_tile1:
-	if (err != -EAGAIN && err != -ENODATA && tile->id)
-		xe_vm_kill(vops->vm, false);
+	for (i = 0; i < XE_CPU_BIND_INVAL_JOB_COUNT; ++i)
+		xe_tlb_inval_job_put(update.ijobs[i]);
 
 	return ERR_PTR(err);
 }
@@ -2914,52 +2908,65 @@ ALLOW_ERROR_INJECTION(xe_pt_update_ops_run, ERRNO);
 
 /**
  * xe_pt_update_ops_fini() - Finish PT update operations
- * @tile: Tile of PT update operations
+ * @xe: xe device.
  * @vops: VMA operations
  *
  * Finish PT update operations by committing to destroy page table memory
  */
-void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops)
+void xe_pt_update_ops_fini(struct xe_device *xe, struct xe_vma_ops *vops)
 {
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&vops->pt_update_ops[tile->id];
+	struct xe_tile *tile;
+	int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_vm_pgtable_update_ops *pt_update_ops =
+			&vops->pt_update_ops[id];
 
-	xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
+		if (!pt_update_ops->num_ops)
+			continue;
+
+		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
+	}
 }
 
 /**
  * xe_pt_update_ops_abort() - Abort PT update operations
- * @tile: Tile of PT update operations
+ * @xe: xe device.
  * @vops: VMA operationa
  *
  *  Abort PT update operations by unwinding internal PT state
  */
-void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
+void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
 {
-	struct xe_vm_pgtable_update_ops *pt_update_ops =
-		&vops->pt_update_ops[tile->id];
-	int i;
+	struct xe_tile *tile;
+	int id;
 
 	lockdep_assert_held(&vops->vm->lock);
 	xe_vm_assert_held(vops->vm);
 
-	for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
-		struct xe_vm_pgtable_update_op *pt_op =
-			to_pt_op(pt_update_ops, i);
+	for_each_tile(tile, xe, id) {
+		struct xe_vm_pgtable_update_ops *pt_update_ops =
+			&vops->pt_update_ops[id];
+		int i;
 
-		if (!pt_op->vma || i >= get_current_op(pt_update_ops))
-			continue;
+		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
+			struct xe_vm_pgtable_update_op *pt_op =
+				to_pt_op(pt_update_ops, i);
 
-		if (pt_op->bind)
-			xe_pt_abort_bind(pt_op->vma, pt_op->entries,
-					 pt_op->num_entries,
-					 pt_op->rebind);
-		else
-			xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
-					   pt_op->num_entries);
+			if (!pt_op->vma || i >= get_current_op(pt_update_ops))
+				continue;
+
+			if (pt_op->bind)
+				xe_pt_abort_bind(pt_op->vma, pt_op->entries,
+						 pt_op->num_entries,
+						 pt_op->rebind);
+			else
+				xe_pt_abort_unbind(pt_op->vma, pt_op->entries,
+						   pt_op->num_entries);
+		}
 	}
 
-	xe_pt_update_ops_fini(tile, vops);
+	xe_pt_update_ops_fini(xe, vops);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 5faddb8e700c..cd78141fb81c 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -39,11 +39,11 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
 void xe_pt_clear(struct xe_device *xe, struct xe_pt *pt);
 
-int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops);
-struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
+int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops);
+struct dma_fence *xe_pt_update_ops_run(struct xe_device *xe,
 				       struct xe_vma_ops *vops);
-void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
-void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
+void xe_pt_update_ops_fini(struct xe_device *xe, struct xe_vma_ops *vops);
+void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index ccab6613385f..0d4bac22ee6c 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -120,8 +120,6 @@ struct xe_pt_job_ops {
 struct xe_vm_pgtable_update_ops {
 	/** @pt_job_ops: PT update operations dynamic allocation*/
 	struct xe_pt_job_ops *pt_job_ops;
-	/** @q: exec queue for PT operations */
-	struct xe_exec_queue *q;
 	/** @prl: embedded page reclaim list */
 	struct xe_page_reclaim_list prl;
 	/** @start: start address of ops */
@@ -134,18 +132,6 @@ struct xe_vm_pgtable_update_ops {
 	bool needs_svm_lock;
 	/** @needs_invalidation: Needs invalidation */
 	bool needs_invalidation;
-	/**
-	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
-	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
-	 * behind these operations (install PT operations into VM kernel
-	 * dma-resv slot).
-	 */
-	bool wait_vm_bookkeep;
-	/**
-	 * @wait_vm_kernel: PT operations need to wait until VM kernel dma-resv
-	 * slots are idle.
-	 */
-	bool wait_vm_kernel;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index cfd3c50bb682..1ebef9af4bd2 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -73,8 +73,9 @@ static void job_free(struct xe_sched_job *job)
 	struct xe_exec_queue *q = job->q;
 	bool is_migration = xe_sched_job_is_migration(q);
 
-	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
-			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
+	kmem_cache_free(job->is_pt_job || xe_exec_queue_is_parallel(job->q) ||
+			is_migration ? xe_sched_job_parallel_slab :
+			xe_sched_job_slab, job);
 }
 
 static struct xe_device *job_to_xe(struct xe_sched_job *job)
@@ -127,10 +128,12 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	xe_assert(xe, batch_addr ||
 		  q->flags & (EXEC_QUEUE_FLAG_VM | EXEC_QUEUE_FLAG_MIGRATE));
 
-	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
+	job = job_alloc(!batch_addr || xe_exec_queue_is_parallel(q) ||
+			is_migration);
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
+	job->is_pt_job = !batch_addr;
 	job->q = q;
 	job->sample_timestamp = U64_MAX;
 	kref_init(&job->refcount);
@@ -143,7 +146,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 
 	if (!batch_addr) {
 		job->fence = dma_fence_get_stub();
-		job->is_pt_job = true;
 	} else {
 		for (i = 0; i < q->width; ++i) {
 			struct dma_fence *fence = xe_lrc_alloc_seqno_fence();
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 5e1824c36c74..9f527ac6df3e 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -14,7 +14,7 @@ struct dma_fence;
 struct dma_fence_chain;
 
 struct xe_exec_queue;
-struct xe_migrate_pt_update_ops;
+struct xe_cpu_bind_pt_update_ops;
 struct xe_pt_job_ops;
 struct xe_tile;
 struct xe_vm;
@@ -25,12 +25,11 @@ struct xe_vm;
 struct xe_pt_update_args {
 	/** @vm: VM which is being bound */
 	struct xe_vm *vm;
-	/** @tile: Tile which page tables belong to */
-	struct xe_tile *tile;
-	/** @ops: Migrate PT update ops */
-	const struct xe_migrate_pt_update_ops *ops;
+	/** @ops: CPU bind PT update ops */
+	const struct xe_cpu_bind_pt_update_ops *ops;
+#define XE_PT_UPDATE_JOB_OPS_COUNT	2
 	/** @pt_job_ops: PT job ops state */
-	struct xe_pt_job_ops *pt_job_ops;
+	struct xe_pt_job_ops *pt_job_ops[XE_PT_UPDATE_JOB_OPS_COUNT];
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
index 81f560068d3c..7378cfe6e855 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_assert.h"
+#include "xe_cpu_bind.h"
 #include "xe_dep_job_types.h"
 #include "xe_dep_scheduler.h"
 #include "xe_exec_queue.h"
@@ -12,7 +13,6 @@
 #include "xe_page_reclaim.h"
 #include "xe_tlb_inval.h"
 #include "xe_tlb_inval_job.h"
-#include "xe_migrate.h"
 #include "xe_pm.h"
 #include "xe_vm.h"
 
@@ -218,7 +218,6 @@ int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job)
 /**
  * xe_tlb_inval_job_push() - TLB invalidation job push
  * @job: TLB invalidation job to push
- * @m: The migration object being used
  * @fence: Dependency for TLB invalidation job
  *
  * Pushes a TLB invalidation job for execution, using @fence as a dependency.
@@ -230,11 +229,11 @@ int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job)
  * Return: Job's finished fence on success, cannot fail
  */
 struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
-					struct xe_migrate *m,
 					struct dma_fence *fence)
 {
 	struct xe_tlb_inval_fence *ifence =
 		container_of(job->fence, typeof(*ifence), base);
+	struct xe_cpu_bind *cpu_bind = gt_to_xe(job->q->gt)->cpu_bind;
 
 	if (!dma_fence_is_signaled(fence)) {
 		void *ptr;
@@ -258,11 +257,11 @@ struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
 	job->fence_armed = true;
 
 	/*
-	 * We need the migration lock to protect the job's seqno and the spsc
-	 * queue, only taken on migration queue, user queues protected dma-resv
+	 * We need the cpu_bind lock to protect the job's seqno and the spsc
+	 * queue, only taken on cpu_bind queue, user queues protected dma-resv
 	 * VM lock.
 	 */
-	xe_migrate_job_lock(m, job->q);
+	xe_cpu_bind_job_lock(cpu_bind, job->q);
 
 	/* Creation ref pairs with put in xe_tlb_inval_job_destroy */
 	xe_tlb_inval_fence_init(job->tlb_inval, ifence, false);
@@ -281,7 +280,7 @@ struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
 					       &job->dep.drm.s_fence->finished,
 					       job->idx);
 
-	xe_migrate_job_unlock(m, job->q);
+	xe_cpu_bind_job_unlock(cpu_bind, job->q);
 
 	/*
 	 * Not using job->fence, as it has its own dma-fence context, which does
diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
index 2a4478f529e6..97e032ea21c3 100644
--- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
+++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
@@ -11,7 +11,6 @@
 struct dma_fence;
 struct xe_dep_scheduler;
 struct xe_exec_queue;
-struct xe_migrate;
 struct xe_page_reclaim_list;
 struct xe_tlb_inval;
 struct xe_tlb_inval_job;
@@ -28,7 +27,6 @@ void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
 int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
 
 struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
-					struct xe_migrate *m,
 					struct dma_fence *fence);
 
 void xe_tlb_inval_job_get(struct xe_tlb_inval_job *job);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 433a0a681556..fbfc42afef8b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -24,6 +24,7 @@
 #include "regs/xe_gtt_defs.h"
 #include "xe_assert.h"
 #include "xe_bo.h"
+#include "xe_cpu_bind.h"
 #include "xe_device.h"
 #include "xe_drm_client.h"
 #include "xe_exec_queue.h"
@@ -795,8 +796,6 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	struct xe_vma *vma, *next;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
-	struct xe_tile *tile;
-	u8 id;
 	int err;
 
 	lockdep_assert_held(&vm->lock);
@@ -804,12 +803,9 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	    list_empty(&vm->rebind_list))
 		return 0;
 
-	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	for_each_tile(tile, vm->xe, id) {
-		vops.pt_update_ops[id].wait_vm_bookkeep = true;
-		vops.pt_update_ops[id].q =
-			xe_migrate_bind_queue(tile->migrate);
-	}
+	xe_vma_ops_init(&vops, vm, xe_cpu_bind_queue(vm->xe->cpu_bind),
+			NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
@@ -854,21 +850,16 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	struct dma_fence *fence = NULL;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
-	struct xe_tile *tile;
-	u8 id;
 	int err;
 
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 
-	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
-	for_each_tile(tile, vm->xe, id) {
-		vops.pt_update_ops[id].wait_vm_bookkeep = true;
-		vops.pt_update_ops[tile->id].q =
-			xe_migrate_bind_queue(tile->migrate);
-	}
+	xe_vma_ops_init(&vops, vm, xe_cpu_bind_queue(vm->xe->cpu_bind),
+			NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
+		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
 	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
 	if (err)
@@ -944,8 +935,6 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	struct dma_fence *fence = NULL;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
-	struct xe_tile *tile;
-	u8 id;
 	int err;
 
 	lockdep_assert_held(&range->lock);
@@ -954,13 +943,10 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
-	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT;
-	for_each_tile(tile, vm->xe, id) {
-		vops.pt_update_ops[id].wait_vm_bookkeep = true;
-		vops.pt_update_ops[tile->id].q =
-			xe_migrate_bind_queue(tile->migrate);
-	}
+	xe_vma_ops_init(&vops, vm, xe_cpu_bind_queue(vm->xe->cpu_bind),
+			NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
+		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
 	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
 	if (err)
@@ -1027,8 +1013,6 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	struct dma_fence *fence = NULL;
 	struct xe_vma_ops vops;
 	struct xe_vma_op *op, *next_op;
-	struct xe_tile *tile;
-	u8 id;
 	int err;
 
 	lockdep_assert_held(&range->lock);
@@ -1039,12 +1023,9 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	if (!range->tile_present)
 		return dma_fence_get_stub();
 
-	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
-	for_each_tile(tile, vm->xe, id) {
-		vops.pt_update_ops[id].wait_vm_bookkeep = true;
-		vops.pt_update_ops[tile->id].q =
-			xe_migrate_bind_queue(tile->migrate);
-	}
+	xe_vma_ops_init(&vops, vm, xe_cpu_bind_queue(vm->xe->cpu_bind),
+			NULL, 0);
+	vops.flags |= XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
 	err = xe_vm_ops_add_range_unbind(&vops, range);
 	if (err)
@@ -1715,9 +1696,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 	init_rwsem(&vm->exec_queues.lock);
 	xe_vm_init_prove_locking(xe, vm);
-
-	for_each_tile(tile, xe, id)
-		xe_range_fence_tree_init(&vm->rftree[id]);
+	xe_range_fence_tree_init(&vm->rftree);
 
 	vm->pt_ops = &xelp_pt_ops;
 
@@ -1859,8 +1838,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	xe_svm_fini(vm);
 err_no_resv:
 	mutex_destroy(&vm->snap_mutex);
-	for_each_tile(tile, xe, id)
-		xe_range_fence_tree_fini(&vm->rftree[id]);
+	xe_range_fence_tree_fini(&vm->rftree);
 	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
 	if (vm->xef)
 		xe_file_put(vm->xef);
@@ -1916,10 +1894,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 {
 	LIST_HEAD(contested);
 	struct xe_device *xe = vm->xe;
-	struct xe_tile *tile;
 	struct xe_vma *vma, *next_vma;
 	struct drm_gpuva *gpuva, *next;
-	u8 id;
 
 	xe_assert(xe, !vm->preempt.num_exec_queues);
 
@@ -2011,8 +1987,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	xe_vm_clear_fault_entries(vm);
 
-	for_each_tile(tile, xe, id)
-		xe_range_fence_tree_fini(&vm->rftree[id]);
+	xe_range_fence_tree_fini(&vm->rftree);
 
 	xe_vm_put(vm);
 }
@@ -3509,23 +3484,16 @@ static void trace_xe_vm_ops_execute(struct xe_vma_ops *vops)
 
 static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 {
-	struct xe_exec_queue *q = vops->q;
 	struct xe_tile *tile;
 	int number_tiles = 0;
 	u8 id;
 
-	for_each_tile(tile, vm->xe, id) {
+	for_each_tile(tile, vm->xe, id)
 		if (vops->pt_update_ops[id].num_ops)
 			++number_tiles;
 
-		if (vops->pt_update_ops[id].q)
-			continue;
-
-		if (q)
-			vops->pt_update_ops[id].q = q;
-		else
-			vops->pt_update_ops[id].q = vm->q;
-	}
+	if (!vops->q)
+		vops->q = vm->q;
 
 	return number_tiles;
 }
@@ -3533,22 +3501,17 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 static struct dma_fence *ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops)
 {
-	struct xe_tile *tile;
+	struct xe_device *xe = vm->xe;
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	int number_tiles = 0, current_fence = 0, n_fence = 0, err, i;
-	u8 id;
+	int current_fence = 0, n_fence = 1, err, i;
 
-	number_tiles = vm_ops_setup_tile_args(vm, vops);
-	if (number_tiles == 0)
+	if (!vm_ops_setup_tile_args(vm, vops))
 		return ERR_PTR(-ENODATA);
 
-	for_each_tile(tile, vm->xe, id)
-		++n_fence;
-
 	if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)) {
-		for_each_tlb_inval(vops->pt_update_ops[0].q, i)
+		for_each_tlb_inval(vops->q, i)
 			++n_fence;
 	}
 
@@ -3564,69 +3527,39 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 		goto err_out;
 	}
 
-	for_each_tile(tile, vm->xe, id) {
-		if (!vops->pt_update_ops[id].num_ops)
-			continue;
-
-		err = xe_pt_update_ops_prepare(tile, vops);
-		if (err) {
-			fence = ERR_PTR(err);
-			goto err_out;
-		}
+	err = xe_pt_update_ops_prepare(xe, vops);
+	if (err) {
+		fence = ERR_PTR(err);
+		goto err_out;
 	}
 
 	trace_xe_vm_ops_execute(vops);
 
-	for_each_tile(tile, vm->xe, id) {
-		struct xe_exec_queue *q = vops->pt_update_ops[tile->id].q;
-
-		fence = NULL;
-		if (!vops->pt_update_ops[id].num_ops)
-			goto collect_fences;
-
-		fence = xe_pt_update_ops_run(tile, vops);
-		if (IS_ERR(fence))
-			goto err_out;
-
-collect_fences:
-		fences[current_fence++] = fence ?: dma_fence_get_stub();
-		if (vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)
-			continue;
-
-		xe_migrate_job_lock(tile->migrate, q);
-		for_each_tlb_inval(q, i) {
-			if (i >= (tile->id + 1) * XE_MAX_GT_PER_TILE ||
-			    i < tile->id * XE_MAX_GT_PER_TILE)
-				continue;
+	fence = xe_pt_update_ops_run(xe, vops);
+	if (IS_ERR(fence))
+		goto err_out;
+	fences[current_fence++] = fence;
 
-			fences[current_fence++] = fence ?
-				xe_exec_queue_tlb_inval_last_fence_get(q, vm, i) :
-				dma_fence_get_stub();
-		}
-		xe_migrate_job_unlock(tile->migrate, q);
+	if (!(vops->flags & XE_VMA_OPS_FLAG_SKIP_TLB_WAIT)) {
+		xe_cpu_bind_job_lock(xe->cpu_bind, vops->q);
+		for_each_tlb_inval(vops->q, i)
+			fences[current_fence++] =
+				xe_exec_queue_tlb_inval_last_fence_get(vops->q,
+								       vm, i);
+		xe_cpu_bind_job_unlock(xe->cpu_bind, vops->q);
 	}
 
-	xe_assert(vm->xe, current_fence == n_fence);
+	xe_assert(xe, current_fence == n_fence);
 	dma_fence_array_init(cf, n_fence, fences, dma_fence_context_alloc(1),
 			     1);
 	fence = &cf->base;
 
-	for_each_tile(tile, vm->xe, id) {
-		if (!vops->pt_update_ops[id].num_ops)
-			continue;
-
-		xe_pt_update_ops_fini(tile, vops);
-	}
+	xe_pt_update_ops_fini(xe, vops);
 
 	return fence;
 
 err_out:
-	for_each_tile(tile, vm->xe, id) {
-		if (!vops->pt_update_ops[id].num_ops)
-			continue;
-
-		xe_pt_update_ops_abort(tile, vops);
-	}
+	xe_pt_update_ops_abort(xe, vops);
 	while (current_fence)
 		dma_fence_put(fences[--current_fence]);
 	kfree(fences);
@@ -3938,6 +3871,8 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
 	vops->syncs = syncs;
 	vops->num_syncs = num_syncs;
 	vops->flags = 0;
+	vops->start = ~0x0ull;
+	vops->last = 0x0ull;
 }
 
 static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c91cb13fc4f1..fb9305124679 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -317,7 +317,7 @@ struct xe_vm {
 	 * @rftree: range fence tree to track updates to page table structure.
 	 * Used to implement conflict tracking between independent bind engines.
 	 */
-	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
+	struct xe_range_fence_tree rftree;
 
 	const struct xe_pt_ops *pt_ops;
 
@@ -557,6 +557,10 @@ struct xe_vma_ops {
 	u32 num_syncs;
 	/** @pt_update_ops: page table update operations */
 	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
+	/** @start: start address of ops */
+	u64 start;
+	/** @last: last address of ops */
+	u64 last;
 	/** @flag: signify the properties within xe_vma_ops*/
 #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH	BIT(0)
 #define XE_VMA_OPS_FLAG_MADVISE			BIT(1)
@@ -566,6 +570,10 @@ struct xe_vma_ops {
 #define XE_VMA_OPS_FLAG_MODIFIES_GPUVA		BIT(5)
 #define XE_VMA_OPS_FLAG_DOWNGRADE_LOCK		BIT(6)
 #define XE_VMA_OPS_FLAG_HAS_SVM_VALID_RANGE	BIT(7)
+#define XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP	BIT(8)
+#define XE_VMA_OPS_FLAG_WAIT_VM_KERNEL		BIT(9)
+#define XE_VMA_OPS_FLAG_NEEDS_INVALIDATION	BIT(10)
+#define XE_VMA_OPS_FLAG_NEEDS_SVM_LOCK		BIT(11)
 	u32 flags;
 #ifdef TEST_VM_OPS_ERROR
 	/** @inject_error: inject error to test error handling */
-- 
2.34.1

