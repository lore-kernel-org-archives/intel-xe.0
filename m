Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425B4CCF9E6
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 15:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04EBD10EA59;
	Wed, 25 Sep 2024 15:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bV6WFYS3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0B410EA59
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727279924; x=1758815924;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r16rsPeoebHA94YBdkj+upsCu1RJ4bdC2vq589RTA2g=;
 b=bV6WFYS3v8CzuTpsL/SizbXZD8tUkLQWVYTV5aqCs8tXVmoo47uBXO+w
 Q2TKkcIY/LxRq21Tu6JP5wt7uZO7GQrzuQhRDI67qGwKsf8sMQXI8ZbCt
 +5nPbuH56eoNJTAIVZcWPTME+FFXNuXLrKRL8RwWa9E3aclcK6Er06RTy
 Up4Zwn3lpv9oaI0g06qrJltkRC+dQTC0yaMzhMpC12eHYM5BJ2liaf/LE
 9U7LDSu4pIp6WNvdrjhLoB/1iTcIgsds7ENVAcIyXU9YtmWUvkoCuYlSu
 Xzg6lhyZhh37qcEOPXAXvNOU8MJlwl5bvz0Z3275xbhR1mH2HgTunFiY5 A==;
X-CSE-ConnectionGUID: UlCEXvv3TAWmP0jMXQ2mEw==
X-CSE-MsgGUID: JEPQpwEIRh+xkhJFpamrjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51754104"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="51754104"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:58:43 -0700
X-CSE-ConnectionGUID: SMD9JnheTsueqHjIMynRFA==
X-CSE-MsgGUID: 9mhlYwBfS/+8vddrNthlSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="71416334"
Received: from mlehtone-mobl.ger.corp.intel.com (HELO [10.245.244.236])
 ([10.245.244.236])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:58:43 -0700
Message-ID: <b669d5b6-2497-436e-a824-d5b000a92204@intel.com>
Date: Wed, 25 Sep 2024 16:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Take ref to job and job's fence in
 xe_sched_job_arm
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240924184541.2992459-1-matthew.brost@intel.com>
 <0a1bbe76-c0ba-4d6e-aae7-0ff723bc334f@intel.com>
 <ZvQtK78Jo+OxtTpy@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <ZvQtK78Jo+OxtTpy@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 25/09/2024 16:32, Matthew Brost wrote:
> On Wed, Sep 25, 2024 at 03:29:20PM +0100, Matthew Auld wrote:
>> On 24/09/2024 19:45, Matthew Brost wrote:
>>> Fixes two possible races:
>>>
>>> - Submission to hardware signals job's fence before dma_fence_get at end
>>>     of run_job
>>> - TDR fires and signals fence + free job before run_job completes
>>>
>>> Taking refs in xe_sched_job_arm to job and job's fence solves these by
>>> ensure all refs collected before entering the DRM scheduler. The refs
>>> are dropped in run_job and DRM scheduler respectfully. Safe as once
>>> xe_sched_job_arm is called execution of job through DRM sched is
>>> guaranteed.
>>>
>>> v2:
>>>    - Take job ref on resubmit (Matt Auld)
>>>
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
>>
>> Maybe also:
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2843
>>
>> ?
> 
> Yes, look like same issue.
> 
>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: <stable@vger.kernel.org> # v6.8+
>>> ---
>>>    drivers/gpu/drm/xe/xe_execlist.c        |  4 +++-
>>>    drivers/gpu/drm/xe/xe_gpu_scheduler.c   | 17 +++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_gpu_scheduler.h   |  6 +-----
>>>    drivers/gpu/drm/xe/xe_guc_submit.c      | 11 +++++++----
>>>    drivers/gpu/drm/xe/xe_sched_job.c       |  5 ++---
>>>    drivers/gpu/drm/xe/xe_sched_job_types.h |  1 -
>>>    6 files changed, 30 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>>> index f3b71fe7a96d..b70706c9caf2 100644
>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>> @@ -309,11 +309,13 @@ execlist_run_job(struct drm_sched_job *drm_job)
>>>    	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>>>    	struct xe_exec_queue *q = job->q;
>>>    	struct xe_execlist_exec_queue *exl = job->q->execlist;
>>> +	struct dma_fence *fence = job->fence;
>>>    	q->ring_ops->emit_job(job);
>>>    	xe_execlist_make_active(exl);
>>> +	xe_sched_job_put(job);
>>> -	return dma_fence_get(job->fence);
>>> +	return fence;
>>>    }
>>>    static void execlist_job_free(struct drm_sched_job *drm_job)
>>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>> index c518d1d16d82..7ea0c8e9e7a9 100644
>>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
>>> @@ -4,6 +4,7 @@
>>>     */
>>>    #include "xe_gpu_scheduler.h"
>>> +#include "xe_sched_job.h"
>>>    static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
>>>    {
>>> @@ -106,3 +107,19 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
>>>    	list_add_tail(&msg->link, &sched->msgs);
>>>    	xe_sched_process_msg_queue(sched);
>>>    }
>>> +
>>> +/**
>>> + * xe_sched_resubmit_jobs() - Resubmit scheduler jobs
>>> + * @sched: Xe GPU scheduler
>>> + *
>>> + * Take a ref all jobs on scheduler and resubmit.
>>> + */
>>> +void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>>> +{
>>> +	struct drm_sched_job *s_job;
>>> +
>>> +	list_for_each_entry(s_job, &sched->base.pending_list, list)
>>> +		xe_sched_job_get(to_xe_sched_job(s_job));	/* Paired with put in run_job */
>>> +
>>> +	drm_sched_resubmit_jobs(&sched->base);
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> index cee9c6809fc0..ecbe5dd6664e 100644
>>> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
>>> @@ -26,6 +26,7 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>>>    		      struct xe_sched_msg *msg);
>>>    void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
>>>    			     struct xe_sched_msg *msg);
>>> +void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched);
>>>    static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
>>>    {
>>> @@ -47,11 +48,6 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
>>>    	drm_sched_tdr_queue_imm(&sched->base);
>>>    }
>>> -static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>>> -{
>>> -	drm_sched_resubmit_jobs(&sched->base);
>>> -}
>>> -
>>>    static inline bool
>>>    xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
>>>    {
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index fbbe6a487bbb..689279fdef80 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -766,6 +766,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>>    	struct xe_guc *guc = exec_queue_to_guc(q);
>>>    	struct xe_device *xe = guc_to_xe(guc);
>>>    	bool lr = xe_exec_queue_is_lr(q);
>>> +	struct dma_fence *fence = NULL;
>>>    	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>>>    		  exec_queue_banned(q) || exec_queue_suspended(q));
>>> @@ -782,12 +783,14 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>>    	if (lr) {
>>>    		xe_sched_job_set_error(job, -EOPNOTSUPP);
>>> -		return NULL;
>>> -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
>>> -		return job->fence;
>>> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
>>>    	} else {
>>> -		return dma_fence_get(job->fence);
>>> +		fence = job->fence;
>>>    	}
>>> +
>>> +	xe_sched_job_put(job);	/* Pairs with get from xe_sched_job_arm */
>>
>> Only doubt is job being destroyed here. I think you were saying that
>> guc_exec_queue_free_job(drm_job) can potentially happen before run_job()
>> completes. But if that's the case can't the refcount reach zero here, and
>> then caller of run_job() goes down in flames, since the drm_job is no longer
>> a valid pointer, assuming the put() here frees the memory for it?
>>
> 
> Free job just puts the job (creation ref) so we still have reference
> from xe_sched_job_arm here. This put could potentially free the job's
> memory but it safe at this point in time as only the job's fence is
> needed after this. The job's fence is decoupled from the job and ref
> counted too.

Maybe I'm totally missing something, but I see two spots calling run_job():

drm_sched_resubmit_jobs():

fence = sched->ops->run_job(s_job);
if (IS_ERR_OR_NULL(fence)) {
     s_job->s_fence->parent = NULL;
     ....
} else {
     ....
     s_job->s_fence->parent = dma_fence_get(fence);
}

s_job looks to be the drm_job, so it needs to stay alive, otherwise 
s_job->s_fence goes boom AFAICT.

And same type of thing in drm_sched_run_job_work(), where it expects the 
drm_job to stay alive after calling run_job().

> 
> Matt
> 
>>> +
>>> +	return fence;
>>>    }
>>>    static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>>> index eeccc1c318ae..d0f4b908411f 100644
>>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>> @@ -280,16 +280,15 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>>>    		fence = &chain->base;
>>>    	}
>>> -	job->fence = fence;
>>> +	xe_sched_job_get(job);			/* Pairs with put in run_job */
>>> +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
>>>    	drm_sched_job_arm(&job->drm);
>>>    }
>>>    void xe_sched_job_push(struct xe_sched_job *job)
>>>    {
>>> -	xe_sched_job_get(job);
>>>    	trace_xe_sched_job_exec(job);
>>>    	drm_sched_entity_push_job(&job->drm);
>>> -	xe_sched_job_put(job);
>>>    }
>>>    /**
>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
>>> index 0d3f76fb05ce..8ed95e1a378f 100644
>>> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
>>> @@ -40,7 +40,6 @@ struct xe_sched_job {
>>>    	 * @fence: dma fence to indicate completion. 1 way relationship - job
>>>    	 * can safely reference fence, fence cannot safely reference job.
>>>    	 */
>>> -#define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
>>>    	struct dma_fence *fence;
>>>    	/** @user_fence: write back value when BB is complete */
>>>    	struct {
