Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DD4CAC586
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB8310E4BE;
	Mon,  8 Sep 2025 10:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YEe2bkuM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074C210E0D7
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Sep 2025 10:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326392; x=1788862392;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8huyxDDp4C4ZKPsBXdJFXvhbUBB5vOLqVxpzRVvXqfs=;
 b=YEe2bkuMLu8zGTbrk6+N35t78sdJS4bj5FqRK0006dtmBA39L4cV3xod
 Tn6QfASEwJzfxmJ20YpMKYLjJOTtA8vaFek5GyJdSpn/wlt8sEhFkodyX
 lJKRKNoyBYP5COeRXpB2xGIYVNiHpX726AwtO/nwq9i2aHCQiB+k6d1Ua
 hYfRwmTEN4vsufZ1aN3u2WVlG7Tp620VWntQh2qq49PIwim8x1TzF9by/
 Sw50rskFpOKKXa3S2z3NMoTHcWJPAVEzo/9kUgzepwCr/VAP70ho5u/HL
 0mMfEtVAifVJXRkiuDI3egt9c/9ASYxK2hNmLnTjpnasQCftMOm0aPwy2 g==;
X-CSE-ConnectionGUID: xfbicVuEQF2wuuGVaLM9/g==
X-CSE-MsgGUID: RQi93637RCSkPc24/RspGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="85022813"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="85022813"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:12 -0700
X-CSE-ConnectionGUID: 6HlEVHQBRHaRV9xtW42XdA==
X-CSE-MsgGUID: qqrQHJDgTzij6OYONk17oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172673643"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.9])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:13:11 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 03/13] drm/xe: Convert xe_bo_create_user() for exhaustive
 eviction
Date: Mon,  8 Sep 2025 12:12:36 +0200
Message-ID: <20250908101246.65025-4-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
References: <20250908101246.65025-1-thomas.hellstrom@linux.intel.com>
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

Use the xe_validation_guard() to convert xe_bo_create_user()
for exhaustive eviction.

v2:
- Adapt to argument changes of xe_validation_guard()

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v1
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  16 ++--
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c |  12 +--
 drivers/gpu/drm/xe/xe_bo.c            | 114 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_bo.h            |   9 +-
 drivers/gpu/drm/xe/xe_device.c        |   2 +
 drivers/gpu/drm/xe/xe_device_types.h  |   3 +
 drivers/gpu/drm/xe/xe_vm.c            |  14 ++++
 drivers/gpu/drm/xe/xe_vm.h            |   2 +
 9 files changed, 115 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 17366b60ee31..2294cf89f3e1 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -139,8 +139,8 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 	else
 		kunit_info(test, "Testing system memory\n");
 
-	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
-			       bo_flags);
+	bo = xe_bo_create_user(xe, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
+			       bo_flags, exec);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
@@ -220,18 +220,18 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 
 	for (i = 0; i < 2; ++i) {
 		xe_vm_lock(vm, false);
-		bo = xe_bo_create_user(xe, NULL, vm, 0x10000,
+		bo = xe_bo_create_user(xe, vm, 0x10000,
 				       DRM_XE_GEM_CPU_CACHING_WC,
-				       bo_flags);
+				       bo_flags, exec);
 		xe_vm_unlock(vm);
 		if (IS_ERR(bo)) {
 			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
 			break;
 		}
 
-		external = xe_bo_create_user(xe, NULL, NULL, 0x10000,
+		external = xe_bo_create_user(xe, NULL, 0x10000,
 					     DRM_XE_GEM_CPU_CACHING_WC,
-					     bo_flags);
+					     bo_flags, NULL);
 		if (IS_ERR(external)) {
 			KUNIT_FAIL(test, "external bo create err=%pe\n", external);
 			goto cleanup_bo;
@@ -497,9 +497,9 @@ static int shrink_test_run_device(struct xe_device *xe)
 		INIT_LIST_HEAD(&link->link);
 
 		/* We can create bos using WC caching here. But it is slower. */
-		bo = xe_bo_create_user(xe, NULL, NULL, XE_BO_SHRINK_SIZE,
+		bo = xe_bo_create_user(xe, NULL, XE_BO_SHRINK_SIZE,
 				       DRM_XE_GEM_CPU_CACHING_WB,
-				       XE_BO_FLAG_SYSTEM);
+				       XE_BO_FLAG_SYSTEM, NULL);
 		if (IS_ERR(bo)) {
 			if (bo != ERR_PTR(-ENOMEM) && bo != ERR_PTR(-ENOSPC) &&
 			    bo != ERR_PTR(-EINTR) && bo != ERR_PTR(-ERESTARTSYS))
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index 7117486f0432..a7e548a2bdfb 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -114,8 +114,8 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 		size = SZ_64K;
 
 	kunit_info(test, "running %s\n", __func__);
-	bo = xe_bo_create_user(xe, NULL, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
-			       params->mem_mask);
+	bo = xe_bo_create_user(xe, NULL, size, DRM_XE_GEM_CPU_CACHING_WC,
+			       params->mem_mask, NULL);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(bo));
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index dfb445d09759..afa794e56065 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -642,11 +642,11 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	struct drm_exec *exec;
 	long ret;
 
-	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
+	sys_bo = xe_bo_create_user(xe, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
 				   XE_BO_FLAG_SYSTEM |
 				   XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED);
+				   XE_BO_FLAG_PINNED, NULL);
 
 	if (IS_ERR(sys_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -669,10 +669,10 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 	xe_bo_unlock(sys_bo);
 
-	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
+	ccs_bo = xe_bo_create_user(xe, NULL, SZ_4M,
 				   DRM_XE_GEM_CPU_CACHING_WC,
 				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED);
+				   XE_BO_FLAG_PINNED, NULL);
 
 	if (IS_ERR(ccs_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
@@ -694,10 +694,10 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 	xe_bo_unlock(ccs_bo);
 
-	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
+	vram_bo = xe_bo_create_user(xe, NULL, SZ_4M,
 				    DRM_XE_GEM_CPU_CACHING_WC,
 				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				    XE_BO_FLAG_PINNED);
+				    XE_BO_FLAG_PINNED, NULL);
 	if (IS_ERR(vram_bo)) {
 		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
 			   PTR_ERR(vram_bo));
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 9426d7fcb61c..296b8ead5713 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2199,30 +2199,66 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				     flags, 0, exec);
 }
 
-struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
-				struct xe_vm *vm, size_t size,
-				u16 cpu_caching,
-				u32 flags)
+static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *tile,
+				       size_t size, u16 cpu_caching,
+				       enum ttm_bo_type type, u32 flags,
+				       u64 alignment, bool intr)
 {
-	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
-	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
-						 cpu_caching, ttm_bo_type_device,
-						 flags | XE_BO_FLAG_USER, 0, exec);
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
 
-	return bo;
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = intr},
+			    ret) {
+		bo = __xe_bo_create_locked(xe, tile, NULL, size, 0, ~0ULL,
+					   cpu_caching, type, flags, alignment, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+		} else {
+			xe_bo_unlock(bo);
+		}
+	}
+
+	return ret ? ERR_PTR(ret) : bo;
 }
 
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
-			   struct xe_vm *vm, size_t size,
-			   enum ttm_bo_type type, u32 flags)
+/**
+ * xe_bo_create_user() - Create a user BO
+ * @xe: The xe device.
+ * @vm: The local vm or NULL for external objects.
+ * @size: The storage size to use for the bo.
+ * @cpu_caching: The caching mode to be used for system backing store.
+ * @flags: XE_BO_FLAG_ flags.
+ * @exec: The drm_exec transaction to use for exhaustive eviction, or NULL
+ * if such a transaction should be initiated by the call.
+ *
+ * Create a bo on behalf of user-space.
+ *
+ * Return: The buffer object on success. Negative error pointer on failure.
+ */
+struct xe_bo *xe_bo_create_user(struct xe_device *xe,
+				struct xe_vm *vm, size_t size,
+				u16 cpu_caching,
+				u32 flags, struct drm_exec *exec)
 {
-	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
-	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags, exec);
+	struct xe_bo *bo;
 
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
+	flags |= XE_BO_FLAG_USER;
+
+	if (vm || exec) {
+		xe_assert(xe, exec);
+		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
+					   cpu_caching, ttm_bo_type_device,
+					   flags, 0, exec);
+		if (!IS_ERR(bo))
+			xe_bo_unlock_vm_held(bo);
+	} else {
+		bo = xe_bo_create_novm(xe, NULL, size, cpu_caching,
+				       ttm_bo_type_device, flags, 0, true);
+	}
 
 	return bo;
 }
@@ -2777,8 +2813,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_gem_create *args = data;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	struct xe_vm *vm = NULL;
-	ktime_t end = 0;
 	struct xe_bo *bo;
 	unsigned int bo_flags;
 	u32 handle;
@@ -2852,25 +2889,26 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 	}
 
-retry:
-	if (vm) {
-		err = xe_vm_lock(vm, true);
-		if (err)
-			goto out_vm;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {.interruptible = true},
+			    err) {
+		if (vm) {
+			err = xe_vm_drm_exec_lock(vm, &exec);
+			drm_exec_retry_on_contention(&exec);
+			if (err)
+				break;
+		}
+		bo = xe_bo_create_user(xe, vm, args->size, args->cpu_caching,
+				       bo_flags, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			err = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &err);
+			break;
+		}
 	}
-
-	bo = xe_bo_create_user(xe, NULL, vm, args->size, args->cpu_caching,
-			       bo_flags);
-
-	if (vm)
-		xe_vm_unlock(vm);
-
-	if (IS_ERR(bo)) {
-		err = PTR_ERR(bo);
-		if (xe_vm_validate_should_retry(NULL, err, &end))
-			goto retry;
+	if (err)
 		goto out_vm;
-	}
 
 	if (args->extensions) {
 		err = gem_create_user_extensions(xe, bo, args->extensions, 0);
@@ -3243,11 +3281,11 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
 	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
 			   page_size);
 
-	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
+	bo = xe_bo_create_user(xe, NULL, args->size,
 			       DRM_XE_GEM_CPU_CACHING_WC,
 			       XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
 			       XE_BO_FLAG_SCANOUT |
-			       XE_BO_FLAG_NEEDS_CPU_ACCESS);
+			       XE_BO_FLAG_NEEDS_CPU_ACCESS, NULL);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index af15b968b9da..99e8900d2dcc 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -104,13 +104,8 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
 				  enum ttm_bo_type type, u32 flags,
 				  struct drm_exec *exec);
-struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
-			   struct xe_vm *vm, size_t size,
-			   enum ttm_bo_type type, u32 flags);
-struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
-				struct xe_vm *vm, size_t size,
-				u16 cpu_caching,
-				u32 flags);
+struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_vm *vm, size_t size,
+				u16 cpu_caching, u32 flags, struct drm_exec *exec);
 struct xe_bo *xe_bo_create_pin_map(struct xe_device *xe, struct xe_tile *tile,
 				   struct xe_vm *vm, size_t size,
 				   enum ttm_bo_type type, u32 flags);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 9e2952c9c06a..c7bba535b145 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -457,6 +457,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+	xe_validation_device_init(&xe->val);
+
 	init_waitqueue_head(&xe->ufence_wq);
 
 	init_rwsem(&xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 1e780f8a2a8c..ab5050218e5c 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -26,6 +26,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -586,6 +587,8 @@ struct xe_device {
 	 */
 	atomic64_t global_total_pages;
 #endif
+	/** @val: The domain for exhaustive eviction, which is currently per device. */
+	struct xe_validation_device val;
 
 	/** @psmi: GPU debugging via additional validation HW */
 	struct {
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8a6cb92e6a5b..5656da870d6d 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -47,6 +47,20 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 	return vm->gpuvm.r_obj;
 }
 
+/**
+ * xe_vm_drm_exec_lock() - Lock the vm's resv with a drm_exec transaction
+ * @vm: The vm whose resv is to be locked.
+ * @exec: The drm_exec transaction.
+ *
+ * Helper to lock the vm's resv as part of a drm_exec transaction.
+ *
+ * Return: %0 on success. See drm_exec_lock_obj() for error codes.
+ */
+int xe_vm_drm_exec_lock(struct xe_vm *vm, struct drm_exec *exec)
+{
+	return drm_exec_lock_obj(exec, xe_vm_obj(vm));
+}
+
 static bool preempt_fences_waiting(struct xe_vm *vm)
 {
 	struct xe_exec_queue *q;
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 2c241f76d5fb..ba6636c1bd58 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -292,6 +292,8 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked);
  */
 #define xe_vm_assert_held(vm) dma_resv_assert_held(xe_vm_resv(vm))
 
+int xe_vm_drm_exec_lock(struct xe_vm *vm, struct drm_exec *exec);
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_VM)
 #define vm_dbg drm_dbg
 #else
-- 
2.51.0

