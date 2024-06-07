Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46EDC27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 22:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C8510E196;
	Fri,  7 Jun 2024 22:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggQVIAF4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2F710E0E8
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 22:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717797764; x=1749333764;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NUeAXqx5bncej0bVCIg1W/xN7SABiW2D5JsZssWyo50=;
 b=ggQVIAF4G6sqmrVCaDctmpoX8sJ1lw1In2N2swO3KndhQOhoyAWcsZ29
 v70RpQo7c44z5h2YzLebG8crDW3a2ff/uHNPry6CmMde+xeUf1wsLYAw2
 hQK9ud/3DWuUt6Z8Skj40IRJm1lDgNjcun9UiHis46H90bhjybiyhJ2qz
 7GvCbNxcFWok2DSbUaryuuhDVORLEQ57BeiBrOmKery+lyANz/25SD5ip
 6ikvtex8+Z0aeHvgFsDUPPiADphBd0TI3GE9ZMNsNmyHhFx///roid5UD
 +tmIBlAeTIy03AmRas12FB2ZjwLjocA2DWGmoyZshg/t61XAfPKEKZXlm Q==;
X-CSE-ConnectionGUID: VXBzDmyySVqQqc14vL+pcg==
X-CSE-MsgGUID: LK53InT1QXeZTkmWkRYEHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14657040"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14657040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:43 -0700
X-CSE-ConnectionGUID: WWi4blmeRMKcltgRwruZjA==
X-CSE-MsgGUID: GaU/tSO+R/2dudeuzc3GOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38307946"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 15:02:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/xe: Sample ctx timestamp to determine if jobs have
 timed out
Date: Fri,  7 Jun 2024 15:03:14 -0700
Message-Id: <20240607220314.2318154-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607220314.2318154-1-matthew.brost@intel.com>
References: <20240607220314.2318154-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 153 ++++++++++++++++++++++-------
 1 file changed, 120 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 47aab04cf34f..95ac7aaec70a 100644
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
@@ -61,6 +62,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_RESET			(1 << 6)
 #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
+#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 9)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -187,6 +189,21 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
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
 	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
@@ -918,6 +935,41 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	xe_sched_submission_start(sched);
 }
 
+#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
+
+static bool check_timeout(struct xe_exec_queue *q)
+{
+	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
+	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
+	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
+	u32 timeout_ms = q->sched_props.job_timeout_ms;
+	u32 diff;
+
+	if (ctx_timestamp < ctx_job_timestamp)
+		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
+	else
+		diff = ctx_timestamp - ctx_job_timestamp;
+
+	/*
+	 * Ensure timeout is within 5% to account for an GuC scheduling latency
+	 */
+	return ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff)) >=
+		timeout_ms;
+}
+
+static void enable_scheduling(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
+
+	set_exec_queue_pending_enable(q);
+	set_exec_queue_enabled(q);
+	trace_xe_exec_queue_scheduling_enable(q);
+
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
+		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
+}
+
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -928,7 +980,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
-	bool wedged;
+	bool wedged, skip_timeout_check = exec_queue_reset(q) ||
+		exec_queue_killed_or_banned_or_wedged(q);
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -940,38 +993,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
 		struct xe_guc *guc = exec_queue_to_guc(q);
@@ -979,7 +1016,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 		if (exec_queue_reset(q))
 			err = -EIO;
-		set_exec_queue_banned(q);
+		set_exec_queue_check_timeout(q);
 		if (!exec_queue_destroyed(q)) {
 			xe_exec_queue_get(q);
 			disable_scheduling_deregister(guc, q);
@@ -999,6 +1036,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
+			clear_exec_queue_check_timeout(q);
+			set_exec_queue_banned(q);
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
@@ -1007,6 +1046,38 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		}
 	}
 
+	if (!skip_timeout_check && !check_timeout(q) &&
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
+		}
+	}
+
+	set_exec_queue_banned(q);
+	if (!exec_queue_killed(q))
+		xe_devcoredump(job);
+
 	/* Stop fence signaling */
 	xe_hw_fence_irq_stop(q->fence_irq);
 
@@ -1030,6 +1101,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 out:
 	return DRM_GPU_SCHED_STAT_NOMINAL;
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
+	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 static void __guc_exec_queue_fini_async(struct work_struct *w)
@@ -1432,7 +1516,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
+		if (((exec_queue_banned(q) || exec_queue_check_timeout(q))
+		    && exec_queue_destroyed(q)) ||
 		    xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
@@ -1604,7 +1689,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
 		if (q->guc->suspend_pending) {
 			suspend_fence_signal(q);
 		} else {
-			if (exec_queue_banned(q)) {
+			if (exec_queue_banned(q) ||
+			    exec_queue_check_timeout(q)) {
 				smp_wmb();
 				wake_up_all(&guc->ct.wq);
 			}
@@ -1646,7 +1732,8 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	clear_exec_queue_registered(q);
 
-	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
+	if (exec_queue_banned(q) || exec_queue_check_timeout(q) ||
+	    xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_fini(guc, q);
@@ -1709,7 +1796,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * guc_exec_queue_timedout_job.
 	 */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
@@ -1739,7 +1826,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	/* Treat the same as engine reset */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
-- 
2.34.1

