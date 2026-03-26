Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000B310A88D4
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 17:15:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9456410EA6B;
	Thu, 26 Mar 2026 17:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koZOkbT+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798D710E956;
 Thu, 26 Mar 2026 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774545325; x=1806081325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XsjkWnBXJaeSCGMvm1MHN9OixPiXI2dOQYPNhTPBr7Q=;
 b=koZOkbT+f9gJ7dG/wyj2oi3EIAZn44l6O4pEXUHHd2jEtN82I9F6eB2G
 1mnB/ujljK1JqPW+AWGysIqF62T/IufSbiFLaquRZn05lV5t5OS3GCvuW
 6Q9VtxX1AMzbkbE3dOjKda3+gbcZHo9wI+tY7gcqhUHNVm/Yiyjc8SXPu
 Gr3yLO7kKbAqJ4WexExLdbYctdQIFiHNdO5AFCOWIX7CTmiy6AutVdJhX
 r7d9JolRAC1xcNkBu2Gm55p9dO6wzWw7rartw6rDnpaIK7i57sH6SYtFe
 Q4wi9eFESjsWaCfts7/J7dfGJ8YSDHY9y698BO3Zi+qBu1C4hiDLTK1jm g==;
X-CSE-ConnectionGUID: +HcxfjAmR7K1R0mi3bgOvg==
X-CSE-MsgGUID: Bu7mTRusTzKygTVmKB1GnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75630568"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="75630568"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:25 -0700
X-CSE-ConnectionGUID: epuEvHkHTrCQ4cJr2tUgeA==
X-CSE-MsgGUID: gvhqJs9yQVilPfukZc93Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="262975555"
Received: from dibin-nuc7i7bnh.iind.intel.com ([10.190.239.19])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 10:15:23 -0700
From: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: animesh.manna@intel.com, uma.shankar@intel.com,
 suresh.kumar.kurmi@intel.com
Subject: [PATCH 06/19] drm/i915/display: Fix HAS_DC3CO() and add DC3CO trigger
 enum
Date: Thu, 26 Mar 2026 22:45:44 +0530
Message-ID: <20260326171557.2065632-7-dibin.moolakadan.subrahmanian@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
References: <20260326171557.2065632-1-dibin.moolakadan.subrahmanian@intel.com>
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

Fix HAS_DC3CO() based on display version and introduce an enum to
track DC3CO enabling triggers.

BSpec: 75253
Signed-off-by: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>
---
 .../gpu/drm/i915/display/intel_display_device.h   |  2 +-
 .../gpu/drm/i915/display/intel_display_power.h    | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 35e06fcf794d..002fe0ce951a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -189,7 +189,7 @@ struct intel_display_platforms {
 #define HAS_LRR(__display)		(DISPLAY_VER(__display) >= 12)
 #define HAS_LSPCON(__display)		(IS_DISPLAY_VER(__display, 9, 10))
 #define HAS_LT_PHY(__display)		((__display)->platform.novalake)
-#define HAS_DC3CO(__display)		((__display)->platform.novalake)
+#define HAS_DC3CO(__display)		(DISPLAY_VER(__display) >= 35)
 #define HAS_MBUS_JOINING(__display)	((__display)->platform.alderlake_p || DISPLAY_VER(__display) >= 14)
 #define HAS_MSO(__display)		(DISPLAY_VER(__display) >= 12)
 #define HAS_OVERLAY(__display)		(DISPLAY_INFO(__display)->has_overlay)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.h b/drivers/gpu/drm/i915/display/intel_display_power.h
index d616d5d09cbe..3fb45154864e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.h
+++ b/drivers/gpu/drm/i915/display/intel_display_power.h
@@ -131,6 +131,21 @@ struct intel_power_domain_mask {
 	DECLARE_BITMAP(bits, POWER_DOMAIN_NUM);
 };
 
+/*
+ * DC3CO enabling triggers (bitmask).
+ * DC3CO may be enabled when at least one of these triggers is active.
+ * Additional constraints may still apply.
+ */
+enum intel_dc3co_trigger {
+	DC3CO_TRIGGER_NONE	     = 0,
+	DC3CO_TRIGGER_PSR2	     = BIT(0),
+	DC3CO_TRIGGER_LOBF	     = BIT(1),
+	DC3CO_TRIGGER_PANEL_REPLAY   = BIT(2),
+	DC3CO_TRIGGER_ALL  = DC3CO_TRIGGER_PSR2 |
+			     DC3CO_TRIGGER_LOBF |
+			     DC3CO_TRIGGER_PANEL_REPLAY,
+};
+
 struct i915_power_domains {
 	/*
 	 * Power wells needed for initialization at driver init and suspend
-- 
2.43.0

