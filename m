Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5BED277C9
	for <intel-xe@archiver.kernel.org>; Sat, 10 Jan 2026 01:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47BB10E234;
	Sat, 10 Jan 2026 01:27:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SPCbGf0Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0346710E2B8
 for <intel-xe@lists.freedesktop.org>; Sat, 10 Jan 2026 01:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768008468; x=1799544468;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7CSlw29ZQlhdLL5QeLYrBxylYFeEuq8mpabH/N/7i6s=;
 b=SPCbGf0Qr4FAg0fm0wK5ir8VQqVn30QZa6mfQSkEn8WFzzKtJc95oYoy
 7/oSo5Pe3HPgMe56mfJ9E1Pci2W09i3R+o5TnV8eHhdFdVKI+OqwPuSpl
 RSDyUvAWip4LosAkwHmgzSH1Cb/8FJuT1oeCTUtJnWHbLmsaAbudrK7ZR
 HYwbCDq4TIwcS+rQqnIPrr2ymmJLmaS5tWGmIWb2LYSutxo+Nesvn8fhN
 gcj7nsfy0mBM/Kh904Ynl5uywu1TpX+GxlQIKW/vBfg6mPiGjYBnoPbw6
 QIAnNLRycrexgqTUUgo/XzGl2CKKFm5ckWmIF+Zj2LrfbPZEb8/xWpk4j w==;
X-CSE-ConnectionGUID: Ki2SEGDURo2XBFxmznEcpQ==
X-CSE-MsgGUID: h430cDwVQlWviwkAZMW05Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73021814"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="73021814"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:47 -0800
X-CSE-ConnectionGUID: AGbmE7wZQb2WJstWMQb0YQ==
X-CSE-MsgGUID: Sj8w/D3jTCGGAVX8CnoJDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208132049"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 17:27:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v9 2/7] drm/xe: Stop abusing DRM scheduler internals
Date: Fri,  9 Jan 2026 17:27:34 -0800
Message-Id: <20260110012739.2888434-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260110012739.2888434-1-matthew.brost@intel.com>
References: <20260110012739.2888434-1-matthew.brost@intel.com>
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

Use new pending job list iterator and new helper functions in Xe to
avoid reaching into DRM scheduler internals.

Part of this change involves removing pending jobs debug information
from debugfs and devcoredump. As agreed, the pending job list should
only be accessed when the scheduler is stopped. However, it's not
straightforward to determine whether the scheduler is stopped from the
shared debugfs/devcoredump code path. Additionally, the pending job list
provides little useful information, as pending jobs can be inferred from
seqnos and ring head/tail positions. Therefore, this debug information
is being removed.

v4:
 - Add comment around DRM_GPU_SCHED_STAT_NO_HANG (Niranjana)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 33 +++-------
 drivers/gpu/drm/xe/xe_guc_submit.c       | 79 +++++-------------------
 drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
 drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
 drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
 6 files changed, 26 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
index f4f23317191f..9c8004d5dd91 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -7,7 +7,7 @@
 
 static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
 {
-	if (!READ_ONCE(sched->base.pause_submit))
+	if (!drm_sched_is_stopped(&sched->base))
 		queue_work(sched->base.submit_wq, &sched->work_process_msg);
 }
 
@@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
 	struct xe_sched_msg *msg;
 
-	if (READ_ONCE(sched->base.pause_submit))
+	if (drm_sched_is_stopped(&sched->base))
 		return;
 
 	msg = xe_sched_get_msg(sched);
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
index dceb2cd0ee5b..664c2db56af3 100644
--- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -56,12 +56,9 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
 	struct drm_sched_job *s_job;
 	bool restore_replay = false;
 
-	list_for_each_entry(s_job, &sched->base.pending_list, list) {
-		struct drm_sched_fence *s_fence = s_job->s_fence;
-		struct dma_fence *hw_fence = s_fence->parent;
-
+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
 		restore_replay |= to_xe_sched_job(s_job)->restore_replay;
-		if (restore_replay || (hw_fence && !dma_fence_is_signaled(hw_fence)))
+		if (restore_replay || !drm_sched_job_is_signaled(s_job))
 			sched->base.ops->run_job(s_job);
 	}
 }
@@ -72,14 +69,6 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
 	return drm_sched_invalidate_job(&job->drm, threshold);
 }
 
-static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
-					    struct xe_sched_job *job)
-{
-	spin_lock(&sched->base.job_list_lock);
-	list_add(&job->drm.list, &sched->base.pending_list);
-	spin_unlock(&sched->base.job_list_lock);
-}
-
 /**
  * xe_sched_first_pending_job() - Find first pending job which is unsignaled
  * @sched: Xe GPU scheduler
@@ -89,21 +78,13 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
 static inline
 struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
 {
-	struct xe_sched_job *job, *r_job = NULL;
-
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
-		struct drm_sched_fence *s_fence = job->drm.s_fence;
-		struct dma_fence *hw_fence = s_fence->parent;
+	struct drm_sched_job *job;
 
-		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
-			r_job = job;
-			break;
-		}
-	}
-	spin_unlock(&sched->base.job_list_lock);
+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
+		if (!drm_sched_job_is_signaled(job))
+			return to_xe_sched_job(job);
 
-	return r_job;
+	return NULL;
 }
 
 static inline int
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 45aa56b30a12..682698ce9593 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1374,7 +1374,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_gpu_scheduler *sched = &ge->sched;
-	struct xe_sched_job *job;
+	struct drm_sched_job *job;
 	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
@@ -1433,16 +1433,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
 
-	xe_hw_fence_irq_stop(q->fence_irq);
+	drm_sched_for_each_pending_job(job, &sched->base, NULL)
+		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
 
 	xe_sched_submission_start(sched);
-
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(job, &sched->base.pending_list, drm.list)
-		xe_sched_job_set_error(job, -ECANCELED);
-	spin_unlock(&sched->base.job_list_lock);
-
-	xe_hw_fence_irq_start(q->fence_irq);
 }
 
 #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
@@ -1570,7 +1564,7 @@ static enum drm_gpu_sched_stat
 guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 {
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
-	struct xe_sched_job *tmp_job;
+	struct drm_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1578,7 +1572,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(guc);
 	int err = -ETIME;
 	pid_t pid = -1;
-	int i = 0;
 	bool wedged = false, skip_timeout_check;
 
 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
@@ -1756,14 +1749,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 		__deregister_exec_queue(guc, q);
 	}
 
-	/* Stop fence signaling */
-	xe_hw_fence_irq_stop(q->fence_irq);
+	/* Mark all outstanding jobs as bad, thus completing them */
+	xe_sched_job_set_error(job, err);
+	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
+		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
 
-	/*
-	 * Fence state now stable, stop / start scheduler which cleans up any
-	 * fences that are complete
-	 */
-	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
 
 	if (xe_exec_queue_is_multi_queue(q))
@@ -1771,15 +1761,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	else
 		xe_guc_exec_queue_trigger_cleanup(q);
 
-	/* Mark all outstanding jobs as bad, thus completing them */
-	spin_lock(&sched->base.job_list_lock);
-	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
-		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
-	spin_unlock(&sched->base.job_list_lock);
-
-	/* Start fence signaling */
-	xe_hw_fence_irq_start(q->fence_irq);
-
+	/*
+	 * We want the job added back to the pending list so it gets freed; this
+	 * is what DRM_GPU_SCHED_STAT_NO_HANG does.
+	 */
 	return DRM_GPU_SCHED_STAT_RESET;
 
 sched_enable:
@@ -2754,11 +2739,12 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
 					   struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
-	struct xe_sched_job *job = NULL, *__job;
+	struct xe_sched_job *job = NULL;
+	struct drm_sched_job *s_job;
 	bool restore_replay = false;
 
-	list_for_each_entry(__job, &sched->base.pending_list, drm.list) {
-		job = __job;
+	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
+		job = to_xe_sched_job(s_job);
 		restore_replay |= job->restore_replay;
 		if (restore_replay) {
 			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
@@ -2882,7 +2868,7 @@ void xe_guc_submit_unpause_vf(struct xe_guc *guc)
 		 * created after resfix done.
 		 */
 		if (q->guc->id != index ||
-		    !READ_ONCE(q->guc->sched.base.pause_submit))
+		    !drm_sched_is_stopped(&q->guc->sched.base))
 			continue;
 
 		guc_exec_queue_unpause(guc, q);
@@ -3387,29 +3373,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		snapshot->multi_queue.primary = xe_exec_queue_multi_queue_primary(q)->guc->id;
 		snapshot->multi_queue.pos = q->multi_queue.pos;
 	}
-	spin_lock(&sched->base.job_list_lock);
-	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
-	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
-					       sizeof(struct pending_list_snapshot),
-					       GFP_ATOMIC);
-
-	if (snapshot->pending_list) {
-		struct xe_sched_job *job_iter;
-
-		i = 0;
-		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
-			snapshot->pending_list[i].seqno =
-				xe_sched_job_seqno(job_iter);
-			snapshot->pending_list[i].fence =
-				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
-			snapshot->pending_list[i].finished =
-				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
-				? 1 : 0;
-			i++;
-		}
-	}
-
-	spin_unlock(&sched->base.job_list_lock);
 
 	return snapshot;
 }
@@ -3473,13 +3436,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
 		drm_printf(p, "\tMulti queue primary GuC ID: %d\n", snapshot->multi_queue.primary);
 		drm_printf(p, "\tMulti queue position: %d\n", snapshot->multi_queue.pos);
 	}
-
-	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
-	     i++)
-		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
-			   snapshot->pending_list[i].seqno,
-			   snapshot->pending_list[i].fence,
-			   snapshot->pending_list[i].finished);
 }
 
 /**
@@ -3502,7 +3458,6 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
 			xe_lrc_snapshot_free(snapshot->lrc[i]);
 		kfree(snapshot->lrc);
 	}
-	kfree(snapshot->pending_list);
 	kfree(snapshot);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
index 25e29e85502c..5ccc5f959bb3 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
@@ -61,12 +61,6 @@ struct guc_submit_parallel_scratch {
 	u32 wq[WQ_SIZE / sizeof(u32)];
 };
 
-struct pending_list_snapshot {
-	u32 seqno;
-	bool fence;
-	bool finished;
-};
-
 /**
  * struct xe_guc_submit_exec_queue_snapshot - Snapshot for devcoredump
  */
@@ -147,11 +141,6 @@ struct xe_guc_submit_exec_queue_snapshot {
 		/** @valid: The exec queue is part of a multi queue group */
 		bool valid;
 	} multi_queue;
-
-	/** @pending_list_size: Size of the pending list snapshot array */
-	int pending_list_size;
-	/** @pending_list: snapshot of the pending list info */
-	struct pending_list_snapshot *pending_list;
 };
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
index f6057456e460..6b5bc67767d3 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.c
+++ b/drivers/gpu/drm/xe/xe_hw_fence.c
@@ -108,22 +108,6 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
 	irq_work_queue(&irq->work);
 }
 
-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq)
-{
-	spin_lock_irq(&irq->lock);
-	irq->enabled = false;
-	spin_unlock_irq(&irq->lock);
-}
-
-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq)
-{
-	spin_lock_irq(&irq->lock);
-	irq->enabled = true;
-	spin_unlock_irq(&irq->lock);
-
-	irq_work_queue(&irq->work);
-}
-
 void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 			  struct xe_hw_fence_irq *irq, const char *name)
 {
diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
index f13a1c4982c7..599492c13f80 100644
--- a/drivers/gpu/drm/xe/xe_hw_fence.h
+++ b/drivers/gpu/drm/xe/xe_hw_fence.h
@@ -17,8 +17,6 @@ void xe_hw_fence_module_exit(void);
 void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
 void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
-void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
-void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq);
 
 void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
 			  struct xe_hw_fence_irq *irq, const char *name);
-- 
2.34.1

