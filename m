Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B1AF9D0EF
	for <intel-xe@archiver.kernel.org>; Tue, 14 Apr 2026 18:15:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ED310E641;
	Tue, 14 Apr 2026 18:15:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yq2p2jDs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD0B10E089
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Apr 2026 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776190532; x=1807726532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hIwks/Eqs28bcbs3OhhyPqhIo1uEFjl0rBmHHuX7l0U=;
 b=Yq2p2jDsrg39b725ziHe3/NKiCj4f1M3rLyy8gIpVpQZDyBH+HBZfKps
 TkL0WugUfl9tpxFh+4R3C2VWSq9IaUrnhbzp/FtqkATurFZ3QO1qq58wY
 D+IVyslCnxnNpFggizpXSQHMm9pXawNjQN6d1hw8q5KXdmKFY1BTnSahD
 LzhU5hV/7JLQymBdwVj/844ajELNWn2bMXEV2D2v5+pA9+7mPO+tC8Qlw
 e5z04tzKX5OD5tVn7XFkg4H9VmQHgSIOnZQTC9IXc+5EtPxbdjyHCQXkZ
 wmocepNSkTx1JtRTT+/gex0qnguRCFMpXJWc374G1BeXgSycOww6syNoZ g==;
X-CSE-ConnectionGUID: F/yFlp65Re6XtJriiQgTpA==
X-CSE-MsgGUID: DL8WBF7PQdi6BreSzsHQnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87464709"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87464709"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 11:15:31 -0700
X-CSE-ConnectionGUID: IiXC+heWTpuWpMydmOjIYg==
X-CSE-MsgGUID: Mt1OIcerQq2NNjDKUyOPGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253387940"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2026 11:15:31 -0700
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 3/3] drm/xe/pat: Introduce xe_cache_pat_idx() helper
Date: Tue, 14 Apr 2026 11:15:28 -0700
Message-ID: <20260414181528.282398-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414181528.282398-1-x.wang@intel.com>
References: <20260414181528.282398-1-x.wang@intel.com>
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

Add an inline helper xe_cache_pat_idx() that wraps pat.idx[] read
accesses with xe_assert() validation, catching any attempt to use
an invalid PAT index at runtime.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c | 11 ++++++-----
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  3 ++-
 drivers/gpu/drm/xe/xe_ggtt.c           |  7 ++++---
 drivers/gpu/drm/xe/xe_migrate.c        | 15 ++++++++-------
 drivers/gpu/drm/xe/xe_pat.h            | 24 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pt.c             |  3 ++-
 drivers/gpu/drm/xe/xe_vm.c             |  6 +++---
 7 files changed, 48 insertions(+), 21 deletions(-)

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
index fc918b4fba54..02e244c523bf 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -30,6 +30,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_pat.h"
 #include "xe_printk.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
@@ -216,7 +217,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				  struct xe_vm *vm, u32 *ofs)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+	u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 #define VRAM_IDENTITY_MAP_COUNT	2
@@ -336,7 +337,7 @@ static void xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		 * if flat ccs is enabled.
 		 */
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
-			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
+			u16 comp_pat_index = xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION);
 			u64 vram_offset = IDENTITY_OFFSET +
 				DIV_ROUND_UP_ULL(actual_phy_size, SZ_1G);
 			u64 pt31_ofs = xe_bo_size(bo) - XE_PAGE_SIZE;
@@ -636,10 +637,10 @@ static void emit_pte(struct xe_migrate *m,
 
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
 
@@ -1870,7 +1871,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
 
 	/* For sysmem PTE's, need to map them in our hole.. */
 	if (!IS_DGFX(xe)) {
-		u16 pat_index = xe->pat.idx[XE_CACHE_WB];
+		u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
 		u32 ptes, ofs;
 
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
@@ -2092,7 +2093,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
 				       struct drm_pagemap_addr *sram_addr,
 				       u32 size, int level)
 {
-	u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
+	u16 pat_index = xe_cache_pat_idx(tile_to_xe(m->tile), XE_CACHE_WB);
 	u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
 	u32 ptes;
 	int i = 0;
diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
index a1e287c08f57..338fda95e63f 100644
--- a/drivers/gpu/drm/xe/xe_pat.h
+++ b/drivers/gpu/drm/xe/xe_pat.h
@@ -8,8 +8,11 @@
 
 #include <linux/types.h>
 
+#include "xe_assert.h"
+#include "xe_device_types.h"
+#include "xe_pt_types.h"
+
 struct drm_printer;
-struct xe_device;
 struct xe_gt;
 
 #define XE_PAT_INVALID_IDX	U16_MAX
@@ -82,4 +85,23 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index);
  */
 u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index);
 
+/**
+ * xe_cache_pat_idx - Get the PAT index for a given cache level
+ * @xe: xe device
+ * @cache_mode: cache level to look up
+ *
+ * Assert that @cache_mode is within bounds and that the PAT index has
+ * been configured for the requested cache level, then return it.
+ *
+ * Return: PAT index corresponding to @cache_mode
+ */
+static inline u16 xe_cache_pat_idx(struct xe_device *xe,
+				   enum xe_cache_level cache_mode)
+{
+	xe_assert(xe, cache_mode < __XE_CACHE_LEVEL_COUNT);
+	xe_assert(xe, xe->pat.idx[cache_mode] != XE_PAT_INVALID_IDX);
+
+	return xe->pat.idx[cache_mode];
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8e5f4f0dea3f..7a1095c89acb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -4,6 +4,7 @@
  */
 
 #include "xe_pt.h"
+#include "xe_pat.h"
 
 #include "regs/xe_gtt_defs.h"
 #include "xe_bo.h"
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

