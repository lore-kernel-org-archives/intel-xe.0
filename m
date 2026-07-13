Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AE1C44507
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 23:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB8210E36F;
	Mon, 13 Jul 2026 23:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+Get2wp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB7310E03B
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 23:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783986374; x=1815522374;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s/jcTrb8OsFhml4KFR7uwbga/0JPPgSFJhdv+gwCb1Y=;
 b=m+Get2wp4AcnI+ZLzZIw+e7oL5sakUSArYMHGXrhj40ukHMfBDMKpeDe
 YsrMVm+Q/gnqRMPeXDaUAIT+5pGBUiYLqfqE0l785p7EquIKJkIBQvwsz
 pVYjzje7uETafgJSPZP8qRE8NIWqvg1jz6ug80lRv1HaCChQqXQ1JW1O/
 nwF0g/PP1CMN2Ev8NpHuUVj0jyci/kTAWOgc9x4p8xaMC3jx6FQS3CsU9
 9vMBjYM1H27Yf4Pc+95flhSSZ2s8FZY+sj47cFvk5TlSToG/HoNs9frOX
 4rlNBnZua+mexPlBXtLEzhgeEckYzkCS56KVljKF8nz1AaUloqcySk7Q0 w==;
X-CSE-ConnectionGUID: 2PNLUG0tSLy2w0cDWS9JKg==
X-CSE-MsgGUID: 3+any13hTHeO6auXqXgdXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95207233"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95207233"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 16:46:13 -0700
X-CSE-ConnectionGUID: WAvCRHHOT5qdomvsAuLxsA==
X-CSE-MsgGUID: sAN3V7UOSOSd3MSJmV46/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="293879203"
Received: from gsse-cloud1.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 16:46:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Carlos Santa <carlos.santa@intel.com>,
	Ryan Neph <ryanneph@google.com>
Subject: [PATCH 1/2] drm/xe: Track exec queue priority band counts for user VMs
Date: Mon, 13 Jul 2026 16:46:05 -0700
Message-Id: <20260713234606.3367215-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a per-priority-band count (LOW/NORMAL/HIGH) of exec queues
attached to a user VM in xe_vm_add_exec_queue()/xe_vm_remove_exec_queue(),
protected by vm->exec_queues.lock in write mode. KERNEL priority is
not counted since it is not possible for user exec queues.

This count is needed so a VM's private buffer objects can later be
prioritized for eviction based on the priority userspace has assigned
to the exec queues using that VM (i.e. work submitted at a higher
priority band implies its buffers are more important to keep
resident), rather than treating every VM the same.

Also move the has_ctx_tlb_inval check inside the lock in
xe_vm_add_exec_queue() so the list add/count update is properly
gated under the same critical section, and make
xe_vm_remove_exec_queue() bail out early if q->xef is not set,
rather than relying on callers to check this.

Cc: Carlos Santa <carlos.santa@intel.com>
Cc: Ryan Neph <ryanneph@google.com>
Assisted-by: GitHub_Copilot:claude-sonnet-5
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++++
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e915e33ebece..e6c0062143f9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -4933,8 +4933,9 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
  * @vm: The VM.
  * @q: The exec_queue
  *
- * Add exec queue to VM, skipped if the device does not have context based TLB
- * invalidations.
+ * Track exec queue's priority band count for the VM. Also links the exec
+ * queue onto the per-GT list, skipped if the device does not have context
+ * based TLB invalidations.
  */
 void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
@@ -4948,12 +4949,14 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	xe_assert(xe, vm->xef);
 	xe_assert(xe, vm == q->vm);
 
-	if (!xe->info.has_ctx_tlb_inval)
-		return;
-
 	down_write(&vm->exec_queues.lock);
-	list_add(&q->vm_exec_queue_link, &vm->exec_queues.list[q->gt->info.id]);
-	++vm->exec_queues.count[q->gt->info.id];
+	if (xe->info.has_ctx_tlb_inval) {
+		list_add(&q->vm_exec_queue_link, &vm->exec_queues.list[q->gt->info.id]);
+		++vm->exec_queues.count[q->gt->info.id];
+	}
+	if (q->sched_props.priority >= XE_EXEC_QUEUE_PRIORITY_LOW &&
+	    q->sched_props.priority <= XE_EXEC_QUEUE_PRIORITY_HIGH)
+		++vm->exec_queues.priority_count[q->sched_props.priority];
 	up_write(&vm->exec_queues.lock);
 }
 
@@ -4962,18 +4965,22 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
  * @vm: The VM.
  * @q: The exec_queue
  *
- * Remove exec queue from VM, skipped if the device does not have context based
- * TLB invalidations.
+ * Untrack exec queue's priority band count for the VM. Also unlinks the
+ * exec queue from the per-GT list, skipped if the device does not have
+ * context based TLB invalidations. No-op if @q is not a user exec queue.
  */
 void xe_vm_remove_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 {
-	if (!vm->xe->info.has_ctx_tlb_inval)
+	if (!q->xef)
 		return;
 
 	down_write(&vm->exec_queues.lock);
-	if (!list_empty(&q->vm_exec_queue_link)) {
+	if (vm->xe->info.has_ctx_tlb_inval && !list_empty(&q->vm_exec_queue_link)) {
 		list_del(&q->vm_exec_queue_link);
 		--vm->exec_queues.count[q->gt->info.id];
 	}
+	if (q->sched_props.priority >= XE_EXEC_QUEUE_PRIORITY_LOW &&
+	    q->sched_props.priority <= XE_EXEC_QUEUE_PRIORITY_HIGH)
+		--vm->exec_queues.priority_count[q->sched_props.priority];
 	up_write(&vm->exec_queues.lock);
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..d75546c4eb66 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -16,6 +16,7 @@
 #include <linux/scatterlist.h>
 
 #include "xe_device_types.h"
+#include "xe_exec_queue_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
 #include "xe_tlb_inval_types.h"
@@ -342,6 +343,12 @@ struct xe_vm {
 		 * per GT
 		 */
 		int count[XE_MAX_TILES_PER_DEVICE * XE_MAX_GT_PER_TILE];
+		/**
+		 * @exec_queues.priority_count: count of exec queues attached
+		 * to this VM, per priority band (LOW / NORMAL / HIGH only,
+		 * KERNEL priority is not possible for user exec queues)
+		 */
+		int priority_count[XE_EXEC_QUEUE_PRIORITY_HIGH + 1];
 		/** @exec_queues.lock: lock to protect exec_queues list */
 		struct rw_semaphore lock;
 	} exec_queues;
-- 
2.34.1

