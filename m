Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F217C52CD8
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 06:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C12A10E19A;
	Fri, 26 Jul 2024 06:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAhLWGFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929BF10E06B
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721976232; x=1753512232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=duJ8ck+GDvAS4HDgv27uoyP2nY96sItq269Uvv+ZFJw=;
 b=DAhLWGFxUw+qvpPpGRdhbocRtKCiGJZh+BHrib616lg8dPNme/DZkMeo
 IHjVLqVEdxns53IUzD81fA2nyaQEBxLjtVVS5MvaGWqZyR9dSuSl0X5AW
 V7GMtjnjRf17vrOGDs0Ll6zzNozSgGU4PiZhcZNJgRSnQG+1s93fV9Wf0
 3b8oliJJbVTdxs5dLzIYu80+at076pdrknrJl3ZqaqWGZk4Ees51cmtUQ
 9UYBq23nsYsSuQC5M/UvWb+PjeiIfXPsjJ1XKFYgoHHn2K81dBzL7hSUx
 opqcUl6u6sY3bOCrOTclmXKAZKHkdPWw0Qm/D+y8BYViHGGEbZLYj3XIv A==;
X-CSE-ConnectionGUID: F83zZ3FcRjiiY2cf+aTfOA==
X-CSE-MsgGUID: ijBs9zv1RZ63ZuV+4P7nsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="37270587"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="37270587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
X-CSE-ConnectionGUID: 1ymS2Ut6Qs2d+JTRjoXXrw==
X-CSE-MsgGUID: aDhfDufNR32t6LNN32hdog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="83799478"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 23:43:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 6/7] drm/xe/kunit: Test rtp with no actions
Date: Thu, 25 Jul 2024 23:43:36 -0700
Message-ID: <20240726064337.797576-7-lucas.demarchi@intel.com>
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

The OOB WAs use xe_rtp_process(), without passing an sr to save result
of the actions since there are none. They are also executed in a gt-only
context, making it harder to share the implementation. Thus, introduce a
new set of tests to check these RTP entries. The only check that can be
done is if the entry was marked as active.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 163 +++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.c            |   1 +
 2 files changed, 164 insertions(+)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 73e97f8d2b5b..5b425a335706 100644
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
@@ -339,6 +345,155 @@ static void xe_rtp_process_to_sr_tests(struct kunit *test)
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
+	const struct xe_rtp_entry *rtp_entry;
+
+	for (rtp_entry = param->entries; rtp_entry && rtp_entry->rules;
+	     rtp_entry++, count_rtp_entries++)
+		;
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
@@ -346,6 +501,13 @@ static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
 
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
@@ -378,6 +540,7 @@ static void xe_rtp_test_exit(struct kunit *test)
 
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

