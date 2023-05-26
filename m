Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B59C7EE2E
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 16:44:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C129710E818;
	Fri, 26 May 2023 16:44:40 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF1410E817
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685119454; x=1716655454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPVf/BySO7MJ2qXKLjP+hkBR2XGrtISD8mQnSLFGR44=;
 b=TZXg0wKwP+tJV5sfZVL8LeCJj31fazL3Z1cvKvTWA8Mm/JzsdBYpe/Uk
 UziAklebivUXw/TRokOZ3cfq+GAtqWF+U1ihosZPKWXdCOfvYzq6CIOwf
 7uNip/RiAXqH3F0unFmvrx/fUfgHXOrWi0RcRoaW6DY8KRFTSLQ1JcNnZ
 CE1WRoF/1knuDEZMhhZw4T+ptrCh+IOI3K71sPdjfk/lZT6VNeMopOJ6A
 qjmxSy0vFOJuZTOh1SEE79q3MSWVVi4xxVQwPn8TijwKkX3ffVnuwaZDI
 oUexxXF5kvAMjlSDv2wpVXeyaIiCpQaPi7U6j8vcxn+gHbgpUzVqYWXku w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="356628382"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="356628382"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="795151469"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="795151469"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 09:44:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 09:43:45 -0700
Message-Id: <20230526164358.86393-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230526164358.86393-1-lucas.demarchi@intel.com>
References: <20230526164358.86393-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 08/21] drm/xe/rtp: Rename STEP to GRAPHICS_STEP
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

Rename the RTP match in order to prepare the code base to check for the
media version. Up until MTL, the graphics vs media distinction wrt to
stepping was not ver relevant as they were the same GT. However, with
MTL this is no longer true.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_rtp.c       |  2 +-
 drivers/gpu/drm/xe/xe_rtp.h       | 16 ++++----
 drivers/gpu/drm/xe/xe_rtp_types.h |  2 +-
 drivers/gpu/drm/xe/xe_wa.c        | 64 ++++++++++++++++++-------------
 4 files changed, 47 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
index 29cf92f9b7b3..2ac7b47942fe 100644
--- a/drivers/gpu/drm/xe/xe_rtp.c
+++ b/drivers/gpu/drm/xe/xe_rtp.c
@@ -57,7 +57,7 @@ static bool rule_matches(const struct xe_device *xe,
 			match = xe->info.media_verx100 >= r->ver_start &&
 				xe->info.media_verx100 <= r->ver_end;
 			break;
-		case XE_RTP_MATCH_STEP:
+		case XE_RTP_MATCH_GRAPHICS_STEP:
 			/* TODO: match media/display */
 			match = xe->info.step.graphics >= r->step_start &&
 				xe->info.step.graphics < r->step_end;
diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
index e69f514ee6c4..7ba9d2ecab92 100644
--- a/drivers/gpu/drm/xe/xe_rtp.h
+++ b/drivers/gpu/drm/xe/xe_rtp.h
@@ -35,8 +35,8 @@ struct xe_reg_sr;
 	{ .match_type = XE_RTP_MATCH_SUBPLATFORM,				\
 	  .platform = plat__, .subplatform = sub__ }
 
-#define _XE_RTP_RULE_STEP(start__, end__)					\
-	{ .match_type = XE_RTP_MATCH_STEP,					\
+#define _XE_RTP_RULE_GRAPHICS_STEP(start__, end__)				\
+	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
 	  .step_start = start__, .step_end = end__ }
 
 #define _XE_RTP_RULE_ENGINE_CLASS(cls__)					\
@@ -63,17 +63,17 @@ struct xe_reg_sr;
 	_XE_RTP_RULE_SUBPLATFORM(XE_##plat_, XE_SUBPLATFORM_##plat_##_##sub_)
 
 /**
- * XE_RTP_RULE_STEP - Create rule matching platform stepping
+ * XE_RTP_RULE_GRAPHICS_STEP - Create rule matching graphics stepping
  * @start_: First stepping matching the rule
  * @end_: First stepping that does not match the rule
  *
- * Note that the range matching this rule [ @start_, @end_ ), i.e. inclusive on
- * the left, exclusive on the right.
+ * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
+ * on the left, exclusive on the right.
  *
  * Refer to XE_RTP_RULES() for expected usage.
  */
-#define XE_RTP_RULE_STEP(start_, end_)						\
-	_XE_RTP_RULE_STEP(STEP_##start_, STEP_##end_)
+#define XE_RTP_RULE_GRAPHICS_STEP(start_, end_)					\
+	_XE_RTP_RULE_GRAPHICS_STEP(STEP_##start_, STEP_##end_)
 
 /**
  * XE_RTP_RULE_ENGINE_CLASS - Create rule matching an engine class
@@ -317,7 +317,7 @@ struct xe_reg_sr;
  *	const struct xe_rtp_entry_sr wa_entries[] = {
  *		...
  *		{ XE_RTP_NAME("test-entry"),
- *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+ *		  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
  *		  ...
  *		},
  *		...
diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
index 03d97b666c64..52adbf7de752 100644
--- a/drivers/gpu/drm/xe/xe_rtp_types.h
+++ b/drivers/gpu/drm/xe/xe_rtp_types.h
@@ -39,11 +39,11 @@ enum {
 	XE_RTP_MATCH_SUBPLATFORM,
 	XE_RTP_MATCH_GRAPHICS_VERSION,
 	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
+	XE_RTP_MATCH_GRAPHICS_STEP,
 	XE_RTP_MATCH_MEDIA_VERSION,
 	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
 	XE_RTP_MATCH_INTEGRATED,
 	XE_RTP_MATCH_DISCRETE,
-	XE_RTP_MATCH_STEP,
 	XE_RTP_MATCH_ENGINE_CLASS,
 	XE_RTP_MATCH_NOT_ENGINE_CLASS,
 	XE_RTP_MATCH_FUNC,
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 910579453316..d703dc0f7b21 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -122,7 +122,7 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 
 	{ XE_RTP_NAME("16010515920"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
-		       STEP(A0, B0),
+		       GRAPHICS_STEP(A0, B0),
 		       ENGINE_CLASS(VIDEO_DECODE)),
 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F18(0), ALNUNIT_CLKGATE_DIS)),
 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
@@ -136,27 +136,27 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14012362059"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
 	},
 	{ XE_RTP_NAME("14012362059"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
 	},
 	{ XE_RTP_NAME("14010948348"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14011037102"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(UNSLCGCTL9444, LTCDD_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14011371254"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14011431319"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(UNSLCGCTL9440,
 			     GAMTLBOACS_CLKGATE_DIS |
 			     GAMTLBVDBOX7_CLKGATE_DIS | GAMTLBVDBOX6_CLKGATE_DIS |
@@ -176,15 +176,15 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 			     GAMTLBVEBOX1_CLKGATE_DIS | GAMTLBVEBOX0_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14010569222"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(UNSLICE_UNIT_LEVEL_CLKGATE, GAMEDIA_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14011028019"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(SSMCGCTL9530, RTFUNIT_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14010680813"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_GAMSTLB_CTRL,
 			     CONTROL_BLOCK_CLKGATE_DIS |
 			     EGRESS_BLOCK_CLKGATE_DIS |
@@ -316,7 +316,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     POLYGON_TRIFAN_LINELOOP_DISABLE))
 	},
 	{ XE_RTP_NAME("22012826095, 22013059131"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
 				   MAXREQS_PER_BANK,
@@ -330,7 +330,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
 	},
 	{ XE_RTP_NAME("22013059131"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
 	},
@@ -368,7 +368,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
 	},
 	{ XE_RTP_NAME("22012654132"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
 			     /*
@@ -396,21 +396,25 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, DISABLE_READ_SUPPRESSION))
 	},
 	{ XE_RTP_NAME("14013392000"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, ENABLE_LARGE_GRF_MODE))
 	},
 	{ XE_RTP_NAME("14012419201"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
 			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
 	},
 	{ XE_RTP_NAME("14012419201"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
 			     DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX))
 	},
 	{ XE_RTP_NAME("1308578152"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
+		       ENGINE_CLASS(RENDER),
 		       FUNC(xe_rtp_match_first_gslice_fused_off)),
 	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
 			     REPLAY_MODE_GRANULARITY))
@@ -426,30 +430,35 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE))
 	},
 	{ XE_RTP_NAME("22010430635"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4,
 			     DISABLE_GRF_CLEAR))
 	},
 	{ XE_RTP_NAME("14013202645"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
 	},
 	{ XE_RTP_NAME("14013202645"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
 	},
 	{ XE_RTP_NAME("22012532006"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, C0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
 			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
 	},
 	{ XE_RTP_NAME("22012532006"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
 			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
 	},
 	{ XE_RTP_NAME("22014600077"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(B0, FOREVER),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(B0, FOREVER),
 		       ENGINE_CLASS(RENDER)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
 			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
@@ -485,7 +494,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE))
 	},
 	{ XE_RTP_NAME("14014999345"),
-	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE), STEP(B0, C0)),
+	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
+		       GRAPHICS_STEP(B0, C0)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
 	},
 	{}
@@ -528,17 +538,17 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	/* DG2 */
 
 	{ XE_RTP_NAME("16011186671"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(CLR(VFLSKPD, DIS_MULT_MISS_RD_SQUASH),
 			 SET(VFLSKPD, DIS_OVER_FETCH_CACHE))
 	},
 	{ XE_RTP_NAME("14010469329"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
 			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE))
 	},
 	{ XE_RTP_NAME("14010698770, 22010613112, 22010465075"),
-	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(XEHP_COMMON_SLICE_CHICKEN3,
 			     DISABLE_CPS_AWARE_COLOR_PIPE))
 	},
-- 
2.40.1

