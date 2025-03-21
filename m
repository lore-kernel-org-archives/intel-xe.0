Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEBBC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 16:34:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4A910E186;
	Fri, 21 Mar 2025 16:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kmY+W1lm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C43910E186
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 16:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742574877; x=1774110877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+S05hxm/AH2n8a0C1kiYjmEjXSAfBr9pq6li6gnGMnw=;
 b=kmY+W1lm52XX24oMJFHzlq3owqHUv4WcY8uqN/t2OsiLXbzKThEKhT35
 VdV0jrpEPM+txytkbBNVoF9cBDODn2CBz0Nt0f2TrPWh7HjiHA/Oo5Beu
 wM12Gt6R1WdWnG+UKDM3HY9kvuqOcEp6C/ou8Pcb38OOzaK8dGrxyxqLK
 A0wjgXW0mwWLAmASZvVhGC6/4Pz2We6vMVIs/QohmPhqXjdyoopGDVw7V
 hI5fdpQpqGkKgEt7ROWwFOcsINcDH3kIkyIh9x9pncq6lh4nwTaNFwtS/
 3cLxvrZMOq7YwWLS86Ok247Fna8PAicicIPfQab2QciyfZUgH1o/Md70L g==;
X-CSE-ConnectionGUID: 6kVDx8udSnmVWeWl/Y1HWg==
X-CSE-MsgGUID: EXBHrk/4RYywqOFJ637xOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43725625"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43725625"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:37 -0700
X-CSE-ConnectionGUID: R3b6gXEZQqSQW43sJCT0UA==
X-CSE-MsgGUID: b5sngkuhTna6gzIg4zrgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="128665385"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.196])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 09:34:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 3/5] drm/xe/bo: Add a bo remove callback
Date: Fri, 21 Mar 2025 17:34:14 +0100
Message-ID: <20250321163416.45217-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
References: <20250321163416.45217-1-thomas.hellstrom@linux.intel.com>
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

On device unbind, migrate exported bos, including pagemap bos to
system. This allows importers to take proper action without
disruption. In particular, SVM clients on remote devices may
continue as if nothing happened, and can chose a different
placement.

The evict_flags() placement is chosen in such a way that bos that
aren't exported are purged.

For pinned bos, we unmap DMA, but their pages are not freed yet
since we can't be 100% sure they are not accessed.

v2:
- Address review comments. (Matthew Auld).

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 54 ++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h           |  2 +
 drivers/gpu/drm/xe/xe_bo_evict.c     | 62 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_evict.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  6 ++-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++-
 6 files changed, 117 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 64f9c936eea0..9d043d2c30fd 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -55,6 +55,8 @@ static struct ttm_placement sys_placement = {
 	.placement = &sys_placement_flags,
 };
 
+static struct ttm_placement purge_placement;
+
 static const struct ttm_place tt_placement_flags[] = {
 	{
 		.fpfn = 0,
@@ -281,6 +283,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			   struct ttm_placement *placement)
 {
+	struct xe_device *xe = container_of(tbo->bdev, typeof(*xe), ttm);
+	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
 	struct xe_bo *bo;
 
 	if (!xe_bo_is_xe_bo(tbo)) {
@@ -290,7 +294,7 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 			return;
 		}
 
-		*placement = sys_placement;
+		*placement = device_unplugged ? purge_placement : sys_placement;
 		return;
 	}
 
@@ -300,6 +304,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
 		return;
 	}
 
+	if (device_unplugged && !tbo->base.dma_buf) {
+		*placement = purge_placement;
+		return;
+	}
+
 	/*
 	 * For xe, sg bos that are evicted to system just triggers a
 	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
@@ -657,11 +666,20 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
 	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
 					       ttm);
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
+	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
 	struct sg_table *sg;
 
 	xe_assert(xe, attach);
 	xe_assert(xe, ttm_bo->ttm);
 
+	if (device_unplugged && new_res->mem_type == XE_PL_SYSTEM &&
+	    ttm_bo->sg) {
+		dma_resv_wait_timeout(ttm_bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
+				      false, MAX_SCHEDULE_TIMEOUT);
+		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
+		ttm_bo->sg = NULL;
+	}
+
 	if (new_res->mem_type == XE_PL_SYSTEM)
 		goto out;
 
@@ -1224,6 +1242,31 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 	return ret;
 }
 
+int xe_bo_dma_unmap_pinned(struct xe_bo *bo)
+{
+	struct ttm_buffer_object *ttm_bo = &bo->ttm;
+	struct ttm_tt *tt = ttm_bo->ttm;
+
+	if (tt) {
+		struct xe_ttm_tt *xe_tt = container_of(tt, typeof(*xe_tt), ttm);
+
+		if (ttm_bo->type == ttm_bo_type_sg && ttm_bo->sg) {
+			dma_buf_unmap_attachment(ttm_bo->base.import_attach,
+						 ttm_bo->sg,
+						 DMA_BIDIRECTIONAL);
+			ttm_bo->sg = NULL;
+			xe_tt->sg = NULL;
+		} else if (xe_tt->sg) {
+			dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
+					  DMA_BIDIRECTIONAL, 0);
+			sg_free_table(xe_tt->sg);
+			xe_tt->sg = NULL;
+		}
+	}
+
+	return 0;
+}
+
 static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 				       unsigned long page_offset)
 {
@@ -2102,12 +2145,9 @@ int xe_bo_pin_external(struct xe_bo *bo)
 		if (err)
 			return err;
 
-		if (xe_bo_is_vram(bo)) {
-			spin_lock(&xe->pinned.lock);
-			list_add_tail(&bo->pinned_link,
-				      &xe->pinned.external_vram);
-			spin_unlock(&xe->pinned.lock);
-		}
+		spin_lock(&xe->pinned.lock);
+		list_add_tail(&bo->pinned_link, &xe->pinned.external);
+		spin_unlock(&xe->pinned.lock);
 	}
 
 	ttm_bo_pin(&bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index ec3e4446d027..05479240bf75 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -276,6 +276,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
 int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
 
+int xe_bo_dma_unmap_pinned(struct xe_bo *bo);
+
 extern const struct ttm_device_funcs xe_ttm_funcs;
 extern const char *const xe_mem_type_to_name[];
 
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 1eeb3910450b..ba0260900868 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -93,8 +93,8 @@ int xe_bo_evict_all(struct xe_device *xe)
 		}
 	}
 
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
-				    &xe->pinned.external_vram,
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external,
+				    &xe->pinned.external_evicted,
 				    xe_bo_evict_pinned);
 
 	/*
@@ -181,8 +181,8 @@ int xe_bo_restore_user(struct xe_device *xe)
 		return 0;
 
 	/* Pinned user memory in VRAM should be validated on resume */
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
-				    &xe->pinned.external_vram,
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external_evicted,
+				    &xe->pinned.external,
 				    xe_bo_restore_pinned);
 
 	/* Wait for restore to complete */
@@ -191,3 +191,57 @@ int xe_bo_restore_user(struct xe_device *xe)
 
 	return ret;
 }
+
+static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+
+	(void) xe_bo_apply_to_pinned(xe, &xe->pinned.external,
+				     &xe->pinned.external,
+				     xe_bo_dma_unmap_pinned);
+	for_each_tile(tile, xe, id)
+		xe_tile_migrate_wait(tile);
+
+	(void) xe_bo_apply_to_pinned(xe, &xe->pinned.kernel_bo_present,
+				    &xe->pinned.kernel_bo_present,
+				    xe_bo_dma_unmap_pinned);
+
+}
+
+
+
+/**
+ * xe_bo_pci_dev_remove_all() - Handle bos when the pci_device is about to be removed
+ * @xe: The xe device.
+ *
+ * On pci_device removal we need to drop all dma mappings and move
+ * the data of exported bos out to system. This includes SVM bos and
+ * exported dma-buf bos. This is done by evicting all bos, but
+ * the evict placement in xe_evict_flags() is chosen such that all
+ * bos except those mentioned are purged, and thus their memory
+ * is released.
+ *
+ * For pinned bos, we're unmapping dma.
+ */
+void xe_bo_pci_dev_remove_all(struct xe_device *xe)
+{
+	unsigned int mem_type;
+
+	/*
+	 * Move pagemap bos and exported dma-buf to system, and
+	 * purge everything else.
+	 */
+	for (mem_type = XE_PL_VRAM1; mem_type >= XE_PL_TT; --mem_type) {
+		struct ttm_resource_manager *man =
+			ttm_manager_type(&xe->ttm, mem_type);
+
+		if (man) {
+			int ret = ttm_resource_manager_evict_all(&xe->ttm, man);
+
+			drm_WARN_ON(&xe->drm, ret);
+		}
+	}
+
+	xe_bo_pci_dev_remove_pinned(xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index 746894798852..0f06140163d6 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -12,4 +12,5 @@ int xe_bo_evict_all(struct xe_device *xe);
 int xe_bo_restore_kernel(struct xe_device *xe);
 int xe_bo_restore_user(struct xe_device *xe);
 
+void xe_bo_pci_dev_remove_all(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index b2f656b2a563..739861edcd30 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -23,6 +23,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_bo.h"
+#include "xe_bo_evict.h"
 #include "xe_debugfs.h"
 #include "xe_devcoredump.h"
 #include "xe_dma_buf.h"
@@ -468,8 +469,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	spin_lock_init(&xe->pinned.lock);
 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
-	INIT_LIST_HEAD(&xe->pinned.external_vram);
+	INIT_LIST_HEAD(&xe->pinned.external);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
+	INIT_LIST_HEAD(&xe->pinned.external_evicted);
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
 						       WQ_MEM_RECLAIM);
@@ -925,6 +927,8 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+
+	xe_bo_pci_dev_remove_all(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4472bf849f2b..aa83ba414301 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -426,8 +426,10 @@ struct xe_device {
 		struct list_head kernel_bo_present;
 		/** @pinned.evicted: pinned BO that have been evicted */
 		struct list_head evicted;
-		/** @pinned.external_vram: pinned external BO in vram*/
-		struct list_head external_vram;
+		/** @pinned.external: pinned external and dma-buf. */
+		struct list_head external;
+		/** @pinned.external: evicted pinned external and dma-buf. */
+		struct list_head external_evicted;
 	} pinned;
 
 	/** @ufence_wq: user fence wait queue */
-- 
2.48.1

