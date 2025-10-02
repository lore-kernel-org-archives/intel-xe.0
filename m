Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7087CCCA472
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:38:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BA010E861;
	Thu,  2 Oct 2025 23:38:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="js5WDhYh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E14310E85D
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 23:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759448319; x=1790984319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4EssuYB9XxCqROqwxZZRsGJJhg0AFFNzD7eTybBV9A0=;
 b=js5WDhYhs4ilCrc7kqgWoF5MOYDExvdNSf0qH5VdMLUEgSgq6tl3sczA
 rXDGQTZgJ5EBuRl2mc8yBrOZbTX2naze/wWyLBPTmU5KDoEF5M3IR2BqX
 ofj0KzQBFQ+ifCEU1/BjpHFkiM+N/bAQj18G2QB29IMZ/YI3deyfOnOuk
 eOZLTzch1ylB6OG3372WT/2m4fHBr1kaP4v46AggwPDLARyGiw/XU/x2e
 Rv7M6ygOrYEKDIoJfNgTqgxEjn/1WBwCuFyMlVfcJyy3+m3GVwF1XHM3S
 fdXErDLpR5hQmxwvTQmon2nrawbOPx6tXRS50BlxBHqmTf7180MrX3LZs Q==;
X-CSE-ConnectionGUID: bJBz2HEeTCey556O99QCig==
X-CSE-MsgGUID: 2y9c/20vSUOSBhLA81U+KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="84360287"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="84360287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:38:38 -0700
X-CSE-ConnectionGUID: 8fQHQDhGQBSkJimkQNSE5A==
X-CSE-MsgGUID: Bewsdn1iTvisdE8L/UPAyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183180128"
Received: from sachowdh-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.252.70])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 16:38:37 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [CI 2/3] Revert "drm/xe/vf: Post migration,
 repopulate ring area for pending request"
Date: Fri,  3 Oct 2025 01:38:23 +0200
Message-ID: <20251002233824.203417-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002233824.203417-1-michal.wajdeczko@intel.com>
References: <20251002233824.203417-1-michal.wajdeczko@intel.com>
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

From: Matthew Brost <matthew.brost@intel.com>

This reverts commit a0dda25d24e636df5c30a9370464b7cebc709faf.

Due to change in the VF migration recovery design this code
is not needed any more.

v3:
 - Add commit message (Michal / Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 24 ------------------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  3 +--
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 ------------------------
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 --
 drivers/gpu/drm/xe/xe_sriov_vf.c   |  1 -
 5 files changed, 1 insertion(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index db3f869b53f3..9a251abe85f9 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1146,27 +1146,3 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 
 	return err;
 }
-
-/**
- * xe_exec_queue_jobs_ring_restore - Re-emit ring commands of requests pending on given queue.
- * @q: the &xe_exec_queue struct instance
- */
-void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q)
-{
-	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_job *job;
-
-	/*
-	 * This routine is used within VF migration recovery. This means
-	 * using the lock here introduces a restriction: we cannot wait
-	 * for any GFX HW response while the lock is taken.
-	 */
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
-		if (xe_sched_job_is_error(job))
-			continue;
-
-		q->ring_ops->emit_job(job);
-	}
-	spin_unlock(&sched->base.job_list_lock);
-}
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 15ec852e7f7e..8821ceb838d0 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -92,7 +92,6 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
 
 int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
 
-void xe_exec_queue_jobs_ring_restore(struct xe_exec_queue *q);
-
 struct xe_lrc *xe_exec_queue_lrc(struct xe_exec_queue *q);
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 3ac0950f55be..16f78376f196 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -845,30 +845,6 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	return fence;
 }
 
-/**
- * xe_guc_jobs_ring_rebase - Re-emit ring commands of requests pending
- * on all queues under a guc.
- * @guc: the &xe_guc struct instance
- */
-void xe_guc_jobs_ring_rebase(struct xe_guc *guc)
-{
-	struct xe_exec_queue *q;
-	unsigned long index;
-
-	/*
-	 * This routine is used within VF migration recovery. This means
-	 * using the lock here introduces a restriction: we cannot wait
-	 * for any GFX HW response while the lock is taken.
-	 */
-	mutex_lock(&guc->submission_state.lock);
-	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
-		if (exec_queue_killed_or_banned_or_wedged(q))
-			continue;
-		xe_exec_queue_jobs_ring_restore(q);
-	}
-	mutex_unlock(&guc->submission_state.lock);
-}
-
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
index 78c3f07e31a0..5b4a0a6fd818 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit.h
@@ -36,8 +36,6 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
 int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 len);
 int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 len);
 
-void xe_guc_jobs_ring_rebase(struct xe_guc *guc);
-
 struct xe_guc_submit_exec_queue_snapshot *
 xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q);
 void
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
index cdd9f8e78b2a..d59e2b55cc95 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
@@ -334,7 +334,6 @@ static int gt_vf_post_migration_fixups(struct xe_gt *gt)
 		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
 		if (err)
 			goto out;
-		xe_guc_jobs_ring_rebase(&gt->uc.guc);
 		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
 	}
 
-- 
2.47.1

