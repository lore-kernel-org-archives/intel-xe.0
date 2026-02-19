Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE13E9A02C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 00:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B0810E156;
	Thu, 19 Feb 2026 00:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHhwcpgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1E110E156
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 00:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771460804; x=1802996804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sa+RUKj+1K1jPzrzZYGnOijnux1pN5utfL0gzAayx28=;
 b=SHhwcpgkKSjLOpFFs5jWRjPsnQn9up9ZrPjzvNOKtHz6v6ZS88gdZAAf
 1Rh+q1dEU3ZsT07BpIxuVljzFkIHna7mbw0Vxqv2hrsj01gWECyzF2zul
 VIDrhZ75djYw/raDfBOdi7OpV2L6rZkqi3WUoeCU0At1pzYzMpVF0Vu2Z
 pUc+2Sg5y32C5k5oYTeYIXleSWXSdKK+T/n7rK1O4+6WF0F2IzPnhBAq6
 WALHfE9IhpG9/cBVudNBWTmTsLt7IOOyz8G4sDNgIR96BJNLlDkGWRTEI
 dBAnMLvIg3FIQynHuJFfx5gDwfTC8mPaSztJzHT5ph3lj265fFA/EM0Vn Q==;
X-CSE-ConnectionGUID: ee8ncmHYR3mJYF/oVLi6Vw==
X-CSE-MsgGUID: +E5U4/95TlC4z7MjML0fMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72449412"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="72449412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:43 -0800
X-CSE-ConnectionGUID: RuYe8OK6SuGzC3YEkDhrLw==
X-CSE-MsgGUID: iHrx41ETTIS5bMZ2oq4kqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="218499639"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 16:26:44 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 3/3] drm/xe/pxp: Do a PXP termination before suspend entry
Date: Wed, 18 Feb 2026 16:26:31 -0800
Message-ID: <20260219002627.1208210-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
References: <20260219002627.1208210-5-daniele.ceraolospurio@intel.com>
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

There is a bug in the PTL GSC FW that causes the FW to sometimes crash
after we resume from system suspend if a PXP session was still active
when we suspended. This is being debugged from the GSC side, but in the
meantime we can mitigate the issue by simply making sure that all PXP
sessions are terminated before we enter system suspend. Given that there
are no negative consequences with doing this extra termination (because
we do a termination after we resume anyway, so the state is cleaned no
matter what), the change is applied unconditionally for all platforms to
keep the behavior the same.

Note that the issue has not been seen so far with runtime suspend, so
the behavior has not been modified for that case.

Fixes: b1dcec9bd8a1 ("drm/xe/ptl: Enable PXP for PTL")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7075
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn Teres Alexis <alan.previn.teres.alexis@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c  |  4 +-
 drivers/gpu/drm/xe/xe_pxp.c | 84 +++++++++++++++++++++++--------------
 drivers/gpu/drm/xe/xe_pxp.h |  2 +-
 3 files changed, 56 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 01185f10a883..7094b133f449 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -178,7 +178,7 @@ int xe_pm_suspend(struct xe_device *xe)
 	xe_pm_block_begin_signalling();
 	trace_xe_pm_suspend(xe, __builtin_return_address(0));
 
-	err = xe_pxp_pm_suspend(xe->pxp);
+	err = xe_pxp_pm_suspend(xe->pxp, true);
 	if (err)
 		goto err;
 
@@ -584,7 +584,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	 */
 	xe_rpm_lockmap_acquire(xe);
 
-	err = xe_pxp_pm_suspend(xe->pxp);
+	err = xe_pxp_pm_suspend(xe->pxp, false);
 	if (err)
 		goto out;
 
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index fa82d606953e..bff20f0e5cf4 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -509,6 +509,24 @@ static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	return ret;
 }
 
+static int pxp_wait_for_events(struct xe_pxp *pxp)
+{
+	/*
+	 * if there is an action in progress, wait for it. We need to wait
+	 * outside the lock because the completion is done from within the lock.
+	 * Note that the two actions should never be pending at the same time.
+	 */
+	if (!wait_for_completion_timeout(&pxp->termination,
+					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
+		return -ETIMEDOUT;
+
+	if (!wait_for_completion_timeout(&pxp->activation,
+					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
 static int pxp_start(struct xe_pxp *pxp, u8 type)
 {
 	int ret = 0;
@@ -528,18 +546,9 @@ static int pxp_start(struct xe_pxp *pxp, u8 type)
 	ret = 0;
 
 wait_for_idle:
-	/*
-	 * if there is an action in progress, wait for it. We need to wait
-	 * outside the lock because the completion is done from within the lock.
-	 * Note that the two actions should never be pending at the same time.
-	 */
-	if (!wait_for_completion_timeout(&pxp->termination,
-					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
-		return -ETIMEDOUT;
-
-	if (!wait_for_completion_timeout(&pxp->activation,
-					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
-		return -ETIMEDOUT;
+	ret = pxp_wait_for_events(pxp);
+	if (ret)
+		return ret;
 
 	mutex_lock(&pxp->mutex);
 
@@ -827,13 +836,14 @@ int xe_pxp_obj_key_check(struct drm_gem_object *obj)
 /**
  * xe_pxp_pm_suspend - prepare PXP for HW suspend
  * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @terminate: terminate PXP if active before suspending
  *
  * Makes sure all PXP actions have completed and invalidates all PXP queues
  * and objects before we go into a suspend state.
  *
  * Returns: 0 if successful, a negative errno value otherwise.
  */
-int xe_pxp_pm_suspend(struct xe_pxp *pxp)
+int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool terminate)
 {
 	bool needs_queue_inval = false;
 	int ret = 0;
@@ -841,10 +851,10 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 	if (!xe_pxp_is_enabled(pxp))
 		return 0;
 
-wait_for_activation:
-	if (!wait_for_completion_timeout(&pxp->activation,
-					 msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
-		ret = -ETIMEDOUT;
+wait_for_idle:
+	ret = pxp_wait_for_events(pxp);
+	if (ret)
+		return ret;
 
 	mutex_lock(&pxp->mutex);
 
@@ -852,46 +862,58 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 	case XE_PXP_ERROR:
 	case XE_PXP_READY_TO_START:
 	case XE_PXP_SUSPENDED:
-	case XE_PXP_TERMINATION_IN_PROGRESS:
 	case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
 		/*
 		 * If PXP is not running there is nothing to cleanup. If there
 		 * is a termination pending then no need to issue another one.
 		 */
 		break;
+	case XE_PXP_TERMINATION_IN_PROGRESS:
 	case XE_PXP_START_IN_PROGRESS:
 		mutex_unlock(&pxp->mutex);
-		goto wait_for_activation;
+		goto wait_for_idle;
 	case XE_PXP_NEEDS_TERMINATION:
 		/* If PXP was never used we can skip the cleanup */
 		if (pxp->key_instance == pxp->last_suspend_key_instance)
 			break;
 		fallthrough;
 	case XE_PXP_ACTIVE:
-		pxp->key_instance++;
+		if (terminate)
+			mark_termination_in_progress(pxp);
 		needs_queue_inval = true;
+		pxp->key_instance++;
 		break;
 	}
 
 	/*
-	 * We set this even if we were in error state, hoping the suspend clears
-	 * the error. Worse case we fail again and go in error state again.
+	 * If we're not taking any action (i.e. we're not triggering a
+	 * termination), we set this even if we were in error state, hoping the
+	 * suspend clears the error. Worst case we fail again and go in error
+	 * state again.
 	 */
-	pxp->status = XE_PXP_SUSPENDED;
+	if (completion_done(&pxp->termination))
+		pxp->status = XE_PXP_SUSPENDED;
 
 	mutex_unlock(&pxp->mutex);
 
 	if (needs_queue_inval)
 		pxp_invalidate_queues(pxp);
 
-	/*
-	 * if there is a termination in progress, wait for it.
-	 * We need to wait outside the lock because the completion is done from
-	 * within the lock
-	 */
-	if (!wait_for_completion_timeout(&pxp->termination,
-					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
-		ret = -ETIMEDOUT;
+	if (!completion_done(&pxp->termination)) {
+		ret = pxp_terminate_hw(pxp);
+		if (ret) {
+			drm_err(&pxp->xe->drm, "PXP termination failed before suspend\n");
+			mutex_lock(&pxp->mutex);
+			pxp->status = XE_PXP_ERROR;
+			complete_all(&pxp->termination);
+			mutex_unlock(&pxp->mutex);
+			return ret;
+		}
+
+		goto wait_for_idle;
+	}
+
+	ret = kcr_pxp_disable(pxp);
 
 	pxp->last_suspend_key_instance = pxp->key_instance;
 
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index 71a23280b900..2fe2a8bab127 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -21,7 +21,7 @@ int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
-int xe_pxp_pm_suspend(struct xe_pxp *pxp);
+int xe_pxp_pm_suspend(struct xe_pxp *pxp, bool terminate);
 void xe_pxp_pm_resume(struct xe_pxp *pxp);
 
 int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
-- 
2.43.0

