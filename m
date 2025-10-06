Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87FDCCD185
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614F410E422;
	Mon,  6 Oct 2025 11:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hMDWhqcV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C57910E40A
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749046; x=1791285046;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=HpM6OgTK/bP1Wg/CkKH4hNIfoGGspuIcXED73eBTzFM=;
 b=hMDWhqcVwNFgW9ls+6Pz1gG16EXa+jPl3dKik/2LGmFGrvEJVkUkuvpl
 ttDoLZdU5Axbf10KE+ZHfgFF9CAMddK66M0gcxG/JgF6P4OuQgLgf0/Dj
 7+fLMjH0sz2NQWxBIA8nXSko23+/BtekVTOWNpeZR6WRj5duBoYG/Y2tv
 du4D4yPEvCxaCu2hzQvbi94fenKPtU0LYKhYEWNjpYg3o7kK+XVE2qbbE
 4ysVxEYXIvoZTMg2W8O5dz/ryXsCvJkK4Vpih3LRobjAszRVim7dX/AjT
 Dkhd5Tm8izXbKCZVtIfrCmfPFbChOofqLwx+kC1LY9nPulXXEsixwwKud A==;
X-CSE-ConnectionGUID: aExEOP/5SLu54Nh0+rKmFQ==
X-CSE-MsgGUID: PscpU56GQd2ySoKLWg6Phg==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73020399"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73020399"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:45 -0700
X-CSE-ConnectionGUID: in+BUKBGTdeTkPdl3305Dg==
X-CSE-MsgGUID: orlaG7zZRkCecxINSI66bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180655241"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 22/30] drm/xe/vf: Replay GuC submission state on pause /
 unpause
Date: Mon,  6 Oct 2025 04:10:30 -0700
Message-Id: <20251006111038.2234860-23-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
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

Fixup GuC submission pause / unpause functions to properly replay any
possible state lost during VF post migration recovery.

v3:
 - Add helpers for revert / replay (Tomasz)
 - Add comment around WQ NOPs (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 ++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 ++
 drivers/gpu/drm/xe/xe_guc_submit.c           | 242 +++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
 drivers/gpu/drm/xe/xe_sched_job_types.h      |   4 +
 7 files changed, 264 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index 455ccaf17314..af300adc7e1a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -135,3 +135,17 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 	list_add_tail(&msg->link, &sched->msgs);
 	xe_sched_process_msg_queue(sched);
 }
+
+/**
+ * xe_sched_add_msg_head() - Xe GPU scheduler add message to head of list
+ * @sched: Xe GPU scheduler
+ * @msg: Message to add
+ */
+void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
+			   struct xe_sched_msg *msg)
+{
+	lockdep_assert_held(&sched->base.job_list_lock);
+
+	list_add(&msg->link, &sched->msgs);
+	xe_sched_process_msg_queue(sched);
+}
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index e548b2aed95a..010003a6103a 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -29,6 +29,8 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
 		      struct xe_sched_msg *msg);
 void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
 			     struct xe_sched_msg *msg);
+void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
+			   struct xe_sched_msg *msg);
 
 static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
 {
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index c7c929bd4212..8074ffb924ce 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1142,6 +1142,7 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 static void vf_post_migration_rearm(struct xe_gt *gt)
 {
 	xe_guc_ct_restart(&gt->uc.guc.ct);
+	xe_guc_submit_unpause_prepare(&gt->uc.guc);
 }
 
 static void vf_post_migration_kickstart(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index c30c0e3ccbbb..a3b034e4b205 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -51,6 +51,21 @@ struct xe_guc_exec_queue {
 	wait_queue_head_t suspend_wait;
 	/** @suspend_pending: a suspend of the exec_queue is pending */
 	bool suspend_pending;
+	/**
+	 * @needs_cleanup: Needs a cleanup message during VF post migration
+	 * recovery.
+	 */
+	bool needs_cleanup;
+	/**
+	 * @needs_suspend: Needs a suspend message during VF post migration
+	 * recovery.
+	 */
+	bool needs_suspend;
+	/**
+	 * @needs_resume: Needs a resume message during VF post migration
+	 * recovery.
+	 */
+	bool needs_resume;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e1e197ec45eb..9dbdb0b54c8b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -142,6 +142,11 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
 }
 
+static void clear_exec_queue_destroyed(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
+}
+
 static bool exec_queue_banned(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
@@ -222,7 +227,12 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
 	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
 }
 
-static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
+static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
+{
+	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
+}
+
+static bool exec_queue_pending_resume(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
 }
@@ -237,7 +247,7 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
 }
 
-static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
+static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
 {
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
 }
@@ -799,7 +809,7 @@ static void wq_item_append(struct xe_exec_queue *q)
 }
 
 #define RESUME_PENDING	~0x0ull
-static void submit_exec_queue(struct xe_exec_queue *q)
+static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_lrc *lrc = q->lrc[0];
@@ -811,10 +821,13 @@ static void submit_exec_queue(struct xe_exec_queue *q)
 
 	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
 
-	if (xe_exec_queue_is_parallel(q))
-		wq_item_append(q);
-	else
-		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
+	if (!job->skip_emit || job->last_replay) {
+		if (xe_exec_queue_is_parallel(q))
+			wq_item_append(q);
+		else
+			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
+		job->last_replay = false;
+	}
 
 	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
 		return;
@@ -867,8 +880,10 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
 			register_exec_queue(q, GUC_CONTEXT_NORMAL);
-		q->ring_ops->emit_job(job);
-		submit_exec_queue(q);
+		if (!job->skip_emit)
+			q->ring_ops->emit_job(job);
+		submit_exec_queue(q, job);
+		job->skip_emit = false;
 	}
 
 	/*
@@ -1585,6 +1600,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 #define RESUME		4
 #define OPCODE_MASK	0xf
 #define MSG_LOCKED	BIT(8)
+#define MSG_HEAD	BIT(9)
 
 static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
@@ -1709,12 +1725,24 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
 	msg->private_data = q;
 
 	trace_xe_sched_msg_add(msg);
-	if (opcode & MSG_LOCKED)
+	if (opcode & MSG_HEAD)
+		xe_sched_add_msg_head(&q->guc->sched, msg);
+	else if (opcode & MSG_LOCKED)
 		xe_sched_add_msg_locked(&q->guc->sched, msg);
 	else
 		xe_sched_add_msg(&q->guc->sched, msg);
 }
 
+static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
+					    struct xe_sched_msg *msg,
+					    u32 opcode)
+{
+	if (!list_empty(&msg->link))
+		return;
+
+	guc_exec_queue_add_msg(q, msg, opcode | MSG_LOCKED | MSG_HEAD);
+}
+
 static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
 				       struct xe_sched_msg *msg,
 				       u32 opcode)
@@ -1998,6 +2026,105 @@ void xe_guc_submit_stop(struct xe_guc *guc)
 
 }
 
+static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
+{
+	bool pending_enable, pending_disable, pending_resume;
+
+	pending_enable = exec_queue_pending_enable(q);
+	pending_resume = exec_queue_pending_resume(q);
+
+	if (pending_enable && pending_resume)
+		q->guc->needs_resume = true;
+
+	if (pending_enable && !pending_resume &&
+	    !exec_queue_pending_tdr_exit(q)) {
+		clear_exec_queue_registered(q);
+		if (xe_exec_queue_is_lr(q))
+			xe_exec_queue_put(q);
+	}
+
+	if (pending_enable) {
+		clear_exec_queue_enabled(q);
+		clear_exec_queue_pending_resume(q);
+		clear_exec_queue_pending_tdr_exit(q);
+		clear_exec_queue_pending_enable(q);
+	}
+
+	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
+		clear_exec_queue_destroyed(q);
+		if (exec_queue_extra_ref(q))
+			xe_exec_queue_put(q);
+		else
+			q->guc->needs_cleanup = true;
+		clear_exec_queue_extra_ref(q);
+	}
+
+	pending_disable = exec_queue_pending_disable(q);
+
+	if (pending_disable && exec_queue_suspended(q)) {
+		clear_exec_queue_suspended(q);
+		q->guc->needs_suspend = true;
+	}
+
+	if (pending_disable) {
+		if (!pending_enable)
+			set_exec_queue_enabled(q);
+		clear_exec_queue_pending_disable(q);
+		clear_exec_queue_check_timeout(q);
+	}
+
+	q->guc->resume_time = 0;
+}
+
+/*
+ * This function is quite complex but only real way to ensure no state is lost
+ * during VF resume flows. The function scans the queue state, make adjustments
+ * as needed, and queues jobs / messages which replayed upon unpause.
+ */
+static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_job *job;
+	int i;
+
+	lockdep_assert_held(&guc->submission_state.lock);
+
+	/* Stop scheduling + flush any DRM scheduler operations */
+	xe_sched_submission_stop(sched);
+	if (xe_exec_queue_is_lr(q))
+		cancel_work_sync(&q->guc->lr_tdr);
+	else
+		cancel_delayed_work_sync(&sched->base.work_tdr);
+
+	guc_exec_queue_revert_pending_state_change(q);
+
+	if (xe_exec_queue_is_parallel(q)) {
+		struct xe_device *xe = guc_to_xe(guc);
+		struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
+
+		/*
+		 * NOP existing WQ commands that may contain stale GGTT
+		 * addresses. These will be replayed upon unpause. The hardware
+		 * seems to get confused if the WQ head/tail pointers are
+		 * adjusted.
+		 */
+		for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
+			parallel_write(xe, map, wq[i],
+				       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
+				       FIELD_PREP(WQ_LEN_MASK, 0));
+	}
+
+	job = xe_sched_first_pending_job(sched);
+	if (job) {
+		/*
+		 * Adjust software tail so jobs submitted overwrite previous
+		 * position in ring buffer with new GGTT addresses.
+		 */
+		for (i = 0; i < q->width; ++i)
+			q->lrc[i]->ring.tail = job->ptrs[i].head;
+	}
+}
+
 /**
  * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
  * @guc: the &xe_guc struct instance whose scheduler is to be disabled
@@ -2007,8 +2134,12 @@ void xe_guc_submit_pause(struct xe_guc *guc)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
+
+	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		xe_sched_submission_stop_async(&q->guc->sched);
+		guc_exec_queue_pause(guc, q);
+	mutex_unlock(&guc->submission_state.lock);
 }
 
 static void guc_exec_queue_start(struct xe_exec_queue *q)
@@ -2065,11 +2196,92 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	return 0;
 }
 
-static void guc_exec_queue_unpause(struct xe_exec_queue *q)
+static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
+					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct drm_sched_job *s_job;
+	struct xe_sched_job *job = NULL;
+
+	list_for_each_entry(s_job, &sched->base.pending_list, list) {
+		job = to_xe_sched_job(s_job);
+
+		q->ring_ops->emit_job(job);
+		job->skip_emit = true;
+	}
 
+	if (job)
+		job->last_replay = true;
+}
+
+/**
+ * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
+ * @guc: the &xe_guc struct instance whose scheduler is to be prepared for unpause
+ */
+void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		guc_exec_queue_unpause_prepare(guc, q);
+	mutex_unlock(&guc->submission_state.lock);
+}
+
+static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_sched_msg *msg;
+
+	if (q->guc->needs_cleanup) {
+		msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
+
+		guc_exec_queue_add_msg(q, msg, CLEANUP);
+		q->guc->needs_cleanup = false;
+	}
+
+	if (q->guc->needs_suspend) {
+		msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
+		xe_sched_msg_unlock(sched);
+
+		q->guc->needs_suspend = false;
+	}
+
+	/*
+	 * The resume must be in the message queue before the suspend as it is
+	 * not possible for a resume to be issued if a suspend pending is, but
+	 * the inverse is possible.
+	 */
+	if (q->guc->needs_resume) {
+		msg = q->guc->static_msgs + STATIC_MSG_RESUME;
+
+		xe_sched_msg_lock(sched);
+		guc_exec_queue_try_add_msg_head(q, msg, RESUME);
+		xe_sched_msg_unlock(sched);
+
+		q->guc->needs_resume = false;
+	}
+}
+
+static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
+{
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	bool needs_tdr = exec_queue_killed_or_banned_or_wedged(q);
+
+	lockdep_assert_held(&guc->submission_state.lock);
+
+	xe_sched_resubmit_jobs(sched);
+	guc_exec_queue_replay_pending_state_change(q);
 	xe_sched_submission_start(sched);
+	if (needs_tdr)
+		xe_guc_exec_queue_trigger_cleanup(q);
+	xe_sched_submission_resume_tdr(sched);
 }
 
 /**
@@ -2081,10 +2293,10 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
 	struct xe_exec_queue *q;
 	unsigned long index;
 
+	mutex_lock(&guc->submission_state.lock);
 	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
-		guc_exec_queue_unpause(q);
-
-	wake_up_all(&guc->ct.wq);
+		guc_exec_queue_unpause(guc, q);
+	mutex_unlock(&guc->submission_state.lock);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index fe82c317048e..b49a2748ec46 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_unpause(struct xe_guc *guc);
+void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
 void xe_guc_submit_wedge(struct xe_guc *guc);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 7ce58765a34a..13e7a12b03ad 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -63,6 +63,10 @@ struct xe_sched_job {
 	bool ring_ops_flush_tlb;
 	/** @ggtt: mapped in ggtt. */
 	bool ggtt;
+	/** @skip_emit: skip emitting the job */
+	bool skip_emit;
+	/** @last_replay: last job being replayed */
+	bool last_replay;
 	/** @ptrs: per instance pointers. */
 	struct xe_job_ptrs ptrs[];
 };
-- 
2.34.1

