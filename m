Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEFBDE77188
	for <intel-xe@archiver.kernel.org>; Wed, 18 Dec 2024 12:19:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD9910EB93;
	Wed, 18 Dec 2024 12:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8oVUYd6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09F210EB8D
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Dec 2024 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734524351; x=1766060351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OIFlQxCXYV4ZOSsN/2p/PMKWhI7zAzf3ziouIvwlC4Q=;
 b=j8oVUYd69JZlWjF8llPsLlBqR5mDhA2NziIxRB+1ijFBeoT6SjPVuriE
 wmwTdISSLAY73XfeIJmXBsbypSRZE8yhkGE5iawz1oCyxxaXpWkgvkkhJ
 89bvr2WVApEH1UYG7GDt5Wchl3zXSixBLKagfPEvRt60xY+TR9K8g2zcj
 Rw6Y8Awo7Nkq4KzU2CynEEC+i6V7ouLWs7R3WWQg22R5bk/N8SaBjHXBU
 9UURmh5eqRy+5FYmZuazlPanf/uLO5a6+ha9TlIGwikNPgM8KBvpkK7Go
 ppLghlGh9G1F8FOr2CGnQkUPBbeB8ZpP+tH8XMUsvHP481SBQ+iPz6LEO Q==;
X-CSE-ConnectionGUID: nOltYRbRT2OWJzTOKh10WQ==
X-CSE-MsgGUID: saLvsYQVQyapBWAAZbt5Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="35028081"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35028081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:11 -0800
X-CSE-ConnectionGUID: JgyLHt1lQBq2+iXcjvi5bw==
X-CSE-MsgGUID: 11Inwq/URjuZV+S5rOZUrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="97633576"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.74])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 04:19:10 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 2/7] drm/xe: split pinned save/restore into phases
Date: Wed, 18 Dec 2024 12:18:40 +0000
Message-ID: <20241218121837.226393-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218121837.226393-9-matthew.auld@intel.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
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

Early phase we can only use memcpy to bootstrap enough of the system to
get working submission. For late phase we can switch over to using GPU
blitter to do the copy. As part of this move the user pinned stuff into
the late phase. In the future we can move more kernel pinned stuff into
the late phase.

v2:
 - Invert ordering in evict_pinned when skipping; should be opposite of
   restore.
 - Fix kernel-doc.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c     |   8 +-
 drivers/gpu/drm/xe/xe_bo.c           |   7 +-
 drivers/gpu/drm/xe/xe_bo.h           |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c     | 220 ++++++++++++---------------
 drivers/gpu/drm/xe/xe_bo_evict.h     |   4 +-
 drivers/gpu/drm/xe/xe_device.c       |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h |   6 +-
 drivers/gpu/drm/xe/xe_pm.c           |  16 +-
 8 files changed, 122 insertions(+), 143 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index c9ec7a313c6b..7619eba2ef1f 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -252,7 +252,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 		for_each_gt(__gt, xe, id)
 			xe_gt_sanitize(__gt);
-		err = xe_bo_restore_kernel(xe);
+		err = xe_bo_restore_pinned_early(xe);
 		/*
 		 * Snapshotting the CTB and copying back a potentially old
 		 * version seems risky, depending on what might have been
@@ -269,14 +269,14 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 			flush_work(&__gt->reset.worker);
 		}
 		if (err) {
-			KUNIT_FAIL(test, "restore kernel err=%pe\n",
+			KUNIT_FAIL(test, "restore early err=%pe\n",
 				   ERR_PTR(err));
 			goto cleanup_all;
 		}
 
-		err = xe_bo_restore_user(xe);
+		err = xe_bo_restore_pinned_late(xe);
 		if (err) {
-			KUNIT_FAIL(test, "restore user err=%pe\n", ERR_PTR(err));
+			KUNIT_FAIL(test, "restore late err=%pe\n", ERR_PTR(err));
 			goto cleanup_all;
 		}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index fa2d74a56283..c0515c1dd00c 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -124,7 +124,7 @@ bool xe_bo_is_stolen_devmem(struct xe_bo *bo)
 		GRAPHICS_VERx100(xe_bo_device(bo)) >= 1270;
 }
 
-static bool xe_bo_is_user(struct xe_bo *bo)
+bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_FLAG_USER;
 }
@@ -1885,8 +1885,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 
 		if (xe_bo_is_vram(bo)) {
 			spin_lock(&xe->pinned.lock);
-			list_add_tail(&bo->pinned_link,
-				      &xe->pinned.external_vram);
+			list_add_tail(&bo->pinned_link, &xe->pinned.present);
 			spin_unlock(&xe->pinned.lock);
 		}
 	}
@@ -1930,7 +1929,7 @@ int xe_bo_pin(struct xe_bo *bo)
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
 		spin_lock(&xe->pinned.lock);
-		list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
+		list_add_tail(&bo->pinned_link, &xe->pinned.present);
 		spin_unlock(&xe->pinned.lock);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index d9386ab03140..a0ac2b9c903d 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -235,6 +235,7 @@ bool xe_bo_is_vram(struct xe_bo *bo);
 bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
 bool xe_bo_has_single_placement(struct xe_bo *bo);
+bool xe_bo_is_user(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 96764d8169f4..119b8301bd7f 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -10,6 +10,49 @@
 #include "xe_ggtt.h"
 #include "xe_tile.h"
 
+static int xe_evict_pinned(struct xe_device *xe, bool memcpy_only)
+{
+	struct xe_tile *tile;
+	LIST_HEAD(skipped);
+	struct xe_bo *bo;
+	u8 id;
+	int ret = 0;
+
+	spin_lock(&xe->pinned.lock);
+	for (;;) {
+		bo = list_first_entry_or_null(&xe->pinned.present, typeof(*bo), pinned_link);
+		if (!bo)
+			break;
+
+		if (!memcpy_only && !xe_bo_is_user(bo)) {
+			list_move_tail(&bo->pinned_link, &skipped);
+			continue;
+		}
+
+		xe_bo_get(bo);
+		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
+		spin_unlock(&xe->pinned.lock);
+
+		ret = xe_bo_evict_pinned(bo);
+		xe_bo_put(bo);
+		spin_lock(&xe->pinned.lock);
+		if (ret) {
+			list_move_tail(&bo->pinned_link, &xe->pinned.present);
+			break;
+		}
+	}
+
+	list_splice_tail(&skipped, &xe->pinned.evicted);
+	spin_unlock(&xe->pinned.lock);
+
+	if (!memcpy_only) {
+		for_each_tile(tile, xe, id)
+			xe_tile_migrate_wait(tile);
+	}
+
+	return ret;
+}
+
 /**
  * xe_bo_evict_all - evict all BOs from VRAM
  *
@@ -27,11 +70,7 @@
 int xe_bo_evict_all(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
-	struct xe_bo *bo;
-	struct xe_tile *tile;
-	struct list_head still_in_list;
 	u32 mem_type;
-	u8 id;
 	int ret;
 
 	/* User memory */
@@ -57,92 +96,57 @@ int xe_bo_evict_all(struct xe_device *xe)
 		}
 	}
 
-	/* Pinned user memory in VRAM */
-	INIT_LIST_HEAD(&still_in_list);
-	spin_lock(&xe->pinned.lock);
-	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.external_vram,
-					      typeof(*bo), pinned_link);
-		if (!bo)
-			break;
-		xe_bo_get(bo);
-		list_move_tail(&bo->pinned_link, &still_in_list);
-		spin_unlock(&xe->pinned.lock);
-
-		ret = xe_bo_evict_pinned(bo);
-		xe_bo_put(bo);
-		if (ret) {
-			spin_lock(&xe->pinned.lock);
-			list_splice_tail(&still_in_list,
-					 &xe->pinned.external_vram);
-			spin_unlock(&xe->pinned.lock);
-			return ret;
-		}
-
-		spin_lock(&xe->pinned.lock);
-	}
-	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
-	spin_unlock(&xe->pinned.lock);
-
-	/*
-	 * Wait for all user BO to be evicted as those evictions depend on the
-	 * memory moved below.
-	 */
-	for_each_tile(tile, xe, id)
-		xe_tile_migrate_wait(tile);
-
-	spin_lock(&xe->pinned.lock);
-	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.kernel_bo_present,
-					      typeof(*bo), pinned_link);
-		if (!bo)
-			break;
-		xe_bo_get(bo);
-		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
-		spin_unlock(&xe->pinned.lock);
-
-		ret = xe_bo_evict_pinned(bo);
-		xe_bo_put(bo);
-		if (ret)
-			return ret;
-
-		spin_lock(&xe->pinned.lock);
-	}
-	spin_unlock(&xe->pinned.lock);
+	/* Pinned user memory in VRAM and anything else that can be blitted */
+	ret = xe_evict_pinned(xe, false);
+	if (ret)
+		return ret;
 
-	return 0;
+	/* Pinned kernel memory that must use memcpy only */
+	return xe_evict_pinned(xe, true);
 }
 
 /**
- * xe_bo_restore_kernel - restore kernel BOs to VRAM
+ * xe_restore_pinned - restore pinned BOs to VRAM
  *
  * @xe: xe device
+ * @memcpy_only: skip objects that dont need memcpy
  *
- * Move kernel BOs from temporary (typically system) memory to VRAM via CPU. All
+ * Move BOs from temporary (typically system) memory to VRAM. All
  * moves done via TTM calls.
  *
- * This function should be called early, before trying to init the GT, on device
- * resume.
+ * If this function is called early, before trying to init the GT, on device
+ * resume then @memcpy_only should be set.
  */
-int xe_bo_restore_kernel(struct xe_device *xe)
+static int xe_restore_pinned(struct xe_device *xe, bool memcpy_only)
 {
+	struct xe_tile *tile;
+	LIST_HEAD(skipped);
 	struct xe_bo *bo;
-	int ret;
+	u8 id;
+	int ret = 0;
 
 	spin_lock(&xe->pinned.lock);
 	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.evicted,
-					      typeof(*bo), pinned_link);
+		bo = list_first_entry_or_null(&xe->pinned.evicted, typeof(*bo),
+					      pinned_link);
 		if (!bo)
 			break;
+
+		if (memcpy_only && xe_bo_is_user(bo)) {
+			list_move_tail(&bo->pinned_link, &skipped);
+			continue;
+		}
+
 		xe_bo_get(bo);
-		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
+		list_move_tail(&bo->pinned_link, &xe->pinned.present);
 		spin_unlock(&xe->pinned.lock);
 
 		ret = xe_bo_restore_pinned(bo);
 		if (ret) {
+			spin_lock(&xe->pinned.lock);
+			list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
 			xe_bo_put(bo);
-			return ret;
+			break;
 		}
 
 		if (bo->flags & XE_BO_FLAG_GGTT) {
@@ -159,72 +163,50 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 			}
 		}
 
-		/*
-		 * We expect validate to trigger a move VRAM and our move code
-		 * should setup the iosys map.
-		 */
-		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
-
 		xe_bo_put(bo);
 
 		spin_lock(&xe->pinned.lock);
 	}
+
+	list_splice_tail(&skipped, &xe->pinned.evicted);
 	spin_unlock(&xe->pinned.lock);
 
-	return 0;
+	if (!memcpy_only) {
+		for_each_tile(tile, xe, id)
+			xe_tile_migrate_wait(tile);
+	}
+
+	return ret;
 }
 
 /**
- * xe_bo_restore_user - restore pinned user BOs to VRAM
+ * xe_bo_restore_pinned_early - restore kernel BOs to VRAM during early resume, before
+ * we have working migration/GuC, using memcopy
  *
  * @xe: xe device
  *
- * Move pinned user BOs from temporary (typically system) memory to VRAM via
- * CPU. All moves done via TTM calls.
+ * Copy kernel BOs from temporary (typically system) memory to VRAM via CPU. All
+ * moves done via TTM calls.
  *
- * This function should be called late, after GT init, on device resume.
+ * This function should be called early, before trying to init the GT, on device
+ * resume.
  */
-int xe_bo_restore_user(struct xe_device *xe)
+int xe_bo_restore_pinned_early(struct xe_device *xe)
 {
-	struct xe_bo *bo;
-	struct xe_tile *tile;
-	struct list_head still_in_list;
-	u8 id;
-	int ret;
-
-	if (!IS_DGFX(xe))
-		return 0;
-
-	/* Pinned user memory in VRAM should be validated on resume */
-	INIT_LIST_HEAD(&still_in_list);
-	spin_lock(&xe->pinned.lock);
-	for (;;) {
-		bo = list_first_entry_or_null(&xe->pinned.external_vram,
-					      typeof(*bo), pinned_link);
-		if (!bo)
-			break;
-		list_move_tail(&bo->pinned_link, &still_in_list);
-		xe_bo_get(bo);
-		spin_unlock(&xe->pinned.lock);
-
-		ret = xe_bo_restore_pinned(bo);
-		xe_bo_put(bo);
-		if (ret) {
-			spin_lock(&xe->pinned.lock);
-			list_splice_tail(&still_in_list,
-					 &xe->pinned.external_vram);
-			spin_unlock(&xe->pinned.lock);
-			return ret;
-		}
-
-		spin_lock(&xe->pinned.lock);
-	}
-	list_splice_tail(&still_in_list, &xe->pinned.external_vram);
-	spin_unlock(&xe->pinned.lock);
-
-	/* Wait for restore to complete */
-	for_each_tile(tile, xe, id)
-		xe_tile_migrate_wait(tile);
+	return xe_restore_pinned(xe, true);
+}
 
-	return 0;
+/**
+ * xe_bo_restore_pinned_late - restore pinned BOs to VRAM using GPU copy
+ *
+ * @xe: xe device
+ *
+ * Copy kernel BOs from temporary (typically system) memory to VRAM via CPU. All
+ * moves done via TTM calls.
+ *
+ * This function should be called late, once submission is working.
+ */
+int xe_bo_restore_pinned_late(struct xe_device *xe)
+{
+	return xe_restore_pinned(xe, false);
 }
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index 746894798852..094f69e69cdb 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -9,7 +9,7 @@
 struct xe_device;
 
 int xe_bo_evict_all(struct xe_device *xe);
-int xe_bo_restore_kernel(struct xe_device *xe);
-int xe_bo_restore_user(struct xe_device *xe);
+int xe_bo_restore_pinned_early(struct xe_device *xe);
+int xe_bo_restore_pinned_late(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index bf36e4fb4679..14b691753ac8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -349,8 +349,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	}
 
 	spin_lock_init(&xe->pinned.lock);
-	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
-	INIT_LIST_HEAD(&xe->pinned.external_vram);
+	INIT_LIST_HEAD(&xe->pinned.present);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 8a7b15972413..aacf2eb37ac3 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -405,12 +405,10 @@ struct xe_device {
 	struct {
 		/** @pinned.lock: protected pinned BO list state */
 		spinlock_t lock;
-		/** @pinned.kernel_bo_present: pinned kernel BO that are present */
-		struct list_head kernel_bo_present;
+		/** @pinned.present: pinned BO that are present */
+		struct list_head present;
 		/** @pinned.evicted: pinned BO that have been evicted */
 		struct list_head evicted;
-		/** @pinned.external_vram: pinned external BO in vram*/
-		struct list_head external_vram;
 	} pinned;
 
 	/** @ufence_wq: user fence wait queue */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a6761cb769b2..5a3c3436c491 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -179,7 +179,7 @@ int xe_pm_resume(struct xe_device *xe)
 	 * This only restores pinned memory which is the memory required for the
 	 * GT(s) to resume.
 	 */
-	err = xe_bo_restore_kernel(xe);
+	err = xe_bo_restore_pinned_early(xe);
 	if (err)
 		goto err;
 
@@ -188,12 +188,12 @@ int xe_pm_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	xe_display_pm_resume(xe);
-
-	err = xe_bo_restore_user(xe);
+	err = xe_bo_restore_pinned_late(xe);
 	if (err)
 		goto err;
 
+	xe_display_pm_resume(xe);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
@@ -453,7 +453,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
 		 */
-		err = xe_bo_restore_kernel(xe);
+		err = xe_bo_restore_pinned_early(xe);
 		if (err)
 			goto out;
 	}
@@ -463,14 +463,14 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	xe_display_pm_runtime_resume(xe);
-
 	if (xe->d3cold.allowed) {
-		err = xe_bo_restore_user(xe);
+		err = xe_bo_restore_pinned_late(xe);
 		if (err)
 			goto out;
 	}
 
+	xe_display_pm_runtime_resume(xe);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
-- 
2.47.1

