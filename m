Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22DCCCD196
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 07:47:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774E810E73A;
	Wed, 15 Oct 2025 07:47:35 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677C610E735
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 07:47:30 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 11/12] drm/xe: Make xe_ggtt_node_insert return a node
Date: Wed, 15 Oct 2025 09:47:20 +0200
Message-ID: <20251015074708.1654014-25-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015074708.1654014-14-dev@lankhorst.se>
References: <20251015074708.1654014-14-dev@lankhorst.se>
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

Privatize xe_ggtt_node_fini() as it's no longer used outside of
xe_ggtt.c

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  6 +-
 drivers/gpu/drm/xe/xe_ggtt.c                | 76 +++++++++------------
 drivers/gpu/drm/xe/xe_ggtt.h                |  5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 24 +------
 4 files changed, 38 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index acddbedcf17cb..7aeee6680d78c 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -38,12 +38,8 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
 	if (flags & XE_BO_FLAG_GGTT) {
 		struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
+		bo->ggtt_node[tile->id] = xe_ggtt_node_insert(ggtt, xe_bo_size(bo), SZ_4K);
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
-
-		KUNIT_ASSERT_EQ(test, 0,
-				xe_ggtt_node_insert(bo->ggtt_node[tile->id],
-						    xe_bo_size(bo), SZ_4K));
 	}
 
 	return bo;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 94cf886785ca2..e4e8be114786a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -442,6 +442,11 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+static void xe_ggtt_node_fini(struct xe_ggtt_node *node)
+{
+	kfree(node);
+}
+
 static void ggtt_node_remove(struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = node->ggtt;
@@ -606,68 +611,51 @@ static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 					  mm_flags);
 }
 
+static struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
+
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
+	node->ggtt = ggtt;
+
+	return node;
+}
+
 /**
  * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
- * @node: the &xe_ggtt_node to be inserted
+ * @ggtt: the @ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * It cannot be called without first having called xe_ggtt_init() once.
- *
- * Return: 0 on success or a negative error code on failure.
+ * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
  */
-int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
+struct xe_ggtt_node *xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
+	struct xe_ggtt_node *node;
 	int ret;
 
-	if (!node || !node->ggtt)
-		return -ENOENT;
+	if (!ggtt)
+		return ERR_PTR(-ENOENT);
+
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
 
 	mutex_lock(&node->ggtt->lock);
 	ret = xe_ggtt_node_insert_locked(node, size, align,
 					 DRM_MM_INSERT_HIGH);
 	mutex_unlock(&node->ggtt->lock);
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
-{
-	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
-
-	if (!node)
-		return ERR_PTR(-ENOMEM);
-
-	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
-	node->ggtt = ggtt;
+	if (ret) {
+		xe_ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
 
 	return node;
 }
 
-/**
- * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
- * @node: the &xe_ggtt_node to be freed
- *
- * If anything went wrong with either xe_ggtt_node_insert() and this @node is
- * not going to be reused, then this function needs to be called to free the
- * %xe_ggtt_node struct
- **/
-void xe_ggtt_node_fini(struct xe_ggtt_node *node)
-{
-	kfree(node);
-}
-
 /**
  * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 9f97f63496bcb..d0ad541a40baf 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,13 +18,12 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
-void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
 u64 xe_ggtt_start(struct xe_ggtt *ggtt);
 u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
-int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
+struct xe_ggtt_node *
+xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align);
 struct xe_ggtt_node *
 xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index c0dfffd5c553b..d71041a611d35 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -434,23 +434,9 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
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
 
@@ -485,14 +471,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	node = xe_ggtt_node_init(ggtt);
+	node = xe_ggtt_node_insert(ggtt, size, alignment);
 	if (IS_ERR(node))
 		return PTR_ERR(node);
 
-	err = xe_ggtt_node_insert(node, size, alignment);
-	if (unlikely(err))
-		goto err;
-
 	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
 				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
@@ -505,7 +487,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	config->ggtt_size = size;
 	return 0;
 err:
-	pf_release_ggtt(tile, node);
+	xe_ggtt_node_remove(node, false);
 	return err;
 }
 
-- 
2.51.0

