Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767D1C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 23:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4B210E8BA;
	Wed, 19 Feb 2025 23:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/79UPPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6355A10E8BA
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 23:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740009168; x=1771545168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YAas5yamwkHDHugISgXX1pDu0j8vGw9j2RPC7u/G+ds=;
 b=L/79UPPhE4YXdTWx5xSkpFBDL5+TH/EOqDxgGZ6BqMnT4P2n2h4mkujh
 N/dKaSREjaKt5D24ZZr6pvy5sazuY03rZfiCw9QsKgnNEI2LPmaXpT9en
 Lg8AhrsJJJzoBeH3TvbATKor0MN+OdcWwDLIeBKrsikasuG+mfAJXg2vF
 8xoUTe+fShyshLw4vgZKGyB9WNdVR9dIrItOs7AcGY4M0uKaPiZ8B8tiY
 X2bK2fYTHLAqh0fHgh8i9TB0p7+270JEm4L+duBIEyEG0AcpG4RXD0Z8l
 MwYPLdtOCFM00123lBaFobPpW/4mSNqt2Hyv2uui3fX3MRqLyUj4m/86U Q==;
X-CSE-ConnectionGUID: 4tznSWUVQm2XQpvOVvQIIw==
X-CSE-MsgGUID: /PTE+RKWS9uazcFS0IFBYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="28365432"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; d="scan'208";a="28365432"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 15:52:48 -0800
X-CSE-ConnectionGUID: m+dW00+US3yUr7bvnOuuWA==
X-CSE-MsgGUID: FDYqmiIJTwCCgCcnrssZww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118971537"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 15:52:48 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/xe/pxp: Don't kill queues while holding PXP locks
Date: Wed, 19 Feb 2025 15:52:36 -0800
Message-ID: <20250219235236.2597612-1-daniele.ceraolospurio@intel.com>
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

xe_exec_queue_kill can sleep, so we can't call it from under a spinlock.
We can instead move the queues to a separate list and then kill them all
after we release the spinlock.

Furthermore, xe_exec_queue_kill can take the VM lock so we can't call it
while holding the PXP mutex because the mutex is taken under VM lock at
queue creation time. Note that while it is safe to call the kill without
holding the mutex, we must call it after the PXP state has been updated,
otherwise an app might be able to create a queue between the
invalidation and the state update, which would break the state machine.

Since being in the list is used to track whether RPM cleanup is needed,
we can no longer defer that to queue_destroy, so we perform it
immediately instead.

v2: also avoid calling kill() under pxp->mutex.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pxp.c | 78 +++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 3cd3f83e86b0..47499ca02693 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -132,14 +132,6 @@ static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
 
 static void pxp_invalidate_queues(struct xe_pxp *pxp);
 
-static void pxp_invalidate_state(struct xe_pxp *pxp)
-{
-	pxp_invalidate_queues(pxp);
-
-	if (pxp->status == XE_PXP_ACTIVE)
-		pxp->key_instance++;
-}
-
 static int pxp_terminate_hw(struct xe_pxp *pxp)
 {
 	struct xe_gt *gt = pxp->gt;
@@ -193,7 +185,8 @@ static void pxp_terminate(struct xe_pxp *pxp)
 
 	mutex_lock(&pxp->mutex);
 
-	pxp_invalidate_state(pxp);
+	if (pxp->status == XE_PXP_ACTIVE)
+		pxp->key_instance++;
 
 	/*
 	 * we'll mark the status as needing termination on resume, so no need to
@@ -220,6 +213,8 @@ static void pxp_terminate(struct xe_pxp *pxp)
 
 	mutex_unlock(&pxp->mutex);
 
+	pxp_invalidate_queues(pxp);
+
 	ret = pxp_terminate_hw(pxp);
 	if (ret) {
 		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
@@ -665,23 +660,15 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
 	return ret;
 }
 
-/**
- * xe_pxp_exec_queue_remove - remove a queue from the PXP list
- * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
- * @q: the queue to remove from the list
- *
- * If PXP is enabled and the exec_queue is in the list, the queue will be
- * removed from the list and its PM reference will be released. It is safe to
- * call this function multiple times for the same queue.
- */
-void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
+static void __pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q, bool lock)
 {
 	bool need_pm_put = false;
 
 	if (!xe_pxp_is_enabled(pxp))
 		return;
 
-	spin_lock_irq(&pxp->queues.lock);
+	if (lock)
+		spin_lock_irq(&pxp->queues.lock);
 
 	if (!list_empty(&q->pxp.link)) {
 		list_del_init(&q->pxp.link);
@@ -690,36 +677,54 @@ void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
 
 	q->pxp.type = DRM_XE_PXP_TYPE_NONE;
 
-	spin_unlock_irq(&pxp->queues.lock);
+	if (lock)
+		spin_unlock_irq(&pxp->queues.lock);
 
 	if (need_pm_put)
 		xe_pm_runtime_put(pxp->xe);
 }
 
+/**
+ * xe_pxp_exec_queue_remove - remove a queue from the PXP list
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @q: the queue to remove from the list
+ *
+ * If PXP is enabled and the exec_queue is in the list, the queue will be
+ * removed from the list and its PM reference will be released. It is safe to
+ * call this function multiple times for the same queue.
+ */
+void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q)
+{
+	__pxp_exec_queue_remove(pxp, q, true);
+}
+
 static void pxp_invalidate_queues(struct xe_pxp *pxp)
 {
 	struct xe_exec_queue *tmp, *q;
+	LIST_HEAD(to_clean);
 
 	spin_lock_irq(&pxp->queues.lock);
 
-	/*
-	 * Removing a queue from the PXP list requires a put of the RPM ref that
-	 * the queue holds to keep the PXP session alive, which can't be done
-	 * under spinlock. Since it is safe to kill a queue multiple times, we
-	 * can leave the invalid queue in the list for now and postpone the
-	 * removal and associated RPM put to when the queue is destroyed.
-	 */
-	list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
-		q = xe_exec_queue_get_unless_zero(tmp);
-
+	list_for_each_entry_safe(q, tmp, &pxp->queues.list, pxp.link) {
+		q = xe_exec_queue_get_unless_zero(q);
 		if (!q)
 			continue;
 
+		list_move_tail(&q->pxp.link, &to_clean);
+	}
+	spin_unlock_irq(&pxp->queues.lock);
+
+	list_for_each_entry_safe(q, tmp, &to_clean, pxp.link) {
 		xe_exec_queue_kill(q);
+
+		/*
+		 * We hold a ref to the queue so there is no risk of racing with
+		 * the calls to exec_queue_remove coming from exec_queue_destroy.
+		 */
+		__pxp_exec_queue_remove(pxp, q, false);
+
 		xe_exec_queue_put(q);
 	}
-
-	spin_unlock_irq(&pxp->queues.lock);
 }
 
 /**
@@ -816,6 +821,7 @@ int xe_pxp_obj_key_check(struct xe_pxp *pxp, struct drm_gem_object *obj)
  */
 int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 {
+	bool needs_queue_inval = false;
 	int ret = 0;
 
 	if (!xe_pxp_is_enabled(pxp))
@@ -848,7 +854,8 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 			break;
 		fallthrough;
 	case XE_PXP_ACTIVE:
-		pxp_invalidate_state(pxp);
+		pxp->key_instance++;
+		needs_queue_inval = true;
 		break;
 	default:
 		drm_err(&pxp->xe->drm, "unexpected state during PXP suspend: %u",
@@ -865,6 +872,9 @@ int xe_pxp_pm_suspend(struct xe_pxp *pxp)
 
 	mutex_unlock(&pxp->mutex);
 
+	if (needs_queue_inval)
+		pxp_invalidate_queues(pxp);
+
 	/*
 	 * if there is a termination in progress, wait for it.
 	 * We need to wait outside the lock because the completion is done from
-- 
2.43.0

