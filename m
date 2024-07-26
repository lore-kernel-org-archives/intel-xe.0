Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1FFC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3CC10E097;
	Fri, 26 Jul 2024 06:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDBtqhP6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652A510E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976232; x=1753512232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SzoJOzjXgq1vBrupP1dH8853P2s182VVVzXSY7yssxM=;
 b=lDBtqhP6SuLT2i5EQTi+rCguowY8PNMb+TU3JKt5VByTvD/F5p2slXFg
 Msc++C4oXHEEKiwH4JS34LYoH8Upl3W1+UxIZQkvEK1ajF9h4LWz1AXT6
 FukRaWYnfuMK71vFiqTyZkvuY+ftVsZgXWkVJWqjsjSR7BT8+PL5jzX1z
 sFkOCdaEYMXDt/cHclxIqBlXmZnO9vUUYQPhOP+qqAEObnPeOf8d36Q/C
 /JHw6gE/FybZQYhVoyYu+MYsDfuy4kxW9rpVg+79LYRseX9EqvQ4E76GB
 O/rD+pDbTPuafIIsIB8lAJd8YOIGvKpzkdYNdEouwG0DP5ZC4RWCNNCzV A==;
X-CSE-ConnectionGUID: EpwznmXeQ8++BHDJcco68w==
X-CSE-MsgGUID: +YjXEAqdSGe98VV/bCruyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37270585"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="37270585"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
X-CSE-ConnectionGUID: 5f6fnAFMRNm+hwyV6Tt0ZQ==
X-CSE-MsgGUID: 8pTJtRBpTQq1VWijgSNWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83799472"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/7] drm/xe/kunit: Rename rtp test cases
Date: Thu, 25 Jul 2024 23:43:34 -0700
Message-ID: <20240726064337.797576-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726064337.797576-1-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
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

Those tests check the behavior of xe_rtp_process_to_sr(), so name them
accordingly to allow adding tests for xe_rtp_process() later.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index dbf982b1ada8..73e97f8d2b5b 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -31,7 +31,7 @@
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
-struct rtp_test_case {
+struct rtp_to_sr_test_case {
 	const char *name;
 	struct xe_reg expected_reg;
 	u32 expected_set_bits;
@@ -52,7 +52,7 @@ static bool match_no(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
 	return false;
 }
 
-static const struct rtp_test_case cases[] = {
+static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
 	{
 		.name = "coalesce-same-reg",
 		.expected_reg = REGULAR_REG1,
@@ -298,9 +298,9 @@ static const struct rtp_test_case cases[] = {
 	},
 };
 
-static void xe_rtp_process_tests(struct kunit *test)
+static void xe_rtp_process_to_sr_tests(struct kunit *test)
 {
-	const struct rtp_test_case *param = test->param_value;
+	const struct rtp_to_sr_test_case *param = test->param_value;
 	struct xe_device *xe = test->priv;
 	struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
 	struct xe_reg_sr *reg_sr = &gt->reg_sr;
@@ -309,7 +309,7 @@ static void xe_rtp_process_tests(struct kunit *test)
 	unsigned long idx, count_sr_entries = 0, count_rtp_entries = 0, active = 0;
 	const struct xe_rtp_entry_sr *rtp_entry;
 
-	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
+	xe_reg_sr_init(reg_sr, "xe_rtp_to_sr_tests", xe);
 
 	for (rtp_entry = param->entries; rtp_entry && rtp_entry->rules;
 	     rtp_entry++, count_rtp_entries++)
@@ -339,12 +339,12 @@ static void xe_rtp_process_tests(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
 }
 
-static void rtp_desc(const struct rtp_test_case *t, char *desc)
+static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
 {
 	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
 }
 
-KUNIT_ARRAY_PARAM(rtp, cases, rtp_desc);
+KUNIT_ARRAY_PARAM(rtp_to_sr, rtp_to_sr_cases, rtp_to_sr_desc);
 
 static int xe_rtp_test_init(struct kunit *test)
 {
@@ -377,7 +377,7 @@ static void xe_rtp_test_exit(struct kunit *test)
 }
 
 static struct kunit_case xe_rtp_tests[] = {
-	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
 	{}
 };
 
-- 
2.43.0

