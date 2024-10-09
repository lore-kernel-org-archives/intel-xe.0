Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A354CCEDD8F
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 12:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7224110E6F3;
	Wed,  9 Oct 2024 12:51:14 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D1A10E6EF
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 12:51:12 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v4 5/6] drm/xe/display: Dont poke into GGTT internals to fill
 a DPT
Date: Wed,  9 Oct 2024 14:51:13 +0200
Message-ID: <20241009125114.412624-6-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
References: <20241009125114.412624-1-maarten.lankhorst@linux.intel.com>
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

Now that xe_fb_pin.c no longer pokes around in GGTT internals using
directly, it should be safe to export the encode function.

With this, no users remain outside of xe_ggtt.c that need to know
anything about the struct, and we can make it private.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        | 22 ++++++++---------
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  6 +----
 drivers/gpu/drm/xe/xe_ggtt.c                  | 24 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h                  |  3 +++
 4 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index ec1dd356f26b4..73bfa085cfbb3 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -15,23 +15,22 @@
 #include "xe_pm.h"
 
 static void
-write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
-		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
+write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
+		  xe_ggtt_pte_encode_bo_fn pte_encode_bo,
+		  u32 bo_ofs, u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
 	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u32 column, row;
 
 	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
 	 * by writing dpt/ggtt in a different order?
 	 */
-
 	for (column = 0; column < width; column++) {
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 pte = pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+						xe->pat.idx[XE_CACHE_NONE]);
 
 			iosys_map_wr(map, *dpt_ofs, u64, pte);
 			*dpt_ofs += 8;
@@ -48,13 +47,11 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 
 static void
 write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
+		   xe_ggtt_pte_encode_bo_fn pte_encode_bo,
 		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
 		   u32 dst_stride)
 {
 	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
-		= ggtt->pt_ops->pte_encode_bo;
 	u32 column, row;
 
 	for (row = 0; row < height; row++) {
@@ -87,6 +84,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
 	struct xe_bo *bo = gem_to_xe_bo(obj), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
+	xe_ggtt_pte_encode_bo_fn pte_encode_bo = xe_ggtt_get_encode_pte_bo_fn(ggtt);
 
 	if (view->type == I915_GTT_VIEW_NORMAL)
 		dpt_size = ALIGN(size / XE_PAGE_SIZE * 8, XE_PAGE_SIZE);
@@ -123,8 +121,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		u32 x;
 
 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 pte = pte_encode_bo(bo, x * XE_PAGE_SIZE,
+						xe->pat.idx[XE_CACHE_NONE]);
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
@@ -134,6 +132,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 
 		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
 			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
+					   pte_encode_bo,
 					   remap_info->plane[i].offset,
 					   remap_info->plane[i].width,
 					   remap_info->plane[i].height,
@@ -146,6 +145,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
+					  pte_encode_bo,
 					  rot_info->plane[i].offset,
 					  rot_info->plane[i].width,
 					  rot_info->plane[i].height,
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 8c113463a3d55..f812747a340c3 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -70,12 +70,8 @@ initial_plane_bo(struct xe_device *xe,
 
 	base = round_down(plane_config->base, page_size);
 	if (IS_DGFX(xe)) {
-		u64 __iomem *gte = tile0->mem.ggtt->gsm;
-		u64 pte;
+		u64 pte = xe_ggtt_read_pte(tile0->mem.ggtt, base);
 
-		gte += base / XE_PAGE_SIZE;
-
-		pte = ioread64(gte);
 		if (!(pte & XE_GGTT_PTE_DM)) {
 			drm_err(&xe->drm,
 				"Initial plane programming missing DM bit\n");
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 93c903db6d1f5..213a6c0b10b7c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -888,3 +888,27 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+
+/**
+ * xe_ggtt_read_pte - Read a PTE from the GGTT
+ * @ggtt: &xe_ggtt
+ * @offset: the offset for which the mapping should be read.
+ *
+ * Used by display for inheriting a bios set FB.
+ */
+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
+{
+	return ioread64(ggtt->gsm + (offset / XE_PAGE_SIZE));
+}
+
+/**
+ * xe_ggtt_get_encode_pte_bo_fn - Get PTE encoding functions for DPT
+ * @ggtt: &xe_ggtt
+ *
+ * This function returns a function to encode a BO address as a PTE.
+ * It's used for DPT to fill a GGTT mapped BO with a linear lookup table.
+ */
+xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt)
+{
+	return ggtt->pt_ops->pte_encode_bo;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 7417f236df5b3..6e7e70de9132d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -46,4 +46,7 @@ static inline void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
 #endif
 
+u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
+xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt);
+
 #endif
-- 
2.45.2

