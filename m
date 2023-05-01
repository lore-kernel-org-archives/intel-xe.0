Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAAFC7EE2C
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3204C10E356;
	Mon,  1 May 2023 07:51:16 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A02A10E30E
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927472; x=1714463472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tg5ZdksoGECm4PE8fZuUP0KysA7rBu523+tJemuG7f4=;
 b=Qf/EPrDL+ie71G7U+52YAm1a7dyFx0mxV2KUIy9TuLLSb0K7HzYtcr1Y
 OB4Mrr6AlPlVw3PAVdQoWuS+c+Ulv8vVs/9tdiK9HCOQjyDz4+qXNsc6s
 IlFsQCxyFeg3GJaE1SKEiRzLdGGv/5TAVQBzyJIOkqqYv4bGbg0XQ5UXj
 vDY8pga5jJTDKf8j9rb5n5/s0Vql0vkQEXwX6nCP6QdoeY97G7aFe4CvR
 pPAx4b9/GzXX6iWc7yi7HhUQc2kygZZ17vPjktF7MU40c32Zwnns2xALa
 Y42gLeim78EwCzwNICcnEp0O/Ayt1YNq8iM04hz7AJ4buscA/RCEKME3n A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910707"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910707"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095197"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095197"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:50:49 -0700
Message-Id: <20230501075114.3108352-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 05/30] drm/xe: Long running job update
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

Flow control + write ring in exec, return NULL in run_job, siganl
xe_hw_fence immediately, and override TDR for LR jobs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
 drivers/gpu/drm/xe/xe_engine.h           |  4 +
 drivers/gpu/drm/xe/xe_exec.c             |  8 ++
 drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 95 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_trace.h            |  5 ++
 6 files changed, 137 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 094ec17d3004..d1e84d7adbd4 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -18,6 +18,7 @@
 #include "xe_macros.h"
 #include "xe_migrate.h"
 #include "xe_pm.h"
+#include "xe_ring_ops_types.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -673,6 +674,37 @@ static void engine_kill_compute(struct xe_engine *e)
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
index ea869f2452ef..44ea9bcd0066 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -13,6 +13,7 @@
 #include "xe_device.h"
 #include "xe_engine.h"
 #include "xe_macros.h"
+#include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
@@ -277,6 +278,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -363,6 +369,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 68d09e7a4cc0..0a41f5d04f6d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -500,6 +500,14 @@ static void register_engine(struct xe_engine *e)
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
@@ -662,6 +670,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_engine *e = job->engine;
+	bool lr = xe_engine_is_lr(e);
 
 	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
 		  !engine_banned(e) && !engine_suspended(e));
@@ -671,14 +680,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
 		if (!engine_registered(e))
 			register_engine(e);
-		e->ring_ops->emit_job(job);
+		if (!lr)	/* Written in IOCTL */
+			e->ring_ops->emit_job(job);
 		submit_engine(e);
 	}
 
-	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
+	if (lr) {
+		xe_sched_job_set_error(job, -ENOTSUPP);
+		return NULL;
+	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
 		return job->fence;
-	else
+	} else {
 		return dma_fence_get(job->fence);
+	}
 }
 
 static void guc_engine_free_job(struct drm_sched_job *drm_job)
@@ -782,6 +796,57 @@ static void simple_error_capture(struct xe_engine *e)
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
+	XE_BUG_ON(!xe_engine_is_lr(e));
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
+		xe_engine_get(e);
+		disable_scheduling_deregister(guc, e);
+
+		/*
+		 * Must wait for scheduling to be disabled before signalling
+		 * any fences, if GT broken the GT reset code should signal us.
+		 */
+		smp_rmb();
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
@@ -832,7 +897,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 			err = -EIO;
 		set_engine_banned(e);
 		xe_engine_get(e);
-		disable_scheduling_deregister(engine_to_guc(e), e);
+		disable_scheduling_deregister(guc, e);
 
 		/*
 		 * Must wait for scheduling to be disabled before signalling
@@ -865,7 +930,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	list_add(&drm_job->list, &sched->pending_list);
 	drm_sched_run_wq_start(sched);
-	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+	xe_guc_engine_trigger_cleanup(e);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
 	spin_lock(&sched->job_list_lock);
@@ -889,6 +954,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
 
 	trace_xe_engine_destroy(e);
 
+	if (xe_engine_is_lr(e))
+		cancel_work_sync(&ge->lr_tdr);
 	if (e->flags & ENGINE_FLAG_PERSISTENT)
 		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
 	release_guc_id(guc, e);
@@ -906,7 +973,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
 	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
 
 	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
-	queue_work(system_unbound_wq, &e->guc->fini_async);
+	queue_work(system_wq, &e->guc->fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
 	if (kernel) {
@@ -1089,12 +1156,16 @@ static int guc_engine_init(struct xe_engine *e)
 	if (err)
 		goto err_free;
 
+
 	sched = &ge->sched;
 	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
 				    &sched, 1, NULL);
 	if (err)
 		goto err_sched;
 
+	if (xe_engine_is_lr(e))
+		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
+
 	mutex_lock(&guc->submission_state.lock);
 
 	err = alloc_guc_id(guc, e);
@@ -1146,7 +1217,7 @@ static void guc_engine_kill(struct xe_engine *e)
 {
 	trace_xe_engine_kill(e);
 	set_engine_killed(e);
-	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+	xe_guc_engine_trigger_cleanup(e);
 }
 
 static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
@@ -1296,6 +1367,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
 	/* Stop scheduling + flush any DRM scheduler operations */
 	drm_sched_run_wq_stop(sched);
 
+	if (engine_registered(e) && xe_engine_is_lr(e))
+		xe_engine_put(e);
+
 	/* Clean up lost G2H + reset engine state */
 	if (engine_destroyed(e) && engine_registered(e)) {
 		if (engine_banned(e))
@@ -1520,6 +1594,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	trace_xe_engine_deregister_done(e);
 
 	clear_engine_registered(e);
+	if (xe_engine_is_lr(e))
+		xe_engine_put(e);
+
 	if (engine_banned(e))
 		xe_engine_put(e);
 	else
@@ -1557,7 +1634,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 */
 	set_engine_reset(e);
 	if (!engine_banned(e))
-		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
+		xe_guc_engine_trigger_cleanup(e);
 
 	return 0;
 }
@@ -1584,7 +1661,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
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

