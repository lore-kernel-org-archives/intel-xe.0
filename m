Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473BDC43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 18:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB7E10E64D;
	Wed,  8 Jul 2026 18:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mACxCzhA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF6410E64D
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 18:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783534091; x=1815070091;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=orNDnKdEZOlW7DKrAUHzsNZvQe0Ror4twiNGo9pFXyc=;
 b=mACxCzhANIt4DvEO8TL2oNAW0iO2+qN7k/Exd5JqG/S+h86Ac28u5gsV
 F0TN64CkqX7ftw+Z0QMZ6qb7SBGORo1ADpptq52beMwhy41Vz/xwdxfVU
 3zsYC5KnKyttKCNul1ZPiwvvQb7xi0sqro7cFnUUYr0pouq8Mg6TYfPXl
 97tTQld58z/fGoLrvHq8hWpeROyMjbCSpqJimmURbasHjNZzBYwLmuUd+
 hLhCsr42z0c3IyY96mr02Ly8C/Xz0W1b1JK4rsoz6HDFAidk3L44vwbX1
 ngmryhkcHB687AEmwzRzHPEZWdxEj7AyFw1TqDtTMGSHUiFE+ReiYhMNb w==;
X-CSE-ConnectionGUID: sR0NNTnXRGKL9Je+gT9V1g==
X-CSE-MsgGUID: 5x7SMMCbQyOLg7yCmoZX0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83322375"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="83322375"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 11:08:11 -0700
X-CSE-ConnectionGUID: BSzWId4XRKeI4T8uu0q/Jg==
X-CSE-MsgGUID: Se+zYFdmT8+8fkDIlP+f7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="255005023"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 11:08:10 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v3 09/13] drm/xe/tests: Add string encoding helper test
Date: Wed,  8 Jul 2026 20:07:55 +0200
Message-ID: <20260708180755.2684-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-10-michal.wajdeczko@intel.com>
References: <20260707220816.677-10-michal.wajdeczko@intel.com>
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
v3: check correct pointer (Sashiko)
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index f87189ef13d5..cb4b182d88d0 100644
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
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
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

