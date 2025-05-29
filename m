Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E6C5AD49
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 12:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF3B10E13B;
	Thu, 29 May 2025 12:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EY7db+eo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5C910E12B
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748520339; x=1780056339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=muUehfh/RlwguOHNCVGeKFpQJt7eA3+wvH0S/PZDyeI=;
 b=EY7db+eoXlqipI4AO2XjoOkDGjDgJE6rVybbBu8TCQfxTZnWZqeeJ+NU
 hzxk3caPLMKydG98S4B0oETJCDdx1x0Y52fSUWGWzQr9cUG+YzStJ3U+H
 vv8nvL+nIAOmun1VGP2tTqp8o3mDeWeSajJ15nm90pKJ4yO03M44lc7fz
 y802+0kY1h40I76/qAQWnTaj0X+PSCfzigfQieJNLM2Z3c14vQ/as4QpJ
 t/GCHjVy7PFZTW4PZmNKsh1BGaho74VsCxRQJWE1PIq/aq/S79r1nPJQf
 5veW0vOlIdeL8ePkltaER0I1Bbz7PWBIRy4kO5lBp8BiUKyGLnUeVAPJ+ Q==;
X-CSE-ConnectionGUID: dpq/qoc6QZG9BGriRu2CjQ==
X-CSE-MsgGUID: Kv7JKsfhS/uziUQsIGC/IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50461479"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="50461479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 05:05:39 -0700
X-CSE-ConnectionGUID: AQ5cDUUpRpybLr6WEb34mg==
X-CSE-MsgGUID: 9jbm+O09Qymee1FOs/AQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; d="scan'208";a="148585590"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa004.jf.intel.com with ESMTP; 29 May 2025 05:05:37 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH 1/3] drm/xe/xe2_hpg: Add set of workarounds
Date: Thu, 29 May 2025 17:35:32 +0530
Message-Id: <20250529120534.531237-2-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
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

From: Shekhar Chauhan <shekhar.chauhan@intel.com>

Add set of workarounds for xe2_hpg.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c         | 56 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  5 +--
 2 files changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 67196baa4249..11c1fe3b2ea4 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -489,8 +489,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
-	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+	{ XE_RTP_NAME("16021540221"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
 	},
@@ -533,31 +533,38 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	/* Xe2_HPG */
 
 	{ XE_RTP_NAME("16018712365"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
 	},
 	{ XE_RTP_NAME("16018737384"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
 	{ XE_RTP_NAME("14019988906"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
 	},
 	{ XE_RTP_NAME("14019877138"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
 	},
 	{ XE_RTP_NAME("14020338487"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
 	},
 	{ XE_RTP_NAME("18032247524"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
 	},
 	{ XE_RTP_NAME("14018471104"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
 	},
 	/*
@@ -566,7 +573,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	 * apply this to all engines for simplicity.
 	 */
 	{ XE_RTP_NAME("16021639441"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
 			     GHWSP_CSB_REPORT_DIS |
 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
@@ -578,13 +585,24 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
 	},
 	{ XE_RTP_NAME("14021402888"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
 	},
-	{ XE_RTP_NAME("14021821874"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	{ XE_RTP_NAME("14021821874, 14022954250"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
 	},
+	{ XE_RTP_NAME("14019322943"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2002), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, TGM_WRITE_EOM_FORCE))
+	},
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
+	},
 
 	/* Xe2_LPM */
 
@@ -774,7 +792,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
 	},
 	{ XE_RTP_NAME("18033852989"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 	{ XE_RTP_NAME("14021567978"),
@@ -807,7 +825,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
 	},
 	{ XE_RTP_NAME("14019386621"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
 	},
 	{ XE_RTP_NAME("14020756599"),
@@ -824,13 +842,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_AUTOSTRIP))
 	},
 	{ XE_RTP_NAME("15016589081"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
 	},
 	{ XE_RTP_NAME("22021007897"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX_ENABLE))
 	},
+	{ XE_RTP_NAME("18033852989"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
+	},
 
 	/* Xe3_LPG */
 	{ XE_RTP_NAME("14021490052"),
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 9efc5accd43d..efdeb55cd6a8 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -30,10 +30,11 @@
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION(3001)
-14022293748	GRAPHICS_VERSION(2001)
+14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
-22019794406	GRAPHICS_VERSION(2001)
+		GRAPHICS_VERSION(3003)
+22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 22019338487	MEDIA_VERSION(2000)
-- 
2.34.1

