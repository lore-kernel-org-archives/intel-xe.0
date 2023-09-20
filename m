Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010FDCD4937
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 23:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC7910E556;
	Wed, 20 Sep 2023 23:19:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2123B10E550
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 23:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695251967; x=1726787967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=56ntyYkqByIoevijvItAp6lB1SXfp7KmMcWk18wU5ks=;
 b=QrKw4kyAWkEFZ3Wuh9L86kcGj9ZGpOl2vMtLfKoov+L/dVBVMZ0wppP4
 Pa+wfg+UIWSinRGJGc2xw3x4S/gyeoGK2l6+x1Wh4ya6iMckS5f6Vqd9O
 Yc1xv/Bm/mEodRweGdh+WRUPQT3p9TpF2gYkIC80cLQ7nhtIi8OEug7HE
 6LNu4JITmmLdoybDULpWKSGIbRd69K4jJlh3/61ntucKV6y/CkFGMmfWe
 D60wYWzko8rnzyiZ8U87hx5RSBfLcM9Rgx8zAl7Zgg1ecX86IfJ62ELxg
 hhF2Nv0s1vPu3kCVDCIjIGqeNU6cdNVWzPbkGyDlrBmEJ4DSXL359VSqi w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379246336"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="379246336"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 16:19:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="776194908"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="776194908"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 16:19:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 16:19:42 -0700
Message-Id: <20230920231942.2706278-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920231942.2706278-1-matthew.brost@intel.com>
References: <20230920231942.2706278-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/1] drm/xe: Update to upstream DRM scheduler
 code
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      |   2 +-
 drivers/gpu/drm/lima/lima_sched.c            |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c   |   4 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c         |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c      |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c      |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c     |   6 +-
 drivers/gpu/drm/scheduler/sched_main.c       | 471 ++++++++++---------
 drivers/gpu/drm/v3d/v3d_sched.c              |  10 +-
 drivers/gpu/drm/xe/Makefile                  |   1 +
 drivers/gpu/drm/xe/xe_gpu_scheduler.c        | 102 ++++
 drivers/gpu/drm/xe/xe_gpu_scheduler.h        |  75 +++
 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h  |  58 +++
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   8 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 142 +++---
 drivers/gpu/drm/xe/xe_trace.h                |  13 +-
 include/drm/gpu_scheduler.h                  |  54 +--
 19 files changed, 599 insertions(+), 365 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_scheduler_types.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 78623eaeb90d..7dd5f235a725 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1661,7 +1661,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 
 		if (!ring || !ring->sched.ready)
 			continue;
-		drm_sched_run_wq_stop(&ring->sched);
+		drm_sched_submit_stop(&ring->sched);
 	}
 
 	seq_puts(m, "run ib test:\n");
@@ -1677,7 +1677,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 
 		if (!ring || !ring->sched.ready)
 			continue;
-		drm_sched_run_wq_start(&ring->sched);
+		drm_sched_submit_start(&ring->sched);
 	}
 
 	up_write(&adev->reset_domain->sem);
@@ -1915,7 +1915,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		goto pro_end;
 
 	/* stop the scheduler */
-	drm_sched_run_wq_stop(&ring->sched);
+	drm_sched_submit_stop(&ring->sched);
 
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
@@ -1949,7 +1949,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 failure:
 	/* restart the scheduler */
-	drm_sched_run_wq_start(&ring->sched);
+	drm_sched_submit_start(&ring->sched);
 
 	up_read(&adev->reset_domain->sem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 1428307292a9..3618230b5d22 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2302,7 +2302,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
-				   DRM_SCHED_POLICY_DEFAULT,
+				   DRM_SCHED_POLICY_UNSET,
 				   adev->dev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 3646f995ca94..15b0e2f1abe5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -137,7 +137,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
+			     dev_name(gpu->dev), DRM_SCHED_POLICY_UNSET,
 			     gpu->dev);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 465d4bf3882b..50c2075228aa 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -491,7 +491,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
+			      NULL, name, DRM_SCHED_POLICY_UNSET,
 			      pipe->ldev->dev);
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 288f99b9bdba..559931657ff5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -810,7 +810,7 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 	 */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		drm_sched_run_wq_stop(sched);
+		drm_sched_submit_stop(sched);
 	}
 }
 
@@ -820,7 +820,7 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		drm_sched_run_wq_start(sched);
+		drm_sched_submit_start(sched);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 813bff7f0c8f..173ad2f17c50 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -97,7 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			     num_hw_submissions, 0, sched_timeout,
 			     NULL, NULL, to_msm_bo(ring->bo)->name,
-			     DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
+			     DRM_SCHED_POLICY_UNSET, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 70e497e40c70..f26a814a9920 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -432,7 +432,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
 			      NULL, NULL, "nouveau_sched",
-			      DRM_SCHED_POLICY_DEFAULT, drm->dev->dev);
+			      DRM_SCHED_POLICY_UNSET, drm->dev->dev);
 }
 
 void nouveau_sched_fini(struct nouveau_drm *drm)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index ad36bf3a4699..241e62801586 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -835,7 +835,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
+				     NULL, "pan_js", DRM_SCHED_POLICY_UNSET,
 				     pfdev->dev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 1dec97caaba3..437c50867c99 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -33,8 +33,8 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-static bool bad_policies(struct drm_gpu_scheduler **sched_list,
-			 unsigned int num_sched_list)
+static bool drm_sched_policy_mismatch(struct drm_gpu_scheduler **sched_list,
+				      unsigned int num_sched_list)
 {
 	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
 	unsigned int i;
@@ -77,7 +77,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  atomic_t *guilty)
 {
 	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
-	    bad_policies(sched_list, num_sched_list))
+	    drm_sched_policy_mismatch(sched_list, num_sched_list))
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 0626aa6f7b70..88ef8be2d3c7 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -42,6 +42,8 @@
  * 4. Entities themselves maintain a queue of jobs that will be scheduled on
  *    the hardware.
  *
+ * The jobs in a entity are always scheduled in the order that they were pushed.
+ *
  * The organisation of the scheduler is the following for scheduling policy
  * DRM_SCHED_POLICY_SINGLE_ENTITY:
  *
@@ -82,14 +84,14 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
+int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
-MODULE_PARM_DESC(sched_policy, "Specify the default scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
-module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
+module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
@@ -211,11 +213,12 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
  * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
  *
  * @rq: scheduler run queue to check.
+ * @dequeue: dequeue selected entity
  *
  * Try to find a ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq, bool dequeue)
 {
 	struct drm_sched_entity *entity;
 
@@ -225,8 +228,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	if (entity) {
 		list_for_each_entry_continue(entity, &rq->entities, list) {
 			if (drm_sched_entity_is_ready(entity)) {
-				rq->current_entity = entity;
-				reinit_completion(&entity->entity_idle);
+				if (dequeue) {
+					rq->current_entity = entity;
+					reinit_completion(&entity->entity_idle);
+				}
 				spin_unlock(&rq->lock);
 				return entity;
 			}
@@ -236,8 +241,10 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
 	list_for_each_entry(entity, &rq->entities, list) {
 
 		if (drm_sched_entity_is_ready(entity)) {
-			rq->current_entity = entity;
-			reinit_completion(&entity->entity_idle);
+			if (dequeue) {
+				rq->current_entity = entity;
+				reinit_completion(&entity->entity_idle);
+			}
 			spin_unlock(&rq->lock);
 			return entity;
 		}
@@ -255,11 +262,12 @@ drm_sched_rq_select_entity_rr(struct drm_sched_rq *rq)
  * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
  *
  * @rq: scheduler run queue to check.
+ * @dequeue: dequeue selected entity
  *
  * Find oldest waiting ready entity, returns NULL if none found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
+drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq, bool dequeue)
 {
 	struct rb_node *rb;
 
@@ -269,8 +277,10 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 
 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
 		if (drm_sched_entity_is_ready(entity)) {
-			rq->current_entity = entity;
-			reinit_completion(&entity->entity_idle);
+			if (dequeue) {
+				rq->current_entity = entity;
+				reinit_completion(&entity->entity_idle);
+			}
 			break;
 		}
 	}
@@ -280,50 +290,102 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 }
 
 /**
- * drm_sched_run_wq_stop - stop scheduler run worker
- *
- * @sched: scheduler instance to stop run worker
+ * drm_sched_run_job_queue - queue job submission
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
+ *
+ * @sched: scheduler instance
+ * @dequeue: dequeue selected entity
  *
- * @sched: scheduler instance to start run worker
+ * Returns the entity to process or NULL if none are found.
  */
-void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched)
+static struct drm_sched_entity *
+drm_sched_select_entity(struct drm_gpu_scheduler *sched, bool dequeue)
 {
-	sched->pause_run_wq = false;
-	smp_wmb();
+	struct drm_sched_entity *entity;
+	int i;
+
+	if (!drm_sched_can_queue(sched))
+		return NULL;
+
+	if (sched->single_entity) {
+		if (!READ_ONCE(sched->single_entity->stopped) &&
+		    drm_sched_entity_is_ready(sched->single_entity))
+			return sched->single_entity;
+
+		return NULL;
+	}
 
-	queue_work(sched->run_wq, &sched->work_run);
+	/* Kernel run queue has higher priority than normal run queue*/
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
+			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i],
+							dequeue) :
+			drm_sched_rq_select_entity_rr(&sched->sched_rq[i],
+						      dequeue);
+		if (entity)
+			break;
+	}
+
+	return entity;
 }
-EXPORT_SYMBOL(drm_sched_run_wq_start);
 
 /**
- * drm_sched_run_wq_queue - queue scheduler run worker
+ * drm_sched_run_job_queue_if_ready - queue job submission if ready
+ * @sched: scheduler instance
+ */
+static void drm_sched_run_job_queue_if_ready(struct drm_gpu_scheduler *sched)
+{
+	if (drm_sched_select_entity(sched, false))
+		drm_sched_run_job_queue(sched);
+}
+
+/**
+ * drm_sched_free_job_queue - queue free job
  *
- * @sched: scheduler instance to queue run worker
+ * @sched: scheduler instance to queue free job
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
+ * drm_sched_free_job_queue_if_ready - queue free job if ready
+ *
+ * @sched: scheduler instance to queue free job
+ */
+static void drm_sched_free_job_queue_if_ready(struct drm_gpu_scheduler *sched)
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
@@ -345,7 +407,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	drm_sched_run_wq_queue(sched);
+	drm_sched_free_job_queue(sched);
 }
 
 /**
@@ -369,28 +431,36 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
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
+ * drm_sched_tdr_queue_imm: - immediately start timeout handler including future
+ * jobs
  *
- * @sched: scheduler instance to set and (re)-start the worker for
- * @timeout: timeout period
+ * @sched: scheduler where the timeout handling should be started.
  *
- * Set and (re)-start the timeout for the given scheduler.
+ * Start timeout handling immediately for current and future jobs
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
@@ -464,7 +534,6 @@ static void drm_sched_job_begin(struct drm_sched_job *s_job)
 
 	spin_lock(&sched->job_list_lock);
 	list_add_tail(&s_job->list, &sched->pending_list);
-	drm_sched_start_timeout(sched);
 	spin_unlock(&sched->job_list_lock);
 }
 
@@ -504,11 +573,8 @@ static void drm_sched_job_timedout(struct work_struct *work)
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
@@ -527,7 +593,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
 
-	drm_sched_run_wq_stop(sched);
+	drm_sched_submit_stop(sched);
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
@@ -634,13 +700,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 			drm_sched_job_done(s_job, -ECANCELED);
 	}
 
-	drm_sched_run_wq_start(sched);
+	drm_sched_submit_start(sched);
 
-	if (full_recovery) {
-		spin_lock(&sched->job_list_lock);
-		drm_sched_start_timeout(sched);
-		spin_unlock(&sched->job_list_lock);
-	}
+	if (full_recovery)
+		drm_sched_start_timeout_unlocked(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -790,13 +853,6 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
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
@@ -945,18 +1001,6 @@ void drm_sched_job_cleanup(struct drm_sched_job *job)
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
@@ -966,42 +1010,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
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
@@ -1033,8 +1042,10 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
 						typeof(*next), list);
 
 		if (next) {
-			next->s_fence->scheduled.timestamp =
-				job->s_fence->finished.timestamp;
+			if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
+				     &next->s_fence->scheduled.flags))
+				next->s_fence->scheduled.timestamp =
+					job->s_fence->finished.timestamp;
 			/* start TO timer for next job */
 			drm_sched_start_timeout(sched);
 		}
@@ -1084,125 +1095,85 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
-
-	/*
-	 * Same as above in drm_sched_run_wq_queue, try to kick worker if
-	 * paused, harmless if this races
-	 */
-	if (!sched->pause_run_wq)
-		queue_work(sched->run_wq, &sched->work_run);
-}
-EXPORT_SYMBOL(drm_sched_add_msg);
+	struct drm_gpu_scheduler *sched =
+		container_of(w, struct drm_gpu_scheduler, work_free_job);
+	struct drm_sched_job *cleanup_job;
 
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
+	if (READ_ONCE(sched->pause_submit))
+		return;
 
-	spin_lock(&sched->job_list_lock);
-	msg = list_first_entry_or_null(&sched->msgs,
-				       struct drm_sched_msg, link);
-	if (msg)
-		list_del(&msg->link);
-	spin_unlock(&sched->job_list_lock);
+	cleanup_job = drm_sched_get_cleanup_job(sched);
+	if (cleanup_job) {
+		sched->ops->free_job(cleanup_job);
 
-	return msg;
+		drm_sched_free_job_queue_if_ready(sched);
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
+	entity = drm_sched_select_entity(sched, true);
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
+	drm_sched_start_timeout_unlocked(sched);
 
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
+			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n",
+				  r);
+	} else {
+		drm_sched_job_done(sched_job, IS_ERR(fence) ?
+				   PTR_ERR(fence) : 0);
 	}
+
+	wake_up(&sched->job_scheduled);
+	drm_sched_run_job_queue_if_ready(sched);
 }
 
 /**
@@ -1210,7 +1181,8 @@ static void drm_sched_main(struct work_struct *w)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
- * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
+ * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
+ *	       allocated and used
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1225,7 +1197,7 @@ static void drm_sched_main(struct work_struct *w)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *run_wq,
+		   struct workqueue_struct *submit_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name,
@@ -1241,16 +1213,23 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->single_entity = NULL;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
-	sched->run_wq = run_wq ? : system_wq;
+	if (!submit_wq) {
+		sched->submit_wq = alloc_ordered_workqueue(name, 0);
+		if (!sched->submit_wq)
+			return -ENOMEM;
+
+		sched->alloc_submit_wq = true;
+	} else {
+		sched->submit_wq = submit_wq;
+		sched->alloc_submit_wq = false;
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
+	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
+		drm_sched_policy_default : sched_policy;
 	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
 	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
 	     i++)
@@ -1258,14 +1237,14 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
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
@@ -1284,7 +1263,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	drm_sched_run_wq_stop(sched);
+	drm_sched_submit_stop(sched);
 
 	if (sched->single_entity) {
 		spin_lock(&sched->single_entity->rq_lock);
@@ -1315,6 +1294,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
+	if (sched->alloc_submit_wq)
+		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
 }
 EXPORT_SYMBOL(drm_sched_fini);
@@ -1364,3 +1345,43 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	}
 }
 EXPORT_SYMBOL(drm_sched_increase_karma);
+
+/**
+ * drm_sched_submit_ready - scheduler ready for submission
+ *
+ * @sched: scheduler instance
+ *
+ * Returns true if submission is ready
+ */
+bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
+{
+	return sched->ready;
+
+}
+EXPORT_SYMBOL(drm_sched_submit_ready);
+
+/**
+ * drm_sched_submit_stop - stop scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
+{
+	WRITE_ONCE(sched->pause_submit, true);
+	cancel_work_sync(&sched->work_run_job);
+	cancel_work_sync(&sched->work_free_job);
+}
+EXPORT_SYMBOL(drm_sched_submit_stop);
+
+/**
+ * drm_sched_submit_start - start scheduler submission
+ *
+ * @sched: scheduler instance
+ */
+void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
+{
+	WRITE_ONCE(sched->pause_submit, false);
+	queue_work(sched->submit_wq, &sched->work_run_job);
+	queue_work(sched->submit_wq, &sched->work_free_job);
+}
+EXPORT_SYMBOL(drm_sched_submit_start);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 5e3fe77fa991..55d256c8edce 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,7 +391,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
+			     NULL, "v3d_bin", DRM_SCHED_POLICY_UNSET,
 			     v3d->drm.dev);
 	if (ret)
 		return ret;
@@ -400,7 +400,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
+			     ULL, "v3d_render", DRM_SCHED_POLICY_UNSET,
 			     v3d->drm.dev);
 	if (ret)
 		goto fail;
@@ -409,7 +409,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
+			     NULL, "v3d_tfu", DRM_SCHED_POLICY_UNSET,
 			     v3d->drm.dev);
 	if (ret)
 		goto fail;
@@ -419,7 +419,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
+				     NULL, "v3d_csd", DRM_SCHED_POLICY_UNSET,
 				     v3d->drm.dev);
 		if (ret)
 			goto fail;
@@ -429,7 +429,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_cache_clean",
-				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
+				     DRM_SCHED_POLICY_UNSET, v3d->drm.dev);
 		if (ret)
 			goto fail;
 	}
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 86c8bd4c05a3..31cb31810b54 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -56,6 +56,7 @@ xe-y += xe_bb.o \
 	xe_exec_queue.o \
 	xe_force_wake.o \
 	xe_ggtt.o \
+	xe_gpu_scheduler.o \
 	xe_gt.o \
 	xe_gt_clock.o \
 	xe_gt_debugfs.o \
diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
new file mode 100644
index 000000000000..558b30b02054
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
@@ -0,0 +1,102 @@
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
+		  enum xe_sched_policy sched_policy,
+		  struct device *dev)
+{
+	sched->ops = xe_ops;
+	INIT_LIST_HEAD(&sched->msgs);
+	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
+
+	return drm_sched_init(&sched->base, ops, submit_wq, hw_submission,
+			      hang_limit, timeout, timeout_wq, score, name,
+			      sched_policy, dev);
+}
+
+void xe_sched_fini(struct xe_gpu_scheduler *sched)
+{
+	xe_sched_submit_stop(sched);
+	drm_sched_fini(&sched->base);
+}
+
+void xe_sched_submit_start(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_submit_start(&sched->base);
+	queue_work(sched->base.submit_wq, &sched->work_process_msg);
+}
+
+void xe_sched_submit_stop(struct xe_gpu_scheduler *sched)
+{
+	drm_sched_submit_stop(&sched->base);
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
index 000000000000..9a86ce08a68b
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
@@ -0,0 +1,75 @@
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
+		  enum xe_sched_policy sched_policy,
+		  struct device *dev);
+void xe_sched_fini(struct xe_gpu_scheduler *sched);
+
+void xe_sched_submit_start(struct xe_gpu_scheduler *sched);
+void xe_sched_submit_stop(struct xe_gpu_scheduler *sched);
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
+		     enum xe_sched_priority priority,
+		     struct xe_gpu_scheduler *sched)
+{
+	return drm_sched_entity_init(entity, priority,
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
index 19abd2628ad6..b6d9bceda769 100644
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
@@ -359,7 +360,7 @@ MAKE_EXEC_QUEUE_POLICY_ADD(preemption_timeout, PREEMPTION_TIMEOUT)
 MAKE_EXEC_QUEUE_POLICY_ADD(priority, SCHEDULING_PRIORITY)
 #undef MAKE_EXEC_QUEUE_POLICY_ADD
 
-static const int drm_sched_prio_to_guc[] = {
+static const int xe_sched_prio_to_guc[] = {
 	[DRM_SCHED_PRIORITY_MIN] = GUC_CLIENT_PRIORITY_NORMAL,
 	[DRM_SCHED_PRIORITY_NORMAL] = GUC_CLIENT_PRIORITY_KMD_NORMAL,
 	[DRM_SCHED_PRIORITY_HIGH] = GUC_CLIENT_PRIORITY_HIGH,
@@ -370,14 +371,14 @@ static void init_policies(struct xe_guc *guc, struct xe_exec_queue *q)
 {
 	struct exec_queue_policy policy;
 	struct xe_device *xe = guc_to_xe(guc);
-	enum drm_sched_priority prio = q->entity->priority;
+	enum xe_sched_priority prio = q->entity->priority;
 	u32 timeslice_us = q->sched_props.timeslice_us;
 	u32 preempt_timeout_us = q->sched_props.preempt_timeout_us;
 
 	xe_assert(xe, exec_queue_registered(q));
 
 	__guc_exec_queue_policy_start_klv(&policy, q->guc->id);
-	__guc_exec_queue_policy_add_priority(&policy, drm_sched_prio_to_guc[prio]);
+	__guc_exec_queue_policy_add_priority(&policy, xe_sched_prio_to_guc[prio]);
 	__guc_exec_queue_policy_add_execution_quantum(&policy, timeslice_us);
 	__guc_exec_queue_policy_add_preemption_timeout(&policy, preempt_timeout_us);
 
@@ -718,7 +719,6 @@ static int guc_read_stopped(struct xe_guc *guc)
 		q->guc->id,						\
 		GUC_CONTEXT_##enable_disable,				\
 	}
-#define MIN_SCHED_TIMEOUT	1
 
 static void disable_scheduling_deregister(struct xe_guc *guc,
 					  struct xe_exec_queue *q)
@@ -732,12 +732,12 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
 	ret = wait_event_timeout(guc->ct.wq, !exec_queue_pending_enable(q) ||
 				 guc_read_stopped(guc), HZ * 5);
 	if (!ret) {
-		struct drm_gpu_scheduler *sched = &q->guc->sched;
+		struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 		drm_warn(&xe->drm, "Pending enable failed to respond");
-		sched->timeout = MIN_SCHED_TIMEOUT;
-		drm_sched_run_wq_start(sched);
+		xe_sched_submit_start(sched);
 		xe_gt_reset_async(q->gt);
+		xe_sched_tdr_queue_imm(sched);
 		return;
 	}
 
@@ -808,7 +808,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 	if (xe_exec_queue_is_lr(q))
 		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
 	else
-		drm_sched_set_timeout(&q->guc->sched, MIN_SCHED_TIMEOUT);
+		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
@@ -818,13 +818,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_exec_queue *q = ge->q;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_gpu_scheduler *sched = &ge->sched;
+	struct xe_gpu_scheduler *sched = &ge->sched;
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
 	/* Kill the run_job / process_msg entry points */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submit_stop(sched);
 
 	/*
 	 * Engine state now mostly stable, disable scheduling / deregister if
@@ -853,13 +853,13 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			drm_sched_run_wq_start(sched);
+			xe_sched_submit_start(sched);
 			xe_gt_reset_async(q->gt);
 			return;
 		}
 	}
 
-	drm_sched_run_wq_start(sched);
+	xe_sched_submit_start(sched);
 }
 
 static enum drm_gpu_sched_stat
@@ -868,7 +868,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
 	struct xe_sched_job *tmp_job;
 	struct xe_exec_queue *q = job->q;
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
@@ -888,7 +888,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	trace_xe_sched_job_timedout(job);
 
 	/* Kill the run_job entry point */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submit_stop(sched);
 
 	/*
 	 * Kernel jobs should never fail, nor should VM jobs if they do
@@ -896,9 +896,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
 	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
-		if (!drm_sched_invalidate_job(drm_job, 2)) {
-			list_add(&drm_job->list, &sched->pending_list);
-			drm_sched_run_wq_start(sched);
+		if (!xe_sched_invalidate_job(job, 2)) {
+			xe_sched_add_pending_job(sched, job);
+			xe_sched_submit_start(sched);
 			xe_gt_reset_async(q->gt);
 			goto out;
 		}
@@ -931,10 +931,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 					 guc_read_stopped(guc), HZ * 5);
 		if (!ret || guc_read_stopped(guc)) {
 			drm_warn(&xe->drm, "Schedule disable failed to respond");
-			sched->timeout = MIN_SCHED_TIMEOUT;
-			list_add(&drm_job->list, &sched->pending_list);
-			drm_sched_run_wq_start(sched);
+			xe_sched_add_pending_job(sched, job);
+			xe_sched_submit_start(sched);
 			xe_gt_reset_async(q->gt);
+			xe_sched_tdr_queue_imm(sched);
 			goto out;
 		}
 	}
@@ -946,15 +946,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Fence state now stable, stop / start scheduler which cleans up any
 	 * fences that are complete
 	 */
-	list_add(&drm_job->list, &sched->pending_list);
-	drm_sched_run_wq_start(sched);
+	xe_sched_add_pending_job(sched, job);
+	xe_sched_submit_start(sched);
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
@@ -977,8 +977,8 @@ static void __guc_exec_queue_fini_async(struct work_struct *w)
 	if (q->flags & EXEC_QUEUE_FLAG_PERSISTENT)
 		xe_device_remove_persistent_exec_queues(gt_to_xe(q->gt), q);
 	release_guc_id(guc, q);
-	drm_sched_entity_fini(&ge->entity);
-	drm_sched_fini(&ge->sched);
+	xe_sched_entity_fini(&ge->entity);
+	xe_sched_fini(&ge->sched);
 
 	kfree(ge);
 	xe_exec_queue_fini(q);
@@ -1007,7 +1007,7 @@ static void __guc_exec_queue_fini(struct xe_guc *guc, struct xe_exec_queue *q)
 	guc_exec_queue_fini_async(q);
 }
 
-static void __guc_exec_queue_process_msg_cleanup(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1027,7 +1027,7 @@ static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
 	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
 }
 
-static void __guc_exec_queue_process_msg_set_sched_props(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1051,7 +1051,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
 	wake_up(&q->guc->suspend_wait);
 }
 
-static void __guc_exec_queue_process_msg_suspend(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1086,7 +1086,7 @@ static void __guc_exec_queue_process_msg_suspend(struct drm_sched_msg *msg)
 	}
 }
 
-static void __guc_exec_queue_process_msg_resume(struct drm_sched_msg *msg)
+static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
 {
 	struct xe_exec_queue *q = msg->private_data;
 	struct xe_guc *guc = exec_queue_to_guc(q);
@@ -1112,9 +1112,9 @@ static void __guc_exec_queue_process_msg_resume(struct drm_sched_msg *msg)
 #define SUSPEND		3
 #define RESUME		4
 
-static void guc_exec_queue_process_msg(struct drm_sched_msg *msg)
+static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
 {
-	trace_drm_sched_msg_recv(msg);
+	trace_xe_sched_msg_recv(msg);
 
 	switch (msg->opcode) {
 	case CLEANUP:
@@ -1138,12 +1138,15 @@ static const struct drm_sched_backend_ops drm_sched_ops = {
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
@@ -1162,7 +1165,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 
 	timeout = (q->vm && xe_vm_no_dma_fences(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
 		  q->hwe->eclass->sched_props.job_timeout_ms;
-	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
+	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
 			     q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
 			     q->name, DRM_SCHED_POLICY_SINGLE_ENTITY,
@@ -1171,8 +1174,8 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 		goto err_free;
 
 	sched = &ge->sched;
-	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
-				    &sched, 1, NULL);
+	err = xe_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
+				   sched);
 	if (err)
 		goto err_sched;
 
@@ -1188,7 +1191,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	q->entity = &ge->entity;
 
 	if (guc_read_stopped(guc))
-		drm_sched_stop(sched, NULL);
+		xe_sched_stop(sched);
 
 	mutex_unlock(&guc->submission_state.lock);
 
@@ -1199,9 +1202,9 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
 	return 0;
 
 err_entity:
-	drm_sched_entity_fini(&ge->entity);
+	xe_sched_entity_fini(&ge->entity);
 err_sched:
-	drm_sched_fini(&ge->sched);
+	xe_sched_fini(&ge->sched);
 err_free:
 	kfree(ge);
 
@@ -1215,15 +1218,15 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
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
@@ -1231,7 +1234,7 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct drm_sched_msg
 #define STATIC_MSG_RESUME	2
 static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
 	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
@@ -1240,9 +1243,9 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 }
 
 static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
-				       enum drm_sched_priority priority)
+				       enum xe_sched_priority priority)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
 	if (q->entity->priority == priority || exec_queue_killed_or_banned(q))
 		return 0;
@@ -1258,7 +1261,7 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 
 static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_us)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
 	if (q->sched_props.timeslice_us == timeslice_us ||
 	    exec_queue_killed_or_banned(q))
@@ -1277,7 +1280,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
 static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 					      u32 preempt_timeout_us)
 {
-	struct drm_sched_msg *msg;
+	struct xe_sched_msg *msg;
 
 	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
 	    exec_queue_killed_or_banned(q))
@@ -1295,7 +1298,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 
 static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeout_ms)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
@@ -1303,14 +1306,14 @@ static int guc_exec_queue_set_job_timeout(struct xe_exec_queue *q, u32 job_timeo
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
@@ -1331,7 +1334,7 @@ static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
 
 static void guc_exec_queue_resume(struct xe_exec_queue *q)
 {
-	struct drm_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
+	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_RESUME;
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 
@@ -1361,10 +1364,10 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
 
 static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	/* Stop scheduling + flush any DRM scheduler operations */
-	drm_sched_run_wq_stop(sched);
+	xe_sched_submit_stop(sched);
 
 	/* Clean up lost G2H + reset engine state */
 	if (exec_queue_registered(q)) {
@@ -1389,18 +1392,14 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
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
@@ -1455,7 +1454,7 @@ int xe_guc_submit_stop(struct xe_guc *guc)
 
 static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
 	if (!exec_queue_killed_or_banned(q)) {
 		int i;
@@ -1463,11 +1462,10 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 		trace_xe_exec_queue_resubmit(q);
 		for (i = 0; i < q->width; ++i)
 			xe_lrc_set_ring_head(q->lrc + i, q->lrc[i].ring.tail);
-		drm_sched_resubmit_jobs(sched);
+		xe_sched_resubmit_jobs(sched);
 	}
 
-	drm_sched_run_wq_start(sched);
-	drm_sched_set_timeout(sched, sched->timeout);
+	xe_sched_submit_start(sched);
 }
 
 int xe_guc_submit_start(struct xe_guc *guc)
@@ -1751,7 +1749,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 {
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
-	struct drm_gpu_scheduler *sched = &q->guc->sched;
+	struct xe_gpu_scheduler *sched = &q->guc->sched;
 	struct xe_sched_job *job;
 	struct xe_guc_submit_exec_queue_snapshot *snapshot;
 	int i;
@@ -1769,7 +1767,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	snapshot->logical_mask = q->logical_mask;
 	snapshot->width = q->width;
 	snapshot->refcount = kref_read(&q->refcount);
-	snapshot->sched_timeout = sched->timeout;
+	snapshot->sched_timeout = sched->base.timeout;
 	snapshot->sched_props.timeslice_us = q->sched_props.timeslice_us;
 	snapshot->sched_props.preempt_timeout_us =
 		q->sched_props.preempt_timeout_us;
@@ -1801,8 +1799,8 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 	if (snapshot->parallel_execution)
 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
 
-	spin_lock(&sched->job_list_lock);
-	snapshot->pending_list_size = list_count_nodes(&sched->pending_list);
+	spin_lock(&sched->base.job_list_lock);
+	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
 	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
 					       sizeof(struct pending_list_snapshot),
 					       GFP_ATOMIC);
@@ -1811,7 +1809,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		drm_err(&xe->drm, "Skipping GuC Engine pending_list snapshot.\n");
 	} else {
 		i = 0;
-		list_for_each_entry(job, &sched->pending_list, drm.list) {
+		list_for_each_entry(job, &sched->base.pending_list, drm.list) {
 			snapshot->pending_list[i].seqno =
 				xe_sched_job_seqno(job);
 			snapshot->pending_list[i].fence =
@@ -1823,7 +1821,7 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
 		}
 	}
 
-	spin_unlock(&sched->job_list_lock);
+	spin_unlock(&sched->base.job_list_lock);
 
 	return snapshot;
 }
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
index 4bc1fef4fc2c..27f5778bbd6d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -76,7 +76,7 @@ enum drm_sched_priority {
 extern int default_drm_sched_policy;
 
 enum drm_sched_policy {
-	DRM_SCHED_POLICY_DEFAULT,
+	DRM_SCHED_POLICY_UNSET,
 	DRM_SCHED_POLICY_RR,
 	DRM_SCHED_POLICY_FIFO,
 	DRM_SCHED_POLICY_SINGLE_ENTITY,
@@ -394,23 +394,6 @@ enum drm_gpu_sched_stat {
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
@@ -488,12 +471,6 @@ struct drm_sched_backend_ops {
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
@@ -505,15 +482,15 @@ struct drm_sched_backend_ops {
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @sched_rq: priority wise array of run queues.
- * @msgs: list of messages to be processed in @work_run
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
- * @run_wq: workqueue used to queue @work_run
+ * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
  * @timeout_wq: workqueue used to queue @work_tdr
- * @work_run: schedules jobs, cleans up jobs, and processes messages
+ * @work_run_job: schedules jobs
+ * @work_free_job: cleans up jobs
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
  * @pending_list: the list of jobs which are currently in the job queue.
@@ -525,7 +502,8 @@ struct drm_sched_backend_ops {
  * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
- * @pause_run_wq: pause queuing of @work_run on @run_wq
+ * @pause_submit: pause queuing of @work_submit on @submit_wq
+ * @alloc_submit_wq: scheduler own allocation of @submit_wq
  * @dev: system &struct device
  *
  * One scheduler is implemented for each hardware ring.
@@ -537,13 +515,13 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
-	struct list_head		msgs;
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
@@ -553,13 +531,14 @@ struct drm_gpu_scheduler {
 	enum drm_sched_policy		sched_policy;
 	bool				ready;
 	bool				free_guilty;
-	bool				pause_run_wq;
+	bool				pause_submit;
+	bool				alloc_submit_wq;
 	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
-		   struct workqueue_struct *run_wq,
+		   struct workqueue_struct *submit_wq,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name,
@@ -589,13 +568,12 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
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
+bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched);
+void drm_sched_submit_stop(struct drm_gpu_scheduler *sched);
+void drm_sched_submit_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.34.1

