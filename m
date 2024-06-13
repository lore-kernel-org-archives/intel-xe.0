Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B0DC27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 04:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BEC10E169;
	Thu, 13 Jun 2024 04:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUi/Ew0D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A33510E210
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 04:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718252031; x=1749788031;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UIrE9PNaAzw+7eaNN0ymJwC74lHxX7IIYIOys77BFeE=;
 b=PUi/Ew0Dwc9ELPA6gGQLdXCyZ4qaVB7TRghYf6rOA7ijtmJ+kqIMrPst
 7UI0BwBkDwLtmZMkjrw8ZQ2wGvbhTDNqL5oZyv7XR2QjMzX+n89KYDvjn
 6MT35BAPHYeLjcRqVOB5lhMt5pKOFIN8r/wGNuqLtfeauHoUP7kAuH9e+
 NFyUzdTp1zUJbmrMk3DnhHrB3cYfZMgBcwLJt+u69RcdEiTdEQSA8Q9p4
 72/c+2k/NWnkgo5bVZvAPKk589QmmpvRlvlB8zhFNQ40FVcg6Y1BtyDrb
 xSetCshsLXqHlcgrxndH4O/zMKv+WbYq1RRgGYvyAdMq50SeixDdtI1Tt A==;
X-CSE-ConnectionGUID: DEV+ry/ZT0mt/R7fJTA4Ng==
X-CSE-MsgGUID: cFiRQ5lsQbib7JVOQel3HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14847978"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14847978"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
X-CSE-ConnectionGUID: 5x86HzY+RlKp1a7htXq5Fg==
X-CSE-MsgGUID: AwytymE6QVmET4FDE4ez9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40476347"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:13:48 -0700
From: Oak Zeng <oak.zeng@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 26/42] drm/xe: Moving to range based vma invalidation
Date: Thu, 13 Jun 2024 00:24:13 -0400
Message-Id: <20240613042429.637281-26-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240613042429.637281-1-oak.zeng@intel.com>
References: <20240613042429.637281-1-oak.zeng@intel.com>
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

New parameters are introduced to the vma invalidation function to allow
partially invalidate a vma.

For userptr invalidation, we now only invalidate the mmu notified range
instead of the whole vma. This more more proper than the whole vma based
invalidation.

For other cases, still keep the whole vma invalidation scheme.

One of the consequence of this change is, we now don't have information
whether a vma is fully invalidated or not, because vma can be partially
invalidated now. The tile_invalidated member is deleted due to this
reason.

This is prepare work for system allocator where we want to apply range
based vma invalidation. It is also reasonable to apply the same scheme
for userptr invalidation.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Signed-off-by: Oak Zeng <oak.zeng@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           |  2 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 ---------
 drivers/gpu/drm/xe/xe_pt.c           | 16 +++++++++----
 drivers/gpu/drm/xe/xe_pt.h           |  2 +-
 drivers/gpu/drm/xe/xe_vm.c           | 36 +++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h           |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h     |  3 ---
 7 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1a048fcb1496..10d66bb5bad2 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -514,7 +514,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			struct xe_vma *vma = gpuva_to_vma(gpuva);
 
 			trace_xe_vma_evict(vma);
-			ret = xe_vm_invalidate_vma(vma);
+			ret = xe_vm_invalidate_vma(vma, xe_vma_start(vma), xe_vma_end(vma));
 			if (XE_WARN_ON(ret))
 				return ret;
 		}
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index eaf68f0135c1..c3e9331cf1b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -65,12 +65,6 @@ static bool access_is_atomic(enum access_type access_type)
 	return access_type == ACCESS_TYPE_ATOMIC;
 }
 
-static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
-{
-	return BIT(tile->id) & vma->tile_present &&
-		!(BIT(tile->id) & vma->tile_invalidated);
-}
-
 static bool vma_matches(struct xe_vma *vma, u64 page_addr)
 {
 	if (page_addr > xe_vma_end(vma) - 1 ||
@@ -138,10 +132,6 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	trace_xe_vma_pagefault(vma);
 	atomic = access_is_atomic(pf->access_type);
 
-	/* Check if VMA is valid */
-	if (vma_is_valid(tile, vma) && !atomic)
-		return 0;
-
 retry_userptr:
 	if (xe_vma_is_userptr(vma) &&
 	    xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
@@ -175,7 +165,6 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
-	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index b30fc855147d..96600ba9e100 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -792,6 +792,8 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
  * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
  * @tile: The tile we're zapping for.
  * @vma: GPU VMA detailing address range.
+ * @start: start of the range.
+ * @end: end of the range.
  *
  * Eviction and Userptr invalidation needs to be able to zap the
  * gpu ptes of a given address range in pagefaulting mode.
@@ -803,8 +805,11 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
  *
  * Return: Whether ptes were actually updated and a TLB invalidation is
  * required.
+ *
+ * FIXME: double confirm xe_pt_walk_shared support walking of a sub-range of
+ * vma (vs whole vma)
  */
-bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
+bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end)
 {
 	struct xe_pt_zap_ptes_walk xe_walk = {
 		.base = {
@@ -815,13 +820,16 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 		.tile = tile,
 	};
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
-	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
+	u8 pt_mask = vma->tile_present;
+
+	xe_assert(tile_to_xe(tile), start >= xe_vma_start(vma));
+	xe_assert(tile_to_xe(tile), end <= xe_vma_end(vma));
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
-	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
-				xe_vma_end(vma), &xe_walk.base);
+	(void)xe_pt_walk_shared(&pt->base, pt->level, start,
+				end, &xe_walk.base);
 
 	return xe_walk.needs_invalidate;
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..aa8ff28e75b0 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -41,6 +41,6 @@ struct dma_fence *xe_pt_update_ops_run(struct xe_tile *tile,
 void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
-bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
+bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma, u64 start, u64 end);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3b853306208b..5ae5b556ec1b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -617,21 +617,31 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 {
 	struct xe_userptr *userptr = container_of(mni, typeof(*userptr), hmmptr.notifier);
 	struct xe_userptr_vma *uvma = container_of(userptr, typeof(*uvma), userptr);
+	u64 range_start, range_end, range_size, range_offset;
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
+	u64 start, end;
 	long err;
 
+	range_start = max_t(u64, xe_vma_userptr(vma), range->start);
+	range_end = min_t(u64, xe_vma_userptr_end(vma), range->end);
+	range_size = range_end - range_start;
+	range_offset = range_start - xe_vma_userptr(vma);
+
 	xe_assert(vm->xe, xe_vma_is_userptr(vma));
 	trace_xe_vma_userptr_invalidate(vma);
 
+	start = xe_vma_start(vma) + range_offset;
+	end = start + range_size;
+
 	if (!mmu_notifier_range_blockable(range))
 		return false;
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
-		xe_vma_start(vma), xe_vma_size(vma));
+		start, range_size);
 
 	down_write(&vm->userptr.notifier_lock);
 	mmu_interval_set_seq(mni, cur_seq);
@@ -674,11 +684,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	XE_WARN_ON(err <= 0);
 
 	if (xe_vm_in_fault_mode(vm)) {
-		err = xe_vm_invalidate_vma(vma);
+		err = xe_vm_invalidate_vma(vma, start, end);
 		XE_WARN_ON(err);
 	}
 
-	xe_vma_userptr_dma_unmap_pages(uvma, xe_vma_userptr(vma), xe_vma_userptr_end(vma));
+	xe_vma_userptr_dma_unmap_pages(uvma, range_start, range_end);
 
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
@@ -721,7 +731,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 					      DMA_RESV_USAGE_BOOKKEEP,
 					      false, MAX_SCHEDULE_TIMEOUT);
 
-			err = xe_vm_invalidate_vma(&uvma->vma);
+			err = xe_vm_invalidate_vma(&uvma->vma, xe_vma_start(&uvma->vma),
+				     xe_vma_end(&uvma->vma));
 			xe_vm_unlock(vm);
 			if (err)
 				return err;
@@ -3207,8 +3218,10 @@ void xe_vm_unlock(struct xe_vm *vm)
 }
 
 /**
- * xe_vm_invalidate_vma - invalidate GPU mappings for VMA without a lock
+ * xe_vm_invalidate_vma - invalidate GPU mappings for a range of VMA without a lock
  * @vma: VMA to invalidate
+ * @start: start of the range.
+ * @end: end of the range.
  *
  * Walks a list of page tables leaves which it memset the entries owned by this
  * VMA to zero, invalidates the TLBs, and block until TLBs invalidation is
@@ -3216,7 +3229,7 @@ void xe_vm_unlock(struct xe_vm *vm)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_vm_invalidate_vma(struct xe_vma *vma)
+int xe_vm_invalidate_vma(struct xe_vma *vma, u64 start, u64 end)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 	struct xe_tile *tile;
@@ -3227,11 +3240,13 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	xe_assert(xe, !xe_vma_is_null(vma));
 	xe_assert(xe, !xe_vma_is_system_allocator(vma));
+	xe_assert(xe, start >= xe_vma_start(vma));
+	xe_assert(xe, end <= xe_vma_end(vma));
 	trace_xe_vma_invalidate(vma);
 
 	vm_dbg(&xe_vma_vm(vma)->xe->drm,
 	       "INVALIDATE: addr=0x%016llx, range=0x%016llx",
-		xe_vma_start(vma), xe_vma_size(vma));
+		start, end - start);
 
 	/* Check that we don't race with page-table updates */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
@@ -3248,14 +3263,15 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	}
 
 	for_each_tile(tile, xe, id) {
-		if (xe_pt_zap_ptes(tile, vma)) {
+		if (xe_pt_zap_ptes(tile, vma, start, end)) {
 			tile_needs_invalidate |= BIT(id);
 			xe_device_wmb(xe);
 			/*
 			 * FIXME: We potentially need to invalidate multiple
 			 * GTs within the tile
 			 */
-			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
+			seqno[id] = xe_gt_tlb_invalidation_range(tile->primary_gt, NULL,
+					     start, end, xe_vma_vm(vma)->usm.asid);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
@@ -3269,8 +3285,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		}
 	}
 
-	vma->tile_invalidated = vma->tile_mask;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 89f3306561ad..7c10f6c60b63 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -223,7 +223,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
 
-int xe_vm_invalidate_vma(struct xe_vma *vma);
+int xe_vm_invalidate_vma(struct xe_vma *vma, u64 start, u64 end);
 
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 976982972a06..4d9707c19031 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -75,9 +75,6 @@ struct xe_vma {
 		struct work_struct destroy_work;
 	};
 
-	/** @tile_invalidated: VMA has been invalidated */
-	u8 tile_invalidated;
-
 	/** @tile_mask: Tile mask of where to create binding for this VMA */
 	u8 tile_mask;
 
-- 
2.26.3

