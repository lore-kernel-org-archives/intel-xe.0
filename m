Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE462CA0EE6
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 22:22:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52C210E9D2;
	Fri, 15 Aug 2025 22:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="itkc9v0/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2821F10E9CB
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 22:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755296541; x=1786832541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dbnRmq4EvQFVkWDlrlPgZyjWRFlutpadjAjDyug8VVU=;
 b=itkc9v0/MqpijArM9PM6hyLEGENdqL86EhhVfX+D1fT1G4IRLpzssqsG
 Ykye7jH2iHXKcEH3bGeB7Hc1qcogUjU2unk5waUEOZZxLQcHs6fHpXuXZ
 NDVQaYdB7XsbSW7VO/zrWyJX0zeZO069bRxqXERaHKXCF6A5S2MLdAr8D
 PLVr9ICR5yqYRH5keYrq0SsKbp0CEWja3nmvWyK4Rb/xoHqRBE2gLo567
 IfUgxKVJZG13BYDkaaQNxSMSSwaDraCMK3vsqRO7uFtmMN1LoJxBXsFKv
 pch+DJbRf8rdda1OpD8SHQCKURbhwuH7Plp5rIqfL5nXQuI0fTYXer8LV w==;
X-CSE-ConnectionGUID: gkVbNYBEQd22mvoZuvdNEA==
X-CSE-MsgGUID: g+LMbf5TRCmuvp53gFV/hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="61252015"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="61252015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:22:20 -0700
X-CSE-ConnectionGUID: qq6anBq+QuuRdC15TZ8K4Q==
X-CSE-MsgGUID: XaeE7w1oQzWDCsC0VP+E2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166330489"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 15:22:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, tomasz.lis@intel.com, stuart.summers@intel.com
Subject: [PATCH v2 3/3] drm/xe: Track LR jobs in DRM scheduler pending list
Date: Fri, 15 Aug 2025 15:22:15 -0700
Message-Id: <20250815222215.2547894-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250815222215.2547894-1-matthew.brost@intel.com>
References: <20250815222215.2547894-1-matthew.brost@intel.com>
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

VF resume requires jobs to remain pending so they can be replayed after
the VF comes back. Previously, LR job fences were intentionally signaled
immediately after submission to avoid the risk of exporting them, as
these fences do not naturally signal in a timely manner and could break
dma-fence contracts. A side effect of this approach was that LR jobs
were never added to the DRM scheduler’s pending list, preventing them
from being tracked for later resubmission.

We now avoid signaling LR job fences and ensure they are never exported;
Xe already guards against exporting these internal fences. With that
guarantee in place, we can safely track LR jobs in the scheduler’s
pending list so they are eligible for resubmission during VF resume (and
similar recovery paths).

An added benefit is that LR queues now gain the DRM scheduler’s built-in
flow control over ring usage rather than rejecting new jobs in the exec
IOCTL if the ring is full.

v2:
 - Ensure DRM scheduler TDR doesn't run for LR jobs
 - Stack variable for killed_or_banned_or_wedged

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c       | 12 ++-------
 drivers/gpu/drm/xe/xe_exec_queue.c | 19 -------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
 drivers/gpu/drm/xe/xe_guc_submit.c | 43 ++++++++++++++++++++----------
 4 files changed, 31 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 44364c042ad7..b29b6edd59e0 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -117,7 +117,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	u32 i, num_syncs, num_ufence = 0;
 	struct xe_sched_job *job;
 	struct xe_vm *vm;
-	bool write_locked, skip_retry = false;
+	bool write_locked;
 	ktime_t end = 0;
 	int err = 0;
 	struct xe_hw_engine_group *group;
@@ -256,12 +256,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
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
@@ -318,8 +312,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		xe_sched_job_init_user_fence(job, &syncs[i]);
 	}
 
-	if (xe_exec_queue_is_lr(q))
-		q->ring_ops->emit_job(job);
 	if (!xe_vm_in_lr_mode(vm))
 		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
 	xe_sched_job_push(job);
@@ -344,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 	drm_exec_fini(exec);
 err_unlock_list:
 	up_read(&vm->lock);
-	if (err == -EAGAIN && !skip_retry)
+	if (err == -EAGAIN)
 		goto retry;
 err_hw_exec_mode:
 	if (mode == EXEC_MODE_DMA_FENCE)
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 2d10a53f701d..6f901139e06e 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -816,25 +816,6 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
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
index 15ec852e7f7e..6ae11a1c7404 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -64,8 +64,6 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
 
 bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
 
-bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
-
 bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
 
 void xe_exec_queue_kill(struct xe_exec_queue *q);
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 75efbee5bc9d..7fac320c59c2 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -837,30 +837,31 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
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
 
 /**
@@ -926,7 +927,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
 		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
-		xe_sched_tdr_queue_imm(sched);
+		if (!xe_exec_queue_is_lr(q))
+			xe_sched_tdr_queue_imm(sched);
 		return;
 	}
 
@@ -1018,6 +1020,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_gpu_scheduler *sched = &ge->sched;
+	struct xe_sched_job *job;
 	bool wedged = false;
 
 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
@@ -1068,7 +1071,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
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
@@ -1139,7 +1151,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
 		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
 		set_exec_queue_banned(q);
 		xe_gt_reset_async(q->gt);
-		xe_sched_tdr_queue_imm(&q->guc->sched);
+		if (!xe_exec_queue_is_lr(q))
+			xe_sched_tdr_queue_imm(&q->guc->sched);
 	}
 }
 
@@ -1197,6 +1210,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	int i = 0;
 	bool wedged = false, skip_timeout_check;
 
+	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
+
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
 	 * immediately closed after last fence signaled. Add back to pending
-- 
2.34.1

