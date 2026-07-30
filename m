Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B192C55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 10:12:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF8110EEA0;
	Thu, 30 Jul 2026 10:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KhBHMw+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DF210EE81
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785406325; x=1816942325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cml1xvrKKR5YWZcxGNkVK6KLTbdgRtwG6J2FNMpv8+8=;
 b=KhBHMw+W4yBXjALIf5VCFS+8+TB2tn4AmPJNkV4IJsMukfpRAF4WHOft
 IfbeJWBbWkz9AqLHuqP8qjUe++3vYRXoV9B4eumjg5s3VI1Hbi4r7TyrE
 wZknHG6LexGLzOGidw7/aTqDRqoN25rKeunPsOXr8GadpFbV8cAXnkRlI
 YOKmydvxhBG/Y78B80qim7Qe66ePDTrvuGodS5mSgsr81y0LqRLLVJPjP
 BMBUSDmIiSL4F5RCz+aa7DK2Yr1gSlrC7MkgVtSj2aCDd+UoIFUcnCZx7
 P6adjTq9zPc0REN/ofR2HX+hRJiwQucMQbLm9aeEeQVPI6EDTG+YJJV7U A==;
X-CSE-ConnectionGUID: Nc7yO7TvQPKZRrsI9uXHrw==
X-CSE-MsgGUID: MNzPoWNNThqhbSN3idOSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73557245"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="73557245"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:12:04 -0700
X-CSE-ConnectionGUID: ilRfWODxRE2yoV0GPIwmhA==
X-CSE-MsgGUID: S0sXB1IJSnKY5AFBYGibwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="256925262"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 03:12:02 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V14 5/9] drm/xe: Handle physical memory address error
Date: Thu, 30 Jul 2026 15:41:27 +0530
Message-ID: <20260730101132.2770752-16-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
References: <20260730101132.2770752-11-tejas.upadhyay@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This functionality represents a significant step in making
the xe driver gracefully handle hardware memory degradation.
By integrating with the DRM Buddy allocator, the driver
can permanently "carve out" faulty memory so it isn't reused
by subsequent allocations.

Buddy Block Reservation:
When a memory address is reported as faulty, the driver instructs
the DRM Buddy allocator to reserve a block of the specific page
size (typically 4KB). This marks the memory as "dirty/used"
indefinitely.

Two-Stage Tracking:
Offlined Pages:
Pages that have been successfully isolated and removed from the
available memory pool.

Queued Pages:
Addresses that have been flagged as faulty but are currently in
use by a process. These are tracked until the associated buffer
object (BO) is released or migrated, at which point they move
to the "offlined" state.

v10(Sashiko):
- Move exec_queue_kill out to avoid vm lock deadlock
- Use u64 to avoid truncate
- remove id, offline addr itself is unique
v9(Sashiko):
- Move xe_exec_queue_put() outside bo lock to avoid sleeping under
  spinlock
- Check PURGED state before xe_bo_set_purgeable_state to avoid
  assertion if shrinker raced during unlocked window
- Add best-effort comment for flags check without resv lock
- Move xe_bo_put() (pbo_to_put) outside scoped_guard to avoid
  recursive deadlock
- Remove xe_ttm_vram_free_bad_pages from critical path
  (avoid UAF if another thread frees nentry while fault handler
  holds reference)
- Add comment documenting purge-to-reserve race window (self-corrects
  on next HW fault)
- In else branch, add nentry to queued_pages before buddy_alloc to
  prevent leak on allocation failure
- handle with Eexist for race case
v8(MattA):
- introduce helper for vram_buddy_alloc and free to avoid code dup
- Add WARN_ON for -ENXIO
v7:
- keep vm ref during vm kill and fix some typos
- FW communication code is moved in RAS, keep comment for same
V6:
- Use scope_guard for locking(MattB)
- Adapt addition of queue member of LRC BO(MattB)
- Extend and use xe_ttm_bo_purge API for vram pages(MattB)
- Handle dma_buf_map requests for native and remote(MattB)
- Address if in never initialized block, set block to NULL
V5:
- Categorise and handle BOs accordingly
- Fix crash found with new debugfs tests
V4:
- Set block->private NULL post bo purge
- Filter out gsm address early on
- Rebase
V3:
-rename api, remove tile dependency and add status of reservation
V2:
- Fix mm->avail counter issue
- Remove unused code and handle clean up in case of error

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 |  11 +-
 drivers/gpu/drm/xe/xe_bo.h                 |   4 +-
 drivers/gpu/drm/xe/xe_dma_buf.c            |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c         |   8 +-
 drivers/gpu/drm/xe/xe_pt.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 402 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  26 ++
 8 files changed, 422 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 52f81e972ada..23ad61ec3f5b 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -158,7 +158,16 @@ bool xe_bo_is_vm_bound(struct xe_bo *bo)
 	return !list_empty(&bo->ttm.base.gpuva.list);
 }
 
-static bool xe_bo_is_user(struct xe_bo *bo)
+/**
+ * xe_bo_is_user - check if BO is user created BO
+ * @bo: The BO
+ *
+ * Check if  BO is user created BO. This requires the
+ * reservation lock for the BO to be held.
+ *
+ * Returns: boolean
+ */
+bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_FLAG_USER;
 }
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 659e2888d419..c650186ff2ae 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -363,7 +363,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
 		xe_bo_lock(bo, false);
-		xe_bo_unpin(bo);
+		if (!xe_bo_is_purged(bo))
+			xe_bo_unpin(bo);
 		xe_bo_unlock(bo);
 
 		xe_bo_put(bo);
@@ -587,6 +588,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
 int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
+bool xe_bo_is_user(struct xe_bo *bo);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index bf0728838ead..5d9f1cd24b7f 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -104,6 +104,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 	struct sg_table *sgt;
 	int r = 0;
 
+	if (xe_bo_is_purged(bo))
+		return ERR_PTR(-ENOENT);
+
 	if (!attach->peer2peer && !xe_bo_can_migrate(bo, XE_PL_TT))
 		return ERR_PTR(-EOPNOTSUPP);
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ab81a512fb41..5a0d9f65cf3c 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1569,8 +1569,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
 	 * errors.
 	 */
 	lrc = q->lrc[0];
-	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
-	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
+	xe_bo_lock(lrc->bo, false);
+	if (!xe_bo_is_purged(lrc->bo)) {
+		new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
+		q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
+	}
+	xe_bo_unlock(lrc->bo);
 
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8cd89c4f49d0..6971882c6862 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -212,7 +212,8 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 		return;
 
 	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
-	xe_bo_unpin(pt->bo);
+	if (!xe_bo_is_purged(pt->bo))
+		xe_bo_unpin(pt->bo);
 	xe_bo_put_deferred(pt->bo, deferred);
 
 	if (pt->level > 0 && pt->num_live) {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 5ab5dfdb183c..d9dc0e51e365 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -11,9 +11,14 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_lrc.h"
+#include "xe_mmio.h"
 #include "xe_res_cursor.h"
+#include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 
@@ -46,6 +51,40 @@ static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
 	return true;
 }
 
+static int xe_ttm_vram_buddy_alloc(struct xe_ttm_vram_mgr *mgr, u64 start,
+				   u64 end, u64 size, u64 min_page_size,
+				   struct list_head *blocks, unsigned long flags,
+				   void *priv, u64 *used_visible)
+{
+	struct gpu_buddy *mm = &mgr->mm;
+	struct gpu_buddy_block *block;
+	int err;
+
+	err = gpu_buddy_alloc_blocks(mm, start, end, size, min_page_size, blocks, flags);
+	if (err)
+		return err;
+
+	list_for_each_entry(block, blocks, link)
+		block->private = priv;
+
+	if (end <= mgr->visible_size) {
+		*used_visible = size;
+	} else {
+		list_for_each_entry(block, blocks, link) {
+			u64 blk_start = gpu_buddy_block_offset(block);
+
+			if (blk_start < mgr->visible_size) {
+				u64 blk_end = blk_start + gpu_buddy_block_size(mm, block);
+
+				*used_visible += min(blk_end, mgr->visible_size) - blk_start;
+			}
+		}
+	}
+
+	mgr->visible_avail -= *used_visible;
+	return 0;
+}
+
 static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 			       struct ttm_buffer_object *tbo,
 			       const struct ttm_place *place,
@@ -54,7 +93,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
-	struct gpu_buddy_block *block;
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
@@ -115,32 +153,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 		goto error_unlock;
 	}
 
-	err = gpu_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
-				     (u64)lpfn << PAGE_SHIFT, size,
-				     min_page_size, &vres->blocks, vres->flags);
+	err = xe_ttm_vram_buddy_alloc(mgr, (u64)place->fpfn << PAGE_SHIFT,
+				      (u64)lpfn << PAGE_SHIFT, size,
+				      min_page_size, &vres->blocks, vres->flags,
+				      tbo, &vres->used_visible_size);
 	if (err)
 		goto error_unlock;
-
-	if (lpfn <= mgr->visible_size >> PAGE_SHIFT) {
-		vres->used_visible_size = size;
-	} else {
-		struct gpu_buddy_block *block;
-
-		list_for_each_entry(block, &vres->blocks, link) {
-			u64 start = gpu_buddy_block_offset(block);
-
-			if (start < mgr->visible_size) {
-				u64 end = start + gpu_buddy_block_size(mm, block);
-
-				vres->used_visible_size +=
-					min(end, mgr->visible_size) - start;
-			}
-		}
-	}
-
-	mgr->visible_avail -= vres->used_visible_size;
-	list_for_each_entry(block, &vres->blocks, link)
-		block->private = tbo;
 	mutex_unlock(&mgr->lock);
 
 	if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
@@ -172,20 +190,27 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	return err;
 }
 
+static void xe_ttm_vram_buddy_free(struct xe_ttm_vram_mgr *mgr,
+				   struct list_head *blocks,
+				   u64 used_visible)
+{
+	struct gpu_buddy_block *block;
+
+	list_for_each_entry(block, blocks, link)
+		block->private = NULL;
+	gpu_buddy_free_list(&mgr->mm, blocks, 0);
+	mgr->visible_avail += used_visible;
+}
+
 static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
 				struct ttm_resource *res)
 {
 	struct xe_ttm_vram_mgr_resource *vres =
 		to_xe_ttm_vram_mgr_resource(res);
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
-	struct gpu_buddy *mm = &mgr->mm;
-	struct gpu_buddy_block *block;
 
 	mutex_lock(&mgr->lock);
-	list_for_each_entry(block, &vres->blocks, link)
-		block->private = NULL;
-	gpu_buddy_free_list(mm, &vres->blocks, 0);
-	mgr->visible_avail += vres->used_visible_size;
+	xe_ttm_vram_buddy_free(mgr, &vres->blocks, vres->used_visible_size);
 	mutex_unlock(&mgr->lock);
 
 	ttm_resource_fini(man, res);
@@ -280,6 +305,24 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
+static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_vram_offline_resource *pos, *n;
+
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
+		list_del(&pos->offlined_link);
+		--mgr->n_offlined_pages;
+		kfree(pos);
+	}
+	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
+		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);
+		list_del(&pos->queued_link);
+		--mgr->n_queued_pages;
+		kfree(pos);
+	}
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -291,6 +334,10 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_free_bad_pages(dev, mgr);
+	mutex_unlock(&mgr->lock);
+
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
 	gpu_buddy_fini(&mgr->mm);
@@ -318,6 +365,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
@@ -474,3 +523,294 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
 
 	return avail;
 }
+
+static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
+{
+	struct ttm_operation_ctx ctx = {};
+	struct xe_exec_queue *q_to_put = NULL;
+	struct xe_exec_queue *q = NULL;
+	struct xe_vm *vm = NULL;
+	u32	flags;
+	int ret = 0;
+
+	xe_bo_lock(bo, false);
+	if (bo->vm)
+		vm = xe_vm_get(bo->vm);
+	flags = bo->flags;
+	xe_bo_unlock(bo);
+	/*  Ban VM if BO is PPGTT */
+	if (vm && (flags & XE_BO_FLAG_PAGETABLE)) {
+		down_write(&vm->lock);
+		xe_vm_kill(vm, true);
+		up_write(&vm->lock);
+	}
+	if (vm)
+		xe_vm_put(vm);
+
+	xe_bo_lock(bo, false);
+	q = READ_ONCE(bo->q);
+	/*  Ban exec queue if BO is lrc */
+	if (q && xe_exec_queue_get_unless_zero(q)) {
+		/* ban queue */
+		q_to_put = q;
+	}
+
+	if (bo->purgeable.state == XE_MADV_PURGEABLE_PURGED) {
+		/* Already purged by shrinker during unlocked window — nothing to do */
+		xe_bo_unlock(bo);
+		goto out;
+	}
+
+	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
+	if (xe_bo_is_pinned(bo))
+		xe_bo_unpin(bo);
+	ret = xe_ttm_bo_purge(&bo->ttm, &ctx);
+	xe_bo_unlock(bo);
+
+out:
+	if (q_to_put) {
+		xe_exec_queue_kill(q_to_put);
+		xe_exec_queue_put(q_to_put);
+	}
+
+	return ret;
+}
+
+static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
+					       u64 addr)
+{
+	struct xe_ttm_vram_offline_resource *pos;
+
+	lockdep_assert_held(&mgr->lock);
+
+	list_for_each_entry(pos, &mgr->offlined_pages, offlined_link) {
+		if (pos->addr == addr)
+			return true;
+	}
+
+	list_for_each_entry(pos, &mgr->queued_pages, queued_link) {
+		if (pos->addr == addr)
+			return true;
+	}
+
+	return false;
+}
+
+static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
+					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+{
+	struct xe_ttm_vram_offline_resource *nentry;
+	struct ttm_buffer_object *tbo = NULL;
+	struct xe_bo *pbo_to_put = NULL;
+	struct gpu_buddy_block *block;
+	enum reserve_status {
+		pending = 0,
+		fail
+	};
+	u64 size = SZ_4K;
+	int ret = 0;
+
+	scoped_guard(mutex, &vram_mgr->lock) {
+		if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
+			return -EEXIST;
+		block = gpu_buddy_allocated_addr_to_block(mm, addr);
+		if (WARN_ON(IS_ERR(block)))
+			return PTR_ERR(block);
+
+		nentry = kzalloc_obj(*nentry);
+		if (!nentry)
+			return -ENOMEM;
+		INIT_LIST_HEAD(&nentry->blocks);
+		nentry->status = pending;
+		nentry->addr = addr;
+
+		if (block) {
+			struct xe_bo *pbo;
+
+			if (!block->private) {
+				/* Race: another thread just reserved this block */
+				kfree(nentry);
+				return -EEXIST;
+			}
+			tbo = block->private;
+			pbo = ttm_to_xe_bo(tbo);
+
+			/* Get reference safely - BO may have zero refcount */
+			if (!xe_bo_get_unless_zero(pbo)) {
+				kfree(nentry);
+				return -ENOENT;
+			}
+			/*
+			 * Critical kernel BO? Best-effort check without resv lock;
+			 * worst case a concurrent pin causes reset path unnecessarily.
+			 */
+			if ((pbo->ttm.type == ttm_bo_type_kernel &&
+			     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
+			    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo))) {
+				kfree(nentry);
+				pbo_to_put = pbo;
+				drm_err(&xe->drm,
+					"%s: addr: 0x%llx is critical kernel bo, requesting SBR\n",
+					__func__, addr);
+				break;
+			}
+			++vram_mgr->n_queued_pages;
+			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
+		}
+	}
+
+	/* Deferred put outside lock to avoid recursive deadlock */
+	if (pbo_to_put) {
+		xe_bo_put(pbo_to_put);
+		/* Hint System controller driver for reset with -EIO  */
+		return -EIO;
+	}
+
+	if (block) {
+		struct xe_ttm_vram_offline_resource *pos, *n;
+		struct xe_bo *pbo = ttm_to_xe_bo(tbo);
+
+		/*
+		 * Purge BO containing address - reference held from above.
+		 * Note: brief window between purge (freeing blocks) and re-reserve
+		 * below. If another allocation claims the block, buddy_alloc fails
+		 * and the next HW fault at this address will retry.
+		 */
+		ret = xe_ttm_vram_purge_page(xe, pbo);
+		xe_bo_put(pbo);
+		if (ret) {
+			nentry->status = fail;
+			return ret;
+		}
+
+		/* Reserve page at address addr*/
+		scoped_guard(mutex, &vram_mgr->lock) {
+			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
+						      size, size, &nentry->blocks,
+						      GPU_BUDDY_RANGE_ALLOCATION,
+						      NULL, &nentry->used_visible_size);
+			if (ret) {
+				drm_warn(&xe->drm,
+					 "Could not reserve page at addr:0x%llx, ret:%d\n",
+					 addr, ret);
+				nentry->status = fail;
+				return ret;
+			}
+
+			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
+				if (pos->addr == nentry->addr) {
+					--vram_mgr->n_queued_pages;
+					list_del(&pos->queued_link);
+					break;
+				}
+			}
+			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* RAS will send command to FW for offlining page based on ret value */
+			++vram_mgr->n_offlined_pages;
+			return ret;
+		}
+	} else {
+		struct xe_ttm_vram_offline_resource *pos, *n;
+
+		scoped_guard(mutex, &vram_mgr->lock) {
+			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
+			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
+						      size, size, &nentry->blocks,
+						      GPU_BUDDY_RANGE_ALLOCATION,
+						      NULL, &nentry->used_visible_size);
+			if (ret) {
+				drm_warn(&xe->drm,
+					 "Could not reserve page at addr:0x%llx, ret:%d\n",
+					 addr, ret);
+				nentry->status = fail;
+				return ret;
+			}
+
+			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
+				if (pos->addr == nentry->addr) {
+					--vram_mgr->n_queued_pages;
+					list_del(&pos->queued_link);
+					break;
+				}
+			}
+			++vram_mgr->n_offlined_pages;
+			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* RAS will send command to FW for offlining page based on ret value */
+		}
+	}
+	/* Success */
+	return ret;
+}
+
+static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u64 addr)
+{
+	u64 raw_offset = xe_mmio_read64_2x32(&xe_device_get_root_tile(xe)->mmio, GSMBASE);
+	/* force a 4K (4096 bytes) page alignment */
+	u64 gsmbase_dpa = raw_offset & ~(u64)(PAGE_SIZE - 1);
+	struct xe_vram_region *vr;
+	struct xe_tile *tile;
+	int id;
+
+	/* Addr from GSM? */
+	if (addr >= gsmbase_dpa)
+		/* Return NULL so the caller can request reset (SBR) */
+		return NULL;
+
+	for_each_tile(tile, xe, id) {
+		vr = tile->mem.vram;
+		if (addr >= vr->dpa_base &&
+		    addr < vr->dpa_base + vr->usable_size)
+			return vr;
+	}
+
+	/*
+	 * Return an explicit error pointer so the caller knows the addr
+	 * is invalid and should be ignored, NOT SBR.
+	 */
+	return ERR_PTR(-ENOENT);
+}
+
+/**
+ * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
+ * @xe: pointer to parent device
+ * @addr: physical faulty address
+ *
+ * Handle the physcial faulty address error on specific tile.
+ *
+ * Returns 0 for success, negative error code otherwise as follow:
+ * * %-EIO - critical BO or address outside any VRAM region; next action is reset.
+ * * %-EOPNOTSUPP - log-only policy; no further action.
+ * * %-ENOMEM - allocation failure; next action is reset.
+ * * %-ENXIO - address not found in buddy; next action is reset.
+ * * %-EEXIST - address already processed; no further action.
+ * * % Any other negative error - next action is reset.
+ */
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
+{
+	struct xe_ttm_vram_mgr *vram_mgr;
+	struct xe_vram_region *vr;
+	struct gpu_buddy *mm;
+
+	vr = xe_ttm_vram_addr_to_region(xe, addr);
+	if (IS_ERR(vr)) {
+		/*
+		 * The addr is outside VRAM and GSM.
+		 * Log a debug message if needed, and safely exit/ignore.
+		 */
+		drm_dbg(&xe->drm, "Address %llx is out of bounds, ignoring fault.\n", addr);
+		return -EOPNOTSUPP;
+	}
+	if (!vr) {
+		drm_err(&xe->drm, "%s:%d GSM addr:%llx error requesting SBR\n",
+			__func__, __LINE__, addr);
+		/* Hint System controller driver for reset with -EIO  */
+		return -EIO;
+	}
+	vram_mgr = &vr->ttm;
+	mm = &vram_mgr->mm;
+
+	/* Reserve page at address */
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
+}
+EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 87b7fae5edba..d5392beff30c 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 9106da056b49..815a601504d5 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct gpu_buddy mm;
+	/** @offlined_pages: List of offlined pages */
+	struct list_head offlined_pages;
+	/** @n_offlined_pages: Number of offlined pages */
+	u16 n_offlined_pages;
+	/** @queued_pages: List of queued pages */
+	struct list_head queued_pages;
+	/** @n_queued_pages: Number of queued pages */
+	u16 n_queued_pages;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
@@ -45,4 +53,22 @@ struct xe_ttm_vram_mgr_resource {
 	unsigned long flags;
 };
 
+/**
+ * struct xe_ttm_vram_offline_resource - Xe TTM VRAM offline  resource
+ */
+struct xe_ttm_vram_offline_resource {
+	/** @offlined_link: Link to offlined pages */
+	struct list_head offlined_link;
+	/** @queued_link: Link to queued pages */
+	struct list_head queued_link;
+	/** @blocks: list of DRM buddy blocks */
+	struct list_head blocks;
+	/** @used_visible_size: How many CPU visible bytes this resource is using */
+	u64 used_visible_size;
+	/** @addr: Address of faulty memory location reported by HW */
+	u64 addr;
+	/** @status: reservation status of resource */
+	bool status;
+};
+
 #endif
-- 
2.52.0

