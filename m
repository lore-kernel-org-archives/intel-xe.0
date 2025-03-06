Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9FBC282EC
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 23:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FDF10E288;
	Thu,  6 Mar 2025 23:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oxl4/NZj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CFC10E288
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 23:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741302926; x=1772838926;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2eyKhL1XzPOnOKl9puF+2kk95QzN8fqyA/GTESsAZmQ=;
 b=Oxl4/NZjD7AhpsQR9Of4v6G6Ghega6fcaNBJYX5Pd2STmDUDvAYiJZAJ
 4BLjHt+bbJDTzpTeCytiyYgxU3SKwfNdUrnyy6asmZQ47JWijj4aj9A+3
 iyY3LlbIqOzmr4BqIyJrMzU7fJxsqdgMdP2WLHIYh1lzKAg7GRGtOseaO
 STGPPtWpe5l7FFVKm83Tfl8iM4ndWHUecpN3ULRj2wuJgKP7zpDvfKH5s
 bO/s0dgrgQ1Y1fT/TN0noP1pOAhHzKMKaHEaO5gXT77CZmArBjpqs5ou3
 y82i0zDcPHHLcuJQlPp1UFlCGBG2EGJ7fOuG41hwOpRHNw79txekuuqxt w==;
X-CSE-ConnectionGUID: UMR3/YU3S1uM1uJZm+oHpQ==
X-CSE-MsgGUID: SmALWGz5TyivqMwV/mkkxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="46119916"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="46119916"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 15:15:26 -0800
X-CSE-ConnectionGUID: 9cLW3UxrR5mgOXxX3itB5A==
X-CSE-MsgGUID: /0xSLcfYSoeI64QyWbpWpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="149957479"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa002.jf.intel.com with ESMTP; 06 Mar 2025 15:15:26 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2] drm/xe: Apply Wa_16023105232
Date: Thu,  6 Mar 2025 15:11:22 -0800
Message-Id: <20250306231122.3897413-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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

The WA requires KMD to disable DOP clock gating during a semaphore
wait and also ensure that idle delay for every CS is lower than the
idle wait time in the PWRCTX_MAXCNT register. Default values for these
registers already comply with this restriction.

v2: Store timestamp_base in gt info and other comments (Daniele)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_clock.c         | 38 +++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 30 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
 5 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 4f372dc2cb89..067468c62adb 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -130,6 +130,8 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
+#define RING_IDLEDLY(base)			XE_REG((base) + 0x23C)
+
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index 2a958c92d8ea..0394292e777e 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -16,12 +16,13 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 
+#define f19_2_mhz	19200000
+#define f24_mhz		24000000
+#define f25_mhz		25000000
+#define f38_4_mhz	38400000
+
 static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 {
-	const u32 f19_2_mhz = 19200000;
-	const u32 f24_mhz = 24000000;
-	const u32 f25_mhz = 25000000;
-	const u32 f38_4_mhz = 38400000;
 	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
 					  rpm_config_reg);
 
@@ -40,10 +41,37 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 	}
 }
 
+/**
+ * xe_gt_timestamp_base - Return the GT timestamp base
+ *
+ * @crystal_clock_freq: clock freq from 0xd00 register
+ * Returns: rounded down time in nsec
+ */
+static u32 xe_gt_timestamp_base(u32 crystal_clock_freq)
+{
+	const u32 ts_base_83 = 83333;
+	const u32 ts_base_52 = 52083;
+	const u32 ts_base_80 = 80000;
+
+	switch (crystal_clock_freq) {
+	case f24_mhz:
+		return DIV_ROUND_CLOSEST(ts_base_83, 1000);
+	case f19_2_mhz:
+	case f38_4_mhz:
+		return DIV_ROUND_CLOSEST(ts_base_52, 1000);
+	case f25_mhz:
+		return DIV_ROUND_CLOSEST(ts_base_80, 1000);
+	default:
+		XE_WARN_ON("NOT_POSSIBLE");
+		return 0;
+	}
+}
+
 int xe_gt_clock_init(struct xe_gt *gt)
 {
 	u32 c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
 	u32 freq = 0;
+	u32 timestamp_base = 0;
 
 	/*
 	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
@@ -59,6 +87,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 		xe_gt_warn(gt, "CTC_MODE[0] is set; this is unexpected and undocumented\n");
 
 	freq = get_crystal_clock_freq(c0);
+	timestamp_base = xe_gt_timestamp_base(freq);
 
 	/*
 	 * Now figure out how the command stream's timestamp
@@ -68,6 +97,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 	freq >>= 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, c0);
 
 	gt->info.reference_clock = freq;
+	gt->info.timestamp_base = timestamp_base;
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index e3cfb026ac88..7def0959da35 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -121,6 +121,8 @@ struct xe_gt {
 		enum xe_gt_type type;
 		/** @info.reference_clock: clock frequency */
 		u32 reference_clock;
+		/** @info.timestamp_base: GT timestamp base */
+		u32 timestamp_base;
 		/**
 		 * @info.engine_mask: mask of engines present on GT. Some of
 		 * them may be reserved in runtime and not available for user.
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fc447751fe78..870f2a1efb76 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -8,7 +8,9 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <uapi/drm/xe_drm.h>
+#include <generated/xe_wa_oob.h>
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -21,6 +23,7 @@
 #include "xe_gsc.h"
 #include "xe_gt.h"
 #include "xe_gt_ccs_mode.h"
+#include "xe_gt_clock.h"
 #include "xe_gt_printk.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_topology.h"
@@ -459,6 +462,12 @@ hw_engine_setup_default_state(struct xe_hw_engine *hwe)
 		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
 		},
+		{ XE_RTP_NAME("Disable DOP clk gating"),
+		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
+			       GRAPHICS_VERSION_RANGE(2001, 3001)),
+		  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
@@ -566,6 +575,24 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_whitelist_process_engine(hwe);
 }
 
+static void check_wa_16023105232(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	u32 idledly, maxcnt;
+	u32 idledly_units_ns = 8 * gt->info.timestamp_base;
+	u32 maxcnt_units_ns = 640;
+
+	if (XE_WA(gt, 16023105232)) {
+		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
+		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
+
+		if (drm_WARN_ON(&gt_to_xe(gt)->drm,
+				(idledly * idledly_units_ns) >= (maxcnt * maxcnt_units_ns))) {
+			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base),
+					((maxcnt - 1) * maxcnt_units_ns) / idledly_units_ns);
+		}
+	}
+}
+
 static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			  enum xe_hw_engine_id id)
 {
@@ -606,6 +633,9 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
 		gt->usm.reserved_bcs_instance = hwe->instance;
 
+	/* Ensure IDLEDLY is lower than MAXCNT */
+	check_wa_16023105232(gt, hwe);
+
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
 err_hwsp:
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index e0c5fa460487..0c738af24f7c 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -53,3 +53,5 @@ no_media_l3	MEDIA_VERSION(3000)
 		GRAPHICS_VERSION_RANGE(1270, 1274)
 1508761755	GRAPHICS_VERSION(1255)
 		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
+16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
+		MEDIA_VERSION_RANGE(1301, 3000)
-- 
2.38.1

