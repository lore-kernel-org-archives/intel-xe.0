Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9007EC2BA2B
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 02:16:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 299C710E76C;
	Wed, 12 Jun 2024 02:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dHlnZInM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEC510E776
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 02:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718158540; x=1749694540;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=EQ0ZnnH/WgLa+TAK+eMLd/7vqCgQwkiSSvLCpQjYdE8=;
 b=dHlnZInMugG2b1MSnz8YWEx9FNpACPei4lVk/4LsxS2IA6R3poQMbpYW
 i03cgyN+Z5FmNY+6eLxiyVXfQWrK+AJuQQ4K6/3BlR7Ceq9eoh3wtS6Ys
 qaYZrkS2ApHgQ+rDRwkef/HtZkw+nNTu4BsyXJMzqD6GYJAaQzzXlja/a
 gPGF0Vcb5oO/6Z40lvHS1xJ5/IINwRQhe+J8a/N4jXVPyP351KJzvYSvk
 jPqCywspCV0ejWMASr27f9fSdF3KUy2zHQlfQl+gXn2eY/vxQockNAE6+
 fYNfUUaeowjt5UvUMSTVQl9J30Hf2IXuAdNTQ+//S3fP2I0TgdfHr0hV0 w==;
X-CSE-ConnectionGUID: UcVA192GQD2WuxJDSOJztQ==
X-CSE-MsgGUID: fbM64AfzT9GFv27myGfj+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="37427812"
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="37427812"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
X-CSE-ConnectionGUID: +LGeeiihQaKSc0jLZ29Xhw==
X-CSE-MsgGUID: Qk3T/Qr9RdqGgmccSD2G6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,231,1712646000"; d="scan'208";a="44763647"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 19:15:27 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 28/43] drm/xe: Support range based page table update
Date: Tue, 11 Jun 2024 22:25:50 -0400
Message-Id: <20240612022605.385062-28-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240612022605.385062-1-oak.zeng@intel.com>
References: <20240612022605.385062-1-oak.zeng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently the page table update interface only supports whole xe_vma
bind. This works fine for BO based driver. But for system allocator,
we need to partially bind a vma to GPU page table.

GPU page table update interface such as xe_vma_rebind is modified
to support partial vma bind. Binding range (start, end) parameters
are added to a few vma bind and page table update functions.

VMA unbind is still whole xe_vma based as there is no requirement
to unbind a vma partiallly.

There is no function change in this patch. It is only a interface
change as a preparation of the coming system allocator codes.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  3 +-
 drivers/gpu/drm/xe/xe_pt.c           | 60 ++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.c           | 23 ++++++-----
 drivers/gpu/drm/xe/xe_vm.h           |  2 +-
 4 files changed, 51 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index c3e9331cf1b6..3b98499ad614 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -154,7 +154,8 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 
 		/* Bind VMA only to the GT that has faulted */
 		trace_xe_vma_pf_bind(vma);
-		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
+		fence = xe_vma_rebind(vm, vma, xe_vma_start(vma),
+			    xe_vma_end(vma), BIT(tile->id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			if (xe_vm_validate_should_retry(&exec, err, &end))
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 96600ba9e100..91b61fa80acb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -583,6 +583,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  * range.
  * @tile: The tile we're building for.
  * @vma: The vma indicating the address range.
+ * @start: start of the address range to bind, must be inside vma's va range
+ * @end: end of the address range, must be inside vma's va range
  * @entries: Storage for the update entries used for connecting the tree to
  * the main tree at commit time.
  * @num_entries: On output contains the number of @entries used.
@@ -597,7 +599,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  * Return 0 on success, negative error code on error.
  */
 static int
-xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
+xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	struct xe_device *xe = tile_to_xe(tile);
@@ -614,7 +616,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.vm = xe_vma_vm(vma),
 		.tile = tile,
 		.curs = &curs,
-		.va_curs_start = xe_vma_start(vma),
+		.va_curs_start = start,
 		.vma = vma,
 		.wupd.entries = entries,
 		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
@@ -622,6 +624,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	xe_assert(xe, start >= xe_vma_start(vma));
+	xe_assert(xe, end <= xe_vma_end(vma));
 	/**
 	 * Default atomic expectations for different allocation scenarios are as follows:
 	 *
@@ -668,21 +672,24 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	xe_bo_assert_held(bo);
 
 	if (!xe_vma_is_null(vma)) {
+		u64 size = end - start;
+		u64 offset = start - xe_vma_start(vma);
+		u64 page_idx = offset >> PAGE_SHIFT;
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_dma(to_userptr_vma(vma)->userptr.hmmptr.dma_addr,
+			xe_res_first_dma(to_userptr_vma(vma)->userptr.hmmptr.dma_addr + page_idx,
 					0, xe_vma_size(vma), 0, &curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
-			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
-				     xe_vma_size(vma), &curs);
+			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma) + offset,
+				     size, &curs);
 		else
-			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma),
-					xe_vma_size(vma), &curs);
+			xe_res_first_sg(xe_bo_sg(bo), xe_vma_bo_offset(vma) + offset,
+					size, &curs);
 	} else {
 		curs.size = xe_vma_size(vma);
 	}
 
-	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
-			       xe_vma_end(vma), &xe_walk.base);
+	ret = xe_pt_walk_range(&pt->base, pt->level, start,
+			       end, &xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -984,13 +991,13 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
 }
 
 static int
-xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
+xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end,
 		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	int err;
 
 	*num_entries = 0;
-	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
+	err = xe_pt_stage_bind(tile, vma, start, end, entries, num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
 
@@ -1643,7 +1650,7 @@ xe_pt_commit_prepare_unbind(struct xe_vma *vma,
 
 static void
 xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
-				 struct xe_vma *vma)
+				 u64 start_va, u64 end_va)
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
@@ -1658,8 +1665,8 @@ xe_pt_update_ops_rfence_interval(struct xe_vm_pgtable_update_ops *pt_update_ops,
 	}
 
 	/* Greedy (non-optimal) calculation but simple */
-	start = ALIGN_DOWN(xe_vma_start(vma), 0x1ull << xe_pt_shift(level));
-	last = ALIGN(xe_vma_end(vma), 0x1ull << xe_pt_shift(level)) - 1;
+	start = ALIGN_DOWN(start_va, 0x1ull << xe_pt_shift(level));
+	last = ALIGN(end_va, 0x1ull << xe_pt_shift(level)) - 1;
 
 	if (start < pt_update_ops->start)
 		pt_update_ops->start = start;
@@ -1678,7 +1685,7 @@ static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
 
 static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
-			   struct xe_vma *vma)
+			   struct xe_vma *vma, u64 start, u64 end)
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
@@ -1686,10 +1693,12 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 
 	xe_tile_assert(tile, !xe_vma_is_system_allocator(vma));
 	xe_bo_assert_held(xe_vma_bo(vma));
+	xe_assert(vm->xe, start >= xe_vma_start(vma));
+	xe_assert(vm->xe, end <= xe_vma_end(vma));
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing bind, with range [%llx...%llx)\n",
-	       xe_vma_start(vma), xe_vma_end(vma) - 1);
+	       start, end - 1);
 
 	pt_op->vma = NULL;
 	pt_op->bind = true;
@@ -1699,7 +1708,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 	if (err)
 		return err;
 
-	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
+	err = xe_pt_prepare_bind(tile, vma, start, end, pt_op->entries,
 				 &pt_op->num_entries);
 	if (!err) {
 		xe_tile_assert(tile, pt_op->num_entries <=
@@ -1707,7 +1716,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 					pt_op->num_entries, true);
 
-		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+		xe_pt_update_ops_rfence_interval(pt_update_ops, start, end);
 		++pt_update_ops->current_op;
 		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 
@@ -1777,7 +1786,7 @@ static int unbind_op_prepare(struct xe_tile *tile,
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
 				pt_op->num_entries, false);
-	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
+	xe_pt_update_ops_rfence_interval(pt_update_ops, xe_vma_start(vma), xe_vma_end(vma));
 	++pt_update_ops->current_op;
 	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
 	pt_update_ops->needs_invalidation = true;
@@ -1802,7 +1811,8 @@ static int op_prepare(struct xe_vm *vm,
 		    op->map.is_system_allocator)
 			break;
 
-		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
+		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
+			op->base.map.va.addr, op->base.map.va.addr + op->base.map.va.range);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	case DRM_GPUVA_OP_REMAP:
@@ -1815,13 +1825,13 @@ static int op_prepare(struct xe_vm *vm,
 		err = unbind_op_prepare(tile, pt_update_ops, old);
 
 		if (!err && op->remap.prev) {
-			err = bind_op_prepare(vm, tile, pt_update_ops,
-					      op->remap.prev);
+			err = bind_op_prepare(vm, tile, pt_update_ops, op->remap.prev,
+				xe_vma_start(op->remap.prev), xe_vma_end(op->remap.prev));
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
 		if (!err && op->remap.next) {
-			err = bind_op_prepare(vm, tile, pt_update_ops,
-					      op->remap.next);
+			err = bind_op_prepare(vm, tile, pt_update_ops, op->remap.next,
+				xe_vma_start(op->remap.next), xe_vma_end(op->remap.next));
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
 		break;
@@ -1843,7 +1853,7 @@ static int op_prepare(struct xe_vm *vm,
 		if (xe_vma_is_system_allocator(vma))
 			break;
 
-		err = bind_op_prepare(vm, tile, pt_update_ops, vma);
+		err = bind_op_prepare(vm, tile, pt_update_ops, vma, xe_vma_start(vma), xe_vma_end(vma));
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index ccb8c589661f..aa9163555d1c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -803,15 +803,15 @@ static void xe_vma_ops_incr_pt_update_ops(struct xe_vma_ops *vops, u8 tile_mask)
 }
 
 static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
-				  u8 tile_mask)
+				  u64 start, u64 end, u8 tile_mask)
 {
 	INIT_LIST_HEAD(&op->link);
 	op->tile_mask = tile_mask;
 	op->base.op = DRM_GPUVA_OP_MAP;
-	op->base.map.va.addr = vma->gpuva.va.addr;
-	op->base.map.va.range = vma->gpuva.va.range;
+	op->base.map.va.addr = start;
+	op->base.map.va.range = end - start;
 	op->base.map.gem.obj = vma->gpuva.gem.obj;
-	op->base.map.gem.offset = vma->gpuva.gem.offset;
+	op->base.map.gem.offset = vma->gpuva.gem.offset + (start - xe_vma_start(vma));
 	op->map.vma = vma;
 	op->map.immediate = true;
 	op->map.dumpable = vma->gpuva.flags & XE_VMA_DUMPABLE;
@@ -819,7 +819,7 @@ static void xe_vm_populate_rebind(struct xe_vma_op *op, struct xe_vma *vma,
 }
 
 static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
-				u8 tile_mask)
+				u64 start, u64 end, u8 tile_mask)
 {
 	struct xe_vma_op *op;
 
@@ -827,7 +827,7 @@ static int xe_vm_ops_add_rebind(struct xe_vma_ops *vops, struct xe_vma *vma,
 	if (!op)
 		return -ENOMEM;
 
-	xe_vm_populate_rebind(op, vma, tile_mask);
+	xe_vm_populate_rebind(op, vma, start, end, tile_mask);
 	list_add_tail(&op->link, &vops->list);
 	xe_vma_ops_incr_pt_update_ops(vops, tile_mask);
 
@@ -866,8 +866,8 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 		else
 			trace_xe_vma_rebind_exec(vma);
 
-		err = xe_vm_ops_add_rebind(&vops, vma,
-					   vma->tile_present);
+		err = xe_vm_ops_add_rebind(&vops, vma, xe_vma_start(vma),
+					   xe_vma_end(vma), vma->tile_present);
 		if (err)
 			goto free_ops;
 	}
@@ -895,7 +895,8 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	return err;
 }
 
-struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_mask)
+struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
+					    u64 start, u64 end, u8 tile_mask)
 {
 	struct dma_fence *fence = NULL;
 	struct xe_vma_ops vops;
@@ -907,6 +908,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	lockdep_assert_held(&vm->lock);
 	xe_vm_assert_held(vm);
 	xe_assert(vm->xe, xe_vm_in_fault_mode(vm));
+	xe_assert(vm->xe, start >= xe_vma_start(vma));
+	xe_assert(vm->xe, end <= xe_vma_end(vma));
 
 	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
 	for_each_tile(tile, vm->xe, id) {
@@ -915,7 +918,7 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 			xe_tile_migrate_exec_queue(tile);
 	}
 
-	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
+	err = xe_vm_ops_add_rebind(&vops, vma, start, end, tile_mask);
 	if (err)
 		return ERR_PTR(err);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index a36e5263418c..a765f1d9ff19 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -221,7 +221,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm);
 
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
-				u8 tile_mask);
+				u64 start, u64 end, u8 tile_mask);
 
 int xe_vm_invalidate_vma(struct xe_vma *vma, u64 start, u64 end);
 
-- 
2.26.3

