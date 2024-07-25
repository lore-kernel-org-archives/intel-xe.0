Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F2C3DA70
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 22:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B121110E8D7;
	Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MT3a5OiK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8E810E8D4
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721945405; x=1753481405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BNfI03q/1ZrQ4IHv8a79kExbJpdnCIMfepG8iZIEWbg=;
 b=MT3a5OiKQUrx/GiuN8hFx+ve6zrIlcT9B12szyx+cXnyg5SeOh/QqAqQ
 n7Mv7Poj1aCiL/k9FxhFH0Qomg949OZosrY3KFhoRZM1bwoblmIvghBYn
 82yNHN/vbSVS9Eafz0wKv7LxhEEocJsIS6Muvb8p4NaNRX9DdCHlxZOY4
 0x2lxMcBWy5edEFBPyYxW2EqUmkL78UgtFAB4ZgBOCbjEAN8pk0RuI3SG
 DisFFiEia+KWZUiKEOdrsh8kdaXMCdfitanz/NJfjkoew6v9uS99MIaFJ
 maJNIYGn1O/RU7uqOZE6vKftX0V3URlXpxFE9BdrBSbkhfA/27WCtCFLz w==;
X-CSE-ConnectionGUID: KOnBeMz0QX2udMi5Tx3fGA==
X-CSE-MsgGUID: kGtb0iL+TPmLYv/2jxrKMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19853169"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19853169"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:04 -0700
X-CSE-ConnectionGUID: Fn2gaooDQgePhLtgdLsgzw==
X-CSE-MsgGUID: sREiKwq7TZCv95OtJdpGeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57346281"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: gustavo@freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/5] drm/xe/kunit: Rename count to sr_entries
Date: Thu, 25 Jul 2024 15:09:55 -0700
Message-ID: <20240725220956.737987-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725220956.737987-1-lucas.demarchi@intel.com>
References: <20240725220956.737987-1-lucas.demarchi@intel.com>
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

The RTP tests check both the result of processing the RTP entries and
the outcome saved as SR entries. Rename "count" to be explicit about
what's being counted.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 32 +++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index f217445c246a..5ebaed1af3f2 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -36,7 +36,7 @@ struct rtp_test_case {
 	struct xe_reg expected_reg;
 	u32 expected_set_bits;
 	u32 expected_clr_bits;
-	unsigned long expected_count;
+	unsigned long expected_count_sr_entries;
 	unsigned int expected_sr_errors;
 	const struct xe_rtp_entry_sr *entries;
 };
@@ -57,7 +57,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0) | REG_BIT(1),
 		.expected_clr_bits = REG_BIT(0) | REG_BIT(1),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		/* Different bits on the same register: create a single entry */
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -76,7 +76,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		/* Don't coalesce second entry since rules don't match */
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -95,7 +95,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
 		.expected_clr_bits = REG_BIT(0) | REG_BIT(1) | REG_BIT(2),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("first"),
 			  XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
@@ -121,7 +121,7 @@ static const struct rtp_test_case cases[] = {
 	{
 		.name = "match-or-xfail",
 		.expected_reg = REGULAR_REG1,
-		.expected_count = 0,
+		.expected_count_sr_entries = 0,
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("leading-or"),
 			  XE_RTP_RULES(OR, FUNC(match_yes)),
@@ -148,7 +148,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		/* Don't coalesce second entry due to one of the rules */
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -167,7 +167,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
-		.expected_count = 2,
+		.expected_count_sr_entries = 2,
 		/* Same bits on different registers are not coalesced */
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -186,7 +186,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(1) | REG_BIT(0),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		/* Check clr vs set actions on different bits */
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -207,7 +207,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = TEMP_FIELD,
 		.expected_clr_bits = TEMP_MASK,
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		/* Check FIELD_SET works */
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -225,7 +225,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		.expected_sr_errors = 1,
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -245,7 +245,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		.expected_sr_errors = 1,
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -265,7 +265,7 @@ static const struct rtp_test_case cases[] = {
 		.expected_reg = REGULAR_REG1,
 		.expected_set_bits = REG_BIT(0),
 		.expected_clr_bits = REG_BIT(0),
-		.expected_count = 1,
+		.expected_count_sr_entries = 1,
 		.expected_sr_errors = 2,
 		.entries = (const struct xe_rtp_entry_sr[]) {
 			{ XE_RTP_NAME("basic-1"),
@@ -295,7 +295,7 @@ static void xe_rtp_process_tests(struct kunit *test)
 	struct xe_reg_sr *reg_sr = &gt->reg_sr;
 	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
-	unsigned long idx, count = 0;
+	unsigned long idx, count_sr_entries = 0;
 
 	xe_reg_sr_init(reg_sr, "xe_rtp_tests", xe);
 	xe_rtp_process_to_sr(&ctx, param->entries, reg_sr);
@@ -304,11 +304,11 @@ static void xe_rtp_process_tests(struct kunit *test)
 		if (idx == param->expected_reg.addr)
 			sr_entry = sre;
 
-		count++;
+		count_sr_entries++;
 	}
 
-	KUNIT_EXPECT_EQ(test, count, param->expected_count);
-	if (count) {
+	KUNIT_EXPECT_EQ(test, count_sr_entries, param->expected_count_sr_entries);
+	if (count_sr_entries) {
 		KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
 		KUNIT_EXPECT_EQ(test, sr_entry->set_bits, param->expected_set_bits);
 		KUNIT_EXPECT_EQ(test, sr_entry->reg.raw, param->expected_reg.raw);
-- 
2.43.0

