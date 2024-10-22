Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABA9D1CDB8
	for <intel-xe@archiver.kernel.org>; Tue, 22 Oct 2024 08:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71BE210E1AD;
	Tue, 22 Oct 2024 08:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViAJ53n6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7628110E1AD
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Oct 2024 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729586398; x=1761122398;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=N1mE6u87ihggg8cnKAreIlaNJJvPWfl5UU9PHvHhSpo=;
 b=ViAJ53n65romGsyx/oNgLh5eY9UaJfvWZo7bIJFoiasLbosdeCm7Nr5Q
 8/hIOK/gd1NrAQskxbEaNXPoy0RNjYKQSRjWm1gv8LCQQYq3TD8JgBvb4
 ITVvrBYE0Gfau+zbgMK7u0/y9+LLaKCTz93RnVuebJRbJesBBe8Scvgzy
 KTETSa3gF2nwAYHOqYtm+hS6CkljHBrH5ZeMWzS76v/D2K9zV/7sf1Ojl
 fma4rAyL32587SZzLb2GHRLFJAPKkzbZP+RYWg4Hie0qMIyOqB6nlxAgv
 EYwiHDz8yMh8PAKXbvXAfoxnc8x3ayxTDVj9lzvsQGaZFkVpn58xsRCWQ A==;
X-CSE-ConnectionGUID: IEBx/SgHSzeuibl2QwwD+A==
X-CSE-MsgGUID: gYroraCPSUKu91aPMKteHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32796578"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="32796578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 01:39:58 -0700
X-CSE-ConnectionGUID: m4ANh4sXRv6jIEVGgOYBLw==
X-CSE-MsgGUID: vJR7LwRAT+uIUIEph9ueRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="103098894"
Received: from sosterlu-desk.ger.corp.intel.com (HELO [10.245.244.157])
 ([10.245.244.157])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 01:39:56 -0700
Message-ID: <dfb85077-3822-4b08-a2ba-3c20b58a8384@intel.com>
Date: Tue, 22 Oct 2024 09:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Take ref to job's fence in arm
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20241021173512.1584248-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241021173512.1584248-1-matthew.brost@intel.com>
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

On 21/10/2024 18:35, Matthew Brost wrote:
> Take ref to job's fence in arm rather than run job. This ref is owned by
> the drm scheduler so it makes sense to take the ref before handing over
> the job to the scheduler. Also removes an atomic from the run job path.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_execlist.c        | 2 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c      | 9 +++++----
>   drivers/gpu/drm/xe/xe_sched_job.c       | 2 +-
>   drivers/gpu/drm/xe/xe_sched_job_types.h | 1 -
>   4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f3b71fe7a96d..a8c416a48812 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -313,7 +313,7 @@ execlist_run_job(struct drm_sched_job *drm_job)
>   	q->ring_ops->emit_job(job);
>   	xe_execlist_make_active(exl);
>   
> -	return dma_fence_get(job->fence);
> +	return job->fence;
>   }
>   
>   static void execlist_job_free(struct drm_sched_job *drm_job)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0b81972ff651..25f51a947c3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -717,6 +717,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
> +	struct dma_fence *fence = NULL;
>   	bool lr = xe_exec_queue_is_lr(q);
>   
>   	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
> @@ -734,12 +735,12 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   
>   	if (lr) {
>   		xe_sched_job_set_error(job, -EOPNOTSUPP);
> -		return NULL;
> -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> -		return job->fence;
> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */

Just to confirm, with lr the run_job here is not going to be run more 
than once?

>   	} else {
> -		return dma_fence_get(job->fence);
> +		fence = job->fence;
>   	}
> +
> +	return fence;
>   }
>   
>   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index eeccc1c318ae..1905ca590965 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -280,7 +280,7 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>   		fence = &chain->base;
>   	}
>   
> -	job->fence = fence;
> +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */
>   	drm_sched_job_arm(&job->drm);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 0d3f76fb05ce..8ed95e1a378f 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -40,7 +40,6 @@ struct xe_sched_job {
>   	 * @fence: dma fence to indicate completion. 1 way relationship - job
>   	 * can safely reference fence, fence cannot safely reference job.
>   	 */
> -#define JOB_FLAG_SUBMIT		DMA_FENCE_FLAG_USER_BITS
>   	struct dma_fence *fence;
>   	/** @user_fence: write back value when BB is complete */
>   	struct {
