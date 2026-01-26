Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D447CF65D6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jan 2026 10:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E2D10E40C;
	Mon, 26 Jan 2026 10:46:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="PWeS5fRK";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D8A10E400;
 Mon, 26 Jan 2026 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769424374;
 bh=B126k159oqVVmfouixyKAEv1vcKcEQhea3PLrQAa3P8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PWeS5fRKofD6IC7ZRWEovy7njStZUN8O4lL4ixeIh3Gtt3BoUe7aY7+dBf3wG/xWb
 82x0QB90E4C3j2KvsHygOOWlWrRnXiPptrCDCnx/5HzGGqOoiE51i7JptMrqbdgaa1
 fQBiZ5vJ8ykYJJ9Tt2txe5nWzudblYbLl9HgbyEjk8mWBKjngl4wgUKmm1mzZgbfQP
 Cm2co+9F8ANQWZVnjQ+fAZ9p/X0gYowv4yHtxRLcmeiFjns469wuKn68u0Ot/5Jum9
 cXmFLC6My0bqpi3FqN1OKBmpcTfy2cDsPOxasp/Iyw6fUSlEu3HlaMWuNkxICtKHIB
 RN0ZG1xKKmcNw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v6 5/5] drm/xe: Remove xe_ggtt_node_allocated
Date: Mon, 26 Jan 2026 11:46:04 +0100
Message-ID: <20260126104604.988024-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126104604.988024-1-dev@lankhorst.se>
References: <20260126104604.988024-1-dev@lankhorst.se>
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

With the intermediate state gone, no longer useful. Just check against
NULL where needed.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  3 +--
 drivers/gpu/drm/xe/xe_ggtt.c               | 17 -----------------
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 -
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
 4 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 5ff583699325c..e1d29b6ba043e 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -352,8 +352,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node[tile_id]) ||
-		 vma->bo->ggtt_node[tile_id] != vma->node)
+	else if (vma->bo->ggtt_node[tile_id] != vma->node)
 		xe_ggtt_node_remove(vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f3170cbbaeed8..246a06221c33b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -664,20 +664,6 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 	return node;
 }
 
-/**
- * xe_ggtt_node_allocated - Check if node is allocated in GGTT
- * @node: the &xe_ggtt_node to be inspected
- *
- * Return: True if allocated, False otherwise.
- */
-bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
-{
-	if (!node || !node->ggtt)
-		return false;
-
-	return drm_mm_node_allocated(&node->base);
-}
-
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
  * @node: the &xe_ggtt_node
@@ -958,9 +944,6 @@ static void xe_ggtt_assign_locked(const struct xe_ggtt_node *node, u16 vfid)
 
 	lockdep_assert_held(&ggtt->lock);
 
-	if (!xe_ggtt_node_allocated(node))
-		return;
-
 	while (start < end) {
 		ggtt->pt_ops->ggtt_set_pte(ggtt, start, pte);
 		start += XE_PAGE_SIZE;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 9e6210c6f44ea..c864cc975a695 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -30,7 +30,6 @@ xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      u64 size, u32 align,
 			      xe_ggtt_transform_cb transform, void *arg);
 void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
-bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 size_t xe_ggtt_node_pt_size(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo, struct drm_exec *exec);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3fe664cd3b88c..888193e1d2c50 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -279,7 +279,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config,
 {
 	struct xe_ggtt_node *node = config->ggtt_region;
 
-	if (!xe_ggtt_node_allocated(node))
+	if (!node)
 		return 0;
 
 	return encode_ggtt(cfg, xe_ggtt_node_addr(node), xe_ggtt_node_size(node), details);
@@ -503,7 +503,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (xe_ggtt_node_allocated(config->ggtt_region)) {
+	if (config->ggtt_region) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
@@ -514,7 +514,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 		if (unlikely(err))
 			return err;
 	}
-	xe_gt_assert(gt, !xe_ggtt_node_allocated(config->ggtt_region));
+	xe_gt_assert(gt, !config->ggtt_region);
 
 	if (!size)
 		return 0;
@@ -544,7 +544,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_ggtt_node *node = config->ggtt_region;
 
 	xe_gt_assert(gt, xe_gt_is_main_type(gt));
-	return xe_ggtt_node_allocated(node) ? xe_ggtt_node_size(node) : 0;
+	return node ? xe_ggtt_node_size(node) : 0;
 }
 
 /**
@@ -2558,7 +2558,7 @@ int xe_gt_sriov_pf_config_release(struct xe_gt *gt, unsigned int vfid, bool forc
 
 static void pf_sanitize_ggtt(struct xe_ggtt_node *ggtt_region, unsigned int vfid)
 {
-	if (xe_ggtt_node_allocated(ggtt_region))
+	if (ggtt_region)
 		xe_ggtt_assign(ggtt_region, vfid);
 }
 
@@ -3017,7 +3017,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!xe_ggtt_node_allocated(config->ggtt_region))
+		if (!config->ggtt_region)
 			continue;
 
 		string_get_size(xe_ggtt_node_size(config->ggtt_region), 1, STRING_UNITS_2,
-- 
2.51.0

