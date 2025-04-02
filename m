Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFECC3601B
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 09:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D085310E726;
	Wed,  2 Apr 2025 09:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nL/m+OhJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5C810E6F2
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743586183; x=1775122183;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4uOxbolUvum18s2lilV+jo1Or4gq9+yVmVherJzHTQY=;
 b=nL/m+OhJmGZ7vG1biBHPMNSfbcUTO9Kw5H1ZoZV8dYyBKi8CCaosp/VH
 s/4UTZUU1+4b7P2S47U8+/8iLliHqT0GCs+lZmM9ZDSC5FXMjP8PaA2bD
 a1/IZXY8QlKAfHYkCPD4Bcb/+u+Trup1QI7J7041hDPQ6LOcz8/vC8ZpI
 THTxhmogTGzO4FT4zIdGVclVD8zDyCLHbpzH2pnxYrKpU9pL9bPSIQoNL
 YKGZFlrh0npcDaigJ7jKrP2PBVIQKmpwSDD/77ZXRLSQvp8Lh37vXKCm+
 LfTlbrFq19pCJ0FtKQPXXBoWNkTQKEQF3klycn4GC+QDLvgowDzo2giCQ A==;
X-CSE-ConnectionGUID: t0mXoLOnRD26eJCe9Akgzg==
X-CSE-MsgGUID: szXjUANAT5K4No9GoNtDpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44824862"
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; d="scan'208";a="44824862"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:29:43 -0700
X-CSE-ConnectionGUID: HdvfKrhVQ5KdCmD7in6XXw==
X-CSE-MsgGUID: wDXWWj9eRBi1T7RQcLlSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; d="scan'208";a="126538396"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.252])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:29:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 4/7] drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE
Date: Wed,  2 Apr 2025 10:29:26 +0100
Message-ID: <20250402092921.79918-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402092921.79918-9-matthew.auld@intel.com>
References: <20250402092921.79918-9-matthew.auld@intel.com>
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

With the idea of having more pinned objects using the blitter engine
where possible, during suspend/resume, mark the pinned objects which
can be done during the late phase once submission/migration has been
setup. Start out simple with lrc and page-tables from userspace.

v2:
 - s/early_restore/late_restore; early restore was way too bold with too
   many places being impacted at once.
v3:
 - Split late vs early into separate lists, to align with newly added
   apply-to-pinned infra.
v4:
 - Rebase.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c     |  4 +-
 drivers/gpu/drm/xe/xe_bo.c           | 11 +++--
 drivers/gpu/drm/xe/xe_bo.h           |  9 +++--
 drivers/gpu/drm/xe/xe_bo_evict.c     | 60 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_bo_evict.h     |  4 +-
 drivers/gpu/drm/xe/xe_device_types.h | 22 +++++++---
 drivers/gpu/drm/xe/xe_lrc.c          | 10 +++--
 drivers/gpu/drm/xe/xe_pm.c           |  8 ++--
 drivers/gpu/drm/xe/xe_pt.c           | 13 +++---
 9 files changed, 88 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9fde67ca989f..230eb824550f 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -252,7 +252,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 		for_each_gt(__gt, xe, id)
 			xe_gt_sanitize(__gt);
-		err = xe_bo_restore_kernel(xe);
+		err = xe_bo_restore_early(xe);
 		/*
 		 * Snapshotting the CTB and copying back a potentially old
 		 * version seems risky, depending on what might have been
@@ -273,7 +273,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 			goto cleanup_all;
 		}
 
-		err = xe_bo_restore_user(xe);
+		err = xe_bo_restore_late(xe);
 		if (err) {
 			KUNIT_FAIL(test, "restore user err=%pe\n", ERR_PTR(err));
 			goto cleanup_all;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 6668a1a5eb93..2166087fca09 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1121,7 +1121,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		goto out_unlock_bo;
 	}
 
-	if (xe_bo_is_user(bo)) {
+	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
 		struct xe_migrate *migrate;
 		struct dma_fence *fence;
 
@@ -1216,7 +1216,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		goto out_backup;
 	}
 
-	if (xe_bo_is_user(bo)) {
+	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
 		struct xe_migrate *migrate;
 		struct dma_fence *fence;
 
@@ -2187,7 +2187,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 			return err;
 
 		spin_lock(&xe->pinned.lock);
-		list_add_tail(&bo->pinned_link, &xe->pinned.external);
+		list_add_tail(&bo->pinned_link, &xe->pinned.late.external);
 		spin_unlock(&xe->pinned.lock);
 	}
 
@@ -2232,7 +2232,10 @@ int xe_bo_pin(struct xe_bo *bo)
 
 	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
 		spin_lock(&xe->pinned.lock);
-		list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
+		if (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)
+			list_add_tail(&bo->pinned_link, &xe->pinned.late.kernel_bo_present);
+		else
+			list_add_tail(&bo->pinned_link, &xe->pinned.early.kernel_bo_present);
 		spin_unlock(&xe->pinned.lock);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 3d6e4902dff3..f7e716f59948 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -40,10 +40,11 @@
 #define XE_BO_FLAG_NEEDS_2M		BIT(16)
 #define XE_BO_FLAG_GGTT_INVALIDATE	BIT(17)
 #define XE_BO_FLAG_PINNED_NORESTORE	BIT(18)
-#define XE_BO_FLAG_GGTT0                BIT(19)
-#define XE_BO_FLAG_GGTT1                BIT(20)
-#define XE_BO_FLAG_GGTT2                BIT(21)
-#define XE_BO_FLAG_GGTT3                BIT(22)
+#define XE_BO_FLAG_PINNED_LATE_RESTORE BIT(19)
+#define XE_BO_FLAG_GGTT0                BIT(20)
+#define XE_BO_FLAG_GGTT1                BIT(21)
+#define XE_BO_FLAG_GGTT2                BIT(22)
+#define XE_BO_FLAG_GGTT3                BIT(23)
 #define XE_BO_FLAG_GGTT_ALL             (XE_BO_FLAG_GGTT0 | \
 					 XE_BO_FLAG_GGTT1 | \
 					 XE_BO_FLAG_GGTT2 | \
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index f83444f7f34d..7b8e36998646 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -91,10 +91,14 @@ int xe_bo_evict_all(struct xe_device *xe)
 		}
 	}
 
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external,
-				    &xe->pinned.external,
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
+				    &xe->pinned.late.external,
 				    xe_bo_evict_pinned);
 
+	if (!ret)
+		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
+					    &xe->pinned.late.evicted, xe_bo_evict_pinned);
+
 	/*
 	 * Wait for all user BO to be evicted as those evictions depend on the
 	 * memory moved below.
@@ -105,8 +109,8 @@ int xe_bo_evict_all(struct xe_device *xe)
 	if (ret)
 		return ret;
 
-	return xe_bo_apply_to_pinned(xe, &xe->pinned.kernel_bo_present,
-				     &xe->pinned.evicted,
+	return xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
+				     &xe->pinned.early.evicted,
 				     xe_bo_evict_pinned);
 }
 
@@ -137,13 +141,14 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
 	 * We expect validate to trigger a move VRAM and our move code
 	 * should setup the iosys map.
 	 */
-	xe_assert(xe, !iosys_map_is_null(&bo->vmap));
+	xe_assert(xe, !(bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE) ||
+		  !iosys_map_is_null(&bo->vmap));
 
 	return 0;
 }
 
 /**
- * xe_bo_restore_kernel - restore kernel BOs to VRAM
+ * xe_bo_restore_early - restore early phase kernel BOs to VRAM
  *
  * @xe: xe device
  *
@@ -153,24 +158,24 @@ static int xe_bo_restore_and_map_ggtt(struct xe_bo *bo)
  * This function should be called early, before trying to init the GT, on device
  * resume.
  */
-int xe_bo_restore_kernel(struct xe_device *xe)
+int xe_bo_restore_early(struct xe_device *xe)
 {
-	return xe_bo_apply_to_pinned(xe, &xe->pinned.evicted,
-				     &xe->pinned.kernel_bo_present,
+	return xe_bo_apply_to_pinned(xe, &xe->pinned.early.evicted,
+				     &xe->pinned.early.kernel_bo_present,
 				     xe_bo_restore_and_map_ggtt);
 }
 
 /**
- * xe_bo_restore_user - restore pinned user BOs to VRAM
+ * xe_bo_restore_late - restore pinned late phase BOs to VRAM
  *
  * @xe: xe device
  *
- * Move pinned user BOs from temporary (typically system) memory to VRAM via
- * CPU. All moves done via TTM calls.
+ * Move pinned user and kernel BOs which can use blitter from temporary
+ * (typically system) memory to VRAM. All moves done via TTM calls.
  *
  * This function should be called late, after GT init, on device resume.
  */
-int xe_bo_restore_user(struct xe_device *xe)
+int xe_bo_restore_late(struct xe_device *xe)
 {
 	struct xe_tile *tile;
 	int ret, id;
@@ -178,10 +183,14 @@ int xe_bo_restore_user(struct xe_device *xe)
 	if (!IS_DGFX(xe))
 		return 0;
 
+	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.evicted,
+				    &xe->pinned.late.kernel_bo_present,
+				    xe_bo_restore_and_map_ggtt);
+
 	/* Pinned user memory in VRAM should be validated on resume */
-	ret = xe_bo_apply_to_pinned(xe, &xe->pinned.external,
-				    &xe->pinned.external,
-				    xe_bo_restore_pinned);
+	if (!ret)
+		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
+					    &xe->pinned.late.external, xe_bo_restore_pinned);
 
 	/* Wait for restore to complete */
 	for_each_tile(tile, xe, id)
@@ -195,8 +204,8 @@ static void xe_bo_pci_dev_remove_pinned(struct xe_device *xe)
 	struct xe_tile *tile;
 	unsigned int id;
 
-	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.external,
-				    &xe->pinned.external,
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
+				    &xe->pinned.late.external,
 				    xe_bo_dma_unmap_pinned);
 	for_each_tile(tile, xe, id)
 		xe_tile_migrate_wait(tile);
@@ -241,8 +250,11 @@ static void xe_bo_pinned_fini(void *arg)
 {
 	struct xe_device *xe = arg;
 
-	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.kernel_bo_present,
-				    &xe->pinned.kernel_bo_present,
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
+				    &xe->pinned.late.kernel_bo_present,
+				    xe_bo_dma_unmap_pinned);
+	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.early.kernel_bo_present,
+				    &xe->pinned.early.kernel_bo_present,
 				    xe_bo_dma_unmap_pinned);
 }
 
@@ -259,9 +271,11 @@ static void xe_bo_pinned_fini(void *arg)
 int xe_bo_pinned_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->pinned.lock);
-	INIT_LIST_HEAD(&xe->pinned.kernel_bo_present);
-	INIT_LIST_HEAD(&xe->pinned.external);
-	INIT_LIST_HEAD(&xe->pinned.evicted);
+	INIT_LIST_HEAD(&xe->pinned.early.kernel_bo_present);
+	INIT_LIST_HEAD(&xe->pinned.early.evicted);
+	INIT_LIST_HEAD(&xe->pinned.late.kernel_bo_present);
+	INIT_LIST_HEAD(&xe->pinned.late.evicted);
+	INIT_LIST_HEAD(&xe->pinned.late.external);
 
 	return devm_add_action_or_reset(xe->drm.dev, xe_bo_pinned_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.h b/drivers/gpu/drm/xe/xe_bo_evict.h
index 0708d50ddfa8..d63eb3fc5cc9 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.h
+++ b/drivers/gpu/drm/xe/xe_bo_evict.h
@@ -9,8 +9,8 @@
 struct xe_device;
 
 int xe_bo_evict_all(struct xe_device *xe);
-int xe_bo_restore_kernel(struct xe_device *xe);
-int xe_bo_restore_user(struct xe_device *xe);
+int xe_bo_restore_early(struct xe_device *xe);
+int xe_bo_restore_late(struct xe_device *xe);
 
 void xe_bo_pci_dev_remove_all(struct xe_device *xe);
 
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c54adebfe518..d380546a6a16 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -422,12 +422,22 @@ struct xe_device {
 	struct {
 		/** @pinned.lock: protected pinned BO list state */
 		spinlock_t lock;
-		/** @pinned.kernel_bo_present: pinned kernel BO that are present */
-		struct list_head kernel_bo_present;
-		/** @pinned.evicted: pinned BO that have been evicted */
-		struct list_head evicted;
-		/** @pinned.external: pinned external and dma-buf. */
-		struct list_head external;
+		/** @pinned.early: early pinned lists */
+		struct {
+			/** @pinned.early.kernel_bo_present: pinned kernel BO that are present */
+			struct list_head kernel_bo_present;
+			/** @pinned.early.evicted: pinned BO that have been evicted */
+			struct list_head evicted;
+		} early;
+		/** @pinned.late: late pinned lists */
+		struct {
+			/** @pinned.late.kernel_bo_present: pinned kernel BO that are present */
+			struct list_head kernel_bo_present;
+			/** @pinned.late.evicted: pinned BO that have been evicted */
+			struct list_head evicted;
+			/** @pinned.external: pinned external and dma-buf. */
+			struct list_head external;
+		} late;
 	} pinned;
 
 	/** @ufence_wq: user fence wait queue */
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2639a3dfc9f7..855c8acaf3f1 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -896,6 +896,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	void *init_data = NULL;
 	u32 arb_enable;
 	u32 lrc_size;
+	u32 bo_flags;
 	int err;
 
 	kref_init(&lrc->refcount);
@@ -904,15 +905,18 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 	if (xe_gt_has_indirect_ring_state(gt))
 		lrc->flags |= XE_LRC_FLAG_INDIRECT_RING_STATE;
 
+	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_GGTT |
+		   XE_BO_FLAG_GGTT_INVALIDATE;
+	if (vm && vm->xef) /* userspace */
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+
 	/*
 	 * FIXME: Perma-pinning LRC as we don't yet support moving GGTT address
 	 * via VM bind calls.
 	 */
 	lrc->bo = xe_bo_create_pin_map(xe, tile, vm, lrc_size,
 				       ttm_bo_type_kernel,
-				       XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				       XE_BO_FLAG_GGTT |
-				       XE_BO_FLAG_GGTT_INVALIDATE);
+				       bo_flags);
 	if (IS_ERR(lrc->bo))
 		return PTR_ERR(lrc->bo);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index a7ddf45db886..aaba2a97bb3a 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -188,7 +188,7 @@ int xe_pm_resume(struct xe_device *xe)
 	 * This only restores pinned memory which is the memory required for the
 	 * GT(s) to resume.
 	 */
-	err = xe_bo_restore_kernel(xe);
+	err = xe_bo_restore_early(xe);
 	if (err)
 		goto err;
 
@@ -199,7 +199,7 @@ int xe_pm_resume(struct xe_device *xe)
 
 	xe_display_pm_resume(xe);
 
-	err = xe_bo_restore_user(xe);
+	err = xe_bo_restore_late(xe);
 	if (err)
 		goto err;
 
@@ -480,7 +480,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		 * This only restores pinned memory which is the memory
 		 * required for the GT(s) to resume.
 		 */
-		err = xe_bo_restore_kernel(xe);
+		err = xe_bo_restore_early(xe);
 		if (err)
 			goto out;
 	}
@@ -493,7 +493,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe_display_pm_runtime_resume(xe);
 
 	if (xe->d3cold.allowed) {
-		err = xe_bo_restore_user(xe);
+		err = xe_bo_restore_late(xe);
 		if (err)
 			goto out;
 	}
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 82ae159feed1..9a42f65ef0d2 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -103,6 +103,7 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 {
 	struct xe_pt *pt;
 	struct xe_bo *bo;
+	u32 bo_flags;
 	int err;
 
 	if (level) {
@@ -115,14 +116,16 @@ struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
 	if (!pt)
 		return ERR_PTR(-ENOMEM);
 
+	bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+		   XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE | XE_BO_FLAG_PINNED |
+		   XE_BO_FLAG_NO_RESV_EVICT | XE_BO_FLAG_PAGETABLE;
+	if (vm->xef) /* userspace */
+		bo_flags |= XE_BO_FLAG_PINNED_LATE_RESTORE;
+
 	pt->level = level;
 	bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
 				  ttm_bo_type_kernel,
-				  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
-				  XE_BO_FLAG_IGNORE_MIN_PAGE_SIZE |
-				  XE_BO_FLAG_PINNED |
-				  XE_BO_FLAG_NO_RESV_EVICT |
-				  XE_BO_FLAG_PAGETABLE);
+				  bo_flags);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		goto err_kfree;
-- 
2.49.0

