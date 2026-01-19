Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 337FECCF2F6
	for <intel-xe@archiver.kernel.org>; Mon, 19 Jan 2026 12:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB21910E44C;
	Mon, 19 Jan 2026 12:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="bCDAcYSi";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2789710E44C
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Jan 2026 12:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1768827067;
 bh=BkJotXlpxKnBB3Gxx8JBf2G+DFEcWT/EVBLTx9TYvhI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bCDAcYSio+oQIPN2Zd2MoMk6/o+m3HAbI7/gSEa3Cn/FUFDCgPupCjT12E36GVSl3
 nCsuWDWGDh0cre0elkqKoS9jcdqTnGTI/h39yvE7zYUW0bR4hYR3L1odiNtsVgZt5s
 2JWDdbqKgL/Wnz10Bvy4mrfOt4tKQIco80DpwfVZ9kRTjbz1scW7Q4e+dYaIx0fXY5
 z0648cQdQBHQn4BzDXdGS1nFSRe+SNHNvKejoi334k5rRpJQB1w27i0plqadaYy44v
 j2SJohYOTbuPE/g5KeNXwHP2mZiAO6XcjOQFM97q9yKmL/QEol1+WCLi+Yjwrd6nVw
 p1OlKzOC6bMxA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v5 1/5] drm/xe: Make xe_ggtt_node offset relative to starting
 offset
Date: Mon, 19 Jan 2026 13:50:57 +0100
Message-ID: <20260119125101.277182-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260119125101.277182-1-dev@lankhorst.se>
References: <20260119125101.277182-1-dev@lankhorst.se>
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

This will make node shifting for SR-IOV VF a one-liner, instead of
manually changing each GGTT node's base address.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 56 ++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 60665ad1415be..7e9ff8057703f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -299,7 +299,7 @@ static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
 	ggtt->start = start;
 	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, start, size);
+	drm_mm_init(&ggtt->mm, 0, size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
@@ -401,7 +401,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
-		xe_ggtt_clear(ggtt, start, end - start);
+		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
@@ -418,7 +418,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 
 	mutex_lock(&ggtt->lock);
 	if (bound)
-		xe_ggtt_clear(ggtt, node->base.start, node->base.size);
+		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
 	drm_mm_remove_node(&node->base);
 	node->base.size = 0;
 	mutex_unlock(&ggtt->lock);
@@ -570,16 +570,17 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
+	xe_assert(xe, start >= ggtt->start);
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
@@ -770,7 +771,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	if (XE_WARN_ON(!node))
 		return;
 
-	start = node->base.start;
+	start = xe_ggtt_node_addr(node);
 	end = start + xe_bo_size(bo);
 
 	if (!xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo)) {
@@ -891,6 +892,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	}
 
 	mutex_lock(&ggtt->lock);
+	xe_assert(xe, start >= ggtt->start || !start);
+	xe_assert(xe, end >= ggtt->start);
+
+	if (start)
+		start -= ggtt->start;
+
+	end -= ggtt->start;
+
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
 					  xe_bo_size(bo), alignment, 0, start, end, 0);
 	if (err) {
@@ -1002,16 +1011,17 @@ static u64 xe_encode_vfid_pte(u16 vfid)
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
@@ -1033,9 +1043,11 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
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
@@ -1057,14 +1069,14 @@ int xe_ggtt_node_save(struct xe_ggtt_node *node, void *dst, size_t size, u16 vfi
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
@@ -1097,14 +1109,14 @@ int xe_ggtt_node_load(struct xe_ggtt_node *node, const void *src, size_t size, u
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
@@ -1211,7 +1223,7 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
  */
 u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
 {
-	return node->base.start;
+	return node->base.start + node->ggtt->start;
 }
 
 /**
-- 
2.51.0

