Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C25C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A623210EF00;
	Tue,  7 Jul 2026 22:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ov3o5vIo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4E910EF00
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462451; x=1814998451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZIpHZ54AKkXq7j8Nr3BYzJJoQDYvGOfLxTE6WWajDuo=;
 b=Ov3o5vIoSRHVr+PpnAANsfg5Y0ZLDTN6CUEb1b3T401RgwbUMShC0K3V
 X8nhHcNO5ZcUAjFdSGDQnR5NQGDV9bAjaO0q8an86mlo0tNkWmNMeT1U+
 4LtCNwAoqifFPFQI+qkYf9ZEk2XaRjLJyXpgG/El3l8FU7CMsSoFbv6oS
 BMFEEU4hmFCP1bROFIxK5FGk9ZWb3W+CcqucR8iYtgbp7lsjh+k46SoMH
 T9HXmC0P7YLEsXdmkESHg9/sQqGEzHbZwmeWPJhWazbyor22fHpm0GlwN
 g7gFJFewLma0Ra5K8dUcZhEW05mMZ4nVpM/MFabUXdJHJtIEQEAWzz1fG g==;
X-CSE-ConnectionGUID: CWsGyxCjRkCFEudHArA9TA==
X-CSE-MsgGUID: xgRVZMsBSuO1PF64JUn/Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84176801"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84176801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:14:08 -0700
X-CSE-ConnectionGUID: 6XHK0wZoTfO49mwLiL9C9w==
X-CSE-MsgGUID: 06OI2VApTAiSaavG8zWdYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257996024"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:14:07 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH] drm/xe/pxp: add termination on resume
Date: Tue,  7 Jul 2026 15:14:00 -0700
Message-ID: <20260707221359.2828044-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
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

Suspend/resume causes the PXP keys to become invalid, but doesn't
actually kill the session. The driver also doesn't explicitly kill and
re-start the session until a new PXP request comes in, which means that
the "zombie" session can potentially stick around if there are no new
requests from userspace. While this is not an issue for PXP, HDCP has a
new behavior starting on PTL where a communication is sent to GSC if a
session is active at suspend time (even if it doesn't have a valid key),
which can lead to delays in the suspend flow if we suspend while the
zombie session is still active.
To avoid this, we can trigger a termination on resume and kill the
zombie session immediately, instead of delaying the termination to the
next PXP request. Due to restrictions in the rpm suspend/resume flow, we
can't call the termination flow from within the resume call itself, so
the pxp irq worker is expanded to cover this scenario. As part of this
change, the pxp->events variable has been moved to atomic, to avoid
having to take xe->irq.lock from non-irq related paths.

Fixes: b1dcec9bd8a1 ("drm/xe/ptl: Enable PXP for PTL")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c       | 111 ++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_pxp_types.h |  25 ++++---
 2 files changed, 91 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index fea3d8ceeddb..7e911e87b1a7 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -174,16 +174,9 @@ static void mark_termination_in_progress(struct xe_pxp *pxp)
 	pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
 }
 
-static void pxp_terminate(struct xe_pxp *pxp)
+static bool pxp_prep_for_termination(struct xe_pxp *pxp)
 {
-	int ret = 0;
-	struct xe_device *xe = pxp->xe;
-
-	if (!wait_for_completion_timeout(&pxp->activation,
-					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
-		drm_err(&xe->drm, "failed to wait for PXP start before termination\n");
-
-	mutex_lock(&pxp->mutex);
+	lockdep_assert_held(&pxp->mutex);
 
 	if (pxp->status == XE_PXP_ACTIVE)
 		pxp->key_instance++;
@@ -192,10 +185,8 @@ static void pxp_terminate(struct xe_pxp *pxp)
 	 * we'll mark the status as needing termination on resume, so no need to
 	 * emit a termination now.
 	 */
-	if (pxp->status == XE_PXP_SUSPENDED) {
-		mutex_unlock(&pxp->mutex);
-		return;
-	}
+	if (pxp->status == XE_PXP_SUSPENDED)
+		return false;
 
 	/*
 	 * If we have a termination already in progress, we need to wait for
@@ -205,15 +196,44 @@ static void pxp_terminate(struct xe_pxp *pxp)
 	 */
 	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS) {
 		pxp->status = XE_PXP_NEEDS_ADDITIONAL_TERMINATION;
-		mutex_unlock(&pxp->mutex);
-		return;
+		return false;
 	}
 
 	mark_termination_in_progress(pxp);
 
-	mutex_unlock(&pxp->mutex);
+	return true;
+}
 
-	pxp_invalidate_queues(pxp);
+static void pxp_terminate(struct xe_pxp *pxp, bool full)
+{
+	struct xe_device *xe = pxp->xe;
+	int ret = 0;
+
+	if (!wait_for_completion_timeout(&pxp->activation,
+					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
+		drm_err(&xe->drm, "failed to wait for PXP start before termination\n");
+
+	if (full) {
+		bool prep_ok;
+
+		mutex_lock(&pxp->mutex);
+
+		prep_ok = pxp_prep_for_termination(pxp);
+
+		mutex_unlock(&pxp->mutex);
+
+		if (!prep_ok)
+			return;
+
+		pxp_invalidate_queues(pxp);
+	} else {
+		/*
+		 * The caller of the HW-only termination should have already
+		 * called pxp_prep_for_termination and marked the termination as
+		 * in progress.
+		 */
+		xe_assert(xe, !completion_done(&pxp->termination));
+	}
 
 	ret = pxp_terminate_hw(pxp);
 	if (ret) {
@@ -259,16 +279,13 @@ static void pxp_terminate_complete(struct xe_pxp *pxp)
 	mutex_unlock(&pxp->mutex);
 }
 
-static void pxp_irq_work(struct work_struct *work)
+static void pxp_events_work(struct work_struct *work)
 {
-	struct xe_pxp *pxp = container_of(work, typeof(*pxp), irq.work);
+	struct xe_pxp *pxp = container_of(work, typeof(*pxp), events.work);
 	struct xe_device *xe = pxp->xe;
 	u32 events = 0;
 
-	spin_lock_irq(&xe->irq.lock);
-	events = pxp->irq.events;
-	pxp->irq.events = 0;
-	spin_unlock_irq(&xe->irq.lock);
+	events = atomic_xchg(&pxp->events.pending, 0);
 
 	if (!events)
 		return;
@@ -282,7 +299,7 @@ static void pxp_irq_work(struct work_struct *work)
 
 	if (events & PXP_TERMINATION_REQUEST) {
 		events &= ~PXP_TERMINATION_COMPLETE;
-		pxp_terminate(pxp);
+		pxp_terminate(pxp, events & PXP_TERMINATION_REQUEST_FULL);
 	}
 
 	if (events & PXP_TERMINATION_COMPLETE)
@@ -306,20 +323,18 @@ void xe_pxp_irq_handler(struct xe_device *xe, u16 iir)
 		return;
 	}
 
-	lockdep_assert_held(&xe->irq.lock);
-
 	if (unlikely(!iir))
 		return;
 
 	if (iir & (KCR_PXP_STATE_TERMINATED_INTERRUPT |
 		   KCR_APP_TERMINATED_PER_FW_REQ_INTERRUPT))
-		pxp->irq.events |= PXP_TERMINATION_REQUEST;
+		atomic_or(PXP_TERMINATION_REQUEST_FULL, &pxp->events.pending);
 
 	if (iir & KCR_PXP_STATE_RESET_COMPLETE_INTERRUPT)
-		pxp->irq.events |= PXP_TERMINATION_COMPLETE;
+		atomic_or(PXP_TERMINATION_COMPLETE, &pxp->events.pending);
 
-	if (pxp->irq.events)
-		queue_work(pxp->irq.wq, &pxp->irq.work);
+	if (atomic_read(&pxp->events.pending))
+		queue_work(pxp->events.wq, &pxp->events.work);
 }
 
 static int kcr_pxp_set_status(const struct xe_pxp *pxp, bool enable)
@@ -350,7 +365,7 @@ static void pxp_fini(void *arg)
 {
 	struct xe_pxp *pxp = arg;
 
-	destroy_workqueue(pxp->irq.wq);
+	destroy_workqueue(pxp->events.wq);
 	xe_pxp_destroy_execution_resources(pxp);
 
 	/* no need to explicitly disable KCR since we're going to do an FLR */
@@ -417,7 +432,7 @@ int xe_pxp_init(struct xe_device *xe)
 
 	INIT_LIST_HEAD(&pxp->queues.list);
 	spin_lock_init(&pxp->queues.lock);
-	INIT_WORK(&pxp->irq.work, pxp_irq_work);
+	INIT_WORK(&pxp->events.work, pxp_events_work);
 	pxp->xe = xe;
 	pxp->gt = gt;
 
@@ -436,8 +451,8 @@ int xe_pxp_init(struct xe_device *xe)
 
 	mutex_init(&pxp->mutex);
 
-	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
-	if (!pxp->irq.wq) {
+	pxp->events.wq = alloc_ordered_workqueue("pxp-wq", 0);
+	if (!pxp->events.wq) {
 		err = -ENOMEM;
 		goto out_free;
 	}
@@ -457,7 +472,7 @@ int xe_pxp_init(struct xe_device *xe)
 out_kcr_disable:
 	kcr_pxp_disable(pxp);
 out_wq:
-	destroy_workqueue(pxp->irq.wq);
+	destroy_workqueue(pxp->events.wq);
 out_free:
 	drmm_kfree(&xe->drm, pxp);
 out:
@@ -904,6 +919,7 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 		fallthrough;
 	case XE_PXP_ACTIVE:
 		pxp->key_instance++;
+		pxp->needs_termination_on_resume = true;
 		needs_queue_inval = true;
 		break;
 	}
@@ -950,10 +966,31 @@ void xe_pxp_pm_resume(struct xe_pxp *pxp)
 
 	xe_assert(pxp->xe, pxp->status == XE_PXP_SUSPENDED);
 
-	if (err)
+	if (err) {
 		pxp->status = XE_PXP_ERROR;
-	else
+	} else {
 		pxp->status = XE_PXP_NEEDS_TERMINATION;
 
+		if (pxp->needs_termination_on_resume) {
+			pxp->needs_termination_on_resume = false;
+
+			/*
+			 * We can't call pxp_terminate_hw directly from here
+			 * because we're not allowed to do allocations within
+			 * the rpm resume call, so we defer the termination to
+			 * the worker that we use for the termination irqs.
+			 * However, we do not want any PXP ops to go through
+			 * between the suspend completing and the worker
+			 * starting, so we need to do the termination prep
+			 * immediately, which will mark the termination as in
+			 * progress and stall PXP ops.
+			 */
+			if (pxp_prep_for_termination(pxp)) {
+				atomic_or(PXP_TERMINATION_REQUEST_HW_ONLY, &pxp->events.pending);
+				queue_work(pxp->events.wq, &pxp->events.work);
+			}
+		}
+	}
+
 	mutex_unlock(&pxp->mutex);
 }
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index ec86306e16f4..7acfe45d397a 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -85,17 +85,20 @@ struct xe_pxp {
 	/** @gsc_res: kernel-owned objects for PXP submissions to the GSCCS */
 	struct xe_pxp_gsc_client_resources gsc_res;
 
-	/** @irq: wrapper for the worker and queue used for PXP irq support */
+	/** @events: wrapper for the worker and queue used for PXP event handling */
 	struct {
-		/** @irq.work: worker that manages irq events. */
+		/** @events.work: worker that manages termination events. */
 		struct work_struct work;
-		/** @irq.wq: workqueue on which to queue the irq work. */
+		/** @events.wq: workqueue on which to queue the work. */
 		struct workqueue_struct *wq;
-		/** @irq.events: pending events, protected with xe->irq.lock. */
-		u32 events;
-#define PXP_TERMINATION_REQUEST  BIT(0)
-#define PXP_TERMINATION_COMPLETE BIT(1)
-	} irq;
+		/** @events.pending: pending events */
+		atomic_t pending;
+#define PXP_TERMINATION_REQUEST_FULL	BIT(0)
+#define PXP_TERMINATION_REQUEST_HW_ONLY BIT(1)
+#define PXP_TERMINATION_REQUEST	(PXP_TERMINATION_REQUEST_FULL | \
+				 PXP_TERMINATION_REQUEST_HW_ONLY)
+#define PXP_TERMINATION_COMPLETE	BIT(2)
+	} events;
 
 	/** @mutex: protects the pxp status and the queue list */
 	struct mutex mutex;
@@ -130,6 +133,12 @@ struct xe_pxp {
 	 * suspend cycles.
 	 */
 	u32 last_suspend_key_instance;
+	/**
+	 * @needs_termination_on_resume: indicates if PXP termination is needed
+	 * on resume. This is set if PXP was active when we suspended. Protected
+	 * by pxp->mutex.
+	 */
+	bool needs_termination_on_resume;
 };
 
 #endif /* _XE_PXP_TYPES_H_ */
-- 
2.43.0

