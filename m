Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23E2C44500
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:27:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4715210EA15;
	Tue, 30 Jun 2026 13:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R4jlkl1t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8961410E1D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826014; x=1814362014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6MB4fxFN71pvVz8nbohxANOc4efRGPAzoI4bcsJve1U=;
 b=R4jlkl1tHobODuyUVwpWqs9+i4rWs+v+rJAngWFR1GceAOYrOrXKehv+
 /ByuK/w9UPufFMJQndI+kJ4Dsq+9PDSrHRNFwifSQln7KlEMnFpu2SLPp
 BVUYly/z/OoODbJpacoHu6Lsub2toSoEbbKQ7dKPzL3xI030D14OOLGHV
 CIT1e4YA28lYU1HCybLvy4C1E1hCnUnMANpicyAMe3YVEuTI8V4SVvga8
 OM5kJ1W01gXNO8F0x/qOZRZasm8bz3BPovuJaB5iwho+OsPdAGpMNwTDC
 HVsvd5/T2zErrTEBzvc5PQ5KbWW02hPls/tWqgIc48ZWys2b72I3od6sd w==;
X-CSE-ConnectionGUID: 1bPNnWAHRaigfivhA5O/GQ==
X-CSE-MsgGUID: ovXbk9D5Tc+IpBwcoY4AiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623522"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623522"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:54 -0700
X-CSE-ConnectionGUID: X7v9/7HHT3mfaHa+LGGdkA==
X-CSE-MsgGUID: cRev3A3eTh+vDc3Viq76Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182232"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:54 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 09/13] drm/xe/tests: Add string encoding helper test
Date: Tue, 30 Jun 2026 15:26:28 +0200
Message-ID: <20260630132633.32804-10-michal.wajdeczko@intel.com>
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

Before we start using string to KLV encoding helper, add a simple
test to make sure it works as expected.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index f87189ef13d5..c2d5f0098816 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -84,10 +84,56 @@ static void test_encode_u64(struct kunit *test)
 	KUNIT_ASSERT_PTR_EQ(test, fail, xe_guc_klv_encode_u64(fail, ARRAY_SIZE(klvs), key, value));
 }
 
+static void test_encode_string(struct kunit *test)
+{
+	const char *string = "abcdefghijklmnopqrstvwxyz";
+	u32 string_size = strlen(string) + 1;
+	u32 dwlen = to_num_dwords(string_size);
+	u32 num_dwords = GUC_KLV_LEN_MIN + dwlen;
+	u32 klvs[num_dwords + GUC_KLV_LEN_MIN];
+	u32 *failed = ERR_PTR(-ENOMEM);
+	char buf[string_size];
+	u16 key = TEST_KEY;
+	u32 *next;
+	u32 n;
+
+	/* too small, must fail */
+	for (n = 0; n < num_dwords; n++) {
+		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+		KUNIT_EXPECT_PTR_EQ(test, ERR_PTR(-ENOSPC),
+				    xe_guc_klv_encode_string(klvs, n, key, string));
+		KUNIT_ASSERT_EQ(test, klvs[0], TEST_PAD);
+	}
+
+	/* different string len, must pass */
+	for (n = 0; n < string_size; n++) {
+		memcpy(buf, string, n);
+		memset(buf + n, 0, sizeof(buf) - n);
+		memset32(klvs, TEST_PAD, ARRAY_SIZE(klvs));
+
+		next = xe_guc_klv_encode_string(klvs, ARRAY_SIZE(klvs), key, buf);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, next);
+		KUNIT_EXPECT_PTR_EQ(test, next, &klvs[GUC_KLV_LEN_MIN + to_num_dwords(n + 1)]);
+		KUNIT_EXPECT_STREQ_MSG(test, buf, (char *)&klvs[1], "n=%u", n);
+		kunit_info(test, "%u: %*ph\n", n, (int)to_num_bytes(next - klvs), klvs);
+		KUNIT_EXPECT_NE(test, *(next - 1), TEST_PAD);
+		KUNIT_ASSERT_EQ(test, *next, TEST_PAD);
+
+		/* bigger buf doesn't matter */
+		KUNIT_EXPECT_PTR_EQ(test, xe_guc_klv_encode_string(klvs, num_dwords, key, string),
+				    xe_guc_klv_encode_string(klvs, ARRAY_SIZE(klvs), key, string));
+	}
+
+	/* don't crash if already failed */
+	KUNIT_ASSERT_PTR_EQ(test, failed,
+			    xe_guc_klv_encode_string(failed, ARRAY_SIZE(klvs), key, string));
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

