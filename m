Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8390BC04FFE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Apr 2024 15:28:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 493EB113D54;
	Thu, 18 Apr 2024 15:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjG2O4QZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34F5113710
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Apr 2024 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713454093; x=1744990093;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=DwLqLEI06gsSoF4bf0nDkmO9zkNX5nlFRloVmWU1/xQ=;
 b=EjG2O4QZlSqp45ACNjaWiP/g+5iYEH8dAf2bheEQJAibQG+ehXBgZGMT
 6pmY60WzbwudYvbh4b39FRQa5XEopG8mt0rfuP+HmmrsjSeaFXvvCmTOu
 Xp9CGhlhezkf+4yJa5n/IBScnXNYPN0rt7zWjqS2d/WHUqv8bWE09gxO1
 qJ+qf08yXZA9wE50A678fv1YXKTUKTPv0Fcsy96y//yrMJE0wUERdNVw/
 KwDgokBAsf7XtZHb6A1g0vOwhgDiCh7j1lFR336TLcWMYY6tS2RD8Nqv7
 UrLhIIcIFFVsRxjukmCTvpKuFHbewgP8hsIxbx7SnWwXcMC9B8UtCXAjo g==;
X-CSE-ConnectionGUID: xKJJ6HPMQ+68O5XoTJ8wbQ==
X-CSE-MsgGUID: K/XEDlAORwGatdIQ+QwzCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8873725"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; 
   d="scan'208";a="8873725"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:13 -0700
X-CSE-ConnectionGUID: QqZGYFfbSLaIImqyDGevGQ==
X-CSE-MsgGUID: x9JBbskLTyqrFYJsHA5rPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="54205902"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.252.62.251])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:28:14 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 5/5] drm/xe/kunit: Add PF service tests
Date: Thu, 18 Apr 2024 17:28:02 +0200
Message-Id: <20240418152802.182-6-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240418152802.182-1-michal.wajdeczko@intel.com>
References: <20240418152802.182-1-michal.wajdeczko@intel.com>
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
index 4b9850cc3615..80899fa1ad2a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
@@ -547,3 +547,7 @@ int xe_gt_sriov_pf_service_print_version(struct xe_gt *gt, struct drm_printer *p
 
 	return 0;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_gt_sriov_pf_service_test.c"
+#endif
-- 
2.43.0

