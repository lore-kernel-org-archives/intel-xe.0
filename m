Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DD0C282DE
	for <intel-xe@archiver.kernel.org>; Thu, 13 Mar 2025 18:08:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBC110E219;
	Thu, 13 Mar 2025 18:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R28Tsm09";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD26A10E219
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741889319; x=1773425319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cR1vqIdll8JcWkO6L1QGmD92wmGXhWlRMHQqyVT6MM4=;
 b=R28Tsm09FY6SxoOTFtdvsUAfE9CYh4aU7E/k7Fn5ANjwnU9NUrohLK22
 AvhvXZg+KwdmIXmHv6aAIxdiogrjRQphqjkPk6aaw1hWBElNUdh9RvTok
 fH2H02PPJ/4ZftiJNMNKWjQEnQOnsGtvbeNJGQQY+B3e+dxn4wX/ID3dD
 Awl3M0XxwY8joeRYEIdjRXMRv/1pV5c+L4/wTBuR6jxNthMb/zFdAHdFU
 0M/5piVdeAwuBmuqQGIvkGrhoHmJmBfOu3FKTt4a2r9TIK2RpfA9+2jJx
 Hn/cVgrAv86Fch9AXK0Jgz0S6RZcdLvFtaijqxA9drrfTGPYjsn5l4quY w==;
X-CSE-ConnectionGUID: 49G9fZexQc6FGw1ctcJPHQ==
X-CSE-MsgGUID: BiZnwWgETKygMZj2urEleA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42749699"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="42749699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 11:08:38 -0700
X-CSE-ConnectionGUID: 59zO2nHiRMGZ1+FdJsYRzA==
X-CSE-MsgGUID: bEISRENQT+CaSxp4LkcbgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; d="scan'208";a="121968177"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa008.jf.intel.com with ESMTP; 13 Mar 2025 11:08:38 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v4] drm/xe: Apply Wa_16023105232
Date: Thu, 13 Mar 2025 11:04:40 -0700
Message-Id: <20250313180440.1393089-1-vinay.belgaumkar@intel.com>
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
v3: Skip WA check for VF
v4: Review comments (Matt Roper)

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_clock.c         | 36 ++++++++++++++++--------
 drivers/gpu/drm/xe/xe_gt_types.h         |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c        | 30 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa.c               |  6 ++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
 6 files changed, 67 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index 659cf85fa3d6..05658ad991f4 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -130,6 +130,8 @@
 #define RING_EXECLIST_STATUS_LO(base)		XE_REG((base) + 0x234)
 #define RING_EXECLIST_STATUS_HI(base)		XE_REG((base) + 0x234 + 4)
 
+#define RING_IDLEDLY(base)			XE_REG((base) + 0x23c)
+
 #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
 #define	  CTX_CTRL_PXP_ENABLE			REG_BIT(10)
 #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
index fca38738e610..f493b1687851 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -16,27 +16,41 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 
-static u32 get_crystal_clock_freq(u32 rpm_config_reg)
+#define f19_2_mhz	19200000
+#define f24_mhz		24000000
+#define f25_mhz		25000000
+#define f38_4_mhz	38400000
+#define ts_base_83	83333
+#define ts_base_52	52083
+#define ts_base_80	80000
+
+static void read_crystal_clock(u32 rpm_config_reg, u32 *freq, u32 *timestamp_base)
 {
-	const u32 f19_2_mhz = 19200000;
-	const u32 f24_mhz = 24000000;
-	const u32 f25_mhz = 25000000;
-	const u32 f38_4_mhz = 38400000;
 	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
 					  rpm_config_reg);
 
 	switch (crystal_clock) {
 	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
-		return f24_mhz;
+		*freq = f24_mhz;
+		*timestamp_base = ts_base_83;
+		return;
 	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
-		return f19_2_mhz;
+		*freq = f19_2_mhz;
+		*timestamp_base = ts_base_52;
+		return;
 	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
-		return f38_4_mhz;
+		*freq = f38_4_mhz;
+		*timestamp_base = ts_base_52;
+		return;
 	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
-		return f25_mhz;
+		*freq = f25_mhz;
+		*timestamp_base = ts_base_80;
+		return;
 	default:
 		XE_WARN_ON("NOT_POSSIBLE");
-		return 0;
+		*freq = 0;
+		*timestamp_base = 0;
+		return;
 	}
 }
 
@@ -65,7 +79,7 @@ int xe_gt_clock_init(struct xe_gt *gt)
 		check_ctc_mode(gt);
 
 	c0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
-	freq = get_crystal_clock_freq(c0);
+	read_crystal_clock(c0, &freq, &gt->info.timestamp_base);
 
 	/*
 	 * Now figure out how the command stream's timestamp
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
index 223b95de388c..4b8a54c16ac7 100644
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
@@ -564,6 +567,29 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_whitelist_process_engine(hwe);
 }
 
+static void adjust_idledly(struct xe_hw_engine *hwe)
+{
+	struct xe_gt *gt = hwe->gt;
+	u32 idledly, maxcnt;
+	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
+	u32 maxcnt_units_ns = 640;
+
+	if (XE_WA(gt, 16023105232)) {
+		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
+		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
+
+		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
+		maxcnt *= maxcnt_units_ns;
+
+		if (xe_gt_WARN_ON(gt, idledly >= maxcnt)) {
+			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * maxcnt_units_ns),
+						    idledly_units_ps);
+			idledly = DIV_ROUND_CLOSEST(idledly, 1000);
+			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
+		}
+	}
+}
+
 static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 			  enum xe_hw_engine_id id)
 {
@@ -604,6 +630,10 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	if (xe->info.has_usm && hwe->class == XE_ENGINE_CLASS_COPY)
 		gt->usm.reserved_bcs_instance = hwe->instance;
 
+	/* Ensure IDLEDLY is lower than MAXCNT */
+	if (XE_WA(gt, 16023105232))
+		adjust_idledly(hwe);
+
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
 err_hwsp:
diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index a25afb757f70..24f644c0a673 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -622,6 +622,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
 		       FUNC(xe_rtp_match_first_render_or_compute)),
 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
 	},
+	{ XE_RTP_NAME("16023105232"),
+	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
+		       GRAPHICS_VERSION_RANGE(2001, 3001)),
+	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
+			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+	},
 };
 
 static const struct xe_rtp_entry_sr lrc_was[] = {
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

