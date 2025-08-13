Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4828FCA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 10:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D01A10E1DE;
	Wed, 13 Aug 2025 10:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5OgYBSD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0814010E1DE
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755082323; x=1786618323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ijrhF/1zjycWkWPyVaRZQUV5aNK9JzIp5jnmqTanMFA=;
 b=Z5OgYBSDL1CkcxEg6/nMgAoHr8B81mIzu81O1xw0oTcoYkKqMbbd1+pB
 Kmqof93SrYltrg70WstZJ38v71/LiKQUvmhrr23cagaV+tdcxTgYdLvh3
 8JgANDdklJ4MLSKiiDIdYyBYFajMMLqFaU9PWLBL+qA/hafhqDqtQFPUt
 pWF6EQUcelYu6I3u3ARQ0Qyd58+8x8aXqDq8YYgBv0uebLeIft7UzqxmK
 DMmR9siHKSLBKb88/GK7W16Zbv/zLclYFXRTWxb30YmvGgKK19kX4zsnp
 +4yS4wAZy3aaeivBfe8cYEdtjT6XAMUeaHJWx0CXkUL4FcfY3bVfqkOfC A==;
X-CSE-ConnectionGUID: xn/DjnU9TPaK6WuHaZvkGg==
X-CSE-MsgGUID: jV6W/05GQx+5eiyH6Gz6Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57450006"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57450006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:02 -0700
X-CSE-ConnectionGUID: fBBd6go/RHWrGhnIrJITTQ==
X-CSE-MsgGUID: RWIEFbtOR9aOzmTQEZrDuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166068997"
Received: from agladkov-desk.ger.corp.intel.com (HELO fedora)
 ([10.245.245.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 03:52:01 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 06/15] drm/xe: Convert xe_bo_create_user() for exhaustive
 eviction
Date: Wed, 13 Aug 2025 12:51:12 +0200
Message-ID: <20250813105121.5945-7-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
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

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c      |  16 ++--
 drivers/gpu/drm/xe/tests/xe_dma_buf.c |   4 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c |  12 +--
 drivers/gpu/drm/xe/xe_bo.c            | 116 +++++++++++++++++---------
 drivers/gpu/drm/xe/xe_bo.h            |   9 +-
 drivers/gpu/drm/xe/xe_device.c        |   2 +
 drivers/gpu/drm/xe/xe_device_types.h  |   3 +
 drivers/gpu/drm/xe/xe_vm.c            |  14 ++++
 drivers/gpu/drm/xe/xe_vm.h            |   2 +
 9 files changed, 116 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 06ceba6c3c25..42f914692a02 100644
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
index 965dd3280468..8126b35f4aeb 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -122,8 +122,8 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
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
index e71addf51ed0..5e40b6cb8d2a 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2185,30 +2185,66 @@ struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				     flags, 0, exec);
 }
 
-struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
-				struct xe_vm *vm, size_t size,
-				u16 cpu_caching,
-				u32 flags)
-{
-	struct drm_exec *exec = vm ? xe_vm_validation_exec(vm) : XE_VALIDATION_UNIMPLEMENTED;
-	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
-						 cpu_caching, ttm_bo_type_device,
-						 flags | XE_BO_FLAG_USER, 0, exec);
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
+static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *tile,
+				       size_t size, u16 cpu_caching,
+				       enum ttm_bo_type type, u32 flags,
+				       u64 alignment, bool intr)
+{
+	u32 drm_exec_flags = intr ? DRM_EXEC_INTERRUPTIBLE_WAIT : 0;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	struct xe_bo *bo;
+	int ret = 0;
 
-	return bo;
+	xe_validation_guard(&ctx, &xe->val, &exec, drm_exec_flags, ret, false) {
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
+
+	flags |= XE_BO_FLAG_USER;
 
-	if (!IS_ERR(bo))
-		xe_bo_unlock_vm_held(bo);
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
@@ -2757,8 +2793,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
@@ -2832,25 +2869,26 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 	}
 
-retry:
-	if (vm) {
-		err = xe_vm_lock(vm, true);
-		if (err)
-			goto out_vm;
+	err = 0;
+	xe_validation_guard(&ctx, &xe->val, &exec,
+			    DRM_EXEC_INTERRUPTIBLE_WAIT, err, false) {
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
@@ -3223,11 +3261,11 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
index b1b6cb622d71..c6bb90ca5c2e 100644
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
index 3e0402dff423..6b152aa89dbb 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -452,6 +452,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (err)
 		goto err;
 
+	xe_validation_device_init(&xe->val);
+
 	init_waitqueue_head(&xe->ufence_wq);
 
 	init_rwsem(&xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 01e8fa0d2f9f..a4eb32bac151 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -26,6 +26,7 @@
 #include "xe_sriov_vf_ccs_types.h"
 #include "xe_step_types.h"
 #include "xe_survivability_mode_types.h"
+#include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 #define TEST_VM_OPS_ERROR
@@ -575,6 +576,8 @@ struct xe_device {
 	 */
 	atomic64_t global_total_pages;
 #endif
+	/** @val: The domain for exhaustive eviction, which is currently per device. */
+	struct xe_validation_device val;
 
 	/* private: */
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 600aaadb4bee..1c2d9d9065c6 100644
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
 /**
  * xe_vma_userptr_check_repin() - Advisory check for repin needed
  * @uvma: The userptr vma
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 4ba26eed7e96..3b6e7234dac4 100644
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
2.50.1

