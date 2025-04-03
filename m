Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4075FC369A3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 12:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F301E10E9BD;
	Thu,  3 Apr 2025 12:45:34 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6D010E23C
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 12:45:32 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 5/6] drm/xe/ggtt: Seperate flags and address in PTE encoding
Date: Thu,  3 Apr 2025 14:45:19 +0200
Message-ID: <20250403124520.470916-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403124520.470916-1-dev@lankhorst.se>
References: <20250403124520.470916-1-dev@lankhorst.se>
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

Pinning large linear display framebuffers is becoming a bottleneck.
My plan of attack is doing a custom walk over the BO, this allows for
easier optimization of consecutive entries.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 37 +++++-------
 drivers/gpu/drm/xe/xe_ggtt.c           | 78 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_ggtt.h           |  2 +
 drivers/gpu/drm/xe/xe_ggtt_types.h     |  4 +-
 4 files changed, 70 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d509def82b134..f1b938001100a 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -23,6 +23,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u32 column, row;
+	u64 pte = ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CACHE_NONE]);
 
 	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
 	 * by writing dpt/ggtt in a different order?
@@ -32,10 +33,9 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
 
-			iosys_map_wr(map, *dpt_ofs, u64, pte);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
 			*dpt_ofs += 8;
 			src_idx -= src_stride;
 		}
@@ -55,17 +55,15 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
-		= ggtt->pt_ops->pte_encode_bo;
 	u32 column, row;
+	u64 pte = ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CACHE_NONE]);
 
 	for (row = 0; row < height; row++) {
 		u32 src_idx = src_stride * row + bo_ofs;
 
 		for (column = 0; column < width; column++) {
-			iosys_map_wr(map, *dpt_ofs, u64,
-				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-				     xe->pat.idx[XE_CACHE_NONE]));
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
+			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
 
 			*dpt_ofs += 8;
 			src_idx++;
@@ -129,13 +127,13 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		return PTR_ERR(dpt);
 
 	if (view->type == I915_GTT_VIEW_NORMAL) {
+		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CACHE_NONE]);
 		u32 x;
 
 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 addr = xe_bo_addr(bo, x * XE_PAGE_SIZE, XE_PAGE_SIZE);
 
-			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
+			iosys_map_wr(&dpt->vmap, x * 8, u64, pte | addr);
 		}
 	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
 		const struct intel_remapped_info *remap_info = &view->remapped;
@@ -173,15 +171,15 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	u32 column, row;
+	u64 pte = ggtt->pt_ops->pte_encode_flags(bo, xe->pat.idx[XE_CACHE_NONE]);
 
 	for (column = 0; column < width; column++) {
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, *ggtt_ofs, pte | addr);
 			*ggtt_ofs += XE_PAGE_SIZE;
 			src_idx -= src_stride;
 		}
@@ -219,26 +217,19 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (bo->ggtt_node[tile0->id] && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node[tile0->id];
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
-		u32 x, size = bo->ttm.base.size;
-
 		vma->node = xe_ggtt_node_init(ggtt);
 		if (IS_ERR(vma->node)) {
 			ret = PTR_ERR(vma->node);
 			goto out_unlock;
 		}
 
-		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
+		ret = xe_ggtt_node_insert_locked(vma->node, bo->size, align, 0);
 		if (ret) {
 			xe_ggtt_node_fini(vma->node);
 			goto out_unlock;
 		}
 
-		for (x = 0; x < size; x += XE_PAGE_SIZE) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
-							      xe->pat.idx[XE_CACHE_NONE]);
-
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node->base.start + x, pte);
-		}
+		xe_ggtt_map_bo(ggtt, vma->node, bo, xe->pat.idx[XE_CACHE_NONE]);
 	} else {
 		u32 i, ggtt_ofs;
 		const struct intel_rotation_info *rot_info = &view->rotated;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index b197b835ed442..e37dc2149f9a3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -27,6 +27,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_res_cursor.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
@@ -64,13 +65,9 @@
  * give us the correct placement for free.
  */
 
-static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
-				   u16 pat_index)
+static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
-	u64 pte;
-
-	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
-	pte |= XE_PAGE_PRESENT;
+	u64 pte = XE_PAGE_PRESENT;
 
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
 		pte |= XE_GGTT_PTE_DM;
@@ -78,13 +75,12 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 	return pte;
 }
 
-static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
-				    u16 pat_index)
+static u64 xelpg_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	u64 pte;
 
-	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, pat_index);
+	pte = xelp_ggtt_pte_flags(bo, pat_index);
 
 	xe_assert(xe, pat_index <= 3);
 
@@ -149,8 +145,9 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	xe_tile_assert(ggtt->tile, start < end);
 
 	if (ggtt->scratch)
-		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
-							  pat_index);
+		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
+			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
+							     pat_index);
 	else
 		scratch_pte = 0;
 
@@ -210,17 +207,17 @@ static void primelockdep(struct xe_ggtt *ggtt)
 }
 
 static const struct xe_ggtt_pt_ops xelp_pt_ops = {
-	.pte_encode_bo = xelp_ggtt_pte_encode_bo,
+	.pte_encode_flags = xelp_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_ops = {
-	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
+	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte,
 };
 
 static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
-	.pte_encode_bo = xelpg_ggtt_pte_encode_bo,
+	.pte_encode_flags = xelpg_ggtt_pte_flags,
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
@@ -612,23 +609,46 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
+ * @node: the &xe_ggtt_node where this BO is mapped
  * @bo: the &xe_bo to be mapped
+ * @pat_index: Which pat_index to use.
  */
-static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
+void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+		    struct xe_bo *bo, u16 pat_index)
 {
-	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start;
-	u64 offset, pte;
 
-	if (XE_WARN_ON(!bo->ggtt_node[ggtt->tile->id]))
+	u64 start, pte;
+	struct xe_res_cursor cur;
+
+	if (XE_WARN_ON(!node))
 		return;
 
-	start = bo->ggtt_node[ggtt->tile->id]->base.start;
+	start = node->base.start;
+
+	pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
+		xe_assert(xe_bo_device(bo), bo->ttm.ttm);
 
-	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
-		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
-		ggtt->pt_ops->ggtt_set_pte(ggtt, start + offset, pte);
+		for (xe_res_first_sg(xe_bo_sg(bo), 0, bo->size, &cur);
+		     cur.remaining;
+		     xe_res_next(&cur, XE_PAGE_SIZE)) {
+			u64 addr = xe_res_dma(&cur);
+
+			ggtt->pt_ops->ggtt_set_pte(ggtt, start + cur.start, addr | pte);
+		}
+	} else {
+		u64 end = start + bo->size;
+
+		/* Prepend GPU offset */
+		pte |= vram_region_gpu_offset(bo->ttm.resource);
+
+		for (xe_res_first(bo->ttm.resource, 0, bo->size, &cur);
+		     cur.remaining;
+		     xe_res_next(&cur, XE_PAGE_SIZE)) {
+
+			ggtt->pt_ops->ggtt_set_pte(ggtt, end - cur.remaining,
+						   pte + cur.start);
+		}
 	}
 }
 
@@ -641,8 +661,11 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
  */
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
+	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
+	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
+
 	mutex_lock(&ggtt->lock);
-	xe_ggtt_map_bo(ggtt, bo);
+	xe_ggtt_map_bo(ggtt, bo->ggtt_node[ggtt->tile->id], bo, pat_index);
 	mutex_unlock(&ggtt->lock);
 }
 
@@ -682,7 +705,10 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
 	} else {
-		xe_ggtt_map_bo(ggtt, bo);
+		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
+		u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
+
+		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pat_index);
 	}
 	mutex_unlock(&ggtt->lock);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 0bab1fd7cc817..c48da99908848 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -26,6 +26,8 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
+void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+		    struct xe_bo *bo, u16 pat_index);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index cb02b7994a9ac..c5e999d58ff2a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -74,8 +74,8 @@ struct xe_ggtt_node {
  * Which can vary from platform to platform.
  */
 struct xe_ggtt_pt_ops {
-	/** @pte_encode_bo: Encode PTE address for a given BO */
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+	/** @pte_encode_flags: Encode PTE flags for a given BO */
+	u64 (*pte_encode_flags)(struct xe_bo *bo, u16 pat_index);
 	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 };
-- 
2.45.2

