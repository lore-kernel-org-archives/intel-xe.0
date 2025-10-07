Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C014ACCA472
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 12:30:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7532710E18E;
	Tue,  7 Oct 2025 12:30:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ImwqIewH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F259310E18E
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759840202; x=1791376202;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=WC0sK2En6sRYAGFGntZvIca8rkTcMI4/DUIyIZEQr+k=;
 b=ImwqIewHm0hL57yiL0Wy1mMghvV/PTeW3G+ZRMkQSv3/+QnkZjMF1mgE
 4kxgZUn+i9sUg1omtUlkNqS1ermF5tdp3ndNOGnbRidA0iHt3/RXCb9zv
 0Y3qKdqipWyfzg8i1j5wuHV2w4hufeJJBqCr5u/ynB7PW1ert13Njferq
 SSyJyRWuTmaQyOy47NYnFRv4ddQHjbg1Ql8YetPqL3ouKiARc/g1Wg657
 beQC288xDfMdjHlWj01k5A/LBR01ciuN36dD9otHWivjGIKueUWsEz3U9
 2uHGs3AuW88GfIxOYpU6CAtKzcqsslrDgjyKm/eS/b6PE4C8zUBMvg70S w==;
X-CSE-ConnectionGUID: P2W5W7ojQRGAKudCOkweSg==
X-CSE-MsgGUID: bpI58mFaRU+MPXaP+YJMSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="61227864"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61227864"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 05:30:01 -0700
X-CSE-ConnectionGUID: 7W5x4lnhTfy9Ew3hEkLCGQ==
X-CSE-MsgGUID: rRts2IhkQXyf3fsABPXnOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180066163"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.213])
 ([10.245.245.213])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 05:30:01 -0700
Message-ID: <12156345-50ed-42b9-a213-1b6be14b6a3f@intel.com>
Date: Tue, 7 Oct 2025 13:29:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/32] drm/xe: Don't change LRC ring head on job
 resubmission
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20251007112641.2669655-1-matthew.brost@intel.com>
 <20251007112641.2669655-6-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251007112641.2669655-6-matthew.brost@intel.com>
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

On 07/10/2025 12:26, Matthew Brost wrote:
> Now that we save the job's head during submission, it's no longer
> necessary to adjust the LRC ring head during resubmission. Instead, a
> software-based adjustment of the tail will overwrite the old jobs in
> place. For some odd reason, adjusting the LRC ring head didn't work on
> parallel queues, which was causing issues in our CI.
> 
> v5:
>   - Add comment in guc_exec_queue_start explaning why the function works
>     (Auld)
> v7:
>   - Only adjust first state on first unsignaled job (Auld)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h | 21 +++++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_submit.c    | 18 ++++++++++++++++--
>   2 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index e548b2aed95a..3a9ff78d9346 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -77,17 +77,30 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
>   	spin_unlock(&sched->base.job_list_lock);
>   }
>   
> +/**
> + * xe_sched_first_pending_job() - Find first pending job which is unsignaled
> + * @sched: Xe GPU scheduler
> + *
> + * Return first unsignaled job in pending list or NULL
> + */
>   static inline
>   struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
>   {
> -	struct xe_sched_job *job;
> +	struct xe_sched_job *job, *r_job = NULL;
>   
>   	spin_lock(&sched->base.job_list_lock);
> -	job = list_first_entry_or_null(&sched->base.pending_list,
> -				       struct xe_sched_job, drm.list);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> +		struct drm_sched_fence *s_fence = job->drm.s_fence;
> +		struct dma_fence *hw_fence = s_fence->parent;
> +
> +		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
> +			r_job = job;
> +			break;
> +		}
> +	}
>   	spin_unlock(&sched->base.job_list_lock);

I think it might make sense to split this change out, since it also 
changes the behaviour of the other existing caller, and that might want 
to be treated as a potential fix. Or commit needs to be reworded to make 
this more clear.

Otherwise lgtm.

>   
> -	return job;
> +	return r_job;
>   }
>   
>   static inline int
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3a534d93505f..d123bdb63369 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2008,11 +2008,25 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   
>   	if (!exec_queue_killed_or_banned_or_wedged(q)) {
> +		struct xe_sched_job *job = xe_sched_first_pending_job(sched);
>   		int i;
>   
>   		trace_xe_exec_queue_resubmit(q);
> -		for (i = 0; i < q->width; ++i)
> -			xe_lrc_set_ring_head(q->lrc[i], q->lrc[i]->ring.tail);
> +		if (job) {
> +			for (i = 0; i < q->width; ++i) {
> +				/*
> +				 * The GuC context is unregistered at this point
> +				 * time, adjusting software ring tail ensures
> +				 * jobs are rewritten in original placement,
> +				 * adjusting LRC tail ensures the newly loaded
> +				 * GuC / contexts only view the LRC tail
> +				 * increasing as jobs are written out.
> +				 */
> +				q->lrc[i]->ring.tail = job->ptrs[i].head;
> +				xe_lrc_set_ring_tail(q->lrc[i],
> +						     xe_lrc_ring_head(q->lrc[i]));
> +			}
> +		}
>   		xe_sched_resubmit_jobs(sched);
>   	}
>   

