Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059D310ED659
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 11:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C680B10EC4D;
	Fri, 27 Mar 2026 11:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAEf2KVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E674610EC4D
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 11:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774612150; x=1806148150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aG19VIodUJ4fg4gF7cDpKN+7SSEjTV5F1tMa7oZmE5M=;
 b=XAEf2KVphxGc6jnuIRgt2GSLejrq9I0BYDFHssDJjZcwRkWrDxvfWZUd
 i/95EBegHXxbPWzcDzfYS25juc3vEX/XuTA8cQxYwxM0xCUcSzi0cxI3u
 5p6/30R9FmFv/kciJf4z3jG4/VVs3yPGoPSwmam+L//iO9Xi7UMt5Idsc
 ueCfj0OgRib3KLMR9Y5k1gWh9TpOdMX3R05bD/qbLPr4LI1NsDgMHg5AG
 hBwWLl2JblGIBN/6rfp5MbmTwMVIzsOpBndS7lD6Exd9rdD38e/nkhe9r
 4YPev/tNsElByTzgJ6WD+tbUpT2/2YCGr7mSk4QJfmZ3ZgSDiP3ahjkR6 A==;
X-CSE-ConnectionGUID: 18pjR9fIQw+IquolyJ9O2A==
X-CSE-MsgGUID: O1CfnL5GTaKmmIyjsmqMVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87157684"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="87157684"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:49:09 -0700
X-CSE-ConnectionGUID: kVfBg3+ZRuqde8oDPralqA==
X-CSE-MsgGUID: xYyHtvT+S1OjrYtzsTwQRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224335028"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:49:08 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH V6 3/7] drm/xe: Handle physical memory address error
Date: Fri, 27 Mar 2026 17:18:16 +0530
Message-ID: <20260327114829.2678240-12-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
References: <20260327114829.2678240-9-tejas.upadhyay@intel.com>
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
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 336 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   1 +
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  26 ++
 3 files changed, 363 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index c627dbf94552..0fec7b332501 100644
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
 
@@ -277,6 +280,26 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
+static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_vram_offline_resource *pos, *n;
+
+	mutex_lock(&mgr->lock);
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
+	mutex_unlock(&mgr->lock);
+}
+
 static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_device *xe = to_xe_device(dev);
@@ -288,6 +311,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
+	xe_ttm_vram_free_bad_pages(dev, mgr);
+
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
 	gpu_buddy_fini(&mgr->mm);
@@ -316,6 +341,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	man->func = &xe_ttm_vram_mgr_func;
 	mgr->mem_type = mem_type;
 	mutex_init(&mgr->lock);
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
@@ -471,3 +498,312 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
 
 	return avail;
 }
+
+static bool is_ttm_vram_migrate_lrc(struct xe_device *xe, struct xe_bo *pbo)
+{
+	if (pbo->ttm.type == ttm_bo_type_kernel &&
+	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
+	    (pbo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) &&
+	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {
+		unsigned long idx;
+		struct xe_exec_queue *q;
+		struct drm_device *dev = &xe->drm;
+		struct drm_file *file;
+		struct xe_lrc *lrc;
+
+		/* TODO : Need to extend to multitile in future if needed */
+		mutex_lock(&dev->filelist_mutex);
+		list_for_each_entry(file, &dev->filelist, lhead) {
+			struct xe_file *xef = file->driver_priv;
+
+			mutex_lock(&xef->exec_queue.lock);
+			xa_for_each(&xef->exec_queue.xa, idx, q) {
+				xe_exec_queue_get(q);
+				mutex_unlock(&xef->exec_queue.lock);
+
+				for (int i = 0; i < q->width; i++) {
+					lrc = xe_exec_queue_get_lrc(q, i);
+					if (lrc->bo == pbo) {
+						xe_lrc_put(lrc);
+						mutex_lock(&xef->exec_queue.lock);
+						xe_exec_queue_put(q);
+						mutex_unlock(&xef->exec_queue.lock);
+						mutex_unlock(&dev->filelist_mutex);
+						return false;
+					}
+					xe_lrc_put(lrc);
+				}
+				mutex_lock(&xef->exec_queue.lock);
+				xe_exec_queue_put(q);
+				mutex_unlock(&xef->exec_queue.lock);
+			}
+		}
+		mutex_unlock(&dev->filelist_mutex);
+		return true;
+	}
+	return false;
+}
+
+static void xe_ttm_vram_purge_page(struct xe_device *xe, struct xe_bo *pbo)
+{
+	struct ttm_placement place = {};
+	struct ttm_operation_ctx ctx = {
+		.interruptible = false,
+		.gfp_retry_mayfail = false,
+	};
+	bool locked;
+	int ret = 0;
+
+	/*  Ban VM if BO is PPGTT */
+	if (pbo->ttm.type == ttm_bo_type_kernel &&
+	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
+	    pbo->flags & XE_BO_FLAG_PAGETABLE) {
+		down_write(&pbo->vm->lock);
+		xe_vm_kill(pbo->vm, true);
+		up_write(&pbo->vm->lock);
+	}
+
+	/*  Ban exec queue if BO is lrc */
+	if (pbo->ttm.type == ttm_bo_type_kernel &&
+	    pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM &&
+	    (pbo->flags & (XE_BO_FLAG_GGTT | XE_BO_FLAG_GGTT_INVALIDATE)) &&
+	    !(pbo->flags & XE_BO_FLAG_PAGETABLE)) {
+		struct drm_device *dev = &xe->drm;
+		struct xe_exec_queue *q;
+		struct drm_file *file;
+		struct xe_lrc *lrc;
+		unsigned long idx;
+
+		/* TODO : Need to extend to multitile in future if needed */
+		mutex_lock(&dev->filelist_mutex);
+		list_for_each_entry(file, &dev->filelist, lhead) {
+			struct xe_file *xef = file->driver_priv;
+
+			mutex_lock(&xef->exec_queue.lock);
+			xa_for_each(&xef->exec_queue.xa, idx, q) {
+				xe_exec_queue_get(q);
+				mutex_unlock(&xef->exec_queue.lock);
+
+				for (int i = 0; i < q->width; i++) {
+					lrc = xe_exec_queue_get_lrc(q, i);
+					if (lrc->bo == pbo) {
+						xe_lrc_put(lrc);
+						xe_exec_queue_kill(q);
+					} else {
+						xe_lrc_put(lrc);
+					}
+				}
+
+				mutex_lock(&xef->exec_queue.lock);
+				xe_exec_queue_put(q);
+				mutex_unlock(&xef->exec_queue.lock);
+			}
+		}
+		mutex_unlock(&dev->filelist_mutex);
+	}
+
+	spin_lock(&pbo->ttm.bdev->lru_lock);
+	locked = dma_resv_trylock(pbo->ttm.base.resv);
+	spin_unlock(&pbo->ttm.bdev->lru_lock);
+	WARN_ON(!locked);
+	ret = ttm_bo_validate(&pbo->ttm, &place, &ctx);
+	drm_WARN_ON(&xe->drm, ret);
+	xe_bo_put(pbo);
+	if (locked)
+		dma_resv_unlock(pbo->ttm.base.resv);
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
+	mutex_lock(&vram_mgr->lock);
+	block = gpu_buddy_addr_to_block(mm, addr);
+	if (PTR_ERR(block) == -ENXIO) {
+		mutex_unlock(&vram_mgr->lock);
+		return -ENXIO;
+	}
+
+	nentry = kzalloc_obj(*nentry);
+	if (!nentry)
+		return -ENOMEM;
+	INIT_LIST_HEAD(&nentry->blocks);
+	nentry->status = pending;
+
+	if (block) {
+		struct xe_ttm_vram_offline_resource *pos, *n;
+		struct xe_bo *pbo;
+
+		WARN_ON(!block->private);
+		tbo = block->private;
+		pbo = ttm_to_xe_bo(tbo);
+
+		xe_bo_get(pbo);
+		/* Critical kernel BO? */
+		if (pbo->ttm.type == ttm_bo_type_kernel &&
+		    (!(pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM) ||
+		     is_ttm_vram_migrate_lrc(xe, pbo))) {
+			mutex_unlock(&vram_mgr->lock);
+			kfree(nentry);
+			xe_ttm_vram_free_bad_pages(&xe->drm, vram_mgr);
+			xe_bo_put(pbo);
+			drm_err(&xe->drm,
+				"%s: corrupt addr: 0x%lx in critical kernel bo, request reset\n",
+				__func__, addr);
+			/* Hint System controller driver for reset with -EIO  */
+			return -EIO;
+		}
+		nentry->id = ++vram_mgr->n_queued_pages;
+		list_add(&nentry->queued_link, &vram_mgr->queued_pages);
+		mutex_unlock(&vram_mgr->lock);
+
+		/* Purge BO containing address */
+		 xe_ttm_vram_purge_page(xe, pbo);
+
+		/* Reserve page at address addr*/
+		mutex_lock(&vram_mgr->lock);
+		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
+					     size, size, &nentry->blocks,
+					     GPU_BUDDY_RANGE_ALLOCATION);
+
+		if (ret) {
+			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
+				 addr, ret);
+			nentry->status = fail;
+			mutex_unlock(&vram_mgr->lock);
+			return ret;
+		}
+
+		list_for_each_entry_safe(b, m, &nentry->blocks, link)
+			b->private = NULL;
+
+		if ((addr + size) <= vram_mgr->visible_size) {
+			nentry->used_visible_size = size;
+		} else {
+			list_for_each_entry(b, &nentry->blocks, link) {
+				u64 start = gpu_buddy_block_offset(b);
+
+				if (start < vram_mgr->visible_size) {
+					u64 end = start + gpu_buddy_block_size(mm, b);
+
+					nentry->used_visible_size +=
+						min(end, vram_mgr->visible_size) - start;
+				}
+			}
+		}
+		vram_mgr->visible_avail -= nentry->used_visible_size;
+		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
+			if (pos->id == nentry->id) {
+				--vram_mgr->n_queued_pages;
+				list_del(&pos->queued_link);
+				break;
+			}
+		}
+		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+		/* TODO: FW Integration: Send command to FW for offlining page */
+		++vram_mgr->n_offlined_pages;
+		mutex_unlock(&vram_mgr->lock);
+		return ret;
+
+	} else {
+		ret = gpu_buddy_alloc_blocks(mm, addr, addr + size,
+					     size, size, &nentry->blocks,
+					     GPU_BUDDY_RANGE_ALLOCATION);
+		if (ret) {
+			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
+				 addr, ret);
+			nentry->status = fail;
+			mutex_unlock(&vram_mgr->lock);
+			return ret;
+		}
+
+		list_for_each_entry_safe(b, m, &nentry->blocks, link)
+			b->private = NULL;
+
+		if ((addr + size) <= vram_mgr->visible_size) {
+			nentry->used_visible_size = size;
+		} else {
+			struct gpu_buddy_block *block;
+
+			list_for_each_entry(block, &nentry->blocks, link) {
+				u64 start = gpu_buddy_block_offset(block);
+
+				if (start < vram_mgr->visible_size) {
+					u64 end = start + gpu_buddy_block_size(mm, block);
+
+					nentry->used_visible_size +=
+						min(end, vram_mgr->visible_size) - start;
+				}
+			}
+		}
+		vram_mgr->visible_avail -= nentry->used_visible_size;
+		nentry->id = ++vram_mgr->n_offlined_pages;
+		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+		/* TODO: FW Integration: Send command to FW for offlining page */
+		mutex_unlock(&vram_mgr->lock);
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
index 9106da056b49..94eaf9d875f1 100644
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
+	/** @id: The id of an offline resource */
+	u16 id;
+	/** @status: reservation status of resource */
+	bool status;
+};
+
 #endif
-- 
2.52.0

