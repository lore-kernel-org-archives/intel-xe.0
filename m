Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429E21048927
	for <intel-xe@archiver.kernel.org>; Sat, 28 Feb 2026 01:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0BB10EC52;
	Sat, 28 Feb 2026 01:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lylnH2jS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2079C10E1E1
 for <intel-xe@lists.freedesktop.org>; Sat, 28 Feb 2026 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772242512; x=1803778512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MSBySthhL1UQPyo4nLk/dacpLfAlQN3EHA70tLcjeUk=;
 b=lylnH2jSudvlVn6vRXZ9CwE2GdF4mDALrrdPS6In/BLQIArreP/5iDPK
 lUtOz9LL7gBjrfFWTuOq131uhhhjgxl5P96bNCdpY2pdUvkL6qMpabIl/
 A3eqXpdb5xNL3tGs2X/qqrZS37354jqAI7rqLrylDknEc62wekO1TBqdR
 TljxMmJHSrv0kAWoOdPiknxYlEMOjtLvNrE3V9ZVmOwIWCTp3aY4AIelI
 NCfwPgzJqtTqAd8Ij8TCPL/Ao6ATtFMDwCtBOlixVMHfrQj+N/DndeY/h
 1BScNdc/MJSe++JIShLZubZFEHxFrDePtmTMid58zs72iV8C8gzPOb8XG g==;
X-CSE-ConnectionGUID: Naut2ymJRUeHwcNfAK5d4Q==
X-CSE-MsgGUID: zlDhHBkHQ/mfFzQimatNSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83966356"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="83966356"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:08 -0800
X-CSE-ConnectionGUID: JA6xoEAXRS2nFeocN9q4jw==
X-CSE-MsgGUID: g1Vy6v7LQuOh8/4xhnXP0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; d="scan'208";a="213854886"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 17:35:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: stuart.summers@intel.com, arvind.yadav@intel.com,
 himal.prasad.ghimiray@intel.com, thomas.hellstrom@linux.intel.com,
 francois.dugast@intel.com
Subject: [PATCH v3 17/25] drm/xe: Add device flag to enable PT mirroring
 across tiles
Date: Fri, 27 Feb 2026 17:34:53 -0800
Message-Id: <20260228013501.106680-18-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260228013501.106680-1-matthew.brost@intel.com>
References: <20260228013501.106680-1-matthew.brost@intel.com>
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
 drivers/gpu/drm/xe/xe_device_types.h |  2 ++
 drivers/gpu/drm/xe/xe_migrate.c      |  5 ++--
 drivers/gpu/drm/xe/xe_pci.c          |  2 ++
 drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
 drivers/gpu/drm/xe/xe_pt.c           | 38 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 37 ++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_vm.h           |  3 +++
 7 files changed, 80 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 776e9e190320..b3737dfcc45c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -208,6 +208,8 @@ struct xe_device {
 		u8 has_usm:1;
 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
 		u8 has_64bit_timestamp:1;
+		/** @info.has_pt_mirror: Device has PT mirroring across tiles */
+		u8 has_pt_mirror:1;
 		/** @info.is_dgfx: is discrete device */
 		u8 is_dgfx:1;
 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b5d4fc4d4c62..c9ee6325ec9d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -183,7 +183,8 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	struct xe_device *xe = tile_to_xe(tile);
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 	u8 id = tile->id;
-	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
+	u32 num_entries = NUM_PT_SLOTS, num_level =
+		xe_vm_pt_root(vm, id)->level;
 #define VRAM_IDENTITY_MAP_COUNT	2
 	u32 num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
 #undef VRAM_IDENTITY_MAP_COUNT
@@ -210,7 +211,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* PT30 & PT31 reserved for 2M identity map */
 	pt29_ofs = xe_bo_size(bo) - 3 * XE_PAGE_SIZE;
 	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs);
-	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
+	xe_pt_write(xe, &xe_vm_pt_root(vm, id)->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 3ac99472d6dd..b8c8953833a5 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -352,6 +352,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.dma_mask_size = 52,
 	.has_display = false,
 	.has_gsc_nvm = 1,
+	.has_pt_mirror = 1,
 	.has_heci_gscfi = 1,
 	.max_gt_per_tile = 1,
 	.max_remote_tiles = 1,
@@ -761,6 +762,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
 		desc->has_sriov;
+	xe->info.has_pt_mirror = desc->has_pt_mirror;
 	xe->info.skip_guc_pc = desc->skip_guc_pc;
 	xe->info.skip_mtcfg = desc->skip_mtcfg;
 	xe->info.skip_pcode = desc->skip_pcode;
diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
index 47e8a1552c2b..14b688fbb4c1 100644
--- a/drivers/gpu/drm/xe/xe_pci_types.h
+++ b/drivers/gpu/drm/xe/xe_pci_types.h
@@ -57,6 +57,7 @@ struct xe_device_desc {
 	u8 has_soc_remapper_sysctrl:1;
 	u8 has_soc_remapper_telem:1;
 	u8 has_sriov:1;
+	u8 has_pt_mirror:1;
 	u8 needs_scratch:1;
 	u8 skip_guc_pc:1;
 	u8 skip_mtcfg:1;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d91d80c92957..ef34fbfc14f0 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -734,7 +734,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		.wupd.entries = entries,
 		.clear_pt = clear_pt,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 	int ret;
 
 	if (range) {
@@ -895,6 +895,11 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
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
@@ -936,6 +941,9 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(xe_vma_vm(vma), tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_vma_start(vma),
 				xe_vma_end(vma), &xe_walk.base);
 
@@ -988,6 +996,9 @@ bool xe_pt_zap_ptes_range(struct xe_tile *tile, struct xe_vm *vm,
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
 
+	if (pt_mirroring_disabled_for_tile(vm, tile->id))
+		return true;
+
 	(void)xe_pt_walk_shared(&pt->base, pt->level, xe_svm_range_start(range),
 				xe_svm_range_end(range), &xe_walk.base);
 
@@ -1803,7 +1814,7 @@ static unsigned int xe_pt_stage_unbind(struct xe_tile *tile,
 		.wupd.entries = entries,
 		.prl = pt_update_op->prl,
 	};
-	struct xe_pt *pt = vm->pt_root[tile->id];
+	struct xe_pt *pt = xe_vm_pt_root(vm, tile->id);
 
 	(void)xe_pt_walk_shared(&pt->base, pt->level, start, end,
 				&xe_walk.base);
@@ -2341,9 +2352,20 @@ int xe_pt_update_ops_prepare(struct xe_device *xe, struct xe_vma_ops *vops)
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
@@ -2635,6 +2657,12 @@ xe_pt_update_ops_run(struct xe_device *xe, struct xe_vma_ops *vops)
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
@@ -2724,6 +2752,9 @@ void xe_pt_update_ops_fini(struct xe_device *xe, struct xe_vma_ops *vops)
 		if (!pt_update_ops->num_ops)
 			continue;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id))
+			continue;
+
 		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
 	}
 }
@@ -2748,6 +2779,9 @@ void xe_pt_update_ops_abort(struct xe_device *xe, struct xe_vma_ops *vops)
 			&vops->pt_update_ops[id];
 		int i;
 
+		if (pt_mirroring_disabled_for_tile(vops->vm, id))
+			continue;
+
 		for (i = pt_update_ops->num_ops - 1; i >= 0; --i) {
 			struct xe_vm_pgtable_update_op *pt_op =
 				to_pt_op(pt_update_ops, i);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b3928e05b70a..d4629e953b01 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -738,6 +738,14 @@ int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
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
@@ -754,7 +762,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma, u8 tile_ma
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_rebind(&vops, vma, tile_mask);
+	err = xe_vm_ops_add_rebind(&vops, vma,
+				   adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -840,7 +849,8 @@ struct dma_fence *xe_vm_range_rebind(struct xe_vm *vm,
 	vops.flags |= XE_VMA_OPS_FLAG_SKIP_TLB_WAIT |
 		XE_VMA_OPS_FLAG_WAIT_VM_BOOKKEEP;
 
-	err = xe_vm_ops_add_range_rebind(&vops, vma, range, tile_mask);
+	err = xe_vm_ops_add_range_rebind(&vops, vma, range,
+					 adjust_rebind_tile_mask(vm, tile_mask));
 	if (err)
 		return ERR_PTR(err);
 
@@ -1578,7 +1588,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 		for_each_tile(tile, xe, id) {
 			if (flags & XE_VM_FLAG_MIGRATION &&
-			    tile->id != XE_VM_FLAG_TILE_ID(flags))
+			    tile->id != XE_VM_FLAG_TILE_ID(flags) &&
+			    (vm->xe->info.has_pt_mirror || id))
 				continue;
 
 			vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level,
@@ -1887,7 +1898,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
-	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0);
+	return vm->pt_ops->pde_encode_bo(xe_vm_pt_root(vm, tile->id)->bo, 0);
 }
 
 static struct xe_exec_queue *
@@ -4583,3 +4594,21 @@ void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
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
index f849e369432b..5a22f74ff332 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -425,4 +425,7 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
 void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
+
+struct xe_pt *xe_vm_pt_root(struct xe_vm *vm, u8 tile_id);
+
 #endif
-- 
2.34.1

