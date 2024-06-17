Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71C4C2BBCA
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 18:25:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5B110E4AD;
	Mon, 17 Jun 2024 18:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dynsGXby";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC710E49A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 18:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718648735; x=1750184735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GaqG7Zla/GcrsaSLRA3NXkQ/886cjiBGcPGM0zDxXK8=;
 b=dynsGXbyT0whbdUR9t9JRunNC/bvLBPQmQYfZx2Pl67ec3F/R8bF8TX0
 WU/pJoUYrchs78xYpma2Zb6oXxMVRE+J5xdAxBYl8hQROfYiq9AphnjzQ
 qVL5SbAjLMw/3JPAZyp/YgqBYslRbD4dOql6iWsGfGEW7KOyAIBBxqlSz
 1OIgyQLkrn3hiYIqVHQp+65JyQ4mDqicvIVlevBsExVWskJ3B/xP9ea1y
 kbYEeut1OLpyVkNhiukgGrpUyHfcpuj9chHq7rVZ4ERsC4sNEVj6LOXwJ
 eyreAj5oN1CA8awG86989r1XCFxg32Ybgr4VBkhb7UmMLt+kGm3YJl4dn Q==;
X-CSE-ConnectionGUID: z2TNG30vQ6S14hY9075VVw==
X-CSE-MsgGUID: t53f/0EKSKidI1JTCHqVog==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="19276233"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="19276233"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:35 -0700
X-CSE-ConnectionGUID: MGz1Bi3STkaAaUXfQtfeog==
X-CSE-MsgGUID: hKJiRURDQ2KRm7EmGnpX/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="45642442"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 11:25:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 4/5] drm/xe/rtp: Add match on any GT
Date: Mon, 17 Jun 2024 11:25:17 -0700
Message-ID: <20240617182518.280975-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240617182518.280975-1-lucas.demarchi@intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
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
 drivers/gpu/drm/xe/xe_rtp.h       | 30 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 2 files changed, 31 insertions(+), 1 deletion(-)

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

