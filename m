Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6A0C83F15
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 15:23:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB7910E552;
	Wed, 30 Aug 2023 15:23:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11C910E550
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693408994; x=1724944994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PpRVljz+reDRxRjF2pmv21GO7s1Fk3ef7GYUop2+/tk=;
 b=SmybYkhDDJ/weWR4OZV5419nQsGgbDqTeJMlGF8QvHsQTYNZxvMZpkJk
 BXvtFL1adGpVmAgL5V5pqd+NodC91BzIYx2MGp3abUMfrTiH9zepyCkOI
 qTxv76S4UmOrpzZXQHfYm5Ti2ffd/3hYaD7UCVVuPEGWnJOW2O6ng9Sii
 005/UHLEuZPP7KMUopHIXy1utS81vPzGv1haWcWwRdKvVunCC5ByuN+Q7
 NX5W0nVygjdRsJv6y+Xs1xfJ3a62zhm7I7PKfm15q8Na6zhp7pOKzeVQ0
 VVQayzKwpajdnF/McFJNlCe3QpGLxwymXp0upzwWrGv5fmJXPH0+pX/yH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="355985613"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="355985613"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 08:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="985798153"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; d="scan'208";a="985798153"
Received: from nbint65x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 08:23:13 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 30 Aug 2023 17:22:50 +0200
Message-ID: <20230830152254.51134-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830152254.51134-1-thomas.hellstrom@linux.intel.com>
References: <20230830152254.51134-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/6] drm/xe/vm: Simplify and document xe_vm_lock()
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

The xe_vm_lock() function was unnecessarily using ttm_eu_reserve_buffers().
Simplify and document the interface.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  9 +++--
 drivers/gpu/drm/xe/tests/xe_migrate.c |  5 ++-
 drivers/gpu/drm/xe/xe_bo.c            |  5 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c    |  5 ++-
 drivers/gpu/drm/xe/xe_lrc.c           |  6 ++--
 drivers/gpu/drm/xe/xe_migrate.c       | 10 +++---
 drivers/gpu/drm/xe/xe_vm.c            | 50 +++++++++++++--------------
 drivers/gpu/drm/xe/xe_vm.h            |  5 ++-
 8 files changed, 42 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 31fd4f9b2d5b..c6025404042d 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -180,17 +180,16 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
 		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
-	struct ww_acquire_ctx ww;
 	int err, i;
 
 	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
 		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
 
 	for (i = 0; i < 2; ++i) {
-		xe_vm_lock(vm, &ww, 0, false);
+		xe_vm_lock(vm, false);
 		bo = xe_bo_create(xe, NULL, vm, 0x10000, ttm_bo_type_device,
 				  bo_flags);
-		xe_vm_unlock(vm, &ww);
+		xe_vm_unlock(vm);
 		if (IS_ERR(bo)) {
 			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
 			break;
@@ -259,9 +258,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 
 		if (i) {
 			down_read(&vm->lock);
-			xe_vm_lock(vm, &ww, 0, false);
+			xe_vm_lock(vm, false);
 			err = xe_bo_validate(bo, bo->vm, false);
-			xe_vm_unlock(vm, &ww);
+			xe_vm_unlock(vm);
 			up_read(&vm->lock);
 			if (err) {
 				KUNIT_FAIL(test, "bo valid err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 5c8d5e78d9bc..8bb081086ca2 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -396,14 +396,13 @@ static int migrate_test_run_device(struct xe_device *xe)
 
 	for_each_tile(tile, xe, id) {
 		struct xe_migrate *m = tile->migrate;
-		struct ww_acquire_ctx ww;
 
 		kunit_info(test, "Testing tile id %d.\n", id);
-		xe_vm_lock(m->q->vm, &ww, 0, true);
+		xe_vm_lock(m->q->vm, true);
 		xe_device_mem_access_get(xe);
 		xe_migrate_sanity_test(m, test);
 		xe_device_mem_access_put(xe);
-		xe_vm_unlock(m->q->vm, &ww);
+		xe_vm_unlock(m->q->vm);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c299797c1074..8005cd100d48 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1749,7 +1749,6 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
-	struct ww_acquire_ctx ww;
 	struct xe_vm *vm = NULL;
 	struct xe_bo *bo;
 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
@@ -1787,7 +1786,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 		vm = xe_vm_lookup(xef, args->vm_id);
 		if (XE_IOCTL_DBG(xe, !vm))
 			return -ENOENT;
-		err = xe_vm_lock(vm, &ww, 0, true);
+		err = xe_vm_lock(vm, true);
 		if (err) {
 			xe_vm_put(vm);
 			return err;
@@ -1830,7 +1829,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	xe_bo_put(bo);
 out_vm:
 	if (vm) {
-		xe_vm_unlock(vm, &ww);
+		xe_vm_unlock(vm);
 		xe_vm_put(vm);
 	}
 	return err;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 25216ef93781..d7497b7a266f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -111,18 +111,17 @@ struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struct xe_vm *v
 					   u32 logical_mask, u16 width,
 					   struct xe_hw_engine *hwe, u32 flags)
 {
-	struct ww_acquire_ctx ww;
 	struct xe_exec_queue *q;
 	int err;
 
 	if (vm) {
-		err = xe_vm_lock(vm, &ww, 0, true);
+		err = xe_vm_lock(vm, true);
 		if (err)
 			return ERR_PTR(err);
 	}
 	q = __xe_exec_queue_create(xe, vm, logical_mask, width, hwe, flags);
 	if (vm)
-		xe_vm_unlock(vm, &ww);
+		xe_vm_unlock(vm);
 
 	return q;
 }
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 2b4219c38359..434fbb364b4b 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -789,16 +789,14 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
 
 void xe_lrc_finish(struct xe_lrc *lrc)
 {
-	struct ww_acquire_ctx ww;
-
 	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
 	if (lrc->bo->vm)
-		xe_vm_lock(lrc->bo->vm, &ww, 0, false);
+		xe_vm_lock(lrc->bo->vm, false);
 	else
 		xe_bo_lock_no_vm(lrc->bo, NULL);
 	xe_bo_unpin(lrc->bo);
 	if (lrc->bo->vm)
-		xe_vm_unlock(lrc->bo->vm, &ww);
+		xe_vm_unlock(lrc->bo->vm);
 	else
 		xe_bo_unlock_no_vm(lrc->bo);
 	xe_bo_put(lrc->bo);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index a782ea282cb6..ee8bc5f3ba3d 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -88,13 +88,12 @@ struct xe_exec_queue *xe_tile_migrate_engine(struct xe_tile *tile)
 static void xe_migrate_fini(struct drm_device *dev, void *arg)
 {
 	struct xe_migrate *m = arg;
-	struct ww_acquire_ctx ww;
 
-	xe_vm_lock(m->q->vm, &ww, 0, false);
+	xe_vm_lock(m->q->vm, false);
 	xe_bo_unpin(m->pt_bo);
 	if (m->cleared_bo)
 		xe_bo_unpin(m->cleared_bo);
-	xe_vm_unlock(m->q->vm, &ww);
+	xe_vm_unlock(m->q->vm);
 
 	dma_fence_put(m->fence);
 	if (m->cleared_bo)
@@ -338,7 +337,6 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	struct xe_gt *primary_gt = tile->primary_gt;
 	struct xe_migrate *m;
 	struct xe_vm *vm;
-	struct ww_acquire_ctx ww;
 	int err;
 
 	m = drmm_kzalloc(&xe->drm, sizeof(*m), GFP_KERNEL);
@@ -353,9 +351,9 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 	if (IS_ERR(vm))
 		return ERR_CAST(vm);
 
-	xe_vm_lock(vm, &ww, 0, false);
+	xe_vm_lock(vm, false);
 	err = xe_migrate_prepare_vm(tile, m, vm);
-	xe_vm_unlock(vm, &ww);
+	xe_vm_unlock(vm);
 	if (err) {
 		xe_vm_close_and_put(vm);
 		return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ae612311916..33020c8ac9d5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -523,18 +523,17 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
 
 static void xe_vm_kill(struct xe_vm *vm)
 {
-	struct ww_acquire_ctx ww;
 	struct xe_exec_queue *q;
 
 	lockdep_assert_held(&vm->lock);
 
-	xe_vm_lock(vm, &ww, 0, false);
+	xe_vm_lock(vm, false);
 	vm->flags |= XE_VM_FLAG_BANNED;
 	trace_xe_vm_kill(vm);
 
 	list_for_each_entry(q, &vm->preempt.engines, compute.link)
 		q->ops->kill(q);
-	xe_vm_unlock(vm, &ww);
+	xe_vm_unlock(vm);
 
 	/* TODO: Inform user the VM is banned */
 }
@@ -1412,7 +1411,6 @@ static void xe_vm_close(struct xe_vm *vm)
 void xe_vm_close_and_put(struct xe_vm *vm)
 {
 	LIST_HEAD(contested);
-	struct ww_acquire_ctx ww;
 	struct xe_device *xe = vm->xe;
 	struct xe_tile *tile;
 	struct xe_vma *vma, *next_vma;
@@ -1435,7 +1433,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	}
 
 	down_write(&vm->lock);
-	xe_vm_lock(vm, &ww, 0, false);
+	xe_vm_lock(vm, false);
 	drm_gpuva_for_each_va_safe(gpuva, next, &vm->mgr) {
 		vma = gpuva_to_vma(gpuva);
 
@@ -1476,7 +1474,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 					      NULL);
 		}
 	}
-	xe_vm_unlock(vm, &ww);
+	xe_vm_unlock(vm);
 
 	/*
 	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
@@ -1514,7 +1512,6 @@ static void vm_destroy_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm =
 		container_of(w, struct xe_vm, destroy_work);
-	struct ww_acquire_ctx ww;
 	struct xe_device *xe = vm->xe;
 	struct xe_tile *tile;
 	u8 id;
@@ -1539,14 +1536,14 @@ static void vm_destroy_work_func(struct work_struct *w)
 	 * is needed for xe_vm_lock to work. If we remove that dependency this
 	 * can be moved to xe_vm_close_and_put.
 	 */
-	xe_vm_lock(vm, &ww, 0, false);
+	xe_vm_lock(vm, false);
 	for_each_tile(tile, xe, id) {
 		if (vm->pt_root[id]) {
 			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
 			vm->pt_root[id] = NULL;
 		}
 	}
-	xe_vm_unlock(vm, &ww);
+	xe_vm_unlock(vm);
 
 	trace_xe_vm_free(vm);
 	dma_fence_put(vm->rebind_fence);
@@ -3422,30 +3419,31 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	return err == -ENODATA ? 0 : err;
 }
 
-/*
- * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
- * directly to optimize. Also this likely should be an inline function.
+/**
+ * xe_vm_lock() - Lock the vm's dma_resv object
+ * @vm: The struct xe_vm whose lock is to be locked
+ * @intr: Whether to perform any wait interruptible
+ *
+ * Return: 0 on success, -EINTR if @intr is true and the wait for a
+ * contended lock was interrupted.
  */
-int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
-	       int num_resv, bool intr)
+int xe_vm_lock(struct xe_vm *vm, bool intr)
 {
-	struct ttm_validate_buffer tv_vm;
-	LIST_HEAD(objs);
-	LIST_HEAD(dups);
-
-	XE_WARN_ON(!ww);
-
-	tv_vm.num_shared = num_resv;
-	tv_vm.bo = xe_vm_ttm_bo(vm);
-	list_add_tail(&tv_vm.head, &objs);
+	if (intr)
+		return dma_resv_lock_interruptible(&vm->resv, NULL);
 
-	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
+	return dma_resv_lock(&vm->resv, NULL);
 }
 
-void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
+/**
+ * xe_vm_unlock() - Unlock the vm's dma_resv object
+ * @vm: The struct xe_vm whose lock is to be released.
+ *
+ * Unlock a buffer object lock that was locked by xe_vm_lock().
+ */
+void xe_vm_unlock(struct xe_vm *vm)
 {
 	dma_resv_unlock(&vm->resv);
-	ww_acquire_fini(ww);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6de6e3edb24a..d7d8fd7bd8da 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -39,10 +39,9 @@ static inline void xe_vm_put(struct xe_vm *vm)
 	kref_put(&vm->refcount, xe_vm_free);
 }
 
-int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
-	       int num_resv, bool intr);
+int xe_vm_lock(struct xe_vm *vm, bool intr);
 
-void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
+void xe_vm_unlock(struct xe_vm *vm);
 
 static inline bool xe_vm_is_closed(struct xe_vm *vm)
 {
-- 
2.41.0

