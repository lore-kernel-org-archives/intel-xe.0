Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8AA3C3DA4A
	for <intel-xe@archiver.kernel.org>; Sat, 27 Jul 2024 01:59:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614C810E82E;
	Sat, 27 Jul 2024 01:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XnHZYWKW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E49510E82E
 for <intel-xe@lists.freedesktop.org>; Sat, 27 Jul 2024 01:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722045564; x=1753581564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hyDK6/NSg+16nOI1/d2tiLtcqd6H+pyvMXIi8dutm1I=;
 b=XnHZYWKWfqDweFUoMhs7W6VcICF4DL3kLJAUfdRIC1W+DZrwHV+wm5PZ
 s+Dxso2kuuUBVsuE0TiMgEaJg5o/rOvK+FLUHA390D6SaK8r1vz0bnOBj
 /SZXPSrkj7tTZEOQ/fqLWBu1suulMMtzeSi76fYRd5Lk6F4/FPglI3arE
 vgOCO8WpO9qbCCzsDG1ZYJxm84vu+mI9nVLENF8BcbqsBptnS5rBXUJ2y
 jDV1Q0RF5A/LDp52Q07XdxYjnIxngBa8oCyqfoWjatV4li/VEHMveH01J
 CnHZahyxoWgiTPgz0lQP+3lbQVqto97b0NHeBFSi761tkGXtGh//EmNnm g==;
X-CSE-ConnectionGUID: /qjuHkmETf2Kzn6IJnSS5Q==
X-CSE-MsgGUID: osvqr+j/T+6GvBuoldnmSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19460259"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="19460259"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:24 -0700
X-CSE-ConnectionGUID: rdcaJ6QnSdabkwHBlcqwGQ==
X-CSE-MsgGUID: mwlSNPftTPC65AW/bjXTOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; d="scan'208";a="53108390"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 18:59:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 5/8] drm/xe/kunit: Test rtp with no actions
Date: Fri, 26 Jul 2024 18:59:04 -0700
Message-ID: <20240727015907.899192-6-lucas.demarchi@intel.com>
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

The OOB WAs use xe_rtp_process(), without passing an sr to save result
of the actions since there are none. They are also executed in a gt-only
context, making it harder to share the implementation. Thus, introduce a
new set of tests to check these RTP entries. The only check that can be
done is if the entry was marked as active.

Before commit fd6797ec50c5 ("drm/xe/rtp: Fix off-by-one when processing
rules") several of these tests were failing: the processing of OR'ed
entries would make the subsequent entry to be inadvertently enabled.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 161 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.c            |   1 +
 2 files changed, 162 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 893e3e01e2ab..9ab3d5950d59 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -42,6 +42,12 @@ struct rtp_to_sr_test_case {
 	const struct xe_rtp_entry_sr *entries;
 };
 
+struct rtp_test_case {
+	const char *name;
+	unsigned long expected_active;
+	const struct xe_rtp_entry *entries;
+};
+
 static bool match_yes(const struct xe_gt *gt, const struct xe_hw_engine *hwe)
 {
 	return true;
@@ -337,6 +343,153 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, reg_sr->errors, param->expected_sr_errors);
 }
 
+/*
+ * Entries below follow the logic used with xe_wa_oob.rules:
+ * 1) Entries with empty name are OR'ed: all entries marked active since the
+ *    last entry with a name
+ * 2) There are no action associated with rules
+ */
+static const struct rtp_test_case rtp_cases[] = {
+	{
+		.name = "active1",
+		.expected_active = BIT(0),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "active2",
+		.expected_active = BIT(0) | BIT(1),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			},
+			{ XE_RTP_NAME("r2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "active-inactive",
+		.expected_active = BIT(0),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			},
+			{ XE_RTP_NAME("r2"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "inactive-active",
+		.expected_active = BIT(1),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_NAME("r2"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "inactive-1st_or_active-inactive",
+		.expected_active = BIT(1) | BIT(2) | BIT(3),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_NAME("r2_or_conditions"),
+			  XE_RTP_RULES(FUNC(match_yes)),
+			},
+			{ XE_RTP_RULES(FUNC(match_no)) },
+			{ XE_RTP_RULES(FUNC(match_no)) },
+			{ XE_RTP_NAME("r3"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "inactive-2nd_or_active-inactive",
+		.expected_active = BIT(1) | BIT(2) | BIT(3),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_NAME("r2_or_conditions"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_RULES(FUNC(match_yes)) },
+			{ XE_RTP_RULES(FUNC(match_no)) },
+			{ XE_RTP_NAME("r3"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "inactive-last_or_active-inactive",
+		.expected_active = BIT(1) | BIT(2) | BIT(3),
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_NAME("r2_or_conditions"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_RULES(FUNC(match_no)) },
+			{ XE_RTP_RULES(FUNC(match_yes)) },
+			{ XE_RTP_NAME("r3"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{}
+		},
+	},
+	{
+		.name = "inactive-no_or_active-inactive",
+		.expected_active = 0,
+		.entries = (const struct xe_rtp_entry[]) {
+			{ XE_RTP_NAME("r1"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_NAME("r2_or_conditions"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{ XE_RTP_RULES(FUNC(match_no)) },
+			{ XE_RTP_RULES(FUNC(match_no)) },
+			{ XE_RTP_NAME("r3"),
+			  XE_RTP_RULES(FUNC(match_no)),
+			},
+			{}
+		},
+	},
+};
+
+static void xe_rtp_process_tests(struct kunit *test)
+{
+	const struct rtp_test_case *param = test->param_value;
+	struct xe_device *xe = test->priv;
+	struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(gt);
+	unsigned long count_rtp_entries = 0, active = 0;
+
+	while (param->entries[count_rtp_entries].rules)
+		count_rtp_entries++;
+
+	xe_rtp_process_ctx_enable_active_tracking(&ctx, &active, count_rtp_entries);
+	xe_rtp_process(&ctx, param->entries);
+
+	KUNIT_EXPECT_EQ(test, active, param->expected_active);
+}
+
 static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
 {
 	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
@@ -344,6 +497,13 @@ static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
 
 KUNIT_ARRAY_PARAM(rtp_to_sr, rtp_to_sr_cases, rtp_to_sr_desc);
 
+static void rtp_desc(const struct rtp_test_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(rtp, rtp_cases, rtp_desc);
+
 static int xe_rtp_test_init(struct kunit *test)
 {
 	struct xe_device *xe;
@@ -376,6 +536,7 @@ static void xe_rtp_test_exit(struct kunit *test)
 
 static struct kunit_case xe_rtp_tests[] = {
 	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
+	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index f054ac9cf06d..1c641cc0f5a1 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -327,6 +327,7 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
 				entry - entries);
 	}
 }
+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
 
 bool xe_rtp_match_even_instance(const struct xe_gt *gt,
 				const struct xe_hw_engine *hwe)
-- 
2.43.0

