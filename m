Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11520C77B73
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF21010E82E;
	Fri, 26 May 2023 16:44:24 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0436B10E824
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119454; x=1716655454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2FQ5F2f3sMqVtVyc1RKyLSz4ugWBB1hUMxJojm2+k/c=;
 b=ZMfqdnCmZhG5QLTR+sMPbjp7WQVBvTHQ8caLzRE5Whe4YSQrEdjJKjhU
 VO+m8NQQ4ouwKuyvo3lMDws4VsqseseG/3AeOxvX/0xCR/CL7OHORY34+
 1YxPktJbk9bJU1ZTL8IeCykwd2d2lCF4FAT8iA+q1INRSqWGCt2VWf48m
 AmUjBnI4ggGN6letSMYMGkawcnEeRCytlPTCpKeY2zAr6yjdcgEac1LtR
 JEZHpXNLOhF+rLALIFrA9/HrWop14uzpl8i3tt5BAWtDSdKR+bkqPxZ7X
 7NbNp/GpbdFbqMHlJk9jNXfQs7rFGZ6SGrSAzmrsF+dhqBRK+3nseVjKD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628383"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628383"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151472"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151472"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:46 -0700
Message-Id: <20230526164358.86393-10-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 09/21] drm/xe/rtp: Add check for media stepping
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

Start differentiating the media and graphics stepping as it will be
important for MTL. Note that RTP is still not prepared to handle the
different types of GT, i.e. checking for graphics version/range/stepping
on a media gt or vice versa still matches regardless of the gt being
passed as parameter. Changing it to accommodate MTL is left for a future
patch.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 12 +++++++-----
 drivers/gpu/drm/xe/xe_rtp.h       | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h |  1 +
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 2ac7b47942fe..70769852a93d 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -43,13 +43,16 @@ static bool rule_matches(const struct xe_device *xe,
 				xe->info.subplatform == r->subplatform;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION:
-			/* TODO: match display */
 			match = xe->info.graphics_verx100 == r->ver_start;
 			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION_RANGE:
 			match = xe->info.graphics_verx100 >= r->ver_start &&
 				xe->info.graphics_verx100 <= r->ver_end;
 			break;
+		case XE_RTP_MATCH_GRAPHICS_STEP:
+			match = xe->info.step.graphics >= r->step_start &&
+				xe->info.step.graphics < r->step_end;
+			break;
 		case XE_RTP_MATCH_MEDIA_VERSION:
 			match = xe->info.media_verx100 == r->ver_start;
 			break;
@@ -57,10 +60,9 @@ static bool rule_matches(const struct xe_device *xe,
 			match = xe->info.media_verx100 >= r->ver_start &&
 				xe->info.media_verx100 <= r->ver_end;
 			break;
-		case XE_RTP_MATCH_GRAPHICS_STEP:
-			/* TODO: match media/display */
-			match = xe->info.step.graphics >= r->step_start &&
-				xe->info.step.graphics < r->step_end;
+		case XE_RTP_MATCH_MEDIA_STEP:
+			match = xe->info.step.media >= r->step_start &&
+				xe->info.step.media < r->step_end;
 			break;
 		case XE_RTP_MATCH_INTEGRATED:
 			match = !xe->info.is_dgfx;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 7ba9d2ecab92..d55701d2f39b 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -39,6 +39,10 @@ struct xe_reg_sr;
 	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
 	  .step_start = start__, .step_end = end__ }
 
+#define _XE_RTP_RULE_MEDIA_STEP(start__, end__)					\
+	{ .match_type = XE_RTP_MATCH_MEDIA_STEP,				\
+	  .step_start = start__, .step_end = end__ }
+
 #define _XE_RTP_RULE_ENGINE_CLASS(cls__)					\
 	{ .match_type = XE_RTP_MATCH_ENGINE_CLASS,				\
 	  .engine_class = (cls__) }
@@ -75,6 +79,19 @@ struct xe_reg_sr;
 #define XE_RTP_RULE_GRAPHICS_STEP(start_, end_)					\
 	_XE_RTP_RULE_GRAPHICS_STEP(STEP_##start_, STEP_##end_)
 
+/**
+ * XE_RTP_RULE_MEDIA_STEP - Create rule matching media stepping
+ * @start_: First stepping matching the rule
+ * @end_: First stepping that does not match the rule
+ *
+ * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
+ * on the left, exclusive on the right.
+ *
+ * Refer to XE_RTP_RULES() for expected usage.
+ */
+#define XE_RTP_RULE_MEDIA_STEP(start_, end_)					\
+	_XE_RTP_RULE_MEDIA_STEP(STEP_##start_, STEP_##end_)
+
 /**
  * XE_RTP_RULE_ENGINE_CLASS - Create rule matching an engine class
  * @cls_: Engine class to match
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 52adbf7de752..af49cbf98407 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -42,6 +42,7 @@ enum {
 	XE_RTP_MATCH_GRAPHICS_STEP,
 	XE_RTP_MATCH_MEDIA_VERSION,
 	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
+	XE_RTP_MATCH_MEDIA_STEP,
 	XE_RTP_MATCH_INTEGRATED,
 	XE_RTP_MATCH_DISCRETE,
 	XE_RTP_MATCH_ENGINE_CLASS,
-- 
2.40.1

