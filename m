Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807F3C7EE2E
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 05:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0A010E576;
	Thu,  8 Jun 2023 05:03:25 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035010E576
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 05:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686200604; x=1717736604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qkV2YS7vUAjmWVYjGjlf2WzaKaQkoYkMlmCRTWtunUg=;
 b=FQPTnys7WQ5GTXwGJ3DqMNQSV+FN0Ue823lExvJ5czi3UV8eTV2wAYDn
 bTpBgbDxYbJ3WwVHkuvCzvAPOzCcsU77uPLVsTUyu7YrWqnx5cRH41haG
 IenfgUqI8S+7uo03GqKX0pqo7DumjOPZUcyZsu7VrRrVzt5qEXbZ1HdOc
 4EHcgS6wLcMuIWOFcPEEyGLQX8+BKZREpBCh2T5CV1YEb2RBdVEDwkR6V
 J66GFyqeoc8CowM/vZmPx4hd9hxUX84IABjK/LAUx/hLUoR6Iorw+0aYQ
 EJvrOt9XOsFqz4z7HObUPwtJKJqY1qc+fezePWEgbbH1gzg0hTD0Wt7LB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="354692404"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="354692404"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="822450168"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="822450168"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 22:03:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  7 Jun 2023 22:03:33 -0700
Message-Id: <20230608050333.37581-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608050333.37581-1-matthew.brost@intel.com>
References: <20230608050333.37581-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: NULL binding implementation
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
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add uAPI and implementation for NULL bindings. A NULL binding is defined
as writes dropped and read zero. A single bit in the uAPI has been added
which results in a single bit in the PTEs being set.

NULL bindings are indended to be used to implement VK sparse bindings,
in particular residencyNonResidentStrict property.

Suggested-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_exec.c         |  2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
 drivers/gpu/drm/xe/xe_pt.c           | 71 +++++++++++++++------
 drivers/gpu/drm/xe/xe_vm.c           | 95 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h           | 12 +++-
 drivers/gpu/drm/xe/xe_vm_types.h     |  1 +
 include/uapi/drm/xe_drm.h            |  8 +++
 8 files changed, 138 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index dd3d448fee0b..3a148cc6e811 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -61,6 +61,7 @@
 #define XE_PPGTT_PTE_LM			BIT_ULL(11)
 #define XE_PDE_64K			BIT_ULL(6)
 #define XE_PTE_PS64			BIT_ULL(8)
+#define XE_PTE_NULL			BIT_ULL(9)
 
 #define XE_PAGE_PRESENT			BIT_ULL(0)
 #define XE_PAGE_RW			BIT_ULL(1)
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index e44076ee2e11..4f7694a29348 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -120,6 +120,8 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 	 * to a location where the GPU can access it).
 	 */
 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
+		XE_WARN_ON(xe_vma_is_null(vma));
+
 		if (xe_vma_is_userptr(vma))
 			continue;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 73db7f7c0381..6faebd02f3fb 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -533,8 +533,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 	trace_xe_vma_acc(vma);
 
-	/* Userptr can't be migrated, nothing to do */
-	if (xe_vma_is_userptr(vma))
+	/* Userptr or null can't be migrated, nothing to do */
+	if (xe_vma_has_no_bo(vma))
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 39ec94549439..265ee45bee5c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -81,7 +81,9 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
 static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 			   size_t page_size, bool *is_vram)
 {
-	if (xe_vma_is_userptr(vma)) {
+	if (xe_vma_is_null(vma)) {
+		return 0;
+	} else if (xe_vma_is_userptr(vma)) {
 		struct xe_res_cursor cur;
 		u64 page;
 
@@ -559,6 +561,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
 		return false;
 
+	/* null VMA's do not have dma adresses */
+	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
+		return true;
+
 	/* Is the DMA address huge PTE size aligned? */
 	size = next - addr;
 	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
@@ -575,6 +581,10 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 {
 	struct xe_res_cursor curs = *xe_walk->curs;
 
+	/* null VMA's do not have dma adresses */
+	if (xe_walk->pte_flags & XE_PTE_FLAG_NULL)
+		return true;
+
 	if (!IS_ALIGNED(addr, SZ_64K))
 		return false;
 
@@ -631,12 +641,29 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	/* Is this a leaf entry ?*/
 	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
+		u64 pte = 0;
+		bool is_null = xe_walk->pte_flags & XE_PTE_FLAG_NULL;
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
-		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
-					xe_walk->cache, xe_walk->pte_flags,
-					level);
+		if (is_null) {
+			pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
+			if (xe_walk->pte_flags & XE_PTE_FLAG_READ_ONLY)
+				pte &= ~XE_PAGE_RW;
+
+			if (level == 1)
+				pte |= XE_PDE_PS_2M;
+			else if (level == 2)
+				pte |= XE_PDPE_PS_1G;
+
+			pte |= XE_PTE_NULL;
+		} else {
+			pte = __gen8_pte_encode(xe_res_dma(curs) +
+						xe_walk->dma_offset,
+						xe_walk->cache,
+						xe_walk->pte_flags,
+						level);
+		}
 		pte |= xe_walk->default_pte;
 
 		/*
@@ -654,7 +681,8 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		if (unlikely(ret))
 			return ret;
 
-		xe_res_next(curs, next - addr);
+		if (!is_null)
+			xe_res_next(curs, next - addr);
 		xe_walk->va_curs_start = next;
 		*action = ACTION_CONTINUE;
 
@@ -761,24 +789,29 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		xe_walk.dma_offset = vram_region_gpu_offset(bo->ttm.resource);
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
-		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
+		if (!xe_vma_has_no_bo(vma) && bo->flags & XE_BO_SCANOUT_BIT)
 			xe_walk.cache = XE_CACHE_WT;
 		else
 			xe_walk.cache = XE_CACHE_WB;
 	}
-	if (!xe_vma_is_userptr(vma) && xe_bo_is_stolen(bo))
+	if (!xe_vma_has_no_bo(vma) && xe_bo_is_stolen(bo))
 		xe_walk.dma_offset = xe_ttm_stolen_gpu_offset(xe_bo_device(bo));
 
 	xe_bo_assert_held(bo);
-	if (xe_vma_is_userptr(vma))
-		xe_res_first_sg(vma->userptr.sg, 0, vma->end - vma->start + 1,
-				&curs);
-	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
-		xe_res_first(bo->ttm.resource, vma->bo_offset,
-			     vma->end - vma->start + 1, &curs);
-	else
-		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
-				vma->end - vma->start + 1, &curs);
+
+	if (!xe_vma_is_null(vma)) {
+		if (xe_vma_is_userptr(vma))
+			xe_res_first_sg(vma->userptr.sg, 0,
+					vma->end - vma->start + 1, &curs);
+		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
+			xe_res_first(bo->ttm.resource, vma->bo_offset,
+				     vma->end - vma->start + 1, &curs);
+		else
+			xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
+					vma->end - vma->start + 1, &curs);
+	} else {
+		curs.size = vma->end - vma->start + 1;
+	}
 
 	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
 				&xe_walk.base);
@@ -967,7 +1000,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 
 	if (xe_vma_is_userptr(vma))
 		lockdep_assert_held_read(&vm->userptr.notifier_lock);
-	else
+	else if (!xe_vma_is_null(vma))
 		dma_resv_assert_held(vma->bo->ttm.base.resv);
 
 	dma_resv_assert_held(&vm->resv);
@@ -1330,7 +1363,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
 
-		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
+		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
 			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_bind(vma, entries, num_entries, rebind,
@@ -1647,7 +1680,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/* This fence will be installed by caller when doing eviction */
-		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
+		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
 			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_unbind(vma, entries, num_entries,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 94fc9c330235..f7629db275f9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -590,7 +590,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		goto out_unlock;
 
 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
-		if (xe_vma_is_userptr(vma) || vma->destroyed)
+		if (xe_vma_has_no_bo(vma) || vma->destroyed)
 			continue;
 
 		err = xe_bo_validate(vma->bo, vm, false);
@@ -843,6 +843,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
 				    bool read_only,
+				    bool is_null,
 				    u64 tile_mask)
 {
 	struct xe_vma *vma;
@@ -868,8 +869,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->vm = vm;
 	vma->start = start;
 	vma->end = end;
+	vma->pte_flags = 0;
 	if (read_only)
-		vma->pte_flags = XE_PTE_FLAG_READ_ONLY;
+		vma->pte_flags |= XE_PTE_FLAG_READ_ONLY;
+	if (is_null)
+		vma->pte_flags |= XE_PTE_FLAG_NULL;
 
 	if (tile_mask) {
 		vma->tile_mask = tile_mask;
@@ -886,23 +890,26 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->bo_offset = bo_offset_or_userptr;
 		vma->bo = xe_bo_get(bo);
 		list_add_tail(&vma->bo_link, &bo->vmas);
-	} else /* userptr */ {
-		u64 size = end - start + 1;
-		int err;
+	} else /* userptr or null */ {
+		if (!is_null) {
+			u64 size = end - start + 1;
+			int err;
 
-		vma->userptr.ptr = bo_offset_or_userptr;
+			vma->userptr.ptr = bo_offset_or_userptr;
 
-		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
-						   current->mm,
-						   vma->userptr.ptr, size,
-						   &vma_userptr_notifier_ops);
-		if (err) {
-			kfree(vma);
-			vma = ERR_PTR(err);
-			return vma;
+			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
+							   current->mm,
+							   vma->userptr.ptr, size,
+							   &vma_userptr_notifier_ops);
+			if (err) {
+				kfree(vma);
+				vma = ERR_PTR(err);
+				return vma;
+			}
+
+			vma->userptr.notifier_seq = LONG_MAX;
 		}
 
-		vma->userptr.notifier_seq = LONG_MAX;
 		xe_vm_get(vm);
 	}
 
@@ -942,6 +949,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		 */
 		mmu_interval_notifier_remove(&vma->userptr.notifier);
 		xe_vm_put(vm);
+	} else if (xe_vma_is_null(vma)) {
+		xe_vm_put(vm);
 	} else {
 		xe_bo_put(vma->bo);
 	}
@@ -1024,7 +1033,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		list_del_init(&vma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 		list_del(&vma->userptr_link);
-	} else {
+	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(vma->bo);
 		list_del(&vma->bo_link);
 
@@ -1391,7 +1400,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	while (vm->vmas.rb_node) {
 		struct xe_vma *vma = to_xe_vma(vm->vmas.rb_node);
 
-		if (xe_vma_is_userptr(vma)) {
+		if (xe_vma_has_no_bo(vma)) {
 			down_read(&vm->userptr.notifier_lock);
 			vma->destroyed = true;
 			up_read(&vm->userptr.notifier_lock);
@@ -1400,7 +1409,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		rb_erase(&vma->vm_node, &vm->vmas);
 
 		/* easy case, remove from VMA? */
-		if (xe_vma_is_userptr(vma) || vma->bo->vm) {
+		if (xe_vma_has_no_bo(vma) || vma->bo->vm) {
 			xe_vma_destroy(vma, NULL);
 			continue;
 		}
@@ -2034,7 +2043,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
 
-	if (!xe_vma_is_userptr(vma)) {
+	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
 		if (err)
 			return err;
@@ -2643,6 +2652,8 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					  lookup->start - 1,
 					  (first->pte_flags &
 					   XE_PTE_FLAG_READ_ONLY),
+					  (first->pte_flags &
+					   XE_PTE_FLAG_NULL),
 					  first->tile_mask);
 		if (first->bo)
 			xe_bo_unlock(first->bo, &ww);
@@ -2675,6 +2686,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					 last->end,
 					 (last->pte_flags &
 					  XE_PTE_FLAG_READ_ONLY),
+					 (last->pte_flags & XE_PTE_FLAG_NULL),
 					 last->tile_mask);
 		if (last->bo)
 			xe_bo_unlock(last->bo, &ww);
@@ -2742,7 +2754,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
 		      *next;
 	struct rb_node *node;
 
-	if (!xe_vma_is_userptr(vma)) {
+	if (!xe_vma_has_no_bo(vma)) {
 		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
 			return ERR_PTR(-EINVAL);
 	}
@@ -2751,7 +2763,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
 	while ((node = rb_next(node))) {
 		if (!xe_vma_cmp_vma_cb(lookup, node)) {
 			__vma = to_xe_vma(node);
-			if (!xe_vma_is_userptr(__vma)) {
+			if (!xe_vma_has_no_bo(__vma)) {
 				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
 					goto flush_list;
 			}
@@ -2765,7 +2777,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
 	while ((node = rb_prev(node))) {
 		if (!xe_vma_cmp_vma_cb(lookup, node)) {
 			__vma = to_xe_vma(node);
-			if (!xe_vma_is_userptr(__vma)) {
+			if (!xe_vma_has_no_bo(__vma)) {
 				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
 					goto flush_list;
 			}
@@ -2824,21 +2836,23 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 
 	switch (VM_BIND_OP(op)) {
 	case XE_VM_BIND_OP_MAP:
-		XE_BUG_ON(!bo);
-
-		err = xe_bo_lock(bo, &ww, 0, true);
-		if (err)
-			return ERR_PTR(err);
+		if (bo) {
+			err = xe_bo_lock(bo, &ww, 0, true);
+			if (err)
+				return ERR_PTR(err);
+		}
 		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
 				    addr + range - 1,
 				    op & XE_VM_BIND_FLAG_READONLY,
+				    op & XE_VM_BIND_FLAG_NULL,
 				    tile_mask);
-		xe_bo_unlock(bo, &ww);
+		if (bo)
+			xe_bo_unlock(bo, &ww);
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
 
 		xe_vm_insert_vma(vm, vma);
-		if (!bo->vm) {
+		if (bo && !bo->vm) {
 			vm_insert_extobj(vm, vma);
 			err = add_preempt_fences(vm, bo);
 			if (err) {
@@ -2872,6 +2886,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 		vma = xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
 				    addr + range - 1,
 				    op & XE_VM_BIND_FLAG_READONLY,
+				    op & XE_VM_BIND_FLAG_NULL,
 				    tile_mask);
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
@@ -2897,11 +2912,12 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 #ifdef TEST_VM_ASYNC_OPS_ERROR
 #define SUPPORTED_FLAGS	\
 	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
-	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
+	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
+	 XE_VM_BIND_FLAG_NULL | 0xffff)
 #else
 #define SUPPORTED_FLAGS	\
 	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
-	 XE_VM_BIND_FLAG_IMMEDIATE | 0xffff)
+	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
 #endif
 #define XE_64K_PAGE_MASK 0xffffull
 
@@ -2949,6 +2965,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
+		bool is_null = op &  XE_VM_BIND_FLAG_NULL;
 
 		if (XE_IOCTL_ERR(xe, (*bind_ops)[i].pad) ||
 		    XE_IOCTL_ERR(xe, (*bind_ops)[i].reserved[0] ||
@@ -2982,8 +2999,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
+		    XE_IOCTL_ERR(xe, obj && is_null) ||
+		    XE_IOCTL_ERR(xe, obj_offset && is_null) ||
+		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
+				 is_null) ||
 		    XE_IOCTL_ERR(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP) ||
+				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP &&
+				 !is_null) ||
 		    XE_IOCTL_ERR(xe, !obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_ERR(xe, addr &&
@@ -3389,6 +3411,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	int ret;
 
 	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
+	XE_WARN_ON(xe_vma_is_null(vma));
 	trace_xe_vma_usm_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
@@ -3451,8 +3474,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
 		struct xe_vma *vma = to_xe_vma(node);
 		bool is_userptr = xe_vma_is_userptr(vma);
+		bool is_null = xe_vma_is_null(vma);
 
-		if (is_userptr) {
+		if (is_null) {
+			addr = 0;
+		} else if (is_userptr) {
 			struct xe_res_cursor cur;
 
 			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
@@ -3463,7 +3489,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		}
 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
 			   vma->start, vma->end, vma->end - vma->start + 1ull,
-			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
+			   addr, is_null ? "NULL" : is_userptr ? "USR" :
+			   is_vram ? "VRAM" : "SYS");
 	}
 	up_read(&vm->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 372f26153209..38731e200813 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -115,11 +115,21 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 	}
 }
 
-static inline bool xe_vma_is_userptr(struct xe_vma *vma)
+static inline bool xe_vma_is_null(struct xe_vma *vma)
+{
+	return vma->pte_flags & XE_PTE_FLAG_NULL;
+}
+
+static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 {
 	return !vma->bo;
 }
 
+static inline bool xe_vma_is_userptr(struct xe_vma *vma)
+{
+	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
+}
+
 int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 6daddd29d416..f775bafe4619 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -31,6 +31,7 @@ struct xe_vma {
 	u64 end;
 	/** @pte_flags: pte flags for this VMA */
 #define XE_PTE_FLAG_READ_ONLY		BIT(0)
+#define XE_PTE_FLAG_NULL		BIT(1)
 	u32 pte_flags;
 
 	/** @bo: BO if not a userptr, must be NULL is userptr */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 0ebc50beb5e5..39a1ce89732f 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -456,6 +456,14 @@ struct drm_xe_vm_bind_op {
 	 * than differing the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+	/*
+	 * When the NULL flag is set, the page tables are setup with a special
+	 * bit which indicates writes are dropped and all reads return zero.  In
+	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
+	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
+	 * intended to implement VK sparse bindings.
+	 */
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.34.1

