Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB4CD41D6F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 09:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188BD10E59C;
	Tue, 12 Nov 2024 09:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iGsh6vl9";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363C110E316
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731402387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1IewQLxSSwA7hbxAK8aRfjKl/m3ofUJ/UHELGxM2r6k=;
 b=iGsh6vl9xVbIrxzll7FhEgIDJxXVYeIOzf+2654DxKJRESS97V3jixijiTNTIdVpesVX0k
 ZOM2WRKe+zhT7TxL4OUUKaa+CyHqODr3TaFQwWphmgfoE5U6XLaH4oiLiTRGdAOFTp9wEk
 8KDz3RbEFNnr0Y4bp9JahOieYPIyVH8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-Lqy2D2XYO_q8ZrhrVb4KnQ-1; Tue, 12 Nov 2024 04:06:25 -0500
X-MC-Unique: Lqy2D2XYO_q8ZrhrVb4KnQ-1
X-Mimecast-MFC-AGG-ID: Lqy2D2XYO_q8ZrhrVb4KnQ
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6d3a68951ccso61610786d6.3
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 01:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731402385; x=1732007185;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=11hFfmbSfQqPt6KbdhdgQtegIGl4WH7wX8Kr3DQn03U=;
 b=Iu83wBNwNz8fqBSAnZbmqCRY6Zt2LeAOVFAK8theDcWjwP6FRW4PLSyjiZFMM/vU0g
 dP3hS6f+XYNK6IjSjPCaOHTFuwb5ObVEYjIUwmu9NRXkDVhEfNu3kt4c9YWiktg8grwL
 leWelrUMiKEeHkugMxG+wwBfPYqjnJJox056w3ardNDh5ncN+0c+cAbnvwIdrc0ggSQs
 sDaBrFW0aWec/j2yJ8jHT5V+BWlBZQzTvREPDM6uJa4Sv6owIYlYnuC+XMVAtvG0h6F4
 gXgOUWbE9s1vNo0/u5bMKTbDkYXeFTPYPKyVwm6aan78bam/NzRvT8P/jiONZ4uo8DJc
 bhKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTORJTCBmUuWhs/ToZhIazlI55dP6SqXblc4uLVY5RIc2HnOQhgbYu8DdvkpaCkFJulBCjv8/4Rg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymBw1h+xsL8KajA48MtWr9DuoKo7cO5VqPO17SF7BuUcl9GOxz
 Vj8kbAm8T8eFONnSiNRANClK//9saIy+qBn4StAQ0MCG8kgwO2w9vimf0bz95Waz8ZiXWioI+gP
 0XGgCC0vsKN9hJGXFUGxrqkTPe3NhcQD4OVjVrTQmLYe9ON0aiktC1yw9J9yxi550
X-Received: by 2002:a05:6214:5d8c:b0:6cc:1322:21d9 with SMTP id
 6a1803df08f44-6d39e15508amr221061666d6.1.1731402385150; 
 Tue, 12 Nov 2024 01:06:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFOgvRI7BuNeBNA4odJ2QCOiXRYMN6hw1bfELFtmKnZ04b9U8fEbRlJfWF8F1OeIhMArzxOsA==
X-Received: by 2002:a05:6214:5d8c:b0:6cc:1322:21d9 with SMTP id
 6a1803df08f44-6d39e15508amr221061356d6.1.1731402384808; 
 Tue, 12 Nov 2024 01:06:24 -0800 (PST)
Received: from [10.32.64.16] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d3966317cesm68959516d6.111.2024.11.12.01.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 01:06:24 -0800 (PST)
Message-ID: <132fdacc1fdbca9bf05cbcbeee8727426675a55a.camel@redhat.com>
Subject: Re: [RFC PATCH 2/6] drm/sched: Teach scheduler about
 DMA_RESV_USAGE_PREEMPT
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: simona.vetter@ffwll.ch, thomas.hellstrom@linux.intel.com, 
 boris.brezillon@collabora.com, airlied@gmail.com, ltuikov89@gmail.com, 
 dakr@kernel.org, christian.koenig@amd.com, mihail.atanassov@arm.com, 
 steven.price@arm.com, shashank.sharma@amd.com
Date: Tue, 12 Nov 2024 10:06:21 +0100
In-Reply-To: <20241109172942.482630-3-matthew.brost@intel.com>
References: <20241109172942.482630-1-matthew.brost@intel.com>
 <20241109172942.482630-3-matthew.brost@intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SLLMDVqhts9uE44NMhzVn83yENJT-GwsqJW1GRCIhf8_1731402385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Matt,

On Sat, 2024-11-09 at 09:29 -0800, Matthew Brost wrote:
> Follow the semantics of DMA_RESV_USAGE_PREEMPT in the DRM scheduler
> by
> storing preemptive fences in a dedicated xarray, which is waited on
> after all other fences are signaled. In addition to following these
> semantics, pipeline preemptive fences by enabling signaling on all
> preemptive fences before waiting on any of them.

the commit message lacks the *motivation*. Why is the current state a
problem, why is that feature needed etc.

>=20
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Luben Tuikov <ltuikov89@gmail.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 29 ++++++++++++--
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0 | 48 +++++++++++=
+++++------
> --
> =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15 ++++++++
> =C2=A03 files changed, 73 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index 69bcf0e99d57..c6c4978aa65a 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -201,11 +201,13 @@ static void
> drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> =C2=A0=09struct drm_sched_job *job =3D container_of(cb, struct
> drm_sched_job,
> =C2=A0=09=09=09=09=09=09 finish_cb);
> =C2=A0=09unsigned long index;
> +=09struct xarray *dependencies =3D &job->dependencies;
> =C2=A0
> =C2=A0=09dma_fence_put(f);
> =C2=A0
> +again:
> =C2=A0=09/* Wait for all dependencies to avoid data corruptions */
> -=09xa_for_each(&job->dependencies, index, f) {
> +=09xa_for_each(dependencies, index, f) {
> =C2=A0=09=09struct drm_sched_fence *s_fence =3D
> to_drm_sched_fence(f);
> =C2=A0
> =C2=A0=09=09if (s_fence && f =3D=3D &s_fence->scheduled) {
> @@ -223,7 +225,7 @@ static void drm_sched_entity_kill_jobs_cb(struct
> dma_fence *f,
> =C2=A0=09=09=09dma_fence_put(&s_fence->scheduled);
> =C2=A0=09=09}
> =C2=A0
> -=09=09xa_erase(&job->dependencies, index);
> +=09=09xa_erase(dependencies, index);
> =C2=A0=09=09if (f && !dma_fence_add_callback(f, &job->finish_cb,
> =C2=A0=09=09=09=09=09=09
> drm_sched_entity_kill_jobs_cb))
> =C2=A0=09=09=09return;
> @@ -231,6 +233,11 @@ static void drm_sched_entity_kill_jobs_cb(struct
> dma_fence *f,
> =C2=A0=09=09dma_fence_put(f);
> =C2=A0=09}
> =C2=A0
> +=09if (dependencies !=3D &job->preempt_dependencies) {
> +=09=09dependencies =3D &job->preempt_dependencies;
> +=09=09goto again;
> +=09}
> +

I think this should have a comment. It can only trigger once, right? So
I guess that's why it doesn't make sense considering making it a loop
instead of goto upwards?

> =C2=A0=09INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
> =C2=A0=09schedule_work(&job->work);
> =C2=A0}
> @@ -456,17 +463,33 @@ drm_sched_job_dependency(struct drm_sched_job
> *job,
> =C2=A0=09=09=09 struct drm_sched_entity *entity)
> =C2=A0{
> =C2=A0=09struct dma_fence *f;
> +=09struct xarray *dependencies;
> +
> +again:
> +=09dependencies =3D job->resolve_preempt_dependencies ?
> +=09=09&job->preempt_dependencies : &job->dependencies;

I don't think it's good to use the ternary operator for such long
statements.

if-else is more readable.

> =C2=A0
> =C2=A0=09/* We keep the fence around, so we can iterate over all
> dependencies
> =C2=A0=09 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are
> signaled
> =C2=A0=09 * before killing the job.
> =C2=A0=09 */
> -=09f =3D xa_load(&job->dependencies, job->last_dependency);
> +=09f =3D xa_load(dependencies, job->last_dependency);
> =C2=A0=09if (f) {
> =C2=A0=09=09job->last_dependency++;
> =C2=A0=09=09return dma_fence_get(f);
> =C2=A0=09}
> =C2=A0
> +=09/* Switch resolving preempt dependencies pipelining
> signaling */

I don't understand this comment. I guess you want to say that this section =
resolves preemption dependencies for the (fence) pipeline signaling?

> +=09if (!job->resolve_preempt_dependencies) {
> +=09=09unsigned long index;
> +
> +=09=09xa_for_each(&job->preempt_dependencies, index, f)
> +=09=09=09dma_fence_enable_sw_signaling(f);
> +
> +=09=09job->resolve_preempt_dependencies =3D true;

Hm, is this set to false ever again? It seems it doesn't need to? So
the goto again is only ever triggered once?

> +=09=09goto again;
> +=09}
> +
> =C2=A0=09if (job->sched->ops->prepare_job)
> =C2=A0=09=09return job->sched->ops->prepare_job(job, entity);
> =C2=A0
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index 7ce25281c74c..eceb9b8c6f5f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -829,6 +829,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> =C2=A0=09INIT_LIST_HEAD(&job->list);
> =C2=A0
> =C2=A0=09xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
> +=09xa_init_flags(&job->preempt_dependencies, XA_FLAGS_ALLOC);
> =C2=A0
> =C2=A0=09return 0;
> =C2=A0}
> @@ -864,21 +865,14 @@ void drm_sched_job_arm(struct drm_sched_job
> *job)
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_job_arm);
> =C2=A0
> -/**
> - * drm_sched_job_add_dependency - adds the fence as a job dependency
> - * @job: scheduler job to add the dependencies to
> - * @fence: the dma_fence to add to the list of dependencies.
> - *
> - * Note that @fence is consumed in both the success and error cases.
> - *
> - * Returns:
> - * 0 on success, or an error on failing to expand the array.
> - */
> -int drm_sched_job_add_dependency(struct drm_sched_job *job,
> -=09=09=09=09 struct dma_fence *fence)
> +static int __drm_sched_job_add_dependency(struct drm_sched_job *job,
> +=09=09=09=09=09=C2=A0 struct dma_fence *fence,
> +=09=09=09=09=09=C2=A0 bool is_preempt)
> =C2=A0{
> =C2=A0=09struct dma_fence *entry;
> =C2=A0=09unsigned long index;
> +=09struct xarray *dependencies =3D is_preempt ? &job-
> >preempt_dependencies :
> +=09=09&job->dependencies;

Same =E2=80=93 is better as an if-else below

> =C2=A0=09u32 id =3D 0;
> =C2=A0=09int ret;
> =C2=A0
> @@ -889,25 +883,41 @@ int drm_sched_job_add_dependency(struct
> drm_sched_job *job,
> =C2=A0=09 * This lets the size of the array of deps scale with the
> number of
> =C2=A0=09 * engines involved, rather than the number of BOs.
> =C2=A0=09 */
> -=09xa_for_each(&job->dependencies, index, entry) {
> +=09xa_for_each(dependencies, index, entry) {
> =C2=A0=09=09if (entry->context !=3D fence->context)
> =C2=A0=09=09=09continue;
> =C2=A0
> =C2=A0=09=09if (dma_fence_is_later(fence, entry)) {
> =C2=A0=09=09=09dma_fence_put(entry);
> -=09=09=09xa_store(&job->dependencies, index, fence,
> GFP_KERNEL);
> +=09=09=09xa_store(dependencies, index, fence,
> GFP_KERNEL);
> =C2=A0=09=09} else {
> =C2=A0=09=09=09dma_fence_put(fence);
> =C2=A0=09=09}
> =C2=A0=09=09return 0;
> =C2=A0=09}
> =C2=A0
> -=09ret =3D xa_alloc(&job->dependencies, &id, fence, xa_limit_32b,
> GFP_KERNEL);
> +=09ret =3D xa_alloc(dependencies, &id, fence, xa_limit_32b,
> GFP_KERNEL);
> =C2=A0=09if (ret !=3D 0)
> =C2=A0=09=09dma_fence_put(fence);
> =C2=A0
> =C2=A0=09return ret;
> =C2=A0}
> +
> +/**
> + * drm_sched_job_add_dependency - adds the fence as a job dependency
> + * @job: scheduler job to add the dependencies to
> + * @fence: the dma_fence to add to the list of dependencies.
> + *
> + * Note that @fence is consumed in both the success and error cases.
> + *
> + * Returns:
> + * 0 on success, or an error on failing to expand the array.
> + */
> +int drm_sched_job_add_dependency(struct drm_sched_job *job,
> +=09=09=09=09 struct dma_fence *fence)
> +{
> +=09return __drm_sched_job_add_dependency(job, fence, false);
> +}
> =C2=A0EXPORT_SYMBOL(drm_sched_job_add_dependency);
> =C2=A0
> =C2=A0/**
> @@ -963,7 +973,9 @@ int drm_sched_job_add_resv_dependencies(struct
> drm_sched_job *job,
> =C2=A0=09dma_resv_for_each_fence(&cursor, resv, usage, fence) {
> =C2=A0=09=09/* Make sure to grab an additional ref on the added
> fence */
> =C2=A0=09=09dma_fence_get(fence);
> -=09=09ret =3D drm_sched_job_add_dependency(job, fence);
> +=09=09ret =3D __drm_sched_job_add_dependency(job, fence,
> +=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> cursor.fence_usage =3D=3D
> +=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> DMA_RESV_USAGE_PREEMPT);
> =C2=A0=09=09if (ret) {
> =C2=A0=09=09=09dma_fence_put(fence);
> =C2=A0=09=09=09return ret;
> @@ -1030,6 +1042,10 @@ void drm_sched_job_cleanup(struct
> drm_sched_job *job)
> =C2=A0=09}
> =C2=A0=09xa_destroy(&job->dependencies);
> =C2=A0
> +=09xa_for_each(&job->preempt_dependencies, index, fence) {
> +=09=09dma_fence_put(fence);
> +=09}
> +=09xa_destroy(&job->preempt_dependencies);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL(drm_sched_job_cleanup);
> =C2=A0
> diff --git a/include/drm/gpu_scheduler.h
> b/include/drm/gpu_scheduler.h
> index 95e17504e46a..de16cf6b1869 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -353,6 +353,13 @@ struct drm_sched_job {
> =C2=A0
> =C2=A0=09u32=09=09=09=09credits;
> =C2=A0
> +=09/**
> +=09 * @resolve_preempt_dependencies:
> +=09 *
> +=09 * Job is currently resolving preempt dependencies.
> +=09 */
> +=09bool=09=09=09=09resolve_preempt_dependencies
> ;

I think this should be called "resolving_preempt_dependencies". Just 2
letters more and it emphasizes that this is happening "currently".


P.

> +
> =C2=A0=09/*
> =C2=A0=09 * work is used only after finish_cb has been used and will
> not be
> =C2=A0=09 * accessed anymore.
> @@ -376,6 +383,14 @@ struct drm_sched_job {
> =C2=A0=09 */
> =C2=A0=09struct xarray=09=09=09dependencies;
> =C2=A0
> +=09/**
> +=09 * @preempt_dependencies:
> +=09 *
> +=09 * Contains the dependencies as struct dma_fence for this
> job which are
> +=09 * preempt fences.
> +=09 */
> +=09struct xarray=09=09=09preempt_dependencies;
> +
> =C2=A0=09/** @last_dependency: tracks @dependencies as they signal */
> =C2=A0=09unsigned long=09=09=09last_dependency;
> =C2=A0

