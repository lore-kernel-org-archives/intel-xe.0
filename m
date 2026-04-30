Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3917CD13DA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA81E10F466;
	Thu, 30 Apr 2026 20:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z5hYgZME";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EFB10F462
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580499; x=1809116499;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=KvnOGxXBAFeT2rXiH0SCT/AXWIlllqo9pFn/SFPxgOs=;
 b=Z5hYgZMENShZf9ax3OYG6NRkCAkZZKSGxPe+xyMkVhaXN7008lJEhoIQ
 Gkkh9qlV03zY/7iOjiha+Boov4K28GdkhoqWdNA07/fsasm8YXCu9f049
 BkJ8M2rfDu1VK9XqbgODIdvkJBthHMoToq/qYOKNiu89zPWNSSug4SKSu
 qtZ0O600mvCbRBvjY/QG4gtHmWdu7eGa1dLOkGRV/3xjDt17TfoR/9ueu
 W1YTtE4zk2wKJFQlderVzsqLm3ymOZ6DANqa3PVDYhl/zylAoWluFxbL7
 5KkvuoxODkx8g56scOxKfzHubPkLNIbb5vEj9Vk+l2eCD9mi2z3qeg3l0 w==;
X-CSE-ConnectionGUID: fCnDPXVMQhCm/+vsHUluZg==
X-CSE-MsgGUID: KIK2KNHVSki0fs+7l9WFow==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150901"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:39 -0700
X-CSE-ConnectionGUID: I8ql7jRGT4GIeSNYDmvlEA==
X-CSE-MsgGUID: /raY8FiUTCWQcsS49V2C/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030510"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:38 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 30 Apr 2026 17:20:04 -0300
Subject: [PATCH v2 3/7] drm/xe/rtp: Don't short-circuit to false in or-yes case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-rtp-rule-parser-v2-3-157e98b4ab51@intel.com>
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 42 ++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_rtp.c            | 15 ++++++++----
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index 7dce699991a1..5e0afde9eab4 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -172,11 +172,49 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
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

