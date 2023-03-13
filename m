Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CB0C74A5B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A5610E498;
	Mon, 13 Mar 2023 08:13:39 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C11410E498
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678695217; x=1710231217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ln9N5ndVy56S01vvK1wNHE+mbL8eCc+763nuSRe4MOE=;
 b=LIj0o5b+4gQ0RXg/IX/Y8Ts6e40C+qGF6mrgFX/r2B3BDn55l5o/MLT6
 7llIW4yF8zJ5tIelBvw73e18loT3aWoPqxP6sn30N6tTlIG6n6UIOvxxX
 pA4/E8BFaqdINXFpeIu2Db2XIuW0QcH+80KMH7qXhNgFAthBM3OzUAjQY
 yNZ945jvzRw/Hurh1kdxua2RPBXCMmx5Ubc9zesj2bOT0En1dXZhWIzHe
 22SY0SaRKdqpHZl6vttMsMAhiJ32RfV+UCf/iHS25kxkmZYGBJgKB2WDU
 hAMBnpDYRmknlERsjFl9B8Na3XAcuBaRkhAGZ3+cQ5ZiOSdj7rlWSkrpM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320940430"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="320940430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821858103"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="821858103"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:36 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:13:14 +0100
Message-Id: <20230313081316.2408-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230313081316.2408-1-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 3/5] drm/xe: Initial selftests for xe_gt
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

Add few very basic mock and live selftests for the xe_gt.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/selftests/live/xe_gt_live_selftest.c   | 40 +++++++++++++++++++
 .../xe/selftests/mock/xe_gt_mock_selftest.c   | 40 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.c                    |  6 +++
 3 files changed, 86 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_gt_live_selftest.c
 create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_gt_mock_selftest.c

diff --git a/drivers/gpu/drm/xe/selftests/live/xe_gt_live_selftest.c b/drivers/gpu/drm/xe/selftests/live/xe_gt_live_selftest.c
new file mode 100644
index 000000000000..d807ec1d1d8c
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/live/xe_gt_live_selftest.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright Â© 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "selftests/xe_selftests.h"
+
+static void test_gt_info(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_NE(test, gt->info.type, XE_GT_TYPE_UNINITIALIZED);
+	KUNIT_EXPECT_EQ(test, gt->info.id, 0u);
+}
+
+static void test_gt_is_not_media_type(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_EXPECT_FALSE(test, xe_gt_is_media_type(gt));
+}
+
+static struct kunit_case gt_live_test_cases[] = {
+	KUNIT_CASE(test_gt_info),
+	KUNIT_CASE(test_gt_is_not_media_type),
+	{}
+};
+
+static struct kunit_suite gt_live_suite = {
+	.name = "gt_live",
+	.test_cases = gt_live_test_cases,
+
+	.suite_init = init_xe_live_selftest_suite,
+	.init = init_xe_gt_selftest,
+	.exit = exit_xe_gt_selftest,
+};
+
+kunit_test_suite(gt_live_suite);
diff --git a/drivers/gpu/drm/xe/selftests/mock/xe_gt_mock_selftest.c b/drivers/gpu/drm/xe/selftests/mock/xe_gt_mock_selftest.c
new file mode 100644
index 000000000000..f208aea3d1a0
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/mock/xe_gt_mock_selftest.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "selftests/xe_selftests.h"
+
+static void test_basic(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_ASSERT_NOT_NULL(test, gt);
+	KUNIT_EXPECT_EQ(test, gt->info.type, XE_GT_TYPE_MAIN);
+	KUNIT_EXPECT_EQ(test, gt->info.id, 0u);
+}
+
+static void test_to_xe(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+
+	KUNIT_ASSERT_NOT_NULL(test, gt->xe);
+}
+
+static struct kunit_case gt_mock_test_cases[] = {
+	KUNIT_CASE(test_basic),
+	KUNIT_CASE(test_to_xe),
+	{}
+};
+
+static struct kunit_suite gt_mock_suite = {
+	.name = "gt_mock",
+	.test_cases = gt_mock_test_cases,
+
+	.init = init_xe_gt_selftest,
+	.exit = exit_xe_gt_selftest,
+};
+
+kunit_test_suite(gt_mock_suite);
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index daa433d0f2f5..83861014acfa 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -852,3 +852,9 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 
 	return NULL;
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
+#include "selftests/mock/xe_gt_mock_selftest.c"
+#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+#include "selftests/live/xe_gt_live_selftest.c"
+#endif
-- 
2.25.1

