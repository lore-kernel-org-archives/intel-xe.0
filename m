Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47BC2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD94510ED14;
	Fri, 12 Jul 2024 21:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JITGxGHz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6338010ECDC
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819772; x=1752355772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zr58ntDZu6padZ8ZuTcHQwat4ZQZEaFRgWgUbtw9V+Q=;
 b=JITGxGHzxDxpEyQzR2SAzqJRzwlneK3jVi9JmRL10VXg4wEE8A4C9exv
 0oTboCQBqDRNZ7Wpi6ZQElTZR86toGlCiEB6RQdIb6wTu6/f0cNO3/hpA
 TlRZVJrGcCRSLdc90eSrIQLPKiBme+VTaYRDdtnjrAK4ACnzP/o6Cxp4P
 LCowiotPR+d8FE7ytUoA2pVVTpzPO1vYc0do6AgqONgkBO4iFuIysBNxs
 KXgi1RDItyKZzQ9QeHvL2saakD04ndLVzZ7/d71BZ3d96DXp1Ioung1Vw
 tlZdy1CkKSLZ9PMEkGhWb2wX82t5ye579HNWFivczFSXZ1Ob7H77qrWes w==;
X-CSE-ConnectionGUID: 12UUSgvWRIydzEDBWPEVaw==
X-CSE-MsgGUID: rPRnLu3dTEewrCkD/0fprw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990175"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:31 -0700
X-CSE-ConnectionGUID: U+n/pjKnQZuWT2AXc5pNkg==
X-CSE-MsgGUID: xZ4TRyc+QO2+QBdSr8h/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864609"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 12/14] drm/xe/pxp: add PXP PM support
Date: Fri, 12 Jul 2024 14:28:56 -0700
Message-ID: <20240712212901.2684239-13-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
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

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c        | 42 +++++++++++---
 drivers/gpu/drm/xe/xe_pxp.c       | 95 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pxp.h       |  3 +
 drivers/gpu/drm/xe/xe_pxp_types.h |  9 ++-
 4 files changed, 137 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index de3b5df65e48..6586f73638db 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -20,6 +20,7 @@
 #include "xe_guc.h"
 #include "xe_irq.h"
 #include "xe_pcode.h"
+#include "xe_pxp.h"
 #include "xe_wa.h"
 
 /**
@@ -88,22 +89,24 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Suspending device\n");
 
+	err = xe_pxp_pm_suspend(xe->pxp);
+	if (err)
+		goto err;
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
 	if (err)
-		goto err;
+		goto err_pxp;
 
 	xe_display_pm_suspend(xe, false);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
-		if (err) {
-			xe_display_pm_resume(xe, false);
-			goto err;
-		}
+		if (err)
+			goto err_display;
 	}
 
 	xe_irq_suspend(xe);
@@ -112,6 +115,11 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	drm_dbg(&xe->drm, "Device suspended\n");
 	return 0;
+
+err_display:
+	xe_display_pm_resume(xe, false);
+err_pxp:
+	xe_pxp_pm_resume(xe->pxp);
 err:
 	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
 	return err;
@@ -160,6 +168,8 @@ int xe_pm_resume(struct xe_device *xe)
 	if (err)
 		goto err;
 
+	xe_pxp_pm_resume(xe->pxp);
+
 	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
 err:
@@ -352,6 +362,10 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 */
 	lock_map_acquire(&xe_pm_runtime_lockdep_map);
 
+	err = xe_pxp_pm_suspend(xe->pxp);
+	if (err)
+		goto out;
+
 	/*
 	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
 	 * also checks and delets bo entry from user fault list.
@@ -365,23 +379,30 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	if (xe->d3cold.allowed) {
 		err = xe_bo_evict_all(xe);
 		if (err)
-			goto out;
+			goto out_pxp;
 		xe_display_pm_suspend(xe, true);
 	}
 
 	for_each_gt(gt, xe, id) {
 		err = xe_gt_suspend(gt);
 		if (err)
-			goto out;
+			goto out_display;
 	}
 
 	xe_irq_suspend(xe);
 
 	if (xe->d3cold.allowed)
 		xe_display_pm_suspend_late(xe);
+
+	lock_map_release(&xe_pm_runtime_lockdep_map);
+	xe_pm_write_callback_task(xe, NULL);
+	return 0;
+
+out_display:
+	xe_display_pm_resume(xe, true);
+out_pxp:
+	xe_pxp_pm_resume(xe->pxp);
 out:
-	if (err)
-		xe_display_pm_resume(xe, true);
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
 	return err;
@@ -431,6 +452,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 		if (err)
 			goto out;
 	}
+
+	xe_pxp_pm_resume(xe->pxp);
+
 out:
 	lock_map_release(&xe_pm_runtime_lockdep_map);
 	xe_pm_write_callback_task(xe, NULL);
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 493b8ff4b743..a5e912b1fdc1 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -137,6 +137,13 @@ static void pxp_terminate(struct xe_pxp *pxp)
 	if (pxp->status == XE_PXP_ACTIVE)
 		pxp->key_instance++;
 
+	/*
+	 * we'll mark the status as needing termination on resume, so no need to
+	 * emit a termination now.
+	 */
+	if (pxp->status == XE_PXP_SUSPENDED)
+		return;
+
 	/*
 	 * If we have a termination already in progress, we need to wait for
 	 * it to complete before queueing another one. We update the state
@@ -183,17 +190,19 @@ static void pxp_terminate(struct xe_pxp *pxp)
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
@@ -484,6 +493,7 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type)
 		pxp_terminate(pxp);
 		mutex_unlock(&pxp->mutex);
 		goto wait_for_termination;
+	case XE_PXP_SUSPENDED:
 	default:
 		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
 		ret = -EIO;
@@ -620,3 +630,84 @@ int xe_pxp_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
 
 	return 0;
 }
+
+int xe_pxp_pm_suspend(struct xe_pxp *pxp)
+{
+	int ret = 0;
+
+	if (!xe_pxp_is_enabled(pxp))
+		 return 0;
+
+	mutex_lock(&pxp->mutex);
+
+	/* if the termination is already in progress, no need to re-emit it */
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
+		pxp_terminate(pxp);
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
+void xe_pxp_pm_resume(struct xe_pxp *pxp)
+{
+	int err;
+
+	if (!xe_pxp_is_enabled(pxp))
+		 return;
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
+
+	return;
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index e3c4c92fc7a3..0ff79f9a900b 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -20,6 +20,9 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
+int xe_pxp_pm_suspend(struct xe_pxp *pxp);
+void xe_pxp_pm_resume(struct xe_pxp *pxp);
+
 int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
 void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
 
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index e28bcbda1ec6..58edd0d85348 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -23,7 +23,8 @@ enum xe_pxp_status {
 	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
 	XE_PXP_TERMINATION_IN_PROGRESS,
 	XE_PXP_READY_TO_START,
-	XE_PXP_ACTIVE
+	XE_PXP_ACTIVE,
+	XE_PXP_SUSPENDED
 };
 
 /**
@@ -91,6 +92,12 @@ struct xe_pxp {
 
 	/** @key_instance: keep track of the current iteration of the PXP key */
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

