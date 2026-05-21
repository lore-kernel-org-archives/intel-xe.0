Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D0CD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 14:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D831210F361;
	Thu, 21 May 2026 14:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyoWI0pT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAA510F36F
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779374950; x=1810910950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1lOYSoQe8cFyRovUjN40hhGbYLjeXdaw5wfif1GX7R4=;
 b=SyoWI0pT2ORm8Fe1EazXCprJja943TwWXr7G5bB8C3Qcb+TGMATsj7ST
 25EjkQYelpeUNRzpNsC9i3FcnQ5oNNcLVNBUNSYgUOnWYEtapJdFhDW5s
 ezPyP4ehqvfbpPKJFXaIt5tme4m6Yu/3JR36O0lJ8VRoPNo1H73FLYGhs
 zHM6nVY9Im153RCXF+foYup02VBz4P5k+4UCPiPNdaWhho6MGZ+bE/U6p
 kRB6mPd6Kkc/LHSvBXPZq5ZWeaRp+Q4gwbBvYXVdweNjD8BG5mjV8WElC
 +3mWSThpuJd+K9lON5b0o2LUEuZ18IVv9arJVYWDmUmrrm3IZ/o8Go4vx A==;
X-CSE-ConnectionGUID: JMvxIhIJRkKrRkny1/UGqg==
X-CSE-MsgGUID: rtJRNM43TFWwFA8kJ7gHlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80194437"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="80194437"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:10 -0700
X-CSE-ConnectionGUID: nitP16aISRO14kt5V4dQOA==
X-CSE-MsgGUID: kIBFvvOuSLmHxWj5lO4iZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="270893347"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO fedora)
 ([10.245.244.105])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 07:49:07 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 4/4] drm/xe: Suspend fault-mode LR jobs before VRAM eviction
 on S3/S4
Date: Thu, 21 May 2026 16:48:37 +0200
Message-ID: <20260521144837.7363-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
References: <20260521144837.7363-1-thomas.hellstrom@linux.intel.com>
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
calls xe_vm_invalidate_vma() to unmap GPU VMAs, but a running fault-mode
job can immediately re-fault those pages back in, creating a race between
the GPU and the eviction.

Introduce xe_suspend_all_faulting_lr_jobs() which iterates all hw engine
groups across all GTs, suspends every fault-mode exec queue and waits for
the GuC to acknowledge the suspend before returning. This is called before
xe_bo_evict_all_user() in the PM notifier (user BO eviction) and before
xe_bo_evict_all() in xe_pm_suspend() (kernel/pinned BO eviction), ensuring
the GPU is idle before any mappings are torn down.

Unlike preempt-fence-mode VMs, fault-mode VMs don't use the rebind worker
on resume — rebinding happens lazily through GPU page fault handlers.
Therefore xe_resume_all_faulting_lr_jobs() is introduced to explicitly
re-register and resume all queues whose pm_suspended flag is set, mirroring
the same hw engine group iteration as the suspend path to ensure exact 1:1
pairing without relying on incidental GuC suspend state.

To prevent a new fault-mode exec queue from being added while PM suspend
is in progress, a pm_suspended flag is added to xe_hw_engine_group and
set under mode_sem before releasing the group lock in
xe_suspend_all_faulting_lr_jobs(). xe_hw_engine_group_add_exec_queue()
checks this flag under mode_sem: if set, the new queue is immediately
suspended (with lr.pm_suspended marked) so that the resume path picks it
up. If the group is additionally in EXEC_MODE_DMA_FENCE mode, a second
suspend is issued to match the mode-switch resumer, preserving the
one-suspend-per-resumer invariant from the suspend refcount. If the
queue is destroyed while PM-suspended, del_exec_queue() clears pm_suspended
under mode_sem so the resume path skips it cleanly.

The existing comment "FIXME: Super racey..." on xe_bo_evict_all() was
describing exactly this class of problem.

Assisted-by: GitHub_Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h      |   7 +
 drivers/gpu/drm/xe/xe_guc_submit.c            |  25 +++
 drivers/gpu/drm/xe/xe_guc_submit.h            |   1 +
 drivers/gpu/drm/xe/xe_hw_engine_group.c       | 158 +++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_group.h       |   3 +
 drivers/gpu/drm/xe/xe_hw_engine_group_types.h |   7 +
 drivers/gpu/drm/xe/xe_pm.c                    |  15 +-
 7 files changed, 206 insertions(+), 10 deletions(-)

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
index d1111b80fbed..9bb66fe6e215 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2573,6 +2573,31 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	return 0;
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
index b3839a90c142..b860a52b0f70 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -20,6 +20,7 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
 void xe_guc_submit_reset_wait(struct xe_guc *guc);
 void xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
+void xe_guc_submit_pm_resume_exec_queue(struct xe_exec_queue *q);
 void xe_guc_submit_pause(struct xe_guc *guc);
 void xe_guc_submit_pause_abort(struct xe_guc *guc);
 void xe_guc_submit_pause_vf(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 791be6edd0a4..006d75e56722 100644
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
 
@@ -126,7 +129,7 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
 int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
 {
 	int err;
-	struct xe_device *xe = gt_to_xe(q->gt);
+	struct xe_device *xe __maybe_unused = gt_to_xe(q->gt);
 
 	xe_assert(xe, group);
 	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
@@ -139,13 +142,22 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
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
@@ -174,7 +186,9 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 	down_write(&group->mode_sem);
 
 	if (!list_empty(&q->hw_engine_group_link))
-		list_del(&q->hw_engine_group_link);
+		list_del_init(&q->hw_engine_group_link);
+
+	q->lr.pm_suspended = false;
 
 	up_write(&group->mode_sem);
 }
@@ -189,6 +203,134 @@ void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group
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
index 92b6e0712c03..5f1a51ce1daf 100644
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
index d4672eb07476..2f34152aaf97 100644
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
@@ -408,9 +409,18 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 	{
 		struct xe_validation_ctx ctx;
 
-		reinit_completion(&xe->pm_block);
-		xe_pm_block_begin_signalling();
 		xe_pm_runtime_get(xe);
+		xe_pm_block_begin_signalling();
+		reinit_completion(&xe->pm_block);
+
+		err = xe_suspend_all_faulting_lr_jobs(xe);
+		if (err) {
+			drm_err(&xe->drm, "Notifier suspend faulting LR jobs failed (%d)\n", err);
+			complete_all(&xe->pm_block);
+			xe_pm_block_end_signalling();
+			xe_pm_runtime_put(xe);
+			return notifier_from_errno(err);
+		}
 		(void)xe_validation_ctx_init(&ctx, &xe->val, NULL,
 					     (struct xe_val_flags) {.exclusive = true});
 		err = xe_bo_evict_all_user(xe);
@@ -434,6 +444,7 @@ static int xe_pm_notifier_callback(struct notifier_block *nb,
 		complete_all(&xe->pm_block);
 		xe_pm_wake_rebind_workers(xe);
 		xe_bo_notifier_unprepare_all_pinned(xe);
+		xe_resume_all_faulting_lr_jobs(xe);
 		xe_pm_runtime_put(xe);
 		break;
 	}
-- 
2.54.0

