Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A06EC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 23:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3469410E064;
	Fri, 24 May 2024 23:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfO7JkWb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C5910E064
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 23:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716594188; x=1748130188;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=no7vYyhNJTIPZNXCx+N9OGHCuo5HUZ6EGVgp5QAEhtw=;
 b=kfO7JkWbinpKLOjiQQHyn6XV7HTYsrFQTcwafzZRKXcLrhIkJxU1Ki1o
 YCv1ox0VRyAiD1bSBYaAQGgAxl428ZBSrp7tCf6W3+CttxEhz0ms9xbqY
 j2l+5gE+Eto8SwlsRAH1+CGLyVpe4V5DypblXXWrTdcloW42bgA0lsm4q
 2ck+thSAAa8Bc4actS+743vMo+WbFzW+dZuI71+WlqIpClsuBew5af6bD
 y65L+moCJMfdjOEgDC224XWvEtq97dAlHGtwMEDiGjllqgQE7fH9X1h4C
 jSlmUeKS+zh8c1/uJjsNVJHc5ddS+Y/aHTP/8LE1yc1gf19B30PeK8e42 Q==;
X-CSE-ConnectionGUID: k31n+Y9vTi+MC/l+SfrzHQ==
X-CSE-MsgGUID: nPqoAFWBRLS1ZAx5yfIjZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="12860220"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="12860220"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 16:43:08 -0700
X-CSE-ConnectionGUID: Nq/ZNJ6BS2+NaRK6k8VasA==
X-CSE-MsgGUID: djTHN0frS/W1ya2v4yZh8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="34267828"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.141])
 by fmviesa009.fm.intel.com with ESMTP; 24 May 2024 16:43:08 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Date: Fri, 24 May 2024 16:41:08 -0700
Message-Id: <20240524234109.1731675-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20240524234109.1731675-1-vinay.belgaumkar@intel.com>
References: <20240524234109.1731675-1-vinay.belgaumkar@intel.com>
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

This WA requires us to limit media GT frequency requests to a certain
cap value during driver load as well as after driver unload. Freq limits
are restored after driver load completes, so perf will not be
affected during normal operations.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile        |  2 ++
 drivers/gpu/drm/xe/xe_device.c     |  8 ++++++++
 drivers/gpu/drm/xe/xe_gsc.c        |  8 ++++++++
 drivers/gpu/drm/xe/xe_guc_pc.c     | 31 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_guc_pc.h     |  2 ++
 drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
 6 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index ae07f3d6a068..9f596c963328 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -47,9 +47,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
 	$(call cmd,wa_oob)
 
 uses_generated_oob := \
+	$(obj)/xe_device.o \
 	$(obj)/xe_gsc.o \
 	$(obj)/xe_guc.o \
 	$(obj)/xe_guc_ads.o \
+	$(obj)/xe_guc_pc.o \
 	$(obj)/xe_migrate.o \
 	$(obj)/xe_ring_ops.o \
 	$(obj)/xe_vm.o \
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 2eba1e32c633..7a594ee53fde 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -15,6 +15,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/xe_drm.h>
+#include <generated/xe_wa_oob.h>
 
 #include "display/xe_display.h"
 #include "instructions/xe_gpu_commands.h"
@@ -34,6 +35,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_guc_pc.h"
 #include "xe_hwmon.h"
 #include "xe_irq.h"
 #include "xe_memirq.h"
@@ -48,6 +50,7 @@
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_ttm_sys_mgr.h"
 #include "xe_vm.h"
+#include "xe_wa.h"
 #include "xe_wait_user_fence.h"
 
 static int xe_file_open(struct drm_device *dev, struct drm_file *file)
@@ -334,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
 {
 	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
 	struct xe_gt *gt = xe_root_mmio_gt(xe);
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
 	int ret;
 
 	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
@@ -341,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
 		return;
 	}
 
+	/* Set requested freq to mert_freq_cap before FLR */
+	if (XE_WA(gt, 22019338487))
+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rpe_freq));
+
 	drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
 
 	/*
diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
index 80a61934decc..4369e3ff19cf 100644
--- a/drivers/gpu/drm/xe/xe_gsc.c
+++ b/drivers/gpu/drm/xe/xe_gsc.c
@@ -22,6 +22,7 @@
 #include "xe_gt.h"
 #include "xe_gt_mcr.h"
 #include "xe_gt_printk.h"
+#include "xe_guc_pc.h"
 #include "xe_huc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
@@ -342,6 +343,7 @@ static void gsc_work(struct work_struct *work)
 	struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
 	struct xe_gt *gt = gsc_to_gt(gsc);
 	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_guc_pc *pc = &gt->uc.guc.pc;
 	u32 actions;
 	int ret;
 
@@ -370,6 +372,12 @@ static void gsc_work(struct work_struct *work)
 	if (actions & GSC_ACTION_SW_PROXY)
 		xe_gsc_proxy_request_handler(gsc);
 
+	/* Revert the min/max freq limits as we're done with GSC/driver load */
+	if (XE_WA(gt, 22019338487)) {
+		xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
+		xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
+	}
+
 out:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
 	xe_pm_runtime_put(xe);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 8187dfb2ad6c..3ecfbaa75495 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <generated/xe_wa_oob.h>
 
 #include "abi/guc_actions_abi.h"
 #include "abi/guc_actions_slpc_abi.h"
@@ -24,6 +25,7 @@
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_pcode.h"
+#include "xe_wa.h"
 
 #define MCHBAR_MIRROR_BASE_SNB	0x140000
 
@@ -41,6 +43,8 @@
 #define GT_FREQUENCY_MULTIPLIER	50
 #define GT_FREQUENCY_SCALER	3
 
+#define LNL_MERT_FREQ_CAP	800
+
 /**
  * DOC: GuC Power Conservation (PC)
  *
@@ -238,7 +242,7 @@ static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
 	xe_mmio_write32(gt, RP_CONTROL, state);
 }
 
-static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	u32 rpnswreq;
@@ -674,6 +678,14 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
 		tgl_init_fused_rp_values(pc);
 }
 
+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
+{
+	if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
+		return LNL_MERT_FREQ_CAP;
+	else
+		return 0;
+}
+
 /**
  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
  * frequency to allow faster GuC load times
@@ -685,7 +697,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
 
 	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
 	pc_init_fused_rp_values(pc);
-	pc_set_cur_freq(pc, pc->rp0_freq);
+
+	if (XE_WA(gt, 22019338487))
+		pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc), pc->rp0_freq));
+	else
+		pc_set_cur_freq(pc, pc->rp0_freq);
 }
 
 static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
@@ -716,6 +732,17 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
 	if (pc_get_min_freq(pc) > pc->rp0_freq)
 		ret = pc_set_min_freq(pc, pc->rp0_freq);
 
+	if (!ret && XE_WA(pc_to_gt(pc), 22019338487)) {
+		/*
+		 * Setting min to RPn disables use of efficient freq
+		 * which could otherwise interfere with this WA for media GT.
+		 * We will also bind max to MERT_FREQ_CAP until driver loads.
+		 */
+		ret = pc_set_min_freq(pc, pc->rpn_freq);
+		if (!ret)
+			ret = pc_set_max_freq(pc, min(pc->rp0_freq, xe_guc_pc_mert_freq_cap(pc)));
+	}
+
 out:
 	return ret;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 532cac985a6d..4abdefa36b9a 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -29,5 +29,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
 u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
 u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
 void xe_guc_pc_init_early(struct xe_guc_pc *pc);
+void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
+u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
index 12fe88796a49..a6b897030fde 100644
--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
@@ -27,3 +27,4 @@
 16022287689	GRAPHICS_VERSION(2001)
 		GRAPHICS_VERSION(2004)
 13011645652	GRAPHICS_VERSION(2004)
+22019338487	MEDIA_VERSION(2000)
-- 
2.38.1

