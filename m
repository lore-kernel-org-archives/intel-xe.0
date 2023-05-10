Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED68C7EE22
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 08:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6A610E459;
	Wed, 10 May 2023 08:15:39 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447FD10E458
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 08:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683706537; x=1715242537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TNUK830F+TN8NnOf/PocZlbE+2qrZUtAib/N5GDMB4A=;
 b=kyobgjOvdID6+xlPrZs2LEQroK/qQtJa32q64B6Ret1T+CZrlvSq/UVM
 HizG+8UiGtQhfMp/5F72o42+PGalY0GBQ1UCCMQxWJ3k11odQqCnhsTxU
 9omZ8ZtqhDVF9NjB6LF3j31M+Lf2YA4Z902w3Cld5UZ65KNWVmwPoZ/65
 l024xgMHna6KGT4lkS+ek+SVok9LVTV7FEGWwXh7l34cWeEU8MfJGs+bI
 bF1ipdTfAwZSTtqOc2zakObteP8pKxEPcS/RSvLs54hVt2v6t652eNKcT
 IHc9O7Wg5tNYdQC5MBKKWnUCkdEmEBzNucqrI5BqW8g2wSFsRfw67SpzH A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413448862"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="413448862"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 01:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="1029123531"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; d="scan'208";a="1029123531"
Received: from aboreiko-mobl3.ger.corp.intel.com (HELO [10.249.254.114])
 ([10.249.254.114])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 01:15:35 -0700
Message-ID: <1ef5e506-1e09-da16-4ad7-f983be5331d9@linux.intel.com>
Date: Wed, 10 May 2023 10:15:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-6-matthew.brost@intel.com>
 <90b4e835-c21a-f9b3-4b22-aa59c911f54f@linux.intel.com>
 <ZFpfM0cvsd76A+tY@DUT025-TGLU.fm.intel.com>
 <df98676a-039b-d159-72c8-559c6ece606a@linux.intel.com>
 <ZFrGJWx+blMkljvM@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZFrGJWx+blMkljvM@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 05/31] drm/xe: Long running job update
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


On 5/10/23 00:16, Matthew Brost wrote:
> On Tue, May 09, 2023 at 05:21:39PM +0200, Thomas Hellström wrote:
>> On 5/9/23 16:56, Matthew Brost wrote:
>>> On Mon, May 08, 2023 at 03:14:10PM +0200, Thomas Hellström wrote:
>>>> Hi, Matthew
>>>>
>>>> In addition to Rodrigo's comments:
>>>>
>>>> On 5/2/23 02:17, Matthew Brost wrote:
>>>>> Flow control + write ring in exec, return NULL in run_job, siganl
>>>>> xe_hw_fence immediately, and override TDR for LR jobs.
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>     drivers/gpu/drm/xe/xe_engine.c           | 32 ++++++++
>>>>>     drivers/gpu/drm/xe/xe_engine.h           |  4 +
>>>>>     drivers/gpu/drm/xe/xe_exec.c             |  8 ++
>>>>>     drivers/gpu/drm/xe/xe_guc_engine_types.h |  2 +
>>>>>     drivers/gpu/drm/xe/xe_guc_submit.c       | 95 +++++++++++++++++++++---
>>>>>     drivers/gpu/drm/xe/xe_trace.h            |  5 ++
>>>>>     6 files changed, 137 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
>>>>> index 094ec17d3004..d1e84d7adbd4 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_engine.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_engine.c
>>>>> @@ -18,6 +18,7 @@
>>>>>     #include "xe_macros.h"
>>>>>     #include "xe_migrate.h"
>>>>>     #include "xe_pm.h"
>>>>> +#include "xe_ring_ops_types.h"
>>>>>     #include "xe_trace.h"
>>>>>     #include "xe_vm.h"
>>>>> @@ -673,6 +674,37 @@ static void engine_kill_compute(struct xe_engine *e)
>>>>>     	up_write(&e->vm->lock);
>>>>>     }
>>>>> +/**
>>>>> + * xe_engine_is_lr() - Whether an engine is long-running
>>>>> + * @e: The engine
>>>>> + *
>>>>> + * Return: True if the engine is long-running, false otherwise.
>>>>> + */
>>>>> +bool xe_engine_is_lr(struct xe_engine *e)
>>>>> +{
>>>>> +	return e->vm && xe_vm_no_dma_fences(e->vm) &&
>>>>> +		!(e->flags & ENGINE_FLAG_VM);
>>>>> +}
>>>>> +
>>>>> +static s32 xe_engine_num_job_inflight(struct xe_engine *e)
>>>>> +{
>>>>> +	return e->lrc->fence_ctx.next_seqno - xe_lrc_seqno(e->lrc) - 1;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xe_engine_ring_full() - Whether an engine's ring is full
>>>>> + * @e: The engine
>>>>> + *
>>>>> + * Return: True if the engine's ring is full, false otherwise.
>>>>> + */
>>>>> +bool xe_engine_ring_full(struct xe_engine *e)
>>>>> +{
>>>>> +	struct xe_lrc *lrc = e->lrc;
>>>>> +	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
>>>>> +
>>>>> +	return xe_engine_num_job_inflight(e) >= max_job;
>>>>> +}
>>>>> +
>>>>>     /**
>>>>>      * xe_engine_is_idle() - Whether an engine is idle.
>>>>>      * @engine: The engine
>>>>> diff --git a/drivers/gpu/drm/xe/xe_engine.h b/drivers/gpu/drm/xe/xe_engine.h
>>>>> index a49cf2ab405e..2e60f6d90226 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_engine.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_engine.h
>>>>> @@ -42,6 +42,10 @@ static inline bool xe_engine_is_parallel(struct xe_engine *engine)
>>>>>     	return engine->width > 1;
>>>>>     }
>>>>> +bool xe_engine_is_lr(struct xe_engine *e);
>>>>> +
>>>>> +bool xe_engine_ring_full(struct xe_engine *e);
>>>>> +
>>>>>     bool xe_engine_is_idle(struct xe_engine *engine);
>>>>>     void xe_engine_kill(struct xe_engine *e);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
>>>>> index ea869f2452ef..44ea9bcd0066 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_exec.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_exec.c
>>>>> @@ -13,6 +13,7 @@
>>>>>     #include "xe_device.h"
>>>>>     #include "xe_engine.h"
>>>>>     #include "xe_macros.h"
>>>>> +#include "xe_ring_ops_types.h"
>>>>>     #include "xe_sched_job.h"
>>>>>     #include "xe_sync.h"
>>>>>     #include "xe_vm.h"
>>>>> @@ -277,6 +278,11 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>>     		goto err_engine_end;
>>>>>     	}
>>>>> +	if (xe_engine_is_lr(engine) && xe_engine_ring_full(engine)) {
>>>>> +		err = -EWOULDBLOCK;
>>>>> +		goto err_engine_end;
>>>>> +	}
>>>>> +
>>>>>     	job = xe_sched_job_create(engine, xe_engine_is_parallel(engine) ?
>>>>>     				  addresses : &args->address);
>>>>>     	if (IS_ERR(job)) {
>>>>> @@ -363,6 +369,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>>     		xe_sync_entry_signal(&syncs[i], job,
>>>>>     				     &job->drm.s_fence->finished);
>>>>> +	if (xe_engine_is_lr(engine))
>>>>> +		engine->ring_ops->emit_job(job);
>>>>>     	xe_sched_job_push(job);
>>>>>     	xe_vm_reactivate_rebind(vm);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_types.h b/drivers/gpu/drm/xe/xe_guc_engine_types.h
>>>>> index cbfb13026ec1..5d83132034a6 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_engine_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_types.h
>>>>> @@ -31,6 +31,8 @@ struct xe_guc_engine {
>>>>>     	 */
>>>>>     #define MAX_STATIC_MSG_TYPE	3
>>>>>     	struct drm_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
>>>>> +	/** @lr_tdr: long running TDR worker */
>>>>> +	struct work_struct lr_tdr;
>>>>>     	/** @fini_async: do final fini async from this worker */
>>>>>     	struct work_struct fini_async;
>>>>>     	/** @resume_time: time of last resume */
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> index 68d09e7a4cc0..0a41f5d04f6d 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>>> @@ -500,6 +500,14 @@ static void register_engine(struct xe_engine *e)
>>>>>     		parallel_write(xe, map, wq_desc.wq_status, WQ_STATUS_ACTIVE);
>>>>>     	}
>>>>> +	/*
>>>>> +	 * We must keep a reference for LR engines if engine is registered with
>>>>> +	 * the GuC as jobs signal immediately and can't destroy an engine if the
>>>>> +	 * GuC has a reference to it.
>>>>> +	 */
>>>>> +	if (xe_engine_is_lr(e))
>>>>> +		xe_engine_get(e);
>>>>> +
>>>>>     	set_engine_registered(e);
>>>>>     	trace_xe_engine_register(e);
>>>>>     	if (xe_engine_is_parallel(e))
>>>>> @@ -662,6 +670,7 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
>>>>>     {
>>>>>     	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>>>>>     	struct xe_engine *e = job->engine;
>>>>> +	bool lr = xe_engine_is_lr(e);
>>>>>     	XE_BUG_ON((engine_destroyed(e) || engine_pending_disable(e)) &&
>>>>>     		  !engine_banned(e) && !engine_suspended(e));
>>>>> @@ -671,14 +680,19 @@ guc_engine_run_job(struct drm_sched_job *drm_job)
>>>>>     	if (!engine_killed_or_banned(e) && !xe_sched_job_is_error(job)) {
>>>>>     		if (!engine_registered(e))
>>>>>     			register_engine(e);
>>>>> -		e->ring_ops->emit_job(job);
>>>>> +		if (!lr)	/* Written in IOCTL */
>>>> Hmm? What does "Written in IOCTL mean?" Could you rephrase to something more
>>>> descriptive?
>>>>
>>> "LR jos are emitted in the IOCTL"
>> Ah, I read it as "the lr variable was written in IOCTL."
>>
>> Perhaps LR jobs are already emitted at execbuf time?
>>
> I missed exec in my update.
>
> s/LR jos are emitted in the IOCTL/LR jos are emitted in the exec IOCTL/

Sounds good, with also s/jos/jobs/

/Thomas



>
> Matt
>
>> /Thomas
>>
>>
>>> Does that work?
>>>
>>> Matt
>>>
>>>>> +			e->ring_ops->emit_job(job);
>>>>>     		submit_engine(e);
>>>>>     	}
>>>>> -	if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags))
>>>>> +	if (lr) {
>>>>> +		xe_sched_job_set_error(job, -ENOTSUPP);
>>>>> +		return NULL;
>>>>> +	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
>>>>>     		return job->fence;
>>>>> -	else
>>>>> +	} else {
>>>>>     		return dma_fence_get(job->fence);
>>>>> +	}
>>>>>     }
>>>>>     static void guc_engine_free_job(struct drm_sched_job *drm_job)
>>>>> @@ -782,6 +796,57 @@ static void simple_error_capture(struct xe_engine *e)
>>>>>     }
>>>>>     #endif
>>>>> +static void xe_guc_engine_trigger_cleanup(struct xe_engine *e)
>>>>> +{
>>>>> +	struct xe_guc *guc = engine_to_guc(e);
>>>>> +
>>>>> +	if (xe_engine_is_lr(e))
>>>>> +		queue_work(guc_to_gt(guc)->ordered_wq, &e->guc->lr_tdr);
>>>>> +	else
>>>>> +		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
>>>>> +}
>>>>> +
>>>>> +static void xe_guc_engine_lr_cleanup(struct work_struct *w)
>>>>> +{
>>>>> +	struct xe_guc_engine *ge =
>>>>> +		container_of(w, struct xe_guc_engine, lr_tdr);
>>>>> +	struct xe_engine *e = ge->engine;
>>>>> +	struct drm_gpu_scheduler *sched = &ge->sched;
>>>>> +
>>>>> +	XE_BUG_ON(!xe_engine_is_lr(e));
>>>>> +	trace_xe_engine_lr_cleanup(e);
>>>>> +
>>>>> +	/* Kill the run_job / process_msg entry points */
>>>>> +	drm_sched_run_wq_stop(sched);
>>>>> +
>>>>> +	/* Engine state now stable, disable scheduling / deregister if needed */
>>>>> +	if (engine_registered(e)) {
>>>>> +		struct xe_guc *guc = engine_to_guc(e);
>>>>> +		int ret;
>>>>> +
>>>>> +		set_engine_banned(e);
>>>>> +		xe_engine_get(e);
>>>>> +		disable_scheduling_deregister(guc, e);
>>>>> +
>>>>> +		/*
>>>>> +		 * Must wait for scheduling to be disabled before signalling
>>>>> +		 * any fences, if GT broken the GT reset code should signal us.
>>>>> +		 */
>>>>> +		smp_rmb();
>>>> wait_event() paired with wake_up() family of functions typically set the
>>>> necessary barriers to make sure anything written prior to wake_up() is seen
>>>> in wait_event(). So that smp_rmb() is most likely not needed. If it still
>>>> is, its pairing smp_wmb() should be documented and pointed to as well. See
>>>> documentation of set_current_state() vs __set_current_state().
>>>>
>>>>> +		ret = wait_event_timeout(guc->ct.wq,
>>>>> +					 !engine_pending_disable(e) ||
>>>>> +					 guc_read_stopped(guc), HZ * 5);
>>>>> +		if (!ret) {
>>>>> +			XE_WARN_ON("Schedule disable failed to respond");
>>>>> +			drm_sched_run_wq_start(sched);
>>>>> +			xe_gt_reset_async(e->gt);
>>>>> +			return;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	drm_sched_run_wq_start(sched);
>>>>> +}
>>>>> +
>>>>>     static enum drm_gpu_sched_stat
>>>>>     guc_engine_timedout_job(struct drm_sched_job *drm_job)
>>>>>     {
>>>>> @@ -832,7 +897,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>>>>>     			err = -EIO;
>>>>>     		set_engine_banned(e);
>>>>>     		xe_engine_get(e);
>>>>> -		disable_scheduling_deregister(engine_to_guc(e), e);
>>>>> +		disable_scheduling_deregister(guc, e);
>>>>>     		/*
>>>>>     		 * Must wait for scheduling to be disabled before signalling
>>>>> @@ -865,7 +930,7 @@ guc_engine_timedout_job(struct drm_sched_job *drm_job)
>>>>>     	 */
>>>>>     	list_add(&drm_job->list, &sched->pending_list);
>>>>>     	drm_sched_run_wq_start(sched);
>>>>> -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
>>>>> +	xe_guc_engine_trigger_cleanup(e);
>>>>>     	/* Mark all outstanding jobs as bad, thus completing them */
>>>>>     	spin_lock(&sched->job_list_lock);
>>>>> @@ -889,6 +954,8 @@ static void __guc_engine_fini_async(struct work_struct *w)
>>>>>     	trace_xe_engine_destroy(e);
>>>>> +	if (xe_engine_is_lr(e))
>>>>> +		cancel_work_sync(&ge->lr_tdr);
>>>>>     	if (e->flags & ENGINE_FLAG_PERSISTENT)
>>>>>     		xe_device_remove_persistent_engines(gt_to_xe(e->gt), e);
>>>>>     	release_guc_id(guc, e);
>>>>> @@ -906,7 +973,7 @@ static void guc_engine_fini_async(struct xe_engine *e)
>>>>>     	bool kernel = e->flags & ENGINE_FLAG_KERNEL;
>>>>>     	INIT_WORK(&e->guc->fini_async, __guc_engine_fini_async);
>>>>> -	queue_work(system_unbound_wq, &e->guc->fini_async);
>>>>> +	queue_work(system_wq, &e->guc->fini_async);
>>>>>     	/* We must block on kernel engines so slabs are empty on driver unload */
>>>>>     	if (kernel) {
>>>>> @@ -1089,12 +1156,16 @@ static int guc_engine_init(struct xe_engine *e)
>>>>>     	if (err)
>>>>>     		goto err_free;
>>>>> +
>>>> Unrelated whitespace?
>>>>
>>>>
>>>>>     	sched = &ge->sched;
>>>>>     	err = drm_sched_entity_init(&ge->entity, DRM_SCHED_PRIORITY_NORMAL,
>>>>>     				    &sched, 1, NULL);
>>>>>     	if (err)
>>>>>     		goto err_sched;
>>>>> +	if (xe_engine_is_lr(e))
>>>>> +		INIT_WORK(&e->guc->lr_tdr, xe_guc_engine_lr_cleanup);
>>>>> +
>>>>>     	mutex_lock(&guc->submission_state.lock);
>>>>>     	err = alloc_guc_id(guc, e);
>>>>> @@ -1146,7 +1217,7 @@ static void guc_engine_kill(struct xe_engine *e)
>>>>>     {
>>>>>     	trace_xe_engine_kill(e);
>>>>>     	set_engine_killed(e);
>>>>> -	drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
>>>>> +	xe_guc_engine_trigger_cleanup(e);
>>>>>     }
>>>>>     static void guc_engine_add_msg(struct xe_engine *e, struct drm_sched_msg *msg,
>>>>> @@ -1296,6 +1367,9 @@ static void guc_engine_stop(struct xe_guc *guc, struct xe_engine *e)
>>>>>     	/* Stop scheduling + flush any DRM scheduler operations */
>>>>>     	drm_sched_run_wq_stop(sched);
>>>>> +	if (engine_registered(e) && xe_engine_is_lr(e))
>>>>> +		xe_engine_put(e);
>>>>> +
>>>>>     	/* Clean up lost G2H + reset engine state */
>>>>>     	if (engine_destroyed(e) && engine_registered(e)) {
>>>>>     		if (engine_banned(e))
>>>>> @@ -1520,6 +1594,9 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>>     	trace_xe_engine_deregister_done(e);
>>>>>     	clear_engine_registered(e);
>>>>> +	if (xe_engine_is_lr(e))
>>>>> +		xe_engine_put(e);
>>>>> +
>>>>>     	if (engine_banned(e))
>>>>>     		xe_engine_put(e);
>>>>>     	else
>>>>> @@ -1557,7 +1634,7 @@ int xe_guc_engine_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>>     	 */
>>>>>     	set_engine_reset(e);
>>>>>     	if (!engine_banned(e))
>>>>> -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
>>>>> +		xe_guc_engine_trigger_cleanup(e);
>>>>>     	return 0;
>>>>>     }
>>>>> @@ -1584,7 +1661,7 @@ int xe_guc_engine_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>>>>     	/* Treat the same as engine reset */
>>>>>     	set_engine_reset(e);
>>>>>     	if (!engine_banned(e))
>>>>> -		drm_sched_set_timeout(&e->guc->sched, MIN_SCHED_TIMEOUT);
>>>>> +		xe_guc_engine_trigger_cleanup(e);
>>>>>     	return 0;
>>>>>     }
>>>>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
>>>>> index 2f8eb7ebe9a7..02861c26e145 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_trace.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>>>>> @@ -219,6 +219,11 @@ DEFINE_EVENT(xe_engine, xe_engine_resubmit,
>>>>>     	     TP_ARGS(e)
>>>>>     );
>>>>> +DEFINE_EVENT(xe_engine, xe_engine_lr_cleanup,
>>>>> +	     TP_PROTO(struct xe_engine *e),
>>>>> +	     TP_ARGS(e)
>>>>> +);
>>>>> +
>>>>>     DECLARE_EVENT_CLASS(xe_sched_job,
>>>>>     		    TP_PROTO(struct xe_sched_job *job),
>>>>>     		    TP_ARGS(job),
