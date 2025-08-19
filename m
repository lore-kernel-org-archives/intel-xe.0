Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98219CA0EF7
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 11:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5B410E5B7;
	Tue, 19 Aug 2025 11:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VWbUw3zn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B236B10E5B8
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755603367; x=1787139367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iHrPHyEuRjSDX36TidksCJ9TnYzDzs1cbLl+yIMKa50=;
 b=VWbUw3znHGzD7VNX0RC+VtcaMKYO/Yv98YXWChRKXUtEvwBDcpe9G05A
 8rbFpAo+hdvA2O/a/kiwH5wkkeuGFJSHm1NDIAvFuXtV1LAakEzOR3Rh5
 wFOpGzEUM4EF+hRS/7N7wa1/kNR1KBE87a88slVsVols3qDnQTTji86Qa
 b0GSu3paQ8+/5NnU6E3n4wet31YPjCXKiJYyFm3Ut9Wm6Wd/00B5M4T5Y
 hnIx6M3bz2s43NiF01QwOrEfTaCfF/JDPdLg1+tlpwwZs9oI5IcVDwTGX
 JnRh6NnaWxeU6zF/tNIKa/5Sb2yfCpx/B1grzt1nbYVmFSvhvfe4oA/SX A==;
X-CSE-ConnectionGUID: QspuCAOFQ527/r3wxGpSdg==
X-CSE-MsgGUID: 6Ke2xuv7SNGJhSxt+rWjjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57768948"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57768948"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 04:36:07 -0700
X-CSE-ConnectionGUID: yeVKmPasQ42dlrsR+jH5nw==
X-CSE-MsgGUID: 6E1ZFv+cTh+n9CsYfe4w4Q==
X-ExtLoop1: 1
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa003.fm.intel.com with ESMTP; 19 Aug 2025 04:36:04 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] drm/xe/gt: Introduce runtime suspend/resume
Date: Tue, 19 Aug 2025 17:05:05 +0530
Message-Id: <20250819113505.1592229-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

If power state is retained between suspend/resume cycle, we don't have
to perform full gt re-initialization. Introduce runtime helpers for gt
which greatly reduces suspend/resume delay.

Originally-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 50 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 ++
 drivers/gpu/drm/xe/xe_guc.c    | 16 +++++++++++
 drivers/gpu/drm/xe/xe_guc.h    |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 13 ++++++---
 drivers/gpu/drm/xe/xe_guc_ct.h |  1 +
 drivers/gpu/drm/xe/xe_pm.c     |  4 +--
 drivers/gpu/drm/xe/xe_uc.c     | 19 +++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a3397f04abcc..19919760da00 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -943,6 +943,32 @@ int xe_gt_suspend(struct xe_gt *gt)
 	return err;
 }
 
+int xe_gt_runtime_suspend(struct xe_gt *gt)
+{
+	unsigned int fw_ref;
+	int err = -ETIMEDOUT;
+
+	xe_gt_dbg(gt, "runtime suspending\n");
+	xe_gt_sanitize(gt);
+
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		goto err_msg;
+
+	xe_uc_runtime_suspend(&gt->uc);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_gt_dbg(gt, "runtime suspended\n");
+
+	return 0;
+
+err_msg:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(err));
+
+	return err;
+}
+
 void xe_gt_shutdown(struct xe_gt *gt)
 {
 	unsigned int fw_ref;
@@ -1002,6 +1028,30 @@ int xe_gt_resume(struct xe_gt *gt)
 	return err;
 }
 
+int xe_gt_runtime_resume(struct xe_gt *gt)
+{
+	unsigned int fw_ref;
+	int err = -ETIMEDOUT;
+
+	xe_gt_dbg(gt, "runtime resuming\n");
+	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
+	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
+		goto err_msg;
+
+	xe_uc_runtime_resume(&gt->uc);
+
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_gt_dbg(gt, "runtime resumed\n");
+
+	return 0;
+
+err_msg:
+	xe_force_wake_put(gt_to_fw(gt), fw_ref);
+	xe_gt_err(gt, "runtime resume failed (%pe)\n", ERR_PTR(err));
+
+	return err;
+}
+
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance, bool logical)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 41880979f4de..3f793230e78a 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -51,6 +51,8 @@ int xe_gt_suspend(struct xe_gt *gt);
 void xe_gt_shutdown(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
+int xe_gt_runtime_resume(struct xe_gt *gt);
+int xe_gt_runtime_suspend(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 433abc787f7b..f4f55027dd7a 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1618,6 +1618,22 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
 	}
 }
 
+void xe_guc_pause(struct xe_guc *guc)
+{
+	xe_guc_submit_pause(guc);
+	xe_guc_ct_stop(&guc->ct);
+	xe_guc_ct_disable(&guc->ct);
+	guc->submission_state.enabled = false;
+}
+
+void xe_guc_unpause(struct xe_guc *guc)
+{
+	guc_enable_irq(guc);
+	xe_guc_ct_state_enable(&guc->ct);
+	guc->submission_state.enabled = true;
+	xe_guc_submit_unpause(guc);
+}
+
 void xe_guc_stop(struct xe_guc *guc)
 {
 	xe_guc_ct_stop(&guc->ct);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 22cf019a11bf..6385159d1711 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -51,6 +51,8 @@ void xe_guc_reset_wait(struct xe_guc *guc);
 void xe_guc_stop_prepare(struct xe_guc *guc);
 void xe_guc_stop(struct xe_guc *guc);
 int xe_guc_start(struct xe_guc *guc);
+void xe_guc_pause(struct xe_guc *guc);
+void xe_guc_unpause(struct xe_guc *guc);
 void xe_guc_declare_wedged(struct xe_guc *guc);
 
 static inline u16 xe_engine_class_to_guc_class(enum xe_engine_class class)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f4e6a46ff16..283d7631a940 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -465,6 +465,14 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
 }
 
+void xe_guc_ct_state_enable(struct xe_guc_ct *ct)
+{
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
+
+	if (ct_needs_safe_mode(ct))
+		ct_enter_safe_mode(ct);
+}
+
 int xe_guc_ct_enable(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
@@ -489,14 +497,11 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (err)
 		goto err_out;
 
-	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
+	xe_guc_ct_state_enable(ct);
 
 	smp_mb();
 	wake_up_all(&ct->wq);
 
-	if (ct_needs_safe_mode(ct))
-		ct_enter_safe_mode(ct);
-
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	/*
 	 * The CT has now been reset so the dumper can be re-armed
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 18d4225e6502..34ad8c31c4ad 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -17,6 +17,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
+void xe_guc_ct_state_enable(struct xe_guc_ct *ct);
 
 struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
 void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 51ed7270994a..9a306b5fbdaa 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -495,7 +495,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
 		if (err)
 			goto out_resume;
 	}
@@ -558,7 +558,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
 
 	xe_display_pm_runtime_resume(xe);
 
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 465bda355443..ac2910ce027d 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -15,6 +15,7 @@
 #include "xe_guc.h"
 #include "xe_guc_pc.h"
 #include "xe_guc_engine_activity.h"
+#include "xe_guc_submit.h"
 #include "xe_huc.h"
 #include "xe_sriov.h"
 #include "xe_uc_fw.h"
@@ -301,6 +302,24 @@ int xe_uc_suspend(struct xe_uc *uc)
 	return xe_guc_suspend(&uc->guc);
 }
 
+void xe_uc_runtime_suspend(struct xe_uc *uc)
+{
+	/* GuC submission not enabled, nothing to do */
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return;
+
+	xe_guc_pause(&uc->guc);
+}
+
+void xe_uc_runtime_resume(struct xe_uc *uc)
+{
+	/* GuC submission not enabled, nothing to do */
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return;
+
+	xe_guc_unpause(&uc->guc);
+}
+
 /**
  * xe_uc_declare_wedged() - Declare UC wedged
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 21c9306098cf..5398da1a8097 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_load_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+void xe_uc_runtime_resume(struct xe_uc *uc);
+void xe_uc_runtime_suspend(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
-- 
2.34.1

