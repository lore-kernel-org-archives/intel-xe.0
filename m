Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E66C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 15:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE23610E0F7;
	Fri, 15 Dec 2023 15:07:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A09610E0F7
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 15:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702652865; x=1734188865;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1u6rizlQnZtR4vQHJsajgHEyscN/yqdpMoIVrrn7fuU=;
 b=XhCA1mWD5UZymdwcymuRnSb9ZvnHPz6ldVeiiSHzPU0E7H6KTA4Ysl/y
 lnDdOZ7l15NuHNfwl7aR64KXscdBC/HRSO6ZqSjDKkUUOU8d5a1N25P7i
 R0i2DbuwgCjNEsfC0CM1aNKzL13NaFANBZwXmO9UNCBmiqrnmlgaqW27I
 zQLz5cIcsyAR8Srejf7JRAsTspUIsNcOO6Kh+j3kRNRLqnVTKu8sMeN7T
 +slg56qTwz4v5B7+glYsp6N/pO/No0qyTRYOrvA8PREvcaHUgk3FStFx+
 YTeDP4P8KBMdnes8kmgZ1ZZhKuKH1uGyKRAU3seb5vKORdHdIPhapZF92 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459606839"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="459606839"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="768004711"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; d="scan'208";a="768004711"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.176])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 07:07:44 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
Date: Fri, 15 Dec 2023 16:07:13 +0100
Message-ID: <20231215150713.5948-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 67 ++++++++++++++++-----------
 2 files changed, 40 insertions(+), 29 deletions(-)

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
index adf1dab5eba2..49f31e66b86a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -377,14 +377,31 @@ static u64 max_mem_transfer_per_pass(struct xe_device *xe)
 
 static u64 xe_migrate_res_sizes(struct xe_device *xe, struct xe_res_cursor *cur)
 {
-	/*
-	 * For VRAM we use identity mapped pages so we are limited to current
-	 * cursor size. For system we program the pages ourselves so we have no
-	 * such limitation.
-	 */
-	return min_t(u64, max_mem_transfer_per_pass(xe),
-		     mem_type_is_vram(cur->mem_type) ? cur->size :
-		     cur->remaining);
+	u64 size = min_t(u64, max_mem_transfer_per_pass(xe), cur->remaining);
+
+	if (mem_type_is_vram(cur->mem_type)) {
+		/*
+		 * VRAM we want to blit in chunks with sizes aligned to
+		 * 1MiB in order for the offset to CCS metadata to be
+		 * page-aligned. If it's the last chunk it may be smaller.
+		 *
+		 * Another constraint is that we need to limit the blit to
+		 * the VRAM block size, unless size is smaller than 1MiB.
+		 */
+		u64 chunk = max_t(u64, cur->size, SZ_1M);
+
+		size = min_t(u64, size, chunk);
+		if (size > SZ_1M)
+			size = round_down(size, SZ_1M);
+	}
+
+	return size;
+}
+
+static bool xe_migrate_avoid_identity(u64 size, const struct xe_res_cursor *cur)
+{
+	/* The chunk is fragmented. Hence can't use identity map. */
+	return cur->size < size;
 }
 
 static u32 pte_update_size(struct xe_migrate *m,
@@ -397,7 +414,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	u32 cmds = 0;
 
 	*L0_pt = pt_ofs;
-	if (!is_vram) {
+	if (!is_vram || xe_migrate_avoid_identity(*L0, cur)) {
 		/* Clip L0 to available size */
 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
 		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
@@ -427,7 +444,7 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram, bool is_comp_pte,
 		     struct xe_res_cursor *cur,
-		     u32 size, struct xe_bo *bo)
+		     u32 size, struct ttm_resource *res)
 {
 	struct xe_device *xe = tile_to_xe(m->tile);
 
@@ -443,13 +460,6 @@ static void emit_pte(struct xe_migrate *m,
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
@@ -473,10 +483,10 @@ static void emit_pte(struct xe_migrate *m,
 				if ((m->q->vm->flags & XE_VM_FLAG_64K) &&
 				    !(cur_ofs & (16 * 8 - 1))) {
 					xe_tile_assert(m->tile, IS_ALIGNED(addr, SZ_64K));
-					flags |= XE_PTE_PS64;
 				}
 
-				addr += vram_region_gpu_offset(bo->ttm.resource);
+				addr += vram_region_gpu_offset(res);
+				flags |= XE_PTE_PS64;
 				devmem = true;
 			}
 
@@ -716,6 +726,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 						      &ccs_ofs, &ccs_pt, 0,
 						      2 * avail_pts,
 						      avail_pts);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
 		}
 
 		/* Add copy commands size here */
@@ -728,20 +739,20 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			goto err_sync;
 		}
 
-		if (!src_is_vram)
+		if (!src_is_vram || xe_migrate_avoid_identity(src_L0, &src_it))
 			emit_pte(m, bb, src_L0_pt, src_is_vram, true, &src_it, src_L0,
-				 src_bo);
+				 src);
 		else
 			xe_res_next(&src_it, src_L0);
 
-		if (!dst_is_vram)
+		if (!dst_is_vram || xe_migrate_avoid_identity(src_L0, &dst_it))
 			emit_pte(m, bb, dst_L0_pt, dst_is_vram, true, &dst_it, src_L0,
-				 dst_bo);
+				 dst);
 		else
 			xe_res_next(&dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src_bo);
+			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -977,12 +988,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 
 		size -= clear_L0;
 		/* Preemption is enabled again by the ring ops. */
-		if (!clear_vram) {
+		if (!clear_vram || xe_migrate_avoid_identity(clear_L0, &src_it))
 			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
-				 bo);
-		} else {
+				 dst);
+		else
 			xe_res_next(&src_it, clear_L0);
-		}
+
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
 
-- 
2.42.0

