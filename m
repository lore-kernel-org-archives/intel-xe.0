Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80448CF9C69
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 10:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CA910E3D6;
	Mon, 23 Sep 2024 10:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8oGQk1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F10210E3D6
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727087981; x=1758623981;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ofPVosWS9KC4Anmg6CQavVKEL7+AlohQx18MbJykXw4=;
 b=e8oGQk1SWA/p2Pb4hKQj0/X7JKzdrOEe43KZ02xrl/hCx8Cduii2iANo
 gMswpOgece5Gt75vdzhGZ/+7Yqxzuf0+jb2pAqXUVaVIT+eaPlp69WAlF
 /x/smq5cvJIQY3qV7Q2+8KofzXxMsdQoDVfcjFxi1HfMVGNVVo7yFo7O2
 BNPpj9/jCLCCran5kYcRy3ImugIGGkZRz1gYuw5RYD0QFSJKIhTKgxp0q
 NSbgO9XwSYM4wLtUJHJhf9veXbZ0ZBYIGqXt/J8QgDBZfjXNOLm8Jp1vO
 cg2+HpX/hSVI9AOFQ2Az9uLeNMMf2DO0+qldCn0z1aaJpniE8PeWau/7h Q==;
X-CSE-ConnectionGUID: XPjKp5S3QIaE2U4ozVTi7w==
X-CSE-MsgGUID: 6cCMnLZLRtOPUSOkIEOBzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="13660633"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="13660633"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 03:39:41 -0700
X-CSE-ConnectionGUID: MGKxaloFRS2dfn0mXDJMdA==
X-CSE-MsgGUID: WLZ/nVoOSX6wspJo6s/MWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="75405929"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.245.234])
 ([10.245.245.234])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 03:39:40 -0700
Message-ID: <1ca1556c-3862-412b-b7b7-ed544004e58e@intel.com>
Date: Mon, 23 Sep 2024 11:39:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Take ref to job and job's fence in
 xe_sched_job_arm
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240921015605.2692906-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240921015605.2692906-1-matthew.brost@intel.com>
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

On 21/09/2024 02:56, Matthew Brost wrote:
> Fixes two possible races:
> 
> - Submission to hardware signals job's fence before dma_fence_get at end
>    of run_job
> - TDR fires and signals fence + free job before run_job completes
> 
> Taking refs in xe_sched_job_arm to job and job's fence solves these by
> ensure all refs collected before entering the DRM scheduler. The refs
> are dropped in run_job and DRM scheduler respectfully. Safe as once
> xe_sched_job_arm is called execution of job through DRM sched is
> guaranteed.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2811
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>   drivers/gpu/drm/xe/xe_execlist.c        |  4 +++-
>   drivers/gpu/drm/xe/xe_guc_submit.c      | 11 +++++++----
>   drivers/gpu/drm/xe/xe_sched_job.c       |  5 ++---
>   drivers/gpu/drm/xe/xe_sched_job_types.h |  1 -
>   4 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f3b71fe7a96d..b70706c9caf2 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -309,11 +309,13 @@ execlist_run_job(struct drm_sched_job *drm_job)
>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_execlist_exec_queue *exl = job->q->execlist;
> +	struct dma_fence *fence = job->fence;
>   
>   	q->ring_ops->emit_job(job);
>   	xe_execlist_make_active(exl);
> +	xe_sched_job_put(job);
>   
> -	return dma_fence_get(job->fence);
> +	return fence;
>   }
>   
>   static void execlist_job_free(struct drm_sched_job *drm_job)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index fbbe6a487bbb..689279fdef80 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -766,6 +766,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_device *xe = guc_to_xe(guc);
>   	bool lr = xe_exec_queue_is_lr(q);
> +	struct dma_fence *fence = NULL;
>   
>   	xe_assert(xe, !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>   		  exec_queue_banned(q) || exec_queue_suspended(q));
> @@ -782,12 +783,14 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   
>   	if (lr) {
>   		xe_sched_job_set_error(job, -EOPNOTSUPP);
> -		return NULL;
> -	} else if (test_and_set_bit(JOB_FLAG_SUBMIT, &job->fence->flags)) {
> -		return job->fence;
> +		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */

Not too sure about this, is it really safe to drop the JOB_FLAG_SUBMIT 
dance? Seems like queue_run_job can be called more than once for a given 
job, according to the comment for run_job in drm sched, in which case 
this will maybe hit UAF.

>   	} else {
> -		return dma_fence_get(job->fence);
> +		fence = job->fence;
>   	}
> +
> +	xe_sched_job_put(job);	/* Pairs with get from xe_sched_job_arm */

Why do we need a ref on the job itself? free_job() looks to drop its own 
ref, are we saying that free_job() can really be run before run_job()? I 
assume really bad stuff will happen if the refcount reaches zero inside 
run_job() here? Is that impossible?

> +
> +	return fence;
>   }
>   
>   static void guc_exec_queue_free_job(struct drm_sched_job *drm_job)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index eeccc1c318ae..d0f4b908411f 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -280,16 +280,15 @@ void xe_sched_job_arm(struct xe_sched_job *job)
>   		fence = &chain->base;
>   	}
>   
> -	job->fence = fence;
> +	xe_sched_job_get(job);			/* Pairs with put in run_job */
> +	job->fence = dma_fence_get(fence);	/* Pairs with put in scheduler */

So roughly the run_job() is always run at least once, if we get as far 
as the arm, even in the case where there is some kind of error? We no 
longer grab a ref in run_job() so this should balance out, assuming its 
run exactly once.

>   	drm_sched_job_arm(&job->drm);
>   }
>   
>   void xe_sched_job_push(struct xe_sched_job *job)
>   {
> -	xe_sched_job_get(job);
>   	trace_xe_sched_job_exec(job);
>   	drm_sched_entity_push_job(&job->drm);
> -	xe_sched_job_put(job);
>   }
>   
>   /**
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
