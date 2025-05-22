Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518DDC54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 22:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F227010E163;
	Thu, 22 May 2025 22:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JNy/7VWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D58C10E182
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 22:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747954455; x=1779490455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHhQdUagsi+1yHzjg1LpMiv0E/EHQHIHl5XrlkFrM1E=;
 b=JNy/7VWL9ZFK7M++ThMsnhfFCah9PRGYabEJnEQbrJiHb04I/52FZOv4
 Oa0dJXpbBYKoKk9y1BwxthsSfoSMn1IQ2mPkQPBZpAczvcSdDCI2xyGV/
 95gGHCdklqVi7iUD1BOSTnLgmfJRK38OxBPSFd7MyCYzuHy18q4oW1qRL
 6eogPC6f1/wMSE+20V19t0PVP87FGFj6GTg8ih3o7SjtaFPfrLB6mtY1u
 msFyqrnC2ZUEOHgXtaEGGwENwu/p2DGOSjwygj02FxoC5Pm6XBSqj2DXv
 PnMC8fQcALIIONBpo9aTVVsN/oHYUjwNGGnBpqJLq+KxbHFtjg+bif0t1 A==;
X-CSE-ConnectionGUID: fX42dLTNRVmtMN0UK8YahA==
X-CSE-MsgGUID: cLRNoj3MSpW32+EyAzhWsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49996933"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="49996933"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:54:15 -0700
X-CSE-ConnectionGUID: qg2V30cjRJmogeSVCCjXFw==
X-CSE-MsgGUID: m609h/U8RPCa1lBBEC4T7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="145967106"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:54:16 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 3/3] drm/xe/pxp: Decouple queue addition from PXP start
Date: Thu, 22 May 2025 15:54:05 -0700
Message-ID: <20250522225401.3953243-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
References: <20250522225401.3953243-5-daniele.ceraolospurio@intel.com>
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

Starting PXP and adding a queue to the PXP queue list are separate
actions. Given that a queue can only be added to the list if PXP is
active, the 2 actions were bundled together to avoid having to
re-lock and re-check the status to perform the queue addition after
having done so during the PXP start. However, we don't save a lot of
complexity by doing so and we lose in clarity of code, so overall it's
cleaner to just keep the 2 actions separate.

v2: remove leftover rpm_get (John), fix rpm_put in error case

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 147 +++++++++++++++++++++---------------
 1 file changed, 86 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index b5bc15f436fa..3d62008c99f1 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -504,69 +504,62 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 t
 	return 0;
 }
 
-static void __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
+static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 {
-	spin_lock_irq(&pxp->queues.lock);
-	list_add_tail(&q->pxp.link, &pxp->queues.list);
-	spin_unlock_irq(&pxp->queues.lock);
+	int ret = 0;
+
+	/*
+	 * A queue can be added to the list only if the PXP is in active status,
+	 * otherwise the termination might not handle it correctly.
+	 */
+	mutex_lock(&pxp->mutex);
+
+	if (pxp->status == XE_PXP_ACTIVE) {
+		spin_lock_irq(&pxp->queues.lock);
+		list_add_tail(&q->pxp.link, &pxp->queues.list);
+		spin_unlock_irq(&pxp->queues.lock);
+	} else if (pxp->status == XE_PXP_ERROR || pxp->status == XE_PXP_SUSPENDED) {
+		ret = -EIO;
+	} else {
+		ret = -EBUSY; /* try again later */
+	}
+
+	mutex_unlock(&pxp->mutex);
+
+	return ret;
 }
 
-/**
- * xe_pxp_exec_queue_add - add a queue to the PXP list
- * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
- * @q: the queue to add to the list
- *
- * If PXP is enabled and the prerequisites are done, start the PXP ARB
- * session (if not already running) and add the queue to the PXP list. Note
- * that the queue must have previously been marked as using PXP with
- * xe_pxp_exec_queue_set_type.
- *
- * Returns 0 if the PXP ARB session is running and the queue is in the list,
- * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
- * other errno value if something goes wrong during the session start.
- */
-int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
+static int pxp_start(struct xe_pxp *pxp, u8 type)
 {
 	int ret = 0;
+	bool restart = false;
 
 	if (!xe_pxp_is_enabled(pxp))
 		return -ENODEV;
 
 	/* we only support HWDRM sessions right now */
-	xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
-
-	/*
-	 * Runtime suspend kills PXP, so we take a reference to prevent it from
-	 * happening while we have active queues that use PXP
-	 */
-	xe_pm_runtime_get(pxp->xe);
+	xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
 
 	/* get_readiness_status() returns 0 for in-progress and 1 for done */
 	ret = xe_pxp_get_readiness_status(pxp);
-	if (ret <= 0) {
-		if (!ret)
-			ret = -EBUSY;
-		goto out;
-	}
+	if (ret <= 0)
+		return ret ?: -EBUSY;
+
 	ret = 0;
 
 wait_for_idle:
 	/*
 	 * if there is an action in progress, wait for it. We need to wait
 	 * outside the lock because the completion is done from within the lock.
-	 * Note that the two action should never be pending at the same time.
+	 * Note that the two actions should never be pending at the same time.
 	 */
 	if (!wait_for_completion_timeout(&pxp->termination,
-					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS))) {
-		ret = -ETIMEDOUT;
-		goto out;
-	}
+					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
+		return -ETIMEDOUT;
 
 	if (!wait_for_completion_timeout(&pxp->activation,
-					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS))) {
-		ret = -ETIMEDOUT;
-		goto out;
-	}
+					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
+		return -ETIMEDOUT;
 
 	mutex_lock(&pxp->mutex);
 
@@ -574,11 +567,9 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	switch (pxp->status) {
 	case XE_PXP_ERROR:
 		ret = -EIO;
-		break;
+		goto out_unlock;
 	case XE_PXP_ACTIVE:
-		__exec_queue_add(pxp, q);
-		mutex_unlock(&pxp->mutex);
-		goto out;
+		goto out_unlock;
 	case XE_PXP_READY_TO_START:
 		pxp->status = XE_PXP_START_IN_PROGRESS;
 		reinit_completion(&pxp->activation);
@@ -586,8 +577,8 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	case XE_PXP_START_IN_PROGRESS:
 		/* If a start is in progress then the completion must not be done */
 		XE_WARN_ON(completion_done(&pxp->activation));
-		mutex_unlock(&pxp->mutex);
-		goto wait_for_idle;
+		restart = true;
+		goto out_unlock;
 	case XE_PXP_NEEDS_TERMINATION:
 		mark_termination_in_progress(pxp);
 		break;
@@ -595,29 +586,25 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
 		/* If a termination is in progress then the completion must not be done */
 		XE_WARN_ON(completion_done(&pxp->termination));
-		mutex_unlock(&pxp->mutex);
-		goto wait_for_idle;
+		restart = true;
+		goto out_unlock;
 	case XE_PXP_SUSPENDED:
 	default:
 		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u\n", pxp->status);
 		ret = -EIO;
-		break;
+		goto out_unlock;
 	}
 
 	mutex_unlock(&pxp->mutex);
 
-	if (ret)
-		goto out;
-
 	if (!completion_done(&pxp->termination)) {
 		ret = pxp_terminate_hw(pxp);
 		if (ret) {
 			drm_err(&pxp->xe->drm, "PXP termination failed before start\n");
 			mutex_lock(&pxp->mutex);
 			pxp->status = XE_PXP_ERROR;
-			mutex_unlock(&pxp->mutex);
 
-			goto out;
+			goto out_unlock;
 		}
 
 		goto wait_for_idle;
@@ -639,21 +626,59 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	if (pxp->status != XE_PXP_START_IN_PROGRESS) {
 		drm_err(&pxp->xe->drm, "unexpected state after PXP start: %u\n", pxp->status);
 		pxp->status = XE_PXP_NEEDS_TERMINATION;
-		mutex_unlock(&pxp->mutex);
-		goto wait_for_idle;
+		restart = true;
+		goto out_unlock;
 	}
 
 	/* If everything went ok, update the status and add the queue to the list */
-	if (!ret) {
+	if (!ret)
 		pxp->status = XE_PXP_ACTIVE;
-		__exec_queue_add(pxp, q);
-	} else {
+	else
 		pxp->status = XE_PXP_ERROR;
-	}
 
+out_unlock:
 	mutex_unlock(&pxp->mutex);
 
-out:
+	if (restart)
+		goto wait_for_idle;
+
+	return ret;
+}
+
+/**
+ * xe_pxp_exec_queue_add - add a queue to the PXP list
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @q: the queue to add to the list
+ *
+ * If PXP is enabled and the prerequisites are done, start the PXP default
+ * session (if not already running) and add the queue to the PXP list.
+ *
+ * Returns 0 if the PXP session is running and the queue is in the list,
+ * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
+ * other errno value if something goes wrong during the session start.
+ */
+int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
+{
+	int ret;
+
+	if (!xe_pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	/*
+	 * Runtime suspend kills PXP, so we take a reference to prevent it from
+	 * happening while we have active queues that use PXP
+	 */
+	xe_pm_runtime_get(pxp->xe);
+
+start:
+	ret = pxp_start(pxp, q->pxp.type);
+
+	if (!ret) {
+		ret = __exec_queue_add(pxp, q);
+		if (ret == -EBUSY)
+			goto start;
+	}
+
 	/*
 	 * in the successful case the PM ref is released from
 	 * xe_pxp_exec_queue_remove
-- 
2.43.0

