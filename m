Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04709C6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 00:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95010E6A9;
	Tue, 14 Mar 2023 00:30:54 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9700110E6A7
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 00:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678753846; x=1710289846;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ovQ8iO8y3HBxxPjSKoBK9IY77xA0zDdWzt1viYUKkMM=;
 b=cpnyeSx8N3/sgDQCGNoi0519jjOJK7Git5tQRaeI3wpUx8K5/ZNPmTYZ
 08ZupchMPg8YBPlQy1Ji1YIm8trUxWcMf96DDJGUg/rmviGxhGRy1o9kw
 IiObqkacbPbdP8Ps6MQd9UXJF9eVHLxo6gN2K5Hl3A7Dfz22CLkjWkRhS
 PP1VFwJ1/Odo7gkbmyz1bTMxWNiG412h+nz2t97cmS05zk5EWnBz85WgP
 f5btr3fmZoGOfolyV98Cwxx1PMp2cFcqWrKP2uzb66k6W8dTHEWKEIfLT
 2YqHc2oOUgHhvISl+Sf+SMWEpmzWlVAs8uils/DdPnTAZ+Cbb3X6PnYZb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="402168030"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="402168030"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="789116699"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="789116699"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 17:30:45 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 13 Mar 2023 17:30:06 -0700
Message-Id: <20230314003012.2600353-9-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230314003012.2600353-1-lucas.demarchi@intel.com>
References: <20230314003012.2600353-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 08/14] drm/xe: Add missing DG2 gt workarounds
 and tunings
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

Synchronize with i915 the DG2 gt workarounds as of
commit 4d14d7717f19 ("drm/i915/selftest: Fix ktime_get() and h/w access
order").

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 17 +++++++++++++-
 drivers/gpu/drm/xe/xe_tuning.c       |  4 ++++
 drivers/gpu/drm/xe/xe_wa.c           | 34 +++++++++++++++++++++++++++-
 3 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index ab9dd70c0534..90c270f2405a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -168,7 +168,6 @@
 #define   GAMTLBVEBOX0_CLKGATE_DIS		REG_BIT(16)
 #define   LTCDD_CLKGATE_DIS			REG_BIT(10)
 
-#define GEN11_SLICE_UNIT_LEVEL_CLKGATE		_MMIO(0x94d4)
 #define XEHP_SLICE_UNIT_LEVEL_CLKGATE		MCR_REG(0x94d4)
 #define   SARBUNIT_CLKGATE_DIS			(1 << 5)
 #define   RCCUNIT_CLKGATE_DIS			(1 << 7)
@@ -222,12 +221,28 @@
 #define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
 #define   XEHPC_OVRLSCCC			REG_BIT(0)
 
+#define XEHP_L3NODEARBCFG			MCR_REG(0xb0b4)
+#define   XEHP_LNESPARE				REG_BIT(19)
+
+#define XEHP_L3SCQREG7				MCR_REG(0xb188)
+#define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
+
+#define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
 #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
 #define COMP_MOD_CTRL				MCR_REG(0xcf30)
 #define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
 #define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
 #define   FORCE_MISS_FTLB			REG_BIT(3)
 
+#define XEHP_GAMSTLB_CTRL			MCR_REG(0xcf4c)
+#define   CONTROL_BLOCK_CLKGATE_DIS		REG_BIT(12)
+#define   EGRESS_BLOCK_CLKGATE_DIS		REG_BIT(11)
+#define   TAG_BLOCK_CLKGATE_DIS			REG_BIT(7)
+
+#define XEHP_GAMCNTRL_CTRL			MCR_REG(0xcf54)
+#define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
+#define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
+
 #define GEN10_SAMPLER_MODE			MCR_REG(0xe18c)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 2861a014c85c..47b27dccb385 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -16,6 +16,10 @@
 #define MCR_REG(x)	_XE_RTP_MCR_REG(x)
 
 static const struct xe_rtp_entry gt_tunings[] = {
+	{ XE_RTP_NAME("Tuning: Blend Fill Caching Optimization Disable"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS))
+	},
 	{ XE_RTP_NAME("Tuning: 32B Access Enable"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(SET(XEHP_SQCM, EN_32B_ACCESS))
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 4fe01168f45f..13c8dbf49cba 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -132,6 +132,14 @@ static const struct xe_rtp_entry gt_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10)),
 	  XE_RTP_ACTIONS(SET(GEN11_SUBSLICE_UNIT_LEVEL_CLKGATE, DSS_ROUTER_CLKGATE_DIS))
 	},
+	{ XE_RTP_NAME("14012362059"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
+	},
+	{ XE_RTP_NAME("14012362059"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G11), STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB))
+	},
 	{ XE_RTP_NAME("14010948348"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS))
@@ -142,7 +150,7 @@ static const struct xe_rtp_entry gt_was[] = {
 	},
 	{ XE_RTP_NAME("14011371254"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
-	  XE_RTP_ACTIONS(SET(GEN11_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS))
+	  XE_RTP_ACTIONS(SET(XEHP_SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS))
 	},
 	{ XE_RTP_NAME("14011431319"),
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
@@ -172,6 +180,13 @@ static const struct xe_rtp_entry gt_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
 	  XE_RTP_ACTIONS(SET(SSMCGCTL9530, RTFUNIT_CLKGATE_DIS))
 	},
+	{ XE_RTP_NAME("14010680813"),
+	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), STEP(A0, B0)),
+	  XE_RTP_ACTIONS(SET(XEHP_GAMSTLB_CTRL,
+			     CONTROL_BLOCK_CLKGATE_DIS |
+			     EGRESS_BLOCK_CLKGATE_DIS |
+			     TAG_BLOCK_CLKGATE_DIS))
+	},
 	{ XE_RTP_NAME("14014830051"),
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(CLR(SARB_CHICKEN1, COMP_CKN_IN))
@@ -180,6 +195,23 @@ static const struct xe_rtp_entry gt_was[] = {
 	  XE_RTP_RULES(PLATFORM(DG2)),
 	  XE_RTP_ACTIONS(CLR(GEN7_MISCCPCTL, GEN12_DOP_CLOCK_GATE_RENDER_ENABLE))
 	},
+	{ XE_RTP_NAME("18018781329"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(RENDER_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(COMP_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB),
+			 SET(XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB))
+	},
+	{ XE_RTP_NAME("1509235366"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(XEHP_GAMCNTRL_CTRL,
+			     INVALIDATION_BROADCAST_MODE_DIS |
+			     GLOBAL_INVALIDATION_MODE))
+	},
+	{ XE_RTP_NAME("14010648519"),
+	  XE_RTP_RULES(PLATFORM(DG2)),
+	  XE_RTP_ACTIONS(SET(XEHP_L3NODEARBCFG, XEHP_LNESPARE))
+	},
 
 	/* PVC */
 
-- 
2.39.0

