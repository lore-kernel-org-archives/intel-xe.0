Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDB3C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 13:34:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59CC10E422;
	Mon, 11 Dec 2023 13:34:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5DC10E40A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 13:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702301674; x=1733837674;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6d5yZKJB9dF6CELM0cBRa8bBBfss4rLZEtD6aA7ENZ4=;
 b=CA5z8oWlXJdFhGjKBXwrJ7dRXAgDIpWI79Oj3OG/VGAssPf8wOfPfSND
 5rlBSdxO6a0JXluaARlTW36D35s6+Gb2mwsH0HvKwfgc2YV+h8Nu8Asf9
 0rYzzj+u8LscaDuwxr6TiWUnUBPLBXoEfbiazuy3ExiT6V/1e9J0/O7Ea
 2jauXpoGrFvsgQN8EjQUkgUdLZzRDVcIJAozL1yJ4aGyjZzn6F9FcvLKz
 5ZibTMCuiLlgxm9TvbOb4mIBcQyfbap0Yo5G9cNn/eE307xpjOQiOdNnu
 B436uSif6UrF6GmtYipbkKZimcHz6J7JMoVuVCg0pB+wl+Ebt1XYLrxhB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="461126626"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="461126626"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 05:34:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722788084"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722788084"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 05:33:49 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v7 09/10] drm/xe/xe2: Modify xe_bo_test for system memory
Date: Mon, 11 Dec 2023 19:11:22 +0530
Message-Id: <20231211134123.1645793-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
References: <20231211134123.1645793-1-himal.prasad.ghimiray@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Modify test to valid ccs clear and copy during evict/restore on
igfx.

v2:
 -Vram is associated with tiles not with gt. Use tile based iterator
for ccs_test_run_gt. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 44 ++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 549ab343de80..412b2e7ce40c 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -14,7 +14,7 @@
 #include "xe_pci.h"
 #include "xe_pm.h"
 
-static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
+static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
 			    bool clear, u64 get_val, u64 assign_val,
 			    struct kunit *test)
 {
@@ -36,7 +36,7 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
 
 	/* Optionally clear bo *and* CCS data in VRAM. */
 	if (clear) {
-		fence = xe_migrate_clear(gt_to_tile(gt)->migrate, bo, bo->ttm.resource);
+		fence = xe_migrate_clear(tile->migrate, bo, bo->ttm.resource);
 		if (IS_ERR(fence)) {
 			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
 			return PTR_ERR(fence);
@@ -91,7 +91,7 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
 	}
 
 	/* Check last CCS value, or at least last value in page. */
-	offset = xe_device_ccs_bytes(gt_to_xe(gt), bo->size);
+	offset = xe_device_ccs_bytes(tile_to_xe(tile), bo->size);
 	offset = min_t(u32, offset, PAGE_SIZE) / sizeof(u64) - 1;
 	if (cpu_map[offset] != get_val) {
 		KUNIT_FAIL(test,
@@ -108,39 +108,45 @@ static int ccs_test_migrate(struct xe_gt *gt, struct xe_bo *bo,
 	return ret;
 }
 
-static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
-			    struct kunit *test)
+static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
+			      struct kunit *test)
 {
 	struct xe_bo *bo;
-	u32 vram_bit;
+
 	int ret;
 
 	/* TODO: Sanity check */
-	vram_bit = XE_BO_CREATE_VRAM0_BIT << gt_to_tile(gt)->id;
-	kunit_info(test, "Testing gt id %u vram id %u\n", gt->info.id,
-		   gt_to_tile(gt)->id);
+	unsigned int bo_flags = XE_BO_CREATE_VRAM_IF_DGFX(tile);
+
+	if (IS_DGFX(xe))
+		kunit_info(test, "Testing vram id %u\n", tile->id);
+	else
+		kunit_info(test, "Testing system memory\n");
+
+	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
+			       ttm_bo_type_device, bo_flags);
+
+	xe_bo_lock(bo, false);
 
-	bo = xe_bo_create_locked(xe, NULL, NULL, SZ_1M, ttm_bo_type_device,
-				 vram_bit);
 	if (IS_ERR(bo)) {
 		KUNIT_FAIL(test, "Failed to create bo.\n");
 		return;
 	}
 
 	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
-	ret = ccs_test_migrate(gt, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
+	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
 			       test);
 	if (ret)
 		goto out_unlock;
 
 	kunit_info(test, "Verifying that CCS data survives migration.\n");
-	ret = ccs_test_migrate(gt, bo, false, 0xdeadbeefdeadbeefULL,
+	ret = ccs_test_migrate(tile, bo, false, 0xdeadbeefdeadbeefULL,
 			       0xdeadbeefdeadbeefULL, test);
 	if (ret)
 		goto out_unlock;
 
 	kunit_info(test, "Verifying that CCS data can be properly cleared.\n");
-	ret = ccs_test_migrate(gt, bo, true, 0ULL, 0ULL, test);
+	ret = ccs_test_migrate(tile, bo, true, 0ULL, 0ULL, test);
 
 out_unlock:
 	xe_bo_unlock(bo);
@@ -150,7 +156,7 @@ static void ccs_test_run_gt(struct xe_device *xe, struct xe_gt *gt,
 static int ccs_test_run_device(struct xe_device *xe)
 {
 	struct kunit *test = xe_cur_kunit();
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	int id;
 
 	if (!xe_device_has_flat_ccs(xe)) {
@@ -160,8 +166,12 @@ static int ccs_test_run_device(struct xe_device *xe)
 
 	xe_device_mem_access_get(xe);
 
-	for_each_gt(gt, xe, id)
-		ccs_test_run_gt(xe, gt, test);
+	for_each_tile(tile, xe, id) {
+		/* For igfx run only for primary tile */
+		if (!IS_DGFX(xe) && id > 0)
+			continue;
+		ccs_test_run_tile(xe, tile, test);
+	}
 
 	xe_device_mem_access_put(xe);
 
-- 
2.25.1

