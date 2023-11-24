Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D18C61DF4
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 15:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833AD10E802;
	Fri, 24 Nov 2023 15:23:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1913A10E20D
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Nov 2023 15:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700839425; x=1732375425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8mc8QySs5lpkC3KCxRBwCppTED9DcmSCxLP7nlN1P8=;
 b=ZB+YIBqbuo49jvzcyR0tdvpbI/TPTH27aoLsOf9Pc0WVSuJ3YxMMqkXz
 N+8ncF3451SYcUVRfggUsiVyEGc9yhAiSSkFtZlEQzS8g7UNVXF18sNAA
 zsHQ5ma7VDh4Vlx2QLKzg+ZWjdPR7P7wS8VJoymzk7aqbKiwKbEHbmvWX
 oGKpBrMxZVJmRjgRPGKDqph0NpRv/LKqgO8TFKclBp4OlTz8lXEMy2qvE
 2dHGOED8OzIl2lvfdF3qwIYP1emB3IAWr4V6CocJwi3lDaPtbp2D1Ppy2
 gjde03QfXmq2PW+rGOL+JCuzKEYe+3NQSIIFUmQt+L1bZZrT/i1FOFaSL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478647686"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="478647686"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="858407719"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="858407719"
Received: from cschimpe-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.175])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:23:43 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 24 Nov 2023 16:23:19 +0100
Message-ID: <20231124152320.97115-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124152320.97115-1-thomas.hellstrom@linux.intel.com>
References: <20231124152320.97115-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Internally change the compute_mode
 and no_dma_fence mode naming
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

The name "compute_mode" can be confusing since compute uses either this
mode or fault_mode to achieve the long-running semantics, and compute_mode
can, moving forward, enable fault_mode under the hood to work around
hardware limitations.

Also the name no_dma_fence_mode really refers to what we elsewhere call
long-running mode and the mode contrary to what its name suggests allows
dma-fences as in-fences.

So in an attempt to be more consistent, rename
no_dma_fence_mode -> lr_mode
compute_mode      -> preemt_fence_mode

And adjust flags so that

preempt_fence_mode sets XE_VM_FLAG_LR_MODE
fault_mode sets XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c       | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_exec_queue.c |  8 ++++----
 drivers/gpu/drm/xe/xe_guc_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_pt.c         |  6 +++---
 drivers/gpu/drm/xe/xe_sched_job.c  |  2 +-
 drivers/gpu/drm/xe/xe_sync.c       |  6 +++---
 drivers/gpu/drm/xe/xe_vm.c         | 20 ++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h         | 16 ++++++++--------
 drivers/gpu/drm/xe/xe_vm_types.h   |  2 +-
 9 files changed, 39 insertions(+), 39 deletions(-)

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
index 62d0237e724e..d932c31f9fa4 100644
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
index 9e9e925c7353..97e87c701af5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1211,7 +1211,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	ge->q = q;
 	init_waitqueue_head(&ge->suspend_wait);
 
-	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
+	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
 			    get_submit_wq(guc),
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 338bffe4885f..c2af86b0de75 100644
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
index eafe53c2f55d..ea96ba4b41da 100644
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
 	signal = sync_in.flags & DRM_XE_SYNC_FLAG_SIGNAL;
 	switch (sync_in.flags & SYNC_FLAGS_TYPE_MASK) {
 	case DRM_XE_SYNC_FLAG_SYNCOBJ:
-		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
 			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
@@ -136,7 +136,7 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
 		break;
 
 	case DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ:
-		if (XE_IOCTL_DBG(xe, no_dma_fences && signal))
+		if (XE_IOCTL_DBG(xe, in_lr_mode && signal))
 			return -EOPNOTSUPP;
 
 		if (XE_IOCTL_DBG(xe, upper_32_bits(sync_in.addr)))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b39c6f43f01f..5a4483bb00b1 100644
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
@@ -1973,11 +1973,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE)
 		flags |= XE_VM_FLAG_SCRATCH_PAGE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_COMPUTE_MODE)
-		flags |= XE_VM_FLAG_COMPUTE_MODE;
+		flags |= XE_VM_FLAG_LR_MODE;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
 		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
-		flags |= XE_VM_FLAG_FAULT_MODE;
+		flags |= XE_VM_FLAG_LR_MODE | XE_VM_FLAG_FAULT_MODE;
 
 	vm = xe_vm_create(xe, flags);
 	if (IS_ERR(vm))
@@ -3065,7 +3065,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
-- 
2.41.0

