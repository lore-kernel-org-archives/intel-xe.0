Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FDFC27C75
	for <intel-xe@archiver.kernel.org>; Sat,  8 Jun 2024 00:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EEB10E222;
	Sat,  8 Jun 2024 00:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cgbn79Eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0B10E1BF
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Jun 2024 00:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717806032; x=1749342032;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=MV+CeK6WsMpRtqX8RSA0ySXfkWigAuQtK8SHgJJ4upU=;
 b=Cgbn79Eofbz4+cgio1T5LVovu1Khc7UeE+M9EW0agDQpgDYSG4AEcGb/
 9RDtvtUef7CtOOOZX4J6z4Jy0oYbtRy08NWDO0W2flkFhSe33p5lFJsPB
 JRuMObf4PnfAPF790dSkE83YJK0FanyTeWDvnHitmw9zgnb+SmYx1G5+l
 FGJE24CKcSYtHqzu6b8IbqGIOQOzuet3gZ3cfGNNDmWuBF31MZuLkyu+d
 9dEtUfYWlOGfLlcqqlcKVSo9neYSt+PiWZoaDxjPdSKGWIxR3sZ5nhL6p
 l4jnWTvPEfLFPeF65Dl85/hucP1M3AifgyygdnD33BFoxJf8Tr3d3m/e1 w==;
X-CSE-ConnectionGUID: 93rNfGyDQ4mtlJSEGzSleg==
X-CSE-MsgGUID: F1oNmSNzQVS2HyuoikfrUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25173697"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25173697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:31 -0700
X-CSE-ConnectionGUID: h91o2lKFRT+r/y/Xm0kXCw==
X-CSE-MsgGUID: 5UPJHGjWQHWCT9fv6ZeIAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38427016"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 17:20:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 6/6] drm/xe: Sample ctx timestamp to determine if jobs have
 timed out
Date: Fri,  7 Jun 2024 17:21:03 -0700
Message-Id: <20240608002103.2371696-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608002103.2371696-1-matthew.brost@intel.com>
References: <20240608002103.2371696-1-matthew.brost@intel.com>
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

In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
scheduling enable needs to be toggled to properly sample the timestamp.
If a job has not been running for longer than the timeout period,
re-enable scheduling and restart the TDR.

v2:
 - Use GT clock to msec helper (Umesh, off list)
 - s/ctx_timestamp_job/ctx_job_timestamp
v3:
 - Fix state machine for TDR, mainly decouple sched disable and deregister (testing)
 - Rebase (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 218 +++++++++++++++++++++++------
 1 file changed, 175 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4464ba337d12..716dd489d596 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -23,6 +23,7 @@
 #include "xe_force_wake.h"
 #include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
+#include "xe_gt_clock.h"
 #include "xe_gt_printk.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -62,6 +63,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
+#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -188,6 +190,21 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
 }
 
+static bool exec_queue_check_timeout(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
+}
+
+static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
+}
+
+static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -920,6 +937,87 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	xe_sched_submission_start(sched);
 }
 
+#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
+
+static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
+{
+	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
+	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
+	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
+	u32 timeout_ms = q->sched_props.job_timeout_ms;
+	u32 diff, running_time_ms;
+
+	if (ctx_timestamp < ctx_job_timestamp)
+		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
+	else
+		diff = ctx_timestamp - ctx_job_timestamp;
+
+	/*
+	 * Ensure timeout is within 5% to account for an GuC scheduling latency
+	 */
+	running_time_ms =
+		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
+
+	drm_info(&guc_to_xe(exec_queue_to_guc(q))->drm,
+		 "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%u, timeout_ms=%u, diff=0x%08x",
+		 xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+		 q->guc->id, running_time_ms, timeout_ms, diff);
+
+	return running_time_ms >= timeout_ms;
+}
+
+static void enable_scheduling(struct xe_exec_queue *q)
+{
+	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret;
+
+	set_exec_queue_pending_enable(q);
+	set_exec_queue_enabled(q);
+	trace_xe_exec_queue_scheduling_enable(q);
+
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
+
+	ret = wait_event_timeout(guc->ct.wq,
+				 !exec_queue_pending_enable(q) ||
+				 guc_read_stopped(guc), HZ * 5);
+	if (!ret || guc_read_stopped(guc)) {
+		drm_warn(&xe->drm, "Schedule enable failed to respond");
+		set_exec_queue_banned(q);
+		xe_gt_reset_async(q->gt);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
+	}
+}
+
+static void disable_scheduling(struct xe_exec_queue *q)
+{
+	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	clear_exec_queue_enabled(q);
+	set_exec_queue_pending_disable(q);
+	trace_xe_exec_queue_scheduling_disable(q);
+
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
+}
+
+static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_DEREGISTER_CONTEXT,
+		q->guc->id,
+	};
+
+	set_exec_queue_destroyed(q);
+	trace_xe_exec_queue_deregister(q);
+
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
+}
+
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -928,9 +1026,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
+	struct xe_guc *guc = exec_queue_to_guc(q);
 	int err = -ETIME;
 	int i = 0;
-	bool wedged;
+	bool wedged, skip_timeout_check = exec_queue_reset(q) ||
+		exec_queue_killed_or_banned_or_wedged(q);
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -942,50 +1042,31 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 	}
 
-	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
-		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
-		   q->guc->id, q->flags);
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
-		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
-		   "VM job timed out on non-killed execqueue\n");
-
-	if (!exec_queue_killed(q))
-		xe_devcoredump(job);
-
-	trace_xe_sched_job_timedout(job);
+	/* Job hasn't started, can't be timed out */
+	if (!skip_timeout_check && !xe_sched_job_started(job))
+		goto rearm;
 
+	/*
+	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
+	 * modify scheduling state to read timestamp. We could read the
+	 * timestamp from a register to accumulate current running time but this
+	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
+	 * genuine timeouts.
+	 */
 	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
 
-	/*
-	 * Kernel jobs should never fail, nor should VM jobs if they do
-	 * somethings has gone wrong and the GT needs a reset
-	 */
-	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
-		if (!xe_sched_invalidate_job(job, 2)) {
-			xe_sched_add_pending_job(sched, job);
-			xe_sched_submission_start(sched);
-			xe_gt_reset_async(q->gt);
-			goto out;
-		}
-	}
-
 	/* Engine state now stable, disable scheduling if needed */
 	if (!wedged && exec_queue_registered(q)) {
-		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
 		if (exec_queue_reset(q))
 			err = -EIO;
-		set_exec_queue_banned(q);
-		if (!exec_queue_destroyed(q)) {
-			xe_exec_queue_get(q);
-			disable_scheduling_deregister(guc, q);
-		}
+		set_exec_queue_check_timeout(q);
+		if (!exec_queue_destroyed(q))
+			disable_scheduling(q);
 
 		/*
 		 * Must wait for scheduling to be disabled before signalling
@@ -1001,14 +1082,49 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			xe_sched_add_pending_job(sched, job);
-			xe_sched_submission_start(sched);
+			clear_exec_queue_check_timeout(q);
+			set_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
 			xe_sched_tdr_queue_imm(sched);
-			goto out;
+			goto rearm;
+		}
+	}
+
+	if (!skip_timeout_check && !check_timeout(q, job) &&
+	    !exec_queue_reset(q)) {
+		clear_exec_queue_check_timeout(q);
+		goto sched_enable;
+	}
+
+	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
+		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+		   q->guc->id, q->flags);
+	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
+		   "Kernel-submitted job timed out\n");
+	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
+		   "VM job timed out on non-killed execqueue\n");
+
+	trace_xe_sched_job_timedout(job);
+
+	/*
+	 * Kernel jobs should never fail, nor should VM jobs if they do
+	 * somethings has gone wrong and the GT needs a reset
+	 */
+	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
+			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
+		if (!xe_sched_invalidate_job(job, 2)) {
+			xe_gt_reset_async(q->gt);
+			goto rearm;
 		}
 	}
 
+	if (!exec_queue_killed(q))
+		xe_devcoredump(job);
+
+	set_exec_queue_banned(q);
+	xe_exec_queue_get(q);
+	__deregister_exec_queue(guc, q);
+
 	/* Stop fence signaling */
 	xe_hw_fence_irq_stop(q->fence_irq);
 
@@ -1030,7 +1146,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	/* Start fence signaling */
 	xe_hw_fence_irq_start(q->fence_irq);
 
-out:
+	return DRM_GPU_SCHED_STAT_NOMINAL;
+
+sched_enable:
+	enable_scheduling(q);
+rearm:
+	/*
+	 * XXX: Ideally want to adjust timeout based on current exection time
+	 * but there is not currently an easy way to do in DRM scheduler. With
+	 * some thought, do this in a follow up.
+	 */
+	xe_sched_add_pending_job(sched, job);
+	xe_sched_submission_start(sched);
+
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
@@ -1434,7 +1562,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
+		if (((exec_queue_banned(q) || exec_queue_check_timeout(q))
+		    && exec_queue_destroyed(q)) ||
 		    xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
@@ -1606,11 +1735,13 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
 		if (q->guc->suspend_pending) {
 			suspend_fence_signal(q);
 		} else {
-			if (exec_queue_banned(q)) {
+			if (exec_queue_banned(q) ||
+			    exec_queue_check_timeout(q)) {
 				smp_wmb();
 				wake_up_all(&guc->ct.wq);
 			}
-			deregister_exec_queue(guc, q);
+			if (!exec_queue_check_timeout(q))
+				deregister_exec_queue(guc, q);
 		}
 	}
 }
@@ -1648,7 +1779,8 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	clear_exec_queue_registered(q);
 
-	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
+	if (exec_queue_banned(q) || exec_queue_check_timeout(q) ||
+	    xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_fini(guc, q);
@@ -1711,7 +1843,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * guc_exec_queue_timedout_job.
 	 */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
@@ -1741,7 +1873,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	/* Treat the same as engine reset */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
-- 
2.34.1

