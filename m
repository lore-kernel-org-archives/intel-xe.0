Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BE7C10F07
	for <intel-xe@archiver.kernel.org>; Thu,  7 Dec 2023 05:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8C510E7E7;
	Thu,  7 Dec 2023 05:57:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6599910E7E6
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Dec 2023 05:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701928631; x=1733464631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wuZnpxldr1kGcyv0sGxtZDVUbPnHggyFua54ZUOZdes=;
 b=ie/D1IhqsASqTrdeR0FOT5KoCNan4TH6ISAyAbzLnnWLIqCY+VlrPeG1
 PNENFJaixdAt8zc6HulIalSMEy95DQcBE6fsNO+87hJ7LSrMP2o1Dd3C9
 mSuZ3/voNl51Payv4hU1v+wgtYUlrI25qjSabNlBMYTSig2Pvy6jL9Cw3
 HbOIuh1e0GQjdd1V8X4yb40HeDz7JA6eC7t4QscWTRBgS+D13s95/1ehC
 7VZ142n0Ozlv5xKicSqaZPomEO4UVJhvlxD2koEoACO01TBv2aw2cyjhj
 XWVwtVP2xJcmTfL1PfOOqL0LCJo862f+jajF7d5Qq195/6O9IIyl6LhUL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7540178"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7540178"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:57:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="895019861"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="895019861"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 21:57:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed,  6 Dec 2023 21:57:28 -0800
Message-Id: <20231207055729.438642-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231207055729.438642-1-matthew.brost@intel.com>
References: <20231207055729.438642-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 6/7] drm/xe: Add last fence as dependency for
 jobs on user exec queues
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

The last fence must be added as a dependency for jobs on user exec
queues as it is possible for the last fence to be a composite software
fence (unordered, ioctl with zero bb or binds) rather than hardware
fence (ordered, previous job on queue).

Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_exec.c       |  4 ++++
 drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c    | 14 +++++++++++---
 drivers/gpu/drm/xe/xe_sched_job.c  | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_sched_job.h  |  4 ++++
 5 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 438e34585e1e..92b0da6580e8 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -313,6 +313,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		goto err_put_job;
 
 	if (!xe_vm_in_lr_mode(vm)) {
+		err = xe_sched_job_last_fence_add_dep(job, vm);
+		if (err)
+			goto err_put_job;
+
 		err = down_read_interruptible(&vm->userptr.notifier_lock);
 		if (err)
 			goto err_put_job;
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 67e3fd9dfc5f..3911d14522ee 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -887,7 +887,7 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
 						    struct xe_vm *vm)
 {
 	if (q->flags & EXEC_QUEUE_FLAG_VM)
-		lockdep_assert_held_write(&vm->lock);
+		lockdep_assert_held(&vm->lock);
 	else
 		xe_vm_assert_held(vm);
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e8b567708ac0..ce14498b416a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1163,17 +1163,24 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
 	return fence;
 }
 
-static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
+static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
+			struct xe_sync_entry *syncs, u32 num_syncs)
 {
+	struct dma_fence *fence;
 	int i;
 
 	for (i = 0; i < num_syncs; i++) {
-		struct dma_fence *fence = syncs[i].fence;
+		fence = syncs[i].fence;
 
 		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
 				       &fence->flags))
 			return false;
 	}
+	if (q) {
+		fence = xe_exec_queue_last_fence_get(q, vm);
+		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
+			return false;
+	}
 
 	return true;
 }
@@ -1234,7 +1241,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
 
 	/* Use the CPU if no in syncs and engine is idle */
-	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
+	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
 		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
 							num_updates,
 							first_munmap_rebind,
@@ -1351,6 +1358,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
 			goto err_job;
 	}
 
+	err = xe_sched_job_last_fence_add_dep(job, vm);
 	for (i = 0; !err && i < num_syncs; i++)
 		err = xe_sync_entry_add_deps(&syncs[i], job);
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index b467d5bfa4ac..b7d714522ae1 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -260,3 +260,20 @@ void xe_sched_job_push(struct xe_sched_job *job)
 	drm_sched_entity_push_job(&job->drm);
 	xe_sched_job_put(job);
 }
+
+int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
+{
+	struct dma_fence *fence;
+
+	fence = xe_exec_queue_last_fence_get(job->q, vm);
+
+	/* Only wait on unsignaled software fences */
+	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) &&
+	    !(fence->context == job->drm.entity->fence_context ||
+	      fence->context == job->drm.entity->fence_context + 1)) {
+		dma_fence_get(fence);
+		return drm_sched_job_add_dependency(&job->drm, fence);
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
index 6ca1d426c036..34f475ba7f50 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.h
+++ b/drivers/gpu/drm/xe/xe_sched_job.h
@@ -8,6 +8,8 @@
 
 #include "xe_sched_job_types.h"
 
+struct xe_vm;
+
 #define XE_SCHED_HANG_LIMIT 1
 #define XE_SCHED_JOB_TIMEOUT LONG_MAX
 
@@ -54,6 +56,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
 void xe_sched_job_arm(struct xe_sched_job *job);
 void xe_sched_job_push(struct xe_sched_job *job);
 
+int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
+
 static inline struct xe_sched_job *
 to_xe_sched_job(struct drm_sched_job *drm)
 {
-- 
2.34.1

