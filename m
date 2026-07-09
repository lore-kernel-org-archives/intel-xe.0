Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2705C44501
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9439910F4B1;
	Thu,  9 Jul 2026 09:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXFmIQb5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3A410F4B1
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783591111; x=1815127111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BgVtcLa8r1b7ObDaZ7NCteX3YhWgMZMa2s8Kd2NAfh4=;
 b=UXFmIQb5RWdEUZgohJZVXNdyOrNYgqy6Q3Fc5lARChLTpJudRuiy/esE
 1vdq59BxYsL6b7n2ZjAm0uiTr6hCdzoHKGcI2W0CSW50xzCezJ/v+UyK0
 +oKsclu5BerLmfmGoiuhqCYm+5DGbNlVRibhnqnRu9G8igYfxQtfRgo1F
 dvQq5T/nExQx67YieneJdicTSjwSY4Z0tQQW9GlZF3wlMmOdTW6gv4NjE
 Qxy9t8gu3WiLl+x1vC5wMD06cXEziFwEu4nSqASRBi+h7jQBWGBzj7mvQ
 stu4Von8eax7+PXgJ1p8Kz02oFjzz9K+ZtYSgd8YfRAgneUtXkQCvRgk4 g==;
X-CSE-ConnectionGUID: r3uYC7YBQPCmpGYxJuij6g==
X-CSE-MsgGUID: WPEncze5Ssyx9G0+3Hd5wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84047636"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84047636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 02:58:30 -0700
X-CSE-ConnectionGUID: 7po86ZfvTP6XX2CNjTuU9g==
X-CSE-MsgGUID: BdWPZsimTSqDQe0KRtjqnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="252793047"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 02:58:28 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v9] drm/xe/guc: Hold device ref until queue teardown completes
Date: Thu,  9 Jul 2026 15:28:04 +0530
Message-ID: <20260709095804.1509566-1-arvind.yadav@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

GuC exec queue destruction can run asynchronously. If the final device
put happens from a destroy worker, drmm cleanup can end up draining
the same workqueue and deadlock.

Hold a drm_device reference for the queue lifetime and drop it after
queue teardown completes. This keeps drmm cleanup from running while
async destroy work is still pending.

Move GuC destroy work to a module-lifetime Xe workqueue and flush it
on PCI remove so hot-unbind/rebind still waits for pending destroy work.

With queue-held device refs, guc_submit_sw_fini() cannot run with live
GuC IDs. Replace the fini wait with an assertion and remove the unused
fini_wq.

v2:
  - Rebase

v3:
  - Switch to queue-lifetime drm_dev_get()/drm_dev_put() model. (Matt)
  - Queue async teardown on system_dfl_wq instead of xe->destroy_wq. (Matt)
  - Drop separate deferred drm_dev_put worker.
  - Remove stale drain_workqueue(xe->destroy_wq) from guc_submit_sw_fini().

v4:
  - Replace the guc_submit_sw_fini() wait with an assertion and remove
    the now-unused fini_wq. (sashiko)

v5:
  - Move destroy work to a module-lifetime Xe workqueue instead of
    system_dfl_wq. (Matt)
  - Flush the module-lifetime destroy workqueue during PCI remove to
    preserve the old device-remove wait semantics.

v6:
  - Keep SVM pagemap destroy work on the per-device destroy_wq to avoid
    letting it outlive the xe_device/drm_device. (Sashiko)
  - Use WQ_MEM_RECLAIM for xe->destroy_wq because SVM pagemap destroy work
    can be queued from the reclaim path.

v7:
  - Drop the per-device xe->destroy_wq and use the module-level destroy WQ
    for SVM pagemap destroy as well. (Matt)
  - Rename xe_exec_queue_destroy_wq_*() helpers to xe_destroy_wq_*()
    helpers because the WQ is no longer exec-queue specific. (Matt)

v8:
  - Rebase.

v9:
  - Keep SVM pagemap destroy work on the per-device WQ_MEM_RECLAIM
    destroy_wq because it can be queued from reclaim and embeds
    the dev_pagemap used by devres teardown. (Sashiko)
  - Keep the module-level destroy WQ GuC-only and drop WQ_MEM_RECLAIM
    from it.
  - Update the module-WQ kdoc to document the GuC/SVM split.

Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c   | 66 ++++++++++++++++------------
 drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
 drivers/gpu/drm/xe/xe_module.c       | 49 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_module.h       |  5 +++
 drivers/gpu/drm/xe/xe_pci.c          |  6 +++
 drivers/gpu/drm/xe/xe_svm.c          |  5 +++
 8 files changed, 105 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ad7f3e61d457..91bbd82aadb8 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -581,7 +581,7 @@ int xe_device_init_early(struct xe_device *xe)
 						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
-	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
+	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_MEM_RECLAIM, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
 	    !xe->preempt_fence_wq || !xe->destroy_wq) {
 		/*
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 022e08205897..56c17cca79c0 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -355,7 +355,7 @@ struct xe_device {
 	/** @unordered_wq: used to serialize unordered work */
 	struct workqueue_struct *unordered_wq;
 
-	/** @destroy_wq: used to serialize user destroy work, like queue */
+	/** @destroy_wq: used to serialize SVM pagemap destroy work */
 	struct workqueue_struct *destroy_wq;
 
 	/** @tiles: device tiles */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 12416bfa3255..9b9434d7452a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -10,6 +10,7 @@
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
@@ -37,6 +38,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_module.h"
 #include "xe_pm.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
@@ -232,17 +234,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
 static void guc_submit_sw_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_guc *guc = arg;
-	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gt *gt = guc_to_gt(guc);
-	int ret;
-
-	ret = wait_event_timeout(guc->submission_state.fini_wq,
-				 xa_empty(&guc->submission_state.exec_queue_lookup),
-				 HZ * 5);
 
-	drain_workqueue(xe->destroy_wq);
-
-	xe_gt_assert(gt, ret);
+	xe_gt_assert(gt, xa_empty(&guc->submission_state.exec_queue_lookup));
 
 	xa_destroy(&guc->submission_state.exec_queue_lookup);
 }
@@ -319,8 +313,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 
 	xa_init(&guc->submission_state.exec_queue_lookup);
 
-	init_waitqueue_head(&guc->submission_state.fini_wq);
-
 	primelockdep(guc);
 
 	guc->submission_state.initialized = true;
@@ -411,9 +403,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
 	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
 				     q->guc->id, q->width);
 
-	if (xa_empty(&guc->submission_state.exec_queue_lookup))
-		wake_up(&guc->submission_state.fini_wq);
-
 	mutex_unlock(&guc->submission_state.lock);
 }
 
@@ -1686,6 +1675,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct drm_device *drm = &guc_to_xe(guc)->drm;
 
 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
 		struct xe_exec_queue_group *group = q->multi_queue.group;
@@ -1704,36 +1694,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 	 * (timeline name).
 	 */
 	kfree_rcu(ge, rcu);
+
+	drm_dev_put(drm);
 }
 
-static void __guc_exec_queue_destroy_async(struct work_struct *w)
+static void guc_exec_queue_do_destroy(struct xe_exec_queue *q)
 {
-	struct xe_guc_exec_queue *ge =
-		container_of(w, struct xe_guc_exec_queue, destroy_async);
-	struct xe_exec_queue *q = ge->q;
+	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct xe_device *xe = guc_to_xe(guc);
+	struct drm_device *drm = &xe->drm;
 
-	guard(xe_pm_runtime)(guc_to_xe(guc));
-	trace_xe_exec_queue_destroy(q);
+	/*
+	 * guc_exec_queue_fini() drops the queue's drm_device ref.
+	 * Keep the device alive until the PM-runtime guard unwinds.
+	 */
+	drm_dev_get(drm);
 
-	/* Confirm no work left behind accessing device structures */
-	cancel_delayed_work_sync(&ge->sched.base.work_tdr);
+	scoped_guard(xe_pm_runtime, xe) {
+		trace_xe_exec_queue_destroy(q);
 
-	xe_exec_queue_fini(q);
+		/* Confirm no work left behind accessing device structures */
+		cancel_delayed_work_sync(&ge->sched.base.work_tdr);
+
+		xe_exec_queue_fini(q);
+	}
+
+	drm_dev_put(drm);
 }
 
-static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
+static void __guc_exec_queue_destroy_async(struct work_struct *w)
 {
-	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct xe_device *xe = guc_to_xe(guc);
+	struct xe_guc_exec_queue *ge =
+		container_of(w, struct xe_guc_exec_queue, destroy_async);
+
+	guc_exec_queue_do_destroy(ge->q);
+}
 
+static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
+{
 	INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
 	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
-		__guc_exec_queue_destroy_async(&q->guc->destroy_async);
+		guc_exec_queue_do_destroy(q);
 	else
-		queue_work(xe->destroy_wq, &q->guc->destroy_async);
+		xe_destroy_wq_queue(&q->guc->destroy_async);
 }
 
 static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -1928,6 +1934,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct drm_device *drm = &guc_to_xe(guc)->drm;
 	struct workqueue_struct *submit_wq = NULL;
 	struct xe_guc_exec_queue *ge;
 	long timeout;
@@ -1939,6 +1946,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (!ge)
 		return -ENOMEM;
 
+	drm_dev_get(drm);
+
 	q->guc = ge;
 	ge->q = q;
 	init_rcu_head(&ge->rcu);
@@ -2015,6 +2024,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	release_guc_id(guc, q);
 err_free:
 	kfree(ge);
+	drm_dev_put(drm);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index c7b9642b41ba..31a2acb63ac3 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -100,8 +100,6 @@ struct xe_guc {
 		 * even initialized - before that not even the lock is valid
 		 */
 		bool initialized;
-		/** @submission_state.fini_wq: submit fini wait queue */
-		wait_queue_head_t fini_wq;
 	} submission_state;
 
 	/** @hwconfig: Hardware config state */
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 39e4fc85f019..848d65265443 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -7,6 +7,7 @@
 
 #include <linux/init.h>
 #include <linux/module.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_module.h>
 
@@ -88,6 +89,50 @@ static int xe_check_nomodeset(void)
 	return 0;
 }
 
+static struct workqueue_struct *xe_destroy_wq;
+
+static int __init xe_destroy_wq_module_init(void)
+{
+	xe_destroy_wq = alloc_workqueue("xe-guc-destroy-wq", WQ_UNBOUND, 0);
+	if (!xe_destroy_wq)
+		return -ENOMEM;
+	return 0;
+}
+
+static void xe_destroy_wq_module_exit(void)
+{
+	if (xe_destroy_wq)
+		destroy_workqueue(xe_destroy_wq);
+	xe_destroy_wq = NULL;
+}
+
+/**
+ * xe_destroy_wq_queue() - Queue work on the destroy workqueue
+ * @work: work item to queue
+ *
+ * The destroy workqueue has module lifetime and is used for GuC exec queue
+ * teardown that can outlive a single xe_device. SVM pagemap destroy uses the
+ * per-device xe->destroy_wq instead.
+ *
+ * Return: %true if @work was queued, %false if it was already pending.
+ */
+bool xe_destroy_wq_queue(struct work_struct *work)
+{
+	return queue_work(xe_destroy_wq, work);
+}
+
+/**
+ * xe_destroy_wq_flush() - Flush the destroy workqueue
+ *
+ * Drains all pending destroy work. Called from PCI remove to ensure
+ * teardown ordering before the device is destroyed.
+ */
+void xe_destroy_wq_flush(void)
+{
+	if (xe_destroy_wq)
+		flush_workqueue(xe_destroy_wq);
+}
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
@@ -109,6 +154,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_sched_job_module_init,
 		.exit = xe_sched_job_module_exit,
 	},
+	{
+		.init = xe_destroy_wq_module_init,
+		.exit = xe_destroy_wq_module_exit,
+	},
 	{
 		.init = xe_register_pci_driver,
 		.exit = xe_unregister_pci_driver,
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index c75153471248..a0eb7db07770 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -8,6 +8,8 @@
 
 #include <linux/types.h>
 
+struct work_struct;
+
 /* Module modprobe variables */
 struct xe_modparam {
 	bool probe_display;
@@ -26,5 +28,8 @@ struct xe_modparam {
 
 extern struct xe_modparam xe_modparam;
 
+bool xe_destroy_wq_queue(struct work_struct *work);
+void xe_destroy_wq_flush(void);
+
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 08c14a0202d9..b0764eb90834 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1099,6 +1099,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
 		return;
 
 	xe_device_remove(xe);
+
+	/*
+	 * Preserve remove-time flush after moving destroy work to module
+	 * lifetime.
+	 */
+	xe_destroy_wq_flush();
 	xe_pm_fini(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e0f0c23d172d..2cb17497d950 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1732,6 +1732,11 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
 	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
 	struct xe_device *xe = to_xe_device(dpagemap->drm);
 
+	/*
+	 * SVM pagemap destroy can be queued from reclaim and xpagemap embeds
+	 * the dev_pagemap used by devres teardown. Keep it on the per-device
+	 * WQ_MEM_RECLAIM destroy_wq, not the module-level GuC destroy WQ.
+	 */
 	if (from_atomic_or_reclaim)
 		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
 	else
-- 
2.43.0

