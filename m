Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFECEE57E0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 09:17:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA4D10E06E;
	Fri,  8 Sep 2023 09:17:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FAC10E06E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694164661; x=1725700661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cOjregrhep/GWWQJ3fkCgPfcZ9ZupLD6ZCVbb93pczE=;
 b=SN73BIVcXYwP31s1nzaeNCRVM8T9BpNnTNk8eW0hbdo7lYxk6O4HZxNa
 a6TzAk9xeicIpzWLX9wD3KGxvpWIhTRqsLNDGwqI9lh14am9jDRjoyU7Z
 XX8oyVHEN03HRKhIRLDtefYUx2zZiPg2SMKEK1xD0Va7ECbXWy4h/ndfJ
 VQXPIsOKAu48QzJUaj3cwoeCk74Uv39B/zz0d/H4w44OW6zaoL1nF6y7/
 IHqx6kIZ3LswrjCjICvfEAHGfdER3ortoi9hHgC+vSN3BChgun+Q2WwqD
 iMsy2OP56mQbXtB7iMU+Xx4TdYhzblLmmqLeCdjH0Lzqj6XURLMXnKQmB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="381416653"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="381416653"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 02:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="857329156"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="857329156"
Received: from binm223x-mobl2.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.172])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 02:17:40 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  8 Sep 2023 11:17:11 +0200
Message-ID: <20230908091716.36984-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908091716.36984-1-thomas.hellstrom@linux.intel.com>
References: <20230908091716.36984-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 1/6] drm/xe/bo: Simplify xe_bo_lock()
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
using ttm_eu_reserve_buffers(). Simplify and document the interface.

v2:
- Update also the xe_display subsystem.
v4:
- Reinstate a lost dma_resv_reserve_fences().
- Improve on xe_bo_lock() documentation (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c |  5 +--
 drivers/gpu/drm/xe/tests/xe_bo.c             | 24 +++++------
 drivers/gpu/drm/xe/xe_bo.c                   | 43 ++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h                   |  5 +--
 drivers/gpu/drm/xe/xe_bo_evict.c             | 19 ++++-----
 drivers/gpu/drm/xe/xe_gt_pagefault.c         | 41 +++++++------------
 drivers/gpu/drm/xe/xe_vm.c                   | 27 ++++++------
 drivers/gpu/drm/xe/xe_vm_madvise.c           | 30 ++++++--------
 8 files changed, 91 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index d6b481f33b45..9df8081f78d9 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6938,11 +6938,10 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
 	void *virtual;
 	bool is_iomem;
 	int ret;
-	struct ww_acquire_ctx ww;
 
 	XE_WARN_ON(size != 8);
 
-	ret = xe_bo_lock(bo, &ww, 0, true);
+	ret = xe_bo_lock(bo, true);
 	if (ret)
 		return ret;
 
@@ -6959,7 +6958,7 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
 
 	ttm_bo_kunmap(&map);
 out_unlock:
-	xe_bo_unlock(bo, &ww);
+	xe_bo_unlock(bo);
 	return ret;
 }
 #endif
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index c448b00a569c..97788432a122 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -204,9 +204,9 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
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
@@ -272,9 +272,9 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
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
@@ -282,28 +282,28 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
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
index 6a8a41dafe88..a3ddd6575793 100644
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
 
@@ -1863,26 +1861,37 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
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
+ * contended lock was interrupted. If @intr is set to false, the
+ * function always returns 0.
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
index 1d9aa5c40659..75a76950a67d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -267,13 +267,16 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
 static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 {
 	struct xe_exec_queue *q;
-	struct ww_acquire_ctx ww;
 	int err;
 
-	err = xe_bo_lock(bo, &ww, vm->preempt.num_exec_queues, true);
+	err = xe_bo_lock(bo, true);
 	if (err)
 		return err;
 
+	err = dma_resv_reserve_fences(bo->ttm.base.resv, vm->preempt.num_exec_queues);
+	if (err)
+		goto out_unlock;
+
 	list_for_each_entry(q, &vm->preempt.exec_queues, compute.link)
 		if (q->compute.pfence) {
 			dma_resv_add_fence(bo->ttm.base.resv,
@@ -281,8 +284,9 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
 					   DMA_RESV_USAGE_BOOKKEEP);
 		}
 
-	xe_bo_unlock(bo, &ww);
-	return 0;
+out_unlock:
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

