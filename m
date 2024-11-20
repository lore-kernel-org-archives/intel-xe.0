Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 199C7D743F3
	for <intel-xe@archiver.kernel.org>; Wed, 20 Nov 2024 23:44:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A2E10E3DD;
	Wed, 20 Nov 2024 23:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEcdBeqZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297C310E3E6
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Nov 2024 23:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732146250; x=1763682250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Avcdj8k6Z6iYAzpG9C8kKQUtQAMT0i8Ua4jYGoYym/k=;
 b=CEcdBeqZi7fIiFdjoPRkMFeSzuCuSD56cqersTD81gmLssMF9YKYahbQ
 E5GFDsY1zvpHuSCX48QmqsVndI0cTyxmsrRBsoV6S3dSwlQzmERapC4l0
 7d1Iv5B4/bOxFVXvwcbogMttJyPW6J8UHPbneoz55U7M2tudbp5ulXmnt
 rmPeVtXbkULSdRzUEpInYnBaWcWWODqWBGlVEo34fuofT4/4Wpszy/ZGq
 xtp+sdBbHFdZCt2BlXcDj0JZ4JZJB3z56KT3Jmj/kd9ftTrGG/CJlfDnq
 eu21fm4jYqhpq2gHx08puMPbjO9Vg1Rs3Tiljpf5vMQGLZwuRWTgeTM8G g==;
X-CSE-ConnectionGUID: NdhIPE12T+agR2f4wuhIXQ==
X-CSE-MsgGUID: Jn2Lf0AFR0+TNUGDKBl15g==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54733285"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="54733285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:10 -0800
X-CSE-ConnectionGUID: qVySRu7bRQutEOMUpTfSqQ==
X-CSE-MsgGUID: p9vJviwlShKJkPTIrflE4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="90453668"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 15:44:10 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 10/12] drm/xe/pxp: add PXP PM support
Date: Wed, 20 Nov 2024 15:43:50 -0800
Message-ID: <20241120234353.1037180-11-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
References: <20241120234353.1037180-1-daniele.ceraolospurio@intel.com>
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

The HW suspend flow kills all PXP HWDRM sessions, so if there was any
PXP activity before the suspend we need to trigger a full termination on
suspend.

v2: rebase

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c        |  40 +++++++---
 drivers/gpu/drm/xe/xe_pxp.c       | 120 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pxp.h       |   3 +
 drivers/gpu/drm/xe/xe_pxp_types.h |   7 ++
 4 files changed, 156 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 80699dbeb2e9..2fe011a6c6e9 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -21,6 +21,7 @@
 #include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
+#include "xe_pxp.h"
 #include "xe_trace.h"
 #include "xe_wa.h"
 
@@ -121,6 +122,10 @@ int xe_pm_suspend(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Suspending device\n");
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
+	err = xe_pxp_pm_suspend(xe->pxp, false);
+	if (err)
+		goto err;
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
@@ -129,14 +134,12 @@ int xe_pm_suspend(struct xe_device *xe)
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
@@ -145,6 +148,11 @@ int xe_pm_suspend(struct xe_device *xe)
 
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
@@ -194,6 +202,8 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_pxp_pm_resume(xe->pxp);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
@@ -388,6 +398,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 */
 	xe_rpm_lockmap_acquire(xe);
 
+	err = xe_pxp_pm_suspend(xe->pxp, true);
+	if (err)
+		goto out;
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and delets bo entry from user fault list.
@@ -403,22 +417,28 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
 
 	if (xe->d3cold.allowed)
 		xe_display_pm_suspend_late(xe);
+
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
@@ -471,6 +491,8 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 			goto out;
 	}
 
+	xe_pxp_pm_resume(xe->pxp);
+
 out:
 	xe_rpm_lockmap_release(xe);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index f39625ae0259..06f025bce5f8 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -123,6 +123,14 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
 
 static void pxp_invalidate_queues(struct xe_pxp *pxp);
 
+static void pxp_invalidate_state(struct xe_pxp *pxp)
+{
+	pxp_invalidate_queues(pxp);
+
+	if (pxp->status == XE_PXP_ACTIVE)
+		pxp->key_instance++;
+}
+
 static void pxp_terminate(struct xe_pxp *pxp)
 {
 	int ret = 0;
@@ -132,10 +140,14 @@ static void pxp_terminate(struct xe_pxp *pxp)
 
 	lockdep_assert_held(&pxp->mutex);
 
-	pxp_invalidate_queues(pxp);
+	pxp_invalidate_state(pxp);
 
-	if (pxp->status == XE_PXP_ACTIVE)
-		pxp->key_instance++;
+	/*
+	 * we'll mark the status as needing termination on resume, so no need to
+	 * emit a termination now.
+	 */
+	if (pxp->status == XE_PXP_SUSPENDED)
+		return;
 
 	/*
 	 * If we have a termination already in progress, we need to wait for
@@ -187,17 +199,19 @@ static void pxp_terminate(struct xe_pxp *pxp)
 static void pxp_terminate_complete(struct xe_pxp *pxp)
 {
 	/*
-	 * We expect PXP to be in one of 2 states when we get here:
+	 * We expect PXP to be in one of 3 states when we get here:
 	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
 	 * requested and it is now completing, so we're ready to start.
 	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
 	 * the first one was still being processed; we don't update the state
 	 * in this case so the pxp_start code will automatically issue that
 	 * second termination.
+	 * - XE_PXP_SUSPENDED: PXP is now suspended, so we defer everything to
+	 * when we come back on resume.
 	 */
 	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
 		pxp->status = XE_PXP_READY_TO_START;
-	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
+	else if (pxp->status != XE_PXP_NEEDS_TERMINATION && pxp->status != XE_PXP_SUSPENDED)
 		drm_err(&pxp->xe->drm,
 			"PXP termination complete while status was %u\n",
 			pxp->status);
@@ -355,6 +369,7 @@ int xe_pxp_init(struct xe_device *xe)
 	pxp->gt = gt;
 
 	pxp->key_instance = 1;
+	pxp->last_suspend_key_instance = 1;
 
 	/*
 	 * we'll use the completion to check if there is a termination pending,
@@ -524,6 +539,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 		pxp_terminate(pxp);
 		mutex_unlock(&pxp->mutex);
 		goto wait_for_termination;
+	case XE_PXP_SUSPENDED:
 	default:
 		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
 		ret = -EIO;
@@ -674,3 +690,97 @@ int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
 	return 0;
 }
 
+/**
+ * xe_pxp_pm_suspend - prepare PXP for HW suspend
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @runtime: indicates whether this is a runtime suspend or not
+ *
+ * Checks whether a BO was encrypted with the current key or an obsolete one.
+ *
+ * Returns: 0 if successful, a negative errno value otherwise.
+ */
+int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool runtime)
+{
+	int ret = 0;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return 0;
+
+	mutex_lock(&pxp->mutex);
+
+	/* if a termination is already in progress, no need to do additional cleanup */
+	if (!completion_done(&pxp->termination))
+		goto mark_suspended;
+
+	switch (pxp->status) {
+	case XE_PXP_ERROR:
+	case XE_PXP_READY_TO_START:
+	case XE_PXP_SUSPENDED:
+		/* nothing to cleanup */
+		break;
+	case XE_PXP_NEEDS_TERMINATION:
+		/* If PXP was never used we can skip the cleanup */
+		if (pxp->key_instance == pxp->last_suspend_key_instance)
+			break;
+		fallthrough;
+	case XE_PXP_ACTIVE:
+		if (runtime)
+			pxp_invalidate_state(pxp);
+		else
+			pxp_terminate(pxp);
+		break;
+	default:
+		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
+			pxp->status);
+		ret = -EIO;
+		goto out;
+	}
+
+mark_suspended:
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
index 2d22a6e6ab27..0477bb46d49f 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -20,6 +20,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
+int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool runtime);
+void xe_pxp_pm_resume(struct xe_pxp *pxp);
+
 int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
 int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
 void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index 9c2d2b9a850d..fa40b039e26f 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -25,6 +25,7 @@ enum xe_pxp_status {
 	XE_PXP_TERMINATION_IN_PROGRESS,
 	XE_PXP_READY_TO_START,
 	XE_PXP_ACTIVE,
+	XE_PXP_SUSPENDED,
 };
 
 /**
@@ -119,6 +120,12 @@ struct xe_pxp {
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

