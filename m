Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2856C19F53
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 17:24:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99124113CC5;
	Wed, 24 Apr 2024 17:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Es37OPZK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945DB10FCEB
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713979464; x=1745515464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cWuo8odDfu6Co+J/Fdh0+iBOuybKLrYLyBLSEycOM88=;
 b=Es37OPZKPBfKp/4Cb3MARmbYhSi8r2Gwht3gx0LPgUfwtViWdyTxgp63
 c1pIhtHXsIVB8iE8ynSPjPC1dEZ93yoEKvaod2iCHHuRUNiLXvlshw23B
 Kwzua5iZ2UG9tGxZFKrQpLvbknIOixQ9RD5kGMUvT+53bETLRcR3J1z/t
 z/Ncv1Lp6tHTP/ZB1X448vDtMgGflH8IkzWnL97k1StwTSMcXPqTK1XRS
 fgf+IKXjmE16JGPEImKLKWyZQ6TZBQ4BxiGnIjOX4Kvdg7giO75q3LHMq
 HvT/Nl0qf7qn7vPg3XfydyIVSHPVrWDJ6BmvIaoTtEydQ1zDcm583C/KZ A==;
X-CSE-ConnectionGUID: tGZRZ7l1R6udGYHpLoDiHQ==
X-CSE-MsgGUID: rmdN+FYFQl+nAQjWl/AMpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="12561476"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="12561476"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:23 -0700
X-CSE-ConnectionGUID: Rbi1hBpOSNezeoW9oW+GrA==
X-CSE-MsgGUID: +rNCM7NjReaN7gxjZlnGQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24825500"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 10:24:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Oak Zeng <oak.zeng@intel.com>
Subject: [PATCH v2 07/13] drm/xe: Use xe_vma_ops to implement page fault
 rebinds
Date: Wed, 24 Apr 2024 10:23:46 -0700
Message-Id: <20240424172352.1704851-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424172352.1704851-1-matthew.brost@intel.com>
References: <20240424172352.1704851-1-matthew.brost@intel.com>
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

In effort to make multiple VMA binds operations atomic (1 job), all
device page tables updates will be implemented via a xe_vma_ops (atomic
unit) interface,

Add xe_vma_rebind function which is implemented using xe_vma_ops
interface. Use xe_vma_rebind in GPU page faults for rebinds rather than
directly called deprecated function in PT layer.

v3:
 - Update commit message (Oak)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 16 ++++----
 drivers/gpu/drm/xe/xe_vm.c           | 57 +++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.h           |  2 +
 drivers/gpu/drm/xe/xe_vm_types.h     |  2 +
 4 files changed, 58 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index fa9e9853c53b..040dd142c49c 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -19,7 +19,6 @@
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
 #include "xe_migrate.h"
-#include "xe_pt.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
 
@@ -204,15 +203,14 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			goto unlock_dma_resv;
-	}
 
-	/* Bind VMA only to the GT that has faulted */
-	trace_xe_vma_pf_bind(vma);
-	fence = __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile), NULL, 0,
-				 vma->tile_present & BIT(tile->id));
-	if (IS_ERR(fence)) {
-		ret = PTR_ERR(fence);
-		goto unlock_dma_resv;
+		/* Bind VMA only to the GT that has faulted */
+		trace_xe_vma_pf_bind(vma);
+		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
+		if (IS_ERR(fence)) {
+			ret = PTR_ERR(fence);
+			goto unlock_dma_resv;
+		}
 	}
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b7493b8a652e..234b1baac39e 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -716,6 +716,7 @@ static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
 {
 	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = tile_mask;
 	op->base.op = DRM_GPUVA_OP_MAP;
 	op->base.map.va.addr = vma->gpuva.va.addr;
 	op->base.map.va.range = vma->gpuva.va.range;
@@ -794,6 +795,33 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	return err;
 }
 
+struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_mask)
+{
+	struct dma_fence *fence = NULL;
+	struct xe_vma_ops vops;
+	struct xe_vma_op *op, *next_op;
+	int err;
+
+	lockdep_assert_held(&vm->lock);
+	xe_vm_assert_held(vm);
+	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+
+	xe_vma_ops_init(&vops);
+
+	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
+	if (err)
+		return ERR_PTR(err);
+
+	fence = ops_execute(vm, &vops);
+
+	list_for_each_entry_safe(op, next_op, &vops.list, link) {
+		list_del(&op->link);
+		kfree(op);
+	}
+
+	return fence;
+}
+
 static void xe_vma_free(struct xe_vma *vma)
 {
 	if (xe_vma_is_userptr(vma))
@@ -1678,7 +1706,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 static struct dma_fence *
 xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op)
+	       u8 tile_mask, bool first_op, bool last_op)
 {
 	struct xe_tile *tile;
 	struct dma_fence *fence;
@@ -1686,7 +1714,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
-	int number_tiles = hweight8(vma->tile_mask);
+	int number_tiles = hweight8(tile_mask);
 	int err;
 	u8 id;
 
@@ -1700,7 +1728,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	}
 
 	for_each_tile(tile, vm->xe, id) {
-		if (!(vma->tile_mask & BIT(id)))
+		if (!(tile_mask & BIT(id)))
 			goto next;
 
 		fence = __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
@@ -1768,7 +1796,7 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 static struct dma_fence *
 xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
-	   bool immediate, bool first_op, bool last_op)
+	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
@@ -1784,8 +1812,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 	vma->ufence = ufence ?: vma->ufence;
 
 	if (immediate) {
-		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
-				       last_op);
+		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
+				       first_op, last_op);
 		if (IS_ERR(fence))
 			return fence;
 	} else {
@@ -1977,7 +2005,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
-				  true, first_op, last_op);
+				  vma->tile_mask, true, first_op, last_op);
 	} else {
 		struct dma_fence *fence =
 			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
@@ -2290,10 +2318,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
@@ -2310,6 +2343,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		}
 
 		op->q = q;
+		op->tile_mask = tile_mask;
 
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
@@ -2456,6 +2490,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				   op->syncs, op->num_syncs,
 				   op->map.immediate || !xe_vm_in_fault_mode(vm),
+				   op->tile_mask,
 				   op->flags & XE_VMA_OP_FIRST,
 				   op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2482,7 +2517,9 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			dma_fence_put(fence);
 			fence = xe_vm_bind(vm, op->remap.prev, op->q,
 					   xe_vma_bo(op->remap.prev), op->syncs,
-					   op->num_syncs, true, false,
+					   op->num_syncs,
+					   op->remap.prev->tile_mask, true,
+					   false,
 					   op->flags & XE_VMA_OP_LAST && !next);
 			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (IS_ERR(fence))
@@ -2496,8 +2533,8 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 			fence = xe_vm_bind(vm, op->remap.next, op->q,
 					   xe_vma_bo(op->remap.next),
 					   op->syncs, op->num_syncs,
-					   true, false,
-					   op->flags & XE_VMA_OP_LAST);
+					   op->remap.next->tile_mask, true,
+					   false, op->flags & XE_VMA_OP_LAST);
 			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
 			if (IS_ERR(fence))
 				break;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 306cd0934a19..204a4ff63f88 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -208,6 +208,8 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
+struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
+				u8 tile_mask);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma);
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 9faffadf7c20..7ff92b263b79 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -336,6 +336,8 @@ struct xe_vma_op {
 	struct list_head link;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
+	/** @tile_mask: Tile mask for operation */
+	u8 tile_mask;
 
 	union {
 		/** @map: VMA map operation specific data */
-- 
2.34.1

