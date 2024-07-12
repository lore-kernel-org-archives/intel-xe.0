Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE09C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 06:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5F210EC10;
	Fri, 12 Jul 2024 06:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a14LcbBe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BF910EC0E
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720766381; x=1752302381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4rsSu8ni/XYdu79yBAfujw9R3eseZ6dumGwgIlE1DfU=;
 b=a14LcbBez2h9IMd3hy5qv06K+I55gjtEA59eA7u/4DSvzHlwO/yacRwG
 cWI7mdkNuWTFfbhkdV1K3exI53MiG7pMJrKuZh1VfCUUQGbD1n2KlIqFG
 GuZ+9nb+1sfYGEVJIN8Js5WqjgR9pahGVtjLb1I9VGhI7ChkzgqCMNOHO
 saqvA5tvoiU2JtRrfksP5xsjB//Wt1/ixAGb4Y8tekX/4A1A4NidEehjG
 DJbPu7n4WCdBe9/AwdAxlLOO5wVfXuGdKHmEpG2lKzH687DLH/tDie9zD
 Z3QVMcE4CTOL2s7B5PGuXvVHY/qUGwaGVAWB9jQJ0bniYHUan7CIkFwbC g==;
X-CSE-ConnectionGUID: C6tMLJnkS6mWNiRklA4QVA==
X-CSE-MsgGUID: VxIbc03tQ/O3auyfCXfSiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35623934"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="35623934"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:40 -0700
X-CSE-ConnectionGUID: kgFuZbqUTwm2ExKTHODSPg==
X-CSE-MsgGUID: RUoKW9kqSNyylkmcKWTdYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="49472863"
Received: from dut1103bmgfrd.igk.intel.com ([10.211.177.128])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 23:39:39 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 5/6] drm/xe/migrate: Add kunit to test migration functionality
 for BMG
Date: Fri, 12 Jul 2024 06:39:24 +0000
Message-Id: <2a079df2f60e35fc75f46addbe8841cb85f71737.1720766122.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720766122.git.akshata.jahagirdar@intel.com>
References: <cover.1720766122.git.akshata.jahagirdar@intel.com>
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

From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>

This part of kunit verifies that
- main data is decompressed and ccs data is clear post bo eviction.
- main data is raw copied and ccs data is clear post bo restore.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 119 +++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 0c9a30dac46d..e810d64b9e31 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -481,6 +481,94 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
 	return fence;
 }
 
+static void test_migrate(struct xe_device *xe, struct xe_tile *tile,
+			 struct xe_bo *sys_bo, struct xe_bo *vram_bo, struct xe_bo *ccs_bo,
+			 struct kunit *test)
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
+	retval = xe_map_rd(xe, &vram_bo->vmap, vram_bo->size - 8, u64);
+	check(retval, expected, "Clear evicted vram data last value", test);
+
+	fence = blt_copy(tile, vram_bo, ccs_bo,
+			 true, "Blit surf copy from vram to sysmem", test);
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
+	retval = xe_map_rd(xe, &vram_bo->vmap, vram_bo->size - 8, u64);
+	check(retval, expected, "Restored value must be equal to initial value", test);
+
+	fence = blt_copy(tile, vram_bo, ccs_bo,
+			 true, "Blit surf copy from vram to sysmem", test);
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
@@ -535,7 +623,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 				       struct kunit *test)
 {
-	struct xe_bo *sys_bo, *vram_bo;
+	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	long ret;
 
@@ -563,6 +651,29 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
 	}
 	xe_bo_unlock(sys_bo);
 
+	ccs_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
+				   ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
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
@@ -585,17 +696,23 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
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
 out_put:
 	xe_bo_put(vram_bo);
+	xe_bo_put(ccs_bo);
 	xe_bo_put(sys_bo);
 }
 
-- 
2.34.1

