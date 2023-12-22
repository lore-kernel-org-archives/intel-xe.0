Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B503C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 19:21:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED98010E821;
	Fri, 22 Dec 2023 19:21:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CCC10E830
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 19:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703272891; x=1734808891;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gdDQLXFLFnPeaRqX07w3oCmOqrGhYq0Wj3dOz7jezdY=;
 b=gxPotki4Ewdth7wYjnI9pnzCNrkl85SdCuIBzIc5uQlK0baCrjxPN5X6
 5QBJrykLkEirUdeKm73MfIvpNpO8Bk0lq7vkFTl0DvN3n2qWOvUj3O49q
 MXtDBRxWhJyvo9RSFcz00bSxeNy/iSWzJT6PA1GixKuZqlDXZbG8Gou+F
 iU2teMk5zO2jNE9JCXFzjfnIw9bxE8uIgnbLMBbNKTJyhfm7io/iDree/
 PueHR3jT76GJ8N7gS8wphSP0qeaQd+Z2bED4CfmX4u2cKn8Yzy1WKY0CM
 yu7enb//m0TGL9k45hkqvVKYpZApbiqud7sbJ6ligrjneialUAyejt5v2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="393312809"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="393312809"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 11:21:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="867706776"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="867706776"
Received: from rahul-super-server.iind.intel.com ([10.145.169.69])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Dec 2023 11:19:11 -0800
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Subject: [PATCH v2] drm/xe: Add mocs reset kunit
Date: Sat, 23 Dec 2023 00:53:52 +0530
Message-Id: <20231222192352.927101-1-janga.rahul.kumar@intel.com>
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

From: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>

This kunit verifies the mocs registers content
with the KMD programmed values before and after
GT reset.

v2: Remove extra blank lines between the local variables
definitions (Matt Roper)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c      | 36 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_mocs_test.c |  1 +
 drivers/gpu/drm/xe/tests/xe_mocs_test.h |  1 +
 3 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 7dd34f94e809..df5c36b70ab4 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -128,3 +128,39 @@ void xe_live_mocs_kernel_kunit(struct kunit *test)
 	xe_call_for_each_device(mocs_kernel_test_run_device);
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
+
+static int mocs_reset_test_run_device(struct xe_device *xe)
+{
+	/* Check the mocs setup is retained over GT reset */
+
+	struct live_mocs mocs;
+	struct xe_gt *gt;
+	unsigned int flags;
+	int id;
+	struct kunit *test = xe_cur_kunit();
+
+	for_each_gt(gt, xe, id) {
+		flags = live_mocs_init(&mocs, gt);
+		kunit_info(test, "mocs_reset_test before reset\n");
+		if (flags & HAS_GLOBAL_MOCS)
+			read_mocs_table(gt, &mocs.table);
+		if (flags & HAS_LNCF_MOCS)
+			read_l3cc_table(gt, &mocs.table);
+
+		xe_gt_reset_async(gt);
+		flush_work(&gt->reset.worker);
+
+		kunit_info(test, "mocs_reset_test after reset\n");
+		if (flags & HAS_GLOBAL_MOCS)
+			read_mocs_table(gt, &mocs.table);
+		if (flags & HAS_LNCF_MOCS)
+			read_l3cc_table(gt, &mocs.table);
+	}
+	return 0;
+}
+
+void xe_live_mocs_reset_kunit(struct kunit *test)
+{
+	xe_call_for_each_device(mocs_reset_test_run_device);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
index ef56bd517b28..4f62e7a4270b 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
@@ -9,6 +9,7 @@
 
 static struct kunit_case xe_mocs_tests[] = {
 	KUNIT_CASE(xe_live_mocs_kernel_kunit),
+	KUNIT_CASE(xe_live_mocs_reset_kunit),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
index 7faa3575e6c3..e7699d495411 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
+++ b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
@@ -9,5 +9,6 @@
 struct kunit;
 
 void xe_live_mocs_kernel_kunit(struct kunit *test);
+void xe_live_mocs_reset_kunit(struct kunit *test);
 
 #endif
-- 
2.25.1

