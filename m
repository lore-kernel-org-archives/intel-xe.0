Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1B3D1D465
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 14:50:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB2210E775;
	Thu,  8 Jan 2026 14:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="bKjoQ8sW";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C657C10E775
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767883819;
 bh=iz33+nGKN1E8xtvHoEdsTlsnRgCOPoAqMPrecuZrig0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bKjoQ8sWxwQhk4NQvxVe+xcVyH6q7iQ7lxyOzcC7FqVSyxOvfVVKZ/fnHqTQH3kLK
 9uLAvt/30Ku6cZ5yGtaPya8gQmCQa4jTPH3PUa27/mdAeKmkS5qCeqcXnI3TRBD/p5
 7/+0TjdjGLNVMzQSYVDZnYThBwEVrsFsulCnDamBEegzj1uGB5KievQ5OBIcUuSWby
 oo0DLygIcxiFMOQ6Y0u6Bg96sZwJ7e0QXFlNqJwXapZ71WlaXTLWJbKhThnlbDWXfS
 mkaxrPUYWtgMHcyc4OJaNvGqgylMZBpAYVjht27x+AKgJNJBSZXhGaimvk2by6dmcH
 KXtJWA1U+b0vw==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW 11/12] drm/xe: Make xe_ggtt_node_insert return
 a node
Date: Thu,  8 Jan 2026 15:50:16 +0100
Message-ID: <20260108145017.642206-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108145017.642206-1-dev@lankhorst.se>
References: <20260108103412.637731-1-dev@lankhorst.se>
 <20260108145017.642206-1-dev@lankhorst.se>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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
index e7b2b6626d645..0c1e2d8e4af5e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -459,6 +459,11 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
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
@@ -622,68 +627,51 @@ static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
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
index a69d7624be526..e02bc52c0b4d2 100644
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
index 9f2525f3cb379..a6414d164166e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -484,23 +484,9 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
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
 
@@ -535,14 +521,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
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
@@ -554,7 +536,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	config->ggtt_region = node;
 	return 0;
 err:
-	pf_release_ggtt(tile, node);
+	xe_ggtt_node_remove(node, false);
 	return err;
 }
 
-- 
2.51.0

