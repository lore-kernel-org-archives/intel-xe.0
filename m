Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7830DCD13DA
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380B510F46C;
	Thu, 30 Apr 2026 20:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0mVOmtZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868A910F462
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580500; x=1809116500;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=XeWoqdLadBgEYkNCpsdQ4w1IIHMBxdcMYAqqgey3gdA=;
 b=F0mVOmtZMwv77WaASQe2Y2Imdm4RCwQpI5D1r/m60f0HP6AeJ1EXrV0f
 hHO60kcPV3o6YMtX9uJEXK3cxPW2+yGVnYHoWLB+0C6ESJZMSEzXy6CPB
 CWZRTHa0UkE6pDJMPyOfi0RJKnbgQT5KA8BunA2l6A8EchtfwXDTMReOH
 sYKdR+FyEz2aDN8W/77s0S2grUWQqua+ZqAYM+9ZKvq7xtvDuJdfII5rU
 Qq0clEK70zLsvUbDIzM7wlbfSjeUEAcuzWHNCBZDL33QZctom10u3Ovxd
 i9NsCRLwzxyLy7SQ3AAqkq0sQqMKJW44RT3ZRNO9jCvr0dxtTzmfCqqVX A==;
X-CSE-ConnectionGUID: Eo1gKJujTxCGhgewKdHcKQ==
X-CSE-MsgGUID: 0xSwpvzmQBCADVikkSGSjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150904"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150904"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:40 -0700
X-CSE-ConnectionGUID: 1DZkSOB0S663WKtxUt7YfQ==
X-CSE-MsgGUID: P6T5KiZ8S12Zrdw/aMMJSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030520"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:39 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 30 Apr 2026 17:20:05 -0300
Subject: [PATCH v2 4/7] drm/xe/rtp: Do not break parsing when missing context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-rtp-rule-parser-v2-4-157e98b4ab51@intel.com>
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
index 5e0afde9eab4..e009c1243b7c 100644
--- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
@@ -215,6 +215,34 @@ static const struct rtp_rules_test_case rtp_rules_cases[] = {
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

