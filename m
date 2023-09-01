Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD71CA0FE4
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 14:28:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CC510E7F3;
	Fri,  1 Sep 2023 14:28:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DAB10E7F3
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Sep 2023 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693578533; x=1725114533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WeAong9jAd8CSaVV41B8sfJGYNhsrGTH1lhH0h2XiXA=;
 b=NtyUY838kE6mX1mLKMj5xwN/hkjr30FvFk+8shWU/Z3/OAWYGl4gl45Q
 cy3Hbv+1JdM9eb4fq4yrQmyCC8UBqlTHUD0LqhPv9HFzdUUZGOBGsNQkv
 /GgUuO4EfEwzDTbjjENZlSGGowzBHgZ5fCB7WCl0yLREFGIAtL80DwcRq
 SazqEGZhvEEIpU9Bek8Wv6ustTS6YHwLX+BEfjiHgwDjFjXRogpITN4eF
 ejXJDvRT51DWQeJeARep72ZampbUU0CBVNVaGXghU8L/W7vVn61M6TcHY
 N7wLCNAJD8a1ByYN2W0NDim0h9CzKrlz4U/55/HfOhv2BGUU0O7epIXJ3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="373626407"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="373626407"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="805448883"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="805448883"
Received: from baruchrx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.6.81])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 07:28:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri,  1 Sep 2023 15:28:25 +0100
Message-ID: <20230901142824.316711-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe/selftests: consider multi-GT for
 eviction test
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

We need to sanitize and reset each GT, since xe_bo_evict_all() will
evict everything regardless of GT, which can leave other GTs in a broken
state.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_bo.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
index b32a9068d76c..0e4ec22c5667 100644
--- a/drivers/gpu/drm/xe/tests/xe_bo.c
+++ b/drivers/gpu/drm/xe/tests/xe_bo.c
@@ -181,7 +181,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 		XE_BO_CREATE_VRAM_IF_DGFX(gt_to_tile(gt));
 	struct xe_vm *vm = xe_migrate_get_vm(xe_device_get_root_tile(xe)->migrate);
 	struct ww_acquire_ctx ww;
-	int err, i;
+	struct xe_gt *__gt;
+	int err, i, id;
 
 	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
 		   dev_name(xe->drm.dev), gt->info.id, gt_to_tile(gt)->id);
@@ -218,7 +219,8 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 			goto cleanup_all;
 		}
 
-		xe_gt_sanitize(gt);
+		for_each_gt(__gt, xe, id)
+			xe_gt_sanitize(__gt);
 		err = xe_bo_restore_kernel(xe);
 		/*
 		 * Snapshotting the CTB and copying back a potentially old
@@ -231,8 +233,10 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
 		 * however seems quite fragile not to also restart the GT. Try
 		 * to do that here by triggering a GT reset.
 		 */
-		xe_gt_reset_async(gt);
-		flush_work(&gt->reset.worker);
+		for_each_gt(__gt, xe, id) {
+			xe_gt_reset_async(__gt);
+			flush_work(&__gt->reset.worker);
+		}
 		if (err) {
 			KUNIT_FAIL(test, "restore kernel err=%pe\n",
 				   ERR_PTR(err));
-- 
2.41.0

