Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8BFD1D494
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 20:25:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322E10E7C8;
	Thu,  8 Jan 2026 20:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="D0/dL97D";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BC610E7C7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767903940;
 bh=KVcXXUirHkLxrk2pyd1RrvJBrNz1L3jaA7yJgC8FcA4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D0/dL97DTB2qhYY6xZW/afNyGQK+YQaBbwMXjuPMSbwoN46p3bpTN0KFxXcZS8DV9
 wDWun02hc7tCaHx64JOt6hnWzxLKLTFR9j75JvzRX1ihp/unMaERLPO+KfSEsUrz3j
 xwHW/1pQ86ggTZ1xTfVB92ymd2INxEbBNu0aasdUoSw0vW1gqAJYVMd0KrzDnO6FOF
 6yJS/kxOiHcGEoGxpGXELj7XTR7wkxXf1mty+qDb1iJCf8VuQd+PQtT283STLa+57h
 6O1GlSze4luuWDydZiyIg1Mb445IKTS5aWYD9j52dd5SP8UtAK/2wsnkFtd97ygjMQ
 Azq1xRfVyWw9g==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW 08/12] drm/xe: Make xe_ggtt_node offset
 relative to starting offset
Date: Thu,  8 Jan 2026 21:25:26 +0100
Message-ID: <20260108202531.671690-9-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108202531.671690-1-dev@lankhorst.se>
References: <20260108202531.671690-1-dev@lankhorst.se>
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
 drivers/gpu/drm/xe/xe_ggtt.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 7d191c68629c6..3db70df49e25a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -300,7 +300,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
 	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, start, size);
+	drm_mm_init(&ggtt->mm, 0, size - start);
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
@@ -892,6 +892,13 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	}
 
 	mutex_lock(&ggtt->lock);
+	if (start >= ggtt->start)
+		start -= ggtt->start;
+	else
+		start = 0;
+
+	end -= ggtt->start;
+
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
 					  xe_bo_size(bo), alignment, 0, start, end, 0);
 	if (err) {
@@ -1212,7 +1219,7 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
  */
 u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
 {
-	return node->base.start;
+	return node->base.start + READ_ONCE(node->ggtt->start);
 }
 
 /**
-- 
2.51.0

