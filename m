Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4552AC001DF
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jun 2023 20:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4883110E3FA;
	Thu, 29 Jun 2023 20:10:38 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2324910E1D5
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jun 2023 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688069436; x=1719605436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ra+TvLyw64ESXgw1/ozo22ZCCWrYXRobYk7s9SZfBhk=;
 b=lfgecBZ72q7o9dur+bGqrsTk5fiuNrtR8KGDdlwBcB9E38JJQyM1H5tq
 9ASZ2bpJ9zu/sZEpl+ADx+FaJrnG7Ve/WAiKC/Fbdhll0t/1x+OfKIYXQ
 /3DtG2MxKhHeMpWUIr9KC85qIag0X5rQWDoOSbSS9YmlpYH8HTeHsr4lr
 Z4F4k1JMuxL6eqGXmJnV6gwNhHfSdzSAlLF7Tku7U9u5Tx6VcWmHTCWZW
 wEIoapcaHyNz7/YxlbtFuuz0xufcIqi86INVwShz7KtDyBqXSPchuLmQL
 EqRbT89HLsy7JXBb0nJ2Q1z8Zq8Q1jyuaAITQMKgR/p+bDp3Q9DaScvTQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352039547"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="352039547"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="711569610"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="711569610"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 13:10:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 29 Jun 2023 13:10:39 -0700
Message-Id: <20230629201046.989033-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230629201046.989033-1-matthew.brost@intel.com>
References: <20230629201046.989033-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 2/9] drm/xe: Add helpers to hide struct xe_vma
 internals
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

This will help with the GPUVA port as the internals of struct xe_vma
will change.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                  |   4 +-
 drivers/gpu/drm/xe/xe_exec.c                |   2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   7 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  14 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  88 +++++------
 drivers/gpu/drm/xe/xe_trace.h               |  10 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 163 ++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                  |  76 +++++++--
 drivers/gpu/drm/xe/xe_vm_madvise.c          |  12 +-
 9 files changed, 211 insertions(+), 165 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 71a14e1f25be..0cd179ba41a5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -411,7 +411,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 	}
 
 	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		struct xe_vm *vm = vma->vm;
+		struct xe_vm *vm = xe_vma_vm(vma);
 
 		trace_xe_vma_evict(vma);
 
@@ -439,7 +439,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 
 		} else {
 			bool vm_resv_locked = false;
-			struct xe_vm *vm = vma->vm;
+			struct xe_vm *vm = xe_vma_vm(vma);
 
 			/*
 			 * We need to put the vma on the vm's rebind_list,
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index bdf00e59e7a4..ba13d20ed348 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -126,7 +126,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 		if (xe_vma_is_userptr(vma))
 			continue;
 
-		err = xe_bo_validate(vma->bo, vm, false);
+		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
 		if (err) {
 			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
 			*tv = NULL;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 6faebd02f3fb..0e91ab67d617 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -77,7 +77,8 @@ static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
 
 static bool vma_matches(struct xe_vma *vma, struct xe_vma *lookup)
 {
-	if (lookup->start > vma->end || lookup->end < vma->start)
+	if (xe_vma_start(lookup) > xe_vma_end(vma) - 1 ||
+	    xe_vma_end(lookup) - 1 < xe_vma_start(vma))
 		return false;
 
 	return true;
@@ -171,7 +172,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	}
 
 	/* Lock VM and BOs dma-resv */
-	bo = vma->bo;
+	bo = xe_vma_bo(vma);
 	if (only_needs_bo_lock(bo)) {
 		/* This path ensures the BO's LRU is updated */
 		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
@@ -538,7 +539,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
-	bo = vma->bo;
+	bo = xe_vma_bo(vma);
 	if (only_needs_bo_lock(bo)) {
 		/* This path ensures the BO's LRU is updated */
 		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 2fcb477604e2..f77368a16409 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -203,8 +203,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	if (!xe->info.has_range_tlb_invalidation) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 start = vma->start;
-		u64 length = vma->end - vma->start + 1;
+		u64 start = xe_vma_start(vma);
+		u64 length = xe_vma_size(vma);
 		u64 align, end;
 
 		if (length < SZ_4K)
@@ -217,12 +217,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 * address mask covering the required range.
 		 */
 		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(vma->start, align);
-		end = ALIGN(vma->start + length, align);
+		start = ALIGN_DOWN(xe_vma_start(vma), align);
+		end = ALIGN(xe_vma_end(vma), align);
 		length = align;
 		while (start + length < end) {
 			length <<= 1;
-			start = ALIGN_DOWN(vma->start, length);
+			start = ALIGN_DOWN(xe_vma_start(vma), length);
 		}
 
 		/*
@@ -231,7 +231,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 */
 		if (length >= SZ_2M) {
 			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(vma->start, length);
+			start = ALIGN_DOWN(xe_vma_start(vma), length);
 		}
 
 		XE_BUG_ON(length < SZ_4K);
@@ -240,7 +240,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		XE_BUG_ON(!IS_ALIGNED(start, length));
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
-		action[len++] = vma->vm->usm.asid;
+		action[len++] = xe_vma_vm(vma)->usm.asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
 		action[len++] = ilog2(length) - ilog2(SZ_4K);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index fe1c77b139e4..a697d43ec293 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -96,7 +96,7 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 				&cur);
 		return xe_res_dma(&cur) + offset;
 	} else {
-		return xe_bo_addr(vma->bo, offset, page_size, is_vram);
+		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
 	}
 }
 
@@ -749,7 +749,7 @@ static int
 xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
-	struct xe_bo *bo = vma->bo;
+	struct xe_bo *bo = xe_vma_bo(vma);
 	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
@@ -758,15 +758,15 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
-		.vm = vma->vm,
+		.vm = xe_vma_vm(vma),
 		.tile = tile,
 		.curs = &curs,
-		.va_curs_start = vma->start,
+		.va_curs_start = xe_vma_start(vma),
 		.pte_flags = vma->pte_flags,
 		.wupd.entries = entries,
-		.needs_64K = (vma->vm->flags & XE_VM_FLAGS_64K) && is_vram,
+		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) && is_vram,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	int ret;
 
 	if (is_vram) {
@@ -788,20 +788,20 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (!xe_vma_is_null(vma)) {
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_sg(vma->userptr.sg, 0,
-					vma->end - vma->start + 1, &curs);
+			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
+					&curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
-			xe_res_first(bo->ttm.resource, vma->bo_offset,
-				     vma->end - vma->start + 1, &curs);
+			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
+				     xe_vma_size(vma), &curs);
 		else
-			xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
-					vma->end - vma->start + 1, &curs);
+			xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
+					xe_vma_size(vma), &curs);
 	} else {
-		curs.size = vma->end - vma->start + 1;
+		curs.size = xe_vma_size(vma);
 	}
 
-	ret = xe_pt_walk_range(&pt->base, pt->level, vma->start, vma->end + 1,
-				&xe_walk.base);
+	ret = xe_pt_walk_range(&pt->base, pt->level, xe_vma_start(vma),
+			       xe_vma_end(vma), &xe_walk.base);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -933,13 +933,13 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 		},
 		.tile = tile,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 
 	if (!(vma->tile_present & BIT(tile->id)))
 		return false;
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.base);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
+				xe_vma_end(vma), &xe_walk.base);
 
 	return xe_walk.needs_invalidate;
 }
@@ -974,21 +974,21 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
 			continue;
 
 		for (j = 0; j < entries[i].qwords; j++)
-			xe_pt_destroy(entries[i].pt_entries[j].pt, vma->vm->flags, NULL);
+			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
 		kfree(entries[i].pt_entries);
 	}
 }
 
 static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 {
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 
 	lockdep_assert_held(&vm->lock);
 
 	if (xe_vma_is_userptr(vma))
 		lockdep_assert_held_read(&vm->userptr.notifier_lock);
 	else if (!xe_vma_is_null(vma))
-		dma_resv_assert_held(vma->bo->ttm.base.resv);
+		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	dma_resv_assert_held(&vm->resv);
 }
@@ -1021,7 +1021,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 			if (xe_pt_entry(pt_dir, j_))
 				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
-					      vma->vm->flags, deferred);
+					      xe_vma_vm(vma)->flags, deferred);
 
 			pt_dir->dir.entries[j_] = &newpte->base;
 		}
@@ -1082,7 +1082,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
 	static u32 count;
 
 	if (count++ % divisor == divisor - 1) {
-		struct xe_vm *vm = vma->vm;
+		struct xe_vm *vm = xe_vma_vm(vma);
 
 		vma->userptr.divisor = divisor << 1;
 		spin_lock(&vm->userptr.invalidated_lock);
@@ -1125,7 +1125,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 		container_of(pt_update, typeof(*userptr_update), base);
 	struct xe_vma *vma = pt_update->vma;
 	unsigned long notifier_seq = vma->userptr.notifier_seq;
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 
 	userptr_update->locked = false;
 
@@ -1296,19 +1296,19 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		},
 		.bind = true,
 	};
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	u32 num_entries;
 	struct dma_fence *fence;
 	struct invalidation_fence *ifence = NULL;
 	int err;
 
 	bind_pt_update.locked = false;
-	xe_bo_assert_held(vma->bo);
+	xe_bo_assert_held(xe_vma_bo(vma));
 	xe_vm_assert_held(vm);
 
-	vm_dbg(&vma->vm->xe->drm,
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
-	       vma->start, vma->end, e);
+	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
 
 	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
 	if (err)
@@ -1337,7 +1337,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	}
 
 	fence = xe_migrate_update_pgtables(tile->migrate,
-					   vm, vma->bo,
+					   vm, xe_vma_bo(vma),
 					   e ? e : vm->eng[tile->id],
 					   entries, num_entries,
 					   syncs, num_syncs,
@@ -1363,8 +1363,8 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
 
-		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
-			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
+		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_bind(vma, entries, num_entries, rebind,
 				  bind_pt_update.locked ? &deferred : NULL);
@@ -1526,14 +1526,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
 		.tile = tile,
-		.modified_start = vma->start,
-		.modified_end = vma->end + 1,
+		.modified_start = xe_vma_start(vma),
+		.modified_end = xe_vma_end(vma),
 		.wupd.entries = entries,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.base);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
+				xe_vma_end(vma), &xe_walk.base);
 
 	return xe_walk.wupd.num_used_entries;
 }
@@ -1545,7 +1545,7 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
 				  const struct xe_vm_pgtable_update *update)
 {
 	struct xe_vma *vma = pt_update->vma;
-	u64 empty = __xe_pt_empty_pte(tile, vma->vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, xe_vma_vm(vma), update->pt->level);
 	int i;
 
 	if (map && map->is_iomem)
@@ -1581,7 +1581,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 			     i++) {
 				if (xe_pt_entry(pt_dir, i))
 					xe_pt_destroy(xe_pt_entry(pt_dir, i),
-						      vma->vm->flags, deferred);
+						      xe_vma_vm(vma)->flags, deferred);
 
 				pt_dir->dir.entries[i] = NULL;
 			}
@@ -1630,18 +1630,18 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 			.vma = vma,
 		},
 	};
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	u32 num_entries;
 	struct dma_fence *fence = NULL;
 	struct invalidation_fence *ifence;
 	LLIST_HEAD(deferred);
 
-	xe_bo_assert_held(vma->bo);
+	xe_bo_assert_held(xe_vma_bo(vma));
 	xe_vm_assert_held(vm);
 
-	vm_dbg(&vma->vm->xe->drm,
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
-	       vma->start, vma->end, e);
+	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
 
 	num_entries = xe_pt_stage_unbind(tile, vma, entries);
 	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
@@ -1680,8 +1680,8 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/* This fence will be installed by caller when doing eviction */
-		if (!xe_vma_has_no_bo(vma) && !vma->bo->vm)
-			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
+		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_unbind(vma, entries, num_entries,
 				    unbind_pt_update.locked ? &deferred : NULL);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index ca96a0a4bb80..b3828e2f0aab 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -18,7 +18,7 @@
 #include "xe_gt_types.h"
 #include "xe_guc_engine_types.h"
 #include "xe_sched_job.h"
-#include "xe_vm_types.h"
+#include "xe_vm.h"
 
 DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
 		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
@@ -373,10 +373,10 @@ DECLARE_EVENT_CLASS(xe_vma,
 
 		    TP_fast_assign(
 			   __entry->vma = (unsigned long)vma;
-			   __entry->asid = vma->vm->usm.asid;
-			   __entry->start = vma->start;
-			   __entry->end = vma->end;
-			   __entry->ptr = (u64)vma->userptr.ptr;
+			   __entry->asid = xe_vma_vm(vma)->usm.asid;
+			   __entry->start = xe_vma_start(vma);
+			   __entry->end = xe_vma_end(vma) - 1;
+			   __entry->ptr = xe_vma_userptr(vma);
 			   ),
 
 		    TP_printk("vma=0x%016llx, asid=0x%05x, start=0x%012llx, end=0x%012llx, ptr=0x%012llx,",
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7d3cceb4a94a..4b6b68ec4ece 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -53,15 +53,14 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma)
 
 int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 {
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
-	const unsigned long num_pages =
-		(vma->end - vma->start + 1) >> PAGE_SHIFT;
+	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
 	struct page **pages;
 	bool in_kthread = !current->mm;
 	unsigned long notifier_seq;
 	int pinned, ret, i;
-	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
+	bool read_only = xe_vma_read_only(vma);
 
 	lockdep_assert_held(&vm->lock);
 	XE_BUG_ON(!xe_vma_is_userptr(vma));
@@ -96,7 +95,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	}
 
 	while (pinned < num_pages) {
-		ret = get_user_pages_fast(vma->userptr.ptr + pinned * PAGE_SIZE,
+		ret = get_user_pages_fast(xe_vma_userptr(vma) +
+					  pinned * PAGE_SIZE,
 					  num_pages - pinned,
 					  read_only ? 0 : FOLL_WRITE,
 					  &pages[pinned]);
@@ -299,7 +299,7 @@ void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
 	struct xe_vma *vma;
 
 	list_for_each_entry(vma, &vm->extobj.list, extobj.link)
-		dma_resv_add_fence(vma->bo->ttm.base.resv, fence, usage);
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence, usage);
 }
 
 static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
@@ -448,7 +448,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	INIT_LIST_HEAD(objs);
 	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
 		tv_bo->num_shared = num_shared;
-		tv_bo->bo = &vma->bo->ttm;
+		tv_bo->bo = &xe_vma_bo(vma)->ttm;
 
 		list_add_tail(&tv_bo->head, objs);
 		tv_bo++;
@@ -463,7 +463,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	spin_lock(&vm->notifier.list_lock);
 	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
 				 notifier.rebind_link) {
-		xe_bo_assert_held(vma->bo);
+		xe_bo_assert_held(xe_vma_bo(vma));
 
 		list_del_init(&vma->notifier.rebind_link);
 		if (vma->tile_present && !vma->destroyed)
@@ -612,7 +612,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		if (xe_vma_has_no_bo(vma) || vma->destroyed)
 			continue;
 
-		err = xe_bo_validate(vma->bo, vm, false);
+		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
 		if (err)
 			goto out_unlock;
 	}
@@ -704,7 +704,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 				   unsigned long cur_seq)
 {
 	struct xe_vma *vma = container_of(mni, struct xe_vma, userptr.notifier);
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	long err;
@@ -923,7 +923,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
 			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
 							   current->mm,
-							   vma->userptr.ptr, size,
+							   xe_vma_userptr(vma), size,
 							   &vma_userptr_notifier_ops);
 			if (err) {
 				kfree(vma);
@@ -943,7 +943,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static bool vm_remove_extobj(struct xe_vma *vma)
 {
 	if (!list_empty(&vma->extobj.link)) {
-		vma->vm->extobj.entries--;
+		xe_vma_vm(vma)->extobj.entries--;
 		list_del_init(&vma->extobj.link);
 		return true;
 	}
@@ -952,9 +952,9 @@ static bool vm_remove_extobj(struct xe_vma *vma)
 
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
-	bool read_only = vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
+	bool read_only = xe_vma_read_only(vma);
 
 	if (xe_vma_is_userptr(vma)) {
 		if (vma->userptr.sg) {
@@ -976,7 +976,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 	} else if (xe_vma_is_null(vma)) {
 		xe_vm_put(vm);
 	} else {
-		xe_bo_put(vma->bo);
+		xe_bo_put(xe_vma_bo(vma));
 	}
 
 	kfree(vma);
@@ -997,7 +997,7 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
 	struct xe_vma *vma;
 
 	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		if (vma != ignore && vma->vm == vm)
+		if (vma != ignore && xe_vma_vm(vma) == vm)
 			return vma;
 	}
 
@@ -1025,7 +1025,7 @@ static void __vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
 
 static void vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
 {
-	struct xe_bo *bo = vma->bo;
+	struct xe_bo *bo = xe_vma_bo(vma);
 
 	lockdep_assert_held_write(&vm->lock);
 
@@ -1046,7 +1046,7 @@ static void vma_destroy_cb(struct dma_fence *fence,
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 {
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 
 	lockdep_assert_held_write(&vm->lock);
 	XE_BUG_ON(!list_empty(&vma->unbind_link));
@@ -1058,17 +1058,17 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 		spin_unlock(&vm->userptr.invalidated_lock);
 		list_del(&vma->userptr_link);
 	} else if (!xe_vma_is_null(vma)) {
-		xe_bo_assert_held(vma->bo);
+		xe_bo_assert_held(xe_vma_bo(vma));
 		list_del(&vma->bo_link);
 
 		spin_lock(&vm->notifier.list_lock);
 		list_del(&vma->notifier.rebind_link);
 		spin_unlock(&vm->notifier.list_lock);
 
-		if (!vma->bo->vm && vm_remove_extobj(vma)) {
+		if (!xe_vma_bo(vma)->vm && vm_remove_extobj(vma)) {
 			struct xe_vma *other;
 
-			other = bo_has_vm_references_locked(vma->bo, vm, NULL);
+			other = bo_has_vm_references_locked(xe_vma_bo(vma), vm, NULL);
 
 			if (other)
 				__vm_insert_extobj(vm, other);
@@ -1096,13 +1096,13 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
 	struct ttm_validate_buffer tv[2];
 	struct ww_acquire_ctx ww;
-	struct xe_bo *bo = vma->bo;
+	struct xe_bo *bo = xe_vma_bo(vma);
 	LIST_HEAD(objs);
 	LIST_HEAD(dups);
 	int err;
 
 	memset(tv, 0, sizeof(tv));
-	tv[0].bo = xe_vm_ttm_bo(vma->vm);
+	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
 	list_add(&tv[0].head, &objs);
 
 	if (bo) {
@@ -1125,11 +1125,11 @@ static struct xe_vma *to_xe_vma(const struct rb_node *node)
 	return (struct xe_vma *)node;
 }
 
-static int xe_vma_cmp(const struct xe_vma *a, const struct xe_vma *b)
+static int xe_vma_cmp(struct xe_vma *a, struct xe_vma *b)
 {
-	if (a->end < b->start) {
+	if (xe_vma_end(a) - 1 < xe_vma_start(b)) {
 		return -1;
-	} else if (b->end < a->start) {
+	} else if (xe_vma_end(b) - 1 < xe_vma_start(a)) {
 		return 1;
 	} else {
 		return 0;
@@ -1144,19 +1144,19 @@ static bool xe_vma_less_cb(struct rb_node *a, const struct rb_node *b)
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node)
 {
 	struct xe_vma *cmp = to_xe_vma(node);
-	const struct xe_vma *own = key;
+	struct xe_vma *own = (struct xe_vma *)key;
 
-	if (own->start > cmp->end)
+	if (xe_vma_start(own) > xe_vma_end(cmp) - 1)
 		return 1;
 
-	if (own->end < cmp->start)
+	if (xe_vma_end(own) - 1 < xe_vma_start(cmp))
 		return -1;
 
 	return 0;
 }
 
 struct xe_vma *
-xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
+xe_vm_find_overlapping_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
 	struct rb_node *node;
 
@@ -1165,7 +1165,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
 	if (xe_vm_is_closed_or_banned(vm))
 		return NULL;
 
-	XE_BUG_ON(vma->end >= vm->size);
+	XE_BUG_ON(xe_vma_end(vma) > vm->size);
 
 	node = rb_find(vma, &vm->vmas, xe_vma_cmp_vma_cb);
 
@@ -1174,7 +1174,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
 
 static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
-	XE_BUG_ON(vma->vm != vm);
+	XE_BUG_ON(xe_vma_vm(vma) != vm);
 	lockdep_assert_held(&vm->lock);
 
 	rb_add(&vma->vm_node, &vm->vmas, xe_vma_less_cb);
@@ -1182,7 +1182,7 @@ static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 
 static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
-	XE_BUG_ON(vma->vm != vm);
+	XE_BUG_ON(xe_vma_vm(vma) != vm);
 	lockdep_assert_held(&vm->lock);
 
 	rb_erase(&vma->vm_node, &vm->vmas);
@@ -1436,7 +1436,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		rb_erase(&vma->vm_node, &vm->vmas);
 
 		/* easy case, remove from VMA? */
-		if (xe_vma_has_no_bo(vma) || vma->bo->vm) {
+		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
 			xe_vma_destroy(vma, NULL);
 			continue;
 		}
@@ -1576,7 +1576,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
 	int number_tiles = hweight_long(vma->tile_present);
 	int err;
@@ -1646,7 +1646,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 	struct dma_fence *fence;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
 	int number_tiles = hweight_long(vma->tile_mask);
 	int err;
@@ -1832,7 +1832,7 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 	struct dma_fence *fence;
 
 	xe_vm_assert_held(vm);
-	xe_bo_assert_held(vma->bo);
+	xe_bo_assert_held(xe_vma_bo(vma));
 
 	fence = xe_vm_unbind_vma(vma, e, syncs, num_syncs);
 	if (IS_ERR(fence))
@@ -2071,13 +2071,13 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
 
 	if (!xe_vma_has_no_bo(vma)) {
-		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
+		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
 		if (err)
 			return err;
 	}
 
 	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
-		return xe_vm_bind(vm, vma, e, vma->bo, syncs, num_syncs,
+		return xe_vm_bind(vm, vma, e, xe_vma_bo(vma), syncs, num_syncs,
 				  afence);
 	} else {
 		int i;
@@ -2173,7 +2173,7 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
 
 	xe_vm_tv_populate(vm, &tv_vm);
 	list_add_tail(&tv_vm.head, &objs);
-	vbo = vma->bo;
+	vbo = xe_vma_bo(vma);
 	if (vbo) {
 		/*
 		 * An unbind can drop the last reference to the BO and
@@ -2533,7 +2533,7 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
 		} else {
 			bind_op->op = XE_VM_BIND_FLAG_ASYNC |
 				XE_VM_BIND_OP_MAP;
-			xe_bo_get(__vma->bo);
+			xe_bo_get(xe_vma_bo(__vma));
 		}
 
 		if (!last) {
@@ -2543,7 +2543,7 @@ static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
 		}
 
 		err = __vm_bind_ioctl_async(vm, __vma, e,
-					    __vma->bo, bind_op, last ?
+					    xe_vma_bo(__vma), bind_op, last ?
 					    out_syncs : NULL,
 					    last ? num_out_syncs : 0);
 		if (err) {
@@ -2590,8 +2590,8 @@ static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 	case XE_VM_BIND_OP_PREFETCH:
 		vma = xe_vm_find_overlapping_vma(vm, &lookup);
 		if (XE_IOCTL_ERR(xe, !vma) ||
-		    XE_IOCTL_ERR(xe, (vma->start != addr ||
-				 vma->end != addr + range - 1) && !async))
+		    XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
+				 xe_vma_end(vma) != addr + range) && !async))
 			return -EINVAL;
 		break;
 	case XE_VM_BIND_OP_UNMAP_ALL:
@@ -2616,9 +2616,9 @@ static int prep_replacement_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
 	int err;
 
-	if (vma->bo && !vma->bo->vm) {
+	if (xe_vma_bo(vma) && !xe_vma_bo(vma)->vm) {
 		vm_insert_extobj(vm, vma);
-		err = add_preempt_fences(vm, vma->bo);
+		err = add_preempt_fences(vm, xe_vma_bo(vma));
 		if (err)
 			return err;
 	}
@@ -2667,25 +2667,25 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 		}
 	}
 
-	if (first->start != lookup->start) {
+	if (xe_vma_start(first) != xe_vma_start(lookup)) {
 		struct ww_acquire_ctx ww;
 
-		if (first->bo)
-			err = xe_bo_lock(first->bo, &ww, 0, true);
+		if (xe_vma_bo(first))
+			err = xe_bo_lock(xe_vma_bo(first), &ww, 0, true);
 		if (err)
 			goto unwind;
-		new_first = xe_vma_create(first->vm, first->bo,
-					  first->bo ? first->bo_offset :
-					  first->userptr.ptr,
-					  first->start,
-					  lookup->start - 1,
-					  (first->pte_flags &
-					   XE_PTE_FLAG_READ_ONLY),
+		new_first = xe_vma_create(xe_vma_vm(first), xe_vma_bo(first),
+					  xe_vma_bo(first) ?
+					  xe_vma_bo_offset(first) :
+					  xe_vma_userptr(first),
+					  xe_vma_start(first),
+					  xe_vma_start(lookup) - 1,
+					  xe_vma_read_only(first),
 					  (first->pte_flags &
 					   XE_PTE_FLAG_NULL),
 					  first->tile_mask);
-		if (first->bo)
-			xe_bo_unlock(first->bo, &ww);
+		if (xe_vma_bo(first))
+			xe_bo_unlock(xe_vma_bo(first), &ww);
 		if (!new_first) {
 			err = -ENOMEM;
 			goto unwind;
@@ -2700,25 +2700,25 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 			goto unwind;
 	}
 
-	if (last->end != lookup->end) {
+	if (xe_vma_end(last) != xe_vma_end(lookup)) {
 		struct ww_acquire_ctx ww;
-		u64 chunk = lookup->end + 1 - last->start;
+		u64 chunk = xe_vma_end(lookup) - xe_vma_start(last);
 
-		if (last->bo)
-			err = xe_bo_lock(last->bo, &ww, 0, true);
+		if (xe_vma_bo(last))
+			err = xe_bo_lock(xe_vma_bo(last), &ww, 0, true);
 		if (err)
 			goto unwind;
-		new_last = xe_vma_create(last->vm, last->bo,
-					 last->bo ? last->bo_offset + chunk :
-					 last->userptr.ptr + chunk,
-					 last->start + chunk,
-					 last->end,
-					 (last->pte_flags &
-					  XE_PTE_FLAG_READ_ONLY),
+		new_last = xe_vma_create(xe_vma_vm(last), xe_vma_bo(last),
+					 xe_vma_bo(last) ?
+					 xe_vma_bo_offset(last) + chunk :
+					 xe_vma_userptr(last) + chunk,
+					 xe_vma_start(last) + chunk,
+					 xe_vma_end(last) - 1,
+					 xe_vma_read_only(last),
 					 (last->pte_flags & XE_PTE_FLAG_NULL),
 					 last->tile_mask);
-		if (last->bo)
-			xe_bo_unlock(last->bo, &ww);
+		if (xe_vma_bo(last))
+			xe_bo_unlock(xe_vma_bo(last), &ww);
 		if (!new_last) {
 			err = -ENOMEM;
 			goto unwind;
@@ -2784,7 +2784,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
 	struct rb_node *node;
 
 	if (!xe_vma_has_no_bo(vma)) {
-		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
+		if (!xe_bo_can_migrate(xe_vma_bo(vma), region_to_mem_type[region]))
 			return ERR_PTR(-EINVAL);
 	}
 
@@ -2793,7 +2793,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
 		if (!xe_vma_cmp_vma_cb(lookup, node)) {
 			__vma = to_xe_vma(node);
 			if (!xe_vma_has_no_bo(__vma)) {
-				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
+				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))
 					goto flush_list;
 			}
 			list_add_tail(&__vma->unbind_link, &vma->unbind_link);
@@ -2807,7 +2807,7 @@ static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
 		if (!xe_vma_cmp_vma_cb(lookup, node)) {
 			__vma = to_xe_vma(node);
 			if (!xe_vma_has_no_bo(__vma)) {
-				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
+				if (!xe_bo_can_migrate(xe_vma_bo(__vma), region_to_mem_type[region]))
 					goto flush_list;
 			}
 			list_add(&__vma->unbind_link, &vma->unbind_link);
@@ -2835,7 +2835,7 @@ static struct xe_vma *vm_unbind_all_lookup_vmas(struct xe_vm *vm,
 	xe_bo_assert_held(bo);
 
 	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		if (vma->vm != vm)
+		if (xe_vma_vm(vma) != vm)
 			continue;
 
 		prep_vma_destroy(vm, vma);
@@ -3428,14 +3428,14 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
  */
 int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
-	struct xe_device *xe = vma->vm->xe;
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
 	u32 tile_needs_invalidate = 0;
 	int seqno[XE_MAX_TILES_PER_DEVICE];
 	u8 id;
 	int ret;
 
-	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
+	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
 	XE_WARN_ON(xe_vma_is_null(vma));
 	trace_xe_vma_usm_invalidate(vma);
 
@@ -3445,11 +3445,11 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&vma->userptr.notifier,
 				      vma->userptr.notifier_seq));
-			WARN_ON_ONCE(!dma_resv_test_signaled(&vma->vm->resv,
+			WARN_ON_ONCE(!dma_resv_test_signaled(&xe_vma_vm(vma)->resv,
 							     DMA_RESV_USAGE_BOOKKEEP));
 
 		} else {
-			xe_bo_assert_held(vma->bo);
+			xe_bo_assert_held(xe_vma_bo(vma));
 		}
 	}
 
@@ -3514,10 +3514,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 				addr = 0;
 			}
 		} else {
-			addr = __xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
+			addr = __xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE, &is_vram);
 		}
 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
-			   vma->start, vma->end, vma->end - vma->start + 1ull,
+			   xe_vma_start(vma), xe_vma_end(vma) - 1,
+			   xe_vma_size(vma),
 			   addr, is_null ? "NULL" : is_userptr ? "USR" :
 			   is_vram ? "VRAM" : "SYS");
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 47bc7fbb2f50..3d542ceb5327 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -61,7 +61,66 @@ static inline bool xe_vm_is_closed_or_banned(struct xe_vm *vm)
 }
 
 struct xe_vma *
-xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
+xe_vm_find_overlapping_vma(struct xe_vm *vm, struct xe_vma *vma);
+
+/*
+ * Let's abstract start, size, end, bo_offset, vm, and bo as the underlying
+ * implementation may change
+ */
+static inline u64 xe_vma_start(struct xe_vma *vma)
+{
+	return vma->start;
+}
+
+static inline u64 xe_vma_size(struct xe_vma *vma)
+{
+	return vma->end - vma->start + 1;
+}
+
+static inline u64 xe_vma_end(struct xe_vma *vma)
+{
+	return xe_vma_start(vma) + xe_vma_size(vma);
+}
+
+static inline u64 xe_vma_bo_offset(struct xe_vma *vma)
+{
+	return vma->bo_offset;
+}
+
+static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
+{
+	return vma->bo;
+}
+
+static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
+{
+	return vma->vm;
+}
+
+static inline bool xe_vma_read_only(struct xe_vma *vma)
+{
+	return vma->pte_flags & XE_PTE_FLAG_READ_ONLY;
+}
+
+static inline u64 xe_vma_userptr(struct xe_vma *vma)
+{
+	return vma->userptr.ptr;
+}
+
+static inline bool xe_vma_is_null(struct xe_vma *vma)
+{
+	return vma->pte_flags & XE_PTE_FLAG_NULL;
+}
+
+static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
+{
+	return !xe_vma_bo(vma);
+}
+
+static inline bool xe_vma_is_userptr(struct xe_vma *vma)
+{
+	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
+}
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
 
@@ -126,21 +185,6 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 	}
 }
 
-static inline bool xe_vma_is_null(struct xe_vma *vma)
-{
-	return vma->pte_flags & XE_PTE_FLAG_NULL;
-}
-
-static inline bool xe_vma_has_no_bo(struct xe_vma *vma)
-{
-	return !vma->bo;
-}
-
-static inline bool xe_vma_is_userptr(struct xe_vma *vma)
-{
-	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
-}
-
 int xe_vma_userptr_pin_pages(struct xe_vma *vma);
 
 int xe_vma_userptr_check_repin(struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 76458f8d57f3..f29a67cb941f 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -30,7 +30,7 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
 		struct xe_bo *bo;
 		struct ww_acquire_ctx ww;
 
-		bo = vmas[i]->bo;
+		bo = xe_vma_bo(vmas[i]);
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
@@ -55,7 +55,7 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
 		struct xe_bo *bo;
 		struct ww_acquire_ctx ww;
 
-		bo = vmas[i]->bo;
+		bo = xe_vma_bo(vmas[i]);
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
@@ -91,7 +91,7 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
 		struct xe_bo *bo;
 		struct ww_acquire_ctx ww;
 
-		bo = vmas[i]->bo;
+		bo = xe_vma_bo(vmas[i]);
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
@@ -114,7 +114,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
 		struct xe_bo *bo;
 		struct ww_acquire_ctx ww;
 
-		bo = vmas[i]->bo;
+		bo = xe_vma_bo(vmas[i]);
 		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
 			return -EINVAL;
 
@@ -145,7 +145,7 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
 		struct xe_bo *bo;
 		struct ww_acquire_ctx ww;
 
-		bo = vmas[i]->bo;
+		bo = xe_vma_bo(vmas[i]);
 		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
 				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
 			return -EINVAL;
@@ -176,7 +176,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
 		struct xe_bo *bo;
 		struct ww_acquire_ctx ww;
 
-		bo = vmas[i]->bo;
+		bo = xe_vma_bo(vmas[i]);
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
-- 
2.34.1

