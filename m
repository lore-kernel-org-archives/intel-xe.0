Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76114CCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 11:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC4010E428;
	Mon,  6 Oct 2025 11:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9PFoBSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC8F10E40F
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759749046; x=1791285046;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=VTYe0e+DubS5K6VRF5QtChbZM8AEvrrn6HGR5YoHVno=;
 b=Y9PFoBSv/BzQHMT63hUZxMDRUB+QP6UKYpCTwJm7flnZZWtyxIU7AyGt
 k9BSKk6wph5LZvlOvV/rp0d4GbxOFKm9Lmo87oh90Ds9aq/mpzlCjvU9h
 u6LjAKYfNeWypCNIMcFA5IUtqu1RBOwYzYMdSvsyDZEPCyWd87mW+XVWF
 OQ1mzqQQtO+FbdoaMS+ToL+RhGB4kIdW1doAlwmrKWYYG2LxTNaq9kP2W
 +BYVCSHDxoXW3zUG8kBGgQ3Jzv3bcIMMjqLnwXTJQ+PecfcOWkBWlLdL9
 +KOplRtooiD+I4v5nUEmHuiYkl2tC1QdNNmPlWeCBB+2mb5C8YD17ZZbu g==;
X-CSE-ConnectionGUID: JwshQsF0RQGMRqBDfn6tMw==
X-CSE-MsgGUID: IqlRfrcuTredlL0B1/YzMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73020400"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73020400"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:45 -0700
X-CSE-ConnectionGUID: oofsvTjuR4igk1wQYqRUPg==
X-CSE-MsgGUID: o0VASWyiRJehXAI7Laxj/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180655242"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:10:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v6 23/30] drm/xe: Move queue init before LRC creation
Date: Mon,  6 Oct 2025 04:10:31 -0700
Message-Id: <20251006111038.2234860-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
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

A queue must be in the submission backend's tracking state before the
LRC is created to avoid a race condition where the LRC's GGTT addresses
are not properly fixed up during VF post-migration recovery.

Move the queue initialization—which adds the queue to the submission
backend's tracking state—before LRC creation.

v2:
 - Wait on VF GGTT fixes before creating LRC (testing)
v5:
 - Adjust comment in code (Tomasz)
 - Reduce race window

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 45 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
 drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
 drivers/gpu/drm/xe/xe_lrc.h               | 10 +++++
 7 files changed, 92 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7621089a47fe..90cbc95f8e2e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -15,6 +15,7 @@
 #include "xe_dep_scheduler.h"
 #include "xe_device.h"
 #include "xe_gt.h"
+#include "xe_gt_sriov_vf.h"
 #include "xe_hw_engine_class_sysfs.h"
 #include "xe_hw_engine_group.h"
 #include "xe_hw_fence.h"
@@ -205,17 +206,34 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
 	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
 		flags |= XE_LRC_CREATE_USER_CTX;
 
+	err = q->ops->init(q);
+	if (err)
+		return err;
+
+	/*
+	 * This must occur after q->ops->init to avoid race conditions during VF
+	 * post-migration recovery, as the fixups for the LRC GGTT addresses
+	 * depend on the queue being present in the backend tracking structure.
+	 *
+	 * In addition to above, we must wait on inflight GGTT changes to avoid
+	 * writing out stale values here. Such wait provides a solid solution
+	 * (without a race) only if the function can detect migration instantly
+	 * from the moment vCPU resumes execution.
+	 */
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
-		if (IS_ERR(q->lrc[i])) {
-			err = PTR_ERR(q->lrc[i]);
+		struct xe_lrc *lrc;
+
+		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
+		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
+				    q->msix_vec, flags);
+		if (IS_ERR(lrc)) {
+			err = PTR_ERR(lrc);
 			goto err_lrc;
 		}
-	}
 
-	err = q->ops->init(q);
-	if (err)
-		goto err_lrc;
+		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
+		WRITE_ONCE(q->lrc[i], lrc);
+	}
 
 	return 0;
 
@@ -1121,9 +1139,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 	int err = 0;
 
 	for (i = 0; i < q->width; ++i) {
-		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
-		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
-		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
+		struct xe_lrc *lrc;
+
+		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
+		lrc = READ_ONCE(q->lrc[i]);
+		if (!lrc)
+			continue;
+
+		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
+		xe_lrc_update_hwctx_regs_with_address(lrc);
+		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
 		if (err)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f83d421ac9d3..769d05517f93 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 	const struct drm_sched_init_args args = {
 		.ops = &drm_sched_ops,
 		.num_rqs = 1,
-		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
+		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
 		.hang_limit = XE_SCHED_HANG_LIMIT,
 		.timeout = XE_SCHED_JOB_TIMEOUT,
 		.name = q->hwe->name,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8074ffb924ce..bf1806e90370 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -487,6 +487,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 				 shift, config->ggtt_base);
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
 	}
+
+	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
+	smp_wmb();	/* Ensure above write visible before wake */
+	wake_up_all(&gt->sriov.vf.migration.wq);
+
 out:
 	if (recovery)
 		mutex_unlock(&ggtt->lock);
@@ -745,7 +750,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
-		smp_wmb();	/* Ensure above write visable before wake */
+		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
+		smp_wmb();	/* Ensure above writes visable before wake */
 
 		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
 
@@ -1264,6 +1270,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 	gt->sriov.vf.migration.scratch = buf;
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
+	init_waitqueue_head(&gt->sriov.vf.migration.wq);
 
 	return 0;
 }
@@ -1312,3 +1319,33 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
 
 	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
 }
+
+static bool vf_valid_ggtt(struct xe_gt *gt)
+{
+	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	if (xe_memirq_guc_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
+	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
+		return false;
+
+	return true;
+}
+
+/**
+ * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
+ * @gt: the &xe_gt
+ */
+void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
+{
+	int ret;
+
+	if (!IS_SRIOV_VF(gt_to_xe(gt)))
+		return;
+
+	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
+					       vf_valid_ggtt(gt),
+					       HZ * 5);
+	XE_WARN_ON(!ret);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
index 8c9679414565..63102029d624 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -38,4 +38,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
+void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index c1bd6fdd9ab1..f0bc45a782a4 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/rwsem.h>
 #include <linux/types.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 #include "xe_uc_fw_types.h"
 
@@ -50,6 +51,8 @@ struct xe_gt_sriov_vf_migration {
 	struct work_struct worker;
 	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
+	/** @wq: wait queue for migration fixes */
+	wait_queue_head_t wq;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
 	/** @recovery_teardown: VF post migration recovery is being torn down */
@@ -58,6 +61,8 @@ struct xe_gt_sriov_vf_migration {
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
 	bool recovery_inprogress;
+	/** @ggtt_need_fixes: VF GGTT needs fixes */
+	bool ggtt_need_fixes;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9dbdb0b54c8b..48d5133e76a6 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1663,7 +1663,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 21a3daab0154..c4a33b135101 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -76,6 +76,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
 	kref_put(&lrc->refcount, xe_lrc_destroy);
 }
 
+/**
+ * xe_lrc_ring_size() - Xe LRC ring size
+ *
+ * Return: Size of LRC size
+ */
+static inline size_t xe_lrc_ring_size(void)
+{
+	return SZ_16K;
+}
+
 size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
 u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
 u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
-- 
2.34.1

