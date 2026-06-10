Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B1D6CD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 23:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B20E10EC29;
	Wed, 10 Jun 2026 23:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHw2oInc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB4110EC29
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 23:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781134028; x=1812670028;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2SKqFifSi2HAVNzqoCd/AnVuYqcagRBLDuafcldKSLY=;
 b=gHw2oIncOBuM0ovF3mlflMz9myZu9lxlWXyER6GdfvSnPDONCR+0GOyR
 WaC5BBk+7vpXvjUMSQmWXbxNuAErhYrLSthBZJmScQl0i6B0kHsHjmf3z
 4i/W28Bc0ar9mdOf2n1SXq3XUv3pHSf3Bip2RgHQ4uZUxJolkTIqm+Yx7
 5HGpVuncn+5nnXVWy/RveVGtqMV+iutCctZmdi9dHrPeL9I08yTOYOhik
 QWHXTI/xhdWtbfwuxRGuFlR9ZAxmnvPFwf3iVz0cWl0f3cOi743fXkI0t
 zTlg2mvSrWbGDcTI+BcMx2PY3E4HwgnawsIUf9wblI732fFXtS9ahQj1R g==;
X-CSE-ConnectionGUID: +P18qq2+R0Kf1s4qT0lPkA==
X-CSE-MsgGUID: 5svh0/NrTQ6Bs3HI1QD/pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82135821"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="82135821"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 16:27:07 -0700
X-CSE-ConnectionGUID: dUKnI3Q3SxWNry69+B892A==
X-CSE-MsgGUID: q0YarZqBTXSSsVXmRr5WGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="239968951"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.40])
 by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2026 16:27:07 -0700
From: Jia Yao <jia.yao@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>, Wang Xin <x.wang@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/xe: Wait for GuC deregister before VM page table teardown
Date: Wed, 10 Jun 2026 23:26:56 +0000
Message-ID: <20260610232656.1250879-1-jia.yao@intel.com>
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

LR-mode VMs skip adding fences to the VM reservation, so
dma_resv_wait_timeout() returns immediately on fd close. This lets
xe_pt_clear() zero the PML4 while GPU contexts are still registered with
GuC and actively executing. A context walking a zeroed PML4 triggers a
CAT error and GT reset storm that disrupts unrelated workloads on the
same GT, causing xe_wait_ufence timeout (VLK-90362).

Add an atomic counter (guc_registered_count) and waitqueue
(deregister_wq) to xe_vm.usm, incremented on GuC registration and
decremented on deregistration. xe_vm_close() waits up to 1s for the
counter to reach zero before clearing page tables. Once
xe_exec_queue_kill() has set the 1us preemption timeout, each engine
resets within microseconds and completes deregistration in tens of
milliseconds, so the total is well under 1s.

Cc: Wang Xin <x.wang@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 42 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.c         | 39 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h   | 15 +++++++++++
 3 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 4b247a3019d2..1d08ae4913bc 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -77,14 +77,35 @@ static bool exec_queue_registered(struct xe_exec_queue *q)
 	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_REGISTERED;
 }
 
+/*
+ * Track the number of exec queues registered with the GuC for a VM that owns
+ * an ASID. The count gates ASID release and page table teardown in
+ * xe_vm_close() so hardware never walks a freed page table via a stale ASID.
+ * Tie the count to the REGISTERED state bit transition so it stays balanced
+ * across every register/deregister path (including GT reset and rollback),
+ * and remains idempotent if a clear is issued more than once.
+ */
+static bool exec_queue_tracks_asid(struct xe_exec_queue *q)
+{
+	return q->vm && q->vm->usm.asid;
+}
+
 static void set_exec_queue_registered(struct xe_exec_queue *q)
 {
-	atomic_or(EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
+	int old = atomic_fetch_or(EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
+
+	if (!(old & EXEC_QUEUE_STATE_REGISTERED) && exec_queue_tracks_asid(q))
+		atomic_inc(&q->vm->usm.guc_registered_count);
 }
 
 static void clear_exec_queue_registered(struct xe_exec_queue *q)
 {
-	atomic_and(~EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
+	int old = atomic_fetch_and(~EXEC_QUEUE_STATE_REGISTERED, &q->guc->state);
+
+	if ((old & EXEC_QUEUE_STATE_REGISTERED) && exec_queue_tracks_asid(q)) {
+		if (atomic_dec_and_test(&q->vm->usm.guc_registered_count))
+			wake_up_all(&q->vm->usm.deregister_wq);
+	}
 }
 
 static bool exec_queue_enabled(struct xe_exec_queue *q)
@@ -1741,10 +1762,12 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 	 *   it is safe to directly destroy the exec queue on driver side, as the GuC
 	 *   will not process further requests and all resources must be cleaned up locally.
 	 */
-	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
+	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw)) {
 		disable_scheduling_deregister(guc, q);
-	else
+	} else {
+		clear_exec_queue_registered(q);
 		__guc_exec_queue_destroy(guc, q);
+	}
 }
 
 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
@@ -2049,10 +2072,12 @@ static void guc_exec_queue_destroy(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q)) {
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
-	else
+	} else {
+		clear_exec_queue_registered(q);
 		__guc_exec_queue_destroy(exec_queue_to_guc(q), q);
+	}
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
@@ -2298,8 +2323,10 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 		}
 	}
 
-	if (do_destroy)
+	if (do_destroy) {
+		clear_exec_queue_registered(q);
 		__guc_exec_queue_destroy(guc, q);
+	}
 }
 
 static int guc_submit_reset_prepare(struct xe_guc *guc)
@@ -2864,6 +2891,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
 	trace_xe_exec_queue_deregister_done(q);
 
 	clear_exec_queue_registered(q);
+
 	__guc_exec_queue_destroy(guc, q);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 080c2fff0e95..6d1a69049e6b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1798,6 +1798,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 			goto err_close;
 
 		vm->usm.asid = asid;
+		atomic_set(&vm->usm.guc_registered_count, 0);
+		init_waitqueue_head(&vm->usm.deregister_wq);
 	}
 
 	trace_xe_vm_create(vm);
@@ -1850,6 +1852,43 @@ static void xe_vm_close(struct xe_vm *vm)
 				      DMA_RESV_USAGE_BOOKKEEP,
 				      false, MAX_SCHEDULE_TIMEOUT);
 
+		/*
+		 * For LR-mode VMs with an ASID, wait for all exec queues
+		 * registered with GuC to complete deregistration before
+		 * clearing the page tables. Once GuC acknowledges
+		 * deregistration, it will no longer schedule those contexts on
+		 * hardware, so it is safe to release the ASID and zero the page
+		 * tables. Without this wait, a racing context still registered
+		 * with GuC can walk the zeroed PML4, causing CAT errors and a
+		 * GT reset storm that disrupts unrelated workloads on the same GT.
+		 *
+		 * This race is specific to LR-mode VMs, whose in-flight jobs do
+		 * not install fences in the VM reservation, so the
+		 * dma_resv_wait_timeout() above returns immediately and cannot
+		 * tell whether hardware still references the address space.
+		 * Restrict the wait to LR mode to avoid penalizing other VMs.
+		 * The wait is bounded so a stuck GuC cannot block file close
+		 * (e.g. ctrl-C) indefinitely; on timeout we proceed and the
+		 * memory protection from xe_vm_close_and_put() still holds.
+		 *
+		 * The 1s timeout is generous for the normal deregistration path:
+		 * once xe_exec_queue_kill() sets the 1us preemption timeout, GuC
+		 * resets the engine in microseconds and completes the
+		 * disable+deregister H2G/G2H round-trips in tens of milliseconds
+		 * per queue. Even with many queues serialised on the ordered
+		 * workqueue the total is well under 1s. Waiting while the page
+		 * tables are still intact means no CAT errors can occur, so the
+		 * CT channel is not flooded and the normal path always applies.
+		 * On timeout we proceed anyway; memory is still protected by
+		 * xe_vm_close_and_put() but CAT errors may follow.
+		 */
+		if (xe_vm_in_lr_mode(vm) && vm->usm.asid &&
+		    !wait_event_timeout(vm->usm.deregister_wq,
+				       atomic_read(&vm->usm.guc_registered_count) == 0,
+				       HZ))
+			drm_warn(&xe->drm,
+				 "Timeout waiting for GuC exec queue deregister before VM close. CAT errors may follow.\n");
+
 		if (bound) {
 			for_each_tile(tile, xe, id)
 				if (vm->pt_root[id])
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 635ed29b9a69..26599a9c8b1f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -355,6 +355,21 @@ struct xe_vm {
 		 * get a flood of faults to the same VMA
 		 */
 		struct xe_vma *last_fault_vma;
+		/**
+		 * @guc_registered_count: number of exec queues currently
+		 * registered with the GuC for this VM. Incremented when an
+		 * exec queue is registered, decremented when the GuC confirms
+		 * deregistration. Used to delay ASID release and page table
+		 * teardown until hardware has stopped using the address space.
+		 */
+		atomic_t guc_registered_count;
+		/**
+		 * @deregister_wq: wait queue signalled when
+		 * @guc_registered_count reaches zero. xe_vm_close() waits on
+		 * this before zeroing page tables to prevent racing contexts
+		 * from walking a zeroed PML4 via a stale ASID.
+		 */
+		wait_queue_head_t deregister_wq;
 	} usm;
 
 	/** @error_capture: allow to track errors */
-- 
2.43.0

