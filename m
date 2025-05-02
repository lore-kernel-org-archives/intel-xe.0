Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F548C3ABB2
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 09:35:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C806E10E8E4;
	Fri,  2 May 2025 09:35:31 +0000 (UTC)
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9D210E36C
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 09:35:24 +0000 (UTC)
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH 1/4] drm/xe: Simplify migration kunit tests
Date: Fri,  2 May 2025 11:35:10 +0200
Message-ID: <20250502093514.510621-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502093514.510621-1-dev@lankhorst.se>
References: <20250502093514.510621-1-dev@lankhorst.se>
MIME-Version: 1.0
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

Create a macro for creating a pinned user bo, similar to
xe_bo_create_pin_map,
and use the same destructor, xe_bo_unpin_map_no_vm to destroy.

This reduces the amount of churn in the tests, and makes
it easier to read and add more.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 174 +++++++++++---------------
 1 file changed, 72 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 4a65e3103f77b..12a3318b1a5d5 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -333,9 +333,9 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
 	xe_bo_vunmap(m->pt_bo);
 }
 
-static int migrate_test_run_device(struct xe_device *xe)
+static void xe_migrate_sanity_kunit(struct kunit *test)
 {
-	struct kunit *test = kunit_get_current_test();
+	struct xe_device *xe = test->priv;
 	struct xe_tile *tile;
 	int id;
 
@@ -351,15 +351,6 @@ static int migrate_test_run_device(struct xe_device *xe)
 	}
 
 	xe_pm_runtime_put(xe);
-
-	return 0;
-}
-
-static void xe_migrate_sanity_kunit(struct kunit *test)
-{
-	struct xe_device *xe = test->priv;
-
-	migrate_test_run_device(xe);
 }
 
 static struct dma_fence *blt_copy(struct xe_tile *tile,
@@ -511,7 +502,7 @@ static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
 	kunit_info(test, "Evict vram buffer object\n");
 	ret = xe_bo_evict(vram_bo);
 	if (ret) {
-		KUNIT_FAIL(test, "Failed to evict bo.\n");
+		KUNIT_FAIL(test, "Failed to evict bo: %pe.\n", ERR_PTR(ret));
 		return;
 	}
 
@@ -631,124 +622,112 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 	dma_fence_put(fence);
 }
 
-static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
-				       struct kunit *test)
+static struct xe_bo *migratable_bo_create_pin_map(struct kunit *test, struct xe_device *xe, struct xe_vm *vm, u64 size, u32 caching, u32 flags)
 {
-	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
-	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
-	long ret;
-
-	sys_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
-				   DRM_XE_GEM_CPU_CACHING_WC,
-				   XE_BO_FLAG_SYSTEM |
-				   XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED);
+	struct xe_bo *bo = xe_bo_create_user(xe, NULL, vm, size, caching, flags | XE_BO_FLAG_PINNED);
+	int ret;
 
-	if (IS_ERR(sys_bo)) {
-		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
-			   PTR_ERR(sys_bo));
-		return;
+	if (IS_ERR(bo)) {
+		KUNIT_FAIL(test, "xe_bo_create_user(%x) failed with err=%ld\n",
+			   flags, PTR_ERR(bo));
+		return bo;
 	}
 
-	xe_bo_lock(sys_bo, false);
-	ret = xe_bo_validate(sys_bo, NULL, false);
-	if (ret) {
-		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
-		goto free_sysbo;
-	}
+	if (!vm)
+		xe_bo_lock(bo, false);
 
-	ret = xe_bo_vmap(sys_bo);
+	ret = xe_bo_validate(bo, NULL, false);
 	if (ret) {
-		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
-		goto free_sysbo;
+		KUNIT_FAIL(test, "Failed to validate bo(%x) for: %i\n", flags, ret);
+		goto out_unlock;
 	}
-	xe_bo_unlock(sys_bo);
 
-	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
-				   DRM_XE_GEM_CPU_CACHING_WC,
-				   bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				   XE_BO_FLAG_PINNED);
+	ttm_bo_pin(&bo->ttm);
 
-	if (IS_ERR(ccs_bo)) {
-		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
-			   PTR_ERR(ccs_bo));
-		return;
-	}
-
-	xe_bo_lock(ccs_bo, false);
-	ret = xe_bo_validate(ccs_bo, NULL, false);
+	if (flags & XE_BO_FLAG_NEEDS_CPU_ACCESS)
+		ret = xe_bo_vmap(bo);
 	if (ret) {
-		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
-		goto free_ccsbo;
+		KUNIT_FAIL(test, "Failed to vmap bo(%x): %i\n", flags, ret);
+		ttm_bo_unpin(&bo->ttm);
 	}
 
-	ret = xe_bo_vmap(ccs_bo);
+out_unlock:
+	if (!vm)
+		xe_bo_unlock(bo);
 	if (ret) {
-		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
-		goto free_ccsbo;
+		xe_bo_put(bo);
+		bo = ERR_PTR(ret);
 	}
-	xe_bo_unlock(ccs_bo);
+	return bo;
+}
+
+static void bo_unpin_map_user(struct xe_bo *bo)
+{
+	if (!bo->vm)
+		xe_bo_lock(bo, false);
+	ttm_bo_set_bulk_move(&bo->ttm, NULL);
+	ttm_bo_unpin(&bo->ttm);
+	if (!bo->vm)
+		xe_bo_unlock(bo);
+	xe_bo_put(bo);
+}
 
-	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M,
-				    DRM_XE_GEM_CPU_CACHING_WC,
-				    bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS |
-				    XE_BO_FLAG_PINNED);
-	if (IS_ERR(vram_bo)) {
-		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
-			   PTR_ERR(vram_bo));
+static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
+				       struct kunit *test)
+{
+	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
+	unsigned int bo_flags =
+		XE_BO_FLAG_VRAM_IF_DGFX(tile) | XE_BO_FLAG_NEEDS_CPU_ACCESS;
+
+	sys_bo = migratable_bo_create_pin_map(test, xe, NULL, SZ_4M,
+					      DRM_XE_GEM_CPU_CACHING_WC,
+					      XE_BO_FLAG_SYSTEM |
+					      XE_BO_FLAG_NEEDS_CPU_ACCESS);
+	if (IS_ERR(sys_bo))
 		return;
-	}
 
-	xe_bo_lock(vram_bo, false);
-	ret = xe_bo_validate(vram_bo, NULL, false);
-	if (ret) {
-		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
-		goto free_vrambo;
-	}
+	ccs_bo = migratable_bo_create_pin_map(test, xe, NULL, SZ_4M,
+					      DRM_XE_GEM_CPU_CACHING_WC,
+					      bo_flags);
+	if (IS_ERR(ccs_bo))
+		goto free_sysbo;
 
-	ret = xe_bo_vmap(vram_bo);
-	if (ret) {
-		KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
-		goto free_vrambo;
-	}
+	vram_bo = migratable_bo_create_pin_map(test, xe, NULL, SZ_4M,
+					       DRM_XE_GEM_CPU_CACHING_WC,
+					       bo_flags);
+	if (IS_ERR(vram_bo))
+		goto free_ccsbo;
 
+	xe_bo_lock(vram_bo, false);
 	test_clear(xe, tile, sys_bo, vram_bo, test);
-	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
-	xe_bo_unlock(vram_bo);
 
-	xe_bo_lock(vram_bo, false);
-	xe_bo_vunmap(vram_bo);
+	/* For migration test needs to be unpinned */
+	ttm_bo_unpin(&vram_bo->ttm);
+	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
+	ttm_bo_pin(&vram_bo->ttm);
 	xe_bo_unlock(vram_bo);
 
-	xe_bo_lock(ccs_bo, false);
-	xe_bo_vunmap(ccs_bo);
-	xe_bo_unlock(ccs_bo);
-
-	xe_bo_lock(sys_bo, false);
-	xe_bo_vunmap(sys_bo);
-	xe_bo_unlock(sys_bo);
-free_vrambo:
-	xe_bo_put(vram_bo);
+	bo_unpin_map_user(vram_bo);
 free_ccsbo:
-	xe_bo_put(ccs_bo);
+	bo_unpin_map_user(ccs_bo);
 free_sysbo:
-	xe_bo_put(sys_bo);
+	bo_unpin_map_user(sys_bo);
 }
 
-static int validate_ccs_test_run_device(struct xe_device *xe)
+static void xe_validate_ccs_kunit(struct kunit *test)
 {
-	struct kunit *test = kunit_get_current_test();
+	struct xe_device *xe = test->priv;
 	struct xe_tile *tile;
 	int id;
 
 	if (!xe_device_has_flat_ccs(xe)) {
 		kunit_skip(test, "non-flat-ccs device\n");
-		return 0;
+		return;
 	}
 
 	if (!(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe))) {
 		kunit_skip(test, "non-xe2 discrete device\n");
-		return 0;
+		return;
 	}
 
 	xe_pm_runtime_get(xe);
@@ -757,15 +736,6 @@ static int validate_ccs_test_run_device(struct xe_device *xe)
 		validate_ccs_test_run_tile(xe, tile, test);
 
 	xe_pm_runtime_put(xe);
-
-	return 0;
-}
-
-static void xe_validate_ccs_kunit(struct kunit *test)
-{
-	struct xe_device *xe = test->priv;
-
-	validate_ccs_test_run_device(xe);
 }
 
 static struct kunit_case xe_migrate_tests[] = {
-- 
2.45.2

