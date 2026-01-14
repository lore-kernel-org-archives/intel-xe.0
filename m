Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA260D3CC89
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 22:50:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B76510E6A1;
	Wed, 14 Jan 2026 22:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hItiaa3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9933810E6A0
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 22:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768431033; x=1799967033;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=FRZTMDcT3psZ74ETmfYOWklUrZXY7+mDeGHgGSLbaDs=;
 b=hItiaa3O8baTa82hSv73seQnlILgahYyq85m4wCn3A6uCLkuNjdAUb0v
 A2mevjzckU6TqU8FhlDBj9wcirGvqv1PuZgE9JHBhEkRbBptFZQlWj+5D
 rQH3Qu80Z/lHt2h4TTEPySSxHs06X1Zk9hBvGkdXwbIDZLAFF5s+RB5hX
 QdwCBzuaKBWgKqrvDy4SDzYrPk3tw08vLIrhkIPdGMC8sLbPZNN2++iQi
 RL8DfR4NFtF5xZuEnf8llIi99Ta+ufjRQOyOOarsCoMVRzqjbhNZblAKq
 YHys+dHvpjazNQgPhgI5rtUJdRswJU15YkBD+ZqcHKNcqBQkz2jPD5UFe Q==;
X-CSE-ConnectionGUID: bLlqOQIsRKWNb4Vhu7MkCw==
X-CSE-MsgGUID: hpLtHT4gTYaVwGv08EL3PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81184697"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="81184697"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:33 -0800
X-CSE-ConnectionGUID: N75NWYcNTAm6ahzZCTjwnA==
X-CSE-MsgGUID: Mi6MyPDSQDGfkB4yDaB/SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="235522076"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 14:50:31 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Wed, 14 Jan 2026 19:49:54 -0300
Subject: [PATCH 4/6] drm/xe/rtp: Extract rule_match_item()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-rtp-rule-parser-v1-4-fa9029586bff@intel.com>
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

The currently logic in rule_matches() mixes individual rule matching
with the logic necessary for handling OR operations.  Let's simplify
rule_matches() to focus on the latter by extracting individual rule
matching into a separate function called rule_match_item().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 205 +++++++++++++++++++-------------------------
 1 file changed, 88 insertions(+), 117 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index e0bed5ac1369..dabc2e74e2ce 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -30,6 +30,90 @@ static bool has_samedia(const struct xe_device *xe)
 	return xe->info.media_verx100 >= 1300;
 }
 
+static bool rule_match_item(const struct xe_device *xe,
+			    struct xe_gt *gt,
+			    struct xe_hw_engine *hwe,
+			    const struct xe_rtp_rule *r)
+{
+	switch (r->match_type) {
+	case XE_RTP_MATCH_PLATFORM:
+		return xe->info.platform == r->platform;
+	case XE_RTP_MATCH_SUBPLATFORM:
+		return xe->info.platform == r->platform &&
+			xe->info.subplatform == r->subplatform;
+	case XE_RTP_MATCH_GRAPHICS_VERSION:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.graphics_verx100 == r->ver_start &&
+			(!has_samedia(xe) || !xe_gt_is_media_type(gt));
+	case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.graphics_verx100 >= r->ver_start &&
+			xe->info.graphics_verx100 <= r->ver_end &&
+			(!has_samedia(xe) || !xe_gt_is_media_type(gt));
+	case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.graphics_verx100 == r->ver_start;
+	case XE_RTP_MATCH_GRAPHICS_STEP:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.step.graphics >= r->step_start &&
+			xe->info.step.graphics < r->step_end &&
+			(!has_samedia(xe) || !xe_gt_is_media_type(gt));
+	case XE_RTP_MATCH_MEDIA_VERSION:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.media_verx100 == r->ver_start &&
+			(!has_samedia(xe) || xe_gt_is_media_type(gt));
+	case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.media_verx100 >= r->ver_start &&
+			xe->info.media_verx100 <= r->ver_end &&
+			(!has_samedia(xe) || xe_gt_is_media_type(gt));
+	case XE_RTP_MATCH_MEDIA_STEP:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.step.media >= r->step_start &&
+			xe->info.step.media < r->step_end &&
+			(!has_samedia(xe) || xe_gt_is_media_type(gt));
+	case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
+		if (drm_WARN_ON(&xe->drm, !gt))
+			return false;
+
+		return xe->info.media_verx100 == r->ver_start;
+	case XE_RTP_MATCH_INTEGRATED:
+		return !xe->info.is_dgfx;
+	case XE_RTP_MATCH_DISCRETE:
+		return xe->info.is_dgfx;
+	case XE_RTP_MATCH_ENGINE_CLASS:
+		if (drm_WARN_ON(&xe->drm, !hwe))
+			return false;
+
+		return hwe->class == r->engine_class;
+	case XE_RTP_MATCH_NOT_ENGINE_CLASS:
+		if (drm_WARN_ON(&xe->drm, !hwe))
+			return false;
+
+		return hwe->class != r->engine_class;
+	case XE_RTP_MATCH_FUNC:
+		return r->match_func(xe, gt, hwe);
+	default:
+		drm_warn(&xe->drm, "Invalid RTP match %u\n",
+			 r->match_type);
+		return false;
+	}
+}
+
 static bool rule_matches_with_err(const struct xe_device *xe,
 				  struct xe_gt *gt,
 				  struct xe_hw_engine *hwe,
@@ -39,133 +123,22 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i, rcount = 0;
-	bool match;
 
 	if (err)
 		*err = 0;
 
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
-		switch (r->match_type) {
-		case XE_RTP_MATCH_OR:
+		if (r->match_type == XE_RTP_MATCH_OR)
 			/*
 			 * This is only reached if a complete set of
 			 * rules passed or none were evaluated. For both cases,
 			 * shortcut the other rules and return the proper value.
 			 */
 			goto done;
-		case XE_RTP_MATCH_PLATFORM:
-			match = xe->info.platform == r->platform;
-			break;
-		case XE_RTP_MATCH_SUBPLATFORM:
-			match = xe->info.platform == r->platform &&
-				xe->info.subplatform == r->subplatform;
-			break;
-		case XE_RTP_MATCH_GRAPHICS_VERSION:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.graphics_verx100 == r->ver_start &&
-				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
-			break;
-		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.graphics_verx100 >= r->ver_start &&
-				xe->info.graphics_verx100 <= r->ver_end &&
-				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
-			break;
-		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.graphics_verx100 == r->ver_start;
-			break;
-		case XE_RTP_MATCH_GRAPHICS_STEP:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.step.graphics >= r->step_start &&
-				xe->info.step.graphics < r->step_end &&
-				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
-			break;
-		case XE_RTP_MATCH_MEDIA_VERSION:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.media_verx100 == r->ver_start &&
-				(!has_samedia(xe) || xe_gt_is_media_type(gt));
-			break;
-		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.media_verx100 >= r->ver_start &&
-				xe->info.media_verx100 <= r->ver_end &&
-				(!has_samedia(xe) || xe_gt_is_media_type(gt));
-			break;
-		case XE_RTP_MATCH_MEDIA_STEP:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.step.media >= r->step_start &&
-				xe->info.step.media < r->step_end &&
-				(!has_samedia(xe) || xe_gt_is_media_type(gt));
-			break;
-		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
-			if (drm_WARN_ON(&xe->drm, !gt)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.media_verx100 == r->ver_start;
-			break;
-		case XE_RTP_MATCH_INTEGRATED:
-			match = !xe->info.is_dgfx;
-			break;
-		case XE_RTP_MATCH_DISCRETE:
-			match = xe->info.is_dgfx;
-			break;
-		case XE_RTP_MATCH_ENGINE_CLASS:
-			if (drm_WARN_ON(&xe->drm, !hwe)) {
-				match = false;
-				break;
-			}
-
-			match = hwe->class == r->engine_class;
-			break;
-		case XE_RTP_MATCH_NOT_ENGINE_CLASS:
-			if (drm_WARN_ON(&xe->drm, !hwe)) {
-				match = false;
-				break;
-			}
-
-			match = hwe->class != r->engine_class;
-			break;
-		case XE_RTP_MATCH_FUNC:
-			match = r->match_func(xe, gt, hwe);
-			break;
-		default:
-			drm_warn(&xe->drm, "Invalid RTP match %u\n",
-				 r->match_type);
-			match = false;
-		}
 
-		if (!match) {
+		if (rule_match_item(xe, gt, hwe, r)) {
+			rcount++;
+		} else {
 			/*
 			 * Advance rules until we find XE_RTP_MATCH_OR to check
 			 * if there's another set of conditions to check
@@ -177,8 +150,6 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 				return false;
 
 			rcount = 0;
-		} else {
-			rcount++;
 		}
 	}
 

-- 
2.52.0

