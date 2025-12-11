Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F251D43357
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 21:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518C110E35B;
	Thu, 11 Dec 2025 21:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MBLA2xP/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C6510E2BE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486838; x=1797022838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QSXLFeEMisRoud0lhIH/091B+rq/8SWVGyQPzZIbb+k=;
 b=MBLA2xP/HP2NsT3wqrBlJeQE3p9hzk2eX9v8PidJAykLVLOmcxmvRJ5O
 wqPnnW4Q1+4fmlfKELunhVWshb3SaXIvY+3mrUVEupLiuVP6fKo+FDoU2
 rs7PBsCuyCZikgFP3CRr+AkQT6+mMuqWFHYer43Nev7U8pyaALUSMvsRt
 wR+uy0nRSJeRv9AGutRBWErq4OowjNC2FrTBIgZjvcQ5Wb+dkdFxvyJk5
 MlY+AgzSOnERyEwYAhX14Za2TrXmvIl4YI70J4UEsSFJeySiK0dGW5KvM
 V7LA+zKsyWPgRRqPT2QDz0MW6SIZgKdmM7OcHCU7zfEoIfhBpPwzz8Nom Q==;
X-CSE-ConnectionGUID: CRNOoJ6HSsuCuq5DKNLZ8g==
X-CSE-MsgGUID: f1qWmwUJR8ahQnkn1sxMzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67649721"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="67649721"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
X-CSE-ConnectionGUID: ZunbaW5CRn6sg+gRmllZNQ==
X-CSE-MsgGUID: yETZxfwmT3m2O+TqHpzUrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="234297953"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 13:00:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH 4/6] drm/xe: Skip exec queue schedule toggle if queue is idle
 during suspend
Date: Thu, 11 Dec 2025 13:00:30 -0800
Message-Id: <20251211210032.1520113-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211210032.1520113-1-matthew.brost@intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
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

If an exec queue is idle, there is no need to issue a schedule disable
to the GuC when suspending the queue’s execution. Opportunistically skip
this step if the queue is idle and not a parallel queue. Parallel queues
must have their scheduling state flipped in the GuC due to limitations
in how submission is implemented in run_job().

Also if all pagefault queues can skip the schedule disable during a
switch to dma-fence mode, do not schedule a resume for the pagefault
queues after the next submission.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.h      | 17 ++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c      | 26 ++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hw_engine_group.c |  2 +-
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index fda4d4f9bda8..ae16b9b39ced 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -111,4 +111,21 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 
+/**
+ * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
+ * @q: The exec_queue
+ *
+ * If an exec queue is not parallel and is idle, the suspend steps can be
+ * skipped in the submission backend immediatley signaling the suspend fence.
+ * Parallel queues cannot skip this step due to limitations in the submission
+ * backend.
+ *
+ * Return: True if exec queue is idle and can skip suspend steps, False
+ * otherwise
+ */
+static inline bool xe_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
+{
+	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 92c703888cff..c4eb845628c4 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -72,6 +72,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
 #define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
 #define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
+#define EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND	(1 << 14)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -263,6 +264,21 @@ static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_PENDING_TDR_EXIT, &q->guc->state);
 }
 
+static bool exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
+{
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND;
+}
+
+static void set_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc->state);
+}
+
+static void clear_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc->state);
+}
+
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -1585,9 +1601,10 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	bool idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
 
-	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
-	    exec_queue_enabled(q)) {
+	if (!idle_skip_suspend && guc_exec_queue_allowed_to_change_state(q) &&
+	    !exec_queue_suspended(q) && exec_queue_enabled(q)) {
 		wait_event(guc->ct.wq, vf_recovery(guc) ||
 			   ((q->guc->resume_time != RESUME_PENDING ||
 			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
@@ -1606,6 +1623,8 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 			disable_scheduling(q, false);
 		}
 	} else if (q->guc->suspend_pending) {
+		if (idle_skip_suspend)
+			set_exec_queue_idle_skip_suspend(q);
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
@@ -1617,8 +1636,9 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 
 	if (guc_exec_queue_allowed_to_change_state(q)) {
 		clear_exec_queue_suspended(q);
-		if (!exec_queue_enabled(q)) {
+		if (!exec_queue_enabled(q) || exec_queue_idle_skip_suspend(q)) {
 			q->guc->resume_time = RESUME_PENDING;
+			clear_exec_queue_idle_skip_suspend(q);
 			set_exec_queue_pending_resume(q);
 			enable_scheduling(q);
 		}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 290205a266b8..4d9263a1a208 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -205,7 +205,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 			continue;
 
 		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
-		need_resume = true;
+		need_resume |= !xe_exec_queue_idle_skip_suspend(q);
 		q->ops->suspend(q);
 	}
 
-- 
2.34.1

