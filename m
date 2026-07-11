Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEF8C43458
	for <intel-xe@archiver.kernel.org>; Sat, 11 Jul 2026 07:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCEE510E2F3;
	Sat, 11 Jul 2026 07:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AtJUWBA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D6810E1DE
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Jul 2026 07:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783755379; x=1815291379;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VA3Qtt4W1W2gJ+dHjjnX8jcMBMzpQRKIvVugyNyYtl8=;
 b=AtJUWBA8vijtPSH9/L2+cae4hJx4eYHXbAXwHKSLrMeblGncucX03rUp
 VYg+KilKOP0JoyOjKwa4hHUWgAke2SgROTmY224wUlSLkrX5erm4tRQRj
 R7M+JEc8ZD4t3cz1Iqt2UkM9jXEQEFbsIBJn9ueAUUMRj8QOwhYmSW6VT
 aFv4g5KUk6HMOBfSJ9uVUTwGfZGMKxMxMBP9886FcijNjA4eFh2D9JJQ+
 AGUAK2aiexY/HkFAsdq/+gx5JvUTZK/43bHfl/Lee/l4DiZOVtAVPvy9G
 HhhAeUzcusq53/aTRXCy6G2ZR5VDEocg9dMbiB4tS6i4kUD53npO6nPd7 w==;
X-CSE-ConnectionGUID: yMDAcrBvRAeNHeMvur5M3A==
X-CSE-MsgGUID: 79MwbXwCSJqPBZ9olOYMBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101868550"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="101868550"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2026 00:36:18 -0700
X-CSE-ConnectionGUID: KtLk6Yn+S7qO4/ESBFprFw==
X-CSE-MsgGUID: 5AIyyNcnRXqP3sRtaaCWaA==
X-ExtLoop1: 1
Received: from fdaddami-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.16.109])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2026 00:36:17 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 11/13] drm/xe/tests: Add GuC KLV printer test
Date: Sat, 11 Jul 2026 09:36:08 +0200
Message-ID: <20260711073608.7829-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707220816.677-12-michal.wajdeczko@intel.com>
References: <20260707220816.677-12-michal.wajdeczko@intel.com>
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

For completeness, add a simple test to exercise the KLV printer
to make sure it doesn't crash at least.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index 33d7a52f6bf8..82869363ab7e 100644
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
@@ -368,6 +373,41 @@ static void test_encode_object_basic(struct kunit *test)
 						     obj_echo_encoder));
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
@@ -377,6 +417,7 @@ static struct kunit_case guc_klv_helpers_test_cases[] = {
 	KUNIT_CASE(test_encode_object_klv),
 	KUNIT_CASE(test_encode_object_nested),
 	KUNIT_CASE(test_encode_object_basic),
+	KUNIT_CASE(test_print),
 	{}
 };
 
-- 
2.47.1

