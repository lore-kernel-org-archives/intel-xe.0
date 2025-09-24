Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1821BCAC5B3
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 01:16:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C559B10E69F;
	Wed, 24 Sep 2025 01:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgdEWj2U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8CC10E69C
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 01:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758676572; x=1790212572;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=87FZyXSHqIakZV5x7k5NLX7a7ik7O/muniYb/s7l6WY=;
 b=dgdEWj2UyQP15YER5ezXm6dCxx5w7gtz4RizD5hJVcSwXOQwm58WXG79
 1XGxvMTnmJRaCXUBLWZITw0/Y7ymvhVYdTHLKqWK/yNmXSd9A61nRnSAS
 VWh2nvw8XTNu9xUdNNakCkcLFwDWThxN9OXxTd7DzHNXmZonGIcv2Z8St
 f/DVALhwqckRrWup9fU1q/s5sJhJc39Q56GtPtrWCfm0/oKl00d245kGX
 6H82rJuFDMFZrm8J78Dlcs9SgIvl6ov4YXhel8FtxLa8x6oNAN6cceHHQ
 sUc8OWgHJTPzNSIEngZOh3ZTdyZBb2cnIC21KQR0G9DlGa8q/7ZS5jHxE Q==;
X-CSE-ConnectionGUID: Xf8+1vyeQ86+irwbkVSdtQ==
X-CSE-MsgGUID: RSlw0yVAROG3t5D7nIaZKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60908281"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60908281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:11 -0700
X-CSE-ConnectionGUID: ODTjjlAiQImnQBfzdzpoeg==
X-CSE-MsgGUID: XJeEPdghTKSGo2w66MO7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; d="scan'208";a="207841808"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 18:16:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 27/34] drm/xe: Move queue init before LRC creation
Date: Tue, 23 Sep 2025 18:15:54 -0700
Message-Id: <20250924011601.888293-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250924011601.888293-1-matthew.brost@intel.com>
References: <20250924011601.888293-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 43 +++++++++++++++++------
 drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 ++
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
 drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
 drivers/gpu/drm/xe/xe_lrc.h               | 10 ++++++
 7 files changed, 90 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 81f707d2c388..3db8e64d9d13 100644
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
@@ -179,17 +180,32 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
 			flags |= XE_LRC_CREATE_RUNALONE;
 	}
 
+	err = q->ops->init(q);
+	if (err)
+		return err;
+
+	/*
+	 * This must occur after q->ops->init to avoid race conditions during VF
+	 * post-migration recovery, as the fixups for the LRC GGTT addresses
+	 * depend on the queue being present in the backend tracking structure.
+	 *
+	 * In addition to above, we must wait on inflight GGTT changes to
+	 * avoid writing out stale values here.
+	 */
+	xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
 	for (i = 0; i < q->width; ++i) {
-		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
-		if (IS_ERR(q->lrc[i])) {
-			err = PTR_ERR(q->lrc[i]);
+		struct xe_lrc *lrc;
+
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
 
@@ -1095,9 +1111,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
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
index 91e7dbe80ab2..5e70f3f93d13 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -482,6 +482,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
 				 shift, config->ggtt_base);
 		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
 	}
+
+	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
+	smp_wmb();	/* Ensure above write visible before wake */
+	wake_up_all(&gt->sriov.vf.migration.wq);
+
 out:
 	up_write(config->lock);
 	return err;
@@ -820,7 +825,8 @@ static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
 	    !gt->sriov.vf.migration.recovery_teardown) {
 		gt->sriov.vf.migration.recovery_queued = true;
 		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
-		smp_wmb();	/* Ensure above write visable before wake */
+		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
+		smp_wmb();	/* Ensure above writes visable before wake */
 
 		wake_up_all(&gt->uc.guc.ct.wq);
 
@@ -1339,6 +1345,7 @@ int xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
 		&tile->primary_gt->sriov.vf.self_config.__lock;
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
+	init_waitqueue_head(&gt->sriov.vf.migration.wq);
 
 	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
 		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
@@ -1361,3 +1368,33 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
 		(xe_memirq_vf_recovery_irq_pending(memirq, &gt->uc.guc) ||
 		 READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
 }
+
+static bool vf_valid_ggtt(struct xe_gt *gt)
+{
+	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	if (xe_memirq_vf_recovery_irq_pending(memirq, &gt->uc.guc) ||
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
index 535237003915..d5b53ba1d4ca 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
@@ -39,4 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
 void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
 
+void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index beb9978336bb..79bb9d5d62bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -8,6 +8,7 @@
 
 #include <linux/rwsem.h>
 #include <linux/types.h>
+#include <linux/wait.h>
 #include <linux/workqueue.h>
 #include "xe_uc_fw_types.h"
 
@@ -61,6 +62,8 @@ struct xe_gt_sriov_vf_migration {
 	struct work_struct worker;
 	/** @lock: Protects recovery_queued, teardown */
 	spinlock_t lock;
+	/** @wq: wait queue for migration fixes */
+	wait_queue_head_t wq;
 	/** @lrc_wa_bb: Scratch memory for LRC WA BB in recovery */
 	void *lrc_wa_bb;
 	/** @recovery_teardown: VF post migration recovery is being torn down */
@@ -69,6 +72,8 @@ struct xe_gt_sriov_vf_migration {
 	bool recovery_queued;
 	/** @recovery_inprogress: VF post migration recovery in progress */
 	bool recovery_inprogress;
+	/** @ggtt_need_fixes: VF GGTT needs fixes */
+	bool ggtt_need_fixes;
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b112a4a91a5b..f01f2d6f97ed 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1938,7 +1938,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
 	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
-			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
+			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
 			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			    q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
index 188565465779..5fb6c74bdab5 100644
--- a/drivers/gpu/drm/xe/xe_lrc.h
+++ b/drivers/gpu/drm/xe/xe_lrc.h
@@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
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

