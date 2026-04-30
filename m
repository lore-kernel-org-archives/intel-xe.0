Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A791CD3423
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFAF10F468;
	Thu, 30 Apr 2026 20:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hjEA9v7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AC810F462
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580503; x=1809116503;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xJR8PradI98mQNiSEF5fJ4VMOukIZIFo9sgErMh2o9I=;
 b=hjEA9v7I7s2KfAC45krXMz8zk4VIe8h8s0FZCYE3v86jfGSk42bgKQfP
 Wq1WllKOBRgWJUSlv0FZihsLhrRS6uBsyhtxLKsB/EUJ1r1m36HSJgTzt
 1mJRXkOlNtZ5gzM7a4xCK1vzN2xizdbyXEVriz7y6UHeTarxA+ACwJnVl
 Xcv9idc1/rAvNQoDOKJg7IsoSgL0WDst4mvKi+JNbLwP1fnGdLSZMdREc
 fKHGi9fC+TJYJK3PpN2NdbBIVQF4f3m8EoVJG8dNRWzN6zCyv/kvEmiEb
 j4L10N7ZbHc7fms0PHZfWYKLHgmsfgLqPi8WxIBiJ7P7tnbMMJBYfWZ+y w==;
X-CSE-ConnectionGUID: fnLClEoLSxaEUCTi/mvuMA==
X-CSE-MsgGUID: HU9yvGaGRvicbtzapEeVPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150913"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:43 -0700
X-CSE-ConnectionGUID: hyBu816KRHiMzLDZ6tavQg==
X-CSE-MsgGUID: wWv8T5cCRficFA6WroZamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030533"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:42 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 30 Apr 2026 17:20:07 -0300
Subject: [PATCH v2 6/7] drm/xe/rtp: Fully parse the ruleset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-rtp-rule-parser-v2-6-157e98b4ab51@intel.com>
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

The function rule_matches() short-circuits evaluation of the implicit
conjunctions (each substring of rules not containing OR) and the
explicit disjunctions (implicit conjunctions joined by OR). In other
words:

  - in a conjunction, once a rule evaluate to false, we skip to the next
    OR (if any) to evaluate the next conjunction;
  - in a disjunction, once a conjunction evaluates to true, we return
    true and skip evaluating all the remaining rules.

While this behavior results in a correct logical value, due to how the
"OR" short-circuiting is implemented, it has the side-effect that rule
set does not get fully "parsed", allowing incomplete constructs like
(rule1, OR) to evaluate to true when rule1 is true.  We should treat
such constructs as invalid and treat them the same way we do for stuff
like (OR, rule1).

As such, update rule_matches() to "parse" the whole rule set, and that
while keeping the short-circuit aspect of evaluation.  With that, we can
fix the FIXME test cases that cover that behavior.

v2:
  - Do not change short-circuit *evaluation* behavior. (Matt)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++----
 drivers/gpu/drm/xe/xe_rtp.c            | 26 +++++++++++++-------------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index e009c1243b7c..3429c5d1b5b6 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -186,8 +186,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
 	{
 		.name = "yes-or",
 		.expected_match = true,
-		/* FIXME: The parser should raise an error here. */
-		.expected_err = 0,
+		.expected_err = -EINVAL,
 		XE_RTP_RULES(FUNC(match_yes), OR),
 	},
 	{
@@ -205,8 +204,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
 	{
 		.name = "yes-or-or-no",
 		.expected_match = true,
-		/* FIXME: The parser should raise an error here. */
-		.expected_err = 0,
+		.expected_err = -EINVAL,
 		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_no)),
 	},
 	{
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index c49f80f398af..976a2e1f5592 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -129,6 +129,7 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i, rcount = 0;
+	bool short_circuit_or = false;
 
 	if (err)
 		*err = 0;
@@ -143,13 +144,16 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 
 			/*
 			 * This is only reached if a complete conjunction of
-			 * rules passed, in which case we shortcut the other
-			 * rules and return true.
+			 * rules passed, in which case we short-circuit rule
+			 * evaluation, but still keep parsing to find any syntax
+			 * errors.
 			 */
-			return true;
+			short_circuit_or = true;
+			rcount = 0;
+			continue;
 		}
 
-		if (rule_match_item(xe, gt, hwe, r)) {
+		if (short_circuit_or || rule_match_item(xe, gt, hwe, r)) {
 			rcount++;
 		} else {
 			/*
@@ -166,16 +170,12 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 		}
 	}
 
-	if (drm_WARN_ON(&xe->drm, !rcount))
-		goto error;
-
-	return true;
-
-error:
-	if (err)
-		*err = -EINVAL;
+	if (drm_WARN_ON(&xe->drm, !rcount)) {
+		if (err)
+			*err = -EINVAL;
+	}
 
-	return false;
+	return short_circuit_or || rcount;
 }
 
 static bool rule_matches(const struct xe_device *xe,

-- 
2.53.0

