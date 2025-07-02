Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56498C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 23:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C70C10E7B7;
	Wed,  2 Jul 2025 23:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsBLdQsJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2002A10E7B5
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 23:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751499644; x=1783035644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UuTLMuJ85LeCjSEltVcpLF1FAx5DeR+167BMhNI38wM=;
 b=UsBLdQsJRNVUhz6J5OhhsGp7UtfC/QXgqlaY1kTIRwJ4rcAUaK/PJumT
 4VHyrHYnomiU/BenJ9ch+acsZHiY3EDGcxEXpHgVuDoEzU1yFWaEgjHpn
 2K39lT4pZNicFePjL4zi4mZqRWwmuIg0tWOMsFKtfeBy4uRzbPNwXdJUw
 QtbvaSsdKDKedoRJQbmLe/Rl+kHcycepR+SZLtWxSgGOShXRRvJ9xxUzn
 qOW5zCPI9+83g5tNcDMImD5BCsgCMSQqBz9gtieiBPuAMKwY2kVwicbC+
 eiIu1CXcd5hEUtSUkgE2feXCgWnvN3nuitCPb5MAGLqy0zlvBFf6PiYho Q==;
X-CSE-ConnectionGUID: 9wp99gTISRG6WrfcYyq8ow==
X-CSE-MsgGUID: oTEbXHZETU+FoLhz1AFszw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57489477"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="57489477"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:42 -0700
X-CSE-ConnectionGUID: QSGKJ2lzQOWbAtzPlf2qKA==
X-CSE-MsgGUID: vf+FxkXoQmOkOVgOUunL9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="153624541"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 16:40:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 7/9] drm/xe: Add GT TLB invalidation jobs
Date: Wed,  2 Jul 2025 16:42:20 -0700
Message-Id: <20250702234222.3278264-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702234222.3278264-1-matthew.brost@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
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

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c | 271 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h |  34 +++
 3 files changed, 306 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 0edcfc770c0d..5aad44a3b5fd 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -55,6 +55,7 @@ xe-y += xe_bb.o \
 	xe_gt_sysfs.o \
 	xe_gt_throttle.o \
 	xe_gt_tlb_invalidation.o \
+	xe_gt_tlb_inval_job.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
new file mode 100644
index 000000000000..428d20f16ec2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
@@ -0,0 +1,271 @@
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
+ * Return: GT TLB invalidation job object or ERR_PTR
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
+	xe_exec_queue_get(q);
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
+	xe_pm_runtime_get_noresume(gt_to_xe(job->gt));
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
+ * xe_gt_tlb_inval_job_push being called with a real (non-signaled) fence.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int xe_gt_tlb_inval_job_alloc_dep(struct xe_gt_tlb_inval_job *job)
+{
+	xe_assert(gt_to_xe(job->gt), !xa_load(&job->dep.drm.dependencies, 0));
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
+ * finished fence, which the caller is responsible for releasing, and retutn it
+ * to the caller. This function is safe to be called in the path of reclaim.
+ *
+ * Return: Job's finished fence
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
+	 * We need the migration lock to protect the seqnos (job and
+	 * invalidation fence) and the spsc queue, only taken on migration
+	 * queue, user queues protected dma-resv VM lock.
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
+	if (job && !IS_ERR(job))
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
-- 
2.34.1

