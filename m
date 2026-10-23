Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9122606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=Dw08zTPx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A314D112ACC;
	Fri, 23 Oct 2026 11:46:07 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C933B112AD6
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1792755959;
 bh=7Jk0rSxhGetEo62b65Y3zgJqHa6Hhl3QnidgbgT6ZjI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dw08zTPxw9GfBTYW4B6E9ys3x2Gu504B+wrR8kU3Q+4VJVqWMEujXEEhnTSv197Xs
 ZkM1vU9MGeDeSZNl2Ync4tNOjCIs3Ob1FuI3PTLWZ32EXXEa5ngiba7atNf15kjLgu
 sb2ChHJduw290FGnPhPjkwdbnXca9P3F4YI1+Qks1hnIrQ+XhoGO1Vs2ybct2+fQEy
 TCmLB+suK2o6FKoUueM1AX/gM1ZSM6qMdP4vgwO96YVWWl/HZyGEGcKEoW19H1lOuk
 XINv3loI7WfpsuabEcSL6QNleaiKGi7V6GrU3RaFaGJoroy4jNm0ZQmSmke2a+0KrF
 AOt+6uR3HIQcg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v2 2/2] drm/xe/display: Use xe_bo_addr_iter in remapped DPT
 pinning
Date: Fri, 23 Oct 2026 13:46:16 +0200
Message-ID: <20261023114616.735366-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023114616.735366-1-dev@lankhorst.se>
References: <20261023114616.735366-1-dev@lankhorst.se>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Right now we're using xe_bo_addr() on each individual address, which gives
problems at larger resolution and sizes, since it's a O(N²).

By using xe_bo_addr_iter_first() + xe_bo_addr_iter_addr(), the time
complexity is reduced again to O(N).

To fix rotated pinning requires some thinking.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
Changes since v1:
- handle plane->src_stride != plane->width
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 27 ++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index e09116265ae95..95f0cbc8b2bb2 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -17,6 +17,7 @@
 #include "xe_ggtt.h"
 #include "xe_pat.h"
 #include "xe_pm.h"
+#include "xe_res_cursor.h"
 #include "xe_vram_types.h"
 
 static void
@@ -68,14 +69,14 @@ write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
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
@@ -90,20 +91,22 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
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
 
+		if (plane->src_stride != plane->width)
+			xe_res_next(&cur, (plane->src_stride - plane->width) * XE_PAGE_SIZE);
+
 		dest = write_dpt_padding(map, dest,
 					 plane->dst_stride - plane->width);
 	}
-- 
2.55.0

