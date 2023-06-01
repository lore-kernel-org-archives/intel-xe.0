Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908B3C7EE23
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 21:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF7610E5E1;
	Thu,  1 Jun 2023 21:52:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E53010E5E1
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 21:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685656367; x=1717192367;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uBwc1WmtVRCI7Bi7pLMVDGh+3hvqixu5/fhLzGTGQhY=;
 b=d2L7fP8FvpVaZV65x5u7rh4UI4gNyVbJED68aciKzOnDMElMhdPWDCaf
 tve3tQxz305uQkhrSVYc18nDD9U7pnwTVHrkTEwrQVouFmPcxyy43kaIk
 eSdJoeqSpMkXTPzuqeiMWiJTqO9fhKQvSssoOgrax2pUTB5GcnDxAc6rE
 V9MWeN3/jmgwXZF8kbn4QMV72/ilpsQ8rRI3aEPx4xgUMq/TnJlwqs4WJ
 dQCI/vU5KzHI+mlCKPf0ElPuLJnkdxcfgyAf4uVvkwu7HqCI9xLFnpTru
 qHS0eJhTgbKb7Z0NiS/+4Vo3GiUFMO+vrxaMBHTwxOGFokdtlcyfsLDSi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="335313598"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="335313598"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707563571"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="707563571"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 14:52:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 14:52:21 -0700
Message-Id: <20230601215244.678611-9-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601215244.678611-1-matthew.d.roper@intel.com>
References: <20230601215244.678611-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CIv2 08/31] drm/xe: Move GGTT from GT to tile
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The GGTT exists at the tile level.  When a tile contains multiple GTs,
they share the same GGTT.

v2:
 - Include some changes that were mis-squashed into the VRAM patch.
   (Gustavo)

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Acked-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/Makefile          |  1 +
 drivers/gpu/drm/xe/xe_bo.c           |  6 ++--
 drivers/gpu/drm/xe/xe_bo_evict.c     |  8 +++--
 drivers/gpu/drm/xe/xe_device.c       | 18 +++++++---
 drivers/gpu/drm/xe/xe_device_types.h |  8 +++++
 drivers/gpu/drm/xe/xe_ggtt.c         | 42 +++++++++++-----------
 drivers/gpu/drm/xe/xe_ggtt.h         |  6 ++--
 drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +-
 drivers/gpu/drm/xe/xe_gt.c           | 10 +-----
 drivers/gpu/drm/xe/xe_gt_debugfs.c   |  2 +-
 drivers/gpu/drm/xe/xe_gt_types.h     |  3 --
 drivers/gpu/drm/xe/xe_tile.c         | 52 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_tile.h         | 14 ++++++++
 13 files changed, 125 insertions(+), 47 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_tile.c
 create mode 100644 drivers/gpu/drm/xe/xe_tile.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index da1e447c08c7..f34d4bdd510b 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -97,6 +97,7 @@ xe-y += xe_bb.o \
 	xe_sched_job.o \
 	xe_step.o \
 	xe_sync.o \
+	xe_tile.o \
 	xe_trace.o \
 	xe_ttm_sys_mgr.o \
 	xe_ttm_stolen_mgr.o \
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 94f3a8ce4b69..09a9c121a84d 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -964,7 +964,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	WARN_ON(!list_empty(&bo->vmas));
 
 	if (bo->ggtt_node.size)
-		xe_ggtt_remove_bo(bo->gt->mem.ggtt, bo);
+		xe_ggtt_remove_bo(gt_to_tile(bo->gt)->mem.ggtt, bo);
 
 	if (bo->vm && xe_bo_is_user(bo))
 		xe_vm_put(bo->vm);
@@ -1241,10 +1241,10 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		XE_BUG_ON(!gt);
 
 		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
-			err = xe_ggtt_insert_bo_at(gt->mem.ggtt, bo,
+			err = xe_ggtt_insert_bo_at(gt_to_tile(gt)->mem.ggtt, bo,
 						   start + bo->size, U64_MAX);
 		} else {
-			err = xe_ggtt_insert_bo(gt->mem.ggtt, bo);
+			err = xe_ggtt_insert_bo(gt_to_tile(gt)->mem.ggtt, bo);
 		}
 		if (err)
 			goto err_unlock_put_bo;
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 6642c5f52009..a72963c54bf3 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -149,9 +149,11 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		}
 
 		if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
-			mutex_lock(&bo->gt->mem.ggtt->lock);
-			xe_ggtt_map_bo(bo->gt->mem.ggtt, bo);
-			mutex_unlock(&bo->gt->mem.ggtt->lock);
+			struct xe_tile *tile = gt_to_tile(bo->gt);
+
+			mutex_lock(&tile->mem.ggtt->lock);
+			xe_ggtt_map_bo(tile->mem.ggtt, bo);
+			mutex_unlock(&tile->mem.ggtt->lock);
 		}
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index dd4a4a6e0b94..e86583fbbdce 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -28,6 +28,7 @@
 #include "xe_pcode.h"
 #include "xe_pm.h"
 #include "xe_query.h"
+#include "xe_tile.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
@@ -244,6 +245,7 @@ static void xe_device_sanitize(struct drm_device *drm, void *arg)
 
 int xe_device_probe(struct xe_device *xe)
 {
+	struct xe_tile *tile;
 	struct xe_gt *gt;
 	int err;
 	u8 id;
@@ -253,8 +255,12 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_alloc(xe, gt);
+	for_each_tile(tile, xe, id) {
+		err = xe_tile_alloc(tile);
+		if (err)
+			return err;
+
+		err = xe_gt_alloc(xe, &tile->primary_gt);
 		if (err)
 			return err;
 	}
@@ -289,8 +295,12 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_ttm_sys_mgr_init(xe);
 
-	for_each_gt(gt, xe, id) {
-		err = xe_gt_init_noalloc(gt);
+	for_each_tile(tile, xe, id) {
+		err = xe_tile_init_noalloc(tile);
+		if (err)
+			goto err_irq_shutdown;
+
+		err = xe_gt_init_noalloc(&tile->primary_gt);
 		if (err)
 			goto err_irq_shutdown;
 	}
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 619f40a7e275..d7b809253eb9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -23,6 +23,8 @@
 #include "intel_display_core.h"
 #endif
 
+struct xe_ggtt;
+
 #define XE_BO_INVALID_OFFSET	LONG_MAX
 
 #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
@@ -97,6 +99,12 @@ struct xe_tile {
 		/** @regs: pointer to tile's MMIO space (starting with registers) */
 		void *regs;
 	} mmio;
+
+	/** @mem: memory management info for tile */
+	struct {
+		/** @ggtt: Global graphics translation table */
+		struct xe_ggtt *ggtt;
+	} mem;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 3333b2545740..eae20b50497e 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -90,24 +90,19 @@ static void ggtt_fini_noalloc(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(ggtt->scratch);
 }
 
-int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt)
+int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
-	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	unsigned int gsm_size;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
-
-	ggtt->gt = gt;
-
 	gsm_size = probe_gsm_size(pdev);
 	if (gsm_size == 0) {
 		drm_err(&xe->drm, "Hardware reported no preallocated GSM\n");
 		return -ENOMEM;
 	}
 
-	ggtt->gsm = tile->mmio.regs + SZ_8M;
+	ggtt->gsm = ggtt->tile->mmio.regs + SZ_8M;
 	ggtt->size = (gsm_size / 8) * (u64) XE_PAGE_SIZE;
 
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
@@ -143,19 +138,20 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
-	xe_device_mem_access_get(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
-	xe_ggtt_invalidate(ggtt->gt);
+	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
-int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
+int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_device *xe = tile_to_xe(ggtt->tile);
+	struct xe_gt *gt = &ggtt->tile->primary_gt;
 	unsigned int flags;
 	int err;
 
@@ -195,8 +191,14 @@ int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt)
 #define PVC_GUC_TLB_INV_DESC1			XE_REG(0xcf80)
 #define   PVC_GUC_TLB_INV_DESC1_INVALIDATE	REG_BIT(6)
 
-void xe_ggtt_invalidate(struct xe_gt *gt)
+void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 {
+	/*
+	 * TODO: Loop over each GT in tile once media GT support is
+	 * re-added
+	 */
+	struct xe_gt *gt = &ggtt->tile->primary_gt;
+
 	/* TODO: vfunc for GuC vs. non-GuC */
 
 	if (gt->uc.guc.submission_state.enabled) {
@@ -269,7 +271,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
-	xe_ggtt_invalidate(ggtt->gt);
+	xe_ggtt_invalidate(ggtt);
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
@@ -291,14 +293,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (err)
 		return err;
 
-	xe_device_mem_access_get(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
 					  alignment, 0, start, end, 0);
 	if (!err)
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 
 	return err;
 }
@@ -316,17 +318,17 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 {
-	xe_device_mem_access_get(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 
 	xe_ggtt_clear(ggtt, node->start, node->size);
 	drm_mm_remove_node(node);
 	node->size = 0;
 
-	xe_ggtt_invalidate(ggtt->gt);
+	xe_ggtt_invalidate(ggtt);
 
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(gt_to_xe(ggtt->gt));
+	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 333947100504..205a6d058bbd 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -12,9 +12,9 @@ struct drm_printer;
 
 u64 xe_ggtt_pte_encode(struct xe_bo *bo, u64 bo_offset);
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte);
-void xe_ggtt_invalidate(struct xe_gt *gt);
-int xe_ggtt_init_noalloc(struct xe_gt *gt, struct xe_ggtt *ggtt);
-int xe_ggtt_init(struct xe_gt *gt, struct xe_ggtt *ggtt);
+void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
+int xe_ggtt_init_noalloc(struct xe_ggtt *ggtt);
+int xe_ggtt_init(struct xe_ggtt *ggtt);
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix);
 
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index ea70aaef4b31..d34b3e733945 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -12,7 +12,7 @@ struct xe_bo;
 struct xe_gt;
 
 struct xe_ggtt {
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 
 	u64 size;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 18eda5b1377f..0f07f810bb1f 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -67,11 +67,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
 	if (!xe_gt_is_media_type(gt)) {
-		gt->mem.ggtt = drmm_kzalloc(drm, sizeof(*gt->mem.ggtt),
-					    GFP_KERNEL);
-		if (!gt->mem.ggtt)
-			return -ENOMEM;
-
 		gt->mem.vram_mgr = drmm_kzalloc(drm, sizeof(*gt->mem.vram_mgr),
 						GFP_KERNEL);
 		if (!gt->mem.vram_mgr)
@@ -80,7 +75,6 @@ int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 	} else {
 		struct xe_gt *full_gt = xe_find_full_gt(gt);
 
-		gt->mem.ggtt = full_gt->mem.ggtt;
 		gt->mem.vram_mgr = full_gt->mem.vram_mgr;
 	}
 
@@ -354,8 +348,6 @@ int xe_gt_init_noalloc(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	err = xe_ggtt_init_noalloc(gt, gt->mem.ggtt);
-
 err_force_wake:
 	err2 = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err2);
@@ -376,7 +368,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 	xe_pat_init(gt);
 
 	if (!xe_gt_is_media_type(gt)) {
-		err = xe_ggtt_init(gt, gt->mem.ggtt);
+		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
 		if (err)
 			goto err_force_wake;
 	}
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index 339ecd5fad9b..1114254bc519 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -98,7 +98,7 @@ static int ggtt(struct seq_file *m, void *data)
 	struct xe_gt *gt = node_to_gt(m->private);
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	return xe_ggtt_dump(gt->mem.ggtt, &p);
+	return xe_ggtt_dump(gt_to_tile(gt)->mem.ggtt, &p);
 }
 
 static int register_save_restore(struct seq_file *m, void *data)
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index 81e6ab0c77e0..c06a0b27d6fc 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -14,7 +14,6 @@
 #include "xe_uc_types.h"
 
 struct xe_engine_ops;
-struct xe_ggtt;
 struct xe_migrate;
 struct xe_ring_ops;
 struct xe_ttm_gtt_mgr;
@@ -176,8 +175,6 @@ struct xe_gt {
 		} vram;
 		/** @vram_mgr: VRAM TTM manager */
 		struct xe_ttm_vram_mgr *vram_mgr;
-		/** @ggtt: Global graphics translation table */
-		struct xe_ggtt *ggtt;
 	} mem;
 
 	/** @reset: state for GT resets */
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
new file mode 100644
index 000000000000..7ef594f301ca
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include "xe_device.h"
+#include "xe_ggtt.h"
+#include "xe_tile.h"
+#include "xe_ttm_vram_mgr.h"
+
+/**
+ * xe_tile_alloc - Perform per-tile memory allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates various per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc(struct xe_tile *tile)
+{
+	struct drm_device *drm = &tile_to_xe(tile)->drm;
+
+	tile->mem.ggtt = drmm_kzalloc(drm, sizeof(*tile->mem.ggtt),
+				      GFP_KERNEL);
+	if (!tile->mem.ggtt)
+		return -ENOMEM;
+	tile->mem.ggtt->tile = tile;
+
+	return 0;
+}
+
+/**
+ * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
+ * @tile: The tile to initialize.
+ *
+ * This function prepares the tile to allow memory allocations to VRAM, but is
+ * not allowed to allocate memory itself. This state is useful for display
+ * readout, because the inherited display framebuffer will otherwise be
+ * overwritten as it is usually put at the start of VRAM.
+ *
+ * Note that since this is tile initialization, it should not perform any
+ * GT-specific operations, and thus does not need to hold GT forcewake.
+ *
+ * Returns: 0 on success, negative error code on error.
+ */
+int xe_tile_init_noalloc(struct xe_tile *tile)
+{
+	return xe_ggtt_init_noalloc(tile->mem.ggtt);
+}
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
new file mode 100644
index 000000000000..77529ea136a6
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_TILE_H_
+#define _XE_TILE_H_
+
+struct xe_tile;
+
+int xe_tile_alloc(struct xe_tile *tile);
+int xe_tile_init_noalloc(struct xe_tile *tile);
+
+#endif
-- 
2.40.1

