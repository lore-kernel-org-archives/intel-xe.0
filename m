Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DA0CED250
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 01:35:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C299D10E447;
	Tue,  8 Oct 2024 01:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Se1GnxKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A19410E07D
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 01:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728351318; x=1759887318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QIGLHuZXdJdinQmKSMb5HFmYduL5CUYNDaTOl6RlIn8=;
 b=Se1GnxKdN2oU1fxO+nNAaun84WRWaBYU6iLWk2sc+ZRZmC1qx6lAvK2A
 IzR2+tcZSG/51u+0iHVkEMCC17RGv71ub0BCm87in8TdynA9TBYffs0lL
 1iOjmWLEFpO2hVSD1dC2tsOxibC+rQkj3Ti0dMZoXzu6Fw2yrsHWm1u7y
 E5KgFTe6Qpz0l7ftSmA0cRoVfInEBSpgEva9+JDYnnB5CAmpR3DxVQH1m
 Bv9+N1RisriVlwUIuT0+oq+3a/fTCOOF8G1kRQ4NeMR6E88pANnRYe5Mc
 ikGdwiSOQjpMfGUwuOQwe8xSEmUm2a7Qbg3peA/23Ewy4scRJmbaAuLyq g==;
X-CSE-ConnectionGUID: Zr7lljMaSMSqE2XCkompzg==
X-CSE-MsgGUID: VYVE/PfQQeezYZV561r84w==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38652975"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38652975"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:18 -0700
X-CSE-ConnectionGUID: Jzr3MBMOSp26aCdX0GD4zA==
X-CSE-MsgGUID: WgpVWi9WTyWUu9BY307iJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80454310"
Received: from msatwood-mobl.amr.corp.intel.com (HELO
 msatwood-mobl.hsd1.or.comcast.net) ([10.125.110.117])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 18:35:17 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>
Subject: [PATCH 3/6] drm/xe/xe3: Add initial set of workarounds
Date: Mon,  7 Oct 2024 18:35:06 -0700
Message-ID: <20241008013509.61233-4-matthew.s.atwood@intel.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20241008013509.61233-1-matthew.s.atwood@intel.com>
References: <20241008013509.61233-1-matthew.s.atwood@intel.com>
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

From: Gustavo Sousa <gustavo.sousa@intel.com>

Implement the initial set of workarounds for Xe3 IPs.

v2: correct steppings for 14021490052, 22019338487

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  3 ++
 drivers/gpu/drm/xe/xe_wa.c               | 52 ++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  1 +
 4 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 81b71903675e..7c78496e6213 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -186,6 +186,7 @@
 
 #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
 #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
+#define   RAMDFTUNIT_CLKGATE_DIS		REG_BIT(9)
 
 #define VDBOX_CGCTL3F18(base)			XE_REG((base) + 0x3f18)
 #define   ALNUNIT_CLKGATE_DIS			REG_BIT(13)
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index fb80042cbe0d..ac5a9ae94eb1 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -286,6 +286,9 @@
 #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
 #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
 
+#define UNSLCGCTL9454				XE_REG(0x9454)
+#define   LSCFE_CLKGATE_DIS			REG_BIT(4)
+
 #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		XE_REG_MCR(0x94d4)
 #define   L3_CR2X_CLKGATE_DIS			REG_BIT(17)
 #define   L3_CLKGATE_DIS			REG_BIT(16)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 94ea76b098ed..a47f43166651 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -252,6 +252,34 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
 	},
 
+	/* Xe3_LPG */
+
+	{ XE_RTP_NAME("14021871409"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
+	},
+
+	/* Xe3_LPM */
+
+	{ XE_RTP_NAME("16021867713"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("16021865536"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+	{ XE_RTP_NAME("14021486841"),
+	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
+		       ENGINE_CLASS(VIDEO_DECODE)),
+	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
+	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+	},
+
 	{}
 };
 
@@ -568,6 +596,13 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 	},
 
+	/* Xe3_LPG */
+
+	{ XE_RTP_NAME("14021402888"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+	},
+
 	{}
 };
 
@@ -656,8 +691,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	/* Xe2_LPG */
 
 	{ XE_RTP_NAME("16020518922"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(FF_MODE,
 			     DIS_TE_AUTOSTRIP |
 			     DIS_MESH_PARTIAL_AUTOSTRIP |
@@ -703,7 +737,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
 	},
 	{ XE_RTP_NAME("14021490052"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(FF_MODE,
 			     DIS_MESH_PARTIAL_AUTOSTRIP |
 			     DIS_MESH_AUTOSTRIP),
@@ -739,6 +773,18 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
 
+	/* Xe3_LPG */
+	{ XE_RTP_NAME("14021490052"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
+
 	{}
 };
 
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 920ca5060146..51d7208d7681 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -33,6 +33,7 @@
 		GRAPHICS_VERSION(2004)
 22019338487	MEDIA_VERSION(2000)
 		GRAPHICS_VERSION(2001)
+		MEDIA_VERSION(3000), GRAPHICS_STEP(A0, B0)
 22019338487_display	PLATFORM(LUNARLAKE)
 16023588340	GRAPHICS_VERSION(2001)
 14019789679	GRAPHICS_VERSION(1255)
-- 
2.45.0

