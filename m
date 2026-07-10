Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2217C43458
	for <intel-xe@archiver.kernel.org>; Fri, 10 Jul 2026 19:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B0A10E1EC;
	Fri, 10 Jul 2026 19:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFmft89A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7007D10E1EC
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Jul 2026 19:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783713595; x=1815249595;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ALopfRX9HXiwtbxBerr7Y2So2r87KPmytgoArh+4dZc=;
 b=QFmft89AjuguqMwbAjUeKArpCUdmaBZ8msvhpJfmzj80cZQN/r+nC5pY
 auIWU14fV0UwnX9JdJ3sVsFYLtDcd8NBLhLKLby2P1xgnptw5lwy8uTps
 3PuV2d/i3wOnGPGgsr7cKRbWOMk7o81tH1enOeayw5vaWoFfFIin9KtG7
 2fcX4+NpXJzOrMziC62gwLic3c94sl/CRyhTv/qD7UCx3LYr5EV5srZbP
 +cs94uhU6QJZUBwJAVn2R+sF1g9FSu1Ao6k/vE9vMwgv/QOa2YbShTipe
 eiZhp7HoA+eWlodFHB1sn5F1+qx9XiAbNvSaifQlfdXXfmyY4X+gnsWkc g==;
X-CSE-ConnectionGUID: /wS8EtUBREu0RqQA2tNm5A==
X-CSE-MsgGUID: UR2/7yjPR063pdzBZmRx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95020380"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95020380"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 12:59:55 -0700
X-CSE-ConnectionGUID: OTTP/MbOQHSog23oCgplLw==
X-CSE-MsgGUID: vLJCNoGoQ2Gkj7SokEthwg==
X-ExtLoop1: 1
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2026 12:59:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 10/13] drm/xe/tests: Add object encoding helper test
Date: Fri, 10 Jul 2026 21:59:45 +0200
Message-ID: <20260710195945.7316-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-11-michal.wajdeczko@intel.com>
References: <20260707220816.677-11-michal.wajdeczko@intel.com>
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
v3: drop faulty encoder for now (drm-xe-next)
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 205 ++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index cb4b182d88d0..33d7a52f6bf8 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -7,6 +7,7 @@
 #include <kunit/test-bug.h>
 
 #define TEST_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3de)
+#define TEST_GROUP_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3f0)
 #define TEST_PAD	0xdeadbeef
 
 static void test_count(struct kunit *test)
@@ -167,11 +168,215 @@ static void test_encode_string(struct kunit *test)
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

