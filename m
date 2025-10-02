Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DF6CCD188
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CBD610E79B;
	Thu,  2 Oct 2025 05:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyRKY2eU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED1610E788
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384447; x=1790920447;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8i4IfIiBXBNGPMfB5mBdwfkAplZ9/DD7tFpoW+n9VVE=;
 b=SyRKY2eUpLSg2Mh8yM32YVrbYa/AN+t6nyPoUyAKxcye0yTHw0gMlDIK
 YHzHmPcQ7p1RGYGosk4Z5xCH1J+KRHhL83Kc3bLwv4pQiQE5vyxgav2xT
 WoLiyOsUFy0tKP26OT4wUk8gpPcmanVuz9AO0eDYfrM+qgaI5Enc27eK+
 wQ6nfild3xaZSX0CurNP89U5EylQq5B0rZQfdJMouk2IyAO4R8/Frjr3c
 52S/WwdCDoCdKbgRstIYq0Y0S3waB4V9nmK0HkF1QDUCPCOdFL2KzmiQV
 J2SCGTboqX+tM+QcxZso/HgNUxMCetxkKcRQUHoZ65AVrVlLagr4YRH5p Q==;
X-CSE-ConnectionGUID: BwqYg89WTgGG3KgPwMkNBA==
X-CSE-MsgGUID: QnoB1q9uQhelv0fvxmbuSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65304496"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="65304496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:06 -0700
X-CSE-ConnectionGUID: rySd/u9MRACIawJ8NkEeUw==
X-CSE-MsgGUID: YhhgREr8TNKE0IRJMMSA6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="216083525"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:54:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 03/34] Revert "drm/xe/vf: Post migration,
 repopulate ring area for pending request"
Date: Wed,  1 Oct 2025 22:53:31 -0700
Message-Id: <20251002055402.1865880-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002055402.1865880-1-matthew.brost@intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
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

This reverts commit a0dda25d24e636df5c30a9370464b7cebc709faf.

Due to change in the VF migration recovery design this code
is not needed any more.

v3:
 - Add commit message (Michal / Lucas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 24 ------------------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  3 +--
 drivers/gpu/drm/xe/xe_guc_submit.c | 24 ------------------------
 drivers/gpu/drm/xe/xe_guc_submit.h |  2 --
 drivers/gpu/drm/xe/xe_sriov_vf.c   |  1 -
 5 files changed, 1 insertion(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 37b2b93b73d6..6bfaca424ca3 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1123,27 +1123,3 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
 
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
2.34.1

