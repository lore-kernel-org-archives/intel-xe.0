Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D51C2BD09
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 08:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9742010E1D8;
	Mon,  1 Jul 2024 08:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPqh9ZAP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1D10E33D
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 08:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719821016; x=1751357016;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xt694oCN9hOMTva6nxVyDl7MBFrbU2tjNYElMZb8ai8=;
 b=bPqh9ZAPozi3kKH0vc0/NXHislgF9TWsZ3DfoI/q5P7LhqjHedCWIW1Y
 oBa4ARB5i5ikj9i4lcNZ3ihahuSeyTsl/uiHHmiJYEDQEjc0KuK9jbDvZ
 ESkSFBq7/cDB33GLHnzbMB5j5RnoQJjiXxgrVr9Sil1sCPxnxvZonOWqD
 rN+pFyH36OwYw0g4bU9aJIs+JOEt+UUtf9SD/SGiijYRgDq5aosiNILHj
 RXPEvh8sfiWp6NuK3bDD7GKWKNTIM7LLRujg+u28KPDlyRdlBBym0Qp94
 A+bII2bDfjZnC9bC1P7OawcOleCd14uZV0Jl0VGXyjlQVFkCA4fKyC28G Q==;
X-CSE-ConnectionGUID: y5LNa5DuQnKc6cAkERQdNQ==
X-CSE-MsgGUID: OnXcYTAOSaqPgJBhGhkhTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="20799568"
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="20799568"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 01:03:36 -0700
X-CSE-ConnectionGUID: N7fAGSDuQM2aFhDcWMPuGA==
X-CSE-MsgGUID: j9sHgEJPQ9WCZ7YAfoa2lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,175,1716274800"; d="scan'208";a="49902858"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 01:03:35 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v2] drm/xe: lean exhaustive eviction
Date: Mon,  1 Jul 2024 10:03:27 +0200
Message-ID: <20240701080327.3191-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
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

Squashed commit of the following:

commit c4e2b30d79c7755e00c34b050e583b010c06c020
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 16:33:28 2024 +0200

    drm/xe/validation: Convert xe_dma_buf.c

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 019217eae23d0b9b203f102042b58f7641eb668f
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 16:05:42 2024 +0200

    drm/exec/validation: Convert __xe_pin_fb_vma()

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit d327e08da277b2ff2e6f850b0aea8dc3e4726364
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 17:13:13 2024 +0200

    drm/xe: Conversion of the fault handler to support drm_exec locking

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 8eb1ff3fd98305dcf54323d42b09f1322cc9ebac
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 10:49:56 2024 +0200

    drm/xe: Wrap all instances of drm_exec_init / drm_exec_fini.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 829afeebe4ca21c4a05ce73bd4e43dea4eafd306
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 09:30:31 2024 +0200

    drm/xe: Introduce an xe_validation wrapper around drm_exec

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 1baa5f7987a3716349f895c545a684cffb2257fa
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jun 12 14:41:01 2024 +0200

    drm/xe: Ensure we pass down the drm_exec context to validation

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 318f2adce57a0dfdc58525377291b27ce093787b
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 30 22:20:06 2024 +0200

    drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member

    This member is set when exporting using prime. However
    the xe_gem_prime_export() alone doesn't set it, since it's done
    later in the prime export flow.
    For the test, set it manually and remove the hack that set it
    temporarily when it was really need it.

    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Test-with: 20240630180502.81556-1-thomas.hellstrom@linux.intel.com
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile                   |   1 +
 .../compat-i915-headers/gem/i915_gem_stolen.h |   6 +-
 drivers/gpu/drm/xe/display/intel_fb_bo.c      |   1 +
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  26 +--
 drivers/gpu/drm/xe/tests/xe_bo.c              |  20 ++-
 drivers/gpu/drm/xe/tests/xe_dma_buf.c         |  20 +--
 drivers/gpu/drm/xe/tests/xe_migrate.c         |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                    |  59 ++++---
 drivers/gpu/drm/xe/xe_bo.h                    |  20 ++-
 drivers/gpu/drm/xe/xe_device.c                |   2 +
 drivers/gpu/drm/xe/xe_device_types.h          |   3 +
 drivers/gpu/drm/xe/xe_dma_buf.c               |  66 +++++--
 drivers/gpu/drm/xe/xe_exec.c                  |  26 +--
 drivers/gpu/drm/xe/xe_ggtt.c                  |  13 +-
 drivers/gpu/drm/xe/xe_ggtt.h                  |   6 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  24 ++-
 drivers/gpu/drm/xe/xe_validation.c            | 166 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_validation.h            |  89 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c                    | 158 ++++++++---------
 drivers/gpu/drm/xe/xe_vm.h                    |   2 -
 drivers/gpu/drm/xe/xe_vm_types.h              |   4 +
 21 files changed, 520 insertions(+), 198 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_validation.c
 create mode 100644 drivers/gpu/drm/xe/xe_validation.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b1e03bfe4a68..6f3563dfc196 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -126,6 +126,7 @@ xe-y += xe_bb.o \
 	xe_uc.o \
 	xe_uc_debugfs.o \
 	xe_uc_fw.o \
+	xe_validation.o \
 	xe_vm.o \
 	xe_vram.o \
 	xe_vram_freq.o \
diff --git a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
index cb6c7598824b..5e32ade60243 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_stolen.h
@@ -3,6 +3,7 @@
 
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_res_cursor.h"
+#include "xe_validation.h"
 
 struct xe_bo;
 
@@ -15,6 +16,7 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 						       u32 size, u32 align,
 						       u32 start, u32 end)
 {
+	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_bo *bo;
 	int err;
 	u32 flags = XE_BO_FLAG_PINNED | XE_BO_FLAG_STOLEN;
@@ -29,13 +31,13 @@ static inline int i915_gem_stolen_insert_node_in_range(struct xe_device *xe,
 
 	bo = xe_bo_create_locked_range(xe, xe_device_get_root_tile(xe),
 				       NULL, size, start, end,
-				       ttm_bo_type_kernel, flags);
+				       ttm_bo_type_kernel, flags, exec);
 	if (IS_ERR(bo)) {
 		err = PTR_ERR(bo);
 		bo = NULL;
 		return err;
 	}
-	err = xe_bo_pin(bo);
+	err = xe_bo_pin(bo, exec);
 	xe_bo_unlock_vm_held(bo);
 
 	if (err) {
diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
index f835492f73fb..acdb3494d450 100644
--- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
@@ -47,6 +47,7 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
 			goto err;
 		}
 		bo->flags |= XE_BO_FLAG_SCANOUT;
+		pr_info("Fix up scanout. %p\n", &bo->ttm.base);
 	}
 	ttm_bo_unreserve(&bo->ttm);
 	return 0;
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 423f367c7065..d72a3fb16b70 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -256,6 +256,8 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	struct xe_device *xe = to_xe_device(dev);
 	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	struct xe_bo *bo = intel_fb_obj(&fb->base);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	int ret;
 
 	if (!vma)
@@ -282,17 +284,21 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 	 * Pin the framebuffer, we can't use xe_bo_(un)pin functions as the
 	 * assumptions are incorrect for framebuffers
 	 */
-	ret = ttm_bo_reserve(&bo->ttm, false, false, NULL);
-	if (ret)
-		goto err;
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto err;
 
-	if (IS_DGFX(xe))
-		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
-	else
-		ret = xe_bo_validate(bo, NULL, true);
-	if (!ret)
-		ttm_bo_pin(&bo->ttm);
-	ttm_bo_unreserve(&bo->ttm);
+		if (IS_DGFX(xe))
+			ret = xe_bo_migrate(bo, XE_PL_VRAM0, &exec);
+		else
+			ret = xe_bo_validate(bo, NULL, true, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+		if (!ret)
+			ttm_bo_pin(&bo->ttm);
+	}
 	if (ret)
 		goto err;
 
diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 9f3c02826464..a7f003a97449 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -16,7 +16,7 @@
 
 static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 			    bool clear, u64 get_val, u64 assign_val,
-			    struct kunit *test)
+			    struct kunit *test, struct drm_exec *exec)
 {
 	struct dma_fence *fence;
 	struct ttm_tt *ttm;
@@ -28,7 +28,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	u32 offset;
 
 	/* Move bo to VRAM if not already there. */
-	ret = xe_bo_validate(bo, NULL, false);
+	ret = xe_bo_validate(bo, NULL, false, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to validate bo.\n");
 		return ret;
@@ -45,7 +45,7 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 	}
 
 	/* Evict to system. CCS data should be copied. */
-	ret = xe_bo_evict(bo, true);
+	ret = xe_bo_evict(bo, true, exec);
 	if (ret) {
 		KUNIT_FAIL(test, "Failed to evict bo.\n");
 		return ret;
@@ -117,6 +117,7 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	/* TODO: Sanity check */
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 
 	if (IS_DGFX(xe))
 		kunit_info(test, "Testing vram id %u\n", tile->id);
@@ -134,18 +135,18 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 
 	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
 	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
-			       test);
+			       test, exec);
 	if (ret)
 		goto out_unlock;
 
 	kunit_info(test, "Verifying that CCS data survives migration.\n");
 	ret = ccs_test_migrate(tile, bo, false, 0xdeadbeefdeadbeefULL,
-			       0xdeadbeefdeadbeefULL, test);
+			       0xdeadbeefdeadbeefULL, test, exec);
 	if (ret)
 		goto out_unlock;
 
 	kunit_info(test, "Verifying that CCS data can be properly cleared.\n");
-	ret = ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test);
+	ret = ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test, exec);
 
 out_unlock:
 	xe_bo_unlock(bo);
@@ -188,6 +189,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 	struct xe_bo *bo, *external;
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 	struct xe_gt *__gt;
 	int err, i, id;
 
@@ -215,7 +217,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		}
 
 		xe_bo_lock(external, false);
-		err = xe_bo_pin_external(external);
+		err = xe_bo_pin_external(external, exec);
 		xe_bo_unlock(external);
 		if (err) {
 			KUNIT_FAIL(test, "external bo pin err=%pe\n",
@@ -274,7 +276,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 		if (i) {
 			down_read(&vm->lock);
 			xe_vm_lock(vm, false);
-			err = xe_bo_validate(bo, bo->vm, false);
+			err = xe_bo_validate(bo, bo->vm, false, NULL);
 			xe_vm_unlock(vm);
 			up_read(&vm->lock);
 			if (err) {
@@ -283,7 +285,7 @@ static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struc
 				goto cleanup_all;
 			}
 			xe_bo_lock(external, false);
-			err = xe_bo_validate(external, NULL, false);
+			err = xe_bo_validate(external, NULL, false, NULL);
 			xe_bo_unlock(external);
 			if (err) {
 				KUNIT_FAIL(test, "external bo valid err=%pe\n",
diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
index e7f9b531c465..18b1ac070ed6 100644
--- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
@@ -27,7 +27,8 @@ static bool is_dynamic(struct dma_buf_test_params *params)
 }
 
 static void check_residency(struct kunit *test, struct xe_bo *exported,
-			    struct xe_bo *imported, struct dma_buf *dmabuf)
+			    struct xe_bo *imported, struct dma_buf *dmabuf,
+			    struct drm_exec *exec)
 {
 	struct dma_buf_test_params *params = to_dma_buf_test_params(test->priv);
 	u32 mem_type;
@@ -57,16 +58,12 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 		return;
 
 	/*
-	 * Evict exporter. Note that the gem object dma_buf member isn't
-	 * set from xe_gem_prime_export(), and it's needed for the move_notify()
-	 * functionality, so hack that up here. Evicting the exported bo will
+	 * Evict exporter. Evicting the exported bo will
 	 * evict also the imported bo through the move_notify() functionality if
 	 * importer is on a different device. If they're on the same device,
 	 * the exporter and the importer should be the same bo.
 	 */
-	swap(exported->ttm.base.dma_buf, dmabuf);
-	ret = xe_bo_evict(exported, true);
-	swap(exported->ttm.base.dma_buf, dmabuf);
+	ret = xe_bo_evict(exported, true, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Evicting exporter failed with err=%d.\n",
@@ -81,7 +78,7 @@ static void check_residency(struct kunit *test, struct xe_bo *exported,
 	}
 
 	/* Re-validate the importer. This should move also exporter in. */
-	ret = xe_bo_validate(imported, NULL, false);
+	ret = xe_bo_validate(imported, NULL, false, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			KUNIT_FAIL(test, "Validating importer failed with err=%d.\n",
@@ -139,6 +136,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			   PTR_ERR(dmabuf));
 		goto out;
 	}
+	bo->ttm.base.dma_buf = dmabuf;
 
 	import = xe_gem_prime_import(&xe->drm, dmabuf);
 	if (!IS_ERR(import)) {
@@ -153,11 +151,12 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 			KUNIT_FAIL(test,
 				   "xe_gem_prime_import() succeeded when it shouldn't have\n");
 		} else {
+			struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 			int err;
 
 			/* Is everything where we expect it to be? */
 			xe_bo_lock(import_bo, false);
-			err = xe_bo_validate(import_bo, NULL, false);
+			err = xe_bo_validate(import_bo, NULL, false, exec);
 
 			/* Pinning in VRAM is not allowed. */
 			if (!is_dynamic(params) &&
@@ -170,7 +169,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 						  err == -ERESTARTSYS);
 
 			if (!err)
-				check_residency(test, bo, import_bo, dmabuf);
+				check_residency(test, bo, import_bo, dmabuf, exec);
 			xe_bo_unlock(import_bo);
 		}
 		drm_gem_object_put(import);
@@ -186,6 +185,7 @@ static void xe_test_dmabuf_import_same_driver(struct xe_device *xe)
 		KUNIT_FAIL(test, "dynamic p2p attachment failed with err=%ld\n",
 			   PTR_ERR(import));
 	}
+	bo->ttm.base.dma_buf = NULL;
 	dma_buf_put(dmabuf);
 out:
 	drm_gem_object_put(&bo->ttm.base);
diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 962f6438e219..9218029fdd68 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -72,6 +72,7 @@ static int run_sanity_job(struct xe_migrate *m, struct xe_device *xe,
 static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 		      struct kunit *test, u32 region)
 {
+	struct drm_exec *exec = XE_VALIDATION_OPT_OUT;
 	struct xe_device *xe = tile_to_xe(m->tile);
 	u64 retval, expected = 0;
 	bool big = bo->size >= SZ_2M;
@@ -83,14 +84,15 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
 						   bo->size,
 						   ttm_bo_type_kernel,
 						   region |
-						   XE_BO_FLAG_NEEDS_CPU_ACCESS);
+						   XE_BO_FLAG_NEEDS_CPU_ACCESS,
+						   exec);
 	if (IS_ERR(remote)) {
 		KUNIT_FAIL(test, "Failed to allocate remote bo for %s: %pe\n",
 			   str, remote);
 		return;
 	}
 
-	err = xe_bo_validate(remote, NULL, false);
+	err = xe_bo_validate(remote, NULL, false, XE_VALIDATION_OPT_OUT);
 	if (err) {
 		KUNIT_FAIL(test, "Failed to validate system bo for %s: %i\n",
 			   str, err);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 65c696966e96..59ab6b8256dc 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1140,12 +1140,18 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	struct xe_device *xe = to_xe_device(ddev);
 	struct xe_bo *bo = ttm_to_xe_bo(tbo);
 	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
 	vm_fault_t ret;
 	int idx;
 
 	if (needs_rpm)
 		xe_pm_runtime_get(xe);
 
+	if (xe_validation_ctx_init(&ctx, &xe->val, &exec,
+				   DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false))
+		return VM_FAULT_NOPAGE;
+
 	ret = ttm_bo_vm_reserve(tbo, vmf);
 	if (ret)
 		goto out;
@@ -1153,6 +1159,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 	if (drm_dev_enter(ddev, &idx)) {
 		trace_xe_bo_cpu_fault(bo);
 
+		xe_validation_assert_exec(xe, &exec, &tbo->base);
 		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
 					       TTM_BO_VM_NUM_PREFAULT);
 		drm_dev_exit(idx);
@@ -1174,6 +1181,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
 
 	dma_resv_unlock(tbo->base.resv);
 out:
+	xe_validation_ctx_fini(&ctx);
 	if (needs_rpm)
 		xe_pm_runtime_put(xe);
 
@@ -1233,7 +1241,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				     struct xe_tile *tile, struct dma_resv *resv,
 				     struct ttm_lru_bulk_move *bulk, size_t size,
 				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags)
+				     u32 flags, struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1297,6 +1305,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 		ctx.resv = resv;
 	}
 
+	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
 		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
 		if (WARN_ON(err)) {
@@ -1397,7 +1406,8 @@ static struct xe_bo *
 __xe_bo_create_locked(struct xe_device *xe,
 		      struct xe_tile *tile, struct xe_vm *vm,
 		      size_t size, u64 start, u64 end,
-		      u16 cpu_caching, enum ttm_bo_type type, u32 flags)
+		      u16 cpu_caching, enum ttm_bo_type type, u32 flags,
+		      struct drm_exec *exec)
 {
 	struct xe_bo *bo = NULL;
 	int err;
@@ -1422,7 +1432,7 @@ __xe_bo_create_locked(struct xe_device *xe,
 				    vm && !xe_vm_in_fault_mode(vm) &&
 				    flags & XE_BO_FLAG_USER ?
 				    &vm->lru_bulk_move : NULL, size,
-				    cpu_caching, type, flags);
+				    cpu_caching, type, flags, exec);
 	if (IS_ERR(bo))
 		return bo;
 
@@ -1445,9 +1455,10 @@ __xe_bo_create_locked(struct xe_device *xe,
 
 		if (flags & XE_BO_FLAG_FIXED_PLACEMENT) {
 			err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
-						   start + bo->size, U64_MAX);
+						   start + bo->size, U64_MAX,
+						   exec);
 		} else {
-			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
+			err = xe_ggtt_insert_bo(tile->mem.ggtt, bo, exec);
 		}
 		if (err)
 			goto err_unlock_put_bo;
@@ -1466,16 +1477,18 @@ struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_tile *tile, struct xe_vm *vm,
 			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags)
+			  enum ttm_bo_type type, u32 flags,
+			  struct drm_exec *exec)
 {
-	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type, flags);
+	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, type, flags, exec);
 }
 
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
-				  enum ttm_bo_type type, u32 flags)
+				  enum ttm_bo_type type, u32 flags,
+				  struct drm_exec *exec)
 {
-	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, type, flags);
+	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, type, flags, exec);
 }
 
 struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
@@ -1484,9 +1497,10 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
 				enum ttm_bo_type type,
 				u32 flags)
 {
+	struct drm_exec *exec = vm ? vm->validation.exec : XE_VALIDATION_UNIMPLEMENTED;
 	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
 						 cpu_caching, type,
-						 flags | XE_BO_FLAG_USER);
+						 flags | XE_BO_FLAG_USER, exec);	
 	if (!IS_ERR(bo))
 		xe_bo_unlock_vm_held(bo);
 
@@ -1497,7 +1511,8 @@ struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
 			   struct xe_vm *vm, size_t size,
 			   enum ttm_bo_type type, u32 flags)
 {
-	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags);
+	struct drm_exec *exec = vm ? vm->validation.exec : XE_VALIDATION_UNIMPLEMENTED;
+	struct xe_bo *bo = xe_bo_create_locked(xe, tile, vm, size, type, flags, exec);
 
 	if (!IS_ERR(bo))
 		xe_bo_unlock_vm_held(bo);
@@ -1514,17 +1529,18 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_tile *tile
 	int err;
 	u64 start = offset == ~0ull ? 0 : offset;
 	u64 end = offset == ~0ull ? offset : start + size;
+	struct drm_exec *exec = vm ? vm->validation.exec : XE_VALIDATION_UNIMPLEMENTED;
 
 	if (flags & XE_BO_FLAG_STOLEN &&
 	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_FLAG_GGTT;
 
 	bo = xe_bo_create_locked_range(xe, tile, vm, size, start, end, type,
-				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+				       flags | XE_BO_FLAG_NEEDS_CPU_ACCESS, exec);
 	if (IS_ERR(bo))
 		return bo;
 
-	err = xe_bo_pin(bo);
+	err = xe_bo_pin(bo, exec);
 	if (err)
 		goto err_put;
 
@@ -1659,7 +1675,7 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res)
  *
  * Returns 0 for success, negative error code otherwise.
  */
-int xe_bo_pin_external(struct xe_bo *bo)
+int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
@@ -1668,7 +1684,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	xe_assert(xe, xe_bo_is_user(bo));
 
 	if (!xe_bo_is_pinned(bo)) {
-		err = xe_bo_validate(bo, NULL, false);
+		err = xe_bo_validate(bo, NULL, false, exec);
 		if (err)
 			return err;
 
@@ -1691,7 +1707,7 @@ int xe_bo_pin_external(struct xe_bo *bo)
 	return 0;
 }
 
-int xe_bo_pin(struct xe_bo *bo)
+int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec)
 {
 	struct xe_device *xe = xe_bo_device(bo);
 	int err;
@@ -1712,7 +1728,7 @@ int xe_bo_pin(struct xe_bo *bo)
 	/* We only expect at most 1 pin */
 	xe_assert(xe, !xe_bo_is_pinned(bo));
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, exec);
 	if (err)
 		return err;
 
@@ -1819,7 +1835,8 @@ void xe_bo_unpin(struct xe_bo *bo)
  * Return: 0 on success, negative error code on failure. May return
  * -EINTR or -ERESTARTSYS if internal waits are interrupted by a signal.
  */
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
+		   struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
@@ -1834,6 +1851,7 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
 		ctx.resv = xe_vm_resv(vm);
 	}
 
+	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
 	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
 }
 
@@ -2154,7 +2172,7 @@ static void xe_place_from_ttm_type(u32 mem_type, struct ttm_place *place)
  * Return: 0 on success. Negative error code on failure. In particular may
  * return -EINTR or -ERESTARTSYS if signal pending.
  */
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec)
 {
 	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
 	struct ttm_operation_ctx ctx = {
@@ -2191,6 +2209,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
 		add_vram(xe, bo, &requested, bo->flags, mem_type, &c);
 	}
 
+	xe_validation_assert_exec(xe_bo_device(bo), exec, &bo->ttm.base);
 	return ttm_bo_validate(&bo->ttm, &placement, &ctx);
 }
 
@@ -2204,7 +2223,7 @@ int xe_bo_migrate(struct xe_bo *bo, u32 mem_type)
  *
  * Return: 0 on success. Negative error code on failure.
  */
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
+int xe_bo_evict(struct xe_bo *bo, bool force_alloc, struct drm_exec *exec)
 {
 	struct ttm_operation_ctx ctx = {
 		.interruptible = false,
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 6de894c728f5..c0fc70655da5 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -10,6 +10,7 @@
 
 #include "xe_bo_types.h"
 #include "xe_macros.h"
+#include "xe_validation.h"
 #include "xe_vm_types.h"
 #include "xe_vm.h"
 
@@ -71,15 +72,17 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 				     struct xe_tile *tile, struct dma_resv *resv,
 				     struct ttm_lru_bulk_move *bulk, size_t size,
 				     u16 cpu_caching, enum ttm_bo_type type,
-				     u32 flags);
+				     u32 flags, struct drm_exec *exec);
 struct xe_bo *
 xe_bo_create_locked_range(struct xe_device *xe,
 			  struct xe_tile *tile, struct xe_vm *vm,
 			  size_t size, u64 start, u64 end,
-			  enum ttm_bo_type type, u32 flags);
+			  enum ttm_bo_type type, u32 flags,
+			  struct drm_exec *exec);
 struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
 				  struct xe_vm *vm, size_t size,
-				  enum ttm_bo_type type, u32 flags);
+				  enum ttm_bo_type type, u32 flags,
+				  struct drm_exec *exec);
 struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
 			   struct xe_vm *vm, size_t size,
 			   enum ttm_bo_type type, u32 flags);
@@ -159,11 +162,12 @@ static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
 	}
 }
 
-int xe_bo_pin_external(struct xe_bo *bo);
-int xe_bo_pin(struct xe_bo *bo);
+int xe_bo_pin_external(struct xe_bo *bo, struct drm_exec *exec);
+int xe_bo_pin(struct xe_bo *bo, struct drm_exec *exec);
 void xe_bo_unpin_external(struct xe_bo *bo);
 void xe_bo_unpin(struct xe_bo *bo);
-int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict);
+int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict,
+		   struct drm_exec *exec);
 
 static inline bool xe_bo_is_pinned(struct xe_bo *bo)
 {
@@ -211,8 +215,8 @@ uint64_t vram_region_gpu_offset(struct ttm_resource *res);
 
 bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
 
-int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
-int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
+int xe_bo_migrate(struct xe_bo *bo, u32 mem_type, struct drm_exec *exec);
+int xe_bo_evict(struct xe_bo *bo, bool force_alloc, struct drm_exec *exec);
 
 int xe_bo_evict_pinned(struct xe_bo *bo);
 int xe_bo_restore_pinned(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cfda7cb5df2c..1ea4d46d5ad1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -277,6 +277,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	spin_lock_init(&xe->irq.lock);
 	spin_lock_init(&xe->clients.lock);
 
+	xe_validation_device_init(&xe->val);
+
 	init_waitqueue_head(&xe->ufence_wq);
 
 	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index c37be471d11c..3d4e5164923f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -22,6 +22,7 @@
 #include "xe_pt_types.h"
 #include "xe_sriov_types.h"
 #include "xe_step_types.h"
+#include "xe_validation.h"
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
 #include "soc/intel_pch.h"
@@ -477,6 +478,8 @@ struct xe_device {
 		int mode;
 	} wedged;
 
+	struct xe_validation_device val;
+  
 	/* private: */
 
 #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 68f309f5e981..828182eb23e4 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -51,6 +51,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	struct xe_device *xe = xe_bo_device(bo);
+	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
 	int ret;
 
 	/*
@@ -63,7 +64,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return -EINVAL;
 	}
 
-	ret = xe_bo_migrate(bo, XE_PL_TT);
+	ret = xe_bo_migrate(bo, XE_PL_TT, exec);
 	if (ret) {
 		if (ret != -EINTR && ret != -ERESTARTSYS)
 			drm_dbg(&xe->drm,
@@ -72,7 +73,7 @@ static int xe_dma_buf_pin(struct dma_buf_attachment *attach)
 		return ret;
 	}
 
-	ret = xe_bo_pin_external(bo);
+	ret = xe_bo_pin_external(bo, exec);
 	xe_assert(xe, !ret);
 
 	return 0;
@@ -92,6 +93,7 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 	struct dma_buf *dma_buf = attach->dmabuf;
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
 	struct sg_table *sgt;
 	int r = 0;
 
@@ -100,9 +102,9 @@ static struct sg_table *xe_dma_buf_map(struct dma_buf_attachment *attach,
 
 	if (!xe_bo_is_pinned(bo)) {
 		if (!attach->peer2peer)
-			r = xe_bo_migrate(bo, XE_PL_TT);
+			r = xe_bo_migrate(bo, XE_PL_TT, exec);
 		else
-			r = xe_bo_validate(bo, NULL, false);
+			r = xe_bo_validate(bo, NULL, false, exec);
 		if (r)
 			return ERR_PTR(r);
 	}
@@ -164,15 +166,27 @@ static int xe_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
 	struct xe_bo *bo = gem_to_xe_bo(obj);
 	bool reads =  (direction == DMA_BIDIRECTIONAL ||
 		       direction == DMA_FROM_DEVICE);
+	struct xe_validation_ctx ctx;
+	struct drm_exec exec;
+	int ret = 0;
 
 	if (!reads)
 		return 0;
 
 	/* Can we do interruptible lock here? */
-	xe_bo_lock(bo, false);
-	(void)xe_bo_migrate(bo, XE_PL_TT);
-	xe_bo_unlock(bo);
-
+	xe_validation_guard(&ctx, &xe_bo_device(bo)->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto out;
+
+		ret = xe_bo_migrate(bo, XE_PL_TT, &exec);
+		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &ret);
+	}
+out:
+	/* If we failed, cpu-access takes place in current placement. */
+	(void) ret;
 	return 0;
 }
 
@@ -211,23 +225,38 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
 {
 	struct dma_resv *resv = dma_buf->resv;
 	struct xe_device *xe = to_xe_device(dev);
+	struct xe_validation_ctx ctx;
+	struct drm_gem_object *dummy_obj;
+	struct drm_exec exec;
 	struct xe_bo *bo;
-	int ret;
+	int ret = 0;
 
-	dma_resv_lock(resv, NULL);
-	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
+	dummy_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
+	if (!dummy_obj)
+		return ERR_PTR(-ENOMEM);
+
+	dummy_obj->resv = resv;
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, false) {
+		ret = drm_exec_lock_obj(&exec, dummy_obj);
+		drm_exec_retry_on_contention(&exec);
+		if (ret)
+			goto error;
+
+		bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
 				    0, /* Will require 1way or 2way for vm_bind */
-				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM);
-	if (IS_ERR(bo)) {
-		ret = PTR_ERR(bo);
-		goto error;
+				    ttm_bo_type_sg, XE_BO_FLAG_SYSTEM, &exec);
+		drm_exec_retry_on_contention(&exec);
+		if (IS_ERR(bo)) {
+			ret = PTR_ERR(bo);
+			xe_validation_retry_on_oom(&ctx, &ret);
+			goto error;
+		}
 	}
-	dma_resv_unlock(resv);
+	drm_gem_object_put(dummy_obj);
 
 	return &bo->ttm.base;
 
 error:
-	dma_resv_unlock(resv);
 	return ERR_PTR(ret);
 }
 
@@ -235,8 +264,9 @@ static void xe_dma_buf_move_notify(struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->importer_priv;
 	struct xe_bo *bo = gem_to_xe_bo(obj);
+	struct drm_exec *exec = XE_VALIDATION_UNSUPPORTED;
 
-	XE_WARN_ON(xe_bo_evict(bo, false));
+	XE_WARN_ON(xe_bo_evict(bo, false, exec));
 }
 
 static const struct dma_buf_attach_ops xe_dma_buf_attach_ops = {
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 2d72cdec3a0b..b3eb49a26f10 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -101,9 +101,13 @@
 static int xe_exec_fn(struct drm_gpuvm_exec *vm_exec)
 {
 	struct xe_vm *vm = container_of(vm_exec->vm, struct xe_vm, gpuvm);
+	int ret;
 
 	/* The fence slot added here is intended for the exec sched job. */
-	return xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
+	vm->validation.exec = &vm_exec->exec;
+	ret = xe_vm_validate_rebind(vm, &vm_exec->exec, 1);
+	vm->validation.exec = NULL;
+	return ret;
 }
 
 int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
@@ -119,10 +123,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
 	struct drm_exec *exec = &vm_exec.exec;
 	u32 i, num_syncs = 0, num_ufence = 0;
+	struct xe_validation_ctx ctx;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
 	bool write_locked, skip_retry = false;
-	ktime_t end = 0;
 	int err = 0;
 
 	if (XE_IOCTL_DBG(xe, args->extensions) ||
@@ -225,17 +229,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_unlock_list;
 	}
 
-	vm_exec.vm = &vm->gpuvm;
-	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
-	if (xe_vm_in_lr_mode(vm)) {
-		drm_exec_init(exec, vm_exec.flags, 0);
-	} else {
-		err = drm_gpuvm_exec_lock(&vm_exec);
-		if (err) {
-			if (xe_vm_validate_should_retry(exec, err, &end))
-				err = -EAGAIN;
+	if (!xe_vm_in_lr_mode(vm)) {
+		vm_exec.vm = &vm->gpuvm;
+		vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+		err = xe_validation_exec_lock(&ctx, &vm_exec, &xe->val);
+		if (err)
 			goto err_unlock_list;
-		}
 	}
 
 	if (xe_vm_is_closed_or_banned(q->vm)) {
@@ -319,7 +318,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	if (err)
 		xe_sched_job_put(job);
 err_exec:
-	drm_exec_fini(exec);
+	if (!xe_vm_in_lr_mode(vm))
+		xe_validation_ctx_fini(&ctx);
 err_unlock_list:
 	up_read(&vm->lock);
 	if (err == -EAGAIN && !skip_retry)
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 883cfc7f98a8..d0aa597531ac 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -431,7 +431,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 }
 
 static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-				  u64 start, u64 end)
+				  u64 start, u64 end, struct drm_exec *exec)
 {
 	int err;
 	u64 alignment = XE_PAGE_SIZE;
@@ -445,7 +445,7 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return 0;
 	}
 
-	err = xe_bo_validate(bo, NULL, false);
+	err = xe_bo_validate(bo, NULL, false, exec);
 	if (err)
 		return err;
 
@@ -465,14 +465,15 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 }
 
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end)
+			 u64 start, u64 end, struct drm_exec *exec)
 {
-	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
+	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end, exec);
 }
 
-int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
+int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
+		      struct drm_exec *exec)
 {
-	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
+	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX, exec);
 }
 
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 6a96fd54bf60..100c2c11b727 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -9,6 +9,7 @@
 #include "xe_ggtt_types.h"
 
 struct drm_printer;
+struct drm_exec;
 
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
@@ -25,9 +26,10 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt,
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
-int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
+int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo,
+		      struct drm_exec *exec);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
-			 u64 start, u64 end);
+			 u64 start, u64 end, struct drm_exec *exec);
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 9292d5468868..2a64305ce779 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -112,12 +112,12 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id, exec);
 		if (err)
 			return err;
 	} else if (bo) {
 		/* Create backing store if needed */
-		err = xe_bo_validate(bo, vm, true);
+		err = xe_bo_validate(bo, vm, true, exec);
 		if (err)
 			return err;
 	}
@@ -129,9 +129,9 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 				struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	ktime_t end = 0;
 	int err;
 	bool atomic;
 
@@ -153,12 +153,11 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	}
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_pf_begin(&exec, vma, atomic, tile->id);
 		drm_exec_retry_on_contention(&exec);
-		if (xe_vm_validate_should_retry(&exec, err, &end))
-			err = -EAGAIN;
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err)
 			goto unlock_dma_resv;
 
@@ -167,8 +166,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
-			if (xe_vm_validate_should_retry(&exec, err, &end))
-				err = -EAGAIN;
+			xe_validation_retry_on_oom(&ctx, &err);
 			goto unlock_dma_resv;
 		}
 	}
@@ -178,7 +176,7 @@ static int handle_vma_pagefault(struct xe_tile *tile, struct pagefault *pf,
 	vma->tile_invalidated &= ~BIT(tile->id);
 
 unlock_dma_resv:
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 	if (err == -EAGAIN)
 		goto retry_userptr;
 
@@ -488,6 +486,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 {
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_tile *tile = gt_to_tile(gt);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vm *vm;
 	struct xe_vma *vma;
@@ -522,15 +521,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 		goto unlock_vm;
 
 	/* Lock VM and BOs dma-resv */
-	drm_exec_init(&exec, 0, 0);
+	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
 	drm_exec_until_all_locked(&exec) {
 		ret = xe_pf_begin(&exec, vma, true, tile->id);
 		drm_exec_retry_on_contention(&exec);
-		if (ret)
-			break;
+		xe_validation_retry_on_oom(&ctx, &ret);
 	}
 
-	drm_exec_fini(&exec);
+	xe_validation_ctx_fini(&ctx);
 unlock_vm:
 	up_read(&vm->lock);
 	xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
new file mode 100644
index 000000000000..b069dc2a75ef
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -0,0 +1,166 @@
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <drm/drm_gpuvm.h>
+
+#include "xe_assert.h"
+#include "xe_validation.h"
+
+#ifdef CONFIG_DRM_XE_DEBUG
+void xe_validation_assert_exec(struct xe_device *xe, struct drm_exec *exec,
+			       struct drm_gem_object *obj)
+{
+	xe_assert(xe, !!exec);
+	if (IS_ERR(exec)) {
+		switch(PTR_ERR(exec)) {
+		case -EINVAL:
+			break;
+		case -EOPNOTSUPP:
+			xe_assert(xe, !!obj->dma_buf);
+			break;
+		case -ENOMEM:
+#if IS_ENABLED(CONFIG_KUNIT)
+			xe_assert(xe, !!current->kunit_test);
+#endif
+			break;
+		default:
+			xe_assert(xe, false);
+		}
+	}
+}
+#endif
+
+static int xe_validation_lock(struct xe_validation_ctx *ctx)
+{
+	struct xe_validation_device *val = ctx->val;
+	int ret = 0;
+
+	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
+		if (ctx->request_exclusive)
+			ret = down_write_killable(&val->lock);
+		else
+			ret = down_read_interruptible(&val->lock);
+	} else {
+		if (ctx->request_exclusive)
+			down_write(&val->lock);
+		else
+			down_read(&val->lock);
+	}
+
+	if (!ret) {
+		ctx->lock_held = true;
+		ctx->lock_held_exclusive = ctx->request_exclusive;
+	}
+	
+	return ret;
+}
+
+static void xe_validation_unlock(struct xe_validation_ctx *ctx)
+{
+	if (!ctx->lock_held)
+		return;
+
+	if (ctx->lock_held_exclusive) {
+		up_write(&ctx->val->lock);
+	} else {
+		up_read(&ctx->val->lock);
+	}
+
+	ctx->lock_held = false;
+}
+
+int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
+			   struct drm_exec *exec, u32 flags, unsigned int nr,
+			   bool exclusive)
+{	
+	int ret;
+
+	ctx->exec = exec;
+	ctx->val = val;
+	ctx->lock_held = false;
+	ctx->lock_held_exclusive = false;
+	ctx->request_exclusive = true;
+	ctx->flags = flags;
+	ctx->nr = nr;
+
+	ret = xe_validation_lock(ctx);
+	if (ret)
+		return ret;
+
+	drm_exec_init(exec, flags, nr);
+
+	return 0;
+}
+
+#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
+static bool xe_validation_contention_injected(struct drm_exec *exec)
+{
+	return !!exec->ticket.contending_lock;
+}
+
+#else
+#define xe_validation_contention_injected(_a) (false)
+#endif
+
+static bool __xe_validation_should_retry(struct xe_validation_ctx *ctx, int ret)
+{
+	if (ret == -ENOMEM &&
+	    ((ctx->request_exclusive &&
+	      xe_validation_contention_injected(ctx->exec)) ||
+	     !ctx->request_exclusive)) {
+		ctx->request_exclusive = true;
+		pr_info("Should retry is true.\n");
+		return true;
+	}
+
+	if (ret == -ENOMEM)
+	  pr_info("Shuld retry is false.\n");
+	
+	return false;
+}
+
+int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
+			    struct drm_gpuvm_exec *vm_exec,
+			    struct xe_validation_device *val)
+{
+	int ret;
+
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->exec = &vm_exec->exec;
+	ctx->flags = vm_exec->flags;
+	ctx->val = val;
+retry:
+	ret = xe_validation_lock(ctx);
+	if (ret)
+		return ret;
+
+	ret = drm_gpuvm_exec_lock(vm_exec);
+	if (ret) {
+		xe_validation_unlock(ctx);
+		if (__xe_validation_should_retry(ctx, ret))
+			goto retry;
+	}
+
+	return ret;
+}
+	
+void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
+{
+	drm_exec_fini(ctx->exec);
+	xe_validation_unlock(ctx);
+}
+
+bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret)
+{
+	if (__xe_validation_should_retry(ctx, *ret)) {
+		drm_exec_fini(ctx->exec);
+		*ret = 0;
+		if (ctx->request_exclusive != ctx->lock_held_exclusive) {
+			xe_validation_unlock(ctx);
+			*ret = xe_validation_lock(ctx);
+		}
+		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
+		return !*ret;
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
new file mode 100644
index 000000000000..685b334afbb4
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -0,0 +1,89 @@
+#ifndef _XE_VALIDATION_H_
+#define _XE_VALIDATION_H_
+
+#include <linux/dma-resv.h>
+#include <linux/types.h>
+#include <linux/rwsem.h>
+
+struct drm_exec;
+struct drm_gem_object;
+struct drm_gpuvm_exec;
+struct xe_device;
+
+#ifdef CONFIG_PROVE_LOCKING
+static inline void xe_validation_lockdep(void)
+{
+	struct ww_acquire_ctx ticket;
+
+	ww_acquire_init(&ticket, &reservation_ww_class);
+	ww_acquire_fini(&ticket);
+}
+#else
+static inline void xe_validation_lockdep(void)
+{
+}
+#endif
+
+#define XE_VALIDATION_UNIMPLEMENTED (xe_validation_lockdep(),		\
+				     (struct drm_exec *) ERR_PTR(-EINVAL))
+#define XE_VALIDATION_UNSUPPORTED ((struct drm_exec *) ERR_PTR(-EOPNOTSUPP))
+#define XE_VALIDATION_OPT_OUT (xe_validation_lockdep(), \
+			       (struct drm_exec *) ERR_PTR(-ENOMEM))
+#ifdef CONFIG_DRM_XE_DEBUG
+void xe_validation_assert_exec(struct xe_device *xe, struct drm_exec *exec,
+			       struct drm_gem_object *obj);
+#else
+#define xe_validation_assert_exec(_xe, _exec, _obj) do {} while (0)
+#endif
+
+struct xe_validation_device {
+	struct rw_semaphore lock;
+};
+
+struct xe_validation_ctx {
+	struct drm_exec *exec;
+	struct xe_validation_device *val;
+	bool lock_held;
+	bool lock_held_exclusive;
+	bool request_exclusive;
+	u32 flags;
+	unsigned int nr;
+};
+
+int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
+			   struct drm_exec *exec, u32 flags, unsigned int nr,
+			   bool exclusive);
+
+int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct drm_gpuvm_exec *vm_exec,
+			    struct xe_validation_device *val);
+
+void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
+
+bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
+
+#define xe_validation_retry_on_oom(_ctx, _ret)				\
+	do {								\
+		if (xe_validation_should_retry(_ctx, _ret))		\
+			goto *__drm_exec_retry_ptr;			\
+	} while(0)
+
+static inline void
+xe_validation_device_init(struct xe_validation_device *val)
+{
+	init_rwsem(&val->lock);
+}
+
+DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,			\
+	     if (!IS_ERR(_T)) {xe_validation_ctx_fini(_T);},		\
+	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl); \
+	       _ret ? NULL : _ctx;}),					\
+	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val, \
+	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
+static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T) \
+{return *_T;}
+
+#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
+	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
+	drm_exec_until_all_locked(_exec)
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5b166fa03684..5a5f2e9bf237 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -223,6 +223,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 		.num_fences = 1,
 	};
 	struct drm_exec *exec = &vm_exec.exec;
+	struct xe_validation_ctx ctx;
 	struct dma_fence *pfence;
 	int err;
 	bool wait;
@@ -230,7 +231,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
 
 	down_write(&vm->lock);
-	err = drm_gpuvm_exec_lock(&vm_exec);
+	err = xe_validation_exec_lock(&ctx, &vm_exec, &vm->xe->val);
 	if (err)
 		goto out_up_write;
 
@@ -262,7 +263,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_read(&vm->userptr.notifier_lock);
 
 out_fini:
-	drm_exec_fini(exec);
+	xe_validation_ctx_fini(&ctx);
 out_up_write:
 	up_write(&vm->lock);
 
@@ -332,39 +333,6 @@ static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
 	/* TODO: Inform user the VM is banned */
 }
 
-/**
- * xe_vm_validate_should_retry() - Whether to retry after a validate error.
- * @exec: The drm_exec object used for locking before validation.
- * @err: The error returned from ttm_bo_validate().
- * @end: A ktime_t cookie that should be set to 0 before first use and
- * that should be reused on subsequent calls.
- *
- * With multiple active VMs, under memory pressure, it is possible that
- * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
- * Until ttm properly handles locking in such scenarios, best thing the
- * driver can do is retry with a timeout. Check if that is necessary, and
- * if so unlock the drm_exec's objects while keeping the ticket to prepare
- * for a rerun.
- *
- * Return: true if a retry after drm_exec_init() is recommended;
- * false otherwise.
- */
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
-{
-	ktime_t cur;
-
-	if (err != -ENOMEM)
-		return false;
-
-	cur = ktime_get();
-	*end = *end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
-	if (!ktime_before(cur, *end))
-		return false;
-
-	msleep(20);
-	return true;
-}
-
 static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 {
 	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
@@ -376,7 +344,7 @@ static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
 		list_move_tail(&gpuva_to_vma(gpuva)->combined_links.rebind,
 			       &vm->rebind_list);
 
-	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false);
+	ret = xe_bo_validate(gem_to_xe_bo(vm_bo->obj), vm, false, exec);
 	if (ret)
 		return ret;
 
@@ -434,6 +402,7 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 	if (err)
 		return err;
 
+	vm->validation.exec = exec;
 	if (xe_vm_is_idle(vm)) {
 		vm->preempt.rebind_deactivated = true;
 		*done = true;
@@ -465,10 +434,10 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
 static void preempt_rebind_work_func(struct work_struct *w)
 {
 	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	unsigned int fence_count = 0;
 	LIST_HEAD(preempt_fences);
-	ktime_t end = 0;
 	int err = 0;
 	long wait;
 	int __maybe_unused tries = 0;
@@ -491,18 +460,20 @@ static void preempt_rebind_work_func(struct work_struct *w)
 			goto out_unlock_outer;
 	}
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
+	err = xe_validation_ctx_init(&ctx, &vm->xe->val,
+				     &exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false);
+	if (err)
+		goto out_unlock_outer;
 
 	drm_exec_until_all_locked(&exec) {
 		bool done = false;
 
 		err = xe_preempt_work_begin(&exec, vm, &done);
 		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err || done) {
-			drm_exec_fini(&exec);
-			if (err && xe_vm_validate_should_retry(&exec, err, &end))
-				err = -EAGAIN;
-
+			vm->validation.exec = NULL;
+			xe_validation_ctx_fini(&ctx);
 			goto out_unlock_outer;
 		}
 	}
@@ -548,7 +519,8 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	up_read(&vm->userptr.notifier_lock);
 
 out_unlock:
-	drm_exec_fini(&exec);
+	vm->validation.exec = NULL;
+	xe_validation_ctx_fini(&ctx);
 out_unlock_outer:
 	if (err == -EAGAIN) {
 		trace_xe_vm_rebind_worker_retry(vm);
@@ -1036,26 +1008,27 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
 	err = drm_exec_lock_obj(exec, xe_vm_obj(vm));
 	if (!err && bo && !bo->vm)
 		err = drm_exec_lock_obj(exec, &bo->ttm.base);
-
+	if (!err)
+		vm->validation.exec = exec;
+	
 	return err;
 }
 
 static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 {
+	struct xe_device *xe = xe_vma_vm(vma)->xe;
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
-	int err;
+	int err = 0;
 
-	drm_exec_init(&exec, 0, 0);
-	drm_exec_until_all_locked(&exec) {
+	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false) {
 		err = xe_vm_lock_vma(&exec, vma);
 		drm_exec_retry_on_contention(&exec);
 		if (XE_WARN_ON(err))
 			break;
+		xe_vma_destroy(vma, NULL);
 	}
-
-	xe_vma_destroy(vma, NULL);
-
-	drm_exec_fini(&exec);
+	xe_assert(xe, !err);
 }
 
 struct xe_vma *
@@ -2134,6 +2107,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			      u16 pat_index, unsigned int flags)
 {
 	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct xe_vma *vma;
 	int err = 0;
@@ -2141,9 +2115,9 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 	lockdep_assert_held_write(&vm->lock);
 
 	if (bo) {
-		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-		drm_exec_until_all_locked(&exec) {
-			err = 0;
+		err = 0;
+		xe_validation_guard(&ctx, &vm->xe->val, &exec,
+				    DRM_EXEC_INTERRUPTIBLE_WAIT, err, false) {
 			if (!bo->vm) {
 				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
 				drm_exec_retry_on_contention(&exec);
@@ -2152,27 +2126,34 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
 				drm_exec_retry_on_contention(&exec);
 			}
-			if (err) {
-				drm_exec_fini(&exec);
+			if (err)
 				return ERR_PTR(err);
+
+			vma = xe_vma_create(vm, bo, op->gem.offset,
+					    op->va.addr, op->va.addr +
+					    op->va.range - 1, pat_index, flags);
+			if(IS_ERR(vma))
+				return vma;
+
+			if (!bo->vm) {
+				err = add_preempt_fences(vm, bo);
+				goto out_err;
 			}
 		}
-	}
-	vma = xe_vma_create(vm, bo, op->gem.offset,
-			    op->va.addr, op->va.addr +
-			    op->va.range - 1, pat_index, flags);
-	if (IS_ERR(vma))
-		goto err_unlock;
-
-	if (xe_vma_is_userptr(vma))
-		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
-	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
-		err = add_preempt_fences(vm, bo);
+		if (err)
+			return ERR_PTR(err);
+	} else {
+		vma = xe_vma_create(vm, NULL, op->gem.offset,
+				    op->va.addr, op->va.addr +
+				    op->va.range - 1, pat_index, flags);
+		if (IS_ERR(vma))
+			return vma;
 
-err_unlock:
-	if (bo)
-		drm_exec_fini(&exec);
+		if (xe_vma_is_userptr(vma))
+			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
+	}
 
+out_err:
 	if (err) {
 		prep_vma_destroy(vm, vma, false);
 		xe_vma_destroy_unlocked(vma);
@@ -2695,7 +2676,7 @@ static int vma_lock_and_validate(struct drm_exec *exec, struct xe_vma *vma,
 		if (!bo->vm)
 			err = drm_exec_lock_obj(exec, &bo->ttm.base);
 		if (!err && validate)
-			err = xe_bo_validate(bo, xe_vma_vm(vma), true);
+			err = xe_bo_validate(bo, xe_vma_vm(vma), true, exec);
 	}
 
 	return err;
@@ -2761,7 +2742,8 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 					    false);
 		if (!err && !xe_vma_has_no_bo(vma))
 			err = xe_bo_migrate(xe_vma_bo(vma),
-					    region_to_mem_type[region]);
+					    region_to_mem_type[region],
+					    exec);
 		break;
 	}
 	default:
@@ -2782,6 +2764,7 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
 	if (err)
 		return err;
 
+	vm->validation.exec = exec;
 	list_for_each_entry(op, &vops->list, link) {
 		err = op_lock_and_prep(exec, vm, op);
 		if (err)
@@ -2871,33 +2854,33 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
 static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 				     struct xe_vma_ops *vops)
 {
+	struct xe_validation_ctx ctx;
 	struct drm_exec exec;
 	struct dma_fence *fence;
-	int err;
+	int err = 0;
 
 	lockdep_assert_held_write(&vm->lock);
 
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
-		      DRM_EXEC_IGNORE_DUPLICATES, 0);
-	drm_exec_until_all_locked(&exec) {
+	xe_validation_guard(&ctx, &vm->xe->val, &exec,
+			    DRM_EXEC_INTERRUPTIBLE_WAIT |
+			    DRM_EXEC_IGNORE_DUPLICATES, err, true) {
 		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
 		drm_exec_retry_on_contention(&exec);
+		xe_validation_retry_on_oom(&ctx, &err);
 		if (err)
-			goto unlock;
+			return err;
 
 		fence = ops_execute(vm, vops);
 		if (IS_ERR(fence)) {
 			err = PTR_ERR(fence);
 			/* FIXME: Killing VM rather than proper error handling */
 			xe_vm_kill(vm, false);
-			goto unlock;
+			return err;
 		} else {
 			vm_bind_ioctl_ops_fini(vm, vops, fence);
 		}
 	}
 
-unlock:
-	drm_exec_fini(&exec);
 	return err;
 }
 
@@ -3306,10 +3289,18 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
  */
 int xe_vm_lock(struct xe_vm *vm, bool intr)
 {
+	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
+	int ret;
+	
 	if (intr)
-		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
+		ret = dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
+	else
+		ret = dma_resv_lock(xe_vm_resv(vm), NULL);
+
+	if (!ret)
+		vm->validation.exec = exec;
 
-	return dma_resv_lock(xe_vm_resv(vm), NULL);
+	return ret;
 }
 
 /**
@@ -3320,7 +3311,8 @@ int xe_vm_lock(struct xe_vm *vm, bool intr)
  */
 void xe_vm_unlock(struct xe_vm *vm)
 {
-	dma_resv_unlock(xe_vm_resv(vm));
+	vm->validation.exec = NULL;
+	dma_resv_unlock(xe_vm_resv(vm));	
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b481608b12f1..f8964bd4529d 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -241,8 +241,6 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
 
-bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
-
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
 
 int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index ce1a63a5e3e7..8e468ced3674 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -270,6 +270,10 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+
+	struct {
+		struct drm_exec *exec;
+	} validation;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.44.0

