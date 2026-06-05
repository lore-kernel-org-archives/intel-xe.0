Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05304CD6E7C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 20:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC111112C00;
	Fri,  5 Jun 2026 20:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtG+d3mD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3009A112C00
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780693066; x=1812229066;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3I21aOUZeibyKE+e0YBLyx5nKBRmIyLuE9+jGnOSKCM=;
 b=PtG+d3mDcGmu6PTpIGRIeI41Bk8abojOwSSrHUw8y3RBbpQYgtLbMgn4
 qvWuBf2Lgy39oGTRUr/60IlCZ0+PQJLvHiIv6VC9VtnMBclasCy8l4RkW
 I+qP14AcYgrvVVks3bqmCP44cRg3WXsvd4M755rIPHSFg7bt9/Jn79/Gs
 3eS7RWZt30vETGVLYOUutSBy9tWLkOKKCWfbUPJsGBL2a/WXHOkvlaSkO
 Jv2rjECZeIMywy65FpGuWYx0nWLrGmMeomzZ6Ec6TTv/Pqr5v5ROMZFiX
 O63zxSmrNim1jPxeNu2hXbBExBfGF6HZ4vhrAOxM/0Wtwod0ZPrpLiwXQ w==;
X-CSE-ConnectionGUID: FZwrWJhwTIa8zv2DafFNzw==
X-CSE-MsgGUID: NcCvHQQAQ2+GrHbX9inVsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="104193518"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="104193518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 13:57:45 -0700
X-CSE-ConnectionGUID: NnlWCYJ4QyS8nlkd/DMBVA==
X-CSE-MsgGUID: 0dr/rXVKTZif3HEGMPD5OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; d="scan'208";a="240488192"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.20])
 by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 13:57:44 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v1 1/1] drm/xe/guc: Handle GuC local uncorrectable error
 notifications
Date: Fri,  5 Jun 2026 16:57:42 -0400
Message-Id: <20260605205742.1357269-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add support for the GuC uncorrectable local error G2H notification and
opt in to the feature when the submission ABI exposes it.

When the notification targets a known exec queue, treat it like an
engine reset request and route it through the existing timeout cleanup
path. This keeps the queue teardown, pending job cancellation and error
capture in one place instead of open-coding a parallel recovery flow.

The timeout worker also needs to cope with this externally triggered
reset path. Save the scheduler timeout so it can be restored after an
immediate TDR kick, avoid re-running the dump/cleanup path when reset
handling already started, and keep permanent or wedged queue destruction
asynchronous when the timeout path is already running from a scheduler
worker.

This allows Xe to consume the new GuC message without immediately
re-firing the timeout logic on the same queue.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_actions_abi.h    |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h       |   8 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.c       |   1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.h       |   5 +
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc.c                 |  11 ++
 drivers/gpu/drm/xe/xe_guc_ct.c              |   3 +
 drivers/gpu/drm/xe/xe_guc_submit.c          | 127 +++++++++++++++++---
 drivers/gpu/drm/xe/xe_guc_submit.h          |   1 +
 drivers/gpu/drm/xe/xe_trace.h               |   5 +
 10 files changed, 145 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 83a6e7794982..f5c9b37038d4 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -152,6 +152,7 @@ enum xe_guc_action {
 	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
 	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
 	XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY = 0x6004,
+	XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR = 0x6005,
 	XE_GUC_ACTION_TLB_INVALIDATION = 0x7000,
 	XE_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
 	XE_GUC_ACTION_TLB_INVALIDATION_ALL = 0x7002,
diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 644f5a4226d7..5c428f02a642 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -154,6 +154,11 @@ enum  {
  *      (instead of waiting the full timeslice duration). The bit is instead set
  *      to one if a single context is queued on the engine, to avoid it being
  *      switched out if there isn't another context that can run in its place.
+ *
+ * _`GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION` : 0x4004
+ *      This flag will enable notification from GuC to KMD via G2H message
+ *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon receiving the
+ *      same interrupt from the CS.
  */
 
 #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
@@ -162,6 +167,9 @@ enum  {
 #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 0x4003
 #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
 
+#define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
+#define GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
+
 /**
  * DOC: GuC Scheduling Policies KLVs
  *
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 67d8ce368486..388546be2ab6 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -76,6 +76,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
 	};
 
 	sched->ops = xe_ops;
+	sched->saved_timeout = timeout;
 	spin_lock_init(&sched->msg_lock);
 	INIT_LIST_HEAD(&sched->msgs);
 	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index 664c2db56af3..c677ad8d9da0 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -51,6 +51,11 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
 	drm_sched_tdr_queue_imm(&sched->base);
 }
 
+static inline void xe_sched_restore_timeout(struct xe_gpu_scheduler *sched)
+{
+	sched->base.timeout = sched->saved_timeout;
+}
+
 static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 {
 	struct drm_sched_job *s_job;
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
index 63d9bf92583c..62b4ca11d963 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -43,6 +43,8 @@ struct xe_sched_backend_ops {
 struct xe_gpu_scheduler {
 	/** @base: DRM GPU scheduler */
 	struct drm_gpu_scheduler		base;
+	/** @saved_timeout: scheduler timeout saved for post-TDR restore */
+	long				saved_timeout;
 	/** @ops: Xe scheduler ops */
 	const struct xe_sched_backend_ops	*ops;
 	/** @msgs: list of messages to be processed in @work_process_msg */
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 4023700ff2a9..e066a2f1fa0f 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -12,6 +12,7 @@
 
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_errors_abi.h"
+#include "abi/guc_klvs_abi.h"
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_gtt_defs.h"
 #include "regs/xe_guc_regs.h"
@@ -641,6 +642,16 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc)
 	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
 
+	/*
+	 * The Uncorrectable local error opt-in was added in GuC v70.34.0,
+	 * which maps to compatibility version v1.15.0.
+	 */
+	if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 15, 0)) {
+		u32 value = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION);
+
+		klvs[count++] = value;
+	}
+
 	if (supports_dynamic_ics(guc))
 		klvs[count++] = PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 21e0dad9a481..fe6a55fe7fb5 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1661,6 +1661,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		ret = xe_guc_exec_queue_memory_cat_error_handler(guc, payload,
 								 adj_len);
 		break;
+	case XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR:
+		ret = xe_guc_uncorrectable_error_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
 		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4b247a3019d2..8435beab9526 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1442,12 +1442,14 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
 {
 	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_gt *gt = guc_to_gt(guc);
 
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
+	xe_gt_assert(gt, !exec_queue_destroyed(q));
+	xe_gt_assert(gt, exec_queue_registered(q));
+	xe_gt_assert(gt, !exec_queue_pending_disable(q));
 
-	if (immediate && !xe_exec_queue_is_multi_queue_secondary(q))
+	if (immediate && !exec_queue_reset(q) &&
+	    !xe_exec_queue_is_multi_queue_secondary(q))
 		set_min_preemption_timeout(guc, q);
 	clear_exec_queue_enabled(q);
 	set_exec_queue_pending_disable(q);
@@ -1472,11 +1474,20 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(guc);
 	int err = -ETIME;
 	pid_t pid = -1;
-	bool wedged = false, skip_timeout_check;
-
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
+	bool signaled;
+	bool gt_reset_in_progress;
+	bool wedged = false, skip_timeout_check, reset_triggered;
+	bool cleanup_already_triggered;
 
 	primary = xe_exec_queue_multi_queue_primary(q);
+	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags);
+	reset_triggered = exec_queue_reset(q);
+	gt_reset_in_progress = work_busy(&q->gt->reset.worker);
+	cleanup_already_triggered = reset_triggered || exec_queue_destroyed(q) ||
+		exec_queue_pending_disable(q);
+
+	xe_gt_assert(guc_to_gt(guc), !cleanup_already_triggered || reset_triggered ||
+		     exec_queue_killed_or_banned_or_wedged(q));
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -1484,9 +1495,16 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
-	    vf_recovery(guc))
+	if (vf_recovery(guc) || (signaled && !reset_triggered)) {
+		/*
+		 * Restore timeout before returning so that a prior
+		 * xe_sched_tdr_queue_imm() (which sets sched->timeout=0)
+		 * does not cause an immediate re-fire of the TDR on the
+		 * next drm_sched_start_timeout() call.
+		 */
+		xe_sched_restore_timeout(sched);
 		return DRM_GPU_SCHED_STAT_NO_HANG;
+	}
 
 	/* Kill the run_job entry point */
 	if (xe_exec_queue_is_multi_queue(q))
@@ -1495,7 +1513,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		xe_sched_submission_stop(sched);
 
 	/* Must check all state after stopping scheduler */
-	skip_timeout_check = exec_queue_reset(q) ||
+	skip_timeout_check = reset_triggered ||
 		exec_queue_killed_or_banned_or_wedged(q);
 
 	/* Skip timeout check if multi-queue group is banned */
@@ -1521,6 +1539,18 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		xe_engine_snapshot_capture_for_queue(q);
 	}
 
+	/*
+	 * External error handlers mark the queue reset and rely on this timeout
+	 * callback for the common dump/cleanup path. Capture the first dump here
+	 * before any later wait/reset flow can race it away.
+	 */
+	if (reset_triggered && !gt_reset_in_progress &&
+	    !exec_queue_killed(q) && !xe->devcoredump.captured)
+		xe_devcoredump(q, job,
+			       "Externally reset job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
+			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
+			       q->guc->id, q->flags);
+
 	/*
 	 * Check if job is actually timed out, if so restart job execution and TDR
 	 */
@@ -1594,7 +1624,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		pid = q->vm->xef->pid;
 	}
 
-	if (!exec_queue_killed(q))
+	if (!exec_queue_killed(q) && !cleanup_already_triggered)
 		xe_gt_notice(guc_to_gt(guc),
 			     "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
 			     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
@@ -1602,7 +1632,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
-	if (!exec_queue_killed(q))
+	if (!gt_reset_in_progress && !exec_queue_killed(q) &&
+	    !cleanup_already_triggered)
 		xe_devcoredump(q, job,
 			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
 			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
@@ -1610,13 +1641,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
-	 * somethings has gone wrong and the GT needs a reset
+	 * somethings has gone wrong and the GT needs a reset.
+	 * However, if skip_timeout_check is already set (external reset via
+	 * UNE handler, kill, ban, or wedge), this failure is expected and the
+	 * kernel-job protection path must not be triggered.
 	 */
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
+	xe_gt_WARN(q->gt, !skip_timeout_check && (q->flags & EXEC_QUEUE_FLAG_KERNEL),
 		   "Kernel-submitted job timed out\n");
-	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
+	xe_gt_WARN(q->gt,
+		   !skip_timeout_check && (q->flags & EXEC_QUEUE_FLAG_VM &&
+					    !exec_queue_killed(q)),
 		   "VM job timed out on non-killed execqueue\n");
-	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
+	if (!wedged && !skip_timeout_check &&
+	    (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
 			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
 		if (!xe_sched_invalidate_job(job, 2)) {
 			xe_gt_reset_async(q->gt);
@@ -1629,12 +1666,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
 		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
 
+	xe_sched_restore_timeout(sched);
 	if (xe_exec_queue_is_multi_queue(q)) {
 		xe_guc_exec_queue_group_start(q);
-		xe_guc_exec_queue_group_trigger_cleanup(q);
+		if (!cleanup_already_triggered)
+			xe_guc_exec_queue_group_trigger_cleanup(q);
 	} else {
 		xe_sched_submission_start(sched);
-		xe_guc_exec_queue_trigger_cleanup(q);
+		if (!cleanup_already_triggered)
+			xe_guc_exec_queue_trigger_cleanup(q);
 	}
 
 	/*
@@ -1649,6 +1689,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * but there is not currently an easy way to do in DRM scheduler. With
 	 * some thought, do this in a follow up.
 	 */
+	xe_sched_restore_timeout(sched);
 	if (xe_exec_queue_is_multi_queue(q))
 		xe_guc_exec_queue_group_start(q);
 	else
@@ -1681,6 +1722,19 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 	kfree_rcu(ge, rcu);
 }
 
+static bool guc_exec_queue_in_sched_worker(struct xe_exec_queue *q)
+{
+	struct work_struct *work = current_work();
+
+	if (!work)
+		return false;
+
+	return work == &q->guc->sched.base.work_run_job ||
+		work == &q->guc->sched.base.work_free_job ||
+		work == &q->guc->sched.base.work_tdr.work ||
+		work == &q->guc->sched.work_process_msg;
+}
+
 static void __guc_exec_queue_destroy_async(struct work_struct *w)
 {
 	struct xe_guc_exec_queue *ge =
@@ -1701,11 +1755,14 @@ static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
+	bool force_async;
 
 	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
+	force_async = guc_exec_queue_in_sched_worker(q);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
+	if ((q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q)) &&
+	    !force_async)
 		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
 	else
 		queue_work(xe->destroy_wq, &q->guc->destroy_async);
@@ -3006,6 +3063,38 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 	return 0;
 }
 
+int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_exec_queue *q;
+	u32 guc_id;
+
+	if (unlikely(!len || len > 2))
+		return -EPROTO;
+
+	guc_id = msg[0];
+
+	if (guc_id == GUC_ID_UNKNOWN) {
+		xe_gt_err(gt, "GuC: Uncorrectable local error! guc_id=%d\n", guc_id);
+		return 0;
+	}
+
+	q = g2h_exec_queue_lookup(guc, guc_id);
+	if (unlikely(!q))
+		return -EPROTO;
+
+	xe_gt_err(gt,
+		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
+		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
+
+	trace_xe_guc_uncorrectable_error(q);
+
+	/* Treat the same as engine reset */
+	xe_guc_exec_queue_reset_trigger_cleanup(q);
+
+	return 0;
+}
+
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len)
 {
 	struct xe_gt *gt = guc_to_gt(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b3839a90c142..ccade320dc69 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -34,6 +34,7 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len);
+int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 750fa32c13b2..2fe8f89a1e34 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -213,6 +213,11 @@ DEFINE_EVENT(xe_exec_queue, xe_exec_queue_memory_cat_error,
 	     TP_ARGS(q)
 );
 
+DEFINE_EVENT(xe_exec_queue, xe_guc_uncorrectable_error,
+	     TP_PROTO(struct xe_exec_queue *q),
+	     TP_ARGS(q)
+);
+
 DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
 	     TP_PROTO(struct xe_exec_queue *q),
 	     TP_ARGS(q)
-- 
2.34.1

