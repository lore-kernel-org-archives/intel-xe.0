Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BB2C47258
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 11:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EC010F89C;
	Thu, 25 Jan 2024 11:11:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A2E10F8AC
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jan 2024 11:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706181079; x=1737717079;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c4wZ9sMdHf7ogf/sFKqVJNfNl2zzyP1IT2AApCX3dXw=;
 b=Lih9hFPi02n9ZgCB/3ybFVwLz5i0u22GgE8CX3cNroEutrXUg7qC/PKl
 530uromt++rOiyUS1jRAbSfM7WNulytkSXv+HMgYA8I7gMCXghKEd8RQl
 B/9ArRCJvFgc396BJXPgdLuQb8tjhdLmVj+eHPDvHxPOefKsNXr/6kWev
 Bsq4KP8s2qP1hGAY9TTFeVGk2/AapbEcsOTi5PZuofJwZ3GXN7HHQ4TQA
 hk3lLefNrhCekdD+2B/y0ZOh2bv/xVYMpU+ZW9ZNMqXFCIwWcrnnWJ8jg
 M0kwWhRl7/u+htPwhoa85F93B4CK7Hqok7Mj7v3yOlpnNnDF86sRTDNmU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9510270"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9510270"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 03:11:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="21030435"
Received: from rahul-super-server.iind.intel.com ([10.145.169.69])
 by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2024 03:11:15 -0800
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com, anshuman.gupta@intel.com
Subject: [PATCH] drm/xe: Add xe mocs suspend resume kunit
Date: Thu, 25 Jan 2024 16:46:37 +0530
Message-Id: <20240125111637.3476519-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This kunit verifies the mocs register content with
the KMD programmed values before and after suspend resume.
Add helper function to check mocs values and use it.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c      | 53 +++++++++++++++++++------
 drivers/gpu/drm/xe/tests/xe_mocs_test.c |  1 +
 drivers/gpu/drm/xe/tests/xe_mocs_test.h |  1 +
 3 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index df5c36b70ab4..a36f804e5ce0 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -103,6 +103,14 @@ static void read_mocs_table(struct xe_gt *gt,
 	xe_device_mem_access_put(gt_to_xe(gt));
 }
 
+static void check_mocs_table(struct xe_gt *gt, struct live_mocs *mocs, unsigned int flags)
+{
+	if (flags & HAS_GLOBAL_MOCS)
+		read_mocs_table(gt, &(mocs->table));
+	if (flags & HAS_LNCF_MOCS)
+		read_l3cc_table(gt, &(mocs->table));
+}
+
 static int mocs_kernel_test_run_device(struct xe_device *xe)
 {
 	/* Basic check the system is configured with the expected mocs table */
@@ -115,10 +123,7 @@ static int mocs_kernel_test_run_device(struct xe_device *xe)
 
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
-		if (flags & HAS_GLOBAL_MOCS)
-			read_mocs_table(gt, &mocs.table);
-		if (flags & HAS_LNCF_MOCS)
-			read_l3cc_table(gt, &mocs.table);
+		check_mocs_table(gt, &mocs, flags);
 	}
 	return 0;
 }
@@ -142,19 +147,13 @@ static int mocs_reset_test_run_device(struct xe_device *xe)
 	for_each_gt(gt, xe, id) {
 		flags = live_mocs_init(&mocs, gt);
 		kunit_info(test, "mocs_reset_test before reset\n");
-		if (flags & HAS_GLOBAL_MOCS)
-			read_mocs_table(gt, &mocs.table);
-		if (flags & HAS_LNCF_MOCS)
-			read_l3cc_table(gt, &mocs.table);
+		check_mocs_table(gt, &mocs, flags);
 
 		xe_gt_reset_async(gt);
 		flush_work(&gt->reset.worker);
 
 		kunit_info(test, "mocs_reset_test after reset\n");
-		if (flags & HAS_GLOBAL_MOCS)
-			read_mocs_table(gt, &mocs.table);
-		if (flags & HAS_LNCF_MOCS)
-			read_l3cc_table(gt, &mocs.table);
+		check_mocs_table(gt, &mocs, flags);
 	}
 	return 0;
 }
@@ -164,3 +163,33 @@ void xe_live_mocs_reset_kunit(struct kunit *test)
 	xe_call_for_each_device(mocs_reset_test_run_device);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
+
+static int mocs_suspend_resume_test_run_device(struct xe_device *xe)
+{
+	/* Check the mocs setup is retained over suspend resume */
+
+	struct live_mocs mocs;
+	struct xe_gt *gt;
+	unsigned int flags;
+	int id;
+	struct kunit *test = xe_cur_kunit();
+
+	for_each_gt(gt, xe, id) {
+		flags = live_mocs_init(&mocs, gt);
+		kunit_info(test, "mocs_suspend_resume_test before suspend resume\n");
+		check_mocs_table(gt, &mocs, flags);
+
+		xe_gt_suspend(gt);
+		xe_gt_resume(gt);
+
+		kunit_info(test, "mocs_suspend_resume_test after suspend resume\n");
+		check_mocs_table(gt, &mocs, flags);
+	}
+	return 0;
+}
+
+void xe_live_mocs_suspend_resume_kunit(struct kunit *test)
+{
+	xe_call_for_each_device(mocs_suspend_resume_test_run_device);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_suspend_resume_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
index 4f62e7a4270b..0d813472cdd3 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
@@ -10,6 +10,7 @@
 static struct kunit_case xe_mocs_tests[] = {
 	KUNIT_CASE(xe_live_mocs_kernel_kunit),
 	KUNIT_CASE(xe_live_mocs_reset_kunit),
+	KUNIT_CASE(xe_live_mocs_suspend_resume_kunit),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
index e7699d495411..117164cc0df7 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
@@ -10,5 +10,6 @@ struct kunit;
 
 void xe_live_mocs_kernel_kunit(struct kunit *test);
 void xe_live_mocs_reset_kunit(struct kunit *test);
+void xe_live_mocs_suspend_resume_kunit(struct kunit *test);
 
 #endif
-- 
2.25.1

