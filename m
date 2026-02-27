Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0451FEFB4D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 13:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A8E10EB65;
	Fri, 27 Feb 2026 13:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nyTXbFW7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC3D10EB65
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772199924; x=1803735924;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LeARrjxeoRUojzHkO+TKZf14TbQ2beIUfnkfcoe1Upk=;
 b=nyTXbFW7plmRYw+FaIYZU5U1f9hbqqt8dzhFUvTleQ5MPqV/HiN6O3IW
 WWkzxsyzykHGtSGpQzKyWpe1J3PUSId5O5F3FtEqlf8hdbH9afu8PXNSY
 yJVbzAvpdyAkpRXHia0tc9H5CBa1u0WMlT6YCSLskcBYHzDmA8YQ/oWW0
 5Y1P+YjtSUDRbc1JoKEJicSLdBz3MeWYC3SuqL0ViuwXo/SnBmihcfieA
 vxRqtcqHg6TKhGc/HRGQRgXZa2Bd4mu7jsM/9fpNoakikx/UIdcDY8sPK
 5jGpAPFQcpAyhb6sc0oUvTUSHrtzAaqPz+D2SMPhUHoTuBRETdiktvYmf g==;
X-CSE-ConnectionGUID: +CNoD1pvTxOIThJQIpwS8g==
X-CSE-MsgGUID: 2idHv5UXTNKr8/XsN/xdXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84633181"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="84633181"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:24 -0800
X-CSE-ConnectionGUID: oiB65LeTRAiAbqhU2kLYWg==
X-CSE-MsgGUID: /m+dVGgpTUm/8w7Uykm5+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216021714"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 05:45:23 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V4 1/7] drm/xe/svm: Use res_to_mem_region
Date: Fri, 27 Feb 2026 19:14:38 +0530
Message-ID: <20260227134453.1814649-10-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
References: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
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

Replace the direct use of block->private with the helper function
res_to_mem_region to get vram region.

V3(MattB): kernel-doc and move declarations out of loop
V2(MattA): Use res_to_mem_region

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c  | 18 +++++++++++++-----
 drivers/gpu/drm/xe/xe_bo.h  |  1 +
 drivers/gpu/drm/xe/xe_svm.c | 10 ++--------
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d6c2cb959cdd..e276eb91d54a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -173,7 +173,15 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 	return tile->migrate;
 }
 
-static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
+/**
+ * xe_get_memory_region_from_resource - find memory region from resource used by BO
+ * @res: The ttm_resource used by BO
+ *
+ * Extract memory region from resource used by BO
+ *
+ * Returns: A pointer to struct xe_vram_region
+ */
+struct xe_vram_region *xe_get_memory_region_from_resource(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
@@ -637,7 +645,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_vram_region *vram = res_to_mem_region(mem);
+		struct xe_vram_region *vram = xe_get_memory_region_from_resource(mem);
 
 		if (!xe_ttm_resource_visible(mem))
 			return -EINVAL;
@@ -1506,7 +1514,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
 
-	vram = res_to_mem_region(ttm_bo->resource);
+	vram = xe_get_memory_region_from_resource(ttm_bo->resource);
 	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0, &cursor);
 	return (vram->io_start + cursor.start) >> PAGE_SHIFT;
 }
@@ -1658,7 +1666,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 		goto out;
 	}
 
-	vram = res_to_mem_region(ttm_bo->resource);
+	vram = xe_get_memory_region_from_resource(ttm_bo->resource);
 	xe_res_first(ttm_bo->resource, offset & PAGE_MASK,
 		     xe_bo_size(bo) - (offset & PAGE_MASK), &cursor);
 
@@ -2752,7 +2760,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 	case XE_PL_SYSTEM:
 		return 0;
 	default:
-		return res_to_mem_region(res)->dpa_base;
+		return xe_get_memory_region_from_resource(res)->dpa_base;
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index c914ab719f20..7ef6e0d87e68 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -311,6 +311,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 		      struct drm_mode_create_dumb *args);
 
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo);
+struct xe_vram_region *xe_get_memory_region_from_resource(struct ttm_resource *res);
 
 static inline size_t xe_bo_ccs_pages_start(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 78f4b2c60670..4c52c59bad41 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -758,12 +758,12 @@ static int xe_svm_populate_devmem_pfn(struct drm_pagemap_devmem *devmem_allocati
 	struct xe_bo *bo = to_xe_bo(devmem_allocation);
 	struct ttm_resource *res = bo->ttm.resource;
 	struct list_head *blocks = &to_xe_ttm_vram_mgr_resource(res)->blocks;
+	struct xe_vram_region *vr = xe_get_memory_region_from_resource(res);
+	struct drm_buddy *buddy = vram_to_buddy(vr);
 	struct drm_buddy_block *block;
 	int j = 0;
 
 	list_for_each_entry(block, blocks, link) {
-		struct xe_vram_region *vr = block->private;
-		struct drm_buddy *buddy = vram_to_buddy(vr);
 		u64 block_pfn = block_offset_to_pfn(devmem_allocation->dpagemap,
 						    drm_buddy_block_offset(block));
 		int i;
@@ -1033,9 +1033,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 	struct dma_fence *pre_migrate_fence = NULL;
 	struct xe_device *xe = vr->xe;
 	struct device *dev = xe->drm.dev;
-	struct drm_buddy_block *block;
 	struct xe_validation_ctx vctx;
-	struct list_head *blocks;
 	struct drm_exec exec;
 	struct xe_bo *bo;
 	int err = 0, idx;
@@ -1072,10 +1070,6 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 					&dpagemap_devmem_ops, dpagemap, end - start,
 					pre_migrate_fence);
 
-		blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
-		list_for_each_entry(block, blocks, link)
-			block->private = vr;
-
 		xe_bo_get(bo);
 
 		/* Ensure the device has a pm ref while there are device pages active. */
-- 
2.52.0

