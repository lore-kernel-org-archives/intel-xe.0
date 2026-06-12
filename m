Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2648ACD98D9
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 14:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD4910F546;
	Fri, 12 Jun 2026 14:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="pCttVdJj";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8288110F591
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 14:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1781273473;
 bh=DWOIBAP7ZZmfASR+A9+sdjOs2I8lVIkXtBAaSUjcH/I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pCttVdJj65iPTzfWC8bcrccF2gDyEDVb721VXpkxQKukaKZTlIYlBgDKfqZcJmWoG
 NgqPEKQ/uKv0NoXLM0EsyIOxKdAN/goQvvL/a8aEf42c2Eqyqa7d9j+oPQIeQHNkug
 SssgysHqNPGuX/uCVwUA0+nAIgLF6hiN/nYecU+qRn+swxPjKb7jJX7lu4iewxso5K
 GapVONQGiLCboevviSIU/fT34zc1uOW4piFU77Hs3LG4Vyj+2AnzQU+552r+hfE1Ii
 kz+98ZAzy+5WUxjSKtMax0xNT4Dm6Muh3aX7hlXfxviryMGJd8L1iyh2OoFq7RoCKE
 6tHl+i8DiY7AA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/2] drm/xe/display: Use xe_bo_addr_iter in remapped DPT
 pinning
Date: Fri, 12 Jun 2026 16:11:21 +0200
Message-ID: <20260612141122.17959-3-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612141122.17959-1-dev@lankhorst.se>
References: <20260612141122.17959-1-dev@lankhorst.se>
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

Right now we're using xe_bo_addr() on each individual address, which gives
problems at larger resolution and sizes, since it's a O(N²).

By using xe_bo_addr_iter_first() + xe_bo_addr_iter_addr(), the time
complexity is reduced again to O(N).

To fix rotated pinning requires some thinking.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index c4e23926cd06e..b35b5c83fff01 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -19,6 +19,7 @@
 #include "xe_ggtt.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
+#include "xe_res_cursor.h"
 #include "xe_vram_types.h"
 
 static void
@@ -70,14 +71,14 @@ write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
 	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
 						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
 	unsigned int offset = plane->offset * XE_PAGE_SIZE;
-	unsigned int size = plane->size;
+	unsigned int size = plane->size * XE_PAGE_SIZE;
+	struct xe_res_cursor cur;
 
-	while (size--) {
-		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
+	for (xe_bo_addr_iter_first(bo, &cur, offset, size); cur.remaining; xe_res_next(&cur, XE_PAGE_SIZE)) {
+		u64 addr = xe_bo_addr_iter_addr(&cur);
 
 		iosys_map_wr(map, dest, u64, addr | pte);
 		dest += sizeof(u64);
-		offset += XE_PAGE_SIZE;
 	}
 
 	return dest;
@@ -92,18 +93,17 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
 						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
-	unsigned int offset, column, row;
+	u32 offset = plane->offset * XE_PAGE_SIZE;
+	struct xe_res_cursor cur;
 
-	for (row = 0; row < plane->height; row++) {
-		offset = (plane->offset + plane->src_stride * row) *
-			 XE_PAGE_SIZE;
-
-		for (column = 0; column < plane->width; column++) {
-			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
+	xe_bo_addr_iter_first(bo, &cur, offset, plane->height * plane->src_stride * XE_PAGE_SIZE);
+	while (cur.remaining) {
+		for (u32 column = 0; column < plane->width; column++) {
+			u64 addr = xe_bo_addr_iter_addr(&cur);
 
 			iosys_map_wr(map, dest, u64, addr | pte);
 			dest += sizeof(u64);
-			offset += XE_PAGE_SIZE;
+			xe_res_next(&cur, XE_PAGE_SIZE);
 		}
 
 		dest = write_dpt_padding(map, dest,
-- 
2.53.0

