Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B643C3DA63
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:44:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4881610E1B5;
	Fri, 26 Jul 2024 06:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mI9EsI9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4822E10E097
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976232; x=1753512232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4onhGLNv4G9hFEAJmjg+xSP3XoqHiQn7QXI47t+TND0=;
 b=mI9EsI9leLceVxt0g7YNEDNVazBv2RjGl+7IREKgb5/9/IVKTOjCdmn7
 5KQZTT0WfDWY9rw/MUgGqPYYzbrtxK4K/Y60Xq1XC9BgMnKDAp4Ak4ABj
 zPITGeyI0WHFxlU7rsZW6zaxy55+F4qqr32rTWQlX2RxwRWQHoqDbHMPy
 d+7kHxD7oGQ/K/sK0iUHA46+Q2uXSBz1P0/XWqAMnj/FlfdfoHWOkLE7m
 Dcmg8xgHTaMOBi3IdmmbyZnO0aPTvluWmmser/2zZR95a6IowDSUCBvvF
 9SLmv/cgMPeNPApkswCbCSVfiqmBXn6Fofst86GwZKKizGJvHhfVRSNMj A==;
X-CSE-ConnectionGUID: y4PtLEjvQlmJ7H91s1DH0g==
X-CSE-MsgGUID: QmrFgUSySoGDrPTNOnyzaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37270584"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="37270584"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
X-CSE-ConnectionGUID: XWc+vmD7T8288gEcHAangw==
X-CSE-MsgGUID: rOI4XQpfQpqhK/O8hT3qyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83799469"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 3/7] drm/xe/kunit: Test active rtp entries
Date: Thu, 25 Jul 2024 23:43:33 -0700
Message-ID: <20240726064337.797576-4-lucas.demarchi@intel.com>
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

Enabling active tracking in the rtp context and check for all the tests
the expected entries become active.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 22 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.c            |  1 +
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 5ebaed1af3f2..dbf982b1ada8 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -38,6 +38,7 @@ struct rtp_test_case {
 	u32 expected_clr_bits;
 	unsigned long expected_count_sr_entries;
 	unsigned int expected_sr_errors;
+	unsigned long expected_active;
 	const struct xe_rtp_entry_sr *entries;
 };
 
@@ -57,6 +58,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0) | REG_BIT(1),
 		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
+		.expected_active = BIT(0) | BIT(1),
 		.expected_count_sr_entries = 1,
 		/* Different bits on the same register: create a single entry */
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -76,6 +78,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0),
 		.expected_count_sr_entries = 1,
 		/* Don't coalesce second entry since rules don't match */
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -95,6 +98,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
 		.expected_clr_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
+		.expected_active = BIT(0) | BIT(1) | BIT(2),
 		.expected_count_sr_entries = 1,
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("first"),
@@ -148,6 +152,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0),
 		.expected_count_sr_entries = 1,
 		/* Don't coalesce second entry due to one of the rules */
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -167,6 +172,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0) | BIT(1),
 		.expected_count_sr_entries = 2,
 		/* Same bits on different registers are not coalesced */
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -186,6 +192,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(1) | REG_BIT(0),
+		.expected_active = BIT(0) | BIT(1),
 		.expected_count_sr_entries = 1,
 		/* Check clr vs set actions on different bits */
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -207,6 +214,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = TEMP_FIELD,
 		.expected_clr_bits = TEMP_MASK,
+		.expected_active = BIT(0),
 		.expected_count_sr_entries = 1,
 		/* Check FIELD_SET works */
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -225,6 +233,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0) | BIT(1),
 		.expected_count_sr_entries = 1,
 		.expected_sr_errors = 1,
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -245,6 +254,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0) | BIT(1),
 		.expected_count_sr_entries = 1,
 		.expected_sr_errors = 1,
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -265,6 +275,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
+		.expected_active = BIT(0) | BIT(1) | BIT(2),
 		.expected_count_sr_entries = 1,
 		.expected_sr_errors = 2,
 		.entries = (const struct xe_rtp_entry_sr[]) {
@@ -295,9 +306,16 @@ static void xe_rtp_process_tests(struct kunit *test)
 	struct xe_reg_sr *reg_sr = &gt->reg_sr;
 	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
-	unsigned long idx, count_sr_entries = 0;
+	unsigned long idx, count_sr_entries = 0, count_rtp_entries = 0, active = 0;
+	const struct xe_rtp_entry_sr *rtp_entry;
 
 	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
+
+	for (rtp_entry = param->entries; rtp_entry && rtp_entry->rules;
+	     rtp_entry++, count_rtp_entries++)
+		;
+
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
 	xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
 
 	xa_for_each(&reg_sr->xa, idx, sre) {
@@ -307,6 +325,8 @@ static void xe_rtp_process_tests(struct kunit *test)
 		count_sr_entries++;
 	}
 
+	KUNIT_EXPECT_EQ(test, active, param->expected_active);
+
 	KUNIT_EXPECT_EQ(test, count_sr_entries, param->expected_count_sr_entries);
 	if (count_sr_entries) {
 		KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 02e28274282f..acb35b95a3f6 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -217,6 +217,7 @@ void xe_rtp_process_ctx_enable_active_tracking(struct xe_rtp_process_ctx *ctx,
 	ctx->active_entries = active_entries;
 	ctx->n_entries = n_entries;
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process_ctx_enable_active_tracking);
 
 static void rtp_mark_active(struct xe_device *xe,
 			    struct xe_rtp_process_ctx *ctx,
-- 
2.43.0

