Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BDFEE49AF
	for <intel-xe@archiver.kernel.org>; Wed, 23 Aug 2023 05:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CD810E239;
	Wed, 23 Aug 2023 05:04:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCA210E224
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Aug 2023 05:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692767077; x=1724303077;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H1AH4WamYmvf+VDBMBfypVUEt1IBaXjl46Sn/XUUPvc=;
 b=SB97I8H6cDW+vzBh7j4mACOeGAlOPwjb1yGKoonehgIi/xCP2gZ2+ihR
 +dzSLSUZQ4m8RGO0BjdpWP6ViUpjFV+94wLIKGSSrQmBvE7KAjIpZbNcD
 TI+JLbZp9aOTCHwZEwtjiXxc42BLMrqyWJQWavfCQoK948PAcYcbuw1pk
 KHLa3imXT+5kTRhgC3IJEG3DdSOg4FDaIfuJ8O4/oli6zIecsTTlTgntK
 n7P9rf2iRRHXPGLFOdBvPGrMgnKn02v/ry7gN608RntApCITGND28QZFb
 wNsQ0RdfStMLq8x0sXy5G6m5ySV7yHYKJehrZOJrFefAvyzN1n3HWDtAH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372956874"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="372956874"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="983130437"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="983130437"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 22:04:36 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 23 Aug 2023 10:39:55 +0530
Message-Id: <20230823050955.1226024-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230823050955.1226024-1-riana.tauro@intel.com>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] RFC drm/xe: Disable GuC CT communication for
 D3Hot Transition
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

During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
transistions. It is not necessary for GuC to reset for D0 -> D3hot,
only enable/disable ctb communication.

Add a function that enables/disables CT communication when d3cold
is not allowed.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt.h |  2 ++
 drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
 drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
 drivers/gpu/drm/xe/xe_uc.h |  2 ++
 5 files changed, 85 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 13320af4ddd3..0d52621ce64d 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
 	return err;
 }
 
+int xe_gt_runtime_suspend(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_suspend(gt);
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return err;
+
+	err = xe_uc_disable_communication(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	xe_gt_info(gt, "suspended\n");
+
+	return 0;
+
+err_force_wake:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
+
+	return err;
+}
+
+int xe_gt_runtime_resume(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	if (xe->d3cold.allowed)
+		return xe_gt_resume(gt);
+
+	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+	if (err)
+		return err;
+
+	err = xe_uc_resume(&gt->uc);
+	if (err)
+		goto err_force_wake;
+
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	xe_gt_info(gt, "resumed\n");
+
+	return 0;
+
+err_force_wake:
+	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
+	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
+
+	return err;
+}
+
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance, bool logical)
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index caded203a8a0..e6574e51004f 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
 void xe_gt_suspend_prepare(struct xe_gt *gt);
 int xe_gt_suspend(struct xe_gt *gt);
 int xe_gt_resume(struct xe_gt *gt);
+int xe_gt_runtime_suspend(struct xe_gt *gt);
+int xe_gt_runtime_resume(struct xe_gt *gt);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 0f06d8304e17..6bc01bb45fc2 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_runtime_suspend(gt);
 		if (err)
 			goto out;
 	}
@@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 
 	xe_irq_resume(xe);
 
-	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+	for_each_gt(gt, xe, id) {
+		err = xe_gt_runtime_resume(gt);
+		if (err)
+			goto out;
+	}
 
 	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
 	}
+
 out:
 	lock_map_release(&xe_device_mem_access_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index addd6f2681b9..b5b53c8c3edb 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
 		goto again;
 }
 
+int xe_uc_disable_communication(struct xe_uc *uc)
+{
+	/* GuC submission not enabled, nothing to do */
+	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+		return 0;
+
+	return xe_guc_disable_communication(&uc->guc);
+}
+
 int xe_uc_suspend(struct xe_uc *uc)
 {
 	int ret;
@@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
 
 	return xe_guc_suspend(&uc->guc);
 }
+
+int xe_uc_resume(struct xe_uc *uc)
+{
+	/* GuC submission not enabled, nothing to do */
+	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
+		return 0;
+
+	return xe_guc_enable_communication(&uc->guc);
+}
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 42219b361df5..29bd692d8800 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
 int xe_uc_init_hwconfig(struct xe_uc *uc);
 int xe_uc_init_post_hwconfig(struct xe_uc *uc);
 int xe_uc_init_hw(struct xe_uc *uc);
+int xe_uc_disable_communication(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+int xe_uc_resume(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 int xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
-- 
2.40.0

