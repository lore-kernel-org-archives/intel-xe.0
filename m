Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110F6C3DA59
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jul 2024 01:01:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FDF10E415;
	Tue, 16 Jul 2024 01:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ys/+31Ky";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654F110E2AB
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jul 2024 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721091687; x=1752627687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ja98l4CJlcVAfqmFfxcMhC1qVbKgatWLTiPQO1lCKqs=;
 b=Ys/+31KyC4hSsr9oKDRI/tTuUA+qY0bniTSUdCmCDnuqJqrW37EmNUYV
 vhqfNPhWzmt8Hma1xM0d93ln7L2BcxJRSDcw7H0gwqzOWGfvqQ4yTBctp
 4/G5XQr/ejz0gNr764HcYjRLfMSJQ+JoirKoB8349enmUZ/LzcGgh+g/P
 2bZeUuWmmjkVCMssi0NzqY8/hfD4dCejtCuJL5UIEz+5Xd7ZctwZOXXrc
 3v14JE2YTEd1N2pCm9OVizTcVLDMIIYtJ1R8lThWPGkn9UXqqKnSUvQ+y
 3tgpLvioloCyTZH2xstNoY86BDCqkuq9QPnWnsgxD8RudN7MUPOAKLpiX Q==;
X-CSE-ConnectionGUID: rqig4FxpSEyH2ned2XPsPg==
X-CSE-MsgGUID: dL0k8Dd0SZK20itH7vB91Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18618352"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18618352"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:27 -0700
X-CSE-ConnectionGUID: Z0+rI8GqSS6omi8D9Z7FbQ==
X-CSE-MsgGUID: ViSuSTCtQDaZgwOrKwSQ9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49874264"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 18:01:25 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v4 3/7] drm/xe/xe2: Introduce identity map for compressed pat
 for vram
Date: Tue, 16 Jul 2024 01:01:07 +0000
Message-Id: <b98a7f3d85f585484a4b6ea7a7fba501b9e42e02.1721091282.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721091282.git.akshata.jahagirdar@intel.com>
References: <cover.1721091282.git.akshata.jahagirdar@intel.com>
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

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 123 +++++++++++++++++++-------------
 1 file changed, 74 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 85eec95c9bc2..53d3c044d30e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -120,14 +120,67 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 	return (slot + 1ULL) << xe_pt_shift(level + 1);
 }
 
-static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr)
+static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 {
 	/*
 	 * Remove the DPA to get a correct offset into identity table for the
 	 * migrate offset
 	 */
+	u64 identity_offset = 256ULL;
+
+	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
+		identity_offset = 256ULL +
+				  DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+
 	addr -= xe->mem.vram.dpa_base;
-	return addr + (256ULL << xe_pt_shift(2));
+	return addr + (identity_offset << xe_pt_shift(2));
+}
+
+static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm, struct xe_bo *bo,
+					u64 map_ofs, u64 vram_offset, u16 pat_index)
+{
+	u64 pos, ofs, flags;
+	u64 entry;
+	/* XXX: Unclear if this should be usable_size? */
+	u64 vram_limit =  xe->mem.vram.actual_physical_size +
+		xe->mem.vram.dpa_base;
+	u32 level = 2;
+
+	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
+	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
+					    true, 0);
+
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+
+	/*
+	 * Use 1GB pages when possible, last chunk always use 2M
+	 * pages as mixing reserved memory (stolen, WOCPM) with a single
+	 * mapping is not allowed on certain platforms.
+	 */
+	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	     pos += SZ_1G, ofs += 8) {
+		if (pos + SZ_1G >= vram_limit) {
+			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
+
+			entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
+							  pat_index);
+			xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
+
+			flags = vm->pt_ops->pte_encode_addr(xe, 0,
+							    pat_index,
+							    level - 1,
+							    true, 0);
+
+			for (ofs = pt31_ofs; pos < vram_limit;
+			     pos += SZ_2M, ofs += 8)
+				xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+			break;	/* Ensure pos == vram_limit assert correct */
+		}
+
+		xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+	}
+
+	xe_assert(xe, pos == vram_limit);
 }
 
 static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
@@ -214,12 +267,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
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
 
@@ -251,49 +304,21 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		  | XE_PTE_NULL);
 	m->cleared_mem_ofs = (255ULL << xe_pt_shift(level));
 
-	/* Identity map the entire vram at 256GiB offset */
+	/* Identity map the entire vram for uncompressed pat_index at 256GiB offset */
 	if (IS_DGFX(xe)) {
-		u64 pos, ofs, flags;
-		/* XXX: Unclear if this should be usable_size? */
-		u64 vram_limit =  xe->mem.vram.actual_physical_size +
-			xe->mem.vram.dpa_base;
-
-		level = 2;
-		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
-						    true, 0);
-
-		xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+		xe_migrate_program_identity(xe, vm, bo, map_ofs, 256, pat_index);
 
 		/*
-		 * Use 1GB pages when possible, last chunk always use 2M
-		 * pages as mixing reserved memory (stolen, WOCPM) with a single
-		 * mapping is not allowed on certain platforms.
+		 * Identity map the entire vram for compressed pat_index for xe2+
+		 * if flat ccs is enabled.
 		 */
-		for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
-		     pos += SZ_1G, ofs += 8) {
-			if (pos + SZ_1G >= vram_limit) {
-				u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
-
-				entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
-								  pat_index);
-				xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
-
-				flags = vm->pt_ops->pte_encode_addr(xe, 0,
-								    pat_index,
-								    level - 1,
-								    true, 0);
-
-				for (ofs = pt31_ofs; pos < vram_limit;
-				     pos += SZ_2M, ofs += 8)
-					xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
-				break;	/* Ensure pos == vram_limit assert correct */
-			}
+		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
+			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
+			u64 vram_offset = 256 +
+				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
 
-			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
+			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset, comp_pat_index);
 		}
-
-		xe_assert(xe, pos == vram_limit);
 	}
 
 	/*
@@ -480,7 +505,7 @@ static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
 }
 
 static u32 pte_update_size(struct xe_migrate *m,
-			   bool is_vram,
+			   bool is_vram, bool is_comp_pte,
 			   struct ttm_resource *res,
 			   struct xe_res_cursor *cur,
 			   u64 *L0, u64 *L0_ofs, u32 *L0_pt,
@@ -492,7 +517,8 @@ static u32 pte_update_size(struct xe_migrate *m,
 	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
 		/* Offset into identity map. */
 		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
-					      cur->start + vram_region_gpu_offset(res));
+					      cur->start + vram_region_gpu_offset(res),
+					      is_comp_pte);
 		cmds += cmd_size;
 	} else {
 		/* Clip L0 to available size */
@@ -783,17 +809,17 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, src, &src_it, &src_L0,
+		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
 					      &src_L0_ofs, &src_L0_pt, 0, 0,
 					      avail_pts);
 
-		batch_size += pte_update_size(m, dst_is_vram, dst, &dst_it, &src_L0,
+		batch_size += pte_update_size(m, dst_is_vram, false, dst, &dst_it, &src_L0,
 					      &dst_L0_ofs, &dst_L0_pt, 0,
 					      avail_pts, avail_pts);
 
 		if (copy_system_ccs) {
 			ccs_size = xe_device_ccs_bytes(xe, src_L0);
-			batch_size += pte_update_size(m, false, NULL, &ccs_it, &ccs_size,
+			batch_size += pte_update_size(m, false, false, NULL, &ccs_it, &ccs_size,
 						      &ccs_ofs, &ccs_pt, 0,
 						      2 * avail_pts,
 						      avail_pts);
@@ -1034,14 +1060,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		/* Calculate final sizes and batch size.. */
 		batch_size = 2 +
-			pte_update_size(m, clear_vram, src, &src_it,
+			pte_update_size(m, clear_vram, false, src, &src_it,
 					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
 					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
 					avail_pts);
 
 		if (xe_migrate_needs_ccs_emit(xe))
 			batch_size += EMIT_COPY_CCS_DW;
-
 		/* Clear commands */
 
 		if (WARN_ON_ONCE(!clear_L0))
@@ -1151,7 +1176,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	if (!ppgtt_ofs)
 		ppgtt_ofs = xe_migrate_vram_ofs(tile_to_xe(tile),
 						xe_bo_addr(update->pt_bo, 0,
-							   XE_PAGE_SIZE));
+							   XE_PAGE_SIZE), false);
 
 	do {
 		u64 addr = ppgtt_ofs + ofs * 8;
-- 
2.34.1

