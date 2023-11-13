Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F003AC4332F
	for <intel-xe@archiver.kernel.org>; Mon, 13 Nov 2023 12:50:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D5210E36D;
	Mon, 13 Nov 2023 12:50:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5ED610E36D
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Nov 2023 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699879846; x=1731415846;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Bls4OHaaP7sQeRgNKt32szcchYH9lGYvuwsDSxyUOqo=;
 b=i20dP5GF9WqZ6lwaRr+RzvnHmQfk47APuj37/jPtn0B5vIZ8M75FidqM
 uRPg8jm7Xzonb9R3jVoe0UCypyLhuqME+xczlJPNV/Ka4NFmwdx7GdwS2
 Gecx2XwxYy4zKaum8O4vomiIbgK3KtYrvrssHm18MhAww4oWEzURzQ1wQ
 gZaGlretwhA0nRnL11XMkbbnkC36N+/GY1KUtoKLpAaPnoONyZA3hYJ/n
 DWisp4nRJCO8B7gKU4PMyVNkI/CwmIEyA83rnOu0XTTM0xSLjIKeG/i8P
 fJsn8upl09Hkk3+x1fR6CpHVbizSyFtSfIkQSnNv1tA/5vDaX/QOZr8Wg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="390233942"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="390233942"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 04:50:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="793432297"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="793432297"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.112])
 ([10.249.254.112])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 04:50:44 -0800
Message-ID: <e345d385-b692-3ff1-82be-57f6392ca719@linux.intel.com>
Date: Mon, 13 Nov 2023 13:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231107052603.124361-1-matthew.brost@intel.com>
 <20231107052603.124361-4-matthew.brost@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231107052603.124361-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 03/27] drm/xe: Take in-syncs into account
 when num_execs or num_binds == 0
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

Hi,

On 11/7/23 06:25, Matthew Brost wrote:
> Wait on in-syncs before signaling out-syncs if num_execs or num_binds ==
> 0 in execbuf IOCTL or VM bind IOCTL respectfully.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c | 10 ++++-
>   drivers/gpu/drm/xe/xe_sync.c | 75 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sync.h |  5 +++
>   drivers/gpu/drm/xe/xe_vm.c   | 24 ++++++++++--
>   4 files changed, 108 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 4666f5b145f7..80ee6d8fcf68 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -238,11 +238,17 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   
>   	if (!args->num_batch_buffer) {
>   		if (!xe_vm_no_dma_fences(vm)) {
> -			struct dma_fence *fence =
> -				xe_exec_queue_last_fence_get(q, vm);
> +			struct dma_fence *fence;
>   
> +			fence = xe_sync_in_fence_get(syncs, num_syncs, q, vm);
> +			if (IS_ERR(fence)) {
> +				err = PTR_ERR(fence);
> +				goto err_exec;
> +			}
>   			for (i = 0; i < num_syncs; i++)
>   				xe_sync_entry_signal(&syncs[i], NULL, fence);
> +			xe_exec_queue_last_fence_set(q, vm, fence);
> +			dma_fence_put(fence);
>   		}
>   
>   		goto err_exec;
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 2461e7d4814c..6b38c74a1de1 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -5,6 +5,7 @@
>   
>   #include "xe_sync.h"
>   
> +#include <linux/dma-fence-array.h>
>   #include <linux/kthread.h>
>   #include <linux/sched/mm.h>
>   #include <linux/uaccess.h>
> @@ -14,6 +15,7 @@
>   #include <drm/xe_drm.h>
>   
>   #include "xe_device_types.h"
> +#include "xe_exec_queue.h"
>   #include "xe_macros.h"
>   #include "xe_sched_job_types.h"
>   
> @@ -274,3 +276,76 @@ void xe_sync_entry_cleanup(struct xe_sync_entry *sync)
>   	if (sync->ufence)
>   		user_fence_put(sync->ufence);
>   }
> +
> +/**
> + * xe_sync_in_fence_get() - Get a fence from syncs, exec queue, and VM
> + * @sync: input syncs
> + * @num_sync: number of syncs
> + * @q: exec queue
> + * @vm: VM
> + *
> + * Get a fence from syncs, exec queue, and VM. If syncs contain more than 1
> + * in-fence create and return a composite fence of all in-fences, if syncs
> + * contain 1 in-fence return in-fence, if no in-fences return last fence on
> + * input exec queue. Caller must drop reference to returned fence.
> + *
> + * Return: fence on success, ERR_PTR(-ENOMEM) on failure
> + */
> +struct dma_fence *
> +xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> +		     struct xe_exec_queue *q, struct xe_vm *vm)
> +{
> +	struct dma_fence **fences = NULL;
> +	struct dma_fence_array *cf = NULL;
> +	struct dma_fence *fence;
> +	int i, num_in_fence = 0, current_fence = 0;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	/* Count in-fences */
> +	for (i = 0; i < num_sync; ++i) {
> +		if (sync[i].fence) {
> +			++num_in_fence;
> +			fence = sync[i].fence;
> +		}
> +	}
> +
> +	/* Easy cases... */
> +	if (!num_in_fence) {
> +		fence = xe_exec_queue_last_fence_get(q, vm);
> +		dma_fence_get(fence);
> +		return fence;
> +	} else if (num_in_fence == 1) {


Don't we need to also wait on the exec_queue last fence in this case, 
and the multiple-in-fences below?
Otherwise we only wait for the in-fences but not on currently executing 
jobs?

Did you investigate just to forward a non-existing batchbuffer in the 
exec case and create a NOP binding job in the bind case?

/Thomas



> +		dma_fence_get(fence);
> +		return fence;
> +	}
> +
> +	/* Create composite fence */
> +	fences = kmalloc_array(num_in_fence, sizeof(*fences), GFP_KERNEL);
> +	if (!fences)
> +		return ERR_PTR(-ENOMEM);
> +	for (i = 0; i < num_sync; ++i) {
> +		if (sync[i].fence) {
> +			dma_fence_get(sync[i].fence);
> +			fences[current_fence++] = sync[i].fence;
> +		}
> +	}
> +	cf = dma_fence_array_create(num_in_fence, fences,
> +				    vm->composite_fence_ctx,
> +				    vm->composite_fence_seqno++,
> +				    false);
> +	if (!cf) {
> +		--vm->composite_fence_seqno;
> +		goto err_out;
> +	}
> +
> +	return &cf->base;
> +
> +err_out:
> +	while (current_fence)
> +		dma_fence_put(fences[--current_fence]);
> +	kfree(fences);
> +	kfree(cf);
> +
> +	return ERR_PTR(-ENOMEM);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index 98f02bb34637..c0c8ddac805d 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -9,8 +9,10 @@
>   #include "xe_sync_types.h"
>   
>   struct xe_device;
> +struct xe_exec_queue;
>   struct xe_file;
>   struct xe_sched_job;
> +struct xe_vm;
>   
>   int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   			struct xe_sync_entry *sync,
> @@ -23,5 +25,8 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync,
>   			  struct xe_sched_job *job,
>   			  struct dma_fence *fence);
>   void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> +struct dma_fence *
> +xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> +		     struct xe_exec_queue *q, struct xe_vm *vm);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2f212939d2b5..2a7fa8e2058e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3155,12 +3155,28 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   unwind_ops:
>   	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
>   free_syncs:
> -	for (i = 0; err == -ENODATA && i < num_syncs; i++) {
> -		struct dma_fence *fence =
> -			xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> +	if (err == -ENODATA) {
> +		struct dma_fence *fence;
>   
> -		xe_sync_entry_signal(&syncs[i], NULL, fence);
> +		fence = xe_sync_in_fence_get(syncs, num_syncs,
> +					     to_wait_exec_queue(vm, q), vm);
> +		if (IS_ERR(fence)) {
> +			err = PTR_ERR(fence);
> +			goto cleanup_syncs;
> +		}
> +		for (i = 0; i < num_syncs; i++)
> +			xe_sync_entry_signal(&syncs[i], NULL, fence);
> +		if (!async) {
> +			long timeout = dma_fence_wait(fence, true);
> +
> +			if (timeout < 0)
> +				err = -EINTR;
> +		}
> +		xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> +					     fence);
> +		dma_fence_put(fence);
>   	}
> +cleanup_syncs:
>   	while (num_syncs--)
>   		xe_sync_entry_cleanup(&syncs[num_syncs]);
>   
