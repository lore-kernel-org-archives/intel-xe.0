Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FBCE9A058
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 18:07:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D364510E735;
	Thu, 19 Feb 2026 18:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CfK+sisV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9761810E72C
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 18:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771524423; x=1803060423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7OdAg7o9l8SL5M+eZ0J2cHBwp+I6mykn2ZvzlPe4/sQ=;
 b=CfK+sisVzHW3YN+TIzcwq3p52ex1c5DewX5+B8t6nb1HF7R1gk1HsfON
 X9QF+ysi7pK9H8oY0FPN9H5xT0ExZCwrQewuo5HYkOg3rHpEx4oDWTK4U
 XeBSrGGJKrRPdaLiEloTtwu+Z9sQtbO106HR8jJh1I3UaSkCyFkdg7Oed
 LDQTs1IHbCX38Qhwn/9F8S1nDB9KrljOA3rlzsxUrvKGqdRoln7iYhAAy
 ZErrDfEC8AFDR5rlwskLv/bxLXMnUP7nEdYdUHhqaMnfO5sA6TP3Q1Jwn
 IuUzrGN8tF0Z74a2W/drO6jHbDmXWST2gxwrUmOMoo9cI/bBLQdXwee2o A==;
X-CSE-ConnectionGUID: D7vMMeTvQCaQBYjNmrePaQ==
X-CSE-MsgGUID: lmOh6yTjT8K3nQ7n+4h9Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76482811"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76482811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 10:07:03 -0800
X-CSE-ConnectionGUID: 7sFLPOtsSBe3nYp8MSA4CA==
X-CSE-MsgGUID: T9oMHlFvQEy6bS+fjMGIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="245189020"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by orviesa002.jf.intel.com with ESMTP; 19 Feb 2026 10:07:03 -0800
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko@freedesktop.org, Michal <Michal.Wajdeczko@intel.com>,
	Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 2/7] drm/xe: Forcefully tear down exec queues in GuC submit
 fini
Date: Thu, 19 Feb 2026 13:06:56 -0500
Message-Id: <20260219180701.2418453-3-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219180701.2418453-1-zhanjun.dong@intel.com>
References: <20260219180701.2418453-1-zhanjun.dong@intel.com>
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
history:
v4:
 - Split guc_submit_fini into 2 parts, device related by devm and software
   only part by drmm
v3:
 - Add page fault fix
v2:
 - Fix VF failure (CI)
---
 drivers/gpu/drm/xe/xe_guc.c        | 18 +++++++++--
 drivers/gpu/drm/xe/xe_guc.h        |  1 +
 drivers/gpu/drm/xe/xe_guc_submit.c | 48 +++++++++++++++++++++++-------
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index cbbb4d665b8f..f59ae602b8ed 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1402,15 +1402,29 @@ int xe_guc_enable_communication(struct xe_guc *guc)
 	return 0;
 }
 
-int xe_guc_suspend(struct xe_guc *guc)
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
index 42712acf2ec2..bfb176c201c7 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -47,6 +47,8 @@
 
 #define XE_GUC_EXEC_QUEUE_CGP_CONTEXT_ERROR_LEN		6
 
+static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
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
+	__xe_guc_submit_reset_prepare(guc);
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
+static int __xe_guc_submit_reset_prepare(struct xe_guc *guc)
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
+	return __xe_guc_submit_reset_prepare(guc);
+}
+
 void xe_guc_submit_reset_wait(struct xe_guc *guc)
 {
 	wait_event(guc->ct.wq, xe_device_wedged(guc_to_xe(guc)) ||
-- 
2.34.1

