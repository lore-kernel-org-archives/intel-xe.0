Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448F0C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 16:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCAC10E49D;
	Mon, 24 Mar 2025 16:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvHOR+G3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A8410E49D
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 16:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742835330; x=1774371330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WyeVeD+qmWfPFEJSbAY/XW7iB0YGsHcDt46rswF5R4c=;
 b=jvHOR+G3uxgsQUGdtShmZ3KGKPWyCIU+tfbbS2xugC6AR6wcTtU8ACWb
 YcwiR02HHUKpNW0h6LoIXsedVv04v2C2d6AE/1GHzAq1PC1DYokzLuMEP
 7C9IVmfhkaTKRdSsEdal2LlW3XBgQIfhL1qwZ6aBFiVdCTQe7RMWzWqbb
 Ivdy5FJRyNx6tXOHC3tiYzsRZJKhI4MWVq2Xsgz+hZ8ZAnTT5Sjhk24Eb
 BScZYB0gDxhaGwdfCtD/NNzZbIKPK/vHJzCOU1fJsA9a4yZLVoRn3ZDmD
 eOdMCSbbdgKQ7ybzpxHuLyDYCgTgYSKKYorTbH6ZJafWgmNTFdxb/ox8q w==;
X-CSE-ConnectionGUID: rvETU8p0Tjyx8cDQlXRAvQ==
X-CSE-MsgGUID: E5hVUXt3T/GwK6WhRJx96A==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54257249"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54257249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:55:30 -0700
X-CSE-ConnectionGUID: +hClxjcKTCCXn/cXh29V2g==
X-CSE-MsgGUID: 0Y76WONURWOo6UgmvowbHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="123912054"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.77])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 09:55:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v3 3/5] drm/xe/bo: Add a bo remove callback
Date: Mon, 24 Mar 2025 17:54:58 +0100
Message-ID: <20250324165500.20680-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
References: <20250324165500.20680-1-thomas.hellstrom@linux.intel.com>
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

All pinned external bos (not just the VRAM ones) are put on the
pinned.external list with this patch. But this only affects the
xe_bo_pci_dev_remove_pinned() function since !VRAM bos are
ignored by the suspend / resume functionality. As a follow-up we
could look at removing the suspend / resume iteration over
pinned external bos since we currently don't allow pinning
external bos in VRAM, and other external bos don't need any
special treatment at suspend / resume.

v2:
- Address review comments. (Matthew Auld).
v3:
- Don't introduce an external_evicted list (Matthew Auld)
- Add a discussion around suspend / resume behaviour to the
  commit message.
- Formatting fixes.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 54 +++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_bo.h           |  2 +
 drivers/gpu/drm/xe/xe_bo_evict.c     | 59 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_bo_evict.h     |  1 +
 drivers/gpu/drm/xe/xe_device.c       |  5 ++-
 drivers/gpu/drm/xe/xe_device_types.h |  4 +-
 6 files changed, 111 insertions(+), 14 deletions(-)

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
index 1eeb3910450b..7e82fb1f070e 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -93,8 +93,8 @@ int xe_bo_evict_all(struct xe_device *xe)
 		}
 	}
 
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
-				    &xe->pinned.external_vram,
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external,
+				    &xe->pinned.external,
 				    xe_bo_evict_pinned);
 
 	/*
@@ -181,8 +181,8 @@ int xe_bo_restore_user(struct xe_device *xe)
 		return 0;
 
 	/* Pinned user memory in VRAM should be validated on resume */
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external_vram,
-				    &xe->pinned.external_vram,
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external,
+				    &xe->pinned.external,
 				    xe_bo_restore_pinned);
 
 	/* Wait for restore to complete */
@@ -191,3 +191,54 @@ int xe_bo_restore_user(struct xe_device *xe)
 
 	return ret;
 }
+
+static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
+{
+	struct xe_tile *tile;
+	unsigned int id;
+
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.external,
+				    &xe->pinned.external,
+				    xe_bo_dma_unmap_pinned);
+	for_each_tile(tile, xe, id)
+		xe_tile_migrate_wait(tile);
+
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.kernel_bo_present,
+				    &xe->pinned.kernel_bo_present,
+				    xe_bo_dma_unmap_pinned);
+}
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
index b2f656b2a563..f1492ab8dcc3 100644
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
@@ -468,7 +469,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	spin_lock_init(&xe->pinned.lock);
 	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
-	INIT_LIST_HEAD(&xe->pinned.external_vram);
+	INIT_LIST_HEAD(&xe->pinned.external);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
@@ -925,6 +926,8 @@ void xe_device_remove(struct xe_device *xe)
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
+
+	xe_bo_pci_dev_remove_all(xe);
 }
 
 void xe_device_shutdown(struct xe_device *xe)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 4472bf849f2b..0cc14daf75d3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -426,8 +426,8 @@ struct xe_device {
 		struct list_head kernel_bo_present;
 		/** @pinned.evicted: pinned BO that have been evicted */
 		struct list_head evicted;
-		/** @pinned.external_vram: pinned external BO in vram*/
-		struct list_head external_vram;
+		/** @pinned.external: pinned external and dma-buf. */
+		struct list_head external;
 	} pinned;
 
 	/** @ufence_wq: user fence wait queue */
-- 
2.48.1

