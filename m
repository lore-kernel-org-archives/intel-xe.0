Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A43DCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 13:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7CF10E38A;
	Tue,  7 Oct 2025 13:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mzv3xSQT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD4D10E18C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 13:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759842311; x=1791378311;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8quQG2v7Br/n7IE5LvRqmV/btPpk3dblt1Vtz2/YH70=;
 b=Mzv3xSQTGnVilR1iLwXhGh+/uWUFR6fsDlsrbZE2+aDJOW1Nro0CG88E
 JaiiVEmWbtSpVwjDstHvNIZ1AuqryG8bxrgMGw179LvOqMIkKL/RlRASD
 JUc7eHIX2oYAM+UrVm1BBa6DirJeSGZaHmmZ+FrDPW7vqZI032hez5Z+e
 wOn6K8gH42ryF0hzPeJvzmmEZuF/ZXXDoLy61BE/6qDrPWiB74fVsx+kD
 udHjOvwgCpPP5bK2N0bCTapE1Gsp1aEQPdQytw3js43FMiBEG4+MQy+A6
 339dx6Sk2znPH33gqf4Famwg+QZ+pzmhMmRE1zcY6y/ETLoeiTSLNBBsd Q==;
X-CSE-ConnectionGUID: 1YxdVHqwQBGZdVq4oLwtbg==
X-CSE-MsgGUID: RRHixhqOQSWm7NjnlTue7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="64639823"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="64639823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:10 -0700
X-CSE-ConnectionGUID: e9SXJgOhTV+zNnPJ11Todg==
X-CSE-MsgGUID: DXY5iqVcRv+RAVNF6nZzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180576922"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 06:05:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v8 04/33] drm/xe: Track LR jobs in DRM scheduler pending list
Date: Tue,  7 Oct 2025 06:04:36 -0700
Message-Id: <20251007130505.2694829-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251007130505.2694829-1-matthew.brost@intel.com>
References: <20251007130505.2694829-1-matthew.brost@intel.com>
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

VF migration requires jobs to remain pending so they can be replayed
after the VF comes back. Previously, LR job fences were intentionally
signaled immediately after submission to avoid the risk of exporting
them, as these fences do not naturally signal in a timely manner and
could break dma-fence contracts. A side effect of this approach was that
LR jobs were never added to the DRM scheduler’s pending list, preventing
them from being tracked for later resubmission.

We now avoid signaling LR job fences and ensure they are never exported;
Xe already guards against exporting these internal fences. With that
guarantee in place, we can safely track LR jobs in the scheduler’s
pending list so they are eligible for resubmission during VF
post-migration recovery (and similar recovery paths).

An added benefit is that LR queues now gain the DRM scheduler’s built-in
flow control over ring usage rather than rejecting new jobs in the exec
IOCTL if the ring is full.

v2:
 - Ensure DRM scheduler TDR doesn't run for LR jobs
 - Stack variable for killed_or_banned_or_wedged
v4:
 - Clarify commit message (Tomasz)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c       | 12 ++-------
 drivers/gpu/drm/xe/xe_exec_queue.c | 19 -------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
 drivers/gpu/drm/xe/xe_guc_submit.c | 43 ++++++++++++++++++++----------
 4 files changed, 31 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 83897950f0da..0dc27476832b 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -124,7 +124,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	struct xe_validation_ctx ctx;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
-	bool write_locked, skip_retry = false;
+	bool write_locked;
 	int err = 0;
 	struct xe_hw_engine_group *group;
 	enum xe_hw_engine_group_execution_mode mode, previous_mode;
@@ -266,12 +266,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_exec;
 	}
 
-	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
-		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
-		skip_retry = true;
-		goto err_exec;
-	}
-
 	if (xe_exec_queue_uses_pxp(q)) {
 		err = xe_vm_validate_protected(q->vm);
 		if (err)
@@ -328,8 +322,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_sched_job_init_user_fence(job, &syncs[i]);
 	}
 
-	if (xe_exec_queue_is_lr(q))
-		q->ring_ops->emit_job(job);
 	if (!xe_vm_in_lr_mode(vm))
 		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -355,7 +347,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_validation_ctx_fini(&ctx);
 err_unlock_list:
 	up_read(&vm->lock);
-	if (err == -EAGAIN && !skip_retry)
+	if (err == -EAGAIN)
 		goto retry;
 err_hw_exec_mode:
 	if (mode == EXEC_MODE_DMA_FENCE)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index df82463b19f6..7621089a47fe 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -850,25 +850,6 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
 		!(q->flags & EXEC_QUEUE_FLAG_VM);
 }
 
-static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
-{
-	return q->lrc[0]->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc[0]) - 1;
-}
-
-/**
- * xe_exec_queue_ring_full() - Whether an exec_queue's ring is full
- * @q: The exec_queue
- *
- * Return: True if the exec_queue's ring is full, false otherwise.
- */
-bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
-{
-	struct xe_lrc *lrc = q->lrc[0];
-	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
-
-	return xe_exec_queue_num_job_inflight(q) >= max_job;
-}
-
 /**
  * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
  * @q: The exec_queue
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 8821ceb838d0..a4dfbe858bda 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -64,8 +64,6 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
 
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
-bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
-
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
 
 void xe_exec_queue_kill(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 13746f32b231..3a534d93505f 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -851,30 +851,31 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
-	struct dma_fence *fence = NULL;
-	bool lr = xe_exec_queue_is_lr(q);
+	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
+		exec_queue_killed_or_banned_or_wedged(q);
 
 	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		     exec_queue_banned(q) || exec_queue_suspended(q));
 
 	trace_xe_sched_job_run(job);
 
-	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
+	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
 			register_exec_queue(q, GUC_CONTEXT_NORMAL);
-		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
-			q->ring_ops->emit_job(job);
+		q->ring_ops->emit_job(job);
 		submit_exec_queue(q);
 	}
 
-	if (lr) {
-		xe_sched_job_set_error(job, -EOPNOTSUPP);
-		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
-	} else {
-		fence = job->fence;
-	}
+	/*
+	 * We don't care about job-fence ordering in LR VMs because these fences
+	 * are never exported; they are used solely to keep jobs on the pending
+	 * list. Once a queue enters an error state, there's no need to track
+	 * them.
+	 */
+	if (killed_or_banned_or_wedged && lr)
+		xe_sched_job_set_error(job, -ECANCELED);
 
-	return fence;
+	return job->fence;
 }
 
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
@@ -916,7 +917,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
 		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
-		xe_sched_tdr_queue_imm(sched);
+		if (!xe_exec_queue_is_lr(q))
+			xe_sched_tdr_queue_imm(sched);
 		return;
 	}
 
@@ -1008,6 +1010,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_gpu_scheduler *sched = &ge->sched;
+	struct xe_sched_job *job;
 	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
@@ -1058,7 +1061,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
 
+	xe_hw_fence_irq_stop(q->fence_irq);
+
 	xe_sched_submission_start(sched);
+
+	spin_lock(&sched->base.job_list_lock);
+	list_for_each_entry(job, &sched->base.pending_list, drm.list)
+		xe_sched_job_set_error(job, -ECANCELED);
+	spin_unlock(&sched->base.job_list_lock);
+
+	xe_hw_fence_irq_start(q->fence_irq);
 }
 
 #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
@@ -1129,7 +1141,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
 		set_exec_queue_banned(q);
 		xe_gt_reset_async(q->gt);
-		xe_sched_tdr_queue_imm(&q->guc->sched);
+		if (!xe_exec_queue_is_lr(q))
+			xe_sched_tdr_queue_imm(&q->guc->sched);
 	}
 }
 
@@ -1187,6 +1200,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 	bool wedged = false, skip_timeout_check;
 
+	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
+
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled. Add back to pending
-- 
2.34.1

