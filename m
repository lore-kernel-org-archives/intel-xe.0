Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E9C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 12:58:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4665F10E726;
	Wed,  6 Dec 2023 12:58:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FE010E726
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 12:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701867518; x=1733403518;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ztT26zU9I3RN1YUU7hapMDoQ0x6CkDVcqbQWV8sND04=;
 b=lkeHq2YS9gxa6m836faMWknp65RaoTgPHcQtYYGNNVNJW3ueSgtFRjzr
 Xx9JwIcXYzLT8gZXmSf8jnD+CTYbWp/Bqc9kQNDHbRKpKXGPGjUHi+iJ7
 W9gB1N+ThAHU/hcNaDzuuBHxpH1RtrYtU8EgfCZk8WWeTOMcUWm87vxyH
 APXk/aQGzRNhHLiwtCx5SEXhWZ4C9OpGeq0mnXlS54LJ2Vh60d0R32qVl
 TXgF+jVAzbdYb4N6OOSFeiLtDi8bLO8dVlwllRNaeM8NEo5BmndqGi+5Z
 n15f4Eka3tBmNTrOGj7oPBHGsZB7tK3R+SbHrwBc9dcBmUf8BI5bca68R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1123946"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="1123946"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018565101"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="1018565101"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.121])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 04:58:37 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  6 Dec 2023 13:58:12 +0100
Message-ID: <20231206125818.4164-12-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
References: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 12/17] drm/xe: Adjust to "drm/gpuvm: add common
 dma-resv per struct drm_gpuvm"
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
---
 drivers/gpu/drm/xe/xe_bo.c       | 17 +++++---
 drivers/gpu/drm/xe/xe_bo.h       |  2 +-
 drivers/gpu/drm/xe/xe_exec.c     |  4 +-
 drivers/gpu/drm/xe/xe_migrate.c  |  4 +-
 drivers/gpu/drm/xe/xe_pt.c       |  6 +--
 drivers/gpu/drm/xe/xe_vm.c       | 72 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.h       |  4 --
 drivers/gpu/drm/xe/xe_vm_types.h | 12 +++---
 8 files changed, 64 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 72dc4a4eed4e..ad9d8793db3e 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -519,9 +519,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			 * that we indeed have it locked, put the vma an the
 			 * vm's notifier.rebind_list instead and scoop later.
 			 */
-			if (dma_resv_trylock(&vm->resv))
+			if (dma_resv_trylock(xe_vm_resv(vm)))
 				vm_resv_locked = true;
-			else if (ctx->resv != &vm->resv) {
+			else if (ctx->resv != xe_vm_resv(vm)) {
 				spin_lock(&vm->notifier.list_lock);
 				if (!(vma->gpuva.flags & XE_VMA_DESTROYED))
 					list_move_tail(&vma->notifier.rebind_link,
@@ -538,7 +538,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 					      &vm->rebind_list);
 
 			if (vm_resv_locked)
-				dma_resv_unlock(&vm->resv);
+				dma_resv_unlock(xe_vm_resv(vm));
 		}
 	}
 
@@ -1398,7 +1398,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 		}
 	}
 
-	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
+	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? xe_vm_resv(vm) : NULL,
 				    vm && !xe_vm_in_fault_mode(vm) &&
 				    flags & XE_BO_CREATE_USER_BIT ?
 				    &vm->lru_bulk_move : NULL, size,
@@ -1406,6 +1406,13 @@ __xe_bo_create_locked(struct xe_device *xe,
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
@@ -1772,7 +1779,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		xe_vm_assert_held(vm);
 
 		ctx.allow_res_evict = allow_res_evict;
-		ctx.resv = &vm->resv;
+		ctx.resv = xe_vm_resv(vm);
 	}
 
 	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 098ccab7fa1e..8ffb821b2ede 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -168,7 +168,7 @@ void xe_bo_unlock(struct xe_bo *bo);
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_WARN_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
+		XE_WARN_ON(bo->vm && bo->ttm.base.resv != xe_vm_resv(bo->vm));
 		if (bo->vm)
 			xe_vm_assert_held(bo->vm);
 		else
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 347239f28170..5ec37df33afe 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -281,7 +281,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	/* Wait behind munmap style rebinds */
 	if (!xe_vm_in_lr_mode(vm)) {
 		err = drm_sched_job_add_resv_dependencies(&job->drm,
-							  &vm->resv,
+							  xe_vm_resv(vm),
 							  DMA_RESV_USAGE_KERNEL);
 		if (err)
 			goto err_put_job;
@@ -309,7 +309,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_sched_job_arm(job);
 	if (!xe_vm_in_lr_mode(vm)) {
 		/* Block userptr invalidations / BO eviction */
-		dma_resv_add_fence(&vm->resv,
+		dma_resv_add_fence(xe_vm_resv(vm),
 				   &job->drm.s_fence->finished,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
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
index e09050f16f07..9a090f21f9af 100644
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
@@ -323,7 +328,7 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link) {
 		q->ops->resume(q);
 
-		dma_resv_add_fence(&vm->resv, q->compute.pfence,
+		dma_resv_add_fence(xe_vm_resv(vm), q->compute.pfence,
 				   DMA_RESV_USAGE_BOOKKEEP);
 		xe_vm_fence_all_extobjs(vm, q->compute.pfence,
 					DMA_RESV_USAGE_BOOKKEEP);
@@ -361,7 +366,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 
 	down_read(&vm->userptr.notifier_lock);
 
-	dma_resv_add_fence(&vm->resv, pfence,
+	dma_resv_add_fence(xe_vm_resv(vm), pfence,
 			   DMA_RESV_USAGE_BOOKKEEP);
 
 	xe_vm_fence_all_extobjs(vm, pfence, DMA_RESV_USAGE_BOOKKEEP);
@@ -447,8 +452,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
 	lockdep_assert_held(&vm->lock);
 
 	if (lock_vm) {
-		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
-					   num_shared);
+		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
 		if (err)
 			return err;
 	}
@@ -544,7 +548,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	 * 1 fence for each preempt fence plus a fence for each tile from a
 	 * possible rebind
 	 */
-	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base,
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm),
 				   vm->preempt.num_exec_queues +
 				   vm->xe->info.tile_count);
 	if (err)
@@ -643,7 +647,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	}
 
 	/* Wait on munmap style VM unbinds */
-	wait = dma_resv_wait_timeout(&vm->resv,
+	wait = dma_resv_wait_timeout(xe_vm_resv(vm),
 				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 	if (wait <= 0) {
@@ -738,13 +742,13 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
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
@@ -793,14 +797,14 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	}
 
 	/* Take lock and move to rebind_list for rebinding. */
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
+	err = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 	if (err)
 		goto out_err;
 
 	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
 		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
 
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 
 	return 0;
 
@@ -1116,7 +1120,7 @@ int xe_vm_prepare_vma(struct drm_exec *exec, struct xe_vma *vma,
 	int err;
 
 	XE_WARN_ON(!vm);
-	err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, num_shared);
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
 	if (!err && bo && !bo->vm)
 		err = drm_exec_prepare_obj(exec, &bo->ttm.base, num_shared);
 
@@ -1331,6 +1335,7 @@ static void vm_destroy_work_func(struct work_struct *w);
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
+	struct drm_gem_object *vm_resv_obj;
 	struct xe_vm *vm;
 	int err, i = 0, number_tiles = 0;
 	struct xe_tile *tile;
@@ -1342,7 +1347,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->xe = xe;
 	kref_init(&vm->refcount);
-	dma_resv_init(&vm->resv);
 
 	vm->size = 1ull << xe->info.va_bits;
 
@@ -1375,12 +1379,21 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (!(flags & XE_VM_FLAG_MIGRATION))
 		xe_device_mem_access_get(xe);
 
-	err = dma_resv_lock_interruptible(&vm->resv, NULL);
+	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
+	if (!vm_resv_obj) {
+		err = -ENOMEM;
+		goto err_no_resv;
+	}
+
+	drm_gpuvm_init(&vm->gpuvm, "Xe VM", &xe->drm, vm_resv_obj, 0, vm->size,
+		       0, 0, &gpuvm_ops);
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
 
@@ -1422,7 +1435,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
 	}
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
@@ -1483,10 +1496,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		if (vm->pt_root[id])
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 	}
-	dma_resv_unlock(&vm->resv);
-	drm_gpuvm_destroy(&vm->gpuvm);
+	dma_resv_unlock(xe_vm_resv(vm));
 err_put:
-	dma_resv_fini(&vm->resv);
+	drm_gpuvm_destroy(&vm->gpuvm);
+err_no_resv:
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	kfree(vm);
@@ -1590,8 +1603,6 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_assert(xe, list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
-	drm_gpuvm_destroy(&vm->gpuvm);
-
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode--;
@@ -1644,7 +1655,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
-	dma_resv_fini(&vm->resv);
+	drm_gpuvm_destroy(&vm->gpuvm);
 	kfree(vm);
 }
 
@@ -2092,15 +2103,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -3205,9 +3207,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 int xe_vm_lock(struct xe_vm *vm, bool intr)
 {
 	if (intr)
-		return dma_resv_lock_interruptible(&vm->resv, NULL);
+		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 
-	return dma_resv_lock(&vm->resv, NULL);
+	return dma_resv_lock(xe_vm_resv(vm), NULL);
 }
 
 /**
@@ -3218,7 +3220,7 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
  */
 void xe_vm_unlock(struct xe_vm *vm)
 {
-	dma_resv_unlock(&vm->resv);
+	dma_resv_unlock(xe_vm_resv(vm));
 }
 
 /**
@@ -3250,7 +3252,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&vma->userptr.notifier,
 				      vma->userptr.notifier_seq));
-			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
 		} else {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 9a0ae19c47b7..1d2b1917b33a 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -139,8 +139,6 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
 }
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
@@ -182,8 +180,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 extern struct ttm_device_funcs xe_ttm_funcs;
 
-struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
-
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 23abdfd8622f..5b449ec9c3e5 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -136,8 +136,6 @@ struct xe_vma {
 
 struct xe_device;
 
-#define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
-
 struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
@@ -149,9 +147,6 @@ struct xe_vm {
 	/* exec queue used for (un)binding vma's */
 	struct xe_exec_queue *q[XE_MAX_TILES_PER_DEVICE];
 
-	/** Protects @rebind_list and the page-table structures */
-	struct dma_resv resv;
-
 	/** @lru_bulk_move: Bulk LRU move list for this VM's BOs */
 	struct ttm_lru_bulk_move lru_bulk_move;
 
@@ -425,4 +420,11 @@ struct xe_vma_op {
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

