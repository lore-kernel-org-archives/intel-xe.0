Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D5DC2BD05
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 07:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328B310E373;
	Mon, 24 Jun 2024 07:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJelIjfL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCA510E373
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jun 2024 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719213319; x=1750749319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VAj/0QNFzdT5nhA92WC5FyiDC3EkxrNGcE6eDyKfilw=;
 b=hJelIjfLSfZ6OEL31DmLqu7xJ7Y7/8sZrFKiREO62H9MJA9EyNTxmwrY
 sRu4eusczQ6c5X7Zg3zylOUqVi8b7yIpQtL56PKqx/+AnqKc3jE2KZS4G
 dSsaPA/600sC2bJF/pQWap9tEEQiePsL1fmmSBJJJYX2fuHi1Nd0ywLwp
 pB4tDLyGA0e5aQ4vDMnm/tg9OJDr0GEm6Df7IV6pb47BG7CkyFUpMAqf6
 Y+u6T2YRn009D7m2CDVpdgKcxchC6NpgbjmfKPYY3PjhRClL8K2PgVpFp
 uxi2aB8pTPca1OtPXRgsT/ms+zqYvd7czm6o7yMfb9csT74ZdJEMzcrfG A==;
X-CSE-ConnectionGUID: 8Q8MeZvbSlGGJMFVAqCAwQ==
X-CSE-MsgGUID: BJxyBll2SaCSBhVNtox5jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16313613"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16313613"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:15:18 -0700
X-CSE-ConnectionGUID: eKOdYVMpSaKo6ki8MPIjnA==
X-CSE-MsgGUID: cuYSMPu2TjyNv3JKkoTItg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="74428342"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:15:17 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com
Subject: [PATCH v2] drm/xe: remove GuC reload in D3Hot path
Date: Mon, 24 Jun 2024 12:57:54 +0530
Message-Id: <20240624072754.2231533-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Currently GuC is reloaded for both runtime suspend
and system suspend. For D3hot <-> D0 transitions
no power is lost on suspend and GuC reload is not
necessary.

remove GuC reload from D3Hot path and only enable/disable
CTB communications

v2: rebase

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c     | 19 ++++++++++---
 drivers/gpu/drm/xe/xe_gt.h     |  4 +--
 drivers/gpu/drm/xe/xe_guc.c    | 52 +++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc.h    |  2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 35 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_ct.h |  3 +-
 drivers/gpu/drm/xe/xe_pm.c     |  8 +++---
 drivers/gpu/drm/xe/xe_uc.c     | 30 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_uc.h     |  2 ++
 9 files changed, 136 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 759634cff1d8..5b48e4db9776 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -776,8 +776,9 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
-int xe_gt_suspend(struct xe_gt *gt)
+int xe_gt_suspend(struct xe_gt *gt, bool runtime)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
@@ -787,7 +788,11 @@ int xe_gt_suspend(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
-	err = xe_uc_suspend(&gt->uc);
+	if (runtime && !xe->d3cold.allowed)
+		err = xe_uc_runtime_suspend(&gt->uc);
+	else
+		err = xe_uc_suspend(&gt->uc);
+
 	if (err)
 		goto err_force_wake;
 
@@ -825,8 +830,9 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 	return ret;
 }
 
-int xe_gt_resume(struct xe_gt *gt)
+int xe_gt_resume(struct xe_gt *gt, bool runtime)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
@@ -834,7 +840,12 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
-	err = do_gt_restart(gt);
+	/* Do not reload GuC at runtime resume from D3Hot to D0 */
+	if (runtime && !xe->d3cold.allowed)
+		xe_uc_runtime_resume(&gt->uc);
+	else
+		err = do_gt_restart(gt);
+
 	if (err)
 		goto err_force_wake;
 
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 1123fdfc4ebc..4c942e4716ad 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
 void xe_gt_record_user_engines(struct xe_gt *gt);
 
 void xe_gt_suspend_prepare(struct xe_gt *gt);
-int xe_gt_suspend(struct xe_gt *gt);
-int xe_gt_resume(struct xe_gt *gt);
+int xe_gt_suspend(struct xe_gt *gt, bool runtime);
+int xe_gt_resume(struct xe_gt *gt, bool runtime);
 void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 int xe_gt_sanitize_freq(struct xe_gt *gt);
diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 172b65a50e31..1ea1d00f93f3 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -870,7 +870,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	err = xe_guc_ct_enable(&guc->ct);
+	err = xe_guc_ct_register(&guc->ct);
 	if (err)
 		return err;
 
@@ -1101,6 +1101,56 @@ void xe_guc_sanitize(struct xe_guc *guc)
 	guc->submission_state.enabled = false;
 }
 
+/**
+ * xe_guc_runtime_suspend - GuC runtime suspend
+ * @guc: GuC object
+ *
+ * This function waits for any outstanding CTB
+ * and disables CTB communication before entering
+ * D3Hot
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_runtime_suspend(struct xe_guc *guc)
+{
+	struct xe_guc_ct *ct = &guc->ct;
+
+	/*
+	 * Wait for any outstanding CTB before tearing down communication
+	 * with GuC.
+	 */
+	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
+		return -ETIMEDOUT;
+
+	/* Disable CTB */
+	xe_guc_ct_disable(&guc->ct);
+
+	return 0;
+}
+
+/**
+ * xe_guc_runtime_resume - GuC runtime resume
+ * @guc: GuC object
+ *
+ * This function enables CTB communication
+ * and interrupts.
+ */
+void xe_guc_runtime_resume(struct xe_guc *guc)
+{
+	/*
+	 * Power is not lost when resuming from D3Hot,
+	 * hence it is not necessary to reload GuC
+	 * everytime. Only enable interrupts and
+	 * CTB communication during resume
+	 */
+	guc_enable_irq(guc);
+
+	xe_mmio_rmw32(guc_to_gt(guc), PMINTRMSK,
+		      ARAT_EXPIRED_INTRMSK, 0);
+
+	xe_guc_ct_enable(&guc->ct);
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index af59c9545753..a01999bb4a8e 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
 int xe_guc_enable_communication(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
+int xe_guc_runtime_suspend(struct xe_guc *guc);
+void xe_guc_runtime_resume(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b4137fe195a4..400680c429fd 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -360,7 +360,16 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
 		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
 }
 
-int xe_guc_ct_enable(struct xe_guc_ct *ct)
+/**
+ * xe_guc_ct_register - register GuC CTB
+ * @ct: GuC CT object
+ *
+ * register GuC CTB's and enable GuC CT
+ * communication channel.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_ct_register(struct xe_guc_ct *ct)
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct xe_gt *gt = ct_to_gt(ct);
@@ -383,11 +392,7 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 	if (err)
 		goto err_out;
 
-	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
-
-	smp_mb();
-	wake_up_all(&ct->wq);
-	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
+	xe_guc_ct_enable(ct);
 
 	if (ct_needs_safe_mode(ct))
 		ct_enter_safe_mode(ct);
@@ -396,10 +401,26 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
 
 err_out:
 	xe_gt_err(gt, "Failed to enable GuC CT (%pe)\n", ERR_PTR(err));
-
 	return err;
 }
 
+/**
+ * xe_guc_ct_enable - Set GuC CT to enabled state
+ * @ct: GuC CT object
+ *
+ * Set GuC CT to enabled state
+ */
+void xe_guc_ct_enable(struct xe_guc_ct *ct)
+{
+	struct xe_gt *gt = ct_to_gt(ct);
+
+	xe_guc_ct_set_state(ct, XE_GUC_CT_STATE_ENABLED);
+
+	smp_mb();
+	wake_up_all(&ct->wq);
+	xe_gt_dbg(gt, "GuC CT communication channel enabled\n");
+}
+
 static void stop_g2h_handler(struct xe_guc_ct *ct)
 {
 	cancel_work_sync(&ct->g2h_worker);
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 105bb8e99a8d..f786b3ec2b68 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -11,7 +11,8 @@
 struct drm_printer;
 
 int xe_guc_ct_init(struct xe_guc_ct *ct);
-int xe_guc_ct_enable(struct xe_guc_ct *ct);
+int xe_guc_ct_register(struct xe_guc_ct *ct);
+void xe_guc_ct_enable(struct xe_guc_ct *ct);
 void xe_guc_ct_disable(struct xe_guc_ct *ct);
 void xe_guc_ct_stop(struct xe_guc_ct *ct);
 void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index de3b5df65e48..070d28d193c7 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	xe_display_pm_suspend(xe, false);
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_suspend(gt, false);
 		if (err) {
 			xe_display_pm_resume(xe, false);
 			goto err;
@@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
 	xe_display_pm_resume(xe, false);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+		xe_gt_resume(gt, false);
 
 	err = xe_bo_restore_user(xe);
 	if (err)
@@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	}
 
 	for_each_gt(gt, xe, id) {
-		err = xe_gt_suspend(gt);
+		err = xe_gt_suspend(gt, true);
 		if (err)
 			goto out;
 	}
@@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	xe_irq_resume(xe);
 
 	for_each_gt(gt, xe, id)
-		xe_gt_resume(gt);
+		xe_gt_resume(gt, true);
 
 	if (xe->d3cold.allowed) {
 		xe_display_pm_resume(xe, true);
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 0f240534fb72..997ab4e82931 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -288,6 +288,36 @@ int xe_uc_suspend(struct xe_uc *uc)
 	return xe_guc_suspend(&uc->guc);
 }
 
+/**
+ * xe_uc_runtime_suspend - uC runtime suspend
+ * @uc: uC object
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_uc_runtime_suspend(struct xe_uc *uc)
+{
+	/* GuC submission not enabled, nothing to do */
+	if (!xe_device_uc_enabled(uc_to_xe(uc)))
+		return 0;
+
+	return xe_guc_runtime_suspend(&uc->guc);
+}
+
+/**
+ * xe_uc_runtime_resume - uC runtime resume
+ * @uc: uC object
+ *
+ * Called while resuming from D3Hot
+ */
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
  * xe_uc_remove() - Clean up the UC structures before driver removal
  * @uc: the UC object
diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
index 11856f24e6f9..dd483ea43b9b 100644
--- a/drivers/gpu/drm/xe/xe_uc.h
+++ b/drivers/gpu/drm/xe/xe_uc.h
@@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
 int xe_uc_fini_hw(struct xe_uc *uc);
 void xe_uc_gucrc_disable(struct xe_uc *uc);
 int xe_uc_reset_prepare(struct xe_uc *uc);
+int xe_uc_runtime_suspend(struct xe_uc *uc);
+void xe_uc_runtime_resume(struct xe_uc *uc);
 void xe_uc_stop_prepare(struct xe_uc *uc);
 void xe_uc_stop(struct xe_uc *uc);
 int xe_uc_start(struct xe_uc *uc);
-- 
2.40.0

