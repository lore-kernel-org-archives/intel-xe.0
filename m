Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC3F606A6A3
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 21:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NZU41M+n
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6B710E319;
	Fri, 20 Nov 2026 21:11:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7C910E319
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 21:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795209071; x=1826745071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ssMkTXLE/RX7Op3fDImy06t/UHJk+wP+EnZ1KtbBngY=;
 b=NZU41M+nGTe0XzQxLdIJ90GrWDD2dzvOePrxIEDdxQXGZP0g9fe7VW6d
 klDKeaWefxg/v6bKrFbmoa6aJ4VVHXpTMg3CEuTb+K5hfxSaJDQEdw3Ul
 n5YJr/k25CmocmrLOtpqL1uFcTvEprcBzfAs2AV8rk2kFS+Iz7LDX/+NQ
 FSZaLH+FgHW8WWdSBfBVqXD1q4s43ejHh8YkKX1i1slKO52XCSdGQhqaY
 OWFabXalRLooFrVWWgAoede2LaPJ1V0cqc9ILQbBlwKwkczRXA6uPYkMt
 1cehmlA0pJIiAQHvJW4jaaWfa7dFOWSJUkg9kZiMO9BzSm1bHyUPnYE4R g==;
X-CSE-ConnectionGUID: s6XVRO9hS6SokJ7/vz0xBQ==
X-CSE-MsgGUID: Cvk7pCDxTt+iI1baZuuQkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4126980"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4126980"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 13:11:11 -0800
X-CSE-ConnectionGUID: QpikmQ90QKGJ4qhV7iQFkw==
X-CSE-MsgGUID: 0wufumlqSRK1LU1dLUEWRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11140554"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa007.fm.intel.com with ESMTP; 20 Nov 2026 13:11:10 -0800
From: Tomasz Lis <tomasz.lis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>
Subject: [PATCH v7 2/3] drm/xe/vf: Late fixups of LRCs after VF migration
Date: Fri, 20 Nov 2026 22:12:02 +0100
Message-ID: <20261120211203.2119555-3-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120211203.2119555-1-tomasz.lis@intel.com>
References: <20261120211203.2119555-1-tomasz.lis@intel.com>
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

For contexts not registered to GuC, do not fix LRCs during VF
post-migration recovery. Instead, perform fixups before every
exec queue registration.

This introduces a minor extra work during context registration,
but also decreases the amount of work required to be finished
during post-migration recovery.

To mitigate issues with concurrent registrations, the scratch buffer
required for LRC fixups is now protected by a mutex.

v2: Just a rebase - getting back to the subject after 6 months.
v3: Use drm-managed mutex lifecycle.
v4: Protect from mutex creation fail; make more precise description.
v5: Use scoped_guard(). (Satya)

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
Tested-by: Adam Miszczak <adam.miszczak@linux.intel.com> (v1)
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c        | 28 +++++++++++++++---
 drivers/gpu/drm/xe/xe_exec_queue.h        |  2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 18 +++++++-----
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c        | 35 ++++-------------------
 drivers/gpu/drm/xe/xe_guc_submit.h        |  2 --
 6 files changed, 44 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index ddd9e38aa80b..832a1a1e9c74 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1904,15 +1904,14 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
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
@@ -1934,3 +1933,24 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 
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
+	scoped_guard(mutex, &gt->sriov.vf.migration.scratch_lock)
+		err = xe_exec_queue_lrcs_hwsp_rebase_with_scratch(q,
+								  gt->sriov.vf.migration.scratch);
+
+	return err;
+}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index d48775ef6baf..ccdc57386b82 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -158,7 +158,7 @@ void xe_exec_queue_tlb_inval_last_fence_set(struct xe_exec_queue *q,
 
 void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
-int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
+int xe_exec_queue_lrcs_hwsp_rebase(struct xe_exec_queue *q);
 
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
 struct xe_lrc *xe_exec_queue_get_lrc(struct xe_exec_queue *q, u16 idx);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index 60f1b29358f9..22e98d3ed3ee 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -1318,7 +1318,6 @@ static size_t post_migration_scratch_size(struct xe_device *xe)
 
 static int vf_post_migration_fixups(struct xe_gt *gt)
 {
-	void *buf = gt->sriov.vf.migration.scratch;
 	int err;
 
 	VF_MIGRATION_INJECT_WAIT(gt, FIXUPS);
@@ -1332,9 +1331,6 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
 		xe_sriov_vf_ccs_rebase(gt_to_xe(gt));
 
 	xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
-	err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
-	if (err)
-		return err;
 
 	atomic_inc(&gt->sriov.vf.migration.fixups_complete_count);
 
@@ -1497,17 +1493,25 @@ static void vf_migration_fini(void *arg)
  */
 int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
 {
+	struct xe_device *xe = gt_to_xe(gt);
 	void *buf;
+	int err;
 
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
 
+	err = drmm_mutex_init(&xe->drm, &gt->sriov.vf.migration.scratch_lock);
+	if (err) {
+		drmm_kfree(&xe->drm, buf);
+		return err;
+	}
+
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
index 38069be11aa5..f78d755d234b 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -48,6 +48,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sleep.h"
+#include "xe_sriov_vf.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace.h"
 #include "xe_uc_fw.h"
@@ -1036,6 +1037,9 @@ static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
 	xe_gt_assert(guc_to_gt(guc), !exec_queue_registered(q));
 	xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_COUNT);
 
+	if (IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe))
+		xe_exec_queue_lrcs_hwsp_rebase(q);
+
 	memset(&info, 0, sizeof(info));
 	info.context_idx = q->guc->id;
 	info.engine_class = xe_hwe_to_guc_class(q->hwe);
@@ -3179,6 +3183,8 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 	struct drm_sched_job *s_job;
 	bool restore_replay = false;
 
+	if (exec_queue_registered(q))
+		xe_exec_queue_lrcs_hwsp_rebase(q);
 	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
 		job = to_xe_sched_job(s_job);
 		restore_replay |= job->restore_replay;
@@ -4126,32 +4132,3 @@ u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
 
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
index 8397c5bb6bfd..950c6070c38a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -61,6 +61,4 @@ u32 xe_guc_submit_active_multi_queue_lrca(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
 					  u32 cur_lrca, u32 active_id);
 
-int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
-
 #endif
-- 
2.43.0

