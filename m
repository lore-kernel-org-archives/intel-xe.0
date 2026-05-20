Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10A7CD4F3C
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 11:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4B110E951;
	Wed, 20 May 2026 11:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sd6g6z9A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F111210E951
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779276121; x=1810812121;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c480yqiMPozbBa24OKq5eyC44/YJzfWbJVRNyKBh8DY=;
 b=Sd6g6z9AH+fuBIQRUJoIb6axDBSRuNsLbvwRJsRuWz2/OVnkHviVtrpY
 ZPPRsUBtLLkwnuQ0Ym49qWJHfhfJXELnYvim+j1KaKKWZTEODEnpC7UwZ
 /z8T6y8/sw7F0pA34O3yy3yJs970vdwVlZ/sdte0v8b5aAJSj54pk2Hau
 orvJ0gzmDk63wM07N+ruhvu7wz/++OJwG4fozwlo+DvqEtZ0qbU/wfwlc
 OlhTpJXI539mpe9Mj9TwrpxXwaJUJhF8RFE+Adp0zsaj2Dq1szyhsMBYv
 bmFzlg7m4FCicgwdnvYUe93gMi+BAiebmK3Ma+uHCYKstV5G+JU6AI9j3 g==;
X-CSE-ConnectionGUID: EbFGsgKTTJuGUc4IRXgs/w==
X-CSE-MsgGUID: OHdIHOy9T4SaBWd5nPmY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83786711"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="83786711"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 04:22:00 -0700
X-CSE-ConnectionGUID: 2Sf3YAA6SXmZwq0XFlxRaQ==
X-CSE-MsgGUID: G2GKhnblRriUHT52v8nVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="240399552"
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by orviesa007.jf.intel.com with ESMTP; 20 May 2026 04:21:59 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, matthew.d.roper@intel.com,
 thomas.hellstrom@intel.com, daniele.ceraolospurio@intel.com,
 matthew.auld@intel.com, stuart.summers@intel.com,
 intel-xe@lists.freedesktop.org
Subject: [PATCH] Revert "drm/xe: Skip exec queue schedule toggle if queue is
 idle during suspend"
Date: Wed, 20 May 2026 16:51:39 +0530
Message-ID: <20260520112139.334335-1-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
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

From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>

This reverts commit 8533051ce92015e9cc6f75e0d52119b9d91610b6.

The idle-skip optimization bypasses GuC suspend, so the GPU may not
perform the context switch that flushes TLB entries for invalidated
userptr VMAs. In LR/preempt-fence VM mode, this can lead to missed TLB
invalidation and page faults during userptr invalidation tests.

Restore unconditional schedule toggling on suspend so the context-switch
TLB flush is always performed.

This optimization will be reintroduced with a fix that does not skip
suspend in LR/preempt-fence VM mode.

Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.h      | 17 --------
 drivers/gpu/drm/xe/xe_guc_submit.c      | 55 ++-----------------------
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 10 +----
 3 files changed, 5 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index a82d99bd77bc..0225426c57b0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -162,21 +162,4 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
 
-/**
- * xe_exec_queue_idle_skip_suspend() - Can exec queue skip suspend
- * @q: The exec_queue
- *
- * If an exec queue is not parallel and is idle, the suspend steps can be
- * skipped in the submission backend immediatley signaling the suspend fence.
- * Parallel queues cannot skip this step due to limitations in the submission
- * backend.
- *
- * Return: True if exec queue is idle and can skip suspend steps, False
- * otherwise
- */
-static inline bool xe_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
-{
-	return !xe_exec_queue_is_parallel(q) && xe_exec_queue_is_idle(q);
-}
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afd8cc7bd231..f7200d720b70 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -71,7 +71,6 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
 #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
 #define EXEC_QUEUE_STATE_PENDING_RESUME		(1 << 10)
-#define EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND	(1 << 11)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -218,21 +217,6 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
 	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
 }
 
-static bool exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
-{
-	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND;
-}
-
-static void set_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
-{
-	atomic_or(EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc->state);
-}
-
-static void clear_exec_queue_idle_skip_suspend(struct xe_exec_queue *q)
-{
-	atomic_and(~EXEC_QUEUE_STATE_IDLE_SKIP_SUSPEND, &q->guc->state);
-}
-
 static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 {
 	return (atomic_read(&q->guc->state) &
@@ -1147,7 +1131,7 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	if (!job->restore_replay || job->last_replay) {
 		if (xe_exec_queue_is_parallel(q))
 			wq_item_append(q);
-		else if (!exec_queue_idle_skip_suspend(q))
+		else
 			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 		job->last_replay = false;
 	}
@@ -1802,10 +1786,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	bool idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
 
-	if (!idle_skip_suspend && guc_exec_queue_allowed_to_change_state(q) &&
-	    !exec_queue_suspended(q) && exec_queue_enabled(q)) {
+	if (guc_exec_queue_allowed_to_change_state(q) && !exec_queue_suspended(q) &&
+	    exec_queue_enabled(q)) {
 		wait_event(guc->ct.wq, vf_recovery(guc) ||
 			   ((q->guc->resume_time != RESUME_PENDING ||
 			   xe_guc_read_stopped(guc)) && !exec_queue_pending_disable(q)));
@@ -1824,33 +1807,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 			disable_scheduling(q, false);
 		}
 	} else if (q->guc->suspend_pending) {
-		if (idle_skip_suspend)
-			set_exec_queue_idle_skip_suspend(q);
 		set_exec_queue_suspended(q);
 		suspend_fence_signal(q);
 	}
 }
 
-static void sched_context(struct xe_exec_queue *q)
-{
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_lrc *lrc = q->lrc[0];
-	u32 action[] = {
-		XE_GUC_ACTION_SCHED_CONTEXT,
-		q->guc->id,
-	};
-
-	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_parallel(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
-	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
-	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
-
-	trace_xe_exec_queue_submit(q);
-
-	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
-	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
-}
-
 static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
@@ -1858,22 +1819,12 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 	if (guc_exec_queue_allowed_to_change_state(q)) {
 		clear_exec_queue_suspended(q);
 		if (!exec_queue_enabled(q)) {
-			if (exec_queue_idle_skip_suspend(q)) {
-				struct xe_lrc *lrc = q->lrc[0];
-
-				clear_exec_queue_idle_skip_suspend(q);
-				xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
-			}
 			q->guc->resume_time = RESUME_PENDING;
 			set_exec_queue_pending_resume(q);
 			enable_scheduling(q);
-		} else if (exec_queue_idle_skip_suspend(q)) {
-			clear_exec_queue_idle_skip_suspend(q);
-			sched_context(q);
 		}
 	} else {
 		clear_exec_queue_suspended(q);
-		clear_exec_queue_idle_skip_suspend(q);
 	}
 }
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 4c2b113364d3..02cf32ae5aa9 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -208,21 +208,15 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 	lockdep_assert_held_write(&group->mode_sem);
 
 	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
-		bool idle_skip_suspend;
 
 		if (!xe_vm_in_fault_mode(q->vm))
 			continue;
 
-		idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
-		if (!idle_skip_suspend && has_deps)
+		if (has_deps)
 			return -EAGAIN;
 
 		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
-		if (idle_skip_suspend)
-			xe_gt_stats_incr(q->gt,
-					 XE_GT_STATS_ID_HW_ENGINE_GROUP_SKIP_LR_QUEUE_COUNT, 1);
-
-		need_resume |= !idle_skip_suspend;
+		need_resume = true;
 		q->ops->suspend(q);
 		gt = q->gt;
 	}
-- 
2.46.0

