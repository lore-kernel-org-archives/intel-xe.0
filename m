Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50011CD8C81
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BD0112AF1;
	Fri,  5 Jun 2026 12:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyYviCW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C80112AF1
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 12:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780663150; x=1812199150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tVzgW0uf1X1EZL17nCW7uh31CEd+jV/KpQ2M+zqBbds=;
 b=AyYviCW53zcqTI3GOWWn3QnQU8Z4PQw1E1Ny5wWP5T0U7HGIlAJ0rEsM
 SA3gv2sYuoTk3MBdQ5tXUffipQtIHg9Qy+l3Qkt0WZ9i0rFUiCkvOTLVW
 k9r0fyw4mGa1tD18ShIvLKfKMIy+Ij7vi8rQWEWqecEL9XAe7ngHV7jpa
 kJ7yOfXFvsvkUZ0/laGbN2m70jTTSL6wLG1Pq9P7zn1/aAQFZrohwZPTr
 GwgfsVoTc1YzzXEbQ39zR/hpskHj5amvT+Vmxd1jzVv3G8BDspUcBL7EK
 w3Q3TxcA5xD88X4FZgAuEuzVaTFB8QF93xxm/6MaIM8OWyO2uh3etyCO/ Q==;
X-CSE-ConnectionGUID: N9gE/XTKR9eqwlyap/D2Vg==
X-CSE-MsgGUID: /KAiSetBQhSSLFQ7B0h76Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="106937345"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="106937345"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:09 -0700
X-CSE-ConnectionGUID: 988pGyrfR2W82fVOIiynQw==
X-CSE-MsgGUID: wuWo0SglQ7+vk3DiuKaHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249938927"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 05:39:08 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V11 06/12] drm/xe: Handle physical memory address error
Date: Fri,  5 Jun 2026 18:08:44 +0530
Message-ID: <20260605123839.236021-20-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260605123839.236021-14-tejas.upadhyay@intel.com>
References: <20260605123839.236021-14-tejas.upadhyay@intel.com>
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

This functionality represents a significant step in making
the xe driver gracefully handle hardware memory degradation.
By integrating with the DRM Buddy allocator, the driver
can permanently "carve out" faulty memory so it isn't reused
by subsequent allocations.

Buddy Block Reservation:
----------------------
When a memory address is reported as faulty, the driver instructs
the DRM Buddy allocator to reserve a block of the specific page
size (typically 4KB). This marks the memory as "dirty/used"
indefinitely.

Two-Stage Tracking:
-----------------
Offlined Pages:
Pages that have been successfully isolated and removed from the
available memory pool.

Queued Pages:
Addresses that have been flagged as faulty but are currently in
use by a process. These are tracked until the associated buffer
object (BO) is released or migrated, at which point they move
to the "offlined" state.

V8(MattA):
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
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 343 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  28 ++
 8 files changed, 365 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 3c2513e4cb17..0e8466bf9289 100644
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
index 8f9f16043c4c..2328cf419c44 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -361,7 +361,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
 		xe_bo_lock(bo, false);
-		xe_bo_unpin(bo);
+		if (!xe_bo_is_purged(bo))
+			xe_bo_unpin(bo);
 		xe_bo_unlock(bo);
 
 		xe_bo_put(bo);
@@ -585,6 +586,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
 int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
+bool xe_bo_is_user(struct xe_bo *bo);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 8a920e58245c..4eaff2430b57 100644
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
index 835d2f336777..e5bd94ca103b 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1559,8 +1559,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
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
index 15ce77ce7793..67000e45aa19 100644
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
index 5ab5dfdb183c..0e968ae47fd9 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -13,7 +13,10 @@
 
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_lrc.h"
 #include "xe_res_cursor.h"
+#include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 
@@ -46,6 +49,40 @@ static inline bool xe_is_vram_mgr_blocks_contiguous(struct gpu_buddy *mm,
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
@@ -54,7 +91,6 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
 	struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
 	struct xe_ttm_vram_mgr_resource *vres;
 	struct gpu_buddy *mm = &mgr->mm;
-	struct gpu_buddy_block *block;
 	u64 size, min_page_size;
 	unsigned long lpfn;
 	int err;
@@ -115,32 +151,12 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
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
@@ -172,20 +188,27 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
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
@@ -280,6 +303,24 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
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
@@ -291,6 +332,10 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_free_bad_pages(dev, mgr);
+	mutex_unlock(&mgr->lock);
+
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
 	gpu_buddy_fini(&mgr->mm);
@@ -318,6 +363,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	err = drmm_mutex_init(&xe->drm, &mgr->lock);
 	if (err)
 		return err;
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
@@ -474,3 +521,237 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
 
 	return avail;
 }
+
+static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
+{
+	struct ttm_operation_ctx ctx = {};
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
+	/*  Ban exec queue if BO is lrc */
+	if (bo->q && xe_exec_queue_get_unless_zero(bo->q)) {
+		/* ban queue */
+		xe_exec_queue_kill(bo->q);
+		xe_exec_queue_put(bo->q);
+	}
+
+	xe_bo_set_purgeable_state(bo, XE_MADV_PURGEABLE_DONTNEED);
+	ttm_bo_unmap_virtual(&bo->ttm);   /* nuke CPU mmap + VRAM IO mappings */
+	if (xe_bo_is_pinned(bo))
+		xe_bo_unpin(bo);
+	ret = xe_ttm_bo_purge(&bo->ttm, &ctx);
+	xe_bo_unlock(bo);
+
+	return ret;
+}
+
+static bool xe_ttm_vram_page_already_processed(struct xe_ttm_vram_mgr *mgr,
+					       unsigned long addr)
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
+static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long addr,
+					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+{
+	struct xe_ttm_vram_offline_resource *nentry;
+	struct ttm_buffer_object *tbo = NULL;
+	struct gpu_buddy_block *block;
+	enum reserve_status {
+		pending = 0,
+		fail
+	};
+	u64 size = SZ_4K;
+	int ret = 0;
+
+	scoped_guard(mutex, &vram_mgr->lock) {
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
+			WARN_ON(!block->private);
+			tbo = block->private;
+			pbo = ttm_to_xe_bo(tbo);
+
+			/* Get reference safely - BO may have zero refcount */
+			if (!xe_bo_get_unless_zero(pbo)) {
+				kfree(nentry);
+				return -ENOENT;
+			}
+			/* Critical kernel BO? */
+			if ((pbo->ttm.type == ttm_bo_type_kernel &&
+			     !(pbo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) ||
+			    (xe_bo_is_user(pbo) && xe_bo_is_pinned(pbo))) {
+				kfree(nentry);
+				xe_ttm_vram_free_bad_pages(&xe->drm, vram_mgr);
+				xe_bo_put(pbo);
+				drm_err(&xe->drm,
+					"%s: addr: 0x%lx is critical kernel bo, requesting SBR\n",
+					__func__, addr);
+				/* Hint System controller driver for reset with -EIO  */
+				return -EIO;
+			}
+			nentry->id = ++vram_mgr->n_queued_pages;
+			list_add(&nentry->queued_link, &vram_mgr->queued_pages);
+		}
+	}
+	if (block) {
+		struct xe_ttm_vram_offline_resource *pos, *n;
+		struct xe_bo *pbo = ttm_to_xe_bo(tbo);
+
+		/* Purge BO containing address - reference held from above */
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
+				drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
+					 addr, ret);
+				nentry->status = fail;
+				return ret;
+			}
+
+			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
+				if (pos->id == nentry->id) {
+					--vram_mgr->n_queued_pages;
+				list_del(&pos->queued_link);
+				break;
+				}
+			}
+			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* RAS will send command to FW for offlining page based on ret value */
+			++vram_mgr->n_offlined_pages;
+			return ret;
+		}
+	} else {
+		scoped_guard(mutex, &vram_mgr->lock) {
+			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
+						      size, size, &nentry->blocks,
+						      GPU_BUDDY_RANGE_ALLOCATION,
+						      NULL, &nentry->used_visible_size);
+			if (ret) {
+				drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
+					 addr, ret);
+				nentry->status = fail;
+				return ret;
+			}
+
+			nentry->id = ++vram_mgr->n_offlined_pages;
+			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* RAS will send command to FW for offlining page based on ret value */
+		}
+	}
+	/* Success */
+	return ret;
+}
+
+static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe,
+							 resource_size_t addr)
+{
+	unsigned long stolen_base = xe_ttm_stolen_gpu_offset(xe);
+	struct xe_vram_region *vr;
+	struct xe_tile *tile;
+	int id;
+
+	/* Addr from stolen memory? */
+	if (addr + SZ_4K >= stolen_base)
+		return NULL;
+
+	for_each_tile(tile, xe, id) {
+		vr = tile->mem.vram;
+		if ((addr <= vr->dpa_base + vr->actual_physical_size) &&
+		    (addr + SZ_4K >= vr->dpa_base))
+			return vr;
+	}
+	return NULL;
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
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
+{
+	struct xe_ttm_vram_mgr *vram_mgr;
+	struct xe_vram_region *vr;
+	struct gpu_buddy *mm;
+
+	vr = xe_ttm_vram_addr_to_region(xe, addr);
+	if (!vr) {
+		drm_err(&xe->drm, "%s:%d addr:%lx error requesting SBR\n",
+			__func__, __LINE__, addr);
+		/* Hint System controller driver for reset with -EIO  */
+		return -EIO;
+	}
+	vram_mgr = &vr->ttm;
+	mm = &vram_mgr->mm;
+
+	scoped_guard(mutex, &vram_mgr->lock) {
+		if (xe_ttm_vram_page_already_processed(vram_mgr, addr))
+			return -EEXIST;
+	}
+
+	/* Reserve page at address */
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
+}
+EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index 87b7fae5edba..8ef06d9d44f7 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -31,6 +31,7 @@ u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
 
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr);
 static inline struct xe_ttm_vram_mgr_resource *
 to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
 {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 9106da056b49..3ad7966798eb 100644
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
@@ -45,4 +53,24 @@ struct xe_ttm_vram_mgr_resource {
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
+	/** @id: The id of an offline resource */
+	u16 id;
+	/** @addr: Address of faulty memory location reported by HW */
+	unsigned long addr;
+	/** @status: reservation status of resource */
+	bool status;
+};
+
 #endif
-- 
2.52.0

