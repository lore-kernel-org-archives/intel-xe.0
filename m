Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D9EC07545
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 04:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3A710E547;
	Wed, 25 Oct 2023 04:09:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC5910E547
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 04:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698206953; x=1729742953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zEVuUO3+7K/US7zUgA55iKhQIDNcBBVoP1E311vCZ0=;
 b=j6Dgv/e3gh0lAGDI2QTbRmof22HAnluXMs3rrb6EU9jDhkmpjJ1oOtu0
 XClaRC3ASkq8a8P9qWRIBNKeS2bej6le7YLRUc5/xfvNMi0D7sGIbgJQS
 XXWb8xm4SF08vCTWUjDPGtlpKudRyll2dUQwZ4WVSBDZWBcm1K2kBfpLh
 /q5KB/jOSxCmUHpHJc4ZygkDFiaqTZBu89+aOIx7f4yNzlfVCPZU/cRCw
 K7eGzEgxQq7A1jj4PG+uDEIHy/zkvd5HjCvDlktjBIUnknLx+Z2ZioRJK
 W7WqR7C4Wk6luhkERcWYgfmo+iqW05n3Iftpkwpc3e0XN5u9gg603jMx6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="453705243"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; d="scan'208";a="453705243"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 21:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="829078460"
X-IronPort-AV: E=Sophos;i="6.03,249,1694761200"; d="scan'208";a="829078460"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 21:04:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 24 Oct 2023 21:05:20 -0700
Message-Id: <20231025040520.1236213-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH] drm/xe: Update to upstream DRM scheduler code
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

The largest change is the message interface has been removed from the
DRM scheduler. Xe still needs a message interface so it is implemented
in the Xe driver by adding a Xe scheduler layer.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c  |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |   6 +-
 drivers/gpu/drm/lima/lima_sched.c            |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c   |   4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c         |   5 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c      |   6 +-
 drivers/gpu/drm/panfrost/panfrost_job.c      |   6 +-
 drivers/gpu/drm/scheduler/sched_entity.c     |  97 +---
 drivers/gpu/drm/scheduler/sched_fence.c      |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c       | 556 +++++++++----------
 drivers/gpu/drm/v3d/v3d_sched.c              |  27 +-
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   3 +
 drivers/gpu/drm/xe/xe_execlist.c             |   5 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        | 101 ++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  73 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  58 ++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 148 +++--
 drivers/gpu/drm/xe/xe_migrate.c              |   2 +-
 drivers/gpu/drm/xe/xe_trace.h                |  13 +-
 include/drm/gpu_scheduler.h                  |  89 +--
 24 files changed, 688 insertions(+), 541 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 78623eaeb90d..411187e7aef6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1661,7 +1661,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 
 		if (!ring || !ring->sched.ready)
 			continue;
-		drm_sched_run_wq_stop(&ring->sched);
+		drm_sched_wqueue_stop(&ring->sched);
 	}
 
 	seq_puts(m, "run ib test:\n");
@@ -1677,7 +1677,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 
 		if (!ring || !ring->sched.ready)
 			continue;
-		drm_sched_run_wq_start(&ring->sched);
+		drm_sched_wqueue_start(&ring->sched);
 	}
 
 	up_write(&adev->reset_domain->sem);
@@ -1915,7 +1915,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		goto pro_end;
 
 	/* stop the scheduler */
-	drm_sched_run_wq_stop(&ring->sched);
+	drm_sched_wqueue_stop(&ring->sched);
 
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
@@ -1949,7 +1949,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 failure:
 	/* restart the scheduler */
-	drm_sched_run_wq_start(&ring->sched);
+	drm_sched_wqueue_start(&ring->sched);
 
 	up_read(&adev->reset_domain->sem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 501a7f71bcb6..950dc8e498f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2279,11 +2279,10 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 			break;
 		}
 
-		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, 1, NULL,
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
-				   DRM_SCHED_POLICY_DEFAULT,
 				   adev->dev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 78476bc75b4e..b3e199c3fd72 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -326,7 +326,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 
 	/* Signal all jobs not yet scheduled */
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
 			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 3646f995ca94..396334984e4d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -134,11 +134,11 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 {
 	int ret;
 
-	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
+	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
-			     gpu->dev);
+			     dev_name(gpu->dev), gpu->dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 465d4bf3882b..23a6276f1332 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,11 +488,11 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
+	return drm_sched_init(&pipe->base, &lima_sched_ops,
+			      DRM_SCHED_PRIORITY_COUNT, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
-			      pipe->ldev->dev);
+			      NULL, name, pipe->ldev->dev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 3891b629248c..223b5af1f93b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -809,7 +809,7 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 	 */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		drm_sched_run_wq_stop(sched);
+		drm_sched_wqueue_stop(sched);
 	}
 }
 
@@ -819,7 +819,7 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		drm_sched_run_wq_start(sched);
+		drm_sched_wqueue_start(sched);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 813bff7f0c8f..935154979fc2 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -94,10 +94,11 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
-	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT, NULL,
 			     num_hw_submissions, 0, sched_timeout,
 			     NULL, NULL, to_msm_bo(ring->bo)->name,
-			     DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
+			     gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3cb0033dccf9..82104380d243 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -435,10 +435,10 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 	if (!drm->sched_wq)
 		return -ENOMEM;
 
-	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
+	return drm_sched_init(sched, &nouveau_sched_ops,
+			      DRM_SCHED_PRIORITY_COUNT, NULL,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
-			      NULL, NULL, "nouveau_sched",
-			      DRM_SCHED_POLICY_DEFAULT, drm->dev->dev);
+			      NULL, NULL, "nouveau_sched", drm->dev->dev);
 }
 
 void nouveau_sched_fini(struct nouveau_drm *drm)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index ad36bf3a4699..e33d4398da8e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -831,12 +831,12 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
 		ret = drm_sched_init(&js->queue[j].sched,
-				     &panfrost_sched_ops, NULL,
+				     &panfrost_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT, NULL,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
-				     pfdev->dev);
+				     NULL, "pan_js", pfdev->dev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 1dec97caaba3..409e4256f6e7 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -33,20 +33,6 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-static bool bad_policies(struct drm_gpu_scheduler **sched_list,
-			 unsigned int num_sched_list)
-{
-	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
-	unsigned int i;
-
-	/* All schedule policies must match */
-	for (i = 1; i < num_sched_list; ++i)
-		if (sched_policy != sched_list[i]->sched_policy)
-			return true;
-
-	return false;
-}
-
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -76,14 +62,12 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty)
 {
-	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
-	    bad_policies(sched_list, num_sched_list))
+	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
 	INIT_LIST_HEAD(&entity->list);
 	entity->rq = NULL;
-	entity->single_sched = NULL;
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
@@ -91,16 +75,19 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if (num_sched_list) {
-		if (sched_list[0]->sched_policy !=
-		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
-			entity->rq = &sched_list[0]->sched_rq[entity->priority];
-		} else {
-			if (num_sched_list != 1 || sched_list[0]->single_entity)
-				return -EINVAL;
-			sched_list[0]->single_entity = entity;
-			entity->single_sched = sched_list[0];
-		}
+	if (!sched_list[0]->sched_rq) {
+		/* Warn drivers not to do this and to fix their DRM
+		 * calling order.
+		 */
+		pr_warn("%s: called with uninitialized scheduler\n", __func__);
+	} else if (num_sched_list) {
+		/* The "priority" of an entity cannot exceed the number
+		 * of run-queues of a scheduler.
+		 */
+		if (entity->priority >= sched_list[0]->num_rqs)
+			entity->priority = max_t(u32, sched_list[0]->num_rqs,
+						 DRM_SCHED_PRIORITY_MIN);
+		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
 
 	init_completion(&entity->entity_idle);
@@ -134,8 +121,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
 				    unsigned int num_sched_list)
 {
-	WARN_ON(!num_sched_list || !sched_list ||
-		!!entity->single_sched);
+	WARN_ON(!num_sched_list || !sched_list);
 
 	entity->sched_list = sched_list;
 	entity->num_sched_list = num_sched_list;
@@ -242,15 +228,13 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
 	struct dma_fence *prev;
-	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq && !single_entity)
+	if (!entity->rq)
 		return;
 
 	spin_lock(&entity->rq_lock);
 	entity->stopped = true;
-	if (!single_entity)
-		drm_sched_rq_remove_entity(entity->rq, entity);
+	drm_sched_rq_remove_entity(entity->rq, entity);
 	spin_unlock(&entity->rq_lock);
 
 	/* Make sure this entity is not used by the scheduler at the moment */
@@ -272,20 +256,6 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	dma_fence_put(prev);
 }
 
-/**
- * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
- * @entity: scheduler entity
- *
- * Returns GPU scheduler for the entity
- */
-struct drm_gpu_scheduler *
-drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
-{
-	bool single_entity = !!entity->single_sched;
-
-	return single_entity ? entity->single_sched : entity->rq->sched;
-}
-
 /**
  * drm_sched_entity_flush - Flush a context entity
  *
@@ -303,12 +273,11 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	struct drm_gpu_scheduler *sched;
 	struct task_struct *last_user;
 	long ret = timeout;
-	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq && !single_entity)
+	if (!entity->rq)
 		return 0;
 
-	sched = drm_sched_entity_to_scheduler(entity);
+	sched = entity->rq->sched;
 	/**
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
@@ -401,7 +370,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
+	drm_sched_wakeup_if_can_queue(entity->rq->sched);
 }
 
 /**
@@ -415,8 +384,6 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority)
 {
-	WARN_ON(!!entity->single_sched);
-
 	spin_lock(&entity->rq_lock);
 	entity->priority = priority;
 	spin_unlock(&entity->rq_lock);
@@ -429,7 +396,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
+	struct drm_gpu_scheduler *sched = entity->rq->sched;
 	struct dma_fence *fence = entity->dependency;
 	struct drm_sched_fence *s_fence;
 
@@ -531,8 +498,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
-	    DRM_SCHED_POLICY_FIFO) {
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -555,8 +521,6 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
-	WARN_ON(!!entity->single_sched);
-
 	/* single possible engine and already selected */
 	if (!entity->sched_list)
 		return;
@@ -581,7 +545,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->rq_lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? &sched->sched_rq[entity->priority] : NULL;
+	rq = sched ? sched->sched_rq[entity->priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
@@ -606,13 +570,11 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool single_entity = !!entity->single_sched;
 	bool first;
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
-	if (!single_entity)
-		atomic_inc(entity->rq->sched->score);
+	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
 	/*
@@ -625,10 +587,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 	/* first job wakes up scheduler */
 	if (first) {
-		struct drm_gpu_scheduler *sched =
-			drm_sched_entity_to_scheduler(entity);
-		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
-
 		/* Add the entity to the run queue */
 		spin_lock(&entity->rq_lock);
 		if (entity->stopped) {
@@ -638,14 +596,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			return;
 		}
 
-		if (!single_entity)
-			drm_sched_rq_add_entity(entity->rq, entity);
+		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
-		if (fifo)
+		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup_if_can_queue(sched);
+		drm_sched_wakeup_if_can_queue(entity->rq->sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index f6b926f5e188..06cedfe4b486 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
-	fence->sched = drm_sched_entity_to_scheduler(entity);
+	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0626aa6f7b70..ebea02526a7a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -32,8 +32,7 @@
  * backend operations to the scheduler like submitting a job to hardware run queue,
  * returning the dependencies of a job etc.
  *
- * The organisation of the scheduler is the following for scheduling policies
- * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
+ * The organisation of the scheduler is the following:
  *
  * 1. Each hw run queue has one scheduler
  * 2. Each scheduler has multiple run queues with different priorities
@@ -42,22 +41,7 @@
  * 4. Entities themselves maintain a queue of jobs that will be scheduled on
  *    the hardware.
  *
- * The organisation of the scheduler is the following for scheduling policy
- * DRM_SCHED_POLICY_SINGLE_ENTITY:
- *
- * 1. One to one relationship between scheduler and entity
- * 2. No priorities implemented per scheduler (single job queue)
- * 3. No run queues in scheduler rather jobs are directly dequeued from entity
- * 4. The entity maintains a queue of jobs that will be scheduled on the
- * hardware
- *
- * The jobs in a entity are always scheduled in the order that they were pushed
- * regardless of scheduling policy.
- *
- * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
- * when the KMD is scheduling directly on the hardware while a scheduling policy
- * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
- * firmware scheduler.
+ * The jobs in a entity are always scheduled in the order that they were pushed.
  *
  * Note that once a job was taken from the entities queue and pushed to the
  * hardware, i.e. the pending queue, the entity must not be referenced anymore
@@ -82,14 +66,14 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
+int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
-MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
-module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
+module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
@@ -112,8 +96,6 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
 
 void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 {
-	WARN_ON(!!entity->single_sched);
-
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
@@ -144,8 +126,6 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 			      struct drm_sched_rq *rq)
 {
-	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
-
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
@@ -164,8 +144,6 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity)
 {
-	WARN_ON(!!entity->single_sched);
-
 	if (!list_empty(&entity->list))
 		return;
 
@@ -188,8 +166,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
-	WARN_ON(!!entity->single_sched);
-
 	if (list_empty(&entity->list))
 		return;
 
@@ -201,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
 
-	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 		drm_sched_rq_remove_fifo_locked(entity);
 
 	spin_unlock(&rq->lock);
@@ -280,50 +256,90 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * drm_sched_run_wq_stop - stop scheduler run worker
- *
- * @sched: scheduler instance to stop run worker
+ * drm_sched_run_job_queue - enqueue scheduler submission
+ * drm_sched_run_job_queue - enqueue run-job work
+ * @sched: scheduler instance
  */
-void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched)
+static void drm_sched_run_job_queue(struct drm_gpu_scheduler *sched)
 {
-	sched->pause_run_wq = true;
-	smp_wmb();
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_run_job);
+}
 
-	cancel_work_sync(&sched->work_run);
+/**
+ * drm_sched_can_queue -- Can we queue more to the hardware?
+ * @sched: scheduler instance
+ *
+ * Return true if we can push more jobs to the hw, otherwise false.
+ */
+static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
+{
+	return atomic_read(&sched->hw_rq_count) <
+		sched->hw_submission_limit;
 }
-EXPORT_SYMBOL(drm_sched_run_wq_stop);
 
 /**
- * drm_sched_run_wq_start - start scheduler run worker
+ * drm_sched_select_entity - Select next entity to process
  *
- * @sched: scheduler instance to start run worker
+ * @sched: scheduler instance
+ *
+ * Returns the entity to process or NULL if none are found.
  */
-void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched)
+static struct drm_sched_entity *
+drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 {
-	sched->pause_run_wq = false;
-	smp_wmb();
+	struct drm_sched_entity *entity;
+	int i;
+
+	if (!drm_sched_can_queue(sched))
+		return NULL;
 
-	queue_work(sched->run_wq, &sched->work_run);
+	/* Kernel run queue has higher priority than normal run queue*/
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
+		if (entity)
+			break;
+	}
+
+	return entity;
 }
-EXPORT_SYMBOL(drm_sched_run_wq_start);
 
 /**
- * drm_sched_run_wq_queue - queue scheduler run worker
- *
- * @sched: scheduler instance to queue run worker
+ * drm_sched_run_job_queue_if_ready - enqueue run-job work if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+{
+	if (drm_sched_select_entity(sched))
+		drm_sched_run_job_queue(sched);
+}
+
+/**
+ * drm_sched_free_job_queue - enqueue free-job work
+ * @sched: scheduler instance
  */
-static void drm_sched_run_wq_queue(struct drm_gpu_scheduler *sched)
+static void drm_sched_free_job_queue(struct drm_gpu_scheduler *sched)
 {
-	smp_rmb();
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_free_job);
+}
 
-	/*
-	 * Try not to schedule work if pause_run_wq set but not the end of world
-	 * if we do as either it will be cancelled by the above
-	 * cancel_work_sync, or drm_sched_main turns into a NOP while
-	 * pause_run_wq is set.
-	 */
-	if (!sched->pause_run_wq)
-		queue_work(sched->run_wq, &sched->work_run);
+/**
+ * drm_sched_free_job_queue_if_done - enqueue free-job work if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_free_job_queue_if_done(struct drm_gpu_scheduler *sched)
+{
+	struct drm_sched_job *job;
+
+	spin_lock(&sched->job_list_lock);
+	job = list_first_entry_or_null(&sched->pending_list,
+				       struct drm_sched_job, list);
+	if (job && dma_fence_is_signaled(&job->s_fence->finished))
+		drm_sched_free_job_queue(sched);
+	spin_unlock(&sched->job_list_lock);
 }
 
 /**
@@ -345,7 +361,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_run_wq_queue(sched);
+	drm_sched_free_job_queue(sched);
 }
 
 /**
@@ -369,28 +385,35 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
  */
 static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
 {
+	lockdep_assert_held(&sched->job_list_lock);
+
 	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
 	    !list_empty(&sched->pending_list))
-		queue_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
+}
+
+static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
+{
+	spin_lock(&sched->job_list_lock);
+	drm_sched_start_timeout(sched);
+	spin_unlock(&sched->job_list_lock);
 }
 
 /**
- * drm_sched_set_timeout - set timeout for reset worker
+ * drm_sched_tdr_queue_imm: - immediately start job timeout handler
  *
- * @sched: scheduler instance to set and (re)-start the worker for
- * @timeout: timeout period
+ * @sched: scheduler for which the timeout handling should be started.
  *
- * Set and (re)-start the timeout for the given scheduler.
+ * Start timeout handling immediately for the named scheduler.
  */
-void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout)
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
 {
 	spin_lock(&sched->job_list_lock);
-	sched->timeout = timeout;
-	cancel_delayed_work(&sched->work_tdr);
+	sched->timeout = 0;
 	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
-EXPORT_SYMBOL(drm_sched_set_timeout);
+EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
 
 /**
  * drm_sched_fault - immediately start timeout handler
@@ -504,11 +527,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (status != DRM_GPU_SCHED_STAT_ENODEV)
+		drm_sched_start_timeout_unlocked(sched);
 }
 
 /**
@@ -527,7 +547,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
 
-	drm_sched_run_wq_stop(sched);
+	drm_sched_wqueue_stop(sched);
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
@@ -629,18 +649,15 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 				drm_sched_job_done(s_job, fence->error);
 			else if (r)
 				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
+					      r);
 		} else
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
-	drm_sched_run_wq_start(sched);
+	if (full_recovery)
+		drm_sched_start_timeout_unlocked(sched);
 
-	if (full_recovery) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	drm_sched_wqueue_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -720,8 +737,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq && !entity->single_sched)
+	if (!entity->rq) {
+		/* This will most likely be followed by missing frames
+		 * or worse--a blank screen--leave a trail in the
+		 * logs, so this can be debugged easier.
+		 */
+		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
 		return -ENOENT;
+	}
 
 	job->entity = entity;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
@@ -753,16 +776,13 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *entity = job->entity;
-	bool single_entity = !!entity->single_sched;
 
 	BUG_ON(!entity);
-	if (!single_entity)
-		drm_sched_entity_select_rq(entity);
-	sched = drm_sched_entity_to_scheduler(entity);
+	drm_sched_entity_select_rq(entity);
+	sched = entity->rq->sched;
 
 	job->sched = sched;
-	if (!single_entity)
-		job->s_priority = entity->rq - sched->sched_rq;
+	job->s_priority = entity->priority;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
@@ -790,13 +810,6 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 	if (!fence)
 		return 0;
 
-	/* if it's a fence from us it's guaranteed to be earlier */
-	if (fence->context == job->entity->fence_context ||
-	    fence->context == job->entity->fence_context + 1) {
-		dma_fence_put(fence);
-		return 0;
-	}
-
 	/* Deduplicate if we already depend on a fence from the same context.
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
@@ -945,18 +958,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
-/**
- * drm_sched_can_queue -- Can we queue more to the hardware?
- * @sched: scheduler instance
- *
- * Return true if we can push more jobs to the hw, otherwise false.
- */
-static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
-{
-	return atomic_read(&sched->hw_rq_count) <
-		sched->hw_submission_limit;
-}
-
 /**
  * drm_sched_wakeup_if_can_queue - Wake up the scheduler
  * @sched: scheduler instance
@@ -966,42 +967,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		drm_sched_run_wq_queue(sched);
-}
-
-/**
- * drm_sched_select_entity - Select next entity to process
- *
- * @sched: scheduler instance
- *
- * Returns the entity to process or NULL if none are found.
- */
-static struct drm_sched_entity *
-drm_sched_select_entity(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_entity *entity;
-	int i;
-
-	if (!drm_sched_can_queue(sched))
-		return NULL;
-
-	if (sched->single_entity) {
-		if (drm_sched_entity_is_ready(sched->single_entity))
-			return sched->single_entity;
-
-		return NULL;
-	}
-
-	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
-		if (entity)
-			break;
-	}
-
-	return entity;
+		drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -1033,8 +999,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
-			next->s_fence->scheduled.timestamp =
-				job->s_fence->finished.timestamp;
+			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+				     &next->s_fence->scheduled.flags))
+				next->s_fence->scheduled.timestamp =
+					job->s_fence->scheduled.timestamp;
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1084,125 +1052,83 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 EXPORT_SYMBOL(drm_sched_pick_best);
 
 /**
- * drm_sched_add_msg - add scheduler message
+ * drm_sched_free_job_work - worker to call free_job
  *
- * @sched: scheduler instance
- * @msg: message to be added
- *
- * Can and will pass an jobs waiting on dependencies or in a runnable queue.
- * Messages processing will stop if schedule run wq is stopped and resume when
- * run wq is started.
+ * @w: free job work
  */
-void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_msg *msg)
+static void drm_sched_free_job_work(struct work_struct *w)
 {
-	spin_lock(&sched->job_list_lock);
-	list_add_tail(&msg->link, &sched->msgs);
-	spin_unlock(&sched->job_list_lock);
+	struct drm_gpu_scheduler *sched =
+		container_of(w, struct drm_gpu_scheduler, work_free_job);
+	struct drm_sched_job *cleanup_job;
 
-	/*
-	 * Same as above in drm_sched_run_wq_queue, try to kick worker if
-	 * paused, harmless if this races
-	 */
-	if (!sched->pause_run_wq)
-		queue_work(sched->run_wq, &sched->work_run);
-}
-EXPORT_SYMBOL(drm_sched_add_msg);
+	if (READ_ONCE(sched->pause_submit))
+		return;
 
-/**
- * drm_sched_get_msg - get scheduler message
- *
- * @sched: scheduler instance
- *
- * Returns NULL or message
- */
-static struct drm_sched_msg *
-drm_sched_get_msg(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_msg *msg;
+	cleanup_job = drm_sched_get_cleanup_job(sched);
+	if (cleanup_job) {
+		sched->ops->free_job(cleanup_job);
 
-	spin_lock(&sched->job_list_lock);
-	msg = list_first_entry_or_null(&sched->msgs,
-				       struct drm_sched_msg, link);
-	if (msg)
-		list_del(&msg->link);
-	spin_unlock(&sched->job_list_lock);
-
-	return msg;
+		drm_sched_free_job_queue_if_done(sched);
+		drm_sched_run_job_queue_if_ready(sched);
+	}
 }
 
 /**
- * drm_sched_main - main scheduler thread
+ * drm_sched_run_job_work - worker to call run_job
  *
- * @param: scheduler instance
+ * @w: run job work
  */
-static void drm_sched_main(struct work_struct *w)
+static void drm_sched_run_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
-		container_of(w, struct drm_gpu_scheduler, work_run);
+		container_of(w, struct drm_gpu_scheduler, work_run_job);
+	struct drm_sched_entity *entity;
+	struct dma_fence *fence;
+	struct drm_sched_fence *s_fence;
+	struct drm_sched_job *sched_job;
 	int r;
 
-	while (!READ_ONCE(sched->pause_run_wq)) {
-		struct drm_sched_entity *entity;
-		struct drm_sched_msg *msg;
-		struct drm_sched_fence *s_fence;
-		struct drm_sched_job *sched_job;
-		struct dma_fence *fence;
-		struct drm_sched_job *cleanup_job;
-
-		cleanup_job = drm_sched_get_cleanup_job(sched);
-		entity = drm_sched_select_entity(sched);
-		msg = drm_sched_get_msg(sched);
-
-		if (cleanup_job)
-			sched->ops->free_job(cleanup_job);
-
-		if (msg)
-			sched->ops->process_msg(msg);
-
-		if (!entity) {
-			if (!cleanup_job && !msg)
-				break;
-			continue;
-		}
-
-		sched_job = drm_sched_entity_pop_job(entity);
+	if (READ_ONCE(sched->pause_submit))
+		return;
 
-		if (!sched_job) {
-			complete_all(&entity->entity_idle);
-			if (!cleanup_job && !msg)
-				break;
-			continue;
-		}
+	entity = drm_sched_select_entity(sched);
+	if (!entity)
+		return;
 
-		s_fence = sched_job->s_fence;
+	sched_job = drm_sched_entity_pop_job(entity);
+	if (!sched_job) {
+		complete_all(&entity->entity_idle);
+		return;	/* No more work */
+	}
 
-		atomic_inc(&sched->hw_rq_count);
+	s_fence = sched_job->s_fence;
 
-		trace_drm_run_job(sched_job, entity);
-		fence = sched->ops->run_job(sched_job);
-		drm_sched_job_begin(sched_job);
-		complete_all(&entity->entity_idle);
-		drm_sched_fence_scheduled(s_fence, fence);
+	atomic_inc(&sched->hw_rq_count);
+	drm_sched_job_begin(sched_job);
 
-		if (!IS_ERR_OR_NULL(fence)) {
-			/* Drop for original kref_init of the fence */
-			dma_fence_put(fence);
+	trace_drm_run_job(sched_job, entity);
+	fence = sched->ops->run_job(sched_job);
+	complete_all(&entity->entity_idle);
+	drm_sched_fence_scheduled(s_fence, fence);
 
-			r = dma_fence_add_callback(fence, &sched_job->cb,
-						   drm_sched_job_done_cb);
-			if (r == -ENOENT)
-				drm_sched_job_done(sched_job, fence->error);
-			else if (r)
-				DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
-					  r);
-		} else {
-			drm_sched_job_done(sched_job, IS_ERR(fence) ?
-					   PTR_ERR(fence) : 0);
-		}
+	if (!IS_ERR_OR_NULL(fence)) {
+		/* Drop for original kref_init of the fence */
+		dma_fence_put(fence);
 
-		wake_up(&sched->job_scheduled);
+		r = dma_fence_add_callback(fence, &sched_job->cb,
+					   drm_sched_job_done_cb);
+		if (r == -ENOENT)
+			drm_sched_job_done(sched_job, fence->error);
+		else if (r)
+			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
+	} else {
+		drm_sched_job_done(sched_job, IS_ERR(fence) ?
+				   PTR_ERR(fence) : 0);
 	}
+
+	wake_up(&sched->job_scheduled);
+	drm_sched_run_job_queue_if_ready(sched);
 }
 
 /**
@@ -1210,7 +1136,9 @@ static void drm_sched_main(struct work_struct *w)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
- * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
+ * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
+ *	       allocated and used
+ * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1218,57 +1146,89 @@ static void drm_sched_main(struct work_struct *w)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
- * @sched_policy: schedule policy
  * @dev: target &struct device
  *
  * Return 0 on success, otherwise error code.
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *run_wq,
-		   unsigned hw_submission, unsigned hang_limit,
+		   struct workqueue_struct *submit_wq,
+		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name,
-		   enum drm_sched_policy sched_policy,
-		   struct device *dev)
+		   atomic_t *score, const char *name, struct device *dev)
 {
-	int i;
-
-	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
-		return -EINVAL;
+	int i, ret;
 
 	sched->ops = ops;
-	sched->single_entity = NULL;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
-	sched->run_wq = run_wq ? : system_wq;
+	if (submit_wq) {
+		sched->submit_wq = submit_wq;
+		sched->own_submit_wq = false;
+	} else {
+		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+		if (!sched->submit_wq)
+			return -ENOMEM;
+
+		sched->own_submit_wq = true;
+	}
 	sched->timeout = timeout;
 	sched->timeout_wq = timeout_wq ? : system_wq;
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
-	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
-		sched->sched_policy = default_drm_sched_policy;
-	else
-		sched->sched_policy = sched_policy;
-	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
-	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
-	     i++)
-		drm_sched_rq_init(sched, &sched->sched_rq[i]);
+
+	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
+		/* This is a gross violation--tell drivers what the  problem is.
+		 */
+		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
+			__func__);
+		return -EINVAL;
+	} else if (sched->sched_rq) {
+		/* Not an error, but warn anyway so drivers can
+		 * fine-tune their DRM calling order, and return all
+		 * is good.
+		 */
+		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
+		return 0;
+	}
+
+	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
+					GFP_KERNEL | __GFP_ZERO);
+	if (!sched->sched_rq) {
+		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
+		return -ENOMEM;
+	}
+	sched->num_rqs = num_rqs;
+	ret = -ENOMEM;
+	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
+		if (!sched->sched_rq[i])
+			goto Out_unroll;
+		drm_sched_rq_init(sched, sched->sched_rq[i]);
+	}
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
-	INIT_LIST_HEAD(&sched->msgs);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
-	INIT_WORK(&sched->work_run, drm_sched_main);
+	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
+	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
-	sched->pause_run_wq = false;
+	sched->pause_submit = false;
 
 	sched->ready = true;
 	return 0;
+
+Out_unroll:
+	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+		kfree(sched->sched_rq[i]);
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
+	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
+	return ret;
 }
 EXPORT_SYMBOL(drm_sched_init);
 
@@ -1284,18 +1244,10 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	drm_sched_run_wq_stop(sched);
+	drm_sched_wqueue_stop(sched);
 
-	if (sched->single_entity) {
-		spin_lock(&sched->single_entity->rq_lock);
-		sched->single_entity->stopped = true;
-		spin_unlock(&sched->single_entity->rq_lock);
-	}
-
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
-	     DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
-	     i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list)
@@ -1306,7 +1258,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 */
 			s_entity->stopped = true;
 		spin_unlock(&rq->lock);
-
+		kfree(sched->sched_rq[i]);
 	}
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
@@ -1315,7 +1267,11 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
+	if (sched->own_submit_wq)
+		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1335,8 +1291,6 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	struct drm_sched_entity *entity;
 	struct drm_gpu_scheduler *sched = bad->sched;
 
-	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
-
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
 	 * corrupt but keep in mind that kernel jobs always considered good.
@@ -1344,9 +1298,10 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
+		for (i = DRM_SCHED_PRIORITY_MIN;
+		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
-			struct drm_sched_rq *rq = &sched->sched_rq[i];
+			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
 			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
@@ -1364,3 +1319,42 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	}
 }
 EXPORT_SYMBOL(drm_sched_increase_karma);
+
+/**
+ * drm_sched_wqueue_ready - Is the scheduler ready for submission
+ *
+ * @sched: scheduler instance
+ *
+ * Returns true if submission is ready
+ */
+bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched)
+{
+	return sched->ready;
+}
+EXPORT_SYMBOL(drm_sched_wqueue_ready);
+
+/**
+ * drm_sched_wqueue_stop - stop scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched)
+{
+	WRITE_ONCE(sched->pause_submit, true);
+	cancel_work_sync(&sched->work_run_job);
+	cancel_work_sync(&sched->work_free_job);
+}
+EXPORT_SYMBOL(drm_sched_wqueue_stop);
+
+/**
+ * drm_sched_wqueue_start - start scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched)
+{
+	WRITE_ONCE(sched->pause_submit, false);
+	queue_work(sched->submit_wq, &sched->work_run_job);
+	queue_work(sched->submit_wq, &sched->work_free_job);
+}
+EXPORT_SYMBOL(drm_sched_wqueue_start);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 5e3fe77fa991..ce68f170f18d 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -388,48 +388,45 @@ v3d_sched_init(struct v3d_dev *v3d)
 	int ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
-			     &v3d_bin_sched_ops, NULL,
+			     &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
-			     v3d->drm.dev);
+			     NULL, "v3d_bin", v3d->drm.dev);
 	if (ret)
 		return ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
-			     &v3d_render_sched_ops, NULL,
+			     &v3d_render_sched_ops, DRM_SCHED_PRIORITY_COUNT,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
-			     v3d->drm.dev);
+			     ULL, "v3d_render", v3d->drm.dev);
 	if (ret)
 		goto fail;
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
-			     &v3d_tfu_sched_ops, NULL,
+			     &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
-			     v3d->drm.dev);
+			     NULL, "v3d_tfu", v3d->drm.dev);
 	if (ret)
 		goto fail;
 
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
-				     &v3d_csd_sched_ops, NULL,
+				     &v3d_csd_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
-				     v3d->drm.dev);
+				     NULL, "v3d_csd", v3d->drm.dev);
 		if (ret)
 			goto fail;
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
-				     &v3d_cache_clean_sched_ops, NULL,
+				     &v3d_cache_clean_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean",
-				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
+				     NULL, "v3d_cache_clean", v3d->drm.dev);
 		if (ret)
 			goto fail;
 	}
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index cee57681732d..e40757e1b266 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -57,6 +57,7 @@ xe-y += xe_bb.o \
 	xe_exec_queue.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
+	xe_gpu_scheduler.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
index ecd761177567..5ba47a5cfdbd 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
@@ -10,6 +10,7 @@
 
 #include <drm/gpu_scheduler.h>
 
+#include "xe_gpu_scheduler_types.h"
 #include "xe_hw_engine_types.h"
 #include "xe_hw_fence_types.h"
 #include "xe_lrc_types.h"
@@ -41,6 +42,8 @@ struct xe_exec_queue {
 	struct xe_vm *vm;
 	/** @class: class of this exec queue */
 	enum xe_engine_class class;
+	/** @priority: priority of this exec queue */
+	enum xe_sched_priority priority;
 	/**
 	 * @logical_mask: logical mask of where job submitted to exec queue can run
 	 */
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 811b81c39002..5dd5cb4d1c1b 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -333,17 +333,16 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
 
 	exl->q = q;
 
-	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
+	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
 			     NULL, NULL, q->hwe->name,
-			     DRM_SCHED_POLICY_SINGLE_ENTITY,
 			     gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
 
 	sched = &exl->sched;
-	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_NORMAL,
+	err = drm_sched_entity_init(&exl->entity, DRM_SCHED_PRIORITY_MIN,
 				    &sched, 1, NULL);
 	if (err)
 		goto err_sched;
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
new file mode 100644
index 000000000000..e4ad1d6ce1d5
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "xe_gpu_scheduler.h"
+
+static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->base.pause_submit))
+		queue_work(sched->base.submit_wq, &sched->work_process_msg);
+}
+
+static void xe_sched_process_msg_queue_if_ready(struct xe_gpu_scheduler *sched)
+{
+	struct xe_sched_msg *msg;
+
+	spin_lock(&sched->base.job_list_lock);
+	msg = list_first_entry_or_null(&sched->msgs, struct xe_sched_msg, link);
+	if (msg)
+		xe_sched_process_msg_queue(sched);
+	spin_unlock(&sched->base.job_list_lock);
+}
+
+static struct xe_sched_msg *
+xe_sched_get_msg(struct xe_gpu_scheduler *sched)
+{
+	struct xe_sched_msg *msg;
+
+	spin_lock(&sched->base.job_list_lock);
+	msg = list_first_entry_or_null(&sched->msgs,
+				       struct xe_sched_msg, link);
+	if (msg)
+		list_del(&msg->link);
+	spin_unlock(&sched->base.job_list_lock);
+
+	return msg;
+}
+
+static void xe_sched_process_msg_work(struct work_struct *w)
+{
+	struct xe_gpu_scheduler *sched =
+		container_of(w, struct xe_gpu_scheduler, work_process_msg);
+	struct xe_sched_msg *msg;
+
+	if (READ_ONCE(sched->base.pause_submit))
+		return;
+
+	msg = xe_sched_get_msg(sched);
+	if (msg) {
+		sched->ops->process_msg(msg);
+
+		xe_sched_process_msg_queue_if_ready(sched);
+	}
+}
+
+int xe_sched_init(struct xe_gpu_scheduler *sched,
+		  const struct drm_sched_backend_ops *ops,
+		  const struct xe_sched_backend_ops *xe_ops,
+		  struct workqueue_struct *submit_wq,
+		  uint32_t hw_submission, unsigned hang_limit,
+		  long timeout, struct workqueue_struct *timeout_wq,
+		  atomic_t *score, const char *name,
+		  struct device *dev)
+{
+	sched->ops = xe_ops;
+	INIT_LIST_HEAD(&sched->msgs);
+	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
+
+	return drm_sched_init(&sched->base, ops, submit_wq, 1, hw_submission,
+			      hang_limit, timeout, timeout_wq, score, name,
+			      dev);
+}
+
+void xe_sched_fini(struct xe_gpu_scheduler *sched)
+{
+	xe_sched_submission_stop(sched);
+	drm_sched_fini(&sched->base);
+}
+
+void xe_sched_submission_start(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_wqueue_start(&sched->base);
+	queue_work(sched->base.submit_wq, &sched->work_process_msg);
+}
+
+void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_wqueue_stop(&sched->base);
+	cancel_work_sync(&sched->work_process_msg);
+}
+
+void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
+		      struct xe_sched_msg *msg)
+{
+	spin_lock(&sched->base.job_list_lock);
+	list_add_tail(&msg->link, &sched->msgs);
+	spin_unlock(&sched->base.job_list_lock);
+
+	xe_sched_process_msg_queue(sched);
+}
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
new file mode 100644
index 000000000000..ea785bcd3eb2
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GPU_SCHEDULER_H_
+#define _XE_GPU_SCHEDULER_H_
+
+#include "xe_gpu_scheduler_types.h"
+#include "xe_sched_job_types.h"
+
+int xe_sched_init(struct xe_gpu_scheduler *sched,
+		  const struct drm_sched_backend_ops *ops,
+		  const struct xe_sched_backend_ops *xe_ops,
+		  struct workqueue_struct *submit_wq,
+		  uint32_t hw_submission, unsigned hang_limit,
+		  long timeout, struct workqueue_struct *timeout_wq,
+		  atomic_t *score, const char *name,
+		  struct device *dev);
+void xe_sched_fini(struct xe_gpu_scheduler *sched);
+
+void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
+void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
+
+void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
+		      struct xe_sched_msg *msg);
+
+static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_stop(&sched->base, NULL);
+}
+
+static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_tdr_queue_imm(&sched->base);
+}
+
+static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_resubmit_jobs(&sched->base);
+}
+
+static inline bool
+xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
+{
+	return drm_sched_invalidate_job(&job->drm, threshold);
+}
+
+static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
+					    struct xe_sched_job *job)
+{
+	list_add(&job->drm.list, &sched->base.pending_list);
+}
+
+static inline
+struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
+{
+	return list_first_entry_or_null(&sched->base.pending_list,
+					struct xe_sched_job, drm.list);
+}
+
+static inline int
+xe_sched_entity_init(struct xe_sched_entity *entity,
+		     struct xe_gpu_scheduler *sched)
+{
+	return drm_sched_entity_init(entity, DRM_SCHED_PRIORITY_MIN,
+				     (struct drm_gpu_scheduler **)&sched,
+				     1, NULL);
+}
+
+#define xe_sched_entity_fini drm_sched_entity_fini
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
new file mode 100644
index 000000000000..86133835d4d1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GPU_SCHEDULER_TYPES_H_
+#define _XE_GPU_SCHEDULER_TYPES_H_
+
+#include <drm/gpu_scheduler.h>
+
+/**
+ * struct xe_sched_msg - an in-band (relative to GPU scheduler run queue)
+ * message
+ *
+ * Generic enough for backend defined messages, backend can expand if needed.
+ */
+struct xe_sched_msg {
+	/** @link: list link into the gpu scheduler list of messages */
+	struct list_head		link;
+	/**
+	 * @private_data: opaque pointer to message private data (backend defined)
+	 */
+	void				*private_data;
+	/** @opcode: opcode of message (backend defined) */
+	unsigned int			opcode;
+};
+
+/**
+ * struct xe_sched_backend_ops - Define the backend operations called by the
+ * scheduler
+ */
+struct xe_sched_backend_ops {
+	/**
+	 * @process_msg: Process a message. Allowed to block, it is this
+	 * function's responsibility to free message if dynamically allocated.
+	 */
+	void (*process_msg)(struct xe_sched_msg *msg);
+};
+
+/**
+ * struct xe_gpu_scheduler - Xe GPU scheduler
+ */
+struct xe_gpu_scheduler {
+	/** @base: DRM GPU scheduler */
+	struct drm_gpu_scheduler		base;
+	/** @ops: Xe scheduler ops */
+	const struct xe_sched_backend_ops	*ops;
+	/** @msgs: list of messages to be processed in @work_process_msg */
+	struct list_head			msgs;
+	/** @work_process_msg: processes messages */
+	struct work_struct		work_process_msg;
+};
+
+#define xe_sched_entity		drm_sched_entity
+#define xe_sched_policy		drm_sched_policy
+#define xe_sched_priority	drm_sched_priority
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
index d95ef0021a1f..4c39f01e4f52 100644
--- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
@@ -9,7 +9,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 
-#include <drm/gpu_scheduler.h>
+#include "xe_gpu_scheduler_types.h"
 
 struct dma_fence;
 struct xe_exec_queue;
@@ -21,16 +21,16 @@ struct xe_guc_exec_queue {
 	/** @q: Backpointer to parent xe_exec_queue */
 	struct xe_exec_queue *q;
 	/** @sched: GPU scheduler for this xe_exec_queue */
-	struct drm_gpu_scheduler sched;
+	struct xe_gpu_scheduler sched;
 	/** @entity: Scheduler entity for this xe_exec_queue */
-	struct drm_sched_entity entity;
+	struct xe_sched_entity entity;
 	/**
 	 * @static_msgs: Static messages for this xe_exec_queue, used when
 	 * a message needs to sent through the GPU scheduler but memory
 	 * allocations are not allowed.
 	 */
 #define MAX_STATIC_MSG_TYPE	3
-	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
+	struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
 	/** @lr_tdr: long running TDR worker */
 	struct work_struct lr_tdr;
 	/** @fini_async: do final fini async from this worker */
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 870dc5c532fa..8ae1a49186e5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -19,6 +19,7 @@
 #include "xe_device.h"
 #include "xe_exec_queue.h"
 #include "xe_force_wake.h"
+#include "xe_gpu_scheduler.h"
 #include "xe_gt.h"
 #include "xe_guc.h"
 #include "xe_guc_ct.h"
@@ -360,7 +361,7 @@ MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
-static const int drm_sched_prio_to_guc[] = {
+static const int xe_sched_prio_to_guc[] = {
 	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
 	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
 	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
@@ -371,14 +372,14 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
 	struct xe_device *xe = guc_to_xe(guc);
-	enum drm_sched_priority prio = q->entity->priority;
+	enum xe_sched_priority prio = q->priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_assert(xe, exec_queue_registered(q));
 
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
-	__guc_exec_queue_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
+	__guc_exec_queue_policy_add_priority(&policy, xe_sched_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
 
@@ -719,7 +720,6 @@ static int guc_read_stopped(struct xe_guc *guc)
 		q->guc->id,						\
 		GUC_CONTEXT_##enable_disable,				\
 	}
-#define MIN_SCHED_TIMEOUT	1
 
 static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
@@ -733,12 +733,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	ret = wait_event_timeout(guc->ct.wq, !exec_queue_pending_enable(q) ||
 				 guc_read_stopped(guc), HZ * 5);
 	if (!ret) {
-		struct drm_gpu_scheduler *sched = &q->guc->sched;
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 		drm_warn(&xe->drm, "Pending enable failed to respond");
-		sched->timeout = MIN_SCHED_TIMEOUT;
-		drm_sched_run_wq_start(sched);
+		xe_sched_submission_start(sched);
 		xe_gt_reset_async(q->gt);
+		xe_sched_tdr_queue_imm(sched);
 		return;
 	}
 
@@ -809,7 +809,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
 	else
-		drm_sched_set_timeout(&q->guc->sched, MIN_SCHED_TIMEOUT);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -819,13 +819,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_gpu_scheduler *sched = &ge->sched;
+	struct xe_gpu_scheduler *sched = &ge->sched;
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
 	/* Kill the run_job / process_msg entry points */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submission_stop(sched);
 
 	/*
 	 * Engine state now mostly stable, disable scheduling / deregister if
@@ -854,13 +854,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			drm_sched_run_wq_start(sched);
+			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
 		}
 	}
 
-	drm_sched_run_wq_start(sched);
+	xe_sched_submission_start(sched);
 }
 
 static enum drm_gpu_sched_stat
@@ -869,7 +869,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
@@ -889,7 +889,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	/* Kill the run_job entry point */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submission_stop(sched);
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
@@ -897,9 +897,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
 	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
-		if (!drm_sched_invalidate_job(drm_job, 2)) {
-			list_add(&drm_job->list, &sched->pending_list);
-			drm_sched_run_wq_start(sched);
+		if (!xe_sched_invalidate_job(job, 2)) {
+			xe_sched_add_pending_job(sched, job);
+			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
 			goto out;
 		}
@@ -932,10 +932,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			sched->timeout = MIN_SCHED_TIMEOUT;
-			list_add(&drm_job->list, &sched->pending_list);
-			drm_sched_run_wq_start(sched);
+			xe_sched_add_pending_job(sched, job);
+			xe_sched_submission_start(sched);
 			xe_gt_reset_async(q->gt);
+			xe_sched_tdr_queue_imm(sched);
 			goto out;
 		}
 	}
@@ -947,15 +947,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Fence state now stable, stop / start scheduler which cleans up any
 	 * fences that are complete
 	 */
-	list_add(&drm_job->list, &sched->pending_list);
-	drm_sched_run_wq_start(sched);
+	xe_sched_add_pending_job(sched, job);
+	xe_sched_submission_start(sched);
 	xe_guc_exec_queue_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
-	spin_lock(&sched->job_list_lock);
-	list_for_each_entry(tmp_job, &sched->pending_list, drm.list)
+	spin_lock(&sched->base.job_list_lock);
+	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
 		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
-	spin_unlock(&sched->job_list_lock);
+	spin_unlock(&sched->base.job_list_lock);
 
 	/* Start fence signaling */
 	xe_hw_fence_irq_start(q->fence_irq);
@@ -978,8 +978,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
 		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
 	release_guc_id(guc, q);
-	drm_sched_entity_fini(&ge->entity);
-	drm_sched_fini(&ge->sched);
+	xe_sched_entity_fini(&ge->entity);
+	xe_sched_fini(&ge->sched);
 
 	kfree(ge);
 	xe_exec_queue_fini(q);
@@ -1008,7 +1008,7 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
 	guc_exec_queue_fini_async(q);
 }
 
-static void __guc_exec_queue_process_msg_cleanup(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1028,7 +1028,7 @@ static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
 	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
 }
 
-static void __guc_exec_queue_process_msg_set_sched_props(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1052,7 +1052,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 	wake_up(&q->guc->suspend_wait);
 }
 
-static void __guc_exec_queue_process_msg_suspend(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1087,7 +1087,7 @@ static void __guc_exec_queue_process_msg_suspend(struct drm_sched_msg *msg)
 	}
 }
 
-static void __guc_exec_queue_process_msg_resume(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1113,9 +1113,9 @@ static void __guc_exec_queue_process_msg_resume(struct drm_sched_msg *msg)
 #define SUSPEND		3
 #define RESUME		4
 
-static void guc_exec_queue_process_msg(struct drm_sched_msg *msg)
+static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
-	trace_drm_sched_msg_recv(msg);
+	trace_xe_sched_msg_recv(msg);
 
 	switch (msg->opcode) {
 	case CLEANUP:
@@ -1139,12 +1139,15 @@ static const struct drm_sched_backend_ops drm_sched_ops = {
 	.run_job = guc_exec_queue_run_job,
 	.free_job = guc_exec_queue_free_job,
 	.timedout_job = guc_exec_queue_timedout_job,
+};
+
+static const struct xe_sched_backend_ops xe_sched_ops = {
 	.process_msg = guc_exec_queue_process_msg,
 };
 
 static int guc_exec_queue_init(struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched;
+	struct xe_gpu_scheduler *sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_guc_exec_queue *ge;
@@ -1163,19 +1166,18 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
-	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     q->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
-			     gt_to_xe(q->gt)->drm.dev);
+			     q->name, gt_to_xe(q->gt)->drm.dev);
 	if (err)
 		goto err_free;
 
 	sched = &ge->sched;
-	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
-				    &sched, 1, NULL);
+	err = xe_sched_entity_init(&ge->entity, sched);
 	if (err)
 		goto err_sched;
+	q->priority = DRM_SCHED_PRIORITY_NORMAL;
 
 	if (xe_exec_queue_is_lr(q))
 		INIT_WORK(&q->guc->lr_tdr, xe_guc_exec_queue_lr_cleanup);
@@ -1189,7 +1191,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	q->entity = &ge->entity;
 
 	if (guc_read_stopped(guc))
-		drm_sched_stop(sched, NULL);
+		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
 
@@ -1200,9 +1202,9 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return 0;
 
 err_entity:
-	drm_sched_entity_fini(&ge->entity);
+	xe_sched_entity_fini(&ge->entity);
 err_sched:
-	drm_sched_fini(&ge->sched);
+	xe_sched_fini(&ge->sched);
 err_free:
 	kfree(ge);
 
@@ -1216,15 +1218,15 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
 	xe_guc_exec_queue_trigger_cleanup(q);
 }
 
-static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct drm_sched_msg *msg,
+static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
 				   u32 opcode)
 {
 	INIT_LIST_HEAD(&msg->link);
 	msg->opcode = opcode;
 	msg->private_data = q;
 
-	trace_drm_sched_msg_add(msg);
-	drm_sched_add_msg(&q->guc->sched, msg);
+	trace_xe_sched_msg_add(msg);
+	xe_sched_add_msg(&q->guc->sched, msg);
 }
 
 #define STATIC_MSG_CLEANUP	0
@@ -1232,7 +1234,7 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct drm_sched_msg
 #define STATIC_MSG_RESUME	2
 static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
@@ -1241,11 +1243,11 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
-				       enum drm_sched_priority priority)
+				       enum xe_sched_priority priority)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
-	if (q->entity->priority == priority || exec_queue_killed_or_banned(q))
+	if (q->priority == priority || exec_queue_killed_or_banned(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1253,13 +1255,14 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 		return -ENOMEM;
 
 	guc_exec_queue_add_msg(q, msg, SET_SCHED_PROPS);
+	q->priority = priority;
 
 	return 0;
 }
 
 static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_us)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
 	if (q->sched_props.timeslice_us == timeslice_us ||
 	    exec_queue_killed_or_banned(q))
@@ -1278,7 +1281,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
 static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 					      u32 preempt_timeout_us)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
 	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
 	    exec_queue_killed_or_banned(q))
@@ -1296,7 +1299,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 
 static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeout_ms)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
@@ -1304,14 +1307,14 @@ static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeo
 	xe_assert(xe, !exec_queue_banned(q));
 	xe_assert(xe, !exec_queue_killed(q));
 
-	sched->timeout = job_timeout_ms;
+	sched->base.timeout = job_timeout_ms;
 
 	return 0;
 }
 
 static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
 
 	if (exec_queue_killed_or_banned(q) || q->guc->suspend_pending)
 		return -EINVAL;
@@ -1332,7 +1335,7 @@ static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
@@ -1362,10 +1365,10 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	/* Stop scheduling + flush any DRM scheduler operations */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submission_stop(sched);
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
@@ -1390,18 +1393,14 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 	 * more than twice.
 	 */
 	if (!(q->flags & (EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_VM))) {
-		struct drm_sched_job *drm_job =
-			list_first_entry_or_null(&sched->pending_list,
-						 struct drm_sched_job, list);
-
-		if (drm_job) {
-			struct xe_sched_job *job = to_xe_sched_job(drm_job);
+		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
 
+		if (job) {
 			if ((xe_sched_job_started(job) &&
 			    !xe_sched_job_completed(job)) ||
-			    drm_sched_invalidate_job(drm_job, 2)) {
+			    xe_sched_invalidate_job(job, 2)) {
 				trace_xe_sched_job_ban(job);
-				sched->timeout = MIN_SCHED_TIMEOUT;
+				xe_sched_tdr_queue_imm(&q->guc->sched);
 				set_exec_queue_banned(q);
 			}
 		}
@@ -1456,7 +1455,7 @@ int xe_guc_submit_stop(struct xe_guc *guc)
 
 static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned(q)) {
 		int i;
@@ -1464,11 +1463,10 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 		trace_xe_exec_queue_resubmit(q);
 		for (i = 0; i < q->width; ++i)
 			xe_lrc_set_ring_head(q->lrc + i, q->lrc[i].ring.tail);
-		drm_sched_resubmit_jobs(sched);
+		xe_sched_resubmit_jobs(sched);
 	}
 
-	drm_sched_run_wq_start(sched);
-	drm_sched_set_timeout(sched, sched->timeout);
+	xe_sched_submission_start(sched);
 }
 
 int xe_guc_submit_start(struct xe_guc *guc)
@@ -1752,7 +1750,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_job *job;
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
 	int i;
@@ -1770,7 +1768,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	snapshot->logical_mask = q->logical_mask;
 	snapshot->width = q->width;
 	snapshot->refcount = kref_read(&q->refcount);
-	snapshot->sched_timeout = sched->timeout;
+	snapshot->sched_timeout = sched->base.timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
 		q->sched_props.preempt_timeout_us;
@@ -1802,8 +1800,8 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
-	spin_lock(&sched->job_list_lock);
-	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
+	spin_lock(&sched->base.job_list_lock);
+	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
 	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
 					       sizeof(struct pending_list_snapshot),
 					       GFP_ATOMIC);
@@ -1812,7 +1810,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
 	} else {
 		i = 0;
-		list_for_each_entry(job, &sched->pending_list, drm.list) {
+		list_for_each_entry(job, &sched->base.pending_list, drm.list) {
 			snapshot->pending_list[i].seqno =
 				xe_sched_job_seqno(job);
 			snapshot->pending_list[i].fence =
@@ -1824,7 +1822,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		}
 	}
 
-	spin_unlock(&sched->job_list_lock);
+	spin_unlock(&sched->base.job_list_lock);
 
 	return snapshot;
 }
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index b4baecde60e6..ce803cbdafec 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -395,7 +395,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_CAST(m->q);
 	}
 	if (xe->info.supports_usm)
-		m->q->entity->priority = DRM_SCHED_PRIORITY_KERNEL;
+		m->q->priority = DRM_SCHED_PRIORITY_KERNEL;
 
 	mutex_init(&m->job_mutex);
 
diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
index e32f1cad51d9..5ea458dadf69 100644
--- a/drivers/gpu/drm/xe/xe_trace.h
+++ b/drivers/gpu/drm/xe/xe_trace.h
@@ -14,6 +14,7 @@
 
 #include "xe_bo_types.h"
 #include "xe_exec_queue_types.h"
+#include "xe_gpu_scheduler_types.h"
 #include "xe_gt_tlb_invalidation_types.h"
 #include "xe_gt_types.h"
 #include "xe_guc_exec_queue_types.h"
@@ -290,8 +291,8 @@ DEFINE_EVENT(xe_sched_job, xe_sched_job_ban,
 	     TP_ARGS(job)
 );
 
-DECLARE_EVENT_CLASS(drm_sched_msg,
-		    TP_PROTO(struct drm_sched_msg *msg),
+DECLARE_EVENT_CLASS(xe_sched_msg,
+		    TP_PROTO(struct xe_sched_msg *msg),
 		    TP_ARGS(msg),
 
 		    TP_STRUCT__entry(
@@ -309,13 +310,13 @@ DECLARE_EVENT_CLASS(drm_sched_msg,
 			      __entry->opcode)
 );
 
-DEFINE_EVENT(drm_sched_msg, drm_sched_msg_add,
-	     TP_PROTO(struct drm_sched_msg *msg),
+DEFINE_EVENT(xe_sched_msg, xe_sched_msg_add,
+	     TP_PROTO(struct xe_sched_msg *msg),
 	     TP_ARGS(msg)
 );
 
-DEFINE_EVENT(drm_sched_msg, drm_sched_msg_recv,
-	     TP_PROTO(struct drm_sched_msg *msg),
+DEFINE_EVENT(xe_sched_msg, xe_sched_msg_recv,
+	     TP_PROTO(struct xe_sched_msg *msg),
 	     TP_ARGS(msg)
 );
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 4bc1fef4fc2c..e5a6166eb152 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -72,16 +72,11 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
-/* Used to chose default scheduling policy*/
-extern int default_drm_sched_policy;
-
-enum drm_sched_policy {
-	DRM_SCHED_POLICY_DEFAULT,
-	DRM_SCHED_POLICY_RR,
-	DRM_SCHED_POLICY_FIFO,
-	DRM_SCHED_POLICY_SINGLE_ENTITY,
-	DRM_SCHED_POLICY_COUNT,
-};
+/* Used to chose between FIFO and RR jobs scheduling */
+extern int drm_sched_policy;
+
+#define DRM_SCHED_POLICY_RR    0
+#define DRM_SCHED_POLICY_FIFO  1
 
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
@@ -113,9 +108,6 @@ struct drm_sched_entity {
 	 */
 	struct drm_sched_rq		*rq;
 
-	/** @single_sched: Single scheduler */
-	struct drm_gpu_scheduler	*single_sched;
-
 	/**
 	 * @sched_list:
 	 *
@@ -394,23 +386,6 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_ENODEV,
 };
 
-/**
- * struct drm_sched_msg - an in-band (relative to GPU scheduler run queue)
- * message
- *
- * Generic enough for backend defined messages, backend can expand if needed.
- */
-struct drm_sched_msg {
-	/** @link: list link into the gpu scheduler list of messages */
-	struct list_head		link;
-	/**
-	 * @private_data: opaque pointer to message private data (backend defined)
-	 */
-	void				*private_data;
-	/** @opcode: opcode of message (backend defined) */
-	unsigned int			opcode;
-};
-
 /**
  * struct drm_sched_backend_ops - Define the backend operations
  *	called by the scheduler
@@ -488,32 +463,27 @@ struct drm_sched_backend_ops {
          * and it's time to clean it up.
 	 */
 	void (*free_job)(struct drm_sched_job *sched_job);
-
-	/**
-	 * @process_msg: Process a message. Allowed to block, it is this
-	 * function's responsibility to free message if dynamically allocated.
-	 */
-	void (*process_msg)(struct drm_sched_msg *msg);
 };
 
 /**
  * struct drm_gpu_scheduler - scheduler instance-specific data
  *
  * @ops: backend operations provided by the driver.
- * @single_entity: Single entity for the scheduler
  * @hw_submission_limit: the max size of the hardware queue.
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
- * @sched_rq: priority wise array of run queues.
- * @msgs: list of messages to be processed in @work_run
+ * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
+ *           as there's usually one run-queue per priority, but could be less.
+ * @sched_rq: An allocated array of run-queues of size @num_rqs;
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
- * @run_wq: workqueue used to queue @work_run
+ * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
- * @work_run: schedules jobs, cleans up jobs, and processes messages
+ * @work_run_job: work which calls run_job op of each scheduler.
+ * @work_free_job: work which calls free_job op of each scheduler.
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -522,49 +492,47 @@ struct drm_sched_backend_ops {
  *              guilty and it will no longer be considered for scheduling.
  * @score: score to help loadbalancer pick a idle sched
  * @_score: score used when the driver doesn't provide one
- * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
- * @pause_run_wq: pause queuing of @work_run on @run_wq
+ * @pause_submit: pause queuing of @work_submit on @submit_wq
+ * @own_submit_wq: scheduler owns allocation of @submit_wq
  * @dev: system &struct device
  *
  * One scheduler is implemented for each hardware ring.
  */
 struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
-	struct drm_sched_entity		*single_entity;
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
-	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
-	struct list_head		msgs;
+	u32                             num_rqs;
+	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
-	struct workqueue_struct		*run_wq;
+	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
-	struct work_struct		work_run;
+	struct work_struct		work_run_job;
+	struct work_struct		work_free_job;
 	struct delayed_work		work_tdr;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
 	atomic_t                        *score;
 	atomic_t                        _score;
-	enum drm_sched_policy		sched_policy;
 	bool				ready;
 	bool				free_guilty;
-	bool				pause_run_wq;
+	bool				pause_submit;
+	bool				own_submit_wq;
 	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *run_wq,
-		   uint32_t hw_submission, unsigned hang_limit,
+		   struct workqueue_struct *submit_wq,
+		   u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name,
-		   enum drm_sched_policy sched_policy,
-		   struct device *dev);
+		   atomic_t *score, const char *name, struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
@@ -589,13 +557,12 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
                                    unsigned int num_sched_list);
 
-void drm_sched_set_timeout(struct drm_gpu_scheduler *sched, long timeout);
+void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched);
-void drm_sched_add_msg(struct drm_gpu_scheduler *sched,
-		       struct drm_sched_msg *msg);
-void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
-void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
+bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_stop(struct drm_gpu_scheduler *sched);
+void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
@@ -618,8 +585,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  struct drm_gpu_scheduler **sched_list,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
-struct drm_gpu_scheduler *
-drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
-- 
2.34.1

