Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFE9D1A61D
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 13:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2345710E8D7;
	Fri,  9 Jan 2026 13:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Ebwm8zxc";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59A210E8D7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1767965876;
 bh=f2YrEW/ZrX5h7vCLqt8LADc2cF0g4cuZSSrJ09X5goU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ebwm8zxcpnNoKjrvMfzTsgfB+7ZWL7Jy4zTpc+DcA9dD/0bMR2z4yqdbQ6qgS1OkY
 wXpDc67pWqe4oND2Vk72OZTaRxc4oYsK8+3/sgUm+l04p/FgyAbvNjwGEIHQ/87lSX
 hc3ORzAskl31UXDolKhgeF5cLDSp+vUnPDvsmN4HrZ5afVa9ySs/YtVZ85mv/bzh+j
 5R0OXv0VFF550P/Oz5Di1RM5S8j3a8NoaG6bdAa5068f9qnwGh6uEAezPxESWRz9Oc
 +xFrEiSBEgGvaC7mGoeJREE/esSf8A2f3H2LeoB7zjtvFuVQZ2vlrIf0xkDKV+ALWz
 xTIiD94W32wLg==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [FOR-CI-DO-NOT-REVIEW-v3 09/12] drm/xe: Rewrite GGTT VF initialisation
Date: Fri,  9 Jan 2026 14:37:42 +0100
Message-ID: <20260109133746.739923-10-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260109133746.739923-1-dev@lankhorst.se>
References: <20260109133746.739923-1-dev@lankhorst.se>
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

The previous code was using a complicated system with 2 balloons to
set GGTT size and adjust GGTT offset. While it works, it's overly
complicated.

A better approach is to set the offset and size when initialising GGTT,
this removes the need for adding balloons. The resize function only
needs readjust ggtt->start to have GGTT at the new offset.

This removes the need to manipulate the internals of xe_ggtt outside
of xe_ggtt, and cleans up a lot of now unneeded code.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Co-developed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h  |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c          | 159 ++++-----------------
 drivers/gpu/drm/xe/xe_ggtt.h          |   5 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c   |   7 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c | 198 +-------------------------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h |   3 -
 6 files changed, 34 insertions(+), 340 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4dab3057f58d2..fa28477fe6fae 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -221,8 +221,6 @@ struct xe_tile {
 			struct xe_lmtt lmtt;
 		} pf;
 		struct {
-			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node *ggtt_balloon[2];
 			/** @sriov.vf.self_config: VF configuration data */
 			struct xe_tile_sriov_vf_selfconfig self_config;
 		} vf;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index fcf062873af0c..d8ffba5144d5f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -71,8 +71,8 @@
  * struct xe_ggtt_node - A node in GGTT.
  *
  * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
- * insertion, reservation, or 'ballooning'.
- * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
+ * insertion or reservation.
+ * It will, then, be finalized by xe_ggtt_node_remove().
  */
 struct xe_ggtt_node {
 	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
@@ -348,9 +348,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 		ggtt_start = wopcm;
 		ggtt_size = (gsm_size / 8) * (u64) XE_PAGE_SIZE - ggtt_start;
 	} else {
-		/* GGTT is expected to be 4GiB */
-		ggtt_start = wopcm;
-		ggtt_size = SZ_4G - ggtt_start;
+		ggtt_start = xe_tile_sriov_vf_ggtt_base(ggtt->tile);
+		ggtt_size = xe_tile_sriov_vf_ggtt(ggtt->tile);
+
+		if (ggtt_start < wopcm || ggtt_start > GUC_GGTT_TOP ||
+		    ggtt_size > GUC_GGTT_TOP - ggtt_start) {
+			xe_tile_err(ggtt->tile, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
+				     ggtt->tile->id, ggtt_start, ggtt_start + ggtt_size - 1);
+			return -ERANGE;
+		}
 	}
 
 	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
@@ -378,17 +384,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (err)
 		return err;
 
-	err = devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
-	if (err)
-		return err;
-
-	if (IS_SRIOV_VF(xe)) {
-		err = xe_tile_sriov_vf_prepare_ggtt(ggtt->tile);
-		if (err)
-			return err;
-	}
-
-	return 0;
+	return devm_add_action_or_reset(xe->drm.dev, dev_fini_ggtt, ggtt);
 }
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
@@ -539,119 +535,21 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
 }
 
-static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
-			      const struct drm_mm_node *node, const char *description)
-{
-	char buf[10];
-
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		string_get_size(node->size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		xe_tile_dbg(ggtt->tile, "GGTT %#llx-%#llx (%s) %s\n",
-			    node->start, node->start + node->size, buf, description);
-	}
-}
-
-/**
- * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
- * @node: the &xe_ggtt_node to hold reserved GGTT node
- * @start: the starting GGTT address of the reserved region
- * @end: then end GGTT address of the reserved region
- *
- * To be used in cases where ggtt->lock is already taken.
- * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
-{
-	struct xe_ggtt *ggtt = node->ggtt;
-	int err;
-
-	xe_tile_assert(ggtt->tile, start < end);
-	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
-	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
-	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
-	lockdep_assert_held(&ggtt->lock);
-
-	node->base.color = 0;
-	node->base.start = start - ggtt->start;
-	node->base.size = end - start;
-
-	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
-
-	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
-			 xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + node->base.size, ERR_PTR(err)))
-		return err;
-
-	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
-	return 0;
-}
-
-/**
- * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
- * @node: the &xe_ggtt_node with reserved GGTT region
- *
- * To be used in cases where ggtt->lock is already taken.
- * See xe_ggtt_node_insert_balloon_locked() for details.
- */
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
-{
-	if (!xe_ggtt_node_allocated(node))
-		return;
-
-	lockdep_assert_held(&node->ggtt->lock);
-
-	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
-
-	drm_mm_remove_node(&node->base);
-}
-
-static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
-{
-	struct xe_tile *tile = ggtt->tile;
-
-	xe_tile_assert(tile, start >= ggtt->start);
-	xe_tile_assert(tile, start + size <= ggtt->start + ggtt->size);
-}
-
 /**
- * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
+ * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
- * @shift: change to the location of area provisioned for current VF
+ * @new_start: new location of area provisioned for current VF
  *
- * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
- * to represent allocations in range formerly assigned to current VF, before the range changed.
- * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
- *
- * The function has no ability of failing - because it shifts existing nodes, without
- * any additional processing. If the nodes were successfully existing at the old address,
- * they will do the same at the new one. A fail inside this function would indicate that
- * the list of nodes was either already damaged, or that the shift brings the address range
- * outside of valid bounds. Both cases justify an assert rather than error code.
+ * Adjust the base offset of the GGTT.
  */
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
-	struct xe_tile *tile __maybe_unused = ggtt->tile;
-	struct drm_mm_node *node, *tmpn;
-	LIST_HEAD(temp_list_head);
-
-	lockdep_assert_held(&ggtt->lock);
+	guard(mutex)(&ggtt->lock);
 
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
-		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
-			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
+	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
 
-	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
-		drm_mm_remove_node(node);
-		list_add(&node->node_list, &temp_list_head);
-	}
-
-	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
-		list_del(&node->node_list);
-		node->start += shift;
-		drm_mm_reserve_node(&ggtt->mm, node);
-		xe_tile_assert(tile, drm_mm_node_allocated(node));
-	}
+	WRITE_ONCE(ggtt->start, new_start);
 }
 
 static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
@@ -692,12 +590,8 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  *
  * This function will allocate the struct %xe_ggtt_node and return its pointer.
  * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
- * or xe_ggtt_node_remove_balloon_locked().
- *
- * Having %xe_ggtt_node struct allocated doesn't mean that the node is already
- * allocated in GGTT. Only xe_ggtt_node_insert(), allocation through
- * xe_ggtt_node_insert_transform(), or xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved
- * in GGTT.
+ * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
+ * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
@@ -718,9 +612,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
  * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
  * @node: the &xe_ggtt_node to be freed
  *
- * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
- * this function needs to be called to free the %xe_ggtt_node struct
+ * If anything went wrong with either xe_ggtt_node_insert() and this @node is
+ * not going to be reused, then this function needs to be called to free the
+ * %xe_ggtt_node struct
  **/
 void xe_ggtt_node_fini(struct xe_ggtt_node *node)
 {
@@ -1223,7 +1117,8 @@ u64 xe_ggtt_read_pte(struct xe_ggtt *ggtt, u64 offset)
  */
 u64 xe_ggtt_node_addr(const struct xe_ggtt_node *node)
 {
-	return node->base.start + node->ggtt->start;
+	/* pairs with WRITE_ONCE in  xe_ggtt_shift_nodes() */
+	return node->base.start + READ_ONCE(node->ggtt->start);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 70d5e07ac4b66..49ea8e7ecc105 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -19,10 +19,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
-				       u64 start, u64 size);
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
 u64 xe_ggtt_start(struct xe_ggtt *ggtt);
 u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index d91c65dc34960..ea180a3ea7cb0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -489,7 +489,6 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	struct xe_guc *guc = &gt->uc.guc;
 	u64 start, size, ggtt_size;
 	s64 shift;
@@ -497,8 +496,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	guard(mutex)(&ggtt->lock);
-
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
 	if (unlikely(err))
 		return err;
@@ -524,10 +521,10 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_tile_sriov_vf_ggtt_base_store(tile, start);
 	xe_tile_sriov_vf_ggtt_store(tile, size);
 
-	if (shift && shift != start) {
+	if (ggtt_size) {
 		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
 				 shift, start);
-		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
+		xe_ggtt_shift_nodes(tile->mem.ggtt, start);
 	}
 
 	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index c9bac2cfdd044..24293521e0904 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
@@ -14,173 +14,12 @@
 #include "xe_tile_sriov_vf.h"
 #include "xe_wopcm.h"
 
-static int vf_init_ggtt_balloons(struct xe_tile *tile)
-{
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
-
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-
-	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
-	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
-		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
-
-	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
-	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
-		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
-		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
-	}
-
-	return 0;
-}
-
-/**
- * xe_tile_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
- * @tile: the &xe_tile struct instance
- *
- * Return: 0 on success or a negative error code on failure.
- */
-static int xe_tile_sriov_vf_balloon_ggtt_locked(struct xe_tile *tile)
-{
-	u64 ggtt_base = tile->sriov.vf.self_config.ggtt_base;
-	u64 ggtt_size = tile->sriov.vf.self_config.ggtt_size;
-	struct xe_device *xe = tile_to_xe(tile);
-	u64 wopcm = xe_wopcm_size(xe);
-	u64 start, end;
-	int err;
-
-	xe_tile_assert(tile, IS_SRIOV_VF(xe));
-	xe_tile_assert(tile, ggtt_size);
-	lockdep_assert_held(&tile->mem.ggtt->lock);
-
-	/*
-	 * VF can only use part of the GGTT as allocated by the PF:
-	 *
-	 *      WOPCM                                  GUC_GGTT_TOP
-	 *      |<------------ Total GGTT size ------------------>|
-	 *
-	 *           VF GGTT base -->|<- size ->|
-	 *
-	 *      +--------------------+----------+-----------------+
-	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
-	 *      +--------------------+----------+-----------------+
-	 *
-	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
-	 */
-
-	if (ggtt_base < wopcm || ggtt_base > GUC_GGTT_TOP ||
-	    ggtt_size > GUC_GGTT_TOP - ggtt_base) {
-		xe_sriov_err(xe, "tile%u: Invalid GGTT configuration: %#llx-%#llx\n",
-			     tile->id, ggtt_base, ggtt_base + ggtt_size - 1);
-		return -ERANGE;
-	}
-
-	start = wopcm;
-	end = ggtt_base;
-	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
-							 start, end);
-		if (err)
-			return err;
-	}
-
-	start = ggtt_base + ggtt_size;
-	end = GUC_GGTT_TOP;
-	if (end != start) {
-		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
-							 start, end);
-		if (err) {
-			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
-			return err;
-		}
-	}
-
-	return 0;
-}
-
-static int vf_balloon_ggtt(struct xe_tile *tile)
-{
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
-	int err;
-
-	mutex_lock(&ggtt->lock);
-	err = xe_tile_sriov_vf_balloon_ggtt_locked(tile);
-	mutex_unlock(&ggtt->lock);
-
-	return err;
-}
-
-/**
- * xe_tile_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
- * @tile: the &xe_tile struct instance
- */
-void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile)
-{
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-
-	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
-}
-
-static void vf_deballoon_ggtt(struct xe_tile *tile)
-{
-	mutex_lock(&tile->mem.ggtt->lock);
-	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
-	mutex_unlock(&tile->mem.ggtt->lock);
-}
-
-static void vf_fini_ggtt_balloons(struct xe_tile *tile)
-{
-	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-
-	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
-}
-
-static void cleanup_ggtt(struct drm_device *drm, void *arg)
-{
-	struct xe_tile *tile = arg;
-
-	vf_deballoon_ggtt(tile);
-	vf_fini_ggtt_balloons(tile);
-}
-
-/**
- * xe_tile_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
- * @tile: the &xe_tile
- *
- * This function is for VF use only.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = vf_init_ggtt_balloons(tile);
-	if (err)
-		return err;
-
-	err = vf_balloon_ggtt(tile);
-	if (err) {
-		vf_fini_ggtt_balloons(tile);
-		return err;
-	}
-
-	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);
-}
-
 /**
  * DOC: GGTT nodes shifting during VF post-migration recovery
  *
  * The first fixup applied to the VF KMD structures as part of post-migration
  * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
  * from range previously assigned to this VF, into newly provisioned area.
- * The changes include balloons, which are resized accordingly.
- *
- * The balloon nodes are there to eliminate unavailable ranges from use: one
- * reserves the GGTT area below the range for current VF, and another one
- * reserves area above.
  *
  * Below is a GGTT layout of example VF, with a certain address range assigned to
  * said VF, and inaccessible areas above and below:
@@ -198,10 +37,6 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
  *
  *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
  *
- * GGTT nodes used for tracking allocations:
- *
- *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
- *
  * After the migration, GGTT area assigned to the VF might have shifted, either
  * to lower or to higher address. But we expect the total size and extra areas to
  * be identical, as migration can only happen between matching platforms.
@@ -219,37 +54,12 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
  * So the VF has a new slice of GGTT assigned, and during migration process, the
  * memory content was copied to that new area. But the &xe_ggtt nodes are still
  * tracking allocations using the old addresses. The nodes within VF owned area
- * have to be shifted, and balloon nodes need to be resized to properly mask out
- * areas not owned by the VF.
- *
- * Fixed &xe_ggtt nodes used for tracking allocations:
- *
- *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
+ * have to be shifted, and the start offset for GGTT adjusted.
  *
- * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
+ * Due to use of GPU profiles, we do not expect the old and new GGTT areas to
  * overlap; but our node shifting will fix addresses properly regardless.
  */
 
-/**
- * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
- * @tile: the &xe_tile struct instance
- * @shift: the shift value
- *
- * Since Global GTT is not virtualized, each VF has an assigned range
- * within the global space. This range might have changed during migration,
- * which requires all memory addresses pointing to GGTT to be shifted.
- */
-void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
-{
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
-
-	lockdep_assert_held(&ggtt->lock);
-
-	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
-	xe_ggtt_shift_nodes_locked(ggtt, shift);
-	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
-}
-
 /**
  * xe_tile_sriov_vf_lmem - VF LMEM configuration.
  * @tile: the &xe_tile
@@ -330,7 +140,7 @@ u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile)
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
 
-	return config->ggtt_base;
+	return READ_ONCE(config->ggtt_base);
 }
 
 /**
@@ -346,5 +156,5 @@ void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
 
-	config->ggtt_base = ggtt_base;
+	WRITE_ONCE(config->ggtt_base, ggtt_base);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
index 749f41504883c..f2bbc4fc57347 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
@@ -10,9 +10,6 @@
 
 struct xe_tile;
 
-int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
-void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
-void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
 u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
 void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
 u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);
-- 
2.51.0

