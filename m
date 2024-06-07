Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187A5C27C6F
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 06:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DC810EB5F;
	Fri,  7 Jun 2024 06:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H0tztoKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66D810E197
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 06:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717743110; x=1749279110;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=moMnSidE6Tz+e4ZVSoBtC/NMqzqVirIr+r9QvnN/O5M=;
 b=H0tztoKdMrZVor/va5WbVuSKvJVri7dV+HLsN3zFz9TyoE+BsLGCqldD
 JtN/2zVwpRtS1PWkEH8PUoU9mMQdgM4pUkWuckeHXy+CObnoIcCK4E8oZ
 I41tDauFqiRVErr8Zv1MUfdjOi/sj+Z0f+JrxA7XBR/Ar7ewymLU6dqLQ
 HVQMxTP7pMxzFT8R6RnG6UbaBLlsQCFI7T77juqXNf3o6p66ZxmzlX3vG
 EMdTVaLzTQDbOn0OeskrQaGA69AlvxCuHSWd1yJ96kiWt/4+oCKzPAbOr
 9SeFmgtCwjCqd1Z+PlRkyCxailX5f3ZR3oQgKQ9yKHCbVydOnOe35BiTY g==;
X-CSE-ConnectionGUID: KLKU+9VnTI6dbSp7U9srbw==
X-CSE-MsgGUID: ThcRIS4sS0mK150NYdBWag==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14254935"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14254935"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:49 -0700
X-CSE-ConnectionGUID: 4mFkD1jMQzKL4jq/YcQ4mA==
X-CSE-MsgGUID: 8V9rNdxhT1akDuWwfnhEAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="75702764"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 23:51:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 5/5] drm/xe: Sample ctx timestamp to determine if jobs
 have timed out
Date: Thu,  6 Jun 2024 23:52:19 -0700
Message-Id: <20240607065219.2264624-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240607065219.2264624-1-matthew.brost@intel.com>
References: <20240607065219.2264624-1-matthew.brost@intel.com>
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

FIXME: Wedged mode needs to be fixed
FIXME: Use some smarts to correlate timestamp to ms

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 140 ++++++++++++++++++++++-------
 1 file changed, 107 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 47aab04cf34f..51ddcf4f496d 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -61,6 +61,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_RESET			(1 << 6)
 #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
+#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 9)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -187,6 +188,21 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
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
@@ -918,6 +934,40 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	xe_sched_submission_start(sched);
 }
 
+/*
+ * FIXME: Picking a value which seems to work on DG2, likely need to do some
+ * clock speed correlation.
+ */
+#define TIMESTAMP_TO_MS_DIV	18500
+
+static bool check_timeout(struct xe_exec_queue *q)
+{
+	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
+	u32 ctx_timestamp_job = xe_lrc_ctx_timestamp_job(q->lrc[0]);
+	u32 timeout_ms = q->sched_props.job_timeout_ms;
+	u32 diff;
+
+	if (ctx_timestamp < ctx_timestamp_job)
+		diff = ctx_timestamp + 0xffffffff - ctx_timestamp_job;
+	else
+		diff = ctx_timestamp - ctx_timestamp_job;
+
+	return (diff / TIMESTAMP_TO_MS_DIV) > timeout_ms;
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
@@ -928,7 +978,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
-	bool wedged;
+	bool wedged, skip_timeout_check = exec_queue_reset(q) ||
+		exec_queue_killed_or_banned_or_wedged(q);
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -940,38 +991,16 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
 
+	/* XXX: Sampling timeout doesn't work in wedged mode... */
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
@@ -979,7 +1008,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 		if (exec_queue_reset(q))
 			err = -EIO;
-		set_exec_queue_banned(q);
+		set_exec_queue_check_timeout(q);
 		if (!exec_queue_destroyed(q)) {
 			xe_exec_queue_get(q);
 			disable_scheduling_deregister(guc, q);
@@ -999,6 +1028,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
+			clear_exec_queue_check_timeout(q);
+			set_exec_queue_banned(q);
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
@@ -1007,6 +1038,38 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		}
 	}
 
+	clear_exec_queue_check_timeout(q);
+	if (!skip_timeout_check && !check_timeout(q))
+		goto sched_enable;
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
+			xe_sched_add_pending_job(sched, job);
+			xe_sched_submission_start(sched);
+			xe_gt_reset_async(q->gt);
+			goto out;
+		}
+	}
+
+	set_exec_queue_banned(q);
+	if (!exec_queue_killed(q))
+		xe_devcoredump(job);
+
 	/* Stop fence signaling */
 	xe_hw_fence_irq_stop(q->fence_irq);
 
@@ -1030,6 +1093,14 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 out:
 	return DRM_GPU_SCHED_STAT_NOMINAL;
+
+sched_enable:
+	enable_scheduling(q);
+rearm:
+	xe_sched_add_pending_job(sched, job);
+	xe_sched_submission_start(sched);
+
+	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 static void __guc_exec_queue_fini_async(struct work_struct *w)
@@ -1432,7 +1503,8 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
+		if (((exec_queue_banned(q) || exec_queue_check_timeout(q))
+		    && exec_queue_destroyed(q)) ||
 		    xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
@@ -1604,7 +1676,8 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
 		if (q->guc->suspend_pending) {
 			suspend_fence_signal(q);
 		} else {
-			if (exec_queue_banned(q)) {
+			if (exec_queue_banned(q) ||
+			    exec_queue_check_timeout(q)) {
 				smp_wmb();
 				wake_up_all(&guc->ct.wq);
 			}
@@ -1646,7 +1719,8 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	clear_exec_queue_registered(q);
 
-	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
+	if (exec_queue_banned(q) || exec_queue_check_timeout(q) ||
+	    xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_fini(guc, q);
@@ -1709,7 +1783,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	 * guc_exec_queue_timedout_job.
 	 */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
@@ -1739,7 +1813,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 
 	/* Treat the same as engine reset */
 	set_exec_queue_reset(q);
-	if (!exec_queue_banned(q))
+	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
 		xe_guc_exec_queue_trigger_cleanup(q);
 
 	return 0;
-- 
2.34.1

