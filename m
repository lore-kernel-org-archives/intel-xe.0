Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C2EC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 13:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5BC10E489;
	Mon, 10 Jun 2024 13:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fAJgmIfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11110E1A1
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 13:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718027384; x=1749563384;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dWA/+Yvxoyg1ec+GhJ2aAXV3V+WvgtCz5oVO6l+Ysok=;
 b=fAJgmIfRT3k7IfOyjwZqmtoe38lklNUGeNY2LUItTHoqW0e9k1M8kkJp
 qipEBdqZWkCiZNnZ7PNFxW6pHcafkSDxgXjo4w9JV4MUsblKK7SPJC2Xy
 SozLdB1gfvQ1cRMr7wHbNTvW3Rrw5Qw/k1C33vAWk800vRvf6Oe6AHzVj
 SAOhZjEgCQ4tRzP1jH1mDEA3wdh21H40t2c7rS2BU5Yv6m07tTsn43/iU
 GsshN1MH4EB5PPiXirwU7Da2ZSiEWVwF8EBj5qVPd1b9eGg1Fj1ARW9at
 75XaJqVWzXwYs1JExAdNy5EtnPoMClpf8N32YdpqYIzy6mY4jytneKpgH Q==;
X-CSE-ConnectionGUID: EsZQnoAdTo6WmLipdPpE9w==
X-CSE-MsgGUID: qcswAeHHRmCmeyfRcQBBYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14419836"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14419836"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
X-CSE-ConnectionGUID: cOrsqkGqRQKb2ris6AYR2A==
X-CSE-MsgGUID: uwbwbT5cQp+XJ7VF40/ImA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="76523131"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 06:49:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 7/7] drm/xe: Sample ctx timestamp to determine if jobs have
 timed out
Date: Mon, 10 Jun 2024 06:50:11 -0700
Message-Id: <20240610135011.2605272-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610135011.2605272-1-matthew.brost@intel.com>
References: <20240610135011.2605272-1-matthew.brost@intel.com>
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
 - Fix state machine for TDR, mainly decouple sched disable and
   deregister (testing)
 - Rebase (CI)
v4:
 - Fix checkpatch && newline issue (CI)
 - Do not deregister on wedged or unregistered (CI)
 - Fix refcounting bugs (CI)
 - Move devcoredump above VM / kernel job check (John H)
 - Add comment for check_timeout state usage (John H)
 - Assert pending disable not inflight when enabling scheduling (John H)
 - Use enable_scheduling in other scheduling enable code (John H)
 - Add comments on a few steps in TDR (John H)
 - Add assert for timestamp overflow protection (John H)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 297 +++++++++++++++++++++++------
 1 file changed, 238 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3db0aa40535d..8daf4e076df4 100644
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
@@ -62,6 +63,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
+#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
+#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -188,6 +191,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
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
+static bool exec_queue_extra_ref(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
+}
+
+static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -920,6 +948,107 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
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
+	/*
+	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
+	 * possible overflows with a high timeout.
+	 */
+	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
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
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
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
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
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
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
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
@@ -928,9 +1057,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
+	struct xe_guc *guc = exec_queue_to_guc(q);
 	int err = -ETIME;
 	int i = 0;
-	bool wedged;
+	bool wedged, skip_timeout_check;
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -942,49 +1072,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
-
-	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
-
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
 
+	/* Must check all state after stopping scheduler */
+	skip_timeout_check = exec_queue_reset(q) ||
+		exec_queue_killed_or_banned_or_wedged(q) ||
+		exec_queue_destroyed(q);
+
+	/* Job hasn't started, can't be timed out */
+	if (!skip_timeout_check && !xe_sched_job_started(job))
+		goto rearm;
+
 	/*
-	 * Kernel jobs should never fail, nor should VM jobs if they do
-	 * somethings has gone wrong and the GT needs a reset
+	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
+	 * modify scheduling state to read timestamp. We could read the
+	 * timestamp from a register to accumulate current running time but this
+	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
+	 * genuine timeouts.
 	 */
-	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
-		if (!xe_sched_invalidate_job(job, 2)) {
-			xe_sched_add_pending_job(sched, job);
-			xe_sched_submission_start(sched);
-			xe_gt_reset_async(q->gt);
-			goto out;
-		}
-	}
+	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
-	/* Engine state now stable, disable scheduling if needed */
+	/* Engine state now stable, disable scheduling to check timestamp */
 	if (!wedged && exec_queue_registered(q)) {
-		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
 		if (exec_queue_reset(q))
 			err = -EIO;
-		set_exec_queue_banned(q);
+
 		if (!exec_queue_destroyed(q)) {
-			xe_exec_queue_get(q);
-			disable_scheduling_deregister(guc, q);
+			/*
+			 * Wait for any pending G2H to flush out before
+			 * modifying state
+			 */
+			ret = wait_event_timeout(guc->ct.wq,
+						 !exec_queue_pending_enable(q) ||
+						 guc_read_stopped(guc), HZ * 5);
+			if (!ret || guc_read_stopped(guc))
+				goto trigger_reset;
+
+			/*
+			 * Flag communicates to G2H handler that schedule
+			 * disable originated from a timeout check. The G2H then
+			 * avoid triggering cleanup or deregistering the exec
+			 * queue.
+			 */
+			set_exec_queue_check_timeout(q);
+			disable_scheduling(q);
 		}
 
 		/*
@@ -1000,15 +1134,61 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 !exec_queue_pending_disable(q) ||
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
+trigger_reset:
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			xe_sched_add_pending_job(sched, job);
-			xe_sched_submission_start(sched);
+			clear_exec_queue_check_timeout(q);
+			set_exec_queue_extra_ref(q);
+			xe_exec_queue_get(q);	/* GT reset owns this */
+			set_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
 			xe_sched_tdr_queue_imm(sched);
-			goto out;
+			goto rearm;
 		}
 	}
 
+	/*
+	 * Check if job is actually timed out, if restart job execution and TDR
+	 */
+	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
+	    !exec_queue_reset(q) && exec_queue_registered(q)) {
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
+	if (!exec_queue_killed(q))
+		xe_devcoredump(job);
+
+	/*
+	 * Kernel jobs should never fail, nor should VM jobs if they do
+	 * somethings has gone wrong and the GT needs a reset
+	 */
+	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
+			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
+		if (!xe_sched_invalidate_job(job, 2)) {
+			clear_exec_queue_check_timeout(q);
+			xe_gt_reset_async(q->gt);
+			goto rearm;
+		}
+	}
+
+	/* Finish cleaning up exec queue via deregister */
+	set_exec_queue_banned(q);
+	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
+		set_exec_queue_extra_ref(q);
+		xe_exec_queue_get(q);
+		__deregister_exec_queue(guc, q);
+	}
+
 	/* Stop fence signaling */
 	xe_hw_fence_irq_stop(q->fence_irq);
 
@@ -1030,7 +1210,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
 
@@ -1133,7 +1325,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 			   guc_read_stopped(guc));
 
 		if (!guc_read_stopped(guc)) {
-			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
 			s64 since_resume_ms =
 				ktime_ms_delta(ktime_get(),
 					       q->guc->resume_time);
@@ -1144,12 +1335,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 				msleep(wait_ms);
 
 			set_exec_queue_suspended(q);
-			clear_exec_queue_enabled(q);
-			set_exec_queue_pending_disable(q);
-			trace_xe_exec_queue_scheduling_disable(q);
-
-			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
+			disable_scheduling(q);
 		}
 	} else if (q->guc->suspend_pending) {
 		set_exec_queue_suspended(q);
@@ -1160,19 +1346,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
-	struct xe_guc *guc = exec_queue_to_guc(q);
 
 	if (guc_exec_queue_allowed_to_change_state(q)) {
-		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
-
 		q->guc->resume_time = RESUME_PENDING;
 		clear_exec_queue_suspended(q);
-		set_exec_queue_pending_enable(q);
-		set_exec_queue_enabled(q);
-		trace_xe_exec_queue_scheduling_enable(q);
-
-		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
+		enable_scheduling(q);
 	} else {
 		clear_exec_queue_suspended(q);
 	}
@@ -1434,8 +1612,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
-		    xe_exec_queue_is_lr(q))
+		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
 			__guc_exec_queue_fini(guc, q);
@@ -1615,11 +1792,13 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
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
@@ -1657,7 +1836,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	clear_exec_queue_registered(q);
 
-	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
+	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_fini(guc, q);
@@ -1720,7 +1899,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * guc_exec_queue_timedout_job.
 	 */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
@@ -1750,7 +1929,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	/* Treat the same as engine reset */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
-- 
2.34.1

