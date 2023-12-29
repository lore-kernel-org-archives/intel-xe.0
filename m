Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD77C46CD4
	for <intel-xe@archiver.kernel.org>; Fri, 29 Dec 2023 22:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD4A10E2B0;
	Fri, 29 Dec 2023 22:04:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666B10E2B0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Dec 2023 22:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703887445; x=1735423445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FlvPgxdscPJcwq7EELzAvxx4oUMLGnjL9fo8hecH7SQ=;
 b=TfwJ1Sv+sTbfpsS1F5XM/UJt4nkYIguiDvdbXLCPQFJ89WzmGgZAYVdM
 lTlecjVgQ3hp3T/xx3nH2w3FPj6QnoiQUDPORDaV2SMhkpFuZnrfHJBmV
 /j9QsHeiN3BCiaCwabd5xpy+TJTSxRPoNU1lCXpeeeb+/Ogu9hKjQMeBf
 U+h9WuCZrMbviaYMefw1bD4PUy6BdL0g/aDhnFNN+HCihi3/ZbcJ+Gjqm
 yR3kbN+NCUyAgmm8INMhGUXVJH8K9ISq5y5kd1m7hFqGxjIlw5Xeqdy3Z
 rPzFblMVFwmwUbLzzQWlIUwpYVGbQ6sxsxJ67rJ62JWd4+7/rW2zltILi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3514733"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="3514733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 14:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; d="scan'208";a="13375259"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa002.fm.intel.com with ESMTP; 29 Dec 2023 14:03:47 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/xe/guc: Add GuC based register capture for error capture
Date: Fri, 29 Dec 2023 14:03:45 -0800
Message-Id: <20231229220345.1396456-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Port GuC based register capture for error capture from i915 to Xe.

There are 3 parts in this commit:
. Prepare for capture registers
    There is a bo create at guc ads init time, that is very early
    and engine map is not ready, make it hard to calculate the
    capture buffer size, new function created for worst case size
    caluation. Other than that, this part basically follows the i915
    design.
. Process capture notification message
    Basically follows i915 design
. Sysfs command process.
    Xe switched to devcoredump, adopted command line process with
    captured list.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/xe/Kconfig               |   11 +
 drivers/gpu/drm/xe/Makefile              |    1 +
 drivers/gpu/drm/xe/abi/guc_actions_abi.h |    7 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |   19 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     |   70 +
 drivers/gpu/drm/xe/regs/xe_reg_defs.h    |    1 -
 drivers/gpu/drm/xe/regs/xe_regs.h        |    4 +
 drivers/gpu/drm/xe/xe_bo_types.h         |    2 +
 drivers/gpu/drm/xe/xe_devcoredump.c      |    1 +
 drivers/gpu/drm/xe/xe_gt_printk.h        |    3 +
 drivers/gpu/drm/xe/xe_gt_topology.c      |    2 +
 drivers/gpu/drm/xe/xe_gt_types.h         |    6 +
 drivers/gpu/drm/xe/xe_guc.c              |    5 +
 drivers/gpu/drm/xe/xe_guc_ads.c          |  255 +++-
 drivers/gpu/drm/xe/xe_guc_ads_types.h    |    2 +
 drivers/gpu/drm/xe/xe_guc_capture.c      | 1574 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_capture.h      |   33 +
 drivers/gpu/drm/xe/xe_guc_capture_fwif.h |  227 ++++
 drivers/gpu/drm/xe/xe_guc_ct.c           |    2 +
 drivers/gpu/drm/xe/xe_guc_fwif.h         |   69 +
 drivers/gpu/drm/xe/xe_guc_log.c          |  179 +++
 drivers/gpu/drm/xe/xe_guc_log.h          |   15 +
 drivers/gpu/drm/xe/xe_guc_log_types.h    |   26 +
 drivers/gpu/drm/xe/xe_guc_submit.c       |   22 +-
 drivers/gpu/drm/xe/xe_guc_submit.h       |    3 +
 drivers/gpu/drm/xe/xe_guc_types.h        |    2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |   89 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |  126 +-
 drivers/gpu/drm/xe/xe_lrc.c              |    4 +-
 drivers/gpu/drm/xe/xe_lrc_types.h        |    2 +
 30 files changed, 2632 insertions(+), 130 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_fwif.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index a53b0fdc15a7..337f6b613438 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -83,6 +83,17 @@ config DRM_XE_FORCE_PROBE
 
 	  Use "!*" to block the probe of the driver for all known devices.
 
+config DRM_XE_CAPTURE_ERROR
+	bool "Enable capturing GPU state following a hang"
+	depends on DRM_XE
+	default y
+	help
+	  This option enables capturing the GPU state when a hang is detected.
+	  This information is vital for triaging hangs and assists in debugging.
+	  Please report any hang to your Intel representative to help with triaging.
+
+	  If in doubt, say "Y".
+
 menu "drm/Xe Debugging"
 depends on DRM_XE
 depends on EXPERT
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index df8601d6a59f..5a97b2b74d1a 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -92,6 +92,7 @@ xe-y += xe_bb.o \
 	xe_gt_topology.o \
 	xe_guc.o \
 	xe_guc_ads.o \
+	xe_guc_capture.o \
 	xe_guc_ct.o \
 	xe_guc_db_mgr.o \
 	xe_guc_debugfs.o \
diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
index 3062e0e0d467..dd57620258b2 100644
--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
@@ -182,6 +182,13 @@ enum xe_guc_sleep_state_status {
 #define GUC_LOG_CONTROL_VERBOSITY_MASK	(0xF << GUC_LOG_CONTROL_VERBOSITY_SHIFT)
 #define GUC_LOG_CONTROL_DEFAULT_LOGGING	(1 << 8)
 
+enum intel_guc_state_capture_event_status {
+	INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_SUCCESS = 0x0,
+	INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE = 0x1,
+};
+
+#define INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK      0x000000FF
+
 #define XE_GUC_TLB_INVAL_TYPE_SHIFT 0
 #define XE_GUC_TLB_INVAL_MODE_SHIFT 8
 /* Flush PPC or SMRO caches along with TLB invalidation request */
diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 0b1266c88a6a..060628dbac8e 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -64,10 +64,17 @@
 
 #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
 #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
+#define RING_IPEIR(base)			XE_REG((base) + 0x64)
 #define RING_IPEHR(base)			XE_REG((base) + 0x68)
+#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
+#define RING_INSTPS(base)			XE_REG((base) + 0x70)
+
 #define RING_ACTHD(base)			XE_REG((base) + 0x74)
 #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
 #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
+#define RING_CMD_BUF_CCTL(base)			XE_REG((base) + 0x84)
+#define IPEIR(base)				XE_REG((base) + 0x88)
+
 #define RING_HWSTAM(base)			XE_REG((base) + 0x98)
 #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
 #define RING_NOPID(base)			XE_REG((base) + 0x94)
@@ -111,9 +118,18 @@
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
 #define   REPLAY_MODE_GRANULARITY		REG_BIT(0)
 
+#define RING_BBSTATE(base)			XE_REG((base) + 0x110)
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
+#define CCID(base)				XE_REG((base) + 0x180)
+#define   CCID_EN				BIT(0)
+#define   CCID_EXTENDED_STATE_RESTORE		BIT(2)
+#define   CCID_EXTENDED_STATE_SAVE		BIT(3)
+#define RING_BB_PER_CTX_PTR(base)		XE_REG((base) + 0x1c0) /* gen8+ */
+#define RING_INDIRECT_CTX(base)			XE_REG((base) + 0x1c4) /* gen8+ */
+#define RING_INDIRECT_CTX_OFFSET(base)		XE_REG((base) + 0x1c8) /* gen8+ */
+
 #define BCS_SWCTRL(base)			XE_REG((base) + 0x200, XE_REG_OPTION_MASKED)
 #define   BCS_SWCTRL_DISABLE_256B		REG_BIT(2)
 
@@ -129,6 +145,9 @@
 #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
 #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
 
+#define GEN8_RING_PDP_UDW(base, n)		XE_REG((base) + 0x270 + (n) * 8 + 4)
+#define GEN8_RING_PDP_LDW(base, n)		XE_REG((base) + 0x270 + (n) * 8)
+
 #define RING_MODE(base)				XE_REG((base) + 0x29c)
 #define   GFX_DISABLE_LEGACY_MODE		REG_BIT(3)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 6aaaf1f63c72..2546d58a7130 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -59,6 +59,38 @@
 
 #define XELP_GLOBAL_MOCS(i)			XE_REG(0x4000 + (i) * 4)
 #define XEHP_GLOBAL_MOCS(i)			XE_REG_MCR(0x4000 + (i) * 4)
+
+#define ERROR_GEN6				XE_REG(0x40a0)
+
+#define DONE_REG				XE_REG(0x40b0)
+#define GEN8_PRIVATE_PAT_LO			XE_REG(0x40e0)
+#define GEN8_PRIVATE_PAT_HI			XE_REG(0x40e0 + 4)
+#define GEN10_PAT_INDEX(index)			XE_REG(0x40e0 + (index) * 4)
+#define BSD_HWS_PGA_GEN7			XE_REG(0x4180)
+
+#define GEN12_CCS_AUX_INV			XE_REG(0x4208)
+#define GEN12_VD0_AUX_INV			XE_REG(0x4218)
+#define GEN12_VE0_AUX_INV			XE_REG(0x4238)
+#define GEN12_BCS0_AUX_INV			XE_REG(0x4248)
+
+#define GEN8_RTCR				XE_REG(0x4260)
+#define GEN8_M1TCR				XE_REG(0x4264)
+#define GEN8_M2TCR				XE_REG(0x4268)
+#define GEN8_BTCR				XE_REG(0x426c)
+#define GEN8_VTCR				XE_REG(0x4270)
+
+#define BLT_HWS_PGA_GEN7			XE_REG(0x4280)
+
+#define GEN12_VD2_AUX_INV			XE_REG(0x4298)
+#define GEN12_CCS0_AUX_INV			XE_REG(0x42c8)
+#define   AUX_INV				REG_BIT(0)
+
+#define VEBOX_HWS_PGA_GEN7			XE_REG(0x4380)
+
+#define GEN12_AUX_ERR_DBG			XE_REG(0x43f4)
+
+#define GEN7_TLB_RD_ADDR			XE_REG(0x4700)
+
 #define CCS_AUX_INV				XE_REG(0x4208)
 
 #define VD0_AUX_INV				XE_REG(0x4218)
@@ -73,6 +105,9 @@
 #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
 #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
 
+#define GEN8_FAULT_TLB_DATA0			XE_REG(0x4b10)
+#define GEN8_FAULT_TLB_DATA1			XE_REG(0x4b14)
+
 #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
 #define   TBIMR_FAST_CLIP			REG_BIT(5)
 
@@ -94,6 +129,8 @@
 #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
 #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
 
+#define XEHPG_INSTDONE_GEOM_SVG			XE_REG_MCR(0x666c)
+
 #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
 #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
 
@@ -110,6 +147,10 @@
 #define   FLSH_IGNORES_PSD			REG_BIT(10)
 #define   FD_END_COLLECT			REG_BIT(5)
 
+#define GEN7_SC_INSTDONE			XE_REG(0x7100)
+#define GEN12_SC_INSTDONE_EXTRA			XE_REG(0x7104)
+#define GEN12_SC_INSTDONE_EXTRA2		XE_REG(0x7108)
+
 #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
 #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
 
@@ -298,6 +339,22 @@
 
 #define XE2LPM_L3SQCREG5			XE_REG_MCR(0xb658)
 
+#define GEN12_FAULT_TLB_DATA0			XE_REG(0xceb8)
+#define XEHP_FAULT_TLB_DATA0			XE_REG_MCR(0xceb8)
+#define GEN12_FAULT_TLB_DATA1			XE_REG(0xcebc)
+#define XEHP_FAULT_TLB_DATA1			XE_REG_MCR(0xcebc)
+#define   FAULT_VA_HIGH_BITS			(0xf << 0)
+#define   FAULT_GTT_SEL				BIT(4)
+
+#define GEN12_RING_FAULT_REG			XE_REG(0xcec4)
+#define XEHP_RING_FAULT_REG			XE_REG_MCR(0xcec4)
+#define XELPMP_RING_FAULT_REG			XE_REG(0xcec4)
+#define   GEN8_RING_FAULT_ENGINE_ID(x)		(((x) >> 12) & 0x7)
+#define   RING_FAULT_GTTSEL_MASK		BIT(11)
+#define   RING_FAULT_SRCID(x)			(((x) >> 3) & 0xff)
+#define   RING_FAULT_FAULT_TYPE(x)		(((x) >> 1) & 0x3)
+#define   RING_FAULT_VALID			BIT(0)
+
 #define XEHP_MERT_MOD_CTRL			XE_REG_MCR(0xcf28)
 #define RENDER_MOD_CTRL				XE_REG_MCR(0xcf2c)
 #define COMP_MOD_CTRL				XE_REG_MCR(0xcf30)
@@ -316,6 +373,13 @@
 #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
 #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
 
+#define GEN12_GAM_DONE				XE_REG(0xcf68)
+
+#define GEN7_SAMPLER_INSTDONE			XE_REG(0xe160)
+#define GEN8_SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
+#define GEN7_ROW_INSTDONE			XE_REG(0xe164)
+#define GEN8_ROW_INSTDONE			XE_REG_MCR(0xe164)
+
 #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
 #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
 
@@ -478,10 +542,16 @@
 #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
 #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
 
+#define GEN12_SFC_DONE(n)			XE_REG(0x1cc000 + (n) * 0x1000)
+
 #define PVC_GT0_PACKAGE_ENERGY_STATUS		XE_REG(0x281004)
 #define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
 #define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
 #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
 
+/* 32 fences + sign bit for FENCE_REG_NONE */
+#define XE_MAX_NUM_FENCE_BITS 6
+#define XE_MAX_NUM_FENCES (2 ^ (XE_MAX_NUM_FENCE_BITS - 1))
+
 #endif
diff --git a/drivers/gpu/drm/xe/regs/xe_reg_defs.h b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
index c50e7650c09a..15869c2e2a52 100644
--- a/drivers/gpu/drm/xe/regs/xe_reg_defs.h
+++ b/drivers/gpu/drm/xe/regs/xe_reg_defs.h
@@ -57,7 +57,6 @@ struct xe_reg_mcr {
 	struct xe_reg __reg;
 };
 
-
 /**
  * XE_REG_OPTION_MASKED - Register is "masked", with upper 16 bits marking the
  * written bits on the lower 16 bits.
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 2c214bb9b671..574a5a78739c 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -7,6 +7,10 @@
 
 #include "regs/xe_reg_defs.h"
 
+#define EIR					XE_REG(0x20b0)
+
+#define HSW_GTT_CACHE_EN			XE_REG(0x4024)
+
 #define TIMESTAMP_OVERRIDE					XE_REG(0x44074)
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DENOMINATOR_MASK	REG_GENMASK(15, 12)
 #define   TIMESTAMP_OVERRIDE_US_COUNTER_DIVIDER_MASK		REG_GENMASK(9, 0)
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 64c2249a4e40..cdef4dd1ef06 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -44,6 +44,8 @@ struct xe_bo {
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
 	struct ttm_bo_kmap_obj kmap;
+	/** @ads_map: contents of the GuC ADS */
+	struct iosys_map ads_map;
 	/** @pinned_link: link to present / evicted list of pinned BO */
 	struct list_head pinned_link;
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 68abc0b195be..b032d6e2cc3a 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -14,6 +14,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ct.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_submit.h"
 #include "xe_hw_engine.h"
 
diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
index c2b004d3f48e..107360edfcd6 100644
--- a/drivers/gpu/drm/xe/xe_gt_printk.h
+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
@@ -22,6 +22,9 @@
 #define xe_gt_notice(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
 
+#define xe_gt_notice_ratelimited(_gt, _fmt, ...) \
+	xe_gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
+
 #define xe_gt_info(_gt, _fmt, ...) \
 	xe_gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
index a8d7f272c30a..696e41aa5596 100644
--- a/drivers/gpu/drm/xe/xe_gt_topology.c
+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
@@ -96,11 +96,13 @@ xe_gt_topology_init(struct xe_gt *gt)
 	drm_WARN_ON(&xe->drm, num_geometry_regs > 3);
 	drm_WARN_ON(&xe->drm, num_compute_regs > 3);
 
+	gt->fuse_topo.g_dss_num_max = num_geometry_regs;
 	load_dss_mask(gt, gt->fuse_topo.g_dss_mask,
 		      num_geometry_regs,
 		      XELP_GT_GEOMETRY_DSS_ENABLE,
 		      XE2_GT_GEOMETRY_DSS_1,
 		      XE2_GT_GEOMETRY_DSS_2);
+	gt->fuse_topo.c_dss_num_max = num_compute_regs;
 	load_dss_mask(gt, gt->fuse_topo.c_dss_mask, num_compute_regs,
 		      XEHP_GT_COMPUTE_DSS_ENABLE,
 		      XEHPC_GT_COMPUTE_DSS_ENABLE_EXT,
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index f74684660475..4c0540abfecb 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -328,6 +328,12 @@ struct xe_gt {
 
 		/** @eu_mask_per_dss: EU mask per DSS*/
 		xe_eu_mask_t eu_mask_per_dss;
+		/** @g_dss_num_max: count of dual-subslices usable by geometry */
+		u8 g_dss_num_max;
+
+		/** @c_dss_num_max: count of dual-subslices usable by compute */
+		u8 c_dss_num_max;
+
 	} fuse_topo;
 
 	/** @steering: register steering for individual HW units */
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 811e8b201270..308fde5a6874 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -17,6 +17,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_guc_ads.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_hwconfig.h"
 #include "xe_guc_log.h"
@@ -255,6 +256,10 @@ int xe_guc_init(struct xe_guc *guc)
 	if (ret)
 		goto out;
 
+	ret = xe_guc_capture_init(guc);
+	if (ret)
+		goto out;
+
 	ret = xe_guc_ads_init(&guc->ads);
 	if (ret)
 		goto out;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 390e6f1bf4e1..528c7aff4a07 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -14,6 +14,8 @@
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
 #include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_capture_fwif.h"
 #include "xe_hw_engine.h"
 #include "xe_lrc.h"
 #include "xe_map.h"
@@ -133,8 +135,7 @@ static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
 
 static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
 {
-	/* FIXME: Allocate a proper capture list */
-	return PAGE_ALIGN(PAGE_SIZE);
+	return PAGE_ALIGN(ads->capture_size);
 }
 
 static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
@@ -260,6 +261,34 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 	return total_size;
 }
 
+static size_t calculate_capture_worst_size(struct xe_guc_ads *ads)
+{
+	struct xe_guc *guc = ads_to_guc(ads);
+	size_t total_size, class_size, instance_size, global_size;
+	int i, j;
+
+	/* Early calcuate the capture size, to reserve capture size before guc init finished,
+	 * as engine mask is not ready, the calculate here is the worst case size
+	 */
+	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
+		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
+			class_size = 0;
+			instance_size = 0;
+			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+						   j, &class_size);
+			xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+						   j, &instance_size);
+			total_size += class_size + instance_size;
+		}
+		global_size = 0;
+		xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &global_size);
+		total_size += PAGE_ALIGN(global_size);
+	}
+
+	return total_size;
+}
+
 #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
 
 int xe_guc_ads_init(struct xe_guc_ads *ads)
@@ -270,6 +299,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	struct xe_bo *bo;
 
 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
+	ads->capture_size = calculate_capture_worst_size(ads);
 	ads->regset_size = calculate_regset_size(gt);
 
 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
@@ -283,33 +313,6 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
 	return 0;
 }
 
-/**
- * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
- * @ads: Additional data structures object
- *
- * Recalcuate golden_lrc_size & regset_size as the number hardware engines may
- * have changed after the hwconfig was loaded. Also verify the new sizes fit in
- * the already allocated ADS buffer object.
- *
- * Return: 0 on success, negative error code on error.
- */
-int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
-{
-	struct xe_gt *gt = ads_to_gt(ads);
-	u32 prev_regset_size = ads->regset_size;
-
-	xe_gt_assert(gt, ads->bo);
-
-	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
-	ads->regset_size = calculate_regset_size(gt);
-
-	xe_gt_assert(gt, ads->golden_lrc_size +
-		     (ads->regset_size - prev_regset_size) <=
-		     MAX_GOLDEN_LRC_SIZE);
-
-	return 0;
-}
-
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
 	ads_blob_write(ads, policies.dpc_promote_time,
@@ -393,20 +396,171 @@ static void guc_mapping_table_init(struct xe_gt *gt,
 	}
 }
 
-static void guc_capture_list_init(struct xe_guc_ads *ads)
+static u32 guc_get_capture_engine_mask(struct xe_gt *gt, struct iosys_map *info_map,
+				       u32 capture_class)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 mask;
+
+	switch (capture_class) {
+	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_RENDER_CLASS]);
+		mask |= info_map_read(xe, info_map, engine_enabled_masks[GUC_COMPUTE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEO:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEO_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_VIDEOENHANCE_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_BLITTER:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_BLITTER_CLASS]);
+		break;
+
+	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
+		mask = info_map_read(xe, info_map, engine_enabled_masks[GUC_GSC_OTHER_CLASS]);
+		break;
+
+	default:
+		mask = 0;
+	}
+
+	return mask;
+}
+
+static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 {
+	struct xe_guc *guc = ads_to_guc(ads);
+	struct xe_gt *gt = ads_to_gt(ads);
+	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
+	struct iosys_map info_map;
+	bool ads_is_mapped;
+	size_t size = 0;
+	void *ptr;
 	int i, j;
-	u32 addr = xe_bo_ggtt_addr(ads->bo) + guc_ads_capture_offset(ads);
 
-	/* FIXME: Populate a proper capture list */
+	ads_is_mapped = ads->capture_size != 0;
+	if (ads_is_mapped) {
+		capture_offset = guc_ads_capture_offset(ads);
+		ads_ggtt =  xe_bo_ggtt_addr(ads->bo);
+		info_map =  IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
+						  offsetof(struct __guc_ads_blob, system_info));
+	} else {
+		/* Bail with worst case size calculations */
+		total_size = calculate_capture_worst_size(ads);
+		return total_size;
+	}
+
+	/* first, set aside the first page for a capture_list with zero descriptors */
+	total_size = PAGE_SIZE;
+	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
+		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
+
+	null_ggtt = ads_ggtt + capture_offset;
+	capture_offset += PAGE_SIZE;
+
+	/* Populate capture list : at this point adps is already allocated and mapped to worst case
+	 * size
+	 */
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
+		bool write_empty_list;
 		for (j = 0; j < GUC_MAX_ENGINE_CLASSES; j++) {
-			ads_blob_write(ads, ads.capture_instance[i][j], addr);
-			ads_blob_write(ads, ads.capture_class[i][j], addr);
+			u32 engine_mask = guc_get_capture_engine_mask(gt, &info_map, j);
+			/* null list if we dont have said engine or list */
+			if (!engine_mask) {
+				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
+				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
+				continue;
+			}
+			/********************************************************/
+			/*** engine exists: start with engine-class registers ***/
+			/********************************************************/
+			write_empty_list = true; /* starting assumption is an empty list */
+			size = 0;
+			if (!xe_guc_capture_getlistsize(guc, i,
+							GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+							j, &size)) {
+				if (total_size + size > ads->capture_size)
+					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+						  total_size + size, ads->capture_size);
+				else if (!xe_guc_capture_getlist(guc, i,
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+								 j, &ptr))
+					/* everything checked out, populate! */
+					write_empty_list = false;
+			}
+			if (!write_empty_list) {
+				ads_blob_write(ads, ads.capture_class[i][j],
+					       ads_ggtt + capture_offset);
+				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
+						 ptr, size);
+				total_size += size;
+				capture_offset += size;
+			} else {
+				ads_blob_write(ads, ads.capture_class[i][j], null_ggtt);
+			}
+
+			/********************************************************/
+			/*** engine exists: next, engine-instance registers   ***/
+			/********************************************************/
+			write_empty_list = true; /* starting assumption is an empty list */
+			size = 0;
+			if (!xe_guc_capture_getlistsize(guc, i,
+							GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+							j, &size)) {
+				if (total_size + size > ads->capture_size)
+					xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+						  total_size + size, ads->capture_size);
+				else if (!xe_guc_capture_getlist(guc, i,
+								 GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+								 j, &ptr))
+					/* everything checked out, populate! */
+					write_empty_list = false;
+			}
+
+			if (!write_empty_list) {
+				ads_blob_write(ads, ads.capture_instance[i][j],
+					       ads_ggtt + capture_offset);
+				xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset,
+						 ptr, size);
+				total_size += size;
+				capture_offset += size;
+			} else {
+				ads_blob_write(ads, ads.capture_instance[i][j], null_ggtt);
+			}
 		}
 
-		ads_blob_write(ads, ads.capture_global[i], addr);
+		/********************************************************/
+		/*** global registers is last in our PF/VF loops      ***/
+		/********************************************************/
+		write_empty_list = true; /* starting assumption is an empty list */
+		size = 0;
+		if (!xe_guc_capture_getlistsize(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &size)) {
+			if (total_size + size > ads->capture_size)
+				xe_gt_dbg(gt, "Capture size overflow :%lu vs %d\n",
+					  total_size + size, ads->capture_size);
+			else if (!xe_guc_capture_getlist(guc, i, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0,
+							 &ptr))
+				write_empty_list = false; /* everything checked out, populate! */
+		}
+		if (!write_empty_list) {
+			ads_blob_write(ads, ads.capture_global[i], ads_ggtt + capture_offset);
+			xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr,
+					 size);
+			total_size += size;
+			capture_offset += size;
+		} else {
+			ads_blob_write(ads, ads.capture_global[i], null_ggtt);
+		}
 	}
+
+	if (ads->capture_size != PAGE_ALIGN(total_size))
+		xe_gt_warn(gt, "ADS capture alloc size changed from %d to %d\n",
+			   ads->capture_size, PAGE_ALIGN(total_size));
+	return PAGE_ALIGN(total_size);
 }
 
 static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
@@ -549,6 +703,35 @@ static void guc_doorbell_init(struct xe_guc_ads *ads)
 	}
 }
 
+/**
+ * xe_guc_ads_init_post_hwconfig - initialize ADS post hwconfig load
+ * @ads: Additional data structures object
+ *
+ * Recalcuate golden_lrc_size & regset_size as the number hardware engines may
+ * have changed after the hwconfig was loaded. Also verify the new sizes fit in
+ * the already allocated ADS buffer object.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
+{
+	struct xe_gt *gt = ads_to_gt(ads);
+	u32 prev_regset_size = ads->regset_size;
+
+	xe_gt_assert(gt, ads->bo);
+
+	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
+	ads->capture_size = 0; /* Clear capture_size before run guc_capture_prep_lists */
+	ads->capture_size = guc_capture_prep_lists(ads);
+	ads->regset_size = calculate_regset_size(gt);
+
+	xe_gt_assert(gt, ads->golden_lrc_size + ads->capture_size +
+		     (ads->regset_size - prev_regset_size) <=
+		     MAX_GOLDEN_LRC_SIZE);
+
+	return 0;
+}
+
 /**
  * xe_guc_ads_populate_minimal - populate minimal ADS
  * @ads: Additional data structures object
@@ -595,7 +778,7 @@ void xe_guc_ads_populate(struct xe_guc_ads *ads)
 	guc_mmio_reg_state_init(ads);
 	guc_prep_golden_lrc_null(ads);
 	guc_mapping_table_init(gt, &info_map);
-	guc_capture_list_init(ads);
+	guc_capture_prep_lists(ads);
 	guc_doorbell_init(ads);
 
 	if (xe->info.has_usm) {
diff --git a/drivers/gpu/drm/xe/xe_guc_ads_types.h b/drivers/gpu/drm/xe/xe_guc_ads_types.h
index 4afe44bece4b..82cf569b0710 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_ads_types.h
@@ -20,6 +20,8 @@ struct xe_guc_ads {
 	size_t golden_lrc_size;
 	/** @regset_size: size of register set passed to GuC for save/restore */
 	u32 regset_size;
+	/** @capture_size: size of register set passed to GuC for capture */
+	u32 capture_size;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
new file mode 100644
index 000000000000..ace5115cae6c
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -0,0 +1,1574 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021-2022 Intel Corporation
+ */
+
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "abi/guc_actions_abi.h"
+#include "regs/xe_regs.h"
+#include "regs/xe_engine_regs.h"
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_guc_regs.h"
+
+#include "xe_guc_capture_fwif.h"
+
+#include "xe_bo.h"
+#include "xe_device.h"
+#include "xe_exec_queue_types.h"
+#include "xe_hw_engine_types.h"
+#include "xe_gt.h"
+#include "xe_gt_printk.h"
+#include "xe_guc.h"
+#include "xe_guc_capture.h"
+#include "xe_guc_ct.h"
+
+#include "xe_guc_log.h"
+#include "xe_gt_mcr.h"
+#include "xe_guc_submit.h"
+#include "xe_macros.h"
+#include "xe_map.h"
+
+/*
+ * Define all device tables of GuC error capture register lists
+ * NOTE: For engine-registers, GuC only needs the register offsets
+ *       from the engine-mmio-base
+ */
+#define COMMON_BASE_GLOBAL \
+	{ FORCEWAKE_GT,             0,      0, "FORCEWAKE" }
+
+#define COMMON_GEN8BASE_GLOBAL \
+	{ ERROR_GEN6,               0,      0, "ERROR_GEN6" }, \
+	{ DONE_REG,                 0,      0, "DONE_REG" }, \
+	{ HSW_GTT_CACHE_EN,         0,      0, "HSW_GTT_CACHE_EN" }
+
+#define GEN8_GLOBAL \
+	{ GEN8_FAULT_TLB_DATA0,     0,      0, "GEN8_FAULT_TLB_DATA0" }, \
+	{ GEN8_FAULT_TLB_DATA1,     0,      0, "GEN8_FAULT_TLB_DATA1" }
+
+#define COMMON_GEN12BASE_GLOBAL \
+	{ GEN12_FAULT_TLB_DATA0,    0,      0, "GEN12_FAULT_TLB_DATA0" }, \
+	{ GEN12_FAULT_TLB_DATA1,    0,      0, "GEN12_FAULT_TLB_DATA1" }, \
+	{ GEN12_AUX_ERR_DBG,        0,      0, "AUX_ERR_DBG" }, \
+	{ GEN12_GAM_DONE,           0,      0, "GAM_DONE" }, \
+	{ GEN12_RING_FAULT_REG,     0,      0, "FAULT_REG" }
+
+struct xe_reg r0 = RING_ESR(0);
+struct xe_reg r1 = RING_PSMI_CTL(0);
+
+#define COMMON_BASE_ENGINE_INSTANCE \
+	{ RING_PSMI_CTL(0),         0,      0, "RC PSMI" }, \
+	{ RING_ESR(0),              0,      0, "ESR" }, \
+	{ RING_DMA_FADD(0),         0,      0, "RING_DMA_FADD_LDW" }, \
+	{ RING_DMA_FADD_UDW(0),     0,      0, "RING_DMA_FADD_UDW" }, \
+	{ RING_IPEIR(0),            0,      0, "IPEIR" }, \
+	{ RING_IPEHR(0),            0,      0, "IPEHR" }, \
+	{ RING_INSTPS(0),           0,      0, "INSTPS" }, \
+	{ RING_BBADDR(0),           0,      0, "RING_BBADDR_LOW32" }, \
+	{ RING_BBADDR_UDW(0),       0,      0, "RING_BBADDR_UP32" }, \
+	{ RING_BBSTATE(0),          0,      0, "BB_STATE" }, \
+	{ CCID(0),                  0,      0, "CCID" }, \
+	{ RING_ACTHD(0),            0,      0, "ACTHD_LDW" }, \
+	{ RING_ACTHD_UDW(0),        0,      0, "ACTHD_UDW" }, \
+	{ INSTPM(0),                0,      0, "INSTPM" }, \
+	{ RING_INSTDONE(0),         0,      0, "INSTDONE" }, \
+	{ RING_NOPID(0),            0,      0, "RING_NOPID" }, \
+	{ RING_START(0),            0,      0, "START" }, \
+	{ RING_HEAD(0),             0,      0, "HEAD" }, \
+	{ RING_TAIL(0),             0,      0, "TAIL" }, \
+	{ RING_CTL(0),              0,      0, "CTL" }, \
+	{ RING_MI_MODE(0),          0,      0, "MODE" }, \
+	{ RING_CONTEXT_CONTROL(0),  0,      0, "RING_CONTEXT_CONTROL" }, \
+	{ RING_HWS_PGA(0),          0,      0, "HWS" }, \
+	{ RING_MODE(0),             0,      0, "GFX_MODE" }, \
+	{ GEN8_RING_PDP_LDW(0, 0),  0,      0, "PDP0_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 0),  0,      0, "PDP0_UDW" }, \
+	{ GEN8_RING_PDP_LDW(0, 1),  0,      0, "PDP1_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 1),  0,      0, "PDP1_UDW" }, \
+	{ GEN8_RING_PDP_LDW(0, 2),  0,      0, "PDP2_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 2),  0,      0, "PDP2_UDW" }, \
+	{ GEN8_RING_PDP_LDW(0, 3),  0,      0, "PDP3_LDW" }, \
+	{ GEN8_RING_PDP_UDW(0, 3),  0,      0, "PDP3_UDW" }
+
+#define COMMON_BASE_HAS_EU \
+	{ EIR,                      0,      0, "EIR" }
+
+#define COMMON_BASE_RENDER \
+	{ GEN7_SC_INSTDONE,         0,      0, "GEN7_SC_INSTDONE" }
+
+#define COMMON_GEN12BASE_RENDER \
+	{ GEN12_SC_INSTDONE_EXTRA,  0,      0, "GEN12_SC_INSTDONE_EXTRA" }, \
+	{ GEN12_SC_INSTDONE_EXTRA2, 0,      0, "GEN12_SC_INSTDONE_EXTRA2" }
+
+#define COMMON_GEN12BASE_VEC \
+	{ GEN12_SFC_DONE(0),        0,      0, "SFC_DONE[0]" }, \
+	{ GEN12_SFC_DONE(1),        0,      0, "SFC_DONE[1]" }, \
+	{ GEN12_SFC_DONE(2),        0,      0, "SFC_DONE[2]" }, \
+	{ GEN12_SFC_DONE(3),        0,      0, "SFC_DONE[3]" }
+
+/* XE_LP Global */
+static const struct __guc_mmio_reg_descr xe_lp_global_regs[] = {
+	COMMON_BASE_GLOBAL,
+	COMMON_GEN8BASE_GLOBAL,
+	COMMON_GEN12BASE_GLOBAL,
+};
+
+/* XE_LP Render / Compute Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_rc_class_regs[] = {
+	COMMON_BASE_HAS_EU,
+	COMMON_BASE_RENDER,
+	COMMON_GEN12BASE_RENDER,
+};
+
+/* GEN8+ Render / Compute Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_rc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* GEN8+ Media Decode/Encode Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_vd_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* XE_LP Video Enhancement Per-Class */
+static const struct __guc_mmio_reg_descr xe_lp_vec_class_regs[] = {
+	COMMON_GEN12BASE_VEC,
+};
+
+/* GEN8+ Video Enhancement Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_vec_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* GEN8+ Blitter Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr gen8_blt_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* XE_LP - GSC Per-Engine-Instance */
+static const struct __guc_mmio_reg_descr xe_lp_gsc_inst_regs[] = {
+	COMMON_BASE_ENGINE_INSTANCE,
+};
+
+/* GEN8 - Global */
+static const struct __guc_mmio_reg_descr gen8_global_regs[] = {
+	COMMON_BASE_GLOBAL,
+	COMMON_GEN8BASE_GLOBAL,
+	GEN8_GLOBAL,
+};
+
+static const struct __guc_mmio_reg_descr gen8_rc_class_regs[] = {
+	COMMON_BASE_HAS_EU,
+	COMMON_BASE_RENDER,
+};
+
+/*
+ * Empty list to prevent warnings about unknown class/instance types
+ * as not all class/instanace types have entries on all platforms.
+ */
+static const struct __guc_mmio_reg_descr empty_regs_list[] = {
+};
+
+#define TO_GCAP_DEF_OWNER(x) (GUC_CAPTURE_LIST_INDEX_##x)
+#define TO_GCAP_DEF_TYPE(x) (GUC_CAPTURE_LIST_TYPE_##x)
+#define MAKE_REGLIST(regslist, regsowner, regstype, class) \
+	{ \
+		regslist, \
+		ARRAY_SIZE(regslist), \
+		TO_GCAP_DEF_OWNER(regsowner), \
+		TO_GCAP_DEF_TYPE(regstype), \
+		class, \
+		NULL, \
+	}
+
+/* List of lists */
+static const struct __guc_mmio_reg_descr_group gen8_lists[] = {
+	MAKE_REGLIST(gen8_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(gen8_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	{}
+};
+
+static const struct __guc_mmio_reg_descr_group xe_lp_lists[] = {
+	MAKE_REGLIST(xe_lp_global_regs, PF, GLOBAL, 0),
+	MAKE_REGLIST(xe_lp_rc_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(gen8_rc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(gen8_vd_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEO),
+	MAKE_REGLIST(xe_lp_vec_class_regs, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(gen8_vec_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(gen8_blt_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_BLITTER),
+	MAKE_REGLIST(empty_regs_list, PF, ENGINE_CLASS, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	MAKE_REGLIST(xe_lp_gsc_inst_regs, PF, ENGINE_INSTANCE, GUC_CAPTURE_LIST_CLASS_GSC_OTHER),
+	{}
+};
+
+struct __reg_map_descr {
+	u32 dst_offset;
+	struct xe_reg reg;
+};
+
+struct __reg_map_descr capture_engine_reg[] = {
+	{offsetof(struct snap_shot_regs, ring_hwstam),			RING_HWSTAM(0)},
+	{offsetof(struct snap_shot_regs, ring_hws_pga),			RING_HWS_PGA(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_status_lo),	RING_EXECLIST_STATUS_LO(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_status_hi),	RING_EXECLIST_STATUS_HI(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_lo),	RING_EXECLIST_SQ_CONTENTS_LO(0)},
+	{offsetof(struct snap_shot_regs, ring_execlist_sq_contents_hi),	RING_EXECLIST_SQ_CONTENTS_HI(0)},
+	{offsetof(struct snap_shot_regs, ring_start),			RING_START(0)},
+	{offsetof(struct snap_shot_regs, ring_head),			RING_HEAD(0)},
+	{offsetof(struct snap_shot_regs, ring_tail),			RING_TAIL(0)},
+	{offsetof(struct snap_shot_regs, ring_ctl),			RING_CTL(0)},
+	{offsetof(struct snap_shot_regs, ring_mi_mode),			RING_MI_MODE(0)},
+	{offsetof(struct snap_shot_regs, ring_mode),			RING_MODE(0)},
+	{offsetof(struct snap_shot_regs, ring_imr),			RING_IMR(0)},
+	{offsetof(struct snap_shot_regs, ring_esr),			RING_ESR(0)},
+	{offsetof(struct snap_shot_regs, ring_emr),			RING_EMR(0)},
+	{offsetof(struct snap_shot_regs, ring_eir),			RING_EIR(0)},
+	{offsetof(struct snap_shot_regs, ring_acthd_udw),		RING_ACTHD_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_acthd),			RING_ACTHD(0)},
+	{offsetof(struct snap_shot_regs, ring_bbaddr_udw),		RING_BBADDR_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_bbaddr),			RING_BBADDR(0)},
+	{offsetof(struct snap_shot_regs, ring_dma_fadd_udw),		RING_DMA_FADD_UDW(0)},
+	{offsetof(struct snap_shot_regs, ring_dma_fadd),		RING_DMA_FADD(0)},
+	{offsetof(struct snap_shot_regs, ipehr),			RING_IPEHR(0)},
+	{offsetof(struct snap_shot_regs, rcu_mode),			RCU_MODE},
+};
+
+static void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
+				      unsigned int *group, unsigned int *instance);
+
+static const struct __guc_mmio_reg_descr_group *
+guc_capture_get_one_list(const struct __guc_mmio_reg_descr_group *reglists,
+			 u32 owner, u32 type, u32 id)
+{
+	int i;
+
+	if (!reglists)
+		return NULL;
+
+	for (i = 0; reglists[i].list; ++i) {
+		if (reglists[i].owner == owner && reglists[i].type == type &&
+		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
+			return &reglists[i];
+	}
+
+	return NULL;
+}
+
+static struct __guc_mmio_reg_descr_group *
+guc_capture_get_one_ext_list(struct __guc_mmio_reg_descr_group *reglists,
+			     u32 owner, u32 type, u32 id)
+{
+	int i;
+
+	if (!reglists)
+		return NULL;
+
+	for (i = 0; reglists[i].extlist; ++i) {
+		if (reglists[i].owner == owner && reglists[i].type == type &&
+		    (reglists[i].engine == id || reglists[i].type == GUC_CAPTURE_LIST_TYPE_GLOBAL))
+			return &reglists[i];
+	}
+
+	return NULL;
+}
+
+static void guc_capture_free_extlists(struct __guc_mmio_reg_descr_group *reglists)
+{
+	int i = 0;
+
+	if (!reglists)
+		return;
+
+	while (reglists[i].extlist)
+		kfree(reglists[i++].extlist);
+}
+
+struct __ext_steer_reg {
+	const char *name;
+	struct xe_reg_mcr reg;
+};
+
+static const struct __ext_steer_reg gen8_extregs[] = {
+	{"GEN8_SAMPLER_INSTDONE", GEN8_SAMPLER_INSTDONE},
+	{"GEN8_ROW_INSTDONE", GEN8_ROW_INSTDONE}
+};
+
+static const struct __ext_steer_reg xehpg_extregs[] = {
+	{"XEHPG_INSTDONE_GEOM_SVG", XEHPG_INSTDONE_GEOM_SVG}
+};
+
+static void __fill_ext_reg(struct __guc_mmio_reg_descr *ext,
+			   const struct __ext_steer_reg *extlist,
+			   int slice_id, int subslice_id)
+{
+	ext->reg = XE_REG(extlist->reg.__reg.addr);
+	ext->flags = FIELD_PREP(GUC_REGSET_STEERING_GROUP, slice_id);
+	ext->flags |= FIELD_PREP(GUC_REGSET_STEERING_INSTANCE, subslice_id);
+	ext->regname = extlist->name;
+}
+
+static int
+__alloc_ext_regs(struct __guc_mmio_reg_descr_group *newlist,
+		 const struct __guc_mmio_reg_descr_group *rootlist, int num_regs)
+{
+	struct __guc_mmio_reg_descr *list;
+
+	list = kcalloc(num_regs, sizeof(struct __guc_mmio_reg_descr), GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+
+	newlist->extlist = list;
+	newlist->num_regs = num_regs;
+	newlist->owner = rootlist->owner;
+	newlist->engine = rootlist->engine;
+	newlist->type = rootlist->type;
+
+	return 0;
+}
+
+static void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
+				      unsigned int *group, unsigned int *instance)
+{
+	if (gt_to_xe(gt)->info.platform == XE_PVC) {
+		*group = dss / GEN_DSS_PER_CSLICE;
+		*instance = dss % GEN_DSS_PER_CSLICE;
+	} else if (GRAPHICS_VERx100(gt_to_xe(gt)) >= 1250) {
+		*group = dss / GEN_DSS_PER_GSLICE;
+		*instance = dss % GEN_DSS_PER_GSLICE;
+	} else {
+		*group = dss / GEN_MAX_SS_PER_HSW_SLICE;
+		*instance = dss % GEN_MAX_SS_PER_HSW_SLICE;
+		return;
+	}
+}
+
+static inline bool
+xe_sseu_has_subslice(const struct xe_gt *gt, int slice,
+		     int subslice)
+{
+	if (slice >= gt->fuse_topo.g_dss_num_max ||
+	    subslice >= 32 * XE_MAX_DSS_FUSE_REGS)
+		return false;
+	return test_bit(subslice, gt->fuse_topo.g_dss_mask);
+}
+
+/*
+ * Helper for for_each_ss_steering loop.  On pre-Xe_HP platforms, subslice
+ * presence is determined by using the group/instance as direct lookups in the
+ * slice/subslice topology.  On Xe_HP and beyond, the steering is unrelated to
+ * the topology, so we lookup the DSS ID directly in "slice 0."
+ */
+#define _HAS_SS(ss_, gt_, group_, instance_) ( \
+	GRAPHICS_VERx100(gt_to_xe(gt_)) >= 1250 ? \
+		xe_sseu_has_subslice(gt_, 0, ss_) : \
+		xe_sseu_has_subslice(gt_, group_, instance_))
+
+/*
+ * Loop over each subslice/DSS and determine the group and instance IDs that
+ * should be used to steer MCR accesses toward this DSS.
+ */
+#define for_each_ss_steering(ss_, gt_, group_, instance_) \
+	for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_, &instance_); \
+	     ss_ < XE_MAX_SS_FUSE_BITS; \
+	     ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_, &instance_)) \
+		for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
+
+static void
+guc_capture_alloc_steered_lists(struct xe_guc *guc,
+				const struct __guc_mmio_reg_descr_group *lists)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	int slice, subslice, iter, i, num_steer_regs, num_tot_regs = 0;
+	const struct __guc_mmio_reg_descr_group *list;
+	struct __guc_mmio_reg_descr_group *extlists;
+	struct __guc_mmio_reg_descr *extarray;
+	bool has_xehpg_extregs;
+
+	/* steered registers currently only exist for the render-class */
+	list = guc_capture_get_one_list(lists, GUC_CAPTURE_LIST_INDEX_PF,
+					GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+					GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE);
+	/* skip if extlists was previously allocated */
+	if (!list || guc->capture->extlists)
+		return;
+
+	has_xehpg_extregs = GRAPHICS_VERx100(gt_to_xe(gt)) >= 1255;
+
+	num_steer_regs = ARRAY_SIZE(gen8_extregs);
+	if (has_xehpg_extregs)
+		num_steer_regs += ARRAY_SIZE(xehpg_extregs);
+
+	for_each_ss_steering(iter, gt, slice, subslice) {
+		num_tot_regs += num_steer_regs;
+	}
+	if (!num_tot_regs)
+		return;
+
+	/* allocate an extra for an end marker */
+	extlists = kcalloc(2, sizeof(struct __guc_mmio_reg_descr_group), GFP_KERNEL);
+	if (!extlists)
+		return;
+
+	if (__alloc_ext_regs(&extlists[0], list, num_tot_regs)) {
+		kfree(extlists);
+		return;
+	}
+
+	extarray = extlists[0].extlist;
+	for_each_ss_steering(iter, gt, slice, subslice) {
+		for (i = 0; i < ARRAY_SIZE(gen8_extregs); ++i) {
+			__fill_ext_reg(extarray, &gen8_extregs[i], slice, subslice);
+			++extarray;
+		}
+
+		if (has_xehpg_extregs) {
+			for (i = 0; i < ARRAY_SIZE(xehpg_extregs); ++i) {
+				__fill_ext_reg(extarray, &xehpg_extregs[i], slice, subslice);
+				++extarray;
+			}
+		}
+	}
+
+	xe_gt_dbg(guc_to_gt(guc), "capture found %d ext-regs.\n", num_tot_regs);
+	guc->capture->extlists = extlists;
+}
+
+static const struct __guc_mmio_reg_descr_group *
+guc_capture_get_device_reglist(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	const struct __guc_mmio_reg_descr_group *lists;
+
+	if (GRAPHICS_VER(xe) >= 12)
+		lists = xe_lp_lists;
+	else
+		lists = gen8_lists;
+
+	/*
+	 * For certain engine classes, there are slice and subslice
+	 * level registers requiring steering. We allocate and populate
+	 * these at init time based on hw config add it as an extension
+	 * list at the end of the pre-populated render list.
+	 */
+	guc_capture_alloc_steered_lists(guc, lists);
+
+	return lists;
+}
+
+static const char *
+__stringify_type(u32 type)
+{
+	switch (type) {
+	case GUC_CAPTURE_LIST_TYPE_GLOBAL:
+		return "Global";
+	case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
+		return "Class";
+	case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
+		return "Instance";
+	default:
+		break;
+	}
+
+	return "unknown";
+}
+
+static const char *
+__stringify_engclass(u32 class)
+{
+	switch (class) {
+	case GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE:
+		return "Render/Compute";
+	case GUC_CAPTURE_LIST_CLASS_VIDEO:
+		return "Video";
+	case GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE:
+		return "VideoEnhance";
+	case GUC_CAPTURE_LIST_CLASS_BLITTER:
+		return "Blitter";
+	case GUC_CAPTURE_LIST_CLASS_GSC_OTHER:
+		return "GSC-Other";
+	default:
+		break;
+	}
+
+	return "unknown";
+}
+
+static int
+guc_capture_list_init(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
+		      struct guc_mmio_reg *ptr, u16 num_entries)
+{
+	u32 i = 0, j = 0;
+	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
+	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
+	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+
+	if (!reglists)
+		return -ENODEV;
+
+	match = guc_capture_get_one_list(reglists, owner, type, classid);
+	if (!match)
+		return -ENODATA;
+
+	for (i = 0; i < num_entries && i < match->num_regs; ++i) {
+		ptr[i].offset = match->list[i].reg.addr;
+		ptr[i].value = 0xDEADF00D;
+		ptr[i].flags = match->list[i].flags;
+		ptr[i].mask = match->list[i].mask;
+	}
+
+	matchext = guc_capture_get_one_ext_list(extlists, owner, type, classid);
+	if (matchext) {
+		for (i = match->num_regs, j = 0; i < num_entries &&
+		     i < (match->num_regs + matchext->num_regs) &&
+			j < matchext->num_regs; ++i, ++j) {
+			ptr[i].offset = matchext->extlist[j].reg.addr;
+			ptr[i].value = 0xDEADF00D;
+			ptr[i].flags = matchext->extlist[j].flags;
+			ptr[i].mask = matchext->extlist[j].mask;
+		}
+	}
+	if (i < num_entries)
+		xe_gt_dbg(guc_to_gt(guc), "Got short capture reglist init: %d out %d.\n", i,
+			  num_entries);
+
+	return 0;
+}
+
+static int
+guc_cap_list_num_regs(struct xe_guc_state_capture *gc, u32 owner, u32 type, u32 classid)
+{
+	const struct __guc_mmio_reg_descr_group *match;
+	struct __guc_mmio_reg_descr_group *matchext;
+	int num_regs;
+
+	match = guc_capture_get_one_list(gc->reglists, owner, type, classid);
+	if (!match)
+		return 0;
+
+	num_regs = match->num_regs;
+
+	matchext = guc_capture_get_one_ext_list(gc->extlists, owner, type, classid);
+	if (matchext)
+		num_regs += matchext->num_regs;
+
+	return num_regs;
+}
+
+static int
+guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid,
+			size_t *size, bool is_purpose_est)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
+	int num_regs;
+
+	if (!gc->reglists) {
+		xe_gt_warn(guc_to_gt(guc), "No capture reglist for this device\n");
+		return -ENODEV;
+	}
+
+	if (cache->is_valid) {
+		*size = cache->size;
+		return cache->status;
+	}
+
+	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
+	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
+		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
+			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: global!\n");
+		else
+			xe_gt_warn(guc_to_gt(guc), "Missing capture reglist: %s(%u):%s(%u)!\n",
+				   __stringify_type(type), type,
+				   __stringify_engclass(classid), classid);
+		return -ENODEV;
+	}
+
+	num_regs = guc_cap_list_num_regs(gc, owner, type, classid);
+	/* intentional empty lists can exist depending on hw config */
+	if (!num_regs)
+		return -ENODATA;
+
+	if (size)
+		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
+				   (num_regs * sizeof(struct guc_mmio_reg)));
+
+	return 0;
+}
+
+int
+xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size)
+{
+	return guc_capture_getlistsize(guc, owner, type, classid, size, false);
+}
+
+static void guc_capture_create_prealloc_nodes(struct xe_guc *guc);
+
+int
+xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
+	struct guc_debug_capture_list *listnode;
+	int ret, num_regs;
+	u8 *caplist, *tmp;
+	size_t size = 0;
+
+	if (!gc->reglists)
+		return -ENODEV;
+
+	if (cache->is_valid) {
+		*outptr = cache->ptr;
+		return cache->status;
+	}
+
+	/*
+	 * ADS population of input registers is a good
+	 * time to pre-allocate cachelist output nodes
+	 */
+	guc_capture_create_prealloc_nodes(guc);
+
+	ret = xe_guc_capture_getlistsize(guc, owner, type, classid, &size);
+	if (ret) {
+		cache->is_valid = true;
+		cache->ptr = NULL;
+		cache->size = 0;
+		cache->status = ret;
+		return ret;
+	}
+
+	caplist = kzalloc(size, GFP_KERNEL);
+	if (!caplist) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture list");
+		return -ENOMEM;
+	}
+
+	/* populate capture list header */
+	tmp = caplist;
+	num_regs = guc_cap_list_num_regs(guc->capture, owner, type, classid);
+	listnode = (struct guc_debug_capture_list *)tmp;
+	listnode->header.info = FIELD_PREP(GUC_CAPTURELISTHDR_NUMDESCR, (u32)num_regs);
+
+	/* populate list of register descriptor */
+	tmp += sizeof(struct guc_debug_capture_list);
+	guc_capture_list_init(guc, owner, type, classid, (struct guc_mmio_reg *)tmp, num_regs);
+
+	/* cache this list */
+	cache->is_valid = true;
+	cache->ptr = caplist;
+	cache->size = size;
+	cache->status = 0;
+
+	*outptr = caplist;
+
+	return 0;
+}
+
+int
+xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size)
+{
+	struct xe_guc_state_capture *gc = guc->capture;
+	int tmp = sizeof(u32) * 4;
+	void *null_header;
+
+	if (gc->ads_null_cache) {
+		*outptr = gc->ads_null_cache;
+		*size = tmp;
+		return 0;
+	}
+
+	null_header = kzalloc(tmp, GFP_KERNEL);
+	if (!null_header) {
+		xe_gt_dbg(guc_to_gt(guc), "Failed to alloc cached register capture null list");
+		return -ENOMEM;
+	}
+
+	gc->ads_null_cache = null_header;
+	*outptr = null_header;
+	*size = tmp;
+
+	return 0;
+}
+
+static int
+guc_capture_output_min_size_est(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	int worst_min_size = 0;
+	size_t tmp = 0;
+
+	if (!guc->capture)
+		return -ENODEV;
+
+	/*
+	 * If every single engine-instance suffered a failure in quick succession but
+	 * were all unrelated, then a burst of multiple error-capture events would dump
+	 * registers for every one engine instance, one at a time. In this case, GuC
+	 * would even dump the global-registers repeatedly.
+	 *
+	 * For each engine instance, there would be 1 x guc_state_capture_group_t output
+	 * followed by 3 x guc_state_capture_t lists. The latter is how the register
+	 * dumps are split across different register types (where the '3' are global vs class
+	 * vs instance).
+	 */
+	for_each_hw_engine(hwe, gt, id) {
+		worst_min_size += sizeof(struct guc_state_capture_group_header_t) +
+					 (3 * sizeof(struct guc_state_capture_header_t));
+
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_GLOBAL, 0, &tmp, true))
+			worst_min_size += tmp;
+
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+					     hwe->class, &tmp, true)) {
+			worst_min_size += tmp;
+		}
+		if (!guc_capture_getlistsize(guc, 0, GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+					     hwe->class, &tmp, true)) {
+			worst_min_size += tmp;
+		}
+	}
+
+	return worst_min_size;
+}
+
+/*
+ * Add on a 3x multiplier to allow for multiple back-to-back captures occurring
+ * before the i915 can read the data out and process it
+ */
+#define GUC_CAPTURE_OVERBUFFER_MULTIPLIER 3
+
+static void check_guc_capture_size(struct xe_guc *guc)
+{
+	int min_size = guc_capture_output_min_size_est(guc);
+	int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
+	u32 buffer_size = xe_guc_log_section_size_capture(&guc->log);
+
+	/*
+	 * NOTE: min_size is much smaller than the capture region allocation (DG2: <80K vs 1MB)
+	 * Additionally, its based on space needed to fit all engines getting reset at once
+	 * within the same G2H handler task slot. This is very unlikely. However, if GuC really
+	 * does run out of space for whatever reason, we will see an separate warning message
+	 * when processing the G2H event capture-notification, search for:
+	 * xe_guc_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
+	 */
+	if (min_size < 0)
+		xe_gt_warn(guc_to_gt(guc), "Failed to calculate error state capture buffer minimum size: %d!\n",
+			   min_size);
+	else if (min_size > buffer_size)
+		xe_gt_warn(guc_to_gt(guc), "Error state capture buffer maybe small: %d < %d\n",
+			   buffer_size, min_size);
+	else if (spare_size > buffer_size)
+		xe_gt_dbg(guc_to_gt(guc), "Error state capture buffer lacks spare size: %d < %d (min = %d)\n",
+			  buffer_size, spare_size, min_size);
+}
+
+/*
+ * KMD Init time flows:
+ * --------------------
+ *     --> alloc A: GuC input capture regs lists (registered to GuC via ADS).
+ *                  xe_guc_ads acquires the register lists by calling
+ *                  xe_guc_capture_list_size and xe_guc_capture_list_get 'n' times,
+ *                  where n = 1 for global-reg-list +
+ *                            num_engine_classes for class-reg-list +
+ *                            num_engine_classes for instance-reg-list
+ *                               (since all instances of the same engine-class type
+ *                                have an identical engine-instance register-list).
+ *                  ADS module also calls separately for PF vs VF.
+ *
+ *     --> alloc B: GuC output capture buf (registered via guc_init_params(log_param))
+ *                  Size = #define CAPTURE_BUFFER_SIZE (warns if on too-small)
+ *                  Note2: 'x 3' to hold multiple capture groups
+ *
+ * GUC Runtime notify capture:
+ * --------------------------
+ *     --> G2H STATE_CAPTURE_NOTIFICATION
+ *                   L--> xe_guc_capture_process
+ *                           L--> Loop through B (head..tail) and for each engine instance's
+ *                                err-state-captured register-list we find, we alloc 'C':
+ *      --> alloc C: A capture-output-node structure that includes misc capture info along
+ *                   with 3 register list dumps (global, engine-class and engine-instance)
+ *                   This node is created from a pre-allocated list of blank nodes in
+ *                   guc->capture->cachelist and populated with the error-capture
+ *                   data from GuC and then it's added into guc->capture->outlist linked
+ *                   list. This list is used for matchup and printout by xe_devcoredump_read
+ *                   and xe_hw_engine_snapshot_print, (when user invokes the devcoredump sysfs).
+ *
+ * GUC --> notify context reset:
+ * -----------------------------
+ *     --> G2H CONTEXT RESET
+ *                   L--> guc_handle_context_reset --> i915_capture_error_state
+ *                          L--> devcoredump_snapshot(..IS_GUC_CAPTURE)
+ *                               --> xe_hw_engine_snapshot_capture(..IS_GUC_CAPTURE)
+ *                               L--> xe_hw_engine_snapshot_from_capture is where
+ *                                    detach C from internal linked list and add it into
+ *                                    xe_hw_engine_snapshot struct (if the context and
+ *                                    engine of the event notification matches a node
+ *                                    in the link list).
+ *
+ * User Sysfs / Debugfs
+ * --------------------
+ *      --> xe_devcoredump_read->
+ *             L--> xxx_snapshot_print
+ *                    L--> xe_hw_engine_snapshot_print
+ *                         register lists values of the xe_hw_engine_snapshot
+ *                         saved from the error-engine-dump.
+ *
+ */
+
+static int guc_capture_buf_cnt(struct __guc_capture_bufstate *buf)
+{
+	if (buf->wr >= buf->rd)
+		return (buf->wr - buf->rd);
+	return (buf->size - buf->rd) + buf->wr;
+}
+
+static int guc_capture_buf_cnt_to_end(struct __guc_capture_bufstate *buf)
+{
+	if (buf->rd > buf->wr)
+		return (buf->size - buf->rd);
+	return (buf->wr - buf->rd);
+}
+
+/*
+ * GuC's error-capture output is a ring buffer populated in a byte-stream fashion:
+ *
+ * The GuC Log buffer region for error-capture is managed like a ring buffer.
+ * The GuC firmware dumps error capture logs into this ring in a byte-stream flow.
+ * Additionally, as per the current and foreseeable future, all packed error-
+ * capture output structures are dword aligned.
+ *
+ * That said, if the GuC firmware is in the midst of writing a structure that is larger
+ * than one dword but the tail end of the err-capture buffer-region has lesser space left,
+ * we would need to extract that structure one dword at a time straddled across the end,
+ * onto the start of the ring.
+ *
+ * Below function, guc_capture_log_remove_dw is a helper for that. All callers of this
+ * function would typically do a straight-up memcpy from the ring contents and will only
+ * call this helper if their structure-extraction is straddling across the end of the
+ * ring. GuC firmware does not add any padding. The reason for the no-padding is to ease
+ * scalability for future expansion of output data types without requiring a redesign
+ * of the flow controls.
+ */
+static int
+guc_capture_log_remove_dw(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			  u32 *dw)
+{
+	int tries = 2;
+	int avail = 0;
+	u32 *src_data;
+
+	if (!guc_capture_buf_cnt(buf))
+		return 0;
+
+	while (tries--) {
+		avail = guc_capture_buf_cnt_to_end(buf);
+		if (avail >= sizeof(u32)) {
+			src_data = (u32 *)(buf->data + buf->rd);
+			*dw = *src_data;
+			buf->rd += 4;
+			return 4;
+		}
+		if (avail)
+			xe_gt_dbg(guc_to_gt(guc), "Register capture log not dword aligned, skipping.\n");
+		buf->rd = 0;
+	}
+
+	return 0;
+}
+
+static bool
+guc_capture_data_extracted(struct __guc_capture_bufstate *b,
+			   int size, void *dest)
+{
+	if (guc_capture_buf_cnt_to_end(b) >= size) {
+		memcpy(dest, (b->data + b->rd), size);
+		b->rd += size;
+		return true;
+	}
+	return false;
+}
+
+static int
+guc_capture_log_get_group_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			      struct guc_state_capture_group_header_t *ghdr)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_state_capture_group_header_t);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(buf, fullsize, (void *)ghdr))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &ghdr->owner);
+	read += guc_capture_log_remove_dw(guc, buf, &ghdr->info);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static int
+guc_capture_log_get_data_hdr(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_state_capture_header_t *hdr)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_state_capture_header_t);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(buf, fullsize, (void *)hdr))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->owner);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->info);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->lrca);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->guc_id);
+	read += guc_capture_log_remove_dw(guc, buf, &hdr->num_mmios);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static int
+guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *buf,
+			     struct guc_mmio_reg *reg)
+{
+	int read = 0;
+	int fullsize = sizeof(struct guc_mmio_reg);
+
+	if (fullsize > guc_capture_buf_cnt(buf))
+		return -1;
+
+	if (guc_capture_data_extracted(buf, fullsize, (void *)reg))
+		return 0;
+
+	read += guc_capture_log_remove_dw(guc, buf, &reg->offset);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->value);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->flags);
+	read += guc_capture_log_remove_dw(guc, buf, &reg->mask);
+	if (read != fullsize)
+		return -1;
+
+	return 0;
+}
+
+static void
+guc_capture_delete_one_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+{
+	int i;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i)
+		kfree(node->reginfo[i].regs);
+	list_del(&node->link);
+	kfree(node);
+}
+
+static void
+guc_capture_delete_prealloc_nodes(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *n, *ntmp;
+
+	/*
+	 * NOTE: At the end of driver operation, we must assume that we
+	 * have prealloc nodes in both the cachelist as well as outlist
+	 * if unclaimed error capture events occurred prior to shutdown.
+	 */
+	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link)
+		guc_capture_delete_one_node(guc, n);
+
+	list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link)
+		guc_capture_delete_one_node(guc, n);
+}
+
+static void
+guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
+			     struct list_head *list)
+{
+	list_add_tail(&node->link, list);
+}
+
+static void
+guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
+				struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->outlist);
+}
+
+static void
+guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
+				  struct __guc_capture_parsed_output *node)
+{
+	guc_capture_add_node_to_list(node, &gc->cachelist);
+}
+
+static void
+guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
+{
+	struct guc_mmio_reg *tmp[GUC_CAPTURE_LIST_TYPE_MAX];
+	int i;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		tmp[i] = node->reginfo[i].regs;
+		memset(tmp[i], 0, sizeof(struct guc_mmio_reg) *
+		       guc->capture->max_mmio_per_node);
+	}
+	memset(node, 0, sizeof(*node));
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i)
+		node->reginfo[i].regs = tmp[i];
+
+	INIT_LIST_HEAD(&node->link);
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_get_prealloc_node(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *found = NULL;
+
+	if (!list_empty(&guc->capture->cachelist)) {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		/* get first avail node from the cache list */
+		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
+			found = n;
+			list_del(&n->link);
+			break;
+		}
+	} else {
+		struct __guc_capture_parsed_output *n, *ntmp;
+
+		/* traverse down and steal back the oldest node already allocated */
+		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+			found = n;
+		}
+		if (found)
+			list_del(&found->link);
+	}
+	if (found)
+		guc_capture_init_node(guc, found);
+
+	return found;
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_alloc_one_node(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *new;
+	int i;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		new->reginfo[i].regs = kcalloc(guc->capture->max_mmio_per_node,
+					       sizeof(struct guc_mmio_reg), GFP_KERNEL);
+		if (!new->reginfo[i].regs) {
+			while (i)
+				kfree(new->reginfo[--i].regs);
+			kfree(new);
+			return NULL;
+		}
+	}
+	guc_capture_init_node(guc, new);
+
+	return new;
+}
+
+static struct __guc_capture_parsed_output *
+guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
+		       u32 keep_reglist_mask)
+{
+	struct __guc_capture_parsed_output *new;
+	int i;
+
+	new = guc_capture_get_prealloc_node(guc);
+	if (!new)
+		return NULL;
+	if (!original)
+		return new;
+
+	new->is_partial = original->is_partial;
+
+	/* copy reg-lists that we want to clone */
+	for (i = 0; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+		if (keep_reglist_mask & BIT(i)) {
+			XE_WARN_ON(original->reginfo[i].num_regs  >
+				   guc->capture->max_mmio_per_node);
+
+			memcpy(new->reginfo[i].regs, original->reginfo[i].regs,
+			       original->reginfo[i].num_regs * sizeof(struct guc_mmio_reg));
+
+			new->reginfo[i].num_regs = original->reginfo[i].num_regs;
+			new->reginfo[i].vfid  = original->reginfo[i].vfid;
+
+			if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS) {
+				new->eng_class = original->eng_class;
+			} else if (i == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
+				new->eng_inst = original->eng_inst;
+				new->guc_id = original->guc_id;
+				new->lrca = original->lrca;
+			}
+		}
+	}
+
+	return new;
+}
+
+static void
+__guc_capture_create_prealloc_nodes(struct xe_guc *guc)
+{
+	struct __guc_capture_parsed_output *node = NULL;
+	int i;
+
+	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
+		node = guc_capture_alloc_one_node(guc);
+		if (!node) {
+			xe_gt_warn(guc_to_gt(guc), "Register capture pre-alloc-cache failure\n");
+			/* dont free the priors, use what we got and cleanup at shutdown */
+			return;
+		}
+		guc_capture_add_node_to_cachelist(guc->capture, node);
+	}
+}
+
+static int
+guc_get_max_reglist_count(struct xe_guc *guc)
+{
+	int i, j, k, tmp, maxregcount = 0;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
+		for (j = 0; j < GUC_CAPTURE_LIST_TYPE_MAX; ++j) {
+			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
+				if (j == GUC_CAPTURE_LIST_TYPE_GLOBAL && k > 0)
+					continue;
+
+				tmp = guc_cap_list_num_regs(guc->capture, i, j, k);
+				if (tmp > maxregcount)
+					maxregcount = tmp;
+			}
+		}
+	}
+	if (!maxregcount)
+		maxregcount = PREALLOC_NODES_DEFAULT_NUMREGS;
+
+	return maxregcount;
+}
+
+static void
+guc_capture_create_prealloc_nodes(struct xe_guc *guc)
+{
+	/* skip if we've already done the pre-alloc */
+	if (guc->capture->max_mmio_per_node)
+		return;
+
+	guc->capture->max_mmio_per_node = guc_get_max_reglist_count(guc);
+	__guc_capture_create_prealloc_nodes(guc);
+}
+
+static int
+guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *buf)
+{
+	struct guc_state_capture_group_header_t ghdr = {0};
+	struct guc_state_capture_header_t hdr = {0};
+	struct __guc_capture_parsed_output *node = NULL;
+	struct guc_mmio_reg *regs = NULL;
+	int i, numlists, numregs, ret = 0;
+	enum guc_capture_type datatype;
+	struct guc_mmio_reg tmp;
+	bool is_partial = false;
+
+	i = guc_capture_buf_cnt(buf);
+	if (!i)
+		return -ENODATA;
+
+	if (i % sizeof(u32)) {
+		xe_gt_warn(guc_to_gt(guc), "Got mis-aligned register capture entries\n");
+		ret = -EIO;
+		goto bailout;
+	}
+
+	/* first get the capture group header */
+	if (guc_capture_log_get_group_hdr(guc, buf, &ghdr)) {
+		ret = -EIO;
+		goto bailout;
+	}
+	/*
+	 * we would typically expect a layout as below where n would be expected to be
+	 * anywhere between 3 to n where n > 3 if we are seeing multiple dependent engine
+	 * instances being reset together.
+	 * ____________________________________________
+	 * | Capture Group                            |
+	 * | ________________________________________ |
+	 * | | Capture Group Header:                | |
+	 * | |  - num_captures = 5                  | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture1:                            | |
+	 * | |  Hdr: GLOBAL, numregs=a              | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... rega           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture2:                            | |
+	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=b| |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regb           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture3:                            | |
+	 * | |  Hdr: INSTANCE=RCS, numregs=c        | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regc           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture4:                            | |
+	 * | |  Hdr: CLASS=RENDER/COMPUTE, numregs=d| |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... regd           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * | ________________________________________ |
+	 * | | Capture5:                            | |
+	 * | |  Hdr: INSTANCE=CCS0, numregs=e       | |
+	 * | | ____________________________________ | |
+	 * | | | Reglist                          | | |
+	 * | | | - reg1, reg2, ... rege           | | |
+	 * | | |__________________________________| | |
+	 * | |______________________________________| |
+	 * |__________________________________________|
+	 */
+	is_partial = FIELD_GET(CAP_GRP_HDR_CAPTURE_TYPE, ghdr.info);
+	numlists = FIELD_GET(CAP_GRP_HDR_NUM_CAPTURES, ghdr.info);
+
+	while (numlists--) {
+		if (guc_capture_log_get_data_hdr(guc, buf, &hdr)) {
+			ret = -EIO;
+			break;
+		}
+
+		datatype = FIELD_GET(CAP_HDR_CAPTURE_TYPE, hdr.info);
+		if (datatype > GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE) {
+			/* unknown capture type - skip over to next capture set */
+			numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
+			while (numregs--) {
+				if (guc_capture_log_get_register(guc, buf, &tmp)) {
+					ret = -EIO;
+					break;
+				}
+			}
+			continue;
+		} else if (node) {
+			/*
+			 * Based on the current capture type and what we have so far,
+			 * decide if we should add the current node into the internal
+			 * linked list for match-up when i915_gpu_coredump calls later
+			 * (and alloc a blank node for the next set of reglists)
+			 * or continue with the same node or clone the current node
+			 * but only retain the global or class registers (such as the
+			 * case of dependent engine resets).
+			 */
+			if (datatype == GUC_CAPTURE_LIST_TYPE_GLOBAL) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS &&
+				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS].num_regs) {
+				/* Add to list, clone node and duplicate global list */
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = guc_capture_clone_node(guc, node,
+							      GCAP_PARSED_REGLIST_INDEX_GLOBAL);
+			} else if (datatype == GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE &&
+				   node->reginfo[GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE].num_regs) {
+				/* Add to list, clone node and duplicate global + class lists */
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = guc_capture_clone_node(guc, node,
+							      (GCAP_PARSED_REGLIST_INDEX_GLOBAL |
+							      GCAP_PARSED_REGLIST_INDEX_ENGCLASS));
+			}
+		}
+
+		if (!node) {
+			node = guc_capture_get_prealloc_node(guc);
+			if (!node) {
+				ret = -ENOMEM;
+				break;
+			}
+			if (datatype != GUC_CAPTURE_LIST_TYPE_GLOBAL)
+				xe_gt_dbg(guc_to_gt(guc),
+					  "Register capture missing global dump: %08x!\n",
+					  datatype);
+		}
+		node->is_partial = is_partial;
+		node->reginfo[datatype].vfid = FIELD_GET(CAP_HDR_CAPTURE_VFID, hdr.owner);
+
+		switch (datatype) {
+		case GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE:
+			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
+			node->eng_inst = FIELD_GET(CAP_HDR_ENGINE_INSTANCE, hdr.info);
+			node->lrca = hdr.lrca;
+			node->guc_id = hdr.guc_id;
+			break;
+		case GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS:
+			node->eng_class = FIELD_GET(CAP_HDR_ENGINE_CLASS, hdr.info);
+			break;
+		default:
+			break;
+		}
+
+		numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
+		if (numregs > guc->capture->max_mmio_per_node) {
+			xe_gt_dbg(guc_to_gt(guc), "Register capture list extraction clipped by prealloc!\n");
+			numregs = guc->capture->max_mmio_per_node;
+		}
+		node->reginfo[datatype].num_regs = numregs;
+		regs = node->reginfo[datatype].regs;
+		i = 0;
+		while (numregs--) {
+			if (guc_capture_log_get_register(guc, buf, &regs[i++])) {
+				ret = -EIO;
+				break;
+			}
+		}
+	}
+
+bailout:
+	if (node) {
+		/* If we have data, add to linked list for match-up when i915_gpu_coredump calls */
+		for (i = GUC_CAPTURE_LIST_TYPE_GLOBAL; i < GUC_CAPTURE_LIST_TYPE_MAX; ++i) {
+			if (node->reginfo[i].regs) {
+				guc_capture_add_node_to_outlist(guc->capture, node);
+				node = NULL;
+				break;
+			}
+		}
+		if (node) /* else return it back to cache list */
+			guc_capture_add_node_to_cachelist(guc->capture, node);
+	}
+	return ret;
+}
+
+static int __guc_capture_flushlog_complete(struct xe_guc *guc)
+{
+	u32 action[] = {
+		XE_GUC_ACTION_LOG_BUFFER_FILE_FLUSH_COMPLETE,
+		GUC_CAPTURE_LOG_BUFFER
+	};
+
+	return xe_guc_ct_send_g2h_handler(&guc->ct, action, ARRAY_SIZE(action));
+}
+
+static void __guc_capture_process_output(struct xe_guc *guc)
+{
+	unsigned int buffer_size, read_offset, write_offset, full_count;
+	struct xe_uc *uc = container_of(guc, typeof(*uc), guc);
+	struct guc_log_buffer_state log_buf_state_local;
+	struct guc_log_buffer_state *log_buf_state;
+	struct __guc_capture_bufstate buf;
+	void *src_data = NULL;
+	bool new_overflow;
+	int ret;
+
+	log_buf_state = (struct guc_log_buffer_state *)((ulong)guc->log.bo->vmap.vaddr +
+			(sizeof(struct guc_log_buffer_state) * GUC_CAPTURE_LOG_BUFFER));
+	src_data = (struct guc_log_buffer_state *)((ulong)guc->log.bo->vmap.vaddr +
+		   xe_guc_get_log_buffer_offset(&guc->log, GUC_CAPTURE_LOG_BUFFER));
+
+	/*
+	 * Make a copy of the state structure, inside GuC log buffer
+	 * (which is uncached mapped), on the stack to avoid reading
+	 * from it multiple times.
+	 */
+	memcpy(&log_buf_state_local, log_buf_state, sizeof(struct guc_log_buffer_state));
+
+	buffer_size = xe_guc_get_log_buffer_size(&guc->log, GUC_CAPTURE_LOG_BUFFER);
+	read_offset = log_buf_state_local.read_ptr;
+	write_offset = log_buf_state_local.sampled_write_ptr;
+	full_count = log_buf_state_local.buffer_full_cnt;
+
+	/* Bookkeeping stuff */
+	guc->log.stats[GUC_CAPTURE_LOG_BUFFER].flush += log_buf_state_local.flush_to_file;
+	new_overflow = xe_guc_check_log_buf_overflow(&guc->log, GUC_CAPTURE_LOG_BUFFER,
+						     full_count);
+
+	/* Now copy the actual logs. */
+	if (unlikely(new_overflow)) {
+		/* copy the whole buffer in case of overflow */
+		read_offset = 0;
+		write_offset = buffer_size;
+	} else if (unlikely((read_offset > buffer_size) ||
+			(write_offset > buffer_size))) {
+		xe_gt_err(guc_to_gt(guc),
+			  "Register capture buffer in invalid state: read = 0x%X, size = 0x%X!\n",
+			  read_offset, buffer_size);
+		/* copy whole buffer as offsets are unreliable */
+		read_offset = 0;
+		write_offset = buffer_size;
+	}
+
+	buf.size = buffer_size;
+	buf.rd = read_offset;
+	buf.wr = write_offset;
+	buf.data = src_data;
+
+	if (!guc_read_stopped(guc)) {
+		do {
+			ret = guc_capture_extract_reglists(guc, &buf);
+		} while (ret >= 0);
+	}
+
+	/* Update the state of log buffer err-cap state */
+	log_buf_state->read_ptr = write_offset;
+	log_buf_state->flush_to_file = 0;
+	__guc_capture_flushlog_complete(guc);
+}
+
+#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
+static void cp_reg_to_snapshot(u32 offset, u32 value, struct snap_shot_regs *regs)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(capture_engine_reg); i++)
+		if (offset == capture_engine_reg[i].reg.addr) {
+			u32 *field = (u32 *)((uintptr_t)regs + capture_engine_reg[i].dst_offset);
+			*field = value;
+			return;
+		}
+}
+
+static void guc_capture_find_ecode(struct __guc_capture_parsed_output *node,
+				   struct xe_hw_engine_snapshot *snapshot)
+{
+	struct gcap_reg_list_info *reginfo;
+	struct guc_mmio_reg *regs;
+	int i;
+
+	if (!node)
+		return;
+
+	reginfo = node->reginfo + GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE;
+	regs = reginfo->regs;
+	for (i = 0; i < reginfo->num_regs; i++)
+		cp_reg_to_snapshot(regs[i].offset, regs[i].value, &snapshot->reg);
+
+	snapshot->reg.ring_head &= HEAD_ADDR;
+	snapshot->reg.ring_tail &= TAIL_ADDR;
+}
+
+/**
+ * xe_hw_engine_snapshot_from_capture - Take a quick snapshot of the HW Engine.
+ * @hwe: Xe HW Engine.
+ *
+ * This can be printed out in a later stage like during dev_coredump
+ * analysis.
+ *
+ * Returns: a Xe HW Engine snapshot object that must be freed by the
+ * caller, using `xe_hw_engine_snapshot_free`.
+ */
+void
+xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
+{
+	struct xe_gt *gt = hwe->gt;
+	struct xe_guc *guc = &gt->uc.guc;
+	struct __guc_capture_parsed_output *n, *ntmp;
+
+	if (!guc->capture)
+		return;
+
+	/*
+	 * Look for a matching GuC reported error capture node from
+	 * the internal output link-list based on lrca, guc-id and engine
+	 * identification.
+	 */
+	list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
+		u32 hwe_guc_class = xe_engine_class_to_guc_class(hwe->class);
+
+		if (n->eng_class == hwe_guc_class && n->eng_inst == hwe->instance) {
+			guc_capture_find_ecode(n, snapshot);
+			list_del(&n->link);
+			return;
+		}
+	}
+}
+#endif /* CONFIG_DRM_XE_CAPTURE_ERROR */
+
+void xe_guc_capture_process(struct xe_guc *guc)
+{
+	if (guc->capture)
+		__guc_capture_process_output(guc);
+}
+
+static void
+guc_capture_free_ads_cache(struct xe_guc_state_capture *gc)
+{
+	int i, j, k;
+	struct __guc_capture_ads_cache *cache;
+
+	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; ++i) {
+		for (j = 0; j < GUC_CAPTURE_LIST_TYPE_MAX; ++j) {
+			for (k = 0; k < GUC_MAX_ENGINE_CLASSES; ++k) {
+				cache = &gc->ads_cache[i][j][k];
+				if (cache->is_valid)
+					kfree(cache->ptr);
+			}
+		}
+	}
+	kfree(gc->ads_null_cache);
+}
+
+void xe_guc_capture_destroy(struct xe_guc *guc)
+{
+	if (!guc->capture)
+		return;
+
+	guc_capture_free_ads_cache(guc->capture);
+
+	guc_capture_delete_prealloc_nodes(guc);
+
+	guc_capture_free_extlists(guc->capture->extlists);
+	kfree(guc->capture->extlists);
+
+	kfree(guc->capture);
+	guc->capture = NULL;
+}
+
+int xe_guc_capture_init(struct xe_guc *guc)
+{
+	guc->capture = kzalloc(sizeof(*guc->capture), GFP_KERNEL);
+	if (!guc->capture)
+		return -ENOMEM;
+
+	guc->capture->reglists = guc_capture_get_device_reglist(guc);
+
+	INIT_LIST_HEAD(&guc->capture->outlist);
+	INIT_LIST_HEAD(&guc->capture->cachelist);
+
+	check_guc_capture_size(guc);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
new file mode 100644
index 000000000000..d713c5bd3067
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021-2021 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_H
+#define _XE_GUC_CAPTURE_H
+
+#include <linux/types.h>
+#include "xe_exec_queue_types.h"
+
+struct drm_xe_error_state_buf;
+struct guc_gt_system_info;
+struct xe_hw_engine;
+struct xe_hw_engine_snapshot;
+
+struct xe_gt;
+struct xe_guc;
+
+bool xe_guc_capture_is_matching_engine(struct xe_gt *gt, struct xe_exec_queue *ce,
+				       struct xe_hw_engine *engine);
+void xe_guc_capture_process(struct xe_guc *guc);
+int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type, u32 classid, void **outptr);
+int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type, u32 classid, size_t *size);
+int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
+void xe_guc_capture_destroy(struct xe_guc *guc);
+int xe_guc_capture_init(struct xe_guc *guc);
+void xe_hw_engine_snapshot_from_capture(struct xe_hw_engine *hwe,
+					struct xe_hw_engine_snapshot *snapshot);
+void xe_hw_engine_snapshot_from_engine(struct xe_hw_engine *hwe,
+				       struct xe_hw_engine_snapshot *snapshot);
+
+#endif /* _XE_GUC_CAPTURE_H */
diff --git a/drivers/gpu/drm/xe/xe_guc_capture_fwif.h b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
new file mode 100644
index 000000000000..868773bcd17e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_capture_fwif.h
@@ -0,0 +1,227 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2021-2022 Intel Corporation
+ */
+
+#ifndef _XE_GUC_CAPTURE_FWIF_H
+#define _XE_GUC_CAPTURE_FWIF_H
+
+#include <linux/types.h>
+#include "regs/xe_reg_defs.h"
+#include "xe_guc_fwif.h"
+
+struct xe_guc;
+struct file;
+
+/*
+ * struct __guc_capture_bufstate
+ *
+ * Book-keeping structure used to track read and write pointers
+ * as we extract error capture data from the GuC-log-buffer's
+ * error-capture region as a stream of dwords.
+ */
+struct __guc_capture_bufstate {
+	u32 size;
+	void *data;
+	u32 rd;
+	u32 wr;
+};
+
+/*
+ * struct __guc_capture_parsed_output - extracted error capture node
+ *
+ * A single unit of extracted error-capture output data grouped together
+ * at an engine-instance level. We keep these nodes in a linked list.
+ * See cachelist and outlist below.
+ */
+struct __guc_capture_parsed_output {
+	/*
+	 * A single set of 3 capture lists: a global-list
+	 * an engine-class-list and an engine-instance list.
+	 * outlist in __guc_capture_parsed_output will keep
+	 * a linked list of these nodes that will eventually
+	 * be detached from outlist and attached into to
+	 * i915_gpu_codedump in response to a context reset
+	 */
+	struct list_head link;
+	bool is_partial;
+	u32 eng_class;
+	u32 eng_inst;
+	u32 guc_id;
+	u32 lrca;
+	struct gcap_reg_list_info {
+		u32 vfid;
+		u32 num_regs;
+		struct guc_mmio_reg *regs;
+	} reginfo[GUC_CAPTURE_LIST_TYPE_MAX];
+#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_CAPTURE_LIST_TYPE_GLOBAL)
+#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS)
+#define GCAP_PARSED_REGLIST_INDEX_ENGINST  BIT(GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE)
+};
+
+/*
+ * struct guc_debug_capture_list_header / struct guc_debug_capture_list
+ *
+ * As part of ADS registration, these header structures (followed by
+ * an array of 'struct guc_mmio_reg' entries) are used to register with
+ * GuC microkernel the list of registers we want it to dump out prior
+ * to a engine reset.
+ */
+struct guc_debug_capture_list_header {
+	u32 info;
+#define GUC_CAPTURELISTHDR_NUMDESCR GENMASK(15, 0)
+} __packed;
+
+struct guc_debug_capture_list {
+	struct guc_debug_capture_list_header header;
+	struct guc_mmio_reg regs[];
+} __packed;
+
+/*
+ * struct __guc_mmio_reg_descr / struct __guc_mmio_reg_descr_group
+ *
+ * xe_guc_capture module uses these structures to maintain static
+ * tables (per unique platform) that consists of lists of registers
+ * (offsets, names, flags,...) that are used at the ADS regisration
+ * time as well as during runtime processing and reporting of error-
+ * capture states generated by GuC just prior to engine reset events.
+ */
+struct __guc_mmio_reg_descr {
+	struct xe_reg reg;
+	u32 flags;
+	u32 mask;
+	const char *regname;
+};
+
+struct __guc_mmio_reg_descr_group {
+	const struct __guc_mmio_reg_descr *list;
+	u32 num_regs;
+	u32 owner; /* see enum guc_capture_owner */
+	u32 type; /* see enum guc_capture_type */
+	u32 engine; /* as per MAX_ENGINE_CLASS */
+	struct __guc_mmio_reg_descr *extlist; /* only used for steered registers */
+};
+
+/*
+ * struct guc_state_capture_header_t / struct guc_state_capture_t /
+ * guc_state_capture_group_header_t / guc_state_capture_group_t
+ *
+ * Prior to resetting engines that have hung or faulted, GuC microkernel
+ * reports the engine error-state (register values that was read) by
+ * logging them into the shared GuC log buffer using these hierarchy
+ * of structures.
+ */
+struct guc_state_capture_header_t {
+	u32 owner;
+#define CAP_HDR_CAPTURE_VFID GENMASK(7, 0)
+	u32 info;
+#define CAP_HDR_CAPTURE_TYPE GENMASK(3, 0) /* see enum guc_capture_type */
+#define CAP_HDR_ENGINE_CLASS GENMASK(7, 4) /* see GUC_MAX_ENGINE_CLASSES */
+#define CAP_HDR_ENGINE_INSTANCE GENMASK(11, 8)
+	u32 lrca; /* if type-instance, LRCA (address) that hung, else set to ~0 */
+	u32 guc_id; /* if type-instance, context index of hung context, else set to ~0 */
+	u32 num_mmios;
+#define CAP_HDR_NUM_MMIOS GENMASK(9, 0)
+} __packed;
+
+struct guc_state_capture_t {
+	struct guc_state_capture_header_t header;
+	struct guc_mmio_reg mmio_entries[];
+} __packed;
+
+enum guc_capture_group_types {
+	GUC_STATE_CAPTURE_GROUP_TYPE_FULL,
+	GUC_STATE_CAPTURE_GROUP_TYPE_PARTIAL,
+	GUC_STATE_CAPTURE_GROUP_TYPE_MAX,
+};
+
+struct guc_state_capture_group_header_t {
+	u32 owner;
+#define CAP_GRP_HDR_CAPTURE_VFID GENMASK(7, 0)
+	u32 info;
+#define CAP_GRP_HDR_NUM_CAPTURES GENMASK(7, 0)
+#define CAP_GRP_HDR_CAPTURE_TYPE GENMASK(15, 8) /* guc_capture_group_types */
+} __packed;
+
+/* this is the top level structure where an error-capture dump starts */
+struct guc_state_capture_group_t {
+	struct guc_state_capture_group_header_t grp_header;
+	struct guc_state_capture_t capture_entries[];
+} __packed;
+
+/*
+ * struct __guc_capture_ads_cache
+ *
+ * A structure to cache register lists that were populated and registered
+ * with GuC at startup during ADS registration. This allows much quicker
+ * GuC resets without re-parsing all the tables for the given gt.
+ */
+struct __guc_capture_ads_cache {
+	bool is_valid;
+	void *ptr;
+	size_t size;
+	int status;
+};
+
+/**
+ * struct xe_guc_state_capture
+ *
+ * Internal context of the xe_guc_capture module.
+ */
+struct xe_guc_state_capture {
+	/**
+	 * @reglists: static table of register lists used for error-capture state.
+	 */
+	const struct __guc_mmio_reg_descr_group *reglists;
+
+	/**
+	 * @extlists: allocated table of steered register lists used for error-capture state.
+	 *
+	 * NOTE: steered registers have multiple instances depending on the HW configuration
+	 * (slices or dual-sub-slices) and thus depends on HW fuses discovered at startup
+	 */
+	struct __guc_mmio_reg_descr_group *extlists;
+
+	/**
+	 * @ads_cache: cached register lists that is ADS format ready
+	 */
+	struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
+						[GUC_CAPTURE_LIST_TYPE_MAX]
+						[GUC_MAX_ENGINE_CLASSES];
+
+	/**
+	 * @ads_null_cache: ADS null cache.
+	 */
+	void *ads_null_cache;
+
+	/**
+	 * @cachelist: Pool of pre-allocated nodes for error capture output
+	 *
+	 * We need this pool of pre-allocated nodes because we cannot
+	 * dynamically allocate new nodes when receiving the G2H notification
+	 * because the event handlers for all G2H event-processing is called
+	 * by the ct processing worker queue and when that queue is being
+	 * processed, there is no absoluate guarantee that we are not in the
+	 * midst of a GT reset operation (which doesn't allow allocations).
+	 */
+	struct list_head cachelist;
+#define PREALLOC_NODES_MAX_COUNT (3 * GUC_MAX_ENGINE_CLASSES * GUC_MAX_INSTANCES_PER_CLASS)
+#define PREALLOC_NODES_DEFAULT_NUMREGS 64
+
+	/**
+	 * @max_mmio_per_node: Max MMIO per node.
+	 */
+	int max_mmio_per_node;
+
+	/**
+	 * @outlist: Pool of pre-allocated nodes for error capture output
+	 *
+	 * A linked list of parsed GuC error-capture output data before
+	 * reporting with formatting via i915_gpu_coredump. Each node in this linked list shall
+	 * contain a single engine-capture including global, engine-class and
+	 * engine-instance register dumps as per guc_capture_parsed_output_node
+	 */
+	struct list_head outlist;
+};
+
+#endif /* _XE_GUC_CAPTURE_FWIF_H */
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 4cde93c18a2d..3586306b23f1 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -948,6 +948,8 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
 		/* Selftest only at the moment */
 		break;
 	case XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION:
+		ret = xe_guc_error_capture_handler(guc, payload, adj_len);
+		break;
 	case XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE:
 		/* FIXME: Handle this */
 		break;
diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
index 4dd5a88a7826..e40c89a76bef 100644
--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
@@ -10,6 +10,8 @@
 
 #include "abi/guc_klvs_abi.h"
 
+#include "xe_hw_engine_types.h"
+
 #define G2H_LEN_DW_SCHED_CONTEXT_MODE_SET	4
 #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
 #define G2H_LEN_DW_TLB_INVALIDATE		3
@@ -163,6 +165,8 @@ struct guc_mmio_reg {
 #define GUC_REGSET_MASKED		BIT(0)
 #define GUC_REGSET_MASKED_WITH_VALUE	BIT(2)
 #define GUC_REGSET_RESTORE_ONLY		BIT(3)
+#define GUC_REGSET_STEERING_GROUP       GENMASK(15, 12)
+#define GUC_REGSET_STEERING_INSTANCE    GENMASK(23, 20)
 } __packed;
 
 /* GuC register sets */
@@ -191,6 +195,23 @@ enum {
 	GUC_CAPTURE_LIST_INDEX_MAX = 2,
 };
 
+/*Register-types of GuC capture register lists */
+enum guc_capture_type {
+	GUC_CAPTURE_LIST_TYPE_GLOBAL = 0,
+	GUC_CAPTURE_LIST_TYPE_ENGINE_CLASS,
+	GUC_CAPTURE_LIST_TYPE_ENGINE_INSTANCE,
+	GUC_CAPTURE_LIST_TYPE_MAX,
+};
+
+/* Class indecies for capture_class and capture_instance arrays */
+enum {
+	GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE = 0,
+	GUC_CAPTURE_LIST_CLASS_VIDEO = 1,
+	GUC_CAPTURE_LIST_CLASS_VIDEOENHANCE = 2,
+	GUC_CAPTURE_LIST_CLASS_BLITTER = 3,
+	GUC_CAPTURE_LIST_CLASS_GSC_OTHER = 4,
+};
+
 /* GuC Additional Data Struct */
 struct guc_ads {
 	struct guc_mmio_reg_set reg_state_list[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
@@ -222,6 +243,54 @@ struct guc_engine_usage {
 	struct guc_engine_usage_record engines[GUC_MAX_ENGINE_CLASSES][GUC_MAX_INSTANCES_PER_CLASS];
 } __packed;
 
+/* GuC logging structures */
+
+enum guc_log_buffer_type {
+	GUC_DEBUG_LOG_BUFFER,
+	GUC_CRASH_DUMP_LOG_BUFFER,
+	GUC_CAPTURE_LOG_BUFFER,
+	GUC_MAX_LOG_BUFFER
+};
+
+/*
+ * struct guc_log_buffer_state - GuC log buffer state
+ *
+ * Below state structure is used for coordination of retrieval of GuC firmware
+ * logs. Separate state is maintained for each log buffer type.
+ * read_ptr points to the location where i915 read last in log buffer and
+ * is read only for GuC firmware. write_ptr is incremented by GuC with number
+ * of bytes written for each log entry and is read only for i915.
+ * When any type of log buffer becomes half full, GuC sends a flush interrupt.
+ * GuC firmware expects that while it is writing to 2nd half of the buffer,
+ * first half would get consumed by Host and then get a flush completed
+ * acknowledgment from Host, so that it does not end up doing any overwrite
+ * causing loss of logs. So when buffer gets half filled & i915 has requested
+ * for interrupt, GuC will set flush_to_file field, set the sampled_write_ptr
+ * to the value of write_ptr and raise the interrupt.
+ * On receiving the interrupt i915 should read the buffer, clear flush_to_file
+ * field and also update read_ptr with the value of sample_write_ptr, before
+ * sending an acknowledgment to GuC. marker & version fields are for internal
+ * usage of GuC and opaque to i915. buffer_full_cnt field is incremented every
+ * time GuC detects the log buffer overflow.
+ */
+struct guc_log_buffer_state {
+	u32 marker[2];
+	u32 read_ptr;
+	u32 write_ptr;
+	u32 size;
+	u32 sampled_write_ptr;
+	u32 wrap_offset;
+	union {
+		struct {
+			u32 flush_to_file:1;
+			u32 buffer_full_cnt:4;
+			u32 reserved:27;
+		};
+		u32 flags;
+	};
+	u32 version;
+} __packed;
+
 /* This action will be programmed in C1BC - SOFT_SCRATCH_15_REG */
 enum xe_guc_recv_message {
 	XE_GUC_RECV_MSG_CRASH_DUMP_POSTED = BIT(1),
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index bcd2f4d34081..93d44d2d6ac8 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -9,9 +9,30 @@
 
 #include "xe_bo.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_map.h"
 #include "xe_module.h"
 
+#define MISSING_CASE(x) WARN(1, "Missing case (%s == %ld)\n", \
+			     __stringify(x), (long)(x))
+
+#define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	CRASH_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE	DEBUG_BUFFER_SIZE
+#define GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE	CAPTURE_BUFFER_SIZE
+
+struct guc_log_section {
+	u32 max;
+	u32 flag;
+	u32 default_val;
+	const char *name;
+};
+
+static struct xe_gt *
+guc_to_gt(struct xe_guc *guc)
+{
+	return container_of(guc, struct xe_gt, uc.guc);
+}
+
 static struct xe_gt *
 log_to_gt(struct xe_guc_log *log)
 {
@@ -95,3 +116,161 @@ int xe_guc_log_init(struct xe_guc_log *log)
 
 	return 0;
 }
+
+static void _guc_log_init_sizes(struct xe_guc_log *log)
+{
+	struct xe_guc *guc = log_to_guc(log);
+	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
+		{
+			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE,
+			"crash dump"
+		},
+		{
+			GUC_LOG_DEBUG_MASK >> GUC_LOG_DEBUG_SHIFT,
+			GUC_LOG_LOG_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_DEBUG_BUFFER_SIZE,
+			"debug",
+		},
+		{
+			GUC_LOG_CAPTURE_MASK >> GUC_LOG_CAPTURE_SHIFT,
+			GUC_LOG_CAPTURE_ALLOC_UNITS,
+			GUC_LOG_DEFAULT_CAPTURE_BUFFER_SIZE,
+			"capture",
+		}
+	};
+	int i;
+
+	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++)
+		log->sizes[i].bytes = sections[i].default_val;
+
+	/* If debug size > 1MB then bump default crash size to keep the same units */
+	if (log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes >= SZ_1M &&
+	    GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE < SZ_1M)
+		log->sizes[GUC_LOG_SECTIONS_CRASH].bytes = SZ_1M;
+
+	/* Prepare the GuC API structure fields: */
+	for (i = 0; i < GUC_LOG_SECTIONS_LIMIT; i++) {
+		/* Convert to correct units */
+		if ((log->sizes[i].bytes % SZ_1M) == 0) {
+			log->sizes[i].units = SZ_1M;
+			log->sizes[i].flag = sections[i].flag;
+		} else {
+			log->sizes[i].units = SZ_4K;
+			log->sizes[i].flag = 0;
+		}
+
+		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
+			xe_gt_err(guc_to_gt(guc), "Mis-aligned log %s size: 0x%X vs 0x%X!\n",
+				  sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
+		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
+
+		if (!log->sizes[i].count) {
+			xe_gt_err(guc_to_gt(guc), "Zero log %s size!\n", sections[i].name);
+		} else {
+			/* Size is +1 unit */
+			log->sizes[i].count--;
+		}
+
+		/* Clip to field size */
+		if (log->sizes[i].count > sections[i].max) {
+			xe_gt_err(guc_to_gt(guc), "log %s size too large: %d vs %d!\n",
+				  sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
+			log->sizes[i].count = sections[i].max;
+		}
+	}
+
+	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
+		xe_gt_err(guc_to_gt(guc), "Unit mismatch for crash and debug sections: %d vs %d!\n",
+			  log->sizes[GUC_LOG_SECTIONS_CRASH].units,
+			  log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
+		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
+		log->sizes[GUC_LOG_SECTIONS_CRASH].count = 0;
+	}
+
+	log->sizes_initialised = true;
+}
+
+static void guc_log_init_sizes(struct xe_guc_log *log)
+{
+	if (log->sizes_initialised)
+		return;
+
+	_guc_log_init_sizes(log);
+}
+
+static u32 xe_guc_log_section_size_crash(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_CRASH].bytes;
+}
+
+static u32 xe_guc_log_section_size_debug(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_DEBUG].bytes;
+}
+
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log)
+{
+	guc_log_init_sizes(log);
+
+	return log->sizes[GUC_LOG_SECTIONS_CAPTURE].bytes;
+}
+
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log, enum guc_log_buffer_type type,
+				   unsigned int full_cnt)
+{
+	unsigned int prev_full_cnt = log->stats[type].sampled_overflow;
+	bool overflow = false;
+
+	if (full_cnt != prev_full_cnt) {
+		overflow = true;
+
+		log->stats[type].overflow = full_cnt;
+		log->stats[type].sampled_overflow += full_cnt - prev_full_cnt;
+
+		if (full_cnt < prev_full_cnt) {
+			/* buffer_full_cnt is a 4 bit counter */
+			log->stats[type].sampled_overflow += 16;
+		}
+		xe_gt_notice_ratelimited(log_to_gt(log), "log buffer overflow\n");
+	}
+
+	return overflow;
+}
+
+unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
+					enum guc_log_buffer_type type)
+{
+	switch (type) {
+	case GUC_DEBUG_LOG_BUFFER:
+		return xe_guc_log_section_size_debug(log);
+	case GUC_CRASH_DUMP_LOG_BUFFER:
+		return xe_guc_log_section_size_crash(log);
+	case GUC_CAPTURE_LOG_BUFFER:
+		return xe_guc_log_section_size_capture(log);
+	default:
+		MISSING_CASE(type);
+	}
+
+	return 0;
+}
+
+size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
+				    enum guc_log_buffer_type type)
+{
+	enum guc_log_buffer_type i;
+	size_t offset = PAGE_SIZE;/* for the log_buffer_states */
+
+	for (i = GUC_DEBUG_LOG_BUFFER; i < GUC_MAX_LOG_BUFFER; ++i) {
+		if (i == type)
+			break;
+		offset += xe_guc_get_log_buffer_size(log, i);
+	}
+
+	return offset;
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
index 2d25ab28b4b3..6a70185ce306 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.h
+++ b/drivers/gpu/drm/xe/xe_guc_log.h
@@ -7,6 +7,7 @@
 #define _XE_GUC_LOG_H_
 
 #include "xe_guc_log_types.h"
+#include "xe_guc_types.h"
 
 struct drm_printer;
 
@@ -36,6 +37,11 @@ struct drm_printer;
 #define GUC_VERBOSITY_TO_LOG_LEVEL(x)	((x) + 2)
 #define GUC_LOG_LEVEL_MAX GUC_VERBOSITY_TO_LOG_LEVEL(GUC_LOG_VERBOSITY_MAX)
 
+static inline struct xe_guc *log_to_guc(struct xe_guc_log *log)
+{
+	return container_of(log, struct xe_guc, log);
+}
+
 int xe_guc_log_init(struct xe_guc_log *log);
 void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
 
@@ -45,4 +51,13 @@ xe_guc_log_get_level(struct xe_guc_log *log)
 	return log->level;
 }
 
+u32 xe_guc_log_section_size_capture(struct xe_guc_log *log);
+
+bool xe_guc_check_log_buf_overflow(struct xe_guc_log *log,
+				   enum guc_log_buffer_type type,
+				   unsigned int full_cnt);
+unsigned int xe_guc_get_log_buffer_size(struct xe_guc_log *log,
+					enum guc_log_buffer_type type);
+size_t xe_guc_get_log_buffer_offset(struct xe_guc_log *log,
+				    enum guc_log_buffer_type type);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_log_types.h b/drivers/gpu/drm/xe/xe_guc_log_types.h
index 125080d138a7..0d9489ff69aa 100644
--- a/drivers/gpu/drm/xe/xe_guc_log_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_log_types.h
@@ -6,7 +6,17 @@
 #ifndef _XE_GUC_LOG_TYPES_H_
 #define _XE_GUC_LOG_TYPES_H_
 
+#include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
+#include "xe_guc_fwif.h"
+
+enum {
+	GUC_LOG_SECTIONS_CRASH,
+	GUC_LOG_SECTIONS_DEBUG,
+	GUC_LOG_SECTIONS_CAPTURE,
+	GUC_LOG_SECTIONS_LIMIT
+};
 
 struct xe_bo;
 
@@ -18,6 +28,22 @@ struct xe_guc_log {
 	u32 level;
 	/** @bo: XE BO for GuC log */
 	struct xe_bo *bo;
+
+	/* Allocation settings */
+	struct {
+		s32 bytes;	/* Size in bytes */
+		s32 units;	/* GuC API units - 1MB or 4KB */
+		s32 count;	/* Number of API units */
+		u32 flag;	/* GuC API units flag */
+	} sizes[GUC_LOG_SECTIONS_LIMIT];
+	bool sizes_initialised;
+
+	/* logging related stats */
+	struct {
+		u32 sampled_overflow;
+		u32 overflow;
+		u32 flush;
+	} stats[GUC_MAX_LOG_BUFFER];
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 21ac68e3246f..77f011d3532b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -23,7 +23,9 @@
 #include "xe_force_wake.h"
 #include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
+#include "xe_gt_printk.h"
 #include "xe_guc.h"
+#include "xe_guc_capture.h"
 #include "xe_guc_ct.h"
 #include "xe_guc_exec_queue_types.h"
 #include "xe_guc_submit_types.h"
@@ -758,7 +760,7 @@ static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 	xe_sched_job_put(job);
 }
 
-static int guc_read_stopped(struct xe_guc *guc)
+int guc_read_stopped(struct xe_guc *guc)
 {
 	return atomic_read(&guc->submission_state.stopped);
 }
@@ -1696,6 +1698,24 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 	return 0;
 }
 
+int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len)
+{
+	u32 status;
+
+	if (unlikely(len != 1)) {
+		xe_gt_dbg(guc_to_gt(guc), "Invalid length %u", len);
+		return -EPROTO;
+	}
+
+	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
+	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
+		xe_gt_warn(guc_to_gt(guc), "G2H-Error capture no space");
+
+	xe_guc_capture_process(guc);
+
+	return 0;
+}
+
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index fc97869c5b86..0c4e01c4a7ec 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -19,12 +19,15 @@ void xe_guc_submit_reset_wait(struct xe_guc *guc);
 int xe_guc_submit_stop(struct xe_guc *guc);
 int xe_guc_submit_start(struct xe_guc *guc);
 
+int guc_read_stopped(struct xe_guc *guc);
+
 int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 					       u32 len);
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
+int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 16de203c62a7..6d9f5f2de8ce 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,6 +42,8 @@ struct xe_guc {
 	struct xe_guc_ads ads;
 	/** @ct: GuC ct */
 	struct xe_guc_ct ct;
+	/** @capture: the error-state-capture module's data and objects */
+	struct xe_guc_state_capture *capture;
 	/** @pc: GuC Power Conservation */
 	struct xe_guc_pc pc;
 	/** @dbm: GuC Doorbell Manager */
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 832989c83a25..d25572b7eb92 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -29,6 +29,8 @@
 #include "xe_uc_fw.h"
 #include "xe_wa.h"
 
+#include "xe_guc_capture.h"
+
 #define MAX_MMIO_BASES 3
 struct engine_info {
 	const char *name;
@@ -750,46 +752,53 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
 						    hwe->domain);
 	snapshot->mmio_base = hwe->mmio_base;
 
-	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
-	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
-							   RING_HWS_PGA(0));
-	snapshot->reg.ring_execlist_status_lo =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
-	snapshot->reg.ring_execlist_status_hi =
-		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
-	snapshot->reg.ring_execlist_sq_contents_lo =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_LO(0));
-	snapshot->reg.ring_execlist_sq_contents_hi =
-		hw_engine_mmio_read32(hwe,
-				      RING_EXECLIST_SQ_CONTENTS_HI(0));
-	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
-	snapshot->reg.ring_head =
-		hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
-	snapshot->reg.ring_tail =
-		hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
-	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
-	snapshot->reg.ring_mi_mode =
-		hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
-	snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
-	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
-	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
-	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
-	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
-	snapshot->reg.ring_acthd_udw =
-		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
-	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
-	snapshot->reg.ring_bbaddr_udw =
-		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
-	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
-	snapshot->reg.ring_dma_fadd_udw =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
-	snapshot->reg.ring_dma_fadd =
-		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
-	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
-
-	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
-		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+#if IS_ENABLED(CONFIG_DRM_XE_CAPTURE_ERROR)
+	if (xe_device_uc_enabled(gt_to_xe(hwe->gt)))
+		xe_hw_engine_snapshot_from_capture(hwe, snapshot);
+	else
+#endif
+	{
+		snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe, RING_HWSTAM(0));
+		snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
+								   RING_HWS_PGA(0));
+		snapshot->reg.ring_execlist_status_lo =
+			hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0));
+		snapshot->reg.ring_execlist_status_hi =
+			hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0));
+		snapshot->reg.ring_execlist_sq_contents_lo =
+			hw_engine_mmio_read32(hwe,
+					      RING_EXECLIST_SQ_CONTENTS_LO(0));
+		snapshot->reg.ring_execlist_sq_contents_hi =
+			hw_engine_mmio_read32(hwe,
+					      RING_EXECLIST_SQ_CONTENTS_HI(0));
+		snapshot->reg.ring_start = hw_engine_mmio_read32(hwe, RING_START(0));
+		snapshot->reg.ring_head =
+			hw_engine_mmio_read32(hwe, RING_HEAD(0)) & HEAD_ADDR;
+		snapshot->reg.ring_tail =
+			hw_engine_mmio_read32(hwe, RING_TAIL(0)) & TAIL_ADDR;
+		snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0));
+		snapshot->reg.ring_mi_mode =
+			hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
+		snapshot->reg.ring_mode = hw_engine_mmio_read32(hwe, RING_MODE(0));
+		snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0));
+		snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0));
+		snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
+		snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
+		snapshot->reg.ring_acthd_udw =
+			hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0));
+		snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe, RING_ACTHD(0));
+		snapshot->reg.ring_bbaddr_udw =
+			hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0));
+		snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0));
+		snapshot->reg.ring_dma_fadd_udw =
+			hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0));
+		snapshot->reg.ring_dma_fadd =
+			hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
+		snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
+
+		if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
+			snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
+	}
 
 	return snapshot;
 }
diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
index dfeaaac08b7f..c9db0cad8f64 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
@@ -61,10 +61,33 @@ enum xe_hw_engine_id {
 /* FIXME: s/XE_HW_ENGINE_MAX_INSTANCE/XE_HW_ENGINE_MAX_COUNT */
 #define XE_HW_ENGINE_MAX_INSTANCE	9
 
+#define XE_MAX_VCS (XE_HW_ENGINE_VECS0 - XE_HW_ENGINE_VCS0)
+#define XE_MAX_SFC (XE_MAX_VCS / 2)
+#define XE_MAX_VECS (XE_HW_ENGINE_CCS0 - XE_HW_ENGINE_VECS0)
+#define XE_MAX_CCS (XE_HW_ENGINE_GSCCS0 - XE_HW_ENGINE_CCS0)
+#define XE_MAX_RCS (XE_HW_ENGINE_BCS0 - XE_HW_ENGINE_RCS0)
+#define XE_MAX_BCS (XE_HW_ENGINE_VCS0 - XE_HW_ENGINE_BCS0)
+
 struct xe_bo;
 struct xe_execlist_port;
 struct xe_gt;
 
+/*
+ * Maximum number of subslices that can exist within a HSW-style slice.  This
+ * is only relevant to pre-Xe_HP platforms (Xe_HP and beyond use the
+ * I915_MAX_SS_FUSE_BITS value below).
+ */
+#define GEN_MAX_SS_PER_HSW_SLICE	8
+/*
+ * Maximum number of 32-bit registers used by hardware to express the
+ * enabled/disabled subslices.
+ */
+#define XE_MAX_SS_FUSE_REGS	2
+#define XE_MAX_SS_FUSE_BITS	(XE_MAX_SS_FUSE_REGS * 32)
+
+#define GEN_DSS_PER_GSLICE	4
+#define GEN_DSS_PER_CSLICE	8
+
 /**
  * struct xe_hw_engine_class_intf - per hw engine class struct interface
  *
@@ -150,6 +173,58 @@ struct xe_hw_engine {
 	struct xe_hw_engine_class_intf *eclass;
 };
 
+/** @reg: Useful MMIO register snapshot */
+struct snap_shot_regs {
+	/** @ring_hwstam: RING_HWSTAM */
+	u32 ring_hwstam;
+	/** @ring_hws_pga: RING_HWS_PGA */
+	u32 ring_hws_pga;
+	/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
+	u32 ring_execlist_status_lo;
+	/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
+	u32 ring_execlist_status_hi;
+	/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
+	u32 ring_execlist_sq_contents_lo;
+	/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
+	u32 ring_execlist_sq_contents_hi;
+	/** @ring_start: RING_START */
+	u32 ring_start;
+	/** @ring_head: RING_HEAD */
+	u32 ring_head;
+	/** @ring_tail: RING_TAIL */
+	u32 ring_tail;
+	/** @ring_ctl: RING_CTL */
+	u32 ring_ctl;
+	/** @ring_mi_mode: RING_MI_MODE */
+	u32 ring_mi_mode;
+	/** @ring_mode: RING_MODE */
+	u32 ring_mode;
+	/** @ring_imr: RING_IMR */
+	u32 ring_imr;
+	/** @ring_esr: RING_ESR */
+	u32 ring_esr;
+	/** @ring_emr: RING_EMR */
+	u32 ring_emr;
+	/** @ring_eir: RING_EIR */
+	u32 ring_eir;
+	/** @ring_acthd_udw: RING_ACTHD_UDW */
+	u32 ring_acthd_udw;
+	/** @ring_acthd: RING_ACTHD */
+	u32 ring_acthd;
+	/** @ring_bbaddr_udw: RING_BBADDR_UDW */
+	u32 ring_bbaddr_udw;
+	/** @ring_bbaddr: RING_BBADDR */
+	u32 ring_bbaddr;
+	/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
+	u32 ring_dma_fadd_udw;
+	/** @ring_dma_fadd: RING_DMA_FADD */
+	u32 ring_dma_fadd;
+	/** @ipehr: IPEHR */
+	u32 ipehr;
+	/** @rcu_mode: RCU_MODE */
+	u32 rcu_mode;
+};
+
 /**
  * struct xe_hw_engine_snapshot - Hardware engine snapshot
  *
@@ -172,56 +247,7 @@ struct xe_hw_engine_snapshot {
 	/** @mmio_base: MMIO base address of this hw engine*/
 	u32 mmio_base;
 	/** @reg: Useful MMIO register snapshot */
-	struct {
-		/** @ring_hwstam: RING_HWSTAM */
-		u32 ring_hwstam;
-		/** @ring_hws_pga: RING_HWS_PGA */
-		u32 ring_hws_pga;
-		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
-		u32 ring_execlist_status_lo;
-		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
-		u32 ring_execlist_status_hi;
-		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
-		u32 ring_execlist_sq_contents_lo;
-		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
-		u32 ring_execlist_sq_contents_hi;
-		/** @ring_start: RING_START */
-		u32 ring_start;
-		/** @ring_head: RING_HEAD */
-		u32 ring_head;
-		/** @ring_tail: RING_TAIL */
-		u32 ring_tail;
-		/** @ring_ctl: RING_CTL */
-		u32 ring_ctl;
-		/** @ring_mi_mode: RING_MI_MODE */
-		u32 ring_mi_mode;
-		/** @ring_mode: RING_MODE */
-		u32 ring_mode;
-		/** @ring_imr: RING_IMR */
-		u32 ring_imr;
-		/** @ring_esr: RING_ESR */
-		u32 ring_esr;
-		/** @ring_emr: RING_EMR */
-		u32 ring_emr;
-		/** @ring_eir: RING_EIR */
-		u32 ring_eir;
-		/** @ring_acthd_udw: RING_ACTHD_UDW */
-		u32 ring_acthd_udw;
-		/** @ring_acthd: RING_ACTHD */
-		u32 ring_acthd;
-		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
-		u32 ring_bbaddr_udw;
-		/** @ring_bbaddr: RING_BBADDR */
-		u32 ring_bbaddr;
-		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
-		u32 ring_dma_fadd_udw;
-		/** @ring_dma_fadd: RING_DMA_FADD */
-		u32 ring_dma_fadd;
-		/** @ipehr: IPEHR */
-		u32 ipehr;
-		/** @rcu_mode: RCU_MODE */
-		u32 rcu_mode;
-	} reg;
+	struct snap_shot_regs reg;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index f17e9785355e..19d821a7273c 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -23,8 +23,8 @@
 #include "xe_sriov.h"
 #include "xe_vm.h"
 
-#define CTX_VALID				(1 << 0)
-#define CTX_PRIVILEGE				(1 << 8)
+#define CTX_VALID				BIT(0)
+#define CTX_PRIVILEGE				BIT(8)
 #define CTX_ADDRESSING_MODE_SHIFT		3
 #define LEGACY_64B_CONTEXT			3
 
diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
index 78220336062c..2d9fe461c99d 100644
--- a/drivers/gpu/drm/xe/xe_lrc_types.h
+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
@@ -8,6 +8,8 @@
 
 #include "xe_hw_fence_types.h"
 
+#define CTX_GTT_ADDRESS_MASK			GENMASK(31, 12)
+
 struct xe_bo;
 
 /**
-- 
2.34.1

