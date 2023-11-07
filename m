Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E54C4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DAD210E4B3;
	Tue,  7 Nov 2023 05:25:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E7D10E02D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334756; x=1730870756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k/ctA3SRyLIk0dmXrudZh72g2+N2i/Wb8T8xBgMIWAg=;
 b=fMz0rKnEs1V1vIGoZhDQSB0QvtvjxycBSibcbfsZZJ++oWRiRN0QVQfo
 chvxOmaI90V2rNlRKYE6Ld5/pFiEWE459FBuIRFpMrimxpAM+hxWm0D8p
 BkJeyTtaiFwfl8lDM3OT+Kz8r9JYVYNFTg+cyFnTcBDuTefZnkMA8aJdo
 2cj30MTbGcHlnWnv0Ao85Bqyz/74AF4xZ6Si6jBsCeti9O/mqKKXJcOC+
 n3H76erVqAv8SmZjOW1Um7ctjoTygx72AuFGaNXXfUaeMHadzZOqMAAB9
 nXuTOTMjTPHuXCIOj+RY7ZA9C5UrBtRu6d50KufjOzvL1vUJMty+8W6dZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769515"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689827"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689827"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:40 -0800
Message-Id: <20231107052603.124361-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 04/27] drm/xe: Lock all gpuva ops during VM
 bind IOCTL
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
 drivers/gpu/drm/xe/xe_vm.c | 126 +++++++++++++++++++++++++++----------
 1 file changed, 94 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 2a7fa8e2058e..f5c7540767a4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -474,19 +474,23 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
 
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
@@ -682,7 +686,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 
 	if (err) {
 		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
-		xe_vm_kill(vm);
+		xe_vm_kill(vm, true);
 	}
 	up_write(&vm->lock);
 
@@ -1879,17 +1883,9 @@ static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue
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
@@ -2538,17 +2534,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
 
@@ -2629,19 +2620,10 @@ static int op_execute(struct drm_exec *exec, struct xe_vm *vm,
 static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			       struct xe_vma_op *op)
 {
-	struct drm_exec exec;
 	int err;
 
 retry_userptr:
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
-	drm_exec_until_all_locked(&exec) {
-		err = op_execute(&exec, vm, vma, op);
-		drm_exec_retry_on_contention(&exec);
-		if (err)
-			break;
-	}
-	drm_exec_fini(&exec);
-
+	err = op_execute(vm, vma, op);
 	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
 		lockdep_assert_held_write(&vm->lock);
 		err = xe_vma_userptr_pin_pages(vma);
@@ -2801,14 +2783,91 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
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
+	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(exec) {
+		err = drm_exec_prepare_obj(exec, &xe_vm_ttm_bo(vm)->base, 1);
+		drm_exec_retry_on_contention(exec);
+		if (err)
+			goto out;
+
+		list_for_each_entry(op, ops_list, link) {
+			err = op_lock(exec, vm, op);
+			drm_exec_retry_on_contention(exec);
+			if (err)
+				goto out;
+		}
+	}
+
+out:
+	return err;
+}
+
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 				     struct list_head *ops_list)
 {
+	struct drm_exec exec;
 	struct xe_vma_op *op, *next;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
+	err = vm_bind_ioctl_ops_lock(&exec, vm, ops_list);
+	if (err)
+		return err;
+
 	list_for_each_entry_safe(op, next, ops_list, link) {
 		err = xe_vma_op_execute(vm, op);
 		if (err) {
@@ -2817,13 +2876,16 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 			/*
 			 * FIXME: Killing VM rather than proper error handling
 			 */
-			xe_vm_kill(vm);
-			return -ENOSPC;
+			xe_vm_kill(vm, false);
+			err = -ENOSPC;
+			goto unlock;
 		}
 		xe_vma_op_cleanup(vm, op);
 	}
 
-	return 0;
+unlock:
+	drm_exec_fini(&exec);
+	return err;
 }
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
-- 
2.34.1

