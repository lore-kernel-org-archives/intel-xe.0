Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1C5CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 06:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A238010F8FC;
	Wed,  3 Jun 2026 06:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YW2KN6L0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E000F10F8FC
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780469561; x=1812005561;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=5FhEn+7aUBoShdmiWOtS5TAd7ROvVzKvkdQvA93MbYA=;
 b=YW2KN6L0iMHLu3CpSv7hZMcB59dXtueTiQ1UMUBGsIuAB/J642KdGVqQ
 gGSkBU7LISx5GumV6uxnLnZ3jkjZdIcgPwKbCq9Tgc3F1IqG+c2YB5zzs
 a8lUXUQPvuKkXwsNgkkFGJN2bg5y9Cu1ulinZ0ipifZefBCJVHllwYsco
 sB5kzQHqSpS5x8clywltEzbEpxAeWnwpFtdF2oX1Eq+wXTPBKlsZwfl1P
 +Gy1VYmkLza5fA7dM+QOxK9jZPosATZY4X/WelGaFLA5TcuwYcoKy/bez
 QxJLhGg1v4/k3YNy8whl4NjrHfJWKBxXsLYpeE+GUQwElEsUqRBpJ3/Br g==;
X-CSE-ConnectionGUID: CapQhKoSSRaef5dd7/x3XQ==
X-CSE-MsgGUID: gBDglQq5TMm/5jVAa3AR4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81263631"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208";a="81263631"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 23:52:41 -0700
X-CSE-ConnectionGUID: EfhTvehTSziPHkboenmKiw==
X-CSE-MsgGUID: u47pJD1VRKGLO++eI3vyfQ==
X-ExtLoop1: 1
Received: from tilak-z690i-a-ultra-plus.iind.intel.com ([10.190.239.38])
 by fmviesa003.fm.intel.com with ESMTP; 02 Jun 2026 23:52:39 -0700
From: tilak.tirumalesh.tangudu@intel.com
To: tilak.tirumalesh.tangudu@intel.com, daniele.ceraolospurio@intel.com,
 niranjana.vishwanathapura@intel.com, intel-xe@lists.freedesktop.org
Subject: [PATCH 1/3] Revert "drm/xe: Skip exec queue schedule toggle if queue
 is idle during suspend"
Date: Wed,  3 Jun 2026 12:22:15 +0530
Message-ID: <20260603065217.3131066-2-tilak.tirumalesh.tangudu@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260603065217.3131066-1-tilak.tirumalesh.tangudu@intel.com>
References: <20260603065217.3131066-1-tilak.tirumalesh.tangudu@intel.com>
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

Fixes: 8533051ce920 ("drm/xe: Skip exec queue schedule toggle if queue is idle during suspend")
Cc: stable@vger.kernel.org # v7.0+
Suggested-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
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
index ab501513d806..d1ab66ca1856 100644
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
@@ -1157,7 +1141,7 @@ static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
 	if (!job->restore_replay || job->last_replay) {
 		if (xe_exec_queue_is_parallel(q))
 			wq_item_append(q);
-		else if (!exec_queue_idle_skip_suspend(q))
+		else
 			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
 		job->last_replay = false;
 	}
@@ -1812,10 +1796,9 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
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
@@ -1834,33 +1817,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
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
@@ -1868,22 +1829,12 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
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

