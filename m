Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6C8C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DEB10E623;
	Fri, 19 May 2023 23:18:59 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB63310E4A5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538328; x=1716074328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TUJOY7UO5REyLpyJ3TiU1n7bty1jJNr2v49S1WcqNmk=;
 b=JKG67orNhVdZnDIRDU5w4n9N0bo9f+rjpqdhLwGdQewZrRd3lo8k/lPv
 j0JmDBOUoVPbJS9Fd+pi9wAzGGIDNAzMD3AHmE/D+GxzyMwO/wB1CUEDU
 HD4M1wFu+bLeUbmSsthqmkQ98msvGDlHdK62Lm5+E1q0GbHKi4rCzmSOq
 RdBGZLr9qTkajXgZKk53W8L9D02USmaiG7WcQo1tEICQ/XRJ5mksFcpXT
 iGWugr0H/CtlDQhu1RQFNQc6QMVtMvc0SCsAxt74Do7KFcL40krYobxtq
 pNGqZQNCbc8uTEY4b0kDqXp49CyBVxpHVWE8ruSFdq012p9cqPlMzEILE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526349"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526349"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888708"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888708"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:40 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:06 -0700
Message-Id: <20230519231827.3572452-10-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 09/30] drm/xe: Move VRAM from GT to tile
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On platforms with VRAM, the VRAM is associated with the tile, not the
GT.

v2:
 - Unsquash the GGTT handling back into its own patch.
 - Fix kunit test build

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/Makefile                |  1 +
 drivers/gpu/drm/xe/tests/xe_bo.c           |  6 +-
 drivers/gpu/drm/xe/xe_bo.c                 | 44 ++++++------
 drivers/gpu/drm/xe/xe_bo.h                 |  4 +-
 drivers/gpu/drm/xe/xe_device.c             | 14 ++--
 drivers/gpu/drm/xe/xe_device_types.h       | 28 ++++++++
 drivers/gpu/drm/xe/xe_gt.c                 | 83 ++--------------------
 drivers/gpu/drm/xe/xe_gt_pagefault.c       |  6 +-
 drivers/gpu/drm/xe/xe_gt_types.h           | 35 ---------
 drivers/gpu/drm/xe/xe_irq.c                |  2 +-
 drivers/gpu/drm/xe/xe_mmio.c               | 45 ++++++------
 drivers/gpu/drm/xe/xe_pci.c                |  2 -
 drivers/gpu/drm/xe/xe_pt.c                 |  4 +-
 drivers/gpu/drm/xe/xe_query.c              |  4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h         |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               | 33 ++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 16 ++---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |  4 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  6 +-
 19 files changed, 147 insertions(+), 192 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cd1614b68734..94ed64be86e3 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -84,6 +84,7 @@ xe-y += xe_bb.o \
 	xe_sched_job.o \
 	xe_step.o \
 	xe_sync.o \
+	xe_tile.o \
 	xe_trace.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 8f3afdc6cca6..6235a6c73a06 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -115,9 +115,9 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
 	int ret;
 
 	/* TODO: Sanity check */
-	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt->info.vram_id;
+	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
 	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
-		   gt->info.vram_id);
+		   gt_to_tile(gt)->id);
 
 	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
 				 vram_bit);
@@ -179,7 +179,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 	int err, i;
 
 	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
-		   dev_name(xe->drm.dev), gt->info.id, gt->info.vram_id);
+		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
 
 	for (i = 0; i < 2; ++i) {
 		xe_vm_lock(vm, &ww, 0, false);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ecc82fefdf4c..5dbca5bbca8f 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -71,25 +71,25 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 	return bo->flags & XE_BO_CREATE_USER_BIT;
 }
 
-static struct xe_gt *
-mem_type_to_gt(struct xe_device *xe, u32 mem_type)
+static struct xe_tile *
+mem_type_to_tile(struct xe_device *xe, u32 mem_type)
 {
 	XE_BUG_ON(mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type));
 
-	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
+	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
 }
 
 /**
- * xe_bo_to_gt() - Get a GT from a BO's memory location
+ * xe_bo_to_tile() - Get a tile from a BO's memory location
  * @bo: The buffer object
  *
- * Get a GT from a BO's memory location, should be called on BOs in VRAM only.
+ * Get a tile from a BO's memory location, should be called on BOs in VRAM only.
  *
- * Return: xe_gt object which is closest to the BO
+ * Return: xe_tile object which is closest to the BO
  */
-struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)
+struct xe_tile *xe_bo_to_tile(struct xe_bo *bo)
 {
-	return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_type);
+	return mem_type_to_tile(xe_bo_device(bo), bo->ttm.resource->mem_type);
 }
 
 static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
@@ -109,9 +109,9 @@ static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
-	struct xe_gt *gt = mem_type_to_gt(xe, mem_type);
+	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
 
-	XE_BUG_ON(!gt->mem.vram.size);
+	XE_BUG_ON(!tile->mem.vram.size);
 
 	places[*c] = (struct ttm_place) {
 		.mem_type = mem_type,
@@ -356,7 +356,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 				 struct ttm_resource *mem)
 {
 	struct xe_device *xe = ttm_to_xe_device(bdev);
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 
 	switch (mem->mem_type) {
 	case XE_PL_SYSTEM:
@@ -364,15 +364,15 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1:
-		gt = mem_type_to_gt(xe, mem->mem_type);
+		tile = mem_type_to_tile(xe, mem->mem_type);
 		mem->bus.offset = mem->start << PAGE_SHIFT;
 
-		if (gt->mem.vram.mapping &&
+		if (tile->mem.vram.mapping &&
 		    mem->placement & TTM_PL_FLAG_CONTIGUOUS)
-			mem->bus.addr = (u8 *)gt->mem.vram.mapping +
+			mem->bus.addr = (u8 *)tile->mem.vram.mapping +
 				mem->bus.offset;
 
-		mem->bus.offset += gt->mem.vram.io_start;
+		mem->bus.offset += tile->mem.vram.io_start;
 		mem->bus.is_iomem = true;
 
 #if  !defined(CONFIG_X86)
@@ -632,9 +632,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	if (bo->gt)
 		gt = bo->gt;
 	else if (resource_is_vram(new_mem))
-		gt = mem_type_to_gt(xe, new_mem->mem_type);
+		gt = &mem_type_to_tile(xe, new_mem->mem_type)->primary_gt;
 	else if (resource_is_vram(old_mem))
-		gt = mem_type_to_gt(xe, old_mem->mem_type);
+		gt = &mem_type_to_tile(xe, old_mem->mem_type)->primary_gt;
 
 	XE_BUG_ON(!gt);
 	XE_BUG_ON(!gt->migrate);
@@ -658,7 +658,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 			/* Create a new VMAP once kernel BO back in VRAM */
 			if (!ret && resource_is_vram(new_mem)) {
-				void *new_addr = gt->mem.vram.mapping +
+				void *new_addr = gt_to_tile(gt)->mem.vram.mapping +
 					(new_mem->start << PAGE_SHIFT);
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
@@ -830,14 +830,14 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 {
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
-	struct xe_gt *gt = mem_type_to_gt(xe, ttm_bo->resource->mem_type);
+	struct xe_tile *tile = mem_type_to_tile(xe, ttm_bo->resource->mem_type);
 	struct xe_res_cursor cursor;
 
 	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
 
 	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0, &cursor);
-	return (gt->mem.vram.io_start + cursor.start) >> PAGE_SHIFT;
+	return (tile->mem.vram.io_start + cursor.start) >> PAGE_SHIFT;
 }
 
 static void __xe_bo_vunmap(struct xe_bo *bo);
@@ -1338,12 +1338,12 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
 uint64_t vram_region_io_offset(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
-	struct xe_gt *gt = mem_type_to_gt(xe, res->mem_type);
+	struct xe_tile *tile = mem_type_to_tile(xe, res->mem_type);
 
 	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
-	return gt->mem.vram.io_start - xe->mem.vram.io_start;
+	return tile->mem.vram.io_start - xe->mem.vram.io_start;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e111332c35a..7a79f3893260 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -22,7 +22,7 @@
 /* -- */
 #define XE_BO_CREATE_STOLEN_BIT		BIT(4)
 #define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
-	(IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt->info.vram_id : \
+	(IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id : \
 	 XE_BO_CREATE_SYSTEM_BIT)
 #define XE_BO_CREATE_GGTT_BIT		BIT(5)
 #define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT BIT(6)
@@ -107,7 +107,7 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 			      u32 bo_flags);
 
-struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
+struct xe_tile *xe_bo_to_tile(struct xe_bo *bo);
 
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f7f6a6a97757..af165ad6f197 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -27,6 +27,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
@@ -236,6 +237,7 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 
 int xe_device_probe(struct xe_device *xe)
 {
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 	int err;
 	u8 id;
@@ -245,8 +247,12 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_alloc(xe, gt);
+	for_each_tile(tile, xe, id) {
+		err = xe_tile_alloc(tile);
+		if (err)
+			return err;
+
+		err = xe_gt_alloc(xe, &tile->primary_gt);
 		if (err)
 			return err;
 	}
@@ -281,8 +287,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_noalloc(gt);
+	for_each_tile(tile, xe, id) {
+		err = xe_tile_init_noalloc(tile);
 		if (err)
 			goto err_irq_shutdown;
 	}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index cb4d0c2ea184..e3fe47c13269 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -102,6 +102,34 @@ struct xe_tile {
 
 	/** @mem: memory management info for tile */
 	struct {
+		/**
+		 * @vram: VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct {
+			/** @io_start: IO start address of this VRAM instance */
+			resource_size_t io_start;
+			/**
+			 * @io_size: IO size of this VRAM instance
+			 *
+			 * This represents how much of this VRAM we can access
+			 * via the CPU through the VRAM BAR. This can be smaller
+			 * than @size, in which case only part of VRAM is CPU
+			 * accessible (typically the first 256M). This
+			 * configuration is known as small-bar.
+			 */
+			resource_size_t io_size;
+			/** @size: size of VRAM. */
+			resource_size_t size;
+			/** @mapping: pointer to VRAM mappable space */
+			void *__iomem mapping;
+		} vram;
+
+		/** @vram_mgr: VRAM TTM manager */
+		struct xe_ttm_vram_mgr *vram_mgr;
+
 		/** @ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
 	} mem;
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1c58a9aff2cb..ac6073a7fb59 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -37,7 +37,6 @@
 #include "xe_ring_ops.h"
 #include "xe_sa.h"
 #include "xe_sched_job.h"
-#include "xe_ttm_vram_mgr.h"
 #include "xe_tuning.h"
 #include "xe_uc.h"
 #include "xe_vm.h"
@@ -46,58 +45,23 @@
 
 struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
 {
-	struct xe_gt *search;
-	u8 id;
-
-	XE_BUG_ON(!xe_gt_is_media_type(gt));
-
-	for_each_gt(search, gt_to_xe(gt), id) {
-		if (search->info.vram_id == gt->info.vram_id)
-			return search;
-	}
-
-	XE_BUG_ON("NOT POSSIBLE");
-	return NULL;
+	/*
+	 * FIXME: Media GTs are disabled at the moment.  Once re-enabled,
+	 * the proper handling here is to return the primary GT from the
+	 * parameter GT's tile.
+	 */
+	return gt;
 }
 
 int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 {
-	struct drm_device *drm = &xe->drm;
-
 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
-	if (!xe_gt_is_media_type(gt)) {
-		gt->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.vram_mgr),
-						GFP_KERNEL);
-		if (!gt->mem.vram_mgr)
-			return -ENOMEM;
-
-	} else {
-		struct xe_gt *full_gt = xe_find_full_gt(gt);
-
-		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
-	}
-
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
 
 	return 0;
 }
 
-static int gt_ttm_mgr_init(struct xe_gt *gt)
-{
-	struct xe_device *xe = gt_to_xe(gt);
-	int err;
-
-	if (gt->mem.vram.size) {
-		err = xe_ttm_vram_mgr_init(gt, gt->mem.vram_mgr);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(gt->info.vram_id) << 1;
-	}
-
-	return 0;
-}
-
 void xe_gt_sanitize(struct xe_gt *gt)
 {
 	/*
@@ -315,41 +279,6 @@ int xe_gt_init_early(struct xe_gt *gt)
 	return 0;
 }
 
-/**
- * xe_gt_init_noalloc - Init GT up to the point where allocations can happen.
- * @gt: The GT to initialize.
- *
- * This function prepares the GT to allow memory allocations to VRAM, but is not
- * allowed to allocate memory itself. This state is useful for display readout,
- * because the inherited display framebuffer will otherwise be overwritten as it
- * is usually put at the start of VRAM.
- *
- * Returns: 0 on success, negative error code on error.
- */
-int xe_gt_init_noalloc(struct xe_gt *gt)
-{
-	int err, err2;
-
-	if (xe_gt_is_media_type(gt))
-		return 0;
-
-	xe_device_mem_access_get(gt_to_xe(gt));
-	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
-	if (err)
-		goto err;
-
-	err = gt_ttm_mgr_init(gt);
-	if (err)
-		goto err_force_wake;
-
-err_force_wake:
-	err2 = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(err2);
-	xe_device_mem_access_put(gt_to_xe(gt));
-err:
-	return err;
-}
-
 static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 1677640e1075..f4f3d95ae6b1 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -107,6 +107,7 @@ static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
 static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_vm *vm;
 	struct xe_vma *vma = NULL;
 	struct xe_bo *bo;
@@ -195,7 +196,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
+		ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
 		if (ret)
 			goto unlock_dma_resv;
 	} else if (bo) {
@@ -498,6 +499,7 @@ static struct xe_vma *get_acc_vma(struct xe_vm *vm, struct acc *acc)
 static int handle_acc(struct xe_gt *gt, struct acc *acc)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_vm *vm;
 	struct xe_vma *vma;
 	struct xe_bo *bo;
@@ -553,7 +555,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Migrate to VRAM, move should invalidate the VMA first */
-	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
+	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
 
 	if (only_needs_bo_lock(bo))
 		xe_bo_unlock(bo, &ww);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index e910ec1b8dd3..fcea0dc150ed 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -16,8 +16,6 @@
 struct xe_engine_ops;
 struct xe_migrate;
 struct xe_ring_ops;
-struct xe_ttm_gtt_mgr;
-struct xe_ttm_vram_mgr;
 
 enum xe_gt_type {
 	XE_GT_TYPE_UNINITIALIZED,
@@ -108,8 +106,6 @@ struct xe_gt {
 		enum xe_gt_type type;
 		/** @id: id of GT */
 		u8 id;
-		/** @vram: id of the VRAM for this GT */
-		u8 vram_id;
 		/** @clock_freq: clock frequency */
 		u32 clock_freq;
 		/** @engine_mask: mask of engines present on GT */
@@ -144,37 +140,6 @@ struct xe_gt {
 	 */
 	struct xe_reg_sr reg_sr;
 
-	/**
-	 * @mem: memory management info for GT, multiple GTs can point to same
-	 * objects (virtual split)
-	 */
-	struct {
-		/**
-		 * @vram: VRAM info for GT, multiple GTs can point to same info
-		 * (virtual split), can be subset of global device VRAM
-		 */
-		struct {
-			/** @io_start: IO start address of this VRAM instance */
-			resource_size_t io_start;
-			/**
-			 * @io_size: IO size of this VRAM instance
-			 *
-			 * This represents how much of this VRAM we can access
-			 * via the CPU through the VRAM BAR. This can be smaller
-			 * than @size, in which case only part of VRAM is CPU
-			 * accessible (typically the first 256M). This
-			 * configuration is known as small-bar.
-			 */
-			resource_size_t io_size;
-			/** @size: size of VRAM. */
-			resource_size_t size;
-			/** @mapping: pointer to VRAM mappable space */
-			void *__iomem mapping;
-		} vram;
-		/** @vram_mgr: VRAM TTM manager */
-		struct xe_ttm_vram_mgr *vram_mgr;
-	} mem;
-
 	/** @reset: state for GT resets */
 	struct {
 		/**
diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
index 5bf359c81cc5..5be31855d789 100644
--- a/drivers/gpu/drm/xe/xe_irq.c
+++ b/drivers/gpu/drm/xe/xe_irq.c
@@ -369,7 +369,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
 	}
 
 	for_each_gt(gt, xe, id) {
-		if ((master_tile_ctl & DG1_MSTR_TILE(gt->info.vram_id)) == 0)
+		if ((master_tile_ctl & DG1_MSTR_TILE(gt_to_tile(gt)->id)) == 0)
 			continue;
 
 		if (!xe_gt_is_media_type(gt))
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 54fa1212fcd9..17b3a9880409 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -182,7 +182,7 @@ int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *usable_si
 int xe_mmio_probe_vram(struct xe_device *xe)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	u8 id;
 	u64 vram_size;
 	u64 original_size;
@@ -195,11 +195,11 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		xe->mem.vram.io_start = 0;
 		xe->mem.vram.io_size = 0;
 
-		for_each_gt(gt, xe, id) {
-			gt->mem.vram.mapping = 0;
-			gt->mem.vram.size = 0;
-			gt->mem.vram.io_start = 0;
-			gt->mem.vram.io_size = 0;
+		for_each_tile(tile, xe, id) {
+			tile->mem.vram.mapping = 0;
+			tile->mem.vram.size = 0;
+			tile->mem.vram.io_start = 0;
+			tile->mem.vram.io_size = 0;
 		}
 		return 0;
 	}
@@ -209,7 +209,6 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		return -ENXIO;
 	}
 
-	gt = xe_device_get_gt(xe, 0);
 	original_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
 
 	err = xe_mmio_total_vram_size(xe, &vram_size, &usable_size);
@@ -239,23 +238,19 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 		u8 adj_tile_count = xe->info.tile_count;
 		resource_size_t size, io_start, io_size;
 
-		for_each_gt(gt, xe, id)
-			if (xe_gt_is_media_type(gt))
-				--adj_tile_count;
-
 		XE_BUG_ON(!adj_tile_count);
 
 		size = xe->mem.vram.size / adj_tile_count;
 		io_start = xe->mem.vram.io_start;
 		io_size = xe->mem.vram.io_size;
 
-		for_each_gt(gt, xe, id) {
-			if (id && !xe_gt_is_media_type(gt)) {
+		for_each_tile(tile, xe, id) {
+			if (id) {
 				io_size -= min(io_size, size);
 				io_start += io_size;
 			}
 
-			gt->mem.vram.size = size;
+			tile->mem.vram.size = size;
 
 			/*
 			 * XXX: multi-tile small-bar might be wild. Hopefully
@@ -263,10 +258,10 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 			 * we care about.
 			 */
 
-			gt->mem.vram.io_size = min(size, io_size);
+			tile->mem.vram.io_size = min(size, io_size);
 			if (io_size) {
-				gt->mem.vram.io_start = io_start;
-				gt->mem.vram.mapping = xe->mem.vram.mapping +
+				tile->mem.vram.io_start = io_start;
+				tile->mem.vram.mapping = xe->mem.vram.mapping +
 					(io_start - xe->mem.vram.io_start);
 			} else {
 				drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
@@ -274,16 +269,18 @@ int xe_mmio_probe_vram(struct xe_device *xe)
 			}
 
 			drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
-				 id, gt->info.vram_id, &gt->mem.vram.io_start,
-				 &gt->mem.vram.size);
+				 id, tile->id, &tile->mem.vram.io_start,
+				 &tile->mem.vram.size);
 		}
 	} else {
-		gt->mem.vram.size = xe->mem.vram.size;
-		gt->mem.vram.io_start = xe->mem.vram.io_start;
-		gt->mem.vram.io_size = xe->mem.vram.io_size;
-		gt->mem.vram.mapping = xe->mem.vram.mapping;
+		tile = xe_device_get_root_tile(xe);
 
-		drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
+		tile->mem.vram.size = xe->mem.vram.size;
+		tile->mem.vram.io_start = xe->mem.vram.io_start;
+		tile->mem.vram.io_size = xe->mem.vram.io_size;
+		tile->mem.vram.mapping = xe->mem.vram.mapping;
+
+		drm_info(&xe->drm, "VRAM: %pa\n", &tile->mem.vram.size);
 	}
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0fb7ebb9653e..0269327b26e9 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -559,7 +559,6 @@ static int xe_info_init(struct xe_device *xe,
 
 		if (id == 0) {
 			gt->info.type = XE_GT_TYPE_MAIN;
-			gt->info.vram_id = id;
 
 			gt->info.__engine_mask = graphics_desc->hw_engine_mask;
 			if (MEDIA_VER(xe) < 13 && media_desc)
@@ -569,7 +568,6 @@ static int xe_info_init(struct xe_device *xe,
 			gt->mmio.adj_offset = 0;
 		} else {
 			gt->info.type = desc->extra_gts[id - 1].type;
-			gt->info.vram_id = desc->extra_gts[id - 1].vram_id;
 			gt->info.__engine_mask = (gt->info.type == XE_GT_TYPE_MEDIA) ?
 				media_desc->hw_engine_mask :
 				graphics_desc->hw_engine_mask;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 61126cefe0b5..ad42a21c0e22 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -758,12 +758,12 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 	int ret;
 
 	if (is_vram) {
-		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
+		struct xe_tile *bo_tile = xe_bo_to_tile(bo);
 
 		xe_walk.default_pte = XE_PPGTT_PTE_LM;
 		if (vma && vma->use_atomic_access_pte_bit)
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
-		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
+		xe_walk.dma_offset = bo_tile->mem.vram.io_start -
 			gt_to_xe(gt)->mem.vram.io_start;
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index dd64ff0d2a57..c81652d7f4ec 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -182,7 +182,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (to_gt(xe)->mem.vram.size)
+	if (xe_device_get_root_tile(xe)->mem.vram.size)
 		config->info[XE_QUERY_CONFIG_FLAGS] =
 			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
 	if (xe->info.enable_guc)
@@ -242,7 +242,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].native_mem_regions = 0x1;
 		else
 			gts->gts[id].native_mem_regions =
-				BIT(gt->info.vram_id) << 1;
+				BIT(gt_to_tile(gt)->id) << 1;
 		gts->gts[id].slow_mem_regions = xe->info.mem_region_mask ^
 			gts->gts[id].native_mem_regions;
 	}
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 4e99fae26b4c..f2ba609712d3 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -53,7 +53,7 @@ static struct drm_buddy *xe_res_get_buddy(struct ttm_resource *res)
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 
 	if (res->mem_type != XE_PL_STOLEN) {
-		return &xe_device_get_gt(xe, res->mem_type - XE_PL_VRAM0)->mem.vram_mgr->mm;
+		return &xe->tiles[res->mem_type - XE_PL_VRAM0].mem.vram_mgr->mm;
 	} else {
 		struct ttm_resource_manager *mgr =
 			ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 7ef594f301ca..5530a6b6ef31 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -29,6 +29,25 @@ int xe_tile_alloc(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.ggtt->tile = tile;
 
+	tile->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*tile->mem.vram_mgr), GFP_KERNEL);
+	if (!tile->mem.vram_mgr)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int tile_ttm_mgr_init(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	int err;
+
+	if (tile->mem.vram.size) {
+		err = xe_ttm_vram_mgr_init(tile, tile->mem.vram_mgr);
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->id) << 1;
+	}
+
 	return 0;
 }
 
@@ -48,5 +67,17 @@ int xe_tile_alloc(struct xe_tile *tile)
  */
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
-	return xe_ggtt_init_noalloc(tile->mem.ggtt);
+	int err;
+
+	xe_device_mem_access_get(tile_to_xe(tile));
+
+	err = tile_ttm_mgr_init(tile);
+	if (err)
+		goto err_mem_access;
+
+	err = xe_ggtt_init_noalloc(tile->mem.ggtt);
+
+err_mem_access:
+	xe_device_mem_access_put(tile_to_xe(tile));
+	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 73836b9b7fed..1a84abd35fcf 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -353,16 +353,14 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr)
+int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_device *xe = tile_to_xe(tile);
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	mgr->tile = tile;
 
-	mgr->gt = gt;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + gt->info.vram_id,
-				      gt->mem.vram.size, gt->mem.vram.io_size,
+	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+				      tile->mem.vram.size, tile->mem.vram.io_size,
 				      PAGE_SIZE);
 }
 
@@ -373,7 +371,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      enum dma_data_direction dir,
 			      struct sg_table **sgt)
 {
-	struct xe_gt *gt = xe_device_get_gt(xe, res->mem_type - XE_PL_VRAM0);
+	struct xe_tile *tile = &xe->tiles[res->mem_type - XE_PL_VRAM0];
 	struct xe_res_cursor cursor;
 	struct scatterlist *sg;
 	int num_entries = 0;
@@ -406,7 +404,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + gt->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
 		size_t size = cursor.size;
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 35e5367a79fb..6e1d6033d739 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -10,12 +10,12 @@
 
 enum dma_data_direction;
 struct xe_device;
-struct xe_gt;
+struct xe_tile;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_gt *gt, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 3d9417ff7434..48bb991c14a5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -9,7 +9,7 @@
 #include <drm/drm_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
-struct xe_gt;
+struct xe_tile;
 
 /**
  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
@@ -17,8 +17,8 @@ struct xe_gt;
  * Manages placement of TTM resource in VRAM.
  */
 struct xe_ttm_vram_mgr {
-	/** @gt: Graphics tile which the VRAM belongs to */
-	struct xe_gt *gt;
+	/** @tile: Tile which the VRAM belongs to */
+	struct xe_tile *tile;
 	/** @manager: Base TTM resource manager */
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
-- 
2.40.0

