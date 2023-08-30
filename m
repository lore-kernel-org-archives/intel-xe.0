Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAEFC6FA8F
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 15:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E314210E551;
	Wed, 30 Aug 2023 15:23:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0289F10E551
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 15:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693408994; x=1724944994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=byKBRORx+1kkIlBhMHsyBxsE2VJVpe1l7lI5ClAgnPw=;
 b=aCi/O2qdzaPLh5XDMDTSBCSHWynn7F5PQW36O9APFgSxH3zceQkczl3h
 GIE+N/HGlAxHn9zfqtd0CMjg0VxoJT5bIHGDK1Oe7cer7EUDaV7fl4eCk
 /2oK7jw1kQ5Ge+zeGCpsfGDRzf7RJMMnN339B8DmtylTXAIKwhzgsXj8x
 OThW3lyfCjhmIdMi3BxKVqA1ESkr7crc0Zu+M3lo6dzcx91gG/eQuX64f
 CW6KhBlBEWFDkn51m9FZqijTi0Auvq56sCmviFU2scfDesqsjFbJ0I4EA
 rSK/y+8dQnn983hlvafnmyHCxe/PAMuh55q5ngxhwJNv4qWv13U/FWJh4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355985600"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="355985600"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 08:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="985798125"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="985798125"
Received: from nbint65x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 08:23:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 17:22:49 +0200
Message-ID: <20230830152254.51134-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830152254.51134-1-thomas.hellstrom@linux.intel.com>
References: <20230830152254.51134-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/6] drm/xe/bo: Simplify xe_bo_lock()
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

xe_bo_lock() was, although it only grabbed a single lock, unnecessarily
ttm_eu_reserve_buffers(). Simplify and document the interface.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c     | 24 ++++++++--------
 drivers/gpu/drm/xe/xe_bo.c           | 42 +++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_bo.h           |  5 ++--
 drivers/gpu/drm/xe/xe_bo_evict.c     | 19 ++++++-------
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 41 ++++++++++-----------------
 drivers/gpu/drm/xe/xe_vm.c           | 27 +++++++++---------
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 30 ++++++++------------
 7 files changed, 88 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index b32a9068d76c..31fd4f9b2d5b 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -203,9 +203,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 			goto cleanup_bo;
 		}
 
-		xe_bo_lock(external, &ww, 0, false);
+		xe_bo_lock(external, false);
 		err = xe_bo_pin_external(external);
-		xe_bo_unlock(external, &ww);
+		xe_bo_unlock(external);
 		if (err) {
 			KUNIT_FAIL(test, "external bo pin err=%pe\n",
 				   ERR_PTR(err));
@@ -268,9 +268,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 					   ERR_PTR(err));
 				goto cleanup_all;
 			}
-			xe_bo_lock(external, &ww, 0, false);
+			xe_bo_lock(external, false);
 			err = xe_bo_validate(external, NULL, false);
-			xe_bo_unlock(external, &ww);
+			xe_bo_unlock(external);
 			if (err) {
 				KUNIT_FAIL(test, "external bo valid err=%pe\n",
 					   ERR_PTR(err));
@@ -278,28 +278,28 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 			}
 		}
 
-		xe_bo_lock(external, &ww, 0, false);
+		xe_bo_lock(external, false);
 		xe_bo_unpin_external(external);
-		xe_bo_unlock(external, &ww);
+		xe_bo_unlock(external);
 
 		xe_bo_put(external);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, false);
 		__xe_bo_unset_bulk_move(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 		continue;
 
 cleanup_all:
-		xe_bo_lock(external, &ww, 0, false);
+		xe_bo_lock(external, false);
 		xe_bo_unpin_external(external);
-		xe_bo_unlock(external, &ww);
+		xe_bo_unlock(external);
 cleanup_external:
 		xe_bo_put(external);
 cleanup_bo:
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, false);
 		__xe_bo_unset_bulk_move(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 		break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 1ab682d61e3c..c299797c1074 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1079,13 +1079,11 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 
 	if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
-		struct ww_acquire_ctx ww;
-
 		XE_WARN_ON(!xe_bo_is_user(bo));
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, false);
 		ttm_bo_set_bulk_move(&bo->ttm, NULL);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 	}
 }
 
@@ -1863,26 +1861,36 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
-	       int num_resv, bool intr)
+/**
+ * xe_bo_lock() - Lock the buffer object's dma_resv object
+ * @bo: The struct xe_bo whose lock is to be taken
+ * @intr: Whether to perform any wait interruptible
+ *
+ * Locks the buffer object's dma_resv object. If the buffer object is
+ * pointing to a shared dma_resv object, that shared lock is locked.
+ *
+ * Return: 0 on success, -EINTR if @intr is true and the wait for a
+ * contended lock was interrupted.
+ */
+int xe_bo_lock(struct xe_bo *bo, bool intr)
 {
-	struct ttm_validate_buffer tv_bo;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
+	if (intr)
+		return dma_resv_lock_interruptible(bo->ttm.base.resv, NULL);
 
-	XE_WARN_ON(!ww);
+	dma_resv_lock(bo->ttm.base.resv, NULL);
 
-	tv_bo.num_shared = num_resv;
-	tv_bo.bo = &bo->ttm;
-	list_add_tail(&tv_bo.head, &objs);
-
-	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
+	return 0;
 }
 
-void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
+/**
+ * xe_bo_unlock() - Unlock the buffer object's dma_resv object
+ * @bo: The struct xe_bo whose lock is to be released.
+ *
+ * Unlock a buffer object lock that was locked by xe_bo_lock().
+ */
+void xe_bo_unlock(struct xe_bo *bo)
 {
 	dma_resv_unlock(bo->ttm.base.resv);
-	ww_acquire_fini(ww);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 0823dda0f31b..a7b9e7084225 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -149,10 +149,9 @@ static inline void xe_bo_assert_held(struct xe_bo *bo)
 		dma_resv_assert_held((bo)->ttm.base.resv);
 }
 
-int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
-	       int num_resv, bool intr);
+int xe_bo_lock(struct xe_bo *bo, bool intr);
 
-void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
+void xe_bo_unlock(struct xe_bo *bo);
 
 static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
index 0d5c3a208ab4..49c05ddea164 100644
--- a/drivers/gpu/drm/xe/xe_bo_evict.c
+++ b/drivers/gpu/drm/xe/xe_bo_evict.c
@@ -27,7 +27,6 @@
 int xe_bo_evict_all(struct xe_device *xe)
 {
 	struct ttm_device *bdev = &xe->ttm;
-	struct ww_acquire_ctx ww;
 	struct xe_bo *bo;
 	struct xe_tile *tile;
 	struct list_head still_in_list;
@@ -62,9 +61,9 @@ int xe_bo_evict_all(struct xe_device *xe)
 		list_move_tail(&bo->pinned_link, &still_in_list);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, false);
 		ret = xe_bo_evict_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 		if (ret) {
 			spin_lock(&xe->pinned.lock);
@@ -96,9 +95,9 @@ int xe_bo_evict_all(struct xe_device *xe)
 		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, false);
 		ret = xe_bo_evict_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 		if (ret)
 			return ret;
@@ -123,7 +122,6 @@ int xe_bo_evict_all(struct xe_device *xe)
  */
 int xe_bo_restore_kernel(struct xe_device *xe)
 {
-	struct ww_acquire_ctx ww;
 	struct xe_bo *bo;
 	int ret;
 
@@ -140,9 +138,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
 		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, false);
 		ret = xe_bo_restore_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 		if (ret) {
 			xe_bo_put(bo);
 			return ret;
@@ -184,7 +182,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
  */
 int xe_bo_restore_user(struct xe_device *xe)
 {
-	struct ww_acquire_ctx ww;
 	struct xe_bo *bo;
 	struct xe_tile *tile;
 	struct list_head still_in_list;
@@ -206,9 +203,9 @@ int xe_bo_restore_user(struct xe_device *xe)
 		xe_bo_get(bo);
 		spin_unlock(&xe->pinned.lock);
 
-		xe_bo_lock(bo, &ww, 0, false);
+		xe_bo_lock(bo, false);
 		ret = xe_bo_restore_pinned(bo);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 		xe_bo_put(bo);
 		if (ret) {
 			spin_lock(&xe->pinned.lock);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index b6f781b3d9d7..73fc9389a663 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -171,20 +171,18 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 
 	/* Lock VM and BOs dma-resv */
 	bo = xe_vma_bo(vma);
-	if (only_needs_bo_lock(bo)) {
-		/* This path ensures the BO's LRU is updated */
-		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
-	} else {
+	if (!only_needs_bo_lock(bo)) {
 		tv_vm.num_shared = xe->info.tile_count;
 		tv_vm.bo = xe_vm_ttm_bo(vm);
 		list_add(&tv_vm.head, &objs);
-		if (bo) {
-			tv_bo.bo = &bo->ttm;
-			tv_bo.num_shared = xe->info.tile_count;
-			list_add(&tv_bo.head, &objs);
-		}
-		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
 	}
+	if (bo) {
+		tv_bo.bo = &bo->ttm;
+		tv_bo.num_shared = xe->info.tile_count;
+		list_add(&tv_bo.head, &objs);
+	}
+
+	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
 	if (ret)
 		goto unlock_vm;
 
@@ -227,10 +225,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
 
 unlock_dma_resv:
-	if (only_needs_bo_lock(bo))
-		xe_bo_unlock(bo, &ww);
-	else
-		ttm_eu_backoff_reservation(&ww, &objs);
+	ttm_eu_backoff_reservation(&ww, &objs);
 unlock_vm:
 	if (!ret)
 		vm->usm.last_fault_vma = vma;
@@ -534,28 +529,22 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 
 	/* Lock VM and BOs dma-resv */
 	bo = xe_vma_bo(vma);
-	if (only_needs_bo_lock(bo)) {
-		/* This path ensures the BO's LRU is updated */
-		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
-	} else {
+	if (!only_needs_bo_lock(bo)) {
 		tv_vm.num_shared = xe->info.tile_count;
 		tv_vm.bo = xe_vm_ttm_bo(vm);
 		list_add(&tv_vm.head, &objs);
-		tv_bo.bo = &bo->ttm;
-		tv_bo.num_shared = xe->info.tile_count;
-		list_add(&tv_bo.head, &objs);
-		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
 	}
+	tv_bo.bo = &bo->ttm;
+	tv_bo.num_shared = xe->info.tile_count;
+	list_add(&tv_bo.head, &objs);
+	ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
 	if (ret)
 		goto unlock_vm;
 
 	/* Migrate to VRAM, move should invalidate the VMA first */
 	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
 
-	if (only_needs_bo_lock(bo))
-		xe_bo_unlock(bo, &ww);
-	else
-		ttm_eu_backoff_reservation(&ww, &objs);
+	ttm_eu_backoff_reservation(&ww, &objs);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 15bff0783ec9..1ae612311916 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -267,13 +267,16 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 {
 	struct xe_exec_queue *q;
-	struct ww_acquire_ctx ww;
 	int err;
 
-	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
+	err = xe_bo_lock(bo, true);
 	if (err)
 		return err;
 
+	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_engines);
+	if (err)
+		goto unlock;
+
 	list_for_each_entry(q, &vm->preempt.engines, compute.link)
 		if (q->compute.pfence) {
 			dma_resv_add_fence(bo->ttm.base.resv,
@@ -281,8 +284,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 					   DMA_RESV_USAGE_BOOKKEEP);
 		}
 
-	xe_bo_unlock(bo, &ww);
-	return 0;
+unlock:
+	xe_bo_unlock(bo);
+	return err;
 }
 
 /**
@@ -1021,12 +1025,11 @@ bo_has_vm_references_locked(struct xe_bo *bo, struct xe_vm *vm,
 static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
 				 struct xe_vma *ignore)
 {
-	struct ww_acquire_ctx ww;
 	bool ret;
 
-	xe_bo_lock(bo, &ww, 0, false);
+	xe_bo_lock(bo, false);
 	ret = !!bo_has_vm_references_locked(bo, vm, ignore);
-	xe_bo_unlock(bo, &ww);
+	xe_bo_unlock(bo);
 
 	return ret;
 }
@@ -2267,7 +2270,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 			 u32 operation, u8 tile_mask, u32 region)
 {
 	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
-	struct ww_acquire_ctx ww;
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *__op;
 	struct xe_vma_op *op;
@@ -2325,11 +2327,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
 	case XE_VM_BIND_OP_UNMAP_ALL:
 		XE_WARN_ON(!bo);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
 		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 		if (IS_ERR(ops))
 			return ops;
 
@@ -2365,13 +2367,12 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
 	struct xe_vma *vma;
-	struct ww_acquire_ctx ww;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
 	if (bo) {
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return ERR_PTR(err);
 	}
@@ -2380,7 +2381,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			    op->va.range - 1, read_only, is_null,
 			    tile_mask);
 	if (bo)
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 
 	if (xe_vma_is_userptr(vma)) {
 		err = xe_vma_userptr_pin_pages(vma);
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index c9bc59be5094..05081fa0fbed 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -28,16 +28,15 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
 
 		bo = xe_vma_bo(vmas[i]);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return err;
 		bo->props.preferred_mem_class = value;
 		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 	}
 
 	return 0;
@@ -53,16 +52,15 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
 
 		bo = xe_vma_bo(vmas[i]);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return err;
 		bo->props.preferred_gt = value;
 		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 	}
 
 	return 0;
@@ -89,17 +87,16 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
 
 		bo = xe_vma_bo(vmas[i]);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return err;
 		bo->props.preferred_mem_class = mem_class;
 		bo->props.preferred_gt = gt_id;
 		xe_bo_placement_for_flags(xe, bo, bo->flags);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 	}
 
 	return 0;
@@ -112,13 +109,12 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
 
 		bo = xe_vma_bo(vmas[i]);
 		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
 			return -EINVAL;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return err;
 		bo->props.cpu_atomic = !!value;
@@ -130,7 +126,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
 		 */
 		if (bo->props.cpu_atomic)
 			ttm_bo_unmap_virtual(&bo->ttm);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 	}
 
 	return 0;
@@ -143,18 +139,17 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
 
 		bo = xe_vma_bo(vmas[i]);
 		if (XE_IOCTL_DBG(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
 				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
 			return -EINVAL;
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return err;
 		bo->props.device_atomic = !!value;
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 	}
 
 	return 0;
@@ -174,16 +169,15 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
 
 	for (i = 0; i < num_vmas; ++i) {
 		struct xe_bo *bo;
-		struct ww_acquire_ctx ww;
 
 		bo = xe_vma_bo(vmas[i]);
 
-		err = xe_bo_lock(bo, &ww, 0, true);
+		err = xe_bo_lock(bo, true);
 		if (err)
 			return err;
 		bo->ttm.priority = value;
 		ttm_bo_move_to_lru_tail(&bo->ttm);
-		xe_bo_unlock(bo, &ww);
+		xe_bo_unlock(bo);
 	}
 
 	return 0;
-- 
2.41.0

