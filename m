Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD279C43602
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:26:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806B110E1D9;
	Tue, 30 Jun 2026 13:26:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="akj+uRM1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7E10E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826013; x=1814362013;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2K0Rh9EtgWlS3qGDsM/a0qCxHHnRS/OZsXtvCfFmybs=;
 b=akj+uRM16Wq550DcxwChEk4ulOD9/v6SQyJJs47O+le6dGuxKyBZvm6l
 hzwksWOM8frP7CaKNNYP+1q/MH1LOb0WrHhd+1/IWzTLZfqjJlNWmFGSp
 jWMQbtflu+bCJ9ljfa1JGSzBjN04S8WVYV8qXo8CjgD91dyZnd+kOG7/Y
 ONxqhSInQYzuiblXAHlsrAaF7f+GPkTrrkki3i1TJ+LC+p+nHr7wuK3GV
 dcZ23jiKslk7bgK3wyr5CXCuZ1ldT4ocqNfRTHI8Mu/vgPynnI3oHH5LX
 IHS4gKc5y/UxKI0RepNwaAV4du8kliFffw2bWPIuDpnRyTgt3dZ1eaECG A==;
X-CSE-ConnectionGUID: qGH/YYH2ToCaTn689gksew==
X-CSE-MsgGUID: bdTl8hd+Qe2ZnKOTjlmtTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623520"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:53 -0700
X-CSE-ConnectionGUID: AcWeu0pFTAm7QNb++T0Omw==
X-CSE-MsgGUID: b8Ip9CYpR9CDirACfy3uBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182225"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 08/13] drm/xe/tests: Add GuC KLV helpers basic tests
Date: Tue, 30 Jun 2026 15:26:27 +0200
Message-ID: <20260630132633.32804-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
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

We will be making more extensive use of GuC KLV helpers. Add simple
tests to ensure the helpers are working as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 99 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |  4 +
 2 files changed, 103 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
new file mode 100644
index 000000000000..f87189ef13d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+#include <kunit/test-bug.h>
+
+#define TEST_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3de)
+#define TEST_PAD	0xdeadbeef
+
+static void test_count(struct kunit *test)
+{
+	u32 value = 0x12345678;
+	u16 key = TEST_KEY;
+	u32 klvs[] = {
+		PREP_GUC_KLV(key + 0, 0),
+		PREP_GUC_KLV(key + 1, 1), value,
+		PREP_GUC_KLV(key + 2, 2), value, value,
+		PREP_GUC_KLV(key + 3, 0),
+		0, /* padding */
+	};
+
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_klv_count(klvs, 0));
+	KUNIT_EXPECT_EQ(test, 1, xe_guc_klv_count(klvs, 1));
+	KUNIT_EXPECT_GT(test, 0, xe_guc_klv_count(klvs, 2));
+	KUNIT_EXPECT_EQ(test, 2, xe_guc_klv_count(klvs, 3));
+	KUNIT_EXPECT_GT(test, 0, xe_guc_klv_count(klvs, 4));
+	KUNIT_EXPECT_GT(test, 0, xe_guc_klv_count(klvs, 5));
+	KUNIT_EXPECT_EQ(test, 3, xe_guc_klv_count(klvs, 6));
+	KUNIT_EXPECT_EQ(test, 4, xe_guc_klv_count(klvs, 7));
+
+	/* 0 is treated as reserved KLV { KEY=0, LEN=0 } */
+	KUNIT_EXPECT_EQ(test, 5, xe_guc_klv_count(klvs, 8));
+}
+
+static void test_encode_u32(struct kunit *test)
+{
+	u32 *fail = ERR_PTR(-ENOMEM);
+	u32 value = 0x12345678;
+	u16 key = TEST_KEY;
+	u32 klvs[16];
+
+	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC), xe_guc_klv_encode_u32(klvs, 0, key, value));
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC), xe_guc_klv_encode_u32(klvs, 1, key, value));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe_guc_klv_encode_u32(klvs, 2, key, value));
+	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, 1));
+	KUNIT_EXPECT_EQ(test, klvs[1], value);
+	KUNIT_EXPECT_EQ(test, klvs[2], TEST_PAD);
+	KUNIT_EXPECT_PTR_EQ(test, &klvs[2], xe_guc_klv_encode_u32(klvs, 2, key, value));
+	KUNIT_EXPECT_PTR_EQ(test,
+			    xe_guc_klv_encode_u32(klvs, 2, key, value),
+			    xe_guc_klv_encode_u32(klvs, ARRAY_SIZE(klvs), key, value));
+
+	KUNIT_ASSERT_PTR_EQ(test, fail, xe_guc_klv_encode_u32(fail, ARRAY_SIZE(klvs), key, value));
+}
+
+static void test_encode_u64(struct kunit *test)
+{
+	u64 value = 0x123456789abcdef0;
+	u32 *fail = ERR_PTR(-ENOMEM);
+	u16 key = TEST_KEY;
+	u32 klvs[16];
+
+	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC), xe_guc_klv_encode_u64(klvs, 0, key, value));
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC), xe_guc_klv_encode_u64(klvs, 1, key, value));
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC), xe_guc_klv_encode_u64(klvs, 2, key, value));
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe_guc_klv_encode_u64(klvs, 3, key, value));
+	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, 2));
+	KUNIT_EXPECT_EQ(test, klvs[1], lower_32_bits(value));
+	KUNIT_EXPECT_EQ(test, klvs[2], upper_32_bits(value));
+	KUNIT_EXPECT_EQ(test, klvs[3], TEST_PAD);
+	KUNIT_EXPECT_PTR_EQ(test, &klvs[3], xe_guc_klv_encode_u64(klvs, 3, key, value));
+	KUNIT_EXPECT_PTR_EQ(test,
+			    xe_guc_klv_encode_u64(klvs, 3, key, value),
+			    xe_guc_klv_encode_u64(klvs, ARRAY_SIZE(klvs), key, value));
+
+	KUNIT_ASSERT_PTR_EQ(test, fail, xe_guc_klv_encode_u64(fail, ARRAY_SIZE(klvs), key, value));
+}
+
+static struct kunit_case guc_klv_helpers_test_cases[] = {
+	KUNIT_CASE(test_count),
+	KUNIT_CASE(test_encode_u32),
+	KUNIT_CASE(test_encode_u64),
+	{}
+};
+
+static struct kunit_suite guc_klv_helpers_suite = {
+	.name = "guc_klv_helpers",
+	.test_cases = guc_klv_helpers_test_cases,
+};
+
+kunit_test_suite(guc_klv_helpers_suite);
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index 3f5c88e2c949..96f5cd2ab4f3 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -362,3 +362,7 @@ int xe_guc_klv_parser(const u32 *klvs, u32 num_dwords, void *obj,
 
 	return total;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_guc_klv_helpers_kunit.c"
+#endif
-- 
2.47.1

