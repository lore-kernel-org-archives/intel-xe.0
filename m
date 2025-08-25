Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6728BCA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 11:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3137110E441;
	Mon, 25 Aug 2025 11:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gus1eO6U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B1F10E441
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756120897; x=1787656897;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NIdrCP6ZQauTIaZvMTl9ReaQzZmYxtwhvYx3rMPiVDg=;
 b=gus1eO6UXW8qwdpkV7aRwRUpx+q7W1ZTQc5CCWAeussBCX5F/NCKjuPM
 O76F17U2yCummkqrssrD1vw+10oGz+9Ep1NcUeILkyhNL9NMI+UoR3u9/
 zC1og4Q5fO8ku4Xu4NOZW1DHqtO4YpjR2hLgJ7bhzW/vFQ54w0sJCJvyk
 nCgLx6Sru5bd9YQTZ0MrHLI7Iz7gVu5ChG0TfSq0eww3YzZlbra5680ll
 mRtzHI/E7QvZ4OxDEY0M4ZFtuzDKrog0ak403X/h0wLDLLNqime9mhiuc
 ey6798WmGhoXQYOqONu+qGpZqDICK6TMHoC6ns+HgLl6zpHjsCeHPfP2B A==;
X-CSE-ConnectionGUID: mLDzNgLxRjGaVnvoIfz2bg==
X-CSE-MsgGUID: XE0AelIATqGgj95ilW7B2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62158726"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62158726"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:21:37 -0700
X-CSE-ConnectionGUID: XTeSn6adSOuFdJYa1WAWUg==
X-CSE-MsgGUID: lLp1nhTzSd2Ae4CZ1yQwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="200161226"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa001.fm.intel.com with ESMTP; 25 Aug 2025 04:21:33 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] drm/xe/gt: Introduce runtime suspend/resume
Date: Mon, 25 Aug 2025 16:50:25 +0530
Message-Id: <20250825112025.1766637-1-raag.jadav@intel.com>
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
which greatly reduce suspend/resume delay.

v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
    Use runtime naming for guc helpers (Daniele)
    s/xe_guc_ct_enable/xe_guc_ct_register (Daniele)

Originally-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 49 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h     |  2 ++
 drivers/gpu/drm/xe/xe_guc.c    | 23 +++++++++++++++-
 drivers/gpu/drm/xe/xe_guc.h    |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 15 +++++++----
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 ++-
 drivers/gpu/drm/xe/xe_pm.c     |  4 +--
 drivers/gpu/drm/xe/xe_uc.c     | 19 +++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 110 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index a3397f04abcc..9004af061af3 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -943,6 +943,31 @@ int xe_gt_suspend(struct xe_gt *gt)
 	return err;
 }
 
+int xe_gt_runtime_suspend(struct xe_gt *gt)
+{
+	unsigned int fw_ref;
+	int err = -ETIMEDOUT;
+
+	xe_gt_dbg(gt, "runtime suspending\n");
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
@@ -1002,6 +1027,30 @@ int xe_gt_resume(struct xe_gt *gt)
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
index 37d06c51180c..70598df83ef3 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1355,7 +1355,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	err = xe_guc_ct_enable(&guc->ct);
+	err = xe_guc_ct_register(&guc->ct);
 	if (err)
 		return err;
 
@@ -1626,6 +1626,27 @@ void xe_guc_stop_prepare(struct xe_guc *guc)
 	}
 }
 
+void xe_guc_runtime_suspend(struct xe_guc *guc)
+{
+	xe_guc_submit_pause(guc);
+	guc->submission_state.enabled = false;
+
+	/*
+	 * Since we're already in runtime suspend path, we shouldn't have pending
+	 * messages. But in case there turn out to be any, we'd probably want them
+	 * to be thrown as errors for further investigation.
+	 */
+	xe_guc_ct_disable(&guc->ct);
+}
+
+void xe_guc_runtime_resume(struct xe_guc *guc)
+{
+	guc_enable_irq(guc);
+	xe_guc_ct_enable(&guc->ct);
+	guc->submission_state.enabled = true;
+	xe_guc_submit_unpause(guc);
+}
+
 void xe_guc_stop(struct xe_guc *guc)
 {
 	xe_guc_ct_stop(&guc->ct);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 22cf019a11bf..e3736300ffd8 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_opt_in_features_enable(struct xe_guc *guc);
+void xe_guc_runtime_suspend(struct xe_guc *guc);
+void xe_guc_runtime_resume(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 3f4e6a46ff16..f769245f91ae 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -465,7 +465,15 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
 }
 
-int xe_guc_ct_enable(struct xe_guc_ct *ct)
+void xe_guc_ct_enable(struct xe_guc_ct *ct)
+{
+	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
+
+	if (ct_needs_safe_mode(ct))
+		ct_enter_safe_mode(ct);
+}
+
+int xe_guc_ct_register(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -489,14 +497,11 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (err)
 		goto err_out;
 
-	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
+	xe_guc_ct_enable(ct);
 
 	smp_mb();
 	wake_up_all(&ct->wq);
 
-	if (ct_needs_safe_mode(ct))
-		ct_enter_safe_mode(ct);
-
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
 	/*
 	 * The CT has now been reset so the dumper can be re-armed
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 18d4225e6502..32ce578b031c 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -13,8 +13,9 @@ struct xe_device;
 
 int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
 int xe_guc_ct_init(struct xe_guc_ct *ct);
-int xe_guc_ct_enable(struct xe_guc_ct *ct);
+void xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
+int xe_guc_ct_register(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
 
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
index 465bda355443..e0ebe5e4fc49 100644
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
+	xe_guc_runtime_suspend(&uc->guc);
+}
+
+void xe_uc_runtime_resume(struct xe_uc *uc)
+{
+	/* GuC submission not enabled, nothing to do */
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return;
+
+	xe_guc_runtime_resume(&uc->guc);
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

