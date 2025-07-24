Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44A3C87FCA
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 19:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6537610E2A2;
	Thu, 24 Jul 2025 19:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LuhZQr5A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6141C10E2A2
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 19:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753384232; x=1784920232;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RIHx6hRSZBb3/HV6kwvIbaV3PaDdXoJR2TwWh7xKqKs=;
 b=LuhZQr5AlaoW1usZf0JA3emOU3PLDZILNphriTQ3PDRqDijd1pk0bDny
 Cc5b0iVynzbmWVTIQuymBh69wq8bYgmxY2MKvHgOYq8LWItTANE4g9FG3
 JSGnN1EzQX5fEYfmjSK4H1e2sIawLzMk/0CmuOrPpthctpjTIEBNEHlNm
 Tqlkbmh6y69bQ45ryGFS3CnJP1/jZEemxrU8+whEoRf16IxhwDc2PzB01
 MRDiBhUdb4S7ElP+0LHyG20ln8vvMnGVv9fRde8pdzHzWi3VzhVxppE7j
 jjUYqKPcjk04EBpC91yVEosK1ex06xrqw8r5F5PTFlNnvYAwDdjbfIrlI A==;
X-CSE-ConnectionGUID: OqisTYbvSf6CteiY5zW6qw==
X-CSE-MsgGUID: 5FkifczRR5OH/MdPtO9vrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65976729"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="65976729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:31 -0700
X-CSE-ConnectionGUID: V7Aium7ER467o5Rm8595Ig==
X-CSE-MsgGUID: hQ5EBDYrSd+55eNjAEWARw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="160387670"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 12:10:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 5/7] drm/xe: Add GT TLB invalidation jobs
Date: Thu, 24 Jul 2025 12:12:14 -0700
Message-Id: <20250724191216.4076566-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724191216.4076566-1-matthew.brost@intel.com>
References: <20250724191216.4076566-1-matthew.brost@intel.com>
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

Add GT TLB invalidation jobs which issue GT TLB invalidations. Built on
top of Xe generic dependency scheduler.

v2:
 - Fix checkpatch
v3:
 - Fix kernel doc in xe_gt_tlb_inval_job_alloc_dep, xe_gt_tlb_inval_job_push
 - Use IS_ERR_OR_NULL in xe_gt_tlb_inval_job_put
 - Squash migrate lock / unlock helpers into this patch (Stuart)

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c | 274 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h |  34 +++
 drivers/gpu/drm/xe/xe_migrate.c          |  36 +++
 drivers/gpu/drm/xe/xe_migrate.h          |   4 +
 5 files changed, 349 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index caefcc74c889..76f980475b2c 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -62,6 +62,7 @@ xe-y += xe_bb.o \
 	xe_gt_sysfs.o \
 	xe_gt_throttle.o \
 	xe_gt_tlb_invalidation.o \
+	xe_gt_tlb_inval_job.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
new file mode 100644
index 000000000000..e9255be26467
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_dep_job_types.h"
+#include "xe_dep_scheduler.h"
+#include "xe_exec_queue.h"
+#include "xe_gt.h"
+#include "xe_gt_tlb_invalidation.h"
+#include "xe_gt_tlb_inval_job.h"
+#include "xe_migrate.h"
+#include "xe_pm.h"
+
+/** struct xe_gt_tlb_inval_job - GT TLB invalidation job */
+struct xe_gt_tlb_inval_job {
+	/** @dep: base generic dependency Xe job */
+	struct xe_dep_job dep;
+	/** @gt: GT to invalidate */
+	struct xe_gt *gt;
+	/** @q: exec queue issuing the invalidate */
+	struct xe_exec_queue *q;
+	/** @refcount: ref count of this job */
+	struct kref refcount;
+	/**
+	 * @fence: dma fence to indicate completion. 1 way relationship - job
+	 * can safely reference fence, fence cannot safely reference job.
+	 */
+	struct dma_fence *fence;
+	/** @start: Start address to invalidate */
+	u64 start;
+	/** @end: End address to invalidate */
+	u64 end;
+	/** @asid: Address space ID to invalidate */
+	u32 asid;
+	/** @fence_armed: Fence has been armed */
+	bool fence_armed;
+};
+
+static struct dma_fence *xe_gt_tlb_inval_job_run(struct xe_dep_job *dep_job)
+{
+	struct xe_gt_tlb_inval_job *job =
+		container_of(dep_job, typeof(*job), dep);
+	struct xe_gt_tlb_invalidation_fence *ifence =
+		container_of(job->fence, typeof(*ifence), base);
+
+	xe_gt_tlb_invalidation_range(job->gt, ifence, job->start,
+				     job->end, job->asid);
+
+	return job->fence;
+}
+
+static void xe_gt_tlb_inval_job_free(struct xe_dep_job *dep_job)
+{
+	struct xe_gt_tlb_inval_job *job =
+		container_of(dep_job, typeof(*job), dep);
+
+	/* Pairs with get in xe_gt_tlb_inval_job_push */
+	xe_gt_tlb_inval_job_put(job);
+}
+
+static const struct xe_dep_job_ops dep_job_ops = {
+	.run_job = xe_gt_tlb_inval_job_run,
+	.free_job = xe_gt_tlb_inval_job_free,
+};
+
+static int xe_gt_tlb_inval_context(struct xe_gt *gt)
+{
+	return xe_gt_is_media_type(gt) ? XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT :
+		XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT;
+}
+
+/**
+ * xe_gt_tlb_inval_job_create() - GT TLB invalidation job create
+ * @gt: GT to invalidate
+ * @q: exec queue issuing the invalidate
+ * @start: Start address to invalidate
+ * @end: End address to invalidate
+ * @asid: Address space ID to invalidate
+ *
+ * Create a GT TLB invalidation job and initialize internal fields. The caller is
+ * responsible for releasing the creation reference.
+ *
+ * Return: GT TLB invalidation job object on success, ERR_PTR failure
+ */
+struct xe_gt_tlb_inval_job *xe_gt_tlb_inval_job_create(struct xe_exec_queue *q,
+						       struct xe_gt *gt,
+						       u64 start, u64 end,
+						       u32 asid)
+{
+	struct xe_gt_tlb_inval_job *job;
+	struct xe_dep_scheduler *dep_scheduler =
+		q->tlb_inval[xe_gt_tlb_inval_context(gt)].dep_scheduler;
+	struct drm_sched_entity *entity =
+		xe_dep_scheduler_entity(dep_scheduler);
+	struct xe_gt_tlb_invalidation_fence *ifence;
+	int err;
+
+	job = kmalloc(sizeof(*job), GFP_KERNEL);
+	if (!job)
+		return ERR_PTR(-ENOMEM);
+
+	job->q = q;
+	job->gt = gt;
+	job->start = start;
+	job->end = end;
+	job->asid = asid;
+	job->fence_armed = false;
+	job->dep.ops = &dep_job_ops;
+	kref_init(&job->refcount);
+	xe_exec_queue_get(q);	/* Pairs with put in xe_gt_tlb_inval_job_destroy */
+
+	ifence = kmalloc(sizeof(*ifence), GFP_KERNEL);
+	if (!ifence) {
+		err = -ENOMEM;
+		goto err_job;
+	}
+	job->fence = &ifence->base;
+
+	err = drm_sched_job_init(&job->dep.drm, entity, 1, NULL,
+				 q->xef ? q->xef->drm->client_id : 0);
+	if (err)
+		goto err_fence;
+
+	/* Pairs with put in xe_gt_tlb_inval_job_destroy */
+	xe_pm_runtime_get_noresume(gt_to_xe(job->gt));
+
+	return job;
+
+err_fence:
+	kfree(ifence);
+err_job:
+	xe_exec_queue_put(q);
+	kfree(job);
+
+	return ERR_PTR(err);
+}
+
+static void xe_gt_tlb_inval_job_destroy(struct kref *ref)
+{
+	struct xe_gt_tlb_inval_job *job = container_of(ref, typeof(*job),
+						       refcount);
+	struct xe_gt_tlb_invalidation_fence *ifence =
+		container_of(job->fence, typeof(*ifence), base);
+	struct xe_device *xe = gt_to_xe(job->gt);
+	struct xe_exec_queue *q = job->q;
+
+	if (!job->fence_armed)
+		kfree(ifence);
+	else
+		/* Ref from xe_gt_tlb_invalidation_fence_init */
+		dma_fence_put(job->fence);
+
+	drm_sched_job_cleanup(&job->dep.drm);
+	kfree(job);
+	xe_exec_queue_put(q);	/* Pairs with get from xe_gt_tlb_inval_job_create */
+	xe_pm_runtime_put(xe);	/* Pairs with get from xe_gt_tlb_inval_job_create */
+}
+
+/**
+ * xe_gt_tlb_inval_alloc_dep() - GT TLB invalidation job alloc dependency
+ * @job: GT TLB invalidation job to alloc dependency for
+ *
+ * Allocate storage for a dependency in the GT TLB invalidation fence. This
+ * function should be called at most once per job and must be paired with
+ * xe_gt_tlb_inval_job_push being called with a real fence.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int xe_gt_tlb_inval_job_alloc_dep(struct xe_gt_tlb_inval_job *job)
+{
+	xe_assert(gt_to_xe(job->gt), !xa_load(&job->dep.drm.dependencies, 0));
+	might_alloc(GFP_KERNEL);
+
+	return drm_sched_job_add_dependency(&job->dep.drm,
+					    dma_fence_get_stub());
+}
+
+/**
+ * xe_gt_tlb_inval_job_push() - GT TLB invalidation job push
+ * @job: GT TLB invalidation job to push
+ * @m: The migration object being used
+ * @fence: Dependency for GT TLB invalidation job
+ *
+ * Pushes a GT TLB invalidation job for execution, using @fence as a dependency.
+ * Storage for @fence must be preallocated with xe_gt_tlb_inval_job_alloc_dep
+ * prior to this call if @fence is not signaled. Takes a reference to the job’s
+ * finished fence, which the caller is responsible for releasing, and return it
+ * to the caller. This function is safe to be called in the path of reclaim.
+ *
+ * Return: Job's finished fence on success, cannot fail
+ */
+struct dma_fence *xe_gt_tlb_inval_job_push(struct xe_gt_tlb_inval_job *job,
+					   struct xe_migrate *m,
+					   struct dma_fence *fence)
+{
+	struct xe_gt_tlb_invalidation_fence *ifence =
+		container_of(job->fence, typeof(*ifence), base);
+
+	if (!dma_fence_is_signaled(fence)) {
+		void *ptr;
+
+		/*
+		 * Can be in path of reclaim, hence the preallocation of fence
+		 * storage in xe_gt_tlb_inval_job_alloc_dep. Verify caller did
+		 * this correctly.
+		 */
+		xe_assert(gt_to_xe(job->gt),
+			  xa_load(&job->dep.drm.dependencies, 0) ==
+			  dma_fence_get_stub());
+
+		dma_fence_get(fence);	/* ref released once dependency processed by scheduler */
+		ptr = xa_store(&job->dep.drm.dependencies, 0, fence,
+			       GFP_ATOMIC);
+		xe_assert(gt_to_xe(job->gt), !xa_is_err(ptr));
+	}
+
+	xe_gt_tlb_inval_job_get(job);	/* Pairs with put in free_job */
+	job->fence_armed = true;
+
+	/*
+	 * We need the migration lock to protect the job's seqno and the spsc
+	 * queue, only taken on migration queue, user queues protected dma-resv
+	 * VM lock.
+	 */
+	xe_migrate_job_lock(m, job->q);
+
+	/* Creation ref pairs with put in xe_gt_tlb_inval_job_destroy */
+	xe_gt_tlb_invalidation_fence_init(job->gt, ifence, false);
+	dma_fence_get(job->fence);	/* Pairs with put in DRM scheduler */
+
+	drm_sched_job_arm(&job->dep.drm);
+	/*
+	 * caller ref, get must be done before job push as it could immediately
+	 * signal and free.
+	 */
+	dma_fence_get(&job->dep.drm.s_fence->finished);
+	drm_sched_entity_push_job(&job->dep.drm);
+
+	xe_migrate_job_unlock(m, job->q);
+
+	/*
+	 * Not using job->fence, as it has its own dma-fence context, which does
+	 * not allow GT TLB invalidation fences on the same queue, GT tuple to
+	 * be squashed in dma-resv/DRM scheduler. Instead, we use the DRM scheduler
+	 * context and job's finished fence, which enables squashing.
+	 */
+	return &job->dep.drm.s_fence->finished;
+}
+
+/**
+ * xe_gt_tlb_inval_job_get() - Get a reference to GT TLB invalidation job
+ * @job: GT TLB invalidation job object
+ *
+ * Increment the GT TLB invalidation job's reference count
+ */
+void xe_gt_tlb_inval_job_get(struct xe_gt_tlb_inval_job *job)
+{
+	kref_get(&job->refcount);
+}
+
+/**
+ * xe_gt_tlb_inval_job_put() - Put a reference to GT TLB invalidation job
+ * @job: GT TLB invalidation job object
+ *
+ * Decrement the GT TLB invalidation job's reference count, call
+ * xe_gt_tlb_inval_job_destroy when reference count == 0. Skips decrement if
+ * input @job is NULL or IS_ERR.
+ */
+void xe_gt_tlb_inval_job_put(struct xe_gt_tlb_inval_job *job)
+{
+	if (!IS_ERR_OR_NULL(job))
+		kref_put(&job->refcount, xe_gt_tlb_inval_job_destroy);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
new file mode 100644
index 000000000000..883896194a34
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GT_TLB_INVAL_JOB_H_
+#define _XE_GT_TLB_INVAL_JOB_H_
+
+#include <linux/types.h>
+
+struct dma_fence;
+struct drm_sched_job;
+struct kref;
+struct xe_exec_queue;
+struct xe_gt;
+struct xe_gt_tlb_inval_job;
+struct xe_migrate;
+
+struct xe_gt_tlb_inval_job *xe_gt_tlb_inval_job_create(struct xe_exec_queue *q,
+						       struct xe_gt *gt,
+						       u64 start, u64 end,
+						       u32 asid);
+
+int xe_gt_tlb_inval_job_alloc_dep(struct xe_gt_tlb_inval_job *job);
+
+struct dma_fence *xe_gt_tlb_inval_job_push(struct xe_gt_tlb_inval_job *job,
+					   struct xe_migrate *m,
+					   struct dma_fence *fence);
+
+void xe_gt_tlb_inval_job_get(struct xe_gt_tlb_inval_job *job);
+
+void xe_gt_tlb_inval_job_put(struct xe_gt_tlb_inval_job *job);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ed04c2b368dc..90065d7d29ff 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -2077,6 +2077,42 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
 	return IS_ERR(fence) ? PTR_ERR(fence) : 0;
 }
 
+/**
+ * xe_migrate_job_lock() - Lock migrate job lock
+ * @m: The migration context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Lock the migrate job lock if the queue is a migration queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	bool is_migrate = q == m->q;
+
+	if (is_migrate)
+		mutex_lock(&m->job_mutex);
+	else
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+}
+
+/**
+ * xe_migrate_job_unlock() - Unlock migrate job lock
+ * @m: The migration context.
+ * @q: Queue associated with the operation which requires a lock
+ *
+ * Unlock the migrate job lock if the queue is a migration queue, otherwise
+ * assert the VM's dma-resv is held (user queue's have own locking).
+ */
+void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q)
+{
+	bool is_migrate = q == m->q;
+
+	if (is_migrate)
+		mutex_unlock(&m->job_mutex);
+	else
+		xe_vm_assert_held(q->vm);	/* User queues VM's should be locked */
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index f4dac270dba3..5af2f5aa645f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -141,4 +141,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 			   struct xe_migrate_pt_update *pt_update);
 
 void xe_migrate_wait(struct xe_migrate *m);
+
+void xe_migrate_job_lock(struct xe_migrate *m, struct xe_exec_queue *q);
+void xe_migrate_job_unlock(struct xe_migrate *m, struct xe_exec_queue *q);
+
 #endif
-- 
2.34.1

