Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99322C7EE2D
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:58:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734C710E3CD;
	Tue, 23 May 2023 03:58:48 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B7F10E3CD
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:58:46 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64d24136663so3716690b3a.0
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 20:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684814326; x=1687406326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hFgDEBtWkxdaSf0o1fyB0Kl+wl9wCHPw3wmasivocYw=;
 b=H8GjifYIl12+U+DbhuYmDNhvn+RImo0E80wRCkUH4LOTSMh02/sJjCr7GYzFp9rKju
 V9afTTbz//rA+F9+WeM3kKQOnTNIR86S26CHxAVNgDcn1IS9oGKbdqkwdtUXi4aRik+l
 9sHXSC16ye96/ZdeMZem4QVl0LCbX69gKzXj6koMgcGTfQ8Z8wpCgkktm9W8KI5CQJhV
 qUcACyzgBuBhX5t8LOe7hSXHrrYUt5cMwJIrNpzAtq040Z7DTOKvnbs5jYi2wEbhKSB5
 pio5Brjau1FXZFnDECwWLqKAA8EzhPakiPahl/YY2PuEkwjS8rPYQDNYxS0XaqnA/nZU
 68Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684814326; x=1687406326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hFgDEBtWkxdaSf0o1fyB0Kl+wl9wCHPw3wmasivocYw=;
 b=Jmf/2U6WdW8kLwiD+Co8B02gAhuUoRHA7KzngJZHYfM2OWIxLzlpEVKxuhC7wgApHU
 IoXX43KT0Y/Z2NM7aq+WOuKibumcTGxtKlgVA8ws20kqkAbc7qVS2n5Uvw8c5fVozxuu
 BHtKd0SUxK1W317/dyKrcsTrvXS/0xiwATsKsjv/7DLpQNe8tQFu45SvRAYNSgVsLjMZ
 MBkx5E/Rwk1NjPasznQphPp8snVPz8JPI7XhkrwbwYRHqVjD+n/nMs7v6gCeD3CKoc/R
 ljXQYHOzFK2fmu7nBFpbKmj6dQ0cXqhILa1tyMekqRDU84y2A1tpl6I5VzH0cTZvFoWy
 Z8DQ==
X-Gm-Message-State: AC+VfDzqS1SZctiAn+UrYOxe3QTjw0jjfiey8TFnWChKVneh8OWRp5ZK
 W3ympacDOTplGktSdopigAP4TbzfUXOykA==
X-Google-Smtp-Source: ACHHUZ5P4Z/8skWwAcZbS/HS6/Eyx1ndQu61t2JPg1gfw3ArY9IDNZli3RU0AOBY9vRFzZUyBAU/dQ==
X-Received: by 2002:a05:6a00:1a15:b0:643:b4d5:e3db with SMTP id
 g21-20020a056a001a1500b00643b4d5e3dbmr17084816pfv.4.1684814325834; 
 Mon, 22 May 2023 20:58:45 -0700 (PDT)
Received: from mrgency.tuatara-tone.ts.net
 ([2600:6c51:4c3f:9541:841e:5ff:fea9:3053])
 by smtp.gmail.com with ESMTPSA id
 i6-20020aa78d86000000b006414289ab69sm4828615pfr.52.2023.05.22.20.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 20:58:45 -0700 (PDT)
From: Christopher Snowhill <kode54@gmail.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 22 May 2023 20:58:03 -0700
Message-Id: <20230523035808.635175-4-kode54@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523035808.635175-1-kode54@gmail.com>
References: <20230523035808.635175-1-kode54@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 3/8] drm/sched: Add
 DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
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

DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
scheduler and entity. No priorities or run queue used in this mode.
Intended for devices with firmware schedulers.

v2 (Christopher): Restore and rebase missing code blocks, s/firmare/firmware/

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Christopher Snowhill <kode54@gmail.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 64 +++++++++++++++++++-----
 drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 63 ++++++++++++++++++++---
 include/drm/gpu_scheduler.h              |  8 +++
 4 files changed, 115 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c61271e520da..912f7aa7b103 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	memset(entity, 0, sizeof(struct drm_sched_entity));
 	INIT_LIST_HEAD(&entity->list);
 	entity->rq = NULL;
+	entity->single_sched = NULL;
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
@@ -91,7 +92,15 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
 	if(num_sched_list) {
-		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+		if (sched_list[0]->sched_policy !=
+		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
+			entity->rq = &sched_list[0]->sched_rq[entity->priority];
+		} else {
+			if (num_sched_list != 1 || sched_list[0]->single_entity)
+				return -EINVAL;
+			sched_list[0]->single_entity = entity;
+			entity->single_sched = sched_list[0];
+		}
 	}
 
 	init_completion(&entity->entity_idle);
@@ -125,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
 				    unsigned int num_sched_list)
 {
-	WARN_ON(!num_sched_list || !sched_list);
+	WARN_ON(!num_sched_list || !sched_list ||
+		!!entity->single_sched);
 
 	entity->sched_list = sched_list;
 	entity->num_sched_list = num_sched_list;
@@ -216,13 +226,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
 	struct dma_fence *prev;
+	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq)
+	if (!entity->rq && !single_entity)
 		return;
 
 	spin_lock(&entity->rq_lock);
 	entity->stopped = true;
-	drm_sched_rq_remove_entity(entity->rq, entity);
+	if (!single_entity)
+		drm_sched_rq_remove_entity(entity->rq, entity);
 	spin_unlock(&entity->rq_lock);
 
 	/* Make sure this entity is not used by the scheduler at the moment */
@@ -244,6 +256,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	dma_fence_put(prev);
 }
 
+/**
+ * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
+ * @entity: scheduler entity
+ *
+ * Returns GPU scheduler for the entity
+ */
+struct drm_gpu_scheduler *
+drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
+{
+	bool single_entity = !!entity->single_sched;
+
+	return single_entity ? entity->single_sched : entity->rq->sched;
+}
+
 /**
  * drm_sched_entity_flush - Flush a context entity
  *
@@ -261,11 +287,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	struct drm_gpu_scheduler *sched;
 	struct task_struct *last_user;
 	long ret = timeout;
+	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq)
+	if (!entity->rq && !single_entity)
 		return 0;
 
-	sched = entity->rq->sched;
+	sched = drm_sched_entity_to_scheduler(entity);
 	/**
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
@@ -358,7 +385,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup(drm_sched_entity_to_scheduler(entity));
 }
 
 /**
@@ -372,6 +399,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority)
 {
+	WARN_ON(!!entity->single_sched);
+
 	spin_lock(&entity->rq_lock);
 	entity->priority = priority;
 	spin_unlock(&entity->rq_lock);
@@ -384,7 +413,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
+	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
 	struct dma_fence *fence = entity->dependency;
 	struct drm_sched_fence *s_fence;
 
@@ -477,7 +506,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
+	    DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -500,6 +530,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
+	WARN_ON(!!entity->single_sched);
+
 	/* single possible engine and already selected */
 	if (!entity->sched_list)
 		return;
@@ -549,12 +581,14 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first, fifo = entity->rq->sched->sched_policy ==
+	bool single_entity = !!entity->single_sched;
+	bool first, fifo = drm_sched_entity_to_scheduler(entity)->sched_policy ==
 		DRM_SCHED_POLICY_FIFO;
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
-	atomic_inc(entity->rq->sched->score);
+	if (!single_entity)
+		atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
 	/*
@@ -567,6 +601,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 	/* first job wakes up scheduler */
 	if (first) {
+		struct drm_gpu_scheduler *sched =
+			drm_sched_entity_to_scheduler(entity);
+
 		/* Add the entity to the run queue */
 		spin_lock(&entity->rq_lock);
 		if (entity->stopped) {
@@ -576,13 +613,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			return;
 		}
 
-		drm_sched_rq_add_entity(entity->rq, entity);
+		if (!single_entity)
+			drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
 		if (fifo)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup(sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index ef120475e7c6..b3b0472dc202 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -215,7 +215,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
-	fence->sched = entity->rq->sched;
+	fence->sched = drm_sched_entity_to_scheduler(entity);
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ead122e99d00..d9efa0bd69c8 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -32,7 +32,8 @@
  * backend operations to the scheduler like submitting a job to hardware run queue,
  * returning the dependencies of a job etc.
  *
- * The organisation of the scheduler is the following:
+ * The organisation of the scheduler is the following for scheduling policies
+ * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
  *
  * 1. Each hw run queue has one scheduler
  * 2. Each scheduler has multiple run queues with different priorities
@@ -41,7 +42,22 @@
  * 4. Entities themselves maintain a queue of jobs that will be scheduled on
  *    the hardware.
  *
- * The jobs in a entity are always scheduled in the order that they were pushed.
+ * The organisation of the scheduler is the following for scheduling policy
+ * DRM_SCHED_POLICY_SINGLE_ENTITY:
+ *
+ * 1. One to one relationship between scheduler and entity
+ * 2. No priorities implemented per scheduler (single job queue)
+ * 3. No run queues in scheduler rather jobs are directly dequeued from entity
+ * 4. The entity maintains a queue of jobs that will be scheduled on the
+ * hardware
+ *
+ * The jobs in a entity are always scheduled in the order that they were pushed
+ * regardless of scheduling policy.
+ *
+ * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
+ * when the KMD is scheduling directly on the hardware while a scheduling policy
+ * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
+ * firmware scheduler.
  *
  * Note that once a job was taken from the entities queue and pushed to the
  * hardware, i.e. the pending queue, the entity must not be referenced anymore
@@ -96,6 +112,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
 
 void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 {
+	WARN_ON(!!entity->single_sched);
+
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
@@ -126,6 +144,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 			      struct drm_sched_rq *rq)
 {
+	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
+
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
@@ -144,6 +164,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity)
 {
+	WARN_ON(!!entity->single_sched);
+
 	if (!list_empty(&entity->list))
 		return;
 
@@ -166,6 +188,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
+	WARN_ON(!!entity->single_sched);
+
 	if (list_empty(&entity->list))
 		return;
 
@@ -696,7 +720,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq)
+	if (!entity->rq && !entity->single_sched)
 		return -ENOENT;
 
 	job->entity = entity;
@@ -729,13 +753,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *entity = job->entity;
+	bool single_entity = !!entity->single_sched;
 
 	BUG_ON(!entity);
-	drm_sched_entity_select_rq(entity);
-	sched = entity->rq->sched;
+	if (!single_entity)
+		drm_sched_entity_select_rq(entity);
+	sched = drm_sched_entity_to_scheduler(entity);
 
 	job->sched = sched;
-	job->s_priority = entity->rq - sched->sched_rq;
+	if (!single_entity)
+		job->s_priority = entity->rq - sched->sched_rq;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
@@ -959,6 +986,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	if (!drm_sched_ready(sched))
 		return NULL;
 
+	if (sched->single_entity) {
+		if (drm_sched_entity_is_ready(sched->single_entity))
+			return sched->single_entity;
+
+		return NULL;
+	}
+
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
@@ -1206,6 +1240,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		return -EINVAL;
 
 	sched->ops = ops;
+	sched->single_entity = NULL;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
 	sched->run_wq = run_wq ? : system_wq;
@@ -1218,7 +1253,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->sched_policy = default_drm_sched_policy;
 	else
 		sched->sched_policy = sched_policy;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
+	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
+	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
+	     i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
 	init_waitqueue_head(&sched->job_scheduled);
@@ -1251,7 +1288,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_run_wq_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	if (sched->single_entity) {
+		spin_lock(&sched->single_entity->rq_lock);
+		sched->single_entity->stopped = true;
+		spin_unlock(&sched->single_entity->rq_lock);
+	}
+
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
+	     DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
+	     i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
 
 		if (!rq)
@@ -1295,6 +1340,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	struct drm_sched_entity *entity;
 	struct drm_gpu_scheduler *sched = bad->sched;
 
+	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
+
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
 	 * corrupt but keep in mind that kernel jobs always considered good.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 929d0d567a0b..1a26f501a400 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -79,6 +79,7 @@ enum drm_sched_policy {
 	DRM_SCHED_POLICY_DEFAULT,
 	DRM_SCHED_POLICY_RR,
 	DRM_SCHED_POLICY_FIFO,
+	DRM_SCHED_POLICY_SINGLE_ENTITY,
 	DRM_SCHED_POLICY_COUNT,
 };
 
@@ -112,6 +113,9 @@ struct drm_sched_entity {
 	 */
 	struct drm_sched_rq		*rq;
 
+	/** @single_sched: Single scheduler */
+	struct drm_gpu_scheduler	*single_sched;
+
 	/**
 	 * @sched_list:
 	 *
@@ -496,6 +500,7 @@ struct drm_sched_backend_ops {
  * struct drm_gpu_scheduler - scheduler instance-specific data
  *
  * @ops: backend operations provided by the driver.
+ * @single_entity: Single entity for the scheduler
  * @hw_submission_limit: the max size of the hardware queue.
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
@@ -527,6 +532,7 @@ struct drm_sched_backend_ops {
  */
 struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
+	struct drm_sched_entity		*single_entity;
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
@@ -612,6 +618,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  struct drm_gpu_scheduler **sched_list,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
+struct drm_gpu_scheduler *
+drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
-- 
2.40.1

