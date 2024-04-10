Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB01CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 05:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350E9113173;
	Wed, 10 Apr 2024 05:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bV2PmspY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2C0113176
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 05:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712727634; x=1744263634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OdKB5yqLH9Q2j+GfBDcRZreE1Z3TLcjDfExXvfcqbW8=;
 b=bV2PmspYM9UknefewO+ehwawO6HRRdHH1RwTdeihDMr68ei6q8NKvzPM
 RxsQB/GWZIypaSfa/+6lISvUKRfR5ETg0J8JCg0gkqXz2yaOqncmsFPYM
 FED4xyepzsmvrrbspmNjsSc8MJ1AE7343yiWxFeF2cZt/ko9QV1j42pXj
 Pq2w5JNVQtTi0nYf3p8FMnA1tlUYLwChJnPsZNt1ku9ePjd6nvKl3OHAn
 CR9+wu6DRHunXkw83iHOxOdwY+Y3wjHFBP4cQcacG58dkDklKbTcuZByz
 n0J9YjIldvfDmM9C4NKvMylgm5wXtC7u/ecHjPQ6cFNhwdX4TU1O/gW8U Q==;
X-CSE-ConnectionGUID: 05wacgrGRhGKiElkBOBLuQ==
X-CSE-MsgGUID: cZh1nBaDRiyY8TaXe89LEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18680006"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="18680006"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
X-CSE-ConnectionGUID: 4VcquBHaTuaDBlIhFQOmzg==
X-CSE-MsgGUID: qaH4TynlRfOE96HLZVZE3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20536839"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 22:40:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 07/13] drm/xe: Use xe_vma_ops to implement page fault rebinds
Date: Tue,  9 Apr 2024 22:40:50 -0700
Message-Id: <20240410054056.478023-8-matthew.brost@intel.com>
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

All page tables updates are moving to a xe_vma_ops interface to
implement 1 job per VM bind IOCTL. Add xe_vma_rebind function which is
implemented using xe_vma_ops interface. Use xe_vma_rebind in page faults
for rebinds.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
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
index 8f5b24c8f6cd..54a69fbfbb00 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -815,6 +815,7 @@ static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 				  u8 tile_mask)
 {
 	INIT_LIST_HEAD(&op->link);
+	op->tile_mask = tile_mask;
 	op->base.op = DRM_GPUVA_OP_MAP;
 	op->base.map.va.addr = vma->gpuva.va.addr;
 	op->base.map.va.range = vma->gpuva.va.range;
@@ -893,6 +894,33 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
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
@@ -1796,7 +1824,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 static struct dma_fence *
 xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	       struct xe_sync_entry *syncs, u32 num_syncs,
-	       bool first_op, bool last_op)
+	       u8 tile_mask, bool first_op, bool last_op)
 {
 	struct xe_tile *tile;
 	struct dma_fence *fence;
@@ -1804,7 +1832,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
-	int number_tiles = hweight8(vma->tile_mask);
+	int number_tiles = hweight8(tile_mask);
 	int err;
 	u8 id;
 
@@ -1818,7 +1846,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
 	}
 
 	for_each_tile(tile, vm->xe, id) {
-		if (!(vma->tile_mask & BIT(id)))
+		if (!(tile_mask & BIT(id)))
 			goto next;
 
 		fence = __xe_pt_bind_vma(tile, vma, q ? q : vm->q[id],
@@ -1886,7 +1914,7 @@ find_ufence_get(struct xe_sync_entry *syncs, u32 num_syncs)
 static struct dma_fence *
 xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 	   struct xe_bo *bo, struct xe_sync_entry *syncs, u32 num_syncs,
-	   bool immediate, bool first_op, bool last_op)
+	   u8 tile_mask, bool immediate, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 	struct xe_exec_queue *wait_exec_queue = to_wait_exec_queue(vm, q);
@@ -1902,8 +1930,8 @@ xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_exec_queue *q,
 	vma->ufence = ufence ?: vma->ufence;
 
 	if (immediate) {
-		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, first_op,
-				       last_op);
+		fence = xe_vm_bind_vma(vma, q, syncs, num_syncs, tile_mask,
+				       first_op, last_op);
 		if (IS_ERR(fence))
 			return fence;
 	} else {
@@ -2095,7 +2123,7 @@ xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->tile_invalidated)) {
 		return xe_vm_bind(vm, vma, q, xe_vma_bo(vma), syncs, num_syncs,
-				  true, first_op, last_op);
+				  vma->tile_mask, true, first_op, last_op);
 	} else {
 		struct dma_fence *fence =
 			xe_exec_queue_last_fence_get(wait_exec_queue, vm);
@@ -2408,10 +2436,15 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
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
@@ -2428,6 +2461,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
 		}
 
 		op->q = q;
+		op->tile_mask = tile_mask;
 
 		switch (op->base.op) {
 		case DRM_GPUVA_OP_MAP:
@@ -2574,6 +2608,7 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
 		fence = xe_vm_bind(vm, vma, op->q, xe_vma_bo(vma),
 				   op->syncs, op->num_syncs,
 				   op->map.immediate || !xe_vm_in_fault_mode(vm),
+				   op->tile_mask,
 				   op->flags & XE_VMA_OP_FIRST,
 				   op->flags & XE_VMA_OP_LAST);
 		break;
@@ -2600,7 +2635,9 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -2614,8 +2651,8 @@ static struct dma_fence *op_execute(struct xe_vm *vm, struct xe_vma *vma,
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
index 149ab892967e..e9cd6da6263a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -343,6 +343,8 @@ struct xe_vma_op {
 	struct list_head link;
 	/** @flags: operation flags */
 	enum xe_vma_op_flags flags;
+	/** @tile_mask: Tile mask for operation */
+	u8 tile_mask;
 
 	union {
 		/** @map: VMA map operation specific data */
-- 
2.34.1

