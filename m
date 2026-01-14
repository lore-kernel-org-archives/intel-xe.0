Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248A5D3CC8B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC7610E6A2;
	Wed, 14 Jan 2026 22:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cstZLoWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C257E10E6A0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 22:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768431034; x=1799967034;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=4fcv3bl7sJmZK9dVsEX6JDbqC8gboYg966FJv47ZfVc=;
 b=cstZLoWaVPp0qRo6hvKxaeZXhNdCK+0Jonm4mKbPkHkahR3heevswbrk
 6efx7YafruDzkMXyLqO8U4PdJis4VXq8CmVUC4Z2GR1ssqVwo0j4+gkqR
 egh3l9r0RWxGiYj4dvTfjYBO1h0QGciLElG9Y0er665YFmYWhmaeSrIp5
 N1vs8obt8Jxomwcg22rdPnDxb9Xb8E3jA8iFVDhJYTLBHSCz0HFSaK4hT
 s/M3tIfGx24F8EHhw62lLJ6z6auK37j1lGJPuM6Y0h19Hw7pYOtrmXg74
 +Tx9EeFQwCeUEd1MlYCrvjsGhHlUwezA86D0vyWSBwRdqzib5sT2r0jDk w==;
X-CSE-ConnectionGUID: /97rPfT1TJ6IO1Ak6dnnwQ==
X-CSE-MsgGUID: F68vpmTgT3uAMOttRTJtKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81184698"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="81184698"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:34 -0800
X-CSE-ConnectionGUID: WG6qluiXSt2E0iYsMOafnQ==
X-CSE-MsgGUID: v/7P/d9GRsmnlKgd7NOjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="235522084"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:33 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 14 Jan 2026 19:49:55 -0300
Subject: [PATCH 5/6] drm/xe/rtp: Fully parse the ruleset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-rtp-rule-parser-v1-5-fa9029586bff@intel.com>
References: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
In-Reply-To: <20260114-rtp-rule-parser-v1-0-fa9029586bff@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
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

The function rule_matches() short-circuits evaluation of the implicit
conjunctions (each substring of rules not containing OR) and the
explicit disjunctions (implicit conjunctions joined by OR). In other
words:

  - in a conjunction, once a rule evaluate to false, we skip to the next
    OR (if any) to evaluate the next conjunction;
  - in a disjunction, once a conjunction evaluates to true, we return
    true and skip evaluating all the remaining rules.

While this behavior results in a correct logical value, it has the
side-effect that rule set does not get fully "parsed", allowing
incomplete constructs like (rule1, OR) to evaluate to true when rule1 is
true.  We should treat such constructs as invalid and treat them the
same way we do for stuff like (OR, rule1).

As such, update rule_matches() to "parse" the whole rule set, and that
while keeping the short-circuit aspect of evaluation.

Let's also update the kunit test to include instances of those
incomplete constructs to reflect this change.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 12 +++++++
 drivers/gpu/drm/xe/xe_rtp.c            | 61 +++++++++++++++++++---------------
 2 files changed, 46 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 19c7142b2fe4..f0122553644e 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -177,6 +177,18 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
 		.expected_err = -EINVAL,
 		XE_RTP_RULES(OR, FUNC(match_yes)),
 	},
+	{
+		.name = "anything-or",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(FUNC(match_yes), OR),
+	},
+	{
+		.name = "anything-or-or-anything",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_yes)),
+	},
 
 	/* No match because hwe is NULL. */
 	{
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index dabc2e74e2ce..55df9c16a3cc 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -123,47 +123,54 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i, rcount = 0;
+	bool parse_only = false;
+	bool match = false;
 
 	if (err)
 		*err = 0;
 
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
-		if (r->match_type == XE_RTP_MATCH_OR)
-			/*
-			 * This is only reached if a complete set of
-			 * rules passed or none were evaluated. For both cases,
-			 * shortcut the other rules and return the proper value.
-			 */
-			goto done;
+		if (r->match_type == XE_RTP_MATCH_OR) {
+			if (drm_WARN_ON(&xe->drm, !rcount)) {
+				parse_only = true;
+				match = false;
+				if (err)
+					*err = -EINVAL;
+			} else if (match) {
+				parse_only = true;
+			}
+
+			rcount = 0;
+
+			continue;
+		}
+
+		rcount++;
+
+		if (parse_only || !rule_match_item(xe, gt, hwe, r)) {
+			if (!parse_only)
+				match = false;
 
-		if (rule_match_item(xe, gt, hwe, r)) {
-			rcount++;
-		} else {
 			/*
 			 * Advance rules until we find XE_RTP_MATCH_OR to check
 			 * if there's another set of conditions to check
 			 */
-			while (++i < n_rules && rules[i].match_type != XE_RTP_MATCH_OR)
-				;
-
-			if (i >= n_rules)
-				return false;
-
-			rcount = 0;
+			while (i + 1 < n_rules && rules[i + 1].match_type != XE_RTP_MATCH_OR) {
+				i++;
+				rcount++;
+			}
+		} else {
+			match = true;
 		}
 	}
 
-done:
-	if (drm_WARN_ON(&xe->drm, !rcount))
-		goto error;
-
-	return true;
-
-error:
-	if (err)
-		*err = -EINVAL;
+	if (drm_WARN_ON(&xe->drm, !rcount)) {
+		match = false;
+		if (err)
+			*err = -EINVAL;
+	}
 
-	return false;
+	return match;
 }
 
 static bool rule_matches(const struct xe_device *xe,

-- 
2.52.0

