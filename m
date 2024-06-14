Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F53CC27C7B
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 21:49:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CEC10E2B7;
	Fri, 14 Jun 2024 21:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MwIj1pAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC9110E2C0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 21:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718401726; x=1749937726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OEt+8yQPdbVZMxzDpVvf8j4ZXKINO9wKQwynndR2/E=;
 b=MwIj1pAS+HAF+ezHvCQsuTYPEJ6GWAL8XdT5maAlzBrMMvZCQptX7AS/
 tjWuFRhKHrPajfXVED8nLuxqCSkjccrfQdOdcLt80uIxuw3oAXLWiUDrf
 K+/xNw7exX4itUG2NFWjTiOR6NGdkNQOBe9IIbAqk5sz0u6OoZnfvI9xQ
 XAwAcUojuSSIUFoM0VL6KBR3cq7678Jjc8//V/eGW8MWQi0MKdWH1J/in
 VaeOkQzJ2EIdkq3M5p0oaPiwcr5dH4xPxEdWDrCg40rQrxY7wnWu6SnRl
 7leJ13wDQOZj3d0+otCbBkD0PV6Xz/pzylXD09IcRv+q6neyzVMAsfQ1s g==;
X-CSE-ConnectionGUID: iUXpPVsBQXyLbq3O9fulFA==
X-CSE-MsgGUID: G1MCaTtGSWy06mCP6E3wLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="26728564"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="26728564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:48:44 -0700
X-CSE-ConnectionGUID: 5c7FbfWDTu64dX14EYHoAA==
X-CSE-MsgGUID: 2gWsHLaYSbiReUtnKjWV4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40579334"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.246.19.248])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 14:48:43 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 1/2] drm/xe/rtp: Prepare RTP for VF rules
Date: Fri, 14 Jun 2024 23:48:20 +0200
Message-Id: <20240614214821.2252-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240614214821.2252-1-michal.wajdeczko@intel.com>
References: <20240614214821.2252-1-michal.wajdeczko@intel.com>
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

We don't want any current RTP actions to be processed by the VF
drivers, but instead of blocking them completely, add new match
types that would allow new VF-ready or VF-only rules to be added.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       | 13 ++++++++++++-
 drivers/gpu/drm/xe/xe_rtp.h       | 16 ++++++++++++++++
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index eff1c9c2f5cc..0bea1f374f6a 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -13,6 +13,7 @@
 #include "xe_gt_topology.h"
 #include "xe_macros.h"
 #include "xe_reg_sr.h"
+#include "xe_sriov.h"
 
 /**
  * DOC: Register Table Processing
@@ -36,6 +37,8 @@ static bool rule_matches(const struct xe_device *xe,
 {
 	const struct xe_rtp_rule *r;
 	unsigned int i;
+	bool is_vf = IS_SRIOV_VF(gt_to_xe(gt));
+	bool match_vf = false;
 	bool match;
 
 	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
@@ -96,6 +99,14 @@ static bool rule_matches(const struct xe_device *xe,
 		case XE_RTP_MATCH_FUNC:
 			match = r->match_func(gt, hwe);
 			break;
+		case XE_RTP_MATCH_VF_READY:
+			match_vf = true;
+			match = true;
+			break;
+		case XE_RTP_MATCH_VF_ONLY:
+			match_vf = true;
+			match = is_vf;
+			break;
 		default:
 			drm_warn(&xe->drm, "Invalid RTP match %u\n",
 				 r->match_type);
@@ -106,7 +117,7 @@ static bool rule_matches(const struct xe_device *xe,
 			return false;
 	}
 
-	return true;
+	return is_vf ? match_vf : true;
 }
 
 static void rtp_add_sr_entry(const struct xe_rtp_action *action,
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index 337b1ef1959c..5a4194d0d208 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -179,6 +179,22 @@ struct xe_reg_sr;
 #define XE_RTP_RULE_IS_DISCRETE							\
 	{ .match_type = XE_RTP_MATCH_DISCRETE }
 
+/**
+ * XE_RTP_RULE_VF_READY - Create a rule matching also virtual function device
+ *
+ * Refer to XE_RTP_RULES() for expected usage.
+ */
+#define XE_RTP_RULE_VF_READY							\
+	{ .match_type = XE_RTP_MATCH_VF_READY }
+
+/**
+ * XE_RTP_RULE_VF_ONLY - Create a rule matching only virtual function device
+ *
+ * Refer to XE_RTP_RULES() for expected usage.
+ */
+#define XE_RTP_RULE_VF_ONLY							\
+	{ .match_type = XE_RTP_MATCH_VF_ONLY }
+
 /**
  * XE_RTP_ACTION_WR - Helper to write a value to the register, overriding all
  *                    the bits
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 637acc7626a4..f322c8f273ea 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -51,6 +51,8 @@ enum {
 	XE_RTP_MATCH_ENGINE_CLASS,
 	XE_RTP_MATCH_NOT_ENGINE_CLASS,
 	XE_RTP_MATCH_FUNC,
+	XE_RTP_MATCH_VF_READY,
+	XE_RTP_MATCH_VF_ONLY,
 };
 
 /** struct xe_rtp_rule - match rule for processing entry */
-- 
2.43.0

