Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FEAFB519A
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 05:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E52110E29B;
	Tue,  7 Apr 2026 05:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTg4jyhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC0110E29B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 05:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775541086; x=1807077086;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NmznsLZ4V3KiVam1VHMcxm93/Ua+Pdz9WfKRc0W8MMk=;
 b=CTg4jyhN8fZckyyY9FzfzdRMUq2la8tfAT+t0wDygczClg8sWBrKGksy
 UUnBMeOWI6m+M75eMgqdX2+o9AzHQBBn9yoU1YHT720iyaaV+DJD+MXbv
 JB863gbmyrYfJXv4SneHrJhmkieSG8CGzd0SHLQS08GEbfT0OGy/+nI/E
 8Xuh8g/BDDu3CYB57+hmgS7NbBA6QJn5d3I2G5jE5DuOu9mBAaHN4EK0/
 WA0fzb7vQZyldPAqa3Sml8yoJYuNA0jIdLNVzY/+xHdynl4t2aAM8NWai
 MO9STAdelMlky3HWKM20Bh6Ab+wx5jM7v5UdGSOyv1GlV0d4jblNVi9Xw A==;
X-CSE-ConnectionGUID: YWG5twd5Trmy7UV9UPwn/w==
X-CSE-MsgGUID: G32u4toaR1mFbt/UIkVK6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76211179"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76211179"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:51:26 -0700
X-CSE-ConnectionGUID: n3wiVjcuSo6QTlQ7Zz5Dlg==
X-CSE-MsgGUID: y9lTLqEHQD2IV6nOUhklXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="251357680"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 22:51:24 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V2] Use xe_map_resource_to_region helper instead of direct
 access
Date: Tue,  7 Apr 2026 11:21:08 +0530
Message-ID: <20260407055107.2782450-2-tejas.upadhyay@intel.com>
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
to obtain VRAM region data allowing VRAM manager to own block->private
for future use cases.

V2(MattB): Add more detail about patch also adjust variable placement

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c   | 21 ++++-----------------
 drivers/gpu/drm/xe/xe_svm.c  | 10 ++--------
 drivers/gpu/drm/xe/xe_vram.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.h |  2 ++
 4 files changed, 30 insertions(+), 25 deletions(-)

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
index 5933b2b6392b..ba67355f64cb 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -786,12 +786,12 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
 	struct list_head *blocks = &to_xe_ttm_vram_mgr_resource(res)->blocks;
+	struct xe_vram_region *vr = xe_map_resource_to_region(res);
+	struct gpu_buddy *buddy = vram_to_buddy(vr);
 	struct gpu_buddy_block *block;
 	int j = 0;
 
 	list_for_each_entry(block, blocks, link) {
-		struct xe_vram_region *vr = block->private;
-		struct gpu_buddy *buddy = vram_to_buddy(vr);
 		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
 						    gpu_buddy_block_offset(block));
 		int i;
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

