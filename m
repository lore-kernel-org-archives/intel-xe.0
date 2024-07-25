Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72F6C3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 22:10:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6A710E8DA;
	Thu, 25 Jul 2024 22:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLRb4cq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4D810E8D2
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721945405; x=1753481405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tXTi6YzT9ey4OxP0QZHf9GizYWVtTMJcB6adaWrMPr4=;
 b=JLRb4cq4BSHup8yFX1s6F+p1aH6nUgf5xAzMqY/i/rjNvvxcEQU4ykHV
 r4Wo5IVsJv4aLHGXsCqfuHs+PCPewRSRicz9+XDFQzJMMr9iY2J61b1/I
 yObzcP0I5Oj9GYfPrdBRv8A671hjxSSbhC4kLd47yDfxQiz8YVgLKMNb6
 MC+rEoOTVoA5H52qX57PIj/Nb/dipaBZR5kanrzcDrBWn08iOyqZ5Ti1P
 Vi4/aeSyNMaKkTkNCHgDQPWTwBJeCOO0hWGudGi4ZgOt6QCT15oWPk8Sq
 W1bvYH/hndPEEapvy4osh3n7P8vK17+e5O80pGKZMqDCyXgh/tCsBOHOE w==;
X-CSE-ConnectionGUID: IW642o+rSyWQvUeFyskcTQ==
X-CSE-MsgGUID: pB5NMyQuT4G6C9j7glyZmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19853170"
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="19853170"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:05 -0700
X-CSE-ConnectionGUID: Hb9TmBbfRIek6Cfutz6HhA==
X-CSE-MsgGUID: TykPFf1BR7Sm2wV6NyEwKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,237,1716274800"; d="scan'208";a="57346285"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 15:10:05 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: gustavo@freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 5/5] drm/xe/kunit: Test active rtp entries
Date: Thu, 25 Jul 2024 15:09:56 -0700
Message-ID: <20240725220956.737987-6-lucas.demarchi@intel.com>
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

Enabling active tracking in the rtp context and check for all the tests
the expected entries become active.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 5ebaed1af3f2..27628c4b6bdd 100644
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
@@ -295,9 +306,17 @@ static void xe_rtp_process_tests(struct kunit *test)
 	struct xe_reg_sr *reg_sr = &gt->reg_sr;
 	const struct xe_reg_sr_entry *sre, *sr_entry = NULL;
 	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
-	unsigned long idx, count_sr_entries = 0;
+	unsigned long idx, count_sr_entries = 0, count_rtp_entries = 0;
+	unsigned long active;
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
@@ -307,6 +326,8 @@ static void xe_rtp_process_tests(struct kunit *test)
 		count_sr_entries++;
 	}
 
+	KUNIT_EXPECT_EQ(test, active, param->expected_active);
+
 	KUNIT_EXPECT_EQ(test, count_sr_entries, param->expected_count_sr_entries);
 	if (count_sr_entries) {
 		KUNIT_EXPECT_EQ(test, sr_entry->clr_bits, param->expected_clr_bits);
-- 
2.43.0

