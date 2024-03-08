Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8955CC54E61
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3516A11309F;
	Fri,  8 Mar 2024 05:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcEmlvmh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBE7112495
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874475; x=1741410475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bGqRNVPHh7LOO4bbb+tspC1PBDRnMC8u7J9veNVIsRY=;
 b=dcEmlvmhHbWpG7VccNLVjjQB1SdIknYoQo+QO1qAS4T3zu2SeB+rZvoi
 ycuKHSneUjYbJZmfH6nNAMpxqxTaGfPJIa9KWc47Me6wRD024wBMtuxhB
 sHl3CSPrPRksasTRkJxO5ZT3L928lELxPizU6QMb61CvDsJZm/XsCr6eg
 dtgHo+k04Lj+rOCDk3l7m6CtPanBl4FSOEVa74S498DqDWyA4DB8Hu7jd
 Nl+xOv8rhKrjVGT+6uLKG/Grv1V77/g48S9/I0UdBUoTPm1pbGHj6Jrni
 Ra4Vy8EK+3uu+gbNUt3I28ULXHQ/jBswSkduqvobNjYQieJlx4G+ey1XW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761985"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761985"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10403058"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 30/30] drm/xe: Add PT exec queues
Date: Thu,  7 Mar 2024 21:08:06 -0800
Message-Id: <20240308050806.577176-31-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

Add PT exec queues which are used to implement VM bind / unbind
operations. PT exec queues use a different DRM scheduler backend
(compared GuC / execlist submission backends) which use the CPU to
update page tables once all dependecies for a job are resolved.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile              |   1 +
 drivers/gpu/drm/xe/xe_exec.c             |   2 +-
 drivers/gpu/drm/xe/xe_exec_queue.c       | 120 ++++-----------
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  20 +--
 drivers/gpu/drm/xe/xe_guc_submit.c       |  52 ++-----
 drivers/gpu/drm/xe/xe_migrate.c          |   6 +-
 drivers/gpu/drm/xe/xe_pt_exec_queue.c    | 180 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pt_exec_queue.h    |  14 ++
 drivers/gpu/drm/xe/xe_sched_job.c        |  31 ++--
 drivers/gpu/drm/xe/xe_trace.h            |  11 +-
 drivers/gpu/drm/xe/xe_vm.c               |  58 +++-----
 drivers/gpu/drm/xe/xe_vm_types.h         |   2 +-
 12 files changed, 288 insertions(+), 209 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.c
 create mode 100644 drivers/gpu/drm/xe/xe_pt_exec_queue.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3c3e67885559..bf43a3690e13 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -118,6 +118,7 @@ xe-y += xe_bb.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
 	xe_pt.o \
+	xe_pt_exec_queue.o \
 	xe_pt_walk.o \
 	xe_query.o \
 	xe_range_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7f91b4b13634..851d7a261078 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -170,7 +170,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, !q))
 		return -ENOENT;
 
-	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
+	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_PT))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 6a83bc57826a..149b6ffcda6e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -19,6 +19,7 @@
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
@@ -43,6 +44,8 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	struct xe_gt *gt = hwe->gt;
 	int err;
 
+	xe_assert(xe, !(flags & EXEC_QUEUE_FLAG_PT));
+
 	/* only kernel queues can be permanent */
 	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
 
@@ -53,6 +56,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	kref_init(&q->refcount);
 	q->flags = flags;
 	q->hwe = hwe;
+	q->xe = xe;
 	q->gt = gt;
 	q->class = hwe->class;
 	q->width = width;
@@ -61,7 +65,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
 	q->ring_ops = gt->ring_ops[hwe->class];
 	q->ops = gt->exec_queue_ops;
 	INIT_LIST_HEAD(&q->compute.link);
-	INIT_LIST_HEAD(&q->multi_gt_link);
 
 	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
 	q->sched_props.preempt_timeout_us =
@@ -106,7 +109,7 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
 
 static int __xe_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_device *xe = q->xe;
 	int i, err;
 
 	for (i = 0; i < q->width; ++i) {
@@ -127,7 +130,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 	 * can perform GuC CT actions when needed. Caller is expected to have
 	 * already grabbed the rpm ref outside any sensitive locks.
 	 */
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !q->vm)
 		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
 
 	return 0;
@@ -198,15 +201,8 @@ struct xe_exec_queue *xe_exec_queue_create_class(struct xe_device *xe, struct xe
 void xe_exec_queue_destroy(struct kref *ref)
 {
 	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
-	struct xe_exec_queue *eq, *next;
 
 	xe_exec_queue_last_fence_put_unlocked(q);
-	if (!(q->flags & EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD)) {
-		list_for_each_entry_safe(eq, next, &q->multi_gt_list,
-					 multi_gt_link)
-			xe_exec_queue_put(eq);
-	}
-
 	q->ops->fini(q);
 }
 
@@ -216,7 +212,7 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
 
 	for (i = 0; i < q->width; ++i)
 		xe_lrc_finish(q->lrc + i);
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
+	if (q->gt && !(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !q->vm)
 		xe_device_mem_access_put(gt_to_xe(q->gt));
 	__xe_exec_queue_free(q);
 }
@@ -454,35 +450,6 @@ find_hw_engine(struct xe_device *xe,
 			       eci.engine_instance, true);
 }
 
-static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
-					struct drm_xe_engine_class_instance *eci,
-					u16 width, u16 num_placements)
-{
-	struct xe_hw_engine *hwe;
-	enum xe_hw_engine_id id;
-	u32 logical_mask = 0;
-
-	if (XE_IOCTL_DBG(xe, width != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, num_placements != 1))
-		return 0;
-	if (XE_IOCTL_DBG(xe, eci[0].engine_instance != 0))
-		return 0;
-
-	eci[0].engine_class = DRM_XE_ENGINE_CLASS_COPY;
-
-	for_each_hw_engine(hwe, gt, id) {
-		if (xe_hw_engine_is_reserved(hwe))
-			continue;
-
-		if (hwe->class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
-			logical_mask |= BIT(hwe->logical_instance);
-	}
-
-	return logical_mask;
-}
-
 static u32 calc_validate_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 				      struct drm_xe_engine_class_instance *eci,
 				      u16 width, u16 num_placements)
@@ -544,7 +511,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 	struct drm_xe_engine_class_instance __user *user_eci =
 		u64_to_user_ptr(args->instances);
 	struct xe_hw_engine *hwe;
-	struct xe_vm *vm, *migrate_vm;
+	struct xe_vm *vm;
 	struct xe_gt *gt;
 	struct xe_exec_queue *q = NULL;
 	u32 logical_mask;
@@ -570,48 +537,15 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		return -EINVAL;
 
 	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
-		for_each_gt(gt, xe, id) {
-			struct xe_exec_queue *new;
-			u32 flags;
-
-			if (xe_gt_is_media_type(gt))
-				continue;
-
-			eci[0].gt_id = gt->info.id;
-			logical_mask = bind_exec_queue_logical_mask(xe, gt, eci,
-								    args->width,
-								    args->num_placements);
-			if (XE_IOCTL_DBG(xe, !logical_mask))
-				return -EINVAL;
+		if (XE_IOCTL_DBG(xe, args->extensions))
+			return -EINVAL;
 
-			hwe = find_hw_engine(xe, eci[0]);
-			if (XE_IOCTL_DBG(xe, !hwe))
-				return -EINVAL;
-
-			/* The migration vm doesn't hold rpm ref */
-			xe_device_mem_access_get(xe);
-
-			flags = EXEC_QUEUE_FLAG_VM | (id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
-
-			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
-			new = xe_exec_queue_create(xe, migrate_vm, logical_mask,
-						   args->width, hwe, flags,
-						   args->extensions);
-
-			xe_device_mem_access_put(xe); /* now held by engine */
-
-			xe_vm_put(migrate_vm);
-			if (IS_ERR(new)) {
-				err = PTR_ERR(new);
-				if (q)
-					goto put_exec_queue;
-				return err;
-			}
-			if (id == 0)
-				q = new;
-			else
-				list_add_tail(&new->multi_gt_list,
-					      &q->multi_gt_link);
+		xe_device_mem_access_get(xe);
+		q = xe_pt_exec_queue_create(xe);
+		xe_device_mem_access_put(xe); /* now held by exec queue */
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			return err;
 		}
 	} else {
 		gt = xe_device_get_gt(xe, eci[0].gt_id);
@@ -714,8 +648,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
  */
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 {
-	return q->vm && xe_vm_in_lr_mode(q->vm) &&
-		!(q->flags & EXEC_QUEUE_FLAG_VM);
+	return q->vm && xe_vm_in_lr_mode(q->vm);
 }
 
 static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
@@ -753,6 +686,12 @@ bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
  */
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 {
+	if (q->flags & EXEC_QUEUE_FLAG_PT) {
+		struct dma_fence *fence = q->last_fence ?: dma_fence_get_stub();
+
+		return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
+	}
+
 	if (xe_exec_queue_is_parallel(q)) {
 		int i;
 
@@ -771,16 +710,9 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
 
 void xe_exec_queue_kill(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *eq = q, *next;
-
-	list_for_each_entry_safe(eq, next, &eq->multi_gt_list,
-				 multi_gt_link) {
-		q->ops->kill(eq);
-		xe_vm_remove_compute_exec_queue(q->vm, eq);
-	}
-
 	q->ops->kill(q);
-	xe_vm_remove_compute_exec_queue(q->vm, q);
+	if (q->vm)
+		xe_vm_remove_compute_exec_queue(q->vm, q);
 }
 
 int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
@@ -812,7 +744,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	if (q->flags & EXEC_QUEUE_FLAG_VM)
+	if (q->flags & EXEC_QUEUE_FLAG_PT)
 		lockdep_assert_held(&vm->lock);
 	else
 		xe_vm_assert_held(vm);
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 62b3d9d1d7cd..3a2dcaed561f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -19,6 +19,7 @@ struct xe_execlist_exec_queue;
 struct xe_gt;
 struct xe_guc_exec_queue;
 struct xe_hw_engine;
+struct xe_pt_exec_queue;
 struct xe_vm;
 
 enum xe_exec_queue_priority {
@@ -38,6 +39,8 @@ enum xe_exec_queue_priority {
  * a kernel object.
  */
 struct xe_exec_queue {
+	/** @xe: Xe device */
+	struct xe_device *xe;
 	/** @gt: graphics tile this exec queue can submit to */
 	struct xe_gt *gt;
 	/**
@@ -78,12 +81,10 @@ struct xe_exec_queue {
 #define EXEC_QUEUE_FLAG_PERMANENT		BIT(2)
 /* queue keeps running pending jobs after destroy ioctl */
 #define EXEC_QUEUE_FLAG_PERSISTENT		BIT(3)
-/* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
-#define EXEC_QUEUE_FLAG_VM			BIT(4)
-/* child of VM queue for multi-tile VM jobs */
-#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
+/* for PT jobs. Caller needs to hold rpm ref when creating queue with this flag */
+#define EXEC_QUEUE_FLAG_PT			BIT(4)
 /* kernel exec_queue only, set priority to highest level */
-#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(6)
+#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(5)
 
 	/**
 	 * @flags: flags for this exec queue, should statically setup aside from ban
@@ -91,18 +92,13 @@ struct xe_exec_queue {
 	 */
 	unsigned long flags;
 
-	union {
-		/** @multi_gt_list: list head for VM bind engines if multi-GT */
-		struct list_head multi_gt_list;
-		/** @multi_gt_link: link for VM bind engines if multi-GT */
-		struct list_head multi_gt_link;
-	};
-
 	union {
 		/** @execlist: execlist backend specific state for exec queue */
 		struct xe_execlist_exec_queue *execlist;
 		/** @guc: GuC backend specific state for exec queue */
 		struct xe_guc_exec_queue *guc;
+		/** @pt: PT backend specific state for exec queue */
+		struct xe_pt_exec_queue *pt;
 	};
 
 	/**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c5a88a039afd..83dc799589db 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -34,9 +34,7 @@
 #include "xe_lrc.h"
 #include "xe_macros.h"
 #include "xe_map.h"
-#include "xe_migrate.h"
 #include "xe_mocs.h"
-#include "xe_pt.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -727,24 +725,6 @@ static bool is_pt_job(struct xe_sched_job *job)
 	return test_bit(JOB_FLAG_PT, &job->fence->flags);
 }
 
-static void cleanup_pt_job(struct xe_device *xe, struct xe_sched_job *job)
-{
-	xe_pt_update_ops_free(job->pt_update[0].pt_op,
-			      job->pt_update[0].num_ops);
-	xe_bo_put_commit(xe, &job->pt_update[0].deferred);
-	kfree(job->pt_update[0].pt_op);
-}
-
-static void run_pt_job(struct xe_device *xe, struct xe_sched_job *job)
-{
-	__xe_migrate_update_pgtables_cpu(job->pt_update[0].vm,
-					 job->pt_update[0].tile,
-					 job->pt_update[0].ops,
-					 job->pt_update[0].pt_op,
-					 job->pt_update[0].num_ops);
-	cleanup_pt_job(xe, job);
-}
-
 static struct dma_fence *
 guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 {
@@ -754,28 +734,23 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(guc);
 	bool lr = xe_exec_queue_is_lr(q);
 
+	xe_assert(xe, !is_pt_job(job));
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PT));
 	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		  exec_queue_banned(q) || exec_queue_suspended(q));
 
 	trace_xe_sched_job_run(job);
 
 	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
-		if (is_pt_job(job)) {
-			run_pt_job(xe, job);
-		} else {
-			if (!exec_queue_registered(q))
-				register_engine(q);
-			if (!lr)	/* LR jobs are emitted in the exec IOCTL */
-				q->ring_ops->emit_job(job);
-			submit_exec_queue(q);
-		}
-	} else if (is_pt_job(job)) {
-		cleanup_pt_job(xe, job);
+		if (!exec_queue_registered(q))
+			register_engine(q);
+		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
+			q->ring_ops->emit_job(job);
+		submit_exec_queue(q);
 	}
 
-	if (lr || is_pt_job(job)) {
-		if (lr)
-			xe_sched_job_set_error(job, -EOPNOTSUPP);
+	if (lr) {
+		xe_sched_job_set_error(job, -EOPNOTSUPP);
 		return NULL;
 	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
 		return job->fence;
@@ -962,7 +937,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int err = -ETIME;
 	int i = 0;
 
-	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
+	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PT));
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -1471,11 +1446,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	trace_xe_exec_queue_stop(q);
 
 	/*
-	 * Ban any engine (aside from kernel and engines used for VM ops) with a
-	 * started but not complete job or if a job has gone through a GT reset
-	 * more than twice.
+	 * Ban any engine (aside from kernel) with a started but not complete
+	 * job or if a job has gone through a GT reset more than twice.
 	 */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
 		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 
 		if (job) {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 00a3c87cc93c..82b63bdb9c47 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -28,6 +28,7 @@
 #include "xe_map.h"
 #include "xe_mocs.h"
 #include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_res_cursor.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
@@ -377,10 +378,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		if (!hwe || !logical_mask)
 			return ERR_PTR(-EINVAL);
 
-		m->bind_q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
-						 EXEC_QUEUE_FLAG_KERNEL |
-						 EXEC_QUEUE_FLAG_PERMANENT |
-						 EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
+		m->bind_q = xe_pt_exec_queue_create(xe);
 		if (IS_ERR(m->bind_q)) {
 			xe_vm_close_and_put(vm);
 			return ERR_CAST(m->bind_q);
diff --git a/drivers/gpu/drm/xe/xe_pt_exec_queue.c b/drivers/gpu/drm/xe/xe_pt_exec_queue.c
new file mode 100644
index 000000000000..2a6ae6267594
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_exec_queue.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <drm/gpu_scheduler.h>
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_migrate.h"
+#include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
+#include "xe_sched_job.h"
+#include "xe_trace.h"
+
+/**
+ * struct xe_pt_exec_queue - PT specific state for an xe_exec_queue
+ */
+struct xe_pt_exec_queue {
+	/** @q: Backpointer to parent xe_exec_queue */
+	struct xe_exec_queue *q;
+	/** @sched: GPU scheduler for this xe_exec_queue */
+	struct drm_gpu_scheduler sched;
+	/** @entity: Scheduler entity for this xe_exec_queue */
+	struct drm_sched_entity entity;
+	/** @fini_async: do final fini async from this worker */
+	struct work_struct fini_async;
+};
+
+static bool is_pt_job(struct xe_sched_job *job)
+{
+	return test_bit(JOB_FLAG_PT, &job->fence->flags);
+}
+
+static void cleanup_pt_job(struct xe_device *xe, struct xe_sched_job *job)
+{
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
+static struct dma_fence *
+pt_exec_queue_run_job(struct drm_sched_job *drm_job)
+{
+	struct xe_sched_job *job = to_xe_sched_job(drm_job);
+	struct xe_exec_queue *q = job->q;
+	struct xe_device *xe = q->xe;
+
+	xe_assert(xe, is_pt_job(job));
+	xe_assert(xe, q->flags & EXEC_QUEUE_FLAG_PT);
+
+	trace_xe_sched_job_run(job);
+	run_pt_job(xe, job);
+
+	return NULL;
+}
+
+static void pt_exec_queue_free_job(struct drm_sched_job *drm_job)
+{
+	struct xe_sched_job *job = to_xe_sched_job(drm_job);
+
+	trace_xe_sched_job_free(job);
+	xe_sched_job_put(job);
+}
+
+static const struct drm_sched_backend_ops drm_sched_ops = {
+	.run_job = pt_exec_queue_run_job,
+	.free_job = pt_exec_queue_free_job,
+};
+
+static void pt_exec_queue_kill(struct xe_exec_queue *q)
+{
+}
+
+static void __pt_exec_queue_fini_async(struct work_struct *w)
+{
+	struct xe_pt_exec_queue *pe =
+		container_of(w, struct xe_pt_exec_queue, fini_async);
+	struct xe_exec_queue *q = pe->q;
+
+	trace_xe_exec_queue_destroy(q);
+
+	drm_sched_entity_fini(&pe->entity);
+	drm_sched_fini(&pe->sched);
+
+	kfree(pe);
+
+	xe_device_mem_access_put(q->xe);
+	xe_exec_queue_fini(q);
+}
+
+static void pt_exec_queue_fini(struct xe_exec_queue *q)
+{
+	INIT_WORK(&q->pt->fini_async, __pt_exec_queue_fini_async);
+	queue_work(system_wq, &q->pt->fini_async);
+}
+
+static bool pt_exec_queue_reset_status(struct xe_exec_queue *q)
+{
+	return false;
+}
+
+static const struct xe_exec_queue_ops pt_exec_queue_ops = {
+	.kill = pt_exec_queue_kill,
+	.fini = pt_exec_queue_fini,
+	.reset_status = pt_exec_queue_reset_status,
+};
+
+struct xe_exec_queue *xe_pt_exec_queue_create(struct xe_device *xe)
+{
+	struct drm_gpu_scheduler *sched;
+	struct xe_exec_queue *q;
+	struct xe_pt_exec_queue *pe;
+	int err;
+
+	q = kzalloc(sizeof(*q), GFP_KERNEL);
+	if (!q)
+		return ERR_PTR(-ENOMEM);
+
+	kref_init(&q->refcount);
+	q->flags = EXEC_QUEUE_FLAG_PT;
+	q->ops = &pt_exec_queue_ops;
+
+	pe = kzalloc(sizeof(*pe), GFP_KERNEL);
+	if (!pe) {
+		err = -ENOMEM;
+		goto err_free;
+	}
+
+	err = drm_sched_init(&pe->sched, &drm_sched_ops, system_wq, 1, 64, 64,
+			     MAX_SCHEDULE_TIMEOUT, system_wq, NULL,
+			     q->name, xe->drm.dev);
+	if (err)
+		goto err_free;
+
+	sched = &pe->sched;
+	err = drm_sched_entity_init(&pe->entity, 0, &sched, 1, NULL);
+	if (err)
+		goto err_sched;
+
+	q->xe = xe;
+	q->pt = pe;
+	pe->q = q;
+	q->entity = &pe->entity;
+
+	xe_exec_queue_assign_name(q, 0);
+	trace_xe_exec_queue_create(q);
+
+	/*
+	 * Normally the user vm holds an rpm ref to keep the device
+	 * awake, and the context holds a ref for the vm, however for
+	 * some engines we use the kernels migrate vm underneath which offers no
+	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
+	 * can perform GuC CT actions when needed. Caller is expected to have
+	 * already grabbed the rpm ref outside any sensitive locks.
+	 */
+	drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
+
+	return q;
+
+err_sched:
+	drm_sched_fini(&pe->sched);
+err_free:
+	kfree(pe);
+	kfree(q);
+
+	return ERR_PTR(err);
+}
diff --git a/drivers/gpu/drm/xe/xe_pt_exec_queue.h b/drivers/gpu/drm/xe/xe_pt_exec_queue.h
new file mode 100644
index 000000000000..a4d16b845418
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pt_exec_queue.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_PT_EXEC_QUEUE_H_
+#define _XE_PT_EXEC_QUEUE_H_
+
+struct xe_device;
+struct xe_exec_queue;
+
+struct xe_exec_queue *xe_pt_exec_queue_create(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index 373033d9ebd6..fc24e675f922 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -65,18 +65,21 @@ bool xe_sched_job_is_migration(struct xe_exec_queue *q)
 	return q->vm && (q->vm->flags & XE_VM_FLAG_MIGRATION);
 }
 
-static void job_free(struct xe_sched_job *job)
+static bool parallel_slab(struct xe_exec_queue *q)
 {
-	struct xe_exec_queue *q = job->q;
-	bool is_migration = xe_sched_job_is_migration(q);
+	return !q->width || xe_exec_queue_is_parallel(q) ||
+		xe_sched_job_is_migration(q);
+}
 
-	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
-			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
+static void job_free(struct xe_sched_job *job)
+{
+	kmem_cache_free(parallel_slab(job->q) ? xe_sched_job_parallel_slab :
+			xe_sched_job_slab, job);
 }
 
 static struct xe_device *job_to_xe(struct xe_sched_job *job)
 {
-	return gt_to_xe(job->q->gt);
+	return job->q->xe;
 }
 
 struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
@@ -89,17 +92,19 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	int i, j;
 	u32 width;
 
-	/* only a kernel context can submit a vm-less job */
-	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
+	/* only a kernel and pt exec queue can submit a vm-less job */
+	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL) &&
+		   !(q->flags & EXEC_QUEUE_FLAG_PT));
 
-	/* Migration and kernel engines have their own locking */
-	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
+	/* Kernel and pt exec queues have their own locking */
+	if (!(q->flags & EXEC_QUEUE_FLAG_KERNEL) &&
+	    !(q->flags & EXEC_QUEUE_FLAG_PT)) {
 		lockdep_assert_held(&q->vm->lock);
 		if (!xe_vm_in_lr_mode(q->vm))
 			xe_vm_assert_held(q->vm);
 	}
 
-	job = job_alloc(xe_exec_queue_is_parallel(q) || is_migration);
+	job = job_alloc(parallel_slab(q));
 	if (!job)
 		return ERR_PTR(-ENOMEM);
 
@@ -112,6 +117,8 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 		goto err_free;
 
 	if (!batch_addr) {
+		xe_assert(q->xe, q->flags & EXEC_QUEUE_FLAG_PT);
+
 		job->fence = dma_fence_allocate_private_stub(ktime_get());
 		if (!job->fence) {
 			err = -ENOMEM;
@@ -293,7 +300,7 @@ struct xe_sched_job_snapshot *
 xe_sched_job_snapshot_capture(struct xe_sched_job *job)
 {
 	struct xe_exec_queue *q = job->q;
-	struct xe_device *xe = q->gt->tile->xe;
+	struct xe_device *xe = job_to_xe(job);
 	struct xe_sched_job_snapshot *snapshot;
 	size_t len = sizeof(*snapshot) + (sizeof(u64) * q->width);
 	u16 i;
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index b7a0e6c1918d..c4704c5f3c72 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -147,8 +147,9 @@ DECLARE_EVENT_CLASS(xe_exec_queue,
 			   __entry->logical_mask = q->logical_mask;
 			   __entry->gt_id = q->gt->info.id;
 			   __entry->width = q->width;
-			   __entry->guc_id = q->guc->id;
-			   __entry->guc_state = atomic_read(&q->guc->state);
+			   __entry->guc_id = q->guc ? q->guc->id : 0;
+			   __entry->guc_state = q->guc ?
+			   atomic_read(&q->guc->state) : 0;
 			   __entry->flags = q->flags;
 			   ),
 
@@ -264,9 +265,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
 
 		    TP_fast_assign(
 			   __entry->seqno = xe_sched_job_seqno(job);
-			   __entry->guc_id = job->q->guc->id;
-			   __entry->guc_state =
-			   atomic_read(&job->q->guc->state);
+			   __entry->guc_id = job->q->guc ? job->q->guc->id : 0;
+			   __entry->guc_state = job->q->guc ?
+			   atomic_read(&job->q->guc->state) : 0;
 			   __entry->flags = job->q->flags;
 			   __entry->error = job->fence->error;
 			   __entry->fence = (unsigned long)job->fence;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 906734b423c5..8ba037e7ce5c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,7 @@
 #include "xe_pm.h"
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
+#include "xe_pt_exec_queue.h"
 #include "xe_res_cursor.h"
 #include "xe_sync.h"
 #include "xe_trace.h"
@@ -1485,32 +1486,20 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			continue;
 
 		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
+		number_tiles++;
 	}
 	dma_resv_unlock(xe_vm_resv(vm));
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
-		for_each_tile(tile, xe, id) {
-			struct xe_gt *gt = tile->primary_gt;
-			struct xe_vm *migrate_vm;
-			struct xe_exec_queue *q;
-			u32 create_flags = EXEC_QUEUE_FLAG_VM;
-
-			if (!vm->pt_root[id])
-				continue;
+		struct xe_exec_queue *q;
 
-			migrate_vm = xe_migrate_get_vm(tile->migrate);
-			q = xe_exec_queue_create_class(xe, gt, migrate_vm,
-						       XE_ENGINE_CLASS_COPY,
-						       create_flags);
-			xe_vm_put(migrate_vm);
-			if (IS_ERR(q)) {
-				err = PTR_ERR(q);
-				goto err_close;
-			}
-			vm->q[id] = q;
-			number_tiles++;
+		q = xe_pt_exec_queue_create(xe);
+		if (IS_ERR(q)) {
+			err = PTR_ERR(q);
+			goto err_close;
 		}
+		vm->q = q;
 	}
 
 	if (number_tiles > 1)
@@ -1565,19 +1554,13 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
-	down_write(&vm->lock);
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id])
-			xe_exec_queue_last_fence_put(vm->q[id], vm);
-	}
-	up_write(&vm->lock);
+	if (vm->q) {
+		down_write(&vm->lock);
+		xe_exec_queue_last_fence_put(vm->q, vm);
+		up_write(&vm->lock);
 
-	for_each_tile(tile, xe, id) {
-		if (vm->q[id]) {
-			xe_exec_queue_kill(vm->q[id]);
-			xe_exec_queue_put(vm->q[id]);
-			vm->q[id] = NULL;
-		}
+		xe_exec_queue_kill(vm->q);
+		xe_exec_queue_put(vm->q);
 	}
 
 	down_write(&vm->lock);
@@ -1709,7 +1692,7 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 static struct xe_exec_queue *
 to_wait_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	return q ? q : vm->q[0];
+	return q ? q : vm->q;
 }
 
 static struct xe_user_fence *
@@ -2516,7 +2499,6 @@ static void trace_xe_vm_ops_execute(struct xe_vma_ops *vops)
 
 static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 {
-	struct xe_exec_queue *q = vops->q;
 	struct xe_tile *tile;
 	int number_tiles = 0;
 	u8 id;
@@ -2528,13 +2510,7 @@ static int vm_ops_setup_tile_args(struct xe_vm *vm, struct xe_vma_ops *vops)
 		if (vops->pt_update_ops[id].q)
 			continue;
 
-		if (q) {
-			vops->pt_update_ops[id].q = q;
-			if (vm->pt_root[id] && !list_empty(&q->multi_gt_list))
-				q = list_next_entry(q, multi_gt_list);
-		} else {
-			vops->pt_update_ops[id].q = vm->q[id];
-		}
+		vops->pt_update_ops[id].q = vops->q ?: vm->q;
 	}
 
 	return number_tiles;
@@ -2899,7 +2875,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto free_objs;
 		}
 
-		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_VM))) {
+		if (XE_IOCTL_DBG(xe, !(q->flags & EXEC_QUEUE_FLAG_PT))) {
 			err = -EINVAL;
 			goto put_exec_queue;
 		}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index a069989fd82c..d0a08e927db7 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -234,7 +234,7 @@ struct xe_vm {
 	struct xe_device *xe;
 
 	/* exec queue used for (un)binding vma's */
-	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
+	struct xe_exec_queue *q;
 
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
-- 
2.34.1

