Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B366C02180
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 00:11:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10E8F10E877;
	Thu, 16 Jan 2025 00:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuAtl/Oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31B510E84D
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 00:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736986303; x=1768522303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Hcm56JiagoQVRJjbiH6xxcmyY0P2nSIbBuB/epiPavA=;
 b=SuAtl/OifSl5FQXWCPN23QCOtqpoz3FCHJ2Txvxiq6mDTjLl4RvMbvOg
 4/sjhnS5qZSDfoQ9x6PTko36+457YRhXnc5gA7Q3RzpOSk+Odpb3nAYOZ
 wSWzR/PBvXJOWiH/XasuF/LE3sef3Ph1bCArSGcCQ9tZZLWJzdtowh0yr
 A1pW3Xa1+qC+EHpI8x/W6cwJLEQxn6FqGkIyvqbcoD5WxNSezd8gabwFt
 4kZlFr7NWKmodO7XkY7TiBMfEz/G+HDmFobpAbXC2NinQQQ9kXfGf4Lxg
 pfsx3m9WF6Y+3cR4nnCVCxipOQcS/YHt6gOFv0aceAqtZqIOUiMAyZnJ9 w==;
X-CSE-ConnectionGUID: mJnwgjjRT7uFok3bb++Erw==
X-CSE-MsgGUID: pECwaie7T762WydutQ5v8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="47832110"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="47832110"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:11:43 -0800
X-CSE-ConnectionGUID: P7kFqO2XTzud0P/ZcB90dA==
X-CSE-MsgGUID: tckK0AT1SL287UySh+nhGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="105073044"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:11:41 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v5 11/13] drm/xe/pxp: add PXP PM support
Date: Wed, 15 Jan 2025 16:11:07 -0800
Message-ID: <20250116001110.4158032-12-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
References: <20250116001110.4158032-1-daniele.ceraolospurio@intel.com>
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

The HW suspend flow kills all PXP HWDRM sessions, so we need to mark all
the queues and BOs as invalid and do a full termination when PXP is next
used.

v2: rebase
v3: rebase on new status flow, defer termination to next PXP use as it
makes things much easier and allows us to use the same fuction for all
types of suspend.
v4: fix the documentation of the suspend function (John)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c        |  39 ++++++---
 drivers/gpu/drm/xe/xe_pxp.c       | 129 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pxp.h       |   3 +
 drivers/gpu/drm/xe/xe_pxp_types.h |   7 ++
 4 files changed, 165 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c9cc0c091dfd..35dd1757b40b 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -22,6 +22,7 @@
 #include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
+#include "xe_pxp.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
 
@@ -122,6 +123,10 @@ int xe_pm_suspend(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Suspending device\n");
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
+	err = xe_pxp_pm_suspend(xe->pxp);
+	if (err)
+		goto err;
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -130,14 +135,12 @@ int xe_pm_suspend(struct xe_device *xe)
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
 	if (err)
-		goto err;
+		goto err_pxp;
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
-		if (err) {
-			xe_display_pm_resume(xe);
-			goto err;
-		}
+		if (err)
+			goto err_display;
 	}
 
 	xe_irq_suspend(xe);
@@ -146,6 +149,11 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Device suspended\n");
 	return 0;
+
+err_display:
+	xe_display_pm_resume(xe);
+err_pxp:
+	xe_pxp_pm_resume(xe->pxp);
 err:
 	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
 	return err;
@@ -195,6 +203,8 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_pxp_pm_resume(xe->pxp);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
@@ -389,6 +399,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 */
 	xe_rpm_lockmap_acquire(xe);
 
+	err = xe_pxp_pm_suspend(xe->pxp);
+	if (err)
+		goto out;
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and deletes bo entry from user fault list.
@@ -404,22 +418,27 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
-			goto out;
+			goto out_resume;
 	}
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err)
-			goto out;
+			goto out_resume;
 	}
 
 	xe_irq_suspend(xe);
 
 	xe_display_pm_runtime_suspend_late(xe);
 
+	xe_rpm_lockmap_release(xe);
+	xe_pm_write_callback_task(xe, NULL);
+	return 0;
+
+out_resume:
+	xe_display_pm_runtime_resume(xe);
+	xe_pxp_pm_resume(xe->pxp);
 out:
-	if (err)
-		xe_display_pm_runtime_resume(xe);
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
@@ -472,6 +491,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 
+	xe_pxp_pm_resume(xe->pxp);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 84aadca5c62e..76fc0e5b774c 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -132,6 +132,14 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
 
 static void pxp_invalidate_queues(struct xe_pxp *pxp);
 
+static void pxp_invalidate_state(struct xe_pxp *pxp)
+{
+	pxp_invalidate_queues(pxp);
+
+	if (pxp->status == XE_PXP_ACTIVE)
+		pxp->key_instance++;
+}
+
 static int pxp_terminate_hw(struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
@@ -185,10 +193,16 @@ static void pxp_terminate(struct xe_pxp *pxp)
 
 	mutex_lock(&pxp->mutex);
 
-	pxp_invalidate_queues(pxp);
+	pxp_invalidate_state(pxp);
 
-	if (pxp->status == XE_PXP_ACTIVE)
-		pxp->key_instance++;
+	/*
+	 * we'll mark the status as needing termination on resume, so no need to
+	 * emit a termination now.
+	 */
+	if (pxp->status == XE_PXP_SUSPENDED) {
+		mutex_unlock(&pxp->mutex);
+		return;
+	}
 
 	/*
 	 * If we have a termination already in progress, we need to wait for
@@ -219,11 +233,13 @@ static void pxp_terminate(struct xe_pxp *pxp)
 static void pxp_terminate_complete(struct xe_pxp *pxp)
 {
 	/*
-	 * We expect PXP to be in one of 2 states when we get here:
+	 * We expect PXP to be in one of 3 states when we get here:
 	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
 	 * requested and it is now completing, so we're ready to start.
 	 * - XE_PXP_NEEDS_ADDITIONAL_TERMINATION: a second termination was
 	 * requested while the first one was still being processed.
+	 * - XE_PXP_SUSPENDED: PXP is now suspended, so we defer everything to
+	 * when we come back on resume.
 	 */
 	mutex_lock(&pxp->mutex);
 
@@ -234,6 +250,9 @@ static void pxp_terminate_complete(struct xe_pxp *pxp)
 	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
 		pxp->status = XE_PXP_NEEDS_TERMINATION;
 		break;
+	case XE_PXP_SUSPENDED:
+		/* Nothing to do */
+		break;
 	default:
 		drm_err(&pxp->xe->drm,
 			"PXP termination complete while status was %u\n",
@@ -391,6 +410,7 @@ int xe_pxp_init(struct xe_device *xe)
 	pxp->gt = gt;
 
 	pxp->key_instance = 1;
+	pxp->last_suspend_key_instance = 1;
 
 	/*
 	 * we'll use the completions to check if there is an action pending,
@@ -574,6 +594,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 		XE_WARN_ON(completion_done(&pxp->termination));
 		mutex_unlock(&pxp->mutex);
 		goto wait_for_idle;
+	case XE_PXP_SUSPENDED:
 	default:
 		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
 		ret = -EIO;
@@ -779,3 +800,103 @@ int xe_pxp_obj_key_check(struct xe_pxp *pxp, struct drm_gem_object *obj)
 {
 	return xe_pxp_bo_key_check(pxp, gem_to_xe_bo(obj));
 }
+
+/**
+ * xe_pxp_pm_suspend - prepare PXP for HW suspend
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ *
+ * Makes sure all PXP actions have completed and invalidates all PXP queues
+ * and objects before we go into a suspend state.
+ *
+ * Returns: 0 if successful, a negative errno value otherwise.
+ */
+int xe_pxp_pm_suspend(struct xe_pxp *pxp)
+{
+	int ret = 0;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return 0;
+
+wait_for_activation:
+	if (!wait_for_completion_timeout(&pxp->activation,
+					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
+		ret = -ETIMEDOUT;
+
+	mutex_lock(&pxp->mutex);
+
+	switch (pxp->status) {
+	case XE_PXP_ERROR:
+	case XE_PXP_READY_TO_START:
+	case XE_PXP_SUSPENDED:
+	case XE_PXP_TERMINATION_IN_PROGRESS:
+	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
+		/*
+		 * If PXP is not running there is nothing to cleanup. If there
+		 * is a termination pending then no need to issue another one.
+		 */
+		break;
+	case XE_PXP_START_IN_PROGRESS:
+		mutex_unlock(&pxp->mutex);
+		goto wait_for_activation;
+	case XE_PXP_NEEDS_TERMINATION:
+		/* If PXP was never used we can skip the cleanup */
+		if (pxp->key_instance == pxp->last_suspend_key_instance)
+			break;
+		fallthrough;
+	case XE_PXP_ACTIVE:
+		pxp_invalidate_state(pxp);
+		break;
+	default:
+		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
+			pxp->status);
+		ret = -EIO;
+		goto out;
+	}
+
+	/*
+	 * We set this even if we were in error state, hoping the suspend clears
+	 * the error. Worse case we fail again and go in error state again.
+	 */
+	pxp->status = XE_PXP_SUSPENDED;
+
+	mutex_unlock(&pxp->mutex);
+
+	/*
+	 * if there is a termination in progress, wait for it.
+	 * We need to wait outside the lock because the completion is done from
+	 * within the lock
+	 */
+	if (!wait_for_completion_timeout(&pxp->termination,
+					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
+		ret = -ETIMEDOUT;
+
+	pxp->last_suspend_key_instance = pxp->key_instance;
+
+out:
+	return ret;
+}
+
+/**
+ * xe_pxp_pm_resume - re-init PXP after HW suspend
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ */
+void xe_pxp_pm_resume(struct xe_pxp *pxp)
+{
+	int err;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return;
+
+	err = kcr_pxp_enable(pxp);
+
+	mutex_lock(&pxp->mutex);
+
+	xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
+
+	if (err)
+		pxp->status = XE_PXP_ERROR;
+	else
+		pxp->status = XE_PXP_NEEDS_TERMINATION;
+
+	mutex_unlock(&pxp->mutex);
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 3dd70eac9da6..546b156d63aa 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -21,6 +21,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
+int xe_pxp_pm_suspend(struct xe_pxp *pxp);
+void xe_pxp_pm_resume(struct xe_pxp *pxp);
+
 int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
 int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
 void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index 8e4569f0173d..53e9d48d10fb 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -27,6 +27,7 @@ enum xe_pxp_status {
 	XE_PXP_READY_TO_START,
 	XE_PXP_START_IN_PROGRESS,
 	XE_PXP_ACTIVE,
+	XE_PXP_SUSPENDED,
 };
 
 /**
@@ -123,6 +124,12 @@ struct xe_pxp {
 	 * that case in the code.
 	 */
 	u32 key_instance;
+	/**
+	 * @last_suspend_key_instance: value of key_instance at the last
+	 * suspend. Used to check if any PXP session has been created between
+	 * suspend cycles.
+	 */
+	u32 last_suspend_key_instance;
 };
 
 #endif /* __XE_PXP_TYPES_H__ */
-- 
2.43.0

