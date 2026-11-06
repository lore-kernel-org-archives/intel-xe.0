Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C8C606A326
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 21:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d6BJI9fe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2AF10EAC5;
	Fri,  6 Nov 2026 21:56:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659A10EAC5
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 21:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794002189; x=1825538189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2zn4Njg20LPdsbO3xMzA2l/lB8eeL1y5XZwPl2qCb/0=;
 b=d6BJI9feLB9STDwtcWOQmn4CgN943ZttTJwI2XcmeZ2pYAnFm0txI9i0
 5+UlHwDN5TeuDknv8hJJHURD4WP6+plfIwimYoqSgRupM1vJuBS5wvl7c
 pkl2mI9zIYjoSyoOxfoS9frzATUeyJwk2PiMVPwOQWMcNzt+5l4eUuRh0
 5/G8QjZrlnAl+CwDfhw0A8KyZDsY/qTwHCTDECzu8mzIEu5aAx+M0n/ft
 KNiGyQCnIEFALr7TDUObH9B3+2zt97FrQS8ZhM/mbiM+PUWk6WbB3hCBw
 HRlLRl7oBN1EnLtDWGEKC2eUAmsuoQ3sniNaf86Ta/lJR4WHsz7CxbKTH w==;
X-CSE-ConnectionGUID: fsctPyJnSGKkSPfRpyOD9A==
X-CSE-MsgGUID: QjIoaq0USQ+7ouba6Lz99Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2711655"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2711655"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 13:56:29 -0800
X-CSE-ConnectionGUID: YPfbmJj5TUuZL15slWRefg==
X-CSE-MsgGUID: 5xjVFffqRAiv8fwZLGHxgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7202378"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by orviesa008.jf.intel.com with ESMTP; 06 Nov 2026 13:56:27 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v3 1/2] drm/xe/vf: Late fixups of LRCs after VF migration
Date: Fri,  6 Nov 2026 22:56:59 +0100
Message-ID: <20261106215700.1218318-2-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106215700.1218318-1-tomasz.lis@intel.com>
References: <20261106215700.1218318-1-tomasz.lis@intel.com>
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
v3: Use drm-managed mutex lifecycle.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com> (v1)
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 28 +++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h        |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 12 ++++----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c        | 35 ++++-------------------
 drivers/gpu/drm/xe/xe_guc_submit.h        |  2 --
 6 files changed, 38 insertions(+), 43 deletions(-)

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
index 2a5f2064ad3e..4412ed6eb422 100644
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
 
@@ -1498,17 +1494,19 @@ static void vf_migration_fini(void *arg)
  */
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	void *buf;
 
-	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
+	if (!xe_sriov_vf_migration_supported(xe))
 		return 0;
 
-	buf = drmm_kmalloc(&gt_to_xe(gt)->drm,
-			   post_migration_scratch_size(gt_to_xe(gt)),
+	buf = drmm_kmalloc(&xe->drm,
+			   post_migration_scratch_size(xe),
 			   GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
+	drmm_mutex_init(&xe->drm, &gt->sriov.vf.migration.scratch_lock);
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

