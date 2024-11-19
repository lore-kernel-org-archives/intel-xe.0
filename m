Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4F1D6C2B9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 22:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE45410E37B;
	Tue, 19 Nov 2024 22:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQLimKJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE8E10E37A
 for <Intel-Xe@lists.freedesktop.org>; Tue, 19 Nov 2024 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732056863; x=1763592863;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A0GZEpO05XxunTAYTsorlYkqqFMPU/IpDTcIVteEJz8=;
 b=YQLimKJeDpRZfkk3LEtlCnOKZTuCJbWy9FO53+pp3/L8a2Q7UBxogsnl
 K4Qo+oj1kJkjTI4rwOLSOJKKf/Q9UsGxaAPW1m0JBWm6l54RNYMcnn43d
 ZZkZ3hqeCuMGOQzrBrKCqfOC1p3GxuSjZFCnUuPGr1v+ppL5URbK8sxpN
 6enu4AyAXM+u97F1cGqTTUtYWely1XHE4oTiCdbDOCaSctkIqVQOAn8RX
 zeVWzjrbRA5snG6oTvKEb8Nn0pV5APxjTnz8XKkTpXlrHxUt6C4exWu2m
 yL1IuO/ky5anAEM4WtX4nn2a0iUBpQ4w+gMRrRCuVBDXlmtvxlN//yLFX w==;
X-CSE-ConnectionGUID: qGMvPjIBTeeAcP+B52vwVA==
X-CSE-MsgGUID: /xqePVINRPqWhFPJ/SuREA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32026794"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32026794"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 14:54:23 -0800
X-CSE-ConnectionGUID: sAEVNNfWTUeILVGU3RfQ9Q==
X-CSE-MsgGUID: 6xY2mD6QSCmQtZHT19gMUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="90540628"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 14:54:22 -0800
From: John.C.Harrison@Intel.com
To: Intel-Xe@Lists.FreeDesktop.Org
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Allow bo mapping on multiple ggtts
Date: Tue, 19 Nov 2024 14:54:20 -0800
Message-ID: <20241119225421.198838-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119225421.198838-1-John.C.Harrison@Intel.com>
References: <20241119225421.198838-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Make bo->ggtt an array to support bo mapping on multiple ggtts.
Add XE_BO_FLAG_GGTTx flags to map the bo on ggtt of tile 'x'.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 12 ++++---
 drivers/gpu/drm/xe/xe_bo.c             | 49 ++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h             | 32 ++++++++++++++---
 drivers/gpu/drm/xe/xe_bo_evict.c       | 14 +++++---
 drivers/gpu/drm/xe/xe_bo_types.h       |  5 +--
 drivers/gpu/drm/xe/xe_ggtt.c           | 35 +++++++++---------
 6 files changed, 101 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 761510ae0690..9fa51b84737c 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -161,7 +161,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	}
 
 	vma->dpt = dpt;
-	vma->node = dpt->ggtt_node;
+	vma->node = dpt->ggtt_node[tile0->id];
 	return 0;
 }
 
@@ -213,8 +213,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
-		vma->node = bo->ggtt_node;
+	if (bo->ggtt_node[ggtt->tile->id] && view->type == I915_GTT_VIEW_NORMAL) {
+		vma->node = bo->ggtt_node[ggtt->tile->id];
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
@@ -345,10 +345,12 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 
 static void __xe_unpin_fb_vma(struct i915_vma *vma)
 {
+	u8 tile_id = vma->node->ggtt->tile->id;
+
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node->base.start != vma->node->base.start)
+	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
+		 vma->bo->ggtt_node[tile_id]->base.start != vma->node->base.start)
 		xe_ggtt_node_remove(vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 549866da5cd1..ec070af12662 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1140,6 +1140,8 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	struct xe_tile *tile;
+	u8 id;
 
 	if (bo->ttm.base.import_attach)
 		drm_prime_gem_destroy(&bo->ttm.base, NULL);
@@ -1147,8 +1149,9 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node && bo->ggtt_node->base.size)
-		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
+	for_each_tile(tile, xe, id)
+		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
+			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
 	if (bo->client)
@@ -1319,6 +1322,10 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		return ERR_PTR(-EINVAL);
 	}
 
+	/* XE_BO_FLAG_GGTTx requires XE_BO_FLAG_GGTT also be set */
+	if ((flags & XE_BO_FLAG_GGTT_ALL) && !(flags & XE_BO_FLAG_GGTT))
+		return ERR_PTR(-EINVAL);
+
 	if (flags & (XE_BO_FLAG_VRAM_MASK | XE_BO_FLAG_STOLEN) &&
 	    !(flags & XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE) &&
 	    ((xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) ||
@@ -1509,19 +1516,29 @@ __xe_bo_create_locked(struct xe_device *xe,
 	bo->vm = vm;
 
 	if (bo->flags & XE_BO_FLAG_GGTT) {
-		if (!tile && flags & XE_BO_FLAG_STOLEN)
-			tile = xe_device_get_root_tile(xe);
+		struct xe_tile *t;
+		u8 id;
 
-		xe_assert(xe, tile);
+		if (!(bo->flags & XE_BO_FLAG_GGTT_ALL)) {
+			if (!tile && flags & XE_BO_FLAG_STOLEN)
+				tile = xe_device_get_root_tile(xe);
 
-		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
-			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
-						   start + bo->size, U64_MAX);
-		} else {
-			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
+			xe_assert(xe, tile);
+		}
+
+		for_each_tile(t, xe, id) {
+			if (t != tile && !(bo->flags & XE_BO_FLAG_GGTTx(t)))
+				continue;
+
+			if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
+				err = xe_ggtt_insert_bo_at(t->mem.ggtt, bo,
+							   start + bo->size, U64_MAX);
+			} else {
+				err = xe_ggtt_insert_bo(t->mem.ggtt, bo);
+			}
+			if (err)
+				goto err_unlock_put_bo;
 		}
-		if (err)
-			goto err_unlock_put_bo;
 	}
 
 	return bo;
@@ -2379,14 +2396,18 @@ void xe_bo_put_commit(struct llist_head *deferred)
 
 void xe_bo_put(struct xe_bo *bo)
 {
+	struct xe_tile *tile;
+	u8 id;
+
 	might_sleep();
 	if (bo) {
 #ifdef CONFIG_PROC_FS
 		if (bo->client)
 			might_lock(&bo->client->bos_lock);
 #endif
-		if (bo->ggtt_node && bo->ggtt_node->ggtt)
-			might_lock(&bo->ggtt_node->ggtt->lock);
+		for_each_tile(tile, xe_bo_device(bo), id)
+			if (bo->ggtt_node[id] && bo->ggtt_node[id]->ggtt)
+				might_lock(&bo->ggtt_node[id]->ggtt->lock);
 		drm_gem_object_put(&bo->ttm.base);
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7fa44a0138b0..d0dce44317c7 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -39,10 +39,22 @@
 #define XE_BO_FLAG_NEEDS_64K		BIT(15)
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
+#define XE_BO_FLAG_GGTT0                BIT(18)
+#define XE_BO_FLAG_GGTT1                BIT(19)
+#define XE_BO_FLAG_GGTT2                BIT(20)
+#define XE_BO_FLAG_GGTT3                BIT(21)
+#define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
+					 XE_BO_FLAG_GGTT1 | \
+					 XE_BO_FLAG_GGTT2 | \
+					 XE_BO_FLAG_GGTT3)
+
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
 
+#define XE_BO_FLAG_GGTTx(tile) \
+	(XE_BO_FLAG_GGTT0 << (tile)->id)
+
 #define XE_PTE_SHIFT			12
 #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
 #define XE_PTE_MASK			(XE_PAGE_SIZE - 1)
@@ -194,14 +206,24 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 }
 
 static inline u32
-xe_bo_ggtt_addr(struct xe_bo *bo)
+__xe_bo_ggtt_addr(struct xe_bo *bo, u8 tile_id)
 {
-	if (XE_WARN_ON(!bo->ggtt_node))
+	struct xe_ggtt_node *ggtt_node = bo->ggtt_node[tile_id];
+
+	if (XE_WARN_ON(!ggtt_node))
 		return 0;
 
-	XE_WARN_ON(bo->ggtt_node->base.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node->base.start + bo->ggtt_node->base.size > (1ull << 32));
-	return bo->ggtt_node->base.start;
+	XE_WARN_ON(ggtt_node->base.size > bo->size);
+	XE_WARN_ON(ggtt_node->base.start + ggtt_node->base.size > (1ull << 32));
+	return ggtt_node->base.start;
+}
+
+static inline u32
+xe_bo_ggtt_addr(struct xe_bo *bo)
+{
+	xe_assert(xe_bo_device(bo), bo->tile);
+
+	return __xe_bo_ggtt_addr(bo, bo->tile->id);
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 8fb2be061003..6a40eedd9db1 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -152,11 +152,17 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		}
 
 		if (bo->flags & XE_BO_FLAG_GGTT) {
-			struct xe_tile *tile = bo->tile;
+			struct xe_tile *tile;
+			u8 id;
 
-			mutex_lock(&tile->mem.ggtt->lock);
-			xe_ggtt_map_bo(tile->mem.ggtt, bo);
-			mutex_unlock(&tile->mem.ggtt->lock);
+			for_each_tile(tile, xe, id) {
+				if (tile != bo->tile && !(bo->flags & XE_BO_FLAG_GGTTx(tile)))
+					continue;
+
+				mutex_lock(&tile->mem.ggtt->lock);
+				xe_ggtt_map_bo(tile->mem.ggtt, bo);
+				mutex_unlock(&tile->mem.ggtt->lock);
+			}
 		}
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 13c6d8a69e91..5387e0456625 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -13,6 +13,7 @@
 #include <drm/ttm/ttm_execbuf_util.h>
 #include <drm/ttm/ttm_placement.h>
 
+#include "xe_device_types.h"
 #include "xe_ggtt_types.h"
 
 struct xe_device;
@@ -39,8 +40,8 @@ struct xe_bo {
 	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
-	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct xe_ggtt_node *ggtt_node;
+	/** @ggtt_node: Array of GGTT nodes if this BO is mapped in the GGTTs */
+	struct xe_ggtt_node *ggtt_node[XE_MAX_TILES_PER_DEVICE];
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 558fac8bb6fb..05154f9de1a6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -598,10 +598,10 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 	u64 start;
 	u64 offset, pte;
 
-	if (XE_WARN_ON(!bo->ggtt_node))
+	if (XE_WARN_ON(!bo->ggtt_node[ggtt->tile->id]))
 		return;
 
-	start = bo->ggtt_node->base.start;
+	start = bo->ggtt_node[ggtt->tile->id]->base.start;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
@@ -612,15 +612,16 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 				  u64 start, u64 end)
 {
-	int err;
 	u64 alignment = bo->min_align > 0 ? bo->min_align : XE_PAGE_SIZE;
+	u8 tile_id = ggtt->tile->id;
+	int err;
 
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node)) {
+	if (XE_WARN_ON(bo->ggtt_node[tile_id])) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == bo->size);
 		return 0;
 	}
 
@@ -630,19 +631,19 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 
-	bo->ggtt_node = xe_ggtt_node_init(ggtt);
-	if (IS_ERR(bo->ggtt_node)) {
-		err = PTR_ERR(bo->ggtt_node);
-		bo->ggtt_node = NULL;
+	bo->ggtt_node[tile_id] = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(bo->ggtt_node[tile_id])) {
+		err = PTR_ERR(bo->ggtt_node[tile_id]);
+		bo->ggtt_node[tile_id] = NULL;
 		goto out;
 	}
 
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node->base, bo->size,
-					  alignment, 0, start, end, 0);
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
+					  bo->size, alignment, 0, start, end, 0);
 	if (err) {
-		xe_ggtt_node_fini(bo->ggtt_node);
-		bo->ggtt_node = NULL;
+		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
+		bo->ggtt_node[tile_id] = NULL;
 	} else {
 		xe_ggtt_map_bo(ggtt, bo);
 	}
@@ -691,13 +692,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
  */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node))
+	u8 tile_id = ggtt->tile->id;
+
+	if (XE_WARN_ON(!bo->ggtt_node[tile_id]))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_node[tile_id]->base.size == bo->size);
 
-	xe_ggtt_node_remove(bo->ggtt_node,
+	xe_ggtt_node_remove(bo->ggtt_node[tile_id],
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
-- 
2.47.0

