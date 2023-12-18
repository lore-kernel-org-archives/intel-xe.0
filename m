Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA5CC46CD3
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14F710E23D;
	Mon, 18 Dec 2023 18:19:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAC810E23D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 18:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702923569; x=1734459569;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LEC7ZO4YWdWqpZmotIx4FuaXzNetkatVETNJ+iKoGeE=;
 b=Fy+buuMXOUiINkyINt2NBCYdWz+z2fAVCq/6TEjD1lyBVFqpYMP///ld
 zLTI1FSgv3G+nMmEFhq0obKgrPEHji8RiluoM0CXKzo6DcOlnwVoya1xn
 yIbtsup+3Nz/clGBdKYdOlwDz512YlplB6UTKEVog/qViIcAeECm3XPut
 luWouFG7FttXvfi2FJQHZD3VJpGAk/DRNOh1rD3/BZv5t9Rge3ivmlpLI
 jZiIQ7hLBjBgajQdy5M7TIU2JZ+zrImSqzuwWnEiEpkiM1AJPxkF6DHBN
 AOJEpN4mN+hl6SccoV1oYeFqGqoh6NmwN7eC8wyFiVV4NDqx0L57Y8Ys3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="385937830"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; d="scan'208";a="385937830"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 06:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="841502515"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; d="scan'208";a="841502515"
Received: from janlundk-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.171])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 06:29:42 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4] drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
Date: Mon, 18 Dec 2023 15:29:33 +0100
Message-ID: <20231218142933.8571-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Since the migrate code is using the identity map for addressing VRAM,
copy chunks may become as small as 64K if the VRAM resource is fragmented.

However, a chunk size smaller that 1MiB may lead to the *next* chunk's
offset into the CCS metadata backup memory may not be page-aligned, and
the XY_CTRL_SURF_COPY_BLT command can't handle that, and even if it could,
the current code doesn't handle the offset calculaton correctly.

To fix this, make sure we align the size of VRAM copy chunks to 1MiB. If
the remaining data to copy is smaller than that, that's not a problem,
so use the remaining size. If the VRAM copy cunk becomes fragmented due
to the size alignment restriction, don't use the identity map, but instead
emit PTEs into the page-table like we do for system memory.

v2:
- Rebase
v3:
- Future proof somewhat by taking into account the real data size to
  flat CCS metadata size ratio. (Matt Roper)
- Invert a couple of if-statements for better readability.
- Fix support for 4K-granularity VRAM sizes. (Tested on DG1).
v4:
- Fix up code comments
- Fix debug printout format typo.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 128 ++++++++++++++++----------
 2 files changed, 80 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 7a32faa2f688..a6523df0f1d3 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -331,7 +331,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
 
 	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
-		 &src_it, XE_PAGE_SIZE, pt);
+		 &src_it, XE_PAGE_SIZE, pt->ttm.resource);
 
 	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index adf1dab5eba2..d8fff0403f74 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -62,6 +62,8 @@ struct xe_migrate {
 	 * out of the pt_bo.
 	 */
 	struct drm_suballoc_manager vm_update_sa;
+	/** @min_chunk_size: For dgfx, Minimum chunk size */
+	u64 min_chunk_size;
 };
 
 #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
@@ -364,6 +366,19 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	if (err)
 		return ERR_PTR(err);
 
+	if (IS_DGFX(xe)) {
+		if (xe_device_has_flat_ccs(xe))
+			/* min chunk size corresponds to 4K of CCS Metadata */
+			m->min_chunk_size = SZ_4K * SZ_64K /
+				xe_device_ccs_bytes(xe, SZ_64K);
+		else
+			/* Somewhat arbitrary to avoid a huge amount of blits */
+			m->min_chunk_size = SZ_64K;
+		m->min_chunk_size = roundup_pow_of_two(m->min_chunk_size);
+		drm_dbg(&xe->drm, "Migrate min chunk size is 0x%08llx\n",
+			(unsigned long long)m->min_chunk_size);
+	}
+
 	return m;
 }
 
@@ -375,16 +390,35 @@ static u64 max_mem_transfer_per_pass(struct xe_device *xe)
 	return MAX_PREEMPTDISABLE_TRANSFER;
 }
 
-static u64 xe_migrate_res_sizes(struct xe_device *xe, struct xe_res_cursor *cur)
+static u64 xe_migrate_res_sizes(struct xe_migrate *m, struct xe_res_cursor *cur)
 {
-	/*
-	 * For VRAM we use identity mapped pages so we are limited to current
-	 * cursor size. For system we program the pages ourselves so we have no
-	 * such limitation.
-	 */
-	return min_t(u64, max_mem_transfer_per_pass(xe),
-		     mem_type_is_vram(cur->mem_type) ? cur->size :
-		     cur->remaining);
+	struct xe_device *xe = tile_to_xe(m->tile);
+	u64 size = min_t(u64, max_mem_transfer_per_pass(xe), cur->remaining);
+
+	if (mem_type_is_vram(cur->mem_type)) {
+		/*
+		 * VRAM we want to blit in chunks with sizes aligned to
+		 * min_chunk_size in order for the offset to CCS metadata to be
+		 * page-aligned. If it's the last chunk it may be smaller.
+		 *
+		 * Another constraint is that we need to limit the blit to
+		 * the VRAM block size, unless size is smaller than
+		 * min_chunk_size.
+		 */
+		u64 chunk = max_t(u64, cur->size, m->min_chunk_size);
+
+		size = min_t(u64, size, chunk);
+		if (size > m->min_chunk_size)
+			size = round_down(size, m->min_chunk_size);
+	}
+
+	return size;
+}
+
+static bool xe_migrate_allow_identity(u64 size, const struct xe_res_cursor *cur)
+{
+	/* If the chunk is not fragmented, allow identity map. */
+	return cur->size >= size;
 }
 
 static u32 pte_update_size(struct xe_migrate *m,
@@ -397,7 +431,12 @@ static u32 pte_update_size(struct xe_migrate *m,
 	u32 cmds = 0;
 
 	*L0_pt = pt_ofs;
-	if (!is_vram) {
+	if (is_vram && xe_migrate_allow_identity(*L0, cur)) {
+		/* Offset into identity map. */
+		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
+					      cur->start + vram_region_gpu_offset(res));
+		cmds += cmd_size;
+	} else {
 		/* Clip L0 to available size */
 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
 		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
@@ -413,11 +452,6 @@ static u32 pte_update_size(struct xe_migrate *m,
 
 		/* Each chunk has a single blit command */
 		cmds += cmd_size;
-	} else {
-		/* Offset into identity map. */
-		*L0_ofs = xe_migrate_vram_ofs(tile_to_xe(m->tile),
-					      cur->start + vram_region_gpu_offset(res));
-		cmds += cmd_size;
 	}
 
 	return cmds;
@@ -427,10 +461,10 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram, bool is_comp_pte,
 		     struct xe_res_cursor *cur,
-		     u32 size, struct xe_bo *bo)
+		     u32 size, struct ttm_resource *res)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
-
+	struct xe_vm *vm = m->q->vm;
 	u16 pat_index;
 	u32 ptes;
 	u64 ofs = at_pt * XE_PAGE_SIZE;
@@ -443,13 +477,6 @@ static void emit_pte(struct xe_migrate *m,
 	else
 		pat_index = xe->pat.idx[XE_CACHE_WB];
 
-	/*
-	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
-	 * we're only emitting VRAM PTEs during sanity tests, so when
-	 * that's moved to a Kunit test, we should condition VRAM PTEs
-	 * on running tests.
-	 */
-
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
 	while (ptes) {
@@ -469,20 +496,22 @@ static void emit_pte(struct xe_migrate *m,
 
 			addr = xe_res_dma(cur) & PAGE_MASK;
 			if (is_vram) {
-				/* Is this a 64K PTE entry? */
-				if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
-				    !(cur_ofs & (16 * 8 - 1))) {
-					xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
+				if (vm->flags & XE_VM_FLAG_64K) {
+					u64 va = cur_ofs * XE_PAGE_SIZE / 8;
+
+					xe_assert(xe, (va & (SZ_64K - 1)) ==
+						  (addr & (SZ_64K - 1)));
+
 					flags |= XE_PTE_PS64;
 				}
 
-				addr += vram_region_gpu_offset(bo->ttm.resource);
+				addr += vram_region_gpu_offset(res);
 				devmem = true;
 			}
 
-			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
-								 addr, pat_index,
-								 0, devmem, flags);
+			addr = vm->pt_ops->pte_encode_addr(m->tile->xe,
+							   addr, pat_index,
+							   0, devmem, flags);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 
@@ -694,8 +723,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		bool usm = xe->info.has_usm;
 		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
-		src_L0 = xe_migrate_res_sizes(xe, &src_it);
-		dst_L0 = xe_migrate_res_sizes(xe, &dst_it);
+		src_L0 = xe_migrate_res_sizes(m, &src_it);
+		dst_L0 = xe_migrate_res_sizes(m, &dst_it);
 
 		drm_dbg(&xe->drm, "Pass %u, sizes: %llu & %llu\n",
 			pass++, src_L0, dst_L0);
@@ -716,6 +745,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 						      &ccs_ofs, &ccs_pt, 0,
 						      2 * avail_pts,
 						      avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
 		}
 
 		/* Add copy commands size here */
@@ -728,20 +758,20 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			goto err_sync;
 		}
 
-		if (!src_is_vram)
-			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
-				 src_bo);
-		else
+		if (src_is_vram && xe_migrate_allow_identity(src_L0, &src_it))
 			xe_res_next(&src_it, src_L0);
-
-		if (!dst_is_vram)
-			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
-				 dst_bo);
 		else
+			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
+				 src);
+
+		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
 			xe_res_next(&dst_it, src_L0);
+		else
+			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
+				 dst);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src_bo);
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -950,7 +980,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		bool usm = xe->info.has_usm;
 		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
 
-		clear_L0 = xe_migrate_res_sizes(xe, &src_it);
+		clear_L0 = xe_migrate_res_sizes(m, &src_it);
 
 		drm_dbg(&xe->drm, "Pass %u, size: %llu\n", pass++, clear_L0);
 
@@ -977,12 +1007,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		size -= clear_L0;
 		/* Preemption is enabled again by the ring ops. */
-		if (!clear_vram) {
-			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
-				 bo);
-		} else {
+		if (clear_vram && xe_migrate_allow_identity(clear_L0, &src_it))
 			xe_res_next(&src_it, clear_L0);
-		}
+		else
+			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
+				 dst);
+
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-- 
2.42.0

