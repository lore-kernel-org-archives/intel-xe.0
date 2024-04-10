Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F38CCD1299
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C261113174;
	Wed, 10 Apr 2024 05:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOPuM6oG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20138113175
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727634; x=1744263634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oN8AQCi1N5DmOPQsRnwjRufhYlvCZ1SK4pTWZbst6NA=;
 b=NOPuM6oGlOatxx2m+xmNiIVBxQJ0Ifz0RWQILN66HyZ9dSMAZbbAbIrc
 oVport20m9Q8f2LrzjICnKGqZOsIXhIgZgw+nyy2KxePq82Auw/nTXmah
 wLYfh52BBBMo8Vp/j10sub7zBfj0+SutTRV1nxXuefX9FEHrrxqA44Wgq
 4oo0rHw7eXs5tM29/hQlVmr1DjTafIwrneGlyWiR/I70KFVM0RteCL9f3
 HtorEXkPWuPY7LszzsmBgA7CSIO5V3mqZvPzAKkjUP66C4e3jwtkA7xBM
 tlwlJ92jOfaXVudMCW9e4XsH87ORlx8NyxiVrZS+hDq/ENhUrt9wtduqu A==;
X-CSE-ConnectionGUID: GGNoFUCzTgCosxM5s/TN5A==
X-CSE-MsgGUID: AH+bThToTR65NqhuavLwtw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18680004"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18680004"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
X-CSE-ConnectionGUID: ZuDIVga1T2WRTK8s+vzBrg==
X-CSE-MsgGUID: JD4M7Wc7SYSmKH5T4hr9wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536836"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Date: Tue,  9 Apr 2024 22:40:49 -0700
Message-Id: <20240410054056.478023-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410054056.478023-1-matthew.brost@intel.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
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
---
 drivers/gpu/drm/xe/xe_vm.c       | 67 ++++++--------------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
 2 files changed, 12 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9d82396cf5d5..8f5b24c8f6cd 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -842,8 +842,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops,
-				     bool cleanup);
+				     struct xe_vma_ops *vops);
 static void xe_vma_ops_init(struct xe_vma_ops *vops);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
@@ -876,7 +875,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			goto free_ops;
 	}
 
-	fence = ops_execute(vm, &vops, false);
+	fence = ops_execute(vm, &vops);
 	if (IS_ERR(fence)) {
 		err = PTR_ERR(fence);
 	} else {
@@ -2551,7 +2550,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	if (!last_op)
 		return 0;
 
-	last_op->ops = ops;
 	if (last) {
 		last_op->flags |= XE_VMA_OP_LAST;
 		last_op->num_syncs = num_syncs;
@@ -2721,25 +2719,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2816,8 +2795,6 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 					 op->flags & XE_VMA_OP_PREV_COMMITTED,
 					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 		}
-
-		drm_gpuva_ops_free(&vm->gpuvm, __ops);
 	}
 }
 
@@ -2904,24 +2881,20 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
@@ -2944,7 +2917,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (err)
 			goto unlock;
 
-		fence = ops_execute(vm, vops, true);
+		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
@@ -3305,30 +3278,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
index 466b6c62d1f9..149ab892967e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -330,11 +330,6 @@ enum xe_vma_op_flags {
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

