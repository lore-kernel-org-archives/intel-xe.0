Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C590AC43602
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A1D10EF35;
	Tue,  7 Jul 2026 22:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HA9WAlDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F6410EF2A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462120; x=1814998120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IlpTR0MGoXywjW75Db8vk3TCcQa5LaukSv7UTGSEK08=;
 b=HA9WAlDxiqTRp4rPgvQPOKc4vAnMvB7kLgij34WpE+4/Deb0UYWtROqB
 hKQEFGHdSYXCQLIuHTp/BlnWKnUDb6im10fqfLnc1jHHf8E9XKzo/IJ6m
 KkiqfoUZlv0vv6hrfDCfsmfA24Rh5kDmC7McxSQkqVR4ZuD5ggFzVcxqP
 VP/4IatQbmTYbfWrP88U8CMrFNJ1p0jct49W9QPv5A7Dg07t/oqeQp9l7
 T3to19EWP4YZJKGfd07naFUTW2YSWePpAdFlk+UgjVg02BEpMcRw1CHci
 SM3NOV0pvHvxIPPICPm59VIlHzhzls2Jbs76TCN4xHfAOxLKGjJ35A9EN Q==;
X-CSE-ConnectionGUID: EuUkF7vRT3mzQ5GPl3Aa0w==
X-CSE-MsgGUID: BAbyCb/xQ4aZVKUztOPs9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176548"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176548"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:40 -0700
X-CSE-ConnectionGUID: VRJEXGNYSSKWsAYJW5Fdwg==
X-CSE-MsgGUID: I5BnoST4QsKj6UBU6prGrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487682"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:38 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 10/13] drm/xe/tests: Add object encoding helper test
Date: Wed,  8 Jul 2026 00:08:12 +0200
Message-ID: <20260707220816.677-11-michal.wajdeczko@intel.com>
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

We will soon be encoding complex objects as KLVs using our helper
function. Add few simple tests to make sure this helper function
works as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
v2: add more negative tests (me)
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index a0d6b72d45f3..196e03fa5a1f 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -7,6 +7,7 @@
 #include <kunit/test-bug.h>
 
 #define TEST_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3de)
+#define TEST_GROUP_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3f0)
 #define TEST_PAD	0xdeadbeef
 
 static void test_count(struct kunit *test)
@@ -167,11 +168,230 @@ static void test_encode_string(struct kunit *test)
 			    xe_guc_klv_encode_string(klvs, avail, key, buf));
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
+static u32 *obj_echo_encoder(u32 *klvs, u32 avail, const void *arg)
+{
+	return ERR_CAST(arg);
+}
+
+static void test_encode_object_basic(struct kunit *test)
+{
+	u32 longest = GUC_KLV_LEN_MIN + FIELD_MAX(GUC_KLV_0_LEN);
+	u32 avail = GUC_KLV_LEN_MIN + longest;
+	u16 key = TEST_GROUP_KEY;
+	u32 *klvs;
+
+	klvs = kunit_kcalloc(test, avail, sizeof(u32), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, klvs);
+
+	/* smallest */
+	KUNIT_EXPECT_PTR_EQ(test, klvs + GUC_KLV_LEN_MIN,
+			    xe_guc_klv_encode_object(klvs, avail, key,
+						     klvs + GUC_KLV_LEN_MIN,
+						     obj_echo_encoder));
+	/* largest */
+	KUNIT_EXPECT_PTR_EQ(test, klvs + longest,
+			    xe_guc_klv_encode_object(klvs, avail, key,
+						     klvs + longest,
+						     obj_echo_encoder));
+	/* already failed */
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-EROFS),
+			    xe_guc_klv_encode_object(ERR_PTR(-EROFS), avail, key,
+						     klvs + GUC_KLV_LEN_MIN,
+						     obj_echo_encoder));
+	/* encoding error */
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-EUCLEAN),
+			    xe_guc_klv_encode_object(klvs, avail, key,
+						     ERR_PTR(-EUCLEAN),
+						     obj_echo_encoder));
+	/* no space */
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC),
+			    xe_guc_klv_encode_object(klvs, 0, key,
+						     klvs + GUC_KLV_LEN_MIN,
+						     obj_echo_encoder));
+	/* faulty encoder */
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-EPIPE),
+				    xe_guc_klv_encode_object(klvs, avail, key,
+							     klvs - GUC_KLV_LEN_MIN,
+							     obj_echo_encoder));
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
+	kunit_warning_suppress(test) {
+		KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-EFBIG),
+				    xe_guc_klv_encode_object(klvs, avail, key,
+							     klvs + longest + 1,
+							     obj_echo_encoder));
+		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
+	}
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
+	KUNIT_CASE(test_encode_object_basic),
 	{}
 };
 
-- 
2.47.1

