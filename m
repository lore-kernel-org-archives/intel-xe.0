Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B3AD41C09
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 09:15:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4823410E2AB;
	Thu, 11 Dec 2025 09:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mERGLDPp";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6913910E7BB
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y/drzhfvstdCOjxZBKqgemC6im/66uogP2jFMUwfHl4=; b=mERGLDPpeIjxWP2djrE6UQXk2z
 ZVleD5zGg1HUiabo+vdYaOt0BVsBkVxmGBDsUlOsssw5fA13bnuo2zerGymapOQ6v1ZKHmL2UmTkN
 y0n18n7VjDwqylJIjHJiWdRUNRINy/lSAuF8JhcqNVZ7LCzUfSKv7dGuVOwuIlrtM0FHR3f8XB2ug
 1m7Uaz7GGJjjP3vAmQGdpKNbPETmlla9sMkmOdha6omcOD8yLRuXLb0D5LbEHeb/lRiuXQ4x4NJ55
 4jnAraLM6PtX0pt/aycEPvSdJS0v30Ko/LI8jm4jdVw2lqdqrCTvnZRrh0ge0VLfjhpEOcXm9cox+
 cxoEvAKQ==;
Received: from [86.33.28.86] (helo=localhost)
 by fanzine2.igalia.com with utf8esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vTclu-00BQTH-MN
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 10:15:38 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI 7/9] drm/xe/display: Add support for AuxCCS
Date: Thu, 11 Dec 2025 10:15:28 +0100
Message-ID: <20251211091530.19031-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251211091530.19031-1-tvrtko.ursulin@igalia.com>
References: <20251211091530.19031-1-tvrtko.ursulin@igalia.com>
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

This will allow for better power efficiency by enabling the render
compression frame buffer modifiers such as
I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS in a following patch.

We do this by refactoring the code a bit so handling for the linear
auxiliary frame buffer can be added in a tidy way. Also replace some
hardcoded constants.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 111 ++++++++++++++++++-------
 1 file changed, 81 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index a22a9182dadb..f0017cb1d7cb 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -50,33 +50,94 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
+static unsigned int
+write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned int pad)
+{
+	/* The DE ignores the PTEs for the padding tiles */
+	return dest + pad * sizeof(u64);
+}
+
+static unsigned int
+write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
+			  unsigned int dest,
+			  const struct intel_remapped_plane_info *plane)
+{
+	struct xe_device *xe = xe_bo_device(bo);
+	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
+	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
+						 xe->pat.idx[XE_CACHE_NONE]);
+	unsigned int offset = plane->offset * XE_PAGE_SIZE;
+	unsigned int size = plane->size;
+
+	while (size--) {
+		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
+
+		iosys_map_wr(map, dest, u64, addr | pte);
+		dest += sizeof(u64);
+		offset += XE_PAGE_SIZE;
+	}
+
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
+	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
+						 xe->pat.idx[XE_CACHE_NONE]);
+	unsigned int offset, column, row;
+
+	for (row = 0; row < plane->height; row++) {
+		offset = (plane->offset + plane->src_stride * row) *
+			 XE_PAGE_SIZE;
+
+		for (column = 0; column < plane->width; column++) {
+			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
+
+			iosys_map_wr(map, dest, u64, addr | pte);
+			dest += sizeof(u64);
+			offset += XE_PAGE_SIZE;
+		}
+
+		dest = write_dpt_padding(map, dest,
+					 plane->dst_stride - plane->width);
+	}
+
+	return dest;
+}
+
 static void
-write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
-		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
-		   u32 dst_stride)
+write_dpt_remapped(struct xe_bo *bo,
+		   const struct intel_remapped_info *remap_info,
+		   struct iosys_map *map)
 {
-	struct xe_device *xe = xe_bo_device(bo);
-	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u32 column, row;
-	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
+	unsigned int i, dest = 0;
 
-	for (row = 0; row < height; row++) {
-		u32 src_idx = src_stride * row + bo_ofs;
+	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
+		const struct intel_remapped_plane_info *plane =
+						&remap_info->plane[i];
 
-		for (column = 0; column < width; column++) {
-			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
-			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
+		if (!plane->width && !plane->height && !plane->linear)
+			continue;
 
-			*dpt_ofs += 8;
-			src_idx++;
+		if (remap_info->plane_alignment) {
+			const unsigned int index = dest / sizeof(u64);
+			const unsigned int pad =
+				ALIGN(index, remap_info->plane_alignment) -
+				index;
+
+			dest = write_dpt_padding(map, dest, pad);
 		}
 
-		/* The DE ignores the PTEs for the padding tiles */
-		*dpt_ofs += (dst_stride - width) * 8;
+		if (plane->linear)
+			dest = write_dpt_remapped_linear(bo, map, dest, plane);
+		else
+			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
 	}
-
-	/* Align to next page */
-	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
 static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
@@ -138,17 +199,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
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
2.52.0

