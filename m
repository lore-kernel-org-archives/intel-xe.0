Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B57BCD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D278510F4FC;
	Fri, 22 May 2026 08:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwglIgRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B398C10F4F9
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779439563; x=1810975563;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=JWV1EdIA3uoNOOu+OFvMhQO6/FIBKpnqMIwfKTi7vOI=;
 b=XwglIgRoL9Awj8gGd8T0RuLr7RUFz/yHZrWAwUp4awXLSZ84d1G7n1Nj
 isUty5SwdXZbDNC+23BMAJWs6JS8RlloBolf3jzsB1Sz2IEhcI/S7DR/F
 TNdyP/1PL0ut3dIqep5Ln41Go8AkUx99VFvOzYRg+AdQA8m2i1RHpZDVK
 wT7OHQKQ5wQwA9/Kg+MSngHVCcqQp+tV/NCZLoxcBA2PaBmK4Xl73Phlv
 7wha/FAa3nj9vyENUDrM48cRkq4uzed/CPalvHEWYWXzI91IhmMSN/qCM
 8gz64iQFuIKqfOpr6gIjn7kz1wBNHRsMvWyX90OkPMDCey3pIVrzvFsRv A==;
X-CSE-ConnectionGUID: 5oOWkeUJSfS8mTKpwnWMwA==
X-CSE-MsgGUID: aOMAMCE0RhO/CcmY2EmiqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80220409"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80220409"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:02 -0700
X-CSE-ConnectionGUID: XPlYwD1aRM+lphzdYXDnNQ==
X-CSE-MsgGUID: K3PZVyH8RR6+JqlwobfPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="264679503"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.24])
 ([10.124.223.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:01 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 22 May 2026 05:45:18 -0300
Subject: [PATCH v3 3/7] drm/xe/rtp: Don't short-circuit to false in or-yes case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rtp-rule-parser-v3-3-0c51039899f4@intel.com>
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

While RTP processing evaluates true on the "yes-or" case (i.e. a
conjunction of rules that evaluate to true followed by an "OR" without
the right hand operand), it does not on the "or-yes" one.

Both cases are considered malformed and could be a result of someone
dropping checks deemed not necessary anymore and forgetting to drop the
superfluous "OR".  Nevertheless, we should aim for consistency, and
having the "or-yes" case also evaluating to true while also causing a
warning seems reasonable.  So let's do that.

The "or-yes" pattern being evaluated to false comes from the fact that
that we unconditionally short-circuit upon finding XE_RTP_MATCH_OR on
the outer loop.  We should only do that if the preceding conjunction of
rules evaluated to true (meaning that rcount must be non-zero) and
continue the evaluation otherwise.

Do that and also add extra test cases to validate the short-circuiting
behavior.

Notice that some of the new test cases have a "FIXME" comment, which
comes from the fact that we are unable to detect syntax errors after the
short-circuit point.  That is going to be fixed in a follow-up change.

Link: https://lore.kernel.org/intel-xe/871pfw4lo9.fsf@intel.com/
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Violet Monti <violet.monti@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 42 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_rtp.c            | 15 ++++++++----
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index b3eab1337b0c..f56f005dbd98 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -195,11 +195,49 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
 		XE_RTP_RULES(OR),
 	},
 	{
-		.name = "or-anything",
-		.expected_match = false,
+		.name = "or-yes",
+		.expected_match = true,
 		.expected_err = -EINVAL,
 		XE_RTP_RULES(OR, FUNC(match_yes)),
 	},
+	{
+		.name = "or-no",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(OR, FUNC(match_no)),
+	},
+	{
+		.name = "yes-or",
+		.expected_match = true,
+		/* FIXME: The parser should raise an error here. */
+		.expected_err = 0,
+		XE_RTP_RULES(FUNC(match_yes), OR),
+	},
+	{
+		.name = "no-or",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(FUNC(match_no), OR),
+	},
+	{
+		.name = "no-or-or-yes",
+		.expected_match = true,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_yes)),
+	},
+	{
+		.name = "yes-or-or-no",
+		.expected_match = true,
+		/* FIXME: The parser should raise an error here. */
+		.expected_err = 0,
+		XE_RTP_RULES(FUNC(match_yes), OR, OR, FUNC(match_no)),
+	},
+	{
+		.name = "no-or-or-no",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_no)),
+	},
 };
 
 static void xe_rtp_rules_tests(struct kunit *test)
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 0e1adf07e4e7..299fa4209a26 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -47,12 +47,18 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
 		switch (r->match_type) {
 		case XE_RTP_MATCH_OR:
+			if (drm_WARN_ON(&xe->drm, !rcount)) {
+				if (err)
+					*err = -EINVAL;
+				continue;
+			}
+
 			/*
-			 * This is only reached if a complete set of
-			 * rules passed or none were evaluated. For both cases,
-			 * shortcut the other rules and return the proper value.
+			 * This is only reached if a complete conjunction of
+			 * rules passed, in which case we shortcut the other
+			 * rules and return true.
 			 */
-			goto done;
+			return true;
 		case XE_RTP_MATCH_PLATFORM:
 			match = xe->info.platform == r->platform;
 			break;
@@ -169,7 +175,6 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 		}
 	}
 
-done:
 	if (drm_WARN_ON(&xe->drm, !rcount))
 		goto error;
 

-- 
2.53.0

