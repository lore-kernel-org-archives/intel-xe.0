Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE80C54E4A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Mar 2024 05:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F15112E83;
	Fri,  8 Mar 2024 05:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrACfpw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B42A10FB99
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Mar 2024 05:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709874474; x=1741410474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ycdFjC/+WzhgxWnV4XFBllA4YrcKF5+eqoA8sxfkhd0=;
 b=XrACfpw5F+J5Stri7zn9v6qdMrtVl2lop5CWNHqGyL46lR+vxB+W4mJS
 OjpVaukub/DS8NDIC+DKDidbfFGhgK6fF3zCoMMBroQf6OlyAZuUTBsdp
 5oW8xrzmQ/Fxl3Q4ZNuIaC3APN7FZLEswWOr0sDt0XzmxikDaQ+o+hKdv
 lS88lKZb///HMXgzouoycNQ1Hnu1h7kLXJgt7m6Stse3Wz1f0AaHWRkwc
 mdi9+SvTEFR19/7mReYcOfBvVaXecNFP1uElvBTn0LUJlGJXk8mHmki3g
 tjvnVhvguoiWdY8qV+q8MQ1FDZM8yKeX0bSNELj/tQl0ZTtArExcq+hQ3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4761961"
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; 
   d="scan'208";a="4761961"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,108,1708416000"; d="scan'208";a="10402986"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 21:07:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v4 07/30] drm/xe: Update pagefaults to use dummy VMA operations
Date: Thu,  7 Mar 2024 21:07:43 -0800
Message-Id: <20240308050806.577176-8-matthew.brost@intel.com>
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

All bind interfaces are transitioning to use VMA ops, update
pagefaults to use VMA ops.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  7 ++--
 drivers/gpu/drm/xe/xe_vm.c           | 54 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h           |  3 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |  2 ++
 4 files changed, 47 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 73c535193a98..3c7d6e4e3917 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -19,7 +19,6 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
-#include "xe_pt.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -209,8 +208,10 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	fence = __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile), NULL, 0,
-				 vma->tile_present & BIT(tile->id));
+	xe_vm_populate_dummy_rebind(vm, vma);
+	vm->dummy_ops.op.tile_mask = BIT(tile->id);
+	vm->dummy_ops.op.q = xe_tile_migrate_engine(tile);
+	fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
 		goto unlock_dma_resv;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index dde777c807cf..a6bae2f5e296 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -755,22 +755,27 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
 }
 
-static void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
+/**
+ * xe_vm_populate_dummy_rebind() - Populate dummy rebind VMA ops
+ * @vm: The VM.
+ * @vma: VMA to populate dummy VMA ops
+ *
+ * Populate dummy VMA ops which can be used to issue a rebind for the VMA
+ */
+void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma)
 {
 	vm->dummy_ops.op.base.op = DRM_GPUVA_OP_MAP;
 	vm->dummy_ops.op.base.map.va.addr = vma->gpuva.va.addr;
 	vm->dummy_ops.op.base.map.va.range = vma->gpuva.va.range;
 	vm->dummy_ops.op.base.map.gem.obj = vma->gpuva.gem.obj;
 	vm->dummy_ops.op.base.map.gem.offset = vma->gpuva.gem.offset;
+	vm->dummy_ops.op.tile_mask = vma->tile_mask;
 	vm->dummy_ops.op.map.vma = vma;
 	vm->dummy_ops.op.map.immediate = true;
 	vm->dummy_ops.op.map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
 	vm->dummy_ops.op.map.is_null = xe_vma_is_null(vma);
 }
 
-static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops);
-
 struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
 	struct dma_fence *fence = NULL;
@@ -793,7 +798,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_exec(vma);
 
 		xe_vm_populate_dummy_rebind(vm, vma);
-		fence = ops_execute(vm, &vm->dummy_ops.vops);
+		fence = xe_vm_ops_execute(vm, &vm->dummy_ops.vops);
 		if (IS_ERR(fence))
 			return fence;
 	}
@@ -1724,7 +1729,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 static struct dma_fence *
 xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op)
+	       u8 tile_mask, bool first_op, bool last_op)
 {
 	struct xe_tile *tile;
 	struct dma_fence *fence;
@@ -1746,7 +1751,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	}
 
 	for_each_tile(tile, vm->xe, id) {
-		if (!(vma->tile_mask & BIT(id)))
+		if (!(tile_mask & BIT(id)))
 			goto next;
 
 		fence = __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
@@ -1814,7 +1819,7 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 static struct dma_fence *
 xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
-	   bool immediate, bool first_op, bool last_op)
+	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
@@ -1830,8 +1835,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 	vma->ufence = ufence ?: vma->ufence;
 
 	if (immediate) {
-		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
-				       last_op);
+		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
+				       first_op, last_op);
 		if (IS_ERR(fence))
 			return fence;
 	} else {
@@ -2023,7 +2028,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
-				  true, first_op, last_op);
+				  vma->tile_mask, true, first_op, last_op);
 	} else {
 		struct dma_fence *fence =
 			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
@@ -2333,10 +2338,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 	struct xe_device *xe = vm->xe;
 	struct xe_vma_op *last_op = NULL;
 	struct drm_gpuva_op *__op;
+	struct xe_tile *tile;
+	u8 id, tile_mask = 0;
 	int err = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
+	for_each_tile(tile, vm->xe, id)
+		tile_mask |= 0x1 << id;
+
 	drm_gpuva_for_each_op(__op, ops) {
 		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 		struct xe_vma *vma;
@@ -2353,6 +2363,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		}
 
 		op->q = q;
+		op->tile_mask = tile_mask;
 
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
@@ -2493,9 +2504,11 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
+		/* FIXME: Override vma->tile_mask for page faults */
 		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				   op->syncs, op->num_syncs,
 				   op->map.immediate,
+				   op->tile_mask,
 				   op->flags & XE_VMA_OP_FIRST,
 				   op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2522,7 +2535,8 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			dma_fence_put(fence);
 			fence = xe_vm_bind(vm, op->remap.prev, op->q,
 					   xe_vma_bo(op->remap.prev), op->syncs,
-					   op->num_syncs, true, false,
+					   op->num_syncs, op->remap.prev->tile_mask,
+					   true, false,
 					   op->flags & XE_VMA_OP_LAST && !next);
 			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (IS_ERR(fence))
@@ -2536,7 +2550,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			fence = xe_vm_bind(vm, op->remap.next, op->q,
 					   xe_vma_bo(op->remap.next),
 					   op->syncs, op->num_syncs,
-					   true, false,
+					   op->remap.next->tile_mask, true, false,
 					   op->flags & XE_VMA_OP_LAST);
 			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (IS_ERR(fence))
@@ -2794,8 +2808,16 @@ static int vm_bind_ioctl_ops_lock(struct drm_exec *exec,
 	return 0;
 }
 
-static struct dma_fence *ops_execute(struct xe_vm *vm,
-				     struct xe_vma_ops *vops)
+/**
+ * xe_vm_ops_execute() - Execute VMA ops
+ * @vm: The VM.
+ * @vops: VMA ops to execute
+ *
+ * Execute VMA ops binding / unbinding VMAs
+ *
+ * Return: A fence for VMA ops on success, ERR_PTR on failure
+ */
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops)
 {
 	struct xe_vma_op *op, *next;
 	struct dma_fence *fence = NULL;
@@ -2832,7 +2854,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		if (err)
 			goto unlock;
 
-		fence = ops_execute(vm, vops);
+		fence = xe_vm_ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6df1f1c7f85d..b40160b1be01 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -262,6 +262,9 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
  */
 #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
 
+void xe_vm_populate_dummy_rebind(struct xe_vm *vm, struct xe_vma *vma);
+struct dma_fence *xe_vm_ops_execute(struct xe_vm *vm, struct xe_vma_ops *vops);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index f097fe318a74..0bba5543ac28 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -194,6 +194,8 @@ struct xe_vma_op {
 	struct list_head link;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
+	/** @tile_mask: Tile mask for operation */
+	u8 tile_mask;
 
 	union {
 		/** @map: VMA map operation specific data */
-- 
2.34.1

