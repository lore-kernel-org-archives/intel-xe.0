Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E595AC021A4
	for <intel-xe@archiver.kernel.org>; Thu, 13 Feb 2025 02:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBF810E24D;
	Thu, 13 Feb 2025 02:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhtK9Q3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86AE510E24D
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Feb 2025 02:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412474; x=1770948474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=whkx3/avq+s8kK4zBoPTLRRRtq3h+mHk0RMGsRUFLkw=;
 b=OhtK9Q3+b7/AiCttZdWB+PFitRG1cY1xjnDeonF/PgIRJm00gpqheukS
 CRcwEY/6lauV5C7FhkFwBTjXf+HMp6B6JfqE89x7GEjWD23Qn7xVnSCbG
 Zgrv14GGvzv9peVnKI40XOGeIbEvbLTvgwmkM35lML3BLb3V2UvU/m4II
 JEHqvJOcdrYQzdufOxtsy/NV3N5XX9vRAF7J0JRIjJHbVRpFBerfB0IFR
 gGzf1K6Nyt3+qVdZtuvX+4RmVpXm6GSyj+5y8f7qi/tJ7SS0WMH/fbRcm
 n2RwQu8oZCloCswmyuVTjdZiIihXBsp10Cw/pk4Y7ssfL8RQ0n1qPOXld g==;
X-CSE-ConnectionGUID: trrJWIFSSpSP52/N9ClCFw==
X-CSE-MsgGUID: VL8mWEh4S5+dvfX0LEJthQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39282507"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39282507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:07:54 -0800
X-CSE-ConnectionGUID: 0+StE3DyRii3rwgJFStHWA==
X-CSE-MsgGUID: kiYhO3DKRpWFJKApA8obhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136250852"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:07:54 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 jonathan.cavitt@intel.com
Subject: [PATCH 2/3] drm/xe: Clear scratch page on vm_bind
Date: Wed, 12 Feb 2025 21:23:30 -0500
Message-Id: <20250213022331.265424-2-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20250213022331.265424-1-oak.zeng@intel.com>
References: <20250213022331.265424-1-oak.zeng@intel.com>
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

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c       | 53 ++++++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_pt_types.h |  2 ++
 drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++---
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 4 files changed, 70 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 1ddcc7e79a93..319769056893 100644
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
@@ -497,16 +503,19 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
-		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
-						 xe_res_dma(curs) + xe_walk->dma_offset,
-						 xe_walk->vma, pat_index, level);
+		pte = vm->pt_ops->pte_encode_vma(is_null || xe_walk->clear_pt ?
+				0 : xe_res_dma(curs) + xe_walk->dma_offset,
+				xe_walk->vma, pat_index, level);
 		pte |= xe_walk->default_pte;
 
+		if (xe_walk->clear_pt)
+			pte = 0;
+
 		/*
 		 * Set the XE_PTE_PS64 hint if possible, otherwise if
 		 * this device *requires* 64K PTE size for VRAM, fail.
 		 */
-		if (level == 0 && !xe_parent->is_compact) {
+		if (level == 0 && !xe_parent->is_compact && !xe_walk->clear_pt) {
 			if (xe_pt_is_pte_ps64K(addr, next, xe_walk)) {
 				xe_walk->vma->gpuva.flags |= XE_VMA_PTE_64K;
 				pte |= XE_PTE_PS64;
@@ -519,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		if (unlikely(ret))
 			return ret;
 
-		if (!is_null)
+		if (!is_null && !xe_walk->clear_pt)
 			xe_res_next(curs, next - addr);
 		xe_walk->va_curs_start = next;
 		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
@@ -589,6 +598,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  * @vma: The vma indicating the address range.
  * @entries: Storage for the update entries used for connecting the tree to
  * the main tree at commit time.
+ * @clear_pt: Clear the page table entries.
  * @num_entries: On output contains the number of @entries used.
  *
  * This function builds a disconnected page-table tree for a given address
@@ -602,7 +612,8 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  */
 static int
 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
-		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
+		 struct xe_vm_pgtable_update *entries,
+		 bool clear_pt, u32 *num_entries)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *bo = xe_vma_bo(vma);
@@ -622,10 +633,19 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.vma = vma,
 		.wupd.entries = entries,
 		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAG_64K) && is_devmem,
+		.clear_pt = clear_pt,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
+	if (clear_pt) {
+		ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
+				       xe_vma_end(vma), &xe_walk.base);
+
+		*num_entries = xe_walk.wupd.num_used_entries;
+		return ret;
+	}
+
 	/**
 	 * Default atomic expectations for different allocation scenarios are as follows:
 	 *
@@ -981,12 +1001,14 @@ static void xe_pt_free_bind(struct xe_vm_pgtable_update *entries,
 
 static int
 xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
-		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
+		   struct xe_vm_pgtable_update *entries,
+		   bool invalidate_on_bind, u32 *num_entries)
 {
 	int err;
 
 	*num_entries = 0;
-	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
+	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
+			       num_entries);
 	if (!err)
 		xe_tile_assert(tile, *num_entries);
 
@@ -1661,6 +1683,7 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
 		return err;
 
 	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
+				 pt_update_ops->invalidate_on_bind,
 				 &pt_op->num_entries);
 	if (!err) {
 		xe_tile_assert(tile, pt_op->num_entries <=
@@ -1681,11 +1704,11 @@ static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
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
@@ -1759,9 +1782,13 @@ static int op_prepare(struct xe_vm *vm,
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
-		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
+		if (!op->map.immediate && xe_vm_in_fault_mode(vm) &&
+		    !op->map.invalidate_on_bind)
 			break;
 
+		if (op->map.invalidate_on_bind)
+			pt_update_ops->invalidate_on_bind = true;
+
 		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
 		pt_update_ops->wait_vm_kernel = true;
 		break;
@@ -1871,6 +1898,8 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	}
 	vma->tile_present |= BIT(tile->id);
 	vma->tile_staged &= ~BIT(tile->id);
+	if (pt_update_ops->invalidate_on_bind)
+		vma->tile_invalidated |= BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
 		lockdep_assert_held_read(&vm->userptr.notifier_lock);
 		to_userptr_vma(vma)->userptr.initial_bind = true;
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index 384cc04de719..3d0aa2a5102e 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
 	bool needs_userptr_lock;
 	/** @needs_invalidation: Needs invalidation */
 	bool needs_invalidation;
+	/** @invalidate_on_bind: Invalidate the range before bind */
+	bool invalidate_on_bind;
 	/**
 	 * @wait_vm_bookkeep: PT operations need to wait until VM is idle
 	 * (bookkeep dma-resv slots are idle) and stage all future VM activity
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index d664f2e418b2..813d893d9b63 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 }
 #endif
 
+static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
+{
+	if (!xe_vm_in_fault_mode(vm))
+		return false;
+
+	if (!NEEDS_SCRATCH(vm->xe))
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
@@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			op->map.is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
 			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
 			op->map.pat_index = pat_index;
+			op->map.invalidate_on_bind =
+				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			op->prefetch.region = prefetch_region;
 		}
@@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
 				return PTR_ERR(vma);
 
 			op->map.vma = vma;
-			if (op->map.immediate || !xe_vm_in_fault_mode(vm))
+			if (op->map.immediate || !xe_vm_in_fault_mode(vm) ||
+			    op->map.invalidate_on_bind)
 				xe_vma_ops_incr_pt_update_ops(vops,
 							      op->tile_mask);
 			break;
@@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 
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

