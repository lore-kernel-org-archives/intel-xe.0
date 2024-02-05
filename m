Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695ABC48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 10:46:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33FA510E857;
	Mon,  5 Feb 2024 10:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBlZtOHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC2810E6BE
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 10:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707129971; x=1738665971;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lgqg48CjKmRUaE1KITvoWzeKQ17JNn20v7Izw7Dtrcg=;
 b=PBlZtOHkChJVT/W+iJGBIQKoeifMKCxjYPeB9GLnyK527Kcf/mfLHogv
 xD+Zar5zAzO+bzvXgBxQPBeLvwW0vxzP/CgRaUVI0X9VfCv3SkILwKKf7
 T+8i5H1okkhmtKXYyMBcyAw+n96zyUkF2PPVWB0RJXSjM6+xdj92rX0nG
 ZhpB5rqqILGZC7Ste017LK9pVUIMRN9ozI2LJd+SRiBEx07rVGt0af+lF
 LXgJ+HbIGS8+qOwgLHXUlgCpY2pO0PKgc0mrF1y62t1C1ZR0VZzXuaw2h
 JBDMs5exUuLzA0T3ItgDwky+id1xrrKPQIImcqLrs0Jx374C25zw63DgW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11867146"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="11867146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 02:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; d="scan'208";a="23936730"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 02:46:08 -0800
Message-ID: <e2cc5d1d-4d37-44dd-b097-c00198c9caae@intel.com>
Date: Mon, 5 Feb 2024 10:46:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/34] drm/xe: Convert scheduler towards direct pm_runtime
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-11-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-11-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> Let's ensure our PCI device is awaken on every GT execution to
> the end of the execution.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c          | 19 -------------------
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c       |  8 ++++++--
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h       |  3 ++-
>   drivers/gpu/drm/xe/xe_gpu_scheduler_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_guc_submit.c          |  2 +-
>   drivers/gpu/drm/xe/xe_sched_job.c           | 12 +++++++-----
>   6 files changed, 18 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index c0b7434e78f1..04bd6a639d41 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -111,7 +111,6 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>   
>   static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   {
> -	struct xe_device *xe = gt_to_xe(q->gt);
>   	int i, err;
>   
>   	for (i = 0; i < q->width; ++i) {
> @@ -124,17 +123,6 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   	if (err)
>   		goto err_lrc;
>   
> -	/*
> -	 * Normally the user vm holds an rpm ref to keep the device
> -	 * awake, and the context holds a ref for the vm, however for
> -	 * some engines we use the kernels migrate vm underneath which offers no
> -	 * such rpm ref, or we lack a vm. Make sure we keep a ref here, so we
> -	 * can perform GuC CT actions when needed. Caller is expected to have
> -	 * already grabbed the rpm ref outside any sensitive locks.
> -	 */
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> -		drm_WARN_ON(&xe->drm, !xe_device_mem_access_get_if_ongoing(xe));
> -
>   	return 0;
>   
>   err_lrc:
> @@ -221,8 +209,6 @@ void xe_exec_queue_fini(struct xe_exec_queue *q)
>   
>   	for (i = 0; i < q->width; ++i)
>   		xe_lrc_finish(q->lrc + i);
> -	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && (q->flags & EXEC_QUEUE_FLAG_VM || !q->vm))
> -		xe_device_mem_access_put(gt_to_xe(q->gt));
>   	__xe_exec_queue_free(q);
>   }
>   
> @@ -704,9 +690,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   			if (XE_IOCTL_DBG(xe, !hwe))
>   				return -EINVAL;
>   
> -			/* The migration vm doesn't hold rpm ref */
> -			xe_device_mem_access_get(xe);
> -
>   			flags = EXEC_QUEUE_FLAG_PERSISTENT | EXEC_QUEUE_FLAG_VM |
>   				(id ? EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD : 0);
>   
> @@ -715,8 +698,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>   						   args->width, hwe, flags,
>   						   args->extensions);
>   
> -			xe_device_mem_access_put(xe); /* now held by engine */
> -
>   			xe_vm_put(migrate_vm);
>   			if (IS_ERR(new)) {
>   				err = PTR_ERR(new);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index e4ad1d6ce1d5..457f814bfee8 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "xe_gpu_scheduler.h"
> +#include "xe_pm.h"
>   
>   static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
>   {
> @@ -48,13 +49,15 @@ static void xe_sched_process_msg_work(struct work_struct *w)
>   
>   	msg = xe_sched_get_msg(sched);
>   	if (msg) {
> +		xe_pm_runtime_get(sched->xe);

This seems very deep? I get the feeling this should be if_active() or 
done higher up.

What does lockdep say about this with our lockdep pm annotations? I 
think rpm suspend code wants to flush this worker, but if device is 
SUSPENDING then we are already in our pm callback, and it won't be able 
to make forward progress since worker here is potentially trying to wake 
up the device. Seems like potential deadlocks.

See suspend -> xe_guc_submit_stop() -> guc_exec_queue_stop() -> 
xe_sched_submission_stop().

>   		sched->ops->process_msg(msg);
> -
>   		xe_sched_process_msg_queue_if_ready(sched);
> +		xe_pm_runtime_put(sched->xe);
>   	}
>   }
>   
> -int xe_sched_init(struct xe_gpu_scheduler *sched,
> +int xe_sched_init(struct xe_device *xe,
> +		  struct xe_gpu_scheduler *sched,
>   		  const struct drm_sched_backend_ops *ops,
>   		  const struct xe_sched_backend_ops *xe_ops,
>   		  struct workqueue_struct *submit_wq,
> @@ -63,6 +66,7 @@ int xe_sched_init(struct xe_gpu_scheduler *sched,
>   		  atomic_t *score, const char *name,
>   		  struct device *dev)
>   {
> +	sched->xe = xe;
>   	sched->ops = xe_ops;
>   	INIT_LIST_HEAD(&sched->msgs);
>   	INIT_WORK(&sched->work_process_msg, xe_sched_process_msg_work);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 10c6bb9c9386..bac37c311859 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -9,7 +9,8 @@
>   #include "xe_gpu_scheduler_types.h"
>   #include "xe_sched_job_types.h"
>   
> -int xe_sched_init(struct xe_gpu_scheduler *sched,
> +int xe_sched_init(struct xe_device *xe,
> +		  struct xe_gpu_scheduler *sched,
>   		  const struct drm_sched_backend_ops *ops,
>   		  const struct xe_sched_backend_ops *xe_ops,
>   		  struct workqueue_struct *submit_wq,
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> index 6731b13da8bb..f14b88264025 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler_types.h
> @@ -43,6 +43,8 @@ struct xe_sched_backend_ops {
>   struct xe_gpu_scheduler {
>   	/** @base: DRM GPU scheduler */
>   	struct drm_gpu_scheduler		base;
> +	/** @xe: back pointer to Xe Device */
> +	struct xe_device			*xe;
>   	/** @ops: Xe scheduler ops */
>   	const struct xe_sched_backend_ops	*ops;
>   	/** @msgs: list of messages to be processed in @work_process_msg */
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 2b008ec1b6de..6b313b9b351a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1219,7 +1219,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   
>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>   		  q->sched_props.job_timeout_ms;
> -	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> +	err = xe_sched_init(xe, &ge->sched, &drm_sched_ops, &xe_sched_ops,
>   			    get_submit_wq(guc),
>   			    q->lrc[0].ring.size / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index 01106a1156ad..c93284ec66c5 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -15,6 +15,7 @@
>   #include "xe_hw_fence.h"
>   #include "xe_lrc.h"
>   #include "xe_macros.h"
> +#include "xe_pm.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   
> @@ -67,6 +68,8 @@ static void job_free(struct xe_sched_job *job)
>   	struct xe_exec_queue *q = job->q;
>   	bool is_migration = xe_sched_job_is_migration(q);
>   
> +	xe_pm_runtime_put(gt_to_xe(q->gt));
> +
>   	kmem_cache_free(xe_exec_queue_is_parallel(job->q) || is_migration ?
>   			xe_sched_job_parallel_slab : xe_sched_job_slab, job);
>   }
> @@ -79,6 +82,7 @@ static struct xe_device *job_to_xe(struct xe_sched_job *job)
>   struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   					 u64 *batch_addr)
>   {
> +	struct xe_device *xe = gt_to_xe(q->gt);
>   	struct xe_sched_job *job;
>   	struct dma_fence **fences;
>   	bool is_migration = xe_sched_job_is_migration(q);
> @@ -86,6 +90,9 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   	int i, j;
>   	u32 width;
>   
> +	if (!xe_pm_runtime_get_if_in_use(xe))
> +		drm_err(&xe->drm, "Failed to grab RPM ref for sched_job\n");

Could just return an error here also?

> +
>   	/* only a kernel context can submit a vm-less job */
>   	XE_WARN_ON(!q->vm && !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
>   
> @@ -155,9 +162,6 @@ struct xe_sched_job *xe_sched_job_create(struct xe_exec_queue *q,
>   	for (i = 0; i < width; ++i)
>   		job->batch_addr[i] = batch_addr[i];
>   
> -	/* All other jobs require a VM to be open which has a ref */
> -	if (unlikely(q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_get(job_to_xe(job));
>   	xe_device_assert_mem_access(job_to_xe(job));
>   
>   	trace_xe_sched_job_create(job);
> @@ -189,8 +193,6 @@ void xe_sched_job_destroy(struct kref *ref)
>   	struct xe_sched_job *job =
>   		container_of(ref, struct xe_sched_job, refcount);
>   
> -	if (unlikely(job->q->flags & EXEC_QUEUE_FLAG_KERNEL))
> -		xe_device_mem_access_put(job_to_xe(job));
>   	xe_exec_queue_put(job->q);
>   	dma_fence_put(job->fence);
>   	drm_sched_job_cleanup(&job->drm);
