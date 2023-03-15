Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28451C61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 23:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B09C10EA1C;
	Wed, 15 Mar 2023 23:19:26 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E0910E013
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 23:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678922362; x=1710458362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ZQiZyba8ISzbji5AVMai+pG7PSPjMWpqP2sTP11iCQ=;
 b=UOllaZW0M+sLHD7mVAyiZKxyPfi5Lm2Yowdv/zAk8ltXvMlt3eObWMRd
 VEH3prWy0K6fndgVjwZBJGolMTSQivbFx+y+tJVqhDiKXetose5rk/0gP
 v2MV5uegtxLYlN/TTr3kMJjkU0EGyLBpqOKe9tJ7t3XpNecAmSLFL51wd
 PlMPMfhEuIyh5kh43npWCebufxWFgb5wMFip0nUgL45Aklt2TSvSEF6lu
 REtQm4cqGCTOL71meWxr+pXHBcYuHi8uq+LBxG9O0pHG2llpRMTn6HZD2
 +YfsNuXBRK6Jhh4pnt/EqHMJc9ZqPPKAQaIK77CW6IEQbjFX6kc3tRkv8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="317491020"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="317491020"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="790018457"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="790018457"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 16:19:19 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 15 Mar 2023 16:19:19 -0700
Message-Id: <20230315231920.4095284-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230315231920.4095284-1-matthew.brost@intel.com>
References: <20230315231920.4095284-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/6] drm/xe: NULL binding implementation
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
Cc: paulo.r.zanoni@intel.com, lionel.g.landwerlin@intel.com, dakr@redhat.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Add uAPI and implementation for NULL bindings. A NULL binding is defined
as writes dropped and read zero. A single bit in the uAPI has been added
which results in a single bit in the PTEs being set.

NULL bindings are indended to be used to implement VK sparse bindings.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.h           |  1 +
 drivers/gpu/drm/xe/xe_exec.c         |  2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  4 +-
 drivers/gpu/drm/xe/xe_pt.c           | 77 ++++++++++++++++-------
 drivers/gpu/drm/xe/xe_vm.c           | 92 ++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h           | 10 +++
 drivers/gpu/drm/xe/xe_vm_madvise.c   |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |  3 +
 include/uapi/drm/xe_drm.h            |  8 +++
 9 files changed, 144 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index f841e74cd417..f4303810f213 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -54,6 +54,7 @@
 #define GEN8_PDE_IPS_64K		BIT_ULL(11)
 
 #define GEN12_GGTT_PTE_LM		BIT_ULL(1)
+#define GEN12_PTE_NULL			BIT_ULL(9)
 #define GEN12_USM_PPGTT_PTE_AE		BIT_ULL(10)
 #define GEN12_PPGTT_PTE_LM		BIT_ULL(11)
 #define GEN12_PDE_64K			BIT_ULL(6)
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index b798a11f168b..2b3a15623013 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -115,6 +115,8 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 	 * to a location where the GPU can access it).
 	 */
 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
+		XE_BUG_ON(xe_vma_is_null(vma));
+
 		if (xe_vma_is_userptr(vma))
 			continue;
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index f7a066090a13..cfffe3398fe4 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -526,8 +526,8 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 	trace_xe_vma_acc(vma);
 
-	/* Userptr can't be migrated, nothing to do */
-	if (xe_vma_is_userptr(vma))
+	/* Userptr or null can't be migrated, nothing to do */
+	if (xe_vma_has_no_bo(vma))
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d4f58ec8058e..b6e2fdb5f06c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -82,7 +82,9 @@ u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
 static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 			   size_t page_size, bool *is_vram)
 {
-	if (xe_vma_is_userptr(vma)) {
+	if (xe_vma_is_null(vma)) {
+		return 0;
+	} else if (xe_vma_is_userptr(vma)) {
 		struct xe_res_cursor cur;
 		u64 page;
 
@@ -563,6 +565,10 @@ static bool xe_pt_hugepte_possible(u64 addr, u64 next, unsigned int level,
 	if (next - xe_walk->va_curs_start > xe_walk->curs->size)
 		return false;
 
+	/* null VMA's do not have dma adresses */
+	if (xe_walk->pte_flags & GEN12_PTE_NULL)
+		return true;
+
 	/* Is the DMA address huge PTE size aligned? */
 	size = next - addr;
 	dma = addr - xe_walk->va_curs_start + xe_res_dma(xe_walk->curs);
@@ -585,6 +591,10 @@ xe_pt_scan_64K(u64 addr, u64 next, struct xe_pt_stage_bind_walk *xe_walk)
 	if (next > xe_walk->l0_end_addr)
 		return false;
 
+	/* null VMA's do not have dma adresses */
+	if (xe_walk->pte_flags & GEN12_PTE_NULL)
+		return true;
+
 	xe_res_next(&curs, addr - xe_walk->va_curs_start);
 	for (; addr < next; addr += SZ_64K) {
 		if (!IS_ALIGNED(xe_res_dma(&curs), SZ_64K) || curs.size < SZ_64K)
@@ -630,17 +640,34 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 	struct xe_pt *xe_child;
 	bool covers;
 	int ret = 0;
-	u64 pte;
+	u64 pte = 0;
 
 	/* Is this a leaf entry ?*/
 	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk->curs;
+		bool null = xe_walk->pte_flags & GEN12_PTE_NULL;
 
 		XE_WARN_ON(xe_walk->va_curs_start != addr);
 
-		pte = __gen8_pte_encode(xe_res_dma(curs) + xe_walk->dma_offset,
-					xe_walk->cache, xe_walk->pte_flags,
-					level);
+		if (null) {
+			pte |= GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
+
+			if (unlikely(xe_walk->pte_flags & PTE_READ_ONLY))
+				pte &= ~GEN8_PAGE_RW;
+
+			if (level == 1)
+				pte |= GEN8_PDE_PS_2M;
+			else if (level == 2)
+				pte |= GEN8_PDPE_PS_1G;
+
+			pte |= GEN12_PTE_NULL;
+		} else {
+			pte = __gen8_pte_encode(xe_res_dma(curs) +
+						xe_walk->dma_offset,
+						xe_walk->cache,
+						xe_walk->pte_flags,
+						level);
+		}
 		pte |= xe_walk->default_pte;
 
 		/*
@@ -658,7 +685,8 @@ xe_pt_stage_bind_entry(struct drm_pt *parent, pgoff_t offset,
 		if (unlikely(ret))
 			return ret;
 
-		xe_res_next(curs, next - addr);
+		if (!null)
+			xe_res_next(curs, next - addr);
 		xe_walk->va_curs_start = next;
 		*action = ACTION_CONTINUE;
 
@@ -751,7 +779,8 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 		.gt = gt,
 		.curs = &curs,
 		.va_curs_start = xe_vma_start(vma),
-		.pte_flags = xe_vma_read_only(vma) ? PTE_READ_ONLY : 0,
+		.pte_flags = xe_vma_read_only(vma) ? PTE_READ_ONLY : 0 |
+			xe_vma_is_null(vma) ? GEN12_PTE_NULL : 0,
 		.wupd.entries = entries,
 		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) && is_vram,
 	};
@@ -766,23 +795,28 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 			gt_to_xe(gt)->mem.vram.io_start;
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
-		xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma), &curs);
-	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
-		xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
-			     xe_vma_size(vma), &curs);
-	else
-		xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
-				xe_vma_size(vma), &curs);
+	if (!xe_vma_is_null(vma)) {
+		if (xe_vma_is_userptr(vma))
+			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
+					&curs);
+		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
+			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
+				     xe_vma_size(vma), &curs);
+		else
+			xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
+					xe_vma_size(vma), &curs);
+	} else {
+		curs.size = xe_vma_size(vma);
+	}
 
 	ret = drm_pt_walk_range(&pt->drm, pt->level, xe_vma_start(vma),
 				xe_vma_end(vma), &xe_walk.drm);
@@ -976,7 +1010,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 
 	if (xe_vma_is_userptr(vma))
 		lockdep_assert_held_read(&vm->userptr.notifier_lock);
-	else
+	else if (!xe_vma_is_null(vma))
 		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	dma_resv_assert_held(&vm->resv);
@@ -1280,7 +1314,8 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
 	struct xe_pt_migrate_pt_update bind_pt_update = {
 		.base = {
-			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops : &bind_ops,
+			.ops = xe_vma_is_userptr(vma) ? &userptr_bind_ops :
+				&bind_ops,
 			.vma = vma,
 		},
 		.bind = true,
@@ -1345,7 +1380,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
 
-		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
+		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_bind(vma, entries, num_entries, rebind,
@@ -1664,7 +1699,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/* This fence will be installed by caller when doing eviction */
-		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
+		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
 			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_unbind(vma, entries, num_entries,
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 618de237b966..49bd9729c2c8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -60,6 +60,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 
 	lockdep_assert_held(&vm->lock);
 	XE_BUG_ON(!xe_vma_is_userptr(vma));
+	XE_BUG_ON(xe_vma_is_null(vma));
 retry:
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
 		return 0;
@@ -563,7 +564,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		goto out_unlock;
 
 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
-		if (xe_vma_is_userptr(vma) ||
+		if (xe_vma_has_no_bo(vma) ||
 		    vma->gpuva.flags & XE_VMA_DESTROYED)
 			continue;
 
@@ -795,7 +796,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
-				    bool read_only,
+				    bool read_only, bool null,
 				    u64 gt_mask)
 {
 	struct xe_vma *vma;
@@ -825,6 +826,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	vma->gpuva.va.range = end - start + 1;
 	if (read_only)
 		vma->gpuva.flags |= XE_VMA_READ_ONLY;
+	if (null)
+		vma->gpuva.flags |= XE_VMA_NULL;
 
 	if (gt_mask) {
 		vma->gt_mask = gt_mask;
@@ -844,23 +847,26 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		vma->gpuva.gem.obj = &bo->ttm.base;
 		vma->gpuva.gem.offset = bo_offset_or_userptr;
 		drm_gpuva_link(&vma->gpuva);
-	} else /* userptr */ {
-		u64 size = end - start + 1;
-		int err;
-
-		vma->gpuva.gem.offset = bo_offset_or_userptr;
+	} else /* userptr or null */ {
+		if (!null) {
+			u64 size = end - start + 1;
+			int err;
+
+			vma->gpuva.gem.offset = bo_offset_or_userptr;
+			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
+							   current->mm,
+							   xe_vma_userptr(vma),
+							   size,
+							   &vma_userptr_notifier_ops);
+			if (err) {
+				kfree(vma);
+				vma = ERR_PTR(err);
+				return vma;
+			}
 
-		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
-						   current->mm,
-						   xe_vma_userptr(vma), size,
-						   &vma_userptr_notifier_ops);
-		if (err) {
-			kfree(vma);
-			vma = ERR_PTR(err);
-			return vma;
+			vma->userptr.notifier_seq = LONG_MAX;
 		}
 
-		vma->userptr.notifier_seq = LONG_MAX;
 		xe_vm_get(vm);
 	}
 
@@ -898,6 +904,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		 */
 		mmu_interval_notifier_remove(&vma->userptr.notifier);
 		xe_vm_put(vm);
+	} else if (xe_vma_is_null(vma)) {
+		xe_vm_put(vm);
 	} else {
 		xe_bo_put(xe_vma_bo(vma));
 	}
@@ -936,7 +944,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		list_del_init(&vma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 		list_del(&vma->userptr_link);
-	} else {
+	} else if (!xe_vma_is_null(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 		drm_gpuva_unlink(&vma->gpuva);
 		if (!xe_vma_bo(vma)->vm)
@@ -1286,7 +1294,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	drm_gpuva_iter_for_each(it) {
 		vma = gpuva_to_vma(it.va);
 
-		if (xe_vma_is_userptr(vma)) {
+		if (xe_vma_has_no_bo(vma)) {
 			down_read(&vm->userptr.notifier_lock);
 			vma->gpuva.flags |= XE_VMA_DESTROYED;
 			up_read(&vm->userptr.notifier_lock);
@@ -1296,7 +1304,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		drm_gpuva_iter_remove(&it);
 
 		/* easy case, remove from VMA? */
-		if (xe_vma_is_userptr(vma) || xe_vma_bo(vma)->vm) {
+		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
 			xe_vma_destroy(vma, NULL);
 			continue;
 		}
@@ -1946,7 +1954,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
 
-	if (!xe_vma_is_userptr(vma)) {
+	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
 		if (err)
 			return err;
@@ -2152,6 +2160,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 				operation & XE_VM_BIND_FLAG_IMMEDIATE;
 			op->map.read_only =
 				operation & XE_VM_BIND_FLAG_READONLY;
+			op->map.null = operation & XE_VM_BIND_FLAG_NULL;
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP:
@@ -2208,7 +2217,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 }
 
 static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
-			      u64 gt_mask, bool read_only)
+			      u64 gt_mask, bool read_only, bool null)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
@@ -2224,7 +2233,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	}
 	vma = xe_vma_create(vm, bo, op->gem.offset,
 			    op->va.addr, op->va.addr +
-			    op->va.range - 1, read_only,
+			    op->va.range - 1, read_only, null,
 			    gt_mask);
 	if (bo)
 		xe_bo_unlock(bo, &ww);
@@ -2235,7 +2244,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			xe_vma_destroy(vma, NULL);
 			return ERR_PTR(err);
 		}
-	} else if(!bo->vm) {
+	} else if(!xe_vma_has_no_bo(vma) && !bo->vm) {
 		vm_insert_extobj(vm, vma);
 		err = add_preempt_fences(vm, bo);
 		if (err) {
@@ -2312,7 +2321,8 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 				struct xe_vma *vma;
 
 				vma = new_vma(vm, &op->base.map,
-					      op->gt_mask, op->map.read_only);
+					      op->gt_mask, op->map.read_only,
+					      op->map.null );
 				if (IS_ERR(vma)) {
 					err = PTR_ERR(vma);
 					goto free_fence;
@@ -2327,9 +2337,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 					bool read_only =
 						op->base.remap.unmap->va->flags &
 						XE_VMA_READ_ONLY;
+					bool null =
+						op->base.remap.unmap->va->flags &
+						XE_VMA_NULL;
 
 					vma = new_vma(vm, op->base.remap.prev,
-						      op->gt_mask, read_only);
+						      op->gt_mask, read_only,
+						      null);
 					if (IS_ERR(vma)) {
 						err = PTR_ERR(vma);
 						goto free_fence;
@@ -2344,8 +2358,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 						op->base.remap.unmap->va->flags &
 						XE_VMA_READ_ONLY;
 
+					bool null =
+						op->base.remap.unmap->va->flags &
+						XE_VMA_NULL;
+
 					vma = new_vma(vm, op->base.remap.next,
-						      op->gt_mask, read_only);
+						      op->gt_mask, read_only,
+						      null);
 					if (IS_ERR(vma)) {
 						err = PTR_ERR(vma);
 						goto free_fence;
@@ -2792,11 +2811,12 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
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
 
@@ -2842,6 +2862,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		u32 obj = (*bind_ops)[i].obj;
 		u64 obj_offset = (*bind_ops)[i].obj_offset;
 		u32 region = (*bind_ops)[i].region;
+		bool null = op &  XE_VM_BIND_FLAG_NULL;
 
 		if (i == 0) {
 			*async = !!(op & XE_VM_BIND_FLAG_ASYNC);
@@ -2868,8 +2889,12 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
 		if (XE_IOCTL_ERR(xe, VM_BIND_OP(op) >
 				 XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_ERR(xe, op & ~SUPPORTED_FLAGS) ||
+		    XE_IOCTL_ERR(xe, obj && null) ||
+		    XE_IOCTL_ERR(xe, obj_offset && null) ||
+		    XE_IOCTL_ERR(xe, VM_BIND_OP(op) != XE_VM_BIND_OP_MAP &&
+				 null) ||
 		    XE_IOCTL_ERR(xe, !obj &&
-				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP) ||
+				 VM_BIND_OP(op) == XE_VM_BIND_OP_MAP && !null) ||
 		    XE_IOCTL_ERR(xe, !obj &&
 				 VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL) ||
 		    XE_IOCTL_ERR(xe, addr &&
@@ -3188,6 +3213,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	int ret;
 
 	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
+	XE_BUG_ON(xe_vma_is_null(vma));
 	trace_xe_vma_usm_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
@@ -3246,8 +3272,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 	drm_gpuva_for_each_va(gpuva, &vm->mgr) {
 		struct xe_vma *vma = gpuva_to_vma(vma);
 		bool is_userptr = xe_vma_is_userptr(vma);
+		bool null = xe_vma_is_null(vma);
 
-		if (is_userptr) {
+		if (null) {
+			addr = 0;
+		} else if (is_userptr) {
 			struct xe_res_cursor cur;
 
 			xe_res_first_sg(vma->userptr.sg, 0, GEN8_PAGE_SIZE, &cur);
@@ -3257,7 +3286,8 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		}
 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
 			   xe_vma_start(vma), xe_vma_end(vma), xe_vma_size(vma),
-			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
+			   addr, null ? "NULL" :
+			   is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
 	}
 	up_read(&vm->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index ef665068bcf7..db30443e121d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -158,7 +158,17 @@ extern struct ttm_device_funcs xe_ttm_funcs;
 
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
 
+static inline bool xe_vma_is_null(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_NULL;
+}
+
 static inline bool xe_vma_is_userptr(struct xe_vma *vma)
+{
+	return !xe_vma_bo(vma) && !xe_vma_is_null(vma);
+}
+
+static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
 {
 	return !xe_vma_bo(vma);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 46d1b8d7b72f..29c99136a57f 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -226,7 +226,7 @@ get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
 	drm_gpuva_iter_for_each_range(it, addr + range) {
 		struct xe_vma *vma = gpuva_to_vma(it.va);
 
-		if (xe_vma_is_userptr(vma))
+		if (xe_vma_has_no_bo(vma))
 			continue;
 
 		if (*num_vmas == max_vmas) {
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ae7f25233410..1d17dae726c9 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -29,6 +29,7 @@ struct xe_vm;
 #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
 #define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
 #define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
+#define XE_VMA_NULL		(DRM_GPUVA_USERBITS << 5)
 
 struct xe_vma {
 	/** @gpuva: Base GPUVA object */
@@ -307,6 +308,8 @@ struct xe_vma_op_map {
 	bool immediate;
 	/** @read_only: Read only */
 	bool read_only;
+	/** @null: NULL (writes dropped, read zero) */
+	bool null;
 };
 
 /** struct xe_vma_op_unmap - VMA unmap operation */
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 593b01ba5919..4bde10875d45 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -446,6 +446,14 @@ struct drm_xe_vm_bind_op {
 	 * than differing the MAP to the page fault handler.
 	 */
 #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
+	/*
+	 * When the NULL flag is set, the page tables are setup with a special
+	 * bit which indicates writes are dropped and all reads return zero. The
+	 * NULL flags is only valid for XE_VM_BIND_OP_MAP operations, the BO
+	 * handle MBZ, and the BO offset MBZ. This flag is intended to implement
+	 * VK sparse bindings.
+	 */
+#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
-- 
2.34.1

