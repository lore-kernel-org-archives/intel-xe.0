Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25711C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AA4112F6F;
	Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i16LPMGB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D318B112F65
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262614; x=1738798614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b43MyOYwQndzPj38UWzpZJviy0RnS032sK07tzYWgho=;
 b=i16LPMGBsXVsRYGm7MCIg9ejnJlZcHs1F5C45z7iVHHH8TCxdYYYXtmC
 yaakwQ4MtEKztuJLpSC1d79udpLPKrXDIVeWl+5qJkbxP9zwl29bcHoNw
 5MIPLwXcwjB9bi2ghmDCY7QXtcBmgVPEWiUYxx/7FiYTvz12y4EUf3qOU
 A9Uv7ESeBMiWfGklEkLt5qFk+YQ1uOxdyrxZXtWA/B1IAgnTd6QC46Pzh
 ULyUN5wiONdyoRftQNBxycRpLHzHGy7rVzgfHidGeY762bdT1IfxAYq0O
 pYFzxC21rRULGzay2GeQc7Qn5AWXy+fvwCYbPIjUokjYlcBcoZP4p6frZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776783"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776783"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793774"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 01/22] drm/xe: Lock all gpuva ops during VM bind IOCTL
Date: Tue,  6 Feb 2024 15:37:08 -0800
Message-Id: <20240206233729.3173206-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206233729.3173206-1-matthew.brost@intel.com>
References: <20240206233729.3173206-1-matthew.brost@intel.com>
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

Lock all gpuva ops and validate all BOs in a single step durin the VM
bind IOCTL. This help with the transition to making all gpuva ops in a
VM bind IOCTL a single atomic job.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 142 ++++++++++++++++++++++++++-----------
 1 file changed, 101 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9d2e8088d07e..3a7b82ca4b35 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -411,19 +411,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 
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
@@ -619,7 +623,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 	if (err) {
 		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
-		xe_vm_kill(vm);
+		xe_vm_kill(vm, true);
 	}
 	up_write(&vm->lock);
 
@@ -1773,17 +1777,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
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
@@ -2414,17 +2410,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	return 0;
 }
 
-static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
-		      struct xe_vma *vma, struct xe_vma_op *op)
+static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
+		      struct xe_vma_op *op)
 {
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
-
-	err = xe_vm_prepare_vma(exec, vma, 1);
-	if (err)
-		return err;
-
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(xe_vma_bo(vma));
 
@@ -2505,19 +2496,10 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
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
 
@@ -2682,29 +2664,107 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 	}
 }
 
+static int vma_lock(struct drm_exec *exec, struct xe_vma *vma, bool validate)
+{
+	struct xe_bo *bo = xe_vma_bo(vma);
+	int err = 0;
+
+	if (bo) {
+		if (!bo->vm)
+			err = drm_exec_prepare_obj(exec, &bo->ttm.base, 1);
+		if (!err && validate)
+			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+	}
+
+	return err;
+}
+
+static int op_lock(struct drm_exec *exec, struct xe_vm *vm,
+		   struct xe_vma_op *op)
+{
+	int err = 0;
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		err = vma_lock(exec, op->map.vma,
+			       op->map.immediate || !xe_vm_in_fault_mode(vm));
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		err = vma_lock(exec, gpuva_to_vma(op->base.remap.unmap->va),
+			       false);
+		if (!err && op->remap.prev)
+			err = vma_lock(exec, op->remap.prev, true);
+		if (!err && op->remap.next)
+			err = vma_lock(exec, op->remap.next, true);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		err = vma_lock(exec, gpuva_to_vma(op->base.unmap.va), false);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		err = vma_lock(exec, gpuva_to_vma(op->base.prefetch.va), true);
+		break;
+	default:
+		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
+	}
+
+	return err;
+}
+
+static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
+				  struct xe_vm *vm,
+				  struct list_head *ops_list)
+{
+	struct xe_vma_op *op;
+	int err;
+
+	err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), 1);
+	if (err)
+		return err;
+
+	list_for_each_entry(op, ops_list, link) {
+		err = op_lock(exec, vm, op);
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
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	drm_exec_until_all_locked(&exec) {
+		err = vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
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

