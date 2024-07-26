Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE3DC52D1F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8268110E9B8;
	Fri, 26 Jul 2024 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bo+AvupB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8196510E9A2
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722003451; x=1753539451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5CXATdkaA8/HUWG6L6Te0BH2L1cqoXML7AVgmaIPYnA=;
 b=bo+AvupBeajt/zvQQjSDQnVLEjh3Urlk4NrwHo2ACF8y+6YCaALq8FbV
 HWOp7g0CQ4DrboHtFVffNDTgEx1xVWxeAHereEATJ8E7//QYROjtHs19e
 zWS1H6PiIBRbD+dr8/NeF3ZfzvzUx1uhVpX7qht5wLsWi9hJmqpWCp8kF
 ypR5KaLBY0jxtA2KhDXtl0pKztd64wqN5IE/LDlQG1+07QJLRQwNY//N0
 xPCwJ5+AGjbD8vT36/+h/fORWeLI0Hk8AArb0dF9jGMfO4fy/s8VpOrZI
 RFY7tVWkUJzTqhFJXkUGUJ88/BapwxzFXgrhXqa+GRUI/YM8fYAYScFvw w==;
X-CSE-ConnectionGUID: Ik3lghAHR2uZaMLa8fARZQ==
X-CSE-MsgGUID: 8RDuQVcfTMSREO+B7t18Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23598756"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="23598756"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:28 -0700
X-CSE-ConnectionGUID: JHO4fpeNRz2m5bSmj285ag==
X-CSE-MsgGUID: kuF0wZMWQpafkEm6xuS8hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57861386"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 07:17:26 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH 08/21] drm/xe/eudebug: hw enablement for eudebug
Date: Fri, 26 Jul 2024 17:08:05 +0300
Message-Id: <20240726140818.54304-9-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

In order to turn on debug capabilities, (i.e. breakpoints), TD_CTL
and some other registers needs to be programmed. Implement eudebug
mode enabling including eudebug related workarounds.

1) Enable exceptions only on platforms that does not have per context
   debugging functionality

2) Fixup 22015693276:
   Use lineage HSD instead of per platform specific, be precise defining
   graphics range.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  4 ++
 drivers/gpu/drm/xe/regs/xe_gt_regs.h     | 10 +++++
 drivers/gpu/drm/xe/xe_eudebug.c          | 50 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h          |  2 +
 drivers/gpu/drm/xe/xe_hw_engine.c        |  2 +
 5 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
index c38db2a74614..fd31f3fb2b4c 100644
--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
@@ -114,6 +114,10 @@
 
 #define INDIRECT_RING_STATE(base)		XE_REG((base) + 0x108)
 
+#define CS_DEBUG_MODE2(base)			XE_REG((base) + 0xd8, XE_REG_OPTION_MASKED)
+#define   INST_STATE_CACHE_INVALIDATE		REG_BIT(6)
+#define   GLOBAL_DEBUG_ENABLE			REG_BIT(5)
+
 #define RING_BBADDR(base)			XE_REG((base) + 0x140)
 #define RING_BBADDR_UDW(base)			XE_REG((base) + 0x168)
 
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 8a94a94d2267..96a59a96dd4c 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -425,6 +425,14 @@
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
 #define   CLEAR_OPTIMIZATION_DISABLE			REG_BIT(6)
 
+#define TD_CTL					XE_REG_MCR(0xe400)
+#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
+#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
+#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
+#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
+#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
+#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
+
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   DISABLE_ECC				REG_BIT(5)
 #define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
@@ -450,11 +458,13 @@
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
 #define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 #define   EARLY_EOT_DIS				REG_BIT(1)
+#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 
 #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
 #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
 #define   DISABLE_EARLY_READ			REG_BIT(14)
 #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
+#define   XEHPC_DISABLE_BTB			REG_BIT(11)
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
 #define   DISABLE_TDL_SVHS_GATING		REG_BIT(1)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index db55e449049a..9611acedeee9 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -11,13 +11,19 @@
 
 #include <drm/drm_managed.h>
 
+#include "regs/xe_gt_regs.h"
+#include "regs/xe_engine_regs.h"
 #include "xe_device.h"
 #include "xe_assert.h"
 #include "xe_macros.h"
+#include "xe_gt.h"
 #include "xe_eudebug_types.h"
 #include "xe_eudebug.h"
 #include "xe_exec_queue_types.h"
+#include "xe_module.h"
+#include "xe_rtp.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 /*
  * If there is no detected event read by userspace, during this period, assume
@@ -925,6 +931,50 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 	return ret;
 }
 
+#undef XE_REG_MCR
+#define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
+
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
+{
+	const struct xe_rtp_entry_sr eudebug_was[] = {
+		{ XE_RTP_NAME("GlobalDebugEnable"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
+			       ENGINE_CLASS(RENDER)),
+		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2(RENDER_RING_BASE),
+				     GLOBAL_DEBUG_ENABLE))
+		},
+		{ XE_RTP_NAME("TdCtlDebugEnable"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(SET(TD_CTL,
+				     TD_CTL_BREAKPOINT_ENABLE |
+				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
+				     TD_CTL_FEH_AND_FEE_ENABLE))
+		},
+		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE))
+		},
+		{ XE_RTP_NAME("18022722726"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE))
+		},
+		{ XE_RTP_NAME("14015527279"),
+		  XE_RTP_RULES(PLATFORM(PVC),
+			       FUNC(xe_rtp_match_first_render_or_compute)),
+		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB))
+		},
+		{}
+	};
+	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
+	struct xe_device *xe = gt_to_xe(hwe->gt);
+
+	if (xe->eudebug.available)
+		xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
+}
+
 void xe_eudebug_init(struct xe_device *xe)
 {
 	spin_lock_init(&xe->eudebug.lock);
diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
index 44b20549eb6d..ac89a3d1ee1d 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.h
+++ b/drivers/gpu/drm/xe/xe_eudebug.h
@@ -11,6 +11,7 @@ struct xe_device;
 struct xe_file;
 struct xe_vm;
 struct xe_exec_queue;
+struct xe_hw_engine;
 
 int xe_eudebug_connect_ioctl(struct drm_device *dev,
 			     void *data,
@@ -18,6 +19,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
 
 void xe_eudebug_init(struct xe_device *xe);
 void xe_eudebug_fini(struct xe_device *xe);
+void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
 
 void xe_eudebug_file_open(struct xe_file *xef);
 void xe_eudebug_file_close(struct xe_file *xef);
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 20c4fdf40790..0d8b871b47fe 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -15,6 +15,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_gsc.h"
@@ -503,6 +504,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
+	xe_eudebug_init_hw_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
-- 
2.34.1

