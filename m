Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1387FC3ABD2
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 11:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB71610E39C;
	Mon, 12 May 2025 11:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LfPhBKa1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF60310E395
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 11:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747050023; x=1778586023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w0LwD5AMbMFFTzWFPdm5CvfI1TFSCQLcnNEPTDHexN0=;
 b=LfPhBKa1dxRxuG/euxa0o3NzX0OngkUSSt8Rtz4NZ14GS2GXDJVedjM+
 1jxuaRHb0UGdGtCwYeNKl4ZtDZ8aFeQy7Fjark0jyk/v+Ts51FddnDn/P
 ytYmnSiRTybk/SiTZCfCiDFerT2Y3XCeBwA21y3pjASGiTzNK4Pt94zOv
 Pn6oFWAmvaILNA9UEcblnZepAMBRmNAivZAaqMQ76kpOqa9AVazjdHfmT
 HQX5YCfKpc2XRgK9IZp4Pw+By3t02SYcme6wZTJBhqzSw3C4+DS/39rDT
 IpYWIwgUxIWYowWu1zxQfUgJfp/sAe/7GEhlrMlv7IQgnKEz0oiWn6Ekr g==;
X-CSE-ConnectionGUID: ogSnUqfwQyiSw+kvdW0kIw==
X-CSE-MsgGUID: V6Z6NDgHS2KFbmaWXTNnrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66250687"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="66250687"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 04:40:23 -0700
X-CSE-ConnectionGUID: YgiQGsj3QKKx0hOnP1GJXw==
X-CSE-MsgGUID: E6FAVo53R06u4gjmJzvMrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="142241191"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 12 May 2025 04:40:21 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH v14 2/4] drm/xe/vf: Shifting GGTT area post migration
Date: Mon, 12 May 2025 13:40:16 +0200
Message-Id: <20250512114018.361843-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250512114018.361843-1-tomasz.lis@intel.com>
References: <20250512114018.361843-1-tomasz.lis@intel.com>
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

We have only one GGTT for all IOV functions, with each VF having assigned
a range of addresses for its use. After migration, a VF can receive a
different range of addresses than it had initially.

This implements shifting GGTT addresses within drm_mm nodes, so that
VMAs stay valid after migration. This will make the driver use new
addresses when accessing GGTT from the moment the shifting ends.

By taking the ggtt->lock for the period of VMA fixups, this change
also adds constraint on that mutex. Any locks used during the recovery
cannot ever wait for hardware response - because after migration,
the hardware will not do anything until fixups are finished.

v2: Moved some functs to xe_ggtt.c; moved shift computation to just
  after querying; improved documentation; switched some warns to asserts;
  skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
v3: Updated kerneldocs, removed unused funct, properly allocate
  balloning nodes if non existent
v4: Re-used ballooning functions from VF init, used bool in place of
  standard error codes
v5: Renamed one function
v6: Subject tag change, several kerneldocs updated, some functions
  renamed, some moved, added several asserts, shuffled declarations
  of variables, revealed more detail in high level functions
v7: Fixed typos, added `_locked` suffix to some functs, improved
  readability of asserts, removed unneeded conditional
v8: Moved one function, removed implementation detail from kerneldoc,
  added asserts
v9: Code shuffling without much change, and one param rename
v10: Minor error path change, added printing the shift via debugfs

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c              |  50 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h              |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 104 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  21 +++++
 6 files changed, 180 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5a37233f2420..af8e53014b87 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -484,6 +484,56 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
 	drm_mm_remove_node(&node->base);
 }
 
+static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
+{
+	struct xe_tile *tile = ggtt->tile;
+	struct xe_device *xe = tile_to_xe(tile);
+	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
+
+	xe_tile_assert(tile, start >= wopcm);
+	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
+}
+
+/**
+ * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
+ * @ggtt: the &xe_ggtt struct instance
+ * @shift: change to the location of area provisioned for current VF
+ *
+ * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
+ * to represent allocations in range formerly assigned to current VF, before the range changed.
+ * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
+ *
+ * The function has no ability of failing - because it shifts existing nodes, without
+ * any additional processing. If the nodes were successfully existing at the old address,
+ * they will do the same at the new one. A fail inside this function would indicate that
+ * the list of nodes was either already damaged, or that the shift brings the address range
+ * outside of valid bounds. Both cases justify an assert rather than error code.
+ */
+void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
+{
+	struct xe_tile *tile __maybe_unused = ggtt->tile;
+	struct drm_mm_node *node, *tmpn;
+	LIST_HEAD(temp_list_head);
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
+		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
+			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
+
+	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
+		drm_mm_remove_node(node);
+		list_add(&node->node_list, &temp_list_head);
+	}
+
+	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
+		list_del(&node->node_list);
+		node->start += shift;
+		drm_mm_reserve_node(&ggtt->mm, node);
+		xe_tile_assert(tile, drm_mm_node_allocated(node));
+	}
+}
+
 /**
  * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @node: the &xe_ggtt_node to be inserted
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index d468af96b465..4337a279ff3b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
 				       u64 start, u64 size);
 void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
+void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index f82ddff79b3b..4ff7ae1a5f16 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
+	config->ggtt_shift = start - (s64)config->ggtt_base;
 	config->ggtt_base = start;
 	config->ggtt_size = size;
 
@@ -560,6 +561,24 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.lmem_size;
 }
 
+/**
+ * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
+ * @gt: the &xe_gt struct instance
+ *
+ * This function is for VF use only.
+ *
+ * Return: The shift value; could be negative
+ */
+s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+
+	return config->ggtt_shift;
+}
+
 static int vf_init_ggtt_balloons(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt_to_tile(gt);
@@ -817,6 +836,89 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * DOC: GGTT nodes shifting during VF post-migration recovery
+ *
+ * The first fixup applied to the VF KMD structures as part of post-migration
+ * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
+ * from range previously assigned to this VF, into newly provisioned area.
+ * The changes include balloons, which are resized accordingly.
+ *
+ * The balloon nodes are there to eliminate unavailable ranges from use: one
+ * reserves the GGTT area below the range for current VF, and another one
+ * reserves area above.
+ *
+ * Below is a GGTT layout of example VF, with a certain address range assigned to
+ * said VF, and inaccessible areas above and below:
+ *
+ *  0                                                                        4GiB
+ *  |<--------------------------- Total GGTT size ----------------------------->|
+ *      WOPCM                                                         GUC_TOP
+ *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
+ *
+ *  +---+---------------------------------+----------+----------------------+---+
+ *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
+ *  +---+---------------------------------+----------+----------------------+---+
+ *
+ * Hardware enforced access rules before migration:
+ *
+ *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
+ *
+ * GGTT nodes used for tracking allocations:
+ *
+ *      |<---------- balloon ------------>|<- nodes->|<----- balloon ------>|
+ *
+ * After the migration, GGTT area assigned to the VF might have shifted, either
+ * to lower or to higher address. But we expect the total size and extra areas to
+ * be identical, as migration can only happen between matching platforms.
+ * Below is an example of GGTT layout of the VF after migration. Content of the
+ * GGTT for VF has been moved to a new area, and we receive its address from GuC:
+ *
+ *  +---+----------------------+----------+---------------------------------+---+
+ *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
+ *  +---+----------------------+----------+---------------------------------+---+
+ *
+ * Hardware enforced access rules after migration:
+ *
+ *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
+ *
+ * So the VF has a new slice of GGTT assigned, and during migration process, the
+ * memory content was copied to that new area. But the &xe_ggtt nodes are still
+ * tracking allocations using the old addresses. The nodes within VF owned area
+ * have to be shifted, and balloon nodes need to be resized to properly mask out
+ * areas not owned by the VF.
+ *
+ * Fixed &xe_ggtt nodes used for tracking allocations:
+ *
+ *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
+ *
+ * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
+ * overlap; but our node shifting will fix addresses properly regardless.
+ */
+
+/**
+ * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
+ * @gt: the &xe_gt struct instance
+ * @shift: the shift value
+ *
+ * Since Global GTT is not virtualized, each VF has an assigned range
+ * within the global space. This range might have changed during migration,
+ * which requires all memory addresses pointing to GGTT to be shifted.
+ */
+void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift)
+{
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+
+	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
+
+	mutex_lock(&ggtt->lock);
+	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
+	xe_ggtt_shift_nodes_locked(ggtt, shift);
+	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
+	mutex_unlock(&ggtt->lock);
+}
+
 /**
  * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
  *   or just mark that a GuC is ready for it.
@@ -1103,6 +1205,8 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p)
 	string_get_size(config->ggtt_size, 1, STRING_UNITS_2, buf, sizeof(buf));
 	drm_printf(p, "GGTT size:\t%llu (%s)\n", config->ggtt_size, buf);
 
+	drm_printf(p, "GGTT shift on last restore:\t%lld\n", config->ggtt_shift);
+
 	if (IS_DGFX(xe) && !xe_gt_is_media_type(gt)) {
 		string_get_size(config->lmem_size, 1, STRING_UNITS_2, buf, sizeof(buf));
 		drm_printf(p, "LMEM size:\t%llu (%s)\n", config->lmem_size, buf);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index d717deb8af91..9db41afddd5a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
 int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
 void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
+s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
+void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
 int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
 void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index a57f13b5afcd..5ccbdf8d08b6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
 	u64 ggtt_base;
 	/** @ggtt_size: assigned size of the GGTT region. */
 	u64 ggtt_size;
+	/** @ggtt_shift: difference in ggtt_base on last migration */
+	s64 ggtt_shift;
 	/** @lmem_size: assigned size of the LMEM. */
 	u64 lmem_size;
 	/** @num_ctxs: assigned number of GuC submission context IDs. */
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index c1275e64aa9c..d48ea70d0f62 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,6 +7,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_pm.h"
@@ -170,6 +171,25 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
 	work_pending(&xe->sriov.vf.migration.worker);
 }
 
+static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
+{
+	bool need_fixups = false;
+	struct xe_tile *tile;
+	unsigned int id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_gt *gt = tile->primary_gt;
+		s64 shift;
+
+		shift = xe_gt_sriov_vf_ggtt_shift(gt);
+		if (shift) {
+			need_fixups = true;
+			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
+		}
+	}
+	return need_fixups;
+}
+
 /*
  * Notify all GuCs about resource fixups apply finished.
  */
@@ -201,6 +221,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	if (unlikely(err))
 		goto fail;
 
+	vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
-- 
2.25.1

