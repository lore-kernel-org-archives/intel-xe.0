Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E557D277CE
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 01:27:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCCB110E34A;
	Sat, 10 Jan 2026 01:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZXo3Nd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2FF10E2B8
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 01:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768008468; x=1799544468;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=nCtogJobkUf9+nc5fcP7G4m4k9n8PNPGjVffKKpxzH4=;
 b=WZXo3Nd1CIQmyh0NnRMal29E8V+foj9A/t4GM+B5HG0GEgygnx1OYB98
 +7gyQ86De+MEe3tYU+xnkQ4QA/P/j+/16WwSTFl7LM4vmF7CxVN6KDyx5
 q6JBqxAZPdaZzCjoVNAKZjiBLTFzPVNRFB9q4IrDPNAtyM7j5I6vZ+XfO
 kgeNm0mLPriR2NNOMHWG4BT0dg+lQlE+OZeCwwJiQhseE33UOCgMmAvwp
 Vm3Ncb24S8e7xwEt5ll0df8tOg3DIrxnMoC6y1NpQzX3yrJBl1ELUx3Ko
 lYgpy25UGa7SDNPqv9vfYQaggJ5m+8wZwhOj/v5zYQKqe2PwKqiWsP/Aw A==;
X-CSE-ConnectionGUID: 86uO3uCKTuKOPDlz+zIFsw==
X-CSE-MsgGUID: SPfVuPvVThGw06WNGoQX1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73021816"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="73021816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:47 -0800
X-CSE-ConnectionGUID: ZjYn1m65Qjiu/HHOBhaVzA==
X-CSE-MsgGUID: qiWa8CBnQDyg9J+VngCEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208132052"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 5/7] drm/xe: Remove special casing for LR queues in
 submission
Date: Fri,  9 Jan 2026 17:27:37 -0800
Message-Id: <20260110012739.2888434-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260110012739.2888434-1-matthew.brost@intel.com>
References: <20260110012739.2888434-1-matthew.brost@intel.com>
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

Now that LR jobs are tracked by the DRM scheduler, there's no longer a
need to special-case LR queues. This change removes all LR
queue-specific handling, including dedicated TDR logic, reference
counting schemes, and other related mechanisms.

v4:
 - Remove xe_exec_queue_lr_cleanup tracepoint (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   2 -
 drivers/gpu/drm/xe/xe_guc_submit.c           | 131 ++-----------------
 drivers/gpu/drm/xe/xe_trace.h                |   5 -
 3 files changed, 11 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index a3b034e4b205..fd0915ed8eb1 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -33,8 +33,6 @@ struct xe_guc_exec_queue {
 	 */
 #define MAX_STATIC_MSG_TYPE	3
 	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
-	/** @lr_tdr: long running TDR worker */
-	struct work_struct lr_tdr;
 	/** @destroy_async: do final destroy async from this worker */
 	struct work_struct destroy_async;
 	/** @resume_time: time of last resume */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0a69022bd252..9f58d345bb59 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -587,10 +587,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
 	wake_up_all(&xe->ufence_wq);
 
-	if (xe_exec_queue_is_lr(q))
-		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
-	else
-		xe_sched_tdr_queue_imm(&q->guc->sched);
+	xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
 static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
@@ -978,14 +975,6 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
 	}
 
-	/*
-	 * We must keep a reference for LR engines if engine is registered with
-	 * the GuC as jobs signal immediately and can't destroy an engine if the
-	 * GuC has a reference to it.
-	 */
-	if (xe_exec_queue_is_lr(q))
-		xe_exec_queue_get(q);
-
 	set_exec_queue_registered(q);
 	trace_xe_exec_queue_register(q);
 	if (xe_exec_queue_is_multi_queue_primary(q))
@@ -1186,7 +1175,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
+	bool killed_or_banned_or_wedged =
 		exec_queue_killed_or_banned_or_wedged(q);
 
 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
@@ -1216,14 +1205,6 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	}
 
 run_job_out:
-	/*
-	 * We don't care about job-fence ordering in LR VMs because these fences
-	 * are never exported; they are used solely to keep jobs on the pending
-	 * list. Once a queue enters an error state, there's no need to track
-	 * them.
-	 */
-	if (killed_or_banned_or_wedged && lr)
-		xe_sched_job_set_error(job, -ECANCELED);
 
 	return job->fence;
 }
@@ -1275,8 +1256,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
 		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
-		if (!xe_exec_queue_is_lr(q))
-			xe_sched_tdr_queue_imm(sched);
+		xe_sched_tdr_queue_imm(sched);
 		return;
 	}
 
@@ -1351,78 +1331,6 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
 	return true;
 }
 
-static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
-{
-	struct xe_guc_exec_queue *ge =
-		container_of(w, struct xe_guc_exec_queue, lr_tdr);
-	struct xe_exec_queue *q = ge->q;
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_gpu_scheduler *sched = &ge->sched;
-	struct drm_sched_job *job;
-	bool wedged = false;
-
-	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
-
-	if (vf_recovery(guc))
-		return;
-
-	trace_xe_exec_queue_lr_cleanup(q);
-
-	if (!exec_queue_killed(q))
-		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
-
-	/* Kill the run_job / process_msg entry points */
-	xe_sched_submission_stop(sched);
-
-	/*
-	 * Engine state now mostly stable, disable scheduling / deregister if
-	 * needed. This cleanup routine might be called multiple times, where
-	 * the actual async engine deregister drops the final engine ref.
-	 * Calling disable_scheduling_deregister will mark the engine as
-	 * destroyed and fire off the CT requests to disable scheduling /
-	 * deregister, which we only want to do once. We also don't want to mark
-	 * the engine as pending_disable again as this may race with the
-	 * xe_guc_deregister_done_handler() which treats it as an unexpected
-	 * state.
-	 */
-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
-		struct xe_guc *guc = exec_queue_to_guc(q);
-		int ret;
-
-		set_exec_queue_banned(q);
-		disable_scheduling_deregister(guc, q);
-
-		/*
-		 * Must wait for scheduling to be disabled before signalling
-		 * any fences, if GT broken the GT reset code should signal us.
-		 */
-		ret = wait_event_timeout(guc->ct.wq,
-					 !exec_queue_pending_disable(q) ||
-					 xe_guc_read_stopped(guc) ||
-					 vf_recovery(guc), HZ * 5);
-		if (vf_recovery(guc))
-			return;
-
-		if (!ret) {
-			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
-				   q->guc->id);
-			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
-				       q->guc->id);
-			xe_sched_submission_start(sched);
-			xe_gt_reset_async(q->gt);
-			return;
-		}
-	}
-
-	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
-		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
-
-	drm_sched_for_each_pending_job(job, &sched->base, NULL)
-		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
-
-	xe_sched_submission_start(sched);
-}
-
 #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
 
 static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
@@ -1495,8 +1403,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
 		set_exec_queue_banned(q);
 		xe_gt_reset_async(q->gt);
-		if (!xe_exec_queue_is_lr(q))
-			xe_sched_tdr_queue_imm(&q->guc->sched);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
 	}
 }
 
@@ -1536,7 +1443,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	pid_t pid = -1;
 	bool wedged = false, skip_timeout_check;
 
-	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
 	/*
@@ -1561,6 +1467,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	    READ_ONCE(q->multi_queue.group->banned))
 		skip_timeout_check = true;
 
+	/* LR jobs can only get here if queue has been killed or hit an error */
+	if (xe_exec_queue_is_lr(q))
+		xe_gt_assert(guc_to_gt(guc), skip_timeout_check);
+
 	/*
 	 * FIXME: In multi-queue scenario, the TDR must ensure that the whole
 	 * multi-queue group is off the HW before signaling the fences to avoid
@@ -1770,8 +1680,6 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 		mutex_unlock(&group->list_lock);
 	}
 
-	if (xe_exec_queue_is_lr(q))
-		cancel_work_sync(&ge->lr_tdr);
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
 
@@ -2075,9 +1983,6 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (err)
 		goto err_sched;
 
-	if (xe_exec_queue_is_lr(q))
-		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
-
 	mutex_lock(&guc->submission_state.lock);
 
 	err = alloc_guc_id(guc, q);
@@ -2373,9 +2278,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if (xe_exec_queue_is_lr(q))
-			xe_exec_queue_put(q);
-		else if (exec_queue_destroyed(q))
+		if (exec_queue_destroyed(q))
 			__guc_exec_queue_destroy(guc, q);
 	}
 	if (q->guc->suspend_pending) {
@@ -2405,9 +2308,6 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 				trace_xe_sched_job_ban(job);
 				ban = true;
 			}
-		} else if (xe_exec_queue_is_lr(q) &&
-			   !xe_lrc_ring_is_idle(q->lrc[0])) {
-			ban = true;
 		}
 
 		if (ban) {
@@ -2490,8 +2390,6 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 	if (pending_enable && !pending_resume &&
 	    !exec_queue_pending_tdr_exit(q)) {
 		clear_exec_queue_registered(q);
-		if (xe_exec_queue_is_lr(q))
-			xe_exec_queue_put(q);
 		xe_gt_dbg(guc_to_gt(guc), "Replay REGISTER - guc_id=%d",
 			  q->guc->id);
 	}
@@ -2560,10 +2458,7 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Stop scheduling + flush any DRM scheduler operations */
 	xe_sched_submission_stop(sched);
-	if (xe_exec_queue_is_lr(q))
-		cancel_work_sync(&q->guc->lr_tdr);
-	else
-		cancel_delayed_work_sync(&sched->base.work_tdr);
+	cancel_delayed_work_sync(&sched->base.work_tdr);
 
 	guc_exec_queue_revert_pending_state_change(guc, q);
 
@@ -2986,11 +2881,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 	trace_xe_exec_queue_deregister_done(q);
 
 	clear_exec_queue_registered(q);
-
-	if (xe_exec_queue_is_lr(q))
-		xe_exec_queue_put(q);
-	else
-		__guc_exec_queue_destroy(guc, q);
+	__guc_exec_queue_destroy(guc, q);
 }
 
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 6d12fcc13f43..750fa32c13b2 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -228,11 +228,6 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_resubmit,
 	     TP_ARGS(q)
 );
 
-DEFINE_EVENT(xe_exec_queue, xe_exec_queue_lr_cleanup,
-	     TP_PROTO(struct xe_exec_queue *q),
-	     TP_ARGS(q)
-);
-
 DECLARE_EVENT_CLASS(xe_sched_job,
 		    TP_PROTO(struct xe_sched_job *job),
 		    TP_ARGS(job),
-- 
2.34.1

