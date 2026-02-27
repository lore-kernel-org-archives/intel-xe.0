Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBE9FD4600
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 06:43:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C0210E615;
	Fri, 27 Feb 2026 06:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCm7SJM5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC5910E615
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Feb 2026 06:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772174636; x=1803710636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZZeqHEe+GQZw8nQYPQrT9jaf2lIiaat6FQh655u6z+0=;
 b=DCm7SJM52UiUambUirMb2ocEI3eWLN6kleZuWwrsxf/7DWIM6/oNk67i
 IbeWqhNWZYFg6dhOMGT2Wls+wXOas0jzTQKbA1H3mmxYWoU4ohIPf7bHp
 UM4tbe+W+jVo5D+X8Q1vedNwuO2CF2QNHNw86Iq6y7lw11fpfpc2k8S/m
 2tEVK/gSvBIrnnLiuLq26rhjk5cEJuGnoBlv3uxA5BRyOw73bOILpp9DX
 m3P5DL8Sp3hfF3jztp2xVvgpU7c3zhq+ANWDDWMioVn0uBmUQKP1hpyux
 vEmPSyuIJtLrdikxUEd2lUA/fVjYQGXtEbDsAAof430VOJ7PDKswgBzkp Q==;
X-CSE-ConnectionGUID: Xz8KFImcQNy0bUFsz4V4Og==
X-CSE-MsgGUID: xPw8hBkOTsmeXmhsFvvjfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90656126"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="90656126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:43:56 -0800
X-CSE-ConnectionGUID: hEi9rK7cQumngN5B1E2iDQ==
X-CSE-MsgGUID: JZ27iQbFS3G4o6+qZxyXbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="254594829"
Received: from xwang-desk.fm.intel.com ([10.121.64.134])
 by orviesa001.jf.intel.com with ESMTP; 26 Feb 2026 22:43:57 -0800
From: Xin Wang <x.wang@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH] drm/xe: Fix race between exec queue kill and VM cleanup on
 file close
Date: Thu, 26 Feb 2026 22:43:54 -0800
Message-ID: <20260227064354.531306-1-x.wang@intel.com>
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

During process exit, exec queues are killed asynchronously via GuC
firmware. If VM page tables are released while the GuC is still
processing the disable sequence, hardware can access freed memory
causing CAT errors.

Fix this by reordering xe_file_close() to ensure hardware has stopped
before releasing resources:

1. Kill all exec queues (existing logic, unchanged)
2. Flush per-GT workqueues (ordered_wq, g2h_wq) to drain in-flight
   GuC messages
3. Wait for GuC to confirm all queues are disabled via G2H feedback,
   using wait_event_timeout on guc->ct.wq with a 5s timeout
4. Release queue references only after hardware confirms idle
5. Close and release VMs (page table teardown) last

The wait includes bail-out conditions for GuC stopped state (GT reset)
and VF recovery, consistent with all other wait_event_timeout patterns
in xe_guc_submit.c.

Add xe_guc_exec_queue_is_idle() to check whether a queue has been
confirmed idle by the GuC scheduler.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c     | 67 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_submit.c | 54 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.h |  1 +
 3 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 3462645ca13c..e15ce3c64914 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -41,6 +41,7 @@
 #include "xe_gt_printk.h"
 #include "xe_gt_sriov_vf.h"
 #include "xe_guc.h"
+#include "xe_guc_submit.h"
 #include "xe_guc_pc.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hwmon.h"
@@ -160,13 +161,29 @@ void xe_file_put(struct xe_file *xef)
 	kref_put(&xef->refcount, xe_file_destroy);
 }
 
+static bool xe_file_is_idle(struct xe_file *xef, struct xe_gt *gt)
+{
+	struct xe_exec_queue *q;
+	unsigned long idx;
+
+	xa_for_each(&xef->exec_queue.xa, idx, q) {
+		struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
+		if (q->gt == gt && !xe_guc_exec_queue_is_idle(primary))
+			return false;
+	}
+
+	return true;
+}
+
 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 {
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = file->driver_priv;
 	struct xe_vm *vm;
 	struct xe_exec_queue *q;
+	struct xe_gt *gt;
 	unsigned long idx;
+	u8 id;
 
 	guard(xe_pm_runtime)(xe);
 
@@ -175,13 +192,61 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
 	 * when FD is closing as IOCTLs presumably can't be modifying the
 	 * xarray. Taking exec_queue.lock here causes undue dependency on
 	 * vm->lock taken during xe_exec_queue_kill().
+	 *
+	 * Kill all exec queues first to stop hardware execution.
+	 * This must be done before releasing VM and page tables to avoid
+	 * hardware memory access errors (CAT errors) during process exit.
 	 */
 	xa_for_each(&xef->exec_queue.xa, idx, q) {
 		if (q->vm && q->hwe->hw_engine_group)
 			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
 		xe_exec_queue_kill(q);
-		xe_exec_queue_put(q);
 	}
+
+	/*
+	 * Flush per-GT workqueues to drain in-flight GuC messages triggered
+	 * by the exec queue kills above. ordered_wq handles scheduler jobs
+	 * (H2G), and g2h_wq processes the GuC responses we're about to
+	 * wait for.
+	 */
+	for_each_gt(gt, xe, id) {
+		if (gt->ordered_wq)
+			flush_workqueue(gt->ordered_wq);
+		if (gt->uc.guc.ct.g2h_wq)
+			flush_workqueue(gt->uc.guc.ct.g2h_wq);
+	}
+
+	/*
+	 * Wait for GuC to confirm all queues are disabled. This prevents
+	 * hardware from accessing page tables after VM cleanup.
+	 *
+	 * Bail out early if GuC is stopped (GT reset) or VF recovery is
+	 * pending, as G2H confirmations cannot arrive in those states.
+	 */
+	smp_rmb();
+	for_each_gt(gt, xe, id) {
+		struct xe_guc *guc = &gt->uc.guc;
+		long timeout = 5 * HZ;
+		long ret;
+
+		ret = wait_event_timeout(guc->ct.wq,
+					 xe_file_is_idle(xef, gt) ||
+					 xe_guc_read_stopped(guc) ||
+					 xe_gt_recovery_pending(gt),
+					 timeout);
+
+		if (!ret && !xe_guc_read_stopped(guc) &&
+		    !xe_gt_recovery_pending(gt))
+			drm_warn(&xe->drm,
+				 "Timeout waiting for queue cleanup on GT%u, CAT errors may follow\n",
+				 id);
+	}
+
+	/* Now that hardware is stopped, release the queue references */
+	xa_for_each(&xef->exec_queue.xa, idx, q)
+		xe_exec_queue_put(q);
+
+	/* Finally, close and release the VMs (clearing page tables) */
 	xa_for_each(&xef->vm.xa, idx, vm)
 		xe_vm_close_and_put(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ca7aa4f358d0..9d81f76bfd54 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -2792,6 +2792,60 @@ g2h_exec_queue_lookup(struct xe_guc *guc, u32 guc_id)
 	return q;
 }
 
+/**
+ * xe_guc_exec_queue_is_idle() - Check if the exec queue is truly idle on GuC
+ * @q: The exec_queue
+ *
+ * Return: True if the exec queue is no longer running on hardware, false otherwise.
+ *
+ */
+bool xe_guc_exec_queue_is_idle(struct xe_exec_queue *q)
+{
+	struct xe_guc *guc = &q->gt->uc.guc;
+	uint32_t state;
+
+	if (!xe_uc_fw_is_running(&guc->fw))
+		return true;
+
+	state = atomic_read(&q->guc->state);
+
+	/*
+	 * If queue was never enabled, it never submitted work to GuC, so
+	 * hardware never accessed it. Safe to consider idle immediately
+	 * without waiting for GuC cleanup, even if we later kill the queue.
+	 */
+	if (!(state & EXEC_QUEUE_STATE_ENABLED) &&
+	    !(state & EXEC_QUEUE_STATE_PENDING_ENABLE))
+		return true;
+
+	/*
+	 * Queue marked for destruction during file close, or suspended (not
+	 * executing on hardware). In both cases, the VM has been detached from
+	 * this queue, so we can safely consider it idle. Pending GuC cleanup
+	 * messages won't cause access issues.
+	 */
+	if ((state & EXEC_QUEUE_STATE_DESTROYED) || (state & EXEC_QUEUE_STATE_SUSPENDED))
+		return true;
+
+	/*
+	 * Killed queue can be idle only if no transitions are pending.
+	 * The queue could have been killed while enable or disable was in
+	 * progress, so we must wait for those pending transitions to complete.
+	 */
+	if (state & EXEC_QUEUE_STATE_KILLED)
+		return !(state & (EXEC_QUEUE_STATE_PENDING_DISABLE |
+			          EXEC_QUEUE_STATE_PENDING_ENABLE));
+
+	/*
+	 * Queue in transitional state (pending disable but not killed).
+	 * In the file-close path, all queues are killed above, so this return
+	 * is not reached during normal file close. However, it's defensive
+	 * programming: if any non-file-close caller checks is_idle without
+	 * killing first, we correctly wait for pending_disable to clear.
+	*/
+	return !(state & EXEC_QUEUE_STATE_PENDING_DISABLE);
+}
+
 static void deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	u32 action[] = {
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b3839a90c142..9fa65366edcb 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -55,5 +55,6 @@ void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
 
 int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
+bool xe_guc_exec_queue_is_idle(struct xe_exec_queue *q);
 
 #endif
-- 
2.43.0

