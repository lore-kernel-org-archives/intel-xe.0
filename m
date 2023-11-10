Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06B6C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 13:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9878B10E03C;
	Fri, 10 Nov 2023 13:59:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A7810E03C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Nov 2023 13:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699624777; x=1731160777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fYgVIquNgIqX5GvODEsevMMapa7+eQrKtRR3bGM1bgY=;
 b=Juddn/4+ez4eS+VV6QpFeFXo3+/aD3iYpEoFEPvFxAtzR1vYLK5697hu
 cEgUwC9lwNuxWwWvQ7AhiifNW4/xuXwPQiLwCKdPmpUfsnslRg0ZrUCOs
 gC5HYCGOsSljrrr5lHG6mIrJhdnfuG5OKP5lDMeikFUT1NGXCqQ6RBaXg
 gzZoYPjzoAqt0nfPbMQbgjBoF4vgd4ktkpGi1HlzQR7uf0ekUoqJNxgzz
 +4Z+XrkTrq1UULvQ8xV4UY4+FuJxNS0/u3X24UO6W50ZUZ71ou99gt1XS
 WWmtIHhkx4LmHmhadDgndBiu6bwCVrGvBG2vBmdMEeWS+VWCthA/auPwW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456684130"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="456684130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 05:59:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1095195419"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="1095195419"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.223])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 05:59:34 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 10 Nov 2023 14:59:13 +0100
Message-ID: <20231110135913.18890-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH] drm/xe/vm,
 drm/xe/uapi: Use LR abbrev for long-running vms
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently we're using "compute mode" for long running VMs using
using preempt-fences for memory management, and "fault mode" for long
running VMs using page faults. Internally the driver uses "no_dma_fences"
for long-running vms which is a bit misleading since dma-fences are only
disallowed as out-fences.

Change this to use the terminology "long-running" abbreviated as LR for
long-running VMs. These VMs can then either be in preempt-fence mode or
fault mode. The user can force fault mode at creation time, but otherwise
the driver can choose to use fault- or preempt-fence mode for long-running
vms depending on the device capabilities. Initially unless fault-mode is
specified, the driver uses preempt-fence mode.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c       | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_exec_queue.c |  8 ++++----
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c         |  6 +++---
 drivers/gpu/drm/xe/xe_sched_job.c  |  2 +-
 drivers/gpu/drm/xe/xe_sync.c       |  6 +++---
 drivers/gpu/drm/xe/xe_vm.c         | 24 ++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.h         | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h   |  2 +-
 include/uapi/drm/xe_drm.h          |  2 +-
 10 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 28e84a0bbeb0..347239f28170 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -100,7 +100,7 @@ static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
 	LIST_HEAD(dups);
 	int err = 0;
 
-	if (xe_vm_no_dma_fences(vm))
+	if (xe_vm_in_lr_mode(vm))
 		return 0;
 
 	/*
@@ -182,7 +182,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (i = 0; i < args->num_syncs; i++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
 					  &syncs_user[i], true,
-					  xe_vm_no_dma_fences(vm));
+					  xe_vm_in_lr_mode(vm));
 		if (err)
 			goto err_syncs;
 	}
@@ -197,7 +197,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 retry:
-	if (!xe_vm_no_dma_fences(vm) && xe_vm_userptr_check_repin(vm)) {
+	if (!xe_vm_in_lr_mode(vm) && xe_vm_userptr_check_repin(vm)) {
 		err = down_write_killable(&vm->lock);
 		write_locked = true;
 	} else {
@@ -279,7 +279,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	}
 
 	/* Wait behind munmap style rebinds */
-	if (!xe_vm_no_dma_fences(vm)) {
+	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
 							  &vm->resv,
 							  DMA_RESV_USAGE_KERNEL);
@@ -292,7 +292,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		goto err_put_job;
 
-	if (!xe_vm_no_dma_fences(vm)) {
+	if (!xe_vm_in_lr_mode(vm)) {
 		err = down_read_interruptible(&vm->userptr.notifier_lock);
 		if (err)
 			goto err_put_job;
@@ -307,7 +307,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * the job and let the DRM scheduler / backend clean up the job.
 	 */
 	xe_sched_job_arm(job);
-	if (!xe_vm_no_dma_fences(vm)) {
+	if (!xe_vm_in_lr_mode(vm)) {
 		/* Block userptr invalidations / BO eviction */
 		dma_resv_add_fence(&vm->resv,
 				   &job->drm.s_fence->finished,
@@ -330,14 +330,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_push(job);
 	xe_vm_reactivate_rebind(vm);
 
-	if (!err && !xe_vm_no_dma_fences(vm)) {
+	if (!err && !xe_vm_in_lr_mode(vm)) {
 		spin_lock(&xe->ttm.lru_lock);
 		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
 		spin_unlock(&xe->ttm.lru_lock);
 	}
 
 err_repin:
-	if (!xe_vm_no_dma_fences(vm))
+	if (!xe_vm_in_lr_mode(vm))
 		up_read(&vm->userptr.notifier_lock);
 err_put_job:
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 4fd44a9203e4..ac77d2a7b45f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -327,7 +327,7 @@ static int exec_queue_set_persistence(struct xe_device *xe, struct xe_exec_queue
 	if (XE_IOCTL_DBG(xe, !create))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, xe_vm_in_compute_mode(q->vm)))
+	if (XE_IOCTL_DBG(xe, xe_vm_in_preempt_fence_mode(q->vm)))
 		return -EINVAL;
 
 	if (value)
@@ -705,14 +705,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 
 		q = xe_exec_queue_create(xe, vm, logical_mask,
 					 args->width, hwe,
-					 xe_vm_no_dma_fences(vm) ? 0 :
+					 xe_vm_in_lr_mode(vm) ? 0 :
 					 EXEC_QUEUE_FLAG_PERSISTENT);
 		up_read(&vm->lock);
 		xe_vm_put(vm);
 		if (IS_ERR(q))
 			return PTR_ERR(q);
 
-		if (xe_vm_in_compute_mode(vm)) {
+		if (xe_vm_in_preempt_fence_mode(vm)) {
 			q->compute.context = dma_fence_context_alloc(1);
 			spin_lock_init(&q->compute.lock);
 
@@ -785,7 +785,7 @@ int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
  */
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 {
-	return q->vm && xe_vm_no_dma_fences(q->vm) &&
+	return q->vm && xe_vm_in_lr_mode(q->vm) &&
 		!(q->flags & EXEC_QUEUE_FLAG_VM);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 870dc5c532fa..ee797fa2a774 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1161,7 +1161,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	ge->q = q;
 	init_waitqueue_head(&ge->suspend_wait);
 
-	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
+	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 31afab617b4e..9277541ea048 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1292,8 +1292,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 	 * non-faulting LR, in particular on user-space batch buffer chaining,
 	 * it needs to be done here.
 	 */
-	if ((rebind && !xe_vm_no_dma_fences(vm) && !vm->batch_invalidate_tlb) ||
-	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_compute_mode(vm))) {
+	if ((rebind && !xe_vm_in_lr_mode(vm) && !vm->batch_invalidate_tlb) ||
+	    (!rebind && vm->scratch_bo[tile->id] && xe_vm_in_preempt_fence_mode(vm))) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence)
 			return ERR_PTR(-ENOMEM);
@@ -1355,7 +1355,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 			xe_bo_put_commit(&deferred);
 		}
 		if (!rebind && last_munmap_rebind &&
-		    xe_vm_in_compute_mode(vm))
+		    xe_vm_in_preempt_fence_mode(vm))
 			xe_vm_queue_rebind_worker(vm);
 	} else {
 		kfree(rfence);
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index adbd82f8744e..b467d5bfa4ac 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -92,7 +92,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
 	/* Migration and kernel engines have their own locking */
 	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
 		lockdep_assert_held(&q->vm->lock);
-		if (!xe_vm_no_dma_fences(q->vm))
+		if (!xe_vm_in_lr_mode(q->vm))
 			xe_vm_assert_held(q->vm);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 73ef259aa387..5874a3c50a97 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -100,7 +100,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
 int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 			struct xe_sync_entry *sync,
 			struct drm_xe_sync __user *sync_user,
-			bool exec, bool no_dma_fences)
+			bool exec, bool in_lr_mode)
 {
 	struct drm_xe_sync sync_in;
 	int err;
@@ -118,7 +118,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 	signal = sync_in.flags & DRM_XE_SYNC_SIGNAL;
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_SYNCOBJ:
-		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
 			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
@@ -136,7 +136,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_TIMELINE_SYNCOBJ:
-		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
 			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d26c90f0d702..dae35dbb7955 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -335,7 +335,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	int err;
 	bool wait;
 
-	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
+	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 
 	down_write(&vm->lock);
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
@@ -389,7 +389,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  */
 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	if (!xe_vm_in_compute_mode(vm))
+	if (!xe_vm_in_preempt_fence_mode(vm))
 		return;
 
 	down_write(&vm->lock);
@@ -592,7 +592,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	long wait;
 	int __maybe_unused tries = 0;
 
-	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
+	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 	trace_xe_vm_rebind_worker_enter(vm);
 
 	down_write(&vm->lock);
@@ -836,7 +836,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	struct xe_vma *vma, *next;
 
 	lockdep_assert_held(&vm->lock);
-	if (xe_vm_no_dma_fences(vm) && !rebind_worker)
+	if (xe_vm_in_lr_mode(vm) && !rebind_worker)
 		return NULL;
 
 	xe_vm_assert_held(vm);
@@ -1409,9 +1409,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		vm->batch_invalidate_tlb = true;
 	}
 
-	if (flags & XE_VM_FLAG_COMPUTE_MODE) {
+	if (flags & XE_VM_FLAG_LR_MODE) {
 		INIT_WORK(&vm->preempt.rebind_work, preempt_rebind_work_func);
-		vm->flags |= XE_VM_FLAG_COMPUTE_MODE;
+		vm->flags |= XE_VM_FLAG_LR_MODE;
 		vm->batch_invalidate_tlb = false;
 	}
 
@@ -1514,7 +1514,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_assert(xe, !vm->preempt.num_exec_queues);
 
 	xe_vm_close(vm);
-	if (xe_vm_in_compute_mode(vm))
+	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
 	down_write(&vm->lock);
@@ -1919,7 +1919,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 }
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
-				    DRM_XE_VM_CREATE_COMPUTE_MODE | \
+				    DRM_XE_VM_CREATE_LR_MODE | \
 				    DRM_XE_VM_CREATE_ASYNC_DEFAULT | \
 				    DRM_XE_VM_CREATE_FAULT_MODE)
 
@@ -1955,7 +1955,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
 
-	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE &&
+	if (XE_IOCTL_DBG(xe, !(args->flags & DRM_XE_VM_CREATE_LR_MODE) &&
 			 args->flags & DRM_XE_VM_CREATE_FAULT_MODE))
 		return -EINVAL;
 
@@ -1972,8 +1972,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	if (args->flags & DRM_XE_VM_CREATE_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
-	if (args->flags & DRM_XE_VM_CREATE_COMPUTE_MODE)
-		flags |= XE_VM_FLAG_COMPUTE_MODE;
+	if (args->flags & DRM_XE_VM_CREATE_LR_MODE)
+		flags |= XE_VM_FLAG_LR_MODE;
 	if (args->flags & DRM_XE_VM_CREATE_ASYNC_DEFAULT)
 		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
 	if (args->flags & DRM_XE_VM_CREATE_FAULT_MODE)
@@ -3087,7 +3087,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
 		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
 					  &syncs_user[num_syncs], false,
-					  xe_vm_no_dma_fences(vm));
+					  xe_vm_in_lr_mode(vm));
 		if (err)
 			goto free_syncs;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b08c75fbd8a1..9a0ae19c47b7 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -152,19 +152,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
 
 void xe_vm_close_and_put(struct xe_vm *vm);
 
-static inline bool xe_vm_in_compute_mode(struct xe_vm *vm)
+static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
 {
-	return vm->flags & XE_VM_FLAG_COMPUTE_MODE;
+	return vm->flags & XE_VM_FLAG_FAULT_MODE;
 }
 
-static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
+static inline bool xe_vm_in_lr_mode(struct xe_vm *vm)
 {
-	return vm->flags & XE_VM_FLAG_FAULT_MODE;
+	return vm->flags & XE_VM_FLAG_LR_MODE;
 }
 
-static inline bool xe_vm_no_dma_fences(struct xe_vm *vm)
+static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
 {
-	return xe_vm_in_compute_mode(vm) || xe_vm_in_fault_mode(vm);
+	return xe_vm_in_lr_mode(vm) && !xe_vm_in_fault_mode(vm);
 }
 
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
@@ -186,7 +186,7 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
 
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
-	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
+	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
 }
 
@@ -201,7 +201,7 @@ static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
  */
 static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 {
-	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
+	if (xe_vm_in_preempt_fence_mode(vm) && vm->preempt.rebind_deactivated) {
 		vm->preempt.rebind_deactivated = false;
 		xe_vm_queue_rebind_worker(vm);
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aaf0c7101019..f23e8f462eff 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -161,7 +161,7 @@ struct xe_vm {
 	 * from XE_VM_FLAG_BANNED which requires vm->lock to set / read safely
 	 */
 #define XE_VM_FLAG_64K			BIT(0)
-#define XE_VM_FLAG_COMPUTE_MODE		BIT(1)
+#define XE_VM_FLAG_LR_MODE		BIT(1)
 #define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
 #define XE_VM_FLAG_MIGRATION		BIT(3)
 #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 9bd7092a7ea4..1c574dd3bed9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -596,7 +596,7 @@ struct drm_xe_vm_create {
 	__u64 extensions;
 
 #define DRM_XE_VM_CREATE_SCRATCH_PAGE	(0x1 << 0)
-#define DRM_XE_VM_CREATE_COMPUTE_MODE	(0x1 << 1)
+#define DRM_XE_VM_CREATE_LR_MODE	(0x1 << 1)
 #define DRM_XE_VM_CREATE_ASYNC_DEFAULT	(0x1 << 2)
 #define DRM_XE_VM_CREATE_FAULT_MODE	(0x1 << 3)
 	/** @flags: Flags */
-- 
2.41.0

