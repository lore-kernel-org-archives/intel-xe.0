Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEFDC3DA70
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F1710E9A5;
	Sat, 27 Jul 2024 01:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZyKSz2wR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E1D10E82E
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045564; x=1753581564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DKQfOE/mK2ahcny3UeStMdqn4AhvQe6pFsj6FUW/Ptk=;
 b=ZyKSz2wREHEtltgR7/dOa2jk92VlZlAiqoi10RgS8qC8xh81TVgONLW6
 mScXeUeB4fm36aJ4rsgva2uLd9f6j8P8hTtkrrBaGJoeg362tWYsr7mFo
 X4YZsTw7wbC7/dq5bQuVdjSCAmNU9jsJHJCy8zIdk8FQ9FTa+oxQusXxs
 8FhW79XftALFBqOLRiymoJ0rCRxV0x3bqq10r36eNv9pEsiBXm90Mtj9W
 uz2xB24l2lXpSkUZ4gP7ShQDlbmOGzAqZWoai4pSpsBMS04AsG1x7yjh9
 WBFAfbE67Py1ql1pY8lsQGaTNLaCtSnJyDJNNIj1OGKXBShBUhVUMJG4j g==;
X-CSE-ConnectionGUID: sBCIVorJTWW8Lh8MZGfXVg==
X-CSE-MsgGUID: G3iK14HeTvCAJ8H3iPF/Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460258"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460258"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:24 -0700
X-CSE-ConnectionGUID: P44QUxLgSkS/nmHgo7MJxQ==
X-CSE-MsgGUID: Vm3QbnM0SfGI/2M9Uj1vbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108384"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 4/8] drm/xe/kunit: Rename rtp test cases
Date: Fri, 26 Jul 2024 18:59:03 -0700
Message-ID: <20240727015907.899192-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727015907.899192-1-lucas.demarchi@intel.com>
References: <20240727015907.899192-1-lucas.demarchi@intel.com>
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

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 459f6ae9449d..893e3e01e2ab 100644
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
@@ -308,7 +308,7 @@ static void xe_rtp_process_tests(struct kunit *test)
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
 	unsigned long idx, count_sr_entries = 0, count_rtp_entries = 0, active = 0;
 
-	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
+	xe_reg_sr_init(reg_sr, "xe_rtp_to_sr_tests", xe);
 
 	while (param->entries[count_rtp_entries].rules)
 		count_rtp_entries++;
@@ -337,12 +337,12 @@ static void xe_rtp_process_tests(struct kunit *test)
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
@@ -375,7 +375,7 @@ static void xe_rtp_test_exit(struct kunit *test)
 }
 
 static struct kunit_case xe_rtp_tests[] = {
-	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
 	{}
 };
 
-- 
2.43.0

