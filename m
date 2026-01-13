Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 112CBD29DCA
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 04:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C967710E2EB;
	Tue, 13 Jan 2026 04:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvrxNroB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6334610E2EB
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 04:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768278558; x=1799814558;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBMyv5Uo2gUQGoL0MQL71OKX7XZrx6c9TQsGnxxfLwY=;
 b=bvrxNroB64zdWhKc3ME+2xXNC4IrZi1eHwQdT5vhq2ysPo7DbpJ2exXz
 KZpzR/oKPIpO+8RK1W2unk6AZNDQ06W3/hpyq7rtlZnpyVEw4ds3cL922
 vMFre4DkRt+EFfZD29M0IMNBsSWUv/7we8cGEb9d2jgf54L3yx3MMrTxY
 +hLxYVj9tzbC8sHCdSQhJ6Q2gvZWhr4GDo0WJ+ExEtqIbiPBVC5BE4q/F
 9vM7a7YX6tp75CFoJimh0fe5don3bQdU5drSuTo276JXiuAz4iVG7CJhe
 C6vmvNAfVkoEzQ/4LUG/EUk7Akoh6lY8pCvwN66ZqoO3+T5cEDU/C7/DB w==;
X-CSE-ConnectionGUID: A4CTVnFmQFqkqlsjpLwd/Q==
X-CSE-MsgGUID: BtKktylxQcy8lyi3Fss1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="72141440"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="72141440"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:29:18 -0800
X-CSE-ConnectionGUID: a+V1BpAVTwC/qhna0w3dSw==
X-CSE-MsgGUID: p9UrZ0l2Qx63+oflAo6QIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208793272"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 20:29:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: niranjana.vishwanathapura@intel.com
Subject: [PATCH v2 1/2] drm/xe: Ban entire multi-queue group on any job timeout
Date: Mon, 12 Jan 2026 20:29:12 -0800
Message-Id: <20260113042913.3517169-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113042913.3517169-1-matthew.brost@intel.com>
References: <20260113042913.3517169-1-matthew.brost@intel.com>
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

In multi-queue mode, we only have control over the entire group, so we
cannot ban individual queues or signal fences until the whole group is
removed from hardware. Implement banning of the entire group if any job
within it times out.

v2:
 - Fix CT lock inversion (Niranjana)
 - Initialize new queues in group to stopped

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 103 +++++++++++++++++------
 2 files changed, 81 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 5fc516b0bb77..562ea75891ba 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -66,6 +66,8 @@ struct xe_exec_queue_group {
 	bool sync_pending;
 	/** @banned: Group banned */
 	bool banned;
+	/** @stopped: Group is stopped, protected by list_lock */
+	bool stopped;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index be8fa76baf1d..a11f3e572d25 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -558,6 +558,57 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
+static void xe_guc_exec_queue_group_stop(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_exec_queue *eq, *next;
+	LIST_HEAD(tmp);
+
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
+		     xe_exec_queue_is_multi_queue(q));
+
+	mutex_lock(&group->list_lock);
+	group->stopped = true;
+	list_for_each_entry_safe(eq, next, &group->list, multi_queue.link)
+		if (xe_exec_queue_get_unless_zero(eq))
+			list_move_tail(&eq->multi_queue.link, &tmp);
+	mutex_unlock(&group->list_lock);
+
+	/* We cannot stop under list lock without getting inversions */
+	xe_sched_submission_stop(&primary->guc->sched);
+	list_for_each_entry(eq, &tmp, multi_queue.link)
+		xe_sched_submission_stop(&eq->guc->sched);
+
+	mutex_lock(&group->list_lock);
+	list_for_each_entry_safe(eq, next, &tmp, multi_queue.link) {
+		/* Corner where we got banned while stopping */
+		if (READ_ONCE(group->banned))
+			xe_guc_exec_queue_trigger_cleanup(eq);
+		list_move_tail(&eq->multi_queue.link, &group->list);
+		xe_exec_queue_put(eq);
+	}
+	mutex_unlock(&group->list_lock);
+}
+
+static void xe_guc_exec_queue_group_start(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_exec_queue *eq;
+
+	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)),
+		     xe_exec_queue_is_multi_queue(q));
+
+	xe_sched_submission_start(&primary->guc->sched);
+
+	mutex_lock(&group->list_lock);
+	group->stopped = false;
+	list_for_each_entry(eq, &group->list, multi_queue.link)
+		xe_sched_submission_start(&eq->guc->sched);
+	mutex_unlock(&group->list_lock);
+}
+
 static void xe_guc_exec_queue_group_trigger_cleanup(struct xe_exec_queue *q)
 {
 	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
@@ -1411,7 +1462,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct drm_sched_job *tmp_job;
-	struct xe_exec_queue *q = job->q;
+	struct xe_exec_queue *q = job->q, *primary;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
@@ -1422,6 +1473,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
+	if (xe_exec_queue_is_multi_queue_secondary(q))
+		primary = xe_exec_queue_multi_queue_primary(q);
+	else
+		primary = q;
+
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled. Add back to pending
@@ -1433,7 +1489,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
-	xe_sched_submission_stop(sched);
+	if (xe_exec_queue_is_multi_queue(q))
+		xe_guc_exec_queue_group_stop(q);
+	else
+		xe_sched_submission_stop(sched);
 
 	/* Must check all state after stopping scheduler */
 	skip_timeout_check = exec_queue_reset(q) ||
@@ -1448,14 +1507,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	if (xe_exec_queue_is_lr(q))
 		xe_gt_assert(guc_to_gt(guc), skip_timeout_check);
 
-	/*
-	 * FIXME: In multi-queue scenario, the TDR must ensure that the whole
-	 * multi-queue group is off the HW before signaling the fences to avoid
-	 * possible memory corruptions. This means disabling scheduling on the
-	 * primary queue before or during the secondary queue's TDR. Need to
-	 * implement this in least obtrusive way.
-	 */
-
 	/*
 	 * If devcoredump not captured and GuC capture for the job is not ready
 	 * do manual capture first and decide later if we need to use it
@@ -1482,10 +1533,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	set_exec_queue_banned(q);
 
 	/* Kick job / queue off hardware */
-	if (!wedged && (exec_queue_enabled(q) || exec_queue_pending_disable(q))) {
+	if (!wedged && (exec_queue_enabled(primary) ||
+			exec_queue_pending_disable(primary))) {
 		int ret;
 
-		if (exec_queue_reset(q))
+		if (exec_queue_reset(primary))
 			err = -EIO;
 
 		if (xe_uc_fw_is_running(&guc->fw)) {
@@ -1494,8 +1546,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			 * modifying state
 			 */
 			ret = wait_event_timeout(guc->ct.wq,
-						 (!exec_queue_pending_enable(q) &&
-						  !exec_queue_pending_disable(q)) ||
+						 (!exec_queue_pending_enable(primary) &&
+						  !exec_queue_pending_disable(primary)) ||
 						 xe_guc_read_stopped(guc) ||
 						 vf_recovery(guc), HZ * 5);
 			if (vf_recovery(guc))
@@ -1503,7 +1555,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			if (!ret || xe_guc_read_stopped(guc))
 				goto trigger_reset;
 
-			disable_scheduling(q, skip_timeout_check);
+			disable_scheduling(primary, skip_timeout_check);
 		}
 
 		/*
@@ -1517,7 +1569,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
 					 !xe_uc_fw_is_running(&guc->fw) ||
-					 !exec_queue_pending_disable(q) ||
+					 !exec_queue_pending_disable(primary) ||
 					 xe_guc_read_stopped(guc) ||
 					 vf_recovery(guc), HZ * 5);
 		if (vf_recovery(guc))
@@ -1527,11 +1579,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			if (!ret)
 				xe_gt_warn(guc_to_gt(guc),
 					   "Schedule disable failed to respond, guc_id=%d",
-					   q->guc->id);
-			xe_devcoredump(q, job,
+					   primary->guc->id);
+			xe_devcoredump(primary, job,
 				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
-				       q->guc->id, ret, xe_guc_read_stopped(guc));
-			xe_gt_reset_async(q->gt);
+				       primary->guc->id, ret, xe_guc_read_stopped(guc));
+			xe_gt_reset_async(primary->gt);
 			xe_sched_tdr_queue_imm(sched);
 			goto rearm;
 		}
@@ -1577,12 +1629,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
 		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
 
-	xe_sched_submission_start(sched);
-
-	if (xe_exec_queue_is_multi_queue(q))
+	if (xe_exec_queue_is_multi_queue(q)) {
+		xe_guc_exec_queue_group_start(q);
 		xe_guc_exec_queue_group_trigger_cleanup(q);
-	else
+	} else {
+		xe_sched_submission_start(sched);
 		xe_guc_exec_queue_trigger_cleanup(q);
+	}
 
 	/*
 	 * We want the job added back to the pending list so it gets freed; this
@@ -1962,6 +2015,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 		INIT_LIST_HEAD(&q->multi_queue.link);
 		mutex_lock(&group->list_lock);
+		if (group->stopped)
+			WRITE_ONCE(q->guc->sched.base.pause_submit, true);
 		list_add_tail(&q->multi_queue.link, &group->list);
 		mutex_unlock(&group->list_lock);
 	}
-- 
2.34.1

