Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D239DC28B23
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 22:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862DF10E112;
	Thu,  6 Mar 2025 22:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUD3ufju";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1CC10E112
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 22:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741299692; x=1772835692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4VGkuAwmT8JN0zelM3wX8968k0tOj7HVjemvJscupw=;
 b=cUD3ufjuFhkwZeG31uUKkfVl0Sc37KaCHMF3wBbiIml4bQIi6MQsF84q
 h/yunVH4FLeT1sGImMdvaBmtYGfHbjN+ra/Fngzrd5DX8U8FMyrCUtmdS
 XNWzOl268zUAXGtMWHBipro75GJSBpJuypgKSh22CxBO3bKjlllkxkKci
 HK0JU/BvASGJHO7ILT8SG8yBTQx2AxxVcEZaCJJMRPgonYOMPj+X9xnBI
 3cfq0I1G34Ft7dob/IrpHeejrQmEVwK1XgBQ1tx4w4ckUgX3dGvsPgK2L
 U85QvkA5E9KWmvCF2yDiTZ3UzQpJ0gaskGAmYwboso0LX3xDVSt8OZX2E A==;
X-CSE-ConnectionGUID: q4n19RFzTEatAgqqDSC/iQ==
X-CSE-MsgGUID: G2O2AQGMS0C81xvx60CGtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53736306"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="53736306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 14:21:32 -0800
X-CSE-ConnectionGUID: EzGI6PbVTPWh4bejlQX0uQ==
X-CSE-MsgGUID: u7OLNafMS8mB/8i9FTgFyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="119662871"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2025 14:21:30 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
Date: Thu,  6 Mar 2025 23:21:25 +0100
Message-Id: <20250306222126.3382322-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250306222126.3382322-1-tomasz.lis@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
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

Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c              | 163 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h              |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  26 ++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++
 6 files changed, 216 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5fcb2b4c2c13..6865d1cdd676 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -489,6 +489,169 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
 	xe_ggtt_node_fini(node);
 }
 
+static u64 drm_mm_node_end(struct drm_mm_node *node)
+{
+	return node->start + node->size;
+}
+
+static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
+				struct drm_mm_node *balloon_fin, s64 shift)
+{
+	struct drm_mm_node *node, *tmpn;
+	LIST_HEAD(temp_list_head);
+	int err;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	/*
+	 * Move nodes, from range previously assigned to this VF, into temp list.
+	 *
+	 * The balloon_beg and balloon_fin nodes are there to eliminate unavailable
+	 * ranges from use: first reserves the GGTT area below the range for current VF,
+	 * and second reserves area above.
+	 *
+	 * Below is a GGTT layout of example VF, with a certain address range assigned to
+	 * said VF, and inaccessible areas above and below:
+	 *
+	 *  0                                                                        4GiB
+	 *  |<--------------------------- Total GGTT size ----------------------------->|
+	 *      WOPCM                                                         GUC_TOP
+	 *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
+	 *
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
+	 *  +---+---------------------------------+----------+----------------------+---+
+	 *
+	 * Hardware enforced access rules before migration:
+	 *
+	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
+	 *
+	 * drm_mm nodes used for tracking allocations:
+	 *
+	 *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
+	 *
+	 * After the migration, GGTT area assigned to the VF might have shifted, either
+	 * to lower or to higher address. But we expect the total size and extra areas to
+	 * be identical, as migration can only happen between matching platforms.
+	 * Below is an example of GGTT layout of the VF after migration. Content of the
+	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
+	 *
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
+	 *  +---+----------------------+----------+---------------------------------+---+
+	 *
+	 * Hardware enforced access rules after migration:
+	 *
+	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
+	 *
+	 * So the VF has a new slice of GGTT assigned, and during migration process, the
+	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
+	 * are still tracking allocations using the old addresses. The nodes within VF
+	 * owned area have to be shifted, and balloon nodes need to be resized to
+	 * properly mask out areas not owned by the VF.
+	 *
+	 * Fixed drm_mm nodes used for tracking allocations:
+	 *
+	 *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
+	 *
+	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
+	 * overlap; but our node shifting will fix addresses properly regardless.
+	 *
+	 */
+	drm_mm_for_each_node_in_range_safe(node, tmpn, &ggtt->mm,
+					   drm_mm_node_end(balloon_beg),
+					   balloon_fin->start) {
+		drm_mm_remove_node(node);
+		list_add(&node->node_list, &temp_list_head);
+	}
+
+	/* shift and re-add ballooning nodes */
+	if (drm_mm_node_allocated(balloon_beg))
+		drm_mm_remove_node(balloon_beg);
+	if (drm_mm_node_allocated(balloon_fin))
+		drm_mm_remove_node(balloon_fin);
+	balloon_beg->size += shift;
+	balloon_fin->start += shift;
+	balloon_fin->size -= shift;
+	if (balloon_beg->size != 0) {
+		err = drm_mm_reserve_node(&ggtt->mm, balloon_beg);
+		xe_tile_assert(ggtt->tile, !err);
+	}
+	if (balloon_fin->size != 0) {
+		err = drm_mm_reserve_node(&ggtt->mm, balloon_fin);
+		xe_tile_assert(ggtt->tile, !err);
+	}
+
+	/*
+	 * Now the GGTT VM contains only nodes outside of area assigned to this VF.
+	 * We can re-add all VF nodes with shifted offsets.
+	 */
+	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
+		list_del(&node->node_list);
+		node->start += shift;
+		err = drm_mm_reserve_node(&ggtt->mm, node);
+		xe_tile_assert(ggtt->tile, !err);
+	}
+}
+
+/**
+ * xe_ggtt_node_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
+ * @ggtt: the &xe_ggtt struct instance
+ * @balloon_beg: ggtt balloon node which preceds the area provisioned for current VF
+ * @balloon_fin: ggtt balloon node which follows the area provisioned for current VF
+ * @shift: change to the location of area provisioned for current VF
+ */
+void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
+			      struct xe_ggtt_node **balloon_fin, s64 shift)
+{
+	struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
+	struct xe_ggtt_node *node;
+
+	if (!*balloon_beg)
+	{
+		node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(node))
+			goto out;
+		node->base.color = 0;
+		node->base.flags = 0;
+		node->base.start = xe_wopcm_size(ggtt->tile->xe);
+		node->base.size = 0;
+		*balloon_beg = node;
+	}
+	balloon_mm_beg = &(*balloon_beg)->base;
+
+	if (!*balloon_fin)
+	{
+		node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(node))
+			goto out;
+		node->base.color = 0;
+		node->base.flags = 0;
+		node->base.start = GUC_GGTT_TOP;
+		node->base.size = 0;
+		*balloon_fin = node;
+	}
+	balloon_mm_end = &(*balloon_fin)->base;
+
+	xe_tile_assert(ggtt->tile, (*balloon_beg)->ggtt);
+	xe_tile_assert(ggtt->tile, (*balloon_fin)->ggtt);
+
+	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
+out:
+	if (*balloon_beg && !xe_ggtt_node_allocated(*balloon_beg))
+	{
+		node = *balloon_beg;
+		*balloon_beg = NULL;
+		xe_ggtt_node_fini(node);
+	}
+	if (*balloon_fin && !xe_ggtt_node_allocated(*balloon_fin))
+	{
+		node = *balloon_fin;
+		*balloon_fin = NULL;
+		xe_ggtt_node_fini(node);
+	}
+}
+
 /**
  * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
  * @node: the &xe_ggtt_node to be inserted
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 27e7d67de004..d9e133a155e6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -18,6 +18,8 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
 				u64 start, u64 size);
 void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
+void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
+			      struct xe_ggtt_node **balloon_fin, s64 shift);
 
 int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
 int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a439261bf4d7..dbd7010f0117 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
 	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
 				start, start + size - 1, size / SZ_1K);
 
+	config->ggtt_shift = start - (s64)config->ggtt_base;
 	config->ggtt_base = start;
 	config->ggtt_size = size;
 
@@ -938,6 +939,31 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
 	return err;
 }
 
+/**
+ * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
+ * @gt: the &xe_gt struct instance
+ * Return: 0 on success, ENODATA if fixups are unnecessary
+ *
+ * Since Global GTT is not virtualized, each VF has an assigned range
+ * within the global space. This range might have changed during migration,
+ * which requires all memory addresses pointing to GGTT to be shifted.
+ */
+int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
+{
+	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
+	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_ggtt *ggtt = tile->mem.ggtt;
+	s64 ggtt_shift;
+
+	mutex_lock(&ggtt->lock);
+	ggtt_shift = config->ggtt_shift;
+	if (ggtt_shift)
+		xe_ggtt_node_shift_nodes(ggtt, &tile->sriov.vf.ggtt_balloon[0],
+					 &tile->sriov.vf.ggtt_balloon[1], ggtt_shift);
+	mutex_unlock(&ggtt->lock);
+	return ggtt_shift ? 0 : ENODATA;
+}
+
 static int vf_runtime_reg_cmp(const void *a, const void *b)
 {
 	const struct vf_runtime_reg *ra = a;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index ba6c5d74e326..95a6c9c1dca0 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -18,6 +18,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
 int xe_gt_sriov_vf_connect(struct xe_gt *gt);
 int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
 int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
+int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
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
index c1275e64aa9c..4ee8fc70a744 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -7,6 +7,7 @@
 
 #include "xe_assert.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_gt_sriov_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_pm.h"
@@ -170,6 +171,26 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
 	work_pending(&xe->sriov.vf.migration.worker);
 }
 
+static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+	int err;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_gt *gt = tile->primary_gt;
+		int ret;
+
+		/* media doesn't have its own ggtt */
+		if (xe_gt_is_media_type(gt))
+			continue;
+		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
+		if (ret != ENODATA)
+			err = ret;
+	}
+	return err;
+}
+
 /*
  * Notify all GuCs about resource fixups apply finished.
  */
@@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
 	if (unlikely(err))
 		goto fail;
 
+	err = vf_post_migration_fixup_ggtt_nodes(xe);
 	/* FIXME: add the recovery steps */
 	vf_post_migration_notify_resfix_done(xe);
 	xe_pm_runtime_put(xe);
-- 
2.25.1

