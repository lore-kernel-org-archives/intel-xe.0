Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB3CF9C5C
	for <intel-xe@archiver.kernel.org>; Sat, 21 Sep 2024 01:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F067910E124;
	Sat, 21 Sep 2024 01:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ic/vvKsP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA13B10E124
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Sep 2024 01:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726883702; x=1758419702;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+SpEkxi+fg5BZeeHBWX/7Cp6jIFWncLY4lyihY55o6c=;
 b=ic/vvKsPs8LgLP3oRatQ3GFNyIl2HKQJWmp9eDknc4uq5jv72T/U2mhj
 w/gwwGZt/enntCPc0a7rrC8SsSozBf2P1BHXaKrIJNoLtqL+9LLdZ1Uxz
 PyGjeHCHaVbK3c7ei/SIh93rq2RC4z9NQkhIgAr8wIkjtBjg4A69Hxkz4
 J7d9zuz/lx9PzWEEOT8iIncxlEdJHA9vOtPquzjycMgcMllQIKXlr3t0D
 NOX0DIC394VWviQs5AOjXO93Vd40iP5ojdZ0Sl9cdqmFFTu4M4/fWjrZv
 +mJamHJ8ywxDSIl7TDuCtAEfbZslA51oWYMHLGFQX6xrZXFzQ/0jxw/Vw g==;
X-CSE-ConnectionGUID: VdScb19tQF+/5rDlaN6Kdw==
X-CSE-MsgGUID: ozlD7mYzSAqTY9MQ92s4hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="36491080"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="36491080"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 18:55:01 -0700
X-CSE-ConnectionGUID: 394R3EtkSz+9Go+ovlctdA==
X-CSE-MsgGUID: +Xd7FAqiR2m9nTwkWPwPVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="75437911"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 18:55:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe: Take ref to job and job's fence in xe_sched_job_arm
Date: Fri, 20 Sep 2024 18:56:05 -0700
Message-Id: <20240921015605.2692906-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Fixes two possible races:

- Submission to hardware signals job's fence before dma_fence_get at end
  of run_job
- TDR fires and signals fence + free job before run_job completes

Taking refs in xe_sched_job_arm to job and job's fence solves these by
ensure all refs collected before entering the DRM scheduler. The refs
are dropped in run_job and DRM scheduler respectfully. Safe as once
xe_sched_job_arm is called execution of job through DRM sched is
guaranteed.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: <stable@vger.kernel.org> # v6.8+
---
 drivers/gpu/drm/xe/xe_execlist.c        |  4 +++-
 drivers/gpu/drm/xe/xe_guc_submit.c      | 11 +++++++----
 drivers/gpu/drm/xe/xe_sched_job.c       |  5 ++---
 drivers/gpu/drm/xe/xe_sched_job_types.h |  1 -
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f3b71fe7a96d..b70706c9caf2 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -309,11 +309,13 @@ execlist_run_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_exec_queue *q = job->q;
 	struct xe_execlist_exec_queue *exl = job->q->execlist;
+	struct dma_fence *fence = job->fence;
 
 	q->ring_ops->emit_job(job);
 	xe_execlist_make_active(exl);
+	xe_sched_job_put(job);
 
-	return dma_fence_get(job->fence);
+	return fence;
 }
 
 static void execlist_job_free(struct drm_sched_job *drm_job)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index fbbe6a487bbb..689279fdef80 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -766,6 +766,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	bool lr = xe_exec_queue_is_lr(q);
+	struct dma_fence *fence = NULL;
 
 	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
 		  exec_queue_banned(q) || exec_queue_suspended(q));
@@ -782,12 +783,14 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	if (lr) {
 		xe_sched_job_set_error(job, -EOPNOTSUPP);
-		return NULL;
-	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
-		return job->fence;
+		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
 	} else {
-		return dma_fence_get(job->fence);
+		fence = job->fence;
 	}
+
+	xe_sched_job_put(job);	/* Pairs with get from xe_sched_job_arm */
+
+	return fence;
 }
 
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index eeccc1c318ae..d0f4b908411f 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -280,16 +280,15 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		fence = &chain->base;
 	}
 
-	job->fence = fence;
+	xe_sched_job_get(job);			/* Pairs with put in run_job */
+	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
 	drm_sched_job_arm(&job->drm);
 }
 
 void xe_sched_job_push(struct xe_sched_job *job)
 {
-	xe_sched_job_get(job);
 	trace_xe_sched_job_exec(job);
 	drm_sched_entity_push_job(&job->drm);
-	xe_sched_job_put(job);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
index 0d3f76fb05ce..8ed95e1a378f 100644
--- a/drivers/gpu/drm/xe/xe_sched_job_types.h
+++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
@@ -40,7 +40,6 @@ struct xe_sched_job {
 	 * @fence: dma fence to indicate completion. 1 way relationship - job
 	 * can safely reference fence, fence cannot safely reference job.
 	 */
-#define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
 	struct dma_fence *fence;
 	/** @user_fence: write back value when BB is complete */
 	struct {
-- 
2.34.1

