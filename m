Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239F3F433D0
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 23:02:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FC210E76C;
	Wed, 15 Apr 2026 23:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqvPQp+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECB010E76C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 23:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776294162; x=1807830162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ELEGHyMT6tWQ88ELHcyl0rFK/tN2ynqgMd3tgAAk4Tw=;
 b=AqvPQp+6okYFAg/xXZt+RgLrBr3bES6mTrIiGlcBA3fIZVaPbVx0j/iu
 uTZYjZSLGnCGnCw/i/k3+tMyRODpb9PHST1KOu6nSnXhztGic+NrfkCzd
 IqokHZxpQf+ootNIFyZ6EXJYrWSAMdpwBY7iT51rnanxqUS6kgjGCMRvA
 42hod9FLpoM8g4UmEk6sPRxFGA72aWETT1t6kg9s88nu/Ycw2++O/Kl2/
 +VqL1fUMumnkqtrUMM7MWiB9QMzijjKoLI/fRTYQ3fJ6chqsnoP7Ie6dQ
 JN6CDco3k7hYxgfAqEk9obMvshL9fPbFcPhep0c9toJ/F93aW6qfW0BvU A==;
X-CSE-ConnectionGUID: UWlWGkxiRDSEZ8nHbQyCKg==
X-CSE-MsgGUID: qASOSjboQbyBYRE+dlVFqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81165866"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="81165866"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 16:02:42 -0700
X-CSE-ConnectionGUID: sHhvc6nzQQGdmTA2cRSP3A==
X-CSE-MsgGUID: lVuNeVOISr2NUU+DcxlY+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="232287522"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa004.fm.intel.com with ESMTP; 15 Apr 2026 16:02:41 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v4 3/3] drm/xe/pat: Introduce xe_cache_pat_idx() macro helper
Date: Wed, 15 Apr 2026 16:02:40 -0700
Message-ID: <20260415230240.411826-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415230240.411826-1-x.wang@intel.com>
References: <20260415230240.411826-1-x.wang@intel.com>
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

Wrap pat.idx[] reads with xe_cache_pat_idx() so invalid PAT index use
is caught by xe_assert() in debug builds.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  3 ++-
 drivers/gpu/drm/xe/xe_ggtt.c           |  7 ++++---
 drivers/gpu/drm/xe/xe_migrate.c        | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_pat.h            |  8 ++++++++
 drivers/gpu/drm/xe/xe_pt.c             |  3 ++-
 drivers/gpu/drm/xe/xe_vm.c             |  6 +++---
 7 files changed, 33 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index e45a1e7a4670..d670a3cf1b84 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -14,6 +14,7 @@
 #include "xe_device.h"
 #include "xe_display_vma.h"
 #include "xe_ggtt.h"
+#include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_vram_types.h"
 
@@ -24,7 +25,7 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	u32 column, row;
-	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
+	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe_cache_pat_idx(xe, XE_CACHE_NONE));
 
 	/* TODO: Maybe rewrite so we can traverse the bo addresses sequentially,
 	 * by writing dpt/ggtt in a different order?
@@ -64,7 +65,7 @@ write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
-						 xe->pat.idx[XE_CACHE_NONE]);
+						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
 	unsigned int offset = plane->offset * XE_PAGE_SIZE;
 	unsigned int size = plane->size;
 
@@ -87,7 +88,7 @@ write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
 	struct xe_device *xe = xe_bo_device(bo);
 	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
 	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
-						 xe->pat.idx[XE_CACHE_NONE]);
+						 xe_cache_pat_idx(xe, XE_CACHE_NONE));
 	unsigned int offset, column, row;
 
 	for (row = 0; row < plane->height; row++) {
@@ -190,7 +191,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
 		return PTR_ERR(dpt);
 
 	if (view->type == I915_GTT_VIEW_NORMAL) {
-		u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
+		u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe_cache_pat_idx(xe, XE_CACHE_NONE));
 		u32 x;
 
 		for (x = 0; x < size / XE_PAGE_SIZE; x++) {
@@ -306,7 +307,7 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display uses tiles instead of bytes here, so convert it back.. */
 		size = intel_rotation_info_size(&view->rotated) * XE_PAGE_SIZE;
 
-	pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
+	pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe_cache_pat_idx(xe, XE_CACHE_NONE));
 	vma->node = xe_ggtt_insert_node_transform(ggtt, bo, pte,
 						  ALIGN(size, align), align,
 						  view->type == I915_GTT_VIEW_NORMAL ?
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 34e2f0f4631f..50a97705e0ac 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -9,6 +9,7 @@
 #include "tests/xe_kunit_helpers.h"
 #include "tests/xe_pci_test.h"
 
+#include "xe_pat.h"
 #include "xe_pci.h"
 #include "xe_pm.h"
 
@@ -246,7 +247,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
 	/* First part of the test, are we updating our pagetable bo with a new entry? */
 	xe_map_wr(xe, &bo->vmap, XE_PAGE_SIZE * (NUM_KERNEL_PDE - 1), u64,
 		  0xdeaddeadbeefbeef);
-	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, xe->pat.idx[XE_CACHE_WB], 0);
+	expected = m->q->vm->pt_ops->pte_encode_bo(pt, 0, xe_cache_pat_idx(xe, XE_CACHE_WB), 0);
 	if (m->q->vm->flags & XE_VM_FLAG_64K)
 		expected |= XE_PTE_PS64;
 	if (xe_bo_is_vram(pt))
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 3552fa3cac4b..a351c578b170 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -24,6 +24,7 @@
 #include "xe_gt_types.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_pat.h"
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
 #include "xe_sriov.h"
@@ -258,7 +259,7 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
 
 static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 {
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[XE_CACHE_WB];
+	u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), XE_CACHE_WB);
 	u64 end = start + size - 1;
 	u64 scratch_pte;
 
@@ -723,7 +724,7 @@ static void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
+	u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
 	u64 pte;
 
 	mutex_lock(&ggtt->lock);
@@ -840,7 +841,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		bo->ggtt_node[tile_id] = NULL;
 	} else {
 		u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
-		u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
+		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), cache_mode);
 		u64 pte = ggtt->pt_ops->pte_encode_flags(bo, pat_index);
 
 		xe_ggtt_map_bo(ggtt, bo->ggtt_node[tile_id], bo, pte);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 5fdc89ed5256..a87fbc1e9fb1 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -31,6 +31,7 @@
 #include "xe_map.h"
 #include "xe_mem_pool.h"
 #include "xe_mocs.h"
+#include "xe_pat.h"
 #include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
@@ -217,7 +218,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  struct xe_vm *vm, u32 *ofs)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 #define VRAM_IDENTITY_MAP_COUNT	2
@@ -337,7 +338,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		 * if flat ccs is enabled.
 		 */
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
-			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
+			u16 comp_pat_index = xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION);
 			u64 vram_offset = IDENTITY_OFFSET +
 				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
 			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
@@ -637,10 +638,10 @@ static void emit_pte(struct xe_migrate *m,
 
 	/* Indirect access needs compression enabled uncached PAT index */
 	if (GRAPHICS_VERx100(xe) >= 2000)
-		pat_index = is_comp_pte ? xe->pat.idx[XE_CACHE_NONE_COMPRESSION] :
-					  xe->pat.idx[XE_CACHE_WB];
+		pat_index = is_comp_pte ? xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION) :
+					  xe_cache_pat_idx(xe, XE_CACHE_WB);
 	else
-		pat_index = xe->pat.idx[XE_CACHE_WB];
+		pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 
 	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
 
@@ -1876,7 +1877,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	/* For sysmem PTE's, need to map them in our hole.. */
 	if (!IS_DGFX(xe)) {
-		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+		u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 		u32 ptes, ofs;
 
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
@@ -2098,7 +2099,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct drm_pagemap_addr *sram_addr,
 				       u32 size, int level)
 {
-	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u16 pat_index = xe_cache_pat_idx(tile_to_xe(m->tile), XE_CACHE_WB);
 	u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
 	u32 ptes;
 	int i = 0;
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index a1e287c08f57..79b1c7f26320 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -82,4 +82,12 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
  */
 u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
 
+#define xe_cache_pat_idx(xe, cache_mode) ({				\
+	struct xe_device *__xe = (xe);					\
+	enum xe_cache_level __mode = (cache_mode);			\
+	xe_assert(__xe, __mode < __XE_CACHE_LEVEL_COUNT);		\
+	xe_assert(__xe, __xe->pat.idx[__mode] != XE_PAT_INVALID_IDX);	\
+	__xe->pat.idx[__mode];						\
+})
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8e5f4f0dea3f..2669ff5ee747 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -14,6 +14,7 @@
 #include "xe_gt_stats.h"
 #include "xe_migrate.h"
 #include "xe_page_reclaim.h"
+#include "xe_pat.h"
 #include "xe_pt_types.h"
 #include "xe_pt_walk.h"
 #include "xe_res_cursor.h"
@@ -62,7 +63,7 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 			     unsigned int level)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 	u8 id = tile->id;
 
 	if (!xe_vm_has_scratch(vm))
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index f97c7af2f17c..5f4220125c76 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1399,9 +1399,9 @@ static u16 pde_pat_index(struct xe_bo *bo)
 	 * something which is always safe).
 	 */
 	if (!xe_bo_is_vram(bo) && bo->ttm.ttm->caching == ttm_cached)
-		pat_index = xe->pat.idx[XE_CACHE_WB];
+		pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 	else
-		pat_index = xe->pat.idx[XE_CACHE_NONE];
+		pat_index = xe_cache_pat_idx(xe, XE_CACHE_NONE);
 
 	xe_assert(xe, pat_index <= 3);
 
@@ -4204,7 +4204,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
 
 	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, xe_bo_size(bo),
 				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
-				       vm->xe->pat.idx[cache_lvl]);
+				       xe_cache_pat_idx(vm->xe, cache_lvl));
 	if (IS_ERR(ops)) {
 		err = PTR_ERR(ops);
 		goto release_vm_lock;
-- 
2.43.0

