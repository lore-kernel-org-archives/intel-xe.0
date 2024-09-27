Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3E4CDD1B4
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:14:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFAC10EC77;
	Fri, 27 Sep 2024 14:14:22 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D035310EC67
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 14:14:05 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH 09/14] drm/xe: Make xe_ggtt_pt_ops private
Date: Fri, 27 Sep 2024 16:13:59 +0200
Message-ID: <20240927141404.163317-10-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
References: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
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

The only user outside xe_ggtt.c is fb pinning, which makes sense as
all the operations it performs can be considered part of GGTT.

We could move this to xe_ggtt.c, but lets keep it inside display for
now.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 22 ++++++++++++----------
 drivers/gpu/drm/xe/xe_ggtt.c           | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h           |  2 ++
 drivers/gpu/drm/xe/xe_ggtt_types.h     | 13 ++-----------
 4 files changed, 40 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index bddd526b3329..0ae5d917f20f 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -20,6 +20,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	xe_ggtt_pte_encode_bo_fn pte_encode_bo = xe_ggtt_get_encode_pte_bo_fn(ggtt);
 	u32 column, row;
 
 	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
@@ -30,8 +31,8 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 pte = pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+						xe->pat.idx[XE_CACHE_NONE]);
 
 			iosys_map_wr(map, *dpt_ofs, u64, pte);
 			*dpt_ofs += 8;
@@ -53,8 +54,7 @@ write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
-		= ggtt->pt_ops->pte_encode_bo;
+	xe_ggtt_pte_encode_bo_fn pte_encode_bo = xe_ggtt_get_encode_pte_bo_fn(ggtt);
 	u32 column, row;
 
 	for (row = 0; row < height; row++) {
@@ -120,11 +120,12 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		return PTR_ERR(dpt);
 
 	if (view->type == I915_GTT_VIEW_NORMAL) {
+		xe_ggtt_pte_encode_bo_fn pte_encode_bo = xe_ggtt_get_encode_pte_bo_fn(ggtt);
 		u32 x;
 
 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 pte = pte_encode_bo(bo, x * XE_PAGE_SIZE,
+						xe->pat.idx[XE_CACHE_NONE]);
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
@@ -163,14 +164,15 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
 	struct xe_device *xe = xe_bo_device(bo);
+	xe_ggtt_pte_encode_bo_fn pte_encode_bo = xe_ggtt_get_encode_pte_bo_fn(ggtt);
 	u32 column, row;
 
 	for (column = 0; column < width; column++) {
 		u32 src_idx = src_stride * (height - 1) + column + bo_ofs;
 
 		for (row = 0; row < height; row++) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 pte = pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
+						xe->pat.idx[XE_CACHE_NONE]);
 
 			xe_ggtt_write_pte(ggtt, *ggtt_ofs, pte);
 			*ggtt_ofs += XE_PAGE_SIZE;
@@ -209,6 +211,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		vma->node = bo->ggtt_node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
+		xe_ggtt_pte_encode_bo_fn pte_encode_bo = xe_ggtt_get_encode_pte_bo_fn(ggtt);
 
 		vma->node = xe_ggtt_node_init(ggtt);
 		if (IS_ERR(vma->node)) {
@@ -223,8 +226,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		}
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
-							      xe->pat.idx[XE_CACHE_NONE]);
+			u64 pte = pte_encode_bo(bo, x, xe->pat.idx[XE_CACHE_NONE]);
 
 			xe_ggtt_write_pte(ggtt, vma->node->base.start + x, pte);
 		}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 659517063776..d259b44dc0fc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -63,6 +63,18 @@
  * give us the correct placement for free.
  */
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
+struct xe_ggtt_pt_ops {
+	/** @pte_encode_bo: Encode PTE address for a given BO */
+	xe_ggtt_pte_encode_bo_fn pte_encode_bo;
+	/** @ggtt_set_pte: Directly write into GGTT's PTE */
+	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
+};
+
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -879,3 +891,15 @@ void xe_ggtt_write_pte(struct xe_ggtt *ggtt, u64 offset, u64 pte)
 {
 	return ggtt->pt_ops->ggtt_set_pte(ggtt, offset, pte);
 }
+
+/**
+ * xe_ggtt_write_pte - Write a PTE to the GGTT
+ * @ggtt: &xe_ggtt
+ * @offset: the offset for which the mapping should be written.
+ *
+ * Used by display for DPT and GGTT paths to enccode BO's.
+ */
+xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt)
+{
+	return ggtt->pt_ops->pte_encode_bo;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index f83e5af0400e..0c63cfa083c0 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -48,6 +48,8 @@ void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
 #endif
 
 u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset);
+
+xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt);
 void xe_ggtt_write_pte(struct xe_ggtt *ggtt, u64 offset, u64 pte);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index cb02b7994a9a..c142ff59c450 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,6 +13,8 @@
 struct xe_bo;
 struct xe_gt;
 
+typedef u64 (*xe_ggtt_pte_encode_bo_fn)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+
 /**
  * struct xe_ggtt - Main GGTT struct
  *
@@ -69,15 +71,4 @@ struct xe_ggtt_node {
 	bool invalidate_on_remove;
 };
 
-/**
- * struct xe_ggtt_pt_ops - GGTT Page table operations
- * Which can vary from platform to platform.
- */
-struct xe_ggtt_pt_ops {
-	/** @pte_encode_bo: Encode PTE address for a given BO */
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
-	/** @ggtt_set_pte: Directly write into GGTT's PTE */
-	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
-};
-
 #endif
-- 
2.45.2

