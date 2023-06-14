Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EB2EB64DB
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 11:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AF810E445;
	Wed, 14 Jun 2023 11:40:50 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6528810E445
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 11:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686742836; x=1718278836;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=7vs6M5MSa/3JSgJUgzP65LF2KTnkAn6ucbVQA/S6fs4=;
 b=YBkUyWp0A+Kr/KUIglaHohiLboN+PWtP1ROey+cC8f2Vd5JfawX28pm/
 8iHqBk0C8CQkpJbm/MzgCWVfy3uQ/g0FgbWbuzD/VHofdK5KEQThm0SdA
 kFID66kvar4GcEOIz7KOY8XVIJyLabw1uB89P9sLGH1i/aVZuTycVxeAH
 uMvno52kdXQqpSszYegPMlxjtPYI2vv5sMlbfLxOr8bVpgcDA62jB8HQS
 ecGji3j9SvfkEgZ7MvEg7DOZLqBf1iewWR3xIsSu72GgL1bazN1wf2PL9
 3+lwWdiafX9O7sLXCKXi8IZN92qaFjyc6cmVdqZG6v8VVw0UALOay0WWg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="358591793"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="358591793"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 04:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="782056211"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; d="scan'208";a="782056211"
Received: from aryba-mobl.ger.corp.intel.com (HELO [10.249.254.20])
 ([10.249.254.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2023 04:40:33 -0700
Message-ID: <af97d044-c21e-3a04-8ef7-ef2a79dfef15@linux.intel.com>
Date: Wed, 14 Jun 2023 13:40:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20230607160334.4111289-1-matthew.brost@intel.com>
 <20230607160334.4111289-6-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230607160334.4111289-6-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v3 5/8] drm/xe: Long running job update
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


On 6/7/23 18:03, Matthew Brost wrote:
Some commit message nits:
> For long running (LR) jobs with the DRM scheduler we must return NULL in
> run_job which results in signaling the job's finished fence immediately.
> This prevents LR jobs from creating infinite dma-fences.
>
> Signaling job's finished fence immediately breaks flow controling ring
s/controling/controlling/
> with the DRM scheduler, to work around this the ring is flow controlled
> and written in the exec IOCTL.
Imperative: To work around this, flow control...
>   Signaling job's finished fence
> immediately also breaks the TDR which is used in reset / cleanup entity
> paths so we write a new path for LR entities.
so write
>
> v2: Better commit, white space, remove rmb(), better comment next to
> emit_job()
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
>   drivers/gpu/drm/xe/xe_engine.h           |  4 +
>   drivers/gpu/drm/xe/xe_exec.c             |  8 ++
>   drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 93 +++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_trace.h            |  5 ++
>   6 files changed, 135 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index b3036c4a8ec3..eb5f66f07da8 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -18,6 +18,7 @@
>   #include "xe_macros.h"
>   #include "xe_migrate.h"
>   #include "xe_pm.h"
> +#include "xe_ring_ops_types.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> @@ -679,6 +680,37 @@ static void engine_kill_compute(struct xe_engine *e)
>   	up_write(&e->vm->lock);
>   }
>   
> +/**
> + * xe_engine_is_lr() - Whether an engine is long-running
> + * @e: The engine
> + *
> + * Return: True if the engine is long-running, false otherwise.
> + */
> +bool xe_engine_is_lr(struct xe_engine *e)
> +{
> +	return e->vm && xe_vm_no_dma_fences(e->vm) &&
> +		!(e->flags & ENGINE_FLAG_VM);
> +}
> +
> +static s32 xe_engine_num_job_inflight(struct xe_engine *e)
> +{
> +	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
> +}
> +
> +/**
> + * xe_engine_ring_full() - Whether an engine's ring is full
> + * @e: The engine
> + *
> + * Return: True if the engine's ring is full, false otherwise.
> + */
> +bool xe_engine_ring_full(struct xe_engine *e)
> +{
> +	struct xe_lrc *lrc = e->lrc;
> +	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> +
> +	return xe_engine_num_job_inflight(e) >= max_job;
> +}
> +
>   /**
>    * xe_engine_is_idle() - Whether an engine is idle.
>    * @engine: The engine
> diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
> index a49cf2ab405e..2e60f6d90226 100644
> --- a/drivers/gpu/drm/xe/xe_engine.h
> +++ b/drivers/gpu/drm/xe/xe_engine.h
> @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
>   	return engine->width > 1;
>   }
>   
> +bool xe_engine_is_lr(struct xe_engine *e);
> +
> +bool xe_engine_ring_full(struct xe_engine *e);
> +
>   bool xe_engine_is_idle(struct xe_engine *engine);
>   
>   void xe_engine_kill(struct xe_engine *e);
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index e44076ee2e11..9e9523939de8 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -14,6 +14,7 @@
>   #include "xe_device.h"
>   #include "xe_engine.h"
>   #include "xe_macros.h"
> +#include "xe_ring_ops_types.h"
>   #include "xe_sched_job.h"
>   #include "xe_sync.h"
>   #include "xe_vm.h"
> @@ -300,6 +301,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_engine_end;
>   	}
>   
> +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
> +		err = -EWOULDBLOCK;
> +		goto err_engine_end;
> +	}
> +
>   	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
>   				  addresses : &args->address);
>   	if (IS_ERR(job)) {
> @@ -386,6 +392,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		xe_sync_entry_signal(&syncs[i], job,
>   				     &job->drm.s_fence->finished);
>   
> +	if (xe_engine_is_lr(engine))
> +		engine->ring_ops->emit_job(job);
>   	xe_sched_job_push(job);
>   	xe_vm_reactivate_rebind(vm);
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> index cbfb13026ec1..5d83132034a6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
> @@ -31,6 +31,8 @@ struct xe_guc_engine {
>   	 */
>   #define MAX_STATIC_MSG_TYPE	3
>   	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> +	/** @lr_tdr: long running TDR worker */
> +	struct work_struct lr_tdr;
>   	/** @fini_async: do final fini async from this worker */
>   	struct work_struct fini_async;
>   	/** @resume_time: time of last resume */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a7a0d9f806bd..7bde687fd188 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -482,6 +482,14 @@ static void register_engine(struct xe_engine *e)
>   		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
>   	}
>   
> +	/*
> +	 * We must keep a reference for LR engines if engine is registered with
> +	 * the GuC as jobs signal immediately and can't destroy an engine if the
> +	 * GuC has a reference to it.
> +	 */
> +	if (xe_engine_is_lr(e))
> +		xe_engine_get(e);
> +
>   	set_engine_registered(e);
>   	trace_xe_engine_register(e);
>   	if (xe_engine_is_parallel(e))
> @@ -644,6 +652,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
>   {
>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>   	struct xe_engine *e = job->engine;
> +	bool lr = xe_engine_is_lr(e);
>   
>   	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
>   		  !engine_banned(e) && !engine_suspended(e));
> @@ -653,14 +662,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
>   	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
>   		if (!engine_registered(e))
>   			register_engine(e);
> -		e->ring_ops->emit_job(job);
> +		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> +			e->ring_ops->emit_job(job);
>   		submit_engine(e);
>   	}
>   
> -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
> +	if (lr) {
> +		xe_sched_job_set_error(job, -EOPNOTSUPP);
> +		return NULL;
> +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
>   		return job->fence;
> -	else
> +	} else {
>   		return dma_fence_get(job->fence);
> +	}
>   }
>   
>   static void guc_engine_free_job(struct drm_sched_job *drm_job)
> @@ -764,6 +778,56 @@ static void simple_error_capture(struct xe_engine *e)
>   }
>   #endif
>   
> +static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
> +{
> +	struct xe_guc *guc = engine_to_guc(e);
> +
> +	if (xe_engine_is_lr(e))
> +		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
> +	else
> +		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> +}
> +
> +static void xe_guc_engine_lr_cleanup(struct work_struct *w)
> +{
> +	struct xe_guc_engine *ge =
> +		container_of(w, struct xe_guc_engine, lr_tdr);
> +	struct xe_engine *e = ge->engine;
> +	struct drm_gpu_scheduler *sched = &ge->sched;
> +
> +	XE_WARN_ON(!xe_engine_is_lr(e));
> +	trace_xe_engine_lr_cleanup(e);
> +
> +	/* Kill the run_job / process_msg entry points */
> +	drm_sched_run_wq_stop(sched);
> +
> +	/* Engine state now stable, disable scheduling / deregister if needed */
> +	if (engine_registered(e)) {
> +		struct xe_guc *guc = engine_to_guc(e);
> +		int ret;
> +
> +		set_engine_banned(e);
> +		xe_engine_get(e);
> +		disable_scheduling_deregister(guc, e);
> +
> +		/*
> +		 * Must wait for scheduling to be disabled before signalling
> +		 * any fences, if GT broken the GT reset code should signal us.
> +		 */
> +		ret = wait_event_timeout(guc->ct.wq,
> +					 !engine_pending_disable(e) ||
> +					 guc_read_stopped(guc), HZ * 5);
> +		if (!ret) {
> +			XE_WARN_ON("Schedule disable failed to respond");
> +			drm_sched_run_wq_start(sched);
> +			xe_gt_reset_async(e->gt);
> +			return;
> +		}
> +	}
> +
> +	drm_sched_run_wq_start(sched);
> +}
> +
>   static enum drm_gpu_sched_stat
>   guc_engine_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -815,7 +879,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>   			err = -EIO;
>   		set_engine_banned(e);
>   		xe_engine_get(e);
> -		disable_scheduling_deregister(engine_to_guc(e), e);
> +		disable_scheduling_deregister(guc, e);
>   
>   		/*
>   		 * Must wait for scheduling to be disabled before signalling
> @@ -848,7 +912,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>   	 */
>   	list_add(&drm_job->list, &sched->pending_list);
>   	drm_sched_run_wq_start(sched);
> -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> +	xe_guc_engine_trigger_cleanup(e);
>   
>   	/* Mark all outstanding jobs as bad, thus completing them */
>   	spin_lock(&sched->job_list_lock);
> @@ -872,6 +936,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
>   
>   	trace_xe_engine_destroy(e);
>   
> +	if (xe_engine_is_lr(e))
> +		cancel_work_sync(&ge->lr_tdr);
>   	if (e->flags & ENGINE_FLAG_PERSISTENT)
>   		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
>   	release_guc_id(guc, e);
> @@ -889,7 +955,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
>   	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
>   
>   	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
> -	queue_work(system_unbound_wq, &e->guc->fini_async);
> +	queue_work(system_wq, &e->guc->fini_async);
>   
>   	/* We must block on kernel engines so slabs are empty on driver unload */
>   	if (kernel) {
> @@ -1078,6 +1144,9 @@ static int guc_engine_init(struct xe_engine *e)
>   	if (err)
>   		goto err_sched;
>   
> +	if (xe_engine_is_lr(e))
> +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
> +
>   	mutex_lock(&guc->submission_state.lock);
>   
>   	err = alloc_guc_id(guc, e);
> @@ -1129,7 +1198,7 @@ static void guc_engine_kill(struct xe_engine *e)
>   {
>   	trace_xe_engine_kill(e);
>   	set_engine_killed(e);
> -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> +	xe_guc_engine_trigger_cleanup(e);
>   }
>   
>   static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
> @@ -1279,6 +1348,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
>   	/* Stop scheduling + flush any DRM scheduler operations */
>   	drm_sched_run_wq_stop(sched);
>   
> +	if (engine_registered(e) && xe_engine_is_lr(e))
> +		xe_engine_put(e);
> +
>   	/* Clean up lost G2H + reset engine state */
>   	if (engine_destroyed(e) && engine_registered(e)) {
>   		if (engine_banned(e))
> @@ -1503,6 +1575,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	trace_xe_engine_deregister_done(e);
>   
>   	clear_engine_registered(e);
> +	if (xe_engine_is_lr(e))
> +		xe_engine_put(e);
> +

This looks suspicious. We're putting the reference of "e", but continue 
to dereference "e" afterwards. If this is intentional, could you add a 
comment as to which pointer's reference we put? Typically wen you put 
the reference of a pointer you don't use it afterwards unless it is 
obvious that you're only caching the value from the pointer that carries 
the reference?


>   	if (engine_banned(e))
>   		xe_engine_put(e);
>   	else
> @@ -1540,7 +1615,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	 */
>   	set_engine_reset(e);
>   	if (!engine_banned(e))
> -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> +		xe_guc_engine_trigger_cleanup(e);
>   
>   	return 0;
>   }
> @@ -1567,7 +1642,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   	/* Treat the same as engine reset */
>   	set_engine_reset(e);
>   	if (!engine_banned(e))
> -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
> +		xe_guc_engine_trigger_cleanup(e);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 2f8eb7ebe9a7..02861c26e145 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
>   	     TP_ARGS(e)
>   );
>   
> +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
> +	     TP_PROTO(struct xe_engine *e),
> +	     TP_ARGS(e)
> +);
> +
>   DECLARE_EVENT_CLASS(xe_sched_job,
>   		    TP_PROTO(struct xe_sched_job *job),
>   		    TP_ARGS(job),
