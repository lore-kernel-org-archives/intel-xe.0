Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0904BD2D0E5
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 12:18:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08CD10E4BA;
	Tue, 13 Jan 2026 12:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="C0j6v+x7";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5332B10E33C
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768306693;
 bh=fE5i2ov2llb2F0bC/DsBMmzyUio/d2jUaxSIst0m2cI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C0j6v+x7RLK3hdPcbwIL8NhrK6YgKOq9xVwt8t51/6vUIcpwk81TpNNXX6lA07pq7
 2ezwSVQlirRrMCec/JRulMovZBPPVh87k9gdUuOSuo+9bEYsliP1QPbeZ09YjA1eLL
 ytiRNoFkhcUyQWT0eMTMa61AdnMB3L3ksexVlAA1aUMxyDFWqWBm34qj3ooU1e8lLR
 iuE41m8+g6Jo+j1Iq71JW6Ru7k1eojw2+Ckihu2rYiRvKc5PpSeMrEcDJPkRmv9XbT
 1iGp1o1ti4nnp0SuMGzu0byovdBpLoiaqp/Bx2vEk2lIVtAWsqQbXbxz2DDeRGIZ2Q
 tiyJnbIJBMiFA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v4 1/5] drm/xe: Make xe_ggtt_node offset relative to starting
 offset
Date: Tue, 13 Jan 2026 13:18:03 +0100
Message-ID: <20260113121807.1303124-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113121807.1303124-1-dev@lankhorst.se>
References: <20260113121807.1303124-1-dev@lankhorst.se>
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

Fix all functions that use node->start to use xe_ggtt_node_addr,
and add ggtt->start to node->start.

This will make node shifting for SRIOV-VF a one-liner, instead of
manually changing each GGTT node's base address.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 58 ++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index cb23d97845a86..4bdd2c94021cd 100644
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
@@ -1003,16 +1014,17 @@ static u64 xe_encode_vfid_pte(u16 vfid)
 	return FIELD_PREP(GGTT_PTE_VFID, vfid) | XE_PAGE_PRESENT;
 }
 
-static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vfid)
+static void xe_ggtt_assign_locked(const struct xe_ggtt_node *node, u16 vfid)
 {
-	u64 start = node->start;
-	u64 size = node->size;
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 start = xe_ggtt_node_addr(node);
+	u64 size = xe_ggtt_node_size(node);
 	u64 end = start + size - 1;
 	u64 pte = xe_encode_vfid_pte(vfid);
 
 	lockdep_assert_held(&ggtt->lock);
 
-	if (!drm_mm_node_allocated(node))
+	if (!xe_ggtt_node_allocated(node))
 		return;
 
 	while (start < end) {
@@ -1034,9 +1046,11 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
  */
 void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 {
-	mutex_lock(&node->ggtt->lock);
-	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
-	mutex_unlock(&node->ggtt->lock);
+	if (!node)
+		return;
+
+	guard(mutex)(&node->ggtt->lock);
+	xe_ggtt_assign_locked(node, vfid);
 }
 
 /**
@@ -1058,14 +1072,14 @@ int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfi
 	if (!node)
 		return -ENOENT;
 
-	guard(mutex)(&node->ggtt->lock);
+	ggtt = node->ggtt;
+	guard(mutex)(&ggtt->lock);
 
 	if (xe_ggtt_node_pt_size(node) != size)
 		return -EINVAL;
 
-	ggtt = node->ggtt;
-	start = node->base.start;
-	end = start + node->base.size - 1;
+	start = xe_ggtt_node_addr(node);
+	end = start + xe_ggtt_node_size(node) - 1;
 
 	while (start < end) {
 		pte = ggtt->pt_ops->ggtt_get_pte(ggtt, start);
@@ -1098,14 +1112,14 @@ int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u
 	if (!node)
 		return -ENOENT;
 
-	guard(mutex)(&node->ggtt->lock);
+	ggtt = node->ggtt;
+	guard(mutex)(&ggtt->lock);
 
 	if (xe_ggtt_node_pt_size(node) != size)
 		return -EINVAL;
 
-	ggtt = node->ggtt;
-	start = node->base.start;
-	end = start + node->base.size - 1;
+	start = xe_ggtt_node_addr(node);
+	end = start + xe_ggtt_node_size(node) - 1;
 
 	while (start < end) {
 		vfid_pte = u64_replace_bits(*buf++, vfid, GGTT_PTE_VFID);
@@ -1212,7 +1226,7 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
  */
 u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
 {
-	return node->base.start;
+	return node->base.start + node->ggtt->start;
 }
 
 /**
-- 
2.51.0

