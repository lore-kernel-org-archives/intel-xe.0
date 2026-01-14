Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97EBD3CC88
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F02810E69F;
	Wed, 14 Jan 2026 22:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xv1AeShf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0E010E69F
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 22:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768431032; x=1799967032;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=dj05rDlzA4Q3GKkWyLy35+HU3sICkpTwHrtWi6bgiDs=;
 b=Xv1AeShfoB3QgM7qRlnRRNhiWqMABOnCmoxSmt45brKACUYZ3ECgcfXh
 FAyWJR8mqE3tT0+bZfBzSe1DZpsN/JU3gAin3F39IFA5qCzsuIFXeS8gW
 LO93qzRkWORpiQYsKQloyvfhRHPkZPloWL+wLT8LT6QOcseOqlNJLOoO5
 6pGgB2QtQn7w3KHjl9cFOPkHdu3llBP+RVbNxQ2a0UZ/ELWBFllaFroWU
 PGusiqq0mY7s4lFM6BenG0VbjdWYPeCwIIViWvLpscuqUg5VLCizTNS7J
 QVuaAjrN25qVjlJAsGFWR/19mir9LqhyfMg2a+J03P1c5UkBm9MQomCZ/ A==;
X-CSE-ConnectionGUID: IktXMhd+TaKWuuo4zN5USg==
X-CSE-MsgGUID: BTx1bvaNTBmDPdAT1mRrOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81184696"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="81184696"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:31 -0800
X-CSE-ConnectionGUID: he9OwSSBS66YFp/vviLXDg==
X-CSE-MsgGUID: +Lq6KDQQSBOD8kr7udMbjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="235522068"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:30 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 14 Jan 2026 19:49:53 -0300
Subject: [PATCH 3/6] drm/xe/rtp: Do not break parsing when missing context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-rtp-rule-parser-v1-3-fa9029586bff@intel.com>
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

With the current implementation, the RTP framework will cause parsing of
the rule set to be interrupted if one rule requires a context item (gt
or hwe) that is missing (i.e. when the value is NULL).

This is arguably a semantic error instead of a syntactic one, meaning
that RTP should not interrupt parsing the rules.  With the current
behavior, we would miss detecting other errors that could appear in the
remaining rules and could also prevent valid rules joined by "OR" from
being evaluated.

Make sure that we do not stop parsing the rule set when detecting
missing context and let's add rtp_rules_test_cases to reflect that.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 28 ++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.c            | 60 ++++++++++++++++++++++------------
 2 files changed, 68 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index b2286dd9d92a..19c7142b2fe4 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -177,6 +177,34 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
 		.expected_err = -EINVAL,
 		XE_RTP_RULES(OR, FUNC(match_yes)),
 	},
+
+	/* No match because hwe is NULL. */
+	{
+		.name = "engine-class",
+		.expected_match = false,
+		XE_RTP_RULES(ENGINE_CLASS(RENDER)),
+	},
+
+	/*
+	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
+	 * expect a match.
+	 */
+	{
+		.name = "engine-class-or-yes",
+		.expected_match = true,
+		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, FUNC(match_yes)),
+	},
+
+	/*
+	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
+	 * expect a syntax error.
+	 */
+	{
+		.name = "engine-class-or-or-yes",
+		.expected_match = false,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, OR, FUNC(match_yes)),
+	},
 };
 
 static void xe_rtp_rules_tests(struct kunit *test)
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index e955df6c22ca..e0bed5ac1369 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -61,60 +61,76 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 				xe->info.subplatform == r->subplatform;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.graphics_verx100 == r->ver_start &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.graphics_verx100 >= r->ver_start &&
 				xe->info.graphics_verx100 <= r->ver_end &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.graphics_verx100 == r->ver_start;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_STEP:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.step.graphics >= r->step_start &&
 				xe->info.step.graphics < r->step_end &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.media_verx100 == r->ver_start &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.media_verx100 >= r->ver_start &&
 				xe->info.media_verx100 <= r->ver_end &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_STEP:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.step.media >= r->step_start &&
 				xe->info.step.media < r->step_end &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
-			if (drm_WARN_ON(&xe->drm, !gt))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !gt)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.media_verx100 == r->ver_start;
 			break;
@@ -125,14 +141,18 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 			match = xe->info.is_dgfx;
 			break;
 		case XE_RTP_MATCH_ENGINE_CLASS:
-			if (drm_WARN_ON(&xe->drm, !hwe))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !hwe)) {
+				match = false;
+				break;
+			}
 
 			match = hwe->class == r->engine_class;
 			break;
 		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
-			if (drm_WARN_ON(&xe->drm, !hwe))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, !hwe)) {
+				match = false;
+				break;
+			}
 
 			match = hwe->class != r->engine_class;
 			break;

-- 
2.52.0

