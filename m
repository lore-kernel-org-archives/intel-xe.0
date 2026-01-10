Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF9CD277CD
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 01:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480F10E2CE;
	Sat, 10 Jan 2026 01:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Auz5xl5P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6178910E234
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 01:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768008469; x=1799544469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jJjxn5EZ9NvCSpVshoL8CkMSwwBLL9GOuxACLe7J7e0=;
 b=Auz5xl5Py1EFhBxNW9a+LOegYgeju1ce9VHawYceCl/wmrcBt5FxAoxq
 Own2a6avkVhgdpuO0fXqPMPPJHfLwTWx/FILsjq12R5MIsa+SFrx1y9uu
 8Dpi2IuB7/KACOYly4Brwq5xgDxwhaerC7X7AUHoZ22SiXyuikGncRkpH
 mjK08D/rvTIsN3lLXPV57BmfsonxzkVqO+HxTaOuPei6akEcRloBAapBY
 QR2cOlylm4KyGioAYZ0T5YzaBYtaQ/vkkYt/NSffHT+qVHP/+XOyrb/4/
 jhxl4FCepCkMIsk3LnVxvlPV9bsgn8bT5j2r4Z3qpmzPkKgvjLhl5aVsY w==;
X-CSE-ConnectionGUID: qgFkom5MS9G5kBB+DyWV2w==
X-CSE-MsgGUID: rFGK/QEMT32PFSHkz8oDjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73021819"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="73021819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:47 -0800
X-CSE-ConnectionGUID: nDNvtFICSY6a9Y1zjDd5qw==
X-CSE-MsgGUID: oR0QW5rQTfeaAHtUKjcotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208132051"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 4/7] drm/xe: Do not deregister queues in TDR
Date: Fri,  9 Jan 2026 17:27:36 -0800
Message-Id: <20260110012739.2888434-5-matthew.brost@intel.com>
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

Deregistering queues in the TDR introduces unnecessary complexity,
requiring reference-counting techniques to function correctly,
particularly to prevent use-after-free (UAF) issues while a
deregistration initiated from the TDR is in progress.

All that's needed in the TDR is to kick the queue off the hardware,
which is achieved by disabling scheduling. Queue deregistration should
be handled in a single, well-defined point in the cleanup path, tied to
the queue's reference count.

v4:
 - Explain why extra ref were needed prior to this patch (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 70 +++++-------------------------
 1 file changed, 10 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index aafd8d05f38a..0a69022bd252 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -72,10 +72,9 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 #define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
-#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
-#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 12)
-#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 13)
-#define EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND	(1 << 14)
+#define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 11)
+#define EXEC_QUEUE_STATE_PENDING_TDR_EXIT	(1 << 12)
+#define EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND	(1 << 13)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -222,21 +221,6 @@ static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
 }
 
-static bool exec_queue_extra_ref(struct xe_exec_queue *q)
-{
-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
-}
-
-static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
-{
-	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
-}
-
-static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
-{
-	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
-}
-
 static bool exec_queue_pending_resume(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
@@ -1538,28 +1522,6 @@ static void disable_scheduling(struct xe_exec_queue *q, bool immediate)
 			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
 }
 
-static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
-{
-	u32 action[] = {
-		XE_GUC_ACTION_DEREGISTER_CONTEXT,
-		q->guc->id,
-	};
-
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
-
-	set_exec_queue_destroyed(q);
-	trace_xe_exec_queue_deregister(q);
-
-	if (xe_exec_queue_is_multi_queue_secondary(q))
-		handle_deregister_done(guc, q);
-	else
-		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
-			       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
-}
-
 static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
@@ -1575,6 +1537,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	bool wedged = false, skip_timeout_check;
 
 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
+	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -1591,8 +1554,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	/* Must check all state after stopping scheduler */
 	skip_timeout_check = exec_queue_reset(q) ||
-		exec_queue_killed_or_banned_or_wedged(q) ||
-		exec_queue_destroyed(q);
+		exec_queue_killed_or_banned_or_wedged(q);
 
 	/* Skip timeout check if multi-queue group is banned */
 	if (xe_exec_queue_is_multi_queue(q) &&
@@ -1632,13 +1594,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
 	/* Engine state now stable, disable scheduling to check timestamp */
-	if (!wedged && exec_queue_registered(q)) {
+	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
 		int ret;
 
 		if (exec_queue_reset(q))
 			err = -EIO;
 
-		if (!exec_queue_destroyed(q) && xe_uc_fw_is_running(&guc->fw)) {
+		if (xe_uc_fw_is_running(&guc->fw)) {
 			/*
 			 * Wait for any pending G2H to flush out before
 			 * modifying state
@@ -1688,8 +1650,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			xe_devcoredump(q, job,
 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
 				       q->guc->id, ret, xe_guc_read_stopped(guc));
-			set_exec_queue_extra_ref(q);
-			xe_exec_queue_get(q);	/* GT reset owns this */
 			set_exec_queue_banned(q);
 			xe_gt_reset_async(q->gt);
 			xe_sched_tdr_queue_imm(sched);
@@ -1742,13 +1702,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		}
 	}
 
-	/* Finish cleaning up exec queue via deregister */
 	set_exec_queue_banned(q);
-	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
-		set_exec_queue_extra_ref(q);
-		xe_exec_queue_get(q);
-		__deregister_exec_queue(guc, q);
-	}
 
 	/* Mark all outstanding jobs as bad, thus completing them */
 	xe_sched_job_set_error(job, err);
@@ -2419,7 +2373,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
-		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
+		if (xe_exec_queue_is_lr(q))
 			xe_exec_queue_put(q);
 		else if (exec_queue_destroyed(q))
 			__guc_exec_queue_destroy(guc, q);
@@ -2553,11 +2507,7 @@ static void guc_exec_queue_revert_pending_state_change(struct xe_guc *guc,
 
 	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
 		clear_exec_queue_destroyed(q);
-		if (exec_queue_extra_ref(q))
-			xe_exec_queue_put(q);
-		else
-			q->guc->needs_cleanup = true;
-		clear_exec_queue_extra_ref(q);
+		q->guc->needs_cleanup = true;
 		xe_gt_dbg(guc_to_gt(guc), "Replay CLEANUP - guc_id=%d",
 			  q->guc->id);
 	}
@@ -3037,7 +2987,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 
 	clear_exec_queue_registered(q);
 
-	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
+	if (xe_exec_queue_is_lr(q))
 		xe_exec_queue_put(q);
 	else
 		__guc_exec_queue_destroy(guc, q);
-- 
2.34.1

