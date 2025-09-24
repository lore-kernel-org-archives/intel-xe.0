Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52926CAC5B7
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31AE10E6A2;
	Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvDIEGgq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F7E10E690
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676570; x=1790212570;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=rFDeuCS9LJZe9T+zSUte7QVMmgDxIcmPmGLR1f3lu6Q=;
 b=TvDIEGgq2Q7WBlEg1du99LY53ZqudxjDB529XfXQHJ4yeA3oqcGNgjNK
 rZZft+Qz5V14WmgsDNXSKmNUS4FicOMVPnhvZBgrxuLAHEbe9yAE7RUm7
 cZeWVZRi1jeGwA++N6nh+OnlcVLj8Wq5HnQ7BAeuRr+6l2XcUD6j6+oRw
 dWOSKysi6hSRCO1/7lmK49ySXsJiRGFKgVquIGmgqFZW+4E7hsKPv2gqj
 3uyihRuaAlQ8aUPjopBoE4NvvRJvKy0cgubHK97sBY83sKYYIgLonu2gQ
 gyWd4L69jeinIMR3JQvEBrRR/iUn92MlhQjsI86OMNKYZWkoB+rvfpPtK A==;
X-CSE-ConnectionGUID: waNSbvr3Sd6Xl2N1vm374g==
X-CSE-MsgGUID: eo/O29vOSHC2wfLObVMLxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908267"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
X-CSE-ConnectionGUID: MKowVzyuSKSmWDeaVlUcKg==
X-CSE-MsgGUID: dKBtzJ7eQBiDqzOJTWMr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841798"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 18/34] drm/xe/vf: Wakeup in GuC backend on VF post
 migration recovery
Date: Tue, 23 Sep 2025 18:15:45 -0700
Message-Id: <20250924011601.888293-19-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  3 ++
 drivers/gpu/drm/xe/xe_guc_submit.c  | 51 +++++++++++++++++++++--------
 2 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index b8e02bba7360..a96e0dd65bc1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -815,6 +815,9 @@ static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
+		smp_wmb();	/* Ensure above write visable before wake */
+
+		wake_up_all(&gt->uc.guc.ct.wq);
 
 		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
 		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b82976f031e5..52b86cab4ec5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -984,6 +984,9 @@ static u32 wq_space_until_wrap(struct xe_exec_queue *q)
 	return (WQ_SIZE - q->guc->wqi_tail);
 }
 
+#define vf_recovery(guc)	\
+	xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))
+
 static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -993,7 +996,7 @@ static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
 
 #define AVAILABLE_SPACE \
 	CIRC_SPACE(q->guc->wqi_tail, q->guc->wqi_head, WQ_SIZE)
-	if (wqi_size > AVAILABLE_SPACE) {
+	if (wqi_size > AVAILABLE_SPACE && !vf_recovery(guc)) {
 try_again:
 		q->guc->wqi_head = parallel_read(xe, map, wq_desc.head);
 		if (wqi_size > AVAILABLE_SPACE) {
@@ -1192,9 +1195,10 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
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
@@ -1297,6 +1301,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
+
+	if (vf_recovery(guc))
+		return;
+
 	trace_xe_exec_queue_lr_cleanup(q);
 
 	if (!exec_queue_killed(q))
@@ -1329,7 +1337,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
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
@@ -1419,8 +1431,9 @@ static void enable_scheduling(struct xe_exec_queue *q)
 
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
@@ -1491,7 +1504,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags) ||
+	    vf_recovery(guc))
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
@@ -1543,7 +1557,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
 
@@ -1568,7 +1585,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1673,6 +1693,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * some thought, do this in a follow up.
 	 */
 	xe_sched_submission_start(sched);
+handle_vf_resume:
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
@@ -1794,8 +1815,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 
 	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
 	    exec_queue_enabled(q)) {
-		wait_event(guc->ct.wq, (q->guc->resume_time != RESUME_PENDING ||
-			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q));
+		wait_event(guc->ct.wq, vf_recovery(guc) ||
+			   ((q->guc->resume_time != RESUME_PENDING ||
+			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
 
 		if (!xe_guc_read_stopped(guc)) {
 			s64 since_resume_ms =
@@ -1922,7 +1944,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	q->entity = &ge->entity;
 
-	if (xe_guc_read_stopped(guc))
+	if (xe_guc_read_stopped(guc) || vf_recovery(guc))
 		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
@@ -2075,12 +2097,15 @@ static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 	 * suspend_pending upon kill but to be paranoid but races in which
 	 * suspend_pending is set after kill also check kill here.
 	 */
+retry:
 	ret = wait_event_interruptible_timeout(q->guc->suspend_wait,
 					       !READ_ONCE(q->guc->suspend_pending) ||
 					       exec_queue_killed(q) ||
 					       xe_guc_read_stopped(guc),
 					       HZ * 5);
 
+	if (vf_recovery(guc) && !xe_device_wedged((guc_to_xe(guc))))
+		goto retry;
 	if (!ret) {
 		xe_gt_warn(guc_to_gt(guc),
 			   "Suspend fence, guc_id=%d, failed to respond",
@@ -2187,7 +2212,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
-	if (WARN_ON_ONCE(xe_gt_sriov_vf_recovery_inprogress(guc_to_gt(guc))))
+	if (WARN_ON_ONCE(vf_recovery(guc)))
 		return 0;
 
 	if (!guc->submission_state.initialized)
-- 
2.34.1

