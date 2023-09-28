Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4D7CE7B10
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 09:28:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE2F410E5FE;
	Thu, 28 Sep 2023 09:28:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884B10E5FE
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695893322; x=1727429322;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0L6KJn7ILgrQ6U1GXmYut/try8o0jMUQRcIisMpNoBo=;
 b=I86jYWg0VEfBvTCCNWynciJNPYiC4XxiF7Dhlqlz5WSHNd8qcR64JnLH
 /UQ8jF5BQ7EBPfn7SIUtNbd+p/nxoUndLxIGIhRhtpVNnUO5nEO2CjrKI
 lJnKpYSD11sBB+w888Pd5/YFOJfRZqTXBpYBeRwKwJysNMl28kJiv1ZZI
 Ds6mYqVA2TVBJaZItedJwOE192BzKYU0SM4psBpepQVT7AeonDTxS4JzN
 IYBpEFzMvTvrzB0BPvOjbh9o8ust5I4+nyjIPYWRqtOSs1P0wTnPqwBZH
 IqQ12kNqsW+37qmertpuN8n2jLZVr6Uufg6E+cpQ+vbqmjl5c2NdSbcku Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448509996"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="448509996"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752900888"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; d="scan'208";a="752900888"
Received: from nlesniak-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.108])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 02:28:35 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 28 Sep 2023 10:28:19 +0100
Message-ID: <20230928092816.375130-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928092816.375130-7-matthew.auld@intel.com>
References: <20230928092816.375130-7-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 2/5] drm/xe: directly use pat_index for
 pte_encode
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In the next patch userspace will be able to directly set the pat_index
as part of vm_bind. To support this we need to get away from using
xe_cache_level in the low level routines and rather just use the
pat_index directly.

v2: Rebase
v3: Some missed conversions, also prefer tile_to_xe() (Niranjana)

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 10 ++++++----
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c           | 16 +++++++++-------
 drivers/gpu/drm/xe/xe_ggtt_types.h     |  3 +--
 drivers/gpu/drm/xe/xe_migrate.c        | 19 +++++++++++--------
 drivers/gpu/drm/xe/xe_pt.c             | 11 ++++++-----
 drivers/gpu/drm/xe/xe_pt_types.h       |  8 ++++----
 drivers/gpu/drm/xe/xe_vm.c             | 24 +++++++++++-------------
 8 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index b7a04fba3585..2c36e5032433 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -30,7 +30,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 
 		for (row = 0; row < height; row++) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      XE_CACHE_WB);
+							      xe->pat.idx[XE_CACHE_WB]);
 
 			iosys_map_wr(map, *dpt_ofs, u64, pte);
 			*dpt_ofs += 8;
@@ -84,7 +84,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 
 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x * XE_PAGE_SIZE,
-							      XE_CACHE_WB);
+							      xe->pat.idx[XE_CACHE_WB]);
 
 			iosys_map_wr(&dpt->vmap, x * 8, u64, pte);
 		}
@@ -110,6 +110,7 @@ static void
 write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo_ofs,
 		   u32 width, u32 height, u32 src_stride, u32 dst_stride)
 {
+	struct xe_device *xe = xe_bo_device(bo);
 	u32 column, row;
 
 	for (column = 0; column < width; column++) {
@@ -117,7 +118,7 @@ write_ggtt_rotated(struct xe_bo *bo, struct xe_ggtt *ggtt, u32 *ggtt_ofs, u32 bo
 
 		for (row = 0; row < height; row++) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, src_idx * XE_PAGE_SIZE,
-							      XE_CACHE_WB);
+							      xe->pat.idx[XE_CACHE_WB]);
 
 			xe_ggtt_set_pte(ggtt, *ggtt_ofs, pte);
 			*ggtt_ofs += XE_PAGE_SIZE;
@@ -162,7 +163,8 @@ static int __xe_pin_fb_vma_ggtt(struct intel_framebuffer *fb,
 			goto out_unlock;
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE) {
-			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x, XE_CACHE_WB);
+			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
+							      xe->pat.idx[XE_CACHE_WB]);
 
 			xe_ggtt_set_pte(ggtt, vma->node.start + x, pte);
 		}
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 6906ff9d9c31..4c8526af06ce 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -301,7 +301,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	/* First part of the test, are we updating our pagetable bo with a new entry? */
 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
 		  0xdeaddeadbeefbeef);
-	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, XE_CACHE_WB, 0);
+	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, xe->pat.idx[XE_CACHE_WB], 0);
 	if (m->q->vm->flags & XE_VM_FLAG_64K)
 		expected |= XE_PTE_PS64;
 	if (xe_bo_is_vram(pt))
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 99b54794917e..354871a6b371 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -27,7 +27,7 @@
 #define GUC_GGTT_TOP	0xFEE00000
 
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
-				   enum xe_cache_level cache)
+				   u16 pat_index)
 {
 	u64 pte;
 
@@ -41,13 +41,12 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 }
 
 static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
-				    enum xe_cache_level cache)
+				    u16 pat_index)
 {
 	struct xe_device *xe = xe_bo_device(bo);
-	u32 pat_index = xe->pat.idx[cache];
 	u64 pte;
 
-	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, cache);
+	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, pat_index);
 
 	xe_assert(xe, pat_index <= 3);
 
@@ -79,6 +78,7 @@ void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
+	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
 	u64 end = start + size - 1;
 	u64 scratch_pte;
 
@@ -86,7 +86,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 
 	if (ggtt->scratch)
 		scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0,
-							  XE_CACHE_WB);
+							  pat_index);
 	else
 		scratch_pte = 0;
 
@@ -285,9 +285,10 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 
 void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 {
+	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
 	u64 addr, scratch_pte;
 
-	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, XE_CACHE_WB);
+	scratch_pte = ggtt->pt_ops->pte_encode_bo(ggtt->scratch, 0, pat_index);
 
 	printk("%sGlobal GTT:", prefix);
 	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
@@ -324,11 +325,12 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
+	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
 	u64 start = bo->ggtt_node.start;
 	u64 offset, pte;
 
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
-		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, XE_CACHE_WB);
+		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		xe_ggtt_set_pte(ggtt, start + offset, pte);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 486016ea5b67..d8c584d9a8c3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -14,8 +14,7 @@ struct xe_bo;
 struct xe_gt;
 
 struct xe_ggtt_pt_ops {
-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
-			     enum xe_cache_level cache);
+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
 };
 
 struct xe_ggtt {
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index cd2e00008aab..b8b81a9ce2ca 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -158,6 +158,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				 struct xe_vm *vm)
 {
 	struct xe_device *xe = tile_to_xe(tile);
+	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 	u32 map_ofs, level, i;
@@ -189,7 +190,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		return ret;
 	}
 
-	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
+	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
 
 	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
@@ -197,7 +198,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* Map the entire BO in our level 0 pt */
 	for (i = 0, level = 0; i < num_entries; level++) {
 		entry = vm->pt_ops->pte_encode_bo(bo, i * XE_PAGE_SIZE,
-						  XE_CACHE_WB, 0);
+						  pat_index, 0);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
 
@@ -216,7 +217,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
 		     XE_PAGE_SIZE) {
 			entry = vm->pt_ops->pte_encode_bo(batch, i,
-							  XE_CACHE_WB, 0);
+							  pat_index, 0);
 
 			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
 				  entry);
@@ -241,7 +242,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 			flags = XE_PDE_64K;
 
 		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
-						  XE_PAGE_SIZE, XE_CACHE_WB);
+						  XE_PAGE_SIZE, pat_index);
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
 			  entry | flags);
 	}
@@ -249,7 +250,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	/* Write PDE's that point to our BO. */
 	for (i = 0; i < num_entries - num_level; i++) {
 		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
-						  XE_CACHE_WB);
+						  pat_index);
 
 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
 			  (i + 1) * 8, u64, entry);
@@ -261,7 +262,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		level = 2;
 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
-		flags = vm->pt_ops->pte_encode_addr(xe, 0, XE_CACHE_WB, level,
+		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 						    true, 0);
 
 		/*
@@ -457,6 +458,7 @@ static void emit_pte(struct xe_migrate *m,
 		     struct xe_res_cursor *cur,
 		     u32 size, struct xe_bo *bo)
 {
+	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
 	u32 ptes;
 	u64 ofs = at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
@@ -500,7 +502,7 @@ static void emit_pte(struct xe_migrate *m,
 			}
 
 			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
-								 addr, XE_CACHE_WB,
+								 addr, pat_index,
 								 0, devmem, flags);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
@@ -1198,6 +1200,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	bool first_munmap_rebind = vma &&
 		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
 	struct xe_exec_queue *q_override = !q ? m->q : q;
+	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 
 	/* Use the CPU if no in syncs and engine is idle */
 	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
@@ -1269,7 +1272,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 			xe_tile_assert(tile, pt_bo->size == SZ_4K);
 
-			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, XE_CACHE_WB, 0);
+			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
 			bb->cs[bb->len++] = upper_32_bits(addr);
 		}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 4d4c6a4c305e..92b512641b4a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -50,6 +50,7 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
 static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 			     unsigned int level)
 {
+	u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
 	u8 id = tile->id;
 
 	if (!vm->scratch_bo[id])
@@ -57,9 +58,9 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 
 	if (level > 0)
 		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
-						 0, XE_CACHE_WB);
+						 0, pat_index);
 
-	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, XE_CACHE_WB, 0);
+	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, pat_index, 0);
 }
 
 /**
@@ -510,6 +511,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt_stage_bind_walk *xe_walk =
 		container_of(walk, typeof(*xe_walk), base);
+	u16 pat_index = tile_to_xe(xe_walk->tile)->pat.idx[xe_walk->cache];
 	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
 	struct xe_vm *vm = xe_walk->vm;
 	struct xe_pt *xe_child;
@@ -526,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 
 		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
 						 xe_res_dma(curs) + xe_walk->dma_offset,
-						 xe_walk->vma, xe_walk->cache, level);
+						 xe_walk->vma, pat_index, level);
 		pte |= xe_walk->default_pte;
 
 		/*
@@ -591,8 +593,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			xe_child->is_compact = true;
 		}
 
-		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
-						xe_walk->cache) | flags;
+		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
 					 pte);
 	}
diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
index bd6645295fe6..355fa8f014e9 100644
--- a/drivers/gpu/drm/xe/xe_pt_types.h
+++ b/drivers/gpu/drm/xe/xe_pt_types.h
@@ -38,14 +38,14 @@ struct xe_pt {
 
 struct xe_pt_ops {
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
-			     enum xe_cache_level cache, u32 pt_level);
+			     u16 pat_index, u32 pt_level);
 	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
-			      enum xe_cache_level cache, u32 pt_level);
+			      u16 pat_index, u32 pt_level);
 	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
-			       enum xe_cache_level cache,
+			       u16 pat_index,
 			       u32 pt_level, bool devmem, u64 flags);
 	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
-			     const enum xe_cache_level cache);
+			     const u16 pat_index);
 };
 
 struct xe_pt_entry {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index beffbb1039d3..4804a0cd8a36 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1191,9 +1191,8 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
 	.op_alloc = xe_vm_op_alloc,
 };
 
-static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
+static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
 {
-	u32 pat_index = xe->pat.idx[cache];
 	u64 pte = 0;
 
 	if (pat_index & BIT(0))
@@ -1205,9 +1204,8 @@ static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
 	return pte;
 }
 
-static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
+static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
 {
-	u32 pat_index = xe->pat.idx[cache];
 	u64 pte = 0;
 
 	if (pat_index & BIT(0))
@@ -1238,27 +1236,27 @@ static u64 pte_encode_ps(u32 pt_level)
 }
 
 static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
-			      const enum xe_cache_level cache)
+			      const u16 pat_index)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	u64 pde;
 
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pde |= pde_encode_cache(xe, cache);
+	pde |= pde_encode_pat_index(xe, pat_index);
 
 	return pde;
 }
 
 static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
-			      enum xe_cache_level cache, u32 pt_level)
+			      u16 pat_index, u32 pt_level)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	u64 pte;
 
 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_cache(xe, cache);
+	pte |= pte_encode_pat_index(xe, pat_index);
 	pte |= pte_encode_ps(pt_level);
 
 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
@@ -1268,7 +1266,7 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 }
 
 static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
-			       enum xe_cache_level cache, u32 pt_level)
+			       u16 pat_index, u32 pt_level)
 {
 	struct xe_device *xe = xe_vma_vm(vma)->xe;
 
@@ -1277,7 +1275,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 	if (likely(!xe_vma_read_only(vma)))
 		pte |= XE_PAGE_RW;
 
-	pte |= pte_encode_cache(xe, cache);
+	pte |= pte_encode_pat_index(xe, pat_index);
 	pte |= pte_encode_ps(pt_level);
 
 	if (unlikely(xe_vma_is_null(vma)))
@@ -1287,7 +1285,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 }
 
 static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
-				enum xe_cache_level cache,
+				u16 pat_index,
 				u32 pt_level, bool devmem, u64 flags)
 {
 	u64 pte;
@@ -1297,7 +1295,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
 
 	pte = addr;
 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
-	pte |= pte_encode_cache(xe, cache);
+	pte |= pte_encode_pat_index(xe, pat_index);
 	pte |= pte_encode_ps(pt_level);
 
 	if (devmem)
@@ -1701,7 +1699,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
 	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0,
-					 XE_CACHE_WB);
+					 tile_to_xe(tile)->pat.idx[XE_CACHE_WB]);
 }
 
 static struct dma_fence *
-- 
2.41.0

