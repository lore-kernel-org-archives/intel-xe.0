Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B68C25B6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Oct 2023 22:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE3A10E4EB;
	Tue, 24 Oct 2023 22:07:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6A210E4EA
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Oct 2023 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698185243; x=1729721243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=i9TFvtlgegPJs9LlLY0jCV2l2sSDwOhuTE+EJDudpYM=;
 b=eE98Xrve+B+bK9ti4vDeiRIjkWR94QJXxa9A0Cfu4HqZQel31/96QE2J
 xc3NlZ1H0h9RDjT48WUirlPBHr6BeXiXRFoJr+JZ1eJVpJxCWW1oZGKGr
 vYYVByCIEkQiM2p+imnKpFOM1wY4vVf6hPCm8gT1m+bzYemfc9DO50E+X
 dQCfN2/U2av7pRmPWfmroCD5OiMxpZVsTGp1LRpFNlenk1kmO839WJ9zt
 hwB0gbKXCwaBUb3txi+5gv+dUpijhoC/pIX57Vl45HGW6c2ux2lFZ/acL
 lfYzQJ/P4Gxqg38SBOvAETyCP0OtwulVdZ8MwSHGlLtJssfjDmN1giYJA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="451410433"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="451410433"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 15:07:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="752127755"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="752127755"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 15:07:22 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 24 Oct 2023 15:07:37 -0700
Message-Id: <20231024220739.224251-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 1/3] drm/xe/xe2: Add initial workarounds
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

From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Add the initial collection of gt/engine/lrc workarounds.

v2:
  - FF_MODE is an MCR register (Matt Roper)
  - Group 18032247524 with other Xe2 workarounds (Matt Roper)
  - Move WA changing PSS_CHICKEN to lrc_was[] as for Xe2 that register
    is part of the render context image (Matt Roper)
  - Apply WA 16020518922 only on render engine (Matt Roper)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 24 ++++++++++
 drivers/gpu/drm/xe/xe_wa.c           | 71 ++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index cd1821d96a5d..5ad75011aa70 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -94,7 +94,14 @@
 #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
 #define   TBIMR_FAST_CLIP			REG_BIT(5)
 
+#define FF_MODE					XE_REG_MCR(0x6210)
+#define   DIS_TE_AUTOSTRIP			REG_BIT(31)
+#define   DIS_MESH_PARTIAL_AUTOSTRIP		REG_BIT(16)
+#define   DIS_MESH_AUTOSTRIP			REG_BIT(15)
+
 #define VFLSKPD					XE_REG_MCR(0x62a8, XE_REG_OPTION_MASKED)
+#define   DIS_PARTIAL_AUTOSTRIP			REG_BIT(9)
+#define   DIS_AUTOSTRIP				REG_BIT(6)
 #define   DIS_OVER_FETCH_CACHE			REG_BIT(1)
 #define   DIS_MULT_MISS_RD_SQUASH		REG_BIT(0)
 
@@ -111,6 +118,9 @@
 #define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
 #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
 
+#define XEHP_PSS_CHICKEN			XE_REG_MCR(0x7044, XE_REG_OPTION_MASKED)
+#define   FD_END_COLLECT			REG_BIT(5)
+
 #define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
 #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
 #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
@@ -133,6 +143,9 @@
 #define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
+#define VF_SCRATCHPAD				XE_REG(0x83a8, XE_REG_OPTION_MASKED)
+#define   XE2_VFG_TED_CREDIT_INTERFACE_DISABLE	REG_BIT(13)
+
 #define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4, XE_REG_OPTION_MASKED)
 #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
 
@@ -225,6 +238,7 @@
 #define   MSCUNIT_CLKGATE_DIS			REG_BIT(10)
 #define   RCCUNIT_CLKGATE_DIS			REG_BIT(7)
 #define   SARBUNIT_CLKGATE_DIS			REG_BIT(5)
+#define   SBEUNIT_CLKGATE_DIS			REG_BIT(4)
 
 #define UNSLICE_UNIT_LEVEL_CLKGATE2		XE_REG(0x94e4)
 #define   VSUNIT_CLKGATE2_DIS			REG_BIT(19)
@@ -276,6 +290,8 @@
 #define XEHP_L3SCQREG7				XE_REG_MCR(0xb188)
 #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
 
+#define XEHPC_L3CLOS_MASK(i)			XE_REG_MCR(0xb194 + (i) * 8)
+
 #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
 #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
 #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
@@ -299,6 +315,9 @@
 #define XE_OAG_BLT_BUSY_FREE			XE_REG(0xdbbc)
 #define XE_OAG_RENDER_BUSY_FREE			XE_REG(0xdbdc)
 
+#define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
+#define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
+
 #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
@@ -328,6 +347,7 @@
 #define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
+#define   EARLY_EOT_DIS				REG_BIT(1)
 
 #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
 #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
@@ -345,11 +365,15 @@
 
 #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
 #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
+#define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
 #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
+#define   SEQUENTIAL_ACCESS_UPGRADE_DISABLE	REG_BIT(13)
 
 #define LSC_CHICKEN_BIT_0_UDW			XE_REG_MCR(0xe7c8 + 4)
 #define   UGM_FRAGMENT_THRESHOLD_TO_3		REG_BIT(58 - 32)
 #define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
+#define   XE2_ALLOC_DPA_STARVE_FIX_DIS		REG_BIT(47 - 32)
+#define   ENABLE_SMP_LD_RENDER_SURFACE_CONTROL	REG_BIT(44 - 32)
 #define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
 #define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
 #define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 1450af6cab34..31801f0e7aa9 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -245,6 +245,19 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 	  XE_RTP_ACTIONS(SET(SQCNT1, ENFORCE_RAR))
 	},
 
+	/* Xe2_LPG */
+	{ XE_RTP_NAME("16020975621"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, SBEUNIT_CLKGATE_DIS))
+	},
+	{ XE_RTP_NAME("14018157293"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHPC_L3CLOS_MASK(0), ~0),
+			 SET(XEHPC_L3CLOS_MASK(1), ~0),
+			 SET(XEHPC_L3CLOS_MASK(2), ~0),
+			 SET(XEHPC_L3CLOS_MASK(3), ~0))
+	},
+
 	{}
 };
 
@@ -539,6 +552,41 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 			     XE_RTP_NOCHECK))
 	},
 
+	/* Xe2_LPG */
+
+	{ XE_RTP_NAME("18032247524"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
+	},
+	{ XE_RTP_NAME("16018712365"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
+	},
+	{ XE_RTP_NAME("14018957109"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN5, DISABLE_SAMPLE_G_PERFORMANCE))
+	},
+	{ XE_RTP_NAME("16021540221"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
+	},
+	{ XE_RTP_NAME("14019322943"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+		       FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, TGM_WRITE_EOM_FORCE))
+	},
+	{ XE_RTP_NAME("14018471104"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
+	},
+	{ XE_RTP_NAME("16018737384"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
+	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
+	},
+
 	{}
 };
 
@@ -625,11 +673,34 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 
 	/* Xe_LPG */
+
 	{ XE_RTP_NAME("18019271663"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271)),
 	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
 	},
 
+	/* Xe2_LPG */
+
+	{ XE_RTP_NAME("16020518922"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), GRAPHICS_STEP(A0, B0),
+		       ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(FF_MODE,
+			     DIS_TE_AUTOSTRIP |
+			     DIS_MESH_PARTIAL_AUTOSTRIP |
+			     DIS_MESH_AUTOSTRIP),
+			 SET(VFLSKPD,
+			     DIS_PARTIAL_AUTOSTRIP |
+			     DIS_AUTOSTRIP))
+	},
+	{ XE_RTP_NAME("14019386621"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
+	},
+	{ XE_RTP_NAME("14019877138"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
+	},
+
 	{}
 };
 
-- 
2.40.1

