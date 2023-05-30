Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A157FC7EE2F
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 21:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840FB10E42A;
	Tue, 30 May 2023 21:16:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE5210E439
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685481368; x=1717017368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sSIvyOr7dpjxFRZPFR9kM5aPuMmco1fG4QroC/ms+FI=;
 b=V3UVvikfTRyTxEiUeLGFsPnPsy3E0+VzYL0bk4f7Cl5orJwvs5SxhGss
 lR6QetESqLHUv6KiIpImHisrUdV8pGHdwDPGAvNy2YG42IbGMjtR03bvL
 fdZXP3LdcGhywd71YVXyN8Aezzm/rG1QJ4A5FpfbxWUROFcVVq926m0D0
 lcy42KWHe4Qc3MtDLp1CWlIGbfIdzKN4+YBEk4X4/GSZyjK/ETbpp602W
 KFR20MnfdWzudAxq9CATrzAQnxT6LzZLJgwLt8TN2us9sIu14AaWNl82o
 n2lxbsid/ac7jDXh2ThKA8ycaRpkBhCbZzxEChPwpI452gMglzVQm3+YK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="383311946"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="383311946"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684139428"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="684139428"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 14:16:08 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 30 May 2023 14:15:32 -0700
Message-Id: <20230530211549.2632538-15-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530211549.2632538-1-matthew.d.roper@intel.com>
References: <20230530211549.2632538-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 14/31] drm/xe: Move migration from GT to tile
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

Migration primarily focuses on the memory associated with a tile, so it
makes more sense to track this at the tile level (especially since the
driver was already skipping migration operations on media GTs).

Note that the blitter engine used to perform the migration always lives
in the tile's primary GT today.  In theory that could change if media
GTs ever start including blitter engines in the future, but we can
extend the design if/when that happens in the future.

v2:
 - Fix kunit test build
 - Kerneldoc parameter name update

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c | 25 ++++++-----
 drivers/gpu/drm/xe/xe_bo.c            |  6 +--
 drivers/gpu/drm/xe/xe_bo_evict.c      | 14 +++---
 drivers/gpu/drm/xe/xe_device_types.h  |  3 ++
 drivers/gpu/drm/xe/xe_engine.c        |  2 +-
 drivers/gpu/drm/xe/xe_gt.c            | 27 +++---------
 drivers/gpu/drm/xe/xe_gt.h            |  1 -
 drivers/gpu/drm/xe/xe_gt_pagefault.c  |  2 +-
 drivers/gpu/drm/xe/xe_gt_types.h      |  3 --
 drivers/gpu/drm/xe/xe_migrate.c       | 61 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_migrate.h       |  4 +-
 drivers/gpu/drm/xe/xe_pt.c            |  4 +-
 drivers/gpu/drm/xe/xe_tile.c          | 10 ++++-
 drivers/gpu/drm/xe/xe_tile.h          |  2 +
 drivers/gpu/drm/xe/xe_vm.c            |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h      |  2 +-
 17 files changed, 82 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index f933e5df6c12..5309204d8d1b 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -35,7 +35,7 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
 
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
-		fence = xe_migrate_clear(gt->migrate, bo, bo->ttm.resource);
+		fence = xe_migrate_clear(gt_to_tile(gt)->migrate, bo, bo->ttm.resource);
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
@@ -174,7 +174,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 	struct xe_bo *bo, *external;
 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
 		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
-	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->primary_gt.migrate);
+	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
 	struct ww_acquire_ctx ww;
 	int err, i;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 85ef9bacfe52..d9f1f31c92d2 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -101,14 +101,14 @@ static const struct xe_migrate_pt_update_ops sanity_ops = {
 static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 		      struct kunit *test)
 {
-	struct xe_device *xe = gt_to_xe(m->gt);
+	struct xe_device *xe = tile_to_xe(m->tile);
 	u64 retval, expected = 0;
 	bool big = bo->size >= SZ_2M;
 	struct dma_fence *fence;
 	const char *str = big ? "Copying big bo" : "Copying small bo";
 	int err;
 
-	struct xe_bo *sysmem = xe_bo_create_locked(xe, gt_to_tile(m->gt), NULL,
+	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
 						   bo->size,
 						   ttm_bo_type_kernel,
 						   XE_BO_CREATE_SYSTEM_BIT);
@@ -189,7 +189,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
 			   struct kunit *test, bool force_gpu)
 {
-	struct xe_device *xe = gt_to_xe(m->gt);
+	struct xe_device *xe = tile_to_xe(m->tile);
 	struct dma_fence *fence;
 	u64 retval, expected;
 	ktime_t then, now;
@@ -239,16 +239,15 @@ static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
 
 static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 {
-	struct xe_gt *gt = m->gt;
-	struct xe_tile *tile = gt_to_tile(m->gt);
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = m->tile;
+	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_bo *pt, *bo = m->pt_bo, *big, *tiny;
 	struct xe_res_cursor src_it;
 	struct dma_fence *fence;
 	u64 retval, expected;
 	struct xe_bb *bb;
 	int err;
-	u8 id = gt->info.id;
+	u8 id = tile->id;
 
 	err = xe_bo_vmap(bo);
 	if (err) {
@@ -287,7 +286,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		goto free_pt;
 	}
 
-	bb = xe_bb_new(gt, 32, xe->info.supports_usm);
+	bb = xe_bb_new(&tile->primary_gt, 32, xe->info.supports_usm);
 	if (IS_ERR(bb)) {
 		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
 			   PTR_ERR(bb));
@@ -324,7 +323,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	xe_map_wr(xe, &pt->vmap, 0, u32, 0xdeaddead);
 	expected = 0;
 
-	emit_clear(m->gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
+	emit_clear(&tile->primary_gt, bb, xe_migrate_vm_addr(NUM_KERNEL_PDE - 1, 0), 4, 4,
 		   IS_DGFX(xe));
 	run_sanity_job(m, xe, bb, 1, "Writing to our newly mapped pagetable",
 		       test);
@@ -391,14 +390,14 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 static int migrate_test_run_device(struct xe_device *xe)
 {
 	struct kunit *test = xe_cur_kunit();
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	int id;
 
-	for_each_gt(gt, xe, id) {
-		struct xe_migrate *m = gt->migrate;
+	for_each_tile(tile, xe, id) {
+		struct xe_migrate *m = tile->migrate;
 		struct ww_acquire_ctx ww;
 
-		kunit_info(test, "Testing gt id %d.\n", id);
+		kunit_info(test, "Testing tile id %d.\n", id);
 		xe_vm_lock(m->eng->vm, &ww, 0, true);
 		xe_device_mem_access_get(xe);
 		xe_migrate_sanity_test(m, test);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 311fd83f1929..b94a80a32d86 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -643,7 +643,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		tile = mem_type_to_tile(xe, old_mem->mem_type);
 
 	XE_BUG_ON(!tile);
-	XE_BUG_ON(!tile->primary_gt.migrate);
+	XE_BUG_ON(!tile->migrate);
 
 	trace_xe_bo_move(bo);
 	xe_device_mem_access_get(xe);
@@ -681,9 +681,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		}
 	} else {
 		if (move_lacks_source)
-			fence = xe_migrate_clear(tile->primary_gt.migrate, bo, new_mem);
+			fence = xe_migrate_clear(tile->migrate, bo, new_mem);
 		else
-			fence = xe_migrate_copy(tile->primary_gt.migrate,
+			fence = xe_migrate_copy(tile->migrate,
 						bo, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 9226195bd560..f559a7f3eb3e 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -8,7 +8,7 @@
 #include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
-#include "xe_gt.h"
+#include "xe_tile.h"
 
 /**
  * xe_bo_evict_all - evict all BOs from VRAM
@@ -29,7 +29,7 @@ int xe_bo_evict_all(struct xe_device *xe)
 	struct ttm_device *bdev = &xe->ttm;
 	struct ww_acquire_ctx ww;
 	struct xe_bo *bo;
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	struct list_head still_in_list;
 	u32 mem_type;
 	u8 id;
@@ -83,8 +83,8 @@ int xe_bo_evict_all(struct xe_device *xe)
 	 * Wait for all user BO to be evicted as those evictions depend on the
 	 * memory moved below.
 	 */
-	for_each_gt(gt, xe, id)
-		xe_gt_migrate_wait(gt);
+	for_each_tile(tile, xe, id)
+		xe_tile_migrate_wait(tile);
 
 	spin_lock(&xe->pinned.lock);
 	for (;;) {
@@ -186,7 +186,7 @@ int xe_bo_restore_user(struct xe_device *xe)
 {
 	struct ww_acquire_ctx ww;
 	struct xe_bo *bo;
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	struct list_head still_in_list;
 	u8 id;
 	int ret;
@@ -224,8 +224,8 @@ int xe_bo_restore_user(struct xe_device *xe)
 	spin_unlock(&xe->pinned.lock);
 
 	/* Wait for validate to complete */
-	for_each_gt(gt, xe, id)
-		xe_gt_migrate_wait(gt);
+	for_each_tile(tile, xe, id)
+		xe_tile_migrate_wait(tile);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index f25165c2e983..11042e565208 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -142,6 +142,9 @@ struct xe_tile {
 		 */
 		struct xe_sa_manager *kernel_bb_pool;
 	} mem;
+
+	/** @migrate: Migration helper for vram blits and clearing */
+	struct xe_migrate *migrate;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index 1a9082db8f1b..b3036c4a8ec3 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -560,7 +560,7 @@ int xe_engine_create_ioctl(struct drm_device *dev, void *data,
 			if (XE_IOCTL_ERR(xe, !hwe))
 				return -EINVAL;
 
-			migrate_vm = xe_migrate_get_vm(gt->migrate);
+			migrate_vm = xe_migrate_get_vm(gt_to_tile(gt)->migrate);
 			new = xe_engine_create(xe, migrate_vm, logical_mask,
 					       args->width, hwe,
 					       ENGINE_FLAG_PERSISTENT |
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 74023a5dc8b2..aa047db4c937 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -43,15 +43,6 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
-struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
-{
-	/*
-	 * FIXME: Once the code is prepared for re-enabling, this function will
-	 * be gone. Just return the only possible gt for now.
-	 */
-	return gt;
-}
-
 int xe_gt_alloc(struct xe_device *xe, struct xe_gt *gt)
 {
 	XE_BUG_ON(gt->info.type == XE_GT_TYPE_UNINITIALIZED);
@@ -169,6 +160,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 int xe_gt_record_default_lrcs(struct xe_gt *gt)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_hw_engine *hwe;
 	enum xe_hw_engine_id id;
 	int err = 0;
@@ -192,7 +184,7 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
 		if (!default_lrc)
 			return -ENOMEM;
 
-		vm = xe_migrate_get_vm(gt->migrate);
+		vm = xe_migrate_get_vm(tile->migrate);
 		e = xe_engine_create(xe, vm, BIT(hwe->logical_instance), 1,
 				     hwe, ENGINE_FLAG_WA);
 		if (IS_ERR(e)) {
@@ -383,13 +375,13 @@ static int all_fw_domain_init(struct xe_gt *gt)
 	}
 
 	if (!xe_gt_is_media_type(gt)) {
-		gt->migrate = xe_migrate_init(gt);
-		if (IS_ERR(gt->migrate)) {
-			err = PTR_ERR(gt->migrate);
+		struct xe_tile *tile = gt_to_tile(gt);
+
+		tile->migrate = xe_migrate_init(tile);
+		if (IS_ERR(tile->migrate)) {
+			err = PTR_ERR(tile->migrate);
 			goto err_force_wake;
 		}
-	} else {
-		gt->migrate = xe_find_full_gt(gt)->migrate;
 	}
 
 	err = xe_uc_init_hw(&gt->uc);
@@ -644,11 +636,6 @@ int xe_gt_resume(struct xe_gt *gt)
 	return err;
 }
 
-void xe_gt_migrate_wait(struct xe_gt *gt)
-{
-	xe_migrate_wait(gt->migrate);
-}
-
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance, bool logical)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index f4e98f499b36..c8abbeb0fb96 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -25,7 +25,6 @@ void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
-void xe_gt_migrate_wait(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
 struct xe_gt *xe_find_full_gt(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 1c2b23ae89cf..73db7f7c0381 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -208,7 +208,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	fence = __xe_pt_bind_vma(tile, vma, xe_gt_migrate_engine(gt), NULL, 0,
+	fence = __xe_pt_bind_vma(tile, vma, xe_tile_migrate_engine(tile), NULL, 0,
 				 vma->tile_present & BIT(tile->id));
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index c44560b6dc71..34d5dd98885e 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -278,9 +278,6 @@ struct xe_gt {
 	/** @hw_engines: hardware engines on the GT */
 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
 
-	/** @migrate: Migration helper for vram blits and clearing */
-	struct xe_migrate *migrate;
-
 	/** @pcode: GT's PCODE */
 	struct {
 		/** @lock: protecting GT's PCODE mailbox data */
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 9de7bdeee85c..ca6f3e6c2e9e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -36,8 +36,8 @@
 struct xe_migrate {
 	/** @eng: Default engine used for migration */
 	struct xe_engine *eng;
-	/** @gt: Backpointer to the gt this struct xe_migrate belongs to. */
-	struct xe_gt *gt;
+	/** @tile: Backpointer to the tile this struct xe_migrate belongs to. */
+	struct xe_tile *tile;
 	/** @job_mutex: Timeline mutex for @eng. */
 	struct mutex job_mutex;
 	/** @pt_bo: Page-table buffer object. */
@@ -70,17 +70,17 @@ struct xe_migrate {
 #define NUM_PT_PER_BLIT (MAX_PREEMPTDISABLE_TRANSFER / SZ_2M)
 
 /**
- * xe_gt_migrate_engine() - Get this gt's migrate engine.
- * @gt: The gt.
+ * xe_tile_migrate_engine() - Get this tile's migrate engine.
+ * @tile: The tile.
  *
- * Returns the default migrate engine of this gt.
+ * Returns the default migrate engine of this tile.
  * TODO: Perhaps this function is slightly misplaced, and even unneeded?
  *
  * Return: The default migrate engine
  */
-struct xe_engine *xe_gt_migrate_engine(struct xe_gt *gt)
+struct xe_engine *xe_tile_migrate_engine(struct xe_tile *tile)
 {
-	return gt->migrate->eng;
+	return tile->migrate->eng;
 }
 
 static void xe_migrate_fini(struct drm_device *dev, void *arg)
@@ -128,8 +128,7 @@ static u64 xe_migrate_vram_ofs(u64 addr)
  */
 static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 {
-	struct xe_gt *gt = m->gt;
-	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_tile *tile = m->tile;
 	struct xe_device *xe = vm->xe;
 	size_t cleared_size;
 	u64 vram_addr;
@@ -155,14 +154,13 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 	return 0;
 }
 
-static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
+static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 				 struct xe_vm *vm)
 {
-	u8 id = gt->info.id;
+	struct xe_device *xe = tile_to_xe(tile);
+	u8 id = tile->id;
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 	u32 map_ofs, level, i;
-	struct xe_device *xe = gt_to_xe(m->gt);
-	struct xe_tile *tile = gt_to_tile(m->gt);
 	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
 	u64 entry;
 	int ret;
@@ -231,7 +229,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
 
 		if (xe->info.supports_usm) {
-			batch = gt->usm.bb_pool->bo;
+			batch = tile->primary_gt.usm.bb_pool->bo;
 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE,
 						&is_vram);
 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
@@ -308,34 +306,33 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 
 /**
  * xe_migrate_init() - Initialize a migrate context
- * @gt: Back-pointer to the gt we're initializing for.
+ * @tile: Back-pointer to the tile we're initializing for.
  *
  * Return: Pointer to a migrate context on success. Error pointer on error.
  */
-struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
+struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 {
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_gt *primary_gt = &tile->primary_gt;
 	struct xe_migrate *m;
 	struct xe_vm *vm;
 	struct ww_acquire_ctx ww;
 	int err;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
-
 	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
 	if (!m)
 		return ERR_PTR(-ENOMEM);
 
-	m->gt = gt;
+	m->tile = tile;
 
 	/* Special layout, prepared below.. */
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
-			  XE_VM_FLAG_SET_GT_ID(gt));
+			  XE_VM_FLAG_SET_TILE_ID(tile));
 	if (IS_ERR(vm))
 		return ERR_CAST(vm);
 
 	xe_vm_lock(vm, &ww, 0, false);
-	err = xe_migrate_prepare_vm(gt, m, vm);
+	err = xe_migrate_prepare_vm(tile, m, vm);
 	xe_vm_unlock(vm, &ww);
 	if (err) {
 		xe_vm_close_and_put(vm);
@@ -343,9 +340,9 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
 	}
 
 	if (xe->info.supports_usm) {
-		struct xe_hw_engine *hwe = xe_gt_hw_engine(gt,
+		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
 							   XE_ENGINE_CLASS_COPY,
-							   gt->usm.reserved_bcs_instance,
+							   primary_gt->usm.reserved_bcs_instance,
 							   false);
 		if (!hwe)
 			return ERR_PTR(-EINVAL);
@@ -354,7 +351,7 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
 					  BIT(hwe->logical_instance), 1,
 					  hwe, ENGINE_FLAG_KERNEL);
 	} else {
-		m->eng = xe_engine_create_class(xe, gt, vm,
+		m->eng = xe_engine_create_class(xe, primary_gt, vm,
 						XE_ENGINE_CLASS_COPY,
 						ENGINE_FLAG_KERNEL);
 	}
@@ -549,7 +546,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 			       u64 dst_ofs, bool dst_is_vram, u32 dst_size,
 			       u64 ccs_ofs, bool copy_ccs)
 {
-	struct xe_gt *gt = m->gt;
+	struct xe_gt *gt = &m->tile->primary_gt;
 	u32 flush_flags = 0;
 
 	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
@@ -613,7 +610,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct ttm_resource *src,
 				  struct ttm_resource *dst)
 {
-	struct xe_gt *gt = m->gt;
+	struct xe_gt *gt = &m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
 	u64 size = src_bo->size;
@@ -876,7 +873,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 				   struct ttm_resource *dst)
 {
 	bool clear_vram = mem_type_is_vram(dst->mem_type);
-	struct xe_gt *gt = m->gt;
+	struct xe_gt *gt = &m->tile->primary_gt;
 	struct xe_device *xe = gt_to_xe(gt);
 	struct dma_fence *fence = NULL;
 	u64 size = bo->size;
@@ -1083,7 +1080,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	for (i = 0; i < num_updates; i++) {
 		const struct xe_vm_pgtable_update *update = &updates[i];
 
-		ops->populate(pt_update, gt_to_tile(m->gt), &update->pt_bo->vmap, NULL,
+		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
 			      update->ofs, update->qwords, update);
 	}
 
@@ -1150,9 +1147,9 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 			   struct xe_migrate_pt_update *pt_update)
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
-	struct xe_gt *gt = m->gt;
-	struct xe_tile *tile = gt_to_tile(m->gt);
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = m->tile;
+	struct xe_gt *gt = &tile->primary_gt;
+	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
 	struct drm_suballoc *sa_bo = NULL;
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index e627f4023d5a..204337ea3b4e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -71,7 +71,7 @@ struct xe_migrate_pt_update {
 	struct xe_vma *vma;
 };
 
-struct xe_migrate *xe_migrate_init(struct xe_gt *gt);
+struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
 
 struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 				  struct xe_bo *src_bo,
@@ -97,5 +97,5 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 
 void xe_migrate_wait(struct xe_migrate *m);
 
-struct xe_engine *xe_gt_migrate_engine(struct xe_gt *gt);
+struct xe_engine *xe_tile_migrate_engine(struct xe_tile *tile);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 094058cb5f93..41b2be028b8a 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1303,7 +1303,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 			return ERR_PTR(-ENOMEM);
 	}
 
-	fence = xe_migrate_update_pgtables(tile->primary_gt.migrate,
+	fence = xe_migrate_update_pgtables(tile->migrate,
 					   vm, vma->bo,
 					   e ? e : vm->eng[tile->id],
 					   entries, num_entries,
@@ -1624,7 +1624,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	 * clear again here. The eviction may have updated pagetables at a
 	 * lower level, because it needs to be more conservative.
 	 */
-	fence = xe_migrate_update_pgtables(tile->primary_gt.migrate,
+	fence = xe_migrate_update_pgtables(tile->migrate,
 					   vm, NULL, e ? e :
 					   vm->eng[tile->id],
 					   entries, num_entries,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 59d3e25ea550..908eec5c17d9 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include "xe_device.h"
 #include "xe_ggtt.h"
+#include "xe_migrate.h"
 #include "xe_sa.h"
 #include "xe_tile.h"
 #include "xe_ttm_vram_mgr.h"
@@ -81,10 +82,17 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 		goto err_mem_access;
 
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
-	if (IS_ERR(tile->mem.kernel_bb_pool))
+	if (IS_ERR(tile->mem.kernel_bb_pool)) {
 		err = PTR_ERR(tile->mem.kernel_bb_pool);
+		goto err_mem_access;
+	}
 
 err_mem_access:
 	xe_device_mem_access_put(tile_to_xe(tile));
 	return err;
 }
+
+void xe_tile_migrate_wait(struct xe_tile *tile)
+{
+	xe_migrate_wait(tile->migrate);
+}
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index 77529ea136a6..33bf41292195 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -11,4 +11,6 @@ struct xe_tile;
 int xe_tile_alloc(struct xe_tile *tile);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 
+void xe_tile_migrate_wait(struct xe_tile *tile);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 803ed7b9ba88..c47680ad4920 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1267,7 +1267,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 			if (!vm->pt_root[id])
 				continue;
 
-			migrate_vm = xe_migrate_get_vm(gt->migrate);
+			migrate_vm = xe_migrate_get_vm(tile->migrate);
 			eng = xe_engine_create_class(xe, gt, migrate_vm,
 						     XE_ENGINE_CLASS_COPY,
 						     ENGINE_FLAG_VM);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index c45c5daeeaa7..76af6ac0fa84 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -179,7 +179,7 @@ struct xe_vm {
 #define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
 #define XE_VM_FLAG_FAULT_MODE		BIT(5)
 #define XE_VM_FLAG_GT_ID(flags)		(((flags) >> 6) & 0x3)
-#define XE_VM_FLAG_SET_GT_ID(gt)	((gt)->info.id << 6)
+#define XE_VM_FLAG_SET_TILE_ID(tile)	((tile)->id << 6)
 	unsigned long flags;
 
 	/** @composite_fence_ctx: context composite fence */
-- 
2.40.1

