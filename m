Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A1CC7EE31
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 21:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6FD10E784;
	Thu, 25 May 2023 21:35:09 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E1910E782
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 21:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685050480; x=1716586480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5oRDrvVbFyYbjk/FInGbOGdA9n1vtSYMwZHkvWsD48=;
 b=djRSVabijQyPmtffs5sIgR9QM+BUotTCNpADYvFYc+Y0SSWBZjlvoEaK
 V7LCHKbvfKlifWtBefHFGSaerWOrGjQfOLBfLhgzeU1LR+FVD50XJcD1h
 aFXv9YMQ7Rq+e3dpO3NAu3aqDy1FP6f6vrIiJeS3rAOJYjJGUK+29So5u
 s1sH5j7ydTUJvb6uVa/c2Zs36I2VDvrOCmRBkx7F1XS0ri7zvwU2bV/Yf
 G+JPvoAM0v7YoDIKlHXTW29+aAgX59li47OuanTjMRbH/jIk3WBjKtO4e
 g5ETxSba+y5rMJFaTwXz9QEi3zdvtHo17Xb4ZSinU7HBAwHFcuZBUaMZb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="334377920"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="334377920"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737970781"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737970781"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 14:34:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 25 May 2023 14:34:06 -0700
Message-Id: <20230525213407.3907094-21-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525213407.3907094-1-lucas.demarchi@intel.com>
References: <20230525213407.3907094-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 20/21] drm/xe/rtp: Also check gt type
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

