Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14639E9B278
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 16:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDB410E5F3;
	Tue, 24 Feb 2026 16:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ia7s33AQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C73110E5EE
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771950959; x=1803486959;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AQ8FW0fzL6P5QyjWlINcP2Q53D6OdwelQjjlORpByvA=;
 b=Ia7s33AQgCPEw6ihTc+BG2DB8i1yQvJwRV1GMB+tyF3quLdkzVWiUi+7
 jQS14LvVsIKdpsjjtBBLbSh0WoMxajkxlLewDsMWjpXsuLPvS4NUGXMHm
 EO7v6bZcBpkFNSfFKLB5tHG3DXl48e7xvPg7Bm21gG8dA+T7UpmWLt+BP
 7YY3qPSPHFvA6CA6kk4s8EjWyWkR0dpNgwC1PXBf6IA/rJ25FqAbRBjio
 VAHREhyrHQkn2DKTOojsQJGPCHAog1Pkt+nHT++6+YSd3uQJpqRwRZhfl
 /daupHJFYol0xxznyCDt53IU0trLotw9gvxWV2s3K+fVq+OxyiRj1/HW6 w==;
X-CSE-ConnectionGUID: at32KpSWQ0K2kfpzyLU0bw==
X-CSE-MsgGUID: aC7Z/jQMQRij8zpGAUu21g==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="73040142"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73040142"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 08:35:58 -0800
X-CSE-ConnectionGUID: G5LW7VkORpCjo+9d1Uj3Nw==
X-CSE-MsgGUID: NpyXsm3bShywRgj7T1Jo2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220555623"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 08:35:58 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 2/7] drm/xe: Forcefully tear down exec queues in GuC submit
 fini
Date: Tue, 24 Feb 2026 11:35:50 -0500
Message-Id: <20260224163555.218750-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224163555.218750-1-zhanjun.dong@intel.com>
References: <20260224163555.218750-1-zhanjun.dong@intel.com>
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

In GuC submit fini, forcefully tear down any exec queues by disabling
CTs, stopping the scheduler (which cleans up lost G2H), killing all
remaining queues, and resuming scheduling to allow any remaining cleanup
actions to complete and signal any remaining fences.

Split guc_submit_fini into device related and software only part. Using
device-managed and drm-managed action guarantees the correct ordering of
cleanup.

Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c        | 26 ++++++++++++++--
 drivers/gpu/drm/xe/xe_guc.h        |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 48 +++++++++++++++++++++++-------
 3 files changed, 63 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cbbb4d665b8f..bce3bfb29db0 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1402,15 +1402,37 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 	return 0;
 }
 
-int xe_guc_suspend(struct xe_guc *guc)
+/**
+ * xe_guc_softreset() - Soft reset GuC
+ * @guc: The GuC object
+ *
+ * Send soft reset command to GuC through mmio send.
+ *
+ * Return: 0 if success, otherwise error code
+ */
+int xe_guc_softreset(struct xe_guc *guc)
 {
-	struct xe_gt *gt = guc_to_gt(guc);
 	u32 action[] = {
 		XE_GUC_ACTION_CLIENT_SOFT_RESET,
 	};
 	int ret;
 
+	if (!xe_uc_fw_is_running(&guc->fw))
+		return 0;
+
 	ret = xe_guc_mmio_send(guc, action, ARRAY_SIZE(action));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int xe_guc_suspend(struct xe_guc *guc)
+{
+	struct xe_gt *gt = guc_to_gt(guc);
+	int ret;
+
+	ret = xe_guc_softreset(guc);
 	if (ret) {
 		xe_gt_err(gt, "GuC suspend failed: %pe\n", ERR_PTR(ret));
 		return ret;
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 66e7edc70ed9..02514914f404 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -44,6 +44,7 @@ int xe_guc_opt_in_features_enable(struct xe_guc *guc);
 void xe_guc_runtime_suspend(struct xe_guc *guc);
 void xe_guc_runtime_resume(struct xe_guc *guc);
 int xe_guc_suspend(struct xe_guc *guc);
+int xe_guc_softreset(struct xe_guc *guc);
 void xe_guc_notify(struct xe_guc *guc);
 int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
 int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 42712acf2ec2..c8b59e662c9e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -47,6 +47,8 @@
 
 #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
 
+static int guc_submit_reset_prepare(struct xe_guc *guc);
+
 static struct xe_guc *
 exec_queue_to_guc(struct xe_exec_queue *q)
 {
@@ -238,7 +240,7 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 		 EXEC_QUEUE_STATE_BANNED));
 }
 
-static void guc_submit_fini(struct drm_device *drm, void *arg)
+static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
 	struct xe_device *xe = guc_to_xe(guc);
@@ -256,6 +258,19 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 }
 
+static void guc_submit_fini(void *arg)
+{
+	struct xe_guc *guc = arg;
+
+	/* Forcefully kill any remaining exec queues */
+	xe_guc_ct_stop(&guc->ct);
+	guc_submit_reset_prepare(guc);
+	xe_guc_softreset(guc);
+	xe_guc_submit_stop(guc);
+	xe_uc_fw_sanitize(&guc->fw);
+	xe_guc_submit_pause_abort(guc);
+}
+
 static void guc_submit_wedged_fini(void *arg)
 {
 	struct xe_guc *guc = arg;
@@ -325,7 +340,11 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 
 	guc->submission_state.initialized = true;
 
-	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
+	err = drmm_add_action_or_reset(&xe->drm, guc_submit_sw_fini, guc);
+	if (err)
+		return err;
+
+	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
 }
 
 /*
@@ -2298,6 +2317,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
+	bool do_destroy = false;
 
 	/* Stop scheduling + flush any DRM scheduler operations */
 	xe_sched_submission_stop(sched);
@@ -2305,7 +2325,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
 		if (exec_queue_destroyed(q))
-			__guc_exec_queue_destroy(guc, q);
+			do_destroy = true;
 	}
 	if (q->guc->suspend_pending) {
 		set_exec_queue_suspended(q);
@@ -2341,18 +2361,15 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 			xe_guc_exec_queue_trigger_cleanup(q);
 		}
 	}
+
+	if (do_destroy)
+		__guc_exec_queue_destroy(guc, q);
 }
 
-int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+static int guc_submit_reset_prepare(struct xe_guc *guc)
 {
 	int ret;
 
-	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
-		return 0;
-
-	if (!guc->submission_state.initialized)
-		return 0;
-
 	/*
 	 * Using an atomic here rather than submission_state.lock as this
 	 * function can be called while holding the CT lock (engine reset
@@ -2367,6 +2384,17 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
 	return ret;
 }
 
+int xe_guc_submit_reset_prepare(struct xe_guc *guc)
+{
+	if (xe_gt_WARN_ON(guc_to_gt(guc), vf_recovery(guc)))
+		return 0;
+
+	if (!guc->submission_state.initialized)
+		return 0;
+
+	return guc_submit_reset_prepare(guc);
+}
+
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
 	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
-- 
2.34.1

