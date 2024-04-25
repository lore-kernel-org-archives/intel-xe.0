Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF881C10F1A
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 04:54:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD98011A0E5;
	Thu, 25 Apr 2024 04:54:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S3Npt3Vy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1848811A0E4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 04:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714020884; x=1745556884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxjK5yRzSaJ3UBKqoC0vC68HnVHN8Qe4khmJtFQKllg=;
 b=S3Npt3VyCaZN13v5/qSU1aS6jt8wLuICZlvFHET0uHE/VwHolahLPhw5
 DkozBDInf8WKOuLMsvoAXUpA3euluGWH+XIwMrsMSrdkxdsGKuYXmxt3W
 UssVpVlIHhakZweXPC1og5gRocMmEu+7z5HFTlZSjZqR1gbzsUeoMQW/F
 ErHzYNn1M5HLVRH1ulWb86AAE3Q+VXcvMREz1pV515HmrdFainGYMnrHv
 EozQlTKoJfuIJotTRyjQJXmCIDwTqlXj+iETeYRsRx+HdDIRHES3FKg5l
 /Hg/UrbbNVLR2XO4EFxt46soKCfLB0OKiNeo77RmZx5nljzxrt1k+yUbj A==;
X-CSE-ConnectionGUID: 9qen70K2SvOyOVM8xHDfHA==
X-CSE-MsgGUID: jRhfc/woRAeX0vDWgKJjoA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20374876"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="20374876"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:43 -0700
X-CSE-ConnectionGUID: bIqPi0hIQF6xhj0aCL8fVg==
X-CSE-MsgGUID: +/Z4ihIMSaS9dfitj7Jumg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; d="scan'208";a="24996491"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 21:54:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v3 06/13] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Date: Wed, 24 Apr 2024 21:55:06 -0700
Message-Id: <20240425045513.1913039-7-matthew.brost@intel.com>
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

Clean up everything in VM bind IOCTL in 1 path for both errors and
non-errors. Also move VM bind IOCTL cleanup from ops (also used by
non-IOCTL binds) to the VM bind IOCTL.

v2:
 - Break ops_execute on error (Oak)

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 67 ++++++--------------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
 2 files changed, 12 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d44234dc25b2..b7493b8a652e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -743,8 +743,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops,
-				     bool cleanup);
+				     struct xe_vma_ops *vops);
 static void xe_vma_ops_init(struct xe_vma_ops *vops);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
@@ -777,7 +776,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			goto free_ops;
 	}
 
-	fence = ops_execute(vm, &vops, false);
+	fence = ops_execute(vm, &vops);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 	} else {
@@ -2433,7 +2432,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	if (!last_op)
 		return 0;
 
-	last_op->ops = ops;
 	if (last) {
 		last_op->flags |= XE_VMA_OP_LAST;
 		last_op->num_syncs = num_syncs;
@@ -2603,25 +2601,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2698,8 +2677,6 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 					 op->flags & XE_VMA_OP_PREV_COMMITTED,
 					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 		}
-
-		drm_gpuva_ops_free(&vm->gpuvm, __ops);
 	}
 }
 
@@ -2787,24 +2764,20 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops,
-				     bool cleanup)
+				     struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op, *next;
 	struct dma_fence *fence = NULL;
 
 	list_for_each_entry_safe(op, next, &vops->list, link) {
-		if (!IS_ERR(fence)) {
-			dma_fence_put(fence);
-			fence = xe_vma_op_execute(vm, op);
-		}
+		dma_fence_put(fence);
+		fence = xe_vma_op_execute(vm, op);
 		if (IS_ERR(fence)) {
 			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
 				 op->base.op, PTR_ERR(fence));
 			fence = ERR_PTR(-ENOSPC);
+			break;
 		}
-		if (cleanup)
-			xe_vma_op_cleanup(vm, op);
 	}
 
 	return fence;
@@ -2827,7 +2800,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (err)
 			goto unlock;
 
-		fence = ops_execute(vm, vops, true);
+		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
@@ -3188,30 +3161,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 26b9e05c9113..9faffadf7c20 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -323,11 +323,6 @@ enum xe_vma_op_flags {
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

