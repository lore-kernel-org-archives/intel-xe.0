Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFE2C7618D
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 03:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D3A10E8CD;
	Wed, 15 Mar 2023 03:23:00 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C81A10E8FE
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 03:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678850578; x=1710386578;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWtPQXLpXa0ytQRNx7jLUx7aAb9Gixc6Fm+xmY95e80=;
 b=VEpZK3lU2Hs2O5BWyvd/KWrArVUIVqjNdjHsJjaunFONum+n2ado5YYG
 u8TI7/C+scn9C0usZSUKi2QwZqmwioi4uLIAVtmggvgv6jd7MSRftdeLY
 8ApOshxoAZLOwNfMrJ14MSFo7R+xcUgwREHThhdhgYmZ9nXEnECikv8/X
 gdC6CjI8PWqKVS8MSvKmSqpP2YPutCf/N2z015VDlyylW0ComkenVbMtp
 WfDApHqBh2Pykwl9RbCKvKymLZvQdRVm83WJE0cb37O9xhuEKqSqMTOpa
 +vYcrH3EQzsLSAYTrDll/WmnmtuX8edmTEjCF6hNtI4bG9rRLrh+u4dZ8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="365278737"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="365278737"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 20:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="679337907"
X-IronPort-AV: E=Sophos;i="5.98,261,1673942400"; d="scan'208";a="679337907"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 14 Mar 2023 20:22:57 -0700
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.136.19])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E4E1D696AA;
 Sun, 12 Mar 2023 20:35:40 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Sun, 12 Mar 2023 21:35:21 +0100
Message-Id: <20230312203521.1652-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230312203521.1652-1-michal.wajdeczko@intel.com>
References: <20230312203521.1652-1-michal.wajdeczko@intel.com>
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

