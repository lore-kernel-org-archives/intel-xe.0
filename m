Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2058DD59D84
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 18:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD4A10E92E;
	Fri, 12 Dec 2025 18:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fphiebl2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB0E10E92D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 18:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765564135; x=1797100135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JVM9Tvx71WZz20zuANbMqqCcNUN6d93n0hf3/jYRx3A=;
 b=Fphiebl2JkRnfTH9GoTKdjJbRmAz/0orHsCfaTJoUBZAPEfDvOZWzWBe
 26fO4vkMWYN6SPQ8cCXJF4SJTXASfPzGyf6NYbThZwdpHuRrgWYFdPlJI
 zXgm4CrM7n7ZxOJTyKc4PJK5nEOb/qhrBy1yKCZ/OD/nUXVYWJrmSpNY/
 l919nX/LFqmvh8blQRKmkNcAv8ermOFF5LsrPRy92OSBGKzMzfgSEzCVq
 NVQS0SdZFgcglhGeKHK8rb2nvPGJy/w1A1H8KD04XGB/1vKUGOdCiYbBY
 J7srm4F4OOpi1JARnG70ImuoQxXpcZp9cyNv7w8BtzGaEKCnNRSqI4+9I w==;
X-CSE-ConnectionGUID: F4WgzU9oTHq4WtVhxoOfRQ==
X-CSE-MsgGUID: QwPoLTSiQeyWVujK5kxjOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71432800"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71432800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:54 -0800
X-CSE-ConnectionGUID: ZBLKUb5RQse4xjbRZ/6TKQ==
X-CSE-MsgGUID: cauRkglgR8aM9iwxY7SZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="201633952"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 10:28:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 michal.mrozek@intel.com
Subject: [PATCH v2 5/7] drm/xe: Wait on in-syncs when swicthing to dma-fence
 mode
Date: Fri, 12 Dec 2025 10:28:45 -0800
Message-Id: <20251212182847.1683222-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212182847.1683222-1-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
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

If a dma-fence submission has in-fences and pagefault queues are running
work, there is little incentive to kick the pagefault queues off the
hardware until the dma-fence submission is ready to run. Therefore, wait
on the in-fences of the dma-fence submission before removing the
pagefault queues from the hardware.

v2:
 - Fix kernel doc (CI)
 - Don't wait under lock (Thomas)
 - Make wait interruptable

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c            |  9 +++--
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 44 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++-
 drivers/gpu/drm/xe/xe_sync.c            | 29 ++++++++++++++++
 drivers/gpu/drm/xe/xe_sync.h            |  2 ++
 5 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 4d81210e41f5..d462add2d005 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -121,7 +121,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
 	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
 	struct drm_exec *exec = &vm_exec.exec;
-	u32 i, num_syncs, num_ufence = 0;
+	u32 i, num_syncs, num_in_sync = 0, num_ufence = 0;
 	struct xe_validation_ctx ctx;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
@@ -182,6 +182,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 		if (xe_sync_is_ufence(&syncs[num_syncs]))
 			num_ufence++;
+
+		if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
+			num_in_sync++;
 	}
 
 	if (XE_IOCTL_DBG(xe, num_ufence > 1)) {
@@ -202,7 +205,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	mode = xe_hw_engine_group_find_exec_mode(q);
 
 	if (mode == EXEC_MODE_DMA_FENCE) {
-		err = xe_hw_engine_group_get_mode(group, mode, &previous_mode);
+		err = xe_hw_engine_group_get_mode(group, mode, &previous_mode,
+						  syncs, num_in_sync ?
+						  num_syncs : 0);
 		if (err)
 			goto err_syncs;
 	}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index 4d9263a1a208..022fc0c30d38 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -11,6 +11,7 @@
 #include "xe_gt.h"
 #include "xe_gt_stats.h"
 #include "xe_hw_engine_group.h"
+#include "xe_sync.h"
 #include "xe_vm.h"
 
 static void
@@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
 	int err;
 	enum xe_hw_engine_group_execution_mode previous_mode;
 
-	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode);
+	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode,
+					  NULL, 0);
 	if (err)
 		return;
 
@@ -189,10 +191,12 @@ void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group
 /**
  * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
  * @group: The hw engine group
+ * @has_deps: dma-fence job triggering suspend has dependencies
  *
  * Return: 0 on success, negative error code on error.
  */
-static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group)
+static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group *group,
+						       bool has_deps)
 {
 	int err;
 	struct xe_exec_queue *q;
@@ -201,11 +205,19 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 	lockdep_assert_held_write(&group->mode_sem);
 
 	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		bool idle_skip_suspend;
+
 		if (!xe_vm_in_fault_mode(q->vm))
 			continue;
 
+		idle_skip_suspend = xe_exec_queue_idle_skip_suspend(q);
+		if (!idle_skip_suspend && has_deps)
+			return -EAGAIN;
+
 		xe_gt_stats_incr(q->gt, XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
-		need_resume |= !xe_exec_queue_idle_skip_suspend(q);
+
+
+		need_resume |= !idle_skip_suspend;
 		q->ops->suspend(q);
 	}
 
@@ -258,7 +270,7 @@ static int xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
 	return 0;
 }
 
-static int switch_mode(struct xe_hw_engine_group *group)
+static int switch_mode(struct xe_hw_engine_group *group, bool has_deps)
 {
 	int err = 0;
 	enum xe_hw_engine_group_execution_mode new_mode;
@@ -268,7 +280,8 @@ static int switch_mode(struct xe_hw_engine_group *group)
 	switch (group->cur_mode) {
 	case EXEC_MODE_LR:
 		new_mode = EXEC_MODE_DMA_FENCE;
-		err = xe_hw_engine_group_suspend_faulting_lr_jobs(group);
+		err = xe_hw_engine_group_suspend_faulting_lr_jobs(group,
+								  has_deps);
 		break;
 	case EXEC_MODE_DMA_FENCE:
 		new_mode = EXEC_MODE_LR;
@@ -289,14 +302,18 @@ static int switch_mode(struct xe_hw_engine_group *group)
  * @group: The hw engine group
  * @new_mode: The new execution mode
  * @previous_mode: Pointer to the previous mode provided for use by caller
+ * @syncs: Syncs from exec IOCTL
+ * @num_syncs: Number of syncs from exec IOCTL
  *
  * Return: 0 if successful, -EINTR if locking failed.
  */
 int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
 				enum xe_hw_engine_group_execution_mode new_mode,
-				enum xe_hw_engine_group_execution_mode *previous_mode)
+				enum xe_hw_engine_group_execution_mode *previous_mode,
+				struct xe_sync_entry *syncs, int num_syncs)
 __acquires(&group->mode_sem)
 {
+	bool has_deps = !!num_syncs;
 	int err = down_read_interruptible(&group->mode_sem);
 
 	if (err)
@@ -306,14 +323,27 @@ __acquires(&group->mode_sem)
 
 	if (new_mode != group->cur_mode) {
 		up_read(&group->mode_sem);
+retry:
 		err = down_write_killable(&group->mode_sem);
 		if (err)
 			return err;
 
 		if (new_mode != group->cur_mode) {
-			err = switch_mode(group);
+			err = switch_mode(group, has_deps);
 			if (err) {
 				up_write(&group->mode_sem);
+				if (err == -EAGAIN) {
+					int i;
+
+					for (i = 0; i < num_syncs; ++i) {
+						err = xe_sync_entry_wait(syncs + i);
+						if (err)
+							return err;
+					}
+
+					has_deps = false;
+					goto retry;
+				}
 				return err;
 			}
 		}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
index 797ee81acbf2..8b17ccd30b70 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -11,6 +11,7 @@
 struct drm_device;
 struct xe_exec_queue;
 struct xe_gt;
+struct xe_sync_entry;
 
 int xe_hw_engine_setup_groups(struct xe_gt *gt);
 
@@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 
 int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
 				enum xe_hw_engine_group_execution_mode new_mode,
-				enum xe_hw_engine_group_execution_mode *previous_mode);
+				enum xe_hw_engine_group_execution_mode *previous_mode,
+				struct xe_sync_entry *syncs, int num_syncs);
 void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
 
 enum xe_hw_engine_group_execution_mode
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 1fc4fa278b78..d970e11962ff 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -228,6 +228,35 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync, struct xe_sched_job *job)
 	return 0;
 }
 
+/**
+ * xe_sync_entry_wait() - Wait on in-sync
+ * @sync: Sync object
+ *
+ * If the sync is in an in-sync, wait on the sync to signal.
+ *
+ * Return: 0 on success, -ERESTARTSYS on failure (interruption)
+ */
+int xe_sync_entry_wait(struct xe_sync_entry *sync)
+{
+	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
+		return 0;
+
+	return dma_fence_wait(sync->fence, true);
+}
+
+/**
+ * xe_sync_needs_wait() - Sync needs a wait (input dma-fence not signaled)
+ * @sync: Sync object
+ *
+ * Return: True if sync needs a wait, False otherwise
+ */
+bool xe_sync_needs_wait(struct xe_sync_entry *sync)
+{
+
+	return !(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL) &&
+		!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &sync->fence->flags);
+}
+
 void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
 {
 	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 51f2d803e977..6b949194acff 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -29,6 +29,8 @@ int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
 			   struct xe_sched_job *job);
 void xe_sync_entry_signal(struct xe_sync_entry *sync,
 			  struct dma_fence *fence);
+int xe_sync_entry_wait(struct xe_sync_entry *sync);
+bool xe_sync_needs_wait(struct xe_sync_entry *sync);
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
 struct dma_fence *
 xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
-- 
2.34.1

