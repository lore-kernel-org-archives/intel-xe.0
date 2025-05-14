Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A82C3ABDE
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 13:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D1210E648;
	Wed, 14 May 2025 13:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ixOgmYnn";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF06410E646
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nao9p+XZzVchTEGXTxy0v+3PldzlkoOqWIN4m+Oov5Q=; b=ixOgmYnnIFN/Vxvx0VzPvjR3WT
 ex6+7v3xo03P5+mcho2oFjodqihVm8aKeg2zeypFhISAdqNV4ImVJSkfSH/DntcfWRlEXZvRpz6Dh
 WbFPyp3ubrtqjY1tdJ9ExIUbH7AXiZxKMmi23QORhFeGo7tfYXVlfBAj2vzP43HaVsA4IqedmlA6K
 8qrOFr9qYcR8X0GuGt3n1Ym7S4mE8Fy82nWi4tHwqYPgXjD7wrbC8l9tiQmL4TIsiCm+nin+9h7p3
 OM9Wl7D/wuo4mhA7Uqd0tOZrkEm7UJ/bZ2ffb1PlMIATyQoyK2nJBT1weuqNzNg71/qVbW0vGXVQX
 iPqFR8bw==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uFCEp-008Abe-PZ; Wed, 14 May 2025 15:39:21 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH v6 18/19] drm/xe/display: Add support for AuxCCS
Date: Wed, 14 May 2025 14:39:00 +0100
Message-ID: <20250514133904.12131-19-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
References: <20250514133904.12131-1-tvrtko.ursulin@igalia.com>
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

Add support for mapping the auxiliary CCS buffer into the DPT page tables.

This will allow for more power efficiency by enabling the render
compression frame buffer modifiers such as
I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS in a following patch.

We do this by refactoring the code a bit so handling for the linear
auxiliary frame buffer can be added in a tidy way. Also replace some
hardcoded constants and tighten the loops a bit.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 107 ++++++++++++++++++-------
 1 file changed, 80 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 55d52ff65c2a..e8f91ea32d24 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -51,35 +51,98 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
-static void
-write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
-		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
-		   u32 dst_stride)
+static unsigned int
+write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned int pad)
+{
+	while (pad--) {
+		iosys_map_wr(map, dest, u64, 0);
+		dest += sizeof(u64);
+	}
+
+	return dest;
+}
+
+static unsigned int
+write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
+			  unsigned int dest,
+			  const struct intel_remapped_plane_info *plane)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
 		= ggtt->pt_ops->pte_encode_bo;
-	u32 column, row;
+	const u16 pat = xe->pat.idx[XE_CACHE_NONE];
+	u64 src = plane->offset * XE_PAGE_SIZE;
+	unsigned int size = plane->size;
 
-	for (row = 0; row < height; row++) {
-		u32 src_idx = src_stride * row + bo_ofs;
+	while (size--) {
+		iosys_map_wr(map, dest, u64, pte_encode_bo(bo, src, pat));
+		dest += sizeof(u64);
+		src += XE_PAGE_SIZE;
+	}
 
-		for (column = 0; column < width; column++) {
-			iosys_map_wr(map, *dpt_ofs, u64,
-				     pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-				     xe->pat.idx[XE_CACHE_NONE]));
+	return dest;
+}
+
+static unsigned int
+write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
+			 unsigned int dest,
+			 const struct intel_remapped_plane_info *plane)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index)
+		= ggtt->pt_ops->pte_encode_bo;
+	const unsigned int next_row =
+		(plane->src_stride - plane->width) * XE_PAGE_SIZE;
+	const u16 pat = xe->pat.idx[XE_CACHE_NONE];
+	u64 src = plane->offset * XE_PAGE_SIZE;
+	unsigned int column, row;
 
-			*dpt_ofs += 8;
-			src_idx++;
+	for (row = 0; row < plane->height; row++, src += next_row) {
+		for (column = 0; column < plane->width; column++) {
+			iosys_map_wr(map, dest, u64,
+				     pte_encode_bo(bo, src, pat));
+			dest += sizeof(u64);
+			src += XE_PAGE_SIZE;
 		}
 
 		/* The DE ignores the PTEs for the padding tiles */
-		*dpt_ofs += (dst_stride - width) * 8;
+		dest = write_dpt_padding(map, dest,
+					 plane->dst_stride - plane->width);
 	}
 
-	/* Align to next page */
-	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
+	return dest;
+}
+
+static void
+write_dpt_remapped(struct xe_bo *bo,
+		   const struct intel_remapped_info *remap_info,
+		   struct iosys_map *map)
+{
+	unsigned int i, dest = 0;
+
+	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
+		const struct intel_remapped_plane_info *plane =
+						&remap_info->plane[i];
+
+		if (!plane->width && !plane->height && !plane->linear)
+			continue;
+
+		if (remap_info->plane_alignment) {
+			unsigned int index = dest / sizeof(u64);
+			unsigned int pad;
+
+			pad = ALIGN(index,
+				    remap_info->plane_alignment) - index;
+			dest = write_dpt_padding(map, dest, pad);
+		}
+
+		if (plane->linear)
+			dest = write_dpt_remapped_linear(bo, map, dest, plane);
+		else
+			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
+	}
 }
 
 static void gt_flush_ggtt_writes(struct xe_gt *gt)
@@ -181,17 +244,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
 	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
-		const struct intel_remapped_info *remap_info = &view->remapped;
-		u32 i, dpt_ofs = 0;
-
-		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
-			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
-					   remap_info->plane[i].offset,
-					   remap_info->plane[i].width,
-					   remap_info->plane[i].height,
-					   remap_info->plane[i].src_stride,
-					   remap_info->plane[i].dst_stride);
-
+		write_dpt_remapped(bo, &view->remapped, &dpt->vmap);
 	} else {
 		const struct intel_rotation_info *rot_info = &view->rotated;
 		u32 i, dpt_ofs = 0;
-- 
2.48.0

