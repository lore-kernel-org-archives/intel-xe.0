Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807BCC43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445C610EF25;
	Tue,  7 Jul 2026 22:08:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbmbcaFy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C460610EF25
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462117; x=1814998117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5D1uHEFVKnVewnkdYVcywRdd5IgqaHQHG3KEYyQw1kI=;
 b=VbmbcaFyyxg2SpLAJdeLDynlUxmNKsjRXNdqLNHhuoXJzw/vEkUyzoSj
 xifAhx3H7xuNnJSfXWVvghBhzF6M5eEuS3bytMs9d2UQDmYv+264cmyho
 349dxjrBdA+HmzbFLlbaOzL13ZEQAVCRPBUzg86cgHoLR8t+AOQm4cotF
 r59/0aM8Oo2LXAmhWCFwUbBF3XkX+3kbS1fn1IswlbEgwbdxRUDjn/Sj5
 rxj6M3S6wwpoAmkWlabLAoHCCoACJhgDCvBR8CoDo/KJI2mrQNsFPhetA
 6Qb7j9cGZMGj7Fk/2EyJT46apbfw9a5RCbkCl9Zj51/csEGotrhii9HUP g==;
X-CSE-ConnectionGUID: 5KOXT0WbQ32QYsCVbA6fqQ==
X-CSE-MsgGUID: KFeBhyUITUuuQpiNpGtJlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176545"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176545"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:37 -0700
X-CSE-ConnectionGUID: 3rDisbEiSU25mpOCbjuhAQ==
X-CSE-MsgGUID: AqsInTYsQW64j3eVt4r0Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487674"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:35 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 08/13] drm/xe/tests: Add GuC KLV helpers basic tests
Date: Wed,  8 Jul 2026 00:08:10 +0200
Message-ID: <20260707220816.677-9-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
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
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
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
index 9225a9066b8a..f0ad5adc6699 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -369,3 +369,7 @@ int xe_guc_klv_parser(const u32 *klvs, u32 num_dwords, void *obj,
 
 	return total;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_guc_klv_helpers_kunit.c"
+#endif
-- 
2.47.1

