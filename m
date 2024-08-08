Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486BCC52D7B
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 18:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A3710E7D9;
	Thu,  8 Aug 2024 18:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lgeOj7AR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF0C10E7D6
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723142566; x=1754678566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Fp4jV8L5PPaTUWa7fvvITUlqnOC3bcJz4kTmO2WV+M=;
 b=lgeOj7ARLV3ep5s0AED5aXhdALygJPkHnuBV0bKDJi9hN5/zRx269IT+
 cZ1Q3vZZpGiGvhhmQrawsXqn56JyqrBgZTCwb3QCVjqfQKdhGdevHA/D5
 70BfYqC7ckKQd6JpTuP5h7FZ7l12SrpiPjzs8fbodq0VHIciPl6S2U/7h
 ettUeB6qJhEkVrg3ME3kuz1KWnpsHjjTK4Jgw331Slnhp2y4y1JePrmxP
 F55boNsB0BiPnfkIBcETrCn+jWio0tyyS0ULaw0spFUhVTdx0KOpbhLk5
 esjTY6PpyZCIgoJI4mVBHzG84IuT0p6M8wn9tmSgX8L8O2U0vGR731qss A==;
X-CSE-ConnectionGUID: sWJA3J4ZROGK400kdp6jdw==
X-CSE-MsgGUID: xde5r6GAQS6nKSUxzrCBqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31921608"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="31921608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:46 -0700
X-CSE-ConnectionGUID: qXy6oqY5TQyfOAcT+Y7Eag==
X-CSE-MsgGUID: 32hCaCZVSOWA6Xg9alHrNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; d="scan'208";a="56975935"
Received: from ettammin-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.209])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 11:42:45 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com,
	Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH v8 09/11] drm/xe/exec: Switch hw engine group execution mode
 upon job submission
Date: Thu,  8 Aug 2024 20:40:27 +0200
Message-ID: <20240808184220.1715625-10-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808184220.1715625-1-francois.dugast@intel.com>
References: <20240808184220.1715625-1-francois.dugast@intel.com>
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

If the job about to be submitted is a dma-fence job, update the current
execution mode of the hw engine group. This triggers an immediate suspend
of the exec queues running faulting long-running jobs.

If the job about to be submitted is a long-running job, kick a new worker
used to resume the exec queues running faulting long-running jobs once
the dma-fence jobs have completed.

v2: Kick the resume worker from exec IOCTL, switch to unordered workqueue,
    destroy it after use (Matt Brost)

v3: Do not resume if no exec queue was suspended (Matt Brost)

v4: Squash commits (Matt Brost)

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c            | 20 +++++++-
 drivers/gpu/drm/xe/xe_hw_engine_group.c | 62 ++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index f36980aa26e6..484acfbe0e61 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -14,6 +14,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_exec_queue.h"
+#include "xe_hw_engine_group.h"
 #include "xe_macros.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
@@ -124,6 +125,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	bool write_locked, skip_retry = false;
 	ktime_t end = 0;
 	int err = 0;
+	struct xe_hw_engine_group *group;
+	enum xe_hw_engine_group_execution_mode mode, previous_mode;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
 	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
@@ -182,6 +185,15 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
+	group = q->hwe->hw_engine_group;
+	mode = xe_hw_engine_group_find_exec_mode(q);
+
+	if (mode == EXEC_MODE_DMA_FENCE) {
+		err = xe_hw_engine_group_get_mode(group, mode, &previous_mode);
+		if (err)
+			goto err_syncs;
+	}
+
 retry:
 	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
 		err = down_write_killable(&vm->lock);
@@ -199,7 +211,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		downgrade_write(&vm->lock);
 		write_locked = false;
 		if (err)
-			goto err_unlock_list;
+			goto err_hw_exec_mode;
 	}
 
 	if (!args->num_batch_buffer) {
@@ -312,6 +324,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		spin_unlock(&xe->ttm.lru_lock);
 	}
 
+	if (mode == EXEC_MODE_LR)
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
+
 err_repin:
 	if (!xe_vm_in_lr_mode(vm))
 		up_read(&vm->userptr.notifier_lock);
@@ -324,6 +339,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
 		goto retry;
+err_hw_exec_mode:
+	if (mode == EXEC_MODE_DMA_FENCE)
+		xe_hw_engine_group_put(group);
 err_syncs:
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
index e6c235119351..f966b8207c0c 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
@@ -17,9 +17,36 @@ hw_engine_group_free(struct drm_device *drm, void *arg)
 {
 	struct xe_hw_engine_group *group = arg;
 
+	destroy_workqueue(group->resume_wq);
 	kfree(group);
 }
 
+static void
+hw_engine_group_resume_lr_jobs_func(struct work_struct *w)
+{
+	struct xe_exec_queue *q;
+	struct xe_hw_engine_group *group = container_of(w, struct xe_hw_engine_group, resume_work);
+	int err;
+	enum xe_hw_engine_group_execution_mode previous_mode;
+
+	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR, &previous_mode);
+	if (err)
+		return;
+
+	if (previous_mode == EXEC_MODE_LR)
+		goto put;
+
+	list_for_each_entry(q, &group->exec_queue_list, hw_engine_group_link) {
+		if (!xe_vm_in_fault_mode(q->vm))
+			continue;
+
+		q->ops->resume(q);
+	}
+
+put:
+	xe_hw_engine_group_put(group);
+}
+
 static struct xe_hw_engine_group *
 hw_engine_group_alloc(struct xe_device *xe)
 {
@@ -30,7 +57,12 @@ hw_engine_group_alloc(struct xe_device *xe)
 	if (!group)
 		return ERR_PTR(-ENOMEM);
 
+	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
+	if (!group->resume_wq)
+		return ERR_PTR(-ENOMEM);
+
 	init_rwsem(&group->mode_sem);
+	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
 	INIT_LIST_HEAD(&group->exec_queue_list);
 
 	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
@@ -134,7 +166,7 @@ int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct x
 		if (err)
 			goto err_suspend;
 
-		queue_work(group->resume_wq, &group->resume_work);
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
 	}
 
 	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
@@ -167,6 +199,16 @@ void xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct
 	up_write(&group->mode_sem);
 }
 
+/**
+ * xe_hw_engine_group_resume_faulting_lr_jobs() - Asynchronously resume the hw engine group's
+ * faulting LR jobs
+ * @group: The hw engine group
+ */
+void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group)
+{
+	queue_work(group->resume_wq, &group->resume_work);
+}
+
 /**
  * xe_hw_engine_group_suspend_faulting_lr_jobs() - Suspend the faulting LR jobs of this group
  * @group: The hw engine group
@@ -177,6 +219,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 {
 	int err;
 	struct xe_exec_queue *q;
+	bool need_resume = false;
 
 	lockdep_assert_held_write(&group->mode_sem);
 
@@ -184,6 +227,7 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 		if (!xe_vm_in_fault_mode(q->vm))
 			continue;
 
+		need_resume = true;
 		q->ops->suspend(q);
 	}
 
@@ -196,6 +240,9 @@ static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct xe_hw_engine_group
 			goto err_suspend;
 	}
 
+	if (need_resume)
+		xe_hw_engine_group_resume_faulting_lr_jobs(group);
+
 	return 0;
 
 err_suspend:
@@ -310,3 +357,16 @@ __releases(&group->mode_sem)
 {
 	up_read(&group->mode_sem);
 }
+
+/**
+ * xe_hw_engine_group_find_exec_mode() - Find the execution mode for this exec queue
+ * @q: The exec_queue
+ */
+enum xe_hw_engine_group_execution_mode
+xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q)
+{
+	if (xe_vm_in_lr_mode(q->vm))
+		return EXEC_MODE_LR;
+	else
+		return EXEC_MODE_DMA_FENCE;
+}
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h b/drivers/gpu/drm/xe/xe_hw_engine_group.h
index e0deb7c7bb5b..797ee81acbf2 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
@@ -22,4 +22,8 @@ int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
 				enum xe_hw_engine_group_execution_mode *previous_mode);
 void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
 
+enum xe_hw_engine_group_execution_mode
+xe_hw_engine_group_find_exec_mode(struct xe_exec_queue *q);
+void xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group *group);
+
 #endif
-- 
2.43.0

