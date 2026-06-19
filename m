Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD62CD98F6
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jun 2026 09:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5299A10E062;
	Fri, 19 Jun 2026 09:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B18z22U0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6033210E062
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jun 2026 09:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781862627; x=1813398627;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/VNXvxqAvHQXC7krRZ+d3U10N6w37kCQetyTCLDXf3Y=;
 b=B18z22U0I5DI11YBSF3gRnMn3vaZmiU9iSgcGn+6Ig0Aru4C4YzFktg9
 uOKrCKH/srmNHx1Nhz4v3f8etVYYZubgHSCQ5Mur8T+csRZrj9ijO7H1c
 U5QD5jph8SiQVBcbJv7e99PkNPvBGwPDnc2z+ig2wkXPLSk2efkFvJgI3
 rWv4FY+se86CRquLZUBL84LFRiTIWtGxZkEYJTCd3qZA5z6OW3hEScYap
 os6t3K5okKQKGUMVx4YsAZNyG/iELb0OGDeIpixpn0GKp7W3n9B+b2AmA
 MWuucORjS7tf6RDk4jFCQ8SMERJBt2L5zx0iRzyq8b+Wi6/3FoK8yqW3V A==;
X-CSE-ConnectionGUID: 3kKWbRXoTCmMyYxngTNsjA==
X-CSE-MsgGUID: YyyirbbHSsiIi/xoRVds1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="86390437"
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="86390437"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 02:50:26 -0700
X-CSE-ConnectionGUID: ydBfTiMPRR6CLnpxRY+gzw==
X-CSE-MsgGUID: HSPOvB4+T4STq8sPW5pguQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,213,1774335600"; d="scan'208";a="247451496"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2026 02:50:24 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 tejas.upadhyay@intel.com
Subject: [PATCH v5] drm/xe/guc: Hold device ref until queue teardown completes
Date: Fri, 19 Jun 2026 15:20:15 +0530
Message-ID: <20260619095015.1495087-1-arvind.yadav@intel.com>
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

Move destroy work to a module-lifetime Xe workqueue and flush it on
PCI remove so hot-unbind/rebind still waits for pending destroy work.

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

Fixes: 2d2be279f1ca ("drm/xe: fix UAF around queue destruction")
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c       |  6 +--
 drivers/gpu/drm/xe/xe_device_types.h |  3 --
 drivers/gpu/drm/xe/xe_exec_queue.c   | 30 +++++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.h   |  7 +++
 drivers/gpu/drm/xe/xe_guc_submit.c   | 65 ++++++++++++++++------------
 drivers/gpu/drm/xe/xe_guc_types.h    |  2 -
 drivers/gpu/drm/xe/xe_module.c       |  5 +++
 drivers/gpu/drm/xe/xe_pci.c          |  7 +++
 drivers/gpu/drm/xe/xe_svm.c          |  4 +-
 9 files changed, 89 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 089872507bdd..0d8848e66d6b 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -469,9 +469,6 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
 	if (xe->unordered_wq)
 		destroy_workqueue(xe->unordered_wq);
 
-	if (xe->destroy_wq)
-		destroy_workqueue(xe->destroy_wq);
-
 	ttm_device_fini(&xe->ttm);
 }
 
@@ -580,9 +577,8 @@ int xe_device_init_early(struct xe_device *xe)
 						       WQ_MEM_RECLAIM);
 	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
 	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
-	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", WQ_PERCPU, 0);
 	if (!xe->ordered_wq || !xe->unordered_wq ||
-	    !xe->preempt_fence_wq || !xe->destroy_wq) {
+	    !xe->preempt_fence_wq) {
 		/*
 		 * Cleanup done in xe_device_destroy via
 		 * drmm_add_action_or_reset register above
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 32dd2ffbc796..1ed993dffb52 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -355,9 +355,6 @@ struct xe_device {
 	/** @unordered_wq: used to serialize unordered work */
 	struct workqueue_struct *unordered_wq;
 
-	/** @destroy_wq: used to serialize user destroy work, like queue */
-	struct workqueue_struct *destroy_wq;
-
 	/** @tiles: device tiles */
 	struct xe_tile tiles[XE_MAX_TILES_PER_DEVICE];
 
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 1b5ca3ce578a..452262a08ccb 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -6,6 +6,7 @@
 #include "xe_exec_queue.h"
 
 #include <linux/nospec.h>
+#include <linux/workqueue.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -30,6 +31,35 @@
 #include "xe_vm.h"
 #include "xe_pxp.h"
 
+static struct workqueue_struct *xe_destroy_wq;
+
+int __init xe_exec_queue_module_init(void)
+{
+	xe_destroy_wq = alloc_workqueue("xe-destroy-wq",
+					WQ_UNBOUND | WQ_MEM_RECLAIM, 0);
+	if (!xe_destroy_wq)
+		return -ENOMEM;
+	return 0;
+}
+
+void xe_exec_queue_module_exit(void)
+{
+	if (xe_destroy_wq)
+		destroy_workqueue(xe_destroy_wq);
+	xe_destroy_wq = NULL;
+}
+
+bool xe_exec_queue_destroy_wq_queue(struct work_struct *work)
+{
+	return queue_work(xe_destroy_wq, work);
+}
+
+void xe_exec_queue_destroy_wq_flush(void)
+{
+	if (xe_destroy_wq)
+		flush_workqueue(xe_destroy_wq);
+}
+
 /**
  * DOC: Execution Queue
  *
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 0225426c57b0..a269bb0f77c7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -31,6 +31,13 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
 						struct xe_vm *user_vm,
 						u32 flags, u64 extensions);
 
+struct work_struct;
+
+int xe_exec_queue_module_init(void);
+void xe_exec_queue_module_exit(void);
+bool xe_exec_queue_destroy_wq_queue(struct work_struct *work);
+void xe_exec_queue_destroy_wq_flush(void);
+
 void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index afe5d99cdd8b..64d3029fa6ac 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -10,6 +10,7 @@
 #include <linux/circ_buf.h>
 #include <linux/dma-fence-array.h>
 
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 
 #include "abi/guc_actions_abi.h"
@@ -232,17 +233,9 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
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
@@ -319,8 +312,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
 
 	xa_init(&guc->submission_state.exec_queue_lookup);
 
-	init_waitqueue_head(&guc->submission_state.fini_wq);
-
 	primelockdep(guc);
 
 	guc->submission_state.initialized = true;
@@ -411,9 +402,6 @@ static void __release_guc_id(struct xe_guc *guc, struct xe_exec_queue *q,
 	xe_guc_id_mgr_release_locked(&guc->submission_state.idm,
 				     q->guc->id, q->width);
 
-	if (xa_empty(&guc->submission_state.exec_queue_lookup))
-		wake_up(&guc->submission_state.fini_wq);
-
 	mutex_unlock(&guc->submission_state.lock);
 }
 
@@ -1685,6 +1673,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_guc_exec_queue *ge = q->guc;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct drm_device *drm = &guc_to_xe(guc)->drm;
 
 	if (xe_exec_queue_is_multi_queue_secondary(q)) {
 		struct xe_exec_queue_group *group = q->multi_queue.group;
@@ -1703,36 +1692,52 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
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
+		xe_exec_queue_destroy_wq_queue(&q->guc->destroy_async);
 }
 
 static void __guc_exec_queue_destroy(struct xe_guc *guc, struct xe_exec_queue *q)
@@ -1927,6 +1932,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
+	struct drm_device *drm = &guc_to_xe(guc)->drm;
 	struct workqueue_struct *submit_wq = NULL;
 	struct xe_guc_exec_queue *ge;
 	long timeout;
@@ -1938,6 +1944,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	if (!ge)
 		return -ENOMEM;
 
+	drm_dev_get(drm);
+
 	q->guc = ge;
 	ge->q = q;
 	init_rcu_head(&ge->rcu);
@@ -2014,6 +2022,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
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
index 4cb578182912..1949fb3242bb 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -18,6 +18,7 @@
 #include "xe_pci.h"
 #include "xe_pm.h"
 #include "xe_observation.h"
+#include "xe_exec_queue.h"
 #include "xe_sched_job.h"
 
 struct xe_modparam xe_modparam = {
@@ -112,6 +113,10 @@ static const struct init_funcs init_funcs[] = {
 		.init = xe_sched_job_module_init,
 		.exit = xe_sched_job_module_exit,
 	},
+	{
+		.init = xe_exec_queue_module_init,
+		.exit = xe_exec_queue_module_exit,
+	},
 	{
 		.init = xe_register_pci_driver,
 		.exit = xe_unregister_pci_driver,
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 78fc2e4dcfc6..5a185ca00c1f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -21,6 +21,7 @@
 #include "xe_configfs.h"
 #include "xe_device.h"
 #include "xe_drv.h"
+#include "xe_exec_queue.h"
 #include "xe_gt.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
@@ -1049,6 +1050,12 @@ static void xe_pci_remove(struct pci_dev *pdev)
 		return;
 
 	xe_device_remove(xe);
+
+	/*
+	 * Preserve remove-time flush after moving destroy work to module
+	 * lifetime.
+	 */
+	xe_exec_queue_destroy_wq_flush();
 	xe_pm_fini(xe);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index e1651e70c8f0..ec56f8262392 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -11,6 +11,7 @@
 #include <drm/drm_pagemap_util.h>
 
 #include "xe_bo.h"
+#include "xe_exec_queue.h"
 #include "xe_exec_queue_types.h"
 #include "xe_gt_stats.h"
 #include "xe_migrate.h"
@@ -1732,10 +1733,9 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
 static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or_reclaim)
 {
 	struct xe_pagemap *xpagemap = container_of(dpagemap, typeof(*xpagemap), dpagemap);
-	struct xe_device *xe = to_xe_device(dpagemap->drm);
 
 	if (from_atomic_or_reclaim)
-		queue_work(xe->destroy_wq, &xpagemap->destroy_work);
+		xe_exec_queue_destroy_wq_queue(&xpagemap->destroy_work);
 	else
 		xe_pagemap_destroy_work(&xpagemap->destroy_work);
 }
-- 
2.43.0

