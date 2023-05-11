Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782CFC7EE3A
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6E810E5A3;
	Thu, 11 May 2023 03:47:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C71110E592
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776851; x=1715312851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cl5jh7vFvqZaSyuYylDjJvUBgjlaYRyPfgPwc3KGOmI=;
 b=Tlmzg5KiYUsstWcG/qV0xWLhHGjfx6BUr3u1iDBy49361ExW1NPWTlTu
 BmmKkWS6rqgt2HBRkiF44sNtB2KBcJO7BgKBBgDr95nzfemPDcnzQDG+i
 7CqoKtXUEhEvcMZ2K904ZGwg1p0F+OSKTFKDcBL0oxdnKUu6tNY65egei
 WEl/yYT8GGtJ1IiZMWfLOOLg94nWTsXpzP4uocF1ymGqy/2iKVHBbQ4iO
 g9fQick4tcTiTtM/tjo/BPdJvbuqU1zB8IQF6q2figkeXf35hPC/gcTYT
 EhHCnKtMkfb08+xkAVU5GwmqkAsKPLsJ/WiyFsjMvEyOgyCqICsdppdp4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850643"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850643"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203213"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203213"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:08 -0700
Message-Id: <20230511034722.1929038-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 12/26] drm/xe: Allocate GT dynamically
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
---
 drivers/gpu/drm/xe/xe_device.c       |  4 ----
 drivers/gpu/drm/xe/xe_device.h       |  8 ++++++--
 drivers/gpu/drm/xe/xe_device_types.h |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c         |  2 +-
 drivers/gpu/drm/xe/xe_gt.c           | 11 ++++++++---
 drivers/gpu/drm/xe/xe_gt.h           |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c      | 12 ++++++------
 drivers/gpu/drm/xe/xe_pci.c          |  7 +++++--
 drivers/gpu/drm/xe/xe_pt.c           |  4 ++--
 drivers/gpu/drm/xe/xe_vm.c           |  6 +++---
 10 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c93c8895862f..b6fecee68cc6 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -254,10 +254,6 @@ int xe_device_probe(struct xe_device *xe)
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
index fc2655484dfd..370b9ccb875b 100644
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
 
@@ -75,7 +79,7 @@ static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
  */
 static inline struct xe_gt *xe_primary_mmio_gt(struct xe_device *xe)
 {
-	return &xe_device_get_root_tile(xe)->primary_gt;
+	return xe_device_get_root_tile(xe)->primary_gt;
 }
 
 static inline bool xe_device_guc_submission_enabled(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index fa76750a9a5f..1033f233f6ab 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -79,7 +79,7 @@ struct xe_tile {
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
index 297ee32ad928..20663cd0ddaf 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -42,13 +42,18 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
+struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
 {
-	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
+	struct xe_gt *gt;
 
+	gt = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*gt), GFP_KERNEL);
+	if (IS_ERR(gt))
+		return ERR_CAST(gt);
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
index c3a37109bc64..8a4fd80a7fde 100644
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
index bfdc9563e54f..7d5e65d34f39 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -517,9 +517,12 @@ static int xe_info_init(struct xe_device *xe,
 		tile->xe = xe;
 		tile->id = id;
 
-		gt = &tile->primary_gt;
+		tile->primary_gt = xe_gt_alloc(tile);
+		if (IS_ERR(tile->primary_gt))
+			return PTR_ERR(tile->primary_gt);
+
+		gt = tile->primary_gt;
 		gt->info.id = id;
-		gt->tile = tile;
 
 		gt->info.id = id;	/* FIXME: Determine sensible numbering */
 		gt->info.type = XE_GT_TYPE_MAIN;
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
index 6beb73b40dca..cbbc809ae4e4 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1200,7 +1200,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
 		for_each_tile(tile, xe, id) {
-			struct xe_gt *gt = &tile->primary_gt;
+			struct xe_gt *gt = tile->primary_gt;
 			struct xe_vm *migrate_vm;
 			struct xe_engine *eng;
 
@@ -3368,7 +3368,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 			 * FIXME: We potentially need to invalidate multiple
 			 * GTs within the tile
 			 */
-			seqno[id] = xe_gt_tlb_invalidation_vma(&tile->primary_gt, NULL, vma);
+			seqno[id] = xe_gt_tlb_invalidation_vma(tile->primary_gt, NULL, vma);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
@@ -3376,7 +3376,7 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 
 	for_each_tile(tile, xe, id) {
 		if (tile_needs_invalidate & BIT(id)) {
-			ret = xe_gt_tlb_invalidation_wait(&tile->primary_gt, seqno[id]);
+			ret = xe_gt_tlb_invalidation_wait(tile->primary_gt, seqno[id]);
 			if (ret < 0)
 				return ret;
 		}
-- 
2.40.0

