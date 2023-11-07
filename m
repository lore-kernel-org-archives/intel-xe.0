Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B52EC04A92
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216110E4B6;
	Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B79710E4AE
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334757; x=1730870757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DgwAqkp/x7j/ZzBGWS+mdi9S5qGvsplS8hEv7Guu9pA=;
 b=bwh1frTdTCI5t5N72FGnl4Bst9a/nMIHOType+S2bJbg4eCd3O3S9Gwz
 v17Cr5WJsaKzp60/ybsfprvMwM6RcFvmOrLWZ+/EDimu3fJDJ2itHAmF6
 woU51esRT1tpY4GpNVfrAeR0AtRjeojynTzxiAbFRu7P52qxpGFI5cvXg
 HWqdDqGyyT+Eamqw4wjfgQGgn22+Pr3APrAL8wQUKBwIUttBmLkBMqR1B
 x+l72U9UufMvKiEI+rwHhCJnda8p6I+OsqQtqzFBXd3FkL5R8d4cVwbJw
 jo6+xdsZxXHyp7cfNXfTTwK9xRo2Yw7DB4gtcdAJCSeO7RH7+ZN0Q4ZqW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769522"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689845"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689845"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:46 -0800
Message-Id: <20231107052603.124361-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 10/27] drm/xe: Fixup error handling / ref
 counting in VM bind IOCTL
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

Part of the rework for the error handling.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 62 ++++++--------------------------
 drivers/gpu/drm/xe/xe_vm_types.h |  9 ++---
 2 files changed, 12 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 485252f69ed7..20866d7ddb9b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -844,8 +844,7 @@ static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops,
-				     bool cleanup);
+				     struct xe_vma_ops *vops);
 
 struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -869,7 +868,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_exec(vma);
 
 		xe_vm_populate_dummy_rebind(vm, vma);
-		fence = ops_execute(vm, &vm->dummy_ops.vops, false);
+		fence = ops_execute(vm, &vm->dummy_ops.vops);
 		if (IS_ERR(fence))
 			return fence;
 	}
@@ -2525,7 +2524,6 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	if (!last_op)
 		return 0;
 
-	last_op->ops = ops;
 	if (last) {
 		last_op->flags |= XE_VMA_OP_LAST;
 		last_op->num_syncs = num_syncs;
@@ -2689,25 +2687,6 @@ xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2769,7 +2748,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 {
 	int i;
 
-	for (i = num_ops_list - 1; i; ++i) {
+	for (i = num_ops_list - 1; i >= 0; --i) {
 		struct drm_gpuva_ops *__ops = ops[i];
 		struct drm_gpuva_op *__op;
 
@@ -2784,8 +2763,6 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
 					 op->flags & XE_VMA_OP_PREV_COMMITTED,
 					 op->flags & XE_VMA_OP_NEXT_COMMITTED);
 		}
-
-		drm_gpuva_ops_free(&vm->gpuvm, __ops);
 	}
 }
 
@@ -2865,8 +2842,7 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 }
 
 static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops,
-				     bool cleanup)
+				     struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op, *next;
 	struct dma_fence *fence = NULL;
@@ -2878,8 +2854,6 @@ static struct dma_fence *ops_execute(struct xe_vm *vm,
 				 op->base.op, PTR_ERR(fence));
 			return ERR_PTR(-ENOSPC);
 		}
-		if (cleanup)
-			xe_vma_op_cleanup(vm, op);
 	}
 
 	return fence;
@@ -2901,7 +2875,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (err)
 			return err;
 
-		fence = ops_execute(vm, vops, true);
+		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
@@ -3220,30 +3194,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
-	kfree(bos);
-	kfree(ops);
-	if (args->num_binds > 1)
-		kfree(bind_ops);
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
 	if (err == -ENODATA) {
 		struct dma_fence *fence;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 65cbed7bbdda..6424f75eb2df 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -184,11 +184,6 @@ enum xe_vma_op_flags {
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
@@ -198,9 +193,9 @@ struct xe_vma_op {
 	struct xe_sync_entry *syncs;
 	/** @num_syncs: number of syncs */
 	u32 num_syncs;
-	/** @link: async operation link */
+	/** @link: operation link */
 	struct list_head link;
-	/** @tile_mask: gt mask for this operation */
+	/** @tile_mask: tile mask for this operation */
 	u8 tile_mask;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
-- 
2.34.1

