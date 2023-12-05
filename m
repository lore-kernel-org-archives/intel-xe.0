Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA565C10DCE
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 09:42:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7878710E4CE;
	Tue,  5 Dec 2023 09:42:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCC910E4B9
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 09:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701769331; x=1733305331;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=cm0qNR4xYd9kC0HoLNFVd/qggkUJ0bQH8GHgikeRrqQ=;
 b=mHmH7mJtgquRFUYWuZfI3qfZy+1Y3HNG6QyWofB85wqAYFSylYFNIejg
 VCAnkdnoD7stizysc40eNKYfj6v5Wjc0B73z3IgNmKEhdnlmHBGkiGGwk
 PZ7HsCDtzWfaKx/M6A/mOB5ucCCJz9i/9zi+nRixoC1f/hedhpgm0zNLF
 J4Wj4T95cgrnWEB/wBntubWVFLyNLJy70o/C25ivWYmjQ+B5s/Wfj6G7H
 tWmR2D1m2eXYX4c/4gJaGTyBmoTTbGNR/akU/1hMLDwLK4kYQlIvbJrxD
 d5qnK4I8mSAmdGcYE+/U+0f2xGexgLMA7hrIhHK8GGugh1zToawdizb6Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="949355"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="949355"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="18901774"
Received: from mstribae-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.119])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 01:42:10 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Dec 2023 10:41:45 +0100
Message-ID: <20231205094145.116126-12-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231205094145.116126-1-thomas.hellstrom@linux.intel.com>
References: <20231205094145.116126-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 12/12] drm/xe: Adjust to gpuvm updates
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

drm/xe: Adjust to commit "drm/gpuvm: add an abstraction for a VM/BO combination"

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

drm/xe: Adapt to GPUVM tracking of external / evicted objects.

Using fine-grained locking for now.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm

Use DRM_GPUVM_RESV_PROTECTED to relax locking.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c       |  75 +++---
 drivers/gpu/drm/xe/xe_bo.h       |   2 +-
 drivers/gpu/drm/xe/xe_exec.c     |  74 ++----
 drivers/gpu/drm/xe/xe_migrate.c  |   4 +-
 drivers/gpu/drm/xe/xe_pt.c       |   6 +-
 drivers/gpu/drm/xe/xe_vm.c       | 394 ++++++++++---------------------
 drivers/gpu/drm/xe/xe_vm.h       |  22 +-
 drivers/gpu/drm/xe/xe_vm_types.h |  81 ++-----
 8 files changed, 205 insertions(+), 453 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7f012f4c2b2d..8971fb121526 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -467,8 +467,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	struct drm_gpuva *gpuva;
 	struct drm_gem_object *obj = &bo->ttm.base;
+	struct drm_gpuvm_bo *vm_bo;
+	bool idle = false;
 	int ret = 0;
 
 	dma_resv_assert_held(bo->ttm.base.resv);
@@ -481,14 +482,16 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 		dma_resv_iter_end(&cursor);
 	}
 
-	drm_gem_for_each_gpuva(gpuva, obj) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
-		struct xe_vm *vm = xe_vma_vm(vma);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
+		struct drm_gpuva *gpuva;
 
-		trace_xe_vma_evict(vma);
+		if (!xe_vm_in_fault_mode(vm)) {
+			drm_gpuvm_bo_evict(vm_bo, true);
+			continue;
+		}
 
-		if (xe_vm_in_fault_mode(vm)) {
-			/* Wait for pending binds / unbinds. */
+		if (!idle) {
 			long timeout;
 
 			if (ctx->no_wait_gpu &&
@@ -500,44 +503,21 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
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
+			if (!timeout)
+				return -ETIME;
+			if (timeout < 0)
+				return timeout;
 
-		} else {
-			bool vm_resv_locked = false;
-
-			/*
-			 * We need to put the vma on the vm's rebind_list,
-			 * but need the vm resv to do so. If we can't verify
-			 * that we indeed have it locked, put the vma an the
-			 * vm's notifier.rebind_list instead and scoop later.
-			 */
-			if (dma_resv_trylock(&vm->resv))
-				vm_resv_locked = true;
-			else if (ctx->resv != &vm->resv) {
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
-				dma_resv_unlock(&vm->resv);
+			trace_xe_vma_evict(vma);
+			ret = xe_vm_invalidate_vma(vma);
+			if (XE_WARN_ON(ret))
+				return ret;
 		}
 	}
 
@@ -1389,7 +1369,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
+	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
 				    vm && !xe_vm_in_fault_mode(vm) &&
 				    flags & XE_BO_CREATE_USER_BIT ?
 				    &vm->lru_bulk_move : NULL, size,
@@ -1397,6 +1377,13 @@ __xe_bo_create_locked(struct xe_device *xe,
 	if (IS_ERR(bo))
 		return bo;
 
+	/*
+	 * Note that instead of taking a reference no the drm_gpuvm_resv_bo(),
+	 * to ensure the shared resv doesn't disappear under the bo, the bo
+	 * will keep a reference to the vm, and avoid circular references
+	 * by having all the vm's bo refereferences released at vm close
+	 * time.
+	 */
 	if (vm && xe_bo_is_user(bo))
 		xe_vm_get(vm);
 	bo->vm = vm;
@@ -1728,7 +1715,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		xe_vm_assert_held(vm);
 
 		ctx.allow_res_evict = allow_res_evict;
-		ctx.resv = &vm->resv;
+		ctx.resv = xe_vm_resv(vm);
 	}
 
 	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 77e723dd9102..fc8ec6ca0655 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -164,7 +164,7 @@ void xe_bo_unlock(struct xe_bo *bo);
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_WARN_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
+		XE_WARN_ON(bo->vm && bo->ttm.base.resv != xe_vm_resv(bo->vm));
 		if (bo->vm)
 			xe_vm_assert_held(bo->vm);
 		else
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 347239f28170..1a4abfedd6f8 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -94,40 +94,9 @@
  *	Unlock all
  */
 
-static int xe_exec_begin(struct drm_exec *exec, struct xe_vm *vm)
+static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
-	struct xe_vma *vma;
-	LIST_HEAD(dups);
-	int err = 0;
-
-	if (xe_vm_in_lr_mode(vm))
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
@@ -216,16 +186,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto err_unlock_list;
 	}
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
-	drm_exec_until_all_locked(&exec) {
-		err = xe_exec_begin(&exec, vm);
-		drm_exec_retry_on_contention(&exec);
-		if (err && xe_vm_validate_should_retry(&exec, err, &end)) {
+	vm_exec.vm = &vm->gpuvm;
+	vm_exec.num_fences = 1 + vm->xe->info.tile_count;
+	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+	err = drm_gpuvm_exec_lock(&vm_exec);
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
@@ -281,7 +249,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	/* Wait behind munmap style rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
-							  &vm->resv,
+							  xe_vm_resv(vm),
 							  DMA_RESV_USAGE_KERNEL);
 		if (err)
 			goto err_put_job;
@@ -307,19 +275,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	 * the job and let the DRM scheduler / backend clean up the job.
 	 */
 	xe_sched_job_arm(job);
-	if (!xe_vm_in_lr_mode(vm)) {
-		/* Block userptr invalidations / BO eviction */
-		dma_resv_add_fence(&vm->resv,
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
+	if (!xe_vm_in_lr_mode(vm))
+		drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, &job->drm.s_fence->finished,
+					 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_WRITE);
 
 	for (i = 0; i < num_syncs; i++)
 		xe_sync_entry_signal(&syncs[i], job,
@@ -343,7 +301,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	drm_exec_fini(&exec);
+	drm_exec_fini(exec);
 err_unlock_list:
 	if (write_locked)
 		up_write(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e8b567708ac0..a25697cdc2cc 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1136,7 +1136,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 					  DMA_RESV_USAGE_KERNEL))
 		return ERR_PTR(-ETIME);
 
-	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
+	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
 					       DMA_RESV_USAGE_BOOKKEEP))
 		return ERR_PTR(-ETIME);
 
@@ -1345,7 +1345,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * trigger preempts before moving forward
 	 */
 	if (first_munmap_rebind) {
-		err = job_add_deps(job, &vm->resv,
+		err = job_add_deps(job, xe_vm_resv(vm),
 				   DMA_RESV_USAGE_BOOKKEEP);
 		if (err)
 			goto err_job;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 35bd7940a571..3b485313804a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -866,7 +866,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	else if (!xe_vma_is_null(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
-	dma_resv_assert_held(&vm->resv);
+	xe_vm_assert_held(vm);
 }
 
 static void xe_pt_commit_bind(struct xe_vma *vma,
@@ -1328,7 +1328,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
 		}
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence, !rebind &&
+		dma_resv_add_fence(xe_vm_resv(vm), fence, !rebind &&
 				   last_munmap_rebind ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
@@ -1665,7 +1665,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
 		fence = &ifence->base.base;
 
 		/* add shared fence now for pagetable delayed destroy */
-		dma_resv_add_fence(&vm->resv, fence,
+		dma_resv_add_fence(xe_vm_resv(vm), fence,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/* This fence will be installed by caller when doing eviction */
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index acb061c6ee2d..d39d29a7f59f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -39,6 +39,11 @@
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
+static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
+{
+	return vm->gpuvm.r_obj;
+}
+
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
  * @vma: The userptr vma
@@ -294,26 +299,8 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
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
 
@@ -323,16 +310,19 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		q->ops->resume(q);
 
-		dma_resv_add_fence(&vm->resv, q->compute.pfence,
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
+	struct drm_gpuvm_exec vm_exec = {
+		.vm = &vm->gpuvm,
+		.flags = DRM_EXEC_INTERRUPTIBLE_WAIT,
+		.num_fences = 1,
+	};
+	struct drm_exec *exec = &vm_exec.exec;
 	struct dma_fence *pfence;
 	int err;
 	bool wait;
@@ -340,13 +330,9 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 
 	down_write(&vm->lock);
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
-	drm_exec_until_all_locked(&exec) {
-		err = xe_vm_lock_dma_resv(vm, &exec, 1, true);
-		drm_exec_retry_on_contention(&exec);
-		if (err)
-			goto out_unlock;
-	}
+	err = drm_gpuvm_exec_lock(&vm_exec);
+	if (err)
+		return err;
 
 	pfence = xe_preempt_fence_create(q, q->compute.context,
 					 ++q->compute.seqno);
@@ -361,10 +347,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	down_read(&vm->userptr.notifier_lock);
 
-	dma_resv_add_fence(&vm->resv, pfence,
-			   DMA_RESV_USAGE_BOOKKEEP);
-
-	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
+	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
+				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
 
 	/*
 	 * Check to see if a preemption on VM is in flight or userptr
@@ -378,7 +362,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	drm_exec_fini(&exec);
+	drm_exec_fini(exec);
 	up_write(&vm->lock);
 
 	return err;
@@ -424,56 +408,6 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
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
-		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
-					   num_shared);
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
@@ -522,30 +456,39 @@ bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
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
+	lockdep_assert_held(&vm->lock);
+	drm_gpuvm_bo_for_each_va(gpuva, vm_bo)
+		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
+			       &vm->rebind_list);
+
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	if (ret)
+		return ret;
+
+	vm_bo->evicted = false;
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
-	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
-				   vm->preempt.num_exec_queues +
+	err = drm_gpuvm_prepare_vm(&vm->gpuvm, exec, vm->preempt.num_exec_queues +
 				   vm->xe->info.tile_count);
 	if (err)
 		return err;
@@ -561,7 +504,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 		return 0;
 	}
 
-	err = xe_vm_lock_dma_resv(vm, exec, vm->preempt.num_exec_queues, false);
+	err = drm_gpuvm_prepare_objects(&vm->gpuvm, exec, vm->preempt.num_exec_queues);
 	if (err)
 		return err;
 
@@ -569,17 +512,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
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
@@ -619,12 +552,13 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
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
@@ -643,7 +577,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	/* Wait on munmap style VM unbinds */
-	wait = dma_resv_wait_timeout(&vm->resv,
+	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 	if (wait <= 0) {
@@ -671,7 +605,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 	/* Point of no return. */
 	arm_preempt_fences(vm, &preempt_fences);
-	resume_and_reinstall_preempt_fences(vm);
+	resume_and_reinstall_preempt_fences(vm, &exec);
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
@@ -738,13 +672,13 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	 * unbinds to complete, and those are attached as BOOKMARK fences
 	 * to the vm.
 	 */
-	dma_resv_iter_begin(&cursor, &vm->resv,
+	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
 			    DMA_RESV_USAGE_BOOKKEEP);
 	dma_resv_for_each_fence_unlocked(&cursor, fence)
 		dma_fence_enable_sw_signaling(fence);
 	dma_resv_iter_end(&cursor);
 
-	err = dma_resv_wait_timeout(&vm->resv,
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
 				    DMA_RESV_USAGE_BOOKKEEP,
 				    false, MAX_SCHEDULE_TIMEOUT);
 	XE_WARN_ON(err <= 0);
@@ -776,9 +710,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
 				 userptr.invalidate_link) {
 		list_del_init(&vma->userptr.invalidate_link);
-		if (list_empty(&vma->combined_links.userptr))
-			list_move_tail(&vma->combined_links.userptr,
-				       &vm->userptr.repin_list);
+		list_move_tail(&vma->combined_links.userptr,
+			       &vm->userptr.repin_list);
 	}
 	spin_unlock(&vm->userptr.invalidated_lock);
 
@@ -787,27 +720,12 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 				 combined_links.userptr) {
 		err = xe_vma_userptr_pin_pages(vma);
 		if (err < 0)
-			goto out_err;
+			return err;
 
-		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
+		list_move_tail(&vma->combined_links.userptr, &vm->rebind_list);
 	}
 
-	/* Take lock and move to rebind_list for rebinding. */
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
-	if (err)
-		goto out_err;
-
-	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
-		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
-
-	dma_resv_unlock(&vm->resv);
-
 	return 0;
-
-out_err:
-	list_splice_tail(&tmp_evict, &vm->userptr.repin_list);
-
-	return err;
 }
 
 /**
@@ -887,8 +805,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	}
 
 	INIT_LIST_HEAD(&vma->combined_links.rebind);
-	INIT_LIST_HEAD(&vma->notifier.rebind_link);
-	INIT_LIST_HEAD(&vma->extobj.link);
 
 	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
 	vma->gpuva.vm = &vm->gpuvm;
@@ -912,12 +828,22 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->pat_index = pat_index;
 
 	if (bo) {
+		struct drm_gpuvm_bo *vm_bo;
+
 		xe_bo_assert_held(bo);
 
+		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
+		if (IS_ERR(vm_bo)) {
+			kfree(vma);
+			return ERR_CAST(vm_bo);
+		}
+
+		drm_gpuvm_bo_extobj_add(vm_bo);
 		drm_gem_object_get(&bo->ttm.base);
 		vma->gpuva.gem.obj = &bo->ttm.base;
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
-		drm_gpuva_link(&vma->gpuva);
+		drm_gpuva_link(&vma->gpuva, vm_bo);
+		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
 		if (!is_null) {
 			u64 size = end - start + 1;
@@ -945,16 +871,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
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
@@ -995,57 +911,6 @@ static void vma_destroy_work_func(struct work_struct *w)
 	xe_vma_destroy_late(vma);
 }
 
-static struct xe_vma *
-bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
-			    struct xe_vma *ignore)
-{
-	struct drm_gpuva *gpuva;
-	struct drm_gem_object *obj = &bo->ttm.base;
-
-	xe_bo_assert_held(bo);
-
-	drm_gem_for_each_gpuva(gpuva, obj) {
-		struct xe_vma *vma = gpuva_to_vma(gpuva);
-
-		if (vma != ignore && xe_vma_vm(vma) == vm)
-			return vma;
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
@@ -1071,20 +936,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
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
@@ -1121,7 +973,7 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 	int err;
 
 	XE_WARN_ON(!vm);
-	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
 	if (!err && bo && !bo->vm)
 		err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
 
@@ -1198,8 +1050,12 @@ static struct drm_gpuva_op *xe_vm_op_alloc(void)
 	return &op->base;
 }
 
+static void xe_vm_free(struct drm_gpuvm *gpuvm);
+
 static struct drm_gpuvm_ops gpuvm_ops = {
 	.op_alloc = xe_vm_op_alloc,
+	.vm_bo_validate = xe_gpuvm_validate,
+	.vm_free = xe_vm_free,
 };
 
 static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
@@ -1336,6 +1192,7 @@ static void vm_destroy_work_func(struct work_struct *w);
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
+	struct drm_gem_object *vm_resv_obj;
 	struct xe_vm *vm;
 	int err, i = 0, number_tiles = 0;
 	struct xe_tile *tile;
@@ -1346,8 +1203,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		return ERR_PTR(-ENOMEM);
 
 	vm->xe = xe;
-	kref_init(&vm->refcount);
-	dma_resv_init(&vm->resv);
 
 	vm->size = 1ull << xe->info.va_bits;
 
@@ -1362,9 +1217,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
-	INIT_LIST_HEAD(&vm->notifier.rebind_list);
-	spin_lock_init(&vm->notifier.list_lock);
-
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
 
 	INIT_LIST_HEAD(&vm->preempt.exec_queues);
@@ -1373,19 +1225,26 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_init(&vm->rftree[id]);
 
-	INIT_LIST_HEAD(&vm->extobj.list);
-
 	vm->pt_ops = &xelp_pt_ops;
 
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_get(xe);
 
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
+	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
+	if (!vm_resv_obj) {
+		err = -ENOMEM;
+		goto err_no_resv;
+	}
+
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
+		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
+
+	drm_gem_object_put(vm_resv_obj);
+
+	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 	if (err)
 		goto err_put;
 
-	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, vm->size, 0, 0,
-		       &gpuvm_ops);
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAG_64K;
 
@@ -1427,7 +1286,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
 	}
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1488,10 +1347,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		if (vm->pt_root[id])
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 	}
-	dma_resv_unlock(&vm->resv);
-	drm_gpuvm_destroy(&vm->gpuvm);
+	dma_resv_unlock(xe_vm_resv(vm));
 err_put:
-	dma_resv_fini(&vm->resv);
+	//	drm_gpuvm_destroy(&vm->gpuvm);
+err_no_resv:
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
@@ -1578,6 +1437,10 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 				xe_pt_destroy(vm->scratch_pt[id][i], vm->flags,
 					      NULL);
 		}
+		if (vm->pt_root[id]) {
+			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
+			vm->pt_root[id] = NULL;
+		}
 	}
 	xe_vm_unlock(vm);
 
@@ -1592,11 +1455,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
-	xe_assert(xe, list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
-	drm_gpuvm_destroy(&vm->gpuvm);
-
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode--;
@@ -1633,29 +1493,17 @@ static void vm_destroy_work_func(struct work_struct *w)
 		}
 	}
 
-	/*
-	 * XXX: We delay destroying the PT root until the VM if freed as PT root
-	 * is needed for xe_vm_lock to work. If we remove that dependency this
-	 * can be moved to xe_vm_close_and_put.
-	 */
-	xe_vm_lock(vm, false);
-	for_each_tile(tile, xe, id) {
-		if (vm->pt_root[id]) {
-			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
-			vm->pt_root[id] = NULL;
-		}
-	}
-	xe_vm_unlock(vm);
+	for_each_tile(tile, xe, id)
+		XE_WARN_ON(vm->pt_root[id]);
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
-	dma_resv_fini(&vm->resv);
 	kfree(vm);
 }
 
-void xe_vm_free(struct kref *ref)
+static void xe_vm_free(struct drm_gpuvm *gpuvm)
 {
-	struct xe_vm *vm = container_of(ref, struct xe_vm, refcount);
+	struct xe_vm *vm = container_of(gpuvm, struct xe_vm, gpuvm);
 
 	/* To destroy the VM we need to be able to sleep */
 	queue_work(system_unbound_wq, &vm->destroy_work);
@@ -2097,15 +1945,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	}
 }
 
-struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
-{
-	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
-		XE_VM_FLAG_TILE_ID(vm->flags) : 0;
-
-	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
-	return &vm->pt_root[idx]->bo->ttm;
-}
-
 static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 			     bool post_commit)
 {
@@ -2180,6 +2019,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct xe_vma_op *op;
+	struct drm_gpuvm_bo *vm_bo;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2207,7 +2047,12 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
-		ops = drm_gpuvm_gem_unmap_ops_create(&vm->gpuvm, obj);
+
+		vm_bo = drm_gpuvm_bo_find(&vm->gpuvm, obj);
+		if (!vm_bo)
+			break;
+
+		ops = drm_gpuvm_bo_unmap_ops_create(vm_bo);
 		xe_bo_unlock(bo);
 		break;
 	default:
@@ -2252,22 +2097,36 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			      u16 pat_index)
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
 			    tile_mask, pat_index);
 	if (bo)
-		xe_bo_unlock(bo);
+		drm_exec_fini(&exec);
 
 	if (xe_vma_is_userptr(vma)) {
 		err = xe_vma_userptr_pin_pages(vma);
@@ -2277,7 +2136,6 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			return ERR_PTR(err);
 		}
 	} else if (!xe_vma_has_no_bo(vma) && !bo->vm) {
-		vm_insert_extobj(vm, vma);
 		err = add_preempt_fences(vm, bo);
 		if (err) {
 			prep_vma_destroy(vm, vma, false);
@@ -3219,9 +3077,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 int xe_vm_lock(struct xe_vm *vm, bool intr)
 {
 	if (intr)
-		return dma_resv_lock_interruptible(&vm->resv, NULL);
+		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 
-	return dma_resv_lock(&vm->resv, NULL);
+	return dma_resv_lock(xe_vm_resv(vm), NULL);
 }
 
 /**
@@ -3232,7 +3090,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
  */
 void xe_vm_unlock(struct xe_vm *vm)
 {
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 }
 
 /**
@@ -3264,7 +3122,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&vma->userptr.notifier,
 				      vma->userptr.notifier_seq));
-			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
 		} else {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 9a0ae19c47b7..e3c5d2778bc4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -24,20 +24,19 @@ struct xe_sync_entry;
 struct drm_exec;
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
-void xe_vm_free(struct kref *ref);
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
 
 static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
 {
-	kref_get(&vm->refcount);
+	drm_gpuvm_get(&vm->gpuvm);
 	return vm;
 }
 
 static inline void xe_vm_put(struct xe_vm *vm)
 {
-	kref_put(&vm->refcount, xe_vm_free);
+	drm_gpuvm_put(&vm->gpuvm);
 }
 
 int xe_vm_lock(struct xe_vm *vm, bool intr);
@@ -64,9 +63,14 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
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
@@ -139,8 +143,6 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
 }
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
@@ -182,8 +184,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 extern struct ttm_device_funcs xe_ttm_funcs;
 
-struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
-
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
@@ -213,12 +213,6 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma);
 
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
index be5aca659430..156e1997dd1a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -62,26 +62,17 @@ struct xe_vma {
 	/** @gpuva: Base GPUVA object */
 	struct drm_gpuva gpuva;
 
-	/** @combined_links: links into lists which are mutually exclusive */
+	/**
+	 * @combined_links: links into lists which are mutually exclusive.
+	 * Locking: vm lock in write mode OR vm lock in read mode and the vm's
+	 * resv.
+	 */
 	union {
-		/**
-		 * @userptr: link into VM repin list if userptr. Protected by
-		 * vm->lock in write mode.
-		 */
+		/** @userptr: link into VM repin list if userptr. */
 		struct list_head userptr;
-		/**
-		 * @rebind: link into VM if this VMA needs rebinding, and
-		 * if it's a bo (not userptr) needs validation after a possible
-		 * eviction. Protected by the vm's resv lock and typically
-		 * vm->lock is also held in write mode. The only place where
-		 * vm->lock isn't held is the BO eviction path which has
-		 * mutually exclusive execution with userptr.
-		 */
+		/** @rebind: link into VM if this VMA needs rebinding. */
 		struct list_head rebind;
-		/**
-		 * @destroy: link to contested list when VM is being closed.
-		 * Protected by vm->lock in write mode and vm's resv lock.
-		 */
+		/** @destroy: link to contested list when VM is being closed. */
 		struct list_head destroy;
 	} combined_links;
 
@@ -115,18 +106,6 @@ struct xe_vma {
 	 */
 	u16 pat_index;
 
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
@@ -136,22 +115,15 @@ struct xe_vma {
 
 struct xe_device;
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
 
 	struct xe_device *xe;
 
-	struct kref refcount;
-
 	/* exec queue used for (un)binding vma's */
 	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
 
-	/** Protects @rebind_list and the page-table structures */
-	struct dma_resv resv;
-
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
 
@@ -188,9 +160,9 @@ struct xe_vm {
 	struct rw_semaphore lock;
 
 	/**
-	 * @rebind_list: list of VMAs that need rebinding, and if they are
-	 * bos (not userptr), need validation after a possible eviction. The
-	 * list is protected by @resv.
+	 * @rebind_list: list of VMAs that need rebinding. Protected by the
+	 * vm->lock in write mode, OR (the vm->lock in read mode and the
+	 * vm resv).
 	 */
 	struct list_head rebind_list;
 
@@ -210,14 +182,6 @@ struct xe_vm {
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
@@ -307,22 +271,6 @@ struct xe_vm {
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
@@ -427,4 +375,11 @@ struct xe_vma_op {
 	};
 };
 
+static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
+{
+	return drm_gpuvm_resv(&vm->gpuvm);
+}
+
+#define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
+
 #endif
-- 
2.42.0

