Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232F7C3DA42
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 05:21:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A6310E919;
	Wed, 17 Jul 2024 05:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MC+5juqB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AC410E8DF
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 05:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721193710; x=1752729710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EH3zsDTS8kQDb02C+bTb4pas5fcswpwxvNhMdZp4iuk=;
 b=MC+5juqByZPvjL+YPbHZVzx+UI/DUAYe9IuyRa7h0llWu6S/WV+t4TAT
 JtoifDT3FzmNpMA0tR+iEHAox7/7raGo0vPpyS7iqKyZ/m732m3H1TsnY
 pbVP32iHbFlJ1kGSDsXBcUa9gdO8aoPZnlmZSH8e+Dg4mDtbUlVwdrfLy
 bxapNyBJRPLj91FaxhMrZbKVPy0idFcJ2/j0w72JvMdGRORGEE2GBPE1e
 RVSb5damBdJ0lJZTVAub0egfnrIZKQb26N5XGxRUf88+9TGbB5hUAsG0d
 tzT3OK5F+1G5cG1j1S5aLyy8tbSRtb4ETsWPInZQU+OqALvLGe7n1TcoV w==;
X-CSE-ConnectionGUID: G713TgPaSjqHdfDBSY8efw==
X-CSE-MsgGUID: Y9ZmrF+oRSOn/HuEnxG6ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29281162"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="29281162"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:49 -0700
X-CSE-ConnectionGUID: 5KXK892FRxScobnOjOz+tQ==
X-CSE-MsgGUID: 9QRAUc7KTh6+u6LYst7HSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208";a="55124855"
Received: from dut1107bmgfrd.igk.intel.com ([10.211.177.88])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 22:21:47 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, matthew.brost@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v6 4/8] drm/xe/xe2: Introduce identity map for compressed pat
 for vram
Date: Wed, 17 Jul 2024 05:21:29 +0000
Message-Id: <8168fd897d321f46ede7e932375119d2cb971911.1721193361.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721193361.git.akshata.jahagirdar@intel.com>
References: <cover.1721193361.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Xe2+ has unified compression (exactly one compression mode/format),
where compression is now controlled via PAT at PTE level.
This simplifies KMD operations, as it can now decompress freely
without concern for the buffer's original compression format—unlike DG2,
which had multiple compression formats and thus required copying the
raw CCS state during VRAM eviction. In addition mixed VRAM and system
memory buffers were not supported with compression enabled.

On Xe2 dGPU compression is still only supported with VRAM, however we
can now support compression with VRAM and system memory buffers,
with GPU access being seamless underneath. So long as when doing
VRAM -> system memory the KMD uses compressed -> uncompressed,
to decompress it. This also allows CPU access to such buffers,
assuming that userspace first decompress the corresponding
pages being accessed.
If the pages are already in system memory then KMD would have already
decompressed them. When restoring such buffers with sysmem -> VRAM
the KMD can't easily know which pages were originally compressed,
so we always use uncompressed -> uncompressed here.
With this it also means we can drop all the raw CCS handling on such
platforms (including needing to allocate extra CCS storage).

In order to support this we now need to have two different identity
mappings for compressed and uncompressed VRAM.
In this patch, we set up the additional identity map for the VRAM with
compressed pat_index. We then select the appropriate mapping during
migration/clear. During eviction (vram->sysmem), we use the mapping
from compressed -> uncompressed. During restore (sysmem->vram), we need
the mapping from uncompressed -> uncompressed.
Therefore, we need to have two different mappings for compressed and
uncompressed vram. We set up an additional identity map for the vram
with compressed pat_index.
We then select the appropriate mapping during migration/clear.

v2: Formatting nits, Updated code to match recent changes in
    xe_migrate_prepare_vm(). (Matt)

v3: Move identity map loop to a helper function. (Matt Brost)

v4: Split helper function in different patch, and
	add asserts and nits. (Matt Brost)

v5: Convert the 2 bool arguments of pte_update_size to flags
	argument (Matt Brost)

v6: Formatting nits (Matt Brost)

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  7 ++-
 drivers/gpu/drm/xe/xe_migrate.c       | 81 ++++++++++++++++++++-------
 2 files changed, 65 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 353b908845f7..47c105263b49 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -393,17 +393,20 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
 		u32 flush_flags = 0;
 		u32 update_idx;
 		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
+		u32 pte_flags;
 
 		src_L0 = xe_migrate_res_sizes(m, &src_it);
 		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, src_is_vram, src, &src_it, &src_L0,
+		pte_flags = src_is_vram ? (BIT(0) | BIT(1)) : 0;
+		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
 
-		batch_size += pte_update_size(m, dst_is_vram, dst_is_vram, dst, &dst_it, &src_L0,
+		pte_flags = dst_is_vram ? (BIT(0) | BIT(1)) : 0;
+		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
 					      &dst_L0_ofs, &dst_L0_pt, 0,
 					      avail_pts, avail_pts);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 49ad5d8443cf..746656dfc970 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -73,6 +73,7 @@ struct xe_migrate {
 #define NUM_PT_SLOTS 32
 #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M
 #define MAX_NUM_PTE 512
+#define IDENTITY_OFFSET 256ULL
 
 /*
  * Although MI_STORE_DATA_IMM's "length" field is 10-bits, 0x3FE is the largest
@@ -120,14 +121,19 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 	return (slot + 1ULL) << xe_pt_shift(level + 1);
 }
 
-static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
+static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 {
 	/*
 	 * Remove the DPA to get a correct offset into identity table for the
 	 * migrate offset
 	 */
+	u64 identity_offset = IDENTITY_OFFSET;
+
+	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
+		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+
 	addr -= xe->mem.vram.dpa_base;
-	return addr + (256ULL << xe_pt_shift(2));
+	return addr + (identity_offset << xe_pt_shift(2));
 }
 
 static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
@@ -182,10 +188,13 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level,
-	    num_setup = num_level + 1;
+	    num_setup;
+#define VRAM_IDENTITY_MAP_COUNT	2
+num_setup = num_level + VRAM_IDENTITY_MAP_COUNT;
+#undef VRAM_IDENTITY_MAP_COUNT
 	u32 map_ofs, level, i;
 	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
-	u64 entry, pt30_ofs;
+	u64 entry, pt29_ofs;
 
 	/* Can't bump NUM_PT_SLOTS too high */
 	BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE);
@@ -205,9 +214,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-	/* PT31 reserved for 2M identity map */
-	pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
-	entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
+	/* PT30 & PT31 reserved for 2M identity map */
+	pt29_ofs = bo->size - 3 * XE_PAGE_SIZE;
+	entry = vm->pt_ops->pde_encode_bo(bo, pt29_ofs, pat_index);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
@@ -259,12 +268,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	} else {
 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
 
-		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
+		m->batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
 
 		if (xe->info.has_usm) {
 			batch = tile->primary_gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
-			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr);
+			m->usm_batch_base_ofs = xe_migrate_vram_ofs(xe, batch_addr, false);
 		}
 	}
 
@@ -298,18 +307,36 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 	/* Identity map the entire vram at 256GiB offset */
 	if (IS_DGFX(xe)) {
-		u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
+		u64 pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
 
-		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index, pt31_ofs);
-		xe_assert(xe, (xe->mem.vram.actual_physical_size <= SZ_256G));
+		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
+					    pat_index, pt30_ofs);
+		xe_assert(xe, xe->mem.vram.actual_physical_size <=
+					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
+
+		/*
+		 * Identity map the entire vram for compressed pat_index for xe2+
+		 * if flat ccs is enabled.
+		 */
+		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
+			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
+			u64 vram_offset = IDENTITY_OFFSET +
+				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
+
+			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
+						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
+			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
+						    comp_pat_index, pt31_ofs);
+		}
 	}
 
 	/*
 	 * Example layout created above, with root level = 3:
 	 * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
 	 * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
-	 * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
-	 * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 = PDE 2] [PT31 = 2M vram identity map]
+	 * [PT9...PT26]: Userspace PT's for VM_BIND, 4 KiB PTE's
+	 * [PT27 = PDE 0] [PT28 = PDE 1] [PT29 = PDE 2] [PT30 & PT31 = 2M vram identity map]
 	 *
 	 * This makes the lowest part of the VM point to the pagetables.
 	 * Hence the lowest 2M in the vm should point to itself, with a few writes
@@ -487,20 +514,26 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 	return cur->size >= size;
 }
 
+#define PTE_UPDATE_FLAG_IS_VRAM		BIT(0)
+#define PTE_UPDATE_FLAG_IS_COMP_PTE	BIT(1)
+
 static u32 pte_update_size(struct xe_migrate *m,
-			   bool is_vram,
+			   u32 flags,
 			   struct ttm_resource *res,
 			   struct xe_res_cursor *cur,
 			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
 			   u32 cmd_size, u32 pt_ofs, u32 avail_pts)
 {
 	u32 cmds = 0;
+	bool is_vram = PTE_UPDATE_FLAG_IS_VRAM & flags;
+	bool is_comp_pte = PTE_UPDATE_FLAG_IS_COMP_PTE & flags;
 
 	*L0_pt = pt_ofs;
 	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
 		/* Offset into identity map. */
 		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
-					      cur->start + vram_region_gpu_offset(res));
+					      cur->start + vram_region_gpu_offset(res),
+					      is_comp_pte);
 		cmds += cmd_size;
 	} else {
 		/* Clip L0 to available size */
@@ -779,6 +812,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		u32 update_idx;
 		u64 ccs_ofs, ccs_size;
 		u32 ccs_pt;
+		u32 pte_flags;
 
 		bool usm = xe->info.has_usm;
 		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
@@ -791,17 +825,19 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
+		pte_flags = src_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		batch_size += pte_update_size(m, pte_flags, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
 
-		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
+		pte_flags = dst_is_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
+		batch_size += pte_update_size(m, pte_flags, dst, &dst_it, &src_L0,
 					      &dst_L0_ofs, &dst_L0_pt, 0,
 					      avail_pts, avail_pts);
 
 		if (copy_system_ccs) {
 			ccs_size = xe_device_ccs_bytes(xe, src_L0);
-			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
+			batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size,
 						      &ccs_ofs, &ccs_pt, 0,
 						      2 * avail_pts,
 						      avail_pts);
@@ -1034,6 +1070,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		struct xe_sched_job *job;
 		struct xe_bb *bb;
 		u32 batch_size, update_idx;
+		u32 pte_flags;
 
 		bool usm = xe->info.has_usm;
 		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
@@ -1041,8 +1078,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		clear_L0 = xe_migrate_res_sizes(m, &src_it);
 
 		/* Calculate final sizes and batch size.. */
+		pte_flags = clear_vram ? PTE_UPDATE_FLAG_IS_VRAM : 0;
 		batch_size = 2 +
-			pte_update_size(m, clear_vram, src, &src_it,
+			pte_update_size(m, pte_flags, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
 					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
@@ -1159,7 +1197,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	if (!ppgtt_ofs)
 		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
 						xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE));
+							   XE_PAGE_SIZE), false);
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
@@ -1493,3 +1531,4 @@ void xe_migrate_wait(struct xe_migrate *m)
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
+
-- 
2.34.1

