Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BB4C7EE2C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9361110E823;
	Fri, 26 May 2023 16:44:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE1010E81A
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119456; x=1716655456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dCrNIwQactN8shC3Z/bf9osUs9UVuoO2bSt1yGCOcUk=;
 b=VqmnEorcqHf9pgIF1ZstLysGwbPzWPsXX1fD8ufOdvQwn4/RN7mGg1Ta
 ZjuMLcWKxmAShcZo1n+cHdoXVKiECMGbwAqSz8e9d8RKOw7LtYc7517+V
 JI7STiQSxVQZVplYfMaYQs/quGhsw4mZJomt8lmJPjD93doOaA+JFi8dc
 pxDURlLtNPWnDgpeEpGVV+zTvRtubgpqsx08NJLg7+EFF0sEd8s/w1i9M
 bmrDemEXoxiA4/5dC2i1tRse94yTLM02zF6FtP1P2mViUdnSVlQxrlTRJ
 mz54M4JWjPxmjgVoecvNXDr3perN4EBUttYFOW4+Lt3kJRyCwL5SFzJd/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628396"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628396"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151510"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151510"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:15 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:57 -0700
Message-Id: <20230526164358.86393-21-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 20/21] drm/xe/rtp: Also check gt type
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

When running rules on MTL and beyond that have media as a standalone GT,
the rule should only match if the gt passed as parameter match the
version/range/stepping that the rule is checking. This allows
workarounds affecting only the media GT to be applied only on that GT
and vice-versa.

For platforms before MTL, the GT will not be of media type, even if it
includes media engines. Make sure to cover that case by checking if the
platforma has standalone media.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index ebcfb04c391a..43a86358efb6 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -23,6 +23,11 @@
  * the values to the registers that have matching rules.
  */
 
+static bool has_samedia(const struct xe_device *xe)
+{
+	return xe->info.media_verx100 >= 1300;
+}
+
 static bool rule_matches(const struct xe_device *xe,
 			 struct xe_gt *gt,
 			 struct xe_hw_engine *hwe,
@@ -43,26 +48,32 @@ static bool rule_matches(const struct xe_device *xe,
 				xe->info.subplatform == r->subplatform;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION:
-			match = xe->info.graphics_verx100 == r->ver_start;
+			match = xe->info.graphics_verx100 == r->ver_start &&
+				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
 			match = xe->info.graphics_verx100 >= r->ver_start &&
-				xe->info.graphics_verx100 <= r->ver_end;
+				xe->info.graphics_verx100 <= r->ver_end &&
+				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_GRAPHICS_STEP:
 			match = xe->info.step.graphics >= r->step_start &&
-				xe->info.step.graphics < r->step_end;
+				xe->info.step.graphics < r->step_end &&
+				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION:
-			match = xe->info.media_verx100 == r->ver_start;
+			match = xe->info.media_verx100 == r->ver_start &&
+				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_VERSION_RANGE:
 			match = xe->info.media_verx100 >= r->ver_start &&
-				xe->info.media_verx100 <= r->ver_end;
+				xe->info.media_verx100 <= r->ver_end &&
+				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_MEDIA_STEP:
 			match = xe->info.step.media >= r->step_start &&
-				xe->info.step.media < r->step_end;
+				xe->info.step.media < r->step_end &&
+				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
 		case XE_RTP_MATCH_INTEGRATED:
 			match = !xe->info.is_dgfx;
-- 
2.40.1

