Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792B4CD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EC510F45D;
	Thu, 30 Apr 2026 20:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HA+xRho7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEFA10F457
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580497; x=1809116497;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Lvu70wS9aHQrsEa3iu0ZZsSxsebFGSygUC1DdWiClnE=;
 b=HA+xRho7GRA6DXapLYBDOJVmO1tGDGtJoFSNHKTazq6oET/ouEsvgThY
 6dGtoF/f48eJI5vSUVmZlFAyuWzQtOFGGPr98G6DRff7IIhlSdkOmRtCC
 BfODYQ0Hd2Bu6va2mrT6uxgEVwxjRo+FgcJiHiKdVcBY/i0aYZPoBeOQ0
 jN9kiAAvDslf34PzMbBqzeLouNSrWkI5zvfFmItlMroWJZK9UKl0jJv2R
 VefsKE4DaBaUO+N7NN04Tt6tFqlq+E8XSrOnQq/EiVLDyf6yw7j1zKJBU
 p2FCCl8Z1YnnBmc3bhgvNoPKJLTA+SshLt7fsZDsVcvp+ZECqFF+74nTr w==;
X-CSE-ConnectionGUID: MfkpDtOpSViyNBkPf5ubbg==
X-CSE-MsgGUID: 91H/xebXQmq6cNdjiVKrZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150894"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150894"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:36 -0700
X-CSE-ConnectionGUID: VaHtefJLRw6h2OqSeoYLSQ==
X-CSE-MsgGUID: UAw/QA6jQ0+6qw4yzZmb9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030496"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:36 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 30 Apr 2026 17:20:02 -0300
Subject: [PATCH v2 1/7] drm/xe/rtp: Write kunit test cases specific for
 rule matching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-rtp-rule-parser-v2-1-157e98b4ab51@intel.com>
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
In-Reply-To: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
X-Mailer: b4 0.15-dev
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

The kunit test cases for the RTP framework are currently separated into
those that validate xe_rtp_process_to_sr() and those that validate
xe_rtp_process().  In both of them, we also have mixed stuff to validate
rule matching functionality, which should rather be done in a separate
test case group.

Let's create such a group, specific for validating rule matching, and
also add an initial set of cases.  In an upcoming change, we will do a
cleanup of the other groups by migrating those cases intended for rule
matching to this new group.

v2:
  - s/no-yes-or-no-yes/no-yes-or-yes-no/ (Matt)
  - Drop leftover include of <kunit/test.h>.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp.c      |  38 +++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 141 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/tests/xe_rtp_test.h |  23 ++++++
 drivers/gpu/drm/xe/xe_rtp.c            |  57 +++++++++----
 4 files changed, 242 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp.c b/drivers/gpu/drm/xe/tests/xe_rtp.c
new file mode 100644
index 000000000000..b3a8b75936d1
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include "tests/xe_rtp_test.h"
+
+#include <kunit/visibility.h>
+
+/**
+ * xe_rtp_rule_matches - Check if a set of RTP rule set match against the
+ *			 device/GT/hwe
+ * @xe: The xe device
+ * @gt: The GT struct (may be NULL)
+ * @hwe: The hw_engine  (may be NULL)
+ * @rules: The array of rules to match against
+ * @n_rules: Number of items in @rules
+ * @err: Pointer (may be NULL) to set error number.
+ *
+ * This parses the set of rules and check if they match against the passed
+ * parameters.
+ *
+ * If passed, @err is updated with a non-zero negative error number or zero if
+ * no errors were found during the parsing/evaluation of rules.
+ *
+ * Returns true if there is a match and false if there is no match or if an
+ * error was found.
+ */
+bool xe_rtp_rule_matches(const struct xe_device *xe,
+			 struct xe_gt *gt,
+			 struct xe_hw_engine *hwe,
+			 const struct xe_rtp_rule *rules,
+			 unsigned int n_rules,
+			 int *err)
+{
+	return rule_matches_with_err(xe, gt, hwe, rules, n_rules, err);
+}
+EXPORT_SYMBOL_IF_KUNIT(xe_rtp_rule_matches);
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index e5a0f985a700..7df8f7857c49 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -19,6 +19,7 @@
 #include "xe_pci_test.h"
 #include "xe_reg_sr.h"
 #include "xe_rtp.h"
+#include "xe_rtp_test.h"
 
 #define REGULAR_REG1	XE_REG(1)
 #define REGULAR_REG2	XE_REG(2)
@@ -31,6 +32,14 @@
 #undef XE_REG_MCR
 #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
 
+struct rtp_rules_test_case {
+	const char *name;
+	bool expected_match;
+	int expected_err;
+	const struct xe_rtp_rule *rules;
+	u8 n_rules;
+};
+
 struct rtp_to_sr_test_case {
 	const char *name;
 	struct xe_reg expected_reg;
@@ -60,6 +69,130 @@ static bool match_no(const struct xe_device *xe, const struct xe_gt *gt,
 	return false;
 }
 
+static const struct rtp_rules_test_case rtp_rules_cases[] = {
+	/*
+	 * Single rules.
+	 *
+	 * TODO: Include other types of rules as well: GRAPHICS_VERSION(),
+	 * MEDIA_VERSION(), etc.
+	 */
+	{
+		.name = "no",
+		.expected_match = false,
+		XE_RTP_RULES(FUNC(match_no)),
+	},
+	{
+		.name = "yes",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_yes)),
+	},
+
+	/* Conjunctions with 2 operands. */
+	{
+		.name = "no-and-no",
+		.expected_match = false,
+		XE_RTP_RULES(FUNC(match_no), FUNC(match_no)),
+	},
+	{
+		.name = "no-and-yes",
+		.expected_match = false,
+		XE_RTP_RULES(FUNC(match_no), FUNC(match_yes)),
+	},
+	{
+		.name = "yes-and-no",
+		.expected_match = false,
+		XE_RTP_RULES(FUNC(match_yes), FUNC(match_no)),
+	},
+	{
+		.name = "yes-and-yes",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes)),
+	},
+
+	/* Disjunctions with 2 operands. */
+	{
+		.name = "no-or-no",
+		.expected_match = false,
+		XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
+	},
+	{
+		.name = "no-or-yes",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
+	},
+	{
+		.name = "yes-or-no",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
+	},
+	{
+		.name = "yes-or-yes",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_yes)),
+	},
+
+	/* Conjunction and disjunctions. */
+	{
+		.name = "no-yes-or-yes-no",
+		.expected_match = false,
+		XE_RTP_RULES(FUNC(match_no), FUNC(match_yes), OR,
+			     FUNC(match_yes), FUNC(match_no)),
+	},
+	{
+		.name = "no-yes-or-yes-yes",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_no), FUNC(match_yes), OR,
+			     FUNC(match_yes), FUNC(match_yes)),
+	},
+	{
+		.name = "yes-yes-or-no-yes",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes), OR,
+			     FUNC(match_no), FUNC(match_yes)),
+	},
+	{
+		.name = "yes-yes-or-yes-yes",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_yes), FUNC(match_yes), OR,
+			     FUNC(match_yes), FUNC(match_yes)),
+	},
+	{
+		.name = "no-no-or-yes-or-no",
+		.expected_match = true,
+		XE_RTP_RULES(FUNC(match_no), FUNC(match_no), OR,
+			     FUNC(match_yes), OR,
+			     FUNC(match_no)),
+	},
+
+	/* Syntax errors. */
+	{
+		.name = "or",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(OR),
+	},
+	{
+		.name = "or-anything",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(OR, FUNC(match_yes)),
+	},
+};
+
+static void xe_rtp_rules_tests(struct kunit *test)
+{
+	const struct rtp_rules_test_case *param = test->param_value;
+	struct xe_device *xe = test->priv;
+	struct xe_gt *gt = xe_device_get_root_tile(xe)->primary_gt;
+	int err;
+	bool match;
+
+	match = xe_rtp_rule_matches(xe, gt, NULL, param->rules, param->n_rules, &err);
+
+	KUNIT_EXPECT_EQ(test, match, param->expected_match);
+	KUNIT_EXPECT_EQ(test, err, param->expected_err);
+}
+
 static const struct rtp_to_sr_test_case rtp_to_sr_cases[] = {
 	{
 		.name = "coalesce-same-reg",
@@ -489,6 +622,13 @@ static void xe_rtp_process_tests(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, active, param->expected_active);
 }
 
+static void rtp_rules_desc(const struct rtp_rules_test_case *t, char *desc)
+{
+	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(rtp_rules, rtp_rules_cases, rtp_rules_desc);
+
 static void rtp_to_sr_desc(const struct rtp_to_sr_test_case *t, char *desc)
 {
 	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
@@ -534,6 +674,7 @@ static void xe_rtp_test_exit(struct kunit *test)
 }
 
 static struct kunit_case xe_rtp_tests[] = {
+	KUNIT_CASE_PARAM(xe_rtp_rules_tests, rtp_rules_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_process_to_sr_tests, rtp_to_sr_gen_params),
 	KUNIT_CASE_PARAM(xe_rtp_process_tests, rtp_gen_params),
 	{}
diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.h b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
new file mode 100644
index 000000000000..26becc1e2af0
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 AND MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef _XE_RTP_TEST_H_
+#define _XE_RTP_TEST_H_
+
+#include <linux/types.h>
+
+struct xe_device;
+struct xe_gt;
+struct xe_hw_engine;
+struct xe_rtp_rule;
+
+bool xe_rtp_rule_matches(const struct xe_device *xe,
+			 struct xe_gt *gt,
+			 struct xe_hw_engine *hwe,
+			 const struct xe_rtp_rule *rules,
+			 unsigned int n_rules,
+			 int *err);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 1a4dcbbbc176..0e1adf07e4e7 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -30,16 +30,20 @@ static bool has_samedia(const struct xe_device *xe)
 	return xe->info.media_verx100 >= 1300;
 }
 
-static bool rule_matches(const struct xe_device *xe,
-			 struct xe_gt *gt,
-			 struct xe_hw_engine *hwe,
-			 const struct xe_rtp_rule *rules,
-			 unsigned int n_rules)
+static bool rule_matches_with_err(const struct xe_device *xe,
+				  struct xe_gt *gt,
+				  struct xe_hw_engine *hwe,
+				  const struct xe_rtp_rule *rules,
+				  unsigned int n_rules,
+				  int *err)
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i, rcount = 0;
 	bool match;
 
+	if (err)
+		*err = 0;
+
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
 		switch (r->match_type) {
 		case XE_RTP_MATCH_OR:
@@ -58,21 +62,21 @@ static bool rule_matches(const struct xe_device *xe,
 			break;
 		case XE_RTP_MATCH_PLATFORM_STEP:
 			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
-				return false;
+				goto error;
 
 			match = xe->info.step.platform >= r->step_start &&
 				xe->info.step.platform < r->step_end;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.graphics_verx100 == r->ver_start &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.graphics_verx100 >= r->ver_start &&
 				xe->info.graphics_verx100 <= r->ver_end &&
@@ -80,13 +84,13 @@ static bool rule_matches(const struct xe_device *xe,
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.graphics_verx100 == r->ver_start;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_STEP:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.step.graphics >= r->step_start &&
 				xe->info.step.graphics < r->step_end &&
@@ -94,14 +98,14 @@ static bool rule_matches(const struct xe_device *xe,
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.media_verx100 == r->ver_start &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.media_verx100 >= r->ver_start &&
 				xe->info.media_verx100 <= r->ver_end &&
@@ -109,7 +113,7 @@ static bool rule_matches(const struct xe_device *xe,
 			break;
 		case XE_RTP_MATCH_MEDIA_STEP:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.step.media >= r->step_start &&
 				xe->info.step.media < r->step_end &&
@@ -117,7 +121,7 @@ static bool rule_matches(const struct xe_device *xe,
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
 			if (drm_WARN_ON(&xe->drm, !gt))
-				return false;
+				goto error;
 
 			match = xe->info.media_verx100 == r->ver_start;
 			break;
@@ -129,13 +133,13 @@ static bool rule_matches(const struct xe_device *xe,
 			break;
 		case XE_RTP_MATCH_ENGINE_CLASS:
 			if (drm_WARN_ON(&xe->drm, !hwe))
-				return false;
+				goto error;
 
 			match = hwe->class == r->engine_class;
 			break;
 		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
 			if (drm_WARN_ON(&xe->drm, !hwe))
-				return false;
+				goto error;
 
 			match = hwe->class != r->engine_class;
 			break;
@@ -167,9 +171,24 @@ static bool rule_matches(const struct xe_device *xe,
 
 done:
 	if (drm_WARN_ON(&xe->drm, !rcount))
-		return false;
+		goto error;
 
 	return true;
+
+error:
+	if (err)
+		*err = -EINVAL;
+
+	return false;
+}
+
+static bool rule_matches(const struct xe_device *xe,
+			 struct xe_gt *gt,
+			 struct xe_hw_engine *hwe,
+			 const struct xe_rtp_rule *rules,
+			 unsigned int n_rules)
+{
+	return rule_matches_with_err(xe, gt, hwe, rules, n_rules, NULL);
 }
 
 static void rtp_add_sr_entry(const struct xe_rtp_action *action,
@@ -412,3 +431,7 @@ bool xe_rtp_match_has_msix(const struct xe_device *xe,
 {
 	return xe_device_has_msix(xe);
 }
+
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_rtp.c"
+#endif

-- 
2.53.0

