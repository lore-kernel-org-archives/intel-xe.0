Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBAFC4450B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 16:27:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE2010E080;
	Tue, 14 Jul 2026 16:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ftNXJzP6";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBF810E080;
 Tue, 14 Jul 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1784046457;
 bh=lglelC8ygoA2ns0XN3zxtkKnBdy5Zds4t9inyQ/PiyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ftNXJzP6myCPG1ww4W/1rxIX5koJWuNlhUmbGCYZYyy1CKXMuu0Qp1RbuA5dzkBoj
 7PCPCmFus70p0Hwx8vtoecs55eXW2Gi32fGEOtUwvYpslvjruUB+pEGRKP0phoBgPY
 ScQv8oR/tx1wy8vymcZDiuNDi+kFz3wMQjoxrci5caIzxsXPVA1jYLWLexdiOt81vY
 cRttgemGdznuseV9Kv0Vn9FquvUBd+djqTdVMxN2/H71OUb08goZXCbdJtrYZp/lEN
 hitO+GSuRbK0Kw8pZ28OOK42VnR887sSuGfF7ngvjJyxu4U1dj14vgSCeB7LRO4bJE
 9N5U73PfDqG8w==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/7] drm/xe/ggtt: Allocate the area of GGTT above GUC_GGTT_TOP.
Date: Tue, 14 Jul 2026 18:28:18 +0200
Message-ID: <20260714162824.2063637-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714162824.2063637-1-dev@lankhorst.se>
References: <20260714162824.2063637-1-dev@lankhorst.se>
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

Instead of truncating ggtt_size to be below GUC_GGTT_TOP,
ensure that all allocations to GGTT are only ever below GUC_GGTT_TOP.

This will allow the initial display GGTT to be reserved and cleared
in the next patch, even if it is placed at the top of GGTT.

By default this area will stay unused, but it will be cleared
in xe_ggtt_init and reported in xe_ggtt_size() now.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 8ec23862477fc..e6a3c621c04b1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -423,9 +423,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	if (ggtt_size + ggtt_start > GUC_GGTT_TOP)
-		ggtt_size = GUC_GGTT_TOP - ggtt_start;
-
 	if (GRAPHICS_VERx100(xe) >= 1270)
 		ggtt->pt_ops =
 			(ggtt->tile->media_gt && XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
@@ -615,11 +612,18 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
+static int xe_ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					       u32 align, u32 start, u64 end, u32 mm_flags)
+{
+	return drm_mm_insert_node_in_range(&node->ggtt->mm, &node->base, size, align,
+						0, start, end, mm_flags);
+}
+
 static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
 				      u32 size, u32 align, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+	return xe_ggtt_insert_node_in_range_locked(node, size, align, 0,
+						   GUC_GGTT_TOP - node->ggtt->start, mm_flags);
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -834,8 +838,8 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
 
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+	err = xe_ggtt_insert_node_in_range_locked(bo->ggtt_node[tile_id], xe_bo_size(bo), alignment,
+						  start, end, 0);
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
@@ -884,7 +888,7 @@ int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		      struct drm_exec *exec)
 {
-	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX, exec);
+	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, GUC_GGTT_TOP, exec);
 }
 
 /**
-- 
2.53.0

