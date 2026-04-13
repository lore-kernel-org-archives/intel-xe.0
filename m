Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FDFF34C4E
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 13:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E13F10E445;
	Mon, 13 Apr 2026 13:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FjQePoR8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1D310E445
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776086225; x=1807622225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cR9aG0pzq8ixPdecNvLLjsUtQTwkKZk17sN6dqSxyX8=;
 b=FjQePoR8nktQOBRYAmG5P1uaCrix9P/cGpjkQTJo2XvpFRxrU+otE985
 mkh8XpY5+lk1smH+nQ2SQL8+e4Jx8QbIwWJ8CxDonFNAtCS7250F60JQN
 c6GPBs94lGLIrWdLs4Zb5AUj/hU2HyqXFc9R9DGd5L8l3fYulMUFVdwem
 aIrfxfvheM41sICoZv9BUKhnhonJaJ7b33RUiOAM9SrQw2oRXT8IlFpxl
 FiSxtlgi0mBArSrGjg43HykBBmvHXohHTVrIvzun7YflWhVEId3CLOVBf
 Nt7MQ1nzHa4u+xxxpU3UNK360NYO6k+x9vBgKjgbBI9qMlZkIdS64pGHV A==;
X-CSE-ConnectionGUID: ZyBIVvK/RXmwHdTLTfaKQQ==
X-CSE-MsgGUID: mj1Z435DQh6pzKArjV1itw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77037308"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="77037308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:05 -0700
X-CSE-ConnectionGUID: RY+uTIzgQUSyfrgrAlzeOA==
X-CSE-MsgGUID: r41tHWmpS5S6c5Qf/IhQLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="260224379"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 06:17:03 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V7 5/9] drm/xe: Handle physical memory address error
Date: Mon, 13 Apr 2026 18:46:26 +0530
Message-ID: <20260413131623.2891528-16-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
References: <20260413131623.2891528-11-tejas.upadhyay@intel.com>
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

Sysfs Reporting:
--------------
The patch exposes these metrics through a standard interface,
allowing administrators to monitor VRAM health:
/sys/bus/pci/devices/<device_id>/vram_bad_bad_pages

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
 drivers/gpu/drm/xe/xe_exec_queue.c         |   9 +-
 drivers/gpu/drm/xe/xe_pt.c                 |   3 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 267 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  28 +++
 8 files changed, 320 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 7baa326c9421..d84849cca0aa 100644
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
index 9f55b3589caf..073fae905073 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -277,7 +277,8 @@ static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
 {
 	if (likely(bo)) {
 		xe_bo_lock(bo, false);
-		xe_bo_unpin(bo);
+		if (!xe_bo_is_purged(bo))
+			xe_bo_unpin(bo);
 		xe_bo_unlock(bo);
 
 		xe_bo_put(bo);
@@ -501,6 +502,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
 		  const struct xe_bo_shrink_flags flags,
 		  unsigned long *scanned);
 int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx);
+bool xe_bo_is_user(struct xe_bo *bo);
 
 /**
  * xe_bo_is_mem_type - Whether the bo currently resides in the given
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 7f9602b3363d..e36ea88292f5 100644
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
index b3b80893c387..40ffc598e0f8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -385,7 +385,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 				err = PTR_ERR(lrc);
 				goto err_lrc;
 			}
-
 			lrc->bo->q = q;
 			xe_exec_queue_set_lrc(q, lrc, i);
 
@@ -1552,8 +1551,12 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
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
index 8e5f4f0dea3f..1764bae6e481 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -211,7 +211,8 @@ void xe_pt_destroy(struct xe_pt *pt, u32 flags, struct llist_head *deferred)
 		return;
 
 	XE_WARN_ON(!list_empty(&pt->bo->ttm.base.gpuva.list));
-	xe_bo_unpin(pt->bo);
+	if (!xe_bo_is_purged(pt->bo))
+		xe_bo_unpin(pt->bo);
 	xe_bo_put_deferred(pt->bo, deferred);
 
 	if (pt->level > 0 && pt->num_live) {
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 01a9b92772f8..ac6f034852f7 100644
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
 
@@ -280,6 +283,24 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
+static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_vram_offline_resource *pos, *n;
+
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		--mgr->n_offlined_pages;
+		gpu_buddy_free_list(&mgr->mm, &pos->blocks, 0);
+		mgr->visible_avail += pos->used_visible_size;
+		list_del(&pos->offlined_link);
+		kfree(pos);
+	}
+	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
+		list_del(&pos->queued_link);
+		mgr->n_queued_pages--;
+		kfree(pos);
+	}
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -291,6 +312,10 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
+	mutex_lock(&mgr->lock);
+	xe_ttm_vram_free_bad_pages(dev, mgr);
+	mutex_unlock(&mgr->lock);
+
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
 	gpu_buddy_fini(&mgr->mm);
@@ -319,6 +344,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	man->func = &xe_ttm_vram_mgr_func;
 	mgr->mem_type = mem_type;
 	mutex_init(&mgr->lock);
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
@@ -474,3 +501,243 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
 
 	return avail;
 }
+
+static int xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *bo)
+{
+	struct ttm_operation_ctx ctx = {};
+	struct xe_vm *vm;
+	u32	flags;
+	int ret = 0;
+
+	xe_bo_lock(bo, false);
+	vm = bo->vm;
+	flags = bo->flags;
+	xe_bo_unlock(bo);
+	/*  Ban VM if BO is PPGTT */
+	if (flags & XE_BO_FLAG_PAGETABLE) {
+		down_write(&vm->lock);
+		xe_vm_kill(vm, true);
+		up_write(&vm->lock);
+	}
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
+static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long addr,
+					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+{
+	struct xe_ttm_vram_offline_resource *nentry;
+	struct ttm_buffer_object *tbo = NULL;
+	struct gpu_buddy_block *block;
+	struct gpu_buddy_block *b, *m;
+	enum reserve_status {
+		pending = 0,
+		fail
+	};
+	u64 size = SZ_4K;
+	int ret = 0;
+
+	scoped_guard(mutex, &vram_mgr->lock) {
+		block = gpu_buddy_addr_to_block(mm, addr);
+		if (PTR_ERR(block) == -ENXIO)
+			/* VRAM region check passed earlier; safe to proceed */
+			block = NULL;
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
+			ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
+						     size, size, &nentry->blocks,
+						     GPU_BUDDY_RANGE_ALLOCATION);
+
+			if (ret) {
+				drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
+					 addr, ret);
+				nentry->status = fail;
+				return ret;
+			}
+
+			list_for_each_entry_safe(b, m, &nentry->blocks, link)
+				b->private = NULL;
+
+			if ((addr + size) <= vram_mgr->visible_size) {
+				nentry->used_visible_size = size;
+			} else {
+				list_for_each_entry(b, &nentry->blocks, link) {
+					u64 start = gpu_buddy_block_offset(b);
+
+					if (start < vram_mgr->visible_size) {
+						u64 end = start + gpu_buddy_block_size(mm, b);
+
+						nentry->used_visible_size +=
+							min(end, vram_mgr->visible_size) - start;
+					}
+				}
+			}
+			vram_mgr->visible_avail -= nentry->used_visible_size;
+			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
+				if (pos->id == nentry->id) {
+					--vram_mgr->n_queued_pages;
+				list_del(&pos->queued_link);
+				break;
+				}
+			}
+			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* TODO: FW Integration: Send command to FW for offlining page */
+			++vram_mgr->n_offlined_pages;
+			return ret;
+		}
+	} else {
+		scoped_guard(mutex, &vram_mgr->lock) {
+			ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
+						     size, size, &nentry->blocks,
+						     GPU_BUDDY_RANGE_ALLOCATION);
+			if (ret) {
+				drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
+					 addr, ret);
+				nentry->status = fail;
+				return ret;
+			}
+
+			list_for_each_entry_safe(b, m, &nentry->blocks, link)
+				b->private = NULL;
+
+			if ((addr + size) <= vram_mgr->visible_size) {
+				nentry->used_visible_size = size;
+			} else {
+				struct gpu_buddy_block *block;
+
+				list_for_each_entry(block, &nentry->blocks, link) {
+					u64 start = gpu_buddy_block_offset(block);
+
+					if (start < vram_mgr->visible_size) {
+						u64 end = start + gpu_buddy_block_size(mm, block);
+
+						nentry->used_visible_size +=
+							min(end, vram_mgr->visible_size) - start;
+					}
+				}
+			}
+			vram_mgr->visible_avail -= nentry->used_visible_size;
+			nentry->id = ++vram_mgr->n_offlined_pages;
+			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* TODO: FW Integration: Send command to FW for offlining page */
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
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
+{
+	struct xe_ttm_vram_mgr *vram_mgr;
+	struct xe_vram_region *vr;
+	struct gpu_buddy *mm;
+	int ret;
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
+	/* Reserve page at address */
+	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
+	return ret;
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

