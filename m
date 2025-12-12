Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFD0D59D84
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26CBD10E936;
	Fri, 12 Dec 2025 18:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdjjLxdJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E00110E92C
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564135; x=1797100135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e4bvt29fZat5/rbpsBwf4eY4sv08kFLMitkwtW3SQM0=;
 b=UdjjLxdJ9TydJSGBUfpxrar3qEhlZ+1IH4zhz4MZEdRB5e+lW9LwwswQ
 2go6CAqToj52tLz22Tl8NZoYLxIDMFciSGCO0p/K+zZ1U78ZVsqdawC1I
 XpkWdf11xHCz/9mUmmr8tcvZFdjV5dCB0abR6q6IlGvT7nvfvkMYvLB8f
 p/nJ4yRVYI2IZP7tk9aU2LFQ3SDgh0nVr8ZHnxHi1FGjWiICJ9FQtPN2S
 6qZXiOAryX6B5igPn49GUUIdLxABeyLlgRJXQx6oG4bWvd5lETRfWCf6f
 DqpDAxhF6eAL+Cu1s3wB83+9CBCru6H33XuHX1VgO2Ynma+0J0LrIH3WX g==;
X-CSE-ConnectionGUID: 6W8uXsccQteckSEhw9zqew==
X-CSE-MsgGUID: k8uMTIrKSAaCSXsPACGUgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432799"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432799"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: /2+stp3HQ/+Erz6qSbIVag==
X-CSE-MsgGUID: d5orBwm7Q5W5Tv5VasiWeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633949"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 4/7] drm/xe: Skip exec queue schedule toggle if queue is
 idle during suspend
Date: Fri, 12 Dec 2025 10:28:44 -0800
Message-Id: <20251212182847.1683222-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
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

v2:
 - Don't touch the LRC tail is queue is suspended but enabled in run_job
   (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.h      | 17 ++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c      | 55 +++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c |  2 +-
 3 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 10abed98fb6b..b5ad975d7e97 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -162,4 +162,21 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
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
index 18cac5594d6a..8bab816da7fd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -75,6 +75,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
 #define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
 #define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
+#define EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND	(1 << 14)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -266,6 +267,21 @@ static void clear_exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
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
@@ -1118,7 +1134,7 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	if (!job->restore_replay || job->last_replay) {
 		if (xe_exec_queue_is_parallel(q))
 			wq_item_append(q);
-		else
+		else if (!exec_queue_idle_skip_suspend(q))
 			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 		job->last_replay = false;
 	}
@@ -1906,9 +1922,10 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
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
@@ -1927,11 +1944,33 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 			disable_scheduling(q, false);
 		}
 	} else if (q->guc->suspend_pending) {
+		if (idle_skip_suspend)
+			set_exec_queue_idle_skip_suspend(q);
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
 }
 
+static void sched_context(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_lrc *lrc = q->lrc[0];
+	u32 action [] = {
+		XE_GUC_ACTION_SCHED_CONTEXT,
+		q->guc->id,
+	};
+
+	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_parallel(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
+	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+
+	trace_xe_exec_queue_submit(q);
+
+	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
+	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+}
+
 static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
@@ -1939,12 +1978,22 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 	if (guc_exec_queue_allowed_to_change_state(q)) {
 		clear_exec_queue_suspended(q);
 		if (!exec_queue_enabled(q)) {
+			if (exec_queue_idle_skip_suspend(q)) {
+				struct xe_lrc *lrc = q->lrc[0];
+
+				clear_exec_queue_idle_skip_suspend(q);
+				xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
+			}
 			q->guc->resume_time = RESUME_PENDING;
 			set_exec_queue_pending_resume(q);
 			enable_scheduling(q);
+		} else if (exec_queue_idle_skip_suspend(q)) {
+			clear_exec_queue_idle_skip_suspend(q);
+			sched_context(q);
 		}
 	} else {
 		clear_exec_queue_suspended(q);
+		clear_exec_queue_idle_skip_suspend(q);
 	}
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

