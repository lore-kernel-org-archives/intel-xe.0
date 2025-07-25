Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC9CC87FCE
	for <intel-xe@archiver.kernel.org>; Fri, 25 Jul 2025 11:20:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D048610E9DB;
	Fri, 25 Jul 2025 11:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="YcV7Yrpq";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AEF10E9DB
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7oUgeeZruTTBgmQWd5JlZL5qXG7d+dAN06+XPa9g5Tc=; b=YcV7YrpqmNeFroKWkjV/7gk/Te
 ApwtCeFkC3UoHgOgX2H3TIyiifqQCfDK+4Vc1onSbgNSGotWh7XFjRlagaUch4zxU9GGjxNu28qNH
 ZT3bsO3pmSl+uiTJKKHqkHZp1GAawPwPC04O69PTMdvfVeTtVgoDy25IDZzXbE+zD3U0i285PEBqR
 cTE2hWdLSDQxKcXk8fkxYbmcrVVyc2LIryCfPDp09S0x0yrcUWAEXOPo3NGLJiBvliG12MQNd6WrR
 zkh85RZHHnwFgNgt7vcicM7uh/YAAHkMzB76vVB9p3XAN52smzNiu0wSp0VOLapvrg8jp0QS9jYBy
 N/4FExJQ==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ufGTV-003gCH-7C
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Jul 2025 13:20:29 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2 1/1] drm/xe/display: Add support for AuxCCS
Date: Fri, 25 Jul 2025 12:20:28 +0100
Message-ID: <20250725112028.91161-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250725070305.87218-2-tvrtko.ursulin@igalia.com>
References: <20250725070305.87218-2-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 123 +++++++++++++++++++------
 1 file changed, 96 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index e78663dbacab..0212e61fa965 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -53,33 +53,112 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
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
-	u32 column, row;
-	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
+	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
+						 xe->pat.idx[XE_CACHE_NONE]);
+	u64 src = xe_bo_addr(bo, plane->offset * XE_PAGE_SIZE, XE_PAGE_SIZE);
+	unsigned int size = plane->size;
+
+	while (size--) {
+		iosys_map_wr(map, dest, u64, src | pte);
+		dest += sizeof(u64);
+		src += XE_PAGE_SIZE;
+	}
 
-	for (row = 0; row < height; row++) {
-		u32 src_idx = src_stride * row + bo_ofs;
+	return dest;
+}
 
-		for (column = 0; column < width; column++) {
-			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
-			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
+static unsigned int
+write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
+			 unsigned int dest,
+			 const struct intel_remapped_plane_info *plane)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
+						 xe->pat.idx[XE_CACHE_NONE]);
+	u64 src = xe_bo_addr(bo, plane->offset * XE_PAGE_SIZE, XE_PAGE_SIZE);
+	const unsigned int next_row = (plane->src_stride - plane->width) *
+				      XE_PAGE_SIZE;
+	unsigned int column, row;
 
-			*dpt_ofs += 8;
-			src_idx++;
+	for (row = 0; row < plane->height; row++, src += next_row) {
+		for (column = 0; column < plane->width; column++) {
+			iosys_map_wr(map, dest, u64, src | pte);
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
+	printk("write_dpt_remapped plane_alignment=%x\n",
+	       remap_info->plane_alignment);
+
+	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
+		const struct intel_remapped_plane_info *plane =
+						&remap_info->plane[i];
+
+		if (!plane->width && !plane->height && !plane->linear)
+			continue;
+
+		if (plane->linear)
+			printk("write_dpt_remapped [%u] linear offset=%x size=%x\n",
+			       i, plane->offset, plane->size);
+		else
+			printk("write_dpt_remapped [%u] tiled  offset=%x %ux%u src_stride=%u dst_stride=%u\n",
+			       i, plane->offset, plane->width, plane->height, plane->src_stride, plane->dst_stride);
+
+		if (remap_info->plane_alignment) {
+			const unsigned int index = dest / sizeof(u64);
+			const unsigned int pad =
+				ALIGN(index, remap_info->plane_alignment) -
+				index;
+
+			dest = write_dpt_padding(map, dest, pad);
+			printk("write_dpt_remapped [%u] padded to dest=%x\n",
+			       i, dest);
+		}
+
+		if (plane->linear) {
+			dest = write_dpt_remapped_linear(bo, map, dest, plane);
+			printk("write_dpt_remapped [%u] linear to dest=%x\n",
+			       i, dest);
+		} else {
+			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
+			printk("write_dpt_remapped [%u] tiled  to dest=%x\n",
+			       i, dest);
+		}
+	}
 }
 
 static void gt_flush_ggtt_writes(struct xe_gt *gt)
@@ -181,17 +260,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte | addr);
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

