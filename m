Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0F4D3F083
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 16:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2210E73C;
	Wed, 28 Jan 2026 16:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="bLtHSoE2";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C689010E73B
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1769619453;
 bh=wlBtJfZatnmY1AHBQ8BcLJBNUmvwWeYh/GVYtE16Pug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bLtHSoE2GCFybxMN+1/FhGvl4Mgu47UBm69Hg2YojhsLiKx1h1t8yqMdk2pNn1JYC
 RkxHKPcmDSphJGn/OfNjK7sMN0YuIrL5tsKZ7iwAKCztVJmviHCkojY6fWqaz7NEUa
 lpBH+CFjkl2dnH9o6kzkV0sUWw+FYLAGBSo/maV1FDveXtMkbcDwPAugyTNdlwGRh6
 tLFIqXt653Yknt3nxPtlLO27i/9d2TjocuKhJaqnNht6wMm+JlYs8XucFD8Px1UR4g
 vzYqppf2GhQQFICscxnG8GB0qkw+dB12V/k6jGxa7wD0x5m8SQgeG2EYUzy2RoDm0q
 uGCzHj4KtTCwQ==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v7 4/5] drm/xe: Make xe_ggtt_node_insert return a node
Date: Wed, 28 Jan 2026 17:57:22 +0100
Message-ID: <20260128165724.12587-5-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260128165724.12587-1-dev@lankhorst.se>
References: <20260128165724.12587-1-dev@lankhorst.se>
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

This extra step is easier to handle inside xe_ggtt.c and makes
xe_ggtt_node_allocated a simple null check instead, as the intermediate
state 'allocated but not inserted' is no longer used.

Privatize xe_ggtt_node_fini() and init() as they're no longer used
outside of xe_ggtt.c

Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c      |  2 +-
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 97 +++++++++------------
 drivers/gpu/drm/xe/xe_ggtt.h                |  7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 24 +----
 5 files changed, 48 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d2c4e94180fa3..5ff583699325c 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -256,7 +256,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		size = intel_rotation_info_size(&view->rotated) * XE_PAGE_SIZE;
 
 	pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
-	vma->node = xe_ggtt_node_insert_transform(ggtt, bo, pte,
+	vma->node = xe_ggtt_insert_node_transform(ggtt, bo, pte,
 						  ALIGN(size, align), align,
 						  view->type == I915_GTT_VIEW_NORMAL ?
 						  NULL : write_ggtt_rotated_node,
diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index acddbedcf17cb..51e1e04001ace 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -38,12 +38,8 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
 	if (flags & XE_BO_FLAG_GGTT) {
 		struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
+		bo->ggtt_node[tile->id] = xe_ggtt_insert_node(ggtt, xe_bo_size(bo), SZ_4K);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
-
-		KUNIT_ASSERT_EQ(test, 0,
-				xe_ggtt_node_insert(bo->ggtt_node[tile->id],
-						    xe_bo_size(bo), SZ_4K));
 	}
 
 	return bo;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index d0789877e2cdc..ca9ae02659b1a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -69,9 +69,8 @@
 /**
  * struct xe_ggtt_node - A node in GGTT.
  *
- * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
- * insertion or reservation.
- * It will, then, be finalized by xe_ggtt_node_remove().
+ * This struct is allocated with xe_ggtt_insert_node(,_transform) or xe_ggtt_insert_bo(,_at).
+ * It will be deallocated using xe_ggtt_node_remove().
  */
 struct xe_ggtt_node {
 	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
@@ -458,6 +457,11 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void ggtt_node_fini(struct xe_ggtt_node *node)
+{
+	kfree(node);
+}
+
 static void ggtt_node_remove(struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
@@ -483,7 +487,7 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
 	drm_dev_exit(idx);
 
 free_node:
-	xe_ggtt_node_fini(node);
+	ggtt_node_fini(node);
 }
 
 static void ggtt_node_remove_work_func(struct work_struct *work)
@@ -613,50 +617,14 @@ void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
 				      u32 size, u32 align, u32 mm_flags)
 {
 	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
-/**
- * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
- * @node: the &xe_ggtt_node to be inserted
- * @size: size of the node
- * @align: alignment constrain of the node
- *
- * It cannot be called without first having called xe_ggtt_init() once.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
-{
-	int ret;
-
-	if (!node || !node->ggtt)
-		return -ENOENT;
-
-	mutex_lock(&node->ggtt->lock);
-	ret = xe_ggtt_node_insert_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
-	mutex_unlock(&node->ggtt->lock);
-
-	return ret;
-}
-
-/**
- * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
- * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
- *
- * This function will allocate the struct %xe_ggtt_node and return its pointer.
- * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
- * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
- * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
- *
- * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
- **/
-struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
+static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 {
 	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
 
@@ -670,16 +638,31 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
 }
 
 /**
- * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
- * @node: the &xe_ggtt_node to be freed
+ * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
  *
- * If anything went wrong with either xe_ggtt_node_insert() and this @node is
- * not going to be reused, then this function needs to be called to free the
- * %xe_ggtt_node struct
- **/
-void xe_ggtt_node_fini(struct xe_ggtt_node *node)
+ * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
-	kfree(node);
+	struct xe_ggtt_node *node;
+	int ret;
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+	ret = xe_ggtt_insert_node_locked(node, size, align,
+					 DRM_MM_INSERT_HIGH);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
 }
 
 /**
@@ -767,7 +750,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 }
 
 /**
- * xe_ggtt_node_insert_transform - Insert a newly allocated &xe_ggtt_node into the GGTT
+ * xe_ggtt_insert_node_transform - Insert a newly allocated &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt where the node will inserted/reserved.
  * @bo: The bo to be transformed
  * @pte_flags: The extra GGTT flags to add to mapping.
@@ -781,7 +764,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
-struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
+struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 						   struct xe_bo *bo, u64 pte_flags,
 						   u64 size, u32 align,
 						   xe_ggtt_transform_cb transform, void *arg)
@@ -789,7 +772,7 @@ struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
 	struct xe_ggtt_node *node;
 	int ret;
 
-	node = xe_ggtt_node_init(ggtt);
+	node = ggtt_node_init(ggtt);
 	if (IS_ERR(node))
 		return ERR_CAST(node);
 
@@ -798,7 +781,7 @@ struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_node_insert_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
 	if (ret)
 		goto err_unlock;
 
@@ -813,7 +796,7 @@ struct xe_ggtt_node *xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
 err_unlock:
 	mutex_unlock(&ggtt->lock);
 err:
-	xe_ggtt_node_fini(node);
+	ggtt_node_fini(node);
 	return ERR_PTR(ret);
 }
 
@@ -839,7 +822,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
 
-	bo->ggtt_node[tile_id] = xe_ggtt_node_init(ggtt);
+	bo->ggtt_node[tile_id] = ggtt_node_init(ggtt);
 	if (IS_ERR(bo->ggtt_node[tile_id])) {
 		err = PTR_ERR(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
@@ -858,7 +841,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
 					  xe_bo_size(bo), alignment, 0, start, end, 0);
 	if (err) {
-		xe_ggtt_node_fini(bo->ggtt_node[tile_id]);
+		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
 	} else {
 		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 403eb5c0db49d..9e6210c6f44ea 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,15 +18,14 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
-void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
 u64 xe_ggtt_start(struct xe_ggtt *ggtt);
 u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
-int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 struct xe_ggtt_node *
-xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
+xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+struct xe_ggtt_node *
+xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
 			      u64 size, u32 align,
 			      xe_ggtt_transform_cb transform, void *arg);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 23601ce79348a..3fe664cd3b88c 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -482,23 +482,9 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
 	return err ?: err2;
 }
 
-static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
-{
-	if (xe_ggtt_node_allocated(node)) {
-		/*
-		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
-		 * is redundant, as PTE will be implicitly re-assigned to PF by
-		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
-		 */
-		xe_ggtt_node_remove(node, false);
-	} else {
-		xe_ggtt_node_fini(node);
-	}
-}
-
 static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
-	pf_release_ggtt(gt_to_tile(gt), config->ggtt_region);
+	xe_ggtt_node_remove(config->ggtt_region, false);
 	config->ggtt_region = NULL;
 }
 
@@ -533,14 +519,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	node = xe_ggtt_node_init(ggtt);
+	node = xe_ggtt_insert_node(ggtt, size, alignment);
 	if (IS_ERR(node))
 		return PTR_ERR(node);
 
-	err = xe_ggtt_node_insert(node, size, alignment);
-	if (unlikely(err))
-		goto err;
-
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
 				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
@@ -552,7 +534,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	config->ggtt_region = node;
 	return 0;
 err:
-	pf_release_ggtt(tile, node);
+	xe_ggtt_node_remove(node, false);
 	return err;
 }
 
-- 
2.51.0

