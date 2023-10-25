Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE38C25B6E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 18:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92B410E6CA;
	Wed, 25 Oct 2023 18:00:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDC810E6C6
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698256810; x=1729792810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4FSkOQ0yybRoJbwr2IFz0LCg4syDvQEEDIW94cb5cyI=;
 b=MYCpcOhFLM4q5xe2jKOWTWZ1xN6E+KLQLKPcfwKx7v3xRIfEV34UtQeS
 w74BWVmX6M63bz0eZ8/ClLXj7RYAV/me42LOLxguEkaJPIaX6ToSgKEhq
 UtpmRxFtzGiuk0rG9BfzOhHf/j9xppg4c8R3EQ+lKsPDJ7k4BwFxRw78W
 BderXQDSEGaPJPfG/2AMzepRVySSJU7B5OsXZsIDf77JeCBjnzY2lKTwy
 1Ma9tEszrSc82cC5291eEtf//HSFV7RC2FJlZ4hqsvaeN8IZI6TcSvRIq
 B0qVo+5Ds5Fmjen4mRexsu8NXyL3b9GXpRt8o5EsL3/MLs9I3igZzqNwa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="8922330"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="8922330"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735470648"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="735470648"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 11:00:09 -0700
From: Brian Welty <brian.welty@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 11:00:08 -0700
Message-Id: <20231025180008.24167-4-brian.welty@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20231025180008.24167-1-brian.welty@intel.com>
References: <20231025180008.24167-1-brian.welty@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/3] drm/xe: Replace usage of mem_type_to_tile
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently mem_type_to_tile() is being used to access the tile's underlying
tile.mem.vram. However, this function makes the assumption that a mem_type
will only ever map to a single tile. Now that the TTM vram manager contains
a pointer to the memory_region, make use of this in xe_bo.c.

As such, introduce a helper function res_to_mem_region() to get the
ttm_vram_mgr->vram from the BO's resource, and use this to replace usage
of mem_type_to_tile().

xe_tile is still needed to choose the migration context, so this part is
unchanged. But as this is only renaming usage, function is renamed now to
mem_type_to_migrate().

Signed-off-by: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c | 63 +++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 795234886f7e..688036ff9fc5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -101,12 +101,24 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 	return bo->flags & XE_BO_CREATE_USER_BIT;
 }
 
-static struct xe_tile *
-mem_type_to_tile(struct xe_device *xe, u32 mem_type)
+static struct xe_migrate *
+mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 {
+	struct xe_tile *tile;
+
 	xe_assert(xe, mem_type == XE_PL_STOLEN || mem_type_is_vram(mem_type));
+	tile = &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
+	return tile->migrate;
+}
+
+static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
+{
+	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
+	struct ttm_resource_manager *mgr;
 
-	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
+	xe_assert(xe, resource_is_vram(res));
+	mgr = ttm_manager_type(&xe->ttm, res->mem_type);
+	return to_xe_ttm_vram_mgr(mgr)->vram;
 }
 
 static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
@@ -126,11 +138,13 @@ static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
-	struct xe_tile *tile = mem_type_to_tile(xe, mem_type);
 	struct ttm_place place = { .mem_type = mem_type };
-	u64 io_size = tile->mem.vram.io_size;
+	struct xe_mem_region *vram;
+	u64 io_size;
 
-	xe_assert(xe, tile->mem.vram.usable_size);
+	vram = to_xe_ttm_vram_mgr(ttm_manager_type(&xe->ttm, mem_type))->vram;
+	xe_assert(xe, vram && vram->usable_size);
+	io_size = vram->io_size;
 
 	/*
 	 * For eviction / restore on suspend / resume objects
@@ -140,7 +154,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 			XE_BO_CREATE_GGTT_BIT))
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 
-	if (io_size < tile->mem.vram.usable_size) {
+	if (io_size < vram->usable_size) {
 		if (bo_flags & XE_BO_NEEDS_CPU_ACCESS) {
 			place.fpfn = 0;
 			place.lpfn = io_size >> PAGE_SHIFT;
@@ -404,21 +418,21 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_tile *tile = mem_type_to_tile(xe, mem->mem_type);
 		struct xe_ttm_vram_mgr_resource *vres =
 			to_xe_ttm_vram_mgr_resource(mem);
+		struct xe_mem_region *vram = res_to_mem_region(mem);
 
 		if (vres->used_visible_size < mem->size)
 			return -EINVAL;
 
 		mem->bus.offset = mem->start << PAGE_SHIFT;
 
-		if (tile->mem.vram.mapping &&
+		if (vram->mapping &&
 		    mem->placement & TTM_PL_FLAG_CONTIGUOUS)
-			mem->bus.addr = (u8 *)tile->mem.vram.mapping +
+			mem->bus.addr = (u8 *)vram->mapping +
 				mem->bus.offset;
 
-		mem->bus.offset += tile->mem.vram.io_start;
+		mem->bus.offset += vram->io_start;
 		mem->bus.is_iomem = true;
 
 #if  !defined(CONFIG_X86)
@@ -611,7 +625,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct ttm_resource *old_mem = ttm_bo->resource;
 	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
 	struct ttm_tt *ttm = ttm_bo->ttm;
-	struct xe_tile *tile = NULL;
+	struct xe_migrate *migrate = NULL;
 	struct dma_fence *fence;
 	bool move_lacks_source;
 	bool tt_has_data;
@@ -689,14 +703,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	}
 
 	if (bo->tile)
-		tile = bo->tile;
+		migrate = bo->tile->migrate;
 	else if (resource_is_vram(new_mem))
-		tile = mem_type_to_tile(xe, new_mem->mem_type);
+		migrate = mem_type_to_migrate(xe, new_mem->mem_type);
 	else if (mem_type_is_vram(old_mem_type))
-		tile = mem_type_to_tile(xe, old_mem_type);
+		migrate = mem_type_to_migrate(xe, old_mem_type);
 
-	xe_assert(xe, tile);
-	xe_tile_assert(tile, tile->migrate);
+	xe_assert(xe, migrate);
 
 	trace_xe_bo_move(bo);
 	xe_device_mem_access_get(xe);
@@ -717,7 +730,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 			/* Create a new VMAP once kernel BO back in VRAM */
 			if (!ret && resource_is_vram(new_mem)) {
-				void *new_addr = tile->mem.vram.mapping +
+				struct xe_mem_region *vram = res_to_mem_region(new_mem);
+				void *new_addr = vram->mapping +
 					(new_mem->start << PAGE_SHIFT);
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
@@ -734,9 +748,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		}
 	} else {
 		if (move_lacks_source)
-			fence = xe_migrate_clear(tile->migrate, bo, new_mem);
+			fence = xe_migrate_clear(migrate, bo, new_mem);
 		else
-			fence = xe_migrate_copy(tile->migrate,
+			fence = xe_migrate_copy(migrate,
 						bo, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
@@ -905,16 +919,16 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 				       unsigned long page_offset)
 {
-	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
-	struct xe_tile *tile = mem_type_to_tile(xe, ttm_bo->resource->mem_type);
 	struct xe_res_cursor cursor;
+	struct xe_mem_region *vram;
 
 	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
 
+	vram = res_to_mem_region(ttm_bo->resource);
 	xe_res_first(ttm_bo->resource, (u64)page_offset << PAGE_SHIFT, 0, &cursor);
-	return (tile->mem.vram.io_start + cursor.start) >> PAGE_SHIFT;
+	return (vram->io_start + cursor.start) >> PAGE_SHIFT;
 }
 
 static void __xe_bo_vunmap(struct xe_bo *bo);
@@ -1451,12 +1465,11 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 uint64_t vram_region_gpu_offset(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
-	struct xe_tile *tile = mem_type_to_tile(xe, res->mem_type);
 
 	if (res->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_gpu_offset(xe);
 
-	return tile->mem.vram.dpa_base;
+	return res_to_mem_region(res)->dpa_base;
 }
 
 /**
-- 
2.38.0

