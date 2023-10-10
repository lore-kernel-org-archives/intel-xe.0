Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A78CD80C4
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 12:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629DA10E343;
	Tue, 10 Oct 2023 12:49:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03610E1ED
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Oct 2023 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696942136; x=1728478136;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=biZeowXfggfIpmktRMDPyaz187qKRrItH4hslO9Dgok=;
 b=YADR7XRc1zkCp30WDeRQOVjA6f1SYRcWv0HJS0il3G5o62bwqsXvn0SJ
 04iOUh0GcvfD8YtXllP1KJqSkryvdhqanZLse4mGUMwq/ThFduEVPME8v
 boxn66TUStz2xJHU8F7zPWgdGLXndrCg35UDJkcVWKSaKVRdMsurTuU/t
 FjFSlIymr8RmqZWYjqQ9BdbNtnxiHkvIUHygxNn2EX4ywQENt5VdnAlIM
 0D4qupZnYJsFPiMNwGhUFJbRBq9OsW/1JcvLiZowjrApKVxSgN07NWv8d
 gAImBHa5z3gnYpEWGuMdqOiST2k+YD0HQQvVXSOS1wEXk+d84Xih9eeM0 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374725044"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="374725044"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703302385"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="703302385"
Received: from agargas-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.164])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 05:48:55 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 10 Oct 2023 14:48:36 +0200
Message-ID: <20231010124839.7948-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
References: <20231010124839.7948-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 08/11] drm/xe: Adapt to GPUVM tracking of external /
 evicted objects.
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

Using fine-grained locking for now.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  63 +++-----
 drivers/gpu/drm/xe/xe_exec.c     |  70 ++------
 drivers/gpu/drm/xe/xe_vm.c       | 265 +++++++------------------------
 drivers/gpu/drm/xe/xe_vm.h       |  13 +-
 drivers/gpu/drm/xe/xe_vm_types.h |  36 -----
 5 files changed, 99 insertions(+), 348 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 82381de4876b..cc9984e827b9 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -450,9 +450,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	struct drm_gpuva *gpuva;
 	struct drm_gem_object *obj = &bo->ttm.base;
 	struct drm_gpuvm_bo *vm_bo;
+	bool idle = false;
 	int ret = 0;
 
 	dma_resv_assert_held(bo->ttm.base.resv);
@@ -466,14 +466,15 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	}
 
 	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
-		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
-			struct xe_vma *vma = gpuva_to_vma(gpuva);
-			struct xe_vm *vm = xe_vma_vm(vma);
+		struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
+		struct drm_gpuva *gpuva;
 
-			trace_xe_vma_evict(vma);
+		if (!xe_vm_in_fault_mode(vm)) {
+			drm_gpuvm_bo_evict(vm_bo, true);
+			continue;
+		}
 
-		if (xe_vm_in_fault_mode(vm)) {
-			/* Wait for pending binds / unbinds. */
+		if (!idle) {
 			long timeout;
 
 			if (ctx->no_wait_gpu &&
@@ -485,45 +486,21 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 							DMA_RESV_USAGE_BOOKKEEP,
 							ctx->interruptible,
 							MAX_SCHEDULE_TIMEOUT);
-			if (timeout > 0) {
-				ret = xe_vm_invalidate_vma(vma);
-				XE_WARN_ON(ret);
-			} else if (!timeout) {
-				ret = -ETIME;
-			} else {
-				ret = timeout;
-			}
-
-		} else {
-			bool vm_resv_locked = false;
+			if (!timeout)
+				return -ETIME;
+			if (timeout < 0)
+				return timeout;
 
-			/*
-			 * We need to put the vma on the vm's rebind_list,
-			 * but need the vm resv to do so. If we can't verify
-			 * that we indeed have it locked, put the vma an the
-			 * vm's notifier.rebind_list instead and scoop later.
-			 */
-			if (dma_resv_trylock(xe_vm_resv(vm)))
-				vm_resv_locked = true;
-			else if (ctx->resv != xe_vm_resv(vm)) {
-				spin_lock(&vm->notifier.list_lock);
-				if (!(vma->gpuva.flags & XE_VMA_DESTROYED))
-					list_move_tail(&vma->notifier.rebind_link,
-						       &vm->notifier.rebind_list);
-				spin_unlock(&vm->notifier.list_lock);
-				continue;
-			}
+			idle = true;
+		}
 
-			xe_vm_assert_held(vm);
-			if (vma->tile_present &&
-			    !(vma->gpuva.flags & XE_VMA_DESTROYED) &&
-			    list_empty(&vma->combined_links.rebind))
-				list_add_tail(&vma->combined_links.rebind,
-					      &vm->rebind_list);
+		drm_gpuvm_bo_for_each_va(gpuva, vm_bo) {
+			struct xe_vma *vma = gpuva_to_vma(gpuva);
 
-			if (vm_resv_locked)
-				dma_resv_unlock(xe_vm_resv(vm));
-		}
+			trace_xe_vma_evict(vma);
+			ret = xe_vm_invalidate_vma(vma);
+			if (XE_WARN_ON(ret))
+				return ret;
 		}
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 7cf4215b2b2e..ca6231741e11 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -94,40 +94,9 @@
  *	Unlock all
  */
 
-static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
+static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec, unsigned int num_fences)
 {
-	struct xe_vma *vma;
-	LIST_HEAD(dups);
-	int err = 0;
-
-	if (xe_vm_no_dma_fences(vm))
-		return 0;
-
-	/*
-	 * 1 fence for job from exec plus a fence for each tile from a possible
-	 * rebind
-	 */
-	err = xe_vm_lock_dma_resv(vm, exec, 1 + vm->xe->info.tile_count, true);
-	if (err)
-		return err;
-
-	/*
-	 * Validate BOs that have been evicted (i.e. make sure the
-	 * BOs have valid placements possibly moving an evicted BO back
-	 * to a location where the GPU can access it).
-	 */
-	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
-		xe_assert(vm->xe, !xe_vma_is_null(vma));
-
-		if (xe_vma_is_userptr(vma))
-			continue;
-
-		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
-		if (err)
-			break;
-	}
-
-	return err;
+	return drm_gpuvm_validate(vm_exec->vm, &vm_exec->exec);
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -140,7 +109,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_exec_queue *q;
 	struct xe_sync_entry *syncs = NULL;
 	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
-	struct drm_exec exec;
+	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
+	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs = 0;
 	struct xe_sched_job *job;
 	struct dma_fence *rebind_fence;
@@ -259,16 +229,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto err_unlock_list;
 	}
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
-	drm_exec_until_all_locked(&exec) {
-		err = xe_exec_begin(&exec, vm);
-		drm_exec_retry_on_contention(&exec);
-		if (err && xe_vm_validate_should_retry(&exec, err, &end)) {
+	vm_exec.vm = &vm->gpuvm;
+	err = drm_gpuvm_exec_lock(&vm_exec, 1 + vm->xe->info.tile_count, true);
+	if (err) {
+		if (xe_vm_validate_should_retry(exec, err, &end))
 			err = -EAGAIN;
-			goto err_unlock_list;
-		}
-		if (err)
-			goto err_exec;
+		goto err_unlock_list;
 	}
 
 	if (xe_vm_is_closed_or_banned(q->vm)) {
@@ -350,19 +316,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * the job and let the DRM scheduler / backend clean up the job.
 	 */
 	xe_sched_job_arm(job);
-	if (!xe_vm_no_dma_fences(vm)) {
-		/* Block userptr invalidations / BO eviction */
-		dma_resv_add_fence(xe_vm_resv(vm),
-				   &job->drm.s_fence->finished,
-				   DMA_RESV_USAGE_BOOKKEEP);
-
-		/*
-		 * Make implicit sync work across drivers, assuming all external
-		 * BOs are written as we don't pass in a read / write list.
-		 */
-		xe_vm_fence_all_extobjs(vm, &job->drm.s_fence->finished,
-					DMA_RESV_USAGE_WRITE);
-	}
+	if (!xe_vm_no_dma_fences(vm))
+		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
+					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
 
 	for (i = 0; i < num_syncs; i++)
 		xe_sync_entry_signal(&syncs[i], job,
@@ -386,7 +342,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	drm_exec_fini(&exec);
+	drm_exec_fini(exec);
 err_unlock_list:
 	if (write_locked)
 		up_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ded2a3e07caf..e22f1705b46c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -297,26 +297,8 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 	return err;
 }
 
-/**
- * xe_vm_fence_all_extobjs() - Add a fence to vm's external objects' resv
- * @vm: The vm.
- * @fence: The fence to add.
- * @usage: The resv usage for the fence.
- *
- * Loops over all of the vm's external object bindings and adds a @fence
- * with the given @usage to all of the external object's reservation
- * objects.
- */
-void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
-			     enum dma_resv_usage usage)
-{
-	struct xe_vma *vma;
-
-	list_for_each_entry(vma, &vm->extobj.list, extobj.link)
-		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence, usage);
-}
-
-static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
+static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
+						struct drm_exec *exec)
 {
 	struct xe_exec_queue *q;
 
@@ -326,16 +308,15 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		q->ops->resume(q);
 
-		dma_resv_add_fence(xe_vm_resv(vm), q->compute.pfence,
-				   DMA_RESV_USAGE_BOOKKEEP);
-		xe_vm_fence_all_extobjs(vm, q->compute.pfence,
-					DMA_RESV_USAGE_BOOKKEEP);
+		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, q->compute.pfence,
+					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
 	}
 }
 
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	struct drm_exec exec;
+	struct drm_gpuvm_exec vm_exec = {.vm = &vm->gpuvm};
+	struct drm_exec *exec = &vm_exec.exec;
 	struct dma_fence *pfence;
 	int err;
 	bool wait;
@@ -343,13 +324,9 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(vm->xe, xe_vm_in_compute_mode(vm));
 
 	down_write(&vm->lock);
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
-	drm_exec_until_all_locked(&exec) {
-		err = xe_vm_lock_dma_resv(vm, &exec, 1, true);
-		drm_exec_retry_on_contention(&exec);
-		if (err)
-			goto out_unlock;
-	}
+	err = drm_gpuvm_exec_lock(&vm_exec, 1, true);
+	if (err)
+		return err;
 
 	pfence = xe_preempt_fence_create(q, q->compute.context,
 					 ++q->compute.seqno);
@@ -364,10 +341,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	down_read(&vm->userptr.notifier_lock);
 
-	dma_resv_add_fence(xe_vm_resv(vm), pfence,
-			   DMA_RESV_USAGE_BOOKKEEP);
-
-	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
+	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
+				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
 
 	/*
 	 * Check to see if a preemption on VM is in flight or userptr
@@ -381,7 +356,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	drm_exec_fini(&exec);
+	drm_exec_fini(exec);
 	up_write(&vm->lock);
 
 	return err;
@@ -406,55 +381,6 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-/**
- * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
- * objects of the vm's external buffer objects.
- * @vm: The vm.
- * @exec: Pointer to a struct drm_exec locking context.
- * @num_shared: Number of dma-fence slots to reserve in the locked objects.
- * @lock_vm: Lock also the vm's dma_resv.
- *
- * Locks the vm dma-resv objects and all the dma-resv objects of the
- * buffer objects on the vm external object list.
- *
- * Return: 0 on success, Negative error code on error. In particular if
- * @intr is set to true, -EINTR or -ERESTARTSYS may be returned.
- */
-int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
-			unsigned int num_shared, bool lock_vm)
-{
-	struct xe_vma *vma, *next;
-	int err = 0;
-
-	lockdep_assert_held(&vm->lock);
-
-	if (lock_vm) {
-		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
-		if (err)
-			return err;
-	}
-
-	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
-		err = drm_exec_prepare_obj(exec, &xe_vma_bo(vma)->ttm.base, num_shared);
-		if (err)
-			return err;
-	}
-
-	spin_lock(&vm->notifier.list_lock);
-	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
-				 notifier.rebind_link) {
-		xe_bo_assert_held(xe_vma_bo(vma));
-
-		list_del_init(&vma->notifier.rebind_link);
-		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
-			list_move_tail(&vma->combined_links.rebind,
-				       &vm->rebind_list);
-	}
-	spin_unlock(&vm->notifier.list_lock);
-
-	return 0;
-}
-
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
 static void xe_vm_kill(struct xe_vm *vm)
@@ -503,30 +429,38 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
 	if (!ktime_before(cur, *end))
 		return false;
 
-	/*
-	 * We would like to keep the ticket here with
-	 * drm_exec_unlock_all(), but WW mutex asserts currently
-	 * stop us from that. In any case this function could go away
-	 * with proper TTM -EDEADLK handling.
-	 */
-	drm_exec_fini(exec);
-
 	msleep(20);
 	return true;
 }
 
+static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
+{
+	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
+	struct drm_gpuva *gpuva;
+	int ret;
+
+	drm_gpuvm_bo_for_each_va(gpuva, vm_bo)
+		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
+			       &vm->rebind_list);
+
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	if (ret)
+		return ret;
+
+	drm_gpuvm_bo_evict(vm_bo, false);
+	return 0;
+}
+
 static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 				 bool *done)
 {
-	struct xe_vma *vma;
 	int err;
 
 	/*
 	 * 1 fence for each preempt fence plus a fence for each tile from a
 	 * possible rebind
 	 */
-	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm),
-				   vm->preempt.num_exec_queues +
+	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, vm->preempt.num_exec_queues +
 				   vm->xe->info.tile_count);
 	if (err)
 		return err;
@@ -542,7 +476,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 		return 0;
 	}
 
-	err = xe_vm_lock_dma_resv(vm, exec, vm->preempt.num_exec_queues, false);
+	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
 	if (err)
 		return err;
 
@@ -550,17 +484,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
-	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
-		if (xe_vma_has_no_bo(vma) ||
-		    vma->gpuva.flags & XE_VMA_DESTROYED)
-			continue;
-
-		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
-		if (err)
-			break;
-	}
-
-	return err;
+	return drm_gpuvm_validate(&vm->gpuvm, exec);
 }
 
 static void preempt_rebind_work_func(struct work_struct *w)
@@ -616,12 +540,13 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 		err = xe_preempt_work_begin(&exec, vm, &done);
 		drm_exec_retry_on_contention(&exec);
-		if (err && xe_vm_validate_should_retry(&exec, err, &end)) {
-			err = -EAGAIN;
+		if (err || done) {
+			drm_exec_fini(&exec);
+			if (err && xe_vm_validate_should_retry(&exec, err, &end))
+				err = -EAGAIN;
+
 			goto out_unlock_outer;
 		}
-		if (err || done)
-			goto out_unlock;
 	}
 
 	err = alloc_preempt_fences(vm, &preempt_fences, &fence_count);
@@ -668,7 +593,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 	/* Point of no return. */
 	arm_preempt_fences(vm, &preempt_fences);
-	resume_and_reinstall_preempt_fences(vm);
+	resume_and_reinstall_preempt_fences(vm, &exec);
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
@@ -883,8 +808,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	}
 
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
-	INIT_LIST_HEAD(&vma->notifier.rebind_link);
-	INIT_LIST_HEAD(&vma->extobj.link);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
 	vma->gpuva.vm = &vm->gpuvm;
@@ -915,7 +838,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 			kfree(vma);
 			return ERR_CAST(vm_bo);
 		}
-			
+
+		drm_gpuvm_bo_extobj_add(vm_bo);
 		drm_gem_object_get(&bo->ttm.base);
 		vma->gpuva.gem.obj = &bo->ttm.base;
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
@@ -948,16 +872,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	return vma;
 }
 
-static bool vm_remove_extobj(struct xe_vma *vma)
-{
-	if (!list_empty(&vma->extobj.link)) {
-		xe_vma_vm(vma)->extobj.entries--;
-		list_del_init(&vma->extobj.link);
-		return true;
-	}
-	return false;
-}
-
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -998,60 +912,6 @@ static void vma_destroy_work_func(struct work_struct *w)
 	xe_vma_destroy_late(vma);
 }
 
-static struct xe_vma *
-bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
-			    struct xe_vma *ignore)
-{
-	struct drm_gpuvm_bo *vm_bo;
-	struct drm_gpuva *va;
-	struct drm_gem_object *obj = &bo->ttm.base;
-
-	xe_bo_assert_held(bo);
-
-	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
-		drm_gpuvm_bo_for_each_va(va, vm_bo) {
-			struct xe_vma *vma = gpuva_to_vma(va);
-			
-			if (vma != ignore && xe_vma_vm(vma) == vm)
-				return vma;
-		}
-	}
-
-	return NULL;
-}
-
-static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
-				 struct xe_vma *ignore)
-{
-	bool ret;
-
-	xe_bo_lock(bo, false);
-	ret = !!bo_has_vm_references_locked(bo, vm, ignore);
-	xe_bo_unlock(bo);
-
-	return ret;
-}
-
-static void __vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
-{
-	lockdep_assert_held_write(&vm->lock);
-
-	list_add(&vma->extobj.link, &vm->extobj.list);
-	vm->extobj.entries++;
-}
-
-static void vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
-{
-	struct xe_bo *bo = xe_vma_bo(vma);
-
-	lockdep_assert_held_write(&vm->lock);
-
-	if (bo_has_vm_references(bo, vm, vma))
-		return;
-
-	__vm_insert_extobj(vm, vma);
-}
-
 static void vma_destroy_cb(struct dma_fence *fence,
 			   struct dma_fence_cb *cb)
 {
@@ -1077,20 +937,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 
-		spin_lock(&vm->notifier.list_lock);
-		list_del(&vma->notifier.rebind_link);
-		spin_unlock(&vm->notifier.list_lock);
-
 		drm_gpuva_unlink(&vma->gpuva);
-
-		if (!xe_vma_bo(vma)->vm && vm_remove_extobj(vma)) {
-			struct xe_vma *other;
-
-			other = bo_has_vm_references_locked(xe_vma_bo(vma), vm, NULL);
-
-			if (other)
-				__vm_insert_extobj(vm, other);
-		}
 	}
 
 	xe_vm_assert_held(vm);
@@ -1206,6 +1053,7 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
 
 static struct drm_gpuvm_ops gpuvm_ops = {
 	.op_alloc = xe_vm_op_alloc,
+	.vm_bo_validate = xe_gpuvm_validate,
 };
 
 static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
@@ -1364,9 +1212,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
-	INIT_LIST_HEAD(&vm->notifier.rebind_list);
-	spin_lock_init(&vm->notifier.list_lock);
-
 	INIT_LIST_HEAD(&vm->async_ops.pending);
 	INIT_WORK(&vm->async_ops.work, xe_vma_op_work_func);
 	spin_lock_init(&vm->async_ops.lock);
@@ -1379,8 +1224,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
-	INIT_LIST_HEAD(&vm->extobj.list);
-
 	vm->pt_ops = &xelp_pt_ops;
 
 	if (!(flags & XE_VM_FLAG_MIGRATION))
@@ -1644,7 +1487,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (vm->async_ops.error_capture.addr)
 		wake_up_all(&vm->async_ops.error_capture.wq);
 
-	xe_assert(xe, list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
 	mutex_lock(&xe->usm.lock);
@@ -2514,22 +2356,36 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			      u8 tile_mask, bool read_only, bool is_null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
+	struct drm_exec exec;
 	struct xe_vma *vma;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
 	if (bo) {
-		err = xe_bo_lock(bo, true);
-		if (err)
-			return ERR_PTR(err);
+		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+		drm_exec_until_all_locked(&exec) {
+			err = 0;
+			if (!bo->vm) {
+				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
+				drm_exec_retry_on_contention(&exec);
+			}
+			if (!err) {
+				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
+				drm_exec_retry_on_contention(&exec);
+			}
+			if (err) {
+				drm_exec_fini(&exec);
+				return ERR_PTR(err);
+			}
+		}
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
 			    op->va.range - 1, read_only, is_null,
 			    tile_mask);
 	if (bo)
-		xe_bo_unlock(bo);
+		drm_exec_fini(&exec);
 
 	if (xe_vma_is_userptr(vma)) {
 		err = xe_vma_userptr_pin_pages(vma);
@@ -2539,7 +2395,6 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			return ERR_PTR(err);
 		}
 	} else if (!xe_vma_has_no_bo(vma) && !bo->vm) {
-		vm_insert_extobj(vm, vma);
 		err = add_preempt_fences(vm, bo);
 		if (err) {
 			prep_vma_destroy(vm, vma, false);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 12150fc0a7fd..73865e80fcc3 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -64,9 +64,14 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
 struct xe_vma *
 xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
 
+static inline struct xe_vm *gpuvm_to_vm(struct drm_gpuvm *gpuvm)
+{
+	return container_of(gpuvm, struct xe_vm, gpuvm);
+}
+
 static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
 {
-	return container_of(gpuva->vm, struct xe_vm, gpuvm);
+	return gpuvm_to_vm(gpuva->vm);
 }
 
 static inline struct xe_vma *gpuva_to_vma(struct drm_gpuva *gpuva)
@@ -210,12 +215,6 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
-int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
-			unsigned int num_shared, bool lock_vm);
-
-void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
-			     enum dma_resv_usage usage);
-
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
 
 int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 036d5c53a206..aa18cefefc61 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -111,18 +111,6 @@ struct xe_vma {
 	 */
 	u8 tile_present;
 
-	struct {
-		struct list_head rebind_link;
-	} notifier;
-
-	struct {
-		/**
-		 * @extobj.link: Link into vm's external object list.
-		 * protected by the vm lock.
-		 */
-		struct list_head link;
-	} extobj;
-
 	/**
 	 * @userptr: user pointer state, only allocated for VMAs that are
 	 * user pointers
@@ -201,14 +189,6 @@ struct xe_vm {
 	 */
 	struct xe_range_fence_tree rftree[XE_MAX_TILES_PER_DEVICE];
 
-	/** @extobj: bookkeeping for external objects. Protected by the vm lock */
-	struct {
-		/** @enties: number of external BOs attached this VM */
-		u32 entries;
-		/** @list: list of vmas with external bos attached */
-		struct list_head list;
-	} extobj;
-
 	/** @async_ops: async VM operations (bind / unbinds) */
 	struct {
 		/** @list: list of pending async VM ops */
@@ -309,22 +289,6 @@ struct xe_vm {
 		struct xe_vma *last_fault_vma;
 	} usm;
 
-	/**
-	 * @notifier: Lists and locks for temporary usage within notifiers where
-	 * we either can't grab the vm lock or the vm resv.
-	 */
-	struct {
-		/** @notifier.list_lock: lock protecting @rebind_list */
-		spinlock_t list_lock;
-		/**
-		 * @notifier.rebind_list: list of vmas that we want to put on the
-		 * main @rebind_list. This list is protected for writing by both
-		 * notifier.list_lock, and the resv of the bo the vma points to,
-		 * and for reading by the notifier.list_lock only.
-		 */
-		struct list_head rebind_list;
-	} notifier;
-
 	/** @error_capture: allow to track errors */
 	struct {
 		/** @capture_once: capture only one error per VM */
-- 
2.41.0

