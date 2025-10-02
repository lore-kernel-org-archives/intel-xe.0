Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BECCCD194
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3696E10E7A7;
	Thu,  2 Oct 2025 05:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjZR9q2v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1EC310E798
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384449; x=1790920449;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Tq9AvbFaM3+cxfxZSgDeB7YTPPM8iaD/iQI31cAy13s=;
 b=FjZR9q2visLKcmXeC1eWnl62+py4H06l+eltJapMd1rwKT1jsJNtcAS5
 hwM+na+uF5u1CkzaaTA5zouiPE6DQ+B24NlLq4FH3ckkTZVwKLKPz626D
 KxbJrvXJqu6COMAxqdN7c64mlL1A5R0jZYFYOviyvZTkzCtQQSpPSO1pS
 oR/KnKrt4AX3uxCw4sANDTuNZd7Lnf8M5lLBstOsmXDUiIA6wGm2TqlwN
 AgBJTIktJr2qHszLoAoz7I14ZZ96TuiVBRRFXUkCBGNzifW+Npvkcmbne
 cNdo3BIbUGBioPDQOu7Bsua3F5Eo4Qr4GW5slsxLoUU9H/+ZPIdhB6OFw g==;
X-CSE-ConnectionGUID: hJeZIqnaTc6kZz9MNWBnNA==
X-CSE-MsgGUID: dI38TX4vSg6BFjCn/PicIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304511"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304511"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
X-CSE-ConnectionGUID: 9deTGq2aT7ygEsPh71e7+A==
X-CSE-MsgGUID: 9nB7Mnq8THa+rO7Srh9OIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083543"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 18/34] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
Date: Wed,  1 Oct 2025 22:53:46 -0700
Message-Id: <20251002055402.1865880-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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
rebuild all GuC submission state.  In this case, exit all waiters to
ensure that submission queue scheduling can also be paused. Avoid taking
any adverse actions after aborting the wait.

v3:
 - Don't block in preempt fence work queue as this can interfere with VF
   post-migration work queue scheduling leading to deadlock (Testing)
 - Use xe_gt_recovery_inprogress (Michal)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |  3 +
 drivers/gpu/drm/xe/xe_guc_submit.c    | 79 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_preempt_fence.c | 11 ++++
 3 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 6ba8b5703ff2..e8fd2fe98076 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -741,6 +741,9 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
+		smp_wmb();	/* Ensure above write visable before wake */
+
+		wake_up_all(&gt->uc.guc.ct.wq);
 
 		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
 		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b82976f031e5..9320fe9fbb29 100644
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
@@ -984,6 +983,9 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
 	return (WQ_SIZE - q->guc->wqi_tail);
 }
 
+#define vf_recovery(guc)	\
+	xe_gt_recovery_inprogress(guc_to_gt(guc))
+
 static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -993,7 +995,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 
 #define AVAILABLE_SPACE \
 	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
-	if (wqi_size > AVAILABLE_SPACE) {
+	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
 try_again:
 		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
 		if (wqi_size > AVAILABLE_SPACE) {
@@ -1192,9 +1194,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
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
@@ -1297,6 +1300,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
+
+	if (vf_recovery(guc))
+		return;
+
 	trace_xe_exec_queue_lr_cleanup(q);
 
 	if (!exec_queue_killed(q))
@@ -1329,7 +1336,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
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
@@ -1419,8 +1430,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
 
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
@@ -1491,7 +1503,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
+	    vf_recovery(guc))
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
@@ -1543,7 +1556,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
 
@@ -1568,7 +1584,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1673,6 +1692,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * some thought, do this in a follow up.
 	 */
 	xe_sched_submission_start(sched);
+handle_vf_resume:
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
@@ -1769,11 +1789,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
 
 static void __suspend_fence_signal(struct xe_exec_queue *q)
 {
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
 	if (!q->guc->suspend_pending)
 		return;
 
 	WRITE_ONCE(q->guc->suspend_pending, false);
-	wake_up(&q->guc->suspend_wait);
+	if (IS_SRIOV_VF(xe))
+		wake_up_all(&guc->ct.wq);
+	else
+		wake_up(&q->guc->suspend_wait);
 }
 
 static void suspend_fence_signal(struct xe_exec_queue *q)
@@ -1794,8 +1820,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
 	    exec_queue_enabled(q)) {
-		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
-			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
+		wait_event(guc->ct.wq, vf_recovery(guc) ||
+			   ((q->guc->resume_time != RESUME_PENDING ||
+			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
 
 		if (!xe_guc_read_stopped(guc)) {
 			s64 since_resume_ms =
@@ -1922,7 +1949,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	q->entity = &ge->entity;
 
-	if (xe_guc_read_stopped(guc))
+	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
 		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
@@ -2068,6 +2095,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
 	int ret;
 
 	/*
@@ -2075,11 +2103,22 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 * suspend_pending upon kill but to be paranoid but races in which
 	 * suspend_pending is set after kill also check kill here.
 	 */
-	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
-					       !READ_ONCE(q->guc->suspend_pending) ||
-					       exec_queue_killed(q) ||
-					       xe_guc_read_stopped(guc),
-					       HZ * 5);
+	if (IS_SRIOV_VF(xe))
+		ret = wait_event_interruptible_timeout(guc->ct.wq,
+						       !READ_ONCE(q->guc->suspend_pending) ||
+						       exec_queue_killed(q) ||
+						       xe_guc_read_stopped(guc) ||
+						       vf_recovery(guc),
+						       HZ * 5);
+	else
+		ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
+						       !READ_ONCE(q->guc->suspend_pending) ||
+						       exec_queue_killed(q) ||
+						       xe_guc_read_stopped(guc),
+						       HZ * 5);
+
+	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
+		return -EAGAIN;
 
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
@@ -2187,7 +2226,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
-	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
+	if (WARN_ON_ONCE(vf_recovery(guc)))
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

