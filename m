Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E99C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 03:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EA510E8F3;
	Wed, 15 Mar 2023 03:22:58 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F4510E8F1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 03:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678850576; x=1710386576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uFvEMsMm7+U9YeTfVGizjFF0OlUoocC8ytmt9uavHCM=;
 b=nZ91zEQpTnN7X6N/AhvyGm+UXlrd5dsJNrwGe0Zfk1uVt+PuJGQdz5r1
 4QIMDkZgReyasdhQsQNFBxNs5VJt9W8h+Us6ILIbcAijPwXBUOUa//QaY
 f4HcAEhd6lRwcjYLKQX83premUz/2SuajKQrD4haeAd3zMI88HyFEu57a
 2DwPsmKTxeUASk21W5A0MDCq/CwRWJRryW2/y8WHhxhTANtrl4gvphDeo
 bPdhPNievjyrErzkg7EIrRVVUick5vouXZYntnJ3iZdP0D/djADu0Kw73
 e6d13TE81Omsmk9XjoZK3MOFtro1fTLvPzf9oGC5m+JzuUatOCITNnfVO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365278729"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="365278729"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 20:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="679337891"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="679337891"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 14 Mar 2023 20:22:54 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.136.19])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8B376696A6;
 Sun, 12 Mar 2023 20:35:37 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 12 Mar 2023 21:35:18 +0100
Message-Id: <20230312203521.1652-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230312203521.1652-1-michal.wajdeczko@intel.com>
References: <20230312203521.1652-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/5] drm/xe: Initial selftests for xe_device
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

Add few very basic mock and live selftests for the xe_device.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../selftests/live/xe_device_live_selftest.c  | 39 ++++++++++++++++++
 .../selftests/mock/xe_device_mock_selftest.c  | 41 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c                |  6 +++
 3 files changed, 86 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_device_live_selftest.c
 create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_device_mock_selftest.c

diff --git a/drivers/gpu/drm/xe/selftests/live/xe_device_live_selftest.c b/drivers/gpu/drm/xe/selftests/live/xe_device_live_selftest.c
new file mode 100644
index 000000000000..05ad2b04528a
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/live/xe_device_live_selftest.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright Â© 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "selftests/xe_selftests.h"
+
+static void test_to_gt(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	KUNIT_ASSERT_NOT_NULL(test, to_gt(xe));
+}
+
+static void test_guc_submission_enabled(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, xe_device_guc_submission_enabled(xe));
+}
+
+static struct kunit_case device_live_test_cases[] = {
+	KUNIT_CASE(test_to_gt),
+	KUNIT_CASE(test_guc_submission_enabled),
+	{}
+};
+
+static struct kunit_suite device_live_suite = {
+	.name = "device_live",
+	.test_cases = device_live_test_cases,
+
+	.suite_init = init_xe_live_selftest_suite,
+	.init = init_xe_device_selftest,
+	.exit = exit_xe_device_selftest,
+};
+
+kunit_test_suite(device_live_suite);
diff --git a/drivers/gpu/drm/xe/selftests/mock/xe_device_mock_selftest.c b/drivers/gpu/drm/xe/selftests/mock/xe_device_mock_selftest.c
new file mode 100644
index 000000000000..1da4fbf7abae
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/mock/xe_device_mock_selftest.c
@@ -0,0 +1,41 @@
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
+	struct xe_device *xe = test->priv;
+
+	KUNIT_ASSERT_NOT_NULL(test, xe);
+	KUNIT_EXPECT_STRNEQ(test, dev_name(xe->drm.dev), "");
+
+	drm_dbg(&xe->drm, "Done!\n");
+}
+
+static void test_to_gt(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+
+	KUNIT_ASSERT_NOT_NULL(test, to_gt(xe));
+}
+
+static struct kunit_case device_mock_test_cases[] = {
+	KUNIT_CASE(test_basic),
+	KUNIT_CASE(test_to_gt),
+	{}
+};
+
+static struct kunit_suite device_mock_suite = {
+	.name = "device_mock",
+	.test_cases = device_mock_test_cases,
+
+	.init = init_xe_device_selftest,
+	.exit = exit_xe_device_selftest,
+};
+
+kunit_test_suite(device_mock_suite);
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 1553949d12b6..503f985167fd 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -426,3 +426,9 @@ void xe_device_mem_access_put(struct xe_device *xe)
 
 	XE_WARN_ON(xe->mem_access.ref < 0);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
+#include "selftests/mock/xe_device_mock_selftest.c"
+#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+#include "selftests/live/xe_device_live_selftest.c"
+#endif
-- 
2.25.1

