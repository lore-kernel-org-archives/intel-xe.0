Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2592C54F30
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 05:51:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F24E10E244;
	Fri, 30 May 2025 05:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hi+FOn8Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03D910E244
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 05:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748584274; x=1780120274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Aq5pGdhMLOcfwh96dcb/XmJtX/2iV3OPWjfNlbOx92Q=;
 b=hi+FOn8YvnH5xdeEPspgVQI26havuDw3zxKSYzhlTOoQxe7ea0zw7MDw
 sydJ3VbFdkQj/30n0pZO08u8ITvhBizFfpuOxzBQqzU367rAMzu2wy+E1
 tu8SyNy79PVyLGvgw5QldCh0rtdRBWbfTpWQzT+cc9vBVrqg37TD4XWd4
 KZ5l7l7hABS4dqVn84y0LaIOLwWnLG4+BdeBboW+n3qM+Z2wm7aVF0sdo
 /+CgZUi02/SoSHfEiJMhjuERaIlhfx0EUdB+zRALfwq98QKgsTL/0PPJx
 cto99vD+faHDvQFgy7+cbT+2h5jH5z/wnW1R0moSPfbqoNKttV4AH5i5K g==;
X-CSE-ConnectionGUID: bgSQL+ZHQQWWhicCrRZNpA==
X-CSE-MsgGUID: c0X9b3pjRYi2/HQo8HygFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62013538"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="62013538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 22:51:13 -0700
X-CSE-ConnectionGUID: EmUH+x8SQtqIA/CEd/gwyQ==
X-CSE-MsgGUID: 7MKKDDXnSRmCgZ9/SnSLVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="174668676"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 22:51:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH] drm/xe: Make VMA tile_present,
 tile_invalidated access rules clear
Date: Thu, 29 May 2025 22:52:33 -0700
Message-Id: <20250530055233.1780550-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Document VMA tile_invalidated access rules, use READ_ONCE / WRITE_ONCE
for opportunistic checks of tile_present and tile_invalidated, move
tile_invalidated state change from page fault handler to PT code under
the correct locks, and add lockdep asserts to TLB invalidation paths.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 11 +++++++----
 drivers/gpu/drm/xe/xe_pt.c           | 16 +++++++++++++---
 drivers/gpu/drm/xe/xe_vm.c           |  1 +
 drivers/gpu/drm/xe/xe_vm_types.h     | 11 +++++++++--
 4 files changed, 30 insertions(+), 9 deletions(-)

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
index 7140d8856bad..e781e8138f34 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3871,6 +3871,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	/* Check that we don't race with page-table updates */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (xe_vma_is_userptr(vma)) {
+			lockdep_assert_held_write(&xe_vma_vm(vma)->userptr.notifier_lock);
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&to_userptr_vma(vma)->userptr.notifier,
 				      to_userptr_vma(vma)->userptr.notifier_seq));
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index bfc145baad49..4ec3a7f8e3ed 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -100,14 +100,21 @@ struct xe_vma {
 		struct work_struct destroy_work;
 	};
 
-	/** @tile_invalidated: VMA has been invalidated */
+	/**
+	 * @tile_invalidated: Tile mask of binding are invalidated for this VMA.
+	 * protected by vm->resv and for userptrs, vm->userptr.notifier_lock in
+	 * write mode for writing or vm->userptr.notifier_lock in read mode and
+	 * the vm->resv. For stable reading, vm->resv or useptr
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

