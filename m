Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B21C7115C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D1210E2AA;
	Mon, 16 Jun 2025 06:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="niun6KdW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC0D10E28B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 06:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750055332; x=1781591332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BTACCayWj8hEm+OoZ97APTZIEOxhM9WkXQViIngI0hw=;
 b=niun6KdWMXo9w7BMD7pEjSha5idWGzF0Bc9ntGZEERFgKzN86C3vzIRv
 cMk89ChtYlyp1JU3/dyxL5JGmx5jCShh2vM1nCmuAPPamv4nXhFxzr3Rz
 O0oAZiclB5h4yFDSYrQnVTRyuFvMLkwkWf9tbDLAyg0s4bO/0ENlcD0lt
 4Mmbl142O6XBbFK7geIX4Ksh9/MoIieHZOHTOJDS9rdfywDrD84sIBKml
 e4eBv9AeA885Ap4XVfSBl1XaZ4v81OtDb9Pb4Qx6ipgxunRoDaeGJa3JS
 39pGR9vBeuVXR89eAcAz0qUg/xrXycEa1XNY9fGFW3DxEAc4bzls5FhZu g==;
X-CSE-ConnectionGUID: oR/AN6dzS82wT9Dl1THRhQ==
X-CSE-MsgGUID: 60r/khvlToe85rcdNWFdHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51298103"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="51298103"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:28:50 -0700
X-CSE-ConnectionGUID: Sjv0InOXRLStdM/1/IA8dQ==
X-CSE-MsgGUID: GITZ8rYZRSS+2oVJSJrsVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153257153"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2025 23:28:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 1/2] drm/xe: Add xe_vm_has_valid_gpu_mapping helper
Date: Sun, 15 Jun 2025 23:30:23 -0700
Message-Id: <20250616063024.2059829-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250616063024.2059829-1-matthew.brost@intel.com>
References: <20250616063024.2059829-1-matthew.brost@intel.com>
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

v3:
 - s/xe_vm_has_valid_gpu_pages/xe_vm_has_valid_gpu_mapping

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
index e2d975b2fddb..3522865c67c9 100644
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
+	return xe_vm_has_valid_gpu_mapping(tile, vma->tile_present,
+					   vma->tile_invalidated);
 }
 
-
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		       bool atomic, unsigned int id)
 {
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index f39d5cc9f411..9c30111e8786 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -2196,7 +2196,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 					   DMA_RESV_USAGE_KERNEL :
 					   DMA_RESV_USAGE_BOOKKEEP);
 	}
-	/* All WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
+	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 	WRITE_ONCE(vma->tile_present, vma->tile_present | BIT(tile->id));
 	if (invalidate_on_bind)
 		WRITE_ONCE(vma->tile_invalidated,
@@ -2255,7 +2255,7 @@ static void range_present_and_invalidated_tile(struct xe_vm *vm,
 					       struct xe_svm_range *range,
 					       u8 tile_id)
 {
-	/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
+	/* All WRITE_ONCE pair with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 
 	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
 
@@ -2324,7 +2324,7 @@ static void op_commit(struct xe_vm *vm,
 	}
 	case DRM_GPUVA_OP_DRIVER:
 	{
-		/* WRITE_ONCE pairs with READ_ONCE in xe_svm.c */
+		/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 		if (op->subop == XE_VMA_SUBOP_MAP_RANGE)
 			range_present_and_invalidated_tile(vm, op->map_range.range, tile->id);
 		else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 2fbbd6a604ea..26418e9bdff0 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -141,7 +141,10 @@ xe_svm_range_notifier_event_begin(struct xe_vm *vm, struct drm_gpusvm_range *r,
 	for_each_tile(tile, xe, id)
 		if (xe_pt_zap_ptes_range(tile, vm, range)) {
 			tile_mask |= BIT(id);
-			/* Pairs with READ_ONCE in xe_svm_range_is_valid */
+			/*
+			 * WRITE_ONCE pairs with READ_ONCE in
+			 * xe_vm_has_valid_gpu_mapping()
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
+	return (xe_vm_has_valid_gpu_mapping(tile, range->tile_present,
+					    range->tile_invalidated) &&
+		(!devmem_only || xe_svm_range_in_vram(range)));
 }
 
 /** xe_svm_range_migrate_to_smem() - Move range pages from VRAM to SMEM
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 6ef8c4dab647..04d1a43b81e3 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3961,7 +3961,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	ret = xe_vm_range_tilemask_tlb_invalidation(xe_vma_vm(vma), xe_vma_start(vma),
 						    xe_vma_end(vma), tile_mask);
 
-	/* WRITE_ONCE pair with READ_ONCE in xe_gt_pagefault.c */
+	/* WRITE_ONCE pairs with READ_ONCE in xe_vm_has_valid_gpu_mapping() */
 	WRITE_ONCE(vma->tile_invalidated, vma->tile_mask);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index acd3fd6c605b..cc332c4ebdf2 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -375,6 +375,25 @@ static inline bool xe_vm_is_validating(struct xe_vm *vm)
 	return false;
 }
 
+/**
+ * xe_vm_has_valid_gpu_mapping() - Advisory helper to check if VMA or SVM range has
+ * a valid GPU mapping
+ * @tile: The tile which the GPU mapping belongs to
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
+#define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
+	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT(tile->id))
+
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
 #else
-- 
2.34.1

