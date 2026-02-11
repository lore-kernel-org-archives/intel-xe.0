Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFF4EB5961
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 05:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC64610E175;
	Wed, 11 Feb 2026 05:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdnVfYtD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FC010E093
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 05:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770786170; x=1802322170;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rmel7IsqWLv3d0FRE5zgkcuVKXGSRME17dLtFDxnOiI=;
 b=UdnVfYtDCXVpVQtebGwWk2Utz8kSGrdL7D4dXl6yC1s18jZav41dCtu6
 yytlDsJZThslgM3eBCf5aTF7cBlHrH7dumbMHEXELGs6NHX9rmet00euu
 NGcS99VzKLr25c00YNHN4qlFJqyJoSmoTyg7q9U795sJMs/vEkWoYSCKw
 Ifjh/4jEPJ4JEhO8uhlOO62JrzLvgFM63Rdbq30et+Tol+EL8uNWtK+WQ
 ikvB9r2MumpExC7S72ppOoLJKYXHZROOcVa1bXsnkc3OGYVUT6gk6NmYR
 5chRCq42lt/EYyDYhkCSt/+qPULzJTN3lMo3ZtskQRzLTn+M3yL+cWBMj g==;
X-CSE-ConnectionGUID: 0p0pLiFGT6i50+fdnkQoew==
X-CSE-MsgGUID: wvnKmdS8QOuUVd2pKpZIOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="72113162"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="72113162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:02:50 -0800
X-CSE-ConnectionGUID: MMqpHnMdSwaUBPLBzeTZVg==
X-CSE-MsgGUID: JLnsJsJ9Twi4wRMITRA8mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216302533"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 21:02:48 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, matthew.brost@intel.com,
 himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [RFC PATCH 2/5] drm/xe: Handle physical memory address error
Date: Wed, 11 Feb 2026 10:31:35 +0530
Message-ID: <20260211050132.1332599-9-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211050132.1332599-7-tejas.upadhyay@intel.com>
References: <20260211050132.1332599-7-tejas.upadhyay@intel.com>
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

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 187 ++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  21 +++
 2 files changed, 203 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 4e852eed5170..ab8243b17cf3 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -276,6 +276,26 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
 	.debug	= xe_ttm_vram_mgr_debug
 };
 
+static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
+{
+	struct xe_ttm_offline_resource *pos, *n;
+
+	mutex_lock(&mgr->lock);
+	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
+		--mgr->n_offlined_pages;
+		drm_buddy_free_list(&mgr->mm, &pos->blocks, 0);
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
@@ -287,6 +307,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
 	if (ttm_resource_manager_evict_all(&xe->ttm, man))
 		return;
 
+	xe_ttm_vram_free_bad_pages(dev, mgr);
+
 	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
 
 	drm_buddy_fini(&mgr->mm);
@@ -315,6 +337,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	man->func = &xe_ttm_vram_mgr_func;
 	mgr->mem_type = mem_type;
 	mutex_init(&mgr->lock);
+	INIT_LIST_HEAD(&mgr->offlined_pages);
+	INIT_LIST_HEAD(&mgr->queued_pages);
 	mgr->default_page_size = default_page_size;
 	mgr->visible_size = io_size;
 	mgr->visible_avail = io_size;
@@ -531,14 +555,167 @@ static struct ttm_buffer_object *xe_ttm_vram_addr_to_tbo(struct drm_buddy *mm, u
 	return NULL;
 }
 
-int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr)
+static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long addr,
+					    struct xe_ttm_vram_mgr *vram_mgr, struct drm_buddy *mm)
 {
-	struct xe_ttm_vram_mgr *vram_mgr = &tile->mem.vram->ttm;
-	struct drm_buddy mm = vram_mgr->mm;
+	int ret = 0;
+	u64 size = SZ_4K;
 	struct ttm_buffer_object *tbo;
+	struct xe_ttm_offline_resource *nentry;
+
+	mutex_lock(&vram_mgr->lock);
+	tbo = xe_ttm_vram_addr_to_tbo(mm, addr);
+	if (IS_ERR(tbo)) {
+		drm_err(&xe->drm, "Could not traverse blocks ret:%ld... Exiting\n",
+			PTR_ERR(tbo));
+		mutex_unlock(&vram_mgr->lock);
+		return -EFAULT;
+	}
 
-	tbo = xe_ttm_vram_addr_to_tbo(&mm, addr);
+	nentry = kzalloc(sizeof(*nentry), GFP_KERNEL);
+	if (!nentry)
+		return -ENOMEM;
 
-	return 0;
+	INIT_LIST_HEAD(&nentry->blocks);
+	if (tbo) {
+		struct xe_ttm_vram_mgr_resource *pvres;
+		struct ttm_placement place = {};
+		struct ttm_operation_ctx ctx = {
+			.interruptible = false,
+			.gfp_retry_mayfail = false,
+		};
+		bool locked;
+		struct xe_ttm_offline_resource *pos, *n;
+		struct xe_bo *pbo = ttm_to_xe_bo(tbo);
+
+		xe_bo_get(pbo);
+		/* Critical kernel BO? */
+		if (pbo->ttm.type == ttm_bo_type_kernel &&
+		    !(pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM)) {
+			mutex_unlock(&vram_mgr->lock);
+			xe_bo_put(pbo);
+			drm_warn(&xe->drm,
+				 "%s: corrupt addr: %lx in critical kernel bo, wedge now\n",
+				__func__, addr);
+			/* Wedge the device */
+			xe_device_declare_wedged(xe);
+			return -EIO;
+		}
+		pvres = to_xe_ttm_vram_mgr_resource(pbo->ttm.resource);
+		nentry->id = ++vram_mgr->n_queued_pages;
+		nentry->blocks = pvres->blocks;
+		list_add(&nentry->queued_link, &vram_mgr->queued_pages);
+		mutex_unlock(&vram_mgr->lock);
+
+		/* Purge BO containing address */
+		spin_lock(&pbo->ttm.bdev->lru_lock);
+		locked = dma_resv_trylock(pbo->ttm.base.resv);
+		spin_unlock(&pbo->ttm.bdev->lru_lock);
+		WARN_ON(!locked);
+		ret = ttm_bo_validate(&pbo->ttm, &place, &ctx);
+		drm_WARN_ON(&xe->drm, ret);
+		xe_bo_put(pbo);
+		if (locked)
+			dma_resv_unlock(pbo->ttm.base.resv);
+
+		/* Reserve page at address addr*/
+		mutex_lock(&vram_mgr->lock);
+		ret = drm_buddy_alloc_blocks(mm, addr, addr + size,
+					     size, size, &nentry->blocks,
+					     DRM_BUDDY_RANGE_ALLOCATION);
+
+		if (ret) {
+			drm_warn(&xe->drm, "Could not reserve page at addr:%lx, ret:%d\n",
+				 addr, ret);
+			mutex_unlock(&vram_mgr->lock);
+			return ret;
+		}
+		if ((addr + size) <= vram_mgr->visible_size) {
+			nentry->used_visible_size = size;
+		} else {
+			struct drm_buddy_block *block;
+
+			list_for_each_entry(block, &nentry->blocks, link) {
+				u64 start = drm_buddy_block_offset(block);
+
+				if (start < vram_mgr->visible_size) {
+					u64 end = start + drm_buddy_block_size(mm, block);
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
+		++vram_mgr->n_offlined_pages;
+		mutex_unlock(&vram_mgr->lock);
+		return ret;
+
+	} else {
+		ret = drm_buddy_alloc_blocks(mm, addr, addr + size,
+					     size, size, &nentry->blocks,
+					     DRM_BUDDY_RANGE_ALLOCATION);
+		if (ret) {
+			drm_warn(&xe->drm, "Could not reserve page at addr:%lx, ret:%d\n",
+				 addr, ret);
+			list_del(&nentry->offlined_link);
+			kfree(nentry);
+			mutex_unlock(&vram_mgr->lock);
+			return ret;
+		}
+		if ((addr + size) <= vram_mgr->visible_size) {
+			nentry->used_visible_size = size;
+		} else {
+			struct drm_buddy_block *block;
+
+			list_for_each_entry(block, &nentry->blocks, link) {
+				u64 start = drm_buddy_block_offset(block);
+
+				if (start < vram_mgr->visible_size) {
+					u64 end = start + drm_buddy_block_size(mm, block);
+
+					nentry->used_visible_size +=
+						min(end, vram_mgr->visible_size) - start;
+				}
+			}
+		}
+		vram_mgr->visible_avail -= nentry->used_visible_size;
+		nentry->id = ++vram_mgr->n_offlined_pages;
+		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
+		mutex_unlock(&vram_mgr->lock);
+	}
+	/* Success */
+	return ret;
+}
+
+/**
+ * xe_ttm_tbo_handle_addr_fault - Handle vram physical address error flaged
+ * @tile: pointer to tile where address belongs
+ * @addr: physical faulty address
+ *
+ * Handle the physcial faulty address error on specific tile.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr)
+{
+	struct xe_ttm_vram_mgr *vram_mgr = &tile->mem.vram->ttm;
+	struct drm_buddy mm = vram_mgr->mm;
+	struct xe_device *xe = tile_to_xe(tile);
+	int ret;
+
+	 /* Reserve page at address */
+	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, &mm);
+	if (ret == -EIO)
+		return 0; /* success, wedged by kernel. */
+	return ret;
 }
 EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index a71e14818ec2..85511b51af75 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
+	/** @offlined_pages: List of offlined pages */
+	struct list_head offlined_pages;
+	/** @n_offlined_pages: Number of offlined pages */
+	u16 n_offlined_pages;
+	/** @queued_pages: List of queued pages */
+	struct list_head queued_pages;
+       /** @n_queued_pages: Number of queued pages */
+	u16 n_queued_pages;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
@@ -45,4 +53,17 @@ struct xe_ttm_vram_mgr_resource {
 	unsigned long flags;
 };
 
+struct xe_ttm_offline_resource {
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
+};
+
 #endif
-- 
2.52.0

