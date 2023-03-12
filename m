Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12518C7618A
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 03:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFC910E8FE;
	Wed, 15 Mar 2023 03:23:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6B010E8F1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 03:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678850577; x=1710386577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RICbX9A7BpUMgrMu94heUX/2XgVbKDi6A3sKcU/E6Qc=;
 b=S13ALcXP+QTUIcmFatRv+gXd6hiioKCL7i6fwmhwO1tC+BHA+8PGHWq+
 YtMuFdR0Kzb6i7FSaMYuej86tLND5V8l5IvlKzD999zssDhflzF4YqO5M
 Nt4jG5hV+wQZsJdGIspT22H82HHsRfhhp6vft7wXBoGD0HU9dWxHwhgUo
 8kG8P+mieLGwpRvcxCaLjPaapXdAuqCKXXnNJyBWnOiZzBzmvJGU/Ya0u
 S0yTT806SmT0fNy2pDEDAjBnYjH6cYP0VNvfpvI6bV4G643S7SOXAmu21
 bSePUTa+NKLCg+foXKWyLCqzpH/ZNzHinokBoVr+/a5XxyKBhqpT/0upi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365278734"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="365278734"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 20:22:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="679337902"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="679337902"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 14 Mar 2023 20:22:55 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.136.19])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CC019696A8;
 Sun, 12 Mar 2023 20:35:39 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 12 Mar 2023 21:35:20 +0100
Message-Id: <20230312203521.1652-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230312203521.1652-1-michal.wajdeczko@intel.com>
References: <20230312203521.1652-1-michal.wajdeczko@intel.com>
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

