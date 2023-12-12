Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6502C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 18:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7833F10E679;
	Tue, 12 Dec 2023 18:18:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC2710E679
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702405080; x=1733941080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6d5yZKJB9dF6CELM0cBRa8bBBfss4rLZEtD6aA7ENZ4=;
 b=VSI9985lF+JYzh+8qAakNF5nGGb+F18EoQMYxvG1UFP21iG72Fk1fS5J
 cvERVdoeHD5HkuZn0pHwIGzJuLTkf1PugJ85amKnRd3Rq2sbAr6J0pqFu
 88uvUvobb2BYDt2S0mpcvPYooCTgdAC+fQKz0zefQrCwtVrtONXf8XA8x
 sPQ7ZsavfqF+VpWIbacNjt59b5l2LmBJAA6DTu7zHpnrE6I/vpdJEnSkL
 A82+2+7/nzz88HwZCnK6p0gVPvG10jwCrypBMehX49RRPHc+IGQ1dc5Gt
 qsiLtGwwN4dYnSfJKrxcL93TsVej+Qnp6AWpDQfsoO3lHaAeLWiIcXJkw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="425968039"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="425968039"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 10:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749806446"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; d="scan'208";a="749806446"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 10:17:58 -0800
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 09/10] drm/xe/xe2: Modify xe_bo_test for system memory
Date: Tue, 12 Dec 2023 23:55:32 +0530
Message-Id: <20231212182533.1722705-10-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
References: <20231212182533.1722705-1-himal.prasad.ghimiray@intel.com>
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

