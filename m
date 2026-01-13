Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359F3D29DE2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 08:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E968C10E473;
	Tue, 13 Jan 2026 08:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="kiu5bnAy";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F4010E471
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 08:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768293428;
 bh=f8i/KrUOwDXYTuYupkHbt+kfM69rhT/pQErERe7d/CA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kiu5bnAyU+r00MQ+zgygl9PxHTtulTtY2uHFRyVKOtjcx+W8GAZ2RHBZq1F5Icx00
 i0wDbybMDknn99LRhjquRp6B/clId5WKjjlHuumTVKDX2fsEXP/XzyWhwJ42yfIjzv
 9ugL6YifFAEK8IR8t8PCzPtL4JisvZW52wLRAE/jb5JcSOt4JXjEQpCdYs27d3YPtX
 LNXlioBpTHFMcsIBQ61Df9UGpL7cHgVXVmruSh0S4//53Jk0AsRb2O/+itqyOVky5e
 zFrQ+ae4MkFa5cuyNwAgG2vprYzKpyXTyxEiDj290Xo21OUqGj8jZYFrR09fhmvPB7
 hPfY82tnmtjmg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v3 1/5] drm/xe: Make xe_ggtt_node offset relative to starting
 offset
Date: Tue, 13 Jan 2026 09:36:57 +0100
Message-ID: <20260113083702.1276449-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113083702.1276449-1-dev@lankhorst.se>
References: <20260113083702.1276449-1-dev@lankhorst.se>
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

This will make node shifting in the next commit a one-liner.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index cb23d97845a86..cbea6dd9146cb 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -300,7 +300,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
 	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, start, size);
+	drm_mm_init(&ggtt->mm, 0, size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
@@ -402,7 +402,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
-		xe_ggtt_clear(ggtt, start, end - start);
+		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
@@ -419,7 +419,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), node->base.size);
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
 	mutex_unlock(&ggtt->lock);
@@ -574,13 +574,13 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
 	lockdep_assert_held(&ggtt->lock);
 
 	node->base.color = 0;
-	node->base.start = start;
+	node->base.start = start - ggtt->start;
 	node->base.size = end - start;
 
 	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
 
 	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
-			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
+			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
 		return err;
 
 	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
@@ -771,7 +771,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	if (XE_WARN_ON(!node))
 		return;
 
-	start = node->base.start;
+	start = xe_ggtt_node_addr(node);
 	end = start + xe_bo_size(bo);
 
 	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
@@ -892,6 +892,17 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	}
 
 	mutex_lock(&ggtt->lock);
+	/*
+	 * all cases where start < ggtt_start when 0 is passed as argument are
+	 * set to 0, as negative offsets are invalid.
+	 */
+	if (start < ggtt->start)
+		start = 0;
+	else
+		start -= ggtt->start;
+
+	end -= ggtt->start;
+
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
 					  xe_bo_size(bo), alignment, 0, start, end, 0);
 	if (err) {
@@ -1212,7 +1223,7 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
  */
 u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
 {
-	return node->base.start;
+	return node->base.start + node->ggtt->start;
 }
 
 /**
-- 
2.51.0

