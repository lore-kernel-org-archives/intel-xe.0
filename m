Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603AC77B62
	for <intel-xe@archiver.kernel.org>; Sun,  2 Apr 2023 02:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E32B10E03D;
	Sun,  2 Apr 2023 02:41:47 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262510E11D
 for <intel-xe@lists.freedesktop.org>; Sun,  2 Apr 2023 02:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680403301; x=1711939301;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n+hbTUjbmLxeVkVxGeMHdgpdNI5H+IZ1Ow/n3ow/PWs=;
 b=X3GA/35WbWT52ACJ8Q9HQnbzV5f5XTnrAGum5xtd45NUv7N4eak0ijDO
 vXYS6Q2N8/l+SuOHbBXva8iNpzdrerh4YtvYgN3xIcg20kk4YntJugGuZ
 3WgQU8YShgj6UhyLfZE2D+lvaGDn5Hfh06pnlGLpRpwQiO/gMsus8ptUk
 6iKKRFev3OoYIsk9YAFv9Tvuw+c7pRtYXQEmSBSc1mSjMQrUMblczcULB
 h8Z5Dl2zvmQKVi+ElmLSklOhH8BT6XGiEUBkLKI/QG8Vrt1WrNw9vEZsE
 ifoT1Z5k/rxIvjqwSfsiM5IMw8RCRQ9MnUBRl6EEGKVtD1z2XShq9vUUi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="341715411"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="341715411"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 19:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="715869808"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; d="scan'208";a="715869808"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2023 19:41:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Sat,  1 Apr 2023 19:41:43 -0700
Message-Id: <20230402024145.2572923-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230402024145.2572923-1-matthew.brost@intel.com>
References: <20230402024145.2572923-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 1/3] drm/sched: Move schedule policy to
 scheduler / entity
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

Rather than a global modparam for scheduling policy, move the scheduling
policy to scheduler / entity so user can control each scheduler / entity
policy.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
 drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
 drivers/gpu/drm/scheduler/sched_entity.c   | 25 ++++++++++++++++++----
 drivers/gpu/drm/scheduler/sched_main.c     | 21 +++++++++++++-----
 drivers/gpu/drm/v3d/v3d_sched.c            | 15 ++++++++-----
 drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         |  3 ++-
 include/drm/gpu_scheduler.h                | 23 ++++++++++++++------
 11 files changed, 76 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 902f9b5ff82c..cba769fec8d6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2368,6 +2368,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 				   ring->num_hw_submission, amdgpu_job_hang_limit,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
+				   DRM_SCHED_POLICY_DEFAULT,
 				   adev->dev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 1ae87dfd19c4..07ad7a712c0d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -136,7 +136,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), gpu->dev);
+			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
+			     gpu->dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index ff003403fbbc..478ececc60d3 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, pipe->ldev->dev);
+			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
+			      pipe->ldev->dev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 57a8e9564540..9a17291edf88 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -97,7 +97,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
 			num_hw_submissions, 0, sched_timeout,
-			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
+			NULL, NULL, to_msm_bo(ring->bo)->name,
+			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..6818d332b808 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -819,7 +819,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js", pfdev->dev);
+				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
+				     pfdev->dev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 15d04a0ec623..f1299e51860b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -33,6 +33,20 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+static bool bad_policies(struct drm_gpu_scheduler **sched_list,
+			 unsigned int num_sched_list)
+{
+	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
+	unsigned int i;
+
+	/* All scdedule policies must match */
+	for (i = 1; i < num_sched_list; ++i)
+		if (sched_policy != sched_list[i]->sched_policy)
+			return true;
+
+	return false;
+}
+
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty)
 {
-	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
+	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
+	    bad_policies(sched_list, num_sched_list))
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
@@ -75,8 +90,10 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->last_scheduled = NULL;
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
+	if(num_sched_list) {
 		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+		entity->sched_policy = sched_list[0]->sched_policy;
+	}
 
 	init_completion(&entity->entity_idle);
 
@@ -440,7 +457,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -528,7 +545,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
 
 		drm_sched_wakeup(entity->rq->sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index cfd8a838e283..b7cb765f5290 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,14 +62,14 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
+int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
 MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
-module_param_named(sched_policy, drm_sched_policy, int, 0444);
+module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
@@ -173,7 +173,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
 		drm_sched_rq_remove_fifo_locked(entity);
 
 	spin_unlock(&rq->lock);
@@ -956,7 +956,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
 		if (entity)
@@ -1189,6 +1189,7 @@ static void drm_sched_main(struct work_struct *w)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
+ * @sched_policy: schedule policy
  * @dev: target &struct device
  *
  * Return 0 on success, otherwise error code.
@@ -1197,9 +1198,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev)
+		   atomic_t *score, const char *name,
+		   enum drm_sched_policy sched_policy,
+		   struct device *dev)
 {
 	int i;
+
+	if (sched_policy >= DRM_SCHED_POLICY_MAX)
+		return -EINVAL;
+
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1209,6 +1216,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
+	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
+		sched->sched_policy = default_drm_sched_policy;
+	else
+		sched->sched_policy = sched_policy;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 06238e6d7f5c..d30dc3501115 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", v3d->drm.dev);
+			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		return ret;
 
@@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render", v3d->drm.dev);
+			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", v3d->drm.dev);
+			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", v3d->drm.dev);
+				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
+				     v3d->drm.dev);
 		if (ret)
 			goto fail;
 
@@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean", v3d->drm.dev);
+				     NULL, "v3d_cache_clean",
+				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
 		if (ret)
 			goto fail;
 	}
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index 02021457b1f0..10899eceb9a4 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,7 @@ static int execlist_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&exl->sched, &drm_sched_ops,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
-			     NULL, NULL, e->hwe->name,
+			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index e857013070b9..c6ae1529de83 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1084,7 +1084,8 @@ static int guc_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     e->name, gt_to_xe(e->gt)->drm.dev);
+			     e->name, DRM_SCHED_POLICY_DEFAULT,
+			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index cf85f93218fc..7c315c96e266 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,11 +63,15 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
-/* Used to chose between FIFO and RR jobs scheduling */
-extern int drm_sched_policy;
-
-#define DRM_SCHED_POLICY_RR    0
-#define DRM_SCHED_POLICY_FIFO  1
+/* Used to chose default scheduling policy*/
+extern int default_drm_sched_policy;
+
+enum drm_sched_policy {
+	DRM_SCHED_POLICY_DEFAULT,
+	DRM_SCHED_POLICY_RR,
+	DRM_SCHED_POLICY_FIFO,
+	DRM_SCHED_POLICY_MAX,
+};
 
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
@@ -208,6 +212,9 @@ struct drm_sched_entity {
 	 */
 	bool 				stopped;
 
+	/** @sched_policy: Schedule policy for entity */
+	enum drm_sched_policy		sched_policy;
+
 	/**
 	 * @entity_idle:
 	 *
@@ -505,6 +512,7 @@ struct drm_sched_backend_ops {
  *              guilty and it will no longer be considered for scheduling.
  * @score: score to help loadbalancer pick a idle sched
  * @_score: score used when the driver doesn't provide one
+ * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @pause_run_wq: pause queuing of @work_run on @run_wq
@@ -531,6 +539,7 @@ struct drm_gpu_scheduler {
 	int				hang_limit;
 	atomic_t                        *score;
 	atomic_t                        _score;
+	enum drm_sched_policy		sched_policy;
 	bool				ready;
 	bool				free_guilty;
 	bool				pause_run_wq;
@@ -541,7 +550,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev);
+		   atomic_t *score, const char *name,
+		   enum drm_sched_policy sched_policy,
+		   struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.34.1

