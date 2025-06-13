Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9FDC71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 21:01:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB5010E9AE;
	Fri, 13 Jun 2025 21:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bx6/RRbw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F27610E9BA
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Jun 2025 21:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749848470; x=1781384470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qNfOvyneYKSZyiBamyCJnftOzbTtarskjblwCKYvEho=;
 b=Bx6/RRbwvxlAJ/jyht72zrEdMl9UqWgT4qVzTkGQbWF9fLHvaQfdpnpD
 +feCGwNkHXot876rhkI5QMGnPOzLS/FUxxMa2i5rJWQr8jMlHVZETzxyE
 4lszAcVv2uScxD72BG/gPSQCzjwzFsxHaAZA1OdAM370SH3ME6QyrKszT
 TzhFEP+K6H9kJ1LiXu5HJlAtH3VgtLK9XjShG0Q68rvjTRq3361DYLP97
 aMpMdeFCVs7hHmFYHBYrBCjQB5OzALh5KWfz0N16vPgFm1EZFtjJ4qQga
 kN+HE4mgghqpRzfEcSbsBGn8MB7xAqyev9kkgKUP4GE8h9T7ZKF4xSOcH Q==;
X-CSE-ConnectionGUID: Q+/2MIsQQVqbQxl5+M29Ow==
X-CSE-MsgGUID: 6QiGeW+iTkyus9wWbfPhJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55750679"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="55750679"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:01:09 -0700
X-CSE-ConnectionGUID: PvLNIhDuRIOVTZlNaoppow==
X-CSE-MsgGUID: 7EI9xdOzSxCRWY7HvRC79g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; d="scan'208";a="171108142"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 14:01:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH v2 1/2] drm/xe: Add xe_vm_has_valid_gpu_pages helper
Date: Fri, 13 Jun 2025 14:02:41 -0700
Message-Id: <20250613210242.718441-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613210242.718441-1-matthew.brost@intel.com>
References: <20250613210242.718441-1-matthew.brost@intel.com>
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

Rather than having multiple READ_ONCE of the tile_* fields and comments
in code, use helper with kernel doc for single access point and clear
rules.

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  9 ++-------
 drivers/gpu/drm/xe/xe_pt.c           |  6 +++---
 drivers/gpu/drm/xe/xe_svm.c          | 16 +++++++---------
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 drivers/gpu/drm/xe/xe_vm.h           | 19 +++++++++++++++++++
 5 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index e2d975b2fddb..adfd6a26b5d8 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -69,15 +69,10 @@ static bool access_is_atomic(enum access_type access_type)
 
 static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 {
-	/*
-	 * Advisory only check whether the VMA currently has a valid mapping,
-	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c
-	 */
-	return BIT(tile->id) & READ_ONCE(vma->tile_present) &&
-		!(BIT(tile->id) & READ_ONCE(vma->tile_invalidated));
+	return xe_vm_has_valid_gpu_pages(tile, vma->tile_present,
+					 vma->tile_invalidated);
 }
 
-
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		       bool atomic, unsigned int id)
 {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f39d5cc9f411..59496c1a1e77 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2196,7 +2196,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 					   DMA_RESV_USAGE_KERNEL :
 					   DMA_RESV_USAGE_BOOKKEEP);
 	}
-	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
+	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_pages() */
 	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile->id));
 	if (invalidate_on_bind)
 		WRITE_ONCE(vma->tile_invalidated,
@@ -2255,7 +2255,7 @@ static void range_present_and_invalidated_tile(struct xe_vm *vm,
 					       struct xe_svm_range *range,
 					       u8 tile_id)
 {
-	/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
+	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_pages() */
 
 	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
 
@@ -2324,7 +2324,7 @@ static void op_commit(struct xe_vm *vm,
 	}
 	case DRM_GPUVA_OP_DRIVER:
 	{
-		/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
+		/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_pages() */
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
 			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
 		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 2fbbd6a604ea..ce6b9e637b16 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	for_each_tile(tile, xe, id)
 		if (xe_pt_zap_ptes_range(tile, vm, range)) {
 			tile_mask |= BIT(id);
-			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
+			/*
+			 * WRITE_ONCE pairs with READ_ONCE in
+			 * xe_vm_has_valid_gpu_pages()
+			 */
 			WRITE_ONCE(range->tile_invalidated,
 				   range->tile_invalidated | BIT(id));
 		}
@@ -605,14 +608,9 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 				  struct xe_tile *tile,
 				  bool devmem_only)
 {
-	/*
-	 * Advisory only check whether the range currently has a valid mapping,
-	 * READ_ONCE pairs with WRITE_ONCE in xe_pt.c,
-	 * xe_svm_range_notifier_event_begin
-	 */
-	return ((READ_ONCE(range->tile_present) &
-		 ~READ_ONCE(range->tile_invalidated)) & BIT(tile->id)) &&
-		(!devmem_only || xe_svm_range_in_vram(range));
+	return (xe_vm_has_valid_gpu_pages(tile, range->tile_present,
+					  range->tile_invalidated) &&
+		(!devmem_only || xe_svm_range_in_vram(range)));
 }
 
 /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6ef8c4dab647..2bef0537a3c9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3961,7 +3961,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
 						    xe_vma_end(vma), tile_mask);
 
-	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
+	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_pages() */
 	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index acd3fd6c605b..75eb7a1e2b83 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -375,6 +375,25 @@ static inline bool xe_vm_is_validating(struct xe_vm *vm)
 	return false;
 }
 
+/**
+ * xe_vm_has_valid_gpu_pages() - Advisory helper to check if VMA or SVM range has
+ * valid GPU pages
+ * @tile: The tile which the GPU pages belong to
+ * @tile_present: Tile present mask
+ * @tile_invalidated: Tile invalidated mask
+ *
+ * The READ_ONCEs pair with WRITE_ONCEs in either the TLB invalidation paths
+ * (xe_vm.c, xe_svm.c) or the binding paths (xe_pt.c). These are not reliable
+ * without the notifier lock in userptr or SVM cases, and not reliable without
+ * the BO dma-resv lock in the BO case. As such, they should only be used in
+ * opportunistic cases (e.g., skipping a page fault fix or not skipping a TLB
+ * invalidation) where it is harmless.
+ *
+ * Return: True is there are valid GPU pages, False otherwise
+ */
+#define xe_vm_has_valid_gpu_pages(tile, tile_present, tile_invalidated)	\
+	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT(tile->id))
+
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
 #else
-- 
2.34.1

