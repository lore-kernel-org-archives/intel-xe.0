Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32728CD6E78
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 16:07:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2EA11A16D;
	Thu,  4 Jun 2026 16:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="Oeasq6Kr";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF8211A168
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 16:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1780589225;
 bh=WEJBW6OAguN4Eiap3PAe0CJ7nMRKL2toatoXLe4DzAA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Oeasq6Kr7fMXOySW29UbuDC4BRDINx3dNYZNsgwBHgZ9x2P9VyqbrqbteCGdgh0lv
 8XVjfHTCnPuMjq8lq31hEqujQvbCRISwD4l/eScd1qO0qxNbPyhIn3CpKkCUKlHhX4
 QK/J0Z3V5Tvx1aFvx2F1gklAowG+SU5C1cr5dcw8yLBESM4ZAmEKK2ZGKfTzondi6N
 n8/ecQnKY6rq3h4LazlZb8dVHL/75mNneRjO/kuChf1T8WlUL3Ws9+ZyJrKepWe1tv
 ODE2m+nFMsF3gn40dBnWOMY3UWkPConpVKJqfwv/+Z6npmYVflTNYDPdi7ZKnDdsUq
 Tk6iMimCz+B/A==
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Subject: [CI 17/24] drm/xe: Add device flag to enable PT mirroring across tiles
Date: Thu,  4 Jun 2026 18:06:46 +0200
Message-ID: <20260604160655.50036-18-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604160655.50036-1-dev@lankhorst.se>
References: <20260604160655.50036-1-dev@lankhorst.se>
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

From: Matthew Brost <matthew.brost@intel.com>

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
index 9c3b99053fb13..a641e1d3072fa 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -205,6 +205,8 @@ struct xe_device {
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
 		u8 has_64bit_timestamp:1;
+		/** @info.has_pt_mirror: Device has PT mirroring across tiles */
+		u8 has_pt_mirror:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2ec912d67ed76..7cccb46699bc2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -211,7 +211,8 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	struct xe_device *xe = tile_to_xe(tile);
 	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 	u8 id = tile->id;
-	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
+	u32 num_entries = NUM_PT_SLOTS, num_level =
+		xe_vm_pt_root(vm, id)->level;
 #define VRAM_IDENTITY_MAP_COUNT	2
 	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
 #undef VRAM_IDENTITY_MAP_COUNT
@@ -222,7 +223,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* PT30 & PT31 reserved for 2M identity map */
 	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
-	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
+	xe_pt_write(xe, &xe_vm_pt_root(vm, id)->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78fc2e4dcfc6d..74fcaf1831b2e 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -356,6 +356,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_gsc_nvm = 1,
+	.has_pt_mirror = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
@@ -775,6 +776,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_mert = desc->has_mert;
 	xe->info.has_page_reclaim_hw_assist = desc->has_page_reclaim_hw_assist;
 	xe->info.has_pre_prod_wa = desc->has_pre_prod_wa;
+	xe->info.has_pt_mirror = desc->has_pt_mirror;
 	xe->info.has_pxp = desc->has_pxp;
 	xe->info.has_soc_remapper_sysctrl = desc->has_soc_remapper_sysctrl;
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 5b85e2c24b7b2..f8d994724644a 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -51,8 +51,9 @@ struct xe_device_desc {
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
index faf893ac96eee..8d91ee473c42c 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -741,7 +741,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.wupd.entries = entries,
 		.clear_pt = clear_pt,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 	int ret;
 	bool is_purged = false;
 
@@ -922,6 +922,11 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
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
@@ -963,6 +968,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(xe_vma_vm(vma), tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
 				xe_vma_end(vma), &xe_walk.base);
 
@@ -1015,6 +1023,9 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(vm, tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
 				xe_svm_range_end(range), &xe_walk.base);
 
@@ -1850,7 +1861,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 		.wupd.entries = entries,
 		.prl = pt_update_op->prl,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 
 	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
 				&xe_walk.base);
@@ -2388,9 +2399,20 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
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
@@ -2682,6 +2704,12 @@ xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
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
@@ -2771,6 +2799,9 @@ void xe_pt_update_ops_fini(struct xe_device *xe, struct xe_vma_ops *vops)
 		if (!pt_update_ops->num_ops)
 			continue;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id))
+			continue;
+
 		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
 	}
 }
@@ -2795,6 +2826,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
 			&vops->pt_update_ops[id];
 		int i;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id))
+			continue;
+
 		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
 			struct xe_vm_pgtable_update_op *pt_op =
 				to_pt_op(pt_update_ops, i);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f9610a884b074..d1d10946a17c2 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -814,6 +814,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
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
@@ -830,7 +838,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
+	err = xe_vm_ops_add_rebind(&vops, vma,
+				   adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -916,7 +925,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
+	err = xe_vm_ops_add_range_rebind(&vops, vma, range,
+					 adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -1695,7 +1705,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 		for_each_tile(tile, xe, id) {
 			if (flags & XE_VM_FLAG_MIGRATION &&
-			    tile->id != XE_VM_FLAG_TILE_ID(flags))
+			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
+			    (vm->xe->info.has_pt_mirror || id))
 				continue;
 
 			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
@@ -2006,7 +2017,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
-	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0);
+	return vm->pt_ops->pde_encode_bo(xe_vm_pt_root(vm, tile->id)->bo, 0);
 }
 
 static struct xe_exec_queue *
@@ -4896,3 +4907,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
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
index c5b900f38dedc..89c4f95984a20 100644
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
2.53.0

