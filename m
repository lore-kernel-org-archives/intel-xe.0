Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C275CC678D4
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 09:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CA910E3BD;
	Tue,  7 Mar 2023 09:25:40 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3775D10E3BD
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 09:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678181131; x=1709717131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s1PuQ4wkRmRqx6IQyzCcelmhJ46CpApcmj+vfrKzZ1o=;
 b=MwRpASYcn4Y4wcrbAzj5FhQ+nI59nrWjBmozoqIIe4ZS33Cc2R2rKKqw
 BU3xM2s7k6YHDz7rS0ElGA3SFQsXnAdR7fdZIwh+wzH8jbNuTd4N84Zji
 B4WUoD1RI+SWxz0skUqhdklsaqVs7Avr3VpM9vyn3m/xooUmbk51m50+C
 vngqAJbSca2QIEcXgxBUH1Y6C3mJxQ+4/LUpGn1hH7dUk3UrZDw7NJNXF
 doqszQkYMyNGC+rz2ZSJvllvySLviFfEE7PUt2RbLzjUBanaXl86J1poy
 jR5lWwggCW1bGcSDUubBBNhI/1JWfGvXe5m8JhhpAlb1P544otuliQUYg g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="422079130"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="422079130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005798844"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="1005798844"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 01:25:15 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  7 Mar 2023 01:24:44 -0800
Message-Id: <20230307092446.1263266-18-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230307092446.1263266-1-lucas.demarchi@intel.com>
References: <20230307092446.1263266-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 17/19] drm/xe: Add missing DG2 engine workarounds
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Synchronize with i915 the DG2 gt workarounds as of
commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
order").

A few simplifications were done when the WA should be applied to
some steps of a subplatform and all the steppings of the other
subplatforms. This happened with Wa_1509727124, Wa_22012856258 and a few
others. In figure the pre-production steppings will be removed, so this
can be already simplified a little bit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h |  23 ++++
 drivers/gpu/drm/xe/xe_wa.c           | 185 ++++++++++++++++++++++++++-
 2 files changed, 205 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 90c270f2405a..b1ef6ce72269 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -48,6 +48,7 @@
 
 #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
+#define   GEN12_REPLAY_MODE_GRANULARITY		REG_BIT(0)
 
 #define PS_INVOCATION_COUNT			_MMIO(0x2348)
 
@@ -91,6 +92,9 @@
 #define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC	REG_BIT(11)
 #define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE	REG_BIT(9)
 
+#define VFG_PREEMPTION_CHICKEN			_MMIO(0x83b4)
+#define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
+
 #define XEHP_SQCM				MCR_REG(0x8724)
 #define   EN_32B_ACCESS				REG_BIT(30)
 
@@ -248,8 +252,13 @@
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   GEN11_SAMPLER_ENABLE_HEADLESS_MSG	REG_BIT(5)
 
+#define GEN9_HALF_SLICE_CHICKEN7		MCR_REG(0xe194)
+#define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
+
 #define CACHE_MODE_SS				MCR_REG(0xe420)
+#define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
 #define   DISABLE_ECC				REG_BIT(5)
+#define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
 
 #define GEN9_ROW_CHICKEN4			MCR_REG(0xe48c)
 #define   GEN12_DISABLE_GRF_CLEAR		REG_BIT(13)
@@ -267,8 +276,22 @@
 #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
 #define   GEN12_DISABLE_DOP_GATING              REG_BIT(0)
 
+#define XEHP_HDC_CHICKEN0			MCR_REG(0xe5f0)
+#define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
+
+#define RT_CTRL					MCR_REG(0xe530)
+#define   DIS_NULL_QUERY			REG_BIT(10)
+
 #define LSC_CHICKEN_BIT_0			MCR_REG(0xe7c8)
 #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
+#define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
+
+#define LSC_CHICKEN_BIT_0_UDW			MCR_REG(0xe7c8 + 4)
+#define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
+#define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
+#define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
+#define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
+#define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
 
 #define SARB_CHICKEN1				MCR_REG(0xe90c)
 #define   COMP_CKN_IN				REG_GENMASK(30, 29)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 65f51f1473fb..50e16f18ece7 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -91,6 +91,9 @@
 #define _MMIO(x)	_XE_RTP_REG(x)
 #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
 
+__diag_push();
+__diag_ignore_all("-Woverride-init", "Allow field overrides in table");
+
 static const struct xe_rtp_entry gt_was[] = {
 	{ XE_RTP_NAME("14011060649"),
 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
@@ -274,6 +277,11 @@ static const struct xe_rtp_entry engine_was[] = {
 			     GEN9_FFSC_PERCTX_PREEMPT_CTRL,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
+	{ XE_RTP_NAME("18019627453"),
+	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1255), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
 
 	/* TGL */
 
@@ -297,16 +305,185 @@ static const struct xe_rtp_entry engine_was[] = {
 
 	/* DG2 */
 
+	{ XE_RTP_NAME("22013037850"),
+	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW,
+			     DISABLE_128B_EVICTION_COMMAND_UDW))
+	},
+	{ XE_RTP_NAME("22014226127"),
+	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE))
+	},
+	{ XE_RTP_NAME("18017747507"),
+	  XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(VFG_PREEMPTION_CHICKEN,
+			     POLYGON_TRIFAN_LINELOOP_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("22012826095, 22013059131"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
+				   MAXREQS_PER_BANK,
+				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
+	},
+	{ XE_RTP_NAME("22012826095, 22013059131"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(FIELD_SET(LSC_CHICKEN_BIT_0_UDW,
+				   MAXREQS_PER_BANK,
+				   REG_FIELD_PREP(MAXREQS_PER_BANK, 2)))
+	},
+	{ XE_RTP_NAME("22013059131"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
+	},
+	{ XE_RTP_NAME("22013059131"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, FORCE_1_SUB_MESSAGE_PER_FRAGMENT))
+	},
+	{ XE_RTP_NAME("14010918519"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0,
+			     FORCE_SLM_FENCE_SCOPE_TO_TILE |
+			     FORCE_UGM_FENCE_SCOPE_TO_TILE,
+			     /*
+			      * Ignore read back as it always returns 0 in these
+			      * steps
+			      */
+			     .read_mask = 0))
+	},
 	{ XE_RTP_NAME("14015227452"),
-	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
+	  XE_RTP_RULES(PLATFORM(DG2),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4, XEHP_DIS_BBL_SYSPIPE,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
-	{ XE_RTP_NAME("18019627453"),
+	{ XE_RTP_NAME("16015675438"),
+	  XE_RTP_RULES(PLATFORM(DG2),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
+			     PERF_FIX_BALANCING_CFE_DISABLE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("16011620976, 22015475538"),
+	  XE_RTP_RULES(PLATFORM(DG2),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8))
+	},
+	{ XE_RTP_NAME("22012654132"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
+			     XE_RTP_ACTION_FLAG(MASKED_REG),
+			     /*
+			      * Register can't be read back for verification on
+			      * DG2 due to Wa_14012342262
+			      */
+			     .read_mask = 0))
+	},
+	{ XE_RTP_NAME("22012654132"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, ENABLE_PREFETCH_INTO_IC,
+			     XE_RTP_ACTION_FLAG(MASKED_REG),
+			     /*
+			      * Register can't be read back for verification on
+			      * DG2 due to Wa_14012342262
+			      */
+			     .read_mask = 0))
+	},
+	{ XE_RTP_NAME("1509727124"),
 	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(GEN9_CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE,
+	  XE_RTP_ACTIONS(SET(GEN10_SAMPLER_MODE, SC_DISABLE_POWER_OPTIMIZATION_EBB,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("22012856258"),
+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_DISABLE_READ_SUPPRESSION,
 			     XE_RTP_ACTION_FLAG(MASKED_REG)))
 	},
+	{ XE_RTP_NAME("14013392000"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN8_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14012419201"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
+			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14012419201"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
+			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("1308578152"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(CLR(GEN9_CS_DEBUG_MODE1,
+			     GEN12_REPLAY_MODE_GRANULARITY,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("22010960976, 14013347512"),
+	  XE_RTP_RULES(PLATFORM(DG2), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(CLR(XEHP_HDC_CHICKEN0,
+			     LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("22010430635"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_ROW_CHICKEN4,
+			     GEN12_DISABLE_GRF_CLEAR,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("14013202645"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(B0, C0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
+	},
+	{ XE_RTP_NAME("14013202645"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
+	},
+	{ XE_RTP_NAME("22012532006"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, C0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
+			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("22012532006"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(GEN9_HALF_SLICE_CHICKEN7,
+			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA,
+			     XE_RTP_ACTION_FLAG(MASKED_REG)))
+	},
+	{ XE_RTP_NAME("22014600077"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(B0, FOREVER),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
+			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
+			     XE_RTP_ACTION_FLAG(MASKED_REG),
+			     /* 
+			      * Wa_14012342262 write-only reg, so skip
+			      * verification
+			      */
+			     .read_mask = 0))
+	},
+	{ XE_RTP_NAME("22014600077"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
+			     ENABLE_EU_COUNT_FOR_TDL_FLUSH,
+			     XE_RTP_ACTION_FLAG(MASKED_REG),
+			     /* 
+			      * Wa_14012342262 write-only reg, so skip
+			      * verification
+			      */
+			     .read_mask = 0))
+	},
 
 	/* PVC */
 
@@ -369,6 +546,8 @@ static const struct xe_rtp_entry lrc_was[] = {
 	{}
 };
 
+__diag_pop();
+
 /**
  * xe_wa_process_gt - process GT workaround table
  * @gt: GT instance to process workarounds for
-- 
2.39.0

