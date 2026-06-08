Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7ACCD8C90
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 02:11:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B119B10EC16;
	Mon,  8 Jun 2026 02:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IP2E/LZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B2510EC16
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 02:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780884668; x=1812420668;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W0YvSG3io+vzWrhDiTpbblHVuTKcR05GljzGg2k5ezU=;
 b=IP2E/LZDN7yOtAQ7Q9ELEIUWlmv56FGj9DGFAZ74iwQ62Qcn4DocgD37
 QUr+75c/JA0yizWBnqonSfWRG9FdyYKz+/Ep4x2Xlm3eaiE3BdeNBR/KI
 pvgwVB5uCYy+lWglACgCfHex79nOT0GkKLQGBmh/rpgmEeuqkPheBXom0
 kIimRpMrSxrquyijH0s7n48r3MMsOcE+jW7oomeA5EL6oWsxPeD9njXfx
 dvkjU81SBYANXFwCD48MyxaR0ytSfVAM0mzelD3rDh0WPAjdnLzWsCPDR
 gS0UfFQ9497aBG7Flp1mHygmFwSEJahuYwcIQi1OqbJyflmkcEVZhoQD8 Q==;
X-CSE-ConnectionGUID: PSaCFolPQsqe248asOttpA==
X-CSE-MsgGUID: nC+lt9K7QpW99IuVvBYhvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="107055600"
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="107055600"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 19:11:07 -0700
X-CSE-ConnectionGUID: FpLrR6V4RGeCKrK+8gZAmw==
X-CSE-MsgGUID: cox/KKPjRzOayvMvtlZK3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,193,1774335600"; d="scan'208";a="242952889"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.126])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2026 19:11:07 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/multi_queue: preempt primary on queue group suspend
Date: Sun,  7 Jun 2026 19:11:00 -0700
Message-ID: <20260608021059.1037822-2-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
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

In a multi-queue group only the group's primary queue interfaces with
GuC for scheduling; suspend/resume of secondary queues is handled
internally and is not forwarded to GuC. As a result, suspending a
secondary queue alone (e.g. on its preempt fence signalling) does not
disable the primary's GuC context, so in-flight GPU work of the group
is not actually preempted.

Route group suspend/resume through the primary using a group level
reference count. The primary's GuC context is disabled on the first
suspend of any group member and re-enabled only after every suspended
member is resumed. A per-queue preempt_suspended flag makes the
resume-all-queues-each-rebind-cycle behavior idempotent and keeps the
count balanced, including on queue teardown. The secondary's own
scheduler state machine is still suspended/resumed internally so its
state stays consistent.

Assisted-by: Github-Copilot:Claude-opus-4.8
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c       |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  17 +++
 drivers/gpu/drm/xe/xe_guc_submit.c       | 173 +++++++++++++++++++++--
 3 files changed, 181 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..df95855a3d61 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -842,6 +842,7 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
 	group->primary = q;
 	group->cgp_bo = bo;
 	INIT_LIST_HEAD(&group->list);
+	spin_lock_init(&group->suspend_lock);
 	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
 	mutex_init(&group->list_lock);
 	q->multi_queue.group = group;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..30c5dfcc58fb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -62,6 +62,16 @@ struct xe_exec_queue_group {
 	struct list_head list;
 	/** @list_lock: Secondary queue list lock */
 	struct mutex list_lock;
+	/** @suspend_lock: Protects @suspend_count and queues' @preempt_suspended */
+	spinlock_t suspend_lock;
+	/**
+	 * @suspend_count: Number of queues in the group currently preempt
+	 * suspended (e.g. due to their VM's userptr invalidation). Only the
+	 * primary queue interfaces with GuC, so the primary's GuC context is
+	 * kept disabled while @suspend_count is non-zero. Protected by
+	 * @suspend_lock.
+	 */
+	u32 suspend_count;
 	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
 	bool sync_pending;
 	/** @banned: Group banned */
@@ -176,6 +186,13 @@ struct xe_exec_queue {
 		u8 valid:1;
 		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
 		u8 is_primary:1;
+		/**
+		 * @multi_queue.preempt_suspended: This queue is currently preempt
+		 * suspended (e.g. due to its VM's userptr invalidation) and is
+		 * accounted in the group's @xe_exec_queue_group.suspend_count.
+		 * Protected by @xe_exec_queue_group.suspend_lock.
+		 */
+		u8 preempt_suspended:1;
 	} multi_queue;
 
 	/** @sched_props: scheduling properties */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4b247a3019d2..8ec3ab24048f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1657,11 +1657,22 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
+static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q);
+
 static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
+	/*
+	 * A queue can leave the group while still preempt suspended (e.g.
+	 * xe_vm_remove_compute_exec_queue() forces its preempt fence to signal,
+	 * which suspends it). Drop its contribution to the group suspend count
+	 * and resume the primary if this was the last suspended queue.
+	 */
+	if (xe_exec_queue_is_multi_queue(q))
+		guc_exec_queue_multi_queue_drop_suspend(q);
+
 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
 		struct xe_exec_queue_group *group = q->multi_queue.group;
 
@@ -2147,20 +2158,82 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 	if (exec_queue_killed_or_banned_or_wedged(q))
 		return -EINVAL;
 
-	xe_sched_msg_lock(sched);
-	if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
-		q->guc->suspend_pending = true;
-	xe_sched_msg_unlock(sched);
+	if (!xe_exec_queue_is_multi_queue(q)) {
+		xe_sched_msg_lock(sched);
+		if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
+			q->guc->suspend_pending = true;
+		xe_sched_msg_unlock(sched);
+
+		return 0;
+	}
+
+	/*
+	 * For a multi-queue group only the primary queue interfaces with GuC
+	 * for scheduling, so the group is preempted by disabling the primary's
+	 * GuC context. Route all group suspends through the primary using a
+	 * group level reference count: disable the primary's GuC context on the
+	 * first suspend so the GPU is actually preempted, and keep it disabled
+	 * until every suspended queue in the group is resumed.
+	 *
+	 * Set the primary's suspend_pending while holding @suspend_lock so a
+	 * concurrent suspender of the same group cannot observe a not-yet-pending
+	 * primary and have its suspend_wait() return before the GPU is preempted.
+	 */
+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+		struct xe_exec_queue *primary;
+		struct xe_gpu_scheduler *psched;
+		struct xe_sched_msg *pmsg;
+
+		if (q->multi_queue.preempt_suspended)
+			break;
+
+		q->multi_queue.preempt_suspended = true;
+
+		/*
+		 * Disable this queue's own scheduler state machine too. For a
+		 * secondary this is handled internally (not forwarded to GuC),
+		 * but updating its state is still required. The primary's own
+		 * state is updated by the GuC suspend issued below on the first
+		 * group suspend.
+		 */
+		if (xe_exec_queue_is_multi_queue_secondary(q)) {
+			xe_sched_msg_lock(sched);
+			if (guc_exec_queue_try_add_msg(q, msg, SUSPEND))
+				q->guc->suspend_pending = true;
+			xe_sched_msg_unlock(sched);
+		}
+
+		if (group->suspend_count++)
+			break;
+
+		primary = xe_exec_queue_multi_queue_primary(q);
+		psched = &primary->guc->sched;
+		pmsg = primary->guc->static_msgs + STATIC_MSG_SUSPEND;
+
+		xe_sched_msg_lock(psched);
+		if (guc_exec_queue_try_add_msg(primary, pmsg, SUSPEND))
+			primary->guc->suspend_pending = true;
+		xe_sched_msg_unlock(psched);
+	}
 
 	return 0;
 }
 
 static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 {
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_guc *guc;
+	struct xe_device *xe;
 	int ret;
 
+	/*
+	 * In multi-queue mode the primary owns the GuC scheduling context for
+	 * the whole group, so wait on the primary's suspend to complete.
+	 */
+	q = xe_exec_queue_multi_queue_primary(q);
+	guc = exec_queue_to_guc(q);
+	xe = guc_to_xe(guc);
+
 	/*
 	 * Likely don't need to check exec_queue_killed() as we clear
 	 * suspend_pending upon kill but to be paranoid but races in which
@@ -2204,11 +2277,91 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 
-	xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
+	if (!xe_exec_queue_is_multi_queue(q)) {
+		xe_gt_assert(guc_to_gt(guc), !q->guc->suspend_pending);
 
-	xe_sched_msg_lock(sched);
-	guc_exec_queue_try_add_msg(q, msg, RESUME);
-	xe_sched_msg_unlock(sched);
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg(q, msg, RESUME);
+		xe_sched_msg_unlock(sched);
+
+		return;
+	}
+
+	/*
+	 * Resume is called for every queue of the VM on each rebind cycle, so
+	 * only act if this queue was actually suspended. Re-enable the primary's
+	 * GuC context once the last suspended queue of the group is resumed.
+	 */
+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+		struct xe_exec_queue *primary;
+		struct xe_gpu_scheduler *psched;
+		struct xe_sched_msg *pmsg;
+
+		if (!q->multi_queue.preempt_suspended)
+			break;
+
+		q->multi_queue.preempt_suspended = false;
+
+		/*
+		 * Re-enable this queue's own scheduler state machine that was
+		 * disabled on suspend. For a secondary this is handled
+		 * internally (not forwarded to GuC); the primary's own state is
+		 * re-enabled by the GuC resume issued below on the last group
+		 * resume.
+		 */
+		if (xe_exec_queue_is_multi_queue_secondary(q)) {
+			xe_sched_msg_lock(sched);
+			guc_exec_queue_try_add_msg(q, msg, RESUME);
+			xe_sched_msg_unlock(sched);
+		}
+
+		if (--q->multi_queue.group->suspend_count)
+			break;
+
+		primary = xe_exec_queue_multi_queue_primary(q);
+		psched = &primary->guc->sched;
+		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
+
+		xe_gt_assert(guc_to_gt(guc), !primary->guc->suspend_pending);
+
+		xe_sched_msg_lock(psched);
+		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
+		xe_sched_msg_unlock(psched);
+	}
+}
+
+/*
+ * Drop a leaving multi-queue member's contribution to the group preempt
+ * suspend count and resume the primary if it was the last suspended queue.
+ * See guc_exec_queue_fini().
+ */
+static void guc_exec_queue_multi_queue_drop_suspend(struct xe_exec_queue *q)
+{
+	scoped_guard(spinlock, &q->multi_queue.group->suspend_lock) {
+		struct xe_exec_queue_group *group = q->multi_queue.group;
+		struct xe_exec_queue *primary;
+		struct xe_gpu_scheduler *psched;
+		struct xe_sched_msg *pmsg;
+
+		if (!q->multi_queue.preempt_suspended)
+			break;
+
+		q->multi_queue.preempt_suspended = false;
+		if (--group->suspend_count)
+			break;
+
+		primary = xe_exec_queue_multi_queue_primary(q);
+		if (primary == q ||
+		    exec_queue_killed_or_banned_or_wedged(primary))
+			break;
+
+		psched = &primary->guc->sched;
+		pmsg = primary->guc->static_msgs + STATIC_MSG_RESUME;
+
+		xe_sched_msg_lock(psched);
+		guc_exec_queue_try_add_msg(primary, pmsg, RESUME);
+		xe_sched_msg_unlock(psched);
+	}
 }
 
 static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
-- 
2.43.0

