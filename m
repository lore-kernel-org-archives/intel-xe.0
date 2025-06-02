Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA15C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 16:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D3110E0A6;
	Mon,  2 Jun 2025 16:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nm1IgVPC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B87C510E0A6
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 16:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748882563; x=1780418563;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7J1oG/UNrE1WijHdqacSSp2cY1N62FVNUKHLVfGbAfs=;
 b=nm1IgVPCQAFNN3s+QItkLkwvBfkKd7HVeh8JBbvtsAqu7J3cYxSe8hRw
 aPRTiIAhXp4LhfKBjNzFrEiNPhZo5ztwNnMMMMgdHNSltKQ0MmY6jXk3a
 7HKSbRZmW1dnHOWT/pIKDd8h9i6Fmv447VuhDaDb2aU66ZqTVfiGO/JMb
 hExqn65V8wZVxsfxxN0GI1u5xnVDHo6jahdKAuiyEjApBFwAr6FHXcvr0
 m5+91H6ZcfgGDv9W0V6pLF3B8PP0Dvaqqih+ywwM9Zrih57T7w6RYWJ8F
 zJNOqQtX5bYrhuL1m4uyBGKoIXbUooyen8hT+8EuObg54PO8j732Y2Ue2 w==;
X-CSE-ConnectionGUID: 1+G2zRilTrqk4Io0TlxNCQ==
X-CSE-MsgGUID: 3MCvVYUNSvyZy6/3lnlawQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="53525313"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="53525313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:42:42 -0700
X-CSE-ConnectionGUID: +xoeIedVSYy9BJtme/M14w==
X-CSE-MsgGUID: Lk0aWZpFRNWks70/KVRlCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="167754404"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 09:42:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH v4] drm/xe: Make VMA tile_present,
 tile_invalidated access rules clear
Date: Mon,  2 Jun 2025 09:44:12 -0700
Message-Id: <20250602164412.1912293-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Document VMA tile_invalidated access rules, use READ_ONCE / WRITE_ONCE
for opportunistic checks of tile_present and tile_invalidated, move
tile_invalidated state change from page fault handler to PT code under
the correct locks, and add lockdep asserts to TLB invalidation paths.

v2:
 - Assert VM dma-resv lock rather than BO in zap PTEs
v3:
 - Back to BO's dma-resv lock, adjust documentation
v4:
 - Add WRITE_ONCE in xe_vm_invalidate_vma (Thomas)
 - Change lockdep assert for userptr in xe_vm_invalidate_vma (CI)
 - Take userptr notifier lock in read mode in xe_vm_userptr_pin before
   calling xe_vm_invalidate_vma (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++----
 drivers/gpu/drm/xe/xe_pt.c           | 16 +++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c           | 19 +++++++++++++++----
 drivers/gpu/drm/xe/xe_vm_types.h     | 11 +++++++++--
 4 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 7a8f87709e39..05fbc83c64b7 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -68,8 +68,12 @@ static bool access_is_atomic(enum access_type access_type)
 
 static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 {
-	return BIT(tile->id) & vma->tile_present &&
-		!(BIT(tile->id) & vma->tile_invalidated);
+	/*
+	 * Advisory only check whether the VMA currently has a valid mapping,
+	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
+	 */
+	return BIT(tile->id) & READ_ONCE(vma->tile_present) &&
+		!(BIT(tile->id) & READ_ONCE(vma->tile_invalidated));
 }
 
 
@@ -121,7 +125,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 
 	trace_xe_vma_pagefault(vma);
 
-	/* Check if VMA is valid */
+	/* Check if VMA is valid, opportunistic check only */
 	if (vma_is_valid(tile, vma) && !atomic)
 		return 0;
 
@@ -158,7 +162,6 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 
 	dma_fence_wait(fence, false);
 	dma_fence_put(fence);
-	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
 	drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index c9c41fbe125c..f39d5cc9f411 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -907,6 +907,11 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
 	u8 pt_mask = (vma->tile_present & ~vma->tile_invalidated);
 
+	if (xe_vma_bo(vma))
+		xe_bo_assert_held(xe_vma_bo(vma));
+	else if (xe_vma_is_userptr(vma))
+		lockdep_assert_held(&xe_vma_vm(vma)->userptr.notifier_lock);
+
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
@@ -2191,10 +2196,15 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 					   DMA_RESV_USAGE_KERNEL :
 					   DMA_RESV_USAGE_BOOKKEEP);
 	}
-	vma->tile_present |= BIT(tile->id);
-	vma->tile_staged &= ~BIT(tile->id);
+	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
+	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile->id));
 	if (invalidate_on_bind)
-		vma->tile_invalidated |= BIT(tile->id);
+		WRITE_ONCE(vma->tile_invalidated,
+			   vma->tile_invalidated | BIT(tile->id));
+	else
+		WRITE_ONCE(vma->tile_invalidated,
+			   vma->tile_invalidated & ~BIT(tile->id));
+	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
 		lockdep_assert_held_read(&vm->userptr.notifier_lock);
 		to_userptr_vma(vma)->userptr.initial_bind = true;
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7140d8856bad..18f967ce1f1a 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -732,7 +732,9 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 					      DMA_RESV_USAGE_BOOKKEEP,
 					      false, MAX_SCHEDULE_TIMEOUT);
 
+			down_read(&vm->userptr.notifier_lock);
 			err = xe_vm_invalidate_vma(&uvma->vma);
+			up_read(&vm->userptr.notifier_lock);
 			xe_vm_unlock(vm);
 			if (err)
 				break;
@@ -3853,6 +3855,7 @@ void xe_vm_unlock(struct xe_vm *vm)
 int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
+	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_tile *tile;
 	struct xe_gt_tlb_invalidation_fence
 		fence[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
@@ -3864,17 +3867,24 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	xe_assert(xe, !xe_vma_is_cpu_addr_mirror(vma));
 	trace_xe_vma_invalidate(vma);
 
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	vm_dbg(&vm->xe->drm,
 	       "INVALIDATE: addr=0x%016llx, range=0x%016llx",
 		xe_vma_start(vma), xe_vma_size(vma));
 
-	/* Check that we don't race with page-table updates */
+	/*
+	 * Check that we don't race with page-table updates, tile_invalidated
+	 * update is safe
+	 */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (xe_vma_is_userptr(vma)) {
+			lockdep_assert(lockdep_is_held_type(&vm->userptr.notifier_lock, 0) ||
+				       (lockdep_is_held_type(&vm->userptr.notifier_lock, 1) &&
+					lockdep_is_held(&xe_vm_resv(vm)->lock.base)));
+
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&to_userptr_vma(vma)->userptr.notifier,
 				      to_userptr_vma(vma)->userptr.notifier_seq));
-			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
+			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(vm),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
 		} else {
@@ -3914,7 +3924,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	for (id = 0; id < fence_id; ++id)
 		xe_gt_tlb_invalidation_fence_wait(&fence[id]);
 
-	vma->tile_invalidated = vma->tile_mask;
+	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
+	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 0e1318a15c9e..4275f71a74dd 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -100,14 +100,21 @@ struct xe_vma {
 		struct work_struct destroy_work;
 	};
 
-	/** @tile_invalidated: VMA has been invalidated */
+	/**
+	 * @tile_invalidated: Tile mask of binding are invalidated for this VMA.
+	 * protected by BO's resv and for userptrs, vm->userptr.notifier_lock in
+	 * write mode for writing or vm->userptr.notifier_lock in read mode and
+	 * the vm->resv. For stable reading, BO's resv or useptr
+	 * vm->userptr.notifier_lock in read mode is required. Can be
+	 * opportunisticly read with READ_ONCE outside of locks.
+	 */
 	u8 tile_invalidated;
 
 	/** @tile_mask: Tile mask of where to create binding for this VMA */
 	u8 tile_mask;
 
 	/**
-	 * @tile_present: GT mask of binding are present for this VMA.
+	 * @tile_present: Tile mask of binding are present for this VMA.
 	 * protected by vm->lock, vm->resv and for userptrs,
 	 * vm->userptr.notifier_lock for writing. Needs either for reading,
 	 * but if reading is done under the vm->lock only, it needs to be held
-- 
2.34.1

