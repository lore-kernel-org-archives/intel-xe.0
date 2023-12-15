Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9859C35274
	for <intel-xe@archiver.kernel.org>; Fri, 15 Dec 2023 12:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AFF10EA06;
	Fri, 15 Dec 2023 12:54:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7EC10EA06
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Dec 2023 12:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702644889; x=1734180889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c/PW2sEbzhRXaatY6nse+WGtV04rF4AykIY3iFFfcGw=;
 b=O9EtEmrok/JYKNZv0554rAN22cjeKuoGDS3O8RJ9rUDNECHiWpYGJe7F
 fcvq1w5qijjYNaqEURdaprjsA3UXMKPZY1mK+Gn2uuy1BEfac7WLfqj0/
 4QMbmdJi2a960ak79/bXXgRG4flxVvppp+jVAsyaVU2cv4xtoJ7ToWaqR
 FHLtE6sIn7t3qEpeyjIom0ufV/D2LR3s1Nc7iHSmHhblj6qB1AAJjfOe/
 GREQwReoHpH2Zl7tIYOKDgKctGezwQZtxmNZzazhum3evSMLpQaqiZu11
 DsBnUrv4oNEhF4jTUI3IUHHjNrKUSJqbhAFoyYtAqbAaH869wwaqyi7+h A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2123428"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="2123428"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 04:54:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840652026"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; d="scan'208";a="840652026"
Received: from dstacken-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.176])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2023 04:54:47 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/migrate: Fix CCS copy for small VRAM copy chunks
Date: Fri, 15 Dec 2023 13:54:36 +0100
Message-ID: <20231215125436.41135-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c       | 67 ++++++++++++++++-----------
 2 files changed, 40 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 47fcd6e6b777..5f5b416dc88c 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -331,7 +331,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		xe_res_first_sg(xe_bo_sg(pt), 0, pt->size, &src_it);
 
 	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt),
-		 &src_it, XE_PAGE_SIZE, pt);
+		 &src_it, XE_PAGE_SIZE, pt->ttm.resource);
 
 	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
 
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2ca927f3fb2a..0b8a33116322 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -411,14 +411,31 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 
 static u64 xe_migrate_res_sizes(struct xe_res_cursor *cur)
 {
-	/*
-	 * For VRAM we use identity mapped pages so we are limited to current
-	 * cursor size. For system we program the pages ourselves so we have no
-	 * such limitation.
-	 */
-	return min_t(u64, MAX_PREEMPTDISABLE_TRANSFER,
-		     mem_type_is_vram(cur->mem_type) ? cur->size :
-		     cur->remaining);
+	u64 size = min_t(u64, MAX_PREEMPTDISABLE_TRANSFER, cur->remaining);
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
@@ -431,7 +448,7 @@ static u32 pte_update_size(struct xe_migrate *m,
 	u32 cmds = 0;
 
 	*L0_pt = pt_ofs;
-	if (!is_vram) {
+	if (!is_vram || xe_migrate_avoid_identity(*L0, cur)) {
 		/* Clip L0 to available size */
 		u64 size = min(*L0, (u64)avail_pts * SZ_2M);
 		u64 num_4k_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
@@ -461,20 +478,13 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_bb *bb, u32 at_pt,
 		     bool is_vram,
 		     struct xe_res_cursor *cur,
-		     u32 size, struct xe_bo *bo)
+		     u32 size, struct ttm_resource *res)
 {
 	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
 	u32 ptes;
 	u64 ofs = at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
 
-	/*
-	 * FIXME: Emitting VRAM PTEs to L0 PTs is forbidden. Currently
-	 * we're only emitting VRAM PTEs during sanity tests, so when
-	 * that's moved to a Kunit test, we should condition VRAM PTEs
-	 * on running tests.
-	 */
-
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
 	while (ptes) {
@@ -498,10 +508,10 @@ static void emit_pte(struct xe_migrate *m,
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
 
@@ -730,6 +740,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 						      &ccs_ofs, &ccs_pt, 0,
 						      2 * NUM_PT_PER_BLIT,
 						      NUM_PT_PER_BLIT);
+			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
 		}
 
 		/* Add copy commands size here */
@@ -742,20 +753,20 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 			goto err_sync;
 		}
 
-		if (!src_is_vram)
+		if (!src_is_vram || xe_migrate_avoid_identity(src_L0, &src_it))
 			emit_pte(m, bb, src_L0_pt, src_is_vram, &src_it, src_L0,
-				 src_bo);
+				 src);
 		else
 			xe_res_next(&src_it, src_L0);
 
-		if (!dst_is_vram)
+		if (!dst_is_vram || xe_migrate_avoid_identity(src_L0, &dst_it))
 			emit_pte(m, bb, dst_L0_pt, dst_is_vram, &dst_it, src_L0,
-				 dst_bo);
+				 dst);
 		else
 			xe_res_next(&dst_it, src_L0);
 
 		if (copy_system_ccs)
-			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src_bo);
+			emit_pte(m, bb, ccs_pt, false, &ccs_it, ccs_size, src);
 
 		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
 		update_idx = bb->len;
@@ -984,12 +995,12 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 		size -= clear_L0;
 
 		/* Preemption is enabled again by the ring ops. */
-		if (!clear_vram) {
+		if (!clear_vram || xe_migrate_avoid_identity(clear_L0, &src_it))
 			emit_pte(m, bb, clear_L0_pt, clear_vram, &src_it, clear_L0,
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

