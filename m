Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37417CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC58310E6F8;
	Wed, 13 Aug 2025 10:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ATej02Tf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026BA10E6F8
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082327; x=1786618327;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nUXocrTgRReKXVchImseXDZQ0apmPXIcsXliOZweVwA=;
 b=ATej02Tfj8SjIFucvUMWVSZ98GivvK11SuvAL/088QYbRuearKeZLfSv
 jYh6Uuz1rjqKuJVamFgHoEZuhWuW3S7OSZPZEkFnW/insgJNFLr03NbS+
 Il+3AXN/McrB9vEmxtZkXHQ+5MOrmg7Puz/JjCrrKaTi87iytaxfecuDF
 ObgvGIKRIEwA6IkibfvtWWHOR6R1hMxbHeNyvdao1vfXn9kU6y9eQdftR
 9sA/zW30nIQvO5ZkV3C87VwS7VRIIQKHWtbgRjuIbtI5ay6vF7ZsBl8Cr
 gfyLzNOPJiCEN9LX18ANDmcrtmeAmEYQ7rWjxbGRZm/ELU+Ki45mHflLd w==;
X-CSE-ConnectionGUID: /r1IJ/7qQWi7dNAujdCWgQ==
X-CSE-MsgGUID: P7xRIABjQmGl59al3nloMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57450025"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57450025"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:07 -0700
X-CSE-ConnectionGUID: 4efGiwm7TAmCG7uxdAdVEg==
X-CSE-MsgGUID: 0paw6kqfQMaCw/QZEgT6sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166069036"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:05 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 08/15] drm/xe: Convert existing drm_exec transactions for
 exhaustive eviction
Date: Wed, 13 Aug 2025 12:51:14 +0200
Message-ID: <20250813105121.5945-9-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

Convert existing drm_exec transactions, like GT pagefault validation,
non-LR exec() IOCTL and the rebind worker to support
exhaustive eviction using the xe_validation_guard().

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c         |  20 ++--
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  20 ++--
 drivers/gpu/drm/xe/xe_svm.c          |   4 -
 drivers/gpu/drm/xe/xe_vm.c           | 132 +++++++++++----------------
 drivers/gpu/drm/xe/xe_vm.h           |   2 -
 5 files changed, 70 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 0bcb4fb9a10e..cdc3ff931a90 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -119,10 +119,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs, num_ufence = 0;
+	struct xe_validation_ctx ctx;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
-	ktime_t end = 0;
 	int err = 0;
 	struct xe_hw_engine_group *group;
 	enum xe_hw_engine_group_execution_mode mode, previous_mode;
@@ -241,17 +241,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_unlock_list;
 	}
 
-	vm_exec.vm = &vm->gpuvm;
-	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
-	if (xe_vm_in_lr_mode(vm)) {
-		drm_exec_init(exec, vm_exec.flags, 0);
-	} else {
-		err = drm_gpuvm_exec_lock(&vm_exec);
-		if (err) {
-			if (xe_vm_validate_should_retry(exec, err, &end))
-				err = -EAGAIN;
+	if (!xe_vm_in_lr_mode(vm)) {
+		vm_exec.vm = &vm->gpuvm;
+		vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+		err = xe_validation_exec_lock(&ctx, &vm_exec, &xe->val);
+		if (err)
 			goto err_unlock_list;
-		}
 	}
 
 	if (xe_vm_is_closed_or_banned(q->vm)) {
@@ -345,7 +340,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	drm_exec_fini(exec);
+	if (!xe_vm_in_lr_mode(vm))
+		xe_validation_ctx_fini(&ctx);
 err_unlock_list:
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 2c7f10cc423f..67dc503d6e04 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -112,9 +112,9 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -139,12 +139,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	}
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
-		if (xe_vm_validate_should_retry(&exec, err, &end))
-			err = -EAGAIN;
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err)
 			goto unlock_dma_resv;
 
@@ -153,8 +152,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
-			if (xe_vm_validate_should_retry(&exec, err, &end))
-				err = -EAGAIN;
+			xe_validation_retry_on_oom(&ctx, &err);
 			goto unlock_dma_resv;
 		}
 	}
@@ -163,7 +161,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	dma_fence_put(fence);
 
 unlock_dma_resv:
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 	if (err == -EAGAIN)
 		goto retry_userptr;
 
@@ -545,6 +543,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vm *vm;
 	struct xe_vma *vma;
@@ -574,15 +573,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
 	drm_exec_until_all_locked(&exec) {
 		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
-		if (ret)
-			break;
+		xe_validation_retry_on_oom(&ctx, &ret);
 	}
 
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index ba85665d85d4..93d10f0b81cb 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -821,7 +821,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	struct dma_fence *fence;
 	struct xe_tile *tile = gt_to_tile(gt);
 	int migrate_try_count = ctx.devmem_only ? 3 : 1;
-	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -891,7 +890,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 
 	range_debug(range, "PAGE FAULT - BIND");
 
-retry_bind:
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
 	if (IS_ERR(fence)) {
@@ -902,8 +900,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			range_debug(range, "PAGE FAULT - RETRY BIND");
 			goto retry;
 		}
-		if (xe_vm_validate_should_retry(NULL, err, &end))
-			goto retry_bind;
 		goto err_out;
 	}
 	xe_vm_unlock(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1c2d9d9065c6..989d84c2e82f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -241,6 +241,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		.num_fences = 1,
 	};
 	struct drm_exec *exec = &vm_exec.exec;
+	struct xe_validation_ctx ctx;
 	struct dma_fence *pfence;
 	int err;
 	bool wait;
@@ -248,7 +249,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 
 	down_write(&vm->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
+	err = xe_validation_exec_lock(&ctx, &vm_exec, &vm->xe->val);
 	if (err)
 		goto out_up_write;
 
@@ -280,7 +281,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_read(&vm->userptr.notifier_lock);
 
 out_fini:
-	drm_exec_fini(exec);
+	xe_validation_ctx_fini(&ctx);
 out_up_write:
 	up_write(&vm->lock);
 
@@ -363,39 +364,6 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 	/* TODO: Inform user the VM is banned */
 }
 
-/**
- * xe_vm_validate_should_retry() - Whether to retry after a validate error.
- * @exec: The drm_exec object used for locking before validation.
- * @err: The error returned from ttm_bo_validate().
- * @end: A ktime_t cookie that should be set to 0 before first use and
- * that should be reused on subsequent calls.
- *
- * With multiple active VMs, under memory pressure, it is possible that
- * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
- * Until ttm properly handles locking in such scenarios, best thing the
- * driver can do is retry with a timeout. Check if that is necessary, and
- * if so unlock the drm_exec's objects while keeping the ticket to prepare
- * for a rerun.
- *
- * Return: true if a retry after drm_exec_init() is recommended;
- * false otherwise.
- */
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
-{
-	ktime_t cur;
-
-	if (err != -ENOMEM)
-		return false;
-
-	cur = ktime_get();
-	*end = *end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
-	if (!ktime_before(cur, *end))
-		return false;
-
-	msleep(20);
-	return true;
-}
-
 static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 {
 	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
@@ -497,10 +465,10 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
-	ktime_t end = 0;
 	int err = 0;
 	long wait;
 	int __maybe_unused tries = 0;
@@ -523,19 +491,20 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	err = xe_validation_ctx_init(&ctx, &vm->xe->val,
+				     &exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false);
+	if (err)
+		goto out_unlock_outer;
 
 	drm_exec_until_all_locked(&exec) {
 		bool done = false;
 
 		err = xe_preempt_work_begin(&exec, vm, &done);
 		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err || done) {
 			xe_vm_set_validation_exec(vm, NULL);
-			drm_exec_fini(&exec);
-			if (err && xe_vm_validate_should_retry(&exec, err, &end))
-				err = -EAGAIN;
-
+			xe_validation_ctx_fini(&ctx);
 			goto out_unlock_outer;
 		}
 	}
@@ -582,7 +551,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 out_unlock:
 	xe_vm_set_validation_exec(vm, NULL);
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
@@ -1400,20 +1369,19 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
-	int err;
+	int err = 0;
 
-	drm_exec_init(&exec, 0, 0);
-	drm_exec_until_all_locked(&exec) {
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false) {
 		err = xe_vm_lock_vma(&exec, vma);
 		drm_exec_retry_on_contention(&exec);
 		if (XE_WARN_ON(err))
 			break;
+		xe_vma_destroy(vma, NULL);
 	}
-
-	xe_vma_destroy(vma, NULL);
-
-	drm_exec_fini(&exec);
+	xe_assert(xe, !err);
 }
 
 struct xe_vma *
@@ -2490,6 +2458,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			      u16 pat_index, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vma *vma;
 	int err = 0;
@@ -2497,9 +2466,9 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	lockdep_assert_held_write(&vm->lock);
 
 	if (bo) {
-		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-		drm_exec_until_all_locked(&exec) {
-			err = 0;
+		err = 0;
+		xe_validation_guard(&ctx, &vm->xe->val, &exec,
+				    DRM_EXEC_INTERRUPTIBLE_WAIT, err, false) {
 			if (!bo->vm) {
 				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
 				drm_exec_retry_on_contention(&exec);
@@ -2508,27 +2477,34 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
 				drm_exec_retry_on_contention(&exec);
 			}
-			if (err) {
-				drm_exec_fini(&exec);
+			if (err)
 				return ERR_PTR(err);
+
+			vma = xe_vma_create(vm, bo, op->gem.offset,
+					    op->va.addr, op->va.addr +
+					    op->va.range - 1, pat_index, flags);
+			if (IS_ERR(vma))
+				return vma;
+
+			if (!bo->vm) {
+				err = add_preempt_fences(vm, bo);
+				goto out_err;
 			}
 		}
+		if (err)
+			return ERR_PTR(err);
+	} else {
+		vma = xe_vma_create(vm, NULL, op->gem.offset,
+				    op->va.addr, op->va.addr +
+				    op->va.range - 1, pat_index, flags);
+		if (IS_ERR(vma))
+			return vma;
+
+		if (xe_vma_is_userptr(vma))
+			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
 	}
-	vma = xe_vma_create(vm, bo, op->gem.offset,
-			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
-	if (IS_ERR(vma))
-		goto err_unlock;
-
-	if (xe_vma_is_userptr(vma))
-		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
-	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
-		err = add_preempt_fences(vm, bo);
-
-err_unlock:
-	if (bo)
-		drm_exec_fini(&exec);
 
+out_err:
 	if (err) {
 		prep_vma_destroy(vm, vma, false);
 		xe_vma_destroy_unlocked(vma);
@@ -3296,34 +3272,32 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 						   struct xe_vma_ops *vops)
 {
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	int err;
+	int err = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-		      DRM_EXEC_IGNORE_DUPLICATES, 0);
-	drm_exec_until_all_locked(&exec) {
+	xe_validation_guard(&ctx, &vm->xe->val, &exec,
+			    DRM_EXEC_INTERRUPTIBLE_WAIT |
+			    DRM_EXEC_IGNORE_DUPLICATES, err, true) {
 		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
 		drm_exec_retry_on_contention(&exec);
-		if (err) {
-			fence = ERR_PTR(err);
-			goto unlock;
-		}
+		xe_validation_retry_on_oom(&ctx, &err);
+		if (err)
+			return ERR_PTR(err);
 
 		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			if (PTR_ERR(fence) == -ENODATA)
 				vm_bind_ioctl_ops_fini(vm, vops, NULL);
-			goto unlock;
+			return fence;
 		}
 
 		vm_bind_ioctl_ops_fini(vm, vops, fence);
 	}
 
-unlock:
-	drm_exec_fini(&exec);
 	return fence;
 }
 ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3b6e7234dac4..418940222690 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -262,8 +262,6 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
-
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
-- 
2.50.1

