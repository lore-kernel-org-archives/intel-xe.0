Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7634CC43602
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:27:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3785C10E1A3;
	Tue, 30 Jun 2026 13:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i3CJ8Ojt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF5CD10E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826016; x=1814362016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QXSJsmoE1EXZWTR07cppHJNcysKJh6b8bsSLsLEhZTc=;
 b=i3CJ8OjtlC9U6rbx/ZMRTxcicywJ61HTfm8whFOfLWB+UYuPSkD5Fwi3
 y4tS+BRY5X0peOWFbPx6TVVUfAbUcPEvKpE4qFyGnjMuGoaiNRcn1NVwG
 cFFTjDQAgSINcFtjSuqa1zJhuUetwjXQohge3HfNEL4yvGZTrjWtYxda9
 r067aCqHxULwmNSbuUsXHSgcGaOH96y6lCWbtZkk0jcIrdoy/+7llHVUU
 H0xSv9sNE8V4z4tVQtPKSKhieMvKdQMwUn3lcytIMfdylh6czPJbXrgSI
 lm02/Y5vguOCzC/XUDwsMK23Czdw2Cu1wOsitZeR1lJ+3To/xxk+NJd4L g==;
X-CSE-ConnectionGUID: x/8WKX8qSm25oLKj7buPwg==
X-CSE-MsgGUID: fwFJgYH/Q6SsvBwygL/LjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623523"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:55 -0700
X-CSE-ConnectionGUID: SZ2lOi+CQGGW8mLwcwBYjg==
X-CSE-MsgGUID: uISZ6zUkSD6O9yOfdRseCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182236"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:55 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 10/13] drm/xe/tests: Add object encoding helper test
Date: Tue, 30 Jun 2026 15:26:29 +0200
Message-ID: <20260630132633.32804-11-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630132633.32804-1-michal.wajdeczko@intel.com>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
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

We will soon be encoding complex objects as KLVs using our helper
function. Add few simple tests to make sure this helper function
works as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 162 ++++++++++++++++++
 1 file changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index c2d5f0098816..9a8acc85e9f1 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -7,6 +7,7 @@
 #include <kunit/test-bug.h>
 
 #define TEST_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3de)
+#define TEST_GROUP_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3f0)
 #define TEST_PAD	0xdeadbeef
 
 static void test_count(struct kunit *test)
@@ -129,11 +130,172 @@ static void test_encode_string(struct kunit *test)
 			    xe_guc_klv_encode_string(failed, ARRAY_SIZE(klvs), key, string));
 }
 
+struct some_object {
+	u32 value1;
+	u64 value2;
+} __packed;
+
+static u32 *obj_raw_encoder(u32 *klvs, u32 avail, const void *arg)
+{
+	const struct some_object *obj = arg;
+	size_t sz = sizeof(*obj);
+	u32 dwords = to_num_dwords(sz);
+
+	if (IS_ERR(klvs))
+		return klvs;
+	if (dwords > avail)
+		return ERR_PTR(-ENOSPC);
+	memcpy(klvs, obj, sz);
+	return klvs + dwords;
+}
+
+static u32 *obj_klv_encoder(u32 *klvs, u32 avail, const void *arg)
+{
+	const struct some_object *obj = arg;
+	u32 *end = klvs + avail;
+
+	klvs = xe_guc_klv_encode_u32(klvs, end - klvs, TEST_KEY + 1, obj->value1);
+	klvs = xe_guc_klv_encode_u64(klvs, end - klvs, TEST_KEY + 2, obj->value2);
+	return klvs;
+}
+
+static u32 *obj_nested_encoder(u32 *klvs, u32 avail, const void *arg)
+{
+	u32 *end = klvs + avail;
+
+	klvs = xe_guc_klv_encode_object(klvs, end - klvs, TEST_GROUP_KEY + 1,
+					arg, obj_klv_encoder);
+	klvs = xe_guc_klv_encode_object(klvs, end - klvs, TEST_GROUP_KEY + 2,
+					arg, obj_klv_encoder);
+	return klvs;
+}
+
+static void test_encode_object_raw(struct kunit *test)
+{
+	const struct some_object obj = {
+		.value1 = 0xdead1234,
+		.value2 = 0xdead87654321dead,
+	};
+	u32 payload = to_num_dwords(sizeof(obj));
+	u32 *err = ERR_PTR(-ENOSPC);
+	u16 key = TEST_KEY;
+	u32 klvs[16];
+	u32 n;
+
+	/* too small, must fail */
+	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
+		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
+					xe_guc_klv_encode_object(klvs, n, key, &obj,
+								 obj_raw_encoder),
+					"buf size=%u dwords", n);
+	}
+
+	/* must pass */
+	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
+							      key, &obj, obj_raw_encoder));
+	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
+	KUNIT_EXPECT_MEMEQ(test, &klvs[1], &obj, sizeof(obj));
+
+	/* already failed, must fail */
+	KUNIT_ASSERT_PTR_EQ(test, err,
+			    xe_guc_klv_encode_object(err, ARRAY_SIZE(klvs), key,
+						     &obj, obj_raw_encoder));
+}
+
+static void test_encode_object_klv(struct kunit *test)
+{
+	const struct some_object obj = {
+		.value1 = 0xdead1234,
+		.value2 = 0xdead87654321dead,
+	};
+	u16 key = TEST_GROUP_KEY;
+	u32 payload = 0;
+	u32 klvs[16];
+	u32 n;
+
+	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value1));
+	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value2));
+
+	/* too small, must fail */
+	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
+		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
+					xe_guc_klv_encode_object(klvs, n, key, &obj,
+								 obj_klv_encoder),
+					"buf size=%u dwords", n);
+	}
+
+	/* must pass */
+	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
+							      key, &obj, obj_klv_encoder));
+	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
+	KUNIT_EXPECT_EQ(test, klvs[1], PREP_GUC_KLV(TEST_KEY + 1, 1));
+	KUNIT_EXPECT_EQ(test, klvs[2], obj.value1);
+	KUNIT_EXPECT_EQ(test, klvs[3], PREP_GUC_KLV(TEST_KEY + 2, 2));
+	KUNIT_EXPECT_EQ(test, klvs[4], lower_32_bits(obj.value2));
+	KUNIT_EXPECT_EQ(test, klvs[5], upper_32_bits(obj.value2));
+	KUNIT_EXPECT_EQ(test, klvs[6], TEST_PAD);
+}
+
+static void test_encode_object_nested(struct kunit *test)
+{
+	const struct some_object obj = {
+		.value1 = 0xdead1234,
+		.value2 = 0xdead87654321dead,
+	};
+	u16 key = TEST_GROUP_KEY;
+	u32 payload = 0;
+	u32 klvs[16];
+	u32 n;
+
+	payload += GUC_KLV_LEN_MIN;
+	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value1));
+	payload += GUC_KLV_LEN_MIN + to_num_dwords(sizeof(obj.value2));
+	payload *= 2;
+
+	/* too small, must fail */
+	for (n = 0; n < GUC_KLV_LEN_MIN + payload; n++) {
+		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+		KUNIT_EXPECT_PTR_EQ_MSG(test, ERR_PTR(-ENOSPC),
+					xe_guc_klv_encode_object(klvs, n, key, &obj,
+								 obj_nested_encoder),
+					"buf size=%u dwords", n);
+	}
+
+	/* must pass */
+	memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
+				     xe_guc_klv_encode_object(klvs, GUC_KLV_LEN_MIN + payload,
+							      key, &obj, obj_nested_encoder));
+	KUNIT_EXPECT_EQ(test, klvs[0], PREP_GUC_KLV(key, payload));
+	KUNIT_EXPECT_EQ(test, klvs[1], PREP_GUC_KLV(TEST_GROUP_KEY + 1, 5));
+	KUNIT_EXPECT_EQ(test, klvs[2], PREP_GUC_KLV(TEST_KEY + 1, 1));
+	KUNIT_EXPECT_EQ(test, klvs[3], obj.value1);
+	KUNIT_EXPECT_EQ(test, klvs[4], PREP_GUC_KLV(TEST_KEY + 2, 2));
+	KUNIT_EXPECT_EQ(test, klvs[5], lower_32_bits(obj.value2));
+	KUNIT_EXPECT_EQ(test, klvs[6], upper_32_bits(obj.value2));
+	KUNIT_EXPECT_EQ(test, klvs[7], PREP_GUC_KLV(TEST_GROUP_KEY + 2, 5));
+	KUNIT_EXPECT_EQ(test, klvs[8], PREP_GUC_KLV(TEST_KEY + 1, 1));
+	KUNIT_EXPECT_EQ(test, klvs[9], obj.value1);
+	KUNIT_EXPECT_EQ(test, klvs[10], PREP_GUC_KLV(TEST_KEY + 2, 2));
+	KUNIT_EXPECT_EQ(test, klvs[11], lower_32_bits(obj.value2));
+	KUNIT_EXPECT_EQ(test, klvs[12], upper_32_bits(obj.value2));
+	KUNIT_EXPECT_EQ(test, klvs[13], TEST_PAD);
+}
+
 static struct kunit_case guc_klv_helpers_test_cases[] = {
 	KUNIT_CASE(test_count),
 	KUNIT_CASE(test_encode_u32),
 	KUNIT_CASE(test_encode_u64),
 	KUNIT_CASE(test_encode_string),
+	KUNIT_CASE(test_encode_object_raw),
+	KUNIT_CASE(test_encode_object_klv),
+	KUNIT_CASE(test_encode_object_nested),
 	{}
 };
 
-- 
2.47.1

