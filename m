Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773A6C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557A310E3CB;
	Tue, 23 May 2023 03:58:49 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E3D10E3CC
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:58:45 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-64d341bdedcso2909461b3a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684814324; x=1687406324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIO88DX87d7ql3hKKW7VDe6A9l7rr5/Fkym3uN7LzjU=;
 b=agd5WWUohRvaNAjUe0C16+JTAGpiFsvFrsWZ/XDbxdZUwcKjPEGgeB2cg33CYXBVV1
 FdMbdU/yuGQ29hrlvtuU253t/gQDB7oAs3FLwlTDjmGMpU7L4zNa3eCEEhdVSihIGJTs
 2ebgNCcA8bFSGSIYyMDtxRvRsMomVsFjBbwBsem2Eqy3PCTQNrYND9BSo2Qa13RE1OD3
 m8Vzkvl96xZ9Rs8zIbYHC/a/Vr2PhboSJZuqs7P9G6VPaQ74D36SwMdUTlQn7rgv/YCp
 ajCRL8qyRxHV73M0egztBjIBl9fkybdPmdvHfzqZIql3FD08KN10OPqy7DLRlZBR2zJ8
 IkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684814324; x=1687406324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIO88DX87d7ql3hKKW7VDe6A9l7rr5/Fkym3uN7LzjU=;
 b=SFeJHR6SrZzIhxr/7UNJ2DM1z5yz4JARylx4SjoyrX/OtkXIeHmyDuCasDWHEcyisd
 xzlSWPA7yzDhhu5it859A/vY5qrlgpEGCRChlIh6npy8Nw0MXRsC4ECHf+EWKFXh8ZXu
 ydbua+BJKrGz0DUohiergM39aAeoZ+w37PpjSWtiKd7ggMzyfDQcf5Wsaf0OWzrVJb5Q
 nF3hVnqc2QW7kqdINganoBdLHDd8w9DHk0D1bRHZ+wyt6lpyGO7oCgdkpRHuJIJCiBH8
 WgYWRxkrRWfwlM09g/hvxdtC0ZcqSh4sm1xrAmhz7L8WqWWopi6AEwR89828UE6dKB7n
 ZdLQ==
X-Gm-Message-State: AC+VfDyavNLmnlQxm4H0LD1LFJ5ZCALCpYMIpV1gX3kWB8lRo6C5038m
 F3IOgVPTp1OlvyX48goRPcF9Csa4nT9N/w==
X-Google-Smtp-Source: ACHHUZ75mQAeg/VNsR1HlWlmKFOdBkGJLi9Eqlg8SA+q4bAViyv4ga9OysSOfkR1vKmZscK8IAt2sg==
X-Received: by 2002:a05:6a00:1413:b0:63b:19e5:a9ec with SMTP id
 l19-20020a056a00141300b0063b19e5a9ecmr16759395pfu.33.1684814324556; 
 Mon, 22 May 2023 20:58:44 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa78d86000000b006414289ab69sm4828615pfr.52.2023.05.22.20.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 20:58:44 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 20:58:02 -0700
Message-Id: <20230523035808.635175-3-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523035808.635175-1-kode54@gmail.com>
References: <20230523035808.635175-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/8] drm/sched: Move schedule policy to
 scheduler
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

From: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Rather than a global modparam for scheduling policy, move the scheduling
policy to scheduler so driver can control each scheduler policy. This is
required as it is possible in certain drivers certain scheduling polices
are not allow, thus the driver must set the policy rather than the
modparam.

v2 (Thomas): Better commit message, s/scdedule/schedule/, remove extra
brackets
v3 (Christopher): Restore missing patch block required by subsequent
patches

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
 drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
 drivers/gpu/drm/scheduler/sched_entity.c   | 27 ++++++++++++++++++----
 drivers/gpu/drm/scheduler/sched_main.c     | 21 +++++++++++++----
 drivers/gpu/drm/v3d/v3d_sched.c            | 15 ++++++++----
 drivers/gpu/drm/xe/xe_execlist.c           |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c         |  3 ++-
 include/drm/gpu_scheduler.h                | 20 +++++++++++-----
 11 files changed, 74 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2e776ece4251..75ab8b9c7b25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2368,6 +2368,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
+				   DRM_SCHED_POLICY_DEFAULT,
 				   adev->dev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 8486a2923f1b..61204a3f8b0b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -136,7 +136,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), gpu->dev);
+			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
+			     gpu->dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 54f53bece27c..33042ba6ae93 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, pipe->ldev->dev);
+			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
+			      pipe->ldev->dev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 79aa112118da..78f05be89b61 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -95,7 +95,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			num_hw_submissions, 0, sched_timeout,
-			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
+			NULL, NULL, to_msm_bo(ring->bo)->name,
+			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index f48b07056a16..effa48b33dce 100644
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
index cfb433e92005..c61271e520da 100644
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
+	/* All schedule policies must match */
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
@@ -75,8 +90,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
+	if(num_sched_list) {
 		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+	}
 
 	init_completion(&entity->entity_idle);
 
@@ -461,7 +477,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -533,7 +549,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first;
+	bool first, fifo = entity->rq->sched->sched_policy ==
+		DRM_SCHED_POLICY_FIFO;
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
@@ -562,7 +579,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		if (fifo)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
 		drm_sched_wakeup(entity->rq->sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6bc29d509161..ead122e99d00 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -66,14 +66,14 @@
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
@@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
 		drm_sched_rq_remove_fifo_locked(entity);
 
 	spin_unlock(&rq->lock);
@@ -961,7 +961,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
 		if (entity)
@@ -1186,6 +1186,7 @@ static void drm_sched_main(struct work_struct *w)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
+ * @sched_policy: schedule policy
  * @dev: target &struct device
  *
  * Return 0 on success, otherwise error code.
@@ -1195,9 +1196,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *run_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev)
+		   atomic_t *score, const char *name,
+		   enum drm_sched_policy sched_policy,
+		   struct device *dev)
 {
 	int i;
+
+	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
+		return -EINVAL;
+
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1207,6 +1214,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
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
index 38e092ea41e6..5e3fe77fa991 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", v3d->drm.dev);
+			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		return ret;
 
@@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render", v3d->drm.dev);
+			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", v3d->drm.dev);
+			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", v3d->drm.dev);
+				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
+				     v3d->drm.dev);
 		if (ret)
 			goto fail;
 
@@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean", v3d->drm.dev);
+				     NULL, "v3d_cache_clean",
+				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
 		if (ret)
 			goto fail;
 	}
diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
index f0eb8bb277ce..944dad79a037 100644
--- a/drivers/gpu/drm/xe/xe_execlist.c
+++ b/drivers/gpu/drm/xe/xe_execlist.c
@@ -339,7 +339,7 @@ static int execlist_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&exl->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     XE_SCHED_HANG_LIMIT, XE_SCHED_JOB_TIMEOUT,
-			     NULL, NULL, e->hwe->name,
+			     NULL, NULL, e->hwe->name, DRM_SCHED_POLICY_DEFAULT,
 			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 5c9a6866bd3d..c147b17690dd 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1067,7 +1067,8 @@ static int guc_engine_init(struct xe_engine *e)
 	err = drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
 			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
 			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
-			     e->name, gt_to_xe(e->gt)->drm.dev);
+			     e->name, DRM_SCHED_POLICY_DEFAULT,
+			     gt_to_xe(e->gt)->drm.dev);
 	if (err)
 		goto err_free;
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 419c0446edd7..929d0d567a0b 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -72,11 +72,15 @@ enum drm_sched_priority {
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
+	DRM_SCHED_POLICY_COUNT,
+};
 
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
@@ -513,6 +517,7 @@ struct drm_sched_backend_ops {
  *              guilty and it will no longer be considered for scheduling.
  * @score: score to help loadbalancer pick a idle sched
  * @_score: score used when the driver doesn't provide one
+ * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @pause_run_wq: pause queuing of @work_run on @run_wq
@@ -539,6 +544,7 @@ struct drm_gpu_scheduler {
 	int				hang_limit;
 	atomic_t                        *score;
 	atomic_t                        _score;
+	enum drm_sched_policy		sched_policy;
 	bool				ready;
 	bool				free_guilty;
 	bool				pause_run_wq;
@@ -550,7 +556,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *run_wq,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev);
+		   atomic_t *score, const char *name,
+		   enum drm_sched_policy sched_policy,
+		   struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.40.1

