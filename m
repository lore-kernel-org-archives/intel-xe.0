Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCE3C44503
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:08:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C2C710E52B;
	Tue,  7 Jul 2026 22:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI/beCdI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE47410E394
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462121; x=1814998121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C6oWv/BjcyFHu0JGGIqmmL+GHoaYaPqAZuGduNB3Xk4=;
 b=oI/beCdIZsvLVvvZWydNy1qP3bmcaj6KllNDC8n3gEO91bBkzpj+2gUX
 gjlVCQnrtcTWvvrNx1TG6Icd7eBKcshHvZLsnWNJJYEZtDenlicegl2Zi
 dPb5Mw1uo6OGQ48x7QTMqTHbagAgSwEcAtNs4MJiZ8AjMNlnzVbOgvPby
 wR7OufUJDlyqun8QcS7I8aDNX5hyrW5K9pZvXfN0a70tdX9VAcMQK0r/w
 GW46d6hieJaRPNwNEOxgN3Ozq4YohAoIhxh2G8ehHkGfnMwF5f5IcBEZT
 Leg+dsASxqb/yZEYusrpLJDNhxi28g4ceUDP2ERLJAWYyxCF4Dwv8K797 g==;
X-CSE-ConnectionGUID: T6fIVzAtQSeJDVBpH+0Qsw==
X-CSE-MsgGUID: desiM2LYTlmn3E42u0RT9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176550"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176550"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:41 -0700
X-CSE-ConnectionGUID: iibY7xENQ5mjKlfo2GCAIA==
X-CSE-MsgGUID: EXc2nyR3SKOSYwl7O+y8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278487685"
Received: from ssharm2x-mobl.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.34.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:08:39 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v2 11/13] drm/xe/tests: Add GuC KLV printer test
Date: Wed,  8 Jul 2026 00:08:13 +0200
Message-ID: <20260707220816.677-12-michal.wajdeczko@intel.com>
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

For completeness, add a simple test to exercise the KLV printer
to make sure it doesn't crash at least.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
---
 .../drm/xe/tests/xe_guc_klv_helpers_kunit.c   | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_klv_helpers_kunit.c
index 196e03fa5a1f..e221a00c3886 100644
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
@@ -383,6 +388,41 @@ static void test_encode_object_basic(struct kunit *test)
 	}
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
@@ -392,6 +432,7 @@ static struct kunit_case guc_klv_helpers_test_cases[] = {
 	KUNIT_CASE(test_encode_object_klv),
 	KUNIT_CASE(test_encode_object_nested),
 	KUNIT_CASE(test_encode_object_basic),
+	KUNIT_CASE(test_print),
 	{}
 };
 
-- 
2.47.1

