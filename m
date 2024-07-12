Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17239C3DA4B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 21:29:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7A110ECDA;
	Fri, 12 Jul 2024 21:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oDdoKseR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B3610EB81
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 21:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720819767; x=1752355767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VPP4raf2C2oWZzuyZhNnpTsYGpUme0LCwvY3EqR6a64=;
 b=oDdoKseRB44HYTPQLUbBMqFfFP6ZClblyyXef9hJPLPhJJPXp+U5S4O5
 ESfhdZM4qtdibfUztzEW10Rp7Qi/slQzsiY9vIlJneTX5AS9RymNvFp6g
 jIUIS6Rp9LmgGYBcsVwhgJT/0U6kDacfKRAK5vMpB2bUj6uMB3l7+TrD9
 mQQGG4BrMXAWa5EMiTZ4tKhSJOHnnQKBEAOag4PfHX/T0uSMqe8y8MfJV
 rf0tqRHoJzy8i8s5m5Q7max+/WZ7fHgssFOh5WJfIY7Eh+zhKiTYAtXvU
 VCBrte6+wxKqw5rUa4wCrK9kjjMBBCLuFEuZ/tGQnmIlItwIma82Uae7C w==;
X-CSE-ConnectionGUID: JEs2Jb5dRmyT52zJXqEliw==
X-CSE-MsgGUID: dRfk3aKoTm+rLjVDCL2Z6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17990167"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="17990167"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:27 -0700
X-CSE-ConnectionGUID: A+uTVo9nTyKIHJhYLnuthg==
X-CSE-MsgGUID: FsJioQJeTxWLoEzSde+PdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; d="scan'208";a="53864595"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 14:29:28 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [RFC 08/14] drm/xe/pxp: Add hooks to mark an exec queue as using PXP
Date: Fri, 12 Jul 2024 14:28:52 -0700
Message-ID: <20240712212901.2684239-9-daniele.ceraolospurio@intel.com>
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

Instead of having a PXP session always running, we only start it if a
user tells us they want their queue to use PXP (API for that coming in
the next patch). Also, if a PXP invalidation occurs, we want to mark
all the PXP queues as dead (code for that also coming in a follow up
patch), so we need to keep the queues in a list.

Note that this patch is meant to be squashed with the follow-up patch
that implement the other pieces of the queue management flow. It is
separate for now for ease of review.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   7 +
 drivers/gpu/drm/xe/xe_pxp.c              | 234 ++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_pxp.h              |   4 +
 drivers/gpu/drm/xe/xe_pxp_types.h        |  19 ++
 4 files changed, 262 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index 201588ec33c3..08ca3344e2be 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -127,6 +127,13 @@ struct xe_exec_queue {
 		spinlock_t lock;
 	} lr;
 
+	struct {
+		/** @pxp.type: PXP session type used by this queue */
+		u8 type;
+		/** @pxp.link: link into the list of PXP exec queues */
+		struct list_head link;
+	} pxp;
+
 	/** @ops: submission backend exec queue operations */
 	const struct xe_exec_queue_ops *ops;
 
diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
index 5f41fdab205d..159761e19e9b 100644
--- a/drivers/gpu/drm/xe/xe_pxp.c
+++ b/drivers/gpu/drm/xe/xe_pxp.c
@@ -8,9 +8,12 @@
 #include <drm/drm_managed.h>
 
 #include "xe_device_types.h"
+#include "xe_exec_queue_types.h"
 #include "xe_force_wake.h"
+#include "xe_gsc_proxy.h"
 #include "xe_gt.h"
 #include "xe_gt_types.h"
+#include "xe_huc.h"
 #include "xe_mmio.h"
 #include "xe_pm.h"
 #include "xe_pxp_submit.h"
@@ -39,6 +42,32 @@ static bool pxp_is_enabled(const struct xe_pxp *pxp)
 	return pxp;
 }
 
+static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
+{
+	bool ready;
+
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pxp->gt), XE_FW_GSC));
+
+	/* PXP requires both HuC authentication via GSC and GSC proxy initialized */
+	ready = xe_huc_is_authenticated(&pxp->gt->uc.huc, XE_HUC_AUTH_VIA_GSC) &&
+		xe_gsc_proxy_init_done(&pxp->gt->uc.gsc);
+
+	xe_force_wake_put(gt_to_fw(pxp->gt), XE_FW_GSC);
+
+	return ready;
+}
+
+static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
+{
+	struct xe_gt *gt = pxp->gt;
+	u32 sip = 0;
+
+	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
+	sip = xe_mmio_read32(gt, KCR_SIP);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+
+	return sip & BIT(id);
+}
 
 static int pxp_wait_for_session_state(struct xe_pxp *pxp, u32 id, bool in_play)
 {
@@ -63,6 +92,20 @@ static void pxp_terminate(struct xe_pxp *pxp)
 	struct xe_device *xe = pxp->xe;
 	struct xe_gt *gt = pxp->gt;
 
+	/*
+	 * If we have a termination already in progress, we need to wait for
+	 * it to complete before queueing another one. We update the state
+	 * to signal that another termination is required and leave it to the
+	 * pxp_start() call to take care of it.
+	 */
+	if (!completion_done(&pxp->termination)) {
+		pxp->status = XE_PXP_NEEDS_TERMINATION;
+		return;
+	}
+
+	reinit_completion(&pxp->termination);
+	pxp->status = XE_PXP_TERMINATION_IN_PROGRESS;
+
 	drm_dbg(&xe->drm, "Terminating PXP\n");
 
 	/* terminate the hw session */
@@ -83,14 +126,34 @@ static void pxp_terminate(struct xe_pxp *pxp)
 	ret = xe_pxp_submit_session_invalidation(pxp, ARB_SESSION);
 
 out:
-	if (ret)
+	if (ret) {
 		drm_err(&xe->drm, "PXP termination failed: %pe\n", ERR_PTR(ret));
+		pxp->status = XE_PXP_ERROR;
+		complete_all(&pxp->termination);
+	}
+
 	return;
 }
 
 static void pxp_terminate_complete(struct xe_pxp *pxp)
 {
-	/* TODO mark the session as ready to start */
+	/*
+	 * We expect PXP to be in one of 2 states when we get here:
+	 * - XE_PXP_TERMINATION_IN_PROGRESS: a single termination event was
+	 * requested and it is now completing, so we're ready to start.
+	 * - XE_PXP_NEEDS_TERMINATION: a second termination was requested while
+	 * the first one was still being processed; we don't update the state
+	 * in this case so the pxp_start code will automatically issue that
+	 * second termination.
+	 */
+	if (pxp->status == XE_PXP_TERMINATION_IN_PROGRESS)
+		pxp->status = XE_PXP_READY_TO_START;
+	else if (pxp->status != XE_PXP_NEEDS_TERMINATION)
+		drm_err(&pxp->xe->drm,
+			"PXP termination complete while status was %u\n",
+			pxp->status);
+
+	complete_all(&pxp->termination);
 }
 
 static void pxp_irq_work(struct work_struct *work)
@@ -114,6 +177,8 @@ static void pxp_irq_work(struct work_struct *work)
 	if ((events & PXP_TERMINATION_REQUEST) && !xe_pm_runtime_get_if_active(xe))
 		return;
 
+	mutex_lock(&pxp->mutex);
+
 	if (events & PXP_TERMINATION_REQUEST) {
 		events &= ~PXP_TERMINATION_COMPLETE;
 		pxp_terminate(pxp);
@@ -122,6 +187,8 @@ static void pxp_irq_work(struct work_struct *work)
 	if (events & PXP_TERMINATION_COMPLETE)
 		pxp_terminate_complete(pxp);
 
+	mutex_unlock(&pxp->mutex);
+
 	if (events & PXP_TERMINATION_REQUEST)
 		xe_pm_runtime_put(xe);
 }
@@ -232,10 +299,21 @@ int xe_pxp_init(struct xe_device *xe)
 	if (!pxp)
 		return -ENOMEM;
 
+	INIT_LIST_HEAD(&pxp->queue_list);
 	INIT_WORK(&pxp->irq.work, pxp_irq_work);
 	pxp->xe = xe;
 	pxp->gt = gt;
 
+	/*
+	 * we'll use the completion to check if there is a termination pending,
+	 * so we start it as completed and we reinit it when a termination
+	 * is triggered.
+	 */
+	init_completion(&pxp->termination);
+	complete_all(&pxp->termination);
+
+	mutex_init(&pxp->mutex);
+
 	pxp->irq.wq = alloc_ordered_workqueue("pxp-wq", 0);
 	if (!pxp->irq.wq)
 		return -ENOMEM;
@@ -258,3 +336,155 @@ int xe_pxp_init(struct xe_device *xe)
 	destroy_workqueue(pxp->irq.wq);
 	return err;
 }
+
+static int __pxp_start_session(struct xe_pxp *pxp, u32 id)
+{
+	int ret;
+
+	if (pxp_session_is_in_play(pxp, id))
+		return -EEXIST;
+
+	ret = xe_pxp_submit_session_init(pxp, id);
+	if (ret) {
+		drm_err(&pxp->xe->drm, "Failed to init PXP session %u\n", id);
+		goto out;
+	}
+
+	ret = pxp_wait_for_session_state(pxp, id, true);
+	if (ret) {
+		drm_err(&pxp->xe->drm, "PXP session %u failed to go in play\n", id);
+		goto out;
+	}
+
+	drm_dbg(&pxp->xe->drm, "PXP session %u is active\n", id);
+
+out:
+	if (!ret)
+		pxp->status = XE_PXP_ACTIVE;
+	else
+		pxp->status = XE_PXP_ERROR;
+
+	return ret;
+}
+
+/**
+ * xe_pxp_exec_queue_add - add a queue from the PXP list
+ * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
+ * @q: the queue to add from the list
+ * @type: the type of PXP session this queue will use
+ *
+ * If PXP is enabled and the prerequisites are done, start the PXP default
+ * session (if not already running) and add the queue to the PXP list.
+ *
+ * Returns 0 if the PXP session is running and the queue is in the list,
+ * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are not done,
+ * other errno value if something goes wrong during the session start.
+ */
+#define PXP_TERMINATION_TIMEOUT_MS 500
+int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type)
+{
+	int ret = 0;
+
+	if (!pxp_is_enabled(pxp))
+		return -ENODEV;
+
+	/*
+	 * Runtime suspend kills PXP, so we need to turn it off while we have
+	 * active queues that use PXP
+	 */
+	xe_pm_runtime_get(pxp->xe);
+
+	if (!pxp_prerequisites_done(pxp)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+wait_for_termination:
+	/*
+	 * if there is a termination in progress, wait for it.
+	 * We need to wait outside the lock because the completion is done from
+	 * within the lock
+	 */
+	if (!wait_for_completion_timeout(&pxp->termination,
+					 msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
+		return -ETIMEDOUT;
+
+	mutex_lock(&pxp->mutex);
+
+	/*
+	 * check if a new termination was issued between the above check and
+	 * grabbing the mutex
+	 */
+	if (!completion_done(&pxp->termination)) {
+		mutex_unlock(&pxp->mutex);
+		goto wait_for_termination;
+	}
+
+	/* If PXP is not already active, turn it on */
+	switch (pxp->status) {
+	case XE_PXP_ERROR:
+		ret = -EIO;
+		break;
+	case XE_PXP_ACTIVE:
+		break;
+	case XE_PXP_READY_TO_START:
+		ret = __pxp_start_session(pxp, ARB_SESSION);
+		break;
+	case XE_PXP_NEEDS_TERMINATION:
+		pxp_terminate(pxp);
+		mutex_unlock(&pxp->mutex);
+		goto wait_for_termination;
+	default:
+		drm_err(&pxp->xe->drm, "unexpected state during PXP start: %u", pxp->status);
+		ret = -EIO;
+		break;
+	}
+
+	/* If everything went ok, add the queue to the list */
+	if (!ret) {
+		list_add_tail(&q->pxp.link, &pxp->queue_list);
+		q->pxp.type = type;
+	}
+
+	mutex_unlock(&pxp->mutex);
+
+out:
+	/*
+	 * in the successful case the PM ref is released from
+	 * xe_pxp_exec_queue_remove
+	 */
+	if (ret)
+		xe_pm_runtime_put(pxp->xe);
+
+	return ret;
+}
+
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
+	bool need_pm_put = false;
+
+	if (!pxp_is_enabled(pxp))
+		return;
+
+	mutex_lock(&pxp->mutex);
+
+	if (!list_empty(&q->pxp.link)) {
+		list_del_init(&q->pxp.link);
+		q->pxp.type = 0;
+		need_pm_put = true;
+	}
+
+	mutex_unlock(&pxp->mutex);
+
+	if (need_pm_put)
+		xe_pm_runtime_put(pxp->xe);
+}
diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
index b69678304183..6c99af072ab0 100644
--- a/drivers/gpu/drm/xe/xe_pxp.h
+++ b/drivers/gpu/drm/xe/xe_pxp.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct xe_device;
+struct xe_exec_queue;
 struct xe_pxp;
 
 bool xe_pxp_is_supported(const struct xe_device *xe);
@@ -16,4 +17,7 @@ bool xe_pxp_is_supported(const struct xe_device *xe);
 int xe_pxp_init(struct xe_device *xe);
 void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
 
+int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 type);
+void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
+
 #endif /* __XE_PXP_H__ */
diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
index b34aeb292e79..5f7b031cafb1 100644
--- a/drivers/gpu/drm/xe/xe_pxp_types.h
+++ b/drivers/gpu/drm/xe/xe_pxp_types.h
@@ -6,7 +6,9 @@
 #ifndef __XE_PXP_TYPES_H__
 #define __XE_PXP_TYPES_H__
 
+#include <linux/completion.h>
 #include <linux/iosys-map.h>
+#include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
@@ -16,6 +18,14 @@ struct xe_device;
 struct xe_gt;
 struct xe_vm;
 
+enum xe_pxp_status {
+	XE_PXP_ERROR = -1,
+	XE_PXP_NEEDS_TERMINATION = 0, /* starting status */
+	XE_PXP_TERMINATION_IN_PROGRESS,
+	XE_PXP_READY_TO_START,
+	XE_PXP_ACTIVE
+};
+
 /**
  * struct xe_pxp - pxp state
  */
@@ -69,6 +79,15 @@ struct xe_pxp {
 #define PXP_TERMINATION_REQUEST  BIT(0)
 #define PXP_TERMINATION_COMPLETE BIT(1)
 	} irq;
+
+	/** @mutex: protects the pxp status and the queue list */
+	struct mutex mutex;
+	/** @status: the current pxp status */
+	enum xe_pxp_status status;
+	/** @termination: completion struct that tracks terminations */
+	struct completion termination;
+	/** @queue_list: list of exec_queues that use PXP */
+	struct list_head queue_list;
 };
 
 #endif /* __XE_PXP_TYPES_H__ */
-- 
2.43.0

