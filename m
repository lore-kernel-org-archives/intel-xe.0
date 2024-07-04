Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58D1C30653
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jul 2024 05:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C0D10E130;
	Thu,  4 Jul 2024 05:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCCGacsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B838C10E130
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jul 2024 05:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720072766; x=1751608766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dcRPxQbUyXFCvVKMNleV9Tk8SbKAn9esoEmCuENkT2I=;
 b=lCCGacsWo+MCwn/CWHyt46vXZbvCNk1b+wfyHykFn9TIAG54OCAEyciC
 kLBiiyK6wgcIH3hPt4Nx1KV+bk5v44By46e4KFduj5iSDyi/ePMVGHEy1
 nxQPEgCBDgjWM1D6ykc6JtwGCkaq5FOEjz8lsKqjYGIxzZm7WMPm/bvmY
 DkpbxaSeCyyj5ZOvZD62elTZIaXw2dF6gEG6G7oyiTJYzIOaauraTBl5G
 W9iYplB1mgJx269M+6s84Zak6YLFaumZejw/rK7xwSC1S+0hqP06+t1nV
 5PYLL4nnFuG3Ml6aeKZ6wmmtdeDdtMpHeZypgGuaY4uq7KohWEkvtghai A==;
X-CSE-ConnectionGUID: 5eddueZrT+WUqib0NhmAAg==
X-CSE-MsgGUID: eF3BJ+TpQYOHzpS6Y0YrKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="28006997"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="28006997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 22:59:25 -0700
X-CSE-ConnectionGUID: aZvBax9YQaSF2HiAlDNXMg==
X-CSE-MsgGUID: KZp23/rHTCK616AIfOx6dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="50933288"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 22:59:23 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 daniele.ceraolospurio@intel.com, matthew.brost@intel.com,
 michal.wajdeczko@intel.com
Subject: [PATCH v3 2/2] drm/xe: remove GuC reload in D3Hot path
Date: Thu,  4 Jul 2024 11:42:03 +0530
Message-Id: <20240704061203.3464835-3-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240704061203.3464835-1-riana.tauro@intel.com>
References: <20240704061203.3464835-1-riana.tauro@intel.com>
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

Currently GuC is reloaded for both runtime suspend and system suspend.
For D3hot <-> D0 transitions no power is lost on suspend and GuC reload
is not necessary.

Remove GuC reload from D3Hot path and only enable/disable CTB
communication.

v2: rebase

v3: fix commit message
    add kernel-doc for gt suspend and resume methods
    fix comment
    do not split register and enable calls of CT (Michal)

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c  | 33 +++++++++++++++---
 drivers/gpu/drm/xe/xe_gt.h  |  4 +--
 drivers/gpu/drm/xe/xe_guc.c | 69 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc.h |  4 ++-
 drivers/gpu/drm/xe/xe_pm.c  |  8 ++---
 drivers/gpu/drm/xe/xe_uc.c  | 32 +++++++++++++++--
 drivers/gpu/drm/xe/xe_uc.h  |  2 ++
 7 files changed, 133 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 29e8ea94d05e..4da84e288faa 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -779,8 +779,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
 	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
 }
 
-int xe_gt_suspend(struct xe_gt *gt)
+/**
+ * xe_gt_suspend - Suspend helper for GT
+ * @gt: the GT object
+ * @runtime: indicates the type of suspend (runtime - 1 / system - 0)
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_gt_suspend(struct xe_gt *gt, bool runtime)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_gt_dbg(gt, "suspending\n");
@@ -790,7 +798,11 @@ int xe_gt_suspend(struct xe_gt *gt)
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
 
@@ -828,8 +840,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
 	return ret;
 }
 
-int xe_gt_resume(struct xe_gt *gt)
+/**
+ * xe_gt_resume - Resume helper for GT
+ * @gt: the GT object
+ * @runtime: indicates the type of resume (runtime - 1 / system - 0)
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_gt_resume(struct xe_gt *gt, bool runtime)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	int err;
 
 	xe_gt_dbg(gt, "resuming\n");
@@ -837,7 +857,12 @@ int xe_gt_resume(struct xe_gt *gt)
 	if (err)
 		goto err_msg;
 
-	err = do_gt_restart(gt);
+	/* GuC is still alive at D3hot, no need to reload it */
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
index eb655cee19f7..6408f9dfe855 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -755,7 +755,7 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(guc);
+	ret = xe_guc_enable_communication(guc, true);
 	if (ret)
 		return ret;
 
@@ -800,7 +800,7 @@ int xe_guc_min_load_for_hwconfig(struct xe_guc *guc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(guc);
+	ret = xe_guc_enable_communication(guc, true);
 	if (ret)
 		return ret;
 
@@ -854,7 +854,16 @@ static void guc_enable_irq(struct xe_guc *guc)
 	xe_mmio_rmw32(gt, GUC_SG_INTR_MASK, events, 0);
 }
 
-int xe_guc_enable_communication(struct xe_guc *guc)
+/**
+ * xe_guc_enable_communication - Enable CTB communication with GuC
+ * @guc: GuC object
+ * @ctb_register: true to register CTB, false otherwise
+ *
+ * Enables GuC CTB Communication and IRQ
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	int err;
@@ -870,9 +879,13 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 		guc_enable_irq(guc);
 	}
 
-	err = xe_guc_ct_enable(&guc->ct);
-	if (err)
-		return err;
+	if (ctb_register) {
+		err = xe_guc_ct_enable(&guc->ct);
+		if (err)
+			return err;
+	} else {
+		xe_guc_ct_set_state(&guc->ct, XE_GUC_CT_STATE_ENABLED);
+	}
 
 	guc_handle_mmio_msg(guc);
 
@@ -1101,6 +1114,50 @@ void xe_guc_sanitize(struct xe_guc *guc)
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
+ */
+void xe_guc_runtime_resume(struct xe_guc *guc)
+{
+	/*
+	 * Power is not lost when resuming from D3Hot,
+	 * hence it is not necessary to reload GuC
+	 * everytime. Only enable interrupts and
+	 * CTB communication during resume
+	 */
+	xe_guc_enable_communication(guc, false);
+}
+
 int xe_guc_reset_prepare(struct xe_guc *guc)
 {
 	return xe_guc_submit_reset_prepare(guc);
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index af59c9545753..9ff87991f2df 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -20,8 +20,10 @@ int xe_guc_post_load_init(struct xe_guc *guc);
 int xe_guc_reset(struct xe_guc *guc);
 int xe_guc_upload(struct xe_guc *guc);
 int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
-int xe_guc_enable_communication(struct xe_guc *guc);
+int xe_guc_enable_communication(struct xe_guc *guc, bool ctb_register);
 int xe_guc_suspend(struct xe_guc *guc);
+int xe_guc_runtime_suspend(struct xe_guc *guc);
+void xe_guc_runtime_resume(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
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
index 0f240534fb72..cbae9bf03baf 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -154,7 +154,7 @@ static int vf_uc_init_hw(struct xe_uc *uc)
 	if (err)
 		return err;
 
-	err = xe_guc_enable_communication(&uc->guc);
+	err = xe_guc_enable_communication(&uc->guc, true);
 	if (err)
 		return err;
 
@@ -194,7 +194,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
 	if (ret)
 		return ret;
 
-	ret = xe_guc_enable_communication(&uc->guc);
+	ret = xe_guc_enable_communication(&uc->guc, true);
 	if (ret)
 		return ret;
 
@@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
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

