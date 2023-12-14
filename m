Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C4CC46CA2
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 18:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7E710E204;
	Thu, 14 Dec 2023 18:47:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4741510E204
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 18:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702579648; x=1734115648;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gHMNSmpdsSwHtJn1XNoCwM4liUzdO1WghALW/Mm9uP0=;
 b=fyC4/Ub92mFj52jCx1Pd4d5XCgnaKjnVx+pZZ6+OiSNY3/tSXiIVbRuj
 C8mzPCqzQRisqAXBZOXTXMX/8mpwMdawVgwmkvVZ/aq9vBoqNlgS7Zqgr
 VRObHifLaIBZa8FdP/EYxWVZFgJcWeMfkMVAqRhQrt7TPY/UU9Bu8dsBU
 tYfPzYRL4y95aHSrnfLTO5cUjni9yRu0Qcze8v9rqIN96Mp0Vd43L3HnM
 f9c+E+34Tj41NCaPAJLppQkSdgR21OI9mmY0vwpes77MHvumTNWRifSS8
 S7slOZq7WTLCwYyPqHq4KqDNKN1RV2DWv+ngS0LAjsGFNPjWWt/vVx/F2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397953930"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397953930"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892581835"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="892581835"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.131])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 10:47:11 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/8] drm/xe: Move some per-engine register definitions to the
 engine header
Date: Thu, 14 Dec 2023 10:47:02 -0800
Message-ID: <20231214184659.2249559-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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

Although we only work with the RCS instances today, the
FF_SLICE_CS_CHICKEN1[1,2] CS_DEBUG_MODE1, CS_CHICKEN1, and
FF_THREAD_MODE registers all have instances on both the RCS and CCS
engines.  Convert these to parameterized macros and move them to the
engine register header.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h | 21 +++++++++++++++++++++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 18 ------------------
 drivers/gpu/drm/xe/regs/xe_regs.h        |  3 ---
 drivers/gpu/drm/xe/xe_wa.c               | 16 +++++++++-------
 4 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 67da19f9836f..e109ef912706 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -39,6 +39,9 @@
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
 
+#define FF_THREAD_MODE(base)			XE_REG((base) + 0xa0)
+#define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
+
 #define RING_IMR(base)				XE_REG((base) + 0xa8)
 
 #define RING_EIR(base)				XE_REG((base) + 0xb0)
@@ -60,6 +63,16 @@
 #define   GHWSP_CSB_REPORT_DIS			REG_BIT(15)
 #define   PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS	REG_BIT(14)
 
+#define FF_SLICE_CS_CHICKEN1(base)		XE_REG((base) + 0xe0, XE_REG_OPTION_MASKED)
+#define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
+
+#define FF_SLICE_CS_CHICKEN2(base)		XE_REG((base) + 0xe4, XE_REG_OPTION_MASKED)
+#define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
+
+#define CS_DEBUG_MODE1(base)			XE_REG((base) + 0xec, XE_REG_OPTION_MASKED)
+#define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
+#define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
@@ -115,6 +128,14 @@
 #define RING_EXECLIST_CONTROL(base)		XE_REG((base) + 0x550)
 #define	  EL_CTRL_LOAD				REG_BIT(0)
 
+#define CS_CHICKEN1(base)			XE_REG((base) + 0x580, XE_REG_OPTION_MASKED)
+#define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
+#define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
+#define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
+#define   PREEMPT_GPGPU_COMMAND_LEVEL		PREEMPT_GPGPU_LEVEL(1, 0)
+#define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
+#define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
+
 #define VDBOX_CGCTL3F08(base)                  XE_REG((base) + 0x3f08)
 #define   CG3DDISHRS_CLKGATE_DIS               REG_BIT(5)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index f5bf4c6d1761..4448507ef4ca 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -60,26 +60,8 @@
 #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
-#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
-#define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
-
-#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4, XE_REG_OPTION_MASKED)
-#define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
-
-#define CS_DEBUG_MODE1				XE_REG(0x20ec, XE_REG_OPTION_MASKED)
-#define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
-#define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
-
 #define PS_INVOCATION_COUNT			XE_REG(0x2348)
 
-#define CS_CHICKEN1				XE_REG(0x2580, XE_REG_OPTION_MASKED)
-#define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
-#define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
-#define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
-#define   PREEMPT_GPGPU_COMMAND_LEVEL		PREEMPT_GPGPU_LEVEL(1, 0)
-#define   PREEMPT_GPGPU_LEVEL_MASK		PREEMPT_GPGPU_LEVEL(1, 1)
-#define   PREEMPT_3D_OBJECT_LEVEL		REG_BIT(0)
-
 #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
 #define XEHP_GLOBAL_MOCS(i)			XE_REG_MCR(0x4000 + (i) * 4)
 #define CCS_AUX_INV				XE_REG(0x4208)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index ec9372aa739f..4ac71b605487 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -45,9 +45,6 @@
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
-#define FF_THREAD_MODE				XE_REG(0x20a0)
-#define   FF_TESSELATION_DOP_GATE_DISABLE	BIT(19)
-
 #define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 12829748bb6c..5f61dd87c586 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -299,7 +299,7 @@ static const struct xe_rtp_entry_sr gt_was[] = {
 static const struct xe_rtp_entry_sr engine_was[] = {
 	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
 	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE,
+	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE(RENDER_RING_BASE),
 			     FF_TESSELATION_DOP_GATE_DISABLE))
 	},
 	{ XE_RTP_NAME("1409804808"),
@@ -320,7 +320,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	},
 	{ XE_RTP_NAME("14010826681, 1606700617, 22010271021, 18019627453"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1255), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE1, FF_DOP_CLOCK_GATE_DISABLE))
+	  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE1(RENDER_RING_BASE),
+			     FF_DOP_CLOCK_GATE_DISABLE))
 	},
 	{ XE_RTP_NAME("1406941453"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
@@ -328,7 +329,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	},
 	{ XE_RTP_NAME("FtrPerCtxtPreemptionGranularityControl"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1250), ENGINE_CLASS(RENDER)),
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1,
+	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
 			     FFSC_PERCTX_PREEMPT_CTRL))
 	},
 
@@ -419,7 +420,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	{ XE_RTP_NAME("16015675438"),
 	  XE_RTP_RULES(PLATFORM(DG2),
 		       FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2,
+	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
 			     PERF_FIX_BALANCING_CFE_DISABLE))
 	},
 	{ XE_RTP_NAME("18028616096"),
@@ -481,7 +482,7 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	  XE_RTP_RULES(SUBPLATFORM(DG2, G10), GRAPHICS_STEP(B0, C0),
 		       ENGINE_CLASS(RENDER),
 		       FUNC(xe_rtp_match_first_gslice_fused_off)),
-	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1,
+	  XE_RTP_ACTIONS(CLR(CS_DEBUG_MODE1(RENDER_RING_BASE),
 			     REPLAY_MODE_GRANULARITY))
 	},
 	{ XE_RTP_NAME("22010960976, 14013347512"),
@@ -540,7 +541,8 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 	},
 	{ XE_RTP_NAME("16015675438"),
 	  XE_RTP_RULES(PLATFORM(PVC), FUNC(xe_rtp_match_first_render_or_compute)),
-	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2, PERF_FIX_BALANCING_CFE_DISABLE))
+	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN2(RENDER_RING_BASE),
+			     PERF_FIX_BALANCING_CFE_DISABLE))
 	},
 	{ XE_RTP_NAME("14014999345"),
 	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
@@ -622,7 +624,7 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 	},
 	{ XE_RTP_NAME("WaDisableGPGPUMidThreadPreemption"),
 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210)),
-	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1,
+	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(RENDER_RING_BASE),
 				   PREEMPT_GPGPU_LEVEL_MASK,
 				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL))
 	},
-- 
2.43.0

