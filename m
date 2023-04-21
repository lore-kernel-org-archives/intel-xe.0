Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A153C7EE24
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 22:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BA010EF23;
	Fri, 21 Apr 2023 22:33:17 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9427710EA72
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 22:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682116395; x=1713652395;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TfRE7uduGziIqlUkssxlgrDhYOoGJ0DKWx/VfhEiNrg=;
 b=NrxNciUnEZOIVLrR443vA02GxzCewDezn9z1WPwbz+mnwC6BjCjMSq6s
 jPRq4+AUen33jSxw23j/Ig/eHSyK4p89aAP3kXBPvXleyAR5m+KvUeaAV
 0UbrvRg6hNrLaeibTqKeLJyjVE9JtEoPiThc+rPS233pBGyIHI26sfAh0
 nIlo15b6TbRBhSmwXFNam6Ef2NtGeqoMJqG+2vmQyNM/oiJduAXOEt6CB
 DY4bVZQpERFoVno6XTiW1CirMa3M3+uo2nG1VXQmIXWQo5E15/1GzrseG
 ue1IPiXSE042CNMmoOyTEA6f/EC0OfHi1IkSxYShRGN5fQqItKbO/l2GB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325693757"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="325693757"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="722913772"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; d="scan'208";a="722913772"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 15:33:12 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 21 Apr 2023 15:32:56 -0700
Message-Id: <20230421223258.128781-16-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230421223258.128781-1-lucas.demarchi@intel.com>
References: <20230421223258.128781-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 15/17] drm/xe: Annotate masked registers used
 by RTP
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
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Go over all registers used in xe_rtp tables and mark the registers as
masked if they were passed a XE_RTP_ACTION_FLAG(MASKED_REG) flag.
This will allow the flag to be removed in future when xe_rtp starts
using the real xe_reg_t type.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 46 ++++++++++++------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c13aac8f900c..f8851e045c0a 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -21,7 +21,7 @@
 #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
 #define   RING_CTL_SIZE(size)			((size) - PAGE_SIZE) /* in bytes -> pages */
 
-#define RING_PSMI_CTL(base)			XE_REG((base) + 0x50)
+#define RING_PSMI_CTL(base)			XE_REG((base) + 0x50, XE_REG_OPTION_MASKED)
 #define   RC_SEMA_IDLE_MSG_DISABLE		REG_BIT(12)
 #define   WAIT_FOR_EVENT_POWER_DOWN_DISABLE	REG_BIT(7)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 64ab2255a406..c6949cec1dc3 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -45,19 +45,19 @@
 #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
-#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0)
+#define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
-#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4)
+#define FF_SLICE_CS_CHICKEN2			XE_REG(0x20e4, XE_REG_OPTION_MASKED)
 #define   PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
 
-#define CS_DEBUG_MODE1				XE_REG(0x20ec)
+#define CS_DEBUG_MODE1				XE_REG(0x20ec, XE_REG_OPTION_MASKED)
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
 #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
 
 #define PS_INVOCATION_COUNT			XE_REG(0x2348)
 
-#define CS_CHICKEN1				XE_REG(0x2580)
+#define CS_CHICKEN1				XE_REG(0x2580, XE_REG_OPTION_MASKED)
 #define   PREEMPT_GPGPU_LEVEL(hi, lo)		(((hi) << 2) | ((lo) << 1))
 #define   PREEMPT_GPGPU_MID_THREAD_LEVEL	PREEMPT_GPGPU_LEVEL(0, 0)
 #define   PREEMPT_GPGPU_THREAD_GROUP_LEVEL	PREEMPT_GPGPU_LEVEL(0, 1)
@@ -77,10 +77,10 @@
 #define XEHP_TILE0_ADDR_RANGE			XE_REG_MCR(0x4900)
 #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
 
-#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204)
+#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
 #define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
 
-#define CHICKEN_RASTER_2			XE_REG_MCR(0x6208)
+#define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
 #define   TBIMR_FAST_CLIP			REG_BIT(5)
 
 #define VFLSKPD					XE_REG_MCR(0x62a8)
@@ -94,35 +94,35 @@
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
 #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
 
-#define CACHE_MODE_1				XE_REG(0x7004)
+#define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
-#define XEHP_PSS_MODE2				XE_REG_MCR(0x703c)
+#define XEHP_PSS_MODE2				XE_REG_MCR(0x703c, XE_REG_OPTION_MASKED)
 #define   SCOREBOARD_STALL_FLUSH_CONTROL	REG_BIT(5)
 
-#define HIZ_CHICKEN					XE_REG(0x7018)
+#define HIZ_CHICKEN					XE_REG(0x7018, XE_REG_OPTION_MASKED)
 #define   DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE	REG_BIT(14)
 #define   HZ_DEPTH_TEST_LE_GE_OPT_DISABLE		REG_BIT(13)
 
 #define COMMON_SLICE_CHICKEN1			XE_REG(0x7010)
 
-#define COMMON_SLICE_CHICKEN4			XE_REG(0x7300)
+#define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
-#define COMMON_SLICE_CHICKEN3				XE_REG(0x7304)
-#define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304)
+#define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
+#define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
 #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
 #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
 #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
 #define   DISABLE_CPS_AWARE_COLOR_PIPE			REG_BIT(9)
 
-#define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c)
+#define XEHP_SLICE_COMMON_ECO_CHICKEN1		XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
 #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
 
-#define VF_PREEMPTION				XE_REG(0x83a4)
+#define VF_PREEMPTION				XE_REG(0x83a4, XE_REG_OPTION_MASKED)
 #define   PREEMPTION_VERTEX_COUNT		REG_GENMASK(15, 0)
 
-#define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4)
+#define VFG_PREEMPTION_CHICKEN			XE_REG(0x83b4, XE_REG_OPTION_MASKED)
 #define   POLYGON_TRIFAN_LINELOOP_DISABLE	REG_BIT(4)
 
 #define XEHP_SQCM				XE_REG_MCR(0x8724)
@@ -248,7 +248,7 @@
 #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
 #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
 
-#define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c)
+#define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
 #define   XEHPC_OVRLSCCC			REG_BIT(0)
 
 #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
@@ -276,20 +276,20 @@
 #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
 #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
 
-#define SAMPLER_MODE				XE_REG_MCR(0xe18c)
+#define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
 #define   ENABLE_SMALLPL			REG_BIT(15)
 #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
 #define   SAMPLER_ENABLE_HEADLESS_MSG		REG_BIT(5)
 
-#define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194)
+#define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
 
-#define CACHE_MODE_SS				XE_REG_MCR(0xe420)
+#define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
 #define   DISABLE_ECC				REG_BIT(5)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
 
-#define ROW_CHICKEN4				XE_REG_MCR(0xe48c)
+#define ROW_CHICKEN4				XE_REG_MCR(0xe48c, XE_REG_OPTION_MASKED)
 #define   DISABLE_GRF_CLEAR			REG_BIT(13)
 #define   XEHP_DIS_BBL_SYSPIPE			REG_BIT(11)
 #define   DISABLE_TDL_PUSH			REG_BIT(9)
@@ -298,18 +298,18 @@
 #define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
 #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
-#define ROW_CHICKEN				XE_REG_MCR(0xe4f0)
+#define ROW_CHICKEN				XE_REG_MCR(0xe4f0, XE_REG_OPTION_MASKED)
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
 
-#define ROW_CHICKEN2				XE_REG_MCR(0xe4f4)
+#define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
 #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
 #define   DISABLE_EARLY_READ			REG_BIT(14)
 #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
 
-#define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0)
+#define XEHP_HDC_CHICKEN0					XE_REG_MCR(0xe5f0, XE_REG_OPTION_MASKED)
 #define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
 
 #define RT_CTRL					XE_REG_MCR(0xe530)
-- 
2.39.0

