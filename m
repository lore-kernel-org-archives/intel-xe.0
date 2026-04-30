Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81464CD13D3
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 20:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D5010F457;
	Thu, 30 Apr 2026 20:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IH+2IoQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB38F10F462
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777580502; x=1809116502;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YB4GbFpx3N8SNWkosVtuJAde7CQ4lP8m8eA0PufRTU4=;
 b=IH+2IoQGCBSFYPlbfiET1+NuCUINvSriNEhF37K0nz7DEMTeFsl6uUet
 4FQFIXDWVYIQ4k4Pj0o/7MiIUZFkrn+J3nZceoqxsixlYOmB+NldG1rmu
 a4L5HMZ7wsRU7umwOSKePsEXCGirXpBzMYFva9Ux0h+iislR4LAGMHjok
 KN4cFeK8hUyBTj18GOv3xkfnr2MvSSau7B1aWbtP6zowxxcbk1HjR530u
 d91PmZk1sbLDWWsOKNVIFwgltz7cvgIxIUgsNLdN7QLKwS3urXxLLTDdL
 cgWOaxBwy/NKvGuuvuENwe3W59+u2nFWfH3d6eO0e15aSFHKR61U9R1g3 g==;
X-CSE-ConnectionGUID: xDIGgLgQTn+GNIdXc7a1OQ==
X-CSE-MsgGUID: 27Njm+jVSpWnwntYskR+DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="82150908"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="82150908"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:41 -0700
X-CSE-ConnectionGUID: Qy7ibPrFSSOr/ql9nTll+g==
X-CSE-MsgGUID: fE8eFl6uR/StxM0aMH6cYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="232030527"
Received: from rosenzwe-mobl1.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.222.55])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 13:21:41 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 30 Apr 2026 17:20:06 -0300
Subject: [PATCH v2 5/7] drm/xe/rtp: Extract rule_match_item()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-rtp-rule-parser-v2-5-157e98b4ab51@intel.com>
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

The current logic in rule_matches() mixes individual rule matching
with the logic necessary for handling OR operations.  Let's simplify
rule_matches() to focus on the latter by extracting individual rule
matching into a separate function called rule_match_item().

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 219 +++++++++++++++++++-------------------------
 1 file changed, 94 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index df72b456ab16..c49f80f398af 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -30,6 +30,96 @@ static bool has_samedia(const struct xe_device *xe)
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
+	case XE_RTP_MATCH_PLATFORM_STEP:
+		if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
+			return false;
+
+		return xe->info.step.platform >= r->step_start &&
+			xe->info.step.platform < r->step_end;
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
@@ -39,14 +129,12 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i, rcount = 0;
-	bool match;
 
 	if (err)
 		*err = 0;
 
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
-		switch (r->match_type) {
-		case XE_RTP_MATCH_OR:
+		if (r->match_type == XE_RTP_MATCH_OR) {
 			if (drm_WARN_ON(&xe->drm, !rcount)) {
 				if (err)
 					*err = -EINVAL;
@@ -59,128 +147,11 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 			 * rules and return true.
 			 */
 			return true;
-		case XE_RTP_MATCH_PLATFORM:
-			match = xe->info.platform == r->platform;
-			break;
-		case XE_RTP_MATCH_SUBPLATFORM:
-			match = xe->info.platform == r->platform &&
-				xe->info.subplatform == r->subplatform;
-			break;
-		case XE_RTP_MATCH_PLATFORM_STEP:
-			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE)) {
-				match = false;
-				break;
-			}
-
-			match = xe->info.step.platform >= r->step_start &&
-				xe->info.step.platform < r->step_end;
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
 		}
 
-		if (!match) {
+		if (rule_match_item(xe, gt, hwe, r)) {
+			rcount++;
+		} else {
 			/*
 			 * Advance rules until we find XE_RTP_MATCH_OR to check
 			 * if there's another set of conditions to check
@@ -192,8 +163,6 @@ static bool rule_matches_with_err(const struct xe_device *xe,
 				return false;
 
 			rcount = 0;
-		} else {
-			rcount++;
 		}
 	}
 

-- 
2.53.0

