Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D450C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 31 May 2023 06:58:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538F010E1B5;
	Wed, 31 May 2023 06:58:08 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315D710E1B5
 for <intel-xe@lists.freedesktop.org>; Wed, 31 May 2023 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685516286; x=1717052286;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7mpRQZfeYxAi7pZUfzOMKTv9AIOazRN5snFPqkKkWSE=;
 b=C2OefxVd2AUQmIgyJ3YRrF/LNjG0BK7sytoxUQDrdYgpBpoIWvW2qIcK
 eR5FmYR3HX6EiCX89NoEqPalw7RR0niV+sgKKo6bGQ71+LbFwWjLc4uaR
 c96sxzi5OhkjwkCbcH4YoT0J5rA6EyFLFCcv9qpHExH73sLAOorMVUmPw
 VeSmsdsFAhR2h5gWO9t0nP/RC1ZbST7DbnInn41WQQTkf3Fa3HVLwv2/2
 T1M4vmzGY5mZ74m6+Vwj5W0sQkgT6MxfpYSTPyjB0Q8WNfvwV0C7xkezC
 U2+1VEBzM9NWwko2zmCQyN16D4RGnCh5phz1A6oECmBeSuEykMEn8mj40 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="335504464"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="335504464"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 23:58:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="776651468"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="776651468"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 23:58:03 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 31 May 2023 12:29:52 +0530
Message-Id: <20230531065952.2463488-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Do not disable rc6 in s2idle
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
Cc: anshuman.gupta@intel.com, vinay.belgaumkar@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Currently rc6 is disabled for all suspend paths but it
should be disabled only for S3+.

add a function to check the target suspend state and disable
rc6 for suspend states above s2idle

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     |  4 ++++
 drivers/gpu/drm/xe/xe_guc.c    |  5 +++++
 drivers/gpu/drm/xe/xe_guc.h    |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c | 12 ++++++------
 drivers/gpu/drm/xe/xe_guc_pc.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c     | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_pm.h     |  2 ++
 drivers/gpu/drm/xe/xe_uc.c     |  5 +++++
 drivers/gpu/drm/xe/xe_uc.h     |  1 +
 9 files changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 18eda5b1377f..75c24d794436 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -32,6 +32,7 @@
 #include "xe_migrate.h"
 #include "xe_mmio.h"
 #include "xe_pat.h"
+#include "xe_pm.h"
 #include "xe_mocs.h"
 #include "xe_reg_sr.h"
 #include "xe_ring_ops.h"
@@ -613,6 +614,7 @@ static int gt_reset(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
+	xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 	xe_gt_pagefault_reset(gt);
 	xe_gt_tlb_invalidation_reset(gt);
@@ -671,6 +673,8 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 	xe_device_mem_access_get(gt_to_xe(gt));
 	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 
+	if (xe_pm_suspend_target() > PM_SUSPEND_TO_IDLE)
+		xe_uc_gucrc_disable(&gt->uc);
 	xe_uc_stop_prepare(&gt->uc);
 
 	xe_device_mem_access_put(gt_to_xe(gt));
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index ecc843d91f62..b40a84ed6c0b 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -777,6 +777,11 @@ void xe_guc_reset_wait(struct xe_guc *guc)
 	xe_guc_submit_reset_wait(guc);
 }
 
+void xe_guc_gucrc_disable(struct xe_guc *guc)
+{
+	XE_WARN_ON(xe_guc_pc_gucrc_disable(&guc->pc));
+}
+
 void xe_guc_stop_prepare(struct xe_guc *guc)
 {
 	XE_WARN_ON(xe_guc_pc_stop(&guc->pc));
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 74a74051f354..29449f456df4 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -35,6 +35,7 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 int xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
+void xe_guc_gucrc_disable(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index e799faa1c6b8..de4c7b5e8658 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -730,7 +730,11 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
 	return ret;
 }
 
-static int pc_gucrc_disable(struct xe_guc_pc *pc)
+/**
+ * xe_guc_pc_gucrc_disable - disable gucrc
+ * @pc: Xe_GuC_PC instance
+ */
+int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
 	int ret;
@@ -827,7 +831,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 
 	if (xe->info.platform == XE_PVC) {
-		pc_gucrc_disable(pc);
+		xe_guc_pc_gucrc_disable(pc);
 		ret = 0;
 		goto out;
 	}
@@ -850,10 +854,6 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
 
 	xe_device_mem_access_get(pc_to_xe(pc));
 
-	ret = pc_gucrc_disable(pc);
-	if (ret)
-		goto out;
-
 	mutex_lock(&pc->freq_lock);
 	pc->freq_ready = false;
 	mutex_unlock(&pc->freq_lock);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index da29e4934868..797cda7ede6e 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -11,5 +11,6 @@
 int xe_guc_pc_init(struct xe_guc_pc *pc);
 int xe_guc_pc_start(struct xe_guc_pc *pc);
 int xe_guc_pc_stop(struct xe_guc_pc *pc);
+int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
 
 #endif /* _XE_GUC_PC_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b7b57f10ba25..fd91463c23a6 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -199,6 +199,20 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	return 0;
 }
 
+/**
+ * xe_pm_suspend_target - gets the current suspend target
+ *
+ * Return: suspend target if config_suspend is enabled, s2idle otherwise
+ */
+suspend_state_t xe_pm_suspend_target(void)
+{
+#if IS_ENABLED(CONFIG_SUSPEND)
+	return pm_suspend_target_state;
+#else
+	return PM_SUSPEND_TO_IDLE;
+#endif
+}
+
 int xe_pm_runtime_get(struct xe_device *xe)
 {
 	return pm_runtime_get_sync(xe->drm.dev);
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 6a885585f653..17087a69140f 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -7,6 +7,7 @@
 #define _XE_PM_H_
 
 #include <linux/pm_runtime.h>
+#include <linux/suspend.h>
 
 struct xe_device;
 
@@ -22,4 +23,5 @@ int xe_pm_runtime_put(struct xe_device *xe);
 bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
 int xe_pm_runtime_get_if_active(struct xe_device *xe);
 
+suspend_state_t xe_pm_suspend_target(void);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 70eabf567156..67c0e10f9f6d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -176,6 +176,11 @@ int xe_uc_reset_prepare(struct xe_uc *uc)
 	return xe_guc_reset_prepare(&uc->guc);
 }
 
+void xe_uc_gucrc_disable(struct xe_uc *uc)
+{
+	xe_guc_gucrc_disable(&uc->guc);
+}
+
 void xe_uc_stop_prepare(struct xe_uc *uc)
 {
 	xe_guc_stop_prepare(&uc->guc);
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index d6efc9ef00d3..b1c56c462d48 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -14,6 +14,7 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_init_hw(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
+void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
 int xe_uc_suspend(struct xe_uc *uc);
-- 
2.40.0

