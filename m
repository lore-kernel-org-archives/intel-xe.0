Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E450C04A68
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4939310E4AE;
	Tue,  7 Nov 2023 05:26:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA83910E4AE
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 05:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699334756; x=1730870756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NOGPQip9acE5bUL+aGgF5UVhhrM95D5/P5rSn5vTI2Q=;
 b=mRZN5dCR/cQPn02ZRynHeRsYGXpuhpIrt+JfuIMfJTuahrpOv5DQCPz2
 Cs+cMK8Hvfb1TGtLpi8GoYYdMJevDuCa7WYdXHGXsp47ctIvbpI7rEB4m
 SL3ajVUEZAONGEPqBz+hZjSrm8eb06X84w1j8wS538eT3KGMb/UH3LaP+
 dGKSFRFdf3H8RmundKDFsbByDPHIHfiyRu8wuwJp9t7tR5UQJV+0Uv5Ge
 l4VJRisGUehGe0M/JeoWR/nbFeba8nHfthTY31ASce7CTC45cgFoPgTZ3
 BvMVJT873a46VBHnHtD/S4ktxaUPoDRKEK/pHzhrpHSaIc5Rnjv5wOhbz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="368769516"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="368769516"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="791689830"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="791689830"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 21:25:55 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  6 Nov 2023 21:25:41 -0800
Message-Id: <20231107052603.124361-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231107052603.124361-1-matthew.brost@intel.com>
References: <20231107052603.124361-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 05/27] drm/xe: Add ops_execute function which
 returns a fence
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

Add ops_execute function which returns a fence. This be helpful to
initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
preempt rebind worker, and rebinds in pagefaults) via a gpuva ops list.
Returning a fence is needed in various paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 210 +++++++++++++++++++------------------
 1 file changed, 109 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f5c7540767a4..73202e1909e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1842,21 +1842,22 @@ static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
 		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
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
 
@@ -1873,26 +1874,14 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	if (last_op && xe_vm_sync_mode(vm, q))
 		dma_fence_wait(fence, true);
-	dma_fence_put(fence);
 
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
-
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
@@ -1902,16 +1891,15 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 
 	fence = xe_vm_unbind_vma(vma, q, syncs, num_syncs, first_op, last_op);
 	if (IS_ERR(fence))
-		return PTR_ERR(fence);
+		return fence;
 
 	xe_vma_destroy(vma, fence);
 	if (last_op)
 		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
 	if (last_op && xe_vm_sync_mode(vm, q))
 		dma_fence_wait(fence, true);
-	dma_fence_put(fence);
 
-	return 0;
+	return fence;
 }
 
 #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_SCRATCH_PAGE | \
@@ -2051,10 +2039,11 @@ static const u32 region_to_mem_type[] = {
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
@@ -2064,26 +2053,24 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
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
-			}
 		}
 
-		return 0;
+		return fence;
 	}
 }
 
@@ -2534,10 +2521,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	return 0;
 }
 
-static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
-		      struct xe_vma_op *op)
+static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
+				    struct xe_vma_op *op)
 {
-	int err;
+	struct dma_fence *fence;
 
 	lockdep_assert_held_write(&vm->lock);
 	xe_vm_assert_held(vm);
@@ -2545,11 +2532,12 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
 
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
@@ -2559,37 +2547,37 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -2597,61 +2585,66 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
-	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
+	fence = op_execute(vm, vma, op);
+	if (IS_ERR(fence) && PTR_ERR(fence) == -EAGAIN &&
+	    xe_vma_is_userptr(vma)) {
 		lockdep_assert_held_write(&vm->lock);
 		err = xe_vma_userptr_pin_pages(vma);
 		if (!err)
 			goto retry_userptr;
 
+		fence = ERR_PTR(err);
 		trace_xe_vma_fail(vma);
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
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 	if (op->inject_error) {
 		op->inject_error = false;
-		return -ENOMEM;
+		return fence;
 	}
 #endif
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		ret = __xe_vma_op_execute(vm, op->map.vma, op);
+		fence = __xe_vma_op_execute(vm, op->map.vma, op);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 	{
@@ -2664,23 +2657,23 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2855,11 +2848,32 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 	return err;
 }
 
+static struct dma_fence *ops_execute(struct xe_vm *vm,
+				     struct list_head *ops_list,
+				     bool cleanup)
+{
+	struct xe_vma_op *op, *next;
+	struct dma_fence *fence = NULL;
+
+	list_for_each_entry_safe(op, next, ops_list, link) {
+		fence = xe_vma_op_execute(vm, op);
+		if (IS_ERR(fence)) {
+			drm_warn(&vm->xe->drm, "VM op(%d) failed with %ld",
+				 op->base.op, PTR_ERR(fence));
+			return ERR_PTR(-ENOSPC);
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
@@ -2868,23 +2882,17 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 	if (err)
 		return err;
 
-	list_for_each_entry_safe(op, next, ops_list, link) {
-		err = xe_vma_op_execute(vm, op);
-		if (err) {
-			drm_warn(&vm->xe->drm, "VM op(%d) failed with %d",
-				 op->base.op, err);
-			/*
-			 * FIXME: Killing VM rather than proper error handling
-			 */
-			xe_vm_kill(vm, false);
-			err = -ENOSPC;
-			goto unlock;
-		}
-		xe_vma_op_cleanup(vm, op);
+	fence = ops_execute(vm, ops_list, true);
+	if (IS_ERR(fence)) {
+		err = PTR_ERR(fence);
+		/* FIXME: Killing VM rather than proper error handling */
+		xe_vm_kill(vm, false);
+	} else {
+		dma_fence_put(fence);
 	}
 
-unlock:
 	drm_exec_fini(&exec);
+
 	return err;
 }
 
-- 
2.34.1

