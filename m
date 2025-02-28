Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6717FC282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 15:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35EA810ECD2;
	Fri, 28 Feb 2025 15:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cv+CDG//";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4CB10ECD3
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740755696; x=1772291696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FneqIrY+lY3PR2X3j+vnZKvasPvaiOMYyNoZoJvWNag=;
 b=Cv+CDG//zJoD2paYQhzoTWiB+EyDXgHTAxdZTlUT1MqtThPbXCRGN+qT
 Xm0hiYJrLwrc+thqOsiBBtFc9U+JJJYvC1OgzOJoZi7kjkPWLbInNP4lU
 u6du3s7ZqOjCSohMmc6UufG2N9kFGXAcfvFjavhslNFToCPjywZ27efG3
 3UxSuEWhZKmvij7nhAomwbDXCyuvAEzCowtxI0IshABDg3nXP6DebJqoU
 phWO2Q4HFECDoPgMwK44GEt9+2+Ph1tEcdr+xkbysxVwZs5NMxRI3/dLX
 gqmiqx3pLwjrUWyN+qtK+4SSw8GE0h1/SuypH4NN0QAhpkzuY1myqu0+g g==;
X-CSE-ConnectionGUID: fu0KvfVcRYa2cGnMDoD+Ug==
X-CSE-MsgGUID: CmsKhEHkTke2+Un80wxfKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="67064334"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="67064334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:14:56 -0800
X-CSE-ConnectionGUID: jEdf2womTd2B1OxHGzfv0Q==
X-CSE-MsgGUID: v8cEPUEUQuClPbDvmOVOKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117113414"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 07:14:55 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH v7 2/3] drm/xe: Clear scratch page on vm_bind
Date: Fri, 28 Feb 2025 10:30:57 -0500
Message-Id: <20250228153058.1039188-3-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250228153058.1039188-1-oak.zeng@intel.com>
References: <20250228153058.1039188-1-oak.zeng@intel.com>
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

When a vm runs under fault mode, if scratch page is enabled, we need
to clear the scratch page mapping on vm_bind for the vm_bind address
range. Under fault mode, we depend on recoverable page fault to
establish mapping in page table. If scratch page is not cleared, GPU
access of address won't cause page fault because it always hits the
existing scratch page mapping.

When vm_bind with IMMEDIATE flag, there is no need of clearing as
immediate bind can overwrite the scratch page mapping.

So far only is xe2 and xe3 products are allowed to enable scratch page
under fault mode. On other platform we don't allow scratch page under
fault mode, so no need of such clearing.

v2: Rework vm_bind pipeline to clear scratch page mapping. This is similar
to a map operation, with the exception that PTEs are cleared instead of
pointing to valid physical pages. (Matt, Thomas)

TLB invalidation is needed after clear scratch page mapping as larger
scratch page mapping could be backed by physical page and cached in
TLB. (Matt, Thomas)

v3: Fix the case of clearing huge pte (Thomas)

Improve commit message (Thomas)

v4: TLB invalidation on all LR cases, not only the clear on bind
cases (Thomas)

v5: Misc cosmetic changes (Matt)
    Drop pt_update_ops.invalidate_on_bind. Directly wire
    xe_vma_op.map.invalidata_on_bind to bind_op_prepare/commit (Matt)

v6: checkpatch fix (Matt)

v7: No need to check platform needs_scratch deciding invalidate_on_bind (Matt)

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 93 ++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm.c       | 26 +++++++--
 drivers/gpu/drm/xe/xe_vm_types.h |  2 +
 3 files changed, 84 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..4e16df96f3e4 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
 	 * granularity.
 	 */
 	bool needs_64K;
+	/* @clear_pt: clear page table entries during the bind walk */
+	bool clear_pt;
 	/**
 	 * @vma: VMA being mapped
 	 */
@@ -415,6 +417,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	if (xe_vma_is_null(xe_walk->vma))
 		return true;
 
+	/* if we are clearing page table, no dma addresses*/
+	if (xe_walk->clear_pt)
+		return true;
+
 	/* Is the DMA address huge PTE size aligned? */
 	size = next - addr;
 	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
@@ -497,21 +503,27 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
-		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
-						 xe_res_dma(curs) + xe_walk->dma_offset,
-						 xe_walk->vma, pat_index, level);
-		pte |= xe_walk->default_pte;
+		if (xe_walk->clear_pt) {
+			pte = 0;
+		} else {
+			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
+							 xe_res_dma(curs) +
+							 xe_walk->dma_offset,
+							 xe_walk->vma,
+							 pat_index, level);
+			pte |= xe_walk->default_pte;
 
-		/*
-		 * Set the XE_PTE_PS64 hint if possible, otherwise if
-		 * this device *requires* 64K PTE size for VRAM, fail.
-		 */
-		if (level == 0 && !xe_parent->is_compact) {
-			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
-				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
-				pte |= XE_PTE_PS64;
-			} else if (XE_WARN_ON(xe_walk->needs_64K)) {
-				return -EINVAL;
+			/*
+			 * Set the XE_PTE_PS64 hint if possible, otherwise if
+			 * this device *requires* 64K PTE size for VRAM, fail.
+			 */
+			if (level == 0 && !xe_parent->is_compact) {
+				if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
+					xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
+					pte |= XE_PTE_PS64;
+				} else if (XE_WARN_ON(xe_walk->needs_64K)) {
+					return -EINVAL;
+				}
 			}
 		}
 
@@ -519,7 +531,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		if (unlikely(ret))
 			return ret;
 
-		if (!is_null)
+		if (!is_null && !xe_walk->clear_pt)
 			xe_res_next(curs, next - addr);
 		xe_walk->va_curs_start = next;
 		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
@@ -590,6 +602,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  * @entries: Storage for the update entries used for connecting the tree to
  * the main tree at commit time.
  * @num_entries: On output contains the number of @entries used.
+ * @clear_pt: Clear the page table entries.
  *
  * This function builds a disconnected page-table tree for a given address
  * range. The tree is connected to the main vm tree for the gpu using
@@ -602,7 +615,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  */
 static int
 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
-		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
+		 struct xe_vm_pgtable_update *entries,
+		 u32 *num_entries, bool clear_pt)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
@@ -622,10 +636,14 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.vma = vma,
 		.wupd.entries = entries,
 		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
+		.clear_pt = clear_pt,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	if (clear_pt)
+		goto walk_pt;
+
 	/**
 	 * Default atomic expectations for different allocation scenarios are as follows:
 	 *
@@ -685,6 +703,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		curs.size = xe_vma_size(vma);
 	}
 
+walk_pt:
 	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
 			       xe_vma_end(vma), &xe_walk.base);
 
@@ -981,12 +1000,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
 
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
-		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
+		   struct xe_vm_pgtable_update *entries,
+		   u32 *num_entries, bool invalidate_on_bind)
 {
 	int err;
 
 	*num_entries = 0;
-	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
+	err = xe_pt_stage_bind(tile, vma, entries, num_entries,
+			       invalidate_on_bind);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
 
@@ -1640,7 +1661,7 @@ static int vma_reserve_fences(struct xe_device *xe, struct xe_vma *vma)
 
 static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
-			   struct xe_vma *vma)
+			   struct xe_vma *vma, bool invalidate_on_bind)
 {
 	u32 current_op = pt_update_ops->current_op;
 	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
@@ -1661,7 +1682,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		return err;
 
 	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
-				 &pt_op->num_entries);
+				 &pt_op->num_entries, invalidate_on_bind);
 	if (!err) {
 		xe_tile_assert(tile, pt_op->num_entries <=
 			       ARRAY_SIZE(pt_op->entries));
@@ -1681,11 +1702,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
 		 * PTE is already cached in the TLB so it needs to be invalidated.
 		 * On !LR VMs this is done in the ring ops preceding a batch, but on
-		 * non-faulting LR, in particular on user-space batch buffer chaining,
-		 * it needs to be done here.
+		 * LR, in particular on user-space batch buffer chaining, it needs to
+		 * be done here.
 		 */
 		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
-		     xe_vm_in_preempt_fence_mode(vm)))
+		     xe_vm_in_lr_mode(vm)))
 			pt_update_ops->needs_invalidation = true;
 		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
 			/* We bump also if batch_invalidate_tlb is true */
@@ -1759,10 +1780,12 @@ static int op_prepare(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
+		    !op->map.invalidate_on_bind)
 			break;
 
-		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
+		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
+				      op->map.invalidate_on_bind);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	case DRM_GPUVA_OP_REMAP:
@@ -1771,12 +1794,12 @@ static int op_prepare(struct xe_vm *vm,
 
 		if (!err && op->remap.prev) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
-					      op->remap.prev);
+					      op->remap.prev, false);
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
 		if (!err && op->remap.next) {
 			err = bind_op_prepare(vm, tile, pt_update_ops,
-					      op->remap.next);
+					      op->remap.next, false);
 			pt_update_ops->wait_vm_bookkeep = true;
 		}
 		break;
@@ -1786,7 +1809,8 @@ static int op_prepare(struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		err = bind_op_prepare(vm, tile, pt_update_ops,
-				      gpuva_to_vma(op->base.prefetch.va));
+				      gpuva_to_vma(op->base.prefetch.va),
+				      false);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
 	default:
@@ -1856,7 +1880,7 @@ ALLOW_ERROR_INJECTION(xe_pt_update_ops_prepare, ERRNO);
 static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   struct xe_vm_pgtable_update_ops *pt_update_ops,
 			   struct xe_vma *vma, struct dma_fence *fence,
-			   struct dma_fence *fence2)
+			   struct dma_fence *fence2, bool invalidate_on_bind)
 {
 	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm) {
 		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
@@ -1871,6 +1895,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	}
 	vma->tile_present |= BIT(tile->id);
 	vma->tile_staged &= ~BIT(tile->id);
+	if (invalidate_on_bind)
+		vma->tile_invalidated |= BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
 		lockdep_assert_held_read(&vm->userptr.notifier_lock);
 		to_userptr_vma(vma)->userptr.initial_bind = true;
@@ -1929,7 +1955,7 @@ static void op_commit(struct xe_vm *vm,
 			break;
 
 		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence,
-			       fence2);
+			       fence2, op->map.invalidate_on_bind);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
@@ -1938,10 +1964,10 @@ static void op_commit(struct xe_vm *vm,
 
 		if (op->remap.prev)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
-				       fence, fence2);
+				       fence, fence2, false);
 		if (op->remap.next)
 			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
-				       fence, fence2);
+				       fence, fence2, false);
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		unbind_op_commit(vm, tile, pt_update_ops,
@@ -1949,7 +1975,8 @@ static void op_commit(struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_PREFETCH:
 		bind_op_commit(vm, tile, pt_update_ops,
-			       gpuva_to_vma(op->base.prefetch.va), fence, fence2);
+			       gpuva_to_vma(op->base.prefetch.va), fence,
+			       fence2, false);
 		break;
 	default:
 		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 996000f2424e..47051735f0e1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1946,6 +1946,20 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 }
 #endif
 
+static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
+{
+	if (!xe_vm_in_fault_mode(vm))
+		return false;
+
+	if (!xe_vm_has_scratch(vm))
+		return false;
+
+	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
+		return false;
+
+	return true;
+}
+
 /*
  * Create operations list from IOCTL arguments, setup operations fields so parse
  * and commit steps are decoupled from IOCTL arguments. This step can fail.
@@ -2016,6 +2030,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
+			op->map.invalidate_on_bind =
+				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
 		}
@@ -2213,7 +2229,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
-			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
+			    op->map.invalidate_on_bind)
 				xe_vma_ops_incr_pt_update_ops(vops,
 							      op->tile_mask);
 			break;
@@ -2441,9 +2458,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		err = vma_lock_and_validate(exec, op->map.vma,
-					    !xe_vm_in_fault_mode(vm) ||
-					    op->map.immediate);
+		if (!op->map.invalidate_on_bind)
+			err = vma_lock_and_validate(exec, op->map.vma,
+						    !xe_vm_in_fault_mode(vm) ||
+						    op->map.immediate);
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 52467b9b5348..dace04f4ea5e 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -297,6 +297,8 @@ struct xe_vma_op_map {
 	bool is_null;
 	/** @dumpable: whether BO is dumped on GPU hang */
 	bool dumpable;
+	/** @invalidate: invalidate the VMA before bind */
+	bool invalidate_on_bind;
 	/** @pat_index: The pat index to use for this operation. */
 	u16 pat_index;
 };
-- 
2.26.3

