Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E959C5B559
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75F510E0E3;
	Wed,  4 Jun 2025 14:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEYhbjaw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF38210E0D2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749048762; x=1780584762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bil9lwOO3vLvQ6BDuOWUZ/uxZLReVpSMQVbrBhPdFbM=;
 b=CEYhbjawhbjEfTK4Jqz7VzXFtSGeFz4jzmCuM2IqffSqizsGFP0xgpYZ
 YfR1b1Ey7+UDRDTvQUQL1aIsxyu3jx3QcGvkRcc/24FWzii8RCQWCRX3F
 Fohz++Z7zZhEopYFrZ/7CMejTBtJ4yb4wHFGVeBwQ7DRRry6D1MI9v7TN
 jT7lNXRoF9n8H5ZisEzpe1eE1XK/FXuS8rDXDE6KaX7D6R2ViV8x74C6e
 DKOP98q3pbGPFWOYYi3H7j6R4n32B756YtuEJ3r3Mo7bV4y4io3S7i81T
 Fm8aHoYZkZoOZK34BOZ/GkN0NQdXtN87JiLByKA763/nYOxohvDkxUQi3 Q==;
X-CSE-ConnectionGUID: mMt4ehkhRH6XyQ9TFjdd/A==
X-CSE-MsgGUID: PezItDAKR2CEDDNh97PxOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51228677"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51228677"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:52:42 -0700
X-CSE-ConnectionGUID: h7nfcoZ1R9y2MTKPzqu/Pg==
X-CSE-MsgGUID: NGVPIUXFS6eKUxmUYgjrQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150004762"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa003.jf.intel.com with ESMTP; 04 Jun 2025 07:52:41 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v2 2/3] drm/xe/xe2_hpg: Add set of workarounds
Date: Wed,  4 Jun 2025 20:22:35 +0530
Message-Id: <20250604145236.1143122-3-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
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

-v2: Fix xe2_hpg GMD version for some workarounds.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c         | 55 +++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_wa_oob.rules |  4 +--
 2 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 67196baa4249..2c0e0adc5904 100644
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
@@ -507,6 +507,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
 	},
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
+	},
 	/*
 	 * These two workarounds are the same, just applying to different
 	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
@@ -533,31 +537,38 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	/* Xe2_HPG */
 
 	{ XE_RTP_NAME("16018712365"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
 	},
 	{ XE_RTP_NAME("16018737384"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED),
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
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
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
@@ -566,7 +577,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	 * apply this to all engines for simplicity.
 	 */
 	{ XE_RTP_NAME("16021639441"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
 			     GHWSP_CSB_REPORT_DIS |
 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
@@ -578,13 +589,19 @@ static const struct xe_rtp_entry_sr engine_was[] = {
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
+	{ XE_RTP_NAME("18034896535"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
+	},
 
 	/* Xe2_LPM */
 
@@ -774,7 +791,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
 	},
 	{ XE_RTP_NAME("18033852989"),
-	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGLE_TEST))
 	},
 	{ XE_RTP_NAME("14021567978"),
@@ -807,7 +824,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
 	},
 	{ XE_RTP_NAME("14019386621"),
-	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
 	},
 	{ XE_RTP_NAME("14020756599"),
@@ -824,13 +841,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
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
index 9efc5accd43d..425cb401c276 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -30,10 +30,10 @@
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION(3001)
-14022293748	GRAPHICS_VERSION(2001)
+14022293748	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
-22019794406	GRAPHICS_VERSION(2001)
+22019794406	GRAPHICS_VERSION_RANGE(2001, 2002)
 		GRAPHICS_VERSION(2004)
 		GRAPHICS_VERSION_RANGE(3000, 3001)
 22019338487	MEDIA_VERSION(2000)
-- 
2.34.1

