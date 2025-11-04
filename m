Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA1FCCFA19
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 18:52:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5626410E328;
	Tue,  4 Nov 2025 18:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nffDiHlj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2DC610E31D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 18:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762282318; x=1793818318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QhQlXK/AeFCm2J7AEc0Vmml+EPOOBe4Og8aRuB2Fpdk=;
 b=nffDiHlj0R+wWW2AoCj8hO8t7wPk7NNbBmh8U2LdDah/B3n04yPNXhNs
 jeqgFSxoHShaq9KzTkUcyM6X264EUvWFgWUs8Cae72PxhKa9PH/ucv4Gj
 kB1wEInqm1Dtx1dz7HqVj+2zPTZkUvLO0oPzO3tus7wCbFyfO7WVTDpyZ
 x4qbZvMFThN9DrsTo/Ff2mrA0xMUTkNMiBtTfwsCf3culH/JLZ7P9NJqX
 jB4z1m+5IHEWkNYfty4dZv0Y/0ZPvCvnhA5L4S/23YrwRzcpUyWGct/3/
 zvpv7yytHIAwnhI0Tj2B9l3GfL8LTMyT0vVN9a/KrFTsz62E+jB0qbMIz Q==;
X-CSE-ConnectionGUID: VQdc4dgQSbWk2gBD07Cpow==
X-CSE-MsgGUID: dg3aNytISV6odyGZ2C5s7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68247751"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="68247751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
X-CSE-ConnectionGUID: LfNIxPARRXaw0XlKmB4V6g==
X-CSE-MsgGUID: /xQQ/CXiSMuy7/VUgfn9gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="187183091"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.131])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 10:51:57 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Subject: [PATCH v2 09/16] drm/xe/multi_queue: Handle tearing down of a multi
 queue
Date: Tue,  4 Nov 2025 10:51:43 -0800
Message-ID: <20251104185150.246345-10-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
References: <20251104185150.246345-1-niranjana.vishwanathapura@intel.com>
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

As all queues of a multi queue group use the primary queue of the group
to interface with GuC. Hence there is a dependency between the queues of
the group. So, when primary queue of a multi queue group is cleaned up,
also trigger a cleanup of the secondary queues. During cleanup, stop and
re-start submission for all queues of a multi queue group to avoid any
submission happening in parallel when a queue is being cleaned up.

v2: Initialize group->list_lock, add fs_reclaim dependency, remove
    unwanted secondary queues cleanup (Matt Brost)

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |  10 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   6 +
 drivers/gpu/drm/xe/xe_guc_submit.c       | 146 +++++++++++++++++++----
 3 files changed, 140 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index fef48b82b189..f86f8198aedb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -87,6 +87,7 @@ static void xe_exec_queue_group_cleanup(struct xe_exec_queue *q)
 		xe_lrc_put(lrc);
 
 	xa_destroy(&group->xa);
+	mutex_destroy(&group->list_lock);
 	xe_bo_unpin_map_no_vm(group->cgp_bo);
 	kfree(group);
 }
@@ -624,9 +625,18 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 
 	group->primary = q;
 	group->cgp_bo = bo;
+	INIT_LIST_HEAD(&group->list);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
+	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
 
+	/* group->list_lock is used in submission backend */
+	if (!IS_ENABLED(CONFIG_LOCKDEP)) {
+		fs_reclaim_acquire(GFP_KERNEL);
+		might_lock(&group->list_lock);
+		fs_reclaim_release(GFP_KERNEL);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index cafb3ba9a123..5721fb4bad1a 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -58,6 +58,10 @@ struct xe_exec_queue_group {
 	struct xe_bo *cgp_bo;
 	/** @xa: xarray to store LRCs */
 	struct xarray xa;
+	/** @list: List of all secondary queues in the group */
+	struct list_head list;
+	/** @list_lock: Secondary queue list lock */
+	struct mutex list_lock;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
 };
@@ -145,6 +149,8 @@ struct xe_exec_queue {
 	struct {
 		/** @multi_queue.group: Queue group information */
 		struct xe_exec_queue_group *group;
+		/** @multi_queue.link: Link into group's secondary queues list */
+		struct list_head link;
 		/** @multi_queue.priority: Queue priority within the multi-queue group */
 		enum xe_multi_queue_priority priority;
 		/** @multi_queue.pos: Position of queue within the multi-queue group */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index f70c5f8003b7..b5ea86069d49 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -926,6 +926,81 @@ static void wq_item_append(struct xe_exec_queue *q)
 	parallel_write(xe, map, wq_desc.tail, q->guc->wqi_tail);
 }
 
+static void xe_guc_exec_queue_submission_start(struct xe_exec_queue *q)
+{
+	/*
+	 * If the exec queue is part of a multi queue group, then start submission
+	 * on all queues of the multi queue group.
+	 */
+	if (xe_exec_queue_is_multi_queue(q)) {
+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+		struct xe_exec_queue *eq;
+
+		xe_sched_submission_start(&primary->guc->sched);
+
+		mutex_lock(&group->list_lock);
+		list_for_each_entry(eq, &group->list, multi_queue.link)
+			xe_sched_submission_start(&eq->guc->sched);
+		mutex_unlock(&group->list_lock);
+	} else {
+		xe_sched_submission_start(&q->guc->sched);
+	}
+}
+
+static void xe_guc_exec_queue_submission_stop(struct xe_exec_queue *q)
+{
+	/*
+	 * If the exec queue is part of a multi queue group, then stop submission
+	 * on all queues of the multi queue group.
+	 */
+	if (xe_exec_queue_is_multi_queue(q)) {
+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+		struct xe_exec_queue *eq;
+
+		xe_sched_submission_stop(&primary->guc->sched);
+
+		mutex_lock(&group->list_lock);
+		list_for_each_entry(eq, &group->list, multi_queue.link)
+			xe_sched_submission_stop(&eq->guc->sched);
+		mutex_unlock(&group->list_lock);
+	} else {
+		xe_sched_submission_stop(&q->guc->sched);
+	}
+}
+
+static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+
+	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
+	wake_up_all(&xe->ufence_wq);
+
+	if (xe_exec_queue_is_lr(q))
+		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
+	else
+		xe_sched_tdr_queue_imm(&q->guc->sched);
+}
+
+static void xe_guc_exec_queue_trigger_secondary_cleanup(struct xe_exec_queue *q)
+{
+	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+	struct xe_exec_queue_group *group = q->multi_queue.group;
+	struct xe_exec_queue *eq;
+
+	mutex_lock(&group->list_lock);
+	list_for_each_entry(eq, &group->list, multi_queue.link) {
+		if (exec_queue_reset(primary))
+			set_exec_queue_reset(eq);
+
+		if (!exec_queue_banned(eq))
+			xe_guc_exec_queue_trigger_cleanup(eq);
+	}
+	mutex_unlock(&group->list_lock);
+}
+
 #define RESUME_PENDING	~0x0ull
 static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 {
@@ -1104,20 +1179,6 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 			       G2H_LEN_DW_DEREGISTER_CONTEXT, 2);
 }
 
-static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
-{
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
-
-	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
-	wake_up_all(&xe->ufence_wq);
-
-	if (xe_exec_queue_is_lr(q))
-		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
-	else
-		xe_sched_tdr_queue_imm(&q->guc->sched);
-}
-
 /**
  * xe_guc_submit_wedge() - Wedge GuC submission
  * @guc: the GuC object
@@ -1191,8 +1252,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	if (!exec_queue_killed(q))
 		wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
 
-	/* Kill the run_job / process_msg entry points */
-	xe_sched_submission_stop(sched);
+	/*
+	 * Kill the run_job / process_msg entry points.
+	 * As this function is serialized across exec queues, it is safe to
+	 * stop and restart submission on all queues of a multi queue group.
+	 */
+	xe_guc_exec_queue_submission_stop(q);
 
 	/*
 	 * Engine state now mostly stable, disable scheduling / deregister if
@@ -1228,7 +1293,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 				   q->guc->id);
 			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
 				       q->guc->id);
-			xe_sched_submission_start(sched);
+			xe_guc_exec_queue_submission_start(q);
 			xe_gt_reset_async(q->gt);
 			return;
 		}
@@ -1239,7 +1304,11 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 
 	xe_hw_fence_irq_stop(q->fence_irq);
 
-	xe_sched_submission_start(sched);
+	xe_guc_exec_queue_submission_start(q);
+
+	/* Trigger cleanup of secondary queues of multi queue group */
+	if (xe_exec_queue_is_multi_queue_primary(q))
+		xe_guc_exec_queue_trigger_secondary_cleanup(q);
 
 	spin_lock(&sched->base.job_list_lock);
 	list_for_each_entry(job, &sched->base.pending_list, drm.list)
@@ -1398,8 +1467,12 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	    vf_recovery(guc))
 		return DRM_GPU_SCHED_STAT_NO_HANG;
 
-	/* Kill the run_job entry point */
-	xe_sched_submission_stop(sched);
+	/*
+	 * Kill the run_job entry point.
+	 * As this function is serialized across exec queues, it is safe to
+	 * stop and restart submission on all queues of a multi queue group.
+	 */
+	xe_guc_exec_queue_submission_stop(q);
 
 	/* Must check all state after stopping scheduler */
 	skip_timeout_check = exec_queue_reset(q) ||
@@ -1558,7 +1631,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * fences that are complete
 	 */
 	xe_sched_add_pending_job(sched, job);
-	xe_sched_submission_start(sched);
+	xe_guc_exec_queue_submission_start(q);
 
 	xe_guc_exec_queue_trigger_cleanup(q);
 
@@ -1571,6 +1644,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	/* Start fence signaling */
 	xe_hw_fence_irq_start(q->fence_irq);
 
+	/* Trigger cleanup of secondary queues of multi queue group */
+	if (xe_exec_queue_is_multi_queue_primary(q))
+		xe_guc_exec_queue_trigger_secondary_cleanup(q);
+
 	return DRM_GPU_SCHED_STAT_RESET;
 
 sched_enable:
@@ -1582,7 +1659,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * but there is not currently an easy way to do in DRM scheduler. With
 	 * some thought, do this in a follow up.
 	 */
-	xe_sched_submission_start(sched);
+	xe_guc_exec_queue_submission_start(q);
 handle_vf_resume:
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
@@ -1613,6 +1690,14 @@ static void __guc_exec_queue_destroy_async(struct work_struct *w)
 	xe_pm_runtime_get(guc_to_xe(guc));
 	trace_xe_exec_queue_destroy(q);
 
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		mutex_lock(&group->list_lock);
+		list_del(&q->multi_queue.link);
+		mutex_unlock(&group->list_lock);
+	}
+
 	if (xe_exec_queue_is_lr(q))
 		cancel_work_sync(&ge->lr_tdr);
 	/* Confirm no work left behind accessing device structures */
@@ -1903,6 +1988,19 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	xe_exec_queue_assign_name(q, q->guc->id);
 
+	/*
+	 * Maintain secondary queues of the multi queue group in a list
+	 * for handling dependencies across the queues in the group.
+	 */
+	if (xe_exec_queue_is_multi_queue_secondary(q)) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+
+		INIT_LIST_HEAD(&q->multi_queue.link);
+		mutex_lock(&group->list_lock);
+		list_add_tail(&q->multi_queue.link, &group->list);
+		mutex_unlock(&group->list_lock);
+	}
+
 	trace_xe_exec_queue_create(q);
 
 	return 0;
@@ -2130,6 +2228,10 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
 {
+	if (xe_exec_queue_is_multi_queue_secondary(q) &&
+	    guc_exec_queue_reset_status(xe_exec_queue_multi_queue_primary(q)))
+		return true;
+
 	return exec_queue_reset(q) || exec_queue_killed_or_banned_or_wedged(q);
 }
 
-- 
2.43.0

