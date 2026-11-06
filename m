Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9C2606A332
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ifzMtb0v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F329112E9A;
	Fri,  6 Nov 2026 15:55:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00A5112E85
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 15:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793980544; x=1825516544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z3jUHGULhz3GMesWMyrk/Z0Q2WSlDQK+MVnUnqDqSAU=;
 b=ifzMtb0vm1BkqCMDj0C+2Nuqu2yT5ZgEIHa3gmI2Ow/3nj00xzDKLAJj
 S282Ktk+5leWEb8C9eT1imzC7Kv6hdyuz04KMjQPMpSwLlZotEMfZK3Ui
 WEeiwQ11lXRupzCiHDymtzFkUvSATTzTUXzZa8hMEeOChBAgUy3Dhej4w
 MUyIysaAjGuNA4hj9sKSZM0NXnCrBZ4bccE8Lh4edjPMamolphaXDnITg
 ZHq62rb1cFpaQPxLnioNrIiFnnevvFPhywwT4wDa6ojSDn0rUxUjPnUC4
 e7HC8uH7pXVOGTblAd9CGnglJZQwc6bex+b9KpbDR1qFmbh82lr7yqfdS g==;
X-CSE-ConnectionGUID: 1ZH+lvlhQRellIqRPnDrQg==
X-CSE-MsgGUID: w+huHYrkRUO9CNHvsLglPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2896004"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2896004"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 07:55:44 -0800
X-CSE-ConnectionGUID: tmLdWpz2TKO3iuY+GHiynw==
X-CSE-MsgGUID: U+mjQcsNRAWJaHqgFZRkzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7650423"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2026 07:55:43 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v2 1/2] drm/xe/vf: Late fixups of LRCs after VF migration
Date: Fri,  6 Nov 2026 16:56:14 +0100
Message-ID: <20261106155615.977330-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106155615.977330-1-tomasz.lis@intel.com>
References: <20261106155615.977330-1-tomasz.lis@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Do not fix LRCs of existing contexts during VF post-migration
recovery. Instead, perform fixups before every exec queue
registration.

This introduces a minor extra work during context registration,
but also decreases the amount of work required to be finished
during post-migration recovery.

To mitigate issues with concurrent registrations, the scratch buffer
required for LRC fixups is now protected by a mutex.

v2: Just a rebase - getting back to the subject after 6 months.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com> (v1)
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 28 +++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h        |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  6 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c        | 35 ++++-------------------
 drivers/gpu/drm/xe/xe_guc_submit.h        |  2 --
 6 files changed, 35 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7ade915c59a8..23fd0f6cba7f 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1865,15 +1865,14 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
 	q->tlb_inval[idx].last_fence = dma_fence_get(fence);
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
@@ -1895,3 +1894,24 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 
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
index e8963f85cabd..fbc74d821e63 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -157,7 +157,7 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
 
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
-int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
+int xe_exec_queue_lrcs_hwsp_rebase(struct xe_exec_queue *q);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 2a5f2064ad3e..f8c03b741b08 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1319,7 +1319,6 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
-	void *buf = gt->sriov.vf.migration.scratch;
 	int err;
 
 	VF_MIGRATION_INJECT_WAIT(gt, FIXUPS);
@@ -1333,9 +1332,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
 
 	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
-	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
-	if (err)
-		return err;
 
 	atomic_inc(&gt->sriov.vf.migration.fixups_complete_count);
 
@@ -1488,6 +1484,7 @@ static void vf_migration_fini(void *arg)
 	spin_unlock_irq(&gt->sriov.vf.migration.lock);
 
 	cancel_work_sync(&gt->sriov.vf.migration.worker);
+	mutex_destroy(&gt->sriov.vf.migration.scratch_lock);
 }
 
 /**
@@ -1509,6 +1506,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 	if (!buf)
 		return -ENOMEM;
 
+	mutex_init(&gt->sriov.vf.migration.scratch_lock);
 	gt->sriov.vf.migration.scratch = buf;
 	spin_lock_init(&gt->sriov.vf.migration.lock);
 	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
index 466f0abd9c28..443377b40a94 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
@@ -56,6 +56,8 @@ struct xe_gt_sriov_vf_migration {
 	spinlock_t lock;
 	/** @wq: wait queue for migration fixes */
 	wait_queue_head_t wq;
+	/** @scratch_lock: Mutex lock to serilize scratch buffer use */
+	struct mutex scratch_lock;
 	/** @scratch: Scratch memory for VF recovery */
 	void *scratch;
 	/** @fixups_complete_count: Counts completed fixups stages */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index b14b37b767f5..f04797f4f1c2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -47,6 +47,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sleep.h"
+#include "xe_sriov_vf.h"
 #include "xe_trace.h"
 #include "xe_uc_fw.h"
 #include "xe_vm.h"
@@ -1033,6 +1034,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
 	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
 
+	if (IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe))
+		xe_exec_queue_lrcs_hwsp_rebase(q);
+
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
 	info.engine_class = xe_hwe_to_guc_class(q->hwe);
@@ -3141,6 +3145,8 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 	struct drm_sched_job *s_job;
 	bool restore_replay = false;
 
+	if (exec_queue_registered(q))
+		xe_exec_queue_lrcs_hwsp_rebase(q);
 	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
 		job = to_xe_sched_job(s_job);
 		restore_replay |= job->restore_replay;
@@ -4088,32 +4094,3 @@ u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
 
 	return lrca;
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
index 7a81d0aa19bb..9c72ff5fa62e 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -60,6 +60,4 @@ u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
 					  u32 cur_lrca, u32 active_id);
 
-int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
-
 #endif
-- 
2.43.0

