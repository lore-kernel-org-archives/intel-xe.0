Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C46CFF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5AB10E3F9;
	Wed, 29 Apr 2026 20:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epYazscN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790C710E041
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777494799; x=1809030799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MfKeWD0vfDdDZc9wvAH1zJ1t0AWVbld+pc95HdfQka8=;
 b=epYazscNC+iOIY2XJQFP+suIiItrLM3k4uGTiovVsNJcKhyEJt/Wdo3H
 e6w4LKrsfHGMILJiF9+CDPT2Hk4pEOecOMudg8cPbGcTRqlZvFutcbBUF
 YPOm4VxiWR5p+k0Q0QBgaU7HQLPtwvnJQpbKYyuxbZTbSaiZT0jowcAsE
 g9FXJOeHGssK4BxLPTSiM/fCrNlAqBdvOUvTfWib2EbXKIPtBAPSe6iZF
 k5vMPWZEAlOWwU5X2Pz3/iZLWnooW2Oeyijp8o7YOCQDgqEBM1rBHR2XK
 001whap5FgvqAATcX5q1wqUTCa2oaPfTNGDb9HmU/DIkRcQi0ZyhhAkcD g==;
X-CSE-ConnectionGUID: fInVZzM3QQmaz+mO+yv+iA==
X-CSE-MsgGUID: VnuFpX46SFaVmdq8abLRRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78489235"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78489235"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:33:19 -0700
X-CSE-ConnectionGUID: kScxDObxRcukQC7HLRlsKA==
X-CSE-MsgGUID: SdeVH8JdSseBIAGjfy7eWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="272497689"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa001.jf.intel.com with ESMTP; 29 Apr 2026 13:33:18 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v1 1/2] drm/xe/vf: Late fixups of LRCs after VF migration
Date: Wed, 29 Apr 2026 22:39:36 +0200
Message-Id: <20260429203937.2070047-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260429203937.2070047-1-tomasz.lis@intel.com>
References: <20260429203937.2070047-1-tomasz.lis@intel.com>
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

Do not fix LRCs of existing contexts during VF post-migration
recovery. Instead, perform fixups before every exec queue
registration.

This introduces a minor extra work during context registration,
but also decreases the amount of work required to be finished
during post-migration recovery.

To mitigate issues with concurrent registrations, the scratch buffer
required for LRC fixups is now protected by a mutex.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 28 +++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h        |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  6 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c        | 35 ++++-------------------
 drivers/gpu/drm/xe/xe_guc_submit.h        |  2 --
 6 files changed, 35 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 071b8c41df43..04a48c2cf963 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1829,15 +1829,14 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
 	q->tlb_inval[type].last_fence = dma_fence_get(fence);
 }
 
-/**
- * xe_exec_queue_contexts_hwsp_rebase - Re-compute GGTT references
- * within all LRCs of a queue.
+/*
+ * Re-compute GGTT references within all LRCs of a queue.
  * @q: the &xe_exec_queue struct instance containing target LRCs
  * @scratch: scratch buffer to be used as temporary storage
  *
  * Returns: zero on success, negative error code on failure
  */
-int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
+static int xe_exec_queue_lrcs_hwsp_rebase_with_scratch(struct xe_exec_queue *q, void *scratch)
 {
 	int i;
 	int err = 0;
@@ -1859,3 +1858,24 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 
 	return err;
 }
+
+/**
+ * xe_exec_queue_lrcs_hwsp_rebase - Re-compute GGTT references
+ * within all LRCs of a queue, using migration scratch.
+ * @q: the &xe_exec_queue struct instance containing target LRCs
+ *
+ * Returns: zero on success, negative error code on failure
+ */
+int xe_exec_queue_lrcs_hwsp_rebase(struct xe_exec_queue *q)
+{
+	struct xe_gt *gt = q->gt;
+	int err;
+
+	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
+
+	mutex_lock(&gt->sriov.vf.migration.scratch_lock);
+	err = xe_exec_queue_lrcs_hwsp_rebase_with_scratch(q, gt->sriov.vf.migration.scratch);
+	mutex_unlock(&gt->sriov.vf.migration.scratch_lock);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index a82d99bd77bc..d2b1c0aac6f0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -157,7 +157,7 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
 
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
-int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
+int xe_exec_queue_lrcs_hwsp_rebase(struct xe_exec_queue *q);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 8989c8e1be95..16d2c2db290b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1259,7 +1259,6 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
-	void *buf = gt->sriov.vf.migration.scratch;
 	int err;
 
 	VF_MIGRATION_INJECT_WAIT(gt, FIXUPS);
@@ -1273,9 +1272,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
 
 	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
-	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
-	if (err)
-		return err;
 
 	atomic_inc(&gt->sriov.vf.migration.fixups_complete_count);
 
@@ -1428,6 +1424,7 @@ static void vf_migration_fini(void *arg)
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
 	cancel_work_sync(&gt->sriov.vf.migration.worker);
+	mutex_destroy(&gt->sriov.vf.migration.scratch_lock);
 }
 
 /**
@@ -1449,6 +1446,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 	if (!buf)
 		return -ENOMEM;
 
+	mutex_init(&gt->sriov.vf.migration.scratch_lock);
 	gt->sriov.vf.migration.scratch = buf;
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 80562ffadb16..d4462987b60a 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -52,6 +52,8 @@ struct xe_gt_sriov_vf_migration {
 	spinlock_t lock;
 	/** @wq: wait queue for migration fixes */
 	wait_queue_head_t wq;
+	/** @scratch_lock: Mutex lock to serilize scratch buffer use */
+	struct mutex scratch_lock;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
 	/** @fixups_complete_count: Counts completed fixups stages */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b1222b42174c..4f1e03f84610 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -41,6 +41,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sleep.h"
+#include "xe_sriov_vf.h"
 #include "xe_trace.h"
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
@@ -989,6 +990,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
 	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
 
+	if (IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe))
+		xe_exec_queue_lrcs_hwsp_rebase(q);
+
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
 	info.engine_class = xe_engine_class_to_guc_class(q->class);
@@ -2635,6 +2639,8 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 	struct drm_sched_job *s_job;
 	bool restore_replay = false;
 
+	if (exec_queue_registered(q))
+		xe_exec_queue_lrcs_hwsp_rebase(q);
 	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
 		job = to_xe_sched_job(s_job);
 		restore_replay |= job->restore_replay;
@@ -3424,32 +3430,3 @@ bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc)
 
 	return false;
 }
-
-/**
- * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
- * exec queues registered to given GuC.
- * @guc: the &xe_guc struct instance
- * @scratch: scratch buffer to be used as temporary storage
- *
- * Returns: zero on success, negative error code on failure.
- */
-int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch)
-{
-	struct xe_exec_queue *q;
-	unsigned long index;
-	int err = 0;
-
-	mutex_lock(&guc->submission_state.lock);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
-		/* Prevent redundant attempts to stop parallel queues */
-		if (q->guc->id != index)
-			continue;
-
-		err = xe_exec_queue_contexts_hwsp_rebase(q, scratch);
-		if (err)
-			break;
-	}
-	mutex_unlock(&guc->submission_state.lock);
-
-	return err;
-}
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index b3839a90c142..69f651ceff52 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -54,6 +54,4 @@ void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
 
 bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
 
-int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
-
 #endif
-- 
2.25.1

