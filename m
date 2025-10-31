Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07BBCCFA07
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 18:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609F510EC0B;
	Fri, 31 Oct 2025 18:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZnNDhtTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1F510E380
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 18:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761934197; x=1793470197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+CC3Jp6mVz98ii1KkWuB67nbrHbk6Al0DttsG+klhXE=;
 b=ZnNDhtTiH/DaGjdKeb63zjfQn+QMEY24Jsf0c4/n1Eg4ZPVPsDdLp/7B
 3bbKD3jg+/ezScA7y1V8X2AkS35HWmdjLTITcG7KLRDmCFV7dmfpZr6Z1
 nnGPYjQDFE0RPKTLGDy5xCUn/SEvfQxfDtFkjFR2SlsQe4EonjhRe/Tpy
 0rafd8TaSvM12hr6RqLljIkEa7Yv7jvrHmO/vcX6sKKYXGCWxBCem+DKC
 RjZ29iEf58vwjzcN4NeCWn+z2qOKBF0GuZdQ5yC6kobAXCHu1n6lSjd8N
 KWfygkSjJU9efUb/yDtfF4VIzvM9a9obhvqxDBX7j9v/Bd5PrUoSdDSKt g==;
X-CSE-ConnectionGUID: uWjmT+AiROSM0l2Gx0PgWQ==
X-CSE-MsgGUID: S3CgslWZSDKXNBEqE/t1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63305207"
X-IronPort-AV: E=Sophos;i="6.19,270,1754982000"; d="scan'208";a="63305207"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:56 -0700
X-CSE-ConnectionGUID: lPojNVFBR4uT7pcZtahdRw==
X-CSE-MsgGUID: RtnaWIQ8SHCcPoaVOuV9xw==
X-ExtLoop1: 1
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 11:09:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
Subject: [PATCH v6 6/6] drm/xe: Remove last fence dependency check from binds
 and execs
Date: Fri, 31 Oct 2025 11:09:49 -0700
Message-Id: <20251031180949.2968311-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031180949.2968311-1-matthew.brost@intel.com>
References: <20251031180949.2968311-1-matthew.brost@intel.com>
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

Eliminate redundant last fence dependency checks in exec and bind jobs,
as they are now equivalent to xe_exec_queue_is_idle. Simplify the code
by removing this dead logic.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c       |  4 ----
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 -----------------------
 drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
 drivers/gpu/drm/xe/xe_pt.c         |  7 -------
 drivers/gpu/drm/xe/xe_sched_job.c  | 17 -----------------
 drivers/gpu/drm/xe/xe_sched_job.h  |  1 -
 6 files changed, 54 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index bf71a2fe5351..4d81210e41f5 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -302,10 +302,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_put_job;
 
 	if (!xe_vm_in_lr_mode(vm)) {
-		err = xe_sched_job_last_fence_add_dep(job, vm);
-		if (err)
-			goto err_put_job;
-
 		err = xe_svm_notifier_lock_interruptible(vm);
 		if (err)
 			goto err_put_job;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index dce1ca08f8ec..ca2346bfa0cf 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1124,29 +1124,6 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
 	q->last_fence = dma_fence_get(fence);
 }
 
-/**
- * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
- * @q: The exec queue
- * @vm: The VM the engine does a bind or exec for
- *
- * Returns:
- * -ETIME if there exists an unsignalled last fence dependency, zero otherwise.
- */
-int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
-{
-	struct dma_fence *fence;
-	int err = 0;
-
-	fence = xe_exec_queue_last_fence_get(q, vm);
-	if (fence) {
-		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
-			0 : -ETIME;
-		dma_fence_put(fence);
-	}
-
-	return err;
-}
-
 /**
  * xe_exec_queue_tlb_inval_last_fence_put() - Drop ref to last TLB invalidation fence
  * @q: The exec queue
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 1ba7354b33d1..fda4d4f9bda8 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -88,8 +88,6 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
 							  struct xe_vm *vm);
 void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
 				  struct dma_fence *fence);
-int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
-				      struct xe_vm *vm);
 
 void xe_exec_queue_tlb_inval_last_fence_put(struct xe_exec_queue *q,
 					    struct xe_vm *vm,
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 8ef9bfcbd997..884127b4d97d 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1338,13 +1338,6 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
 			return err;
 	}
 
-	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
-		if (job)
-			err = xe_sched_job_last_fence_add_dep(job, vm);
-		else
-			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
-	}
-
 	for (i = 0; job && !err && i < vops->num_syncs; i++)
 		err = xe_sync_entry_add_deps(&vops->syncs[i], job);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index f1ba9c19e218..cb674a322113 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -297,23 +297,6 @@ void xe_sched_job_push(struct xe_sched_job *job)
 	xe_sched_job_put(job);
 }
 
-/**
- * xe_sched_job_last_fence_add_dep - Add last fence dependency to job
- * @job:job to add the last fence dependency to
- * @vm: virtual memory job belongs to
- *
- * Returns:
- * 0 on success, or an error on failing to expand the array.
- */
-int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
-{
-	struct dma_fence *fence;
-
-	fence = xe_exec_queue_last_fence_get(job->q, vm);
-
-	return drm_sched_job_add_dependency(&job->drm, fence);
-}
-
 /**
  * xe_sched_job_init_user_fence - Initialize user_fence for the job
  * @job: job whose user_fence needs an init
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index b467131b6d5f..1c1cb44216c3 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -58,7 +58,6 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
 void xe_sched_job_arm(struct xe_sched_job *job);
 void xe_sched_job_push(struct xe_sched_job *job);
 
-int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
 void xe_sched_job_init_user_fence(struct xe_sched_job *job,
 				  struct xe_sync_entry *sync);
 
-- 
2.34.1

