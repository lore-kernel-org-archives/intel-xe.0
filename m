Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541B8C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 21:10:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71B710E43E;
	Wed, 17 Jul 2024 21:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0fUVZFL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0E4610E446
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721250624; x=1752786624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PRVVjBNJm7g34kPlFlug/YFyInfk/J8Fn5jsr7kpcBk=;
 b=f0fUVZFLv45ec8oKtmkDsLEcfNKWOED7UFzM1IoqFeClgK4rO4gf0lPw
 k0cnZU4HrwZI9mgnhvbkxWw2WAvCtus/Lsavb9VZNfdmiNmL2o1/JS8xx
 ROxCLJ/w9oG3/B/FUZJIowIVcrPls+15ERmJiBWvPWXYod2/5LUMs5RbF
 XNTu4dx7A8JRgxA+AteZuvRH0Mruv1eaoWvMt+dW4quuJjdaWcfw2+eB2
 OjfjR9dMMjXl6KRdiHGs1tn9cYZeJ2aye1tW9M2ZkyCtbMj+rP+GxcMOK
 PulYHWi6bm/houl4bzSBuguOwLQdS3ShLbPQVWM++qENeHB+oayi3BC7N Q==;
X-CSE-ConnectionGUID: wD//mFQzTwmIcuOpNvEpbg==
X-CSE-MsgGUID: qYwuFJ7QTgmMgLta1I/+YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12596212"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="12596212"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:24 -0700
X-CSE-ConnectionGUID: umfriN4CSPy4yw5KcBXteQ==
X-CSE-MsgGUID: ndIPfbwoQQaFTylPiVtAYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50252669"
Received: from dut1122bmgfrd.igk.intel.com ([10.211.178.41])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 14:10:23 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH v7 6/7] drm/xe/migrate: Add kunit to test migration
 functionality for BMG
Date: Wed, 17 Jul 2024 21:10:07 +0000
Message-Id: <1d36d4377c566508e42b3fb80d3fe4a588fd00ca.1721250309.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721250309.git.akshata.jahagirdar@intel.com>
References: <cover.1721250309.git.akshata.jahagirdar@intel.com>
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

v2: Added missing bo_put()/bo_unlock() (Matt Auld)

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_migrate.c | 120 +++++++++++++++++++++++++-
 1 file changed, 119 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
index 4af27847f3fd..48bf7e831014 100644
--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
@@ -484,6 +484,94 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
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
@@ -541,7 +629,7 @@ static void test_clear(struct xe_device *xe, struct xe_tile *tile,
 static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
 				       struct kunit *test)
 {
-	struct xe_bo *sys_bo, *vram_bo;
+	struct xe_bo *sys_bo, *vram_bo = NULL, *ccs_bo = NULL;
 	unsigned int bo_flags = XE_BO_FLAG_VRAM_IF_DGFX(tile);
 	long ret;
 
@@ -569,6 +657,29 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
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
+		goto free_ccsbo;
+	}
+
+	ret = xe_bo_vmap(ccs_bo);
+	if (ret) {
+		KUNIT_FAIL(test, "Failed to vmap system bo: %li\n", ret);
+		goto free_ccsbo;
+	}
+	xe_bo_unlock(ccs_bo);
+
 	vram_bo = xe_bo_create_user(xe, NULL, NULL, SZ_4M, DRM_XE_GEM_CPU_CACHING_WC,
 				    ttm_bo_type_device, bo_flags | XE_BO_FLAG_NEEDS_CPU_ACCESS);
 	if (IS_ERR(vram_bo)) {
@@ -591,17 +702,24 @@ static void validate_ccs_test_run_tile(struct xe_device *xe, struct xe_tile *til
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
 free_vrambo:
 	xe_bo_put(vram_bo);
+free_ccsbo:
+	xe_bo_put(ccs_bo);
 free_sysbo:
 	xe_bo_put(sys_bo);
 }
-- 
2.34.1

