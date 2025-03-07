Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AA4C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77CF510E6B0;
	Fri,  7 Mar 2025 18:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIl349OP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCDF10E6B0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372162; x=1772908162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AgqNo1E57fXUSUSWDVFvaQE/gO2p0f7BdHpIsZzer5E=;
 b=XIl349OP94S82/ip+bXsdwErL4MyL/dvSHOHuZkS8HBun0L5r3oIELgl
 QGTdnOVEF8Xht+KCoeHNZ5hpPTaH7EXy+ZL1EKXkR8oxUQn8uBQLi36UQ
 vFoPYcE4SsUboRjVBVq0U976KG/Z7MksS6cuUViyGAi3S7o3Ga0TKOkEt
 szcfWdI5aRWT3f5lBB1eJ/aD8o/KryARHcgUrMI7v6B2K+BWxwZ6eC3j5
 /84WVUqsTfme7xnOtPQC8iGxyh3hd+M1mmVxb7n8d6pnIjCkRMFO9T0Ei
 w6vz2+yrlujZs0mqZj37QGUaFYksBPLtDLgPvHzapW7Wr5KH+CQ0iAcj/ Q==;
X-CSE-ConnectionGUID: K3WMntdbSTyeiw8WAHrZhg==
X-CSE-MsgGUID: z2AuQimoTmCaAW2ZeOpyDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52639831"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52639831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:22 -0800
X-CSE-ConnectionGUID: LYrvsxfxRRiDi99ltA2YbQ==
X-CSE-MsgGUID: /r77upBaRMO0jf4/K4rG+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124625645"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:21 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v3 2/8] drm/xe: split pinned save/restore into phases
Date: Fri,  7 Mar 2025 18:28:59 +0000
Message-ID: <20250307182856.304850-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
References: <20250307182856.304850-10-matthew.auld@intel.com>
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
v3:
 - Fix bug around splicing to wrong list.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c     |   8 +-
 drivers/gpu/drm/xe/xe_bo.c           |   7 +-
 drivers/gpu/drm/xe/xe_bo.h           |   1 +
 drivers/gpu/drm/xe/xe_bo_evict.c     | 228 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_bo_evict.h     |   4 +-
 drivers/gpu/drm/xe/xe_device.c       |   3 +-
 drivers/gpu/drm/xe/xe_device_types.h |   6 +-
 drivers/gpu/drm/xe/xe_pm.c           |  14 +-
 8 files changed, 125 insertions(+), 146 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9fde67ca989f..a778326bca5a 100644
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
@@ -268,14 +268,14 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 			xe_gt_reset(__gt);
 
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
index 362f08f8e743..7fe70f28f7fa 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -146,7 +146,7 @@ bool xe_bo_is_vm_bound(struct xe_bo *bo)
 	return !list_empty(&bo->ttm.base.gpuva.list);
 }
 
-static bool xe_bo_is_user(struct xe_bo *bo)
+bool xe_bo_is_user(struct xe_bo *bo)
 {
 	return bo->flags & XE_BO_FLAG_USER;
 }
@@ -2135,8 +2135,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 
 		if (xe_bo_is_vram(bo)) {
 			spin_lock(&xe->pinned.lock);
-			list_add_tail(&bo->pinned_link,
-				      &xe->pinned.external_vram);
+			list_add_tail(&bo->pinned_link, &xe->pinned.present);
 			spin_unlock(&xe->pinned.lock);
 		}
 	}
@@ -2182,7 +2181,7 @@ int xe_bo_pin(struct xe_bo *bo)
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
 		spin_lock(&xe->pinned.lock);
-		list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
+		list_add_tail(&bo->pinned_link, &xe->pinned.present);
 		spin_unlock(&xe->pinned.lock);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index bda3fdd408da..bec33eb3fa95 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -266,6 +266,7 @@ bool xe_bo_is_stolen(struct xe_bo *bo);
 bool xe_bo_is_stolen_devmem(struct xe_bo *bo);
 bool xe_bo_is_vm_bound(struct xe_bo *bo);
 bool xe_bo_has_single_placement(struct xe_bo *bo);
+bool xe_bo_is_user(struct xe_bo *bo);
 uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 96764d8169f4..41a948de3583 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -10,6 +10,52 @@
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
+		if (ret) {
+			spin_lock(&xe->pinned.lock);
+			list_move_tail(&bo->pinned_link, &xe->pinned.present);
+			xe_bo_put_async(bo);
+			break;
+		}
+
+		xe_bo_put(bo);
+		spin_lock(&xe->pinned.lock);
+	}
+
+	list_splice_tail(&skipped, &xe->pinned.present);
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
@@ -27,11 +73,7 @@
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
@@ -57,92 +99,57 @@ int xe_bo_evict_all(struct xe_device *xe)
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
+	/* Pinned user memory in VRAM and anything else that can be blitted */
+	ret = xe_evict_pinned(xe, false);
+	if (ret)
+		return ret;
 
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
-
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
-			xe_bo_put(bo);
-			return ret;
+			spin_lock(&xe->pinned.lock);
+			list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
+			xe_bo_put_async(bo);
+			break;
 		}
 
 		if (bo->flags & XE_BO_FLAG_GGTT) {
@@ -159,72 +166,49 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 			}
 		}
 
-		/*
-		 * We expect validate to trigger a move VRAM and our move code
-		 * should setup the iosys map.
-		 */
-		xe_assert(xe, !iosys_map_is_null(&bo->vmap));
-
 		xe_bo_put(bo);
-
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
-
-	return 0;
+	return xe_restore_pinned(xe, true);
+}
+
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
index 5d79b439dd62..fa3931b516ea 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -467,8 +467,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	}
 
 	spin_lock_init(&xe->pinned.lock);
-	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
-	INIT_LIST_HEAD(&xe->pinned.external_vram);
+	INIT_LIST_HEAD(&xe->pinned.present);
 	INIT_LIST_HEAD(&xe->pinned.evicted);
 
 	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 72ef0b6fc425..2fae9fd4b05c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -418,12 +418,10 @@ struct xe_device {
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
index 12200be7b43d..8f6f0248e59a 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -188,7 +188,7 @@ int xe_pm_resume(struct xe_device *xe)
 	 * This only restores pinned memory which is the memory required for the
 	 * GT(s) to resume.
 	 */
-	err = xe_bo_restore_kernel(xe);
+	err = xe_bo_restore_pinned_early(xe);
 	if (err)
 		goto err;
 
@@ -197,13 +197,12 @@ int xe_pm_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	xe_display_pm_resume(xe);
-
-	err = xe_bo_restore_user(xe);
+	err = xe_bo_restore_pinned_late(xe);
 	if (err)
 		goto err;
 
 	xe_pxp_pm_resume(xe->pxp);
+	xe_display_pm_resume(xe);
 
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
@@ -473,7 +472,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
 		 */
-		err = xe_bo_restore_kernel(xe);
+		err = xe_bo_restore_pinned_early(xe);
 		if (err)
 			goto out;
 	}
@@ -483,15 +482,14 @@ int xe_pm_runtime_resume(struct xe_device *xe)
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
 
 	xe_pxp_pm_resume(xe->pxp);
+	xe_display_pm_runtime_resume(xe);
 
 out:
 	xe_rpm_lockmap_release(xe);
-- 
2.48.1

