Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7473EC44500
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 13:27:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E5610EA7D;
	Tue, 30 Jun 2026 13:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hme/YQE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA6C10E1A3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jun 2026 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782826017; x=1814362017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=83/8SdW6rf2ZoNnFCie+wW6rm5Hhp4XAeCjVK01zPoM=;
 b=hme/YQE2axw9yhlxC/7G6MT9yhH4+D9VGCIkJeuNfMjFbhZtfQXl5uuw
 GyZvuGX6mK8Thj8/S3HZPN0xy2kKKArMuULc5wNs98WV5RYs4tlFp/CfE
 UbzKMfMlCgdBTsrT0nF+I1KNIX7lYoZq5vgIFGKhBH/gRtgRUcziy8pc+
 +9kywDXh2CXyV8Rsl96N76liFMnr1GiUOP8lFnLhli6VwOaK/45q5v045
 FZ/RAIl3y32s4G+QGmHH1j909F8V6Noag755tO1gB0CtHHfqdZ+KVNXVr
 mu0s8Jd90mGphqhvmySUI0W/6sk1KjbMXAF+nsSe9iKm5qwZB5gvNCZPF g==;
X-CSE-ConnectionGUID: fk3d1mgoT5CbVXnEn0g+Eg==
X-CSE-MsgGUID: cj9QucvgSseeSYrGEerD7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83623524"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="83623524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:57 -0700
X-CSE-ConnectionGUID: Q3tLq6lRSK+n9Bn9hdIpSg==
X-CSE-MsgGUID: lBflFbM7Qf6ulEfccFmLtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; d="scan'208";a="256182243"
Received: from smoudgil-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.117.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 06:26:56 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH 11/13] drm/xe/tests: Add GuC KLV printer test
Date: Tue, 30 Jun 2026 15:26:30 +0200
Message-ID: <20260630132633.32804-12-michal.wajdeczko@intel.com>
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

For completeness, add a simple test to exercise the KLV printer
to make sure it doesn't crash at least.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index 9a8acc85e9f1..a6724f6b3a68 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
@@ -10,6 +10,11 @@
 #define TEST_GROUP_KEY	(GUC_KLV_RESERVED_RANGE_START + 0x3f0)
 #define TEST_PAD	0xdeadbeef
 
+static bool fake_is_group_key(u16 key)
+{
+	return is_reserved_key(key) && key >= TEST_GROUP_KEY;
+}
+
 static void test_count(struct kunit *test)
 {
 	u32 value = 0x12345678;
@@ -288,6 +293,41 @@ static void test_encode_object_nested(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, klvs[13], TEST_PAD);
 }
 
+static void __drm_printfn_kunit(struct drm_printer *p, struct va_format *vaf)
+{
+	struct kunit *test = p->arg;
+
+	kunit_info(test, "%pV", vaf);
+}
+
+static struct drm_printer drm_kunit_printer(void)
+{
+	struct drm_printer p = {
+		.printfn = __drm_printfn_kunit,
+		.arg = kunit_get_current_test(),
+	};
+	return p;
+}
+
+static void test_print(struct kunit *test)
+{
+	struct drm_printer p = drm_kunit_printer();
+	u32 zeros[] = { 0, 0, 0, /* padding */ };
+	u32 klvs[] = {
+		PREP_GUC_KLV(GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY, 0),
+		PREP_GUC_KLV(GUC_KLV_VF_CFG_NUM_CONTEXTS_KEY, 1), 1234,
+		PREP_GUC_KLV(GUC_KLV_VF_CFG_GGTT_SIZE_KEY, 2), 0x4000, 0x0123,
+		PREP_GUC_KLV(TEST_KEY, 3), 1, 2, 3,
+		PREP_GUC_KLV(TEST_GROUP_KEY, 5),
+		PREP_GUC_KLV(TEST_KEY + 1, 1), 1,
+		PREP_GUC_KLV(TEST_KEY + 2, 2), 1, 2,
+	};
+
+	kunit_activate_static_stub(test, is_group_key, fake_is_group_key);
+	xe_guc_klv_print(zeros, ARRAY_SIZE(zeros), &p);
+	xe_guc_klv_print(klvs, ARRAY_SIZE(klvs), &p);
+}
+
 static struct kunit_case guc_klv_helpers_test_cases[] = {
 	KUNIT_CASE(test_count),
 	KUNIT_CASE(test_encode_u32),
@@ -296,6 +336,7 @@ static struct kunit_case guc_klv_helpers_test_cases[] = {
 	KUNIT_CASE(test_encode_object_raw),
 	KUNIT_CASE(test_encode_object_klv),
 	KUNIT_CASE(test_encode_object_nested),
+	KUNIT_CASE(test_print),
 	{}
 };
 
-- 
2.47.1

