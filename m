Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E88CD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:46:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD19910F4F9;
	Fri, 22 May 2026 08:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5FYEaHA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F290010F4F9
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779439564; x=1810975564;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=6QWMvXUaZksCWVOtW3bRqny5+QJw0fM1y3+W/I8EboU=;
 b=G5FYEaHA1BTfIIbZJlt/kGeNo6D09y0e2pqmYNDHsAiyFXhCSsBEBq2a
 /ZbHrBSrgaT4Tgz75Nt16tHZYSPU9KV6Ep2oWgMntZxdvrGOXEXzOAemr
 bilcsTe4xZuePRMoj0myqOumNWac3sv2HN6g9dU/JS+erBlrn6bVlkuf7
 MnW0zO5RZssQZyT93LERxJs1+vsfAtNYcDhnfTvPVXG/RnOx9A/L3dg+P
 KibvqwBGIJ+5mSnJHTUUR0upmqH/7F3VLBeDzNqNNzWbIwo7VmgG/VNaL
 nXzs/mzbL+66zRskyESAJRfNNWuwjkjY6ZNnn0or+LFpgdDz2UwgHP7rD w==;
X-CSE-ConnectionGUID: lwh/tDjZSXC1f7QRAKAl6w==
X-CSE-MsgGUID: ZrV8CY34T0q0KHF342J3ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80220410"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80220410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:04 -0700
X-CSE-ConnectionGUID: vArz/OhuTY2GRdxEz8G9qw==
X-CSE-MsgGUID: sFXSFzFHSeC/GHNBKdVKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="264679507"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.24])
 ([10.124.223.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:03 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 22 May 2026 05:45:19 -0300
Subject: [PATCH v3 4/7] drm/xe/rtp: Do not break parsing when missing context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rtp-rule-parser-v3-4-0c51039899f4@intel.com>
References: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
In-Reply-To: <20260522-rtp-rule-parser-v3-0-0c51039899f4@intel.com>
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

v2:
  - Add "missing-context" in the test case names to indicate that those
    are about rules that are missing the necessary context. (Matt)
  - Rebase: treat the new match type XE_RTP_MATCH_PLATFORM_STEP in the
    same way when the platform is missing step information.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com> # v1
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_rtp_test.c | 28 +++++++++++++++
 drivers/gpu/drm/xe/xe_rtp.c            | 66 ++++++++++++++++++++++------------
 2 files changed, 72 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
index f56f005dbd98..dfb15d81d799 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -238,6 +238,34 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
 		.expected_err = -EINVAL,
 		XE_RTP_RULES(FUNC(match_no), OR, OR, FUNC(match_no)),
 	},
+
+	/* No match because hwe is NULL. */
+	{
+		.name = "missing-context-engine-class",
+		.expected_match = false,
+		XE_RTP_RULES(ENGINE_CLASS(RENDER)),
+	},
+
+	/*
+	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
+	 * expect a match.
+	 */
+	{
+		.name = "missing-context-engine-class-or-yes",
+		.expected_match = true,
+		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, FUNC(match_yes)),
+	},
+
+	/*
+	 * Missing context (hwe==NULL) does not cause parsing to stop, hence we
+	 * expect a syntax error.
+	 */
+	{
+		.name = "missing-context-engine-class-or-or-yes",
+		.expected_match = true,
+		.expected_err = -EINVAL,
+		XE_RTP_RULES(ENGINE_CLASS(RENDER), OR, OR, FUNC(match_yes)),
+	},
 };
 
 static void xe_rtp_rules_tests(struct kunit *test)
diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 299fa4209a26..df72b456ab16 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -67,67 +67,85 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 				xe->info.subplatform == r->subplatform;
 			break;
 		case XE_RTP_MATCH_PLATFORM_STEP:
-			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
-				goto error;
+			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE)) {
+				match = false;
+				break;
+			}
 
 			match = xe->info.step.platform >= r->step_start &&
 				xe->info.step.platform < r->step_end;
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
@@ -138,14 +156,18 @@ static bool rule_matches_with_err(const struct xe_device *xe,
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
2.53.0

