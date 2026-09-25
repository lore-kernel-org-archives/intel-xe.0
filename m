Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F0C98330
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 04:53:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E8010F861;
	Fri, 25 Sep 2026 04:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvwGi7/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF22110F827
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 04:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790312012; x=1821848012;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dwAgZgCnDSe9QsdO+ZxdDfkXaAgYj3gvA5PmXNv28do=;
 b=dvwGi7/vXJVEO+Ku0EocYbHEnd20fYzhYwFwXag70OP/rKVLsDRuAI/b
 C9CMzp26kXtTtQSG+kChiQAJtrKK7u1WCUfMA9nZ2hLmF/wAoQhVGY4SY
 eC5/vTelndxDxACNjo2uWQs9zDGDqEWpaZyzP9Pybd2Jd3eliDLPXhxlg
 3Jxj3fSEUQnnBhGYCRVdZW9KpBozb1xOdMsiO+J/j+gM9bAGOIUxiMxEo
 f1jFfYh3qNIulUtVunGc7Qeh4pLEkQRBqXdn92V31zy8/Zs4QkLIjl7RC
 QcXwXahElDYdKPlt/3IRdwin+FixIoAQfYn+ZCIFmdMsJ38mtdvr32TUW g==;
X-CSE-ConnectionGUID: pwC0sCV0QTOmOs/TFzw8jQ==
X-CSE-MsgGUID: CcgEHtuYSIGGFOiHLwpHxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90156231"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90156231"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:28 -0700
X-CSE-ConnectionGUID: s9Km4YOJQ+iSYY0q0rF/2Q==
X-CSE-MsgGUID: VxFWrhVpRRS1OTNtT7ucSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="312155538"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 21:53:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 17/24] drm/xe: Add device flag to enable PT mirroring
 across tiles
Date: Thu, 24 Sep 2026 21:53:13 -0700
Message-Id: <20260925045320.1325860-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925045320.1325860-1-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
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

---
v7:
 - Rework pt_mirroring_disabled_for_tile (Himal)
---
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c      |  5 ++--
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  3 ++-
 drivers/gpu/drm/xe/xe_pt.c           | 36 +++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 37 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h           |  3 +++
 7 files changed, 79 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index aff2e5c8b656..cd9ed8ff2940 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -229,6 +229,8 @@ struct xe_device {
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
index d64e873d9e71..28f37e034e02 100644
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
@@ -807,6 +808,7 @@ static int xe_info_init_early(struct xe_device *xe,
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
index fbefcfc52dca..dcef29b56d63 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -804,7 +804,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.wupd.entries = entries,
 		.clear_pt = clear_pt,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 	int ret;
 	bool is_purged = false;
 
@@ -1005,6 +1005,11 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	return 0;
 }
 
+static bool pt_mirroring_disabled_for_tile(struct xe_vm *vm, u8 tile_id)
+{
+	return !vm->xe->info.has_pt_mirror && tile_id;
+}
+
 static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 	.pt_entry = xe_pt_zap_ptes_entry,
 };
@@ -1046,6 +1051,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(xe_vma_vm(vma), tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
 				xe_vma_end(vma), &xe_walk.base);
 
@@ -1098,6 +1106,9 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(vm, tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
 				xe_svm_range_end(range), &xe_walk.base);
 
@@ -1987,7 +1998,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 		.wupd.entries = entries,
 		.prl = pt_update_op->prl,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 
 	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
 				&xe_walk.base);
@@ -2539,9 +2550,21 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
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
+			xe_page_reclaim_entries_get(prl->entries);
+			continue;
+		}
+
 		err = __xe_pt_update_ops_prepare(tile, vops);
 		if (err)
 			return err;
@@ -2833,6 +2856,12 @@ xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
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
@@ -2946,6 +2975,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
 			&vops->pt_update_ops[id];
 		int i;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id))
+			continue;
+
 		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
 			struct xe_vm_pgtable_update_op *pt_op =
 				to_pt_op(pt_update_ops, i);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0f542f47b9a8..f450e1c6f750 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -846,6 +846,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	return err;
 }
 
+static u8 adjust_rebind_tile_mask(struct xe_vm *vm, u8 tile_mask)
+{
+	if (vm->xe->info.has_pt_mirror)
+		return tile_mask;
+
+	return (0x1 << vm->xe->info.tile_count) - 1;
+}
+
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_mask)
 {
 	struct dma_fence *fence = NULL;
@@ -862,7 +870,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
+	err = xe_vm_ops_add_rebind(&vops, vma,
+				   adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -949,7 +958,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
+	err = xe_vm_ops_add_range_rebind(&vops, vma, range,
+					 adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -1739,7 +1749,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 		for_each_tile(tile, xe, id) {
 			if (flags & XE_VM_FLAG_MIGRATION &&
-			    tile->id != XE_VM_FLAG_TILE_ID(flags))
+			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
+			    (vm->xe->info.has_pt_mirror || id))
 				continue;
 
 			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
@@ -2049,7 +2060,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
-	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0);
+	return vm->pt_ops->pde_encode_bo(xe_vm_pt_root(vm, tile->id)->bo, 0);
 }
 
 static struct xe_exec_queue *
@@ -5074,3 +5085,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
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

