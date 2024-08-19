Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1217C52D6F
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 15:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866FC10E2C8;
	Mon, 19 Aug 2024 15:31:33 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB2510E2C8
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 15:31:32 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/xe: Ensure display fb is aligned in GGTT to a multiple of
 64k, through padding
Date: Mon, 19 Aug 2024 17:31:27 +0200
Message-ID: <20240819153127.235831-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

This workaround is needed on battlemage to ensure that there is no
corruption when CCS is used.

For testing, always enable the workaround. Should be easier to see if something blows up. :)

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 82 ++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d7db44e79eaf5..29a13a889414d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -15,8 +15,68 @@
 #include "xe_gt.h"
 #include "xe_pm.h"
 
+static inline bool needs_bmg_64k_workaround(struct xe_device *xe, const struct intel_framebuffer *fb)
+{
+	if (xe->info.platform != XE_BATTLEMAGE)
+		goto skip;
+
+	/* XXX? What is affected? */
+	if (fb->base.modifier != I915_FORMAT_MOD_4_TILED)
+		goto skip;
+
+	if (!(intel_fb_obj(&fb->base)->ttm.base.size % SZ_64K))
+		goto skip;
+
+	return true;
+skip:
+	return true;
+}
+
+static inline void pad_bmg_dpt(struct xe_device *xe, const struct intel_framebuffer *fb,
+			       struct iosys_map *map, u32 ofs)
+{
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	struct xe_bo *bo = intel_fb_obj(&fb->base);
+	u32 pad = 16 - (ofs % 16), x;
+	u64 pte;
+
+	if (!needs_bmg_64k_workaround(xe, fb))
+		return;
+
+	if (!(ofs % 16))
+		return;
+
+	pte = ggtt->pt_ops->pte_encode_bo(bo, 0, xe->pat.idx[XE_CACHE_NONE]);
+
+	/* Start over with the first few pages, dpt is always aligned to a multiple
+		* of 512 pages, which means that there is enough padding here
+		*/
+	for (x = 0; x < pad; x++)
+		iosys_map_wr(map, (ofs + x) * 8, u64, pte);
+}
+
+static inline void pad_bmg_ggtt(struct xe_device *xe, const struct intel_framebuffer *fb, u32 ofs)
+{
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	struct xe_bo *bo = intel_fb_obj(&fb->base);
+	u32 pad = SZ_64K - (ofs % SZ_64K), x;
+	u64 pte;
+
+	if (!needs_bmg_64k_workaround(xe, fb))
+		return;
+
+	if (!(ofs % SZ_64K))
+		return;
+
+	pte = ggtt->pt_ops->pte_encode_bo(bo, 0, xe->pat.idx[XE_CACHE_NONE]);
+
+	for (x = 0; x < pad; x += XE_PAGE_SIZE)
+		ggtt->pt_ops->ggtt_set_pte(ggtt, ofs + x, pte);
+}
+
 static void
-write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
+write_dpt_rotated(const struct intel_framebuffer *fb, struct xe_bo *bo,
+		  struct iosys_map *map, u32 *dpt_ofs, u32 bo_ofs,
 		  u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
 	struct xe_device *xe = xe_bo_device(bo);
@@ -39,6 +99,9 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 			src_idx -= src_stride;
 		}
 
+		/* Just pad everything out of paranoia? */
+		pad_bmg_dpt(xe, fb, map, *dpt_ofs / 8);
+
 		/* The DE ignores the PTEs for the padding tiles */
 		*dpt_ofs += (dst_stride - height) * 8;
 	}
@@ -128,6 +191,9 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
+
+		/* BMG is crappy, just pad everything? */
+		pad_bmg_dpt(xe, fb, &dpt->vmap, x);
 	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
 		const struct intel_remapped_info *remap_info = &view->remapped;
 		u32 i, dpt_ofs = 0;
@@ -145,7 +211,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		u32 i, dpt_ofs = 0;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
-			write_dpt_rotated(bo, &dpt->vmap, &dpt_ofs,
+			write_dpt_rotated(fb, bo, &dpt->vmap, &dpt_ofs,
 					  rot_info->plane[i].offset,
 					  rot_info->plane[i].width,
 					  rot_info->plane[i].height,
@@ -159,7 +225,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 }
 
 static void
-write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
+write_ggtt_rotated(const struct intel_framebuffer *fb,
+		   struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
 		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
 	struct xe_device *xe = xe_bo_device(bo);
@@ -177,6 +244,8 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 			src_idx -= src_stride;
 		}
 
+		pad_bmg_ggtt(xe, fb, *ggtt_ofs);
+
 		/* The DE ignores the PTEs for the padding tiles */
 		*ggtt_ofs += (dst_stride - height) * XE_PAGE_SIZE;
 	}
@@ -201,7 +270,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		goto out;
 
 	align = XE_PAGE_SIZE;
-	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
+	if ((xe_bo_is_vram(bo) && (ggtt->flags & XE_GGTT_FLAGS_64K)) ||
+	    needs_bmg_64k_workaround(xe, fb))
 		align = max_t(u32, align, SZ_64K);
 
 	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
@@ -220,6 +290,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 
 			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.start + x, pte);
 		}
+
+		pad_bmg_ggtt(xe, fb, vma->node.start + x);
 	} else {
 		u32 i, ggtt_ofs;
 		const struct intel_rotation_info *rot_info = &view->rotated;
@@ -235,7 +307,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		ggtt_ofs = vma->node.start;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
-			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
+			write_ggtt_rotated(fb, bo, ggtt, &ggtt_ofs,
 					   rot_info->plane[i].offset,
 					   rot_info->plane[i].width,
 					   rot_info->plane[i].height,
-- 
2.45.2

