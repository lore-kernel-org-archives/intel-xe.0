Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0E2C001B5
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 11:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3AE10E2D1;
	Mon,  6 Nov 2023 11:22:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4F710E2CE
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 11:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699269753; x=1730805753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/lhlfu0JrmpFFTAcPKMYY3p3TJagnNNuVwE7zxE2ge8=;
 b=Qv/BhX2Vswy7J5HbDznnomHtuEOm1ysrbvMFzaqKmSqz2+N5iS3sFb9j
 yt70G2oCNz0N1PDweTY8yf3tuX7cwxHCAcOrvN5gJOrGbUomAV4E7EnB1
 WnLRKazF0TJhsGr5veKiSMVAopkVIlzAVN2ifrz47P1yK5O8LwdCjBoK7
 T33o2NnXedJNODoVmB9ADJlx4B/dduaC19rm/toCrhCdcips95sK74fj6
 gxabjbS30Ocvm1LHiDUsaG4+cAL8i0QlUX+SQAE1E7W0e+0FcNcgX07RF
 XUiuS4AeNqysdSwihaUmsW027xGFK230vLSwdgJh+L9+WuhiD9crLoKQe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="379646775"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="379646775"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="879411550"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="879411550"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 03:22:17 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Nov 2023 13:18:24 +0200
Message-Id: <20231106111845.2333093-5-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 04/25] drm/xe/eudebug: hw enablement for eudebug
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

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 14 ++++++++
 drivers/gpu/drm/xe/xe_eudebug.c      | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_eudebug.h      |  2 ++
 drivers/gpu/drm/xe/xe_hw_engine.c    |  2 ++
 4 files changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 902c60543de0..a1bed8b9171a 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -60,6 +60,10 @@
 #define   MTL_MCR_GROUPID			REG_GENMASK(11, 8)
 #define   MTL_MCR_INSTANCEID			REG_GENMASK(3, 0)
 
+#define CS_DEBUG_MODE2				XE_REG(0x20d8, XE_REG_OPTION_MASKED)
+#define   INST_STATE_CACHE_INVALIDATE		REG_BIT(6)
+#define   GLOBAL_DEBUG_ENABLE			REG_BIT(5)
+
 #define FF_SLICE_CS_CHICKEN1			XE_REG(0x20e0, XE_REG_OPTION_MASKED)
 #define   FFSC_PERCTX_PREEMPT_CTRL		REG_BIT(14)
 
@@ -334,6 +338,14 @@
 #define HALF_SLICE_CHICKEN7				XE_REG_MCR(0xe194, XE_REG_OPTION_MASKED)
 #define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
 
+#define TD_CTL					XE_REG_MCR(0xe400)
+#define   TD_CTL_FEH_AND_FEE_ENABLE		REG_BIT(7) /* forced halt and exception */
+#define   TD_CTL_FORCE_EXTERNAL_HALT		REG_BIT(6)
+#define   TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE	REG_BIT(4)
+#define   TD_CTL_FORCE_EXCEPTION		REG_BIT(3)
+#define   TD_CTL_BREAKPOINT_ENABLE		REG_BIT(2)
+#define   TD_CTL_GLOBAL_DEBUG_ENABLE		REG_BIT(0) /* XeHP */
+
 #define CACHE_MODE_SS				XE_REG_MCR(0xe420, XE_REG_OPTION_MASKED)
 #define   ENABLE_EU_COUNT_FOR_TDL_FLUSH		REG_BIT(10)
 #define   DISABLE_ECC				REG_BIT(5)
@@ -355,11 +367,13 @@
 #define   UGM_BACKUP_MODE			REG_BIT(13)
 #define   MDQ_ARBITRATION_MODE			REG_BIT(12)
 #define   EARLY_EOT_DIS				REG_BIT(1)
+#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
 
 #define ROW_CHICKEN2				XE_REG_MCR(0xe4f4, XE_REG_OPTION_MASKED)
 #define   DISABLE_READ_SUPPRESSION		REG_BIT(15)
 #define   DISABLE_EARLY_READ			REG_BIT(14)
 #define   ENABLE_LARGE_GRF_MODE			REG_BIT(12)
+#define   XEHPC_DISABLE_BTB			REG_BIT(11)
 #define   PUSH_CONST_DEREF_HOLD_DIS		REG_BIT(8)
 #define   DISABLE_DOP_GATING			REG_BIT(0)
 
diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
index 3598c0f352fe..99939176bbb9 100644
--- a/drivers/gpu/drm/xe/xe_eudebug.c
+++ b/drivers/gpu/drm/xe/xe_eudebug.c
@@ -14,10 +14,15 @@
 #include <drm/drm_managed.h>
 #include <uapi/drm/xe_drm_tmp.h>
 
+#include "regs/xe_gt_regs.h"
 #include "xe_device.h"
+#include "xe_gt.h"
 #include "xe_eudebug_types.h"
 #include "xe_exec_queue_types.h"
+#include "xe_module.h"
+#include "xe_rtp.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 
 /*
  * If there is no event being read in this time (for example gdb stuck)
@@ -824,6 +829,49 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
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
+		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2, GLOBAL_DEBUG_ENABLE))
+		},
+		{ XE_RTP_NAME("TdCtlDebugEnable"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, XE_RTP_END_VERSION_UNDEFINED),
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
+		{ XE_RTP_NAME("22015693276"),
+		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
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
 	int ret;
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
index b5b084590888..59ce9574b1c5 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -13,6 +13,7 @@
 #include "xe_assert.h"
 #include "xe_bo.h"
 #include "xe_device.h"
+#include "xe_eudebug.h"
 #include "xe_execlist.h"
 #include "xe_force_wake.h"
 #include "xe_gt.h"
@@ -409,6 +410,7 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
 	xe_tuning_process_engine(hwe);
 	xe_wa_process_engine(hwe);
 	hw_engine_setup_default_state(hwe);
+	xe_eudebug_init_hw_engine(hwe);
 
 	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
 	xe_reg_whitelist_process_engine(hwe);
-- 
2.34.1

