Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2315CD129E
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3318211317A;
	Wed, 10 Apr 2024 05:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZJnKlXo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B75F113175
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727633; x=1744263633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DEwPaajIHUdMRfBiUTeg7C9yQknZpylAz9QT6s2nWQ0=;
 b=lZJnKlXocSFTFTPng06HU5zboJSevGL7C+FDg1kGqxwIL4yCPGuCzIuH
 +MAXhBxJ7tVME6ANeUTqCY0KavwlzaFqlQe844EBdmtvNx8zSRLyImN2e
 NGQ4hV2dORGnwtP8pAPeF6TPml1rvHcEBKRuf2KfeaF6ToFlSJRu+GPyS
 nueQbShvqCAwNcVmq5rMqIb04Zs+j9ZMthQd69+AooQamy9R1eceLKzaE
 wuAa0c/83RpbtjUOolZ2qt0MC5mOV8e/0I5ZpM3TYnJV3z0sg7lwG3KGM
 RQNcUmgMsmjVyE9YXTEz6cMeIra8Vs06bWvjTlkdEX4TbcJUCgPdzGvnE g==;
X-CSE-ConnectionGUID: gUqVKhvNR+O29oizO9mMxw==
X-CSE-MsgGUID: 15eJshppQhidKqfZqlOYnw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18680000"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18680000"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:32 -0700
X-CSE-ConnectionGUID: 5Ny5Wr27QHGFITz+/y2dzg==
X-CSE-MsgGUID: 7TWEFqWMT/mknRjBeBos4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536823"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:32 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH 02/13] drm/xe: Add ops_execute function which returns a fence
Date: Tue,  9 Apr 2024 22:40:45 -0700
Message-Id: <20240410054056.478023-3-matthew.brost@intel.com>
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

Add ops_execute function which returns a fence. This will be helpful to
initiate all binds (VM bind IOCTL, rebinds in exec IOCTL, rebinds in
preempt rebind worker, and rebinds in pagefaults) via a gpuva ops list.
Returning a fence is needed in various paths.

v2:
 - Rebase

Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 211 +++++++++++++++++++------------------
 1 file changed, 111 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6375c136e21a..84c6b10b4b78 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1834,16 +1834,17 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 	return NULL;
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
 	struct xe_user_fence *ufence;
 
 	xe_vm_assert_held(vm);
+	xe_bo_assert_held(bo);
 
 	ufence = find_ufence_get(syncs, num_syncs);
 	if (vma->ufence && ufence)
@@ -1855,7 +1856,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
 				       last_op);
 		if (IS_ERR(fence))
-			return PTR_ERR(fence);
+			return fence;
 	} else {
 		int i;
 
@@ -1870,26 +1871,14 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
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
@@ -1899,14 +1888,13 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 
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
@@ -2049,10 +2037,11 @@ static const u32 region_to_mem_type[] = {
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
@@ -2062,27 +2051,24 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
 		if (err)
-			return err;
+			return ERR_PTR(err);
 	}
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated)) {
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
 				xe_sync_entry_signal(&syncs[i], fence);
-				dma_fence_put(fence);
-			}
 		}
 
-		return 0;
+		return fence;
 	}
 }
 
@@ -2535,10 +2521,10 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
 
@@ -2547,11 +2533,11 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		err = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
-				 op->syncs, op->num_syncs,
-				 op->map.immediate || !xe_vm_in_fault_mode(vm),
-				 op->flags & XE_VMA_OP_FIRST,
-				 op->flags & XE_VMA_OP_LAST);
+		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
+				   op->syncs, op->num_syncs,
+				   op->map.immediate || !xe_vm_in_fault_mode(vm),
+				   op->flags & XE_VMA_OP_FIRST,
+				   op->flags & XE_VMA_OP_LAST);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 	{
@@ -2561,37 +2547,39 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -2599,34 +2587,36 @@ static int op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -2643,22 +2633,24 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -2671,23 +2663,23 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
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
@@ -2861,11 +2853,35 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
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
@@ -2878,19 +2894,14 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
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

