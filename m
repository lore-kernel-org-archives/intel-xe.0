Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6BBC79F85
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 23:58:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D2C10F7F0;
	Thu,  3 Sep 2026 23:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cja+BNxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D72010F70E
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 23:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788479931; x=1820015931;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DWnmU7RRRIESIjY35BUh2F26HVSdNI8j35T3EP0sthg=;
 b=Cja+BNxXLDUAxrkdHFu2gPAMQbHcsfYOaW/jqgGuogD9vwZjWzyfaI3R
 iKPlhdLZ2Vr+W3LOvFclW0wEYg1lO10MLAatXamr96WbXA2LvzhnDQTd0
 jr6Z0AmBm60r6NammUel4mWqmss+YlJwAVtZMyHTlCj7/01kK659JAssT
 KAbOPGHO+nkAaU+kW3PbyP76GzAn6KXABvKQzqeBztXr+DvHILD7do9eY
 HvynH6vjs78jlbZdSNnqFh+dgZ0MgKnaeQcdBfcqrYHce0YrY2yseSLkF
 RyxVrxfn6Aakh4aQV5pzlCJjR+ZlJMaBXHCaCC83X8gxnULm508GpDFAU g==;
X-CSE-ConnectionGUID: 6aGaHPv6S0+/6Ft5LGh2gw==
X-CSE-MsgGUID: Pj4FtGsXRTWgL2v7CEFFCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99637817"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="99637817"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
X-CSE-ConnectionGUID: HtfhVx8dS1Oj565UonO8bA==
X-CSE-MsgGUID: QmuPn5WGTuuXDiwiy0u12w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="274029059"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 16:58:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 17/25] drm/xe: Add device flag to enable PT mirroring
 across tiles
Date: Thu,  3 Sep 2026 16:58:34 -0700
Message-Id: <20260903235842.3401722-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903235842.3401722-1-matthew.brost@intel.com>
References: <20260903235842.3401722-1-matthew.brost@intel.com>
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

Some multi-tile devices may want to mirror page tables across tiles for
memory-bandwidth reasons, while others may not. Add a device flag that
allows enabling or disabling page-table mirroring across tiles.

Setting the flag to true (the existing behavior) on PVC, but both modes
have been tested and are working on PVC.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Link: https://patch.msgid.link/20260228013501.106680-18-matthew.brost@intel.com
Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c      |  5 ++--
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  3 ++-
 drivers/gpu/drm/xe/xe_pt.c           | 38 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 37 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h           |  3 +++
 7 files changed, 81 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bc60833c39a7..997ac82fd571 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -224,6 +224,8 @@ struct xe_device {
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
 		u8 has_64bit_timestamp:1;
+		/** @info.has_pt_mirror: Device has PT mirroring across tiles */
+		u8 has_pt_mirror:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f7e1a81434b2..471ae5741836 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -246,7 +246,8 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	struct xe_device *xe = tile_to_xe(tile);
 	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 	u8 id = tile->id;
-	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
+	u32 num_entries = NUM_PT_SLOTS, num_level =
+		xe_vm_pt_root(vm, id)->level;
 #define VRAM_IDENTITY_MAP_PT_COUNT	4
 	u32 num_setup = num_level + VRAM_IDENTITY_MAP_PT_COUNT;
 #undef VRAM_IDENTITY_MAP_PT_COUNT
@@ -258,7 +259,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	u64 l1_pt_ofs = xe_bo_size(bo) - 5 * XE_PAGE_SIZE;
 
 	entry = vm->pt_ops->pde_encode_bo(bo, l1_pt_ofs);
-	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
+	xe_pt_write(xe, &xe_vm_pt_root(vm, id)->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index ab4da1d9a9f1..d9030cb4f1ad 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -371,6 +371,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.has_display = false,
 	.has_drm_ras = true,
 	.has_gsc_nvm = 1,
+	.has_pt_mirror = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
@@ -808,6 +809,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_mert = desc->has_mert;
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
+	xe->info.has_pt_mirror = desc->has_pt_mirror;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index fed509ff601e..71068cdb3558 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -52,8 +52,9 @@ struct xe_device_desc {
 	u8 has_mbx_power_limits:1;
 	u8 has_mbx_thermal_info:1;
 	u8 has_mert:1;
-	u8 has_pre_prod_wa:1;
 	u8 has_page_reclaim_hw_assist:1;
+	u8 has_pre_prod_wa:1;
+	u8 has_pt_mirror:1;
 	u8 has_pxp:1;
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 821edeaecaed..deb33e85e6eb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -813,7 +813,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.wupd.entries = entries,
 		.clear_pt = clear_pt,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 	int ret;
 	bool is_purged = false;
 
@@ -1006,6 +1006,11 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	return 0;
 }
 
+static bool pt_mirroring_disabled_for_tile(struct xe_vm *vm, u8 tile_id)
+{
+	return xe_vm_pt_root(vm, tile_id) != vm->pt_root[tile_id];
+}
+
 static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
@@ -1047,6 +1052,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(xe_vma_vm(vma), tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
 				xe_vma_end(vma), &xe_walk.base);
 
@@ -1099,6 +1107,9 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(vm, tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
 				xe_svm_range_end(range), &xe_walk.base);
 
@@ -1989,7 +2000,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 		.wupd.entries = entries,
 		.prl = pt_update_op->prl,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 
 	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
 				&xe_walk.base);
@@ -2542,9 +2553,20 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
 	int id, err;
 
 	for_each_tile(tile, xe, id) {
+		struct xe_vm_pgtable_update_ops *pt_update_ops =
+			&vops->pt_update_ops[id];
+
 		if (!vops->pt_update_ops[id].num_ops)
 			continue;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id)) {
+			struct xe_page_reclaim_list *prl = &pt_update_ops->prl;
+
+			/* Transfer root PT update ops PRL to current */
+			*prl = vops->pt_update_ops[0].prl;
+			continue;
+		}
+
 		err = __xe_pt_update_ops_prepare(tile, vops);
 		if (err)
 			return err;
@@ -2836,6 +2858,12 @@ xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
 		struct xe_vm_pgtable_update_ops *pt_update_ops =
 			&vops->pt_update_ops[j];
 
+		if (pt_mirroring_disabled_for_tile(vm, j)) {
+			xe_tile_assert(tile, !get_current_op(pt_update_ops));
+			tile_mask |= BIT(tile->id);
+			continue;
+		}
+
 		for (i = 0; i < get_current_op(pt_update_ops); ++i) {
 			struct xe_vm_pgtable_update_op *pt_op =
 				to_pt_op(pt_update_ops, i);
@@ -2925,6 +2953,9 @@ void xe_pt_update_ops_fini(struct xe_device *xe, struct xe_vma_ops *vops)
 		if (!pt_update_ops->num_ops)
 			continue;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id))
+			continue;
+
 		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
 	}
 }
@@ -2949,6 +2980,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
 			&vops->pt_update_ops[id];
 		int i;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id))
+			continue;
+
 		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
 			struct xe_vm_pgtable_update_op *pt_op =
 				to_pt_op(pt_update_ops, i);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fbfc42afef8b..a6dc010e5e0d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -845,6 +845,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	return err;
 }
 
+static u8 adjust_rebind_tile_mask(struct xe_vm *vm, u8 tile_mask)
+{
+	if (vm->xe->info.has_pt_mirror)
+		return tile_mask;
+
+	return (0x1 << vm->xe->info.max_gt_per_tile) - 1;
+}
+
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_mask)
 {
 	struct dma_fence *fence = NULL;
@@ -861,7 +869,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
+	err = xe_vm_ops_add_rebind(&vops, vma,
+				   adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -948,7 +957,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
+	err = xe_vm_ops_add_range_rebind(&vops, vma, range,
+					 adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -1738,7 +1748,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 		for_each_tile(tile, xe, id) {
 			if (flags & XE_VM_FLAG_MIGRATION &&
-			    tile->id != XE_VM_FLAG_TILE_ID(flags))
+			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
+			    (vm->xe->info.has_pt_mirror || id))
 				continue;
 
 			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
@@ -2047,7 +2058,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
-	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0);
+	return vm->pt_ops->pde_encode_bo(xe_vm_pt_root(vm, tile->id)->bo, 0);
 }
 
 static struct xe_exec_queue *
@@ -5072,3 +5083,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	}
 	up_write(&vm->exec_queues.lock);
 }
+
+/**
+ * xe_vm_pt_root() - Retrieve VM page-table root
+ * @vm: The VM.
+ * @tile_id: Tile ID
+ *
+ * Retrieve VM page-table root for a tile ID, used to abstract if PT mirroring is
+ * enabled across tiles.
+ *
+ * Return: VM page-table root for a tile ID
+ */
+struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id)
+{
+	if (vm->xe->info.has_pt_mirror)
+		return vm->pt_root[tile_id];
+
+	return vm->pt_root[0];
+}
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index c5b900f38ded..89c4f95984a2 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -436,4 +436,7 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
 void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
+
+struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id);
+
 #endif
-- 
2.34.1

