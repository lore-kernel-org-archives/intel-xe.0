Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD28FC49EA1
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848A610E9B6;
	Sat, 27 Jul 2024 01:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liZMfwLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B9710E82E
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045564; x=1753581564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FlWJUUJP6DVVF7sIxH6f/u+RwwT5Jzk426ed3NQC8SM=;
 b=liZMfwLpdHG5TFirYUSt+cPHLwzoq1EtG/j8vofSHU9rYfQIQAhc6sA5
 NXmpYL6ZgcKgdXRww1QZrdMZetLZblltjxoqeLYWfWYn/LfADvClR2WoZ
 x94/WUuYitERHTBljYmVuAlgAWK/DimtzqPHm0BreRJqaC/KmtQljtIBf
 MiGE0/W4bOVRb9A8ajsHjU2sCrP/injV6v4XLd3Z/ZRvykVotukBDJ8ov
 Qs6V/gslyDzVS2kVK7q6amHg3etXaaFrEWZBKowpW8n++43a6hd7tbn0/
 wLCOVRXZyWqbOgL/2t8ukBvAlbjeMyXMec2yUS7ChhEIhEMR1KI6P9vSO Q==;
X-CSE-ConnectionGUID: 0hafIh0mTTa4BhXOAR+vGQ==
X-CSE-MsgGUID: Kz3kYK9tTiymcdtXb5VulQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460256"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460256"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:23 -0700
X-CSE-ConnectionGUID: UnZw4FVfT/SHrtvJDzsKIA==
X-CSE-MsgGUID: RzUQ0S8kRTyGTSovFIA8PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108378"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:23 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 2/8] drm/xe/kunit: Rename count to count_sr_entries
Date: Fri, 26 Jul 2024 18:59:01 -0700
Message-ID: <20240727015907.899192-3-lucas.demarchi@intel.com>
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

The RTP tests check both the result of processing the RTP entries and
the outcome saved as SR entries. Rename "count" to be explicit about
what's being counted.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
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

