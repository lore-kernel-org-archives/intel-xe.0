Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DC1C04FDF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:55:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2459210E5BB;
	Thu, 27 Jul 2023 14:55:47 +0000 (UTC)
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A5410E5B3
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469744; x=1722005744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MLqt7OJANQZYYUCVOCym2cog6x0gMTtfUjHggRXUlAc=;
 b=E/QagC+0WZuvn2YSng9JIR2BQiSIhywnaUyn7mMEPP8MrkXAfl8HiJjF
 TyUtX0fDF4s+Y/7LTjm8ezFr3YMdIXifvh8A+P0snZtxmW78taji+0LQv
 p34VB6CAkNqw5QYT08AUpiMaK+UXwDojUlDKw9D6PmGejRFdf+N9m/pod
 5GL0eS6YGR1b62cf5qsaey2Rka1x7exdW2M1HEozIIQlA7kikR6kn7Ouw
 OZmQaUxMva45NHgRfNbtuXUJYkEbzhUn1qYWrcq9NFZ7kJHYTn+au6/V4
 dqXDwXtQCSs3NYyxxGGzEEYTGtmtyNRMZ1ivwssdj/OG1Y9HqOk51LhAo w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="353244897"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="353244897"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797091714"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="797091714"
Received: from cweger-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.249.37.139])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jul 2023 14:55:30 +0000
Message-Id: <20230727145530.7-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727145530.7-1-francois.dugast@intel.com>
References: <20230727145530.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 3/3] drm/xe: Use regular WARN_ON() instead of
 driver-specific XE_WARN_ON()
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
Cc: Francois Dugast <francois.dugast@intel.com>, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Remove XE_WARN_ON() alias to WARN_ON() and use WARN_ON() directly in
order to align with other drivers and avoid using a Xe-specific version.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c   |  2 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c       |  2 +-
 drivers/gpu/drm/xe/xe_bb.c                   |  8 +-
 drivers/gpu/drm/xe/xe_bo.c                   | 66 +++++++--------
 drivers/gpu/drm/xe/xe_bo.h                   | 14 ++--
 drivers/gpu/drm/xe/xe_bo_evict.c             |  4 +-
 drivers/gpu/drm/xe/xe_debugfs.c              |  4 +-
 drivers/gpu/drm/xe/xe_device.c               |  8 +-
 drivers/gpu/drm/xe/xe_dma_buf.c              |  2 +-
 drivers/gpu/drm/xe/xe_engine.c               |  2 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  2 +-
 drivers/gpu/drm/xe/xe_execlist.c             | 16 ++--
 drivers/gpu/drm/xe/xe_force_wake.c           |  4 +-
 drivers/gpu/drm/xe/xe_force_wake.h           |  4 +-
 drivers/gpu/drm/xe/xe_ggtt.c                 | 18 ++---
 drivers/gpu/drm/xe/xe_gt.c                   | 22 ++---
 drivers/gpu/drm/xe/xe_gt_clock.c             |  4 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c           |  4 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |  2 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c  | 12 +--
 drivers/gpu/drm/xe/xe_guc.c                  | 26 +++---
 drivers/gpu/drm/xe/xe_guc.h                  |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c              | 16 ++--
 drivers/gpu/drm/xe/xe_guc_ct.c               | 28 +++----
 drivers/gpu/drm/xe/xe_guc_hwconfig.c         |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c              |  4 +-
 drivers/gpu/drm/xe/xe_guc_pc.c               | 16 ++--
 drivers/gpu/drm/xe/xe_guc_submit.c           | 62 +++++++--------
 drivers/gpu/drm/xe/xe_huc.c                  |  2 +-
 drivers/gpu/drm/xe/xe_hw_engine.c            | 10 +--
 drivers/gpu/drm/xe/xe_hw_fence.c             |  8 +-
 drivers/gpu/drm/xe/xe_lrc.c                  |  8 +-
 drivers/gpu/drm/xe/xe_macros.h               |  2 -
 drivers/gpu/drm/xe/xe_migrate.c              | 40 +++++-----
 drivers/gpu/drm/xe/xe_mocs.c                 |  4 +-
 drivers/gpu/drm/xe/xe_pt.c                   | 32 ++++----
 drivers/gpu/drm/xe/xe_range_fence.c          |  2 +-
 drivers/gpu/drm/xe/xe_reg_sr.c               |  4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h           | 14 ++--
 drivers/gpu/drm/xe/xe_ring_ops.c             |  8 +-
 drivers/gpu/drm/xe/xe_sched_job.c            |  2 +-
 drivers/gpu/drm/xe/xe_sync.c                 |  4 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c       |  4 +-
 drivers/gpu/drm/xe/xe_uc.c                   |  4 +-
 drivers/gpu/drm/xe/xe_uc_debugfs.c           |  2 +-
 drivers/gpu/drm/xe/xe_uc_fw.c                | 18 ++---
 drivers/gpu/drm/xe/xe_uc_fw.h                |  2 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 84 ++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                   |  2 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  2 +-
 drivers/gpu/drm/xe/xe_wait_user_fence.c      |  2 +-
 drivers/gpu/drm/xe/xe_wopcm.c                | 18 ++---
 53 files changed, 317 insertions(+), 319 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 45a932c9b1b3..8547e5f74e5a 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6941,7 +6941,7 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
 	int ret;
 	struct ww_acquire_ctx ww;
 
-	XE_WARN_ON(size != 8);
+	WARN_ON(size != 8);
 
 	ret = xe_bo_lock(bo, &ww, 0, true);
 	if (ret)
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index a4f30773e314..17eee041fa11 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -385,7 +385,7 @@ static int intelfb_create(struct drm_fb_helper *helper,
 		info->fix.smem_len = obj->ttm.base.size;
 	}
 
-	XE_WARN_ON(iosys_map_is_null(&obj->vmap));
+	WARN_ON(iosys_map_is_null(&obj->vmap));
 	vaddr = obj->vmap.vaddr_iomem;
 #endif
 	if (IS_ERR(vaddr)) {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 3422942a9951..e27127a97772 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -196,7 +196,7 @@ static struct i915_vma *__xe_pin_fb_vma(struct intel_framebuffer *fb,
 		return ERR_PTR(-ENODEV);
 
 	/* Remapped view is only required on ADL-P, which xe doesn't support. */
-	if (XE_WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
+	if (WARN_ON(view->type == I915_GTT_VIEW_REMAPPED)) {
 		ret = -ENODEV;
 		goto err;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
index b15a7cb7db4c..a5eb043ddb7c 100644
--- a/drivers/gpu/drm/xe/xe_bb.c
+++ b/drivers/gpu/drm/xe/xe_bb.c
@@ -78,7 +78,7 @@ struct xe_sched_job *xe_bb_create_wa_job(struct xe_engine *wa_eng,
 {
 	u64 addr = batch_base_ofs + drm_suballoc_soffset(bb->bo);
 
-	XE_WARN_ON(!(wa_eng->vm->flags & XE_VM_FLAG_MIGRATION));
+	WARN_ON(!(wa_eng->vm->flags & XE_VM_FLAG_MIGRATION));
 
 	return __xe_bb_create_job(wa_eng, bb, &addr);
 }
@@ -94,8 +94,8 @@ struct xe_sched_job *xe_bb_create_migration_job(struct xe_engine *kernel_eng,
 		4 * second_idx,
 	};
 
-	XE_WARN_ON(second_idx > bb->len);
-	XE_WARN_ON(!(kernel_eng->vm->flags & XE_VM_FLAG_MIGRATION));
+	WARN_ON(second_idx > bb->len);
+	WARN_ON(!(kernel_eng->vm->flags & XE_VM_FLAG_MIGRATION));
 
 	return __xe_bb_create_job(kernel_eng, bb, addr);
 }
@@ -105,7 +105,7 @@ struct xe_sched_job *xe_bb_create_job(struct xe_engine *kernel_eng,
 {
 	u64 addr = xe_sa_bo_gpu_addr(bb->bo);
 
-	XE_WARN_ON(kernel_eng->vm && kernel_eng->vm->flags & XE_VM_FLAG_MIGRATION);
+	WARN_ON(kernel_eng->vm && kernel_eng->vm->flags & XE_VM_FLAG_MIGRATION);
 	return __xe_bb_create_job(kernel_eng, bb, &addr);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 4c32826dee92..32ebfd8cb6de 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -88,7 +88,7 @@ static bool xe_bo_is_user(struct xe_bo *bo)
 static struct xe_tile *
 mem_type_to_tile(struct xe_device *xe, u32 mem_type)
 {
-	XE_WARN_ON(mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type));
+	WARN_ON(mem_type != XE_PL_STOLEN && !mem_type_is_vram(mem_type));
 
 	return &xe->tiles[mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0)];
 }
@@ -127,7 +127,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 	struct ttm_place place = { .mem_type = mem_type };
 	u64 io_size = tile->mem.vram.io_size;
 
-	XE_WARN_ON(!tile->mem.vram.usable_size);
+	WARN_ON(!tile->mem.vram.usable_size);
 
 	/*
 	 * For eviction / restore on suspend / resume objects
@@ -270,7 +270,7 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
 	unsigned long num_pages = tt->num_pages;
 	int ret;
 
-	XE_WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
+	WARN_ON(tt->page_flags & TTM_TT_FLAG_EXTERNAL);
 
 	if (xe_tt->sg)
 		return 0;
@@ -469,7 +469,7 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
 							MAX_SCHEDULE_TIMEOUT);
 			if (timeout > 0) {
 				ret = xe_vm_invalidate_vma(vma);
-				XE_WARN_ON(ret);
+				WARN_ON(ret);
 			} else if (!timeout) {
 				ret = -ETIME;
 			} else {
@@ -526,8 +526,8 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 					       ttm);
 	struct sg_table *sg;
 
-	XE_WARN_ON(!attach);
-	XE_WARN_ON(!ttm_bo->ttm);
+	WARN_ON(!attach);
+	WARN_ON(!ttm_bo->ttm);
 
 	if (new_res->mem_type == XE_PL_SYSTEM)
 		goto out;
@@ -689,8 +689,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	else if (mem_type_is_vram(old_mem_type))
 		tile = mem_type_to_tile(xe, old_mem_type);
 
-	XE_WARN_ON(!tile);
-	XE_WARN_ON(!tile->migrate);
+	WARN_ON(!tile);
+	WARN_ON(!tile->migrate);
 
 	trace_xe_bo_move(bo);
 	xe_device_mem_access_get(xe);
@@ -714,13 +714,13 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 				void *new_addr = tile->mem.vram.mapping +
 					(new_mem->start << PAGE_SHIFT);
 
-				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
+				if (WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
 					ret = -EINVAL;
 					xe_device_mem_access_put(xe);
 					goto out;
 				}
 
-				XE_WARN_ON(new_mem->start !=
+				WARN_ON(new_mem->start !=
 					  bo->placements->fpfn);
 
 				iosys_map_set_vaddr_iomem(&bo->vmap, new_addr);
@@ -921,7 +921,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 {
 	bool locked;
 
-	XE_WARN_ON(kref_read(&ttm_bo->kref));
+	WARN_ON(kref_read(&ttm_bo->kref));
 
 	/*
 	 * We can typically only race with TTM trylocking under the
@@ -932,7 +932,7 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
 	spin_lock(&ttm_bo->bdev->lru_lock);
 	locked = dma_resv_trylock(ttm_bo->base.resv);
 	spin_unlock(&ttm_bo->bdev->lru_lock);
-	XE_WARN_ON(!locked);
+	WARN_ON(!locked);
 
 	return locked;
 }
@@ -948,7 +948,7 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
 		return;
 
 	bo = ttm_to_xe_bo(ttm_bo);
-	XE_WARN_ON(bo->created && kref_read(&ttm_bo->base.refcount));
+	WARN_ON(bo->created && kref_read(&ttm_bo->base.refcount));
 
 	/*
 	 * Corner case where TTM fails to allocate memory and this BOs resv
@@ -1064,7 +1064,7 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
 		struct ww_acquire_ctx ww;
 
-		XE_WARN_ON(!xe_bo_is_user(bo));
+		WARN_ON(!xe_bo_is_user(bo));
 
 		xe_bo_lock(bo, &ww, 0, false);
 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
@@ -1180,9 +1180,9 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	int err;
 
 	/* Only kernel objects should set GT */
-	XE_WARN_ON(tile && type != ttm_bo_type_kernel);
+	WARN_ON(tile && type != ttm_bo_type_kernel);
 
-	if (XE_WARN_ON(!size))
+	if (WARN_ON(!size))
 		return ERR_PTR(-EINVAL);
 
 	if (!bo) {
@@ -1325,7 +1325,7 @@ xe_bo_create_locked_range(struct xe_device *xe,
 		if (!tile && flags & XE_BO_CREATE_STOLEN_BIT)
 			tile = xe_device_get_root_tile(xe);
 
-		XE_WARN_ON(!tile);
+		WARN_ON(!tile);
 
 		if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
 			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
@@ -1456,8 +1456,8 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
 
-	XE_WARN_ON(bo->vm);
-	XE_WARN_ON(!xe_bo_is_user(bo));
+	WARN_ON(bo->vm);
+	WARN_ON(!xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
 		err = xe_bo_validate(bo, NULL, false);
@@ -1489,20 +1489,20 @@ int xe_bo_pin(struct xe_bo *bo)
 	int err;
 
 	/* We currently don't expect user BO to be pinned */
-	XE_WARN_ON(xe_bo_is_user(bo));
+	WARN_ON(xe_bo_is_user(bo));
 
 	/* Pinned object must be in GGTT or have pinned flag */
-	XE_WARN_ON(!(bo->flags & (XE_BO_CREATE_PINNED_BIT |
+	WARN_ON(!(bo->flags & (XE_BO_CREATE_PINNED_BIT |
 				 XE_BO_CREATE_GGTT_BIT)));
 
 	/*
 	 * No reason we can't support pinning imported dma-bufs we just don't
 	 * expect to pin an imported dma-buf.
 	 */
-	XE_WARN_ON(bo->ttm.base.import_attach);
+	WARN_ON(bo->ttm.base.import_attach);
 
 	/* We only expect at most 1 pin */
-	XE_WARN_ON(xe_bo_is_pinned(bo));
+	WARN_ON(xe_bo_is_pinned(bo));
 
 	err = xe_bo_validate(bo, NULL, false);
 	if (err)
@@ -1519,7 +1519,7 @@ int xe_bo_pin(struct xe_bo *bo)
 		bool vram;
 
 		if (mem_type_is_vram(place->mem_type)) {
-			XE_WARN_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
+			WARN_ON(!(place->flags & TTM_PL_FLAG_CONTIGUOUS));
 
 			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE, &vram) -
 				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
@@ -1556,9 +1556,9 @@ void xe_bo_unpin_external(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
-	XE_WARN_ON(bo->vm);
-	XE_WARN_ON(!xe_bo_is_pinned(bo));
-	XE_WARN_ON(!xe_bo_is_user(bo));
+	WARN_ON(bo->vm);
+	WARN_ON(!xe_bo_is_pinned(bo));
+	WARN_ON(!xe_bo_is_user(bo));
 
 	if (bo->ttm.pin_count == 1 && !list_empty(&bo->pinned_link)) {
 		spin_lock(&xe->pinned.lock);
@@ -1579,15 +1579,15 @@ void xe_bo_unpin(struct xe_bo *bo)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 
-	XE_WARN_ON(bo->ttm.base.import_attach);
-	XE_WARN_ON(!xe_bo_is_pinned(bo));
+	WARN_ON(bo->ttm.base.import_attach);
+	WARN_ON(!xe_bo_is_pinned(bo));
 
 	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
 	    bo->flags & XE_BO_INTERNAL_TEST)) {
 		struct ttm_place *place = &(bo->placements[0]);
 
 		if (mem_type_is_vram(place->mem_type)) {
-			XE_WARN_ON(list_empty(&bo->pinned_link));
+			WARN_ON(list_empty(&bo->pinned_link));
 
 			spin_lock(&xe->pinned.lock);
 			list_del_init(&bo->pinned_link);
@@ -1652,14 +1652,14 @@ dma_addr_t __xe_bo_addr(struct xe_bo *bo, u64 offset,
 	struct xe_res_cursor cur;
 	u64 page;
 
-	XE_WARN_ON(page_size > PAGE_SIZE);
+	WARN_ON(page_size > PAGE_SIZE);
 	page = offset >> PAGE_SHIFT;
 	offset &= (PAGE_SIZE - 1);
 
 	*is_vram = xe_bo_is_vram(bo);
 
 	if (!*is_vram && !xe_bo_is_stolen(bo)) {
-		XE_WARN_ON(!bo->ttm.ttm);
+		WARN_ON(!bo->ttm.ttm);
 
 		xe_res_first_sg(xe_bo_get_sg(bo), page << PAGE_SHIFT,
 				page_size, &cur);
@@ -1854,7 +1854,7 @@ int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
 	LIST_HEAD(objs);
 	LIST_HEAD(dups);
 
-	XE_WARN_ON(!ww);
+	WARN_ON(!ww);
 
 	tv_bo.num_shared = num_resv;
 	tv_bo.bo = &bo->ttm;
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7e0982f029a6..4ea36b374cf2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -157,7 +157,7 @@ void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_WARN_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
+		WARN_ON(bo->vm && bo->ttm.base.resv != &bo->vm->resv);
 		if (bo->vm)
 			xe_vm_assert_held(bo->vm);
 		else
@@ -169,8 +169,8 @@ static inline void xe_bo_lock_no_vm(struct xe_bo *bo,
 				    struct ww_acquire_ctx *ctx)
 {
 	if (bo) {
-		XE_WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
-				      bo->ttm.base.resv != &bo->ttm.base._resv));
+		WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
+				   bo->ttm.base.resv != &bo->ttm.base._resv));
 		dma_resv_lock(bo->ttm.base.resv, ctx);
 	}
 }
@@ -178,8 +178,8 @@ static inline void xe_bo_lock_no_vm(struct xe_bo *bo,
 static inline void xe_bo_unlock_no_vm(struct xe_bo *bo)
 {
 	if (bo) {
-		XE_WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
-				      bo->ttm.base.resv != &bo->ttm.base._resv));
+		WARN_ON(bo->vm || (bo->ttm.type != ttm_bo_type_sg &&
+				   bo->ttm.base.resv != &bo->ttm.base._resv));
 		dma_resv_unlock(bo->ttm.base.resv);
 	}
 }
@@ -223,8 +223,8 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
+	WARN_ON(bo->ggtt_node.size > bo->size);
+	WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
 	return bo->ggtt_node.start;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 0d5c3a208ab4..cc5bd3861b3f 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -160,8 +160,8 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		 * We expect validate to trigger a move VRAM and our move code
 		 * should setup the iosys map.
 		 */
-		XE_WARN_ON(iosys_map_is_null(&bo->vmap));
-		XE_WARN_ON(!xe_bo_is_vram(bo));
+		WARN_ON(iosys_map_is_null(&bo->vmap));
+		WARN_ON(!xe_bo_is_vram(bo));
 
 		xe_bo_put(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 491506a1e12e..1614ada1ccfe 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -73,7 +73,7 @@ static int forcewake_open(struct inode *inode, struct file *file)
 	xe_device_mem_access_get(xe);
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	return 0;
 }
@@ -85,7 +85,7 @@ static int forcewake_release(struct inode *inode, struct file *file)
 	u8 id;
 
 	for_each_gt(gt, xe, id)
-		XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+		WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_device_mem_access_put(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 5409cf7895d3..694e483e58ad 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -428,7 +428,7 @@ bool xe_device_mem_access_ongoing(struct xe_device *xe)
 
 void xe_device_assert_mem_access(struct xe_device *xe)
 {
-	XE_WARN_ON(!xe_device_mem_access_ongoing(xe));
+	WARN_ON(!xe_device_mem_access_ongoing(xe));
 }
 
 bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
@@ -442,7 +442,7 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
 	if (active) {
 		int ref = atomic_inc_return(&xe->mem_access.ref);
 
-		XE_WARN_ON(ref == S32_MAX);
+		WARN_ON(ref == S32_MAX);
 	}
 
 	return active;
@@ -484,7 +484,7 @@ void xe_device_mem_access_get(struct xe_device *xe)
 	xe_pm_runtime_get(xe);
 	ref = atomic_inc_return(&xe->mem_access.ref);
 
-	XE_WARN_ON(ref == S32_MAX);
+	WARN_ON(ref == S32_MAX);
 
 }
 
@@ -498,5 +498,5 @@ void xe_device_mem_access_put(struct xe_device *xe)
 	ref = atomic_dec_return(&xe->mem_access.ref);
 	xe_pm_runtime_put(xe);
 
-	XE_WARN_ON(ref < 0);
+	WARN_ON(ref < 0);
 }
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 975dee1f770f..033f21ad60a7 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -219,7 +219,7 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 
-	XE_WARN_ON(xe_bo_evict(bo, false));
+	WARN_ON(xe_bo_evict(bo, false));
 }
 
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
index c30810a687b1..bdd49e729b97 100644
--- a/drivers/gpu/drm/xe/xe_engine.c
+++ b/drivers/gpu/drm/xe/xe_engine.c
@@ -761,7 +761,7 @@ bool xe_engine_ring_full(struct xe_engine *e)
  */
 bool xe_engine_is_idle(struct xe_engine *engine)
 {
-	if (XE_WARN_ON(xe_engine_is_parallel(engine)))
+	if (WARN_ON(xe_engine_is_parallel(engine)))
 		return false;
 
 	return xe_lrc_seqno(&engine->lrc[0]) ==
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index fff4a9d9d12a..15fa82de8efc 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -121,7 +121,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
 	 * to a location where the GPU can access it).
 	 */
 	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
-		XE_WARN_ON(xe_vma_is_null(vma));
+		WARN_ON(xe_vma_is_null(vma));
 
 		if (xe_vma_is_userptr(vma))
 			continue;
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 0f9d919405b0..476e6b26ea54 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -50,10 +50,10 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
 	lrc_desc = xe_lrc_descriptor(lrc);
 
 	if (GRAPHICS_VERx100(xe) >= 1250) {
-		XE_WARN_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
+		WARN_ON(!FIELD_FIT(XEHP_SW_CTX_ID, ctx_id));
 		lrc_desc |= FIELD_PREP(XEHP_SW_CTX_ID, ctx_id);
 	} else {
-		XE_WARN_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
+		WARN_ON(!FIELD_FIT(GEN11_SW_CTX_ID, ctx_id));
 		lrc_desc |= FIELD_PREP(GEN11_SW_CTX_ID, ctx_id);
 	}
 
@@ -213,9 +213,9 @@ static void xe_execlist_make_active(struct xe_execlist_engine *exl)
 	struct xe_execlist_port *port = exl->port;
 	enum drm_sched_priority priority = exl->entity.priority;
 
-	XE_WARN_ON(priority == DRM_SCHED_PRIORITY_UNSET);
-	XE_WARN_ON(priority < 0);
-	XE_WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
+	WARN_ON(priority == DRM_SCHED_PRIORITY_UNSET);
+	WARN_ON(priority < 0);
+	WARN_ON(priority >= ARRAY_SIZE(exl->port->active));
 
 	spin_lock_irq(&port->lock);
 
@@ -321,7 +321,7 @@ static int execlist_engine_init(struct xe_engine *e)
 	struct xe_device *xe = gt_to_xe(e->gt);
 	int err;
 
-	XE_WARN_ON(xe_device_guc_submission_enabled(xe));
+	WARN_ON(xe_device_guc_submission_enabled(xe));
 
 	drm_info(&xe->drm, "Enabling execlist submission (GuC submission disabled)\n");
 
@@ -369,7 +369,7 @@ static int execlist_engine_init(struct xe_engine *e)
 		sprintf(e->name, "ccs%d", ffs(e->logical_mask) - 1);
 		break;
 	default:
-		XE_WARN_ON(e->class);
+		WARN_ON(e->class);
 	}
 
 	return 0;
@@ -389,7 +389,7 @@ static void execlist_engine_fini_async(struct work_struct *w)
 	struct xe_execlist_engine *exl = e->execlist;
 	unsigned long flags;
 
-	XE_WARN_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
+	WARN_ON(xe_device_guc_submission_enabled(gt_to_xe(e->gt)));
 
 	spin_lock_irqsave(&exl->port->lock, flags);
 	if (WARN_ON(exl->active_priority != DRM_SCHED_PRIORITY_UNSET))
diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
index 6cf397c14dd3..644db80f1ce0 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.c
+++ b/drivers/gpu/drm/xe/xe_force_wake.c
@@ -45,7 +45,7 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
 	mutex_init(&fw->lock);
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
 	if (xe->info.graphics_verx100 >= 1270) {
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
@@ -67,7 +67,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
 	int i, j;
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
 	if (!xe_gt_is_media_type(gt))
 		domain_init(&fw->domains[XE_FW_DOMAIN_ID_RENDER],
diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
index 7f304704190e..6f77d2d783fd 100644
--- a/drivers/gpu/drm/xe/xe_force_wake.h
+++ b/drivers/gpu/drm/xe/xe_force_wake.h
@@ -24,7 +24,7 @@ static inline int
 xe_force_wake_ref(struct xe_force_wake *fw,
 		  enum xe_force_wake_domains domain)
 {
-	XE_WARN_ON(!domain);
+	WARN_ON(!domain);
 	return fw->domains[ffs(domain) - 1].ref;
 }
 
@@ -32,7 +32,7 @@ static inline void
 xe_force_wake_assert_held(struct xe_force_wake *fw,
 			  enum xe_force_wake_domains domain)
 {
-	XE_WARN_ON(!(fw->awake_domains & domain));
+	WARN_ON(!(fw->awake_domains & domain));
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 0eb8fd613a68..147942429c80 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -59,8 +59,8 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
 
 void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
 {
-	XE_WARN_ON(addr & XE_PTE_MASK);
-	XE_WARN_ON(addr >= ggtt->size);
+	WARN_ON(addr & XE_PTE_MASK);
+	WARN_ON(addr >= ggtt->size);
 
 	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
 }
@@ -70,7 +70,7 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
 	u64 end = start + size - 1;
 	u64 scratch_pte;
 
-	XE_WARN_ON(start >= end);
+	WARN_ON(start >= end);
 
 	if (ggtt->scratch)
 		scratch_pte = xe_ggtt_pte_encode(ggtt->scratch, 0);
@@ -231,7 +231,7 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 		int seqno;
 
 		seqno = xe_gt_tlb_invalidation_guc(gt);
-		XE_WARN_ON(seqno <= 0);
+		WARN_ON(seqno <= 0);
 		if (seqno > 0)
 			xe_gt_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_guc_submission_enabled(gt_to_xe(gt))) {
@@ -267,7 +267,7 @@ void xe_ggtt_printk(struct xe_ggtt *ggtt, const char *prefix)
 	for (addr = 0; addr < ggtt->size; addr += XE_PAGE_SIZE) {
 		unsigned int i = addr / XE_PAGE_SIZE;
 
-		XE_WARN_ON(addr > U32_MAX);
+		WARN_ON(addr > U32_MAX);
 		if (ggtt->gsm[i] == scratch_pte)
 			continue;
 
@@ -318,9 +318,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.size)) {
+	if (WARN_ON(bo->ggtt_node.size)) {
 		/* Someone's already inserted this BO in the GGTT */
-		XE_WARN_ON(bo->ggtt_node.size != bo->size);
+		WARN_ON(bo->ggtt_node.size != bo->size);
 		return 0;
 	}
 
@@ -368,11 +368,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.size))
+	if (WARN_ON(!bo->ggtt_node.size))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	XE_WARN_ON(bo->ggtt_node.size != bo->size);
+	WARN_ON(bo->ggtt_node.size != bo->size);
 
 	xe_ggtt_remove_node(ggtt, &bo->ggtt_node);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3e32d38aeeea..22cde260f386 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -323,7 +323,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 		goto err_force_wake;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
@@ -395,7 +395,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
 		goto err_force_wake;
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
@@ -537,16 +537,16 @@ static int gt_reset(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	xe_device_mem_access_put(gt_to_xe(gt));
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	xe_gt_info(gt, "reset done\n");
 
 	return 0;
 
 err_out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
-	XE_WARN_ON(xe_uc_start(&gt->uc));
+	WARN_ON(xe_uc_start(&gt->uc));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
 
@@ -575,11 +575,11 @@ void xe_gt_reset_async(struct xe_gt *gt)
 void xe_gt_suspend_prepare(struct xe_gt *gt)
 {
 	xe_device_mem_access_get(gt_to_xe(gt));
-	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
 	xe_uc_stop_prepare(&gt->uc);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
@@ -602,14 +602,14 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "suspended\n");
 
 	return 0;
 
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
@@ -630,14 +630,14 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_force_wake;
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_info(gt, "resumed\n");
 
 	return 0;
 
 err_force_wake:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 err_msg:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 2f77b8bbcf53..8d793b3c256b 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -47,7 +47,7 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
 		return f25_mhz;
 	default:
-		XE_WARN_ON("NOT_POSSIBLE");
+		WARN_ON("NOT_POSSIBLE");
 		return 0;
 	}
 }
@@ -58,7 +58,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	u32 freq = 0;
 
 	/* Assuming gen11+ so assert this assumption is correct */
-	XE_WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
+	WARN_ON(GRAPHICS_VER(gt_to_xe(gt)) < 11);
 
 	if (ctc_reg & CTC_SOURCE_DIVIDE_LOGIC) {
 		freq = read_reference_ts_freq(gt);
diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
index b871e45af813..306b6cef2eb2 100644
--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
@@ -157,12 +157,12 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
 	char name[8];
 	int i;
 
-	XE_WARN_ON(!minor->debugfs_root);
+	WARN_ON(!minor->debugfs_root);
 
 	sprintf(name, "gt%d", gt->info.id);
 	root = debugfs_create_dir(name, minor->debugfs_root);
 	if (IS_ERR(root)) {
-		XE_WARN_ON("Create GT directory failed");
+		WARN_ON("Create GT directory failed");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 125e4744fa38..3f150182388f 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -346,7 +346,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		pf_queue->tail = (pf_queue->tail + len) % PF_QUEUE_NUM_DW;
 		queue_work(gt->usm.pf_wq, &pf_queue->worker);
 	} else {
-		XE_WARN_ON("PF Queue full, shouldn't be possible");
+		WARN_ON("PF Queue full, shouldn't be possible");
 	}
 	spin_unlock_irqrestore(&pf_queue->lock, flags);
 
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index bcbeea62d510..e62b591da498 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -250,7 +250,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 	u32 action[MAX_TLB_INVALIDATION_LEN];
 	int len = 0;
 
-	XE_WARN_ON(!vma);
+	WARN_ON(!vma);
 
 	action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
 	action[len++] = 0; /* seqno, replaced in send_tlb_invalidation */
@@ -288,10 +288,10 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 			start = ALIGN_DOWN(xe_vma_start(vma), length);
 		}
 
-		XE_WARN_ON(length < SZ_4K);
-		XE_WARN_ON(!is_power_of_2(length));
-		XE_WARN_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
-		XE_WARN_ON(!IS_ALIGNED(start, length));
+		WARN_ON(length < SZ_4K);
+		WARN_ON(!is_power_of_2(length));
+		WARN_ON(length & GENMASK(ilog2(SZ_16M) - 1, ilog2(SZ_2M) + 1));
+		WARN_ON(!IS_ALIGNED(start, length));
 
 		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
 		action[len++] = xe_vma_vm(vma)->usm.asid;
@@ -300,7 +300,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
 		action[len++] = ilog2(length) - ilog2(SZ_4K);
 	}
 
-	XE_WARN_ON(len > MAX_TLB_INVALIDATION_LEN);
+	WARN_ON(len > MAX_TLB_INVALIDATION_LEN);
 
 	return send_tlb_invalidation(&gt->uc.guc, fence, action, len);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 69146f95bbbc..6f76d8f16852 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -43,9 +43,9 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
 {
 	u32 addr = xe_bo_ggtt_addr(bo);
 
-	XE_WARN_ON(addr < xe_wopcm_size(guc_to_xe(guc)));
-	XE_WARN_ON(addr >= GUC_GGTT_TOP);
-	XE_WARN_ON(bo->size > GUC_GGTT_TOP - addr);
+	WARN_ON(addr < xe_wopcm_size(guc_to_xe(guc)));
+	WARN_ON(addr >= GUC_GGTT_TOP);
+	WARN_ON(bo->size > GUC_GGTT_TOP - addr);
 
 	return addr;
 }
@@ -614,13 +614,13 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
 
 	BUILD_BUG_ON(VF_SW_FLAG_COUNT != MED_VF_SW_FLAG_COUNT);
 
-	XE_WARN_ON(guc->ct.enabled);
-	XE_WARN_ON(!len);
-	XE_WARN_ON(len > VF_SW_FLAG_COUNT);
-	XE_WARN_ON(len > MED_VF_SW_FLAG_COUNT);
-	XE_WARN_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
+	WARN_ON(guc->ct.enabled);
+	WARN_ON(!len);
+	WARN_ON(len > VF_SW_FLAG_COUNT);
+	WARN_ON(len > MED_VF_SW_FLAG_COUNT);
+	WARN_ON(FIELD_GET(GUC_HXG_MSG_0_ORIGIN, request[0]) !=
 		  GUC_HXG_ORIGIN_HOST);
-	XE_WARN_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
+	WARN_ON(FIELD_GET(GUC_HXG_MSG_0_TYPE, request[0]) !=
 		  GUC_HXG_TYPE_REQUEST);
 
 retry:
@@ -729,8 +729,8 @@ static int guc_self_cfg(struct xe_guc *guc, u16 key, u16 len, u64 val)
 	};
 	int ret;
 
-	XE_WARN_ON(len > 2);
-	XE_WARN_ON(len == 1 && upper_32_bits(val));
+	WARN_ON(len > 2);
+	WARN_ON(len == 1 && upper_32_bits(val));
 
 	/* Self config must go over MMIO */
 	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
@@ -780,7 +780,7 @@ void xe_guc_reset_wait(struct xe_guc *guc)
 
 void xe_guc_stop_prepare(struct xe_guc *guc)
 {
-	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
+	WARN_ON(xe_guc_pc_stop(&guc->pc));
 }
 
 int xe_guc_stop(struct xe_guc *guc)
@@ -801,7 +801,7 @@ int xe_guc_start(struct xe_guc *guc)
 	int ret;
 
 	ret = xe_guc_pc_start(&guc->pc);
-	XE_WARN_ON(ret);
+	WARN_ON(ret);
 
 	return xe_guc_submit_start(guc);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index f64f22e97169..1c07e1a7de1f 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -52,7 +52,7 @@ static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 		return GUC_COMPUTE_CLASS;
 	case XE_ENGINE_CLASS_OTHER:
 	default:
-		XE_WARN_ON(class);
+		WARN_ON(class);
 		return -1;
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index a7da29be2e51..8077ca777da2 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -118,7 +118,7 @@ struct __guc_ads_blob {
 
 static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
 {
-	XE_WARN_ON(!ads->regset_size);
+	WARN_ON(!ads->regset_size);
 
 	return ads->regset_size;
 }
@@ -312,12 +312,12 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 	struct xe_gt *gt = ads_to_gt(ads);
 	u32 prev_regset_size = ads->regset_size;
 
-	XE_WARN_ON(!ads->bo);
+	WARN_ON(!ads->bo);
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
-	XE_WARN_ON(ads->golden_lrc_size +
+	WARN_ON(ads->golden_lrc_size +
 		   (ads->regset_size - prev_regset_size) >
 		   MAX_GOLDEN_LRC_SIZE);
 
@@ -518,7 +518,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
 		regset_used += count * sizeof(struct guc_mmio_reg);
 	}
 
-	XE_WARN_ON(regset_used > ads->regset_size);
+	WARN_ON(regset_used > ads->regset_size);
 }
 
 static void guc_um_init_params(struct xe_guc_ads *ads)
@@ -573,7 +573,7 @@ void xe_guc_ads_populate_minimal(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base = xe_bo_ggtt_addr(ads->bo);
 
-	XE_WARN_ON(!ads->bo);
+	WARN_ON(!ads->bo);
 
 	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
 	guc_policies_init(ads);
@@ -597,7 +597,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 			offsetof(struct __guc_ads_blob, system_info));
 	u32 base = xe_bo_ggtt_addr(ads->bo);
 
-	XE_WARN_ON(!ads->bo);
+	WARN_ON(!ads->bo);
 
 	xe_map_memset(ads_to_xe(ads), ads_to_map(ads), 0, 0, ads->bo->size);
 	guc_policies_init(ads);
@@ -647,7 +647,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 				   engine_enabled_masks[guc_class]))
 			continue;
 
-		XE_WARN_ON(!gt->default_lrc[class]);
+		WARN_ON(!gt->default_lrc[class]);
 
 		real_size = xe_lrc_size(xe, class);
 		alloc_size = PAGE_ALIGN(real_size);
@@ -676,7 +676,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 		offset += alloc_size;
 	}
 
-	XE_WARN_ON(total_size != ads->golden_lrc_size);
+	WARN_ON(total_size != ads->golden_lrc_size);
 }
 
 void xe_guc_ads_populate_post_load(struct xe_guc_ads *ads)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 750e143502da..9356100b5722 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -135,7 +135,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	struct xe_bo *bo;
 	int err;
 
-	XE_WARN_ON(guc_ct_size() % PAGE_SIZE);
+	WARN_ON(guc_ct_size() % PAGE_SIZE);
 
 	mutex_init(&ct->lock);
 	spin_lock_init(&ct->fast_lock);
@@ -284,7 +284,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	struct xe_device *xe = ct_to_xe(ct);
 	int err;
 
-	XE_WARN_ON(ct->enabled);
+	WARN_ON(ct->enabled);
 
 	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
 	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);
@@ -377,7 +377,7 @@ static void h2g_reserve_space(struct xe_guc_ct *ct, u32 cmd_len)
 
 static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 {
-	XE_WARN_ON(g2h_len > ct->ctbs.g2h.info.space);
+	WARN_ON(g2h_len > ct->ctbs.g2h.info.space);
 
 	if (g2h_len) {
 		lockdep_assert_held(&ct->fast_lock);
@@ -390,7 +390,7 @@ static void __g2h_reserve_space(struct xe_guc_ct *ct, u32 g2h_len, u32 num_g2h)
 static void __g2h_release_space(struct xe_guc_ct *ct, u32 g2h_len)
 {
 	lockdep_assert_held(&ct->fast_lock);
-	XE_WARN_ON(ct->ctbs.g2h.info.space + g2h_len >
+	WARN_ON(ct->ctbs.g2h.info.space + g2h_len >
 		   ct->ctbs.g2h.info.size - ct->ctbs.g2h.info.resv_space);
 
 	ct->ctbs.g2h.info.space += g2h_len;
@@ -420,8 +420,8 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	full_len = len + GUC_CTB_HDR_LEN;
 
 	lockdep_assert_held(&ct->lock);
-	XE_WARN_ON(full_len > (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
-	XE_WARN_ON(tail > h2g->info.size);
+	WARN_ON(full_len > (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
+	WARN_ON(tail > h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
 	if (tail + full_len > h2g->info.size) {
@@ -479,10 +479,10 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
 {
 	int ret;
 
-	XE_WARN_ON(g2h_len && g2h_fence);
-	XE_WARN_ON(num_g2h && g2h_fence);
-	XE_WARN_ON(g2h_len && !num_g2h);
-	XE_WARN_ON(!g2h_len && num_g2h);
+	WARN_ON(g2h_len && g2h_fence);
+	WARN_ON(num_g2h && g2h_fence);
+	WARN_ON(g2h_len && !num_g2h);
+	WARN_ON(!g2h_len && num_g2h);
 	lockdep_assert_held(&ct->lock);
 
 	if (unlikely(ct->ctbs.h2g.info.broken)) {
@@ -553,7 +553,7 @@ static int guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	unsigned int sleep_period_ms = 1;
 	int ret;
 
-	XE_WARN_ON(g2h_len && g2h_fence);
+	WARN_ON(g2h_len && g2h_fence);
 	lockdep_assert_held(&ct->lock);
 	xe_device_assert_mem_access(ct_to_xe(ct));
 
@@ -623,7 +623,7 @@ static int guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	int ret;
 
-	XE_WARN_ON(g2h_len && g2h_fence);
+	WARN_ON(g2h_len && g2h_fence);
 
 	mutex_lock(&ct->lock);
 	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, g2h_fence);
@@ -799,7 +799,7 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		return 0;
 	}
 
-	XE_WARN_ON(fence != g2h_fence->seqno);
+	WARN_ON(fence != g2h_fence->seqno);
 
 	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
 		g2h_fence->fail = true;
@@ -1024,7 +1024,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
 							   adj_len);
 		break;
 	default:
-		XE_WARN_ON("NOT_POSSIBLE");
+		WARN_ON("NOT_POSSIBLE");
 	}
 
 	if (ret)
diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
index 76aed9c348ab..a7c9509591e3 100644
--- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
+++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
@@ -120,7 +120,7 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 
-	XE_WARN_ON(!guc->hwconfig.bo);
+	WARN_ON(!guc->hwconfig.bo);
 
 	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
 			   guc->hwconfig.size);
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 63904007af0a..4bdeb4b4ce78 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -55,12 +55,12 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
 	size_t size;
 	int i, j;
 
-	XE_WARN_ON(!log->bo);
+	WARN_ON(!log->bo);
 
 	size = log->bo->size;
 
 #define DW_PER_READ		128
-	XE_WARN_ON(size % (DW_PER_READ * sizeof(u32)));
+	WARN_ON(size % (DW_PER_READ * sizeof(u32)));
 	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
 		u32 read[DW_PER_READ];
 
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 91a3967fd799..440112726f3d 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -402,7 +402,7 @@ static ssize_t freq_cur_show(struct device *dev,
 	freq = REG_FIELD_GET(REQ_RATIO_MASK, freq);
 	ret = sysfs_emit(buf, "%d\n", decode_freq(freq));
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
 	xe_device_mem_access_put(gt_to_xe(gt));
 	return ret;
@@ -471,7 +471,7 @@ static ssize_t freq_min_show(struct device *dev,
 	ret = sysfs_emit(buf, "%d\n", pc_get_min_freq(pc));
 
 fw:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 out:
 	mutex_unlock(&pc->freq_lock);
 	xe_device_mem_access_put(pc_to_xe(pc));
@@ -761,7 +761,7 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 	xe_mmio_write32(gt, RC_CONTROL, 0);
 	xe_mmio_write32(gt, RC_STATE, 0);
 
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return 0;
 }
@@ -771,7 +771,7 @@ static void pc_init_pcode_freq(struct xe_guc_pc *pc)
 	u32 min = DIV_ROUND_CLOSEST(pc->rpn_freq, GT_FREQUENCY_MULTIPLIER);
 	u32 max = DIV_ROUND_CLOSEST(pc->rp0_freq, GT_FREQUENCY_MULTIPLIER);
 
-	XE_WARN_ON(xe_pcode_init_min_freq_table(pc_to_gt(pc), min, max));
+	WARN_ON(xe_pcode_init_min_freq_table(pc_to_gt(pc), min, max));
 }
 
 static int pc_init_freqs(struct xe_guc_pc *pc)
@@ -814,7 +814,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int ret;
 
-	XE_WARN_ON(!xe_device_guc_submission_enabled(xe));
+	WARN_ON(!xe_device_guc_submission_enabled(xe));
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
@@ -848,7 +848,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	ret = pc_action_setup_gucrc(pc, XE_GUCRC_FIRMWARE_CONTROL);
 
 out:
-	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
+	WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 	xe_device_mem_access_put(pc_to_xe(pc));
 	return ret;
 }
@@ -885,8 +885,8 @@ static void pc_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_pc *pc = arg;
 
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
-	XE_WARN_ON(xe_guc_pc_stop(pc));
+	WARN_ON(xe_guc_pc_gucrc_disable(pc));
+	WARN_ON(xe_guc_pc_stop(pc));
 	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
 	xe_bo_unpin_map_no_vm(pc->bo);
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ebf62c4028de..d4740cd8bc05 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -328,7 +328,7 @@ static void __guc_engine_policy_start_klv(struct engine_policy *policy,
 static void __guc_engine_policy_add_##func(struct engine_policy *policy, \
 					   u32 data) \
 { \
-	XE_WARN_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
+	WARN_ON(policy->count >= GUC_CONTEXT_POLICIES_KLV_NUM_IDS); \
 \
 	policy->h2g.klv[policy->count].kl = \
 		FIELD_PREP(GUC_KLV_0_KEY, \
@@ -357,7 +357,7 @@ static void init_policies(struct xe_guc *guc, struct xe_engine *e)
 	u32 timeslice_us = e->sched_props.timeslice_us;
 	u32 preempt_timeout_us = e->sched_props.preempt_timeout_us;
 
-	XE_WARN_ON(!engine_registered(e));
+	WARN_ON(!engine_registered(e));
 
 	__guc_engine_policy_start_klv(&policy, e->guc->id);
 	__guc_engine_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
@@ -395,7 +395,7 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 	int len = 0;
 	int i;
 
-	XE_WARN_ON(!xe_engine_is_parallel(e));
+	WARN_ON(!xe_engine_is_parallel(e));
 
 	action[len++] = XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
 	action[len++] = info->flags;
@@ -418,7 +418,7 @@ static void __register_mlrc_engine(struct xe_guc *guc,
 		action[len++] = upper_32_bits(xe_lrc_descriptor(lrc));
 	}
 
-	XE_WARN_ON(len > MAX_MLRC_REG_SIZE);
+	WARN_ON(len > MAX_MLRC_REG_SIZE);
 #undef MAX_MLRC_REG_SIZE
 
 	xe_guc_ct_send(&guc->ct, action, len, 0, 0);
@@ -452,7 +452,7 @@ static void register_engine(struct xe_engine *e)
 	struct xe_lrc *lrc = e->lrc;
 	struct guc_ctxt_registration_info info;
 
-	XE_WARN_ON(engine_registered(e));
+	WARN_ON(engine_registered(e));
 
 	memset(&info, 0, sizeof(info));
 	info.context_idx = e->guc->id;
@@ -542,7 +542,7 @@ static int wq_noop_append(struct xe_engine *e)
 	if (wq_wait_for_space(e, wq_space_until_wrap(e)))
 		return -ENODEV;
 
-	XE_WARN_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
+	WARN_ON(!FIELD_FIT(WQ_LEN_MASK, len_dw));
 
 	parallel_write(xe, map, wq[e->guc->wqi_tail / sizeof(u32)],
 		       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
@@ -581,13 +581,13 @@ static void wq_item_append(struct xe_engine *e)
 		wqi[i++] = lrc->ring.tail / sizeof(u64);
 	}
 
-	XE_WARN_ON(i != wqi_size / sizeof(u32));
+	WARN_ON(i != wqi_size / sizeof(u32));
 
 	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
 				      wq[e->guc->wqi_tail / sizeof(u32)]));
 	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
 	e->guc->wqi_tail += wqi_size;
-	XE_WARN_ON(e->guc->wqi_tail > WQ_SIZE);
+	WARN_ON(e->guc->wqi_tail > WQ_SIZE);
 
 	xe_device_wmb(xe);
 
@@ -606,7 +606,7 @@ static void submit_engine(struct xe_engine *e)
 	int len = 0;
 	bool extra_submit = false;
 
-	XE_WARN_ON(!engine_registered(e));
+	WARN_ON(!engine_registered(e));
 
 	if (xe_engine_is_parallel(e))
 		wq_item_append(e);
@@ -654,8 +654,8 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
 	struct xe_engine *e = job->engine;
 	bool lr = xe_engine_is_lr(e);
 
-	XE_WARN_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
-		   !engine_banned(e) && !engine_suspended(e));
+	WARN_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
+		!engine_banned(e) && !engine_suspended(e));
 
 	trace_xe_sched_job_run(job);
 
@@ -711,7 +711,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	if (!ret) {
 		struct drm_gpu_scheduler *sched = &e->guc->sched;
 
-		XE_WARN_ON("Pending enable failed to respond");
+		WARN_ON("Pending enable failed to respond");
 		sched->timeout = MIN_SCHED_TIMEOUT;
 		drm_sched_run_wq_start(sched);
 		xe_gt_reset_async(e->gt);
@@ -795,7 +795,7 @@ static void xe_guc_engine_lr_cleanup(struct work_struct *w)
 	struct xe_engine *e = ge->engine;
 	struct drm_gpu_scheduler *sched = &ge->sched;
 
-	XE_WARN_ON(!xe_engine_is_lr(e));
+	WARN_ON(!xe_engine_is_lr(e));
 	trace_xe_engine_lr_cleanup(e);
 
 	/* Kill the run_job / process_msg entry points */
@@ -817,7 +817,7 @@ static void xe_guc_engine_lr_cleanup(struct work_struct *w)
 					 !engine_pending_disable(e) ||
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			XE_WARN_ON("Schedule disable failed to respond");
+			WARN_ON("Schedule disable failed to respond");
 			drm_sched_run_wq_start(sched);
 			xe_gt_reset_async(e->gt);
 			return;
@@ -839,8 +839,8 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 
 	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		XE_WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
-		XE_WARN_ON(e->flags & ENGINE_FLAG_VM && !engine_killed(e));
+		WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
+		WARN_ON(e->flags & ENGINE_FLAG_VM && !engine_killed(e));
 
 		drm_warn(&xe->drm, "Timedout job: seqno=%u, guc_id=%d, flags=0x%lx",
 			 xe_sched_job_seqno(job), e->guc->id, e->flags);
@@ -893,7 +893,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
 					 !engine_pending_disable(e) ||
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
-			XE_WARN_ON("Schedule disable failed to respond");
+			WARN_ON("Schedule disable failed to respond");
 			sched->timeout = MIN_SCHED_TIMEOUT;
 			list_add(&drm_job->list, &sched->pending_list);
 			drm_sched_run_wq_start(sched);
@@ -983,7 +983,7 @@ static void __guc_engine_process_msg_cleanup(struct drm_sched_msg *msg)
 	struct xe_engine *e = msg->private_data;
 	struct xe_guc *guc = engine_to_guc(e);
 
-	XE_WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
+	WARN_ON(e->flags & ENGINE_FLAG_KERNEL);
 	trace_xe_engine_cleanup_entity(e);
 
 	if (engine_registered(e))
@@ -1011,9 +1011,9 @@ static void suspend_fence_signal(struct xe_engine *e)
 {
 	struct xe_guc *guc = engine_to_guc(e);
 
-	XE_WARN_ON(!engine_suspended(e) && !engine_killed(e) &&
-		   !guc_read_stopped(guc));
-	XE_WARN_ON(!e->guc->suspend_pending);
+	WARN_ON(!engine_suspended(e) && !engine_killed(e) &&
+		!guc_read_stopped(guc));
+	WARN_ON(!e->guc->suspend_pending);
 
 	e->guc->suspend_pending = false;
 	smp_wmb();
@@ -1099,7 +1099,7 @@ static void guc_engine_process_msg(struct drm_sched_msg *msg)
 		__guc_engine_process_msg_resume(msg);
 		break;
 	default:
-		XE_WARN_ON("Unknown message type");
+		WARN_ON("Unknown message type");
 	}
 }
 
@@ -1118,7 +1118,7 @@ static int guc_engine_init(struct xe_engine *e)
 	long timeout;
 	int err;
 
-	XE_WARN_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
+	WARN_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
 
 	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
 	if (!ge)
@@ -1176,7 +1176,7 @@ static int guc_engine_init(struct xe_engine *e)
 		sprintf(e->name, "ccs%d", e->guc->id);
 		break;
 	default:
-		XE_WARN_ON(e->class);
+		WARN_ON(e->class);
 	}
 
 	trace_xe_engine_create(e);
@@ -1282,9 +1282,9 @@ static int guc_engine_set_job_timeout(struct xe_engine *e, u32 job_timeout_ms)
 {
 	struct drm_gpu_scheduler *sched = &e->guc->sched;
 
-	XE_WARN_ON(engine_registered(e));
-	XE_WARN_ON(engine_banned(e));
-	XE_WARN_ON(engine_killed(e));
+	WARN_ON(engine_registered(e));
+	WARN_ON(engine_banned(e));
+	WARN_ON(engine_killed(e));
 
 	sched->timeout = job_timeout_ms;
 
@@ -1316,7 +1316,7 @@ static void guc_engine_resume(struct xe_engine *e)
 {
 	struct drm_sched_msg *msg = e->guc->static_msgs + STATIC_MSG_RESUME;
 
-	XE_WARN_ON(e->guc->suspend_pending);
+	WARN_ON(e->guc->suspend_pending);
 
 	guc_engine_add_msg(e, msg, RESUME);
 }
@@ -1416,7 +1416,7 @@ int xe_guc_submit_stop(struct xe_guc *guc)
 	struct xe_engine *e;
 	unsigned long index;
 
-	XE_WARN_ON(guc_read_stopped(guc) != 1);
+	WARN_ON(guc_read_stopped(guc) != 1);
 
 	mutex_lock(&guc->submission_state.lock);
 
@@ -1455,7 +1455,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
 	struct xe_engine *e;
 	unsigned long index;
 
-	XE_WARN_ON(guc_read_stopped(guc) != 1);
+	WARN_ON(guc_read_stopped(guc) != 1);
 
 	mutex_lock(&guc->submission_state.lock);
 	atomic_dec(&guc->submission_state.stopped);
@@ -1485,7 +1485,7 @@ g2h_engine_lookup(struct xe_guc *guc, u32 guc_id)
 		return NULL;
 	}
 
-	XE_WARN_ON(e->guc->id != guc_id);
+	WARN_ON(e->guc->id != guc_id);
 
 	return e;
 }
diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
index f42c0ab27cdc..45de49b25263 100644
--- a/drivers/gpu/drm/xe/xe_huc.c
+++ b/drivers/gpu/drm/xe/xe_huc.c
@@ -72,7 +72,7 @@ int xe_huc_auth(struct xe_huc *huc)
 	if (xe_uc_fw_is_disabled(&huc->fw))
 		return 0;
 
-	XE_WARN_ON(xe_uc_fw_is_running(&huc->fw));
+	WARN_ON(xe_uc_fw_is_running(&huc->fw));
 
 	if (!xe_uc_fw_is_loaded(&huc->fw))
 		return -ENOEXEC;
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index ead5aa285619..681b49bec50f 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -237,7 +237,7 @@ static void hw_engine_fini(struct drm_device *drm, void *arg)
 static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
 				   u32 val)
 {
-	XE_WARN_ON(reg.addr & hwe->mmio_base);
+	WARN_ON(reg.addr & hwe->mmio_base);
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
 
 	reg.addr += hwe->mmio_base;
@@ -247,7 +247,7 @@ static void hw_engine_mmio_write32(struct xe_hw_engine *hwe, struct xe_reg reg,
 
 static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 {
-	XE_WARN_ON(reg.addr & hwe->mmio_base);
+	WARN_ON(reg.addr & hwe->mmio_base);
 	xe_force_wake_assert_held(gt_to_fw(hwe->gt), hwe->domain);
 
 	reg.addr += hwe->mmio_base;
@@ -351,7 +351,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 
 	info = &engine_infos[id];
 
-	XE_WARN_ON(hwe->gt);
+	WARN_ON(hwe->gt);
 
 	hwe->gt = gt;
 	hwe->class = info->class;
@@ -377,8 +377,8 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	struct xe_tile *tile = gt_to_tile(gt);
 	int err;
 
-	XE_WARN_ON(id >= ARRAY_SIZE(engine_infos) || !engine_infos[id].name);
-	XE_WARN_ON(!(gt->info.engine_mask & BIT(id)));
+	WARN_ON(id >= ARRAY_SIZE(engine_infos) || !engine_infos[id].name);
+	WARN_ON(!(gt->info.engine_mask & BIT(id)));
 
 	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
 	xe_reg_sr_apply_whitelist(hwe);
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index a6094c81f2ad..1214422b28ad 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -88,14 +88,14 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
 	int err;
 	bool tmp;
 
-	if (XE_WARN_ON(!list_empty(&irq->pending))) {
+	if (WARN_ON(!list_empty(&irq->pending))) {
 		tmp = dma_fence_begin_signalling();
 		spin_lock_irqsave(&irq->lock, flags);
 		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
 			list_del_init(&fence->irq_link);
 			err = dma_fence_signal_locked(&fence->dma);
 			dma_fence_put(&fence->dma);
-			XE_WARN_ON(err);
+			WARN_ON(err);
 		}
 		spin_unlock_irqrestore(&irq->lock, flags);
 		dma_fence_end_signalling(tmp);
@@ -188,7 +188,7 @@ static void xe_hw_fence_release(struct dma_fence *dma_fence)
 	struct xe_hw_fence *fence = to_xe_hw_fence(dma_fence);
 
 	trace_xe_hw_fence_free(fence);
-	XE_WARN_ON(!list_empty(&fence->irq_link));
+	WARN_ON(!list_empty(&fence->irq_link));
 	call_rcu(&dma_fence->rcu, fence_free);
 }
 
@@ -202,7 +202,7 @@ static const struct dma_fence_ops xe_hw_fence_ops = {
 
 static struct xe_hw_fence *to_xe_hw_fence(struct dma_fence *fence)
 {
-	if (XE_WARN_ON(fence->ops != &xe_hw_fence_ops))
+	if (WARN_ON(fence->ops != &xe_hw_fence_ops))
 		return NULL;
 
 	return container_of(fence, struct xe_hw_fence, dma);
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 05f3d8d68379..fdac00901b16 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -108,7 +108,7 @@ static void set_offsets(u32 *regs,
 		*regs |= MI_LRI_LRM_CS_MMIO;
 		regs++;
 
-		XE_WARN_ON(!count);
+		WARN_ON(!count);
 		do {
 			u32 offset = 0;
 			u8 v;
@@ -528,7 +528,7 @@ static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
 { \
 	struct iosys_map map = lrc->bo->vmap; \
 \
-	XE_WARN_ON(iosys_map_is_null(&map)); \
+	WARN_ON(iosys_map_is_null(&map)); \
 	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
 	return map; \
 } \
@@ -759,12 +759,12 @@ void xe_lrc_write_ring(struct xe_lrc *lrc, const void *data, size_t size)
 	u32 rhs;
 	size_t aligned_size;
 
-	XE_WARN_ON(!IS_ALIGNED(size, 4));
+	WARN_ON(!IS_ALIGNED(size, 4));
 	aligned_size = ALIGN(size, 8);
 
 	ring = __xe_lrc_ring_map(lrc);
 
-	XE_WARN_ON(lrc->ring.tail >= lrc->ring.size);
+	WARN_ON(lrc->ring.tail >= lrc->ring.size);
 	rhs = lrc->ring.size - lrc->ring.tail;
 	if (size > rhs) {
 		__xe_lrc_write_ring(lrc, ring, data, rhs);
diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
index daf56c846d03..e5d160b0beef 100644
--- a/drivers/gpu/drm/xe/xe_macros.h
+++ b/drivers/gpu/drm/xe/xe_macros.h
@@ -8,8 +8,6 @@
 
 #include <linux/bug.h>
 
-#define XE_WARN_ON WARN_ON
-
 #define XE_IOCTL_DBG(xe, cond) \
 	((cond) && (drm_dbg(&(xe)->drm, \
 			    "Ioctl argument check failed at %s:%d: %s", \
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 12d07848e105..81a41607d22d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -106,7 +106,7 @@ static void xe_migrate_fini(struct drm_device *dev, void *arg)
 
 static u64 xe_migrate_vm_addr(u64 slot, u32 level)
 {
-	XE_WARN_ON(slot >= NUM_PT_SLOTS);
+	WARN_ON(slot >= NUM_PT_SLOTS);
 
 	/* First slot is reserved for mapping of PT bo and bb, start from 1 */
 	return (slot + 1ULL) << xe_pt_shift(level + 1);
@@ -148,7 +148,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
 
 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE, &is_vram);
-	XE_WARN_ON(!is_vram);
+	WARN_ON(!is_vram);
 	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
 
 	return 0;
@@ -173,7 +173,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	BUILD_BUG_ON(!(NUM_KERNEL_PDE & 1));
 
 	/* Need to be sure everything fits in the first PT, or create more */
-	XE_WARN_ON(m->batch_base_ofs + batch->size >= SZ_2M);
+	WARN_ON(m->batch_base_ofs + batch->size >= SZ_2M);
 
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm,
 				  num_entries * XE_PAGE_SIZE,
@@ -208,7 +208,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 	}
 
 	if (!IS_DGFX(xe)) {
-		XE_WARN_ON(xe->info.supports_usm);
+		WARN_ON(xe->info.supports_usm);
 
 		/* Write out batch too */
 		m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
@@ -464,7 +464,7 @@ static void emit_pte(struct xe_migrate *m,
 				/* Is this a 64K PTE entry? */
 				if ((m->eng->vm->flags & XE_VM_FLAG_64K) &&
 				    !(cur_ofs & (16 * 8 - 1))) {
-					XE_WARN_ON(!IS_ALIGNED(addr, SZ_64K));
+					WARN_ON(!IS_ALIGNED(addr, SZ_64K));
 					addr |= XE_PTE_PS64;
 				}
 
@@ -493,7 +493,7 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
 
 	num_ccs_blks = DIV_ROUND_UP(xe_device_ccs_bytes(gt_to_xe(gt), size),
 				    NUM_CCS_BYTES_PER_BLOCK);
-	XE_WARN_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER);
+	WARN_ON(num_ccs_blks > NUM_CCS_BLKS_PER_XFER);
 	*cs++ = XY_CTRL_SURF_COPY_BLT |
 		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
 		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
@@ -513,9 +513,9 @@ static void emit_copy(struct xe_gt *gt, struct xe_bb *bb,
 		      u64 src_ofs, u64 dst_ofs, unsigned int size,
 		      unsigned int pitch)
 {
-	XE_WARN_ON(size / pitch > S16_MAX);
-	XE_WARN_ON(pitch / 4 > S16_MAX);
-	XE_WARN_ON(pitch > U16_MAX);
+	WARN_ON(size / pitch > S16_MAX);
+	WARN_ON(pitch / 4 > S16_MAX);
+	WARN_ON(pitch > U16_MAX);
 
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_CMD | (10 - 2);
 	bb->cs[bb->len++] = XY_FAST_COPY_BLT_DEPTH_32 | pitch;
@@ -575,7 +575,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 		 * At the moment, we don't support copying CCS metadata from
 		 * system to system.
 		 */
-		XE_WARN_ON(!src_is_vram && !dst_is_vram);
+		WARN_ON(!src_is_vram && !dst_is_vram);
 
 		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
 			      src_is_vram, dst_size);
@@ -627,10 +627,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
 
 	/* Copying CCS between two different BOs is not supported yet. */
-	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
+	if (WARN_ON(copy_ccs && src_bo != dst_bo))
 		return ERR_PTR(-EINVAL);
 
-	if (src_bo != dst_bo && XE_WARN_ON(src_bo->size != dst_bo->size))
+	if (src_bo != dst_bo && WARN_ON(src_bo->size != dst_bo->size))
 		return ERR_PTR(-EINVAL);
 
 	if (!src_is_vram)
@@ -787,7 +787,7 @@ static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs
 	*cs++ = upper_32_bits(src_ofs);
 	*cs++ = FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
 
-	XE_WARN_ON(cs - bb->cs != len + bb->len);
+	WARN_ON(cs - bb->cs != len + bb->len);
 
 	bb->len += len;
 }
@@ -825,7 +825,7 @@ static void emit_clear_main_copy(struct xe_gt *gt, struct xe_bb *bb,
 		*cs++ = 0;
 	}
 
-	XE_WARN_ON(cs - bb->cs != len + bb->len);
+	WARN_ON(cs - bb->cs != len + bb->len);
 
 	bb->len += len;
 }
@@ -998,16 +998,16 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
 	 * PDE. This requires a BO that is almost vm->size big.
 	 *
 	 * This shouldn't be possible in practice.. might change when 16K
-	 * pages are used. Hence the XE_WARN_ON.
+	 * pages are used. Hence the WARN_ON.
 	 */
-	XE_WARN_ON(update->qwords > 0x1ff);
+	WARN_ON(update->qwords > 0x1ff);
 	if (!ppgtt_ofs) {
 		bool is_vram;
 
 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
 							   XE_PAGE_SIZE,
 							   &is_vram));
-		XE_WARN_ON(!is_vram);
+		WARN_ON(!is_vram);
 	}
 
 	do {
@@ -1194,7 +1194,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
 	 * Should be reasonably bound..
 	 */
-	XE_WARN_ON(batch_size >= SZ_128K);
+	WARN_ON(batch_size >= SZ_128K);
 
 	bb = xe_bb_new(gt, batch_size, !eng && xe->info.supports_usm);
 	if (IS_ERR(bb))
@@ -1204,7 +1204,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	if (!IS_DGFX(xe)) {
 		ppgtt_ofs = NUM_KERNEL_PDE - 1;
 		if (eng) {
-			XE_WARN_ON(num_updates > NUM_VMUSA_WRITES_PER_UNIT);
+			WARN_ON(num_updates > NUM_VMUSA_WRITES_PER_UNIT);
 
 			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
 						 GFP_KERNEL, true, 0);
@@ -1233,7 +1233,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 		for (i = 0; i < num_updates; i++) {
 			struct xe_bo *pt_bo = updates[i].pt_bo;
 
-			XE_WARN_ON(pt_bo->size != SZ_4K);
+			WARN_ON(pt_bo->size != SZ_4K);
 
 			addr = xe_pte_encode(NULL, pt_bo, 0, XE_CACHE_WB, 0);
 			bb->cs[bb->len++] = lower_32_bits(addr);
diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
index ccc852500eda..0906fceafea8 100644
--- a/drivers/gpu/drm/xe/xe_mocs.c
+++ b/drivers/gpu/drm/xe/xe_mocs.c
@@ -438,9 +438,9 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
 	 * is still 0 at this point, we'll assume that it was omitted by
 	 * mistake in the switch statement above.
 	 */
-	XE_WARN_ON(info->unused_entries_index == 0);
+	WARN_ON(info->unused_entries_index == 0);
 
-	if (XE_WARN_ON(info->size > info->n_entries)) {
+	if (WARN_ON(info->size > info->n_entries)) {
 		info->table = NULL;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d30ce2c5ee0c..b5d12165fab1 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -66,7 +66,7 @@ u64 xe_pde_encode(struct xe_bo *bo, u64 bo_offset,
 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE, &is_vram);
 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
 
-	XE_WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
+	WARN_ON(IS_DGFX(xe_bo_device(bo)) && !is_vram);
 
 	/* FIXME: I don't think the PPAT handling is correct for MTL */
 
@@ -133,7 +133,7 @@ static u64 __pte_encode(u64 pte, enum xe_cache_level cache,
 		pte |= XE_PDPE_PS_1G;
 
 	/* XXX: Does hw support 1 GiB pages? */
-	XE_WARN_ON(pt_level > 2);
+	WARN_ON(pt_level > 2);
 
 	return pte;
 }
@@ -233,7 +233,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	pt->level = level;
 	pt->base.dir = level ? &as_xe_pt_dir(pt)->dir : NULL;
 
-	XE_WARN_ON(level > XE_VM_MAX_LEVEL);
+	WARN_ON(level > XE_VM_MAX_LEVEL);
 
 	return pt;
 
@@ -302,7 +302,7 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 	if (!pt)
 		return;
 
-	XE_WARN_ON(!list_empty(&pt->bo->vmas));
+	WARN_ON(!list_empty(&pt->bo->vmas));
 	xe_bo_unpin(pt->bo);
 	xe_bo_put_deferred(pt->bo, deferred);
 
@@ -646,7 +646,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		struct xe_res_cursor *curs = xe_walk->curs;
 		bool is_null = xe_vma_is_null(xe_walk->vma);
 
-		XE_WARN_ON(xe_walk->va_curs_start != addr);
+		WARN_ON(xe_walk->va_curs_start != addr);
 
 		pte = __pte_encode(is_null ? 0 :
 				   xe_res_dma(curs) + xe_walk->dma_offset,
@@ -660,7 +660,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		if (level == 0 && !xe_parent->is_compact) {
 			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
 				pte |= XE_PTE_PS64;
-			else if (XE_WARN_ON(xe_walk->needs_64K))
+			else if (WARN_ON(xe_walk->needs_64K))
 				return -EINVAL;
 		}
 
@@ -885,8 +885,8 @@ static int xe_pt_zap_ptes_entry(struct xe_ptw *parent, pgoff_t offset,
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 	pgoff_t end_offset;
 
-	XE_WARN_ON(!*child);
-	XE_WARN_ON(!level && xe_child->is_compact);
+	WARN_ON(!*child);
+	WARN_ON(!level && xe_child->is_compact);
 
 	/*
 	 * Note that we're called from an entry callback, and we're dealing
@@ -1040,7 +1040,7 @@ xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
 	*num_entries = 0;
 	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
 	if (!err)
-		XE_WARN_ON(!*num_entries);
+		WARN_ON(!*num_entries);
 	else /* abort! */
 		xe_pt_abort_bind(vma, entries, *num_entries);
 
@@ -1062,7 +1062,7 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
 		u64 end;
 		u64 start;
 
-		XE_WARN_ON(entry->pt->is_compact);
+		WARN_ON(entry->pt->is_compact);
 		start = entry->ofs * page_size;
 		end = start + page_size * entry->qwords;
 		vm_dbg(&xe->drm,
@@ -1312,7 +1312,7 @@ static int invalidation_fence_init(struct xe_gt *gt,
 		dma_fence_put(&ifence->base.base);	/* Creation ref */
 	}
 
-	XE_WARN_ON(ret && ret != -ENOENT);
+	WARN_ON(ret && ret != -ENOENT);
 
 	return ret && ret != -ENOENT ? ret : 0;
 }
@@ -1392,7 +1392,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
 	err = xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
 	if (err)
 		goto err;
-	XE_WARN_ON(num_entries > ARRAY_SIZE(entries));
+	WARN_ON(num_entries > ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 	xe_pt_calc_rfence_interval(vma, &bind_pt_update, entries,
@@ -1551,8 +1551,8 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offset,
 {
 	struct xe_pt *xe_child = container_of(*child, typeof(*xe_child), base);
 
-	XE_WARN_ON(!*child);
-	XE_WARN_ON(!level && xe_child->is_compact);
+	WARN_ON(!*child);
+	WARN_ON(!level && xe_child->is_compact);
 
 	xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk);
 
@@ -1743,7 +1743,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
 
 	num_entries = xe_pt_stage_unbind(tile, vma, entries);
-	XE_WARN_ON(num_entries > ARRAY_SIZE(entries));
+	WARN_ON(num_entries > ARRAY_SIZE(entries));
 
 	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
 	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
@@ -1809,7 +1809,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
 		list_del_init(&vma->combined_links.rebind);
 
 	if (unbind_pt_update.locked) {
-		XE_WARN_ON(!xe_vma_is_userptr(vma));
+		WARN_ON(!xe_vma_is_userptr(vma));
 
 		if (!vma->tile_present) {
 			spin_lock(&vm->userptr.invalidated_lock);
diff --git a/drivers/gpu/drm/xe/xe_range_fence.c b/drivers/gpu/drm/xe/xe_range_fence.c
index d35d9ec58e86..2744008d4d50 100644
--- a/drivers/gpu/drm/xe/xe_range_fence.c
+++ b/drivers/gpu/drm/xe/xe_range_fence.c
@@ -119,7 +119,7 @@ void xe_range_fence_tree_init(struct xe_range_fence_tree *tree)
 void xe_range_fence_tree_fini(struct xe_range_fence_tree *tree)
 {
 	xe_range_fence_tree_remove_all(tree);
-	XE_WARN_ON(!RB_EMPTY_ROOT(&tree->root.rb_root));
+	WARN_ON(!RB_EMPTY_ROOT(&tree->root.rb_root));
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
index 7c88352636d2..bbea0ba6f568 100644
--- a/drivers/gpu/drm/xe/xe_reg_sr.c
+++ b/drivers/gpu/drm/xe/xe_reg_sr.c
@@ -204,7 +204,7 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
 		apply_one_mmio(gt, entry);
 
 	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	return;
 
@@ -256,7 +256,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
 	}
 
 	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	return;
 
diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
index 5cb4b66a5d74..231f0893b199 100644
--- a/drivers/gpu/drm/xe/xe_res_cursor.h
+++ b/drivers/gpu/drm/xe/xe_res_cursor.h
@@ -79,7 +79,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 	if (!res)
 		goto fallback;
 
-	XE_WARN_ON(start + size > res->size);
+	WARN_ON(start + size > res->size);
 
 	cur->mem_type = res->mem_type;
 
@@ -128,7 +128,7 @@ static inline void xe_res_first(struct ttm_resource *res,
 	cur->remaining = size;
 	cur->node = NULL;
 	cur->mem_type = XE_PL_TT;
-	XE_WARN_ON(res && start + size > res->size);
+	WARN_ON(res && start + size > res->size);
 }
 
 static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
@@ -139,7 +139,7 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
 	while (start >= sg_dma_len(sgl)) {
 		start -= sg_dma_len(sgl);
 		sgl = sg_next(sgl);
-		XE_WARN_ON(!sgl);
+		WARN_ON(!sgl);
 	}
 
 	cur->start = start;
@@ -161,9 +161,9 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
 				   u64 start, u64 size,
 				   struct xe_res_cursor *cur)
 {
-	XE_WARN_ON(!sg);
-	XE_WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
-		   !IS_ALIGNED(size, PAGE_SIZE));
+	WARN_ON(!sg);
+	WARN_ON(!IS_ALIGNED(start, PAGE_SIZE) ||
+		!IS_ALIGNED(size, PAGE_SIZE));
 	cur->node = NULL;
 	cur->start = start;
 	cur->remaining = size;
@@ -187,7 +187,7 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
 	struct list_head *next;
 	u64 start;
 
-	XE_WARN_ON(size > cur->remaining);
+	WARN_ON(size > cur->remaining);
 
 	cur->remaining -= size;
 	if (!cur->remaining)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
index c9ef44e63772..b82b679cfd23 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -233,7 +233,7 @@ static void __emit_job_gen12_copy(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
+	WARN_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
@@ -291,7 +291,7 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
+	WARN_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
@@ -339,7 +339,7 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
+	WARN_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
@@ -369,7 +369,7 @@ static void emit_migration_job_gen12(struct xe_sched_job *job,
 
 	i = emit_user_interrupt(dw, i);
 
-	XE_WARN_ON(i > MAX_JOB_SIZE_DW);
+	WARN_ON(i > MAX_JOB_SIZE_DW);
 
 	xe_lrc_write_ring(lrc, dw, i * sizeof(*dw));
 }
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index b5bf14b828f9..a3273a982a5c 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -142,7 +142,7 @@ struct xe_sched_job *xe_sched_job_create(struct xe_engine *e,
 
 		/* Sanity check */
 		for (j = 0; j < e->width; ++j)
-			XE_WARN_ON(cf->base.seqno != fences[j]->seqno);
+			WARN_ON(cf->base.seqno != fences[j]->seqno);
 
 		job->fence = &cf->base;
 	}
diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
index 9fcd7802ba30..ba502a6a77ed 100644
--- a/drivers/gpu/drm/xe/xe_sync.c
+++ b/drivers/gpu/drm/xe/xe_sync.c
@@ -75,7 +75,7 @@ static void user_fence_worker(struct work_struct *w)
 	if (mmget_not_zero(ufence->mm)) {
 		kthread_use_mm(ufence->mm);
 		if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
-			XE_WARN_ON("Copy to user failed");
+			WARN_ON("Copy to user failed");
 		kthread_unuse_mm(ufence->mm);
 		mmput(ufence->mm);
 	}
@@ -250,7 +250,7 @@ bool xe_sync_entry_signal(struct xe_sync_entry *sync, struct xe_sched_job *job,
 		if (err == -ENOENT) {
 			kick_ufence(sync->ufence, fence);
 		} else if (err) {
-			XE_WARN_ON("failed to add user fence");
+			WARN_ON("failed to add user fence");
 			user_fence_put(sync->ufence);
 			dma_fence_put(fence);
 		}
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 28b5d8ca5663..4399ad67c1e8 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -188,7 +188,7 @@ u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
 	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
 	struct xe_res_cursor cur;
 
-	XE_WARN_ON(!mgr->io_base);
+	WARN_ON(!mgr->io_base);
 
 	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
@@ -228,7 +228,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
 #ifdef CONFIG_X86
 	struct xe_bo *bo = ttm_to_xe_bo(mem->bo);
 
-	XE_WARN_ON(IS_DGFX(xe));
+	WARN_ON(IS_DGFX(xe));
 
 	/* XXX: Require BO to be mapped to GGTT? */
 	if (drm_WARN_ON(&xe->drm, !(bo->flags & XE_BO_CREATE_GGTT_BIT)))
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index addd6f2681b9..a31b853771da 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -162,7 +162,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 
 	/* We don't fail the driver load if HuC fails to auth, but let's warn */
 	ret = xe_huc_auth(&uc->huc);
-	XE_WARN_ON(ret);
+	WARN_ON(ret);
 
 	return 0;
 }
@@ -178,7 +178,7 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
 
 void xe_uc_gucrc_disable(struct xe_uc *uc)
 {
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
+	WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
 }
 
 void xe_uc_stop_prepare(struct xe_uc *uc)
diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe_uc_debugfs.c
index 0a39ec5a6e99..2248fc07ab3d 100644
--- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
@@ -17,7 +17,7 @@ void xe_uc_debugfs_register(struct xe_uc *uc, struct dentry *parent)
 
 	root = debugfs_create_dir("uc", parent);
 	if (IS_ERR(root)) {
-		XE_WARN_ON("Create UC directory failed");
+		WARN_ON("Create UC directory failed");
 		return;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
index 5413c246d5e8..203b20cf9738 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.c
+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
@@ -158,7 +158,7 @@ __uc_fw_to_gt(struct xe_uc_fw *uc_fw, enum xe_uc_fw_type type)
 	if (type == XE_UC_FW_TYPE_GUC)
 		return container_of(uc_fw, struct xe_gt, uc.guc.fw);
 
-	XE_WARN_ON(type != XE_UC_FW_TYPE_HUC);
+	WARN_ON(type != XE_UC_FW_TYPE_HUC);
 	return container_of(uc_fw, struct xe_gt, uc.huc.fw);
 }
 
@@ -194,7 +194,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
 	u32 count;
 	int i;
 
-	XE_WARN_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
+	WARN_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
 	entries = blobs_all[uc_fw->type].entries;
 	count = blobs_all[uc_fw->type].count;
 
@@ -223,8 +223,8 @@ size_t xe_uc_fw_copy_rsa(struct xe_uc_fw *uc_fw, void *dst, u32 max_len)
 	struct xe_device *xe = uc_fw_to_xe(uc_fw);
 	u32 size = min_t(u32, uc_fw->rsa_size, max_len);
 
-	XE_WARN_ON(size % 4);
-	XE_WARN_ON(!xe_uc_fw_is_available(uc_fw));
+	WARN_ON(size % 4);
+	WARN_ON(!xe_uc_fw_is_available(uc_fw));
 
 	xe_map_memcpy_from(xe, dst, &uc_fw->bo->vmap,
 			   xe_uc_fw_rsa_offset(uc_fw), size);
@@ -248,8 +248,8 @@ static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
 	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
 	struct xe_guc *guc = &gt->uc.guc;
 
-	XE_WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
-	XE_WARN_ON(uc_fw->major_ver_found < 70);
+	WARN_ON(uc_fw->type != XE_UC_FW_TYPE_GUC);
+	WARN_ON(uc_fw->major_ver_found < 70);
 
 	if (uc_fw->minor_ver_found >= 6) {
 		/* v70.6.0 adds CSS header support */
@@ -335,8 +335,8 @@ int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
 	 * before we're looked at the HW caps to see if we have uc support
 	 */
 	BUILD_BUG_ON(XE_UC_FIRMWARE_UNINITIALIZED);
-	XE_WARN_ON(uc_fw->status);
-	XE_WARN_ON(uc_fw->path);
+	WARN_ON(uc_fw->status);
+	WARN_ON(uc_fw->path);
 
 	uc_fw_auto_select(xe, uc_fw);
 	xe_uc_fw_change_status(uc_fw, uc_fw->path ? *uc_fw->path ?
@@ -502,7 +502,7 @@ int xe_uc_fw_upload(struct xe_uc_fw *uc_fw, u32 offset, u32 dma_flags)
 	int err;
 
 	/* make sure the status was cleared the last time we reset the uc */
-	XE_WARN_ON(xe_uc_fw_is_loaded(uc_fw));
+	WARN_ON(xe_uc_fw_is_loaded(uc_fw));
 
 	if (!xe_uc_fw_is_loadable(uc_fw))
 		return -ENOEXEC;
diff --git a/drivers/gpu/drm/xe/xe_uc_fw.h b/drivers/gpu/drm/xe/xe_uc_fw.h
index a519c77d4962..8cce3a487764 100644
--- a/drivers/gpu/drm/xe/xe_uc_fw.h
+++ b/drivers/gpu/drm/xe/xe_uc_fw.h
@@ -104,7 +104,7 @@ static inline enum xe_uc_fw_status
 __xe_uc_fw_status(struct xe_uc_fw *uc_fw)
 {
 	/* shouldn't call this before checking hw/blob availability */
-	XE_WARN_ON(uc_fw->status == XE_UC_FIRMWARE_UNINITIALIZED);
+	WARN_ON(uc_fw->status == XE_UC_FIRMWARE_UNINITIALIZED);
 	return uc_fw->status;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 9449167ba554..a2375b5e496b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -63,7 +63,7 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	bool read_only = xe_vma_read_only(vma);
 
 	lockdep_assert_held(&vm->lock);
-	XE_WARN_ON(!xe_vma_is_userptr(vma));
+	WARN_ON(!xe_vma_is_userptr(vma));
 retry:
 	if (vma->gpuva.flags & XE_VMA_DESTROYED)
 		return 0;
@@ -252,7 +252,7 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 		struct dma_fence *fence;
 
 		link = list->next;
-		XE_WARN_ON(link == list);
+		WARN_ON(link == list);
 
 		fence = xe_preempt_fence_arm(to_preempt_fence_from_link(link),
 					     e, e->compute.context,
@@ -329,7 +329,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
 	int err;
 	bool wait;
 
-	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
+	WARN_ON(!xe_vm_in_compute_mode(vm));
 
 	down_write(&vm->lock);
 
@@ -506,7 +506,7 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 	 * and holding the dma_resv of an object is required for list
 	 * addition, and we shouldn't add ourselves.
 	 */
-	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
+	WARN_ON(!list_empty(&vm->notifier.rebind_list));
 
 	ttm_eu_backoff_reservation(ww, objs);
 	if (tv && tv != tv_onstack)
@@ -549,7 +549,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	long wait;
 	int __maybe_unused tries = 0;
 
-	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
+	WARN_ON(!xe_vm_in_compute_mode(vm));
 	trace_xe_vm_rebind_worker_enter(vm);
 
 	down_write(&vm->lock);
@@ -708,7 +708,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	struct dma_fence *fence;
 	long err;
 
-	XE_WARN_ON(!xe_vma_is_userptr(vma));
+	WARN_ON(!xe_vma_is_userptr(vma));
 	trace_xe_vma_userptr_invalidate(vma);
 
 	if (!mmu_notifier_range_blockable(range))
@@ -752,11 +752,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	err = dma_resv_wait_timeout(&vm->resv,
 				    DMA_RESV_USAGE_BOOKKEEP,
 				    false, MAX_SCHEDULE_TIMEOUT);
-	XE_WARN_ON(err <= 0);
+	WARN_ON(err <= 0);
 
 	if (xe_vm_in_fault_mode(vm)) {
 		err = xe_vm_invalidate_vma(vma);
-		XE_WARN_ON(err);
+		WARN_ON(err);
 	}
 
 	trace_xe_vma_userptr_invalidate_complete(vma);
@@ -849,7 +849,7 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
 	xe_vm_assert_held(vm);
 	list_for_each_entry_safe(vma, next, &vm->rebind_list,
 				 combined_links.rebind) {
-		XE_WARN_ON(!vma->tile_present);
+		WARN_ON(!vma->tile_present);
 
 		list_del_init(&vma->combined_links.rebind);
 		dma_fence_put(fence);
@@ -877,8 +877,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	struct xe_tile *tile;
 	u8 id;
 
-	XE_WARN_ON(start >= end);
-	XE_WARN_ON(end >= vm->size);
+	WARN_ON(start >= end);
+	WARN_ON(end >= vm->size);
 
 	if (!bo && !is_null)	/* userptr */
 		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
@@ -1063,10 +1063,10 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 	struct xe_vm *vm = xe_vma_vm(vma);
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_WARN_ON(!list_empty(&vma->combined_links.destroy));
+	WARN_ON(!list_empty(&vma->combined_links.destroy));
 
 	if (xe_vma_is_userptr(vma)) {
-		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
+		WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
 
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_del(&vma->userptr.invalidate_link);
@@ -1096,7 +1096,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 						 vma_destroy_cb);
 
 		if (ret) {
-			XE_WARN_ON(ret != -ENOENT);
+			WARN_ON(ret != -ENOENT);
 			xe_vma_destroy_late(vma);
 		}
 	} else {
@@ -1122,7 +1122,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 		list_add(&tv[1].head, &objs);
 	}
 	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
-	XE_WARN_ON(err);
+	WARN_ON(err);
 
 	xe_vma_destroy(vma, NULL);
 
@@ -1141,7 +1141,7 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range)
 	if (xe_vm_is_closed_or_banned(vm))
 		return NULL;
 
-	XE_WARN_ON(start + range > vm->size);
+	WARN_ON(start + range > vm->size);
 
 	gpuva = drm_gpuva_find_first(&vm->mgr, start, range);
 
@@ -1152,18 +1152,18 @@ static int xe_vm_insert_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
 	int err;
 
-	XE_WARN_ON(xe_vma_vm(vma) != vm);
+	WARN_ON(xe_vma_vm(vma) != vm);
 	lockdep_assert_held(&vm->lock);
 
 	err = drm_gpuva_insert(&vm->mgr, &vma->gpuva);
-	XE_WARN_ON(err);	/* Shouldn't be possible */
+	WARN_ON(err);	/* Shouldn't be possible */
 
 	return err;
 }
 
 static void xe_vm_remove_vma(struct xe_vm *vm, struct xe_vma *vma)
 {
-	XE_WARN_ON(xe_vma_vm(vma) != vm);
+	WARN_ON(xe_vma_vm(vma) != vm);
 	lockdep_assert_held(&vm->lock);
 
 	drm_gpuva_remove(&vma->gpuva);
@@ -1386,7 +1386,7 @@ static void vm_error_capture(struct xe_vm *vm, int err,
 	}
 
 	if (copy_to_user(address, &capture, sizeof(capture)))
-		XE_WARN_ON("Copy to user failed");
+		WARN_ON("Copy to user failed");
 
 	if (in_kthread) {
 		kthread_unuse_mm(vm->async_ops.error_capture.mm);
@@ -1414,7 +1414,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	struct drm_gpuva *gpuva, *next;
 	u8 id;
 
-	XE_WARN_ON(vm->preempt.num_engines);
+	WARN_ON(vm->preempt.num_engines);
 
 	xe_vm_close(vm);
 	flush_async_ops(vm);
@@ -1486,7 +1486,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	if (vm->async_ops.error_capture.addr)
 		wake_up_all(&vm->async_ops.error_capture.wq);
 
-	XE_WARN_ON(!list_empty(&vm->extobj.list));
+	WARN_ON(!list_empty(&vm->extobj.list));
 	up_write(&vm->lock);
 
 	drm_gpuva_manager_destroy(&vm->mgr);
@@ -1515,7 +1515,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 	void *lookup;
 
 	/* xe_vm_close_and_put was not called? */
-	XE_WARN_ON(vm->size);
+	WARN_ON(vm->size);
 
 	if (!(vm->flags & XE_VM_FLAG_MIGRATION)) {
 		xe_device_mem_access_put(xe);
@@ -1523,7 +1523,7 @@ static void vm_destroy_work_func(struct work_struct *w)
 		if (xe->info.has_asid) {
 			mutex_lock(&xe->usm.lock);
 			lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
-			XE_WARN_ON(lookup != vm);
+			WARN_ON(lookup != vm);
 			mutex_unlock(&xe->usm.lock);
 		}
 	}
@@ -1789,7 +1789,7 @@ static void add_async_op_fence_cb(struct xe_vm *vm,
 		dma_fence_put(afence->wait_fence);
 		dma_fence_put(&afence->fence);
 	}
-	XE_WARN_ON(ret && ret != -ENOENT);
+	WARN_ON(ret && ret != -ENOENT);
 }
 
 int xe_vm_async_fence_wait_start(struct dma_fence *fence)
@@ -1798,7 +1798,7 @@ int xe_vm_async_fence_wait_start(struct dma_fence *fence)
 		struct async_op_fence *afence =
 			container_of(fence, struct async_op_fence, fence);
 
-		XE_WARN_ON(xe_vm_no_dma_fences(afence->vm));
+		WARN_ON(xe_vm_no_dma_fences(afence->vm));
 
 		smp_rmb();
 		return wait_event_interruptible(afence->wq, afence->started);
@@ -1824,7 +1824,7 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
 	} else {
 		int i;
 
-		XE_WARN_ON(!xe_vm_in_fault_mode(vm));
+		WARN_ON(!xe_vm_in_fault_mode(vm));
 
 		fence = dma_fence_get_stub();
 		if (last_op) {
@@ -2103,7 +2103,7 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 {
 	int err;
 
-	XE_WARN_ON(region > ARRAY_SIZE(region_to_mem_type));
+	WARN_ON(region > ARRAY_SIZE(region_to_mem_type));
 
 	if (!xe_vma_has_no_bo(vma)) {
 		err = xe_bo_migrate(xe_vma_bo(vma), region_to_mem_type[region]);
@@ -2184,7 +2184,7 @@ static int vm_bind_ioctl_lookup_vma(struct xe_vm *vm, struct xe_bo *bo,
 			return -ENODATA;
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		WARN_ON("NOT POSSIBLE");
 		return -EINVAL;
 	}
 
@@ -2242,7 +2242,7 @@ static void print_op(struct xe_device *xe, struct drm_gpuva_op *op)
 		       (ULL)xe_vma_start(vma), (ULL)xe_vma_size(vma));
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		WARN_ON("NOT POSSIBLE");
 	}
 }
 #else
@@ -2317,7 +2317,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		}
 		break;
 	case XE_VM_BIND_OP_UNMAP_ALL:
-		XE_WARN_ON(!bo);
+		WARN_ON(!bo);
 
 		err = xe_bo_lock(bo, &ww, 0, true);
 		if (err)
@@ -2334,7 +2334,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 		}
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		WARN_ON("NOT POSSIBLE");
 		ops = ERR_PTR(-EINVAL);
 	}
 
@@ -2421,7 +2421,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 	int err, i;
 
 	lockdep_assert_held_write(&vm->lock);
-	XE_WARN_ON(num_ops_list > 1 && !async);
+	WARN_ON(num_ops_list > 1 && !async);
 
 	if (num_syncs && async) {
 		u64 seqno;
@@ -2450,7 +2450,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
 			bool first = !async_list;
 
-			XE_WARN_ON(!first && !async);
+			WARN_ON(!first && !async);
 
 			INIT_LIST_HEAD(&op->link);
 			if (first)
@@ -2562,7 +2562,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_engine *e,
 				/* Nothing to do */
 				break;
 			default:
-				XE_WARN_ON("NOT POSSIBLE");
+				WARN_ON("NOT POSSIBLE");
 			}
 
 			last_op = op;
@@ -2624,7 +2624,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
 		/* Nothing to do */
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		WARN_ON("NOT POSSIBLE");
 	}
 
 	op->flags |= XE_VMA_OP_COMMITTED;
@@ -2742,7 +2742,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
 				     op->flags & XE_VMA_OP_LAST);
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		WARN_ON("NOT POSSIBLE");
 	}
 
 	ttm_eu_backoff_reservation(&ww, &objs);
@@ -2801,7 +2801,7 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
 					  op);
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		WARN_ON("NOT POSSIBLE");
 	}
 
 	return ret;
@@ -2877,7 +2877,7 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		/* Nothing to do */
 		break;
 	default:
-		XE_WARN_ON("NOT POSSIBLE");
+		WARN_ON("NOT POSSIBLE");
 	}
 }
 
@@ -3409,7 +3409,7 @@ int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
 	LIST_HEAD(objs);
 	LIST_HEAD(dups);
 
-	XE_WARN_ON(!ww);
+	WARN_ON(!ww);
 
 	tv_vm.num_shared = num_resv;
 	tv_vm.bo = xe_vm_ttm_bo(vm);
@@ -3443,8 +3443,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	u8 id;
 	int ret;
 
-	XE_WARN_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
-	XE_WARN_ON(xe_vma_is_null(vma));
+	WARN_ON(!xe_vm_in_fault_mode(xe_vma_vm(vma)));
+	WARN_ON(xe_vma_is_null(vma));
 	trace_xe_vma_usm_invalidate(vma);
 
 	/* Check that we don't race with page-table updates */
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4db777d7e375..c3723936aa2e 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -187,7 +187,7 @@ struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
 
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
-	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
+	WARN_ON(!xe_vm_in_compute_mode(vm));
 	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index b4e661576d08..e1bb59d989df 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -192,7 +192,7 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
 static int madvise_pin(struct xe_device *xe, struct xe_vm *vm,
 		       struct xe_vma **vmas, int num_vmas, u64 value)
 {
-	XE_WARN_ON("NIY");
+	WARN_ON("NIY");
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
index 761eed3a022f..3b56a4140ba2 100644
--- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
+++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
@@ -45,7 +45,7 @@ static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
 		passed = (rvalue & mask) <= (value & mask);
 		break;
 	default:
-		XE_WARN_ON("Not possible");
+		WARN_ON("Not possible");
 	}
 
 	return passed ? 0 : 1;
diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
index 9a85bcc18830..05ee2e90d5e9 100644
--- a/drivers/gpu/drm/xe/xe_wopcm.c
+++ b/drivers/gpu/drm/xe/xe_wopcm.c
@@ -144,10 +144,10 @@ static int __wopcm_init_regs(struct xe_device *xe, struct xe_gt *gt,
 	u32 mask;
 	int err;
 
-	XE_WARN_ON(!(base & GUC_WOPCM_OFFSET_MASK));
-	XE_WARN_ON(base & ~GUC_WOPCM_OFFSET_MASK);
-	XE_WARN_ON(!(size & GUC_WOPCM_SIZE_MASK));
-	XE_WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
+	WARN_ON(!(base & GUC_WOPCM_OFFSET_MASK));
+	WARN_ON(base & ~GUC_WOPCM_OFFSET_MASK);
+	WARN_ON(!(size & GUC_WOPCM_SIZE_MASK));
+	WARN_ON(size & ~GUC_WOPCM_SIZE_MASK);
 
 	mask = GUC_WOPCM_SIZE_MASK | GUC_WOPCM_SIZE_LOCKED;
 	err = xe_mmio_write32_and_verify(gt, GUC_WOPCM_SIZE, size, mask,
@@ -213,9 +213,9 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 	drm_dbg(&xe->drm, "WOPCM: %uK\n", wopcm->size / SZ_1K);
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
-	XE_WARN_ON(guc_fw_size >= wopcm->size);
-	XE_WARN_ON(huc_fw_size >= wopcm->size);
-	XE_WARN_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
+	WARN_ON(guc_fw_size >= wopcm->size);
+	WARN_ON(huc_fw_size >= wopcm->size);
+	WARN_ON(ctx_rsvd + WOPCM_RESERVED_SIZE >= wopcm->size);
 
 	locked = __wopcm_regs_locked(gt, &guc_wopcm_base, &guc_wopcm_size);
 	if (locked) {
@@ -256,8 +256,8 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
 			   guc_fw_size, huc_fw_size)) {
 		wopcm->guc.base = guc_wopcm_base;
 		wopcm->guc.size = guc_wopcm_size;
-		XE_WARN_ON(!wopcm->guc.base);
-		XE_WARN_ON(!wopcm->guc.size);
+		WARN_ON(!wopcm->guc.base);
+		WARN_ON(!wopcm->guc.size);
 	} else {
 		drm_notice(&xe->drm, "Unsuccessful WOPCM partitioning\n");
 		return -E2BIG;
-- 
2.34.1

