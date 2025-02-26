Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC94C021BE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 03:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7110E0F5;
	Wed, 26 Feb 2025 03:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="knZgKrbS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C9810E0F5
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 03:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740540809; x=1772076809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jl5kv95MPQmwDU0k8oEXwpk9ReGPDYgxJLKB7H+8b4k=;
 b=knZgKrbSaiepbQE33wItFDGvAS29RfTesmsZjZPvpRd9sx3AJsUtCDnm
 bsAV0Dr9OGPX2ZB6axmNjYZpBt7hE/DM2+r5cVHy5oQhW+GRFSaz9xxEu
 n7RWwtEoOcLP43+a/F4q+v60rT5enYIf3ARR1f4HFdap8oylV9hxWUWGj
 768/hqyKWzfxhRWmsOe8ivQ/tDwXVE+TTKS9h7viqawObbfYFMp69Qu7q
 rvMRdtTGZKrZSfW7G60AQOZG3W6DEHHgT59PZNmKr/fHtVX4981fhmY+k
 bQgpQt89qAHfUvnBX2xToqhTUpzvVoYkjAG4iHvlAMtbSte/pkUkvgy/5 A==;
X-CSE-ConnectionGUID: F2RwREfaTAaUjjp96SDqEg==
X-CSE-MsgGUID: NPaqboRNS4GldXmn8DlCXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41289388"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="41289388"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 19:33:27 -0800
X-CSE-ConnectionGUID: rjc/S4iPTomK4yH0Aysg9w==
X-CSE-MsgGUID: FojoowjNTnGhUCt5H08XkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153756176"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by orviesa001.jf.intel.com with ESMTP; 25 Feb 2025 19:33:27 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe: Apply Wa_16023105232
Date: Tue, 25 Feb 2025 19:29:34 -0800
Message-Id: <20250226032934.1789134-1-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  2 ++
 drivers/gpu/drm/xe/xe_gt_clock.c         | 29 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_clock.h         |  1 +
 drivers/gpu/drm/xe/xe_hw_engine.c        | 30 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_wa_oob.rules       |  2 ++
 5 files changed, 64 insertions(+)

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
index cc2ae159298e..88e3df76a885 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.c
+++ b/drivers/gpu/drm/xe/xe_gt_clock.c
@@ -55,6 +55,35 @@ static u32 get_crystal_clock_freq(u32 rpm_config_reg)
 	}
 }
 
+/**
+ * xe_gt_timestamp_base - Return the GT timestamp base
+ *
+ * @gt: the &xe_gt
+ * Returns: time in nsec
+ */
+u32 xe_gt_timestamp_base(struct xe_gt *gt)
+{
+	const u32 ts_base_83 = 83333;
+	const u32 ts_base_52 = 52083;
+	const u32 ts_base_80 = 80000;
+	u32 rpm_config0 = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
+	u32 crystal_clock = REG_FIELD_GET(RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_MASK,
+					  rpm_config0);
+
+	switch (crystal_clock) {
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_24_MHZ:
+		return DIV_ROUND_CLOSEST(ts_base_83, 1000);
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_19_2_MHZ:
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_38_4_MHZ:
+		return DIV_ROUND_CLOSEST(ts_base_52, 1000);
+	case RPM_CONFIG0_CRYSTAL_CLOCK_FREQ_25_MHZ:
+		return DIV_ROUND_CLOSEST(ts_base_80, 1000);
+	default:
+		XE_WARN_ON("NOT_POSSIBLE");
+		return 0;
+	}
+}
+
 int xe_gt_clock_init(struct xe_gt *gt)
 {
 	u32 ctc_reg = xe_mmio_read32(&gt->mmio, CTC_MODE);
diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
index 3adeb7baaca4..b78665b0b924 100644
--- a/drivers/gpu/drm/xe/xe_gt_clock.h
+++ b/drivers/gpu/drm/xe/xe_gt_clock.h
@@ -12,5 +12,6 @@ struct xe_gt;
 
 int xe_gt_clock_init(struct xe_gt *gt);
 u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
+u32 xe_gt_timestamp_base(struct xe_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index fc447751fe78..609ba19251bd 100644
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
+		  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000),
+			       GRAPHICS_VERSION_RANGE(2001, 3001)),
+		  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
+				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+		},
 		{}
 	};
 
@@ -566,6 +575,24 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_reg_whitelist_process_engine(hwe);
 }
 
+static void check_idledly(struct xe_gt *gt, struct xe_hw_engine *hwe)
+{
+	u32 idledly, maxcnt;
+	u32 idledly_units_ns = 8 * xe_gt_timestamp_base(gt);
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
+	check_idledly(gt, hwe);
+
 	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
 
 err_hwsp:
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 228436532282..b45ec8bd0735 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -43,3 +43,5 @@
 no_media_l3	MEDIA_VERSION(3000)
 14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
 		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
+16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
+		MEDIA_VERSION_RANGE(1301, 3000)
-- 
2.38.1

