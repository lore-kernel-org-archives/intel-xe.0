Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6A4D2E021
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 08:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5090310E792;
	Wed, 23 Oct 2024 08:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBE+nrjp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E73D10E792
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729671871; x=1761207871;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UTj3/qtv4hfyd075uGT7qJEGUdTkCRgoOtOZ3HRe2r8=;
 b=WBE+nrjpsXbLIwMKNPdgA2ISsFCP9810JEBDsuM2Sg6xKoB/JUKclgQJ
 ABRFizhjScEadStXlpnS+7RpX89ynbeiUlBspBtoYRBSD8/CZ2HOLgFcR
 CzwHThbGGr8N/k9jAnXkmMJPmGnxSaHADW4e91JMCkg8r2Kke0RM0xvm6
 fCNnYMgjY+qlQ7dhM+eGIJFvBPSY4u76hV3zKXG2kecv7yaKBSN2cWD3t
 VXD9wt/3xLrf0U/ehxLb/EKnJLoyfwm0yzTwi2JbDQ3nf/LvdeB+ekF6J
 g9Qo2a9J2En4LxXbtnLkrHV6NrJqgYbWWuMIIW22TNk67xUZq7Ac5SYdb A==;
X-CSE-ConnectionGUID: RPJ0oiwqQieYlMX6ktNsaA==
X-CSE-MsgGUID: kpVhUi44Tuu1/LV50dyRUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29139534"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="29139534"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 01:24:30 -0700
X-CSE-ConnectionGUID: 2pu9q1a2SD+iw69IRf3nJA==
X-CSE-MsgGUID: QzTx+hfrQiO3YaXY6SxZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; d="scan'208";a="110962528"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.245.66])
 ([10.245.245.66])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 01:24:29 -0700
Message-ID: <1f030603-745b-4c72-854a-bb52b35429fd@intel.com>
Date: Wed, 23 Oct 2024 09:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Take ref to job's fence in arm
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241021173512.1584248-1-matthew.brost@intel.com>
 <dfb85077-3822-4b08-a2ba-3c20b58a8384@intel.com>
 <Zxfnv0kWsFVjFkuw@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Zxfnv0kWsFVjFkuw@DUT025-TGLU.fm.intel.com>
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

On 22/10/2024 18:58, Matthew Brost wrote:
> On Tue, Oct 22, 2024 at 09:39:54AM +0100, Matthew Auld wrote:
>> On 21/10/2024 18:35, Matthew Brost wrote:
>>> Take ref to job's fence in arm rather than run job. This ref is owned by
>>> the drm scheduler so it makes sense to take the ref before handing over
>>> the job to the scheduler. Also removes an atomic from the run job path.
>>>
>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
>>>    drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++----
>>>    drivers/gpu/drm/xe/xe_sched_job.c       | 2 +-
>>>    drivers/gpu/drm/xe/xe_sched_job_types.h | 1 -
>>>    4 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
>>> index f3b71fe7a96d..a8c416a48812 100644
>>> --- a/drivers/gpu/drm/xe/xe_execlist.c
>>> +++ b/drivers/gpu/drm/xe/xe_execlist.c
>>> @@ -313,7 +313,7 @@ execlist_run_job(struct drm_sched_job *drm_job)
>>>    	q->ring_ops->emit_job(job);
>>>    	xe_execlist_make_active(exl);
>>> -	return dma_fence_get(job->fence);
>>> +	return job->fence;
>>>    }
>>>    static void execlist_job_free(struct drm_sched_job *drm_job)
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index 0b81972ff651..25f51a947c3a 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -717,6 +717,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>>    	struct xe_exec_queue *q = job->q;
>>>    	struct xe_guc *guc = exec_queue_to_guc(q);
>>>    	struct xe_device *xe = guc_to_xe(guc);
>>> +	struct dma_fence *fence = NULL;
>>>    	bool lr = xe_exec_queue_is_lr(q);
>>>    	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>>> @@ -734,12 +735,12 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>>>    	if (lr) {
>>>    		xe_sched_job_set_error(job, -EOPNOTSUPP);
>>> -		return NULL;
>>> -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
>>> -		return job->fence;
>>> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
>>
>> Just to confirm, with lr the run_job here is not going to be run more than
>> once?
>>
> 
> LR mode - at most once as we return NULL run_job so job is immediately
> signaled / removed from pending job list.
> 
> Non-LR mode - after a GT reset it is possible for a job to have run_job
> called a second time. In this case, there is no 'dma_fence_put' in the
> resubmit path which pairs with the 'dma_fence_get' in arm.
> 
> So I think this patch is correct.

Thanks for confirming,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> 
> Matt
> 
>>>    	} else {
>>> -		return dma_fence_get(job->fence);
>>> +		fence = job->fence;
>>>    	}
>>> +
>>> +	return fence;
>>>    }
>>>    static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>>> index eeccc1c318ae..1905ca590965 100644
>>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>> @@ -280,7 +280,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>>>    		fence = &chain->base;
>>>    	}
>>> -	job->fence = fence;
>>> +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
>>>    	drm_sched_job_arm(&job->drm);
>>>    }
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
