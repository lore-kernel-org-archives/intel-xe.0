Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554C4C77B7A
	for <intel-xe@archiver.kernel.org>; Fri, 19 May 2023 23:19:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACD410E4D4;
	Fri, 19 May 2023 23:19:16 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC5510E625
 for <intel-xe@lists.freedesktop.org>; Fri, 19 May 2023 23:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684538329; x=1716074329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rVZ4BnOlySYyOIyDekUO0Mt8JiWU9gW5TTEiLfHoUPs=;
 b=QG4S9+4po1nG1lZu4+jyjM+HrqhRt4W/gDhZxENmkIqxBEg214cSxDbw
 NVElnHumOOdk4z4+J9ubxb260iKeiQdjH0BQVkjpycHLvg+e05vEtxQsA
 2v4reJoyEaHX1no+LFbZGDmS4Ue0ba6Ihd7MPmJKxW6SSpsKQ1mXEQARp
 Bk5WGzo4uukcpzYIreg9GApAEyl2He7wdDdo+FFVp4MBCT1CCneQhKTOQ
 G5ZzRqTYJ5Pv2QxuscvnbOf8/oij9XPkgKRPuACePAKV5Bb5D6DTBSAoY
 2wR7GYCSnhrsJq2rhmc/obnMUTZ9otXclwFb4jVcA6b/4eAR03Uy/KEDL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="352526370"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="352526370"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="696888734"
X-IronPort-AV: E=Sophos;i="6.00,178,1681196400"; d="scan'208";a="696888734"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 16:18:41 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 19 May 2023 16:18:14 -0700
Message-Id: <20230519231827.3572452-18-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230519231827.3572452-1-matthew.d.roper@intel.com>
References: <20230519231827.3572452-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 17/30] drm/xe: Allocate GT dynamically
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, matthew.d.roper@intel.com
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
 drivers/gpu/drm/xe/xe_pci.c            |  7 +++++--
 drivers/gpu/drm/xe/xe_pt.c             |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c             |  6 +++---
 12 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index b66d4d194eb7..c17deb4d8db5 100644
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
@@ -318,7 +318,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
 	expected = 0;
 
-	emit_clear(&tile->primary_gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
+	emit_clear(tile->primary_gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
 		   IS_DGFX(xe));
 	run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetable",
 		       test);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 7f8153df43ac..1b05f3cf7b21 100644
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
 	unsigned long idx, count = 0;
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 43a585b67581..ab3fcec52013 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -251,10 +251,6 @@ int xe_device_probe(struct xe_device *xe)
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
index 42bc566c53d8..156c62ac0381 100644
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
 
@@ -77,7 +81,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
  */
 static inline struct xe_gt *xe_root_mmio_gt(struct xe_device *xe)
 {
-	return &xe_device_get_root_tile(xe)->primary_gt;
+	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
 static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 9b5a25a86234..7fa473d85be1 100644
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
index b11f22b68bb8..7c87623ef5c5 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -194,7 +194,7 @@ void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
 	 * TODO: Loop over each GT in tile once media GT support is
 	 * re-added
 	 */
-	struct xe_gt *gt = &ggtt->tile->primary_gt;
+	struct xe_gt *gt = ggtt->tile->primary_gt;
 
 	/* TODO: vfunc for GuC vs. non-GuC */
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 19f2cab3a57d..0abd0d912610 100644
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
index c8abbeb0fb96..abcefd8cde78 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -16,7 +16,7 @@
 	     for_each_if (((hwe__) = (gt__)->hw_engines + (id__)) && \
 			  xe_hw_engine_is_valid((hwe__)))
 
-int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt);
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_early(struct xe_gt *gt);
 int xe_gt_init_noalloc(struct xe_gt *gt);
 int xe_gt_init(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index efa2cfc0ea2c..dad5dc984cb5 100644
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
@@ -601,7 +601,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *src,
 				  struct ttm_resource *dst)
 {
-	struct xe_gt *gt = &m->tile->primary_gt;
+	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
@@ -853,7 +853,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
-	struct xe_gt *gt = &m->tile->primary_gt;
+	struct xe_gt *gt = m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
@@ -1128,7 +1128,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
 	struct xe_tile *tile = m->tile;
-	struct xe_gt *gt = &tile->primary_gt;
+	struct xe_gt *gt = tile->primary_gt;
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 888f6b372547..bc0ed2a0e44f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -541,9 +541,12 @@ static int xe_info_init(struct xe_device *xe,
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
index a606cd1a7e3a..60e4a97c78fb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1316,7 +1316,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 
 		/* TLB invalidation must be done before signaling rebind */
 		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
-			int err = invalidation_fence_init(&tile->primary_gt, ifence, fence,
+			int err = invalidation_fence_init(tile->primary_gt, ifence, fence,
 							  vma);
 			if (err) {
 				dma_fence_put(fence);
@@ -1636,7 +1636,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 		int err;
 
 		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(&tile->primary_gt, ifence, fence, vma);
+		err = invalidation_fence_init(tile->primary_gt, ifence, fence, vma);
 		if (err) {
 			dma_fence_put(fence);
 			kfree(ifence);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index efe15841f047..ddf6057a61b9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1203,7 +1203,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
 		for_each_tile(tile, xe, id) {
-			struct xe_gt *gt = &tile->primary_gt;
+			struct xe_gt *gt = tile->primary_gt;
 			struct xe_vm *migrate_vm;
 			struct xe_engine *eng;
 
@@ -3371,7 +3371,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			 * FIXME: We potentially need to invalidate multiple
 			 * GTs within the tile
 			 */
-			seqno[id] = xe_gt_tlb_invalidation_vma(&tile->primary_gt, NULL, vma);
+			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
@@ -3379,7 +3379,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	for_each_tile(tile, xe, id) {
 		if (tile_needs_invalidate & BIT(id)) {
-			ret = xe_gt_tlb_invalidation_wait(&tile->primary_gt, seqno[id]);
+			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.40.0

