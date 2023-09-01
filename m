Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE9ACA0FE5
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 14:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1501710E7F7;
	Fri,  1 Sep 2023 14:28:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F7F10E7F3
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693578534; x=1725114534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUXw6mynchZ2L0Xp1HeKJI7pI5toRmZ+d7/cnmMN4fU=;
 b=L54VPgthkvLm32umVJamPvR6FSmPMstzFfC6TtrCSRXH7NQZwIGIqqir
 zduIMvEzhGTd5ttRzFXf1uFCQHHlbI9WrRUejzo94ScH/rngnxdP2Pwps
 7fLkltDPC81W27FctsNIgLND6sKi/oXVWiF6u4dLg1NFZrh9ZUEFbNJCL
 JEoZRp3mNz3855r3zV3IFxI4KJS2iHrjKnjBRdIMQR86svt5Jr04B0i+3
 tXd53ANH81ofSYRXVA4f3WXsRUOROjhtnjWKrygArrMM9+aAY8SwTaXmo
 S+oxzCFlp8zcnPPhjpb5SXIz5WValtHsQzH/NfVhShkokF5RebcwGqRwI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373626408"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="373626408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:28:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805448892"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="805448892"
Received: from baruchrx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.6.81])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:28:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 15:28:26 +0100
Message-ID: <20230901142824.316711-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901142824.316711-3-matthew.auld@intel.com>
References: <20230901142824.316711-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/xe/selftests: make eviction test tile
 centric
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
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

The concern here is that we may have platforms with dedicated media GT,
and we anyway allocate the object on the tile, which just means running
the same test twice (i.e primary vs media GT).

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index 0e4ec22c5667..c448b00a569c 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -174,18 +174,18 @@ void xe_ccs_migrate_kunit(struct kunit *test)
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ccs_migrate_kunit);
 
-static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kunit *test)
+static int evict_test_run_tile(struct xe_device *xe, struct xe_tile *tile, struct kunit *test)
 {
 	struct xe_bo *bo, *external;
 	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
-		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
+		XE_BO_CREATE_VRAM_IF_DGFX(tile);
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
 	struct ww_acquire_ctx ww;
 	struct xe_gt *__gt;
 	int err, i, id;
 
-	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
-		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
+	kunit_info(test, "Testing device %s vram id %u\n",
+		   dev_name(xe->drm.dev), tile->id);
 
 	for (i = 0; i < 2; ++i) {
 		xe_vm_lock(vm, &ww, 0, false);
@@ -316,7 +316,7 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 static int evict_test_run_device(struct xe_device *xe)
 {
 	struct kunit *test = xe_cur_kunit();
-	struct xe_gt *gt;
+	struct xe_tile *tile;
 	int id;
 
 	if (!IS_DGFX(xe)) {
@@ -327,8 +327,8 @@ static int evict_test_run_device(struct xe_device *xe)
 
 	xe_device_mem_access_get(xe);
 
-	for_each_gt(gt, xe, id)
-		evict_test_run_gt(xe, gt, test);
+	for_each_tile(tile, xe, id)
+		evict_test_run_tile(xe, tile, test);
 
 	xe_device_mem_access_put(xe);
 
-- 
2.41.0

