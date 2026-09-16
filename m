Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D82C982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 21:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F2410E2E5;
	Wed, 16 Sep 2026 21:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQp9scr4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CF710E2E5
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 21:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789595928; x=1821131928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LnzZqF/OxjRMH/NgN3SZZLhdF51+tF8JWIeC5a/xtdU=;
 b=OQp9scr4E9W1Hpng9gHB5HMXz7kTX45+/74BqE5Ct+dr/NLbdPijmqHH
 aEY4VzrzYVLVzCW/0upNRmK4xm2RhNtgW3TBCOhFZKy9mJ1coifBNjMdp
 M3+VDzMn8DtOZyKcNW16Z3wK+deC15yQVCeNTrucPRPxiSv8z3g9vW6j9
 5nHs/eOygljgE2OVe/1NvoHHphEG6lKx2dZ9XnT7nvTw7vnuY93nNTPV2
 GujKbLwMsbZuEk8Lu45W6E3sehijkIzuyUUOC+UpvqNLozI+1e1Fb/dm6
 Jn/fwH+AJame0RmeZCr4Bl/EETE6W+iQWbSN1CmNSoTCrU6K7HsSgL5d6 g==;
X-CSE-ConnectionGUID: KBnP9zNCT32N+I4ydU0XZQ==
X-CSE-MsgGUID: CdC2a5cZQBWXh7bRnV0lrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101325124"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101325124"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:48 -0700
X-CSE-ConnectionGUID: 9KVpdv7BQt6pEd/+Y6YyOQ==
X-CSE-MsgGUID: s7BwTqacQoa+qg2J0vLaLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="267247873"
Received: from awalabdu-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.64.211])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 14:58:46 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 2/3] drm/xe/tests: Add kunit tests for KLV decoders
Date: Wed, 16 Sep 2026 23:58:26 +0200
Message-ID: <20260916215827.13488-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916215827.13488-1-michal.wajdeczko@intel.com>
References: <20260916215827.13488-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
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

Make sure that recently added KLV helpers work as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 303 ++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index 82869363ab7e..4f7c81c9ebb8 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -373,6 +373,305 @@ static void test_encode_object_basic(struct kunit *test)
 						     obj_echo_encoder));
 }
 
+static const struct {
+	u32 klvs[4];
+	int expected_err;
+	u16 expected_val;
+	const char *name;
+} decode_u16_params[] = {
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 0), ~0 },
+		.expected_err = -ENODATA,
+		.expected_val = 0xdead,
+		.name = "empty",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 1), 1, ~0 },
+		.expected_err = 0,
+		.expected_val = 1,
+		.name = "valid",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 1), U16_MAX, ~0 },
+		.expected_err = 0,
+		.expected_val = U16_MAX,
+		.name = "max",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 1), U16_MAX + 1, ~0 },
+		.expected_err = -EOVERFLOW,
+		.expected_val = 0xdead,
+		.name = "big",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 2), 1, 2, ~0 },
+		.expected_err = -ENOMSG,
+		.expected_val = 0xdead,
+		.name = "long",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(decode_u16, decode_u16_params, name);
+
+static void test_decode_u16(struct kunit *test)
+{
+	typeof(decode_u16_params[0]) *param = test->param_value;
+	const u32 *klvs = param->klvs;
+	const u32 *value = klvs + GUC_KLV_LEN_MIN;
+	u16 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+	u16 data = 0xdead;
+
+	KUNIT_ASSERT_EQ(test, param->expected_err, xe_guc_klv_decode_u16(value, len, &data));
+	KUNIT_ASSERT_EQ(test, param->expected_val, data);
+}
+
+static const struct {
+	u32 klvs[4];
+	int expected_err;
+	u32 expected_val;
+	const char *name;
+} decode_u32_params[] = {
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 0), ~0 },
+		.expected_err = -ENODATA,
+		.expected_val = 0xdead,
+		.name = "empty",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 1), 1, ~0 },
+		.expected_err = 0,
+		.expected_val = 1,
+		.name = "valid",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 1), U32_MAX, ~0 },
+		.expected_err = 0,
+		.expected_val = U32_MAX,
+		.name = "max",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 2), 1, 2, ~0 },
+		.expected_err = -ENOMSG,
+		.expected_val = 0xdead,
+		.name = "long",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(decode_u32, decode_u32_params, name);
+
+static void test_decode_u32(struct kunit *test)
+{
+	typeof(decode_u32_params[0]) *param = test->param_value;
+	const u32 *klvs = param->klvs;
+	const u32 *value = klvs + GUC_KLV_LEN_MIN;
+	u16 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+	u32 data = 0xdead;
+
+	KUNIT_ASSERT_EQ(test, param->expected_err, xe_guc_klv_decode_u32(value, len, &data));
+	KUNIT_ASSERT_EQ(test, param->expected_val, data);
+}
+
+static const struct {
+	u32 klvs[4];
+	int expected_err;
+	u64 expected_val;
+	const char *name;
+} decode_u64_params[] = {
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 0), ~0 },
+		.expected_err = -ENODATA,
+		.expected_val = 0xdead,
+		.name = "empty",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 1), 1, ~0, },
+		.expected_err = -ENODATA,
+		.expected_val = 0xdead,
+		.name = "short",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 2), 1, 2, ~0 },
+		.expected_err = 0,
+		.expected_val = 0x200000001,
+		.name = "valid",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 2), U32_MAX, U32_MAX, 3 },
+		.expected_err = 0,
+		.expected_val = U64_MAX,
+		.name = "max",
+	},
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 3), 1, 2, 3, },
+		.expected_err = -ENOMSG,
+		.expected_val = 0xdead,
+		.name = "long",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(decode_u64, decode_u64_params, name);
+
+static void test_decode_u64(struct kunit *test)
+{
+	typeof(decode_u64_params[0]) *param = test->param_value;
+	const u32 *klvs = param->klvs;
+	const u32 *value = klvs + GUC_KLV_LEN_MIN;
+	u16 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+	u64 data = 0xdead;
+
+	KUNIT_ASSERT_EQ(test, param->expected_err, xe_guc_klv_decode_u64(value, len, &data));
+	KUNIT_ASSERT_EQ(test, param->expected_val, data);
+}
+
+#define make_u32(a, b, c, d) \
+	(FIELD_PREP_CONST(GENMASK_U32(31, 24), (a)) | \
+	 FIELD_PREP_CONST(GENMASK_U32(23, 16), (b)) | \
+	 FIELD_PREP_CONST(GENMASK_U32(15, 8), (c)) | \
+	 FIELD_PREP_CONST(GENMASK_U32(7, 0), (d)))
+
+static const struct {
+	u32 klvs[4];
+	int expected_err;
+	const char *expected_str;
+	const char *name;
+} decode_str_params[] = {
+	{
+		.klvs = { PREP_GUC_KLV_CONST(TEST_KEY, 0), 'a', ~0 },
+		.expected_err = -ENOMSG,
+		.expected_str = NULL,
+		.name = "empty",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 1),
+				make_u32(0, 0, 0, '1'),
+			},
+		.expected_err = 0,
+		.expected_str = "1",
+		.name = "one",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 1),
+				make_u32('3', '2', 0, '1'),
+				'4', ~0
+			},
+		.expected_err = 0,
+		.expected_str = "1",
+		.name = "one_trash",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 1),
+				make_u32(0, 0, '2', '1'),
+				'3', ~0
+			},
+		.expected_err = 0,
+		.expected_str = "12",
+		.name = "two",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 1),
+				make_u32('3', 0, '2', '1'),
+				'4', ~0
+			},
+		.expected_err = 0,
+		.expected_str = "12",
+		.name = "two_trash",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 1),
+				make_u32(0, '3', '2', '1'),
+				'4', ~0
+			},
+		.expected_err = 0,
+		.expected_str = "123",
+		.name = "three",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 1),
+				make_u32('4', '3', '2', '1'),
+				'5', ~0
+			},
+		.expected_err = 0,
+		.expected_str = "1234",
+		.name = "dword",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 2),
+				make_u32('4', '3', '2', '1'),
+				0, ~0
+			},
+		.expected_err = 0,
+		.expected_str = "1234",
+		.name = "four",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 2),
+				make_u32('4', '3', '2', '1'),
+				make_u32(0, 0, 0, '5'),
+				~0,
+			},
+		.expected_err = 0,
+		.expected_str = "12345",
+		.name = "five",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 2),
+				make_u32('4', '3', '2', '1'),
+				make_u32(0, 0, '6', '5'),
+				~0,
+			},
+		.expected_err = 0,
+		.expected_str = "123456",
+		.name = "six",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 2),
+				make_u32('4', '3', '2', '1'),
+				make_u32(0, '7', '6', '5'),
+				~0,
+			},
+		.expected_err = 0,
+		.expected_str = "1234567",
+		.name = "seven",
+	},
+	{
+		.klvs = {
+				PREP_GUC_KLV_CONST(TEST_KEY, 2),
+				make_u32('4', '3', '2', '1'),
+				make_u32('8', '7', '6', '5'),
+				~0,
+			},
+		.expected_err = 0,
+		.expected_str = "12345678",
+		.name = "qword",
+	},
+};
+
+KUNIT_ARRAY_PARAM_DESC(decode_str, decode_str_params, name);
+
+static void test_decode_str(struct kunit *test)
+{
+	typeof(decode_str_params[0]) *param = test->param_value;
+	const u32 *klvs = param->klvs;
+	const u32 *value = klvs + GUC_KLV_LEN_MIN;
+	u16 len = FIELD_GET(GUC_KLV_0_LEN, klvs[0]);
+	char *data = NULL;
+
+	KUNIT_EXPECT_EQ(test, param->expected_err, xe_guc_klv_decode_string(value, len, &data));
+	if (!param->expected_err)
+		KUNIT_EXPECT_STREQ(test, param->expected_str, data);
+	kfree(data);
+}
+
 static void __drm_printfn_kunit(struct drm_printer *p, struct va_format *vaf)
 {
 	struct kunit *test = p->arg;
@@ -417,6 +716,10 @@ static struct kunit_case guc_klv_helpers_test_cases[] = {
 	KUNIT_CASE(test_encode_object_klv),
 	KUNIT_CASE(test_encode_object_nested),
 	KUNIT_CASE(test_encode_object_basic),
+	KUNIT_CASE_PARAM(test_decode_u16, decode_u16_gen_params),
+	KUNIT_CASE_PARAM(test_decode_u32, decode_u32_gen_params),
+	KUNIT_CASE_PARAM(test_decode_u64, decode_u64_gen_params),
+	KUNIT_CASE_PARAM(test_decode_str, decode_str_gen_params),
 	KUNIT_CASE(test_print),
 	{}
 };
-- 
2.47.1

