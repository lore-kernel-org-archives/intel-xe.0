Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25002C6FD1F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Mar 2023 08:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B118410E4A0;
	Mon, 13 Mar 2023 08:13:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D56810E490
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Mar 2023 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678695216; x=1710231216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uFvEMsMm7+U9YeTfVGizjFF0OlUoocC8ytmt9uavHCM=;
 b=G29lXvQNuN24Jmq02YIkW01/XD46bb2qc4pnAoyTATAuAP3qRpHcCdUI
 LU+oCsMOQxKg4sUuPVemQRZS7N3J4YBuxzSg9wIAhv+2VrWZ84YlwLxmf
 1EpjymcnFek87JZqCiQeBH3I+IpPoBy5Jsu4qxxVKCuLC+3VlxPvogi5r
 OoJ0rrA9H9Gi8G8ScJCKIMwQRXxdp5VwgGag1jtw8iCfsgrHdKShFyhJ+
 dzHKCpn9iSnwm3R9WRHeU9ca7Z61lhngQYEjKHlW/IjzwvtYbo50mn4fv
 ZNGaSpGtjCaRBR0XzJaWVAl9UO20NCloyE/ia7pirBAZ5uVfrbJdgvR4m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="320940422"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="320940422"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="821858097"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; d="scan'208";a="821858097"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.159.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 01:13:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 09:13:13 +0100
Message-Id: <20230313081316.2408-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230313081316.2408-1-michal.wajdeczko@intel.com>
References: <20230313081316.2408-1-michal.wajdeczko@intel.com>
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

