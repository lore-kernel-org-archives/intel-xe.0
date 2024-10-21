Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A06D0E6C5
	for <intel-xe@archiver.kernel.org>; Mon, 21 Oct 2024 17:34:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D9D10E573;
	Mon, 21 Oct 2024 17:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNHAnDww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1CE10E571
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Oct 2024 17:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729532087; x=1761068087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RC2qriCiOx+o261U7iORljqJBiKwecdJuo7pRorPelM=;
 b=SNHAnDwwKIyrIizfFnuTykvfMAB9GEYv636fWBIBykjNwR/MDCm5VKz6
 PMbvo78zp+OwVzpUWJVqWwJ/T86ehMAh8mTspFnFXOJWc+ZEev7OvOIAL
 8uUpSnSZk4wpDRGzkpRGlYXxI9dxmq8538CdoJi4UMM0NfgYi/iAJ6iS9
 kf19ooGuybatl1i+H4zn990GoLTpkM2bS4Cwu/o04a6VAwFv6AwTMz+xz
 FQ4qaA+OdG98M6Z/AsnLJ/TDU4u5c5MWmE/49SwJt6B5dxzlZR2cXmArH
 2TOmajjW6ayMYYOtfvTs7Bodx29Zkcng9gS1waZX8gAZL1MFwaQfcxgGA Q==;
X-CSE-ConnectionGUID: VT+SPBtZTUW6Ye3lASpovg==
X-CSE-MsgGUID: 7/rqomLcR66mx0X5rVUU3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="32959200"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="32959200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:34:46 -0700
X-CSE-ConnectionGUID: swMH9t6FQFqH7EcvRgdvTg==
X-CSE-MsgGUID: SH6wMzNDToylOgNOtC0CPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79937295"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 10:34:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] drm/xe: Take ref to job's fence in arm
Date: Mon, 21 Oct 2024 10:35:12 -0700
Message-Id: <20241021173512.1584248-1-matthew.brost@intel.com>
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

Take ref to job's fence in arm rather than run job. This ref is owned by
the drm scheduler so it makes sense to take the ref before handing over
the job to the scheduler. Also removes an atomic from the run job path.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++----
 drivers/gpu/drm/xe/xe_sched_job.c       | 2 +-
 drivers/gpu/drm/xe/xe_sched_job_types.h | 1 -
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f3b71fe7a96d..a8c416a48812 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -313,7 +313,7 @@ execlist_run_job(struct drm_sched_job *drm_job)
 	q->ring_ops->emit_job(job);
 	xe_execlist_make_active(exl);
 
-	return dma_fence_get(job->fence);
+	return job->fence;
 }
 
 static void execlist_job_free(struct drm_sched_job *drm_job)
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 0b81972ff651..25f51a947c3a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -717,6 +717,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 	struct xe_exec_queue *q = job->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
+	struct dma_fence *fence = NULL;
 	bool lr = xe_exec_queue_is_lr(q);
 
 	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
@@ -734,12 +735,12 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
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
+	return fence;
 }
 
 static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index eeccc1c318ae..1905ca590965 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -280,7 +280,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
 		fence = &chain->base;
 	}
 
-	job->fence = fence;
+	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
 	drm_sched_job_arm(&job->drm);
 }
 
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

