Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F78C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494F410EF2A;
	Tue,  7 Jul 2026 22:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA3YEuuP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204D710EF2A
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462118; x=1814998118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YXapAW2Jbd2Ubb7G86nD3jd6KqtWKjpVirn3lGxy12M=;
 b=JA3YEuuPwYhezMoF/rpG7D5RVcPYtt69o9zMtIw0J4YHsYBQgNXn7buu
 uN3rGlv4n66qmJUa+JAkyXZ7cWzhCEeGT5Dc6QuUnJNN4aFKgXQbP0MKY
 PDQIvvGLuX6aB8Hh5x8PavXEp2OY5hMAzAy3fUZ+vAOaqMXG+22W7kVdU
 eWO9HuqgKTdvuuke/qyBRMzqBiU5JfwrhXX6B8iYZb47UueOdlxa/Ftg0
 r6LDEudWoQPyRJSrLSLxCvdP5yshcPzOgCulVSg5t+s7EZH5xY/yfHrNg
 xPzU0GILkS8oPW3PtxMyVZJVZEL/XaMyzTLYpbng6dQ1PgS9V6joKkr0j Q==;
X-CSE-ConnectionGUID: zUK8J7mYRaSByjWj1reBhQ==
X-CSE-MsgGUID: yBNFJFAIQ4+SWvILbIJJlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176547"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176547"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:38 -0700
X-CSE-ConnectionGUID: a7AEWAabTXKpF7/jW1CEIw==
X-CSE-MsgGUID: FP4QYUJMQ6uq1/CJYsEC8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487677"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 09/13] drm/xe/tests: Add string encoding helper test
Date: Wed,  8 Jul 2026 00:08:11 +0200
Message-ID: <20260707220816.677-10-michal.wajdeczko@intel.com>
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

Before we start using string to KLV encoding helper, add a simple
test to make sure it works as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com> #v1
---
v2: avoid using VLAs (Sashiko) and more (me)
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index f87189ef13d5..a0d6b72d45f3 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -84,10 +84,94 @@ static void test_encode_u64(struct kunit *test)
 	KUNIT_ASSERT_PTR_EQ(test, fail, xe_guc_klv_encode_u64(fail, ARRAY_SIZE(klvs), key, value));
 }
 
+static u32 str_klv_size(const char *string)
+{
+	return GUC_KLV_LEN_MIN + to_num_dwords(strlen(string) + 1);
+}
+
+static void test_encode_string(struct kunit *test)
+{
+	size_t longest_str = to_num_bytes(FIELD_MAX(GUC_KLV_0_LEN)) - 1;
+	u32 avail = GUC_KLV_LEN_MIN + FIELD_MAX(GUC_KLV_0_LEN) + 1;
+	const char *string = "abcdefghijklmnopqrstvwxyz";
+	u16 key = TEST_KEY;
+	u32 *klvs;
+	u32 *next;
+	char *buf;
+	u32 n;
+
+	klvs = kunit_kcalloc(test, avail, sizeof(u32), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, klvs);
+
+	buf = kunit_kzalloc(test, longest_str + 2, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, string);
+
+	/* empty string, no space, must fail */
+	for (n = 0; n < str_klv_size(""); n++) {
+		klvs[0] = TEST_PAD;
+		KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC),
+				    xe_guc_klv_encode_string(klvs, n, key, ""));
+		KUNIT_EXPECT_EQ(test, klvs[0], TEST_PAD);
+	}
+
+	/* empty string, must pass */
+	KUNIT_EXPECT_PTR_EQ(test, klvs + str_klv_size(""),
+			    xe_guc_klv_encode_string(klvs, str_klv_size(""), key, ""));
+	KUNIT_EXPECT_PTR_EQ(test, klvs + str_klv_size(""),
+			    xe_guc_klv_encode_string(klvs, avail, key, ""));
+
+	/* demo string, no space, must fail */
+	for (n = 0; n < str_klv_size(string); n++) {
+		klvs[0] = TEST_PAD;
+		KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC),
+				    xe_guc_klv_encode_string(klvs, n, key, string));
+		KUNIT_EXPECT_EQ(test, klvs[0], TEST_PAD);
+	}
+
+	/* different string len, must pass */
+	for (n = 0; n <= strlen(string); n++) {
+		strscpy(buf, string, n + 1);
+		kunit_info(test, "%u: '%s'\n", n, buf);
+		KUNIT_ASSERT_EQ(test, n, strlen(buf));
+		memset32(klvs, TEST_PAD, avail);
+
+		next = xe_guc_klv_encode_string(klvs, str_klv_size(buf), key, buf);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, next);
+		KUNIT_EXPECT_PTR_EQ(test, next, klvs + str_klv_size(buf));
+		KUNIT_EXPECT_STREQ_MSG(test, buf, (char *)(klvs + GUC_KLV_LEN_MIN), "n=%u", n);
+		kunit_info(test, "%u: %*ph\n", n, (int)to_num_bytes(next - klvs), klvs);
+		KUNIT_EXPECT_NE(test, *(next - 1), TEST_PAD);
+		KUNIT_ASSERT_EQ(test, *next, TEST_PAD);
+
+		/* bigger buf doesn't matter */
+		KUNIT_EXPECT_PTR_EQ(test,
+				    xe_guc_klv_encode_string(klvs, str_klv_size(buf), key, buf),
+				    xe_guc_klv_encode_string(klvs, avail, key, buf));
+	}
+
+	/* don't crash if already failed */
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-EROFS),
+			    xe_guc_klv_encode_string(ERR_PTR(-EROFS), avail, key, ""));
+
+	/* too long string, must fail */
+	memset(buf, 'X', longest_str + 1);
+	buf[longest_str + 1] = '\0';
+	KUNIT_EXPECT_LT(test, longest_str, strlen(buf));
+	KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-E2BIG),
+			    xe_guc_klv_encode_string(klvs, avail, key, buf));
+
+	/* longest string, should pass */
+	buf[longest_str] = '\0';
+	KUNIT_EXPECT_EQ(test, longest_str, strlen(buf));
+	KUNIT_EXPECT_PTR_EQ(test, klvs + str_klv_size(buf),
+			    xe_guc_klv_encode_string(klvs, avail, key, buf));
+}
+
 static struct kunit_case guc_klv_helpers_test_cases[] = {
 	KUNIT_CASE(test_count),
 	KUNIT_CASE(test_encode_u32),
 	KUNIT_CASE(test_encode_u64),
+	KUNIT_CASE(test_encode_string),
 	{}
 };
 
-- 
2.47.1

