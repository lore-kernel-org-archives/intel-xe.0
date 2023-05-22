Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D357DC77B73
	for <intel-xe@archiver.kernel.org>; Mon, 22 May 2023 07:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A095A10E262;
	Mon, 22 May 2023 07:52:51 +0000 (UTC)
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC3810E262
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 07:52:49 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-55556745aefso173073eaf.3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 May 2023 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684741968; x=1687333968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k/B1lUhRqjpTZQQwjhf91MgxR0Vg2AX9+KufyznteXI=;
 b=HLHadUECoHDUKrElGVTpiLKfzpPprEIOWcBRUo8U14N6jNbH7EtPlsIL3qLnfWl6pB
 nx5NBRiOA1XgDpZI/xZZUa5OVbCPlqAv5HTo7FFepWDlK8WMtSn8ka5B9RJc7mb1IOYS
 yCR41B9Wslx6/0sQpqif3AJMIWh/r7z5GrtrPv0pPiN3zuN2glxApiaz+HEkCM4NQPIa
 Xfih65kbxClYZlwAwfw6dew+f60nET3aPrtoYwgBUC8ioDfJ9eVa5ftDx9iYQ/gvW6OB
 EobwLBIHUJKGfxwjUHubm8/6NCWIU9Whtv2fzG7erZJoMF69Pe6DoF0FdDEVA3qULOq/
 wluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684741968; x=1687333968;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/B1lUhRqjpTZQQwjhf91MgxR0Vg2AX9+KufyznteXI=;
 b=DDpuqDyeJWg5sj7UVp+KQxZGHRBOpkAf95/d8G/85lynnzdgIBy8kTS4WXoWX3HJDY
 k1mZAA4H6DIiwNqpXJ4X7oObsYgW6vxjAuG0R68I1aP563oU3WPnxc/HDjEdmT0FzHE3
 vDRWHsT7BzNRi3JxSJS6VuNFp0tZnS/vouIOftmO8R7oJK8aqcqdPC8SQlNREZ8z8y7k
 pNP9LEJyCO8XcJDWf0IHC77XUVhNNPluUxQUJD9REpzFgaUMFTRQbU+m4LkDLDni+lng
 OM32f3weYUOtTeNamAKZoPc6ziJLYNNj1nx+ZLQ7V910V8eCSVL4rrbCMfdG2+HH5530
 4AcA==
X-Gm-Message-State: AC+VfDwSSQ8h45LN27GuGUNVA/eB2z7lBkjDgZ5PpqvC5tn4Yo3Ty71X
 8bCr1uSn4pOuNjZ8HWFoXzYU1L08fUlXi9qXqvGzxgtbsio=
X-Google-Smtp-Source: ACHHUZ4dFlK2EXT24HZgm9ucl1OJAKSxUTs0KEm6PAZ9NkcI60okRasp1YwGMQXw/retmleCJ4dNnIY3mHHdh6StzYY=
X-Received: by 2002:aca:d0f:0:b0:394:39dc:a4b0 with SMTP id
 15-20020aca0d0f000000b0039439dca4b0mr4828732oin.52.1684741968325; Mon, 22 May
 2023 00:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230522015040.3849776-1-matthew.brost@intel.com>
 <20230522015040.3849776-4-matthew.brost@intel.com>
 <CA+aRtuaBVYTcLu=oWsmOxMmMkmaZxA2Vq9wtkjEO=FBnhBpyZw@mail.gmail.com>
In-Reply-To: <CA+aRtuaBVYTcLu=oWsmOxMmMkmaZxA2Vq9wtkjEO=FBnhBpyZw@mail.gmail.com>
From: Christopher Snowhill <kode54@gmail.com>
Date: Mon, 22 May 2023 00:52:37 -0700
Message-ID: <CA+aRtuaAj3sBgrEqBDNrt0Pi3WpmrzfdvcwLw_YaB=gnFDULuQ@mail.gmail.com>
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

On Sun, May 21, 2023 at 11:52=E2=80=AFPM Christopher Snowhill <kode54@gmail=
.com> wrote:
>
> On Sun, May 21, 2023 at 6:50=E2=80=AFPM Matthew Brost <matthew.brost@inte=
l.com> wrote:
> >
> > DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
> > scheduler and entity. No priorities or run queue used in this mode.
> > Intended for devices with firmware schedulers.
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/scheduler/sched_entity.c | 40 ++++++++++++---
> >  drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
> >  drivers/gpu/drm/scheduler/sched_main.c   | 63 +++++++++++++++++++++---
> >  include/drm/gpu_scheduler.h              |  8 +++
> >  4 files changed, 96 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index e1838e328de8..90e925804a20 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *en=
tity,
> >         memset(entity, 0, sizeof(struct drm_sched_entity));
> >         INIT_LIST_HEAD(&entity->list);
> >         entity->rq =3D NULL;
> > +       entity->single_sched =3D NULL;
> >         entity->guilty =3D guilty;
> >         entity->num_sched_list =3D num_sched_list;
> >         entity->priority =3D priority;
> > @@ -124,7 +125,8 @@ void drm_sched_entity_modify_sched(struct drm_sched=
_entity *entity,
> >                                     struct drm_gpu_scheduler **sched_li=
st,
> >                                     unsigned int num_sched_list)
> >  {
> > -       WARN_ON(!num_sched_list || !sched_list);
> > +       WARN_ON(!num_sched_list || !sched_list ||
> > +               !!entity->single_sched);
> >
> >         entity->sched_list =3D sched_list;
> >         entity->num_sched_list =3D num_sched_list;
> > @@ -215,13 +217,15 @@ static void drm_sched_entity_kill(struct drm_sche=
d_entity *entity)
> >  {
> >         struct drm_sched_job *job;
> >         struct dma_fence *prev;
> > +       bool single_entity =3D !!entity->single_sched;
> >
> > -       if (!entity->rq)
> > +       if (!entity->rq && !single_entity)
> >                 return;
> >
> >         spin_lock(&entity->rq_lock);
> >         entity->stopped =3D true;
> > -       drm_sched_rq_remove_entity(entity->rq, entity);
> > +       if (!single_entity)
> > +               drm_sched_rq_remove_entity(entity->rq, entity);
> >         spin_unlock(&entity->rq_lock);
> >
> >         /* Make sure this entity is not used by the scheduler at the mo=
ment */
> > @@ -243,6 +247,20 @@ static void drm_sched_entity_kill(struct drm_sched=
_entity *entity)
> >         dma_fence_put(prev);
> >  }
> >
> > +/**
> > + * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
> > + * @entity: scheduler entity
> > + *
> > + * Returns GPU scheduler for the entity
> > + */
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
> > +{
> > +       bool single_entity =3D !!entity->single_sched;
> > +
> > +       return single_entity ? entity->single_sched : entity->rq->sched=
;
> > +}
> > +
> >  /**
> >   * drm_sched_entity_flush - Flush a context entity
> >   *
> > @@ -260,11 +278,12 @@ long drm_sched_entity_flush(struct drm_sched_enti=
ty *entity, long timeout)
> >         struct drm_gpu_scheduler *sched;
> >         struct task_struct *last_user;
> >         long ret =3D timeout;
> > +       bool single_entity =3D !!entity->single_sched;
> >
> > -       if (!entity->rq)
> > +       if (!entity->rq && !single_entity)
> >                 return 0;
> >
> > -       sched =3D entity->rq->sched;
> > +       sched =3D drm_sched_entity_to_scheduler(entity);
> >         /**
> >          * The client will not queue more IBs during this fini, consume=
 existing
> >          * queued IBs or discard them on SIGKILL
> > @@ -357,7 +376,7 @@ static void drm_sched_entity_wakeup(struct dma_fenc=
e *f,
> >                 container_of(cb, struct drm_sched_entity, cb);
> >
> >         drm_sched_entity_clear_dep(f, cb);
> > -       drm_sched_wakeup(entity->rq->sched);
> > +       drm_sched_wakeup(drm_sched_entity_to_scheduler(entity));
> >  }
> >
> >  /**
> > @@ -371,6 +390,8 @@ static void drm_sched_entity_wakeup(struct dma_fenc=
e *f,
> >  void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
> >                                    enum drm_sched_priority priority)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         spin_lock(&entity->rq_lock);
> >         entity->priority =3D priority;
> >         spin_unlock(&entity->rq_lock);
> > @@ -383,7 +404,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> >   */
> >  static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity=
 *entity)
> >  {
> > -       struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> > +       struct drm_gpu_scheduler *sched =3D drm_sched_entity_to_schedul=
er(entity);
> >         struct dma_fence *fence =3D entity->dependency;
> >         struct drm_sched_fence *s_fence;
> >
> > @@ -476,7 +497,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(stru=
ct drm_sched_entity *entity)
> >          * Update the entity's location in the min heap according to
> >          * the timestamp of the next job, if any.
> >          */
> > -       if (entity->rq->sched->sched_policy =3D=3D DRM_SCHED_POLICY_FIF=
O) {
> > +       if (drm_sched_entity_to_scheduler(entity)->sched_policy =3D=3D
> > +           DRM_SCHED_POLICY_FIFO) {
> >                 struct drm_sched_job *next;
> >
> >                 next =3D to_drm_sched_job(spsc_queue_peek(&entity->job_=
queue));
> > @@ -499,6 +521,8 @@ void drm_sched_entity_select_rq(struct drm_sched_en=
tity *entity)
> >         struct drm_gpu_scheduler *sched;
> >         struct drm_sched_rq *rq;
> >
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         /* single possible engine and already selected */
> >         if (!entity->sched_list)
> >                 return;
>
> Another great swath removed here:
>
> @@ -522,16 +554,21 @@ void drm_sched_entity_select_rq(struct
> drm_sched_entity *entity)
> void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
> {
> struct drm_sched_entity *entity =3D sched_job->entity;
> + bool single_entity =3D !!entity->single_sched;
> bool first;

The code that this would be rebased against, also needs the `fifo`
variable to be derived from drm_sched_entity_to_scheduler()

> trace_drm_sched_job(sched_job, entity);
> - atomic_inc(entity->rq->sched->score);
> + if (!single_entity)
> + atomic_inc(entity->rq->sched->score);
> WRITE_ONCE(entity->last_user, current->group_leader);
> first =3D spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> sched_job->submit_ts =3D ktime_get();
> /* first job wakes up scheduler */
> if (first) {
> + struct drm_gpu_scheduler *sched =3D
> + drm_sched_entity_to_scheduler(entity);
> +
> /* Add the entity to the run queue */
> spin_lock(&entity->rq_lock);
> if (entity->stopped) {
> @@ -541,13 +578,14 @@ void drm_sched_entity_push_job(struct
> drm_sched_job *sched_job)
> return;
> }
> - drm_sched_rq_add_entity(entity->rq, entity);
> + if (!single_entity)
> + drm_sched_rq_add_entity(entity->rq, entity);
> spin_unlock(&entity->rq_lock);
> - if (entity->rq->sched->sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> + if (sched->sched_policy =3D=3D DRM_SCHED_POLICY_FIFO)
> drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
> - drm_sched_wakeup(entity->rq->sched);
> + drm_sched_wakeup(sched);
> }
> }
> EXPORT_SYMBOL(drm_sched_entity_push_job);
>
> Sorry for the formatting, I'm replying in gmail because I don't have a
> local client set up. I really should have set the mailing list to use
> my Fastmail account instead.
>
> > diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/=
scheduler/sched_fence.c
> > index ef120475e7c6..b3b0472dc202 100644
> > --- a/drivers/gpu/drm/scheduler/sched_fence.c
> > +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> > @@ -215,7 +215,7 @@ void drm_sched_fence_init(struct drm_sched_fence *f=
ence,
> >  {
> >         unsigned seq;
> >
> > -       fence->sched =3D entity->rq->sched;
> > +       fence->sched =3D drm_sched_entity_to_scheduler(entity);
> >         seq =3D atomic_inc_return(&entity->fence_seq);
> >         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_schedule=
d,
> >                        &fence->lock, entity->fence_context, seq);
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> > index ead122e99d00..d9efa0bd69c8 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -32,7 +32,8 @@
> >   * backend operations to the scheduler like submitting a job to hardwa=
re run queue,
> >   * returning the dependencies of a job etc.
> >   *
> > - * The organisation of the scheduler is the following:
> > + * The organisation of the scheduler is the following for scheduling p=
olicies
> > + * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
> >   *
> >   * 1. Each hw run queue has one scheduler
> >   * 2. Each scheduler has multiple run queues with different priorities
> > @@ -41,7 +42,22 @@
> >   * 4. Entities themselves maintain a queue of jobs that will be schedu=
led on
> >   *    the hardware.
> >   *
> > - * The jobs in a entity are always scheduled in the order that they we=
re pushed.
> > + * The organisation of the scheduler is the following for scheduling p=
olicy
> > + * DRM_SCHED_POLICY_SINGLE_ENTITY:
> > + *
> > + * 1. One to one relationship between scheduler and entity
> > + * 2. No priorities implemented per scheduler (single job queue)
> > + * 3. No run queues in scheduler rather jobs are directly dequeued fro=
m entity
> > + * 4. The entity maintains a queue of jobs that will be scheduled on t=
he
> > + * hardware
> > + *
> > + * The jobs in a entity are always scheduled in the order that they we=
re pushed
> > + * regardless of scheduling policy.
> > + *
> > + * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expecte=
d to used
> > + * when the KMD is scheduling directly on the hardware while a schedul=
ing policy
> > + * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there=
 is a
> > + * firmare scheduler.
> >   *
> >   * Note that once a job was taken from the entities queue and pushed t=
o the
> >   * hardware, i.e. the pending queue, the entity must not be referenced=
 anymore
> > @@ -96,6 +112,8 @@ static inline void drm_sched_rq_remove_fifo_locked(s=
truct drm_sched_entity *enti
> >
> >  void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t=
 ts)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         /*
> >          * Both locks need to be grabbed, one to protect from entity->r=
q change
> >          * for entity from within concurrent drm_sched_entity_select_rq=
 and the
> > @@ -126,6 +144,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_enti=
ty *entity, ktime_t ts)
> >  static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
> >                               struct drm_sched_rq *rq)
> >  {
> > +       WARN_ON(sched->sched_policy =3D=3D DRM_SCHED_POLICY_SINGLE_ENTI=
TY);
> > +
> >         spin_lock_init(&rq->lock);
> >         INIT_LIST_HEAD(&rq->entities);
> >         rq->rb_tree_root =3D RB_ROOT_CACHED;
> > @@ -144,6 +164,8 @@ static void drm_sched_rq_init(struct drm_gpu_schedu=
ler *sched,
> >  void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
> >                              struct drm_sched_entity *entity)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         if (!list_empty(&entity->list))
> >                 return;
> >
> > @@ -166,6 +188,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *r=
q,
> >  void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
> >                                 struct drm_sched_entity *entity)
> >  {
> > +       WARN_ON(!!entity->single_sched);
> > +
> >         if (list_empty(&entity->list))
> >                 return;
> >
> > @@ -696,7 +720,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >                        struct drm_sched_entity *entity,
> >                        void *owner)
> >  {
> > -       if (!entity->rq)
> > +       if (!entity->rq && !entity->single_sched)
> >                 return -ENOENT;
> >
> >         job->entity =3D entity;
> > @@ -729,13 +753,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
> >  {
> >         struct drm_gpu_scheduler *sched;
> >         struct drm_sched_entity *entity =3D job->entity;
> > +       bool single_entity =3D !!entity->single_sched;
> >
> >         BUG_ON(!entity);
> > -       drm_sched_entity_select_rq(entity);
> > -       sched =3D entity->rq->sched;
> > +       if (!single_entity)
> > +               drm_sched_entity_select_rq(entity);
> > +       sched =3D drm_sched_entity_to_scheduler(entity);
> >
> >         job->sched =3D sched;
> > -       job->s_priority =3D entity->rq - sched->sched_rq;
> > +       if (!single_entity)
> > +               job->s_priority =3D entity->rq - sched->sched_rq;
> >         job->id =3D atomic64_inc_return(&sched->job_id_count);
> >
> >         drm_sched_fence_init(job->s_fence, job->entity);
> > @@ -959,6 +986,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *=
sched)
> >         if (!drm_sched_ready(sched))
> >                 return NULL;
> >
> > +       if (sched->single_entity) {
> > +               if (drm_sched_entity_is_ready(sched->single_entity))
> > +                       return sched->single_entity;
> > +
> > +               return NULL;
> > +       }
> > +
> >         /* Kernel run queue has higher priority than normal run queue*/
> >         for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIOR=
ITY_MIN; i--) {
> >                 entity =3D sched->sched_policy =3D=3D DRM_SCHED_POLICY_=
FIFO ?
> > @@ -1206,6 +1240,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
> >                 return -EINVAL;
> >
> >         sched->ops =3D ops;
> > +       sched->single_entity =3D NULL;
> >         sched->hw_submission_limit =3D hw_submission;
> >         sched->name =3D name;
> >         sched->run_wq =3D run_wq ? : system_wq;
> > @@ -1218,7 +1253,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sche=
d,
> >                 sched->sched_policy =3D default_drm_sched_policy;
> >         else
> >                 sched->sched_policy =3D sched_policy;
> > -       for (i =3D DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT=
; i++)
> > +       for (i =3D DRM_SCHED_PRIORITY_MIN; sched_policy !=3D
> > +            DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_C=
OUNT;
> > +            i++)
> >                 drm_sched_rq_init(sched, &sched->sched_rq[i]);
> >
> >         init_waitqueue_head(&sched->job_scheduled);
> > @@ -1251,7 +1288,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sc=
hed)
> >
> >         drm_sched_run_wq_stop(sched);
> >
> > -       for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; i >=3D DRM_SCHED_PRIOR=
ITY_MIN; i--) {
> > +       if (sched->single_entity) {
> > +               spin_lock(&sched->single_entity->rq_lock);
> > +               sched->single_entity->stopped =3D true;
> > +               spin_unlock(&sched->single_entity->rq_lock);
> > +       }
> > +
> > +       for (i =3D DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
=3D
> > +            DRM_SCHED_POLICY_SINGLE_ENTITY && i >=3D DRM_SCHED_PRIORIT=
Y_MIN;
> > +            i--) {
> >                 struct drm_sched_rq *rq =3D &sched->sched_rq[i];
> >
> >                 if (!rq)
> > @@ -1295,6 +1340,8 @@ void drm_sched_increase_karma(struct drm_sched_jo=
b *bad)
> >         struct drm_sched_entity *entity;
> >         struct drm_gpu_scheduler *sched =3D bad->sched;
> >
> > +       WARN_ON(sched->sched_policy =3D=3D DRM_SCHED_POLICY_SINGLE_ENTI=
TY);
> > +
> >         /* don't change @bad's karma if it's from KERNEL RQ,
> >          * because sometimes GPU hang would cause kernel jobs (like VM =
updating jobs)
> >          * corrupt but keep in mind that kernel jobs always considered =
good.
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 929d0d567a0b..1a26f501a400 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -79,6 +79,7 @@ enum drm_sched_policy {
> >         DRM_SCHED_POLICY_DEFAULT,
> >         DRM_SCHED_POLICY_RR,
> >         DRM_SCHED_POLICY_FIFO,
> > +       DRM_SCHED_POLICY_SINGLE_ENTITY,
> >         DRM_SCHED_POLICY_COUNT,
> >  };
> >
> > @@ -112,6 +113,9 @@ struct drm_sched_entity {
> >          */
> >         struct drm_sched_rq             *rq;
> >
> > +       /** @single_sched: Single scheduler */
> > +       struct drm_gpu_scheduler        *single_sched;
> > +
> >         /**
> >          * @sched_list:
> >          *
> > @@ -496,6 +500,7 @@ struct drm_sched_backend_ops {
> >   * struct drm_gpu_scheduler - scheduler instance-specific data
> >   *
> >   * @ops: backend operations provided by the driver.
> > + * @single_entity: Single entity for the scheduler
> >   * @hw_submission_limit: the max size of the hardware queue.
> >   * @timeout: the time after which a job is removed from the scheduler.
> >   * @name: name of the ring for which this scheduler is being used.
> > @@ -527,6 +532,7 @@ struct drm_sched_backend_ops {
> >   */
> >  struct drm_gpu_scheduler {
> >         const struct drm_sched_backend_ops      *ops;
> > +       struct drm_sched_entity         *single_entity;
> >         uint32_t                        hw_submission_limit;
> >         long                            timeout;
> >         const char                      *name;
> > @@ -612,6 +618,8 @@ int drm_sched_entity_init(struct drm_sched_entity *=
entity,
> >                           struct drm_gpu_scheduler **sched_list,
> >                           unsigned int num_sched_list,
> >                           atomic_t *guilty);
> > +struct drm_gpu_scheduler *
> > +drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
> >  long drm_sched_entity_flush(struct drm_sched_entity *entity, long time=
out);
> >  void drm_sched_entity_fini(struct drm_sched_entity *entity);
> >  void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> > --
> > 2.34.1
> >
