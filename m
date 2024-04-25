Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D975C25B10
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788DF11A0E9;
	Thu, 25 Apr 2024 04:54:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0UyDh8g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666311A0E5
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020883; x=1745556883;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DtkyzT7j++f/xdp8Me5ux8wwLsicVitBv3czilL7Rgk=;
 b=m0UyDh8ghtzX7MjJri/TN6smzWEUXqcV+gO1pCL1OoyCXQAfVkQEa599
 HSschUrt/uHjZUPhobIyelj4dyLJyGFwD2K0A14hKNMzOX9GFi+Sx6eG9
 XHe4gdQJ73SLSHyDz9pS9kOEE/HreITLYxWwCwjeJDC/kuADHcEVuYh/x
 95jAwAUE7pguYmMJvR7uvw8jq7Cf6RCu7v/zQ2GhTVpntXCTRNR9Ex5/Y
 CGpaS90LZ8eOBuBnkD0lgnlcEDrKnF8NZYp3P1sQ54DmaKkVC5nhL7cnQ
 GBx5ZQ0Uq+2q+BoO5LjB3Ue5z1XOuxixFeH/jJmzKbfNksIJ2V+L5e+q3 Q==;
X-CSE-ConnectionGUID: ecZ066BBTSGisjEvQvr3iQ==
X-CSE-MsgGUID: YkmvW0BMTRKN/j1Lv6azTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374870"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374870"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:42 -0700
X-CSE-ConnectionGUID: fFfgctHYTyG9D55k4BjyUA==
X-CSE-MsgGUID: fVylHZVsR/a0382TcemZZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996474"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 01/13] drm/xe: Lock all gpuva ops during VM bind IOCTL
Date: Wed, 24 Apr 2024 21:55:01 -0700
Message-Id: <20240425045513.1913039-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425045513.1913039-1-matthew.brost@intel.com>
References: <20240425045513.1913039-1-matthew.brost@intel.com>
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

Lock all BOs used in gpuva ops and validate all BOs in a single step
during the VM bind IOCTL.

This help with the transition to making all gpuva ops in a VM bind IOCTL
a single atomic job which is required for proper error handling.

v2:
 - Better commit message (Oak)
 - s/op_lock/op_lock_and_prep, few other renames too (Oak)
 - Use DRM_EXEC_IGNORE_DUPLICATES flag in drm_exec_init (local testing)
 - Do not reserve slots in locking step (direction based on series from Thomas)
v3:
 - Validate BO if is immediate set (Oak)

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 148 +++++++++++++++++++++++++++----------
 1 file changed, 108 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7ae2b0300db6..ad575ac80352 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -315,19 +315,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
-static void xe_vm_kill(struct xe_vm *vm)
+static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 {
 	struct xe_exec_queue *q;
 
 	lockdep_assert_held(&vm->lock);
 
-	xe_vm_lock(vm, false);
+	if (unlocked)
+		xe_vm_lock(vm, false);
+
 	vm->flags |= XE_VM_FLAG_BANNED;
 	trace_xe_vm_kill(vm);
 
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
 		q->ops->kill(q);
-	xe_vm_unlock(vm);
+
+	if (unlocked)
+		xe_vm_unlock(vm);
 
 	/* TODO: Inform user the VM is banned */
 }
@@ -557,7 +561,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 	if (err) {
 		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
-		xe_vm_kill(vm);
+		xe_vm_kill(vm, true);
 	}
 	up_write(&vm->lock);
 
@@ -1758,17 +1762,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
 		      u32 num_syncs, bool immediate, bool first_op,
 		      bool last_op)
 {
-	int err;
-
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(bo);
 
-	if (bo && immediate) {
-		err = xe_bo_validate(bo, vm, true);
-		if (err)
-			return err;
-	}
-
 	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
 			    last_op);
 }
@@ -2421,17 +2417,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	return 0;
 }
 
-static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
-		      struct xe_vma *vma, struct xe_vma_op *op)
+static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
+		      struct xe_vma_op *op)
 {
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	err = xe_vm_lock_vma(exec, vma);
-	if (err)
-		return err;
-
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
 
@@ -2512,19 +2504,10 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			       struct xe_vma_op *op)
 {
-	struct drm_exec exec;
 	int err;
 
 retry_userptr:
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec) {
-		err = op_execute(&exec, vm, vma, op);
-		drm_exec_retry_on_contention(&exec);
-		if (err)
-			break;
-	}
-	drm_exec_fini(&exec);
-
+	err = op_execute(vm, vma, op);
 	if (err == -EAGAIN) {
 		lockdep_assert_held_write(&vm->lock);
 
@@ -2689,29 +2672,114 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 	}
 }
 
+static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
+				 bool validate)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	int err = 0;
+
+	if (bo) {
+		if (!bo->vm)
+			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 0);
+		if (!err && validate)
+			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+	}
+
+	return err;
+}
+
+static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
+			    struct xe_vma_op *op)
+{
+	int err = 0;
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		err = vma_lock_and_validate(exec, op->map.vma,
+					    !xe_vm_in_fault_mode(vm) ||
+					    op->map.immediate);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		err = vma_lock_and_validate(exec,
+					    gpuva_to_vma(op->base.remap.unmap->va),
+					    false);
+		if (!err && op->remap.prev)
+			err = vma_lock_and_validate(exec, op->remap.prev, true);
+		if (!err && op->remap.next)
+			err = vma_lock_and_validate(exec, op->remap.next, true);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		err = vma_lock_and_validate(exec,
+					    gpuva_to_vma(op->base.unmap.va),
+					    false);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		err = vma_lock_and_validate(exec,
+					    gpuva_to_vma(op->base.prefetch.va), true);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+
+	return err;
+}
+
+static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
+					   struct xe_vm *vm,
+					   struct list_head *ops_list)
+{
+	struct xe_vma_op *op;
+	int err;
+
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 0);
+	if (err)
+		return err;
+
+	list_for_each_entry(op, ops_list, link) {
+		err = op_lock_and_prep(exec, vm, op);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 				     struct list_head *ops_list)
 {
+	struct drm_exec exec;
 	struct xe_vma_op *op, *next;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	list_for_each_entry_safe(op, next, ops_list, link) {
-		err = xe_vma_op_execute(vm, op);
-		if (err) {
-			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
-				 op->base.op, err);
-			/*
-			 * FIXME: Killing VM rather than proper error handling
-			 */
-			xe_vm_kill(vm);
-			return -ENOSPC;
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
+		      DRM_EXEC_IGNORE_DUPLICATES, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, ops_list);
+		drm_exec_retry_on_contention(&exec);
+		if (err)
+			goto unlock;
+
+		list_for_each_entry_safe(op, next, ops_list, link) {
+			err = xe_vma_op_execute(vm, op);
+			if (err) {
+				drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
+					 op->base.op, err);
+				/*
+				 * FIXME: Killing VM rather than proper error handling
+				 */
+				xe_vm_kill(vm, false);
+				err = -ENOSPC;
+				goto unlock;
+			}
+			xe_vma_op_cleanup(vm, op);
 		}
-		xe_vma_op_cleanup(vm, op);
 	}
 
-	return 0;
+unlock:
+	drm_exec_fini(&exec);
+	return err;
 }
 
 #define SUPPORTED_FLAGS	\
-- 
2.34.1

