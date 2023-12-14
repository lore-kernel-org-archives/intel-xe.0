Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423DEC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 21:52:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9E10E209;
	Thu, 14 Dec 2023 21:52:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9319D10E209
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 21:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702590726; x=1734126726;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KFjVThphfzjQLl88elol+oPvNQ1NXuIId/mWPB4E1Ec=;
 b=ZzGlbaOiQnBrvXGA5eWVz5SWkczqFIaf6G5h75JG1DwGmmizl0rMXB0w
 adpn2yBSXBWHdsidwx4zx64xfW47oueTbpPEfu7mmuIDX5fO9W6VkMUpD
 sqnAAOYxkg7gbjkAPLkanGOXrlcwqenePWiIJzPDNAX7XDqklOi1xjyLT
 i8v5IJliiEqLco5GaqSL9Zn9ZHxudSLefK87a2/PFqkzaks7At5mf6S9c
 7FNo+RdP0nI7QkIrellD/dWKVbhTHoWACQYbRuS7NJN4TlLbidwCN+eja
 mMy3dfQ0OO8Yo8RppsAdWxRPm+G6B9RMu1lNGzfFdcCM3k0wyW9YiVRnp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="426323312"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="426323312"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:52:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724216251"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="724216251"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 13:52:05 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/dg2: Drop pre-production workarounds
Date: Thu, 14 Dec 2023 13:52:00 -0800
Message-ID: <20231214215159.2352350-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Pre-production hardware is anything before C0 (for DG2-G10), before B1
(for DG2-G11), or before A1 (for DG2-G12).  Workarounds specific to such
hardware was already removed from i915 in commit eaeb4b361452
("drm/i915/dg2: Drop pre-production GT workarounds") and there's even
less value keeping these around in the Xe driver.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        |   8 +-
 drivers/gpu/drm/xe/xe_wa.c         | 163 -----------------------------
 drivers/gpu/drm/xe/xe_wa_oob.rules |   7 +-
 3 files changed, 2 insertions(+), 176 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 482cb0df9f15..76b31d542e1a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -133,13 +133,10 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (XE_WA(gt, 22012773006))
 		flags |= GUC_WA_POLLCS;
 
-	if (XE_WA(gt, 16011759253))
-		flags |= GUC_WA_GAM_CREDITS;
-
 	if (XE_WA(gt, 14014475959))
 		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
 
-	if (XE_WA(gt, 22011391025) || XE_WA(gt, 14012197797))
+	if (XE_WA(gt, 22011391025))
 		flags |= GUC_WA_DUAL_QUEUE;
 
 	/*
@@ -150,9 +147,6 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
 	if (GRAPHICS_VERx100(xe) < 1270)
 		flags |= GUC_WA_PRE_PARSER;
 
-	if (XE_WA(gt, 16011777198))
-		flags |= GUC_WA_RCS_RESET_BEFORE_RC6;
-
 	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 23f1285135b8..4b3fa1a5a3e6 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -125,13 +125,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	/* DG2 */
 
-	{ XE_RTP_NAME("16010515920"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
-		       GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(VIDEO_DECODE)),
-	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F18(0), ALNUNIT_CLKGATE_DIS)),
-	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
-	},
 	{ XE_RTP_NAME("22010523718"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
 	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, CG3DDISCFEG_CLKGATE_DIS))
@@ -140,61 +133,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
 	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKGATE_DIS))
 	},
-	{ XE_RTP_NAME("14012362059"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
-	},
-	{ XE_RTP_NAME("14012362059"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
-	},
-	{ XE_RTP_NAME("14010948348"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("14011037102"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(UNSLCGCTL9444, LTCDD_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("14011371254"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("14011431319"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(UNSLCGCTL9440,
-			     GAMTLBOACS_CLKGATE_DIS |
-			     GAMTLBVDBOX7_CLKGATE_DIS | GAMTLBVDBOX6_CLKGATE_DIS |
-			     GAMTLBVDBOX5_CLKGATE_DIS | GAMTLBVDBOX4_CLKGATE_DIS |
-			     GAMTLBVDBOX3_CLKGATE_DIS | GAMTLBVDBOX2_CLKGATE_DIS |
-			     GAMTLBVDBOX1_CLKGATE_DIS | GAMTLBVDBOX0_CLKGATE_DIS |
-			     GAMTLBKCR_CLKGATE_DIS | GAMTLBGUC_CLKGATE_DIS |
-			     GAMTLBBLT_CLKGATE_DIS),
-			 SET(UNSLCGCTL9444,
-			     GAMTLBGFXA0_CLKGATE_DIS | GAMTLBGFXA1_CLKGATE_DIS |
-			     GAMTLBCOMPA0_CLKGATE_DIS | GAMTLBCOMPA1_CLKGATE_DIS |
-			     GAMTLBCOMPB0_CLKGATE_DIS | GAMTLBCOMPB1_CLKGATE_DIS |
-			     GAMTLBCOMPC0_CLKGATE_DIS | GAMTLBCOMPC1_CLKGATE_DIS |
-			     GAMTLBCOMPD0_CLKGATE_DIS | GAMTLBCOMPD1_CLKGATE_DIS |
-			     GAMTLBMERT_CLKGATE_DIS |
-			     GAMTLBVEBOX3_CLKGATE_DIS | GAMTLBVEBOX2_CLKGATE_DIS |
-			     GAMTLBVEBOX1_CLKGATE_DIS | GAMTLBVEBOX0_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("14010569222"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, GAMEDIA_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("14011028019"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(SSMCGCTL9530, RTFUNIT_CLKGATE_DIS))
-	},
-	{ XE_RTP_NAME("14010680813"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHP_GAMSTLB_CTRL,
-			     CONTROL_BLOCK_CLKGATE_DIS |
-			     EGRESS_BLOCK_CLKGATE_DIS |
-			     TAG_BLOCK_CLKGATE_DIS))
-	},
 	{ XE_RTP_NAME("14014830051"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(CLR(SARB_CHICKEN1, COMP_CKN_IN))
@@ -375,13 +313,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
 			     POLYGON_TRIFAN_LINELOOP_DISABLE))
 	},
-	{ XE_RTP_NAME("22012826095, 22013059131"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
-				   MAXREQS_PER_BANK,
-				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
-	},
 	{ XE_RTP_NAME("22012826095, 22013059131"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -389,28 +320,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 				   MAXREQS_PER_BANK,
 				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
 	},
-	{ XE_RTP_NAME("22013059131"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
-	},
 	{ XE_RTP_NAME("22013059131"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
 	},
-	{ XE_RTP_NAME("14010918519"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
-			     FORCE_SLM_FENCE_SCOPE_TO_TILE |
-			     FORCE_UGM_FENCE_SCOPE_TO_TILE,
-			     /*
-			      * Ignore read back as it always returns 0 in these
-			      * steps
-			      */
-			     .read_mask = 0))
-	},
 	{ XE_RTP_NAME("14015227452"),
 	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -432,16 +346,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
 	},
-	{ XE_RTP_NAME("22012654132"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
-		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
-			     /*
-			      * Register can't be read back for verification on
-			      * DG2 due to Wa_14012342262
-			      */
-			     .read_mask = 0))
-	},
 	{ XE_RTP_NAME("22012654132"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
@@ -460,30 +364,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION))
 	},
-	{ XE_RTP_NAME("14013392000"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE))
-	},
-	{ XE_RTP_NAME("14012419201"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
-			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
-	},
-	{ XE_RTP_NAME("14012419201"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
-			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
-	},
-	{ XE_RTP_NAME("1308578152"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
-		       ENGINE_CLASS(RENDER),
-		       FUNC(xe_rtp_match_first_gslice_fused_off)),
-	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
-			     REPLAY_MODE_GRANULARITY))
-	},
 	{ XE_RTP_NAME("22010960976, 14013347512"),
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
@@ -494,34 +374,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN,
 			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE))
 	},
-	{ XE_RTP_NAME("22010430635"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
-			     DISABLE_GRF_CLEAR))
-	},
-	{ XE_RTP_NAME("14013202645"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
-	},
-	{ XE_RTP_NAME("14013202645"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
-	},
-	{ XE_RTP_NAME("22012532006"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
-			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
-	},
-	{ XE_RTP_NAME("22012532006"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
-		       ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
-			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
-	},
 	{ XE_RTP_NAME("14015150844"),
 	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPED_WRITES,
@@ -650,21 +502,6 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 
 	/* DG2 */
 
-	{ XE_RTP_NAME("16011186671"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH),
-			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE))
-	},
-	{ XE_RTP_NAME("14010469329"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
-			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE))
-	},
-	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
-			     DISABLE_CPS_AWARE_COLOR_PIPE))
-	},
 	{ XE_RTP_NAME("16013271637"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1,
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 727bdc429212..e73b84e01ea1 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -1,13 +1,8 @@
 22012773006	GRAPHICS_VERSION_RANGE(1200, 1250)
-16011759253	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)
 14014475959	GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)
 		PLATFORM(DG2)
 22011391025	PLATFORM(DG2)
-14012197797	PLATFORM(DG2), GRAPHICS_STEP(A0, B0)
-16011777198	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
-		SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)
-22012727170	SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0)
-		SUBPLATFORM(DG2, G11)
+22012727170	SUBPLATFORM(DG2, G11)
 22012727685	SUBPLATFORM(DG2, G11)
 16015675438	PLATFORM(PVC)
 		SUBPLATFORM(DG2, G10)
-- 
2.43.0

