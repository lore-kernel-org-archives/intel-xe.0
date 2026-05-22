Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C031CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94310F501;
	Fri, 22 May 2026 08:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8lyOU7c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992EF10F4FC
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779439566; x=1810975566;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=zIioFptLW4Fs4tqxiiZvQ+Ta53tYN1mfDduqc975x3Q=;
 b=N8lyOU7cCrN2nXWXZtaxlHnmLixrqvhYLhddzcsJGTF2AvRa/5YxROym
 I5pc8MXeWienb510F4OiOgB3/fBWU3xsIQT1sxal08Cwfrxc/+QX3ygdU
 5sgQuPbzhgeVebj98HFHtIPDzqaoNixwTKELVvTftQ9MA+7OmRnGDsx0B
 YjTW5plfqblyHoO6Nz6rj+1Lc0zhImiPwCDSHsoeMuD/KPe6NeO7tR8hX
 rP93DhcZoiDnhVq+bF6/cmkoClAVLd9pTYJtSrXs5NRf64p2pvncCXYRm
 qn9ukPIMVJQrAlnRJ2okVWPYpZDU8lcgG4KMVwVooughpq4huh7NCazM+ A==;
X-CSE-ConnectionGUID: gnClPLThTaSIf9ylcgAjmA==
X-CSE-MsgGUID: vLo8RQm5T4esWH7470p58g==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80220417"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80220417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:06 -0700
X-CSE-ConnectionGUID: BiZfb4uSRwu8c/S76I3D5w==
X-CSE-MsgGUID: 4Qm15bhWSAqvClWar1DIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="264679513"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.24])
 ([10.124.223.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:05 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 22 May 2026 05:45:21 -0300
Subject: [PATCH v3 6/7] drm/xe/rtp: Fully parse the ruleset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rtp-rule-parser-v3-6-0c51039899f4@intel.com>
References: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
In-Reply-To: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Violet Monti <violet.monti@intel.com>
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

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Violet Monti <violet.monti@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c |  6 ++----
 drivers/gpu/drm/xe/xe_rtp.c            | 26 +++++++++++++-------------
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index dfb15d81d799..642f6e090ad0 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -209,8 +209,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
 	{
 		.name = "yes-or",
 		.expected_match = true,
-		/* FIXME: The parser should raise an error here. */
-		.expected_err = 0,
+		.expected_err = -EINVAL,
 		XE_RTP_RULES(FUNC(match_yes), OR),
 	},
 	{
@@ -228,8 +227,7 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
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

