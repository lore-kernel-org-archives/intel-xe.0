Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758AAC369A7
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 20:50:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFF510E32A;
	Fri,  4 Apr 2025 20:50:40 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B4A10E32F;
 Fri,  4 Apr 2025 20:50:39 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 6/9] drm/xe/display: Dont poke into GGTT internals to fill a
 DPT
Date: Fri,  4 Apr 2025 22:50:25 +0200
Message-ID: <20250404205028.620300-7-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404205028.620300-1-dev@lankhorst.se>
References: <20250404205028.620300-1-dev@lankhorst.se>
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

For DPT, it is sufficient to get the GGTT encode flags to fill the DPT.
Create a function to return the encode flags, and then encode using the
BO address.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 20 +++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.c           | 15 +++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h           |  2 ++
 3 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d509def82b134..5392e46a3a134 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -23,6 +23,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u32 column, row;
+	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
 
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
+	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
 
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
+		u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
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
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8e1976bceb44f..5ea2f9fac85d4 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -918,3 +918,18 @@ u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer
 
 	return total;
 }
+
+/**
+ * xe_ggtt_encode_pte_flags - Get PTE encoding flags for BO
+ * @ggtt: &xe_ggtt
+ * @bo: &xe_bo
+ * @pat_index: The pat_index for the PTE.
+ *
+ * This function returns the pte_flags for a given BO, without  address.
+ * It's used for DPT to fill a GGTT mapped BO with a linear lookup table.
+ */
+u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt,
+			     struct xe_bo *bo, u16 pat_index)
+{
+	return ggtt->pt_ops->pte_encode_flags(bo, pat_index);
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c48da99908848..437ba65f33860 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -49,4 +49,6 @@ static inline void xe_ggtt_might_lock(struct xe_ggtt *ggtt)
 void xe_ggtt_might_lock(struct xe_ggtt *ggtt);
 #endif
 
+u64 xe_ggtt_encode_pte_flags(struct xe_ggtt *ggtt, struct xe_bo *bo, u16 pat_index);
+
 #endif
-- 
2.45.2

