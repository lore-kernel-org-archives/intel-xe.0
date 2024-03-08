Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A1C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E814810FCE3;
	Fri,  8 Mar 2024 05:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToQlFPEo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4927110F966
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874473; x=1741410473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S/BrYIi8WfeBf8zFIArpXXCv9ooLCAmyidMujlJsFvc=;
 b=ToQlFPEotSDHOX/GOiZaQUZmZ99BPCKVOyYZn7jZ/R1/jemYhfXY9YJG
 KY9t/aAkLC49LtVyCOB8njwDhsl47NsUcHEyQ1vAAcQUmat/zyUsGsxiV
 8M4MPWNwBdi4FlvQPHWZSPk/5Ff6y2SC1WgsGB+HBDRII75kqBnnYQ8Qv
 8p7U9aS1UA5h79+ZmBqzI8+5zC53GbjvopEUOQKUgzUDza9OduFl67HE7
 eOIAe4f0BLDp3neG8kEUgg5aVTsCXLNulYdwm53dpdoooiY0Vm9GbOU+M
 wBb6WISFEg0XLPojQ0FtWwPR/KeN6tVev4eRzXD7Mv/xnZ1N6u49pBoB4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761960"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10402983"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 06/30] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Date: Thu,  7 Mar 2024 21:07:42 -0800
Message-Id: <20240308050806.577176-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308050806.577176-1-matthew.brost@intel.com>
References: <20240308050806.577176-1-matthew.brost@intel.com>
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

Clean up everything in VM bind IOCTL in 1 path for both errors and
non-errors. Also move VM bind IOCTL cleanup from ops (also used by
non-IOCTL binds) to the VM bind IOCTL.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 60 +++++---------------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
 2 files changed, 9 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0bb807c05d7b..dde777c807cf 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -769,8 +769,7 @@ static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops,
-				     bool cleanup);
+				     struct xe_vma_ops *vops);
 
 struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -794,7 +793,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_exec(vma);
 
 		xe_vm_populate_dummy_rebind(vm, vma);
-		fence = ops_execute(vm, &vm->dummy_ops.vops, false);
+		fence = ops_execute(vm, &vm->dummy_ops.vops);
 		if (IS_ERR(fence))
 			return fence;
 	}
@@ -2474,7 +2473,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	if (!last_op)
 		return 0;
 
-	last_op->ops = ops;
 	if (last) {
 		last_op->flags |= XE_VMA_OP_LAST;
 		last_op->num_syncs = num_syncs;
@@ -2643,25 +2641,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 	return fence;
 }
 
-static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
-{
-	bool last = op->flags & XE_VMA_OP_LAST;
-
-	if (last) {
-		while (op->num_syncs--)
-			xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
-		kfree(op->syncs);
-		if (op->q)
-			xe_exec_queue_put(op->q);
-	}
-	if (!list_empty(&op->link))
-		list_del(&op->link);
-	if (op->ops)
-		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
-	if (last)
-		xe_vm_put(vm);
-}
-
 static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			     bool post_commit, bool prev_post_commit,
 			     bool next_post_commit)
@@ -2738,8 +2717,6 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 					 op->flags & XE_VMA_OP_PREV_COMMITTED,
 					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 		}
-
-		drm_gpuva_ops_free(&vm->gpuvm, __ops);
 	}
 }
 
@@ -2818,8 +2795,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops,
-				     bool cleanup)
+				     struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op, *next;
 	struct dma_fence *fence = NULL;
@@ -2834,8 +2810,6 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 				 op->base.op, PTR_ERR(fence));
 			fence = ERR_PTR(-ENOSPC);
 		}
-		if (cleanup)
-			xe_vma_op_cleanup(vm, op);
 	}
 
 	return fence;
@@ -2858,7 +2832,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (err)
 			goto unlock;
 
-		fence = ops_execute(vm, vops, true);
+		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
@@ -3211,30 +3185,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto unwind_ops;
 	}
 
-	xe_vm_get(vm);
-	if (q)
-		xe_exec_queue_get(q);
-
 	err = vm_bind_ioctl_ops_execute(vm, &vops);
 
-	up_write(&vm->lock);
-
-	if (q)
-		xe_exec_queue_put(q);
-	xe_vm_put(vm);
-
-	for (i = 0; bos && i < args->num_binds; ++i)
-		xe_bo_put(bos[i]);
-
-	kvfree(bos);
-	kvfree(ops);
-	if (args->num_binds > 1)
-		kvfree(bind_ops);
-
-	return err;
-
 unwind_ops:
-	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	if (err && err != -ENODATA)
+		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
+	for (i = args->num_binds - 1; i >= 0; --i)
+		if (ops[i])
+			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
 free_syncs:
 	if (err == -ENODATA)
 		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 7ef9e632154a..f097fe318a74 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -181,11 +181,6 @@ enum xe_vma_op_flags {
 struct xe_vma_op {
 	/** @base: GPUVA base operation */
 	struct drm_gpuva_op base;
-	/**
-	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
-	 * operations is processed
-	 */
-	struct drm_gpuva_ops *ops;
 	/** @q: exec queue for this operation */
 	struct xe_exec_queue *q;
 	/**
-- 
2.34.1

