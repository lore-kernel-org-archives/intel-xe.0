Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A09BC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 05:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270A510E163;
	Tue, 18 Jun 2024 05:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E1vn824m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A094210E163
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 05:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718686856; x=1750222856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3HxxGl00ZGTZCfvuoXpDYCv8beLc5sSVPXd3CvwKtk=;
 b=E1vn824mkOEBquGTLO2LUYXF434zDwkFNPxwS8ukm0hyrkR982f8kaU5
 Gohb+I4+GaDfJIhu7DuBqWSWqSNQzirEaQc/DMFzmhSh3HG01YSnvvj2O
 VjhyViKXeVWCo91iSn9gzMlJrRWyQQ08AgKFcmt5Yl+FQks4FVFUr3klJ
 f1is4LdyCuqzoVZewEHcy2YECowtf9HZooDD/AF0vB0ybg4BtYfzhCroW
 6A8wGpH6/kohQxxICrY1LGagWXb1q9usUS5knwJYuQTx6SvfPbjdco74a
 YQn8UWHypJ+ZbcTRHMZ0CNG8/KC/Xi0kX9pnBDdCup5cTotl8LiAZKofR w==;
X-CSE-ConnectionGUID: iuUx8H0/Qaif6bno3rsl6Q==
X-CSE-MsgGUID: a3j+C3anSXK7beYtRRDHTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15256603"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="15256603"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:55 -0700
X-CSE-ConnectionGUID: TiF8VgS5SjexdwaFoI6bUg==
X-CSE-MsgGUID: L+gxF2K2Rga0LgzQmGLY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41537744"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:00:54 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v2 4/5] drm/xe/rtp: Add match on any GT
Date: Mon, 17 Jun 2024 22:00:43 -0700
Message-ID: <20240618050044.324454-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618050044.324454-1-lucas.demarchi@intel.com>
References: <20240618050044.324454-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

One surprising factor of GRAPHICS_VERSION()/MEDIA_VERSION() matching for
people adding new WAs is that it implicitly checks that the
graphics/media IP under check is of that specific type and not that the
device contains a media/graphics IP of that version. Add a new
*_ANY_GT() variant that can be used in that case.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       |  6 ++++++
 drivers/gpu/drm/xe/xe_rtp.h       | 30 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index dc315b8aae07..ac31cba1dbea 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -63,6 +63,9 @@ static bool rule_matches(const struct xe_device *xe,
 				xe->info.graphics_verx100 <= r->ver_end &&
 				(!has_samedia(xe) || !xe_gt_is_media_type(gt));
 			break;
+		case XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT:
+			match = xe->info.graphics_verx100 == r->ver_start;
+			break;
 		case XE_RTP_MATCH_GRAPHICS_STEP:
 			match = xe->info.step.graphics >= r->step_start &&
 				xe->info.step.graphics < r->step_end &&
@@ -82,6 +85,9 @@ static bool rule_matches(const struct xe_device *xe,
 				xe->info.step.media < r->step_end &&
 				(!has_samedia(xe) || xe_gt_is_media_type(gt));
 			break;
+		case XE_RTP_MATCH_MEDIA_VERSION_ANY_GT:
+			match = xe->info.media_verx100 == r->ver_start;
+			break;
 		case XE_RTP_MATCH_INTEGRATED:
 			match = !xe->info.is_dgfx;
 			break;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index bd5b5ba0fb31..ad446731192c 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -140,9 +140,23 @@ struct xe_reg_sr;
 	  .ver_start = ver_start__, .ver_end = ver_end__, }
 
 /**
- * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
+ * XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT - Create rule matching graphics version on any GT
  * @ver__: Graphics IP version to match
  *
+ * Like XE_RTP_RULE_GRAPHICS_VERSION, but it matches even if the current GT
+ * being checked is not of the graphics type. It allows to add RTP entries to
+ * another GT when the device contains a Graphics IP with that version.
+ *
+ * Refer to XE_RTP_RULES() for expected usage.
+ */
+#define XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT(ver__)				\
+	{ .match_type = XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,			\
+	  .ver_start = ver__, }
+
+/**
+ * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
+ * @ver__: Media IP version to match
+ *
  * Refer to XE_RTP_RULES() for expected usage.
  */
 #define XE_RTP_RULE_MEDIA_VERSION(ver__)					\
@@ -163,6 +177,20 @@ struct xe_reg_sr;
 	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_RANGE,			\
 	  .ver_start = ver_start__, .ver_end = ver_end__, }
 
+/**
+ * XE_RTP_RULE_MEDIA_VERSION_ANY_GT - Create rule matching media version on any GT
+ * @ver__: Media IP version to match
+ *
+ * Like XE_RTP_RULE_MEDIA_VERSION, but it matches even if the current GT being
+ * checked is not of the media type. It allows to add RTP entries to another
+ * GT when the device contains a Media IP with that version.
+ *
+ * Refer to XE_RTP_RULES() for expected usage.
+ */
+#define XE_RTP_RULE_MEDIA_VERSION_ANY_GT(ver__)					\
+	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,			\
+	  .ver_start = ver__, }
+
 /**
  * XE_RTP_RULE_IS_INTEGRATED - Create a rule matching integrated graphics devices
  *
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 10150bc22ccd..1b76b947c706 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -42,9 +42,11 @@ enum {
 	XE_RTP_MATCH_SUBPLATFORM,
 	XE_RTP_MATCH_GRAPHICS_VERSION,
 	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
+	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
 	XE_RTP_MATCH_GRAPHICS_STEP,
 	XE_RTP_MATCH_MEDIA_VERSION,
 	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
+	XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,
 	XE_RTP_MATCH_MEDIA_STEP,
 	XE_RTP_MATCH_INTEGRATED,
 	XE_RTP_MATCH_DISCRETE,
-- 
2.43.0

