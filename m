Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0419FC61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 13:52:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B044410ED27;
	Wed, 26 Aug 2026 13:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeUjE3PC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD9A10ED3F
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787752329; x=1819288329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/jGDh2nmNLWy/kCmlBPIOKrwwH9txZtQRQ+BFoCRBcc=;
 b=JeUjE3PCIWzmVGF369F90qz2zENht38nbnFZeQCFmv7vhiLyVy5t74XC
 7BO/uq7cD26dBRHrMBGG0suqb+e7fmG8ppFFIGx03Os/rMmwNTHqr18iu
 wlfUk5h8pmVtTFQzKYjdxVIa1y1N5LWLy4gNWsXT09efSDpab0SutBQkD
 lQ4HUxEZJpsdolifMSPp+hAIlADJc8Km6uW8VaAGIHJytGlb573KZIivP
 SRSZEp7gdgnwuL0wq8u2hpPrqmzbp2cwL2osmkARcX0NbkpvfdYVf0NCG
 zH1+KxJ8dbs+CrJDBmIZlxz5BKfyWxD6aFbz5Z4tfiDEQiyGaWV27lXJa A==;
X-CSE-ConnectionGUID: k67d21gqTcSoumab6EJhTg==
X-CSE-MsgGUID: 4yhPJtfQQRiTGfal4ma5cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88251039"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88251039"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:09 -0700
X-CSE-ConnectionGUID: 5sK5sixJRZubgmorzo2sOA==
X-CSE-MsgGUID: 30XVkGZbTN6O5cRSpYsWfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="269533510"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:52:06 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [PATCH V18 08/14] drm/xe/vram: Add VRAM page offline fault handler
Date: Wed, 26 Aug 2026 19:21:43 +0530
Message-ID: <20260826135136.204044-24-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260826135136.204044-16-tejas.upadhyay@intel.com>
References: <20260826135136.204044-16-tejas.upadhyay@intel.com>
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

Add the core VRAM page offlining logic to handle HW-reported faulty
physical addresses:

- xe_ttm_vram_purge_page(): Purges the BO containing the faulty
  address. Bans the associated VM (if page table BO) and exec queue
  (if LRC BO). Moves xe_exec_queue_kill() outside xe_bo_lock() to
  avoid AB-BA deadlock with vm->lock. Uses READ_ONCE(bo->q) to
  safely access the exec queue pointer.

- xe_ttm_vram_page_already_processed(): Checks if an address is
  already tracked in offlined_pages or queued_pages lists to avoid
  double-processing.

- xe_ttm_vram_reserve_page_at_addr(): Two-phase reservation that
  first queues the page, purges the BO outside the lock, then
  reserves the buddy block. Handles both allocated (BO present)
  and free page cases. Returns -EIO for critical kernel BOs to
  trigger system reset.

- xe_ttm_vram_addr_to_region(): Maps a DPA to its VRAM region.
  Uses GSMBASE MMIO register to detect GSM addresses (returns NULL
  for reset path). Returns ERR_PTR(-EOPNOTSUPP) for addresses
  outside any known region.

- xe_ttm_vram_handle_addr_fault(): Entry point called by RAS.
  Returns -EEXIST if already processed, -EIO for GSM/critical BO,
  -EOPNOTSUPP if out of bounds.

v12(Sashiko):
- Handle multi tile and add assert for 4K align
- Remove unaligned action comment for ENXIO
v11(Himal):
- match everywhere with enum vs bool for status member
- Fix comment and remove unused var
- if purge fail let next alloc confirm failure
- pass absolute address, useful for multi tile

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 296 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   1 +
 2 files changed, 297 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 1253989a8d06..b2b6c1bd2c55 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -13,10 +13,16 @@
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_range_manager.h>
 
+#include "regs/xe_regs.h"
 #include "xe_bo.h"
+#include "xe_configfs.h"
 #include "xe_device.h"
+#include "xe_exec_queue.h"
+#include "xe_lrc.h"
+#include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_res_cursor.h"
+#include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 
@@ -572,3 +578,293 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man)
 
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
+		nentry->status = XE_PAGE_RESERVE_PENDING;
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
+			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
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
+		 * and the status will be shown as failed reservation.
+		 */
+		ret = xe_ttm_vram_purge_page(xe, pbo);
+		xe_bo_put(pbo);
+		if (ret)
+			drm_warn(&xe->drm, "Purge failed at addr:0x%llx, ret:%d\n", addr, ret);
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
+				nentry->status = XE_PAGE_RESERVE_FAIL;
+				return ret;
+			}
+
+			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
+				if (pos->addr == nentry->addr) {
+					--vram_mgr->n_queued_pages;
+					list_del_rcu(&pos->queued_link);
+					break;
+				}
+			}
+			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* RAS will send command to FW for offlining page based on ret value */
+			++vram_mgr->n_offlined_pages;
+			return ret;
+		}
+	} else {
+		struct xe_ttm_vram_offline_resource *pos, *n;
+
+		scoped_guard(mutex, &vram_mgr->lock) {
+			++vram_mgr->n_queued_pages;
+			list_add_rcu(&nentry->queued_link, &vram_mgr->queued_pages);
+			ret = xe_ttm_vram_buddy_alloc(vram_mgr, addr, addr + size,
+						      size, size, &nentry->blocks,
+						      GPU_BUDDY_RANGE_ALLOCATION,
+						      NULL, &nentry->used_visible_size);
+			if (ret) {
+				drm_warn(&xe->drm,
+					 "Could not reserve page at addr:0x%llx, ret:%d\n",
+					 addr, ret);
+				nentry->status = XE_PAGE_RESERVE_FAIL;
+				return ret;
+			}
+
+			list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
+				if (pos->addr == nentry->addr) {
+					--vram_mgr->n_queued_pages;
+					list_del_rcu(&pos->queued_link);
+					break;
+				}
+			}
+			++vram_mgr->n_offlined_pages;
+			list_add_rcu(&nentry->offlined_link, &vram_mgr->offlined_pages);
+			/* RAS will send command to FW for offlining page based on ret value */
+		}
+	}
+	/* Success */
+	return ret;
+}
+
+static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u64 addr)
+{
+	struct xe_tile *tile;
+	u8 id;
+
+	for_each_tile(tile, xe, id) {
+		struct xe_vram_region *vr = tile->mem.vram;
+
+		if (!vr)
+			continue;
+
+		if (addr >= vr->dpa_base && addr < (vr->dpa_base + vr->usable_size))
+			return vr;
+
+		/* CCS, GSM, or DSM — infrastructure zone, needs reset */
+		if (addr >= (vr->dpa_base + vr->usable_size) &&
+		    addr < (vr->dpa_base + vr->actual_physical_size))
+			return NULL;
+	}
+
+	/*
+	 * Return an explicit error pointer so the caller knows the addr
+	 * is invalid and should be ignored, NOT SBR.
+	 */
+	return ERR_PTR(-EOPNOTSUPP);
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
+ * * %-EOPNOTSUPP - log-only policy or unknown address; no further action.
+ * * %-ENOMEM - allocation failure; next action is reset.
+ * * %-ENXIO - address not found in buddy; no further action.
+ * * %-EEXIST - address already processed; no further action.
+ */
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
+{
+	struct xe_ttm_vram_mgr *vram_mgr;
+	struct xe_vram_region *vr;
+	struct gpu_buddy *mm;
+
+	/* Assert that the address is 4K aligned */
+	if (WARN_ON_ONCE(!IS_ALIGNED(addr, SZ_4K))) {
+		drm_err(&xe->drm, "Address %llx is not 4K aligned!\n", addr);
+		return -EINVAL;
+	}
+
+	vr = xe_ttm_vram_addr_to_region(xe, addr);
+	if (IS_ERR(vr)) {
+		/*
+		 * The addr is outside VRAM and GSM.
+		 * Log a debug message if needed, and safely exit/ignore.
+		 */
+		drm_dbg(&xe->drm, "Address %llx is out of bounds, ignoring fault.\n", addr);
+		return PTR_ERR(vr);
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
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
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
-- 
2.52.0

