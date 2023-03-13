Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E04BC7618B
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BD810E4A0;
	Mon, 13 Mar 2023 08:13:41 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B940110E498
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678695218; x=1710231218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RICbX9A7BpUMgrMu94heUX/2XgVbKDi6A3sKcU/E6Qc=;
 b=Z5ZdJQvum1AqYaw9vJnm3tyooiRhoKRmbEarUaQSLgSDg/2wDZRvI6r3
 zOJTzNE77heP9zVHvzCApfz9Rn3Z7Xs3tpTcxiKF041Gr1yV5vB/Ts6gV
 o7DB9PNKCsrj8YzDO5U7Tr9OCn+jFanulvvoP7uBiKv/RoWRHhAvmyWsE
 aGa80hSPh8m7Ko214NSDwJrPwv+5jE8JMyeanOnFohkmio2ShEkwjqlxc
 ddgGUGLgLrjSsNpTQ1qBgCb8JqVSFHZ5njfYzoCHiWgrBp2qEqH7gIX7Q
 +XmUhE1TNjt3y69o2x2wPkacgN1fm+8IyWBLRXydS/PygzOGdJbsucO9U Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320940437"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="320940437"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821858116"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="821858116"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:13:15 +0100
Message-Id: <20230313081316.2408-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230313081316.2408-1-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 4/5] drm/xe: Initial selftests for xe_guc
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

Add few very basic mock and live selftests for the xe_guc.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/selftests/live/xe_guc_live_selftest.c  | 54 +++++++++++++++++++
 .../xe/selftests/mock/xe_guc_mock_selftest.c  | 30 +++++++++++
 drivers/gpu/drm/xe/xe_guc.c                   |  6 +++
 3 files changed, 90 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_guc_live_selftest.c
 create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_guc_mock_selftest.c

diff --git a/drivers/gpu/drm/xe/selftests/live/xe_guc_live_selftest.c b/drivers/gpu/drm/xe/selftests/live/xe_guc_live_selftest.c
new file mode 100644
index 000000000000..eefda6af1cce
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/live/xe_guc_live_selftest.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright Â© 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "selftests/xe_selftests.h"
+
+static void test_guc_fw(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+
+	KUNIT_EXPECT_TRUE(test, xe_uc_fw_is_supported(&guc->fw));
+	KUNIT_EXPECT_TRUE(test, xe_uc_fw_is_enabled(&guc->fw));
+	KUNIT_EXPECT_TRUE(test, xe_uc_fw_is_available(&guc->fw));
+	KUNIT_EXPECT_TRUE(test, xe_uc_fw_is_running(&guc->fw));
+}
+
+static int guc_send_unknown_action(struct xe_guc *guc)
+{
+	u32 request[] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, 0xDEAD),
+	};
+
+	return xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
+}
+
+static void test_guc_rejects_unknown_action(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+
+	kunit_skip(test, "XE_BUG_ON(guc->ct.enabled)");
+	KUNIT_EXPECT_NE(test, 0, guc_send_unknown_action(guc));
+}
+
+static struct kunit_case guc_live_test_cases[] = {
+	KUNIT_CASE(test_guc_fw),
+	KUNIT_CASE(test_guc_rejects_unknown_action),
+	{}
+};
+
+static struct kunit_suite guc_live_suite = {
+	.name = "guc_live",
+	.test_cases = guc_live_test_cases,
+
+	.suite_init = init_xe_live_selftest_suite,
+	.init = init_xe_guc_selftest,
+	.exit = exit_xe_guc_selftest,
+};
+
+kunit_test_suite(guc_live_suite);
diff --git a/drivers/gpu/drm/xe/selftests/mock/xe_guc_mock_selftest.c b/drivers/gpu/drm/xe/selftests/mock/xe_guc_mock_selftest.c
new file mode 100644
index 000000000000..c10c91b5971f
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/mock/xe_guc_mock_selftest.c
@@ -0,0 +1,30 @@
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
+	struct xe_guc *guc = test->priv;
+
+	KUNIT_ASSERT_NOT_NULL(test, guc);
+}
+
+static struct kunit_case guc_mock_test_cases[] = {
+	KUNIT_CASE(test_basic),
+	{}
+};
+
+static struct kunit_suite guc_mock_suite = {
+	.name = "guc_mock",
+	.test_cases = guc_mock_test_cases,
+
+	.init = init_xe_guc_selftest,
+	.exit = exit_xe_guc_selftest,
+};
+
+kunit_test_suite(guc_mock_suite);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 58b9841616e4..86fbac466788 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -871,3 +871,9 @@ void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
 	xe_guc_ct_print(&guc->ct, p);
 	xe_guc_submit_print(guc, p);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
+#include "selftests/mock/xe_guc_mock_selftest.c"
+#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+#include "selftests/live/xe_guc_live_selftest.c"
+#endif
-- 
2.25.1

