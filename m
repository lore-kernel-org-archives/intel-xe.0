Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D68F30951
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 12:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828C10E285;
	Thu,  5 Mar 2026 12:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LaTBUk9P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33CC110E285
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772712193; x=1804248193;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=CXY58HR5Z2se0s4AI8uflKZwVPPynv/9dkUB15A0fTM=;
 b=LaTBUk9PLKvWOfaUFKu7jzvb61y5eJNp6/ld1p3TO358EkwX2OGHzBy5
 HVO+eCmNJhUtNoX35kwtvBZ98L6thN9Gvp4TO8ItunVcjAiI5d+o5fyp9
 yVKGwJPc7fOeYNt0HuQAvI9POfJBxplEiIpzWDznsfbb1sPDJyHrfFYl6
 fUaMD423HGGWFf49lb+k99JDkNEuW2q+fMyfI5D3HgGFNFVIcPXfp7r0g
 wAwxFkfePWBfLrp1a8A2OGu23Lfx39QGcdq3RQbueOtC3ECuOG/XpaYPn
 L1pmPB6IezMQMS1p1bQwJt4NyQzaY9Fnv5o30lTk6lCANWYUqpAyW3xRD A==;
X-CSE-ConnectionGUID: Q0MKfLrXRVmPQc4gRw1Yjg==
X-CSE-MsgGUID: DOIxkrD/SbezrdzqUFPABA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73702516"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73702516"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:13 -0800
X-CSE-ConnectionGUID: 4YygSFR2QASHn8FXJflmQQ==
X-CSE-MsgGUID: GoVMDmHHTD+i/xY74c5dXg==
X-ExtLoop1: 1
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.218])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 04:03:12 -0800
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Thu, 05 Mar 2026 09:02:31 -0300
Subject: [PATCH 4/7] drm/xe/rtp: Add support for matching platform-level
 stepping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-extra-nvl-p-enabling-patches-v1-4-5020d5289dea@intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
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

Add support for matching platform-level stepping, which will be used for
an upcoming NVL-P workaround.

As support for reading platform-level stepping information is added only
as needed in the driver, add a warning when the rule finds a STEP_NONE
value, which is an indication that the driver is missing such a support.

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       |  7 +++++++
 drivers/gpu/drm/xe/xe_rtp.h       | 20 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 7bfdc6795ce6..991f218f1cc3 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -55,6 +55,13 @@ static bool rule_matches(const struct xe_device *xe,
 			match = xe->info.platform == r->platform &&
 				xe->info.subplatform == r->subplatform;
 			break;
+		case XE_RTP_MATCH_PLATFORM_STEP:
+			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
+				return false;
+
+			match = xe->info.step.platform >= r->step_start &&
+				xe->info.step.platform < r->step_end;
+			break;
 		case XE_RTP_MATCH_GRAPHICS_VERSION:
 			if (drm_WARN_ON(&xe->drm, !gt))
 				return false;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index be4195264286..7d6daa7eb1e4 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -35,6 +35,10 @@ struct xe_reg_sr;
 	{ .match_type = XE_RTP_MATCH_SUBPLATFORM,				\
 	  .platform = plat__, .subplatform = sub__ }
 
+#define _XE_RTP_RULE_PLATFORM_STEP(start__, end__)				\
+	{ .match_type = XE_RTP_MATCH_PLATFORM_STEP,				\
+	  .step_start = start__, .step_end = end__ }
+
 #define _XE_RTP_RULE_GRAPHICS_STEP(start__, end__)				\
 	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
 	  .step_start = start__, .step_end = end__ }
@@ -66,6 +70,22 @@ struct xe_reg_sr;
 #define XE_RTP_RULE_SUBPLATFORM(plat_, sub_)					\
 	_XE_RTP_RULE_SUBPLATFORM(XE_##plat_, XE_SUBPLATFORM_##plat_##_##sub_)
 
+/**
+ * XE_RTP_RULE_PLATFORM_STEP - Create rule matching platform-level stepping
+ * @start_: First stepping matching the rule
+ * @end_: First stepping that does not match the rule
+ *
+ * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
+ * on the left, exclusive on the right.
+ *
+ * You need to make sure that proper support for reading platform-level stepping
+ * information is present for the target platform before using this rule.
+ *
+ * Refer to XE_RTP_RULES() for expected usage.
+ */
+#define XE_RTP_RULE_PLATFORM_STEP(start_, end_)					\
+	_XE_RTP_RULE_PLATFORM_STEP(STEP_##start_, STEP_##end_)
+
 /**
  * XE_RTP_RULE_GRAPHICS_STEP - Create rule matching graphics stepping
  * @start_: First stepping matching the rule
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 6ba7f226c227..166251615be1 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -41,6 +41,7 @@ struct xe_rtp_action {
 enum {
 	XE_RTP_MATCH_PLATFORM,
 	XE_RTP_MATCH_SUBPLATFORM,
+	XE_RTP_MATCH_PLATFORM_STEP,
 	XE_RTP_MATCH_GRAPHICS_VERSION,
 	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
 	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,

-- 
2.52.0

