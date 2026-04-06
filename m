Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F38BE9D837
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 05:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D90110E0A9;
	Mon,  6 Apr 2026 05:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6NSfkG7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3082010E0A9
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Apr 2026 05:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775454190; x=1806990190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O4KgffsoXM85fPUr0AKFwZlLromvt+JlpXJQgPAS1rc=;
 b=N6NSfkG7AByldgAHgxVo0pdRjhOPrkz1A8rsinS89NntOfFRKhohy0aw
 nB7R9DFzhfyTtEl4e+HaQJII4rzZdDc96x9zyfmGjuHSBK5rQ0T1zEXoY
 g1oRRSC9q2OK2IcgWi2F2K+BKtSCYycgka8uPtNustbg4/I9vzJng8LyD
 0VeszUcJ6Ldquv3iUzK1eHOUrGXabcz1996Z9o6IXHfUaMZ9L/EeVuH3A
 Re4Xclnb4qbRbNkbx2Ym+XR5S5QGYAVnKh+mTf9HiScv1iV+UShWiBzKi
 CCwdHe3yhdjdrrr9VxkXoaQhHbukE9Pc7/8uLDVHfEqoqh54INL5cDo8Y A==;
X-CSE-ConnectionGUID: ZLOtrOjBTMG20o/kwpmLpA==
X-CSE-MsgGUID: F5VRvO9JS32WmRx1QaCx/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76369313"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76369313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:43:10 -0700
X-CSE-ConnectionGUID: /9kbFh5LSfKBVL+fx9cxtQ==
X-CSE-MsgGUID: d3aSLXaJQnqhVOeyMnBJxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="232195614"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:43:09 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH] drm/xe/svm: Use xe_map_resource_to_region helper instead of
 direct access
Date: Mon,  6 Apr 2026 11:12:50 +0530
Message-ID: <20260406054249.2769479-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

Renaming:
The helper function res_to_mem_region is now xe_map_resource_to_region.

Abstraction:
The patch removes instances where block->private was accessed directly
to obtain VRAM region data.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c   | 21 ++++-----------------
 drivers/gpu/drm/xe/xe_svm.c  |  8 +-------
 drivers/gpu/drm/xe/xe_vram.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h |  2 ++
 4 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index a7c2dc7f224c..daac53168dba 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -173,19 +173,6 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 	return tile->migrate;
 }
 
-static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
-{
-	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
-	struct ttm_resource_manager *mgr;
-	struct xe_ttm_vram_mgr *vram_mgr;
-
-	xe_assert(xe, resource_is_vram(res));
-	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
-	vram_mgr = to_xe_ttm_vram_mgr(mgr);
-
-	return container_of(vram_mgr, struct xe_vram_region, ttm);
-}
-
 static void try_add_system(struct xe_device *xe, struct xe_bo *bo,
 			   u32 bo_flags, u32 *c)
 {
@@ -635,7 +622,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_vram_region *vram = res_to_mem_region(mem);
+		struct xe_vram_region *vram = xe_map_resource_to_region(mem);
 
 		if (!xe_ttm_resource_visible(mem))
 			return -EINVAL;
@@ -1642,7 +1629,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
 
-	vram = res_to_mem_region(ttm_bo->resource);
+	vram = xe_map_resource_to_region(ttm_bo->resource);
 	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0, &cursor);
 	return (vram->io_start + cursor.start) >> PAGE_SHIFT;
 }
@@ -1782,7 +1769,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 		goto out;
 	}
 
-	vram = res_to_mem_region(ttm_bo->resource);
+	vram = xe_map_resource_to_region(ttm_bo->resource);
 	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
 		     xe_bo_size(bo) - (offset & PAGE_MASK), &cursor);
 
@@ -2923,7 +2910,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 	case XE_PL_SYSTEM:
 		return 0;
 	default:
-		return res_to_mem_region(res)->dpa_base;
+		return xe_map_resource_to_region(res)->dpa_base;
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 5933b2b6392b..71fbc75bd0da 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -790,7 +790,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 	int j = 0;
 
 	list_for_each_entry(block, blocks, link) {
-		struct xe_vram_region *vr = block->private;
+		struct xe_vram_region *vr = xe_map_resource_to_region(res);
 		struct gpu_buddy *buddy = vram_to_buddy(vr);
 		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
 						    gpu_buddy_block_offset(block));
@@ -1061,9 +1061,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
-	struct gpu_buddy_block *block;
 	struct xe_validation_ctx vctx;
-	struct list_head *blocks;
 	struct drm_exec exec;
 	struct xe_bo *bo;
 	int err = 0, idx;
@@ -1100,10 +1098,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 					&dpagemap_devmem_ops, dpagemap, end - start,
 					pre_migrate_fence);
 
-		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-		list_for_each_entry(block, blocks, link)
-			block->private = vr;
-
 		xe_bo_get(bo);
 
 		/* Ensure the device has a pm ref while there are device pages active. */
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 0538dcb8b18c..23eb7edbdd57 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,6 +13,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
@@ -249,6 +250,27 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
 	return 0;
 }
 
+/**
+ * xe_map_resource_to_region - Map ttm resource to vram memory region
+ * @res: The ttm resource
+ *
+ * Get vram memory region using vram memory manager managing this resource
+ *
+ * Returns: pointer to xe_vram_region
+ */
+struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res)
+{
+	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
+	struct ttm_resource_manager *mgr;
+	struct xe_ttm_vram_mgr *vram_mgr;
+
+	xe_assert(xe, mem_type_is_vram(res->mem_type));
+	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
+	vram_mgr = to_xe_ttm_vram_mgr(mgr);
+
+	return container_of(vram_mgr, struct xe_vram_region, ttm);
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 72860f714fc6..dd1c8bf17922 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -10,7 +10,9 @@
 
 struct xe_device;
 struct xe_vram_region;
+struct ttm_resource;
 
+struct xe_vram_region *xe_map_resource_to_region(struct ttm_resource *res);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
-- 
2.52.0

