Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84EB606A31F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=eFRXlNGI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7510F4E3;
	Wed, 21 Oct 2026 15:00:59 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335610E31F
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1792594847;
 bh=IOV0Vgs9HQQtz7lmmJ2qvk3YngDVTlP8W5Z6R7B7KkA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eFRXlNGIoeXlds+Q1Vafu0q0KNBRBa+dZ43YYDjL42dXlOZMBh3QFQVhH7u7pptOk
 XeN/YXCiYnhyNrFdHJlgOrPcT1nopkJ9RcR0SpRJ0Lo1Gs8XyfgQFNI6gagJCYTU4s
 WH6pfILx79oZOSPXUmpN5Y5A+DJH+13/W7vexOMCaV77GNoBzlkJ4U3ktBfS1qw3DX
 kF0v5hosDh24iYJmkuIJGXtWLDLh9TjXqdkxoAuCh7MKSnPE35/4XvONnkanQymBpu
 +jkQ8UvPQZK+P+4vK/gAQKFbMognqlMow0QOOROv55lyVwqgm+5d2KtIdqzSBWq718
 5fgXTPoXl+FcQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 2/2] drm/xe/display: Use xe_bo_addr_iter in remapped DPT
 pinning
Date: Wed, 21 Oct 2026 17:01:18 +0200
Message-ID: <20261021150116.516131-4-dev@lankhorst.se>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021150116.516131-3-dev@lankhorst.se>
References: <20261021150116.516131-3-dev@lankhorst.se>
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
Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9516
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index e09116265ae95..e7e5c70c7b236 100644
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
@@ -90,18 +91,17 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
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
2.55.0

