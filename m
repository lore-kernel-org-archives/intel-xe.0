Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD59BD32D8A
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 14:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FFB10EB46;
	Fri,  5 Dec 2025 14:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGn+hbI6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BD510EB46
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 14:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764945678; x=1796481678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UzvsXgivqjeksvWiCgv2X+7mmnoPW2U+h8TSVXiZ6pI=;
 b=JGn+hbI6U2KqrXkyfMLgd29kGfZgPlkY8VoWhxtkIusjHwQnCCSkijlj
 C9JuzNg6io7aM0qb1mtQPJ+sU2OEerf49LgNp23qjcXk4cgbukXUfXnYx
 6H9WK12h9LQ3JItLkada38HqrRUTX2RbD5U2ImDCEj/ffy7QLKXMttQcP
 deecVzOVtChHlG/7R+Y96+dTpUQsM/GISZJwbDivB4pK1E/4KqeQvCvOE
 nzZxPNy6SNFxg7wucDGm4ylPNQ41CubIHq7dDXyc+uWNv+de46Wb3XBWU
 FVcPDfPGJ12uluxnYyMpPN6mBCQlnoce/4AC/VDOcJSKTaYXJw9r131D3 A==;
X-CSE-ConnectionGUID: RMFLNvlDQSixD3/SL8D4Zw==
X-CSE-MsgGUID: 6cJwtuzTTMqT+WKiO4/lbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="84583269"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="84583269"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 06:41:17 -0800
X-CSE-ConnectionGUID: bNDSkxjPRj2iTO+hy/NRcg==
X-CSE-MsgGUID: UkJJIb1lS2y0+v28pgFdOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194379274"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by orviesa006.jf.intel.com with ESMTP; 05 Dec 2025 06:41:18 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
Date: Fri,  5 Dec 2025 06:38:14 -0800
Message-Id: <20251205143815.1343989-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20251205143815.1343989-1-vinay.belgaumkar@intel.com>
References: <20251205143815.1343989-1-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_guc.c    |   5 ++
 drivers/gpu/drm/xe/xe_guc_pc.c |  50 -------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
 drivers/gpu/drm/xe/xe_guc_rc.c | 128 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  18 +++++
 drivers/gpu/drm/xe/xe_uc.c     |   7 +-
 7 files changed, 158 insertions(+), 52 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index a7e13a676f7d..d1258bd22752 100644
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
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 88376bc2a483..72740d17c769 100644
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
@@ -865,6 +866,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
+	ret = xe_guc_rc_init(guc_to_gt(guc));
+	if (ret)
+		return ret;
+
 	ret = xe_guc_engine_activity_init(guc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e2e6edb851ae..5ced9ef37cf3 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -253,22 +253,6 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
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
@@ -1050,30 +1034,6 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
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
@@ -1257,15 +1217,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
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
 
@@ -1310,7 +1261,6 @@ static void xe_guc_pc_fini_hw(void *arg)
 		return;
 
 	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
-	xe_guc_pc_gucrc_disable(pc);
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
index 000000000000..945433ef35f0
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_guc_rc.h"
+
+#include <drm/drm_managed.h>
+#include <drm/drm_print.h>
+
+#include "abi/guc_actions_slpc_abi.h"
+#include "xe_device.h"
+#include "xe_force_wake.h"
+#include "xe_gt.h"
+#include "xe_gt_idle.h"
+#include "xe_gt_printk.h"
+#include "xe_guc_ct.h"
+#include "xe_pm.h"
+
+/**
+ * DOC: GuC RC
+ * ================
+ *
+ * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
+ * GuC RC can be enabled independently of DVFS, which is also controlled
+ * by GuC.
+ *
+ */
+
+static int guc_action_setup_gucrc(struct xe_gt *gt, u32 control)
+{
+	struct xe_guc_ct *ct = &gt->uc.guc.ct;
+	u32 action[] = {
+		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
+		control,
+	};
+	int ret;
+
+	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+	if (ret && !(xe_device_wedged(gt_to_xe(gt)) && ret == -ECANCELED))
+		xe_gt_err(gt, "GuC RC enable control=%u failed: %pe\n",
+			  control, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_guc_rc_disable - Disable GuC RC
+ * @gt: Xe GT instance
+ *
+ * Disables GuC RC by taking control of RC6 back from GuC.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_rc_disable(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret = 0;
+
+	if (xe->info.skip_guc_pc)
+		return 0;
+
+	ret = guc_action_setup_gucrc(gt, GUCRC_HOST_CONTROL);
+	if (ret)
+		return ret;
+
+	return xe_gt_idle_disable_c6(gt);
+}
+
+static void xe_guc_rc_fini_hw(void *arg)
+{
+	struct xe_gt *gt = arg;
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe_device_wedged(xe))
+		return;
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	xe_guc_rc_disable(gt);
+}
+
+/**
+ * xe_guc_rc_init - Initialize GuC RC
+ * @gt: Xe GT instance
+ *
+ * Initializes GuC RC feature.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_rc_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+
+	if (xe->info.skip_guc_pc)
+		return 0;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, gt);
+}
+
+static int xe_guc_rc_enable(struct xe_gt *gt)
+{
+	return  guc_action_setup_gucrc(gt, GUCRC_FIRMWARE_CONTROL);
+}
+
+int xe_guc_rc_start(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int ret;
+
+	xe_gt_assert(gt, xe_device_uc_enabled(xe));
+
+	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
+	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT))
+		return -ETIMEDOUT;
+
+	if (xe->info.skip_guc_pc) {
+		if (xe->info.platform != XE_PVC)
+			xe_gt_idle_enable_c6(gt);
+
+		return ret;
+	}
+
+	if (xe->info.platform == XE_PVC) {
+		xe_guc_rc_disable(gt);
+		return 0;
+	}
+
+	return xe_guc_rc_enable(gt);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
new file mode 100644
index 000000000000..3a8c8d50313f
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_rc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_GUC_RC_H_
+#define _XE_GUC_RC_H_
+
+#include <linux/types.h>
+
+struct xe_gt;
+enum slpc_gucrc_mode;
+
+int xe_guc_rc_disable(struct xe_gt *gt);
+int xe_guc_rc_start(struct xe_gt *gt);
+int xe_guc_rc_init(struct xe_gt *gt);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 157520ea1783..44e5fabe2a50 100644
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
 
+	ret = xe_guc_rc_start(uc_to_gt(uc));
+	if (ret)
+		goto err_out;
+
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
 	/* We don't fail the driver load if HuC fails to auth */
@@ -246,7 +251,7 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
 
 void xe_uc_gucrc_disable(struct xe_uc *uc)
 {
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
+	XE_WARN_ON(xe_guc_rc_disable(uc_to_gt(uc)));
 }
 
 void xe_uc_stop_prepare(struct xe_uc *uc)
-- 
2.38.1

