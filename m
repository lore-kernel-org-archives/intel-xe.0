Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA95BD609D5
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 01:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6826410E9CB;
	Wed, 17 Dec 2025 01:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkHcy4WY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7551910E9CB
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 01:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765935595; x=1797471595;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r/boh1vN/FkE89ZzZUGRVT0WrCZIHplT0Eb0e4k9PsI=;
 b=bkHcy4WY/yGJYcxDK7ZWZS8KFJTROuvID5yTVyG+eX2otQdu/ZOosTJ3
 O/mvl08QwsZIowudRCFvkwpH5ZlD32h4EYBOmqwUWxEy77Pix5Hg6lpJK
 8oTuTdGZBZMjqHHy9bQkeEk7xYHKrU3+rxNsjkCI/SYgiWi/C3RF9c3+6
 RHwnRyzdJGfL4caaDxaN9BJru2DDT1MFC9FayghoG9rl2AoQFzL00i8Pr
 eW61XjPafSFlT642ORVyZSP2AjJBmiX1Og4b3dKxA11/9iEGDx10ZwFrw
 y2/j7aW++MLgdBNoUBULWanQXjZp/N5mqY48o/EOyhYVZC/CRrK9ER9Q/ A==;
X-CSE-ConnectionGUID: 6PNYtLCCRTKCgcwFZIib5Q==
X-CSE-MsgGUID: hUu2qH9lTQiWEW7exPB9SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67803947"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67803947"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 17:39:55 -0800
X-CSE-ConnectionGUID: YCMpwzxzQzmKOZfyQTTyWQ==
X-CSE-MsgGUID: C3z0GfhTQD2J1OigYjJOnw==
X-ExtLoop1: 1
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.39.23])
 by fmviesa003.fm.intel.com with ESMTP; 16 Dec 2025 17:39:54 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Decouple GuC RC code from xe_guc_pc
Date: Tue, 16 Dec 2025 17:37:01 -0800
Message-Id: <20251217013702.3597539-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
References: <20251217013702.3597539-1-vinay.belgaumkar@intel.com>
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

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/xe/Makefile    |   1 +
 drivers/gpu/drm/xe/xe_guc.c    |   5 ++
 drivers/gpu/drm/xe/xe_guc_pc.c |  57 +-------------
 drivers/gpu/drm/xe/xe_guc_pc.h |   1 -
 drivers/gpu/drm/xe/xe_guc_rc.c | 133 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_rc.h |  20 +++++
 drivers/gpu/drm/xe/xe_uc.c     |   8 +-
 7 files changed, 167 insertions(+), 58 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.c
 create mode 100644 drivers/gpu/drm/xe/xe_guc_rc.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 6ecba27d85f7..90f86ad11498 100644
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
index f0407bab9a0c..d05380893f39 100644
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
 
+	ret = xe_guc_rc_init(guc);
+	if (ret)
+		return ret;
+
 	ret = xe_guc_engine_activity_init(guc);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e2e6edb851ae..f8b683189f6c 100644
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
@@ -1217,9 +1177,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		return -ETIMEDOUT;
 
 	if (xe->info.skip_guc_pc) {
-		if (xe->info.platform != XE_PVC)
-			xe_gt_idle_enable_c6(gt);
-
 		/* Request max possible since dynamic freq mgmt is not enabled */
 		pc_set_cur_freq(pc, UINT_MAX);
 		return 0;
@@ -1257,15 +1214,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
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
 
@@ -1285,10 +1233,8 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 
-	if (xe->info.skip_guc_pc) {
-		xe_gt_idle_disable_c6(pc_to_gt(pc));
+	if (xe->info.skip_guc_pc)
 		return 0;
-	}
 
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
@@ -1310,7 +1256,6 @@ static void xe_guc_pc_fini_hw(void *arg)
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
index 000000000000..a526405b686b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_rc.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_guc_rc.h"
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
+#include "xe_pm.h"
+
+/**
+ * DOC: GuC RC
+ *
+ * GuC handles the GT transition to deeper C-states in conjunction with Pcode.
+ * GuC RC can be enabled independently of DVFS, which is also controlled
+ * by GuC.
+ *
+ */
+
+static int guc_action_setup_gucrc(struct xe_guc *guc, u32 control)
+{
+	struct xe_guc_ct *ct = &guc->ct;
+	u32 action[] = {
+		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
+		control,
+	};
+	int ret;
+
+	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
+	if (ret && !(xe_device_wedged(guc_to_xe(guc)) && ret == -ECANCELED))
+		xe_gt_err(guc_to_gt(guc), "GuC RC enable control=%u failed: %pe\n",
+			  control, ERR_PTR(ret));
+	return ret;
+}
+
+/**
+ * xe_guc_rc_disable() - Disable GuC RC
+ * @guc: Xe GuC instance
+ *
+ * Disables GuC RC by taking control of RC6 back from GuC.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_rc_disable(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+	int ret = 0;
+
+	if (xe->info.skip_guc_pc)
+		return 0;
+
+	ret = guc_action_setup_gucrc(guc, GUCRC_HOST_CONTROL);
+	if (ret)
+		return ret;
+
+	return xe_gt_idle_disable_c6(guc_to_gt(guc));
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
+ * xe_guc_rc_init() - Initialize GuC RC
+ * @guc: Xe GuC instance
+ *
+ * Initializes GuC RC feature.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_rc_init(struct xe_guc *guc)
+{
+	struct xe_device *xe = guc_to_xe(guc);
+
+	if (xe->info.skip_guc_pc)
+		return 0;
+
+	return devm_add_action_or_reset(xe->drm.dev, xe_guc_rc_fini_hw, guc);
+}
+
+static int xe_guc_rc_enable(struct xe_guc *guc)
+{
+	return  guc_action_setup_gucrc(guc, GUCRC_FIRMWARE_CONTROL);
+}
+
+/**
+ * xe_guc_rc_start() - Enable GuC RC feature if applicable
+ * @guc: Xe GuC instance
+ *
+ * Enables GuC RC feature.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_rc_start(struct xe_guc *guc)
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
+	if (xe->info.platform == XE_PVC)
+		return xe_guc_rc_disable(guc);
+
+	if (xe->info.skip_guc_pc) {
+		xe_gt_idle_enable_c6(gt);
+		return 0;
+	}
+
+	return xe_guc_rc_enable(guc);
+}
diff --git a/drivers/gpu/drm/xe/xe_guc_rc.h b/drivers/gpu/drm/xe/xe_guc_rc.h
new file mode 100644
index 000000000000..2500b0d1c151
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_guc_rc.h
@@ -0,0 +1,20 @@
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
+#include "xe_guc.h"
+
+struct xe_gt;
+struct xe_guc;
+
+int xe_guc_rc_disable(struct xe_guc *guc);
+int xe_guc_rc_start(struct xe_guc *guc);
+int xe_guc_rc_init(struct xe_guc *guc);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 157520ea1783..91eaddad331e 100644
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
 
+	ret = xe_guc_rc_start(&uc->guc);
+	if (ret)
+		goto err_out;
+
 	xe_guc_engine_activity_enable_stats(&uc->guc);
 
 	/* We don't fail the driver load if HuC fails to auth */
@@ -246,7 +251,8 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
 
 void xe_uc_gucrc_disable(struct xe_uc *uc)
 {
-	XE_WARN_ON(xe_guc_pc_gucrc_disable(&uc->guc.pc));
+	xe_gt_WARN_ONCE(uc_to_gt(uc), xe_guc_rc_disable(&uc->guc) != 0,
+			"Unable to disable GuC RC for gt: %d", uc_to_gt(uc)->info.id);
 }
 
 void xe_uc_stop_prepare(struct xe_uc *uc)
-- 
2.38.1

