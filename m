Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA96C98302
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 22:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4021410E08E;
	Fri, 16 Jan 2026 22:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SVZKpJ3S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B888F10E08E
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 22:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768601020; x=1800137020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i83VF3hgcaR9b98vFMO47TcX//+Ackq9xIjzFHTZ6AI=;
 b=SVZKpJ3Ssc6zfaCu5/+0dVS8sUvucNBrj9jL5dzkDrNZnFymUbr5lBaf
 Tkn//tqIXu4xpztaMvHl/2NNfVjDOuXkIeHyQUWsq1gOTVgimaUm4jOj3
 ImsCX6b8yd3SF14m27dfS6o/0nlTRID9ZQLgQmotf5+bfAC8JhsIbnFcf
 bjYob8e0oTZxcnBG5fSARwkT5nfoyVDumSYXKjeWhkjTnGQ9etD8TOjS5
 /oWmxHU/nE7UeRsEqeywH/65791QW3H4peUzX4507pQcK7NKtaca+PM+N
 4fNAy0ZBnH3dnY5a+rCjJlLkR6ChA2p8KCZ4MZxjpH5Ylqn1TvHay9xPn g==;
X-CSE-ConnectionGUID: gq275IpFQCW1NEj3lr6mHw==
X-CSE-MsgGUID: ulbnoJDDScO1teqEAAh8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="81035379"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="81035379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:03:40 -0800
X-CSE-ConnectionGUID: hmuWJH6JR6SJxeZKSt5I2A==
X-CSE-MsgGUID: TMwhidrxSwS48XcdEJJbVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204959420"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:03:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Ban entire multi-queue group on any job timeout
Date: Fri, 16 Jan 2026 14:03:32 -0800
Message-Id: <20260116220333.861850-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116220333.861850-1-matthew.brost@intel.com>
References: <20260116220333.861850-1-matthew.brost@intel.com>
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
 - Fix lock inversion (Niranjana)
 - Initialize new queues in group to stopped
v3:
 - Blindly call xe_exec_queue_multi_queue_primary (Niranjana)
 - More comments around temporary list when stopping (Niranjana)
 - Restart group on false timeout (Niranjana)

Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 120 ++++++++++++++++++-----
 2 files changed, 97 insertions(+), 25 deletions(-)

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
index 1b2f66f4425b..bd5e40b3468e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -556,6 +556,72 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
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
+
+	/*
+	 * Stop all future queues being from executing while group is stoppped.
+	 */
+	group->stopped = true;
+
+	list_for_each_entry_safe(eq, next, &group->list, multi_queue.link)
+		/*
+		 * Refcount prevents an attempted removal from &group->list,
+		 * temporary list allows safe iteration after dropping
+		 * &group->list_lock.
+		 */
+		if (xe_exec_queue_get_unless_zero(eq))
+			list_move_tail(&eq->multi_queue.link, &tmp);
+
+	mutex_unlock(&group->list_lock);
+
+	/* We cannot stop under list lock without getting inversions */
+	xe_sched_submission_stop(&primary->guc->sched);
+	list_for_each_entry(eq, &tmp, multi_queue.link)
+		xe_sched_submission_stop(&eq->guc->sched);
+
+	mutex_lock(&group->list_lock);
+	list_for_each_entry_safe(eq, next, &tmp, multi_queue.link) {
+		/*
+		 * Corner where we got banned while stopping and not on
+		 * &group->list
+		 */
+		if (READ_ONCE(group->banned))
+			xe_guc_exec_queue_trigger_cleanup(eq);
+
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
@@ -1414,7 +1480,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct drm_sched_job *tmp_job;
-	struct xe_exec_queue *q = job->q;
+	struct xe_exec_queue *q = job->q, *primary;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	const char *process_name = "no process";
@@ -1425,6 +1491,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
 
+	primary = xe_exec_queue_multi_queue_primary(q);
+
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled. Add back to pending
@@ -1436,7 +1504,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
-	xe_sched_submission_stop(sched);
+	if (xe_exec_queue_is_multi_queue(q))
+		xe_guc_exec_queue_group_stop(q);
+	else
+		xe_sched_submission_stop(sched);
 
 	/* Must check all state after stopping scheduler */
 	skip_timeout_check = exec_queue_reset(q) ||
@@ -1451,14 +1522,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1485,10 +1548,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1497,8 +1561,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1506,7 +1570,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 			if (!ret || xe_guc_read_stopped(guc))
 				goto trigger_reset;
 
-			disable_scheduling(q, skip_timeout_check);
+			disable_scheduling(primary, skip_timeout_check);
 		}
 
 		/*
@@ -1520,7 +1584,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		smp_rmb();
 		ret = wait_event_timeout(guc->ct.wq,
 					 !xe_uc_fw_is_running(&guc->fw) ||
-					 !exec_queue_pending_disable(q) ||
+					 !exec_queue_pending_disable(primary) ||
 					 xe_guc_read_stopped(guc) ||
 					 vf_recovery(guc), HZ * 5);
 		if (vf_recovery(guc))
@@ -1530,11 +1594,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1580,12 +1644,13 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1599,7 +1664,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * but there is not currently an easy way to do in DRM scheduler. With
 	 * some thought, do this in a follow up.
 	 */
-	xe_sched_submission_start(sched);
+	if (xe_exec_queue_is_multi_queue(q))
+		xe_guc_exec_queue_group_start(q);
+	else
+		xe_sched_submission_start(sched);
 handle_vf_resume:
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
@@ -1965,6 +2033,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 		INIT_LIST_HEAD(&q->multi_queue.link);
 		mutex_lock(&group->list_lock);
+		if (group->stopped)
+			WRITE_ONCE(q->guc->sched.base.pause_submit, true);
 		list_add_tail(&q->multi_queue.link, &group->list);
 		mutex_unlock(&group->list_lock);
 	}
-- 
2.34.1

