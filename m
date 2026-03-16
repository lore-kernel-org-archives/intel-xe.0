Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D1CF53D65
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 15:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56FD10E27D;
	Mon, 16 Mar 2026 15:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dpXIb/if";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A3410E3B0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Mar 2026 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zjnlYzAuuDiie2Pmi5EWqcO3CbY7oKTpwBgxIxH61Pg=; b=dpXIb/ifkch2xWo8NdUJPgDrZe
 dCiXa3uQYeZl3RVqGtWw8+FlqoLNdPhGmop5JVZmRmme+cqbbPNTtubKrcELAB8OrBp6VFgtP95CP
 2EErmnPVMDp/acWwlZmmmCdnU6CJC7q7k+ZJezTSqjTyfOXrXlr5P+j1+oiqiRzpMZdhi0tcDzKvM
 V1SnVdcvRUJJFVsKgkU553YNF0BpZY7YuJvFOpeyzcU5HrjvJOoYwnAjOnTxqlT4PTmMGWBZD/DPD
 87gF61qem78AY6vvAMPpUklPCZTGS9v7EY3PUIrefQgtx7b3us9CXEXvYco6qgmT+3/IHq0WqBjXw
 LH4QtzTg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1w29sv-00GZ35-8b; Mon, 16 Mar 2026 16:29:37 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: intel-xe@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Uma Shankar <uma.shankar@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v22 09/12] drm/xe/display: Change write_dpt_remapped_tiled
 function signature
Date: Mon, 16 Mar 2026 15:29:29 +0000
Message-ID: <20260316152929.1247-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
References: <20260316152929.1247-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In preparation for adding support for the auxccs plane lets change the
function signature of write_dpt_remapped_tiled(). This will enable a
tidier way of extending it subsequent patches.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 58 +++++++++++++++-----------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 331f3c1da444..fd3715708c8b 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -49,33 +49,44 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
 }
 
-static void
-write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
-			 u32 bo_ofs, u32 width, u32 height, u32 src_stride,
-			 u32 dst_stride)
+static unsigned int
+write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned int pad)
+{
+	/* The DE ignores the PTEs for the padding tiles */
+	return dest + pad * sizeof(u64);
+}
+
+static unsigned int
+write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
+			 unsigned int dest,
+			 const struct intel_remapped_plane_info *plane)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
-	u32 column, row;
-	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
+	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
+						 xe->pat.idx[XE_CACHE_NONE]);
+	unsigned int offset, column, row;
 
-	for (row = 0; row < height; row++) {
-		u32 src_idx = src_stride * row + bo_ofs;
+	for (row = 0; row < plane->height; row++) {
+		offset = (plane->offset + plane->src_stride * row) *
+			 XE_PAGE_SIZE;
 
-		for (column = 0; column < width; column++) {
-			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
-			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
+		for (column = 0; column < plane->width; column++) {
+			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
 
-			*dpt_ofs += 8;
-			src_idx++;
+			iosys_map_wr(map, dest, u64, addr | pte);
+			dest += sizeof(u64);
+			offset += XE_PAGE_SIZE;
 		}
 
-		/* The DE ignores the PTEs for the padding tiles */
-		*dpt_ofs += (dst_stride - width) * 8;
+		dest = write_dpt_padding(map, dest,
+					 plane->dst_stride - plane->width);
 	}
 
 	/* Align to next page */
-	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
+	dest = ALIGN(dest, XE_PAGE_SIZE);
+
+	return dest;
 }
 
 static void
@@ -83,15 +94,14 @@ write_dpt_remapped(struct xe_bo *bo,
 		   const struct intel_remapped_info *remap_info,
 		   struct iosys_map *map)
 {
-	u32 i, dpt_ofs = 0;
+	unsigned int i, dest = 0;
 
-	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
-		write_dpt_remapped_tiled(bo, map, &dpt_ofs,
-				   remap_info->plane[i].offset,
-				   remap_info->plane[i].width,
-				   remap_info->plane[i].height,
-				   remap_info->plane[i].src_stride,
-				   remap_info->plane[i].dst_stride);
+	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
+		const struct intel_remapped_plane_info *plane =
+				&remap_info->plane[i];
+
+		write_dpt_remapped_tiled(bo, map, dest, plane);
+	}
 }
 
 static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
-- 
2.52.0

