Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E3CD1292
	for <intel-xe@archiver.kernel.org>; Mon,  8 Apr 2024 18:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D0E112934;
	Mon,  8 Apr 2024 18:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEnIq2RP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B746112934
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Apr 2024 18:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712600069; x=1744136069;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2uoJN3yjoq/qDaLrpO7BuXM7+cKiBsPIuUcj9AiqnsQ=;
 b=SEnIq2RPCPKYzMPQa0Z11NuKaQ1ydhD21SjJwwlzkxhOLRyQ519fe2x6
 +3BFTDEnh33G4H9qtBhdQ8pQnfC4Gvhq+fQgeUcGCDkt5ZxFLPRWS0LQS
 sm/8zrbk5U1mn9rKNFo3kFgdKAJrvlrnh/jSR21szM37kOSbMMhmC+2EZ
 OkytEP/qKhofCyuTzwpPtQSZCZpyN8wNrrMOPZwC0XyFIiZ2lwBT+15Fi
 z0hbZd9nmNfsbk9zCxzus01SUR4Hb09nI0Wkd9b6JHwcmwiLyWy5txSky
 EWCkuymXPqqG1buPhhMl/Za8PkDrfjdpYaP2pRAnydO19tFayFXKaqJUz A==;
X-CSE-ConnectionGUID: dqmhAkw5Taei91wA4xxmxA==
X-CSE-MsgGUID: +lnBB5f2SdeWIc4OV1qUbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30383395"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="30383395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:14:29 -0700
X-CSE-ConnectionGUID: 2QWGtzCQS/KFlyg5iE0wVg==
X-CSE-MsgGUID: mbHV0FU2SeWWCkFcl/5blw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="24758838"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.158.202])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 11:14:27 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/2] drm/xe/kunit: Add tests for GuC KLV helpers
Date: Mon,  8 Apr 2024 20:14:08 +0200
Message-Id: <20240408181408.1023-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240408181408.1023-1-michal.wajdeczko@intel.com>
References: <20240408181408.1023-1-michal.wajdeczko@intel.com>
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

We should make sure that recently added GuC KLV helpers are always
working as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_test.c    | 200 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c       |   4 +
 2 files changed, 204 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
new file mode 100644
index 000000000000..094cd9922c73
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_test.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+static void bad_key_to_string(struct kunit *test)
+{
+	u16 key = 0xFFFF;
+
+	KUNIT_EXPECT_NOT_NULL(test, xe_guc_klv_key_to_string(key));
+	KUNIT_EXPECT_STREQ(test, xe_guc_klv_key_to_string(key), "(unknown)");
+}
+
+static void good_key_to_string(struct kunit *test)
+{
+	u16 key = 0x0001; /* GUC_KLV_VF_CFG_GGTT_START */
+
+	KUNIT_EXPECT_NOT_NULL(test, xe_guc_klv_key_to_string(key));
+	KUNIT_EXPECT_STRNEQ(test, xe_guc_klv_key_to_string(key), "(unknown)");
+}
+
+static void __to_buf_printfn(struct drm_printer *p, struct va_format *vaf)
+{
+	char *buf = p->arg;
+
+	 sprintf(buf, "%pV", vaf);
+}
+
+static struct drm_printer buf_printer(char *buf)
+{
+	struct drm_printer p = {
+		.printfn = __to_buf_printfn,
+		.arg = buf,
+	};
+	return p;
+}
+
+static void print_empty_klv(struct kunit *test)
+{
+	char buf[128] = {};
+	struct drm_printer p = buf_printer(buf);
+	u32 klv[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+	};
+
+	KUNIT_EXPECT_STREQ(test, buf, "");
+	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
+	KUNIT_EXPECT_STRNEQ(test, buf, "");
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "no value"));
+	kunit_info(test, "%s", buf);
+}
+
+static void print_klv32(struct kunit *test)
+{
+	char buf[128] = {};
+	struct drm_printer p = buf_printer(buf);
+	u32 klv[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 1),
+		12345678,
+	};
+
+	KUNIT_EXPECT_STREQ(test, buf, "");
+	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
+	KUNIT_EXPECT_STRNEQ(test, buf, "");
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "32b value"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "12345678"));
+	kunit_info(test, "%s", buf);
+}
+
+static void print_klv64(struct kunit *test)
+{
+	char buf[128] = {};
+	struct drm_printer p = buf_printer(buf);
+	u32 klv[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
+		0x87654321,
+		0x12345678,
+	};
+
+	KUNIT_EXPECT_STREQ(test, buf, "");
+	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
+	KUNIT_EXPECT_STRNEQ(test, buf, "");
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "64b value"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "0x1234567887654321"));
+	kunit_info(test, "%s", buf);
+}
+
+static void print_big_klv(struct kunit *test)
+{
+	char buf[128] = {};
+	struct drm_printer p = buf_printer(buf);
+	u32 klv[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 3),
+		0x11111111,
+		0x22222222,
+		0x33333333,
+	};
+
+	KUNIT_EXPECT_STREQ(test, buf, "");
+	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
+	KUNIT_EXPECT_STRNEQ(test, buf, "");
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "bytes"));
+	KUNIT_EXPECT_NULL(test, strstr(buf, "truncated"));
+	kunit_info(test, "%s", buf);
+}
+
+static void print_truncated_klv(struct kunit *test)
+{
+	char buf[128] = {};
+	struct drm_printer p = buf_printer(buf);
+	u32 klv[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
+		0x04030201,
+	};
+
+	KUNIT_EXPECT_STREQ(test, buf, "");
+	xe_guc_klv_print(klv, ARRAY_SIZE(klv), &p);
+	KUNIT_EXPECT_STRNEQ(test, buf, "");
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "key"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "truncated"));
+	KUNIT_EXPECT_NOT_NULL(test, strstr(buf, "bytes"));
+	kunit_info(test, "%s", buf);
+}
+
+static void count_no_klvs(struct kunit *test)
+{
+	u32 klvs[GUC_KLV_LEN_MIN];
+
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_klv_count(NULL, 0));
+	KUNIT_EXPECT_EQ(test, 0, xe_guc_klv_count(klvs, 0));
+}
+
+static void count_empty_klvs(struct kunit *test)
+{
+	u32 klvs[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+	};
+	size_t n;
+
+	for (n = 1; n <= ARRAY_SIZE(klvs); n++)
+		KUNIT_EXPECT_EQ(test, n, xe_guc_klv_count(klvs, n));
+}
+
+static void count_mixed_klvs(struct kunit *test)
+{
+	u32 klvs[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 1) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+		FIELD_PREP(GUC_KLV_0_KEY, 2) | FIELD_PREP(GUC_KLV_0_LEN, 1),
+		1,
+		FIELD_PREP(GUC_KLV_0_KEY, 3) | FIELD_PREP(GUC_KLV_0_LEN, 2),
+		1, 2,
+		FIELD_PREP(GUC_KLV_0_KEY, 4) | FIELD_PREP(GUC_KLV_0_LEN, 3),
+		1, 2, 3,
+		FIELD_PREP(GUC_KLV_0_KEY, 5) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+	};
+
+	KUNIT_EXPECT_NE(test, 5, ARRAY_SIZE(klvs));
+	KUNIT_EXPECT_EQ(test, 5, xe_guc_klv_count(klvs, ARRAY_SIZE(klvs)));
+}
+
+static void count_truncated_klvs(struct kunit *test)
+{
+	u32 klvs[] = {
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 0),
+		FIELD_PREP(GUC_KLV_0_KEY, 0) | FIELD_PREP(GUC_KLV_0_LEN, 2),
+	};
+
+	KUNIT_EXPECT_GT(test, 0, xe_guc_klv_count(klvs, ARRAY_SIZE(klvs)));
+}
+
+static struct kunit_case guc_klv_helpers_test_cases[] = {
+	KUNIT_CASE(bad_key_to_string),
+	KUNIT_CASE(good_key_to_string),
+	KUNIT_CASE(print_empty_klv),
+	KUNIT_CASE(print_klv32),
+	KUNIT_CASE(print_klv64),
+	KUNIT_CASE(print_big_klv),
+	KUNIT_CASE(print_truncated_klv),
+	KUNIT_CASE(count_no_klvs),
+	KUNIT_CASE(count_empty_klvs),
+	KUNIT_CASE(count_mixed_klvs),
+	KUNIT_CASE(count_truncated_klvs),
+	{}
+};
+
+static struct kunit_suite guc_klv_helpers_suite = {
+	.name = "guc_klv",
+	.test_cases = guc_klv_helpers_test_cases,
+};
+
+kunit_test_suites(&guc_klv_helpers_suite);
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
index c39fda08afcb..bc98a80cc209 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
+++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
@@ -131,3 +131,7 @@ int xe_guc_klv_count(const u32 *klvs, u32 num_dwords)
 
 	return num_dwords ? -ENODATA : num_klvs;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_guc_klv_helpers_test.c"
+#endif
-- 
2.43.0

