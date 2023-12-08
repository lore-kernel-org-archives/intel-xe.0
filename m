Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A44BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 12:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420C510E27D;
	Fri,  8 Dec 2023 12:31:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF5910E27D
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 12:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702038668; x=1733574668;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=pCuq8Fnuq2rt5eeaR2PW9sFnMyhvRcb3cHVDJlf2Hpg=;
 b=bo6Xpz/0QW3XUaVIF35mbzHrdmFTEStznIchrDHyQNohknCi7xMcAsHO
 ijdj+AxvopAuKPqs5HTLEhm5urkMy+9hZTLoqt13AVU7pRAhohDuZXdr3
 T1Ezr1SaMpCL76vw9oVBDLLpjZ4mFFOeG0YBMSCpSyo4PQDnQEnIgEGqM
 Rc6u4g5ipICxBr2zUePFIYgA+wYRdE1tkiKJ/jXHu1VD8KyKjc4dG9EVf
 8CAxcj9nAvebiOeVC2kZ4rRhHEqfmtXpNIgEZPVeNpdRKYvpSHmxD/508
 8YWkqJPCajDffZuaFZZkqPmk0p/ZdXXkzOYjq5bl/GPnQK3BR7g8U7Hef g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1278578"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1278578"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 04:31:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="890110333"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="890110333"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 04:31:06 -0800
Message-ID: <761241f7-cf01-309d-5929-cce041196245@linux.intel.com>
Date: Fri, 8 Dec 2023 13:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 6/6] drm/xe: Add last fence as dependency for jobs on
 user exec queues
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231206222141.398040-1-matthew.brost@intel.com>
 <20231206222141.398040-7-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231206222141.398040-7-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 12/6/23 23:21, Matthew Brost wrote:
> The last fence must be added as a dependency for jobs on user exec
> queues as it is possible for the last fence to be a composite software
> fence (unordered, ioctl with zero bb or binds) rather than hardware
> fence (ordered, previous job on queue).
>
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c       |  4 ++++
>   drivers/gpu/drm/xe/xe_exec_queue.c |  2 +-
>   drivers/gpu/drm/xe/xe_migrate.c    | 14 +++++++++++---
>   drivers/gpu/drm/xe/xe_sched_job.c  | 17 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_sched_job.h  |  4 ++++
>   5 files changed, 37 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 438e34585e1e..92b0da6580e8 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -313,6 +313,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_put_job;
>   
>   	if (!xe_vm_in_lr_mode(vm)) {
> +		err = xe_sched_job_last_fence_add_dep(job, vm);
> +		if (err)
> +			goto err_put_job;
> +
>   		err = down_read_interruptible(&vm->userptr.notifier_lock);
>   		if (err)
>   			goto err_put_job;
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 67e3fd9dfc5f..3911d14522ee 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -887,7 +887,7 @@ static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
>   						    struct xe_vm *vm)
>   {
>   	if (q->flags & EXEC_QUEUE_FLAG_VM)
> -		lockdep_assert_held_write(&vm->lock);
> +		lockdep_assert_held(&vm->lock);
>   	else
>   		xe_vm_assert_held(vm);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e8b567708ac0..ce14498b416a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1163,17 +1163,24 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>   	return fence;
>   }
>   
> -static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
> +static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> +			struct xe_sync_entry *syncs, u32 num_syncs)
>   {
> +	struct dma_fence *fence;
>   	int i;
>   
>   	for (i = 0; i < num_syncs; i++) {
> -		struct dma_fence *fence = syncs[i].fence;
> +		fence = syncs[i].fence;
>   
>   		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>   				       &fence->flags))
>   			return false;
>   	}
> +	if (q) {
> +		fence = xe_exec_queue_last_fence_get(q, vm);
> +		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +			return false;
> +	}
>   
>   	return true;
>   }
> @@ -1234,7 +1241,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>   	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>   
>   	/* Use the CPU if no in syncs and engine is idle */
> -	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> +	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
>   		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
>   							num_updates,
>   							first_munmap_rebind,
> @@ -1351,6 +1358,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>   			goto err_job;
>   	}
>   
> +	err = xe_sched_job_last_fence_add_dep(job, vm);
>   	for (i = 0; !err && i < num_syncs; i++)
>   		err = xe_sync_entry_add_deps(&syncs[i], job);
>   
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index b467d5bfa4ac..b7d714522ae1 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -260,3 +260,20 @@ void xe_sched_job_push(struct xe_sched_job *job)
>   	drm_sched_entity_push_job(&job->drm);
>   	xe_sched_job_put(job);
>   }
> +
> +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
> +{
> +	struct dma_fence *fence;
> +
> +	fence = xe_exec_queue_last_fence_get(job->q, vm);
> +
> +	/* Only wait on unsignaled software fences */
> +	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) &&
> +	    !(fence->context == job->drm.entity->fence_context ||
> +	      fence->context == job->drm.entity->fence_context + 1)) {

Kerneldoc.

Also What's the (fence_context + 1) doing? Otherwise I think the drm 
scheduler code already tests for signaled and same context so we 
shouldn't be needing to code that here as well?

Also we should remember to look at bringing in Rob Clark's work where 
composite fences are unwrapped and added. Not merged yet though AFAICT.

Thanks,

Thomas


> +		dma_fence_get(fence);
> +		return drm_sched_job_add_dependency(&job->drm, fence);
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> index 6ca1d426c036..34f475ba7f50 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -8,6 +8,8 @@
>   
>   #include "xe_sched_job_types.h"
>   
> +struct xe_vm;
> +
>   #define XE_SCHED_HANG_LIMIT 1
>   #define XE_SCHED_JOB_TIMEOUT LONG_MAX
>   
> @@ -54,6 +56,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
>   void xe_sched_job_arm(struct xe_sched_job *job);
>   void xe_sched_job_push(struct xe_sched_job *job);
>   
> +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
> +
>   static inline struct xe_sched_job *
>   to_xe_sched_job(struct drm_sched_job *drm)
>   {
