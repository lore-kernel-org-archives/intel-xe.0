Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3983CCD18E
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 12:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A61110EBD3;
	Fri, 10 Oct 2025 12:07:09 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C90810EBC7
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 12:07:07 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 4/6] drm/xe: Rewrite GGTT VF initialisation
Date: Fri, 10 Oct 2025 14:07:00 +0200
Message-ID: <20251010120655.1046007-12-dev@lankhorst.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251010120655.1046007-8-dev@lankhorst.se>
References: <20251010120655.1046007-8-dev@lankhorst.se>
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
needs to re-initialise GGTT at the new offset.

We use the newly created drm_mm_shift to shift the nodes.

This removes the need to manipulate the internals of xe_ggtt outside
of xe_ggtt, and cleans up a lot of now unneeded code.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
This patch has been rebased by Matthew Brost,
with some final fixups by Maarten to remove
the use of ggtt->mutex, and all references to the balloons.

 drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h        |   2 -
 drivers/gpu/drm/xe/xe_ggtt.c                | 143 +++-----------
 drivers/gpu/drm/xe/xe_ggtt.h                |   5 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h          |   4 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c         |   5 +-
 drivers/gpu/drm/xe/xe_tile.c                |  18 ++
 drivers/gpu/drm/xe/xe_tile_sriov_vf.c       | 197 ++------------------
 drivers/gpu/drm/xe/xe_tile_sriov_vf.h       |   4 +-
 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h |   4 +
 10 files changed, 69 insertions(+), 315 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
index d266882adc0e0..acddbedcf17cb 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
@@ -67,7 +67,7 @@ static int guc_buf_test_init(struct kunit *test)
 
 	KUNIT_ASSERT_EQ(test, 0,
 			xe_ggtt_init_kunit(ggtt, DUT_GGTT_START,
-					   DUT_GGTT_START + DUT_GGTT_SIZE));
+					   DUT_GGTT_SIZE));
 
 	kunit_activate_static_stub(test, xe_managed_bo_create_pin_map,
 				   replacement_xe_managed_bo_create_pin_map);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 02c04ad7296e4..a05164cc669f9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -192,8 +192,6 @@ struct xe_tile {
 			struct xe_lmtt lmtt;
 		} pf;
 		struct {
-			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node *ggtt_balloon[2];
 			/** @sriov.vf.self_config: VF configuration data */
 			struct xe_tile_sriov_vf_selfconfig self_config;
 		} vf;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 1fcb128e661b6..cd4b62303e0ec 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -274,7 +274,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
 	u64 ggtt_start, wopcm = xe_wopcm_size(xe), ggtt_size;
-	int err;
 
 	if (!IS_SRIOV_VF(xe)) {
 		if (GRAPHICS_VERx100(xe) >= 1250)
@@ -288,9 +287,15 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
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
@@ -311,17 +316,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	ggtt->wq = alloc_workqueue("xe-ggtt-wq", 0, WQ_MEM_RECLAIM);
 	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
 
-	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
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
+	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 }
 ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
 
@@ -473,83 +468,8 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
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
 /**
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
-	node->base.start = start;
-	node->base.size = end - start;
-
-	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
-
-	if (xe_tile_WARN(ggtt->tile, err, "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
-			 node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
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
-/**
- * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
+ * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
  * @shift: change to the location of area provisioned for current VF
  *
@@ -563,29 +483,22 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
  * the list of nodes was either already damaged, or that the shift brings the address range
  * outside of valid bounds. Both cases justify an assert rather than error code.
  */
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
 {
-	struct xe_tile *tile __maybe_unused = ggtt->tile;
-	struct drm_mm_node *node, *tmpn;
-	LIST_HEAD(temp_list_head);
+	s64 new_start;
 
-	lockdep_assert_held(&ggtt->lock);
+	if (!ggtt->size) {
+		xe_tile_err(ggtt->tile, "Asked to resize before xe_ggtt_init_early()?\n");
+		return;
+	}
 
-	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
-		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
-			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
+	guard(mutex)(&ggtt->lock);
 
-	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
-		drm_mm_remove_node(node);
-		list_add(&node->node_list, &temp_list_head);
-	}
+	new_start = ggtt->start + shift;
+	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
 
-	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
-		list_del(&node->node_list);
-		node->start += shift;
-		drm_mm_reserve_node(&ggtt->mm, node);
-		xe_tile_assert(tile, drm_mm_node_allocated(node));
-	}
+	drm_mm_shift(&ggtt->mm, shift);
 }
 
 /**
@@ -637,11 +550,9 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
  * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
  *
  * This function will allocate the struct %xe_ggtt_node and return its pointer.
- * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
- * or xe_ggtt_node_remove_balloon_locked().
+ * This struct will then be freed after the node removal upon xe_ggtt_node_remove().
  * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
- * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
- * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
+ * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  **/
@@ -662,9 +573,9 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
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
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 6482bddb2ef36..eccef2d2b3cee 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -19,10 +19,7 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
 void xe_ggtt_node_fini(struct xe_ggtt_node *node);
-int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
-				       u64 start, u64 size);
-void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
-void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
+void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
 u64 xe_ggtt_start(struct xe_ggtt *ggtt);
 u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index a27919302d6b2..b659ffc612269 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -57,8 +57,8 @@ struct xe_ggtt {
  * struct xe_ggtt_node - A node in GGTT.
  *
  * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
- * insertion, reservation, or 'ballooning'.
- * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
+ * insertion or reservation.
+ * It will, then, be finalized by either xe_ggtt_node_remove().
  */
 struct xe_ggtt_node {
 	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 46518e629ba36..dd3cd7f140cd1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -442,7 +442,6 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
 static int vf_get_ggtt_info(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	struct xe_guc *guc = &gt->uc.guc;
 	u64 start, size, ggtt_size;
 	s64 shift;
@@ -450,7 +449,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 
 	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
 
-	guard(mutex)(&ggtt->lock);
+	guard(mutex)(&tile->sriov.vf.self_config.ggtt_move_mutex);
 
 	err = guc_action_query_single_klv64(guc, GUC_KLV_VF_CFG_GGTT_START_KEY, &start);
 	if (unlikely(err))
@@ -480,7 +479,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	if (shift && shift != start) {
 		xe_gt_sriov_info(gt, "Shifting GGTT base by %lld to 0x%016llx\n",
 				 shift, start);
-		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
+		xe_ggtt_shift_nodes(tile->mem.ggtt, shift);
 	}
 
 	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 6edb5062c1da5..be3900681b6d8 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -17,6 +17,7 @@
 #include "xe_sa.h"
 #include "xe_svm.h"
 #include "xe_tile.h"
+#include "xe_tile_sriov_vf.h"
 #include "xe_tile_sysfs.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_wa.h"
@@ -157,6 +158,12 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 	if (err)
 		return err;
 
+	if (IS_SRIOV_VF(xe)) {
+		err = xe_tile_sriov_vf_init(tile);
+		if (err)
+			return err;
+	}
+
 	tile->primary_gt = xe_gt_alloc(tile);
 	if (IS_ERR(tile->primary_gt))
 		return PTR_ERR(tile->primary_gt);
@@ -201,6 +208,17 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	return xe_tile_sysfs_init(tile);
 }
 
+/**
+ * xe_tile_init - Initialize the remainder of the tile.
+ * @tile: The tile to initialize.
+ *
+ * This function is used for all tile initialization calls that may allocate memory.
+ *
+ * Note that since this is tile initialization, it should not perform any
+ * GT-specific operations, and thus does not need to hold GT forcewake.
+ *
+ * Returns: 0 on success, negative error code on error.
+ */
 int xe_tile_init(struct xe_tile *tile)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.c b/drivers/gpu/drm/xe/xe_tile_sriov_vf.c
index c9bac2cfdd044..d1fa46e268350 100644
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
@@ -219,35 +54,27 @@ int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile)
  * So the VF has a new slice of GGTT assigned, and during migration process, the
  * memory content was copied to that new area. But the &xe_ggtt nodes are still
  * tracking allocations using the old addresses. The nodes within VF owned area
- * have to be shifted, and balloon nodes need to be resized to properly mask out
- * areas not owned by the VF.
- *
- * Fixed &xe_ggtt nodes used for tracking allocations:
+ * have to be shifted, and the start offset for GGTT adjusted.
  *
- *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
- *
- * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
+ * Due to use of GPU profiles, we do not expect the old and new GGTT areas to
  * overlap; but our node shifting will fix addresses properly regardless.
  */
 
 /**
- * xe_tile_sriov_vf_fixup_ggtt_nodes_locked - Shift GGTT allocations to match assigned range.
- * @tile: the &xe_tile struct instance
- * @shift: the shift value
+ * xe_tile_sriov_vf_init - Init tile specific GGTT configuration.
+ * @tile: the &xe_tile
  *
- * Since Global GTT is not virtualized, each VF has an assigned range
- * within the global space. This range might have changed during migration,
- * which requires all memory addresses pointing to GGTT to be shifted.
+ * This function is for VF use only.
+ *
+ * Return: 0 on success, negative value on error.
  */
-void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift)
+int xe_tile_sriov_vf_init(struct xe_tile *tile)
 {
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
+	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
 
-	lockdep_assert_held(&ggtt->lock);
+	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
 
-	xe_tile_sriov_vf_deballoon_ggtt_locked(tile);
-	xe_ggtt_shift_nodes_locked(ggtt, shift);
-	xe_tile_sriov_vf_balloon_ggtt_locked(tile);
+	return drmm_mutex_init(&tile->xe->drm, &config->ggtt_move_mutex);
 }
 
 /**
@@ -312,6 +139,7 @@ void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size)
 	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+	lockdep_assert_held(&config->ggtt_move_mutex);
 
 	config->ggtt_size = ggtt_size;
 }
@@ -345,6 +173,7 @@ void xe_tile_sriov_vf_ggtt_base_store(struct xe_tile *tile, u64 ggtt_base)
 	struct xe_tile_sriov_vf_selfconfig *config = &tile->sriov.vf.self_config;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
+	lockdep_assert_held(&config->ggtt_move_mutex);
 
 	config->ggtt_base = ggtt_base;
 }
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
index 749f41504883c..1ca5bc87963f0 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf.h
@@ -10,9 +10,7 @@
 
 struct xe_tile;
 
-int xe_tile_sriov_vf_prepare_ggtt(struct xe_tile *tile);
-void xe_tile_sriov_vf_deballoon_ggtt_locked(struct xe_tile *tile);
-void xe_tile_sriov_vf_fixup_ggtt_nodes_locked(struct xe_tile *tile, s64 shift);
+int xe_tile_sriov_vf_init(struct xe_tile *tile);
 u64 xe_tile_sriov_vf_ggtt(struct xe_tile *tile);
 void xe_tile_sriov_vf_ggtt_store(struct xe_tile *tile, u64 ggtt_size);
 u64 xe_tile_sriov_vf_ggtt_base(struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
index 4807ca51614cf..2cbbc51c101d4 100644
--- a/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
@@ -7,11 +7,15 @@
 #define _XE_TILE_SRIOV_VF_TYPES_H_
 
 #include <linux/types.h>
+#include <linux/mutex.h>
 
 /**
  * struct xe_tile_sriov_vf_selfconfig - VF configuration data.
  */
 struct xe_tile_sriov_vf_selfconfig {
+	/** @ggtt_move_mutex: Prevents multiple movements from happening in parallel */
+	struct mutex ggtt_move_mutex;
+
 	/** @ggtt_base: assigned base offset of the GGTT region. */
 	u64 ggtt_base;
 	/** @ggtt_size: assigned size of the GGTT region. */
-- 
2.51.0

