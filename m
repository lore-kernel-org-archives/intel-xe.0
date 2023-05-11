Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F45DC8300C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 03:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3DE10E5A9;
	Thu, 11 May 2023 03:47:37 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F5010E592
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 03:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683776850; x=1715312850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U7qjwR2Akqfc9/p3rdZavWZPKXD5MTzFWI65Uc1wiJQ=;
 b=ggarLCLfmCxu2Ur+1+Gnc6VgnfLuJpEJFHoCjOANqNk47QJsCVv4hG8H
 WMjPCSumzycMPYZrgxKYglp0KdDPOSWP3G7f9mTj7QjMiTmAF0e1qF19w
 W9eVhbEhhipB3XBQohBVK4k+4T185/NfNeQZTanyzu6eoncDV/waGxw9g
 P0LA9XLSBp7aPUCfjNstSNus9gc3wdQxP/tmKd6vvLEJUvFewYgikzYrN
 ZAsVcz9RSvG+Nqj2tS/oIP39eYMe3XYSf2gGebBmqbN0HKcXOb+ew9Cfm
 ZiPmDRbI/VQS0M+YGnxqC11ytKGAhSS4YGTqu/uLKWZacZIZjd0XBQ11H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="347850636"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="347850636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="789203197"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="789203197"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 20:47:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 10 May 2023 20:47:03 -0700
Message-Id: <20230511034722.1929038-8-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511034722.1929038-1-matthew.d.roper@intel.com>
References: <20230511034722.1929038-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 07/26] drm/xe: Memory allocations are tile-based,
 not GT-based
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

Since memory and address spaces are a tile concept rather than a GT
concept, we need to plumb tile-based handling through lots of
memory-related code.

Note that one remaining shortcoming here that will need to be addressed
before media GT support can be re-enabled is that although the address
space is shared between a tile's GTs, each GT caches the PTEs
independently in their own TLB and thus TLB invalidation should be
handled at the GT level.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsb.c      |   5 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |   3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   7 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   7 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/tests/xe_bo.c              |   2 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c         |  15 +-
 drivers/gpu/drm/xe/xe_bb.c                    |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  66 ++++----
 drivers/gpu/drm/xe/xe_bo.h                    |  18 +--
 drivers/gpu/drm/xe/xe_bo_evict.c              |   2 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   4 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   7 +
 drivers/gpu/drm/xe/xe_ggtt.c                  |   5 +-
 drivers/gpu/drm/xe/xe_gt.c                    |  21 +--
 drivers/gpu/drm/xe/xe_gt_debugfs.c            |   6 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  10 +-
 drivers/gpu/drm/xe/xe_gt_types.h              |   7 -
 drivers/gpu/drm/xe/xe_guc_ads.c               |   5 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                |   5 +-
 drivers/gpu/drm/xe/xe_guc_hwconfig.c          |   5 +-
 drivers/gpu/drm/xe/xe_guc_log.c               |   6 +-
 drivers/gpu/drm/xe/xe_guc_pc.c                |   5 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             |   5 +-
 drivers/gpu/drm/xe/xe_lrc.c                   |  13 +-
 drivers/gpu/drm/xe/xe_lrc_types.h             |   4 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  23 +--
 drivers/gpu/drm/xe/xe_migrate.h               |   5 +-
 drivers/gpu/drm/xe/xe_pt.c                    | 146 ++++++++---------
 drivers/gpu/drm/xe/xe_pt.h                    |  14 +-
 drivers/gpu/drm/xe/xe_sa.c                    |  13 +-
 drivers/gpu/drm/xe/xe_sa.h                    |   4 +-
 drivers/gpu/drm/xe/xe_tile.c                  |   7 +
 drivers/gpu/drm/xe/xe_uc_fw.c                 |   5 +-
 drivers/gpu/drm/xe/xe_vm.c                    | 152 +++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                    |   2 +-
 drivers/gpu/drm/xe/xe_vm_types.h              |  12 +-
 include/uapi/drm/xe_drm.h                     |   4 +-
 38 files changed, 307 insertions(+), 318 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsb.c b/drivers/gpu/drm/i915/display/intel_dsb.c
index 7c93580282b4..3830309aacf4 100644
--- a/drivers/gpu/drm/i915/display/intel_dsb.c
+++ b/drivers/gpu/drm/i915/display/intel_dsb.c
@@ -379,9 +379,10 @@ struct intel_dsb *intel_dsb_prepare(struct intel_crtc *crtc,
 #else
 	/* ~1 qword per instruction, full cachelines */
 	size = ALIGN(max_cmds * 8, 64);
-	obj = xe_bo_create_pin_map(i915, to_gt(i915), NULL, PAGE_ALIGN(size),
+	obj = xe_bo_create_pin_map(i915, xe_device_get_root_tile(i915),
+				   NULL, PAGE_ALIGN(size),
 				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(to_gt(i915)) |
+				   XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(i915)) |
 				   XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(obj)) {
 		kfree(dsb);
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 9dc7083fe974..0e8e899f596b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -71,7 +71,8 @@ static int i915_gem_stolen_insert_node_in_range(struct xe_device *xe, struct xe_
 	int err;
 	u32 flags = XE_BO_CREATE_PINNED_BIT | XE_BO_CREATE_STOLEN_BIT;
 
-	*bo = xe_bo_create_locked_range(xe, to_gt(xe), NULL, size, start, end,
+	*bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
+					NULL, size, start, end,
 					ttm_bo_type_kernel, flags);
 	if (IS_ERR(*bo)) {
 		err = PTR_ERR(*bo);
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 6362c4ce15b6..814b89b99718 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -205,7 +205,8 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 	}
 #else
 	if (!IS_DGFX(dev_priv)) {
-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv),
+					   NULL, size,
 					   ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
 					   XE_BO_CREATE_STOLEN_BIT |
 					   XE_BO_CREATE_PINNED_BIT);
@@ -215,9 +216,9 @@ static int intelfb_alloc(struct drm_fb_helper *helper,
 			drm_info(&dev_priv->drm, "Allocated fbdev into stolen failed: %li\n", PTR_ERR(obj));
 	}
 	if (IS_ERR(obj)) {
-		obj = xe_bo_create_pin_map(dev_priv, to_gt(dev_priv), NULL, size,
+		obj = xe_bo_create_pin_map(dev_priv, xe_device_get_root_tile(dev_priv), NULL, size,
 					  ttm_bo_type_kernel, XE_BO_SCANOUT_BIT |
-					  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(dev_priv)) |
+					  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(dev_priv)) |
 					  XE_BO_CREATE_PINNED_BIT);
 	}
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 78ac58244f24..e5999a01daa1 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -45,6 +45,7 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 			       struct i915_vma *vma)
 {
 	struct xe_device *xe = to_xe_device(fb->base.dev);
+	struct xe_tile *tile0 = xe_device_get_root_tile(xe);
 	struct xe_bo *bo = intel_fb_obj(&fb->base), *dpt;
 	u32 dpt_size, size = bo->ttm.base.size;
 
@@ -55,17 +56,17 @@ static int __xe_pin_fb_vma_dpt(struct intel_framebuffer *fb,
 		dpt_size = ALIGN(intel_rotation_info_size(&view->rotated) * 8,
 				 XE_PAGE_SIZE);
 
-	dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+	dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_VRAM0_BIT |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_STOLEN_BIT |
 					   XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(dpt))
-		dpt = xe_bo_create_pin_map(xe, to_gt(xe), NULL, dpt_size,
+		dpt = xe_bo_create_pin_map(xe, tile0, NULL, dpt_size,
 					   ttm_bo_type_kernel,
 					   XE_BO_CREATE_SYSTEM_BIT |
 					   XE_BO_CREATE_GGTT_BIT);
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index 556ede2e459e..5e43ae9f9c4b 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -115,7 +115,7 @@ initial_plane_bo(struct xe_device *xe,
 			page_size);
 	size -= base;
 
-	bo = xe_bo_create_pin_map_at(xe, &tile0->primary_gt, NULL, size, phys_base,
+	bo = xe_bo_create_pin_map_at(xe, tile0, NULL, size, phys_base,
 				     ttm_bo_type_kernel, flags);
 	if (IS_ERR(bo)) {
 		drm_dbg(&xe->drm,
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9bd381e5b7a6..bee5a2031153 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -173,7 +173,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 {
 	struct xe_bo *bo, *external;
 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
-		XE_BO_CREATE_VRAM_IF_DGFX(gt);
+		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
 	struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
 	struct ww_acquire_ctx ww;
 	int err, i;
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0f4371ad1fd9..fe8331f116c2 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -240,6 +240,7 @@ static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
 static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 {
 	struct xe_gt *gt = m->gt;
+	struct xe_tile *tile = gt_to_tile(m->gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *pt, *bo = m->pt_bo, *big, *tiny;
 	struct xe_res_cursor src_it;
@@ -256,18 +257,18 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		return;
 	}
 
-	big = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, SZ_4M,
+	big = xe_bo_create_pin_map(xe, tile, m->eng->vm, SZ_4M,
 				   ttm_bo_type_kernel,
-				   XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
+				   XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				   XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(big)) {
 		KUNIT_FAIL(test, "Failed to allocate bo: %li\n", PTR_ERR(big));
 		goto vunmap;
 	}
 
-	pt = xe_bo_create_pin_map(xe, m->gt, m->eng->vm, XE_PAGE_SIZE,
+	pt = xe_bo_create_pin_map(xe, tile, m->eng->vm, XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(pt)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
@@ -275,10 +276,10 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		goto free_big;
 	}
 
-	tiny = xe_bo_create_pin_map(xe, m->gt, m->eng->vm,
+	tiny = xe_bo_create_pin_map(xe, tile, m->eng->vm,
 				    2 * SZ_4K,
 				    ttm_bo_type_kernel,
-				    XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
+				    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				    XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(tiny)) {
 		KUNIT_FAIL(test, "Failed to allocate fake pt: %li\n",
@@ -286,7 +287,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 		goto free_pt;
 	}
 
-	bb = xe_bb_new(m->gt, 32, xe->info.supports_usm);
+	bb = xe_bb_new(gt, 32, xe->info.supports_usm);
 	if (IS_ERR(bb)) {
 		KUNIT_FAIL(test, "Failed to create batchbuffer: %li\n",
 			   PTR_ERR(bb));
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index bf7c94b769d7..f9b6b7adf99f 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -30,6 +30,7 @@ static int bb_prefetch(struct xe_gt *gt)
 
 struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 {
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
 	int err;
 
@@ -42,7 +43,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
 	 * space to accomodate the platform-specific hardware prefetch
 	 * requirements.
 	 */
-	bb->bo = xe_sa_bo_new(!usm ? gt->kernel_bb_pool : gt->usm.bb_pool,
+	bb->bo = xe_sa_bo_new(!usm ? tile->mem.kernel_bb_pool : gt->usm.bb_pool,
 			      4 * (dwords + 1) + bb_prefetch(gt));
 	if (IS_ERR(bb->bo)) {
 		err = PTR_ERR(bb->bo);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 5dbca5bbca8f..9d613fc5d309 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -452,7 +452,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 			}
 
 			xe_vm_assert_held(vm);
-			if (list_empty(&vma->rebind_link) && vma->gt_present)
+			if (list_empty(&vma->rebind_link) && vma->tile_present)
 				list_add_tail(&vma->rebind_link, &vm->rebind_list);
 
 			if (vm_resv_locked)
@@ -559,7 +559,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct ttm_resource *old_mem = ttm_bo->resource;
 	struct ttm_tt *ttm = ttm_bo->ttm;
-	struct xe_gt *gt = NULL;
+	struct xe_tile *tile = NULL;
 	struct dma_fence *fence;
 	bool move_lacks_source;
 	bool needs_clear;
@@ -629,15 +629,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		goto out;
 	}
 
-	if (bo->gt)
-		gt = bo->gt;
+	if (bo->tile)
+		tile = bo->tile;
 	else if (resource_is_vram(new_mem))
-		gt = &mem_type_to_tile(xe, new_mem->mem_type)->primary_gt;
+		tile = mem_type_to_tile(xe, new_mem->mem_type);
 	else if (resource_is_vram(old_mem))
-		gt = &mem_type_to_tile(xe, old_mem->mem_type)->primary_gt;
+		tile = mem_type_to_tile(xe, old_mem->mem_type);
 
-	XE_BUG_ON(!gt);
-	XE_BUG_ON(!gt->migrate);
+	XE_BUG_ON(!tile);
+	XE_BUG_ON(!tile->primary_gt.migrate);
 
 	trace_xe_bo_move(bo);
 	xe_device_mem_access_get(xe);
@@ -658,7 +658,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 			/* Create a new VMAP once kernel BO back in VRAM */
 			if (!ret && resource_is_vram(new_mem)) {
-				void *new_addr = gt_to_tile(gt)->mem.vram.mapping +
+				void *new_addr = tile->mem.vram.mapping +
 					(new_mem->start << PAGE_SHIFT);
 
 				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
@@ -675,9 +675,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		}
 	} else {
 		if (move_lacks_source)
-			fence = xe_migrate_clear(gt->migrate, bo, new_mem);
+			fence = xe_migrate_clear(tile->primary_gt.migrate, bo, new_mem);
 		else
-			fence = xe_migrate_copy(gt->migrate, bo, old_mem, new_mem);
+			fence = xe_migrate_copy(tile->primary_gt.migrate, bo, old_mem, new_mem);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
 			xe_device_mem_access_put(xe);
@@ -958,7 +958,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 	WARN_ON(!list_empty(&bo->vmas));
 
 	if (bo->ggtt_node.size)
-		xe_ggtt_remove_bo(gt_to_tile(bo->gt)->mem.ggtt, bo);
+		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 	if (bo->vm && xe_bo_is_user(bo))
 		xe_vm_put(bo->vm);
@@ -1080,7 +1080,7 @@ void xe_bo_free(struct xe_bo *bo)
 }
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				    struct xe_gt *gt, struct dma_resv *resv,
+				    struct xe_tile *tile, struct dma_resv *resv,
 				    size_t size, enum ttm_bo_type type,
 				    u32 flags)
 {
@@ -1093,7 +1093,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	XE_BUG_ON(gt && type != ttm_bo_type_kernel);
+	XE_BUG_ON(tile && type != ttm_bo_type_kernel);
 
 	if (XE_WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
@@ -1114,7 +1114,7 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		alignment = SZ_4K >> PAGE_SHIFT;
 	}
 
-	bo->gt = gt;
+	bo->tile = tile;
 	bo->size = size;
 	bo->flags = flags;
 	bo->ttm.base.funcs = &xe_gem_object_funcs;
@@ -1196,7 +1196,7 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
 
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_gt *gt, struct xe_vm *vm,
+			  struct xe_tile *tile, struct xe_vm *vm,
 			  size_t size, u64 start, u64 end,
 			  enum ttm_bo_type type, u32 flags)
 {
@@ -1219,7 +1219,7 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		}
 	}
 
-	bo = __xe_bo_create_locked(xe, bo, gt, vm ? &vm->resv : NULL, size,
+	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL, size,
 				   type, flags);
 	if (IS_ERR(bo))
 		return bo;
@@ -1229,16 +1229,16 @@ xe_bo_create_locked_range(struct xe_device *xe,
 	bo->vm = vm;
 
 	if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
-		if (!gt && flags & XE_BO_CREATE_STOLEN_BIT)
-			gt = xe_device_get_gt(xe, 0);
+		if (!tile && flags & XE_BO_CREATE_STOLEN_BIT)
+			tile = xe_device_get_root_tile(xe);
 
-		XE_BUG_ON(!gt);
+		XE_BUG_ON(!tile);
 
 		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
-			err = xe_ggtt_insert_bo_at(gt_to_tile(gt)->mem.ggtt, bo,
+			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
 						   start + bo->size, U64_MAX);
 		} else {
-			err = xe_ggtt_insert_bo(gt_to_tile(gt)->mem.ggtt, bo);
+			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
 		}
 		if (err)
 			goto err_unlock_put_bo;
@@ -1252,18 +1252,18 @@ xe_bo_create_locked_range(struct xe_device *xe,
 	return ERR_PTR(err);
 }
 
-struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags)
 {
-	return xe_bo_create_locked_range(xe, gt, vm, size, 0, ~0ULL, type, flags);
+	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
 }
 
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
 			   struct xe_vm *vm, size_t size,
 			   enum ttm_bo_type type, u32 flags)
 {
-	struct xe_bo *bo = xe_bo_create_locked(xe, gt, vm, size, type, flags);
+	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags);
 
 	if (!IS_ERR(bo))
 		xe_bo_unlock_vm_held(bo);
@@ -1271,7 +1271,7 @@ struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_gt *gt,
 	return bo;
 }
 
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
 				      struct xe_vm *vm,
 				      size_t size, u64 offset,
 				      enum ttm_bo_type type, u32 flags)
@@ -1285,7 +1285,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
-	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
+	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type, flags);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1309,18 +1309,18 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 	return ERR_PTR(err);
 }
 
-struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
 				   enum ttm_bo_type type, u32 flags)
 {
-	return xe_bo_create_pin_map_at(xe, gt, vm, size, ~0ull, type, flags);
+	return xe_bo_create_pin_map_at(xe, tile, vm, size, ~0ull, type, flags);
 }
 
-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 				     const void *data, size_t size,
 				     enum ttm_bo_type type, u32 flags)
 {
-	struct xe_bo *bo = xe_bo_create_pin_map(xe, gt, NULL,
+	struct xe_bo *bo = xe_bo_create_pin_map(xe, tile, NULL,
 						ALIGN(size, PAGE_SIZE),
 						type, flags);
 	if (IS_ERR(bo))
@@ -1949,7 +1949,7 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 			   page_size);
 
 	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
-			  XE_BO_CREATE_VRAM_IF_DGFX(to_gt(xe)) |
+			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
 			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7a79f3893260..ccb0fae2966e 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -21,8 +21,8 @@
 					 XE_BO_CREATE_VRAM1_BIT)
 /* -- */
 #define XE_BO_CREATE_STOLEN_BIT		BIT(4)
-#define XE_BO_CREATE_VRAM_IF_DGFX(gt) \
-	(IS_DGFX(gt_to_xe(gt)) ? XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id : \
+#define XE_BO_CREATE_VRAM_IF_DGFX(tile) \
+	(IS_DGFX(tile_to_xe(tile)) ? XE_BO_CREATE_VRAM0_BIT << (tile)->id : \
 	 XE_BO_CREATE_SYSTEM_BIT)
 #define XE_BO_CREATE_GGTT_BIT		BIT(5)
 #define XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT BIT(6)
@@ -80,27 +80,27 @@ struct xe_bo *xe_bo_alloc(void);
 void xe_bo_free(struct xe_bo *bo);
 
 struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
-				    struct xe_gt *gt, struct dma_resv *resv,
+				    struct xe_tile *tile, struct dma_resv *resv,
 				    size_t size, enum ttm_bo_type type,
 				    u32 flags);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
-			  struct xe_gt *gt, struct xe_vm *vm,
+			  struct xe_tile *tile, struct xe_vm *vm,
 			  size_t size, u64 start, u64 end,
 			  enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
 			   struct xe_vm *vm, size_t size,
 			   enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
 				   enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile,
 				      struct xe_vm *vm, size_t size, u64 offset,
 				      enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
+struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
 				     const void *data, size_t size,
 				     enum ttm_bo_type type, u32 flags);
 
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index a72963c54bf3..9226195bd560 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -149,7 +149,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		}
 
 		if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
-			struct xe_tile *tile = gt_to_tile(bo->gt);
+			struct xe_tile *tile = bo->tile;
 
 			mutex_lock(&tile->mem.ggtt->lock);
 			xe_ggtt_map_bo(tile->mem.ggtt, bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 06de3330211d..f6ee920303af 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -29,8 +29,8 @@ struct xe_bo {
 	u32 flags;
 	/** @vm: VM this BO is attached to, for extobj this will be NULL */
 	struct xe_vm *vm;
-	/** @gt: GT this BO is attached to (kernel BO only) */
-	struct xe_gt *gt;
+	/** @tile: Tile this BO is attached to (kernel BO only) */
+	struct xe_tile *tile;
 	/** @vmas: List of VMAs for this BO */
 	struct list_head vmas;
 	/** @placements: valid placements for this BO */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6b9e7847161c..c6365b6f14ba 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -131,6 +131,13 @@ struct xe_tile {
 
 		/** @ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
+
+		/**
+		 * @kernel_bb_pool: Pool from which batchbuffers are allocated.
+		 *
+		 * Media GT shares a pool with its primary GT.
+		 */
+		struct xe_sa_manager *kernel_bb_pool;
 	} mem;
 };
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 52d293d61cc0..b11f22b68bb8 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -149,7 +149,6 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
-	struct xe_gt *gt = &ggtt->tile->primary_gt;
 	unsigned int flags;
 	int err;
 
@@ -162,9 +161,9 @@ int xe_ggtt_init(struct xe_ggtt *ggtt)
 	if (ggtt->flags & XE_GGTT_FLAGS_64K)
 		flags |= XE_BO_CREATE_SYSTEM_BIT;
 	else
-		flags |= XE_BO_CREATE_VRAM_IF_DGFX(gt);
+		flags |= XE_BO_CREATE_VRAM_IF_DGFX(ggtt->tile);
 
-	ggtt->scratch = xe_bo_create_pin_map(xe, gt, NULL, XE_PAGE_SIZE,
+	ggtt->scratch = xe_bo_create_pin_map(xe, ggtt->tile, NULL, XE_PAGE_SIZE,
 					     ttm_bo_type_kernel,
 					     flags);
 
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 1e424ce8ef3e..d769bc93d15c 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -95,7 +95,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
 	if (IS_ERR(bb))
 		return PTR_ERR(bb);
 
-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
+	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
@@ -144,7 +144,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
 		}
 	}
 
-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
+	batch_ofs = xe_bo_ggtt_addr(gt_to_tile(gt)->mem.kernel_bb_pool->bo);
 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
 	if (IS_ERR(job)) {
 		xe_bb_free(bb, NULL);
@@ -364,31 +364,16 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		goto err_force_wake;
 
 	if (!xe_gt_is_media_type(gt)) {
-		gt->kernel_bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
-		if (IS_ERR(gt->kernel_bb_pool)) {
-			err = PTR_ERR(gt->kernel_bb_pool);
-			goto err_force_wake;
-		}
-
 		/*
 		 * USM has its only SA pool to non-block behind user operations
 		 */
 		if (gt_to_xe(gt)->info.supports_usm) {
-			gt->usm.bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
+			gt->usm.bb_pool = xe_sa_bo_manager_init(gt_to_tile(gt), SZ_1M, 16);
 			if (IS_ERR(gt->usm.bb_pool)) {
 				err = PTR_ERR(gt->usm.bb_pool);
 				goto err_force_wake;
 			}
 		}
-	} else {
-		struct xe_gt *full_gt = xe_find_full_gt(gt);
-
-		/*
-		 * Media GT's kernel_bb_pool is only used while recording the
-		 * default context during GT init.  The USM pool should never
-		 * be needed on the media GT.
-		 */
-		gt->kernel_bb_pool = full_gt->kernel_bb_pool;
 	}
 
 	if (!xe_gt_is_media_type(gt)) {
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b71b584c9bdc..9c72849f07a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -63,11 +63,11 @@ static int force_reset(struct seq_file *m, void *data)
 
 static int sa_info(struct seq_file *m, void *data)
 {
-	struct xe_gt *gt = node_to_gt(m->private);
+	struct xe_tile *tile = gt_to_tile(node_to_gt(m->private));
 	struct drm_printer p = drm_seq_file_printer(m);
 
-	drm_suballoc_dump_debug_info(&gt->kernel_bb_pool->base, &p,
-				     gt->kernel_bb_pool->gpu_addr);
+	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, &p,
+				     tile->mem.kernel_bb_pool->gpu_addr);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index f4f3d95ae6b1..1c2b23ae89cf 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -71,8 +71,8 @@ static bool access_is_atomic(enum access_type access_type)
 
 static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
 {
-	return BIT(gt->info.id) & vma->gt_present &&
-		!(BIT(gt->info.id) & vma->usm.gt_invalidated);
+	return BIT(gt_to_tile(gt)->id) & vma->tile_present &&
+		!(BIT(gt->info.id) & vma->usm.tile_invalidated);
 }
 
 static bool vma_matches(struct xe_vma *vma, struct xe_vma *lookup)
@@ -208,8 +208,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Bind VMA only to the GT that has faulted */
 	trace_xe_vma_pf_bind(vma);
-	fence = __xe_pt_bind_vma(gt, vma, xe_gt_migrate_engine(gt), NULL, 0,
-				 vma->gt_present & BIT(gt->info.id));
+	fence = __xe_pt_bind_vma(tile, vma, xe_gt_migrate_engine(gt), NULL, 0,
+				 vma->tile_present & BIT(tile->id));
 	if (IS_ERR(fence)) {
 		ret = PTR_ERR(fence);
 		goto unlock_dma_resv;
@@ -225,7 +225,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	if (xe_vma_is_userptr(vma))
 		ret = xe_vma_userptr_check_repin(vma);
-	vma->usm.gt_invalidated &= ~BIT(gt->info.id);
+	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
 
 unlock_dma_resv:
 	if (only_needs_bo_lock(bo))
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index bb5271277e3b..6e239ce738c1 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -278,13 +278,6 @@ struct xe_gt {
 	/** @hw_engines: hardware engines on the GT */
 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
 
-	/**
-	 * @kernel_bb_pool: Pool from which batchbuffers are allocated.
-	 *
-	 * Media GT shares a pool with its primary GT.
-	 */
-	struct xe_sa_manager *kernel_bb_pool;
-
 	/** @migrate: Migration helper for vram blits and clearing */
 	struct xe_migrate *migrate;
 
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 6d550d746909..dd69d097b920 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -273,16 +273,17 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 {
 	struct xe_device *xe = ads_to_xe(ads);
 	struct xe_gt *gt = ads_to_gt(ads);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
 	int err;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
-	bo = xe_bo_create_pin_map(xe, gt, NULL, guc_ads_size(ads) +
+	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ads_size(ads) +
 				  MAX_GOLDEN_LRC_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 9055ff133a7c..01e6ff405549 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -130,6 +130,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
 	int err;
 
@@ -145,9 +146,9 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 
 	primelockdep(ct);
 
-	bo = xe_bo_create_pin_map(xe, gt, NULL, guc_ct_size(),
+	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_ct_size(),
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index a6982f323ed1..c8f875e970ab 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -70,6 +70,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_bo *bo;
 	u32 size;
 	int err;
@@ -94,9 +95,9 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
 	if (!size)
 		return -EINVAL;
 
-	bo = xe_bo_create_pin_map(xe, gt, NULL, PAGE_ALIGN(size),
+	bo = xe_bo_create_pin_map(xe, tile, NULL, PAGE_ALIGN(size),
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 9a7b5d5906c1..403aaafcaba6 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -87,13 +87,13 @@ static void guc_log_fini(struct drm_device *drm, void *arg)
 int xe_guc_log_init(struct xe_guc_log *log)
 {
 	struct xe_device *xe = log_to_xe(log);
-	struct xe_gt *gt = log_to_gt(log);
+	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
 	struct xe_bo *bo;
 	int err;
 
-	bo = xe_bo_create_pin_map(xe, gt, NULL, guc_log_size(),
+	bo = xe_bo_create_pin_map(xe, tile, NULL, guc_log_size(),
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e799faa1c6b8..67faa9ee0006 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -888,6 +888,7 @@ static void pc_fini(struct drm_device *drm, void *arg)
 int xe_guc_pc_init(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
@@ -895,9 +896,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 
 	mutex_init(&pc->freq_lock);
 
-	bo = xe_bo_create_pin_map(xe, gt, NULL, size,
+	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_GGTT_BIT);
 
 	if (IS_ERR(bo))
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 751f6c3bba17..fe8af54ea8bd 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -371,6 +371,7 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			  enum xe_hw_engine_id id)
 {
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
 	XE_BUG_ON(id >= ARRAY_SIZE(engine_infos) || !engine_infos[id].name);
@@ -379,8 +380,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 	xe_reg_sr_apply_whitelist(&hwe->reg_whitelist, hwe->mmio_base, gt);
 
-	hwe->hwsp = xe_bo_create_pin_map(xe, gt, NULL, SZ_4K, ttm_bo_type_kernel,
-					 XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+	hwe->hwsp = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
+					 XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 					 XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(hwe->hwsp)) {
 		err = PTR_ERR(hwe->hwsp);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index ae605e7805de..8f25a38f36a5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -592,7 +592,7 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
 
 static void xe_lrc_set_ppgtt(struct xe_lrc *lrc, struct xe_vm *vm)
 {
-	u64 desc = xe_vm_pdp4_descriptor(vm, lrc->full_gt);
+	u64 desc = xe_vm_pdp4_descriptor(vm, lrc->tile);
 
 	xe_lrc_write_ctx_reg(lrc, CTX_PDP0_UDW, upper_32_bits(desc));
 	xe_lrc_write_ctx_reg(lrc, CTX_PDP0_LDW, lower_32_bits(desc));
@@ -607,6 +607,7 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 		struct xe_engine *e, struct xe_vm *vm, u32 ring_size)
 {
 	struct xe_gt *gt = hwe->gt;
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct iosys_map map;
 	void *init_data = NULL;
@@ -619,19 +620,15 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
-	lrc->bo = xe_bo_create_pin_map(xe, hwe->gt, vm,
+	lrc->bo = xe_bo_create_pin_map(xe, tile, vm,
 				      ring_size + xe_lrc_size(xe, hwe->class),
 				      ttm_bo_type_kernel,
-				      XE_BO_CREATE_VRAM_IF_DGFX(hwe->gt) |
+				      XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				      XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
-	if (xe_gt_is_media_type(hwe->gt))
-		lrc->full_gt = xe_find_full_gt(hwe->gt);
-	else
-		lrc->full_gt = hwe->gt;
-
+	lrc->tile = gt_to_tile(hwe->gt);
 	lrc->ring.size = ring_size;
 	lrc->ring.tail = 0;
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 8fe08535873d..78220336062c 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -20,8 +20,8 @@ struct xe_lrc {
 	 */
 	struct xe_bo *bo;
 
-	/** @full_gt: full GT which this LRC belongs to */
-	struct xe_gt *full_gt;
+	/** @tile: tile which this LRC belongs to */
+	struct xe_tile *tile;
 
 	/** @flags: LRC flags */
 	u32 flags;
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index f40f47ccb76f..031a0bde5585 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -129,6 +129,7 @@ static u64 xe_migrate_vram_ofs(u64 addr)
 static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 {
 	struct xe_gt *gt = m->gt;
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = vm->xe;
 	size_t cleared_size;
 	u64 vram_addr;
@@ -139,9 +140,9 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 
 	cleared_size = xe_device_ccs_bytes(xe, MAX_PREEMPTDISABLE_TRANSFER);
 	cleared_size = PAGE_ALIGN(cleared_size);
-	m->cleared_bo = xe_bo_create_pin_map(xe, gt, vm, cleared_size,
+	m->cleared_bo = xe_bo_create_pin_map(xe, tile, vm, cleared_size,
 					     ttm_bo_type_kernel,
-					     XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+					     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 					     XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(m->cleared_bo))
 		return PTR_ERR(m->cleared_bo);
@@ -161,7 +162,8 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
 	u32 map_ofs, level, i;
 	struct xe_device *xe = gt_to_xe(m->gt);
-	struct xe_bo *bo, *batch = gt->kernel_bb_pool->bo;
+	struct xe_tile *tile = gt_to_tile(m->gt);
+	struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
 	u64 entry;
 	int ret;
 
@@ -175,10 +177,10 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
 	/* Need to be sure everything fits in the first PT, or create more */
 	XE_BUG_ON(m->batch_base_ofs + batch->size >= SZ_2M);
 
-	bo = xe_bo_create_pin_map(vm->xe, m->gt, vm,
+	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
 				  num_entries * XE_PAGE_SIZE,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(m->gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
@@ -964,7 +966,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
 	return fence;
 }
 
-static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
+static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 			  const struct xe_vm_pgtable_update *update,
 			  struct xe_migrate_pt_update *pt_update)
 {
@@ -1003,7 +1005,7 @@ static void write_pgtable(struct xe_gt *gt, struct xe_bb *bb, u64 ppgtt_ofs,
 			(chunk * 2 + 1);
 		bb->cs[bb->len++] = lower_32_bits(addr);
 		bb->cs[bb->len++] = upper_32_bits(addr);
-		ops->populate(pt_update, gt, NULL, bb->cs + bb->len, ofs, chunk,
+		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
 			      update);
 
 		bb->len += chunk * 2;
@@ -1061,7 +1063,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	for (i = 0; i < num_updates; i++) {
 		const struct xe_vm_pgtable_update *update = &updates[i];
 
-		ops->populate(pt_update, m->gt, &update->pt_bo->vmap, NULL,
+		ops->populate(pt_update, gt_to_tile(m->gt), &update->pt_bo->vmap, NULL,
 			      update->ofs, update->qwords, update);
 	}
 
@@ -1129,6 +1131,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 {
 	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
 	struct xe_gt *gt = m->gt;
+	struct xe_tile *tile = gt_to_tile(m->gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_sched_job *job;
 	struct dma_fence *fence;
@@ -1223,7 +1226,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
 			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
 		for (i = 0; i < num_updates; i++)
-			write_pgtable(m->gt, bb, addr + i * XE_PAGE_SIZE,
+			write_pgtable(tile, bb, addr + i * XE_PAGE_SIZE,
 				      &updates[i], pt_update);
 	} else {
 		/* phys pages, no preamble required */
@@ -1233,7 +1236,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		/* Preemption is enabled again by the ring ops. */
 		emit_arb_clear(bb);
 		for (i = 0; i < num_updates; i++)
-			write_pgtable(m->gt, bb, 0, &updates[i], pt_update);
+			write_pgtable(tile, bb, 0, &updates[i], pt_update);
 	}
 
 	if (!eng)
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index 1ff6e0a90de5..e07b2a8845c0 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -19,6 +19,7 @@ struct xe_migrate;
 struct xe_migrate_pt_update;
 struct xe_sync_entry;
 struct xe_pt;
+struct xe_tile;
 struct xe_vm;
 struct xe_vm_pgtable_update;
 struct xe_vma;
@@ -31,7 +32,7 @@ struct xe_migrate_pt_update_ops {
 	/**
 	 * @populate: Populate a command buffer or page-table with ptes.
 	 * @pt_update: Embeddable callback argument.
-	 * @gt: The gt for the current operation.
+	 * @tile: The tile for the current operation.
 	 * @map: struct iosys_map into the memory to be populated.
 	 * @pos: If @map is NULL, map into the memory to be populated.
 	 * @ofs: qword offset into @map, unused if @map is NULL.
@@ -43,7 +44,7 @@ struct xe_migrate_pt_update_ops {
 	 * page-tables with PTEs.
 	 */
 	void (*populate)(struct xe_migrate_pt_update *pt_update,
-			 struct xe_gt *gt, struct iosys_map *map,
+			 struct xe_tile *tile, struct iosys_map *map,
 			 void *pos, u32 ofs, u32 num_qwords,
 			 const struct xe_vm_pgtable_update *update);
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ad42a21c0e22..ea68e6b38133 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -165,12 +165,10 @@ u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
 	return __gen8_pte_encode(pte, cache, flags, pt_level);
 }
 
-static u64 __xe_pt_empty_pte(struct xe_gt *gt, struct xe_vm *vm,
+static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
 			     unsigned int level)
 {
-	u8 id = gt->info.id;
-
-	XE_BUG_ON(xe_gt_is_media_type(gt));
+	u8 id = tile->id;
 
 	if (!vm->scratch_bo[id])
 		return 0;
@@ -189,7 +187,7 @@ static u64 __xe_pt_empty_pte(struct xe_gt *gt, struct xe_vm *vm,
 /**
  * xe_pt_create() - Create a page-table.
  * @vm: The vm to create for.
- * @gt: The gt to create for.
+ * @tile: The tile to create for.
  * @level: The page-table level.
  *
  * Allocate and initialize a single struct xe_pt metadata structure. Also
@@ -201,7 +199,7 @@ static u64 __xe_pt_empty_pte(struct xe_gt *gt, struct xe_vm *vm,
  * Return: A valid struct xe_pt pointer on success, Pointer error code on
  * error.
  */
-struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
+struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 			   unsigned int level)
 {
 	struct xe_pt *pt;
@@ -215,9 +213,9 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
 
-	bo = xe_bo_create_pin_map(vm->xe, gt, vm, SZ_4K,
+	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_IGNORE_MIN_PAGE_SIZE_BIT |
 				  XE_BO_CREATE_PINNED_BIT);
 	if (IS_ERR(bo)) {
@@ -240,30 +238,28 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
 /**
  * xe_pt_populate_empty() - Populate a page-table bo with scratch- or zero
  * entries.
- * @gt: The gt the scratch pagetable of which to use.
+ * @tile: The tile the scratch pagetable of which to use.
  * @vm: The vm we populate for.
  * @pt: The pagetable the bo of which to initialize.
  *
- * Populate the page-table bo of @pt with entries pointing into the gt's
+ * Populate the page-table bo of @pt with entries pointing into the tile's
  * scratch page-table tree if any. Otherwise populate with zeros.
  */
-void xe_pt_populate_empty(struct xe_gt *gt, struct xe_vm *vm,
+void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 			  struct xe_pt *pt)
 {
 	struct iosys_map *map = &pt->bo->vmap;
 	u64 empty;
 	int i;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
-
-	if (!vm->scratch_bo[gt->info.id]) {
+	if (!vm->scratch_bo[tile->id]) {
 		/*
 		 * FIXME: Some memory is allocated already allocated to zero?
 		 * Find out which memory that is and avoid this memset...
 		 */
 		xe_map_memset(vm->xe, map, 0, 0, SZ_4K);
 	} else {
-		empty = __xe_pt_empty_pte(gt, vm, pt->level);
+		empty = __xe_pt_empty_pte(tile, vm, pt->level);
 		for (i = 0; i < XE_PDES; i++)
 			xe_pt_write(vm->xe, map, i, empty);
 	}
@@ -317,9 +313,9 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 
 /**
  * xe_pt_create_scratch() - Setup a scratch memory pagetable tree for the
- * given gt and vm.
+ * given tile and vm.
  * @xe: xe device.
- * @gt: gt to set up for.
+ * @tile: tile to set up for.
  * @vm: vm to set up for.
  *
  * Sets up a pagetable tree with one page-table per level and a single
@@ -328,10 +324,10 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
  *
  * Return: 0 on success, negative error code on error.
  */
-int xe_pt_create_scratch(struct xe_device *xe, struct xe_gt *gt,
+int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
 			 struct xe_vm *vm)
 {
-	u8 id = gt->info.id;
+	u8 id = tile->id;
 	unsigned int flags;
 	int i;
 
@@ -344,9 +340,9 @@ int xe_pt_create_scratch(struct xe_device *xe, struct xe_gt *gt,
 	if (vm->flags & XE_VM_FLAGS_64K)
 		flags |= XE_BO_CREATE_SYSTEM_BIT;
 	else
-		flags |= XE_BO_CREATE_VRAM_IF_DGFX(gt);
+		flags |= XE_BO_CREATE_VRAM_IF_DGFX(tile);
 
-	vm->scratch_bo[id] = xe_bo_create_pin_map(xe, gt, vm, SZ_4K,
+	vm->scratch_bo[id] = xe_bo_create_pin_map(xe, tile, vm, SZ_4K,
 						  ttm_bo_type_kernel,
 						  flags);
 	if (IS_ERR(vm->scratch_bo[id]))
@@ -356,11 +352,11 @@ int xe_pt_create_scratch(struct xe_device *xe, struct xe_gt *gt,
 		      vm->scratch_bo[id]->size);
 
 	for (i = 0; i < vm->pt_root[id]->level; i++) {
-		vm->scratch_pt[id][i] = xe_pt_create(vm, gt, i);
+		vm->scratch_pt[id][i] = xe_pt_create(vm, tile, i);
 		if (IS_ERR(vm->scratch_pt[id][i]))
 			return PTR_ERR(vm->scratch_pt[id][i]);
 
-		xe_pt_populate_empty(gt, vm, vm->scratch_pt[id][i]);
+		xe_pt_populate_empty(tile, vm, vm->scratch_pt[id][i]);
 	}
 
 	return 0;
@@ -409,8 +405,8 @@ struct xe_pt_stage_bind_walk {
 	/* Input parameters for the walk */
 	/** @vm: The vm we're building for. */
 	struct xe_vm *vm;
-	/** @gt: The gt we're building for. */
-	struct xe_gt *gt;
+	/** @tile: The tile we're building for. */
+	struct xe_tile *tile;
 	/** @cache: Desired cache level for the ptes */
 	enum xe_cache_level cache;
 	/** @default_pte: PTE flag only template. No address is associated */
@@ -678,7 +674,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	if (covers || !*child) {
 		u64 flags = 0;
 
-		xe_child = xe_pt_create(xe_walk->vm, xe_walk->gt, level - 1);
+		xe_child = xe_pt_create(xe_walk->vm, xe_walk->tile, level - 1);
 		if (IS_ERR(xe_child))
 			return PTR_ERR(xe_child);
 
@@ -686,7 +682,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 			       round_down(addr, 1ull << walk->shifts[level]));
 
 		if (!covers)
-			xe_pt_populate_empty(xe_walk->gt, xe_walk->vm, xe_child);
+			xe_pt_populate_empty(xe_walk->tile, xe_walk->vm, xe_child);
 
 		*child = &xe_child->base;
 
@@ -695,7 +691,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		 * TODO: Suballocate the pt bo to avoid wasting a lot of
 		 * memory.
 		 */
-		if (GRAPHICS_VERx100(gt_to_xe(xe_walk->gt)) >= 1250 && level == 1 &&
+		if (GRAPHICS_VERx100(tile_to_xe(xe_walk->tile)) >= 1250 && level == 1 &&
 		    covers && xe_pt_scan_64K(addr, next, xe_walk)) {
 			walk->shifts = xe_compact_pt_shifts;
 			flags |= XE_PDE_64K;
@@ -718,7 +714,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
 /**
  * xe_pt_stage_bind() - Build a disconnected page-table tree for a given address
  * range.
- * @gt: The gt we're building for.
+ * @tile: The tile we're building for.
  * @vma: The vma indicating the address range.
  * @entries: Storage for the update entries used for connecting the tree to
  * the main tree at commit time.
@@ -734,7 +730,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_bind_ops = {
  * Return 0 on success, negative error code on error.
  */
 static int
-xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
+xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
 {
 	struct xe_bo *bo = vma->bo;
@@ -747,14 +743,14 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
 		.vm = vma->vm,
-		.gt = gt,
+		.tile = tile,
 		.curs = &curs,
 		.va_curs_start = vma->start,
 		.pte_flags = vma->pte_flags,
 		.wupd.entries = entries,
 		.needs_64K = (vma->vm->flags & XE_VM_FLAGS_64K) && is_vram,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
+	struct xe_pt *pt = vma->vm->pt_root[tile->id];
 	int ret;
 
 	if (is_vram) {
@@ -764,7 +760,7 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
 		if (vma && vma->use_atomic_access_pte_bit)
 			xe_walk.default_pte |= XE_USM_PPGTT_PTE_AE;
 		xe_walk.dma_offset = bo_tile->mem.vram.io_start -
-			gt_to_xe(gt)->mem.vram.io_start;
+			tile_to_xe(tile)->mem.vram.io_start;
 		xe_walk.cache = XE_CACHE_WB;
 	} else {
 		if (!xe_vma_is_userptr(vma) && bo->flags & XE_BO_SCANOUT_BIT)
@@ -851,8 +847,8 @@ struct xe_pt_zap_ptes_walk {
 	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
-	/** @gt: The gt we're building for */
-	struct xe_gt *gt;
+	/** @tile: The tile we're building for */
+	struct xe_tile *tile;
 
 	/* Output */
 	/** @needs_invalidate: Whether we need to invalidate TLB*/
@@ -880,7 +876,7 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	 */
 	if (xe_pt_nonshared_offsets(addr, next, --level, walk, action, &offset,
 				    &end_offset)) {
-		xe_map_memset(gt_to_xe(xe_walk->gt), &xe_child->bo->vmap,
+		xe_map_memset(tile_to_xe(xe_walk->tile), &xe_child->bo->vmap,
 			      offset * sizeof(u64), 0,
 			      (end_offset - offset) * sizeof(u64));
 		xe_walk->needs_invalidate = true;
@@ -895,7 +891,7 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
 
 /**
  * xe_pt_zap_ptes() - Zap (zero) gpu ptes of an address range
- * @gt: The gt we're zapping for.
+ * @tile: The tile we're zapping for.
  * @vma: GPU VMA detailing address range.
  *
  * Eviction and Userptr invalidation needs to be able to zap the
@@ -909,7 +905,7 @@ static const struct xe_pt_walk_ops xe_pt_zap_ptes_ops = {
  * Return: Whether ptes were actually updated and a TLB invalidation is
  * required.
  */
-bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
+bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 {
 	struct xe_pt_zap_ptes_walk xe_walk = {
 		.base = {
@@ -917,11 +913,11 @@ bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
-		.gt = gt,
+		.tile = tile,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
+	struct xe_pt *pt = vma->vm->pt_root[tile->id];
 
-	if (!(vma->gt_present & BIT(gt->info.id)))
+	if (!(vma->tile_present & BIT(tile->id)))
 		return false;
 
 	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
@@ -931,7 +927,7 @@ bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
 }
 
 static void
-xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_gt *gt,
+xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_tile *tile,
 		       struct iosys_map *map, void *data,
 		       u32 qword_ofs, u32 num_qwords,
 		       const struct xe_vm_pgtable_update *update)
@@ -940,11 +936,9 @@ xe_vm_populate_pgtable(struct xe_migrate_pt_update *pt_update, struct xe_gt *gt,
 	u64 *ptr = data;
 	u32 i;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
-
 	for (i = 0; i < num_qwords; i++) {
 		if (map)
-			xe_map_wr(gt_to_xe(gt), map, (qword_ofs + i) *
+			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
 				  sizeof(u64), u64, ptes[i].pte);
 		else
 			ptr[i] = ptes[i].pte;
@@ -1018,14 +1012,14 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
 }
 
 static int
-xe_pt_prepare_bind(struct xe_gt *gt, struct xe_vma *vma,
+xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 		   struct xe_vm_pgtable_update *entries, u32 *num_entries,
 		   bool rebind)
 {
 	int err;
 
 	*num_entries = 0;
-	err = xe_pt_stage_bind(gt, vma, entries, num_entries);
+	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
 	if (!err)
 		BUG_ON(!*num_entries);
 	else /* abort! */
@@ -1252,7 +1246,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 /**
  * __xe_pt_bind_vma() - Build and connect a page-table tree for the vma
  * address range.
- * @gt: The gt to bind for.
+ * @tile: The tile to bind for.
  * @vma: The vma to bind.
  * @e: The engine with which to do pipelined page-table updates.
  * @syncs: Entries to sync on before binding the built tree to the live vm tree.
@@ -1272,7 +1266,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
  * on success, an error pointer on error.
  */
 struct dma_fence *
-__xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
+__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		 struct xe_sync_entry *syncs, u32 num_syncs,
 		 bool rebind)
 {
@@ -1293,18 +1287,17 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	bind_pt_update.locked = false;
 	xe_bo_assert_held(vma->bo);
 	xe_vm_assert_held(vm);
-	XE_BUG_ON(xe_gt_is_media_type(gt));
 
 	vm_dbg(&vma->vm->xe->drm,
 	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
 	       vma->start, vma->end, e);
 
-	err = xe_pt_prepare_bind(gt, vma, entries, &num_entries, rebind);
+	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
 	if (err)
 		goto err;
 	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
 
-	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
+	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 
 	if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
 		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
@@ -1312,9 +1305,9 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 			return ERR_PTR(-ENOMEM);
 	}
 
-	fence = xe_migrate_update_pgtables(gt->migrate,
+	fence = xe_migrate_update_pgtables(tile->primary_gt.migrate,
 					   vm, vma->bo,
-					   e ? e : vm->eng[gt->info.id],
+					   e ? e : vm->eng[tile->id],
 					   entries, num_entries,
 					   syncs, num_syncs,
 					   &bind_pt_update.base);
@@ -1323,7 +1316,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 		/* TLB invalidation must be done before signaling rebind */
 		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
-			int err = invalidation_fence_init(gt, ifence, fence,
+			int err = invalidation_fence_init(&tile->primary_gt, ifence, fence,
 							  vma);
 			if (err) {
 				dma_fence_put(fence);
@@ -1346,7 +1339,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 				  bind_pt_update.locked ? &deferred : NULL);
 
 		/* This vma is live (again?) now */
-		vma->gt_present |= BIT(gt->info.id);
+		vma->tile_present |= BIT(tile->id);
 
 		if (bind_pt_update.locked) {
 			vma->userptr.initial_bind = true;
@@ -1375,8 +1368,8 @@ struct xe_pt_stage_unbind_walk {
 	struct xe_pt_walk base;
 
 	/* Input parameters for the walk */
-	/** @gt: The gt we're unbinding from. */
-	struct xe_gt *gt;
+	/** @tile: The tile we're unbinding from. */
+	struct xe_tile *tile;
 
 	/**
 	 * @modified_start: Walk range start, modified to include any
@@ -1481,7 +1474,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
 /**
  * xe_pt_stage_unbind() - Build page-table update structures for an unbind
  * operation
- * @gt: The gt we're unbinding for.
+ * @tile: The tile we're unbinding for.
  * @vma: The vma we're unbinding.
  * @entries: Caller-provided storage for the update structures.
  *
@@ -1492,7 +1485,7 @@ static const struct xe_pt_walk_ops xe_pt_stage_unbind_ops = {
  *
  * Return: The number of entries used.
  */
-static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
+static unsigned int xe_pt_stage_unbind(struct xe_tile *tile, struct xe_vma *vma,
 				       struct xe_vm_pgtable_update *entries)
 {
 	struct xe_pt_stage_unbind_walk xe_walk = {
@@ -1501,12 +1494,12 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 			.shifts = xe_normal_pt_shifts,
 			.max_level = XE_PT_HIGHEST_LEVEL,
 		},
-		.gt = gt,
+		.tile = tile,
 		.modified_start = vma->start,
 		.modified_end = vma->end + 1,
 		.wupd.entries = entries,
 	};
-	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
+	struct xe_pt *pt = vma->vm->pt_root[tile->id];
 
 	(void)xe_pt_walk_shared(&pt->base, pt->level, vma->start, vma->end + 1,
 				 &xe_walk.base);
@@ -1516,19 +1509,17 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
 
 static void
 xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
-				  struct xe_gt *gt, struct iosys_map *map,
+				  struct xe_tile *tile, struct iosys_map *map,
 				  void *ptr, u32 qword_ofs, u32 num_qwords,
 				  const struct xe_vm_pgtable_update *update)
 {
 	struct xe_vma *vma = pt_update->vma;
-	u64 empty = __xe_pt_empty_pte(gt, vma->vm, update->pt->level);
+	u64 empty = __xe_pt_empty_pte(tile, vma->vm, update->pt->level);
 	int i;
 
-	XE_BUG_ON(xe_gt_is_media_type(gt));
-
 	if (map && map->is_iomem)
 		for (i = 0; i < num_qwords; ++i)
-			xe_map_wr(gt_to_xe(gt), map, (qword_ofs + i) *
+			xe_map_wr(tile_to_xe(tile), map, (qword_ofs + i) *
 				  sizeof(u64), u64, empty);
 	else if (map)
 		memset64(map->vaddr + qword_ofs * sizeof(u64), empty,
@@ -1579,7 +1570,7 @@ static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
 /**
  * __xe_pt_unbind_vma() - Disconnect and free a page-table tree for the vma
  * address range.
- * @gt: The gt to unbind for.
+ * @tile: The tile to unbind for.
  * @vma: The vma to unbind.
  * @e: The engine with which to do pipelined page-table updates.
  * @syncs: Entries to sync on before disconnecting the tree to be destroyed.
@@ -1597,7 +1588,7 @@ static const struct xe_migrate_pt_update_ops userptr_unbind_ops = {
  * on success, an error pointer on error.
  */
 struct dma_fence *
-__xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
+__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		   struct xe_sync_entry *syncs, u32 num_syncs)
 {
 	struct xe_vm_pgtable_update entries[XE_VM_MAX_LEVEL * 2 + 1];
@@ -1616,16 +1607,15 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 
 	xe_bo_assert_held(vma->bo);
 	xe_vm_assert_held(vm);
-	XE_BUG_ON(xe_gt_is_media_type(gt));
 
 	vm_dbg(&vma->vm->xe->drm,
 	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
 	       vma->start, vma->end, e);
 
-	num_entries = xe_pt_stage_unbind(gt, vma, entries);
+	num_entries = xe_pt_stage_unbind(tile, vma, entries);
 	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
 
-	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
+	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 
 	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
 	if (!ifence)
@@ -1636,9 +1626,9 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 	 * clear again here. The eviction may have updated pagetables at a
 	 * lower level, because it needs to be more conservative.
 	 */
-	fence = xe_migrate_update_pgtables(gt->migrate,
+	fence = xe_migrate_update_pgtables(tile->primary_gt.migrate,
 					   vm, NULL, e ? e :
-					   vm->eng[gt->info.id],
+					   vm->eng[tile->id],
 					   entries, num_entries,
 					   syncs, num_syncs,
 					   &unbind_pt_update.base);
@@ -1646,7 +1636,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 		int err;
 
 		/* TLB invalidation must be done before signaling unbind */
-		err = invalidation_fence_init(gt, ifence, fence, vma);
+		err = invalidation_fence_init(&tile->primary_gt, ifence, fence, vma);
 		if (err) {
 			dma_fence_put(fence);
 			kfree(ifence);
@@ -1664,18 +1654,18 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
 					   DMA_RESV_USAGE_BOOKKEEP);
 		xe_pt_commit_unbind(vma, entries, num_entries,
 				    unbind_pt_update.locked ? &deferred : NULL);
-		vma->gt_present &= ~BIT(gt->info.id);
+		vma->tile_present &= ~BIT(tile->id);
 	} else {
 		kfree(ifence);
 	}
 
-	if (!vma->gt_present)
+	if (!vma->tile_present)
 		list_del_init(&vma->rebind_link);
 
 	if (unbind_pt_update.locked) {
 		XE_WARN_ON(!xe_vma_is_userptr(vma));
 
-		if (!vma->gt_present) {
+		if (!vma->tile_present) {
 			spin_lock(&vm->userptr.invalidated_lock);
 			list_del_init(&vma->userptr.invalidate_link);
 			spin_unlock(&vm->userptr.invalidated_lock);
diff --git a/drivers/gpu/drm/xe/xe_pt.h b/drivers/gpu/drm/xe/xe_pt.h
index 1152043e5c63..10f334b9c004 100644
--- a/drivers/gpu/drm/xe/xe_pt.h
+++ b/drivers/gpu/drm/xe/xe_pt.h
@@ -13,8 +13,8 @@ struct dma_fence;
 struct xe_bo;
 struct xe_device;
 struct xe_engine;
-struct xe_gt;
 struct xe_sync_entry;
+struct xe_tile;
 struct xe_vm;
 struct xe_vma;
 
@@ -23,27 +23,27 @@ struct xe_vma;
 
 unsigned int xe_pt_shift(unsigned int level);
 
-struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_gt *gt,
+struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 			   unsigned int level);
 
-int xe_pt_create_scratch(struct xe_device *xe, struct xe_gt *gt,
+int xe_pt_create_scratch(struct xe_device *xe, struct xe_tile *tile,
 			 struct xe_vm *vm);
 
-void xe_pt_populate_empty(struct xe_gt *gt, struct xe_vm *vm,
+void xe_pt_populate_empty(struct xe_tile *tile, struct xe_vm *vm,
 			  struct xe_pt *pt);
 
 void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred);
 
 struct dma_fence *
-__xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
+__xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		 struct xe_sync_entry *syncs, u32 num_syncs,
 		 bool rebind);
 
 struct dma_fence *
-__xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
+__xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 		   struct xe_sync_entry *syncs, u32 num_syncs);
 
-bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma);
+bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma);
 
 u64 gen8_pde_encode(struct xe_bo *bo, u64 bo_offset,
 		    const enum xe_cache_level level);
diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
index c16f7c14ff52..fee71080bd31 100644
--- a/drivers/gpu/drm/xe/xe_sa.c
+++ b/drivers/gpu/drm/xe/xe_sa.c
@@ -11,7 +11,6 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
-#include "xe_gt.h"
 #include "xe_map.h"
 
 static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
@@ -33,14 +32,14 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
 	sa_manager->bo = NULL;
 }
 
-struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align)
+struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align)
 {
-	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_device *xe = tile_to_xe(tile);
 	u32 managed_size = size - SZ_4K;
 	struct xe_bo *bo;
 	int ret;
 
-	struct xe_sa_manager *sa_manager = drmm_kzalloc(&gt_to_xe(gt)->drm,
+	struct xe_sa_manager *sa_manager = drmm_kzalloc(&tile_to_xe(tile)->drm,
 							sizeof(*sa_manager),
 							GFP_KERNEL);
 	if (!sa_manager)
@@ -48,8 +47,8 @@ struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 alig
 
 	sa_manager->bo = NULL;
 
-	bo = xe_bo_create_pin_map(xe, gt, NULL, size, ttm_bo_type_kernel,
-				  XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+	bo = xe_bo_create_pin_map(xe, tile, NULL, size, ttm_bo_type_kernel,
+				  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				  XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(bo)) {
 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
@@ -90,7 +89,7 @@ struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
 void xe_sa_bo_flush_write(struct drm_suballoc *sa_bo)
 {
 	struct xe_sa_manager *sa_manager = to_xe_sa_manager(sa_bo->manager);
-	struct xe_device *xe = gt_to_xe(sa_manager->bo->gt);
+	struct xe_device *xe = tile_to_xe(sa_manager->bo->tile);
 
 	if (!sa_manager->bo->vmap.is_iomem)
 		return;
diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
index 3063fb34c720..4e96483057d7 100644
--- a/drivers/gpu/drm/xe/xe_sa.h
+++ b/drivers/gpu/drm/xe/xe_sa.h
@@ -9,9 +9,9 @@
 
 struct dma_fence;
 struct xe_bo;
-struct xe_gt;
+struct xe_tile;
 
-struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align);
+struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u32 align);
 
 struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
 				  u32 size);
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 9553d252b56c..c322e7a7b677 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include "xe_device.h"
 #include "xe_ggtt.h"
+#include "xe_sa.h"
 #include "xe_tile.h"
 #include "xe_ttm_vram_mgr.h"
 
@@ -67,6 +68,12 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 		goto err_mem_access;
 
 	err = xe_ggtt_init_noalloc(tile->mem.ggtt);
+	if (err)
+		goto err_mem_access;
+
+	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
+	if (IS_ERR(tile->mem.kernel_bb_pool))
+		err = PTR_ERR(tile->mem.kernel_bb_pool);
 
 err_mem_access:
 	xe_device_mem_access_put(tile_to_xe(tile));
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 5c3a571d2a29..e862e57e1e16 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -320,6 +320,7 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 {
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
+	struct xe_tile *tile = gt_to_tile(gt);
 	struct device *dev = xe->drm.dev;
 	const struct firmware *fw = NULL;
 	struct uc_css_header *css;
@@ -409,9 +410,9 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
 		guc_read_css_info(uc_fw, css);
 
-	obj = xe_bo_create_from_data(xe, gt, fw->data, fw->size,
+	obj = xe_bo_create_from_data(xe, tile, fw->data, fw->size,
 				     ttm_bo_type_kernel,
-				     XE_BO_CREATE_VRAM_IF_DGFX(gt) |
+				     XE_BO_CREATE_VRAM_IF_DGFX(tile) |
 				     XE_BO_CREATE_GGTT_BIT);
 	if (IS_ERR(obj)) {
 		drm_notice(&xe->drm, "%s firmware %s: failed to create / populate bo",
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index fe6abb6ed6ca..632f7538a6d5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -463,7 +463,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 		xe_bo_assert_held(vma->bo);
 
 		list_del_init(&vma->notifier.rebind_link);
-		if (vma->gt_present && !vma->destroyed)
+		if (vma->tile_present && !vma->destroyed)
 			list_move_tail(&vma->rebind_link, &vm->rebind_list);
 	}
 	spin_unlock(&vm->notifier.list_lock);
@@ -701,7 +701,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	 * Tell exec and rebind worker they need to repin and rebind this
 	 * userptr.
 	 */
-	if (!xe_vm_in_fault_mode(vm) && !vma->destroyed && vma->gt_present) {
+	if (!xe_vm_in_fault_mode(vm) && !vma->destroyed && vma->tile_present) {
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_move_tail(&vma->userptr.invalidate_link,
 			       &vm->userptr.invalidated);
@@ -819,7 +819,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 
 	xe_vm_assert_held(vm);
 	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
-		XE_WARN_ON(!vma->gt_present);
+		XE_WARN_ON(!vma->tile_present);
 
 		list_del_init(&vma->rebind_link);
 		dma_fence_put(fence);
@@ -840,10 +840,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    u64 bo_offset_or_userptr,
 				    u64 start, u64 end,
 				    bool read_only,
-				    u64 gt_mask)
+				    u64 tile_mask)
 {
 	struct xe_vma *vma;
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	u8 id;
 
 	XE_BUG_ON(start >= end);
@@ -868,12 +868,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (read_only)
 		vma->pte_flags = XE_PTE_READ_ONLY;
 
-	if (gt_mask) {
-		vma->gt_mask = gt_mask;
+	if (tile_mask) {
+		vma->tile_mask = tile_mask;
 	} else {
-		for_each_gt(gt, vm->xe, id)
-			if (!xe_gt_is_media_type(gt))
-				vma->gt_mask |= 0x1 << id;
+		for_each_tile(tile, vm->xe, id)
+			vma->tile_mask |= 0x1 << id;
 	}
 
 	if (vm->xe->info.platform == XE_PVC)
@@ -1102,8 +1101,8 @@ static void vm_destroy_work_func(struct work_struct *w);
 struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 {
 	struct xe_vm *vm;
-	int err, i = 0, number_gts = 0;
-	struct xe_gt *gt;
+	int err, i = 0, number_tiles = 0;
+	struct xe_tile *tile;
 	u8 id;
 
 	vm = kzalloc(sizeof(*vm), GFP_KERNEL);
@@ -1155,15 +1154,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		vm->flags |= XE_VM_FLAGS_64K;
 
-	for_each_gt(gt, xe, id) {
-		if (xe_gt_is_media_type(gt))
-			continue;
-
+	for_each_tile(tile, xe, id) {
 		if (flags & XE_VM_FLAG_MIGRATION &&
-		    gt->info.id != XE_VM_FLAG_GT_ID(flags))
+		    tile->id != XE_VM_FLAG_GT_ID(flags))
 			continue;
 
-		vm->pt_root[id] = xe_pt_create(vm, gt, xe->info.vm_max_level);
+		vm->pt_root[id] = xe_pt_create(vm, tile, xe->info.vm_max_level);
 		if (IS_ERR(vm->pt_root[id])) {
 			err = PTR_ERR(vm->pt_root[id]);
 			vm->pt_root[id] = NULL;
@@ -1172,11 +1168,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	}
 
 	if (flags & XE_VM_FLAG_SCRATCH_PAGE) {
-		for_each_gt(gt, xe, id) {
+		for_each_tile(tile, xe, id) {
 			if (!vm->pt_root[id])
 				continue;
 
-			err = xe_pt_create_scratch(xe, gt, vm);
+			err = xe_pt_create_scratch(xe, tile, vm);
 			if (err)
 				goto err_scratch_pt;
 		}
@@ -1193,17 +1189,18 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	}
 
 	/* Fill pt_root after allocating scratch tables */
-	for_each_gt(gt, xe, id) {
+	for_each_tile(tile, xe, id) {
 		if (!vm->pt_root[id])
 			continue;
 
-		xe_pt_populate_empty(gt, vm, vm->pt_root[id]);
+		xe_pt_populate_empty(tile, vm, vm->pt_root[id]);
 	}
 	dma_resv_unlock(&vm->resv);
 
 	/* Kernel migration VM shouldn't have a circular loop.. */
 	if (!(flags & XE_VM_FLAG_MIGRATION)) {
-		for_each_gt(gt, xe, id) {
+		for_each_tile(tile, xe, id) {
+			struct xe_gt *gt = &tile->primary_gt;
 			struct xe_vm *migrate_vm;
 			struct xe_engine *eng;
 
@@ -1220,11 +1217,11 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 				return ERR_CAST(eng);
 			}
 			vm->eng[id] = eng;
-			number_gts++;
+			number_tiles++;
 		}
 	}
 
-	if (number_gts > 1)
+	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
 	mutex_lock(&xe->usm.lock);
@@ -1239,7 +1236,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	return vm;
 
 err_scratch_pt:
-	for_each_gt(gt, xe, id) {
+	for_each_tile(tile, xe, id) {
 		if (!vm->pt_root[id])
 			continue;
 
@@ -1252,7 +1249,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe_bo_put(vm->scratch_bo[id]);
 	}
 err_destroy_root:
-	for_each_gt(gt, xe, id) {
+	for_each_tile(tile, xe, id) {
 		if (vm->pt_root[id])
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 	}
@@ -1309,7 +1306,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	struct rb_root contested = RB_ROOT;
 	struct ww_acquire_ctx ww;
 	struct xe_device *xe = vm->xe;
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	u8 id;
 
 	XE_BUG_ON(vm->preempt.num_engines);
@@ -1320,7 +1317,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (xe_vm_in_compute_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
 
-	for_each_gt(gt, xe, id) {
+	for_each_tile(tile, xe, id) {
 		if (vm->eng[id]) {
 			xe_engine_kill(vm->eng[id]);
 			xe_engine_put(vm->eng[id]);
@@ -1357,7 +1354,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	 * install a fence to resv. Hence it's safe to
 	 * destroy the pagetables immediately.
 	 */
-	for_each_gt(gt, xe, id) {
+	for_each_tile(tile, xe, id) {
 		if (vm->scratch_bo[id]) {
 			u32 i;
 
@@ -1407,7 +1404,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 		container_of(w, struct xe_vm, destroy_work);
 	struct ww_acquire_ctx ww;
 	struct xe_device *xe = vm->xe;
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	u8 id;
 	void *lookup;
 
@@ -1432,7 +1429,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	 * can be moved to xe_vm_close_and_put.
 	 */
 	xe_vm_lock(vm, &ww, 0, false);
-	for_each_gt(gt, xe, id) {
+	for_each_tile(tile, xe, id) {
 		if (vm->pt_root[id]) {
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 			vm->pt_root[id] = NULL;
@@ -1468,11 +1465,9 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
 	return vm;
 }
 
-u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_gt *full_gt)
+u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
 {
-	XE_BUG_ON(xe_gt_is_media_type(full_gt));
-
-	return gen8_pde_encode(vm->pt_root[full_gt->info.id]->bo, 0,
+	return gen8_pde_encode(vm->pt_root[tile->id]->bo, 0,
 			       XE_CACHE_WB);
 }
 
@@ -1480,32 +1475,30 @@ static struct dma_fence *
 xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 		 struct xe_sync_entry *syncs, u32 num_syncs)
 {
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	struct dma_fence *fence = NULL;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = vma->vm;
 	int cur_fence = 0, i;
-	int number_gts = hweight_long(vma->gt_present);
+	int number_tiles = hweight_long(vma->tile_present);
 	int err;
 	u8 id;
 
 	trace_xe_vma_unbind(vma);
 
-	if (number_gts > 1) {
-		fences = kmalloc_array(number_gts, sizeof(*fences),
+	if (number_tiles > 1) {
+		fences = kmalloc_array(number_tiles, sizeof(*fences),
 				       GFP_KERNEL);
 		if (!fences)
 			return ERR_PTR(-ENOMEM);
 	}
 
-	for_each_gt(gt, vm->xe, id) {
-		if (!(vma->gt_present & BIT(id)))
+	for_each_tile(tile, vm->xe, id) {
+		if (!(vma->tile_present & BIT(id)))
 			goto next;
 
-		XE_BUG_ON(xe_gt_is_media_type(gt));
-
-		fence = __xe_pt_unbind_vma(gt, vma, e, syncs, num_syncs);
+		fence = __xe_pt_unbind_vma(tile, vma, e, syncs, num_syncs);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			goto err_fences;
@@ -1520,7 +1513,7 @@ xe_vm_unbind_vma(struct xe_vma *vma, struct xe_engine *e,
 	}
 
 	if (fences) {
-		cf = dma_fence_array_create(number_gts, fences,
+		cf = dma_fence_array_create(number_tiles, fences,
 					    vm->composite_fence_ctx,
 					    vm->composite_fence_seqno++,
 					    false);
@@ -1552,32 +1545,31 @@ static struct dma_fence *
 xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 	       struct xe_sync_entry *syncs, u32 num_syncs)
 {
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	struct dma_fence *fence;
 	struct dma_fence **fences = NULL;
 	struct dma_fence_array *cf = NULL;
 	struct xe_vm *vm = vma->vm;
 	int cur_fence = 0, i;
-	int number_gts = hweight_long(vma->gt_mask);
+	int number_tiles = hweight_long(vma->tile_mask);
 	int err;
 	u8 id;
 
 	trace_xe_vma_bind(vma);
 
-	if (number_gts > 1) {
-		fences = kmalloc_array(number_gts, sizeof(*fences),
+	if (number_tiles > 1) {
+		fences = kmalloc_array(number_tiles, sizeof(*fences),
 				       GFP_KERNEL);
 		if (!fences)
 			return ERR_PTR(-ENOMEM);
 	}
 
-	for_each_gt(gt, vm->xe, id) {
-		if (!(vma->gt_mask & BIT(id)))
+	for_each_tile(tile, vm->xe, id) {
+		if (!(vma->tile_mask & BIT(id)))
 			goto next;
 
-		XE_BUG_ON(xe_gt_is_media_type(gt));
-		fence = __xe_pt_bind_vma(gt, vma, e, syncs, num_syncs,
-					 vma->gt_present & BIT(id));
+		fence = __xe_pt_bind_vma(tile, vma, e, syncs, num_syncs,
+					 vma->tile_present & BIT(id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			goto err_fences;
@@ -1592,7 +1584,7 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_engine *e,
 	}
 
 	if (fences) {
-		cf = dma_fence_array_create(number_gts, fences,
+		cf = dma_fence_array_create(number_tiles, fences,
 					    vm->composite_fence_ctx,
 					    vm->composite_fence_seqno++,
 					    false);
@@ -1980,7 +1972,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 			return err;
 	}
 
-	if (vma->gt_mask != (vma->gt_present & ~vma->usm.gt_invalidated)) {
+	if (vma->tile_mask != (vma->tile_present & ~vma->usm.tile_invalidated)) {
 		return xe_vm_bind(vm, vma, e, vma->bo, syncs, num_syncs,
 				  afence);
 	} else {
@@ -2616,7 +2608,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					  first->start,
 					  lookup->start - 1,
 					  (first->pte_flags & XE_PTE_READ_ONLY),
-					  first->gt_mask);
+					  first->tile_mask);
 		if (first->bo)
 			xe_bo_unlock(first->bo, &ww);
 		if (!new_first) {
@@ -2647,7 +2639,7 @@ static struct xe_vma *vm_unbind_lookup_vmas(struct xe_vm *vm,
 					 last->start + chunk,
 					 last->end,
 					 (last->pte_flags & XE_PTE_READ_ONLY),
-					 last->gt_mask);
+					 last->tile_mask);
 		if (last->bo)
 			xe_bo_unlock(last->bo, &ww);
 		if (!new_last) {
@@ -2783,7 +2775,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 					       struct xe_bo *bo,
 					       u64 bo_offset_or_userptr,
 					       u64 addr, u64 range, u32 op,
-					       u64 gt_mask, u32 region)
+					       u64 tile_mask, u32 region)
 {
 	struct ww_acquire_ctx ww;
 	struct xe_vma *vma, lookup;
@@ -2804,7 +2796,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 		vma = xe_vma_create(vm, bo, bo_offset_or_userptr, addr,
 				    addr + range - 1,
 				    op & XE_VM_BIND_FLAG_READONLY,
-				    gt_mask);
+				    tile_mask);
 		xe_bo_unlock(bo, &ww);
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
@@ -2844,7 +2836,7 @@ static struct xe_vma *vm_bind_ioctl_lookup_vma(struct xe_vm *vm,
 		vma = xe_vma_create(vm, NULL, bo_offset_or_userptr, addr,
 				    addr + range - 1,
 				    op & XE_VM_BIND_FLAG_READONLY,
-				    gt_mask);
+				    tile_mask);
 		if (!vma)
 			return ERR_PTR(-ENOMEM);
 
@@ -3072,11 +3064,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 			goto put_engine;
 		}
 
-		if (bind_ops[i].gt_mask) {
-			u64 valid_gts = BIT(xe->info.tile_count) - 1;
+		if (bind_ops[i].tile_mask) {
+			u64 valid_tiles = BIT(xe->info.tile_count) - 1;
 
-			if (XE_IOCTL_ERR(xe, bind_ops[i].gt_mask &
-					 ~valid_gts)) {
+			if (XE_IOCTL_ERR(xe, bind_ops[i].tile_mask &
+					 ~valid_tiles)) {
 				err = -EINVAL;
 				goto put_engine;
 			}
@@ -3167,11 +3159,11 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		u64 addr = bind_ops[i].addr;
 		u32 op = bind_ops[i].op;
 		u64 obj_offset = bind_ops[i].obj_offset;
-		u64 gt_mask = bind_ops[i].gt_mask;
+		u64 tile_mask = bind_ops[i].tile_mask;
 		u32 region = bind_ops[i].region;
 
 		vmas[i] = vm_bind_ioctl_lookup_vma(vm, bos[i], obj_offset,
-						   addr, range, op, gt_mask,
+						   addr, range, op, tile_mask,
 						   region);
 		if (IS_ERR(vmas[i])) {
 			err = PTR_ERR(vmas[i]);
@@ -3345,8 +3337,8 @@ void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
 int xe_vm_invalidate_vma(struct xe_vma *vma)
 {
 	struct xe_device *xe = vma->vm->xe;
-	struct xe_gt *gt;
-	u32 gt_needs_invalidate = 0;
+	struct xe_tile *tile;
+	u32 tile_needs_invalidate = 0;
 	int seqno[XE_MAX_TILES_PER_DEVICE];
 	u8 id;
 	int ret;
@@ -3368,25 +3360,29 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 		}
 	}
 
-	for_each_gt(gt, xe, id) {
-		if (xe_pt_zap_ptes(gt, vma)) {
-			gt_needs_invalidate |= BIT(id);
+	for_each_tile(tile, xe, id) {
+		if (xe_pt_zap_ptes(tile, vma)) {
+			tile_needs_invalidate |= BIT(id);
 			xe_device_wmb(xe);
-			seqno[id] = xe_gt_tlb_invalidation_vma(gt, NULL, vma);
+			/*
+			 * FIXME: We potentially need to invalidate multiple
+			 * GTs within the tile
+			 */
+			seqno[id] = xe_gt_tlb_invalidation_vma(&tile->primary_gt, NULL, vma);
 			if (seqno[id] < 0)
 				return seqno[id];
 		}
 	}
 
-	for_each_gt(gt, xe, id) {
-		if (gt_needs_invalidate & BIT(id)) {
-			ret = xe_gt_tlb_invalidation_wait(gt, seqno[id]);
+	for_each_tile(tile, xe, id) {
+		if (tile_needs_invalidate & BIT(id)) {
+			ret = xe_gt_tlb_invalidation_wait(&tile->primary_gt, seqno[id]);
 			if (ret < 0)
 				return ret;
 		}
 	}
 
-	vma->usm.gt_invalidated = vma->gt_mask;
+	vma->usm.tile_invalidated = vma->tile_mask;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 748dc16ebed9..372f26153209 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -54,7 +54,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, const struct xe_vma *vma);
 
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
 
-u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_gt *full_gt);
+u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
 
 int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 203ba9d946b8..c45c5daeeaa7 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -37,17 +37,17 @@ struct xe_vma {
 	/** @bo_offset: offset into BO if not a userptr, unused for userptr */
 	u64 bo_offset;
 
-	/** @gt_mask: GT mask of where to create binding for this VMA */
-	u64 gt_mask;
+	/** @tile_mask: Tile mask of where to create binding for this VMA */
+	u64 tile_mask;
 
 	/**
-	 * @gt_present: GT mask of binding are present for this VMA.
+	 * @tile_present: GT mask of binding are present for this VMA.
 	 * protected by vm->lock, vm->resv and for userptrs,
 	 * vm->userptr.notifier_lock for writing. Needs either for reading,
 	 * but if reading is done under the vm->lock only, it needs to be held
 	 * in write mode.
 	 */
-	u64 gt_present;
+	u64 tile_present;
 
 	/**
 	 * @destroyed: VMA is destroyed, in the sense that it shouldn't be
@@ -132,8 +132,8 @@ struct xe_vma {
 
 	/** @usm: unified shared memory state */
 	struct {
-		/** @gt_invalidated: VMA has been invalidated */
-		u64 gt_invalidated;
+		/** @tile_invalidated: VMA has been invalidated */
+		u64 tile_invalidated;
 	} usm;
 
 	struct {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..11a0ede7155e 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -398,10 +398,10 @@ struct drm_xe_vm_bind_op {
 	__u64 addr;
 
 	/**
-	 * @gt_mask: Mask for which GTs to create binds for, 0 == All GTs,
+	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
 	 * only applies to creating new VMAs
 	 */
-	__u64 gt_mask;
+	__u64 tile_mask;
 
 	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
 	__u32 op;
-- 
2.40.0

