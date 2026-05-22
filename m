Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5C3CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 16:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D6F10E24F;
	Fri, 22 May 2026 16:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y1VOSHgM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D2510F6A8
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 16:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779468269; x=1811004269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L9tt11SmmL+YmrVkTJB6WvuuqlMGNRblOO9kGA7SxpA=;
 b=Y1VOSHgMGbEbDOjjftgOFpX7d/0cHFmbS1tebpE4RIagSth+fQwf1+dk
 CPECLR8TZKDEsUDyeE1ySqS1NoEdB4U7mZmaixTcm8mLGqJzJww8zKn05
 +t0Qh/jG/A27SEdH/i4DkFvKW5UwiUMC74nnXN2gtPHIXFKkfbWqn4KGe
 o7rRLrlnTWhIEGM2Ktuw1ZA3PFNFWz2dEfAW7gtuU0XF18JwC4ZcUFz+k
 O2+Iem34qW0DBaZfRQn+6DM3htQDo3bkuSK+qyGu+nk1YeQF8mSS08Axl
 NgQFByacQJMjGJIYwlmZTtiYeXF1e07C7GOB8PD7upn6AV1Ut+dRa+zWg w==;
X-CSE-ConnectionGUID: Hw/Aly5sRaK4mvP9Fh/cFQ==
X-CSE-MsgGUID: SK9CME5JQ/u5MHawVpu7Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80453403"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80453403"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:28 -0700
X-CSE-ConnectionGUID: 4egjDr7bTqaqut+wJ/l17g==
X-CSE-MsgGUID: JCJY1Tl6Scm8vcvOhnNYzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="238370132"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.244.219])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 09:44:26 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org
Subject: [PATCH 5/5] drm/xe: Suspend fault-mode LR jobs before VRAM eviction
 on S3/S4
Date: Fri, 22 May 2026 18:43:55 +0200
Message-ID: <20260522164355.2773-6-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522164355.2773-1-thomas.hellstrom@linux.intel.com>
References: <20260522164355.2773-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Fault-mode (SVM) exec queues run persistent LR jobs that can re-fault
GPU page table entries at any time. During S3/S4 suspend, VRAM eviction
unmaps GPU VMAs, but a running fault-mode job can immediately re-fault
those pages back in, racing with the eviction.

Fault-mode exec queues are suspended and drained before any VRAM
eviction begins, ensuring the GPU is quiescent before page tables or
BOs are invalidated. On resume, all previously suspended fault-mode
exec queues are re-registered and restarted once hardware is restored
and page fault handlers are ready to run.

Fault-mode exec queues created concurrently with PM suspend are
immediately suspended so the resume path picks them up, closing the
window where a newly-created queue could race with eviction.

Remove the stale "FIXME: Super racey..." comment from xe_pm_suspend():
the race it described is now prevented by suspending fault-mode jobs
before any eviction begins.

v2:
 - Add xe_device::pm_suspend_in_progress flag to suppress erroneous LR
   exec queue bans during PM suspend (now handled in a separate patch)
 - Rebase on exec queue suspend refcount and EXEC_MODE_LR rename patches

Fixes: eb5723a75104 ("drm/xe: Block exec and rebind worker while evicting for suspend / hibernate")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: <stable@vger.kernel.org> # v6.17+
Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  25 +++
 drivers/gpu/drm/xe/xe_guc_submit.h            |   1 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 161 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |   7 +
 drivers/gpu/drm/xe/xe_pm.c                    |  15 +-
 7 files changed, 206 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 2f5ccf294675..77f2bc5ff2f6 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -200,6 +200,13 @@ struct xe_exec_queue {
 		u32 seqno;
 		/** @lr.link: link into VM's list of exec queues */
 		struct list_head link;
+		/**
+		 * @lr.pm_suspended: Marks that this fault-mode exec
+		 * queue was suspended for PM and must be resumed on
+		 * PM post-suspend. Protected by the hw engine group's
+		 * mode_sem.
+		 */
+		bool pm_suspended;
 	} lr;
 
 #define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT	0
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 7da7db2059ff..a97a4caf6dc8 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2616,6 +2616,31 @@ void xe_guc_submit_start_user_queues(struct xe_guc *guc)
 	mutex_unlock(&guc->submission_state.lock);
 }
 
+/**
+ * xe_guc_submit_pm_resume_exec_queue() - Re-enable a fault-mode exec queue after PM resume
+ * @q: the exec queue to resume
+ *
+ * Re-enables a fault-mode LR exec queue for execution after PM resume.
+ * Has no effect if GuC is stopped or if the queue is in a terminal state
+ * (killed, banned, wedged, or destroyed).
+ */
+void xe_guc_submit_pm_resume_exec_queue(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = exec_queue_to_guc(q);
+
+	if (!guc->submission_state.initialized)
+		return;
+
+	mutex_lock(&guc->submission_state.lock);
+	if (!xe_guc_read_stopped(guc) &&
+	    !exec_queue_killed_or_banned_or_wedged(q) && !exec_queue_destroyed(q)) {
+		if (!exec_queue_registered(q))
+			register_exec_queue(q, GUC_CONTEXT_NORMAL);
+		q->ops->resume(q);
+	}
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 					   struct xe_exec_queue *q)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b210b2f6cd2d..c312fe31d917 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -21,6 +21,7 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 void xe_guc_submit_start_user_queues(struct xe_guc *guc);
+void xe_guc_submit_pm_resume_exec_queue(struct xe_exec_queue *q);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
 void xe_guc_submit_pause_vf(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index fba0ed039bad..1561fb95fdcf 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -6,11 +6,14 @@
 #include <drm/drm_managed.h>
 
 #include "xe_assert.h"
+#include "xe_device.h"
 #include "xe_device_types.h"
 #include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_stats.h"
+#include "xe_guc_submit.h"
 #include "xe_hw_engine_group.h"
+#include "xe_hw_engine_types.h"
 #include "xe_sync.h"
 #include "xe_vm.h"
 
@@ -126,11 +129,10 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
 {
 	int err;
-	struct xe_device *xe = gt_to_xe(q->gt);
 
-	xe_assert(xe, group);
-	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
-	xe_assert(xe, q->vm);
+	xe_assert(gt_to_xe(q->gt), group);
+	xe_assert(gt_to_xe(q->gt), !(q->flags & EXEC_QUEUE_FLAG_VM));
+	xe_assert(gt_to_xe(q->gt), q->vm);
 
 	if (xe_vm_in_preempt_fence_mode(q->vm))
 		return 0;
@@ -139,13 +141,22 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 	if (err)
 		return err;
 
-	if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
-		q->ops->suspend(q);
-		err = q->ops->suspend_wait(q);
-		if (err)
-			goto err_suspend;
+	if (xe_vm_in_fault_mode(q->vm)) {
+		if (group->pm_suspended) {
+			q->lr.pm_suspended = true;
+			q->ops->suspend(q);
+			err = q->ops->suspend_wait(q);
+			if (err)
+				goto err_suspend;
+		}
+		if (group->cur_mode == EXEC_MODE_DMA_FENCE) {
+			q->ops->suspend(q);
+			err = q->ops->suspend_wait(q);
+			if (err)
+				goto err_suspend;
 
-		xe_hw_engine_group_resume_faulting_lr_jobs(group);
+			xe_hw_engine_group_resume_faulting_lr_jobs(group);
+		}
 	}
 
 	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
@@ -176,6 +187,8 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 	if (!list_empty(&q->hw_engine_group_link))
 		list_del(&q->hw_engine_group_link);
 
+	q->lr.pm_suspended = false;
+
 	up_write(&group->mode_sem);
 }
 
@@ -189,6 +202,134 @@ void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group
 	queue_work(group->resume_wq, &group->resume_work);
 }
 
+/**
+ * xe_suspend_all_faulting_lr_jobs() - Suspend all fault-mode exec queues on the device
+ * @xe: the xe device
+ *
+ * Suspends all fault-mode LR exec queues across all GTs before VRAM eviction
+ * during PM suspend. Fault-mode jobs can re-fault GPU page table entries at
+ * any time, racing with the eviction process. Must be paired with
+ * xe_resume_all_faulting_lr_jobs() after hardware is restored on resume.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int xe_suspend_all_faulting_lr_jobs(struct xe_device *xe)
+{
+	struct xe_hw_engine_group *visited[XE_ENGINE_CLASS_MAX] = {};
+	int n_visited = 0;
+	struct xe_gt *gt;
+	u8 gt_id;
+	int err;
+
+	for_each_gt(gt, xe, gt_id) {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id hwe_id;
+
+		for_each_hw_engine(hwe, gt, hwe_id) {
+			struct xe_hw_engine_group *group = hwe->hw_engine_group;
+			struct xe_exec_queue *q;
+			bool already_seen = false;
+			int i;
+
+			if (!group)
+				continue;
+
+			for (i = 0; i < n_visited; i++) {
+				if (visited[i] == group) {
+					already_seen = true;
+					break;
+				}
+			}
+			if (already_seen)
+				continue;
+
+			visited[n_visited++] = group;
+
+			err = down_write_killable(&group->mode_sem);
+			if (err)
+				goto err_resume;
+
+			group->pm_suspended = true;
+			list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+				if (xe_vm_in_fault_mode(q->vm)) {
+					q->lr.pm_suspended = true;
+					q->ops->suspend(q);
+				}
+			}
+
+			list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+				if (!xe_vm_in_fault_mode(q->vm))
+					continue;
+
+				err = q->ops->suspend_wait(q);
+				if (err) {
+					up_write(&group->mode_sem);
+					goto err_resume;
+				}
+			}
+
+			up_write(&group->mode_sem);
+		}
+	}
+
+	return 0;
+
+err_resume:
+	xe_resume_all_faulting_lr_jobs(xe);
+	return err;
+}
+
+/**
+ * xe_resume_all_faulting_lr_jobs() - Resume all fault-mode exec queues on the device
+ * @xe: the xe device
+ *
+ * Re-enables all fault-mode LR exec queues that were suspended for PM. Must be
+ * called after hardware is restored and page fault handlers are free to run.
+ */
+void xe_resume_all_faulting_lr_jobs(struct xe_device *xe)
+{
+	struct xe_hw_engine_group *visited[XE_ENGINE_CLASS_MAX] = {};
+	int n_visited = 0;
+	struct xe_gt *gt;
+	u8 gt_id;
+
+	for_each_gt(gt, xe, gt_id) {
+		struct xe_hw_engine *hwe;
+		enum xe_hw_engine_id hwe_id;
+
+		for_each_hw_engine(hwe, gt, hwe_id) {
+			struct xe_hw_engine_group *group = hwe->hw_engine_group;
+			struct xe_exec_queue *q;
+			bool already_seen = false;
+			int i;
+
+			if (!group)
+				continue;
+
+			for (i = 0; i < n_visited; i++) {
+				if (visited[i] == group) {
+					already_seen = true;
+					break;
+				}
+			}
+			if (already_seen)
+				continue;
+
+			visited[n_visited++] = group;
+
+			down_write(&group->mode_sem);
+			group->pm_suspended = false;
+			list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+				if (!q->lr.pm_suspended)
+					continue;
+				q->lr.pm_suspended = false;
+				xe_guc_submit_pm_resume_exec_queue(q);
+			}
+			up_write(&group->mode_sem);
+		}
+	}
+}
+
 /**
  * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
  * @group: The hw engine group
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
index 8b17ccd30b70..67807d67530c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -9,6 +9,7 @@
 #include "xe_hw_engine_group_types.h"
 
 struct drm_device;
+struct xe_device;
 struct xe_exec_queue;
 struct xe_gt;
 struct xe_sync_entry;
@@ -27,5 +28,7 @@ void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
 enum xe_hw_engine_group_execution_mode
 xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
 void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group);
+int xe_suspend_all_faulting_lr_jobs(struct xe_device *xe);
+void xe_resume_all_faulting_lr_jobs(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
index b4c41de6ba5f..090313da2f25 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group_types.h
@@ -46,6 +46,13 @@ struct xe_hw_engine_group {
 	struct rw_semaphore mode_sem;
 	/** @cur_mode: current execution mode of this hw engine group */
 	enum xe_hw_engine_group_execution_mode cur_mode;
+	/**
+	 * @pm_suspended: true while PM suspend is in progress for this group.
+	 * New fault-mode exec queues added while this is set are immediately
+	 * suspended (with @lr.pm_suspended marked) and resumed by
+	 * xe_resume_all_faulting_lr_jobs(). Protected by @mode_sem.
+	 */
+	bool pm_suspended;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 76d211986822..58afb44b1b0c 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_ggtt.h"
 #include "xe_gt.h"
 #include "xe_gt_idle.h"
+#include "xe_hw_engine_group.h"
 #include "xe_i2c.h"
 #include "xe_irq.h"
 #include "xe_late_bind_fw.h"
@@ -191,7 +192,6 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_display_pm_suspend(xe);
 
-	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
 	if (err)
 		goto err_display;
@@ -414,9 +414,17 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	{
 		struct xe_validation_ctx ctx;
 
-		reinit_completion(&xe->pm_block);
-		xe_pm_block_begin_signalling();
 		xe_pm_runtime_get(xe);
+
+		err = xe_suspend_all_faulting_lr_jobs(xe);
+		if (err) {
+			drm_err(&xe->drm, "Notifier suspend faulting LR jobs failed (%d)\n", err);
+			xe_pm_runtime_put(xe);
+			return notifier_from_errno(err);
+		}
+
+		xe_pm_block_begin_signalling();
+		reinit_completion(&xe->pm_block);
 		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
 					     (struct xe_val_flags) {.exclusive = true});
 		err = xe_bo_evict_all_user(xe);
@@ -440,6 +448,7 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		complete_all(&xe->pm_block);
 		xe_pm_wake_rebind_workers(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
+		xe_resume_all_faulting_lr_jobs(xe);
 		xe_pm_runtime_put(xe);
 		break;
 	}
-- 
2.54.0

