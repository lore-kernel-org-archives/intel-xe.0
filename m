Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912A3CCD195
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 18:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBDD10E883;
	Wed,  8 Oct 2025 18:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5/k3woa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEB710E886
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759946709; x=1791482709;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0IG8YBkJ9I/igGq2At+wxPmS+b44nHVyNRuonPk382k=;
 b=U5/k3woaXNmzbKBNAedeR+C1f5ZPq6CLuNw5NS7c0agCeqj9xsg0OdkK
 QCM4G9JmshkMKTZLjm+H4xU01IkoZJIZiHDrqNEpcaVWOSGL9cTN2kvsJ
 Da5/YtYw+FulZRBkIVaQ0hZyZ09De+zY75UdpUuF3/ino+yWT6LcbeumX
 ge2COOdyPCgp8Sr6eLCY4hpRICqvlFQTEezoRm0JJEbMTOvbUO+bVxxx3
 xGmck3ahh5I3AP2XyWzhHIssUpRKeEtyGdqIyyfXajkVeqm8N1fs4UggO
 oQSHrw02m70g8mr9hi0fqTLcTLwRqHMnwTRy7rj4tShqIkADUNu7vddzF Q==;
X-CSE-ConnectionGUID: +r1fliGEQt684F/qLcsm1Q==
X-CSE-MsgGUID: +vjFO4nZQFmutWyA3RMvUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62067527"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62067527"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:07 -0700
X-CSE-ConnectionGUID: tdvzHJbjSGezQjLFfa5iJA==
X-CSE-MsgGUID: gjG27+sCTxGhBUKNjf8SNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="217593734"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 11:05:06 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 17/34] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
Date: Wed,  8 Oct 2025 11:04:43 -0700
Message-Id: <20251008180500.3261209-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251008180500.3261209-1-matthew.brost@intel.com>
References: <20251008180500.3261209-1-matthew.brost@intel.com>
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

If VF post-migration recovery is in progress, the recovery flow will
rebuild all GuC submission state. In this case, exit all waiters to
ensure that submission queue scheduling can also be paused. Avoid taking
any adverse actions after aborting the wait.

As part of waking up the GuC backend, suspend_wait can now return
-EAGAIN indicating the waiter should be retried. If the caller is
running on work item, that work item need to be requeued to avoid a
deadlock for the work item blocking the VF migration recovery work item.

v3:
 - Don't block in preempt fence work queue as this can interfere with VF
   post-migration work queue scheduling leading to deadlock (Testing)
 - Use xe_gt_recovery_inprogress (Michal)
v5:
 - Use static function for vf_recovery (Michal)
 - Add helper to wake CT waiters (Michal)
 - Move some code to following patch (Michal)
 - Adjust commit message to explain suspend_wait returning -EAGAIN (Michal)
 - Add kernel doc to suspend_wait around returning -EAGAIN
v7:
 - Add comment on why a shared wait queue is need on VFs (Michal)
 - Guard again suspend_wait signaling early on resfix donw (Tomasz)
v8:
 - Fix kernel doc (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  4 +
 drivers/gpu/drm/xe/xe_guc_ct.h           |  9 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 93 ++++++++++++++++++------
 drivers/gpu/drm/xe/xe_preempt_fence.c    | 11 +++
 5 files changed, 99 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 27b76cf9da89..282505fa1377 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -207,6 +207,9 @@ struct xe_exec_queue_ops {
 	 * call after suspend. In dma-fencing path thus must return within a
 	 * reasonable amount of time. -ETIME return shall indicate an error
 	 * waiting for suspend resulting in associated VM getting killed.
+	 * -EAGAIN return indicates the wait should be tried again, if the wait
+	 * is within a work item, the work item should be requeued as deadlock
+	 * avoidance mechanism.
 	 */
 	int (*suspend_wait)(struct xe_exec_queue *q);
 	/**
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 4d2fd81236a8..d86a9406a246 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -23,6 +23,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_gt_sriov_vf_types.h"
 #include "xe_guc.h"
+#include "xe_guc_ct.h"
 #include "xe_guc_hxg_helpers.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
@@ -727,6 +728,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
+		smp_wmb();	/* Ensure above write visable before wake */
+
+		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
 
 		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
 		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index d6c81325a76c..ae49364f6f28 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -72,4 +72,13 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 
 long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
 
+/**
+ * xe_guc_ct_wake_waiters() - GuC CT wake up waiters
+ * @ct: GuC CT object
+ */
+static inline void xe_guc_ct_wake_waiters(struct xe_guc_ct *ct)
+{
+	wake_up_all(&ct->wq);
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 59371b7cc8a4..7f0ea35f4f0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -27,7 +27,6 @@
 #include "xe_gt.h"
 #include "xe_gt_clock.h"
 #include "xe_gt_printk.h"
-#include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
@@ -702,6 +701,11 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
 	return (WQ_SIZE - q->guc->wqi_tail);
 }
 
+static bool vf_recovery(struct xe_guc *guc)
+{
+	return xe_gt_recovery_pending(guc_to_gt(guc));
+}
+
 static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -711,7 +715,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 
 #define AVAILABLE_SPACE \
 	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
-	if (wqi_size > AVAILABLE_SPACE) {
+	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
 try_again:
 		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
 		if (wqi_size > AVAILABLE_SPACE) {
@@ -910,9 +914,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	ret = wait_event_timeout(guc->ct.wq,
 				 (!exec_queue_pending_enable(q) &&
 				  !exec_queue_pending_disable(q)) ||
-					 xe_guc_read_stopped(guc),
+					 xe_guc_read_stopped(guc) ||
+					 vf_recovery(guc),
 				 HZ * 5);
-	if (!ret) {
+	if (!ret && !vf_recovery(guc)) {
 		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
@@ -1015,6 +1020,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
+
+	if (vf_recovery(guc))
+		return;
+
 	trace_xe_exec_queue_lr_cleanup(q);
 
 	if (!exec_queue_killed(q))
@@ -1047,7 +1056,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 		 */
 		ret = wait_event_timeout(guc->ct.wq,
 					 !exec_queue_pending_disable(q) ||
-					 xe_guc_read_stopped(guc), HZ * 5);
+					 xe_guc_read_stopped(guc) ||
+					 vf_recovery(guc), HZ * 5);
+		if (vf_recovery(guc))
+			return;
+
 		if (!ret) {
 			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
 				   q->guc->id);
@@ -1137,8 +1150,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
 
 	ret = wait_event_timeout(guc->ct.wq,
 				 !exec_queue_pending_enable(q) ||
-				 xe_guc_read_stopped(guc), HZ * 5);
-	if (!ret || xe_guc_read_stopped(guc)) {
+				 xe_guc_read_stopped(guc) ||
+				 vf_recovery(guc), HZ * 5);
+	if ((!ret && !vf_recovery(guc)) || xe_guc_read_stopped(guc)) {
 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
 		set_exec_queue_banned(q);
 		xe_gt_reset_async(q->gt);
@@ -1209,7 +1223,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
+	    vf_recovery(guc))
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
@@ -1261,7 +1276,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			ret = wait_event_timeout(guc->ct.wq,
 						 (!exec_queue_pending_enable(q) &&
 						  !exec_queue_pending_disable(q)) ||
-						 xe_guc_read_stopped(guc), HZ * 5);
+						 xe_guc_read_stopped(guc) ||
+						 vf_recovery(guc), HZ * 5);
+			if (vf_recovery(guc))
+				goto handle_vf_resume;
 			if (!ret || xe_guc_read_stopped(guc))
 				goto trigger_reset;
 
@@ -1286,7 +1304,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
 					 !exec_queue_pending_disable(q) ||
-					 xe_guc_read_stopped(guc), HZ * 5);
+					 xe_guc_read_stopped(guc) ||
+					 vf_recovery(guc), HZ * 5);
+		if (vf_recovery(guc))
+			goto handle_vf_resume;
 		if (!ret || xe_guc_read_stopped(guc)) {
 trigger_reset:
 			if (!ret)
@@ -1391,6 +1412,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * some thought, do this in a follow up.
 	 */
 	xe_sched_submission_start(sched);
+handle_vf_resume:
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
@@ -1487,11 +1509,24 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
 
 static void __suspend_fence_signal(struct xe_exec_queue *q)
 {
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
 	if (!q->guc->suspend_pending)
 		return;
 
 	WRITE_ONCE(q->guc->suspend_pending, false);
-	wake_up(&q->guc->suspend_wait);
+
+	/*
+	 * We use a GuC shared wait queue for VFs because the VF resfix start
+	 * interrupt must be able to wake all instances of suspend_wait. This
+	 * prevents the VF migration worker from being starved during
+	 * scheduling.
+	 */
+	if (IS_SRIOV_VF(xe))
+		wake_up_all(&guc->ct.wq);
+	else
+		wake_up(&q->guc->suspend_wait);
 }
 
 static void suspend_fence_signal(struct xe_exec_queue *q)
@@ -1512,8 +1547,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
 	    exec_queue_enabled(q)) {
-		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
-			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
+		wait_event(guc->ct.wq, vf_recovery(guc) ||
+			   ((q->guc->resume_time != RESUME_PENDING ||
+			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
 
 		if (!xe_guc_read_stopped(guc)) {
 			s64 since_resume_ms =
@@ -1640,7 +1676,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	q->entity = &ge->entity;
 
-	if (xe_guc_read_stopped(guc))
+	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
 		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
@@ -1786,6 +1822,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
 	/*
@@ -1793,11 +1830,21 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 * suspend_pending upon kill but to be paranoid but races in which
 	 * suspend_pending is set after kill also check kill here.
 	 */
-	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
-					       !READ_ONCE(q->guc->suspend_pending) ||
-					       exec_queue_killed(q) ||
-					       xe_guc_read_stopped(guc),
-					       HZ * 5);
+#define WAIT_COND \
+	(!READ_ONCE(q->guc->suspend_pending) ||	exec_queue_killed(q) || \
+	 xe_guc_read_stopped(guc))
+
+retry:
+	if (IS_SRIOV_VF(xe))
+		ret = wait_event_interruptible_timeout(guc->ct.wq, WAIT_COND ||
+						       vf_recovery(guc),
+						       HZ * 5);
+	else
+		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
+						       WAIT_COND, HZ * 5);
+
+	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
+		return -EAGAIN;
 
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
@@ -1805,8 +1852,13 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 			   q->guc->id);
 		/* XXX: Trigger GT reset? */
 		return -ETIME;
+	} else if (IS_SRIOV_VF(xe) && !WAIT_COND) {
+		/* Corner case on RESFIX DONE where vf_recovery() changes */
+		goto retry;
 	}
 
+#undef WAIT_COND
+
 	return ret < 0 ? ret : 0;
 }
 
@@ -1905,8 +1957,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
-	if (xe_gt_WARN_ON(guc_to_gt(guc),
-			  xe_gt_sriov_vf_recovery_pending(guc_to_gt(guc))))
+	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
 		return 0;
 
 	if (!guc->submission_state.initialized)
diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
index 83fbeea5aa20..7f587ca3947d 100644
--- a/drivers/gpu/drm/xe/xe_preempt_fence.c
+++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
@@ -8,6 +8,8 @@
 #include <linux/slab.h>
 
 #include "xe_exec_queue.h"
+#include "xe_gt_printk.h"
+#include "xe_guc_exec_queue_types.h"
 #include "xe_vm.h"
 
 static void preempt_fence_work_func(struct work_struct *w)
@@ -22,6 +24,15 @@ static void preempt_fence_work_func(struct work_struct *w)
 	} else if (!q->ops->reset_status(q)) {
 		int err = q->ops->suspend_wait(q);
 
+		if (err == -EAGAIN) {
+			xe_gt_dbg(q->gt, "PREEMPT FENCE RETRY guc_id=%d",
+				  q->guc->id);
+			queue_work(q->vm->xe->preempt_fence_wq,
+				   &pfence->preempt_work);
+			dma_fence_end_signalling(cookie);
+			return;
+		}
+
 		if (err)
 			dma_fence_set_error(&pfence->base, err);
 	} else {
-- 
2.34.1

