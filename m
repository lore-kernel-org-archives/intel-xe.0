Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F45C87FE1
	for <intel-xe@archiver.kernel.org>; Mon,  1 May 2023 07:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB4110E40A;
	Mon,  1 May 2023 07:51:18 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A9C10E343
 for <intel-xe@lists.freedesktop.org>; Mon,  1 May 2023 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682927473; x=1714463473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t4J0EFKPt2712fMdfmUFpKS/yjvj6twyYai4twTF1nU=;
 b=EZ08pkjGuNCuZLUyl/Fu2a9AwNCulh3INvNW3dphFep2QPyW8jZKl1mi
 8/fZGpe68QUyxf8Fxo4ayIY9yAQh9yMI+HNvRpC7iTTJxCtSup1AmMvaE
 ZDogEmLUyf47vGH5+dyAVFm2Mjz/gb9M0nexCQW0qCbYNQmWRjAZVibNx
 B2fDYWh0UscXXk7REjnUmsYoO9BFouwSEac5HLIS8U92CkOqYd0WkUp3Z
 /WiYOn/0c/HEqKUZ5LErFJs0TPQhgRczEixmke3u5qr6VicrkAzED0o76
 2++u7vr/EDIpILtPXrP0VqTNxtcfREVi9/wbq2+TQk3+/5ipaX+iev8Yi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="346910723"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="346910723"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="870095229"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; d="scan'208";a="870095229"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2023 00:51:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon,  1 May 2023 00:51:00 -0700
Message-Id: <20230501075114.3108352-17-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230501075114.3108352-1-matthew.brost@intel.com>
References: <20230501075114.3108352-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 16/30] drm/xe: Port Xe to GPUVA
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

Rather than open coding VM binds and VMA tracking, use the GPUVA
library. GPUVA provides a common infrastructure for VM binds to use mmap
/ munmap semantics and support for VK sparse bindings.

The concepts are:

1) xe_vm inherits from drm_gpuva_manager
2) xe_vma inherits from drm_gpuva
3) xe_vma_op inherits from drm_gpuva_op
4) VM bind operations (MAP, UNMAP, PREFETCH, UNMAP_ALL) call into the
GPUVA code to generate an VMA operations list which is parsed, commited,
and executed.

v2 (CI): Add break after default in case statement.
v3: Rebase

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
 drivers/gpu/drm/xe/xe_device.c              |    2 +-
 drivers/gpu/drm/xe/xe_exec.c                |    2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |   23 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
 drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
 drivers/gpu/drm/xe/xe_pt.c                  |  106 +-
 drivers/gpu/drm/xe/xe_trace.h               |   10 +-
 drivers/gpu/drm/xe/xe_vm.c                  | 1847 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                  |   66 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c          |   88 +-
 drivers/gpu/drm/xe/xe_vm_types.h            |  167 +-
 12 files changed, 1168 insertions(+), 1175 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index da99ee53e7d7..a475d0584916 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -391,7 +391,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	struct xe_vma *vma;
+	struct drm_gpuva *gpuva;
+	struct drm_gem_object *obj = &bo->ttm.base;
 	int ret = 0;
 
 	dma_resv_assert_held(bo->ttm.base.resv);
@@ -404,8 +405,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 		dma_resv_iter_end(&cursor);
 	}
 
-	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		struct xe_vm *vm = vma->vm;
+	drm_gem_for_each_gpuva(gpuva, obj) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+		struct xe_vm *vm = xe_vma_vm(vma);
 
 		trace_xe_vma_evict(vma);
 
@@ -430,10 +432,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			} else {
 				ret = timeout;
 			}
-
 		} else {
 			bool vm_resv_locked = false;
-			struct xe_vm *vm = vma->vm;
 
 			/*
 			 * We need to put the vma on the vm's rebind_list,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 45d6e5ff47fd..ab2ecd208f97 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -131,7 +131,7 @@ static struct drm_driver driver = {
 	.driver_features =
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
-	    DRIVER_SYNCOBJ_TIMELINE,
+	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
 	.open = xe_file_open,
 	.postclose = xe_file_close,
 
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 21a9c2fddf86..90c46d092737 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -119,7 +119,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 		if (xe_vma_is_userptr(vma))
 			continue;
 
-		err = xe_bo_validate(vma->bo, vm, false);
+		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
 		if (err) {
 			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
 			*tv = NULL;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 1677640e1075..f7a066090a13 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -75,9 +75,10 @@ static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
 		!(BIT(gt->info.id) & vma->usm.gt_invalidated);
 }
 
-static bool vma_matches(struct xe_vma *vma, struct xe_vma *lookup)
+static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 {
-	if (lookup->start > vma->end || lookup->end < vma->start)
+	if (page_addr > xe_vma_end(vma) - 1 ||
+	    page_addr + SZ_4K < xe_vma_start(vma))
 		return false;
 
 	return true;
@@ -90,16 +91,14 @@ static bool only_needs_bo_lock(struct xe_bo *bo)
 
 static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
 {
-	struct xe_vma *vma = NULL, lookup;
+	struct xe_vma *vma = NULL;
 
-	lookup.start = page_addr;
-	lookup.end = lookup.start + SZ_4K - 1;
 	if (vm->usm.last_fault_vma) {   /* Fast lookup */
-		if (vma_matches(vm->usm.last_fault_vma, &lookup))
+		if (vma_matches(vm->usm.last_fault_vma, page_addr))
 			vma = vm->usm.last_fault_vma;
 	}
 	if (!vma)
-		vma = xe_vm_find_overlapping_vma(vm, &lookup);
+		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
 
 	return vma;
 }
@@ -170,7 +169,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	}
 
 	/* Lock VM and BOs dma-resv */
-	bo = vma->bo;
+	bo = xe_vma_bo(vma);
 	if (only_needs_bo_lock(bo)) {
 		/* This path ensures the BO's LRU is updated */
 		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
@@ -487,12 +486,8 @@ static struct xe_vma *get_acc_vma(struct xe_vm *vm, struct acc *acc)
 {
 	u64 page_va = acc->va_range_base + (ffs(acc->sub_granularity) - 1) *
 		sub_granularity_in_byte(acc->granularity);
-	struct xe_vma lookup;
-
-	lookup.start = page_va;
-	lookup.end = lookup.start + SZ_4K - 1;
 
-	return xe_vm_find_overlapping_vma(vm, &lookup);
+	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
 }
 
 static int handle_acc(struct xe_gt *gt, struct acc *acc)
@@ -536,7 +531,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
-	bo = vma->bo;
+	bo = xe_vma_bo(vma);
 	if (only_needs_bo_lock(bo)) {
 		/* This path ensures the BO's LRU is updated */
 		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 604f189dbd70..66fd67ffa8a9 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -201,8 +201,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	if (!xe->info.has_range_tlb_invalidation) {
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
 	} else {
-		u64 start = vma->start;
-		u64 length = vma->end - vma->start + 1;
+		u64 start = xe_vma_start(vma);
+		u64 length = xe_vma_size(vma);
 		u64 align, end;
 
 		if (length < SZ_4K)
@@ -215,12 +215,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 * address mask covering the required range.
 		 */
 		align = roundup_pow_of_two(length);
-		start = ALIGN_DOWN(vma->start, align);
-		end = ALIGN(vma->start + length, align);
+		start = ALIGN_DOWN(xe_vma_start(vma), align);
+		end = ALIGN(xe_vma_start(vma) + length, align);
 		length = align;
 		while (start + length < end) {
 			length <<= 1;
-			start = ALIGN_DOWN(vma->start, length);
+			start = ALIGN_DOWN(xe_vma_start(vma), length);
 		}
 
 		/*
@@ -229,7 +229,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		 */
 		if (length >= SZ_2M) {
 			length = max_t(u64, SZ_16M, length);
-			start = ALIGN_DOWN(vma->start, length);
+			start = ALIGN_DOWN(xe_vma_start(vma), length);
 		}
 
 		XE_BUG_ON(length < SZ_4K);
@@ -238,7 +238,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		XE_BUG_ON(!IS_ALIGNED(start, length));
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
-		action[len++] = vma->vm->usm.asid;
+		action[len++] = xe_vma_vm(vma)->usm.asid;
 		action[len++] = lower_32_bits(start);
 		action[len++] = upper_32_bits(start);
 		action[len++] = ilog2(length) - ilog2(SZ_4K);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f40f47ccb76f..b44aa094a466 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1050,8 +1050,10 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 		return ERR_PTR(-ETIME);
 
 	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
-					       DMA_RESV_USAGE_BOOKKEEP))
+					       DMA_RESV_USAGE_BOOKKEEP)) {
+		vm_dbg(&vm->xe->drm, "wait on VM for munmap");
 		return ERR_PTR(-ETIME);
+	}
 
 	if (ops->pre_commit) {
 		err = ops->pre_commit(pt_update);
@@ -1139,7 +1141,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	u64 addr;
 	int err = 0;
 	bool usm = !eng && xe->info.supports_usm;
-	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
+	bool first_munmap_rebind = vma &&
+		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
 
 	/* Use the CPU if no in syncs and engine is idle */
 	if (no_in_syncs(syncs, num_syncs) && (!eng || xe_engine_is_idle(eng))) {
@@ -1260,6 +1263,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * trigger preempts before moving forward
 	 */
 	if (first_munmap_rebind) {
+		vm_dbg(&vm->xe->drm, "wait on first_munmap_rebind");
 		err = job_add_deps(job, &vm->resv,
 				   DMA_RESV_USAGE_BOOKKEEP);
 		if (err)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4ee5ea2cabc9..2b5b05a8a084 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -94,7 +94,7 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
 				&cur);
 		return xe_res_dma(&cur) + offset;
 	} else {
-		return xe_bo_addr(vma->bo, offset, page_size, is_vram);
+		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
 	}
 }
 
@@ -159,7 +159,7 @@ u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
 
 	if (is_vram) {
 		pte |= XE_PPGTT_PTE_LM;
-		if (vma && vma->use_atomic_access_pte_bit)
+		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
 			pte |= XE_USM_PPGTT_PTE_AE;
 	}
 
@@ -738,7 +738,7 @@ static int
 xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
-	struct xe_bo *bo = vma->bo;
+	struct xe_bo *bo = xe_vma_bo(vma);
 	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
 	struct xe_res_cursor curs;
 	struct xe_pt_stage_bind_walk xe_walk = {
@@ -747,22 +747,23 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
-		.vm = vma->vm,
+		.vm = xe_vma_vm(vma),
 		.gt = gt,
 		.curs = &curs,
-		.va_curs_start = vma->start,
-		.pte_flags = vma->pte_flags,
+		.va_curs_start = xe_vma_start(vma),
+		.pte_flags = xe_vma_read_only(vma) ? XE_PTE_READ_ONLY : 0,
 		.wupd.entries = entries,
-		.needs_64K = (vma->vm->flags & XE_VM_FLAGS_64K) && is_vram,
+		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) &&
+			is_vram,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
+	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[gt->info.id];
 	int ret;
 
 	if (is_vram) {
 		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
 
 		xe_walk.default_pte = XE_PPGTT_PTE_LM;
-		if (vma && vma->use_atomic_access_pte_bit)
+		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
 			gt_to_xe(gt)->mem.vram.io_start;
@@ -778,17 +779,16 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 
 	xe_bo_assert_held(bo);
 	if (xe_vma_is_userptr(vma))
-		xe_res_first_sg(vma->userptr.sg, 0, vma->end - vma->start + 1,
-				&curs);
+		xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma), &curs);
 	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
-		xe_res_first(bo->ttm.resource, vma->bo_offset,
-			     vma->end - vma->start + 1, &curs);
+		xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
+			     xe_vma_size(vma), &curs);
 	else
-		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
-				vma->end - vma->start + 1, &curs);
+		xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
+				xe_vma_size(vma), &curs);
 
-	ret = drm_pt_walk_range(&pt->drm, pt->level, vma->start, vma->end + 1,
-				&xe_walk.drm);
+	ret = drm_pt_walk_range(&pt->drm, pt->level, xe_vma_start(vma),
+				xe_vma_end(vma), &xe_walk.drm);
 
 	*num_entries = xe_walk.wupd.num_used_entries;
 	return ret;
@@ -923,13 +923,13 @@ bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 		},
 		.gt = gt,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
+	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[gt->info.id];
 
 	if (!(vma->gt_present & BIT(gt->info.id)))
 		return false;
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)drm_pt_walk_shared(&pt->drm, pt->level, xe_vma_start(vma),
+				 xe_vma_end(vma), &xe_walk.drm);
 
 	return xe_walk.needs_invalidate;
 }
@@ -966,21 +966,21 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
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
 	else
-		dma_resv_assert_held(vma->bo->ttm.base.resv);
+		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
 
 	dma_resv_assert_held(&vm->resv);
 }
@@ -1013,7 +1013,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 
 			if (xe_pt_entry(pt_dir, j_))
 				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
-					      vma->vm->flags, deferred);
+					      xe_vma_vm(vma)->flags, deferred);
 
 			pt_dir->dir.entries[j_] = &newpte->drm;
 		}
@@ -1074,7 +1074,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
 	static u32 count;
 
 	if (count++ % divisor == divisor - 1) {
-		struct xe_vm *vm = vma->vm;
+		struct xe_vm *vm = xe_vma_vm(vma);
 
 		vma->userptr.divisor = divisor << 1;
 		spin_lock(&vm->userptr.invalidated_lock);
@@ -1117,7 +1117,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 		container_of(pt_update, typeof(*userptr_update), base);
 	struct xe_vma *vma = pt_update->vma;
 	unsigned long notifier_seq = vma->userptr.notifier_seq;
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 
 	userptr_update->locked = false;
 
@@ -1288,20 +1288,20 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
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
 	XE_BUG_ON(xe_gt_is_media_type(gt));
 
-	vm_dbg(&vma->vm->xe->drm,
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
-	       vma->start, vma->end, e);
+	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
 
 	err = xe_pt_prepare_bind(gt, vma, entries, &num_entries, rebind);
 	if (err)
@@ -1310,23 +1310,28 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
 
-	if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+	if (rebind && !xe_vm_no_dma_fences(xe_vma_vm(vma))) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 		if (!ifence)
 			return ERR_PTR(-ENOMEM);
 	}
 
 	fence = xe_migrate_update_pgtables(gt->migrate,
-					   vm, vma->bo,
+					   vm, xe_vma_bo(vma),
 					   e ? e : vm->eng[gt->info.id],
 					   entries, num_entries,
 					   syncs, num_syncs,
 					   &bind_pt_update.base);
 	if (!IS_ERR(fence)) {
+		bool last_munmap_rebind = vma->gpuva.flags & XE_VMA_LAST_REBIND;
 		LLIST_HEAD(deferred);
 
+
+		if (last_munmap_rebind)
+			vm_dbg(&vm->xe->drm, "last_munmap_rebind");
+
 		/* TLB invalidation must be done before signaling rebind */
-		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
+		if (rebind && !xe_vm_no_dma_fences(xe_vma_vm(vma))) {
 			int err = invalidation_fence_init(gt, ifence, fence,
 							  vma);
 			if (err) {
@@ -1339,12 +1344,12 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 		/* add shared fence now for pagetable delayed destroy */
 		dma_resv_add_fence(&vm->resv, fence, !rebind &&
-				   vma->last_munmap_rebind ?
+				   last_munmap_rebind ?
 				   DMA_RESV_USAGE_KERNEL :
 				   DMA_RESV_USAGE_BOOKKEEP);
 
-		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
-			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
+		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_bind(vma, entries, num_entries, rebind,
 				  bind_pt_update.locked ? &deferred : NULL);
@@ -1357,8 +1362,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 			up_read(&vm->userptr.notifier_lock);
 			xe_bo_put_commit(&deferred);
 		}
-		if (!rebind && vma->last_munmap_rebind &&
-		    xe_vm_in_compute_mode(vm))
+		if (!rebind && last_munmap_rebind && xe_vm_in_compute_mode(vm))
 			queue_work(vm->xe->ordered_wq,
 				   &vm->preempt.rebind_work);
 	} else {
@@ -1506,14 +1510,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
 		.gt = gt,
-		.modified_start = vma->start,
-		.modified_end = vma->end + 1,
+		.modified_start = xe_vma_start(vma),
+		.modified_end = xe_vma_end(vma),
 		.wupd.entries = entries,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
+	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[gt->info.id];
 
-	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
-				 &xe_walk.drm);
+	(void)drm_pt_walk_shared(&pt->drm, pt->level, xe_vma_start(vma),
+				 xe_vma_end(vma), &xe_walk.drm);
 
 	return xe_walk.wupd.num_used_entries;
 }
@@ -1525,7 +1529,7 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
 				  const struct xe_vm_pgtable_update *update)
 {
 	struct xe_vma *vma = pt_update->vma;
-	u64 empty = __xe_pt_empty_pte(gt, vma->vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(gt, xe_vma_vm(vma), update->pt->level);
 	int i;
 
 	XE_BUG_ON(xe_gt_is_media_type(gt));
@@ -1563,7 +1567,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
 			     i++) {
 				if (xe_pt_entry(pt_dir, i))
 					xe_pt_destroy(xe_pt_entry(pt_dir, i),
-						      vma->vm->flags, deferred);
+						      xe_vma_vm(vma)->flags, deferred);
 
 				pt_dir->dir.entries[i] = NULL;
 			}
@@ -1612,19 +1616,19 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
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
 	XE_BUG_ON(xe_gt_is_media_type(gt));
 
-	vm_dbg(&vma->vm->xe->drm,
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
-	       vma->start, vma->end, e);
+	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
 
 	num_entries = xe_pt_stage_unbind(gt, vma, entries);
 	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
@@ -1663,8 +1667,8 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 				   DMA_RESV_USAGE_BOOKKEEP);
 
 		/* This fence will be installed by caller when doing eviction */
-		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
-			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
+		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
+			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_unbind(vma, entries, num_entries,
 				    unbind_pt_update.locked ? &deferred : NULL);
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index 38e9d7c6197b..5c7515296345 100644
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
@@ -378,10 +378,10 @@ DECLARE_EVENT_CLASS(xe_vma,
 
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
index 6c427ff92c44..13e43ff08f2c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -25,10 +25,8 @@
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
-#include "xe_sync.h"
 #include "xe_trace.h"
-
-#define TEST_VM_ASYNC_OPS_ERROR
+#include "xe_sync.h"
 
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
@@ -51,20 +49,19 @@ int xe_vma_userptr_check_repin(struct xe_vma *vma)
 
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
-	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
+	bool read_only = xe_vma_read_only(vma);
 
 	lockdep_assert_held(&vm->lock);
 	XE_BUG_ON(!xe_vma_is_userptr(vma));
 retry:
-	if (vma->destroyed)
+	if (vma->gpuva.flags & XE_VMA_DESTROYED)
 		return 0;
 
 	notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
@@ -94,7 +91,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	}
 
 	while (pinned < num_pages) {
-		ret = get_user_pages_fast(vma->userptr.ptr + pinned * PAGE_SIZE,
+		ret = get_user_pages_fast(xe_vma_userptr(vma) +
+					  pinned * PAGE_SIZE,
 					  num_pages - pinned,
 					  read_only ? 0 : FOLL_WRITE,
 					  &pages[pinned]);
@@ -295,7 +293,7 @@ void xe_vm_fence_all_extobjs(struct xe_vm *vm, struct dma_fence *fence,
 	struct xe_vma *vma;
 
 	list_for_each_entry(vma, &vm->extobj.list, extobj.link)
-		dma_resv_add_fence(vma->bo->ttm.base.resv, fence, usage);
+		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence, usage);
 }
 
 static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
@@ -444,7 +442,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	INIT_LIST_HEAD(objs);
 	list_for_each_entry(vma, &vm->extobj.list, extobj.link) {
 		tv_bo->num_shared = num_shared;
-		tv_bo->bo = &vma->bo->ttm;
+		tv_bo->bo = &xe_vma_bo(vma)->ttm;
 
 		list_add_tail(&tv_bo->head, objs);
 		tv_bo++;
@@ -459,10 +457,10 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	spin_lock(&vm->notifier.list_lock);
 	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
 				 notifier.rebind_link) {
-		xe_bo_assert_held(vma->bo);
+		xe_bo_assert_held(xe_vma_bo(vma));
 
 		list_del_init(&vma->notifier.rebind_link);
-		if (vma->gt_present && !vma->destroyed)
+		if (vma->gt_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
 			list_move_tail(&vma->rebind_link, &vm->rebind_list);
 	}
 	spin_unlock(&vm->notifier.list_lock);
@@ -583,10 +581,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		goto out_unlock;
 
 	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
-		if (xe_vma_is_userptr(vma) || vma->destroyed)
+		if (xe_vma_is_userptr(vma) ||
+		    vma->gpuva.flags & XE_VMA_DESTROYED)
 			continue;
 
-		err = xe_bo_validate(vma->bo, vm, false);
+		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
 		if (err)
 			goto out_unlock;
 	}
@@ -645,17 +644,12 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
-struct async_op_fence;
-static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
-			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence);
-
 static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 				   const struct mmu_notifier_range *range,
 				   unsigned long cur_seq)
 {
 	struct xe_vma *vma = container_of(mni, struct xe_vma, userptr.notifier);
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	long err;
@@ -679,7 +673,8 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	 * Tell exec and rebind worker they need to repin and rebind this
 	 * userptr.
 	 */
-	if (!xe_vm_in_fault_mode(vm) && !vma->destroyed && vma->gt_present) {
+	if (!xe_vm_in_fault_mode(vm) &&
+	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->gt_present) {
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_move_tail(&vma->userptr.invalidate_link,
 			       &vm->userptr.invalidated);
@@ -784,7 +779,8 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
 
 static struct dma_fence *
 xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
-	       struct xe_sync_entry *syncs, u32 num_syncs);
+	       struct xe_sync_entry *syncs, u32 num_syncs,
+	       bool first_op, bool last_op);
 
 struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 {
@@ -805,7 +801,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 			trace_xe_vma_rebind_worker(vma);
 		else
 			trace_xe_vma_rebind_exec(vma);
-		fence = xe_vm_bind_vma(vma, NULL, NULL, 0);
+		fence = xe_vm_bind_vma(vma, NULL, NULL, 0, false, false);
 		if (IS_ERR(fence))
 			return fence;
 	}
@@ -833,6 +829,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		return vma;
 	}
 
+	/* FIXME: Way to many lists, should be able to reduce this */
 	INIT_LIST_HEAD(&vma->rebind_link);
 	INIT_LIST_HEAD(&vma->unbind_link);
 	INIT_LIST_HEAD(&vma->userptr_link);
@@ -840,11 +837,12 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	INIT_LIST_HEAD(&vma->notifier.rebind_link);
 	INIT_LIST_HEAD(&vma->extobj.link);
 
-	vma->vm = vm;
-	vma->start = start;
-	vma->end = end;
+	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
+	vma->gpuva.mgr = &vm->mgr;
+	vma->gpuva.va.addr = start;
+	vma->gpuva.va.range = end - start + 1;
 	if (read_only)
-		vma->pte_flags = XE_PTE_READ_ONLY;
+		vma->gpuva.flags |= XE_VMA_READ_ONLY;
 
 	if (gt_mask) {
 		vma->gt_mask = gt_mask;
@@ -855,22 +853,24 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	}
 
 	if (vm->xe->info.platform == XE_PVC)
-		vma->use_atomic_access_pte_bit = true;
+		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
 	if (bo) {
 		xe_bo_assert_held(bo);
-		vma->bo_offset = bo_offset_or_userptr;
-		vma->bo = xe_bo_get(bo);
-		list_add_tail(&vma->bo_link, &bo->vmas);
+
+		drm_gem_object_get(&bo->ttm.base);
+		vma->gpuva.gem.obj = &bo->ttm.base;
+		vma->gpuva.gem.offset = bo_offset_or_userptr;
+		drm_gpuva_link(&vma->gpuva);
 	} else /* userptr */ {
 		u64 size = end - start + 1;
 		int err;
 
-		vma->userptr.ptr = bo_offset_or_userptr;
+		vma->gpuva.gem.offset = bo_offset_or_userptr;
 
 		err = mmu_interval_notifier_insert(&vma->userptr.notifier,
 						   current->mm,
-						   vma->userptr.ptr, size,
+						   xe_vma_userptr(vma), size,
 						   &vma_userptr_notifier_ops);
 		if (err) {
 			kfree(vma);
@@ -888,16 +888,16 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 static void vm_remove_extobj(struct xe_vma *vma)
 {
 	if (!list_empty(&vma->extobj.link)) {
-		vma->vm->extobj.entries--;
+		xe_vma_vm(vma)->extobj.entries--;
 		list_del_init(&vma->extobj.link);
 	}
 }
 
 static void xe_vma_destroy_late(struct xe_vma *vma)
 {
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
-	bool read_only = vma->pte_flags & XE_PTE_READ_ONLY;
+	bool read_only = xe_vma_read_only(vma);
 
 	if (xe_vma_is_userptr(vma)) {
 		if (vma->userptr.sg) {
@@ -917,7 +917,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 		mmu_interval_notifier_remove(&vma->userptr.notifier);
 		xe_vm_put(vm);
 	} else {
-		xe_bo_put(vma->bo);
+		xe_bo_put(xe_vma_bo(vma));
 	}
 
 	kfree(vma);
@@ -942,21 +942,22 @@ static void vma_destroy_cb(struct dma_fence *fence,
 
 static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 {
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 
 	lockdep_assert_held_write(&vm->lock);
 	XE_BUG_ON(!list_empty(&vma->unbind_link));
 
 	if (xe_vma_is_userptr(vma)) {
-		XE_WARN_ON(!vma->destroyed);
+		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
+
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_del_init(&vma->userptr.invalidate_link);
 		spin_unlock(&vm->userptr.invalidated_lock);
 		list_del(&vma->userptr_link);
 	} else {
-		xe_bo_assert_held(vma->bo);
-		list_del(&vma->bo_link);
-		if (!vma->bo->vm)
+		xe_bo_assert_held(xe_vma_bo(vma));
+		drm_gpuva_unlink(&vma->gpuva);
+		if (!xe_vma_bo(vma)->vm)
 			vm_remove_extobj(vma);
 	}
 
@@ -981,13 +982,13 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
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
@@ -1004,77 +1005,63 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 		xe_bo_put(bo);
 }
 
-static struct xe_vma *to_xe_vma(const struct rb_node *node)
-{
-	BUILD_BUG_ON(offsetof(struct xe_vma, vm_node) != 0);
-	return (struct xe_vma *)node;
-}
-
-static int xe_vma_cmp(const struct xe_vma *a, const struct xe_vma *b)
-{
-	if (a->end < b->start) {
-		return -1;
-	} else if (b->end < a->start) {
-		return 1;
-	} else {
-		return 0;
-	}
-}
-
-static bool xe_vma_less_cb(struct rb_node *a, const struct rb_node *b)
-{
-	return xe_vma_cmp(to_xe_vma(a), to_xe_vma(b)) < 0;
-}
-
-int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node)
-{
-	struct xe_vma *cmp = to_xe_vma(node);
-	const struct xe_vma *own = key;
-
-	if (own->start > cmp->end)
-		return 1;
-
-	if (own->end < cmp->start)
-		return -1;
-
-	return 0;
-}
-
 struct xe_vma *
-xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma)
+xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
 {
-	struct rb_node *node;
+	struct drm_gpuva *gpuva;
 
 	if (xe_vm_is_closed(vm))
 		return NULL;
 
-	XE_BUG_ON(vma->end >= vm->size);
+	XE_BUG_ON(start + range > vm->size);
 	lockdep_assert_held(&vm->lock);
 
-	node = rb_find(vma, &vm->vmas, xe_vma_cmp_vma_cb);
+	gpuva = drm_gpuva_find_first(&vm->mgr, start, range);
 
-	return node ? to_xe_vma(node) : NULL;
+	return gpuva ? gpuva_to_vma(gpuva) : NULL;
 }
 
-static void xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
+static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
-	XE_BUG_ON(vma->vm != vm);
+	int err;
+
+	XE_BUG_ON(xe_vma_vm(vma) != vm);
 	lockdep_assert_held(&vm->lock);
 
-	rb_add(&vma->vm_node, &vm->vmas, xe_vma_less_cb);
+	err = drm_gpuva_insert(&vm->mgr, &vma->gpuva);
+	XE_WARN_ON(err);	/* Shouldn't be possible */
+
+	return err;
 }
 
-static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
+static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma, bool remove)
 {
-	XE_BUG_ON(vma->vm != vm);
+	XE_BUG_ON(xe_vma_vm(vma) != vm);
 	lockdep_assert_held(&vm->lock);
 
-	rb_erase(&vma->vm_node, &vm->vmas);
+	if (remove)
+		drm_gpuva_remove(&vma->gpuva);
 	if (vm->usm.last_fault_vma == vma)
 		vm->usm.last_fault_vma = NULL;
 }
 
-static void async_op_work_func(struct work_struct *w);
+static struct drm_gpuva_op *xe_vm_op_alloc(void)
+{
+	struct xe_vma_op *op;
+
+	op = kzalloc(sizeof(*op), GFP_KERNEL);
+
+	if (unlikely(!op))
+		return NULL;
+
+	return &op->base;
+}
+
+static struct drm_gpuva_fn_ops gpuva_ops = {
+	.op_alloc = xe_vm_op_alloc,
+};
+
+static void xe_vma_op_work_func(struct work_struct *w);
 static void vm_destroy_work_func(struct work_struct *w);
 
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
@@ -1094,7 +1081,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 
 	vm->size = 1ull << xe_pt_shift(xe->info.vm_max_level + 1);
 
-	vm->vmas = RB_ROOT;
 	vm->flags = flags;
 
 	init_rwsem(&vm->lock);
@@ -1110,7 +1096,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	spin_lock_init(&vm->notifier.list_lock);
 
 	INIT_LIST_HEAD(&vm->async_ops.pending);
-	INIT_WORK(&vm->async_ops.work, async_op_work_func);
+	INIT_WORK(&vm->async_ops.work, xe_vma_op_work_func);
 	spin_lock_init(&vm->async_ops.lock);
 
 	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
@@ -1130,6 +1116,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (err)
 		goto err_put;
 
+	drm_gpuva_manager_init(&vm->mgr, "Xe VM", 0, vm->size, 0, 0,
+			       &gpuva_ops);
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAGS_64K;
 
@@ -1235,6 +1223,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 	}
 	dma_resv_unlock(&vm->resv);
+	drm_gpuva_manager_destroy(&vm->mgr);
 err_put:
 	dma_resv_fini(&vm->resv);
 	kfree(vm);
@@ -1284,14 +1273,19 @@ static void vm_error_capture(struct xe_vm *vm, int err,
 
 void xe_vm_close_and_put(struct xe_vm *vm)
 {
-	struct rb_root contested = RB_ROOT;
+	struct list_head contested;
 	struct ww_acquire_ctx ww;
 	struct xe_device *xe = vm->xe;
 	struct xe_gt *gt;
+	struct xe_vma *vma, *next_vma;
+	struct drm_gpuva *gpuva;
+	DRM_GPUVA_ITER(it, &vm->mgr, 0);
 	u8 id;
 
 	XE_BUG_ON(vm->preempt.num_engines);
 
+	INIT_LIST_HEAD(&contested);
+
 	vm->size = 0;
 	smp_mb();
 	flush_async_ops(vm);
@@ -1308,24 +1302,25 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 
 	down_write(&vm->lock);
 	xe_vm_lock(vm, &ww, 0, false);
-	while (vm->vmas.rb_node) {
-		struct xe_vma *vma = to_xe_vma(vm->vmas.rb_node);
+	drm_gpuva_iter_for_each(gpuva, it) {
+		vma = gpuva_to_vma(gpuva);
 
 		if (xe_vma_is_userptr(vma)) {
 			down_read(&vm->userptr.notifier_lock);
-			vma->destroyed = true;
+			vma->gpuva.flags |= XE_VMA_DESTROYED;
 			up_read(&vm->userptr.notifier_lock);
 		}
 
-		rb_erase(&vma->vm_node, &vm->vmas);
+		xe_vm_remove_vma(vm, vma, false);
+		drm_gpuva_iter_remove(&it);
 
 		/* easy case, remove from VMA? */
-		if (xe_vma_is_userptr(vma) || vma->bo->vm) {
+		if (xe_vma_is_userptr(vma) || xe_vma_bo(vma)->vm) {
 			xe_vma_destroy(vma, NULL);
 			continue;
 		}
 
-		rb_add(&vma->vm_node, &contested, xe_vma_less_cb);
+		list_add_tail(&vma->unbind_link, &contested);
 	}
 
 	/*
@@ -1348,19 +1343,14 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 	xe_vm_unlock(vm, &ww);
 
-	if (contested.rb_node) {
-
-		/*
-		 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
-		 * Since we hold a refcount to the bo, we can remove and free
-		 * the members safely without locking.
-		 */
-		while (contested.rb_node) {
-			struct xe_vma *vma = to_xe_vma(contested.rb_node);
-
-			rb_erase(&vma->vm_node, &contested);
-			xe_vma_destroy_unlocked(vma);
-		}
+	/*
+	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
+	 * Since we hold a refcount to the bo, we can remove and free
+	 * the members safely without locking.
+	 */
+	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
+		list_del_init(&vma->unbind_link);
+		xe_vma_destroy_unlocked(vma);
 	}
 
 	if (vm->async_ops.error_capture.addr)
@@ -1369,6 +1359,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	XE_WARN_ON(!list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
+	drm_gpuva_manager_destroy(&vm->mgr);
+
 	mutex_lock(&xe->usm.lock);
 	if (vm->flags & XE_VM_FLAG_FAULT_MODE)
 		xe->usm.num_vm_in_fault_mode--;
@@ -1456,13 +1448,14 @@ u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_gt *full_gt)
 
 static struct dma_fence *
 xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
-		 struct xe_sync_entry *syncs, u32 num_syncs)
+		 struct xe_sync_entry *syncs, u32 num_syncs,
+		 bool first_op, bool last_op)
 {
 	struct xe_gt *gt;
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
 	int number_gts = hweight_long(vma->gt_present);
 	int err;
@@ -1483,7 +1476,8 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 
 		XE_BUG_ON(xe_gt_is_media_type(gt));
 
-		fence = __xe_pt_unbind_vma(gt, vma, e, syncs, num_syncs);
+		fence = __xe_pt_unbind_vma(gt, vma, e, first_op ? syncs : NULL,
+					   first_op ? num_syncs : 0);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			goto err_fences;
@@ -1509,7 +1503,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 		}
 	}
 
-	for (i = 0; i < num_syncs; i++)
+	for (i = 0; last_op && i < num_syncs; i++)
 		xe_sync_entry_signal(&syncs[i], NULL, cf ? &cf->base : fence);
 
 	return cf ? &cf->base : !fence ? dma_fence_get_stub() : fence;
@@ -1528,13 +1522,14 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 
 static struct dma_fence *
 xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
-	       struct xe_sync_entry *syncs, u32 num_syncs)
+	       struct xe_sync_entry *syncs, u32 num_syncs,
+	       bool first_op, bool last_op)
 {
 	struct xe_gt *gt;
 	struct dma_fence *fence;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
-	struct xe_vm *vm = vma->vm;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	int cur_fence = 0, i;
 	int number_gts = hweight_long(vma->gt_mask);
 	int err;
@@ -1554,7 +1549,8 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 			goto next;
 
 		XE_BUG_ON(xe_gt_is_media_type(gt));
-		fence = __xe_pt_bind_vma(gt, vma, e, syncs, num_syncs,
+		fence = __xe_pt_bind_vma(gt, vma, e, first_op ? syncs : NULL,
+					 first_op ? num_syncs : 0,
 					 vma->gt_present & BIT(id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
@@ -1581,7 +1577,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 		}
 	}
 
-	for (i = 0; i < num_syncs; i++)
+	for (i = 0; last_op && i < num_syncs; i++)
 		xe_sync_entry_signal(&syncs[i], NULL, cf ? &cf->base : fence);
 
 	return cf ? &cf->base : fence;
@@ -1680,15 +1676,27 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence)
 
 static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence)
+			u32 num_syncs, struct async_op_fence *afence,
+			bool immediate, bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 
 	xe_vm_assert_held(vm);
 
-	fence = xe_vm_bind_vma(vma, e, syncs, num_syncs);
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
+	if (immediate) {
+		fence = xe_vm_bind_vma(vma, e, syncs, num_syncs, first_op,
+				       last_op);
+		if (IS_ERR(fence))
+			return PTR_ERR(fence);
+	} else {
+		int i;
+
+		XE_BUG_ON(!xe_vm_in_fault_mode(vm));
+
+		fence = dma_fence_get_stub();
+		for (i = 0; last_op && i < num_syncs; i++)
+			xe_sync_entry_signal(&syncs[i], NULL, fence);
+	}
 	if (afence)
 		add_async_op_fence_cb(vm, fence, afence);
 
@@ -1698,32 +1706,35 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 
 static int xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma, struct xe_engine *e,
 		      struct xe_bo *bo, struct xe_sync_entry *syncs,
-		      u32 num_syncs, struct async_op_fence *afence)
+		      u32 num_syncs, struct async_op_fence *afence,
+		      bool immediate, bool first_op, bool last_op)
 {
 	int err;
 
 	xe_vm_assert_held(vm);
 	xe_bo_assert_held(bo);
 
-	if (bo) {
+	if (bo && immediate) {
 		err = xe_bo_validate(bo, vm, true);
 		if (err)
 			return err;
 	}
 
-	return __xe_vm_bind(vm, vma, e, syncs, num_syncs, afence);
+	return __xe_vm_bind(vm, vma, e, syncs, num_syncs, afence, immediate,
+			    first_op, last_op);
 }
 
 static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
 			struct xe_engine *e, struct xe_sync_entry *syncs,
-			u32 num_syncs, struct async_op_fence *afence)
+			u32 num_syncs, struct async_op_fence *afence,
+			bool first_op, bool last_op)
 {
 	struct dma_fence *fence;
 
 	xe_vm_assert_held(vm);
-	xe_bo_assert_held(vma->bo);
+	xe_bo_assert_held(xe_vma_bo(vma));
 
-	fence = xe_vm_unbind_vma(vma, e, syncs, num_syncs);
+	fence = xe_vm_unbind_vma(vma, e, syncs, num_syncs, first_op, last_op);
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
 	if (afence)
@@ -1946,26 +1957,27 @@ static const u32 region_to_mem_type[] = {
 static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 			  struct xe_engine *e, u32 region,
 			  struct xe_sync_entry *syncs, u32 num_syncs,
-			  struct async_op_fence *afence)
+			  struct async_op_fence *afence, bool first_op,
+			  bool last_op)
 {
 	int err;
 
 	XE_BUG_ON(region > ARRAY_SIZE(region_to_mem_type));
 
 	if (!xe_vma_is_userptr(vma)) {
-		err = xe_bo_migrate(vma->bo, region_to_mem_type[region]);
+		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
 		if (err)
 			return err;
 	}
 
 	if (vma->gt_mask != (vma->gt_present & ~vma->usm.gt_invalidated)) {
-		return xe_vm_bind(vm, vma, e, vma->bo, syncs, num_syncs,
-				  afence);
+		return xe_vm_bind(vm, vma, e, xe_vma_bo(vma), syncs, num_syncs,
+				  afence, true, first_op, last_op);
 	} else {
 		int i;
 
 		/* Nothing to do, signal fences now */
-		for (i = 0; i < num_syncs; i++)
+		for (i = 0; last_op && i < num_syncs; i++)
 			xe_sync_entry_signal(&syncs[i], NULL,
 					     dma_fence_get_stub());
 		if (afence)
@@ -1976,29 +1988,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 
 #define VM_BIND_OP(op)	(op & 0xffff)
 
-static int __vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
-			   struct xe_engine *e, struct xe_bo *bo, u32 op,
-			   u32 region, struct xe_sync_entry *syncs,
-			   u32 num_syncs, struct async_op_fence *afence)
-{
-	switch (VM_BIND_OP(op)) {
-	case XE_VM_BIND_OP_MAP:
-		return xe_vm_bind(vm, vma, e, bo, syncs, num_syncs, afence);
-	case XE_VM_BIND_OP_UNMAP:
-	case XE_VM_BIND_OP_UNMAP_ALL:
-		return xe_vm_unbind(vm, vma, e, syncs, num_syncs, afence);
-	case XE_VM_BIND_OP_MAP_USERPTR:
-		return xe_vm_bind(vm, vma, e, NULL, syncs, num_syncs, afence);
-	case XE_VM_BIND_OP_PREFETCH:
-		return xe_vm_prefetch(vm, vma, e, region, syncs, num_syncs,
-				      afence);
-		break;
-	default:
-		XE_BUG_ON("NOT POSSIBLE");
-		return -EINVAL;
-	}
-}
-
 struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
 {
 	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
@@ -2014,836 +2003,847 @@ static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
 	tv->bo = xe_vm_ttm_bo(vm);
 }
 
-static bool is_map_op(u32 op)
+static void vm_set_async_error(struct xe_vm *vm, int err)
 {
-	return VM_BIND_OP(op) == XE_VM_BIND_OP_MAP ||
-		VM_BIND_OP(op) == XE_VM_BIND_OP_MAP_USERPTR;
+	lockdep_assert_held(&vm->lock);
+	vm->async_ops.error = err;
 }
 
-static bool is_unmap_op(u32 op)
+static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
+				 struct xe_vma *ignore)
 {
-	return VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP ||
-		VM_BIND_OP(op) == XE_VM_BIND_OP_UNMAP_ALL;
+	struct ww_acquire_ctx ww;
+	struct drm_gpuva *gpuva;
+	struct drm_gem_object *obj = &bo->ttm.base;
+	bool ret = false;
+
+	xe_bo_lock(bo, &ww, 0, false);
+	drm_gem_for_each_gpuva(gpuva, obj) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
+
+		if (vma != ignore && xe_vma_vm(vma) == vm &&
+		    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
+			ret = true;
+			break;
+		}
+	}
+	xe_bo_unlock(bo, &ww);
+
+	return ret;
 }
 
-static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
-			 struct xe_engine *e, struct xe_bo *bo,
-			 struct drm_xe_vm_bind_op *bind_op,
-			 struct xe_sync_entry *syncs, u32 num_syncs,
-			 struct async_op_fence *afence)
+static int vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
 {
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-	struct ttm_validate_buffer tv_bo, tv_vm;
-	struct ww_acquire_ctx ww;
-	struct xe_bo *vbo;
-	int err, i;
+	struct xe_bo *bo = xe_vma_bo(vma);
 
-	lockdep_assert_held(&vm->lock);
-	XE_BUG_ON(!list_empty(&vma->unbind_link));
+	lockdep_assert_held_write(&vm->lock);
 
-	/* Binds deferred to faults, signal fences now */
-	if (xe_vm_in_fault_mode(vm) && is_map_op(bind_op->op) &&
-	    !(bind_op->op & XE_VM_BIND_FLAG_IMMEDIATE)) {
-		for (i = 0; i < num_syncs; i++)
-			xe_sync_entry_signal(&syncs[i], NULL,
-					     dma_fence_get_stub());
-		if (afence)
-			dma_fence_signal(&afence->fence);
+	if (bo_has_vm_references(bo, vm, vma))
 		return 0;
-	}
 
-	xe_vm_tv_populate(vm, &tv_vm);
-	list_add_tail(&tv_vm.head, &objs);
-	vbo = vma->bo;
-	if (vbo) {
-		/*
-		 * An unbind can drop the last reference to the BO and
-		 * the BO is needed for ttm_eu_backoff_reservation so
-		 * take a reference here.
-		 */
-		xe_bo_get(vbo);
+	list_add(&vma->extobj.link, &vm->extobj.list);
+	vm->extobj.entries++;
 
-		if (!vbo->vm) {
-			tv_bo.bo = &vbo->ttm;
-			tv_bo.num_shared = 1;
-			list_add(&tv_bo.head, &objs);
-		}
-	}
+	return 0;
+}
 
-again:
-	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
-	if (!err) {
-		err = __vm_bind_ioctl(vm, vma, e, bo,
-				      bind_op->op, bind_op->region, syncs,
-				      num_syncs, afence);
-		ttm_eu_backoff_reservation(&ww, &objs);
-		if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
-			lockdep_assert_held_write(&vm->lock);
-			err = xe_vma_userptr_pin_pages(vma);
-			if (!err)
-				goto again;
-		}
+static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
+				    u64 addr, u64 range, u32 op)
+{
+	struct xe_device *xe = vm->xe;
+	struct xe_vma *vma;
+	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
+
+	lockdep_assert_held(&vm->lock);
+
+	switch (VM_BIND_OP(op)) {
+	case XE_VM_BIND_OP_MAP:
+	case XE_VM_BIND_OP_MAP_USERPTR:
+		vma = xe_vm_find_overlapping_vma(vm, addr, range);
+		if (XE_IOCTL_ERR(xe, vma && !async))
+			return -EBUSY;
+		break;
+	case XE_VM_BIND_OP_UNMAP:
+	case XE_VM_BIND_OP_PREFETCH:
+		vma = xe_vm_find_overlapping_vma(vm, addr, range);
+		if (XE_IOCTL_ERR(xe, !vma) ||
+		    XE_IOCTL_ERR(xe, (xe_vma_start(vma) != addr ||
+				 xe_vma_end(vma) != addr + range) && !async))
+			return -EINVAL;
+		break;
+	case XE_VM_BIND_OP_UNMAP_ALL:
+		if (XE_IOCTL_ERR(xe, list_empty(&bo->ttm.base.gpuva.list)))
+			return -ENODATA;
+		break;
+	default:
+		XE_BUG_ON("NOT POSSIBLE");
+		return -EINVAL;
 	}
-	xe_bo_put(vbo);
 
-	return err;
+	return 0;
 }
 
-struct async_op {
-	struct xe_vma *vma;
-	struct xe_engine *engine;
-	struct xe_bo *bo;
-	struct drm_xe_vm_bind_op bind_op;
-	struct xe_sync_entry *syncs;
-	u32 num_syncs;
-	struct list_head link;
-	struct async_op_fence *fence;
-};
-
-static void async_op_cleanup(struct xe_vm *vm, struct async_op *op)
+static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
+			     bool post_commit)
 {
-	while (op->num_syncs--)
-		xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
-	kfree(op->syncs);
-	xe_bo_put(op->bo);
-	if (op->engine)
-		xe_engine_put(op->engine);
-	xe_vm_put(vm);
-	if (op->fence)
-		dma_fence_put(&op->fence->fence);
-	kfree(op);
+	down_read(&vm->userptr.notifier_lock);
+	vma->gpuva.flags |= XE_VMA_DESTROYED;
+	up_read(&vm->userptr.notifier_lock);
+	if (post_commit)
+		xe_vm_remove_vma(vm, vma, true);
 }
 
-static struct async_op *next_async_op(struct xe_vm *vm)
+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
+static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 {
-	return list_first_entry_or_null(&vm->async_ops.pending,
-					struct async_op, link);
-}
+	struct xe_vma *vma;
 
-static void vm_set_async_error(struct xe_vm *vm, int err)
+	switch (op->op) {
+	case DRM_GPUVA_OP_MAP:
+		vm_dbg(&xe->drm, "MAP: addr=0x%016llx, range=0x%016llx",
+		       op->map.va.addr, op->map.va.range);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		vma = gpuva_to_vma(op->remap.unmap->va);
+		vm_dbg(&xe->drm, "REMAP:UNMAP: addr=0x%016llx, range=0x%016llx, keep=%d",
+		       xe_vma_start(vma), xe_vma_size(vma),
+		       op->unmap.keep ? 1 : 0);
+		if (op->remap.prev)
+			vm_dbg(&xe->drm,
+			       "REMAP:PREV: addr=0x%016llx, range=0x%016llx",
+			       op->remap.prev->va.addr,
+			       op->remap.prev->va.range);
+		if (op->remap.next)
+			vm_dbg(&xe->drm,
+			       "REMAP:NEXT: addr=0x%016llx, range=0x%016llx",
+			       op->remap.next->va.addr,
+			       op->remap.next->va.range);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		vma = gpuva_to_vma(op->unmap.va);
+		vm_dbg(&xe->drm, "UNMAP: addr=0x%016llx, range=0x%016llx, keep=%d",
+		       xe_vma_start(vma), xe_vma_size(vma),
+		       op->unmap.keep ? 1 : 0);
+		break;
+	default:
+		XE_BUG_ON("NOT_POSSIBLE");
+	}
+}
+#else
+static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 {
-	lockdep_assert_held(&vm->lock);
-	vm->async_ops.error = err;
 }
+#endif
 
-static void async_op_work_func(struct work_struct *w)
+/*
+ * Create operations list from IOCTL arguments, setup operations fields so parse
+ * and commit steps are decoupled from IOCTL arguments. This step can fail.
+ */
+static struct drm_gpuva_ops *
+vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
+			 u64 bo_offset_or_userptr, u64 addr, u64 range,
+			 u32 operation, u64 gt_mask, u32 region)
 {
-	struct xe_vm *vm = container_of(w, struct xe_vm, async_ops.work);
-
-	for (;;) {
-		struct async_op *op;
-		int err;
-
-		if (vm->async_ops.error && !xe_vm_is_closed(vm))
-			break;
+	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
+	struct ww_acquire_ctx ww;
+	struct drm_gpuva_ops *ops;
+	struct drm_gpuva_op *__op;
+	struct xe_vma_op *op;
+	int err;
 
-		spin_lock_irq(&vm->async_ops.lock);
-		op = next_async_op(vm);
-		if (op)
-			list_del_init(&op->link);
-		spin_unlock_irq(&vm->async_ops.lock);
+	lockdep_assert_held_write(&vm->lock);
 
-		if (!op)
-			break;
+	vm_dbg(&vm->xe->drm,
+	       "op=%d, addr=0x%016llx, range=0x%016llx, bo_offset_or_userptr=0x%016llx",
+	       VM_BIND_OP(operation), addr, range, bo_offset_or_userptr);
 
-		if (!xe_vm_is_closed(vm)) {
-			bool first, last;
+	switch (VM_BIND_OP(operation)) {
+	case XE_VM_BIND_OP_MAP:
+	case XE_VM_BIND_OP_MAP_USERPTR:
+		ops = drm_gpuva_sm_map_ops_create(&vm->mgr, addr, range,
+						  obj, bo_offset_or_userptr);
+		drm_gpuva_for_each_op(__op, ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-			down_write(&vm->lock);
-again:
-			first = op->vma->first_munmap_rebind;
-			last = op->vma->last_munmap_rebind;
-#ifdef TEST_VM_ASYNC_OPS_ERROR
-#define FORCE_ASYNC_OP_ERROR	BIT(31)
-			if (!(op->bind_op.op & FORCE_ASYNC_OP_ERROR)) {
-				err = vm_bind_ioctl(vm, op->vma, op->engine,
-						    op->bo, &op->bind_op,
-						    op->syncs, op->num_syncs,
-						    op->fence);
-			} else {
-				err = -ENOMEM;
-				op->bind_op.op &= ~FORCE_ASYNC_OP_ERROR;
-			}
-#else
-			err = vm_bind_ioctl(vm, op->vma, op->engine, op->bo,
-					    &op->bind_op, op->syncs,
-					    op->num_syncs, op->fence);
-#endif
-			/*
-			 * In order for the fencing to work (stall behind
-			 * existing jobs / prevent new jobs from running) all
-			 * the dma-resv slots need to be programmed in a batch
-			 * relative to execs / the rebind worker. The vm->lock
-			 * ensure this.
-			 */
-			if (!err && ((first && VM_BIND_OP(op->bind_op.op) ==
-				      XE_VM_BIND_OP_UNMAP) ||
-				     vm->async_ops.munmap_rebind_inflight)) {
-				if (last) {
-					op->vma->last_munmap_rebind = false;
-					vm->async_ops.munmap_rebind_inflight =
-						false;
-				} else {
-					vm->async_ops.munmap_rebind_inflight =
-						true;
-
-					async_op_cleanup(vm, op);
-
-					spin_lock_irq(&vm->async_ops.lock);
-					op = next_async_op(vm);
-					XE_BUG_ON(!op);
-					list_del_init(&op->link);
-					spin_unlock_irq(&vm->async_ops.lock);
-
-					goto again;
-				}
-			}
-			if (err) {
-				trace_xe_vma_fail(op->vma);
-				drm_warn(&vm->xe->drm, "Async VM op(%d) failed with %d",
-					 VM_BIND_OP(op->bind_op.op),
-					 err);
+			op->gt_mask = gt_mask;
+			op->map.immediate =
+				operation & XE_VM_BIND_FLAG_IMMEDIATE;
+			op->map.read_only =
+				operation & XE_VM_BIND_FLAG_READONLY;
+		}
+		break;
+	case XE_VM_BIND_OP_UNMAP:
+		ops = drm_gpuva_sm_unmap_ops_create(&vm->mgr, addr, range);
+		drm_gpuva_for_each_op(__op, ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-				spin_lock_irq(&vm->async_ops.lock);
-				list_add(&op->link, &vm->async_ops.pending);
-				spin_unlock_irq(&vm->async_ops.lock);
+			op->gt_mask = gt_mask;
+		}
+		break;
+	case XE_VM_BIND_OP_PREFETCH:
+		ops = drm_gpuva_prefetch_ops_create(&vm->mgr, addr, range);
+		drm_gpuva_for_each_op(__op, ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-				vm_set_async_error(vm, err);
-				up_write(&vm->lock);
+			op->gt_mask = gt_mask;
+			op->prefetch.region = region;
+		}
+		break;
+	case XE_VM_BIND_OP_UNMAP_ALL:
+		XE_BUG_ON(!bo);
 
-				if (vm->async_ops.error_capture.addr)
-					vm_error_capture(vm, err,
-							 op->bind_op.op,
-							 op->bind_op.addr,
-							 op->bind_op.range);
-				break;
-			}
-			up_write(&vm->lock);
-		} else {
-			trace_xe_vma_flush(op->vma);
+		err = xe_bo_lock(bo, &ww, 0, true);
+		if (err)
+			return ERR_PTR(err);
+		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
+		xe_bo_unlock(bo, &ww);
 
-			if (is_unmap_op(op->bind_op.op)) {
-				down_write(&vm->lock);
-				xe_vma_destroy_unlocked(op->vma);
-				up_write(&vm->lock);
-			}
+		drm_gpuva_for_each_op(__op, ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 
-			if (op->fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-						   &op->fence->fence.flags)) {
-				if (!xe_vm_no_dma_fences(vm)) {
-					op->fence->started = true;
-					smp_wmb();
-					wake_up_all(&op->fence->wq);
-				}
-				dma_fence_signal(&op->fence->fence);
-			}
+			op->gt_mask = gt_mask;
 		}
+		break;
+	default:
+		XE_BUG_ON("NOT POSSIBLE");
+		ops = ERR_PTR(-EINVAL);
+	}
 
-		async_op_cleanup(vm, op);
+#ifdef TEST_VM_ASYNC_OPS_ERROR
+	if (operation & FORCE_ASYNC_OP_ERROR) {
+		op = list_first_entry_or_null(&ops->list, struct xe_vma_op,
+					      base.entry);
+		if (op)
+			op->inject_error = true;
 	}
+#endif
+
+	if (!IS_ERR(ops))
+		drm_gpuva_for_each_op(__op, ops)
+			print_op(vm->xe, __op);
+
+	return ops;
 }
 
-static int __vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
-				 struct xe_engine *e, struct xe_bo *bo,
-				 struct drm_xe_vm_bind_op *bind_op,
-				 struct xe_sync_entry *syncs, u32 num_syncs)
+static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
+			      u64 gt_mask, bool read_only)
 {
-	struct async_op *op;
-	bool installed = false;
-	u64 seqno;
-	int i;
+	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
+	struct xe_vma *vma;
+	struct ww_acquire_ctx ww;
+	int err;
 
-	lockdep_assert_held(&vm->lock);
+	lockdep_assert_held_write(&vm->lock);
 
-	op = kmalloc(sizeof(*op), GFP_KERNEL);
-	if (!op) {
-		return -ENOMEM;
+	if (bo) {
+		err = xe_bo_lock(bo, &ww, 0, true);
+		if (err)
+			return ERR_PTR(err);
 	}
-
-	if (num_syncs) {
-		op->fence = kmalloc(sizeof(*op->fence), GFP_KERNEL);
-		if (!op->fence) {
-			kfree(op);
-			return -ENOMEM;
+	vma = xe_vma_create(vm, bo, op->gem.offset,
+			    op->va.addr, op->va.addr +
+			    op->va.range - 1, read_only,
+			    gt_mask);
+	if (bo)
+		xe_bo_unlock(bo, &ww);
+
+	if (xe_vma_is_userptr(vma)) {
+		err = xe_vma_userptr_pin_pages(vma);
+		if (err) {
+			xe_vma_destroy(vma, NULL);
+			return ERR_PTR(err);
+		}
+	} else if(!bo->vm) {
+		vm_insert_extobj(vm, vma);
+		err = add_preempt_fences(vm, bo);
+		if (err) {
+			xe_vma_destroy(vma, NULL);
+			return ERR_PTR(err);
 		}
+	}
+
+	return vma;
+}
+
+/*
+ * Parse operations list and create any resources needed for the operations
+ * prior to fully commiting to the operations. This setp can fail.
+ */
+static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
+				   struct drm_gpuva_ops **ops, int num_ops_list,
+				   struct xe_sync_entry *syncs, u32 num_syncs,
+				   struct list_head *ops_list, bool async)
+{
+	struct xe_vma_op *last_op = NULL;
+	struct list_head *async_list = NULL;
+	struct async_op_fence *fence = NULL;
+	int err, i;
+
+	lockdep_assert_held_write(&vm->lock);
+	XE_BUG_ON(num_ops_list > 1 && !async);
+
+	if (num_syncs && async) {
+		u64 seqno;
+
+		fence = kmalloc(sizeof(*fence), GFP_KERNEL);
+		if (!fence)
+			return -ENOMEM;
 
 		seqno = e ? ++e->bind.fence_seqno : ++vm->async_ops.fence.seqno;
-		dma_fence_init(&op->fence->fence, &async_op_fence_ops,
+		dma_fence_init(&fence->fence, &async_op_fence_ops,
 			       &vm->async_ops.lock, e ? e->bind.fence_ctx :
 			       vm->async_ops.fence.context, seqno);
 
 		if (!xe_vm_no_dma_fences(vm)) {
-			op->fence->vm = vm;
-			op->fence->started = false;
-			init_waitqueue_head(&op->fence->wq);
+			fence->vm = vm;
+			fence->started = false;
+			init_waitqueue_head(&fence->wq);
 		}
-	} else {
-		op->fence = NULL;
 	}
-	op->vma = vma;
-	op->engine = e;
-	op->bo = bo;
-	op->bind_op = *bind_op;
-	op->syncs = syncs;
-	op->num_syncs = num_syncs;
-	INIT_LIST_HEAD(&op->link);
 
-	for (i = 0; i < num_syncs; i++)
-		installed |= xe_sync_entry_signal(&syncs[i], NULL,
-						  &op->fence->fence);
+	for (i = 0; i < num_ops_list; ++i) {
+		struct drm_gpuva_ops *__ops = ops[i];
+		struct drm_gpuva_op *__op;
 
-	if (!installed && op->fence)
-		dma_fence_signal(&op->fence->fence);
+		drm_gpuva_for_each_op(__op, __ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+			bool first = !async_list;
 
-	spin_lock_irq(&vm->async_ops.lock);
-	list_add_tail(&op->link, &vm->async_ops.pending);
-	spin_unlock_irq(&vm->async_ops.lock);
+			XE_BUG_ON(!first && !async);
 
-	if (!vm->async_ops.error)
-		queue_work(system_unbound_wq, &vm->async_ops.work);
+			INIT_LIST_HEAD(&op->link);
+			if (first)
+				async_list = ops_list;
+			list_add_tail(&op->link, async_list);
 
-	return 0;
-}
-
-static int vm_bind_ioctl_async(struct xe_vm *vm, struct xe_vma *vma,
-			       struct xe_engine *e, struct xe_bo *bo,
-			       struct drm_xe_vm_bind_op *bind_op,
-			       struct xe_sync_entry *syncs, u32 num_syncs)
-{
-	struct xe_vma *__vma, *next;
-	struct list_head rebind_list;
-	struct xe_sync_entry *in_syncs = NULL, *out_syncs = NULL;
-	u32 num_in_syncs = 0, num_out_syncs = 0;
-	bool first = true, last;
-	int err;
-	int i;
+			if (first) {
+				op->flags |= XE_VMA_OP_FIRST;
+				op->num_syncs = num_syncs;
+				op->syncs = syncs;
+			}
 
-	lockdep_assert_held(&vm->lock);
+			op->engine = e;
 
-	/* Not a linked list of unbinds + rebinds, easy */
-	if (list_empty(&vma->unbind_link))
-		return __vm_bind_ioctl_async(vm, vma, e, bo, bind_op,
-					     syncs, num_syncs);
+			switch (op->base.op) {
+			case DRM_GPUVA_OP_MAP:
+			{
+				struct xe_vma *vma;
 
-	/*
-	 * Linked list of unbinds + rebinds, decompose syncs into 'in / out'
-	 * passing the 'in' to the first operation and 'out' to the last. Also
-	 * the reference counting is a little tricky, increment the VM / bind
-	 * engine ref count on all but the last operation and increment the BOs
-	 * ref count on each rebind.
-	 */
+				vma = new_vma(vm, &op->base.map,
+					      op->gt_mask, op->map.read_only);
+				if (IS_ERR(vma)) {
+					err = PTR_ERR(vma);
+					goto free_fence;
+				}
 
-	XE_BUG_ON(VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_UNMAP &&
-		  VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_UNMAP_ALL &&
-		  VM_BIND_OP(bind_op->op) != XE_VM_BIND_OP_PREFETCH);
+				op->map.vma = vma;
+				break;
+			}
+			case DRM_GPUVA_OP_REMAP:
+				if (op->base.remap.prev) {
+					struct xe_vma *vma;
+					bool read_only =
+						op->base.remap.unmap->va->flags &
+						XE_VMA_READ_ONLY;
+
+					vma = new_vma(vm, op->base.remap.prev,
+						      op->gt_mask, read_only);
+					if (IS_ERR(vma)) {
+						err = PTR_ERR(vma);
+						goto free_fence;
+					}
+
+					op->remap.prev = vma;
+				}
 
-	/* Decompose syncs */
-	if (num_syncs) {
-		in_syncs = kmalloc(sizeof(*in_syncs) * num_syncs, GFP_KERNEL);
-		out_syncs = kmalloc(sizeof(*out_syncs) * num_syncs, GFP_KERNEL);
-		if (!in_syncs || !out_syncs) {
-			err = -ENOMEM;
-			goto out_error;
-		}
+				if (op->base.remap.next) {
+					struct xe_vma *vma;
+					bool read_only =
+						op->base.remap.unmap->va->flags &
+						XE_VMA_READ_ONLY;
 
-		for (i = 0; i < num_syncs; ++i) {
-			bool signal = syncs[i].flags & DRM_XE_SYNC_SIGNAL;
+					vma = new_vma(vm, op->base.remap.next,
+						      op->gt_mask, read_only);
+					if (IS_ERR(vma)) {
+						err = PTR_ERR(vma);
+						goto free_fence;
+					}
 
-			if (signal)
-				out_syncs[num_out_syncs++] = syncs[i];
-			else
-				in_syncs[num_in_syncs++] = syncs[i];
-		}
-	}
+					op->remap.next = vma;
+				}
 
-	/* Do unbinds + move rebinds to new list */
-	INIT_LIST_HEAD(&rebind_list);
-	list_for_each_entry_safe(__vma, next, &vma->unbind_link, unbind_link) {
-		if (__vma->destroyed ||
-		    VM_BIND_OP(bind_op->op) == XE_VM_BIND_OP_PREFETCH) {
-			list_del_init(&__vma->unbind_link);
-			xe_bo_get(bo);
-			err = __vm_bind_ioctl_async(xe_vm_get(vm), __vma,
-						    e ? xe_engine_get(e) : NULL,
-						    bo, bind_op, first ?
-						    in_syncs : NULL,
-						    first ? num_in_syncs : 0);
-			if (err) {
-				xe_bo_put(bo);
-				xe_vm_put(vm);
-				if (e)
-					xe_engine_put(e);
-				goto out_error;
+				/* XXX: Support no doing remaps */
+				op->remap.start =
+					xe_vma_start(gpuva_to_vma(op->base.remap.unmap->va));
+				op->remap.range =
+					xe_vma_size(gpuva_to_vma(op->base.remap.unmap->va));
+				break;
+			case DRM_GPUVA_OP_UNMAP:
+				op->unmap.start =
+					xe_vma_start(gpuva_to_vma(op->base.unmap.va));
+				op->unmap.range =
+					xe_vma_size(gpuva_to_vma(op->base.unmap.va));
+				break;
+			case DRM_GPUVA_OP_PREFETCH:
+				/* Nothing to do */
+				break;
+			default:
+				XE_BUG_ON("NOT POSSIBLE");
 			}
-			in_syncs = NULL;
-			first = false;
-		} else {
-			list_move_tail(&__vma->unbind_link, &rebind_list);
-		}
-	}
-	last = list_empty(&rebind_list);
-	if (!last) {
-		xe_vm_get(vm);
-		if (e)
-			xe_engine_get(e);
-	}
-	err = __vm_bind_ioctl_async(vm, vma, e,
-				    bo, bind_op,
-				    first ? in_syncs :
-				    last ? out_syncs : NULL,
-				    first ? num_in_syncs :
-				    last ? num_out_syncs : 0);
-	if (err) {
-		if (!last) {
-			xe_vm_put(vm);
-			if (e)
-				xe_engine_put(e);
-		}
-		goto out_error;
-	}
-	in_syncs = NULL;
 
-	/* Do rebinds */
-	list_for_each_entry_safe(__vma, next, &rebind_list, unbind_link) {
-		list_del_init(&__vma->unbind_link);
-		last = list_empty(&rebind_list);
-
-		if (xe_vma_is_userptr(__vma)) {
-			bind_op->op = XE_VM_BIND_FLAG_ASYNC |
-				XE_VM_BIND_OP_MAP_USERPTR;
-		} else {
-			bind_op->op = XE_VM_BIND_FLAG_ASYNC |
-				XE_VM_BIND_OP_MAP;
-			xe_bo_get(__vma->bo);
-		}
-
-		if (!last) {
-			xe_vm_get(vm);
-			if (e)
-				xe_engine_get(e);
+			last_op = op;
 		}
 
-		err = __vm_bind_ioctl_async(vm, __vma, e,
-					    __vma->bo, bind_op, last ?
-					    out_syncs : NULL,
-					    last ? num_out_syncs : 0);
-		if (err) {
-			if (!last) {
-				xe_vm_put(vm);
-				if (e)
-					xe_engine_put(e);
-			}
-			goto out_error;
-		}
+		last_op->ops = __ops;
 	}
 
-	kfree(syncs);
-	return 0;
+	XE_BUG_ON(!last_op);	/* FIXME: This is not an error, handle */
 
-out_error:
-	kfree(in_syncs);
-	kfree(out_syncs);
-	kfree(syncs);
+	last_op->flags |= XE_VMA_OP_LAST;
+	last_op->num_syncs = num_syncs;
+	last_op->syncs = syncs;
+	last_op->fence = fence;
 
+	return 0;
+
+free_fence:
+	kfree(fence);
 	return err;
 }
 
-static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
-				 struct xe_vma *ignore)
+static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 {
-	struct ww_acquire_ctx ww;
-	struct xe_vma *vma;
-	bool ret = false;
+	int err = 0;
 
-	xe_bo_lock(bo, &ww, 0, false);
-	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		if (vma != ignore && vma->vm == vm && !vma->destroyed) {
-			ret = true;
-			break;
-		}
+	lockdep_assert_held_write(&vm->lock);
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		err |= xe_vm_insert_vma(vm, op->map.vma);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+		prep_vma_destroy(vm, gpuva_to_vma(op->base.remap.unmap->va),
+				 true);
+		if (op->remap.prev)
+			err |= xe_vm_insert_vma(vm, op->remap.prev);
+		if (op->remap.next)
+			err |= xe_vm_insert_vma(vm, op->remap.next);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+		prep_vma_destroy(vm, gpuva_to_vma(op->base.unmap.va), true);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		/* Nothing to do */
+		break;
+	default:
+		XE_BUG_ON("NOT POSSIBLE");
 	}
-	xe_bo_unlock(bo, &ww);
 
-	return ret;
+	op->flags |= XE_VMA_OP_COMMITTED;
+	return err;
 }
 
-static int vm_insert_extobj(struct xe_vm *vm, struct xe_vma *vma)
+static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
+			       struct xe_vma_op *op)
 {
-	struct xe_bo *bo = vma->bo;
+	LIST_HEAD(objs);
+	LIST_HEAD(dups);
+	struct ttm_validate_buffer tv_bo, tv_vm;
+	struct ww_acquire_ctx ww;
+	struct xe_bo *vbo;
+	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	if (bo_has_vm_references(bo, vm, vma))
-		return 0;
+	xe_vm_tv_populate(vm, &tv_vm);
+	list_add_tail(&tv_vm.head, &objs);
+	vbo = xe_vma_bo(vma);
+	if (vbo) {
+		/*
+		 * An unbind can drop the last reference to the BO and
+		 * the BO is needed for ttm_eu_backoff_reservation so
+		 * take a reference here.
+		 */
+		xe_bo_get(vbo);
 
-	list_add(&vma->extobj.link, &vm->extobj.list);
-	vm->extobj.entries++;
+		if (!vbo->vm) {
+			tv_bo.bo = &vbo->ttm;
+			tv_bo.num_shared = 1;
+			list_add(&tv_bo.head, &objs);
+		}
+	}
 
-	return 0;
-}
+again:
+	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
+	if (err) {
+		xe_bo_put(vbo);
+		return err;
+	}
 
-static int __vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
-				      u64 addr, u64 range, u32 op)
-{
-	struct xe_device *xe = vm->xe;
-	struct xe_vma *vma, lookup;
-	bool async = !!(op & XE_VM_BIND_FLAG_ASYNC);
+	xe_vm_assert_held(vm);
+	xe_bo_assert_held(xe_vma_bo(vma));
+
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		err = xe_vm_bind(vm, vma, op->engine, xe_vma_bo(vma),
+				 op->syncs, op->num_syncs, op->fence,
+				 op->map.immediate || !xe_vm_in_fault_mode(vm),
+				 op->flags & XE_VMA_OP_FIRST,
+				 op->flags & XE_VMA_OP_LAST);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+	{
+		bool prev = !!op->remap.prev;
+		bool next = !!op->remap.next;
+
+		if (!op->remap.unmap_done) {
+			vm->async_ops.munmap_rebind_inflight = true;
+			if (prev || next)
+				vma->gpuva.flags |= XE_VMA_FIRST_REBIND;
+			err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
+					   op->num_syncs,
+					   !prev && !next ? op->fence : NULL,
+					   op->flags & XE_VMA_OP_FIRST,
+					   op->flags & XE_VMA_OP_LAST && !prev &&
+					   !next);
+			if (err)
+				break;
+			op->remap.unmap_done = true;
+		}
 
-	lockdep_assert_held(&vm->lock);
+		if (prev) {
+			op->remap.prev->gpuva.flags |= XE_VMA_LAST_REBIND;
+			err = xe_vm_bind(vm, op->remap.prev, op->engine,
+					 xe_vma_bo(op->remap.prev), op->syncs,
+					 op->num_syncs,
+					 !next ? op->fence : NULL, true, false,
+					 op->flags & XE_VMA_OP_LAST && !next);
+			op->remap.prev->gpuva.flags &= ~XE_VMA_LAST_REBIND;
+			if (err)
+				break;
+			op->remap.prev = NULL;
+		}
 
-	lookup.start = addr;
-	lookup.end = addr + range - 1;
+		if (next) {
+			op->remap.next->gpuva.flags |= XE_VMA_LAST_REBIND;
+			err = xe_vm_bind(vm, op->remap.next, op->engine,
+					 xe_vma_bo(op->remap.next),
+					 op->syncs, op->num_syncs,
+					 op->fence, true, false,
+					 op->flags & XE_VMA_OP_LAST);
+			op->remap.next->gpuva.flags &= ~XE_VMA_LAST_REBIND;
+			if (err)
+				break;
+			op->remap.next = NULL;
+		}
+		vm->async_ops.munmap_rebind_inflight = false;
 
-	switch (VM_BIND_OP(op)) {
-	case XE_VM_BIND_OP_MAP:
-	case XE_VM_BIND_OP_MAP_USERPTR:
-		vma = xe_vm_find_overlapping_vma(vm, &lookup);
-		if (XE_IOCTL_ERR(xe, vma))
-			return -EBUSY;
 		break;
-	case XE_VM_BIND_OP_UNMAP:
-	case XE_VM_BIND_OP_PREFETCH:
-		vma = xe_vm_find_overlapping_vma(vm, &lookup);
-		if (XE_IOCTL_ERR(xe, !vma) ||
-		    XE_IOCTL_ERR(xe, (vma->start != addr ||
-				 vma->end != addr + range - 1) && !async))
-			return -EINVAL;
+	}
+	case DRM_GPUVA_OP_UNMAP:
+		err = xe_vm_unbind(vm, vma, op->engine, op->syncs,
+				   op->num_syncs, op->fence,
+				   op->flags & XE_VMA_OP_FIRST,
+				   op->flags & XE_VMA_OP_LAST);
 		break;
-	case XE_VM_BIND_OP_UNMAP_ALL:
+	case DRM_GPUVA_OP_PREFETCH:
+		err = xe_vm_prefetch(vm, vma, op->engine, op->prefetch.region,
+				     op->syncs, op->num_syncs, op->fence,
+				     op->flags & XE_VMA_OP_FIRST,
+				     op->flags & XE_VMA_OP_LAST);
 		break;
 	default:
 		XE_BUG_ON("NOT POSSIBLE");
-		return -EINVAL;
 	}
 
-	return 0;
-}
-
-static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma)
-{
-	down_read(&vm->userptr.notifier_lock);
-	vma->destroyed = true;
-	up_read(&vm->userptr.notifier_lock);
-	xe_vm_remove_vma(vm, vma);
-}
-
-static int prep_replacement_vma(struct xe_vm *vm, struct xe_vma *vma)
-{
-	int err;
-
-	if (vma->bo && !vma->bo->vm) {
-		vm_insert_extobj(vm, vma);
-		err = add_preempt_fences(vm, vma->bo);
-		if (err)
-			return err;
+	ttm_eu_backoff_reservation(&ww, &objs);
+	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
+		lockdep_assert_held_write(&vm->lock);
+		err = xe_vma_userptr_pin_pages(vma);
+		if (!err)
+			goto again;
 	}
+	xe_bo_put(vbo);
 
-	return 0;
+	if (err)
+		trace_xe_vma_fail(vma);
+
+	return err;
 }
 
-/*
- * Find all overlapping VMAs in lookup range and add to a list in the returned
- * VMA, all of VMAs found will be unbound. Also possibly add 2 new VMAs that
- * need to be bound if first / last VMAs are not fully unbound. This is akin to
- * how munmap works.
- */
-static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
-					    struct xe_vma *lookup)
+static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 {
-	struct xe_vma *vma = xe_vm_find_overlapping_vma(vm, lookup);
-	struct rb_node *node;
-	struct xe_vma *first = vma, *last = vma, *new_first = NULL,
-		      *new_last = NULL, *__vma, *next;
-	int err = 0;
-	bool first_munmap_rebind = false;
+	int ret = 0;
 
-	lockdep_assert_held(&vm->lock);
-	XE_BUG_ON(!vma);
-
-	node = &vma->vm_node;
-	while ((node = rb_next(node))) {
-		if (!xe_vma_cmp_vma_cb(lookup, node)) {
-			__vma = to_xe_vma(node);
-			list_add_tail(&__vma->unbind_link, &vma->unbind_link);
-			last = __vma;
-		} else {
-			break;
-		}
-	}
+	lockdep_assert_held_write(&vm->lock);
 
-	node = &vma->vm_node;
-	while ((node = rb_prev(node))) {
-		if (!xe_vma_cmp_vma_cb(lookup, node)) {
-			__vma = to_xe_vma(node);
-			list_add(&__vma->unbind_link, &vma->unbind_link);
-			first = __vma;
-		} else {
-			break;
-		}
+#ifdef TEST_VM_ASYNC_OPS_ERROR
+	if (op->inject_error) {
+		op->inject_error = false;
+		return -ENOMEM;
 	}
+#endif
 
-	if (first->start != lookup->start) {
-		struct ww_acquire_ctx ww;
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		ret = __xe_vma_op_execute(vm, op->map.vma, op);
+		break;
+	case DRM_GPUVA_OP_REMAP:
+	{
+		struct xe_vma *vma;
+
+		if (!op->remap.unmap_done)
+			vma = gpuva_to_vma(op->base.remap.unmap->va);
+		else if(op->remap.prev)
+			vma = op->remap.prev;
+		else
+			vma = op->remap.next;
 
-		if (first->bo)
-			err = xe_bo_lock(first->bo, &ww, 0, true);
-		if (err)
-			goto unwind;
-		new_first = xe_vma_create(first->vm, first->bo,
-					  first->bo ? first->bo_offset :
-					  first->userptr.ptr,
-					  first->start,
-					  lookup->start - 1,
-					  (first->pte_flags & XE_PTE_READ_ONLY),
-					  first->gt_mask);
-		if (first->bo)
-			xe_bo_unlock(first->bo, &ww);
-		if (!new_first) {
-			err = -ENOMEM;
-			goto unwind;
-		}
-		if (!first->bo) {
-			err = xe_vma_userptr_pin_pages(new_first);
-			if (err)
-				goto unwind;
-		}
-		err = prep_replacement_vma(vm, new_first);
-		if (err)
-			goto unwind;
+		ret = __xe_vma_op_execute(vm, vma, op);
+		break;
+	}
+	case DRM_GPUVA_OP_UNMAP:
+		ret = __xe_vma_op_execute(vm, gpuva_to_vma(op->base.unmap.va),
+					  op);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		ret = __xe_vma_op_execute(vm,
+					  gpuva_to_vma(op->base.prefetch.va),
+					  op);
+		break;
+	default:
+		XE_BUG_ON("NOT POSSIBLE");
 	}
 
-	if (last->end != lookup->end) {
-		struct ww_acquire_ctx ww;
-		u64 chunk = lookup->end + 1 - last->start;
+	return ret;
+}
 
-		if (last->bo)
-			err = xe_bo_lock(last->bo, &ww, 0, true);
-		if (err)
-			goto unwind;
-		new_last = xe_vma_create(last->vm, last->bo,
-					 last->bo ? last->bo_offset + chunk :
-					 last->userptr.ptr + chunk,
-					 last->start + chunk,
-					 last->end,
-					 (last->pte_flags & XE_PTE_READ_ONLY),
-					 last->gt_mask);
-		if (last->bo)
-			xe_bo_unlock(last->bo, &ww);
-		if (!new_last) {
-			err = -ENOMEM;
-			goto unwind;
-		}
-		if (!last->bo) {
-			err = xe_vma_userptr_pin_pages(new_last);
-			if (err)
-				goto unwind;
-		}
-		err = prep_replacement_vma(vm, new_last);
-		if (err)
-			goto unwind;
-	}
+static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op *op)
+{
+	bool last = op->flags & XE_VMA_OP_LAST;
 
-	prep_vma_destroy(vm, vma);
-	if (list_empty(&vma->unbind_link) && (new_first || new_last))
-		vma->first_munmap_rebind = true;
-	list_for_each_entry(__vma, &vma->unbind_link, unbind_link) {
-		if ((new_first || new_last) && !first_munmap_rebind) {
-			__vma->first_munmap_rebind = true;
-			first_munmap_rebind = true;
-		}
-		prep_vma_destroy(vm, __vma);
+	if (last) {
+		while (op->num_syncs--)
+			xe_sync_entry_cleanup(&op->syncs[op->num_syncs]);
+		kfree(op->syncs);
+		if (op->engine)
+			xe_engine_put(op->engine);
+		if (op->fence)
+			dma_fence_put(&op->fence->fence);
 	}
-	if (new_first) {
-		xe_vm_insert_vma(vm, new_first);
-		list_add_tail(&new_first->unbind_link, &vma->unbind_link);
-		if (!new_last)
-			new_first->last_munmap_rebind = true;
-	}
-	if (new_last) {
-		xe_vm_insert_vma(vm, new_last);
-		list_add_tail(&new_last->unbind_link, &vma->unbind_link);
-		new_last->last_munmap_rebind = true;
+	if (!list_empty(&op->link)) {
+		spin_lock_irq(&vm->async_ops.lock);
+		list_del(&op->link);
+		spin_unlock_irq(&vm->async_ops.lock);
 	}
+	if (op->ops)
+		drm_gpuva_ops_free(&vm->mgr, op->ops);
+	if (last)
+		xe_vm_put(vm);
+}
 
-	return vma;
+static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
+			     bool post_commit)
+{
+	lockdep_assert_held_write(&vm->lock);
 
-unwind:
-	list_for_each_entry_safe(__vma, next, &vma->unbind_link, unbind_link)
-		list_del_init(&__vma->unbind_link);
-	if (new_last) {
-		prep_vma_destroy(vm, new_last);
-		xe_vma_destroy_unlocked(new_last);
+	switch (op->base.op) {
+	case DRM_GPUVA_OP_MAP:
+		prep_vma_destroy(vm, op->map.vma, post_commit);
+		xe_vma_destroy(op->map.vma, NULL);
+		break;
+	case DRM_GPUVA_OP_UNMAP:
+	{
+		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
+
+		down_read(&vm->userptr.notifier_lock);
+		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
+		up_read(&vm->userptr.notifier_lock);
+		if (post_commit)
+			xe_vm_insert_vma(vm, vma);
+		break;
 	}
-	if (new_first) {
-		prep_vma_destroy(vm, new_first);
-		xe_vma_destroy_unlocked(new_first);
+	case DRM_GPUVA_OP_REMAP:
+		struct xe_vma *vma = gpuva_to_vma(op->base.remap.unmap->va);
+
+		if (op->remap.prev) {
+			prep_vma_destroy(vm, op->remap.prev, post_commit);
+			xe_vma_destroy(op->remap.prev, NULL);
+		}
+		if (op->remap.next) {
+			prep_vma_destroy(vm, op->remap.next, post_commit);
+			xe_vma_destroy(op->remap.next, NULL);
+		}
+		down_read(&vm->userptr.notifier_lock);
+		vma->gpuva.flags &= ~XE_VMA_DESTROYED;
+		up_read(&vm->userptr.notifier_lock);
+		if (post_commit)
+			xe_vm_insert_vma(vm, vma);
+		break;
+	case DRM_GPUVA_OP_PREFETCH:
+		/* Nothing to do */
+		break;
+	default:
+		XE_BUG_ON("NOT POSSIBLE");
 	}
+}
 
-	return ERR_PTR(err);
+static struct xe_vma_op *next_vma_op(struct xe_vm *vm)
+{
+	return list_first_entry_or_null(&vm->async_ops.pending,
+					struct xe_vma_op, link);
 }
 
-/*
- * Similar to vm_unbind_lookup_vmas, find all VMAs in lookup range to prefetch
- */
-static struct xe_vma *vm_prefetch_lookup_vmas(struct xe_vm *vm,
-					      struct xe_vma *lookup,
-					      u32 region)
+static void xe_vma_op_work_func(struct work_struct *w)
 {
-	struct xe_vma *vma = xe_vm_find_overlapping_vma(vm, lookup), *__vma,
-		      *next;
-	struct rb_node *node;
+	struct xe_vm *vm = container_of(w, struct xe_vm, async_ops.work);
 
-	if (!xe_vma_is_userptr(vma)) {
-		if (!xe_bo_can_migrate(vma->bo, region_to_mem_type[region]))
-			return ERR_PTR(-EINVAL);
-	}
+	for (;;) {
+		struct xe_vma_op *op;
+		int err;
 
-	node = &vma->vm_node;
-	while ((node = rb_next(node))) {
-		if (!xe_vma_cmp_vma_cb(lookup, node)) {
-			__vma = to_xe_vma(node);
-			if (!xe_vma_is_userptr(__vma)) {
-				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
-					goto flush_list;
-			}
-			list_add_tail(&__vma->unbind_link, &vma->unbind_link);
-		} else {
+		if (vm->async_ops.error && !xe_vm_is_closed(vm))
 			break;
-		}
-	}
 
-	node = &vma->vm_node;
-	while ((node = rb_prev(node))) {
-		if (!xe_vma_cmp_vma_cb(lookup, node)) {
-			__vma = to_xe_vma(node);
-			if (!xe_vma_is_userptr(__vma)) {
-				if (!xe_bo_can_migrate(__vma->bo, region_to_mem_type[region]))
-					goto flush_list;
-			}
-			list_add(&__vma->unbind_link, &vma->unbind_link);
-		} else {
+		spin_lock_irq(&vm->async_ops.lock);
+		op = next_vma_op(vm);
+		spin_unlock_irq(&vm->async_ops.lock);
+
+		if (!op)
 			break;
-		}
-	}
 
-	return vma;
+		if (!xe_vm_is_closed(vm)) {
+			down_write(&vm->lock);
+			err = xe_vma_op_execute(vm, op);
+			if (err) {
+				drm_warn(&vm->xe->drm,
+					 "Async VM op(%d) failed with %d",
+					 op->base.op, err);
+				vm_set_async_error(vm, err);
+				up_write(&vm->lock);
 
-flush_list:
-	list_for_each_entry_safe(__vma, next, &vma->unbind_link,
-				 unbind_link)
-		list_del_init(&__vma->unbind_link);
+				if (vm->async_ops.error_capture.addr)
+					vm_error_capture(vm, err, 0, 0, 0);
+				break;
+			}
+			up_write(&vm->lock);
+		} else {
+			struct xe_vma *vma;
 
-	return ERR_PTR(-EINVAL);
-}
+			switch (op->base.op) {
+			case DRM_GPUVA_OP_REMAP:
+				vma = gpuva_to_vma(op->base.remap.unmap->va);
+				trace_xe_vma_flush(vma);
 
-static struct xe_vma *vm_unbind_all_lookup_vmas(struct xe_vm *vm,
-						struct xe_bo *bo)
-{
-	struct xe_vma *first = NULL, *vma;
+				down_write(&vm->lock);
+				xe_vma_destroy_unlocked(vma);
+				up_write(&vm->lock);
+				break;
+			case DRM_GPUVA_OP_UNMAP:
+				vma = gpuva_to_vma(op->base.unmap.va);
+				trace_xe_vma_flush(vma);
 
-	lockdep_assert_held(&vm->lock);
-	xe_bo_assert_held(bo);
+				down_write(&vm->lock);
+				xe_vma_destroy_unlocked(vma);
+				up_write(&vm->lock);
+				break;
+			default:
+				/* Nothing to do */
+				break;
+			}
 
-	list_for_each_entry(vma, &bo->vmas, bo_link) {
-		if (vma->vm != vm)
-			continue;
+			if (op->fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
+						   &op->fence->fence.flags)) {
+				if (!xe_vm_no_dma_fences(vm)) {
+					op->fence->started = true;
+					smp_wmb();
+					wake_up_all(&op->fence->wq);
+				}
+				dma_fence_signal(&op->fence->fence);
+			}
+		}
 
-		prep_vma_destroy(vm, vma);
-		if (!first)
-			first = vma;
-		else
-			list_add_tail(&vma->unbind_link, &first->unbind_link);
+		xe_vma_op_cleanup(vm, op);
 	}
-
-	return first;
 }
 
-static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
-					       struct xe_bo *bo,
-					       u64 bo_offset_or_userptr,
-					       u64 addr, u64 range, u32 op,
-					       u64 gt_mask, u32 region)
+/*
+ * Commit operations list, this step cannot fail in async mode, can fail if the
+ * bind operation fails in sync mode.
+ */
+static int vm_bind_ioctl_ops_commit(struct xe_vm *vm,
+				    struct list_head *ops_list, bool async)
 {
-	struct ww_acquire_ctx ww;
-	struct xe_vma *vma, lookup;
+	struct xe_vma_op *op, *last_op, *next;
 	int err;
 
-	lockdep_assert_held(&vm->lock);
-
-	lookup.start = addr;
-	lookup.end = addr + range - 1;
+	lockdep_assert_held_write(&vm->lock);
 
-	switch (VM_BIND_OP(op)) {
-	case XE_VM_BIND_OP_MAP:
-		XE_BUG_ON(!bo);
+	list_for_each_entry(op, ops_list, link) {
+		last_op = op;
+		err = xe_vma_op_commit(vm, op);
+		if (err)
+			goto unwind;
+	}
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+	if (!async) {
+		err = xe_vma_op_execute(vm, last_op);
 		if (err)
-			return ERR_PTR(err);
-		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
-				    addr + range - 1,
-				    op & XE_VM_BIND_FLAG_READONLY,
-				    gt_mask);
-		xe_bo_unlock(bo, &ww);
-		if (!vma)
-			return ERR_PTR(-ENOMEM);
+			goto unwind;
+		xe_vma_op_cleanup(vm, last_op);
+	} else {
+		int i;
+		bool installed = false;
 
-		xe_vm_insert_vma(vm, vma);
-		if (!bo->vm) {
-			vm_insert_extobj(vm, vma);
-			err = add_preempt_fences(vm, bo);
-			if (err) {
-				prep_vma_destroy(vm, vma);
-				xe_vma_destroy_unlocked(vma);
+		for (i = 0; i < last_op->num_syncs; i++)
+			installed |= xe_sync_entry_signal(&last_op->syncs[i],
+							  NULL,
+							  &last_op->fence->fence);
+		if (!installed && last_op->fence)
+			dma_fence_signal(&last_op->fence->fence);
 
-				return ERR_PTR(err);
-			}
-		}
-		break;
-	case XE_VM_BIND_OP_UNMAP:
-		vma = vm_unbind_lookup_vmas(vm, &lookup);
-		break;
-	case XE_VM_BIND_OP_PREFETCH:
-		vma = vm_prefetch_lookup_vmas(vm, &lookup, region);
-		break;
-	case XE_VM_BIND_OP_UNMAP_ALL:
-		XE_BUG_ON(!bo);
+		spin_lock_irq(&vm->async_ops.lock);
+		list_splice_tail(ops_list, &vm->async_ops.pending);
+		spin_unlock_irq(&vm->async_ops.lock);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
-		if (err)
-			return ERR_PTR(err);
-		vma = vm_unbind_all_lookup_vmas(vm, bo);
-		if (!vma)
-			vma = ERR_PTR(-EINVAL);
-		xe_bo_unlock(bo, &ww);
-		break;
-	case XE_VM_BIND_OP_MAP_USERPTR:
-		XE_BUG_ON(bo);
+		if (!vm->async_ops.error)
+			queue_work(system_unbound_wq, &vm->async_ops.work);
+	}
 
-		vma = xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
-				    addr + range - 1,
-				    op & XE_VM_BIND_FLAG_READONLY,
-				    gt_mask);
-		if (!vma)
-			return ERR_PTR(-ENOMEM);
+	return 0;
 
-		err = xe_vma_userptr_pin_pages(vma);
-		if (err) {
-			prep_vma_destroy(vm, vma);
-			xe_vma_destroy_unlocked(vma);
+unwind:
+	list_for_each_entry_reverse(op, ops_list, link)
+		xe_vma_op_unwind(vm, op, op->flags & XE_VMA_OP_COMMITTED);
+	list_for_each_entry_safe(op, next, ops_list, link)
+		xe_vma_op_cleanup(vm, op);
 
-			return ERR_PTR(err);
-		} else {
-			xe_vm_insert_vma(vm, vma);
+	return err;
+}
+
+/*
+ * Unwind operations list, called after a failure of vm_bind_ioctl_ops_create or
+ * vm_bind_ioctl_ops_parse.
+ */
+static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
+				     struct drm_gpuva_ops **ops,
+				     int num_ops_list)
+{
+	int i;
+
+	for (i = 0; i < num_ops_list; ++i) {
+		struct drm_gpuva_ops *__ops = ops[i];
+		struct drm_gpuva_op *__op;
+
+		if (!__ops)
+			continue;
+
+		drm_gpuva_for_each_op(__op, __ops) {
+			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
+
+			xe_vma_op_unwind(vm, op, false);
 		}
-		break;
-	default:
-		XE_BUG_ON("NOT POSSIBLE");
-		vma = ERR_PTR(-EINVAL);
 	}
-
-	return vma;
 }
 
 #ifdef TEST_VM_ASYNC_OPS_ERROR
@@ -2973,15 +2973,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_xe_vm_bind *args = data;
 	struct drm_xe_sync __user *syncs_user;
 	struct xe_bo **bos = NULL;
-	struct xe_vma **vmas = NULL;
+	struct drm_gpuva_ops **ops = NULL;
 	struct xe_vm *vm;
 	struct xe_engine *e = NULL;
 	u32 num_syncs;
 	struct xe_sync_entry *syncs = NULL;
 	struct drm_xe_vm_bind_op *bind_ops;
+	LIST_HEAD(ops_list);
 	bool async;
 	int err;
-	int i, j = 0;
+	int i;
 
 	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
 	if (err)
@@ -3069,8 +3070,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto put_engine;
 	}
 
-	vmas = kzalloc(sizeof(*vmas) * args->num_binds, GFP_KERNEL);
-	if (!vmas) {
+	ops = kzalloc(sizeof(*ops) * args->num_binds, GFP_KERNEL);
+	if (!ops) {
 		err = -ENOMEM;
 		goto put_engine;
 	}
@@ -3137,7 +3138,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
 
-		err = __vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
+		err = vm_bind_ioctl_lookup_vma(vm, bos[i], addr, range, op);
 		if (err)
 			goto release_vm_lock;
 	}
@@ -3150,128 +3151,45 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 gt_mask = bind_ops[i].gt_mask;
 		u32 region = bind_ops[i].region;
 
-		vmas[i] = vm_bind_ioctl_lookup_vma(vm, bos[i], obj_offset,
-						   addr, range, op, gt_mask,
-						   region);
-		if (IS_ERR(vmas[i])) {
-			err = PTR_ERR(vmas[i]);
-			vmas[i] = NULL;
-			goto destroy_vmas;
+		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
+						  addr, range, op, gt_mask,
+						  region);
+		if (IS_ERR(ops[i])) {
+			err = PTR_ERR(ops[i]);
+			ops[i] = NULL;
+			goto unwind_ops;
 		}
 	}
 
-	for (j = 0; j < args->num_binds; ++j) {
-		struct xe_sync_entry *__syncs;
-		u32 __num_syncs = 0;
-		bool first_or_last = j == 0 || j == args->num_binds - 1;
-
-		if (args->num_binds == 1) {
-			__num_syncs = num_syncs;
-			__syncs = syncs;
-		} else if (first_or_last && num_syncs) {
-			bool first = j == 0;
-
-			__syncs = kmalloc(sizeof(*__syncs) * num_syncs,
-					  GFP_KERNEL);
-			if (!__syncs) {
-				err = ENOMEM;
-				break;
-			}
-
-			/* in-syncs on first bind, out-syncs on last bind */
-			for (i = 0; i < num_syncs; ++i) {
-				bool signal = syncs[i].flags &
-					DRM_XE_SYNC_SIGNAL;
-
-				if ((first && !signal) || (!first && signal))
-					__syncs[__num_syncs++] = syncs[i];
-			}
-		} else {
-			__num_syncs = 0;
-			__syncs = NULL;
-		}
-
-		if (async) {
-			bool last = j == args->num_binds - 1;
-
-			/*
-			 * Each pass of async worker drops the ref, take a ref
-			 * here, 1 set of refs taken above
-			 */
-			if (!last) {
-				if (e)
-					xe_engine_get(e);
-				xe_vm_get(vm);
-			}
-
-			err = vm_bind_ioctl_async(vm, vmas[j], e, bos[j],
-						  bind_ops + j, __syncs,
-						  __num_syncs);
-			if (err && !last) {
-				if (e)
-					xe_engine_put(e);
-				xe_vm_put(vm);
-			}
-			if (err)
-				break;
-		} else {
-			XE_BUG_ON(j != 0);	/* Not supported */
-			err = vm_bind_ioctl(vm, vmas[j], e, bos[j],
-					    bind_ops + j, __syncs,
-					    __num_syncs, NULL);
-			break;	/* Needed so cleanup loops work */
-		}
-	}
+	err = vm_bind_ioctl_ops_parse(vm, e, ops, args->num_binds,
+				      syncs, num_syncs, &ops_list, async);
+	if (err)
+		goto unwind_ops;
 
-	/* Most of cleanup owned by the async bind worker */
-	if (async && !err) {
-		up_write(&vm->lock);
-		if (args->num_binds > 1)
-			kfree(syncs);
-		goto free_objs;
-	}
+	err = vm_bind_ioctl_ops_commit(vm, &ops_list, async);
+	up_write(&vm->lock);
 
-destroy_vmas:
-	for (i = j; err && i < args->num_binds; ++i) {
-		u32 op = bind_ops[i].op;
-		struct xe_vma *vma, *next;
+	for (i = 0; i < args->num_binds; ++i)
+		xe_bo_put(bos[i]);
 
-		if (!vmas[i])
-			break;
+	kfree(bos);
+	kfree(ops);
+	if (args->num_binds > 1)
+		kfree(bind_ops);
 
-		list_for_each_entry_safe(vma, next, &vma->unbind_link,
-					 unbind_link) {
-			list_del_init(&vma->unbind_link);
-			if (!vma->destroyed) {
-				prep_vma_destroy(vm, vma);
-				xe_vma_destroy_unlocked(vma);
-			}
-		}
+	return err;
 
-		switch (VM_BIND_OP(op)) {
-		case XE_VM_BIND_OP_MAP:
-			prep_vma_destroy(vm, vmas[i]);
-			xe_vma_destroy_unlocked(vmas[i]);
-			break;
-		case XE_VM_BIND_OP_MAP_USERPTR:
-			prep_vma_destroy(vm, vmas[i]);
-			xe_vma_destroy_unlocked(vmas[i]);
-			break;
-		}
-	}
+unwind_ops:
+	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
 release_vm_lock:
 	up_write(&vm->lock);
 free_syncs:
-	while (num_syncs--) {
-		if (async && j &&
-		    !(syncs[num_syncs].flags & DRM_XE_SYNC_SIGNAL))
-			continue;	/* Still in async worker */
+	while (num_syncs--)
 		xe_sync_entry_cleanup(&syncs[num_syncs]);
-	}
 
 	kfree(syncs);
 put_obj:
-	for (i = j; i < args->num_binds; ++i)
+	for (i = 0; i < args->num_binds; ++i)
 		xe_bo_put(bos[i]);
 put_engine:
 	if (e)
@@ -3280,10 +3198,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	xe_vm_put(vm);
 free_objs:
 	kfree(bos);
-	kfree(vmas);
+	kfree(ops);
 	if (args->num_binds > 1)
 		kfree(bind_ops);
-	return err;
+	return err == -ENODATA ? 0 : err;
 }
 
 /*
@@ -3324,14 +3242,14 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
  */
 int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
-	struct xe_device *xe = vma->vm->xe;
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_gt *gt;
 	u32 gt_needs_invalidate = 0;
 	int seqno[XE_MAX_GT];
 	u8 id;
 	int ret;
 
-	XE_BUG_ON(!xe_vm_in_fault_mode(vma->vm));
+	XE_BUG_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
 	trace_xe_vma_usm_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
@@ -3340,11 +3258,11 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
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
 
@@ -3374,7 +3292,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 #if IS_ENABLED(CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE)
 int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 {
-	struct rb_node *node;
+	DRM_GPUVA_ITER(it, &vm->mgr, 0);
+	struct drm_gpuva *gpuva;
 	bool is_vram;
 	uint64_t addr;
 
@@ -3383,26 +3302,24 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
 		return 0;
 	}
 	if (vm->pt_root[gt_id]) {
-		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE,
-				  &is_vram);
+		addr = xe_bo_addr(vm->pt_root[gt_id]->bo, 0, XE_PAGE_SIZE, &is_vram);
 		drm_printf(p, " VM root: A:0x%llx %s\n", addr, is_vram ? "VRAM" : "SYS");
 	}
 
-	for (node = rb_first(&vm->vmas); node; node = rb_next(node)) {
-		struct xe_vma *vma = to_xe_vma(node);
+	drm_gpuva_iter_for_each(gpuva, it) {
+		struct xe_vma* vma = gpuva_to_vma(gpuva);
 		bool is_userptr = xe_vma_is_userptr(vma);
 
 		if (is_userptr) {
 			struct xe_res_cursor cur;
 
-			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
-					&cur);
+			xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE, &cur);
 			addr = xe_res_dma(&cur);
 		} else {
-			addr = xe_bo_addr(vma->bo, 0, XE_PAGE_SIZE, &is_vram);
+			addr = xe_bo_addr(xe_vma_bo(vma), 0, XE_PAGE_SIZE, &is_vram);
 		}
 		drm_printf(p, " [%016llx-%016llx] S:0x%016llx A:%016llx %s\n",
-			   vma->start, vma->end, vma->end - vma->start + 1ull,
+			   xe_vma_start(vma), xe_vma_end(vma), xe_vma_size(vma),
 			   addr, is_userptr ? "USR" : is_vram ? "VRAM" : "SYS");
 	}
 	up_read(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 748dc16ebed9..21b1054949c4 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -6,6 +6,7 @@
 #ifndef _XE_VM_H_
 #define _XE_VM_H_
 
+#include "xe_bo_types.h"
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_vm_types.h"
@@ -25,7 +26,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
 void xe_vm_free(struct kref *ref);
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
-int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
 
 static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
 {
@@ -50,7 +50,67 @@ static inline bool xe_vm_is_closed(struct xe_vm *vm)
 }
 
 struct xe_vma *
-xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
+xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
+
+static inline struct xe_vm *gpuva_to_vm(struct drm_gpuva *gpuva)
+{
+	return container_of(gpuva->mgr, struct xe_vm, mgr);
+}
+
+static inline struct xe_vma *gpuva_to_vma(struct drm_gpuva *gpuva)
+{
+	return container_of(gpuva, struct xe_vma, gpuva);
+}
+
+static inline struct xe_vma_op *gpuva_op_to_vma_op(struct drm_gpuva_op *op)
+{
+	return container_of(op, struct xe_vma_op, base);
+}
+
+/*
+ * Let's abstract start, size, end, bo_offset, vm, and bo as the underlying
+ * implementation may change
+ */
+static inline u64 xe_vma_start(struct xe_vma *vma)
+{
+	return vma->gpuva.va.addr;
+}
+
+static inline u64 xe_vma_size(struct xe_vma *vma)
+{
+	return vma->gpuva.va.range;
+}
+
+static inline u64 xe_vma_end(struct xe_vma *vma)
+{
+	return xe_vma_start(vma) + xe_vma_size(vma);
+}
+
+static inline u64 xe_vma_bo_offset(struct xe_vma *vma)
+{
+	return vma->gpuva.gem.offset;
+}
+
+static inline struct xe_bo *xe_vma_bo(struct xe_vma *vma)
+{
+	return !vma->gpuva.gem.obj ? NULL :
+		container_of(vma->gpuva.gem.obj, struct xe_bo, ttm.base);
+}
+
+static inline struct xe_vm *xe_vma_vm(struct xe_vma *vma)
+{
+	return container_of(vma->gpuva.mgr, struct xe_vm, mgr);
+}
+
+static inline bool xe_vma_read_only(struct xe_vma *vma)
+{
+	return vma->gpuva.flags & XE_VMA_READ_ONLY;
+}
+
+static inline u64 xe_vma_userptr(struct xe_vma *vma)
+{
+	return vma->gpuva.gem.offset;
+}
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
 
@@ -117,7 +177,7 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 
 static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 {
-	return !vma->bo;
+	return !xe_vma_bo(vma);
 }
 
 int xe_vma_userptr_pin_pages(struct xe_vma *vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 29815852985a..02d27a354b36 100644
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
@@ -210,19 +210,13 @@ static const madvise_func madvise_funcs[] = {
 	[DRM_XE_VM_MADVISE_PIN] = madvise_pin,
 };
 
-static struct xe_vma *node_to_vma(const struct rb_node *node)
-{
-	BUILD_BUG_ON(offsetof(struct xe_vma, vm_node) != 0);
-	return (struct xe_vma *)node;
-}
-
 static struct xe_vma **
 get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
 {
-	struct xe_vma **vmas;
-	struct xe_vma *vma, *__vma, lookup;
+	struct xe_vma **vmas, **__vmas;
+	struct drm_gpuva *gpuva;
 	int max_vmas = 8;
-	struct rb_node *node;
+	DRM_GPUVA_ITER(it, &vm->mgr, addr);
 
 	lockdep_assert_held(&vm->lock);
 
@@ -230,64 +224,24 @@ get_vmas(struct xe_vm *vm, int *num_vmas, u64 addr, u64 range)
 	if (!vmas)
 		return NULL;
 
-	lookup.start = addr;
-	lookup.end = addr + range - 1;
+	drm_gpuva_iter_for_each_range(gpuva, it, addr + range) {
+		struct xe_vma *vma = gpuva_to_vma(gpuva);
 
-	vma = xe_vm_find_overlapping_vma(vm, &lookup);
-	if (!vma)
-		return vmas;
+		if (xe_vma_is_userptr(vma))
+			continue;
 
-	if (!xe_vma_is_userptr(vma)) {
+		if (*num_vmas == max_vmas) {
+			max_vmas <<= 1;
+			__vmas = krealloc(vmas, max_vmas * sizeof(*vmas),
+					  GFP_KERNEL);
+			if (!__vmas)
+				return NULL;
+			vmas = __vmas;
+		}
 		vmas[*num_vmas] = vma;
 		*num_vmas += 1;
 	}
 
-	node = &vma->vm_node;
-	while ((node = rb_next(node))) {
-		if (!xe_vma_cmp_vma_cb(&lookup, node)) {
-			__vma = node_to_vma(node);
-			if (xe_vma_is_userptr(__vma))
-				continue;
-
-			if (*num_vmas == max_vmas) {
-				struct xe_vma **__vmas =
-					krealloc(vmas, max_vmas * sizeof(*vmas),
-						 GFP_KERNEL);
-
-				if (!__vmas)
-					return NULL;
-				vmas = __vmas;
-			}
-			vmas[*num_vmas] = __vma;
-			*num_vmas += 1;
-		} else {
-			break;
-		}
-	}
-
-	node = &vma->vm_node;
-	while ((node = rb_prev(node))) {
-		if (!xe_vma_cmp_vma_cb(&lookup, node)) {
-			__vma = node_to_vma(node);
-			if (xe_vma_is_userptr(__vma))
-				continue;
-
-			if (*num_vmas == max_vmas) {
-				struct xe_vma **__vmas =
-					krealloc(vmas, max_vmas * sizeof(*vmas),
-						 GFP_KERNEL);
-
-				if (!__vmas)
-					return NULL;
-				vmas = __vmas;
-			}
-			vmas[*num_vmas] = __vma;
-			*num_vmas += 1;
-		} else {
-			break;
-		}
-	}
-
 	return vmas;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index d3e99f22510d..243dc91a61b0 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -6,6 +6,8 @@
 #ifndef _XE_VM_TYPES_H_
 #define _XE_VM_TYPES_H_
 
+#include <drm/drm_gpuva_mgr.h>
+
 #include <linux/dma-resv.h>
 #include <linux/kref.h>
 #include <linux/mmu_notifier.h>
@@ -14,28 +16,23 @@
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
 
+struct async_op_fence;
 struct xe_bo;
+struct xe_sync_entry;
 struct xe_vm;
 
-struct xe_vma {
-	struct rb_node vm_node;
-	/** @vm: VM which this VMA belongs to */
-	struct xe_vm *vm;
+#define TEST_VM_ASYNC_OPS_ERROR
+#define FORCE_ASYNC_OP_ERROR	BIT(31)
 
-	/**
-	 * @start: start address of this VMA within its address domain, end -
-	 * start + 1 == VMA size
-	 */
-	u64 start;
-	/** @end: end address of this VMA within its address domain */
-	u64 end;
-	/** @pte_flags: pte flags for this VMA */
-	u32 pte_flags;
+#define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
+#define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
+#define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
+#define XE_VMA_FIRST_REBIND	(DRM_GPUVA_USERBITS << 3)
+#define XE_VMA_LAST_REBIND	(DRM_GPUVA_USERBITS << 4)
 
-	/** @bo: BO if not a userptr, must be NULL is userptr */
-	struct xe_bo *bo;
-	/** @bo_offset: offset into BO if not a userptr, unused for userptr */
-	u64 bo_offset;
+struct xe_vma {
+	/** @gpuva: Base GPUVA object */
+	struct drm_gpuva gpuva;
 
 	/** @gt_mask: GT mask of where to create binding for this VMA */
 	u64 gt_mask;
@@ -49,40 +46,8 @@ struct xe_vma {
 	 */
 	u64 gt_present;
 
-	/**
-	 * @destroyed: VMA is destroyed, in the sense that it shouldn't be
-	 * subject to rebind anymore. This field must be written under
-	 * the vm lock in write mode and the userptr.notifier_lock in
-	 * either mode. Read under the vm lock or the userptr.notifier_lock in
-	 * write mode.
-	 */
-	bool destroyed;
-
-	/**
-	 * @first_munmap_rebind: VMA is first in a sequence of ops that triggers
-	 * a rebind (munmap style VM unbinds). This indicates the operation
-	 * using this VMA must wait on all dma-resv slots (wait for pending jobs
-	 * / trigger preempt fences).
-	 */
-	bool first_munmap_rebind;
-
-	/**
-	 * @last_munmap_rebind: VMA is first in a sequence of ops that triggers
-	 * a rebind (munmap style VM unbinds). This indicates the operation
-	 * using this VMA must install itself into kernel dma-resv slot (blocks
-	 * future jobs) and kick the rebind work in compute mode.
-	 */
-	bool last_munmap_rebind;
-
-	/** @use_atomic_access_pte_bit: Set atomic access bit in PTE */
-	bool use_atomic_access_pte_bit;
-
-	union {
-		/** @bo_link: link into BO if not a userptr */
-		struct list_head bo_link;
-		/** @userptr_link: link into VM repin list if userptr */
-		struct list_head userptr_link;
-	};
+	/** @userptr_link: link into VM repin list if userptr */
+	struct list_head userptr_link;
 
 	/**
 	 * @rebind_link: link into VM if this VMA needs rebinding, and
@@ -105,8 +70,6 @@ struct xe_vma {
 
 	/** @userptr: user pointer state */
 	struct {
-		/** @ptr: user pointer */
-		uintptr_t ptr;
 		/** @invalidate_link: Link for the vm::userptr.invalidated list */
 		struct list_head invalidate_link;
 		/**
@@ -154,6 +117,9 @@ struct xe_device;
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
 
 struct xe_vm {
+	/** @mgr: base GPUVA used to track VMAs */
+	struct drm_gpuva_manager mgr;
+
 	struct xe_device *xe;
 
 	struct kref refcount;
@@ -168,7 +134,6 @@ struct xe_vm {
 	struct ttm_lru_bulk_move lru_bulk_move;
 
 	u64 size;
-	struct rb_root vmas;
 
 	struct xe_pt *pt_root[XE_MAX_GT];
 	struct xe_bo *scratch_bo[XE_MAX_GT];
@@ -342,4 +307,98 @@ struct xe_vm {
 	} error_capture;
 };
 
+/** struct xe_vma_op_map - VMA map operation */
+struct xe_vma_op_map {
+	/** @vma: VMA to map */
+	struct xe_vma *vma;
+	/** @immediate: Immediate bind */
+	bool immediate;
+	/** @read_only: Read only */
+	bool read_only;
+};
+
+/** struct xe_vma_op_unmap - VMA unmap operation */
+struct xe_vma_op_unmap {
+	/** @start: start of the VMA unmap */
+	u64 start;
+	/** @range: range of the VMA unmap */
+	u64 range;
+};
+
+/** struct xe_vma_op_remap - VMA remap operation */
+struct xe_vma_op_remap {
+	/** @prev: VMA preceding part of a split mapping */
+	struct xe_vma *prev;
+	/** @next: VMA subsequent part of a split mapping */
+	struct xe_vma *next;
+	/** @start: start of the VMA unmap */
+	u64 start;
+	/** @range: range of the VMA unmap */
+	u64 range;
+	/** @unmap_done: unmap operation in done */
+	bool unmap_done;
+};
+
+/** struct xe_vma_op_prefetch - VMA prefetch operation */
+struct xe_vma_op_prefetch {
+	/** @region: memory region to prefetch to */
+	u32 region;
+};
+
+/** enum xe_vma_op_flags - flags for VMA operation */
+enum xe_vma_op_flags {
+	/** @XE_VMA_OP_FIRST: first VMA operation for a set of syncs */
+	XE_VMA_OP_FIRST		= (0x1 << 0),
+	/** @XE_VMA_OP_LAST: last VMA operation for a set of syncs */
+	XE_VMA_OP_LAST		= (0x1 << 1),
+	/** @XE_VMA_OP_COMMITTED: VMA operation committed */
+	XE_VMA_OP_COMMITTED	= (0x1 << 2),
+};
+
+/** struct xe_vma_op - VMA operation */
+struct xe_vma_op {
+	/** @base: GPUVA base operation */
+	struct drm_gpuva_op base;
+	/**
+	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
+	 * operations is processed
+	 */
+	struct drm_gpuva_ops *ops;
+	/** @engine: engine for this operation */
+	struct xe_engine *engine;
+	/**
+	 * @syncs: syncs for this operation, only used on first and last
+	 * operation
+	 */
+	struct xe_sync_entry *syncs;
+	/** @num_syncs: number of syncs */
+	u32 num_syncs;
+	/** @link: async operation link */
+	struct list_head link;
+	/**
+	 * @fence: async operation fence, signaled on last operation complete
+	 */
+	struct async_op_fence *fence;
+	/** @gt_mask: gt mask for this operation */
+	u64 gt_mask;
+	/** @flags: operation flags */
+	enum xe_vma_op_flags flags;
+
+#ifdef TEST_VM_ASYNC_OPS_ERROR
+	/** @inject_error: inject error to test async op error handling */
+	bool inject_error;
+#endif
+
+	union {
+		/** @map: VMA map operation specific data */
+		struct xe_vma_op_map map;
+		/** @unmap: VMA unmap operation specific data */
+		struct xe_vma_op_unmap unmap;
+		/** @remap: VMA remap operation specific data */
+		struct xe_vma_op_remap remap;
+		/** @prefetch: VMA prefetch operation specific data */
+		struct xe_vma_op_prefetch prefetch;
+	};
+};
+
 #endif
-- 
2.34.1

