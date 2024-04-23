Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EB1C19F4F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 18:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF93113565;
	Tue, 23 Apr 2024 18:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h3wZbMxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF45113560
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713895497; x=1745431497;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ehozFVUyh0nL2Jm1YqTwHZ/zNZl4qT+qrT239PmLHPU=;
 b=h3wZbMxDQVOni59T2Jv/0GdtYlrUA0XO+R9oWmuzOtVdb2u1XjChJEal
 NvoPHiNsmkO/CjUmKEHJbO8cQjQosbKS+cou3CgoUWj2orwv1cKbfOeTd
 ZeSdkUil2aV0homRZ+VBLhi6+HuNNnmFV4LYSfrRCcgzkItyhnWqauHuY
 G/JCYNGdOLmLjv3zPzzS4VcEAWnQ+MnxskOb1aX/9vA6zQ/Jq+rwnl13D
 hmxetrYjt1jHfX9cCp0MV67mEB/xLviZ2oP/q4Jz0K9YmMcXPJRH0uIDX
 e1xPm59UpOt3eHEvIfTDcA5LkLH672XbOmowtKZHwyUKii0MZkXsuB6OL Q==;
X-CSE-ConnectionGUID: Td/WnK76R3+aD9QMAeKQCg==
X-CSE-MsgGUID: 59IeAmoLTmmMG1sQZdJrNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9363517"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9363517"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:56 -0700
X-CSE-ConnectionGUID: iVh6NQnfRJOd9fWophWHMg==
X-CSE-MsgGUID: YFmSLvEFRrmIoAEo8txLrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="29105596"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.48.128])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 11:04:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 5/5] drm/xe/kunit: Add PF service tests
Date: Tue, 23 Apr 2024 20:04:36 +0200
Message-Id: <20240423180436.2089-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240423180436.2089-1-michal.wajdeczko@intel.com>
References: <20240423180436.2089-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Start with basic tests for VF/PF ABI version negotiation. As we
treat all platforms in the same way, we can run the tests on one
platform. More tests will likely come later.

Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   |   4 +
 2 files changed, 236 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
new file mode 100644
index 000000000000..b683585db852
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+static int pf_service_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.sriov_mode = XE_SRIOV_MODE_PF,
+		.platform = XE_TIGERLAKE, /* some random platform */
+		.subplatform = XE_SUBPLATFORM_NONE,
+	};
+	struct xe_device *xe;
+	struct xe_gt *gt;
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	xe = test->priv;
+	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
+
+	gt = xe_device_get_gt(xe, 0);
+	pf_init_versions(gt);
+
+	/*
+	 * sanity check:
+	 * - all supported platforms VF/PF ABI versions must be defined
+	 * - base version can't be newer than latest
+	 */
+	KUNIT_ASSERT_NE(test, 0, gt->sriov.pf.service.version.base.major);
+	KUNIT_ASSERT_NE(test, 0, gt->sriov.pf.service.version.latest.major);
+	KUNIT_ASSERT_LE(test, gt->sriov.pf.service.version.base.major,
+			gt->sriov.pf.service.version.latest.major);
+	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
+		KUNIT_ASSERT_LE(test, gt->sriov.pf.service.version.base.minor,
+				gt->sriov.pf.service.version.latest.minor);
+
+	test->priv = gt;
+	return 0;
+}
+
+static void pf_negotiate_any(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt, VF2PF_HANDSHAKE_MAJOR_ANY,
+					     VF2PF_HANDSHAKE_MINOR_ANY,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
+	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
+}
+
+static void pf_negotiate_base_match(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.base.major,
+					     gt->sriov.pf.service.version.base.minor,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.base.major);
+	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.base.minor);
+}
+
+static void pf_negotiate_base_newer(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.base.major,
+					     gt->sriov.pf.service.version.base.minor + 1,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.base.major);
+	KUNIT_ASSERT_GE(test, minor, gt->sriov.pf.service.version.base.minor);
+	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
+		KUNIT_ASSERT_LE(test, minor, gt->sriov.pf.service.version.latest.minor);
+	else
+		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
+}
+
+static void pf_negotiate_base_next(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.base.major + 1, 0,
+					     &major, &minor));
+	KUNIT_ASSERT_GE(test, major, gt->sriov.pf.service.version.base.major);
+	KUNIT_ASSERT_LE(test, major, gt->sriov.pf.service.version.latest.major);
+	if (major == gt->sriov.pf.service.version.latest.major)
+		KUNIT_ASSERT_LE(test, minor, gt->sriov.pf.service.version.latest.minor);
+	else
+		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
+}
+
+static void pf_negotiate_base_older(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	if (!gt->sriov.pf.service.version.base.minor)
+		kunit_skip(test, "no older minor\n");
+
+	KUNIT_ASSERT_NE(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.base.major,
+					     gt->sriov.pf.service.version.base.minor - 1,
+					     &major, &minor));
+}
+
+static void pf_negotiate_base_prev(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_NE(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.base.major - 1, 1,
+					     &major, &minor));
+}
+
+static void pf_negotiate_latest_match(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.latest.major,
+					     gt->sriov.pf.service.version.latest.minor,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
+	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
+}
+
+static void pf_negotiate_latest_newer(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.latest.major,
+					     gt->sriov.pf.service.version.latest.minor + 1,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
+	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
+}
+
+static void pf_negotiate_latest_next(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.latest.major + 1, 0,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
+	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
+}
+
+static void pf_negotiate_latest_older(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	if (!gt->sriov.pf.service.version.latest.minor)
+		kunit_skip(test, "no older minor\n");
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.latest.major,
+					     gt->sriov.pf.service.version.latest.minor - 1,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
+	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor - 1);
+}
+
+static void pf_negotiate_latest_prev(struct kunit *test)
+{
+	struct xe_gt *gt = test->priv;
+	u32 major, minor;
+
+	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
+		kunit_skip(test, "no prev major");
+
+	KUNIT_ASSERT_EQ(test, 0,
+			pf_negotiate_version(gt,
+					     gt->sriov.pf.service.version.latest.major - 1,
+					     gt->sriov.pf.service.version.base.minor + 1,
+					     &major, &minor));
+	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major - 1);
+	KUNIT_ASSERT_GE(test, major, gt->sriov.pf.service.version.base.major);
+}
+
+static struct kunit_case pf_service_test_cases[] = {
+	KUNIT_CASE(pf_negotiate_any),
+	KUNIT_CASE(pf_negotiate_base_match),
+	KUNIT_CASE(pf_negotiate_base_newer),
+	KUNIT_CASE(pf_negotiate_base_next),
+	KUNIT_CASE(pf_negotiate_base_older),
+	KUNIT_CASE(pf_negotiate_base_prev),
+	KUNIT_CASE(pf_negotiate_latest_match),
+	KUNIT_CASE(pf_negotiate_latest_newer),
+	KUNIT_CASE(pf_negotiate_latest_next),
+	KUNIT_CASE(pf_negotiate_latest_older),
+	KUNIT_CASE(pf_negotiate_latest_prev),
+	{}
+};
+
+static struct kunit_suite pf_service_suite = {
+	.name = "pf_service",
+	.test_cases = pf_service_test_cases,
+	.init = pf_service_test_init,
+};
+
+kunit_test_suite(pf_service_suite);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
index a253f196261d..0e23b7ea4f3e 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -544,3 +544,7 @@ int xe_gt_sriov_pf_service_print_version(struct xe_gt *gt, struct drm_printer *p
 
 	return 0;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_pf_service_test.c"
+#endif
-- 
2.43.0

