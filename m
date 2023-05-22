Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675CBC77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 05:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0269410E246;
	Mon, 22 May 2023 05:49:06 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5287710E246
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 05:49:03 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3909756b8b1so1872382b6e.1
 for <intel-xe@lists.freedesktop.org>; Sun, 21 May 2023 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684734542; x=1687326542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KAEQBFb/COiamyGmMOVXwAJqXla/AI7UTGYstEVHL38=;
 b=hjoHvOfEEciHU5z3BGRemevWXT8ji1yo4Pgz6VJ0yxk97uKbnfLqg/ev1q1hqPoYOQ
 EuA0bIOqYo9FSSPVbUf16M9EzBB5fXWX7qZk2+Gs1SeT/m22lzerJ9sEbGt55bsEeE2x
 bxT1iFn7WclLVMLSA43b6gqvyfAps5utGo9hTiPMhbIGU4sTkgW22DkVYxIfpouOl75j
 94ZdFHAsbQxl7ycA74kwd4+LC9rSO3htt9rTbUxBwd2/rlucAtDWkw8H3ExOLfIB2i0w
 vPeyeK7K/Rj3Qcq5cf1JMBbHxdl6tKS+mepmUb9bqGDRmHJBvsjowDU+OTdVYmGYjlj7
 MITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684734542; x=1687326542;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAEQBFb/COiamyGmMOVXwAJqXla/AI7UTGYstEVHL38=;
 b=LlE8eqUKXV+hI9fDkrQy87nfjZ/U7f9T4DrYMgFxuUCgqy9psDWHfwrPaUw06sM0py
 tJkwiccE5ry0Ym56SFsfQ/8yt0/Bh0fIzu5LvvkcBzOaoeBDqjvHEHKnpDOXvfpYBrGU
 1prAU8sw6NOiZTOcAd/2fkbLZkociptmMBmRknlh3yy6mw8lYwRV60QK9O6QRW6wVRzD
 P3Zhjxn+mPW0RyZVB/2c+XErBMp16shZJWchd/18ZSO2CQBj9pRCDpWBE2y2pzWGJR3u
 NNyAkxOYkmpLb02oBbTdVOcCyIPFQYFFUe6JCjakAWUMy/L5kuR7s1TqwbnQtoX+6dJV
 bytQ==
X-Gm-Message-State: AC+VfDxvL1W3Z6rWnXfUNTp5ZWToUIGLFOfM24Yvf1GOoqZ8dG2QF9Z+
 yRI7dx0OCtj5O7OyOqAo9plTJfDZapvJNY5snh4=
X-Google-Smtp-Source: ACHHUZ66I7YPwTyxKWfi+zKhLp0lA2+61ZAErBaMLJDZR9MTEnl/knNdrABMZ46yoDnztB7Hv6sh4uFU3ru8VFx9sPk=
X-Received: by 2002:a05:6808:a01:b0:38c:a20d:d376 with SMTP id
 n1-20020a0568080a0100b0038ca20dd376mr4617394oij.39.1684734541484; Sun, 21 May
 2023 22:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230522015040.3849776-1-matthew.brost@intel.com>
 <20230522015040.3849776-4-matthew.brost@intel.com>
In-Reply-To: <20230522015040.3849776-4-matthew.brost@intel.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Sun, 21 May 2023 22:48:50 -0700
Message-ID: <CA+aRtuZHM=ncF_E5exeN2QayVv3gX+a-m2xOAgNiX5kP3GBTaA@mail.gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 3/8] drm/sched: Add
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, May 21, 2023 at 6:50=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> scheduler and entity. No priorities or run queue used in this mode.
> Intended for devices with firmware schedulers.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 40 ++++++++++++---
>  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
>  drivers/gpu/drm/scheduler/sched_main.c   | 63 +++++++++++++++++++++---
>  include/drm/gpu_scheduler.h              |  8 +++
>  4 files changed, 96 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index e1838e328de8..90e925804a20 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *enti=
ty,
>         memset(entity, 0, sizeof(struct drm_sched_entity));
>         INIT_LIST_HEAD(&entity->list);
>         entity->rq =3D NULL;
> +       entity->single_sched =3D NULL;
>         entity->guilty =3D guilty;
>         entity->num_sched_list =3D num_sched_list;
>         entity->priority =3D priority;

This very important patch segment was omitted here:

@@ -91,7 +92,15 @@  int drm_sched_entity_init(struct drm_sched_entity *enti=
ty,
  RB_CLEAR_NODE(&entity->rb_tree_node);

  if(num_sched_list) {
- entity->rq =3D &sched_list[0]->sched_rq[entity->priority];
+ if (sched_list[0]->sched_policy !=3D
+    DRM_SCHED_POLICY_SINGLE_ENTITY) {
+ entity->rq =3D &sched_list[0]->sched_rq[entity->priority];
+ } else {
+ if (num_sched_list !=3D 1 || sched_list[0]->single_entity)
+ return -EINVAL;
+ sched_list[0]->single_entity =3D entity;
+ entity->single_sched =3D sched_list[0];
+ }
  }

  init_completion(&entity->entity_idle);


> @@ -124,7 +125,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_e=
ntity *entity,
>                                     struct drm_gpu_scheduler **sched_list=
,
>                                     unsigned int num_sched_list)
>  {
> -       WARN_ON(!num_sched_list || !sched_list);
> +       WARN_ON(!num_sched_list || !sched_list ||
> +               !!entity->single_sched);
>
>         entity->sched_list =3D sched_list;
>         entity->num_sched_list =3D num_sched_list;
> @@ -215,13 +217,15 @@ static void drm_sched_entity_kill(struct drm_sched_=
entity *entity)
>  {
>         struct drm_sched_job *job;
>         struct dma_fence *prev;
> +       bool single_entity =3D !!entity->single_sched;
>
> -       if (!entity->rq)
> +       if (!entity->rq && !single_entity)
>                 return;
>
>         spin_lock(&entity->rq_lock);
>         entity->stopped =3D true;
> -       drm_sched_rq_remove_entity(entity->rq, entity);
> +       if (!single_entity)
> +               drm_sched_rq_remove_entity(entity->rq, entity);
>         spin_unlock(&entity->rq_lock);
>
>         /* Make sure this entity is not used by the scheduler at the mome=
nt */
> @@ -243,6 +247,20 @@ static void drm_sched_entity_kill(struct drm_sched_e=
ntity *entity)
>         dma_fence_put(prev);
>  }
>
> +/**
> + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> + * @entity: scheduler entity
> + *
> + * Returns GPU scheduler for the entity
> + */
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> +{
> +       bool single_entity =3D !!entity->single_sched;
> +
> +       return single_entity ? entity->single_sched : entity->rq->sched;
> +}
> +
>  /**
>   * drm_sched_entity_flush - Flush a context entity
>   *
> @@ -260,11 +278,12 @@ long drm_sched_entity_flush(struct drm_sched_entity=
 *entity, long timeout)
>         struct drm_gpu_scheduler *sched;
>         struct task_struct *last_user;
>         long ret =3D timeout;
> +       bool single_entity =3D !!entity->single_sched;
>
> -       if (!entity->rq)
> +       if (!entity->rq && !single_entity)
>                 return 0;
>
> -       sched =3D entity->rq->sched;
> +       sched =3D drm_sched_entity_to_scheduler(entity);
>         /**
>          * The client will not queue more IBs during this fini, consume e=
xisting
>          * queued IBs or discard them on SIGKILL
> @@ -357,7 +376,7 @@ static void drm_sched_entity_wakeup(struct dma_fence =
*f,
>                 container_of(cb, struct drm_sched_entity, cb);
>
>         drm_sched_entity_clear_dep(f, cb);
> -       drm_sched_wakeup(entity->rq->sched);
> +       drm_sched_wakeup(drm_sched_entity_to_scheduler(entity));
>  }
>
>  /**
> @@ -371,6 +390,8 @@ static void drm_sched_entity_wakeup(struct dma_fence =
*f,
>  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>                                    enum drm_sched_priority priority)
>  {
> +       WARN_ON(!!entity->single_sched);
> +
>         spin_lock(&entity->rq_lock);
>         entity->priority =3D priority;
>         spin_unlock(&entity->rq_lock);
> @@ -383,7 +404,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
>   */
>  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *=
entity)
>  {
> -       struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> +       struct drm_gpu_scheduler *sched =3D drm_sched_entity_to_scheduler=
(entity);
>         struct dma_fence *fence =3D entity->dependency;
>         struct drm_sched_fence *s_fence;
>
> @@ -476,7 +497,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct=
 drm_sched_entity *entity)
>          * Update the entity's location in the min heap according to
>          * the timestamp of the next job, if any.
>          */
> -       if (entity->rq->sched->sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)=
 {
> +       if (drm_sched_entity_to_scheduler(entity)->sched_policy =3D=3D
> +           DRM_SCHED_POLICY_FIFO) {
>                 struct drm_sched_job *next;
>
>                 next =3D to_drm_sched_job(spsc_queue_peek(&entity->job_qu=
eue));
> @@ -499,6 +521,8 @@ void drm_sched_entity_select_rq(struct drm_sched_enti=
ty *entity)
>         struct drm_gpu_scheduler *sched;
>         struct drm_sched_rq *rq;
>
> +       WARN_ON(!!entity->single_sched);
> +
>         /* single possible engine and already selected */
>         if (!entity->sched_list)
>                 return;
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/sc=
heduler/sched_fence.c
> index ef120475e7c6..b3b0472dc202 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -215,7 +215,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fen=
ce,
>  {
>         unsigned seq;
>
> -       fence->sched =3D entity->rq->sched;
> +       fence->sched =3D drm_sched_entity_to_scheduler(entity);
>         seq =3D atomic_inc_return(&entity->fence_seq);
>         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>                        &fence->lock, entity->fence_context, seq);
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index ead122e99d00..d9efa0bd69c8 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -32,7 +32,8 @@
>   * backend operations to the scheduler like submitting a job to hardware=
 run queue,
>   * returning the dependencies of a job etc.
>   *
> - * The organisation of the scheduler is the following:
> + * The organisation of the scheduler is the following for scheduling pol=
icies
> + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
>   *
>   * 1. Each hw run queue has one scheduler
>   * 2. Each scheduler has multiple run queues with different priorities
> @@ -41,7 +42,22 @@
>   * 4. Entities themselves maintain a queue of jobs that will be schedule=
d on
>   *    the hardware.
>   *
> - * The jobs in a entity are always scheduled in the order that they were=
 pushed.
> + * The organisation of the scheduler is the following for scheduling pol=
icy
> + * DRM_SCHED_POLICY_SINGLE_ENTITY:
> + *
> + * 1. One to one relationship between scheduler and entity
> + * 2. No priorities implemented per scheduler (single job queue)
> + * 3. No run queues in scheduler rather jobs are directly dequeued from =
entity
> + * 4. The entity maintains a queue of jobs that will be scheduled on the
> + * hardware
> + *
> + * The jobs in a entity are always scheduled in the order that they were=
 pushed
> + * regardless of scheduling policy.
> + *
> + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected =
to used
> + * when the KMD is scheduling directly on the hardware while a schedulin=
g policy
> + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there i=
s a
> + * firmare scheduler.
>   *
>   * Note that once a job was taken from the entities queue and pushed to =
the
>   * hardware, i.e. the pending queue, the entity must not be referenced a=
nymore
> @@ -96,6 +112,8 @@ static inline void drm_sched_rq_remove_fifo_locked(str=
uct drm_sched_entity *enti
>
>  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t t=
s)
>  {
> +       WARN_ON(!!entity->single_sched);
> +
>         /*
>          * Both locks need to be grabbed, one to protect from entity->rq =
change
>          * for entity from within concurrent drm_sched_entity_select_rq a=
nd the
> @@ -126,6 +144,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity=
 *entity, ktime_t ts)
>  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
>                               struct drm_sched_rq *rq)
>  {
> +       WARN_ON(sched->sched_policy =3D=3D DRM_SCHED_POLICY_SINGLE_ENTITY=
);
> +
>         spin_lock_init(&rq->lock);
>         INIT_LIST_HEAD(&rq->entities);
>         rq->rb_tree_root =3D RB_ROOT_CACHED;
> @@ -144,6 +164,8 @@ static void drm_sched_rq_init(struct drm_gpu_schedule=
r *sched,
>  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>                              struct drm_sched_entity *entity)
>  {
> +       WARN_ON(!!entity->single_sched);
> +
>         if (!list_empty(&entity->list))
>                 return;
>
> @@ -166,6 +188,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>                                 struct drm_sched_entity *entity)
>  {
> +       WARN_ON(!!entity->single_sched);
> +
>         if (list_empty(&entity->list))
>                 return;
>
> @@ -696,7 +720,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>                        struct drm_sched_entity *entity,
>                        void *owner)
>  {
> -       if (!entity->rq)
> +       if (!entity->rq && !entity->single_sched)
>                 return -ENOENT;
>
>         job->entity =3D entity;
> @@ -729,13 +753,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
>  {
>         struct drm_gpu_scheduler *sched;
>         struct drm_sched_entity *entity =3D job->entity;
> +       bool single_entity =3D !!entity->single_sched;
>
>         BUG_ON(!entity);
> -       drm_sched_entity_select_rq(entity);
> -       sched =3D entity->rq->sched;
> +       if (!single_entity)
> +               drm_sched_entity_select_rq(entity);
> +       sched =3D drm_sched_entity_to_scheduler(entity);
>
>         job->sched =3D sched;
> -       job->s_priority =3D entity->rq - sched->sched_rq;
> +       if (!single_entity)
> +               job->s_priority =3D entity->rq - sched->sched_rq;
>         job->id =3D atomic64_inc_return(&sched->job_id_count);
>
>         drm_sched_fence_init(job->s_fence, job->entity);
> @@ -959,6 +986,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sc=
hed)
>         if (!drm_sched_ready(sched))
>                 return NULL;
>
> +       if (sched->single_entity) {
> +               if (drm_sched_entity_is_ready(sched->single_entity))
> +                       return sched->single_entity;
> +
> +               return NULL;
> +       }
> +
>         /* Kernel run queue has higher priority than normal run queue*/
>         for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIORIT=
Y_MIN; i--) {
>                 entity =3D sched->sched_policy =3D=3D DRM_SCHED_POLICY_FI=
FO ?
> @@ -1206,6 +1240,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>                 return -EINVAL;
>
>         sched->ops =3D ops;
> +       sched->single_entity =3D NULL;
>         sched->hw_submission_limit =3D hw_submission;
>         sched->name =3D name;
>         sched->run_wq =3D run_wq ? : system_wq;
> @@ -1218,7 +1253,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>                 sched->sched_policy =3D default_drm_sched_policy;
>         else
>                 sched->sched_policy =3D sched_policy;
> -       for (i =3D DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; =
i++)
> +       for (i =3D DRM_SCHED_PRIORITY_MIN; sched_policy !=3D
> +            DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COU=
NT;
> +            i++)
>                 drm_sched_rq_init(sched, &sched->sched_rq[i]);
>
>         init_waitqueue_head(&sched->job_scheduled);
> @@ -1251,7 +1288,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sche=
d)
>
>         drm_sched_run_wq_stop(sched);
>
> -       for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIORIT=
Y_MIN; i--) {
> +       if (sched->single_entity) {
> +               spin_lock(&sched->single_entity->rq_lock);
> +               sched->single_entity->stopped =3D true;
> +               spin_unlock(&sched->single_entity->rq_lock);
> +       }
> +
> +       for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=3D
> +            DRM_SCHED_POLICY_SINGLE_ENTITY && i >=3D DRM_SCHED_PRIORITY_=
MIN;
> +            i--) {
>                 struct drm_sched_rq *rq =3D &sched->sched_rq[i];
>
>                 if (!rq)
> @@ -1295,6 +1340,8 @@ void drm_sched_increase_karma(struct drm_sched_job =
*bad)
>         struct drm_sched_entity *entity;
>         struct drm_gpu_scheduler *sched =3D bad->sched;
>
> +       WARN_ON(sched->sched_policy =3D=3D DRM_SCHED_POLICY_SINGLE_ENTITY=
);
> +
>         /* don't change @bad's karma if it's from KERNEL RQ,
>          * because sometimes GPU hang would cause kernel jobs (like VM up=
dating jobs)
>          * corrupt but keep in mind that kernel jobs always considered go=
od.
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 929d0d567a0b..1a26f501a400 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -79,6 +79,7 @@ enum drm_sched_policy {
>         DRM_SCHED_POLICY_DEFAULT,
>         DRM_SCHED_POLICY_RR,
>         DRM_SCHED_POLICY_FIFO,
> +       DRM_SCHED_POLICY_SINGLE_ENTITY,
>         DRM_SCHED_POLICY_COUNT,
>  };
>
> @@ -112,6 +113,9 @@ struct drm_sched_entity {
>          */
>         struct drm_sched_rq             *rq;
>
> +       /** @single_sched: Single scheduler */
> +       struct drm_gpu_scheduler        *single_sched;
> +
>         /**
>          * @sched_list:
>          *
> @@ -496,6 +500,7 @@ struct drm_sched_backend_ops {
>   * struct drm_gpu_scheduler - scheduler instance-specific data
>   *
>   * @ops: backend operations provided by the driver.
> + * @single_entity: Single entity for the scheduler
>   * @hw_submission_limit: the max size of the hardware queue.
>   * @timeout: the time after which a job is removed from the scheduler.
>   * @name: name of the ring for which this scheduler is being used.
> @@ -527,6 +532,7 @@ struct drm_sched_backend_ops {
>   */
>  struct drm_gpu_scheduler {
>         const struct drm_sched_backend_ops      *ops;
> +       struct drm_sched_entity         *single_entity;
>         uint32_t                        hw_submission_limit;
>         long                            timeout;
>         const char                      *name;
> @@ -612,6 +618,8 @@ int drm_sched_entity_init(struct drm_sched_entity *en=
tity,
>                           struct drm_gpu_scheduler **sched_list,
>                           unsigned int num_sched_list,
>                           atomic_t *guilty);
> +struct drm_gpu_scheduler *
> +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeou=
t);
>  void drm_sched_entity_fini(struct drm_sched_entity *entity);
>  void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> --
> 2.34.1
>
