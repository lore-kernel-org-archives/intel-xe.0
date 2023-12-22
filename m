Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39FAC46CD3
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 01:47:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BC610E049;
	Fri, 22 Dec 2023 01:47:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B3210E049
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 01:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703209666; x=1734745666;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Up4X2D+PQac8niO1HnBMBsY75kIyfkaQeyRB+mcrzNM=;
 b=PIR7UK3B+Cp+7weX6kldUAl7YaAgafjfC/+PK2YiwZjXCsh9s9V6K/0e
 sYE8nnXRwMmkVCcokLU8RwvQSfodKCvyPH28o9spCIjRjtpeqowmeu5EX
 emBzEGx0vrohOG/l6qDD5NOe3tcalsal9Ak6uvJewBiuL096W3Q5IWPYn
 JOMQ0ZbFFJI8UV2wSSRQhI/fvf1SWArwVnQZ4oodcInk5SqnGBj6a+oY6
 qB6Vf5h4NKWBiSH/pKu/9UnBVVPL/MMCkUxU9CNhXVgxaaGDsZdNBfc/l
 m6id+zAX7yBceRjhDaulnsX33dIuP+UbYVaZ9W2p2qeCrMrrar8dQqf2F A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="460394788"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="460394788"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 17:47:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="1108314351"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="1108314351"
Received: from rahul-super-server.iind.intel.com ([10.145.169.69])
 by fmsmga005.fm.intel.com with ESMTP; 21 Dec 2023 17:47:44 -0800
From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
To: intel-xe@lists.freedesktop.org, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com
Subject: [PATCH] drm/xe: Add mocs reset kunit
Date: Fri, 22 Dec 2023 07:22:23 +0530
Message-Id: <20231222015223.815147-1-janga.rahul.kumar@intel.com>
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

Cc: Mathew D Roper <matthew.d.roper@intel.com>
Signed-off-by: Ruthuvikas Ravikumar <ruthuvikas.ravikumar@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_mocs.c      | 38 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_mocs_test.c |  1 +
 drivers/gpu/drm/xe/tests/xe_mocs_test.h |  1 +
 3 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
index 7dd34f94e809..98dd63031c5c 100644
--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
@@ -128,3 +128,41 @@ void xe_live_mocs_kernel_kunit(struct kunit *test)
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
+
+	unsigned int flags;
+	int id;
+
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

