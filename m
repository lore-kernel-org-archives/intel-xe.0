Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814D7C61DA4
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:13:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC2410E4A2;
	Mon, 13 Mar 2023 08:13:41 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB35410E4A2
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678695219; x=1710231219;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWtPQXLpXa0ytQRNx7jLUx7aAb9Gixc6Fm+xmY95e80=;
 b=KcRI4AtZG6bYizGsmoCIvR0yjs2o8/c00TLzR9botdEScqw3mkR6gxF2
 ChABe40QUITUVmFxgYZ2xfOELnGvvDhP0tbvJZMqaguialXA7r67L6TMG
 8Er9x/uE+2dK+Thb6gp0ZjHee1gtKioS2rAE6ArMQ8ZNex5NBcy9Z0QYd
 niS1S61PD6x0NB43e5AsgsMGgloId0Pu2e1WCEeai4HcMQO8byBC/m++e
 J+t9seBbv/pmn9oFp3PhPNUJLQEYDjrz8M0glZ9GcgHUOB3X2n9c81b3Q
 eyQ9somO06iD0eBR5/KuD4rod/XuzPyMr0VI1pa5+mQZ9tHSqiIfxdD1V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320940440"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="320940440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821858121"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="821858121"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:13:16 +0100
Message-Id: <20230313081316.2408-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230313081316.2408-1-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 5/5] drm/xe: Initial selftests for xe_guc_ct
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

Add few very basic mock and live selftests for the xe_guc_ct.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../selftests/live/xe_guc_ct_live_selftest.c  | 52 +++++++++++++++++++
 .../selftests/mock/xe_guc_ct_mock_selftest.c  | 31 +++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.c                |  6 +++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/selftests/live/xe_guc_ct_live_selftest.c
 create mode 100644 drivers/gpu/drm/xe/selftests/mock/xe_guc_ct_mock_selftest.c

diff --git a/drivers/gpu/drm/xe/selftests/live/xe_guc_ct_live_selftest.c b/drivers/gpu/drm/xe/selftests/live/xe_guc_ct_live_selftest.c
new file mode 100644
index 000000000000..73da4c5d6e81
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/live/xe_guc_ct_live_selftest.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright Â© 2023 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "selftests/xe_selftests.h"
+
+static void test_ct_not_broken(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+	struct xe_guc_ct *ct = &guc->ct;
+
+	KUNIT_EXPECT_FALSE(test, ct->ctbs.h2g.broken);
+	KUNIT_EXPECT_FALSE(test, ct->ctbs.g2h.broken);
+}
+
+static int guc_ct_send_unknown_action(struct xe_guc_ct *ct)
+{
+	u32 request[] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, 0xDEAD),
+	};
+
+	return xe_guc_ct_send_block(ct, request, ARRAY_SIZE(request));
+}
+
+static void test_ct_rejects_unknown_action(struct kunit *test)
+{
+	struct xe_guc *guc = test->priv;
+
+	KUNIT_EXPECT_NE(test, 0, guc_ct_send_unknown_action(&guc->ct));
+}
+
+static struct kunit_case ct_live_test_cases[] = {
+	KUNIT_CASE(test_ct_not_broken),
+	KUNIT_CASE(test_ct_rejects_unknown_action),
+	{}
+};
+
+static struct kunit_suite ct_live_suite = {
+	.name = "ct_live",
+	.test_cases = ct_live_test_cases,
+
+	.suite_init = init_xe_live_selftest_suite,
+	.init = init_xe_guc_selftest,
+	.exit = exit_xe_guc_selftest,
+};
+
+kunit_test_suite(ct_live_suite);
diff --git a/drivers/gpu/drm/xe/selftests/mock/xe_guc_ct_mock_selftest.c b/drivers/gpu/drm/xe/selftests/mock/xe_guc_ct_mock_selftest.c
new file mode 100644
index 000000000000..db6e08b7ad8b
--- /dev/null
+++ b/drivers/gpu/drm/xe/selftests/mock/xe_guc_ct_mock_selftest.c
@@ -0,0 +1,31 @@
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
+	struct xe_guc_ct *ct = &guc->ct;
+
+	KUNIT_ASSERT_NOT_NULL(test, ct);
+}
+
+static struct kunit_case guc_ct_mock_test_cases[] = {
+	KUNIT_CASE(test_basic),
+	{}
+};
+
+static struct kunit_suite guc_ct_mock_suite = {
+	.name = "guc_ct_mock",
+	.test_cases = guc_ct_mock_test_cases,
+
+	.init = init_xe_guc_selftest,
+	.exit = exit_xe_guc_selftest,
+};
+
+kunit_test_suite(guc_ct_mock_suite);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 5e00b75d3ca2..7ed360229087 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -1203,3 +1203,9 @@ void xe_guc_ct_selftest(struct xe_guc_ct *ct, struct drm_printer *p)
 	drm_printf(p, "GuC CT selftest done - %s\n", ret ? "FAIL" : "PASS");
 }
 #endif
+
+#if IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_MOCK)
+#include "selftests/mock/xe_guc_ct_mock_selftest.c"
+#elif IS_ENABLED(CONFIG_DRM_XE_SELFTESTS_LIVE)
+#include "selftests/live/xe_guc_ct_live_selftest.c"
+#endif
-- 
2.25.1

