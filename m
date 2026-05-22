Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5511DCD5BAC
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 08:46:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10CB210F50D;
	Fri, 22 May 2026 08:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jNUksO4D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D4610F4F9
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779439565; x=1810975565;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=YB4GbFpx3N8SNWkosVtuJAde7CQ4lP8m8eA0PufRTU4=;
 b=jNUksO4DbsQoOJ1kTo4PPbI/wH4dtWmI0pLxWbyP+Devjbbd0mje5KlE
 eLRPIJ7Ssx5wog7q2/AGuPNIozsnMghTWphOJKKG2Fk5uPU2oYQvTGkNN
 HI1oPoTqQnS1CqzT5I+zfkguhsIJ/8d8L5lFSRb3TOnFedHKEe5C5aCeh
 kTx79W0AU9GNHh4jWCMvJuI3vkGqehca95k7Kx+Kk8V9pa9h2ynWWqKwG
 mN8Ligky3ZRwguIaTQDy2uenPsOPueTes2pNzIycaTxy5N26H/RWxd+aI
 KQoQzet3PzO7yUq7/o1spp/hSA0kX4PqAENG3Ydc2TuKgThlQgcnCYluL Q==;
X-CSE-ConnectionGUID: PxkJTyAFTdivBCK5KVD7Ig==
X-CSE-MsgGUID: KYX0dxWmT/y8PELVB+yhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80220413"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="80220413"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:05 -0700
X-CSE-ConnectionGUID: Vkm4wsijR06Hh4Rse+Oulw==
X-CSE-MsgGUID: ky4Va43mTbyINSfZBQT4KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="264679510"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.24])
 ([10.124.223.183])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 01:46:04 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Fri, 22 May 2026 05:45:20 -0300
Subject: [PATCH v3 5/7] drm/xe/rtp: Extract rule_match_item()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rtp-rule-parser-v3-5-0c51039899f4@intel.com>
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

