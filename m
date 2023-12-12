Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621BDC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 19:05:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D0810E039;
	Tue, 12 Dec 2023 19:05:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6086110E039
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702407916; x=1733943916;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QTR/dbQNGHaarr7bFYmu8QUmkdstpPJj6l25MANxz0U=;
 b=TFosYgii9uTIuIp5Esl4ijartRS0U9h4PMdQj8aATnNNF9wuu1pqCSe9
 W4ZYyK1Xfo6iiKojlbM6zmntIHKH9jA/TDzb+fAZhebRtOw91gYhQU0dh
 BBDgnTxwXuUJCBc+3grtKngpHDQkCrZvJiNOpQewWgSNax2W8qLF7WtZT
 6/RBOKC9CjQWhRKxQMKDfs/MKEoM5GUFw76RC6E6Bq1wDnlz4TzkDH0hx
 UkNXdx1iuTdErPyqBhsTl7N1LQ67IpmyTwrYAWUfRxB/ZiGb10DuLcuLU
 XEw2UrYFr573oKFYCCokWq0eRWh6TcAKKsZDP9orHIsJ33DgM5WyuHm5n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397641918"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="397641918"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 11:05:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="777205393"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="777205393"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 11:05:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Allow num_batch_buffer / num_binds == 0 in IOCTLs
Date: Tue, 12 Dec 2023 11:05:37 -0800
Message-Id: <20231212190537.529882-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

The idea being out-syncs can signal indicating all previous operations
on the bind queue are complete. An example use case of this would be
support for implementing vkQueueWaitIdle easily.

All in-syncs are waited on before signaling out-syncs. This is
implemented by forming a composite software fence of in-syncs and
installing this fence in the out-syncs and exec queue last fence slot.

The last fence must be added as a dependency for jobs on user exec
queues as it is possible for the last fence to be a composite software
fence (unordered, ioctl with zero bb or binds) rather than hardware
fence (ordered, previous job on queue).

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c             | 27 +++++++-
 drivers/gpu/drm/xe/xe_exec_queue.c       |  5 +-
 drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +-
 drivers/gpu/drm/xe/xe_migrate.c          | 14 ++++-
 drivers/gpu/drm/xe/xe_sched_job.c        | 18 ++++++
 drivers/gpu/drm/xe/xe_sched_job.h        |  4 ++
 drivers/gpu/drm/xe/xe_sync.c             | 78 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_sync.h             |  6 ++
 drivers/gpu/drm/xe/xe_vm.c               | 77 ++++++++++++++++-------
 9 files changed, 206 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 3c9f801d570b..ba92e5619da3 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -131,7 +131,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
+	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
+			 q->width != args->num_batch_buffer))
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
@@ -207,6 +208,24 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
+	if (!args->num_batch_buffer) {
+		if (!xe_vm_in_lr_mode(vm)) {
+			struct dma_fence *fence;
+
+			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
+			if (IS_ERR(fence)) {
+				err = PTR_ERR(fence);
+				goto err_exec;
+			}
+			for (i = 0; i < num_syncs; i++)
+				xe_sync_entry_signal(&syncs[i], NULL, fence);
+			xe_exec_queue_last_fence_set(q, vm, fence);
+			dma_fence_put(fence);
+		}
+
+		goto err_exec;
+	}
+
 	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
 		err = -EWOULDBLOCK;
 		goto err_exec;
@@ -266,6 +285,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_put_job;
 
 	if (!xe_vm_in_lr_mode(vm)) {
+		err = xe_sched_job_last_fence_add_dep(job, vm);
+		if (err)
+			goto err_put_job;
+
 		err = down_read_interruptible(&vm->userptr.notifier_lock);
 		if (err)
 			goto err_put_job;
@@ -290,6 +313,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 	if (xe_exec_queue_is_lr(q))
 		q->ring_ops->emit_job(job);
+	if (!xe_vm_in_lr_mode(vm))
+		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 85bc25fe99ed..eeb9605dd45f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -886,7 +886,10 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
 static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
-	lockdep_assert_held_write(&vm->lock);
+	if (q->flags & EXEC_QUEUE_FLAG_VM)
+		lockdep_assert_held(&vm->lock);
+	else
+		xe_vm_assert_held(vm);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 6826feb650f3..c7aefa1c8c31 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -66,8 +66,9 @@ struct xe_exec_queue {
 	struct xe_hw_fence_irq *fence_irq;
 
 	/**
-	 * @last_fence: last fence on engine, protected by vm->lock in write
-	 * mode if bind engine
+	 * @last_fence: last fence on exec queue, protected by vm->lock in write
+	 * mode if bind exec queue, protected by dma resv lock if non-bind exec
+	 * queue
 	 */
 	struct dma_fence *last_fence;
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2ca927f3fb2a..5fd0706a6045 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1163,17 +1163,24 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	return fence;
 }
 
-static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
+static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
+			struct xe_sync_entry *syncs, u32 num_syncs)
 {
+	struct dma_fence *fence;
 	int i;
 
 	for (i = 0; i < num_syncs; i++) {
-		struct dma_fence *fence = syncs[i].fence;
+		fence = syncs[i].fence;
 
 		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				       &fence->flags))
 			return false;
 	}
+	if (q) {
+		fence = xe_exec_queue_last_fence_get(q, vm);
+		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+			return false;
+	}
 
 	return true;
 }
@@ -1234,7 +1241,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 
 	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
+	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
 		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
 							num_updates,
 							first_munmap_rebind,
@@ -1351,6 +1358,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 			goto err_job;
 	}
 
+	err = xe_sched_job_last_fence_add_dep(job, vm);
 	for (i = 0; !err && i < num_syncs; i++)
 		err = xe_sync_entry_add_deps(&syncs[i], job);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index a9c7ae815bec..01106a1156ad 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -260,3 +260,21 @@ void xe_sched_job_push(struct xe_sched_job *job)
 	drm_sched_entity_push_job(&job->drm);
 	xe_sched_job_put(job);
 }
+
+/**
+ * xe_sched_job_last_fence_add_dep - Add last fence dependency to job
+ * @job:job to add the last fence dependency to
+ * @vm: virtual memory job belongs to
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
+{
+	struct dma_fence *fence;
+
+	fence = xe_exec_queue_last_fence_get(job->q, vm);
+	dma_fence_get(fence);
+
+	return drm_sched_job_add_dependency(&job->drm, fence);
+}
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 6ca1d426c036..34f475ba7f50 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -8,6 +8,8 @@
 
 #include "xe_sched_job_types.h"
 
+struct xe_vm;
+
 #define XE_SCHED_HANG_LIMIT 1
 #define XE_SCHED_JOB_TIMEOUT LONG_MAX
 
@@ -54,6 +56,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
 void xe_sched_job_arm(struct xe_sched_job *job);
 void xe_sched_job_push(struct xe_sched_job *job);
 
+int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
+
 static inline struct xe_sched_job *
 to_xe_sched_job(struct drm_sched_job *drm)
 {
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 2a3f508722fc..e4c220cf9115 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -5,6 +5,7 @@
 
 #include "xe_sync.h"
 
+#include <linux/dma-fence-array.h>
 #include <linux/kthread.h>
 #include <linux/sched/mm.h>
 #include <linux/uaccess.h>
@@ -14,6 +15,7 @@
 #include <drm/xe_drm.h>
 
 #include "xe_device_types.h"
+#include "xe_exec_queue.h"
 #include "xe_macros.h"
 #include "xe_sched_job_types.h"
 
@@ -104,6 +106,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	int err;
 	bool exec = flags & SYNC_PARSE_FLAG_EXEC;
 	bool in_lr_mode = flags & SYNC_PARSE_FLAG_LR_MODE;
+	bool disallow_user_fence = flags & SYNC_PARSE_FLAG_DISALLOW_USER_FENCE;
 	bool signal;
 
 	if (copy_from_user(&sync_in, sync_user, sizeof(*sync_user)))
@@ -164,6 +167,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_TYPE_USER_FENCE:
+		if (XE_IOCTL_DBG(xe, disallow_user_fence))
+			return -EOPNOTSUPP;
+
 		if (XE_IOCTL_DBG(xe, !signal))
 			return -EOPNOTSUPP;
 
@@ -264,3 +270,75 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
 	if (sync->ufence)
 		user_fence_put(sync->ufence);
 }
+
+/**
+ * xe_sync_in_fence_get() - Get a fence from syncs, exec queue, and VM
+ * @sync: input syncs
+ * @num_sync: number of syncs
+ * @q: exec queue
+ * @vm: VM
+ *
+ * Get a fence from syncs, exec queue, and VM. If syncs contain in-fences create
+ * and return a composite fence of all in-fences + last fence. If no in-fences
+ * return last fence on  input exec queue. Caller must drop reference to
+ * returned fence.
+ *
+ * Return: fence on success, ERR_PTR(-ENOMEM) on failure
+ */
+struct dma_fence *
+xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
+		     struct xe_exec_queue *q, struct xe_vm *vm)
+{
+	struct dma_fence **fences = NULL;
+	struct dma_fence_array *cf = NULL;
+	struct dma_fence *fence;
+	int i, num_in_fence = 0, current_fence = 0;
+
+	lockdep_assert_held(&vm->lock);
+
+	/* Count in-fences */
+	for (i = 0; i < num_sync; ++i) {
+		if (sync[i].fence) {
+			++num_in_fence;
+			fence = sync[i].fence;
+		}
+	}
+
+	/* Easy case... */
+	if (!num_in_fence) {
+		fence = xe_exec_queue_last_fence_get(q, vm);
+		dma_fence_get(fence);
+		return fence;
+	}
+
+	/* Create composite fence */
+	fences = kmalloc_array(num_in_fence + 1, sizeof(*fences), GFP_KERNEL);
+	if (!fences)
+		return ERR_PTR(-ENOMEM);
+	for (i = 0; i < num_sync; ++i) {
+		if (sync[i].fence) {
+			dma_fence_get(sync[i].fence);
+			fences[current_fence++] = sync[i].fence;
+		}
+	}
+	fences[current_fence++] = xe_exec_queue_last_fence_get(q, vm);
+	dma_fence_get(fences[current_fence - 1]);
+	cf = dma_fence_array_create(num_in_fence, fences,
+				    vm->composite_fence_ctx,
+				    vm->composite_fence_seqno++,
+				    false);
+	if (!cf) {
+		--vm->composite_fence_seqno;
+		goto err_out;
+	}
+
+	return &cf->base;
+
+err_out:
+	while (current_fence)
+		dma_fence_put(fences[--current_fence]);
+	kfree(fences);
+	kfree(cf);
+
+	return ERR_PTR(-ENOMEM);
+}
diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
index 1b748cec4678..d284afbe917c 100644
--- a/drivers/gpu/drm/xe/xe_sync.h
+++ b/drivers/gpu/drm/xe/xe_sync.h
@@ -9,11 +9,14 @@
 #include "xe_sync_types.h"
 
 struct xe_device;
+struct xe_exec_queue;
 struct xe_file;
 struct xe_sched_job;
+struct xe_vm;
 
 #define SYNC_PARSE_FLAG_EXEC			BIT(0)
 #define SYNC_PARSE_FLAG_LR_MODE			BIT(1)
+#define SYNC_PARSE_FLAG_DISALLOW_USER_FENCE	BIT(2)
 
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
@@ -26,5 +29,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync,
 			  struct xe_sched_job *job,
 			  struct dma_fence *fence);
 void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
+struct dma_fence *
+xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
+		     struct xe_exec_queue *q, struct xe_vm *vm);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d1e53905268f..2f3df9ee67c9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2722,7 +2722,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		return -EINVAL;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
-	    XE_IOCTL_DBG(xe, !args->num_binds) ||
 	    XE_IOCTL_DBG(xe, args->num_binds > MAX_BINDS))
 		return -EINVAL;
 
@@ -2837,6 +2836,37 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 	return err;
 }
 
+static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
+				       struct xe_exec_queue *q,
+				       struct xe_sync_entry *syncs,
+				       int num_syncs)
+{
+	struct dma_fence *fence;
+	int i, err = 0;
+
+	fence = xe_sync_in_fence_get(syncs, num_syncs,
+				     to_wait_exec_queue(vm, q), vm);
+	if (IS_ERR(fence))
+		return PTR_ERR(fence);
+
+	for (i = 0; i < num_syncs; i++)
+		xe_sync_entry_signal(&syncs[i], NULL, fence);
+
+	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
+				     fence);
+
+	if (xe_vm_sync_mode(vm, q)) {
+		long timeout = dma_fence_wait(fence, true);
+
+		if (timeout < 0)
+			err = -EINTR;
+	}
+
+	dma_fence_put(fence);
+
+	return err;
+}
+
 int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -2875,7 +2905,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto put_exec_queue;
 		}
 
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
 			err = -EINVAL;
 			goto put_exec_queue;
@@ -2889,7 +2919,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	if (!args->exec_queue_id) {
-		if (XE_IOCTL_DBG(xe, async !=
+		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
 				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
 			err = -EINVAL;
 			goto put_vm;
@@ -2916,16 +2946,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		}
 	}
 
-	bos = kzalloc(sizeof(*bos) * args->num_binds, GFP_KERNEL);
-	if (!bos) {
-		err = -ENOMEM;
-		goto release_vm_lock;
-	}
+	if (args->num_binds) {
+		bos = kcalloc(args->num_binds, sizeof(*bos), GFP_KERNEL);
+		if (!bos) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 
-	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
-	if (!ops) {
-		err = -ENOMEM;
-		goto release_vm_lock;
+		ops = kcalloc(args->num_binds, sizeof(*ops), GFP_KERNEL);
+		if (!ops) {
+			err = -ENOMEM;
+			goto release_vm_lock;
+		}
 	}
 
 	for (i = 0; i < args->num_binds; ++i) {
@@ -2995,12 +3027,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs],
-					  xe_vm_in_lr_mode(vm) ?
-					  SYNC_PARSE_FLAG_LR_MODE : 0);
+					  (xe_vm_in_lr_mode(vm) ?
+					   SYNC_PARSE_FLAG_LR_MODE : 0) |
+					  (!args->num_binds ?
+					   SYNC_PARSE_FLAG_DISALLOW_USER_FENCE : 0));
 		if (err)
 			goto free_syncs;
 	}
 
+	if (!args->num_binds) {
+		err = -ENODATA;
+		goto free_syncs;
+	}
+
 	for (i = 0; i < args->num_binds; ++i) {
 		u64 range = bind_ops[i].range;
 		u64 addr = bind_ops[i].addr;
@@ -3058,12 +3097,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 unwind_ops:
 	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 free_syncs:
-	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
-		struct dma_fence *fence =
-			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
-
-		xe_sync_entry_signal(&syncs[i], NULL, fence);
-	}
+	if (err == -ENODATA)
+		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
 	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
 
@@ -3083,7 +3118,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	kfree(ops);
 	if (args->num_binds > 1)
 		kfree(bind_ops);
-	return err == -ENODATA ? 0 : err;
+	return err;
 }
 
 /**
-- 
2.34.1

