Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00EBC3DA50
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jul 2024 09:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21B010E9D5;
	Thu, 11 Jul 2024 09:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FifizY4k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6308C10E9D7
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jul 2024 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720689541; x=1752225541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XQYj/d9YMO25aO04I++ey1oW9N5gvqBpxSPeIc9+z3s=;
 b=FifizY4kgdjlMSxe9ksApl5ACLcImG0QVDy9tPXmISkhfOEucJe4UnGV
 zl6c1za1IF0xrfhcIOeRPy3WswPhle5mPXEAl9Tqq4oZeF9f1En5H7VS4
 61+BqNV5yFP9kFCqD16NAvKx6hlBZ7WTeGrx0gEiiva8uh0vIdm1EFxyz
 Fk3huWefnXOYs/l60RKI8mkEo8YwFX25Gn5al/dEBe7qoat19pVl9KOF4
 6CpwOHyPbjY0htwrwXf4kSmnY5MZ7XzjG5lByp0rNfz2dDeGCKVzsK5sI
 i0C0npZwq6T6KLS/bpD/qBX1s5R6SSvALepwKVzN+QtYf3cfdAy6XKu6b Q==;
X-CSE-ConnectionGUID: c/8I0h8rQimZ5NrbmyLbUQ==
X-CSE-MsgGUID: f+qUPwBgSnerxKi6c919wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17671953"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17671953"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:35 -0700
X-CSE-ConnectionGUID: 7ilzZUrQQaWRLUmv96vE5A==
X-CSE-MsgGUID: uZ2C+EUaTSah7z7iQ1tFzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="79210105"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:18:33 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com, matthew.auld@intel.com,
 himal.prasad.ghimiray@intel.com, lucas.demarchi@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH 5/6] drm/xe/migrate: Add kunit to test migration functionality
 for BMG
Date: Thu, 11 Jul 2024 09:18:18 +0000
Message-Id: <285b9c093ea9d24f0f26312bfe6233f4fc1f5720.1720689220.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720689220.git.akshata.jahagirdar@intel.com>
References: <cover.1720689220.git.akshata.jahagirdar@intel.com>
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

This part of kunit verifies that
- main data is decompressed and ccs data is clear post bo eviction.
- main data is raw copied and ccs data is clear post bo restore.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 120 +++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 6538c0e6b57e..97a8383a9c5a 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -482,6 +482,95 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
 	return fence;
 }
 
+static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
+				struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct xe_bo *ccs_bo,
+				struct kunit *test)
+{
+	struct dma_fence *fence;
+	u64 expected, retval;
+	long timeout;
+	long ret;
+
+	expected = 0xd0d0d0d0d0d0d0d0;
+	xe_map_memset(xe, &sys_bo->vmap, 0, 0xd0, sys_bo->size);
+
+	fence = blt_copy(tile, sys_bo, vram_bo, false, "Blit copy from sysmem to vram", test);
+	if (!sanity_fence_failed(xe, fence, "Blit copy from sysmem to vram", test)) {
+		retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
+		if (retval == expected)
+			KUNIT_FAIL(test, "Sanity check failed: VRAM must have compressed value\n");
+	}
+	dma_fence_put(fence);
+
+
+	kunit_info(test, "Evict vram buffer object\n");
+	ret = xe_bo_evict(vram_bo, true);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to evict bo.\n");
+		return;
+	}
+
+	ret = xe_bo_vmap(vram_bo);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
+		return;
+	}
+
+	retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
+	check(retval, expected, "Clear evicted vram data first value", test);
+	retval = xe_map_rd(xe, &vram_bo->vmap, vram_bo->size-8, u64);
+	check(retval, expected, "Clear evicted vram data last value", test);
+
+	fence = blt_copy(tile, vram_bo, ccs_bo,
+				true, "Blit surf copy from vram to sysmem", test);
+	if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", test)) {
+		retval = xe_map_rd(xe, &ccs_bo->vmap, 0, u64);
+		check(retval, 0, "Clear ccs data first value", test);
+
+		retval = xe_map_rd(xe, &ccs_bo->vmap, ccs_bo->size - 8, u64);
+		check(retval, 0, "Clear ccs data last value", test);
+	}
+	dma_fence_put(fence);
+
+	kunit_info(test, "Restore vram buffer object\n");
+	ret = xe_bo_validate(vram_bo, NULL, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to validate vram bo for: %li\n", ret);
+		return;
+	}
+
+	/* Sync all migration blits */
+	timeout = dma_resv_wait_timeout(vram_bo->ttm.base.resv,
+					DMA_RESV_USAGE_KERNEL,
+					true,
+					5 * HZ);
+	if (timeout <= 0) {
+		KUNIT_FAIL(test, "Failed to sync bo eviction.\n");
+		return;
+	}
+
+	ret = xe_bo_vmap(vram_bo);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to vmap vram bo: %li\n", ret);
+		return;
+	}
+
+	retval = xe_map_rd(xe, &vram_bo->vmap, 0, u64);
+	check(retval, expected, "Restored value must be equal to initial value", test);
+	retval = xe_map_rd(xe, &vram_bo->vmap, vram_bo->size-8, u64);
+	check(retval, expected, "Restored value must be equal to initial value", test);
+
+	fence = blt_copy(tile, vram_bo, ccs_bo,
+				true, "Blit surf copy from vram to sysmem", test);
+	if (!sanity_fence_failed(xe, fence, "Clear ccs buffer data", test)) {
+		retval = xe_map_rd(xe, &ccs_bo->vmap, 0, u64);
+		check(retval, 0, "Clear ccs data first value", test);
+		retval = xe_map_rd(xe, &ccs_bo->vmap, ccs_bo->size - 8, u64);
+		check(retval, 0, "Clear ccs data last value", test);
+	}
+	dma_fence_put(fence);
+}
+
 static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 			struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct kunit *test)
 {
@@ -535,7 +624,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 
 static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
 {
-	struct xe_bo *sys_bo, *vram_bo;
+	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	long ret;
 
@@ -562,6 +651,29 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 	xe_bo_unlock(sys_bo);
 
+	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
+			ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
+
+	if (IS_ERR(ccs_bo)) {
+		KUNIT_FAIL(test, "xe_bo_create() failed with err=%ld\n",
+			   PTR_ERR(ccs_bo));
+		return;
+	}
+
+	xe_bo_lock(ccs_bo, false);
+	ret = xe_bo_validate(ccs_bo, NULL, false);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to validate system bo for: %li\n", ret);
+		goto out_unlock;
+	}
+
+	ret = xe_bo_vmap(ccs_bo);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
+		goto out_unlock;
+	}
+	xe_bo_unlock(ccs_bo);
+
 	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
 			       ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(vram_bo)) {
@@ -584,17 +696,23 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 
 	test_clear(xe, tile, sys_bo, vram_bo, test);
+	test_migrate(xe, tile, sys_bo, vram_bo, ccs_bo, test);
 	xe_bo_unlock(vram_bo);
 
 	xe_bo_lock(vram_bo, false);
 	xe_bo_vunmap(vram_bo);
 	xe_bo_unlock(vram_bo);
 
+	xe_bo_lock(ccs_bo, false);
+	xe_bo_vunmap(ccs_bo);
+	xe_bo_unlock(ccs_bo);
+
 	xe_bo_lock(sys_bo, false);
 	xe_bo_vunmap(sys_bo);
 	xe_bo_unlock(sys_bo);
 out_unlock:
 	xe_bo_put(vram_bo);
+	xe_bo_put(ccs_bo);
 	xe_bo_put(sys_bo);
 }
 
-- 
2.34.1

