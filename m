Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873C2EB64DC
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 17:32:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EDD10E532;
	Thu, 15 Jun 2023 17:32:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0810E534
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 17:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686850331; x=1718386331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/bgD2cVRsPay6UVdxEfcldQGJZ8E1RNGb8VfV3l0n0=;
 b=FYTcRpKxBj2zfNitHcfZs12oTWir0LUdJbdfRbpK4SCqN7XxEBvSXxA1
 G+H/e3B9HZI0YnJuU/FDNIbKKrCwbibF5SaOv9MRDrRgR1Ov3e+vZFmNF
 EymLOWK/NWyqRYq8Qz9aR9Gr2PxLJeh4WqL157V55upBlxQffkU2KNbYV
 pIhBxtIok+ONeS5T0Igy17vML+pDVROTysJkXGD5oowlyoOPZwHZytdpU
 g3ecq2JADpflh7tV9oFM5kntLlo4y6V4nw8lTdTYecOjSY9WAqf/TAIcp
 akVq8eFMw8h3ev9g51u1ufIQGFGJ7Np3/T9U8AgdN/kbIzQldCJRZFzsV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="348695156"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="348695156"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742321904"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="742321904"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 10:30:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 15 Jun 2023 10:30:11 -0700
Message-Id: <20230615173014.258703-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230615173014.258703-1-matthew.brost@intel.com>
References: <20230615173014.258703-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 5/8] drm/xe: Long running job update
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

For long running (LR) jobs with the DRM scheduler we must return NULL in
run_job which results in signaling the job's finished fence immediately.
This prevents LR jobs from creating infinite dma-fences.

Signaling job's finished fence immediately breaks flow controlling ring
with the DRM scheduler. To work around this, the ring is flow controlled
and written in the exec IOCTL. Signaling job's finished fence
immediately also breaks the TDR which is used in reset / cleanup entity
paths so write a new path for LR entities.

v2: Better commit, white space, remove rmb(), better comment next to
emit_job()
v3 (Thomas): Change LR reference counting, fix working in commit

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
 drivers/gpu/drm/xe/xe_engine.h           |  4 +
 drivers/gpu/drm/xe/xe_exec.c             |  8 ++
 drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 96 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_trace.h            |  5 ++
 6 files changed, 134 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index b3036c4a8ec3..eb5f66f07da8 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -18,6 +18,7 @@
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
+#include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -679,6 +680,37 @@ static void engine_kill_compute(struct xe_engine *e)
 	up_write(&e->vm->lock);
 }
 
+/**
+ * xe_engine_is_lr() - Whether an engine is long-running
+ * @e: The engine
+ *
+ * Return: True if the engine is long-running, false otherwise.
+ */
+bool xe_engine_is_lr(struct xe_engine *e)
+{
+	return e->vm && xe_vm_no_dma_fences(e->vm) &&
+		!(e->flags & ENGINE_FLAG_VM);
+}
+
+static s32 xe_engine_num_job_inflight(struct xe_engine *e)
+{
+	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
+}
+
+/**
+ * xe_engine_ring_full() - Whether an engine's ring is full
+ * @e: The engine
+ *
+ * Return: True if the engine's ring is full, false otherwise.
+ */
+bool xe_engine_ring_full(struct xe_engine *e)
+{
+	struct xe_lrc *lrc = e->lrc;
+	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
+
+	return xe_engine_num_job_inflight(e) >= max_job;
+}
+
 /**
  * xe_engine_is_idle() - Whether an engine is idle.
  * @engine: The engine
diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
index a49cf2ab405e..2e60f6d90226 100644
--- a/drivers/gpu/drm/xe/xe_engine.h
+++ b/drivers/gpu/drm/xe/xe_engine.h
@@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
 	return engine->width > 1;
 }
 
+bool xe_engine_is_lr(struct xe_engine *e);
+
+bool xe_engine_ring_full(struct xe_engine *e);
+
 bool xe_engine_is_idle(struct xe_engine *engine);
 
 void xe_engine_kill(struct xe_engine *e);
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index e44076ee2e11..9e9523939de8 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_macros.h"
+#include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
@@ -300,6 +301,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_engine_end;
 	}
 
+	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
+		err = -EWOULDBLOCK;
+		goto err_engine_end;
+	}
+
 	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
 				  addresses : &args->address);
 	if (IS_ERR(job)) {
@@ -386,6 +392,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_sync_entry_signal(&syncs[i], job,
 				     &job->drm.s_fence->finished);
 
+	if (xe_engine_is_lr(engine))
+		engine->ring_ops->emit_job(job);
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
index cbfb13026ec1..5d83132034a6 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
@@ -31,6 +31,8 @@ struct xe_guc_engine {
 	 */
 #define MAX_STATIC_MSG_TYPE	3
 	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
+	/** @lr_tdr: long running TDR worker */
+	struct work_struct lr_tdr;
 	/** @fini_async: do final fini async from this worker */
 	struct work_struct fini_async;
 	/** @resume_time: time of last resume */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a7a0d9f806bd..86c445903560 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -482,6 +482,14 @@ static void register_engine(struct xe_engine *e)
 		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
 	}
 
+	/*
+	 * We must keep a reference for LR engines if engine is registered with
+	 * the GuC as jobs signal immediately and can't destroy an engine if the
+	 * GuC has a reference to it.
+	 */
+	if (xe_engine_is_lr(e))
+		xe_engine_get(e);
+
 	set_engine_registered(e);
 	trace_xe_engine_register(e);
 	if (xe_engine_is_parallel(e))
@@ -644,6 +652,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_engine *e = job->engine;
+	bool lr = xe_engine_is_lr(e);
 
 	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
 		  !engine_banned(e) && !engine_suspended(e));
@@ -653,14 +662,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
 		if (!engine_registered(e))
 			register_engine(e);
-		e->ring_ops->emit_job(job);
+		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
+			e->ring_ops->emit_job(job);
 		submit_engine(e);
 	}
 
-	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
+	if (lr) {
+		xe_sched_job_set_error(job, -EOPNOTSUPP);
+		return NULL;
+	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
 		return job->fence;
-	else
+	} else {
 		return dma_fence_get(job->fence);
+	}
 }
 
 static void guc_engine_free_job(struct drm_sched_job *drm_job)
@@ -764,6 +778,55 @@ static void simple_error_capture(struct xe_engine *e)
 }
 #endif
 
+static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
+{
+	struct xe_guc *guc = engine_to_guc(e);
+
+	if (xe_engine_is_lr(e))
+		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
+	else
+		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+}
+
+static void xe_guc_engine_lr_cleanup(struct work_struct *w)
+{
+	struct xe_guc_engine *ge =
+		container_of(w, struct xe_guc_engine, lr_tdr);
+	struct xe_engine *e = ge->engine;
+	struct drm_gpu_scheduler *sched = &ge->sched;
+
+	XE_WARN_ON(!xe_engine_is_lr(e));
+	trace_xe_engine_lr_cleanup(e);
+
+	/* Kill the run_job / process_msg entry points */
+	drm_sched_run_wq_stop(sched);
+
+	/* Engine state now stable, disable scheduling / deregister if needed */
+	if (engine_registered(e)) {
+		struct xe_guc *guc = engine_to_guc(e);
+		int ret;
+
+		set_engine_banned(e);
+		disable_scheduling_deregister(guc, e);
+
+		/*
+		 * Must wait for scheduling to be disabled before signalling
+		 * any fences, if GT broken the GT reset code should signal us.
+		 */
+		ret = wait_event_timeout(guc->ct.wq,
+					 !engine_pending_disable(e) ||
+					 guc_read_stopped(guc), HZ * 5);
+		if (!ret) {
+			XE_WARN_ON("Schedule disable failed to respond");
+			drm_sched_run_wq_start(sched);
+			xe_gt_reset_async(e->gt);
+			return;
+		}
+	}
+
+	drm_sched_run_wq_start(sched);
+}
+
 static enum drm_gpu_sched_stat
 guc_engine_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -815,7 +878,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 			err = -EIO;
 		set_engine_banned(e);
 		xe_engine_get(e);
-		disable_scheduling_deregister(engine_to_guc(e), e);
+		disable_scheduling_deregister(guc, e);
 
 		/*
 		 * Must wait for scheduling to be disabled before signalling
@@ -848,7 +911,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	list_add(&drm_job->list, &sched->pending_list);
 	drm_sched_run_wq_start(sched);
-	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+	xe_guc_engine_trigger_cleanup(e);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
 	spin_lock(&sched->job_list_lock);
@@ -872,6 +935,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
 
 	trace_xe_engine_destroy(e);
 
+	if (xe_engine_is_lr(e))
+		cancel_work_sync(&ge->lr_tdr);
 	if (e->flags & ENGINE_FLAG_PERSISTENT)
 		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
 	release_guc_id(guc, e);
@@ -889,7 +954,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
 	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
 
 	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
-	queue_work(system_unbound_wq, &e->guc->fini_async);
+	queue_work(system_wq, &e->guc->fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
 	if (kernel) {
@@ -1078,6 +1143,9 @@ static int guc_engine_init(struct xe_engine *e)
 	if (err)
 		goto err_sched;
 
+	if (xe_engine_is_lr(e))
+		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
+
 	mutex_lock(&guc->submission_state.lock);
 
 	err = alloc_guc_id(guc, e);
@@ -1129,7 +1197,7 @@ static void guc_engine_kill(struct xe_engine *e)
 {
 	trace_xe_engine_kill(e);
 	set_engine_killed(e);
-	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+	xe_guc_engine_trigger_cleanup(e);
 }
 
 static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
@@ -1280,10 +1348,11 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
 	drm_sched_run_wq_stop(sched);
 
 	/* Clean up lost G2H + reset engine state */
-	if (engine_destroyed(e) && engine_registered(e)) {
-		if (engine_banned(e))
+	if (engine_registered(e)) {
+		if ((engine_banned(e) && engine_destroyed(e)) ||
+		    xe_engine_is_lr(e))
 			xe_engine_put(e);
-		else
+		else if (engine_destroyed(e))
 			__guc_engine_fini(guc, e);
 	}
 	if (e->guc->suspend_pending) {
@@ -1503,7 +1572,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	trace_xe_engine_deregister_done(e);
 
 	clear_engine_registered(e);
-	if (engine_banned(e))
+
+	if (engine_banned(e) || xe_engine_is_lr(e))
 		xe_engine_put(e);
 	else
 		__guc_engine_fini(guc, e);
@@ -1540,7 +1610,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 */
 	set_engine_reset(e);
 	if (!engine_banned(e))
-		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+		xe_guc_engine_trigger_cleanup(e);
 
 	return 0;
 }
@@ -1567,7 +1637,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	/* Treat the same as engine reset */
 	set_engine_reset(e);
 	if (!engine_banned(e))
-		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+		xe_guc_engine_trigger_cleanup(e);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 2f8eb7ebe9a7..02861c26e145 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
 	     TP_ARGS(e)
 );
 
+DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
+	     TP_PROTO(struct xe_engine *e),
+	     TP_ARGS(e)
+);
+
 DECLARE_EVENT_CLASS(xe_sched_job,
 		    TP_PROTO(struct xe_sched_job *job),
 		    TP_ARGS(job),
-- 
2.34.1

