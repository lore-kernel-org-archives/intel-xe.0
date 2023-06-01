Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EA4C7EE45
	for <intel-xe@archiver.kernel.org>; Thu,  1 Jun 2023 20:30:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335CA10E5D4;
	Thu,  1 Jun 2023 20:30:37 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5B610E5C9
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Jun 2023 20:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685651433; x=1717187433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tuz4sliul7POJUfIqFJzM7jp5vLBKLqVGF5hV7c72cY=;
 b=F+QsaUo5Rr+n8Y9d12kM3piX+roIlO/E5ra/j74MefRdmM+ZRwX6JJL+
 tRv/LasOiPMwOxJSa6w7Yw9ybFvaa8UyP0q4UZlomy7Wd7lXJGZDnDFXr
 23kNsJo7LiNhMLKlE4w95XCMMnOwgEfIGT/wKlqo6H/ZgWLWjDTIlaotN
 g3o0pmxslVlEA3AZ6CJfukO+uOWnK4/epkmQ+dR91nCXh+brtzx7UsRXa
 q51w61AIUoQjuwcJTfLwWXvVrcU8d0no1wDRzlXVnXqxg5RVODzeFBmH8
 gXRxHWe2iMbcrQLMT5RnINj+4+c08oWDhOLtYn6VnBLGxLNhp6UqqcL/s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358102528"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="358102528"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740493266"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; d="scan'208";a="740493266"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.147])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 13:30:33 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  1 Jun 2023 13:30:12 -0700
Message-Id: <20230601203025.615494-19-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601203025.615494-1-matthew.d.roper@intel.com>
References: <20230601203025.615494-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [CI 18/31] drm/xe: Allocate GT dynamically
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

In preparation for re-adding media GT support, switch the primary GT
within the tile to a dynamic allocation.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c  |  4 ++--
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  2 +-
 drivers/gpu/drm/xe/xe_device.c         |  4 ----
 drivers/gpu/drm/xe/xe_device.h         |  8 ++++++--
 drivers/gpu/drm/xe/xe_device_types.h   |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c           |  2 +-
 drivers/gpu/drm/xe/xe_gt.c             | 11 ++++++++---
 drivers/gpu/drm/xe/xe_gt.h             |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c        | 12 ++++++------
 drivers/gpu/drm/xe/xe_mmio.c           |  2 +-
 drivers/gpu/drm/xe/xe_pci.c            |  8 ++++++--
 drivers/gpu/drm/xe/xe_pt.c             |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c             |  6 +++---
 13 files changed, 38 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index d9f1f31c92d2..60266fea7faa 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -286,7 +286,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		goto free_pt;
 	}
 
-	bb = xe_bb_new(&tile->primary_gt, 32, xe->info.supports_usm);
+	bb = xe_bb_new(tile->primary_gt, 32, xe->info.supports_usm);
 	if (IS_ERR(bb)) {
 		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
 			   PTR_ERR(bb));
@@ -323,7 +323,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
 	expected = 0;
 
-	emit_clear(&tile->primary_gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
+	emit_clear(tile->primary_gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
 		   IS_DGFX(xe));
 	run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetable",
 		       test);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 45f2614f91ec..b2beba0019cd 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -237,7 +237,7 @@ static void xe_rtp_process_tests(struct kunit *test)
 {
 	const struct rtp_test_case *param = test->param_value;
 	struct xe_device *xe = test->priv;
-	struct xe_gt *gt = &xe_device_get_root_tile(xe)->primary_gt;
+	struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
 	struct xe_reg_sr *reg_sr = &gt->reg_sr;
 	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3c4c41eebf05..c7985af85a53 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -259,10 +259,6 @@ int xe_device_probe(struct xe_device *xe)
 		err = xe_tile_alloc(tile);
 		if (err)
 			return err;
-
-		err = xe_gt_alloc(xe, &tile->primary_gt);
-		if (err)
-			return err;
 	}
 
 	err = xe_mmio_init(xe);
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index e88f685f3f21..f2d8479f6ff6 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -58,7 +58,11 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
 	struct xe_gt *gt;
 
 	XE_BUG_ON(gt_id > XE_MAX_TILES_PER_DEVICE);
-	gt = &xe->tiles[gt_id].primary_gt;
+
+	gt = xe->tiles[gt_id].primary_gt;
+	if (drm_WARN_ON(&xe->drm, !gt))
+		return NULL;
+
 	XE_BUG_ON(gt->info.id != gt_id);
 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
 
@@ -79,7 +83,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
  */
 static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 {
-	return &xe_device_get_root_tile(xe)->primary_gt;
+	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
 static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 11042e565208..e6af89e940a1 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -80,7 +80,7 @@ struct xe_tile {
 	/**
 	 * @primary_gt: Primary GT
 	 */
-	struct xe_gt primary_gt;
+	struct xe_gt *primary_gt;
 
 	/* TODO: Add media GT here */
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index d2035142f41d..c4862c1cfd9b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -196,7 +196,7 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	 * TODO: Loop over each GT in tile once media GT support is
 	 * re-added
 	 */
-	struct xe_gt *gt = &ggtt->tile->primary_gt;
+	struct xe_gt *gt = ggtt->tile->primary_gt;
 
 	/* TODO: vfunc for GuC vs. non-GuC */
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index aa047db4c937..f00b82e90106 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -43,13 +43,18 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
-	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
+	struct xe_gt *gt;
 
+	gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), GFP_KERNEL);
+	if (!gt)
+		return ERR_PTR(-ENOMEM);
+
+	gt->tile = tile;
 	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq", 0);
 
-	return 0;
+	return gt;
 }
 
 void xe_gt_sanitize(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 01c1d226faeb..21d9044088de 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -16,7 +16,7 @@
 	     for_each_if (((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
-int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt);
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
 int xe_gt_record_default_lrcs(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ca6f3e6c2e9e..86df1be3af8f 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -229,7 +229,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
 
 		if (xe->info.supports_usm) {
-			batch = tile->primary_gt.usm.bb_pool->bo;
+			batch = tile->primary_gt->usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE,
 						&is_vram);
 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
@@ -313,7 +313,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_gt *primary_gt = &tile->primary_gt;
+	struct xe_gt *primary_gt = tile->primary_gt;
 	struct xe_migrate *m;
 	struct xe_vm *vm;
 	struct ww_acquire_ctx ww;
@@ -546,7 +546,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 			       u64 dst_ofs, bool dst_is_vram, u32 dst_size,
 			       u64 ccs_ofs, bool copy_ccs)
 {
-	struct xe_gt *gt = &m->tile->primary_gt;
+	struct xe_gt *gt = m->tile->primary_gt;
 	u32 flush_flags = 0;
 
 	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
@@ -610,7 +610,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *src,
 				  struct ttm_resource *dst)
 {
-	struct xe_gt *gt = &m->tile->primary_gt;
+	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
 	u64 size = src_bo->size;
@@ -873,7 +873,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
-	struct xe_gt *gt = &m->tile->primary_gt;
+	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
@@ -1148,7 +1148,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
 	struct xe_tile *tile = m->tile;
-	struct xe_gt *gt = &tile->primary_gt;
+	struct xe_gt *gt = tile->primary_gt;
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index d25e6a05b157..33049dc46102 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -209,7 +209,7 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
 int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_offset)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_gt *gt = &tile->primary_gt;
+	struct xe_gt *gt = tile->primary_gt;
 	u64 offset;
 	int err;
 	u32 reg;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 723d69b88a52..ddb256a4e39c 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -19,6 +19,7 @@
 #include "xe_device.h"
 #include "xe_display.h"
 #include "xe_drv.h"
+#include "xe_gt.h"
 #include "xe_macros.h"
 #include "xe_module.h"
 #include "xe_pci_types.h"
@@ -550,9 +551,12 @@ static int xe_info_init(struct xe_device *xe,
 		tile->xe = xe;
 		tile->id = id;
 
-		gt = &tile->primary_gt;
+		tile->primary_gt = xe_gt_alloc(tile);
+		if (IS_ERR(tile->primary_gt))
+			return PTR_ERR(tile->primary_gt);
+
+		gt = tile->primary_gt;
 		gt->info.id = id;	/* FIXME: Determine sensible numbering */
-		gt->tile = tile;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
 		if (MEDIA_VER(xe) < 13 && media_desc)
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 41b2be028b8a..bef265715000 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1314,7 +1314,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 
 		/* TLB invalidation must be done before signaling rebind */
 		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
-			int err = invalidation_fence_init(&tile->primary_gt, ifence, fence,
+			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
 							  vma);
 			if (err) {
 				dma_fence_put(fence);
@@ -1634,7 +1634,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 		int err;
 
 		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(&tile->primary_gt, ifence, fence, vma);
+		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
 		if (err) {
 			dma_fence_put(fence);
 			kfree(ifence);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1fd13f1b780b..c2356fcaf4ce 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1260,7 +1260,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
 		for_each_tile(tile, xe, id) {
-			struct xe_gt *gt = &tile->primary_gt;
+			struct xe_gt *gt = tile->primary_gt;
 			struct xe_vm *migrate_vm;
 			struct xe_engine *eng;
 
@@ -3410,7 +3410,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			 * FIXME: We potentially need to invalidate multiple
 			 * GTs within the tile
 			 */
-			seqno[id] = xe_gt_tlb_invalidation_vma(&tile->primary_gt, NULL, vma);
+			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
@@ -3418,7 +3418,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	for_each_tile(tile, xe, id) {
 		if (tile_needs_invalidate & BIT(id)) {
-			ret = xe_gt_tlb_invalidation_wait(&tile->primary_gt, seqno[id]);
+			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.40.1

