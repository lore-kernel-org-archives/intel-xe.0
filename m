Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581AAD30CDB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 22:11:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141D710E55D;
	Tue, 13 Jan 2026 22:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXBgEHUB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361E110E55D
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768342260; x=1799878260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ABZEOnw9gagvZy5+bmtgP5drPT0vNSn5VBJyXaLLRY8=;
 b=BXBgEHUBnJlszMc9MVPpUNKwVa+OX4VQVR4PL5eXtIhKaxf2odhhLJ7Y
 5lA6Nhcn1sXq2X5BU9ZvgGV59tkWMGPGMsCyTxrpn8H6qeyumrlDxbXmp
 V8IZFONF3d+MXwhCdIEYTUrecwZwcbtKPMWBVv85/ANK3+sIObmbyNg/R
 iodF6x2RTLP8bhOymgaARVZgMUkHLEvA1up+0SW7nUotqiT4LMbcUcYEu
 Y+qnsVnCYXHOt0nnvFmCOU1Cgjy4yACJ30tzfRwwzhegGeta6C/M1wy6e
 eXbO51ekNxcBDt5BPlz9vLBFlgv6Yvs/JbmyKbw/jwL5RnmWLD3Wgul23 w==;
X-CSE-ConnectionGUID: IqaFZiWPTfiHmQoKW/mkjw==
X-CSE-MsgGUID: LycuqlnuT5WAGoHXAvxTVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87221058"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="87221058"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 14:11:00 -0800
X-CSE-ConnectionGUID: SUU49Q1BT8mUPGAfZmrlrQ==
X-CSE-MsgGUID: es33EEJGTLe0lBrrPVA56Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="227669059"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa002.fm.intel.com with ESMTP; 13 Jan 2026 14:11:00 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v5 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
Date: Tue, 13 Jan 2026 14:08:00 -0800
Message-Id: <20260113220801.2198264-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20260113220801.2198264-1-vinay.belgaumkar@intel.com>
References: <20260113220801.2198264-1-vinay.belgaumkar@intel.com>
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

Move enable/disable GuC RC logic into the new file. This will
allow us to independently enable/disable GuC RC and not rely
on SLPC related functions. GuC already provides separate H2G
interfaces to setup GuC RC and SLPC.

v2: Comments (Michal W), remove duplicate c6_enable calls from
xe_guc_pc.

v3: Clarify crosss interactions between xe_guc_rc and xe_guc_pc
(Michal W)

v4: More comments (Michal W)

v5: Remove rc_init and use enable/disable (Riana)

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_gt.c     |   1 -
 drivers/gpu/drm/xe/xe_guc.c    |   2 +
 drivers/gpu/drm/xe/xe_guc_pc.c |  70 ++++----------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
 drivers/gpu/drm/xe/xe_guc_rc.c | 114 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  14 ++++
 drivers/gpu/drm/xe/xe_uc.c     |  10 +--
 drivers/gpu/drm/xe/xe_uc.h     |   1 -
 9 files changed, 149 insertions(+), 65 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 89dc48cd73e2..928fdb925c13 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -74,6 +74,7 @@ xe-y += xe_bb.o \
 	xe_guc_log.o \
 	xe_guc_pagefault.o \
 	xe_guc_pc.o \
+	xe_guc_rc.o \
 	xe_guc_submit.o \
 	xe_guc_tlb_inval.o \
 	xe_heci_gsc.o \
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 313ce83ab0e5..9ee328aa6579 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -822,7 +822,6 @@ static void gt_reset_worker(struct work_struct *w)
 	if (IS_SRIOV_PF(gt_to_xe(gt)))
 		xe_gt_sriov_pf_stop_prepare(gt);
 
-	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_pagefault_reset(gt_to_xe(gt), gt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 44360437beeb..f66b0c987b09 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -35,6 +35,7 @@
 #include "xe_guc_klv_helpers.h"
 #include "xe_guc_log.h"
 #include "xe_guc_pc.h"
+#include "xe_guc_rc.h"
 #include "xe_guc_relay.h"
 #include "xe_guc_submit.h"
 #include "xe_memirq.h"
@@ -1609,6 +1610,7 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
 	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
 		int err;
 
+		xe_guc_rc_disable(guc);
 		err = xe_guc_pc_stop(&guc->pc);
 		xe_gt_WARN(guc_to_gt(guc), err, "Failed to stop GuC PC: %pe\n",
 			   ERR_PTR(err));
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 54702a0fd05b..cf02c53ca3c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -92,6 +92,17 @@
  * Render-C states is also a GuC PC feature that is now enabled in Xe for
  * all platforms.
  *
+ * Implementation details:
+ * -----------------------
+ * The implementation for GuC Power Management features is split as follows:
+ *
+ * xe_guc_rc:  Logic for handling GuC RC
+ * xe_gt_idle: Host side logic for RC6 and Coarse Power gating (CPG)
+ * xe_guc_pc:  Logic for all other SLPC related features
+ *
+ * There is some cross interaction between these where host C6 will need to be
+ * enabled when we plan to skip GuC RC. Also, the GuC RC mode is currently
+ * overridden through 0x3003 which is an SLPC H2G call.
  */
 
 static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
@@ -253,22 +264,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
 	return ret;
 }
 
-static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
-{
-	struct xe_guc_ct *ct = pc_to_ct(pc);
-	u32 action[] = {
-		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
-		mode,
-	};
-	int ret;
-
-	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
-	if (ret && !(xe_device_wedged(pc_to_xe(pc)) && ret == -ECANCELED))
-		xe_gt_err(pc_to_gt(pc), "GuC RC enable mode=%u failed: %pe\n",
-			  mode, ERR_PTR(ret));
-	return ret;
-}
-
 static u32 decode_freq(u32 raw)
 {
 	return DIV_ROUND_CLOSEST(raw * GT_FREQUENCY_MULTIPLIER,
@@ -1050,30 +1045,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
-/**
- * xe_guc_pc_gucrc_disable - Disable GuC RC
- * @pc: Xe_GuC_PC instance
- *
- * Disables GuC RC by taking control of RC6 back from GuC.
- *
- * Return: 0 on success, negative error code on error.
- */
-int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
-{
-	struct xe_device *xe = pc_to_xe(pc);
-	struct xe_gt *gt = pc_to_gt(pc);
-	int ret = 0;
-
-	if (xe->info.skip_guc_pc)
-		return 0;
-
-	ret = pc_action_setup_gucrc(pc, GUCRC_HOST_CONTROL);
-	if (ret)
-		return ret;
-
-	return xe_gt_idle_disable_c6(gt);
-}
-
 /**
  * xe_guc_pc_override_gucrc_mode - override GUCRC mode
  * @pc: Xe_GuC_PC instance
@@ -1217,9 +1188,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		return -ETIMEDOUT;
 
 	if (xe->info.skip_guc_pc) {
-		if (xe->info.platform != XE_PVC)
-			xe_gt_idle_enable_c6(gt);
-
 		/* Request max possible since dynamic freq mgmt is not enabled */
 		pc_set_cur_freq(pc, UINT_MAX);
 		return 0;
@@ -1257,15 +1225,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		return ret;
 
-	if (xe->info.platform == XE_PVC) {
-		xe_guc_pc_gucrc_disable(pc);
-		return 0;
-	}
-
-	ret = pc_action_setup_gucrc(pc, GUCRC_FIRMWARE_CONTROL);
-	if (ret)
-		return ret;
-
 	/* Enable SLPC Optimized Strategy for compute */
 	ret = pc_action_set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
 
@@ -1285,10 +1244,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 
-	if (xe->info.skip_guc_pc) {
-		xe_gt_idle_disable_c6(pc_to_gt(pc));
+	if (xe->info.skip_guc_pc)
 		return 0;
-	}
 
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
@@ -1309,8 +1266,7 @@ static void xe_guc_pc_fini_hw(void *arg)
 	if (xe_device_wedged(xe))
 		return;
 
-	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
-	xe_guc_pc_gucrc_disable(pc);
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
 	XE_WARN_ON(xe_guc_pc_stop(pc));
 
 	/* Bind requested freq to mert_freq_cap before unload */
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index 0e31396f103c..1b95873b262e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -15,7 +15,6 @@ struct drm_printer;
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
-int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 int xe_guc_pc_override_gucrc_mode(struct xe_guc_pc *pc, enum slpc_gucrc_mode mode);
 int xe_guc_pc_unset_gucrc_mode(struct xe_guc_pc *pc);
 void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.c b/drivers/gpu/drm/xe/xe_guc_rc.c
new file mode 100644
index 000000000000..214473be6c83
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <linux/device/devres.h>
+#include <drm/drm_print.h>
+
+#include "abi/guc_actions_slpc_abi.h"
+#include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
+#include "xe_guc.h"
+#include "xe_gt_idle.h"
+#include "xe_gt_printk.h"
+#include "xe_guc_ct.h"
+#include "xe_guc_rc.h"
+#include "xe_pm.h"
+
+/**
+ * DOC: GuC RC (Render C-states)
+ *
+ * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
+ * GuC RC can be enabled independently of the frequency component in SLPC,
+ * which is also controlled by GuC.
+ *
+ * This file will contain all H2G related logic for handling Render C-states.
+ * There are some calls to xe_gt_idle, where we enable host C6 when GuC RC is
+ * skipped. GuC RC is mostly independent of xe_guc_pc with the exception of
+ * functions that override the mode for which we have to rely on the SLPC H2G
+ * calls.
+ */
+
+static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
+{
+	u32 action[] = {
+		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
+		control,
+	};
+	int ret;
+
+	ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
+	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
+		xe_gt_err(guc_to_gt(guc),
+			  "GuC RC setup %s(%u) failed (%pe)\n",
+			   control == GUCRC_HOST_CONTROL ? "HOST_CONTROL" :
+			   control == GUCRC_FIRMWARE_CONTROL ? "FIRMWARE_CONTROL" :
+			   "UNKNOWN", control, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_guc_rc_disable() - Disable GuC RC
+ * @guc: Xe GuC instance
+ *
+ * Disables GuC RC by taking control of RC6 back from GuC.
+ */
+void xe_guc_rc_disable(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+
+	if (!xe->info.skip_guc_pc && (xe->info.platform != XE_PVC))
+		if (guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL))
+			return;
+
+	XE_WARN_ON(xe_gt_idle_disable_c6(guc_to_gt(guc)));
+}
+
+static void xe_guc_rc_fini_hw(void *arg)
+{
+	struct xe_guc *guc = arg;
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	if (xe_device_wedged(xe))
+		return;
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	xe_guc_rc_disable(guc);
+}
+
+/**
+ * xe_guc_rc_enable() - Enable GuC RC feature if applicable
+ * @guc: Xe GuC instance
+ *
+ * Enables GuC RC feature.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_rc_enable(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_gt *gt = guc_to_gt(guc);
+
+	xe_gt_assert(gt, xe_device_uc_enabled(xe));
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
+		return -ETIMEDOUT;
+
+	if (xe->info.platform == XE_PVC) {
+		xe_guc_rc_disable(guc);
+		return 0;
+	}
+
+	if (xe->info.skip_guc_pc) {
+		xe_gt_idle_enable_c6(gt);
+		return 0;
+	}
+
+	devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
+
+	return guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
new file mode 100644
index 000000000000..9798cc80fb4a
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_rc.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_RC_H_
+#define _XE_GUC_RC_H_
+
+struct xe_guc;
+
+void xe_guc_rc_disable(struct xe_guc *guc);
+int xe_guc_rc_enable(struct xe_guc *guc);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 157520ea1783..2212f195f5a1 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -14,6 +14,7 @@
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
 #include "xe_guc_pc.h"
+#include "xe_guc_rc.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
@@ -216,6 +217,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
 	if (ret)
 		goto err_out;
 
+	ret = xe_guc_rc_enable(&uc->guc);
+	if (ret)
+		goto err_out;
+
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
 	/* We don't fail the driver load if HuC fails to auth */
@@ -244,11 +249,6 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
 	return xe_guc_reset_prepare(&uc->guc);
 }
 
-void xe_uc_gucrc_disable(struct xe_uc *uc)
-{
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
-}
-
 void xe_uc_stop_prepare(struct xe_uc *uc)
 {
 	xe_gsc_stop_prepare(&uc->gsc);
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 5398da1a8097..255a54a8f876 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -12,7 +12,6 @@ int xe_uc_init_noalloc(struct xe_uc *uc);
 int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_load_hw(struct xe_uc *uc);
-void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_runtime_resume(struct xe_uc *uc);
 void xe_uc_runtime_suspend(struct xe_uc *uc);
-- 
2.38.1

