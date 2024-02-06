Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC27C48297
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 23:36:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E23112F67;
	Tue,  6 Feb 2024 23:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXYxbRcz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E400A112F66
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 23:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707262614; x=1738798614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9JG46IByO0BUUD6f4wfJUdgquffwLs+b8nASO1FGy30=;
 b=AXYxbRcz9poIwWgQBYtRU//jeRUA2drVK9rKwB8Fe44+VsxIaMECdjfH
 KBd6UpHLjtmlVtl7fGMlpMjc3PXGfI9qXa1PpHNYNN6a55LcW+iBtj5zm
 lCsc9JXJSfqC5JL1aA6/i9HbPbydBAsDyOuBiu0r6aB6m7QXATr52a2oC
 0ouV+PTeuKexUqAWtSs4SgPxoWJdWYa2tezq+NMkAp6pbOaqTkAb2vozg
 501BQZ4YUI/F8L6cVs9AS36TzE51lAUvOufaUkOeIy7divXAetj6d/2Yn
 lQMAXgMtdq+x/ezf2qNbe0J8QMKdzVo73d3E94YN3CYwDzGHXQHv0l73X w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="776784"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="776784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5793777"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 15:36:52 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 02/22] drm/xe: Add ops_execute function which returns a
 fence
Date: Tue,  6 Feb 2024 15:37:09 -0800
Message-Id: <20240206233729.3173206-3-matthew.brost@intel.com>
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

Add ops_execute function which returns a fence. This will be helpful to
initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
preempt rebind worker, and rebinds in pagefaults) via a gpuva ops list.
Returning a fence is needed in various paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 212 ++++++++++++++++++++-----------------
 1 file changed, 112 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3a7b82ca4b35..a33c1486ab64 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1738,21 +1738,22 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	return ERR_PTR(err);
 }
 
-static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-			u32 num_syncs, bool immediate, bool first_op,
-			bool last_op)
+static struct dma_fence *
+xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
+	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
+	   bool immediate, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 
 	xe_vm_assert_held(vm);
+	xe_bo_assert_held(bo);
 
 	if (immediate) {
 		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
 				       last_op);
 		if (IS_ERR(fence))
-			return PTR_ERR(fence);
+			return fence;
 	} else {
 		int i;
 
@@ -1767,26 +1768,14 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	dma_fence_put(fence);
-
-	return 0;
-}
-
-static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
-		      struct xe_bo *bo, struct xe_sync_entry *syncs,
-		      u32 num_syncs, bool immediate, bool first_op,
-		      bool last_op)
-{
-	xe_vm_assert_held(vm);
-	xe_bo_assert_held(bo);
 
-	return __xe_vm_bind(vm, vma, q, syncs, num_syncs, immediate, first_op,
-			    last_op);
+	return fence;
 }
 
-static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
-			u32 num_syncs, bool first_op, bool last_op)
+static struct dma_fence *
+xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
+	     struct xe_exec_queue *q, struct xe_sync_entry *syncs,
+	     u32 num_syncs, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
@@ -1796,14 +1785,13 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 
 	fence = xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op, last_op);
 	if (IS_ERR(fence))
-		return PTR_ERR(fence);
+		return fence;
 
 	xe_vma_destroy(vma, fence);
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
-	dma_fence_put(fence);
 
-	return 0;
+	return fence;
 }
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
@@ -1946,10 +1934,11 @@ static const u32 region_to_mem_type[] = {
 	XE_PL_VRAM1,
 };
 
-static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
-			  struct xe_exec_queue *q, u32 region,
-			  struct xe_sync_entry *syncs, u32 num_syncs,
-			  bool first_op, bool last_op)
+static struct dma_fence *
+xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
+	       struct xe_exec_queue *q, u32 region,
+	       struct xe_sync_entry *syncs, u32 num_syncs,
+	       bool first_op, bool last_op)
 {
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
 	int err;
@@ -1959,27 +1948,24 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
 		if (err)
-			return err;
+			return ERR_PTR(err);
 	}
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
 				  true, first_op, last_op);
 	} else {
+		struct dma_fence *fence =
+			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
 		int i;
 
 		/* Nothing to do, signal fences now */
 		if (last_op) {
-			for (i = 0; i < num_syncs; i++) {
-				struct dma_fence *fence =
-					xe_exec_queue_last_fence_get(wait_exec_queue, vm);
-
+			for (i = 0; i < num_syncs; i++)
 				xe_sync_entry_signal(&syncs[i], NULL, fence);
-				dma_fence_put(fence);
-			}
 		}
 
-		return 0;
+		return fence;
 	}
 }
 
@@ -2410,10 +2396,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	return 0;
 }
 
-static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
-		      struct xe_vma_op *op)
+static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
+				    struct xe_vma_op *op)
 {
-	int err;
+	struct dma_fence *fence = NULL;
 
 	lockdep_assert_held_write(&vm->lock);
 	xe_vm_assert_held(vm);
@@ -2421,11 +2407,12 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
-				 op->syncs, op->num_syncs,
-				 op->map.immediate || !xe_vm_in_fault_mode(vm),
-				 op->flags & XE_VMA_OP_FIRST,
-				 op->flags & XE_VMA_OP_LAST);
+		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
+				   op->syncs, op->num_syncs,
+				   op->map.immediate ||
+				   !xe_vm_in_fault_mode(vm),
+				   op->flags & XE_VMA_OP_FIRST,
+				   op->flags & XE_VMA_OP_LAST);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 	{
@@ -2435,37 +2422,39 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
 		if (!op->remap.unmap_done) {
 			if (prev || next)
 				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
-			err = xe_vm_unbind(vm, vma, op->q, op->syncs,
-					   op->num_syncs,
-					   op->flags & XE_VMA_OP_FIRST,
-					   op->flags & XE_VMA_OP_LAST &&
-					   !prev && !next);
-			if (err)
+			fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
+					     op->num_syncs,
+					     op->flags & XE_VMA_OP_FIRST,
+					     op->flags & XE_VMA_OP_LAST &&
+					     !prev && !next);
+			if (IS_ERR(fence))
 				break;
 			op->remap.unmap_done = true;
 		}
 
 		if (prev) {
 			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
-			err = xe_vm_bind(vm, op->remap.prev, op->q,
-					 xe_vma_bo(op->remap.prev), op->syncs,
-					 op->num_syncs, true, false,
-					 op->flags & XE_VMA_OP_LAST && !next);
+			dma_fence_put(fence);
+			fence = xe_vm_bind(vm, op->remap.prev, op->q,
+					   xe_vma_bo(op->remap.prev), op->syncs,
+					   op->num_syncs, true, false,
+					   op->flags & XE_VMA_OP_LAST && !next);
 			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (err)
+			if (IS_ERR(fence))
 				break;
 			op->remap.prev = NULL;
 		}
 
 		if (next) {
 			op->remap.next->gpuva.flags |= XE_VMA_LAST_REBIND;
-			err = xe_vm_bind(vm, op->remap.next, op->q,
-					 xe_vma_bo(op->remap.next),
-					 op->syncs, op->num_syncs,
-					 true, false,
-					 op->flags & XE_VMA_OP_LAST);
+			dma_fence_put(fence);
+			fence = xe_vm_bind(vm, op->remap.next, op->q,
+					   xe_vma_bo(op->remap.next),
+					   op->syncs, op->num_syncs,
+					   true, false,
+					   op->flags & XE_VMA_OP_LAST);
 			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
-			if (err)
+			if (IS_ERR(fence))
 				break;
 			op->remap.next = NULL;
 		}
@@ -2473,34 +2462,36 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
 		break;
 	}
 	case DRM_GPUVA_OP_UNMAP:
-		err = xe_vm_unbind(vm, vma, op->q, op->syncs,
-				   op->num_syncs, op->flags & XE_VMA_OP_FIRST,
-				   op->flags & XE_VMA_OP_LAST);
+		fence = xe_vm_unbind(vm, vma, op->q, op->syncs,
+				     op->num_syncs, op->flags & XE_VMA_OP_FIRST,
+				     op->flags & XE_VMA_OP_LAST);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		err = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
-				     op->syncs, op->num_syncs,
-				     op->flags & XE_VMA_OP_FIRST,
-				     op->flags & XE_VMA_OP_LAST);
+		fence = xe_vm_prefetch(vm, vma, op->q, op->prefetch.region,
+				       op->syncs, op->num_syncs,
+				       op->flags & XE_VMA_OP_FIRST,
+				       op->flags & XE_VMA_OP_LAST);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
 
-	if (err)
+	if (IS_ERR(fence))
 		trace_xe_vma_fail(vma);
 
-	return err;
+	return fence;
 }
 
-static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
-			       struct xe_vma_op *op)
+static struct dma_fence *
+__xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
+		    struct xe_vma_op *op)
 {
+	struct dma_fence *fence;
 	int err;
 
 retry_userptr:
-	err = op_execute(vm, vma, op);
-	if (err == -EAGAIN) {
+	fence = op_execute(vm, vma, op);
+	if (IS_ERR(fence) && PTR_ERR(fence) == -EAGAIN) {
 		lockdep_assert_held_write(&vm->lock);
 
 		if (op->base.op == DRM_GPUVA_OP_REMAP) {
@@ -2517,22 +2508,24 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			if (!err)
 				goto retry_userptr;
 
+			fence = ERR_PTR(err);
 			trace_xe_vma_fail(vma);
 		}
 	}
 
-	return err;
+	return fence;
 }
 
-static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
+static struct dma_fence *
+xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 {
-	int ret = 0;
+	struct dma_fence *fence = ERR_PTR(-ENOMEM);
 
 	lockdep_assert_held_write(&vm->lock);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		ret = __xe_vma_op_execute(vm, op->map.vma, op);
+		fence = __xe_vma_op_execute(vm, op->map.vma, op);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 	{
@@ -2545,23 +2538,23 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 		else
 			vma = op->remap.next;
 
-		ret = __xe_vma_op_execute(vm, vma, op);
+		fence = __xe_vma_op_execute(vm, vma, op);
 		break;
 	}
 	case DRM_GPUVA_OP_UNMAP:
-		ret = __xe_vma_op_execute(vm, gpuva_to_vma(op->base.unmap.va),
-					  op);
+		fence = __xe_vma_op_execute(vm, gpuva_to_vma(op->base.unmap.va),
+					    op);
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
-		ret = __xe_vma_op_execute(vm,
-					  gpuva_to_vma(op->base.prefetch.va),
-					  op);
+		fence = __xe_vma_op_execute(vm,
+					    gpuva_to_vma(op->base.prefetch.va),
+					    op);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
 	}
 
-	return ret;
+	return fence;
 }
 
 static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
@@ -2730,11 +2723,35 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 	return 0;
 }
 
+static struct dma_fence *ops_execute(struct xe_vm *vm,
+				     struct list_head *ops_list,
+				     bool cleanup)
+{
+	struct xe_vma_op *op, *next;
+	struct dma_fence *fence = NULL;
+
+	list_for_each_entry_safe(op, next, ops_list, link) {
+		if (!IS_ERR(fence)) {
+			dma_fence_put(fence);
+			fence = xe_vma_op_execute(vm, op);
+		}
+		if (IS_ERR(fence)) {
+			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
+				 op->base.op, PTR_ERR(fence));
+			fence = ERR_PTR(-ENOSPC);
+		}
+		if (cleanup)
+			xe_vma_op_cleanup(vm, op);
+	}
+
+	return fence;
+}
+
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 				     struct list_head *ops_list)
 {
 	struct drm_exec exec;
-	struct xe_vma_op *op, *next;
+	struct dma_fence *fence;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
@@ -2746,19 +2763,14 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (err)
 			goto unlock;
 
-		list_for_each_entry_safe(op, next, ops_list, link) {
-			err = xe_vma_op_execute(vm, op);
-			if (err) {
-				drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
-					 op->base.op, err);
-				/*
-				 * FIXME: Killing VM rather than proper error handling
-				 */
-				xe_vm_kill(vm, false);
-				err = -ENOSPC;
-				goto unlock;
-			}
-			xe_vma_op_cleanup(vm, op);
+		fence = ops_execute(vm, ops_list, true);
+		if (IS_ERR(fence)) {
+			err = PTR_ERR(fence);
+			/* FIXME: Killing VM rather than proper error handling */
+			xe_vm_kill(vm, false);
+			goto unlock;
+		} else {
+			dma_fence_put(fence);
 		}
 	}
 
-- 
2.34.1

