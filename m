Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916B3CF9C62
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 19:01:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FC310E85C;
	Fri, 20 Sep 2024 19:01:07 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C8F10E86F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 19:01:06 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 1/2] drm/xe: Add XE_BO_FLAG_NEEDS_WC_CPU and unify mapping for
 page tables.
Date: Fri, 20 Sep 2024 21:01:06 +0200
Message-ID: <20240920190107.156914-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

There are various places where we map buffers WC_CPU and uncached on the
GPU. Unify all of those users to a single flag.

In particular our usage of page table flags has been incoherent,
and we should use uncached where applicable.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c   | 22 +++++++---------------
 drivers/gpu/drm/xe/xe_bo.h   |  7 ++++---
 drivers/gpu/drm/xe/xe_ggtt.c |  4 ++--
 drivers/gpu/drm/xe/xe_pt.c   | 31 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pt.h   |  1 +
 5 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5f2f1ec46b57..790078aa47af 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -366,37 +366,29 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
 	 * CPU.
 	 */
 	if (!IS_DGFX(xe)) {
-		switch (bo->cpu_caching) {
-		case DRM_XE_GEM_CPU_CACHING_WC:
+		if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WC)
 			caching = ttm_write_combined;
-			break;
-		default:
-			caching = ttm_cached;
-			break;
-		}
 
 		WARN_ON((bo->flags & XE_BO_FLAG_USER) && !bo->cpu_caching);
 
 		/*
 		 * Display scanout is always non-coherent with the CPU cache.
-		 *
-		 * For Xe_LPG and beyond, PPGTT PTE lookups are also
-		 * non-coherent and require a CPU:WC mapping.
 		 */
-		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT) ||
-		    (xe->info.graphics_verx100 >= 1270 &&
-		     bo->flags & XE_BO_FLAG_PAGETABLE))
+		if ((!bo->cpu_caching && bo->flags & XE_BO_FLAG_SCANOUT))
 			caching = ttm_write_combined;
 	}
 
-	if (bo->flags & XE_BO_FLAG_NEEDS_UC) {
+	if (bo->flags & (XE_BO_FLAG_NEEDS_UC | XE_BO_FLAG_NEEDS_WC_CPU))
 		/*
 		 * Valid only for internally-created buffers only, for
 		 * which cpu_caching is never initialized.
 		 */
 		xe_assert(xe, bo->cpu_caching == 0);
+
+	if (bo->flags & XE_BO_FLAG_NEEDS_WC_CPU)
+		caching = ttm_write_combined;
+	else if (bo->flags & XE_BO_FLAG_NEEDS_UC)
 		caching = ttm_uncached;
-	}
 
 	err = ttm_tt_init(&tt->ttm, &bo->ttm, page_flags, caching, extra_pages);
 	if (err) {
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 31f4ba3bd8c1..e14013096060 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -36,9 +36,10 @@
 #define XE_BO_FLAG_PAGETABLE		BIT(12)
 #define XE_BO_FLAG_NEEDS_CPU_ACCESS	BIT(13)
 #define XE_BO_FLAG_NEEDS_UC		BIT(14)
-#define XE_BO_FLAG_NEEDS_64K		BIT(15)
-#define XE_BO_FLAG_NEEDS_2M		BIT(16)
-#define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
+#define XE_BO_FLAG_NEEDS_WC_CPU		BIT(15)
+#define XE_BO_FLAG_NEEDS_64K		BIT(16)
+#define XE_BO_FLAG_NEEDS_2M		BIT(17)
+#define XE_BO_FLAG_GGTT_INVALIDATE	BIT(18)
 /* this one is trigger internally only */
 #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
 #define XE_BO_FLAG_INTERNAL_64K		BIT(31)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f68af56c3f86..c4b6a163069f 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -26,6 +26,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
+#include "xe_pt.h"
 #include "xe_sriov.h"
 #include "xe_wa.h"
 #include "xe_wopcm.h"
@@ -581,8 +582,7 @@ bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
  */
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
-	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
+	u16 pat_index = xe_pt_pat_index_from_bo(bo);
 	u64 start;
 	u64 offset, pte;
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d6353e8969f0..0ab472dee80a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -100,6 +100,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	struct xe_pt *pt;
 	struct xe_bo *bo;
 	int err;
+	u32 flags = 0;
 
 	if (level) {
 		struct xe_pt_dir *dir = kzalloc(sizeof(*dir), GFP_KERNEL);
@@ -112,13 +113,21 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 		return ERR_PTR(-ENOMEM);
 
 	pt->level = level;
+
+	/*
+	 * For Xe_LPG and beyond, PPGTT PTE lookups are
+	 * non-coherent and require a CPU:WC mapping.
+	 */
+	if (!IS_DGFX(vm->xe) && vm->xe->info.graphics_verx100 >= 1270)
+		flags |= XE_BO_FLAG_NEEDS_WC_CPU;
+
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 				  XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
 				  XE_BO_FLAG_PINNED |
 				  XE_BO_FLAG_NO_RESV_EVICT |
-				  XE_BO_FLAG_PAGETABLE);
+				  XE_BO_FLAG_PAGETABLE | flags);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
@@ -568,6 +577,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			xe_child->is_compact = true;
 		}
 
+		pat_index = xe_pt_pat_index_from_bo(xe_child->bo);
 		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
 					 pte);
@@ -2190,3 +2200,22 @@ void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops)
 
 	xe_bo_put_commit(&vops->pt_update_ops[tile->id].deferred);
 }
+
+
+/**
+ * xe_pt_pat_index_from_bo() - Get PAT index for kernel BO
+ * @bo: BO to get PAT index from.
+ *
+ * Return: PAT index for bo, either pat index for XE_CACHE_NONE or XE_CACHE_WB.
+ */
+u16 xe_pt_pat_index_from_bo(struct xe_bo *bo)
+{
+	struct xe_device *xe = tile_to_xe(bo->tile);
+
+	xe_assert(xe, !(bo->flags & XE_BO_FLAG_USER) || (bo->flags & XE_BO_FLAG_SCANOUT));
+
+	if (bo->flags & (XE_BO_FLAG_NEEDS_UC | XE_BO_FLAG_NEEDS_WC_CPU))
+		return xe->pat.idx[XE_CACHE_NONE];
+
+	return xe->pat.idx[XE_CACHE_WB];
+}
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 9ab386431cad..a705cf6851ea 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -42,5 +42,6 @@ void xe_pt_update_ops_fini(struct xe_tile *tile, struct xe_vma_ops *vops);
 void xe_pt_update_ops_abort(struct xe_tile *tile, struct xe_vma_ops *vops);
 
 bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
+u16 xe_pt_pat_index_from_bo(struct xe_bo *bo);
 
 #endif
-- 
2.45.2

