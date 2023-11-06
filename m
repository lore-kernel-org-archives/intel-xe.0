Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55378C4332F
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 13:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2016510E038;
	Mon,  6 Nov 2023 13:52:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C3B10E038
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Nov 2023 13:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699278748; x=1730814748;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HE6RkiXn4YWvdzLqnPj1Nbkn+bV67EC5TodWmMHkxIY=;
 b=Gs21hCtwWIpMXswjgcirZKqNXRLUKXXKSeg1n/klTEsXvfd54xUbxX/l
 Xtj2JMYg4Wpw0dlZLeBViItrNfS56xeTzWqHxKqnPHnmASDl0p7EsKZkZ
 OV70k/UcCOV1n2X1kvGl4y7UNofJvgaLHMuBxzn4gWq7OJ96J5aReTbrV
 VqbQgFF0ofJd7Y+BuAa5OWwvL3s55ei0rfX7STz25QdGyDNEjV5OFrUlo
 KyxeSZizbZclw3EbHkPqh6WzDolIOKuV5Rp0ZInxcyVzWKLUk+U9oLHRp
 6lYYNuEwErvb+y2u7SacncusTJHPV+pAL+fN7MKewg0k0zkViB+wIyvTA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="7909738"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="7909738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 05:52:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="10465234"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 05:52:26 -0800
Message-ID: <0eed9435-d371-c589-12a9-b0342784feb7@linux.intel.com>
Date: Mon, 6 Nov 2023 14:52:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20231026040213.1272993-1-matthew.brost@intel.com>
 <20231026040213.1272993-3-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231026040213.1272993-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 02/26] drm/xe: Allow num_batch_buffer == 0 in
 exec IOCTL
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


On 10/26/23 06:01, Matthew Brost wrote:
> The idea being out-syncs can signal indicating all previous operations
> on the exec queue are complete. An example use case of this would be
> support for implementing vkQueueWaitForIdle easily.
>
> v2: Don't add last_fence for VM's that do not support dma fences
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Also, here, as we discussed previously, this breaks with in-fences, right?

/Thomas


> ---
>   drivers/gpu/drm/xe/xe_exec.c             | 22 +++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_exec_queue.c       |  5 ++++-
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  5 +++--
>   drivers/gpu/drm/xe/xe_sync.c             |  5 ++++-
>   drivers/gpu/drm/xe/xe_sync.h             |  2 +-
>   drivers/gpu/drm/xe/xe_vm.c               |  2 +-
>   6 files changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 28e84a0bbeb0..4666f5b145f7 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -161,7 +161,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
>   		return -EINVAL;
>   
> -	if (XE_IOCTL_DBG(xe, q->width != args->num_batch_buffer))
> +	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
> +			 q->width != args->num_batch_buffer))
>   		return -EINVAL;
>   
>   	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_BANNED)) {
> @@ -182,12 +183,13 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	for (i = 0; i < args->num_syncs; i++) {
>   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
>   					  &syncs_user[i], true,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_no_dma_fences(vm),
> +					  !args->num_batch_buffer);
>   		if (err)
>   			goto err_syncs;
>   	}
>   
> -	if (xe_exec_queue_is_parallel(q)) {
> +	if (args->num_batch_buffer && xe_exec_queue_is_parallel(q)) {
>   		err = __copy_from_user(addresses, addresses_user, sizeof(u64) *
>   				       q->width);
>   		if (err) {
> @@ -234,6 +236,18 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_exec;
>   	}
>   
> +	if (!args->num_batch_buffer) {
> +		if (!xe_vm_no_dma_fences(vm)) {
> +			struct dma_fence *fence =
> +				xe_exec_queue_last_fence_get(q, vm);
> +
> +			for (i = 0; i < num_syncs; i++)
> +				xe_sync_entry_signal(&syncs[i], NULL, fence);
> +		}
> +
> +		goto err_exec;
> +	}
> +
>   	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
>   		err = -EWOULDBLOCK;
>   		goto err_exec;
> @@ -327,6 +341,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   
>   	if (xe_exec_queue_is_lr(q))
>   		q->ring_ops->emit_job(job);
> +	if (!xe_vm_no_dma_fences(vm))
> +		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
>   	xe_sched_job_push(job);
>   	xe_vm_reactivate_rebind(vm);
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index dd61c4267e24..b442d86d34fe 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -921,7 +921,10 @@ int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>   static void xe_exec_queue_last_fence_lockdep_assert(struct xe_exec_queue *q,
>   						    struct xe_vm *vm)
>   {
> -	lockdep_assert_held_write(&vm->lock);
> +	if (q->flags & EXEC_QUEUE_FLAG_VM)
> +		lockdep_assert_held_write(&vm->lock);
> +	else
> +		xe_vm_assert_held(vm);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index ecd761177567..35ffe7c55f25 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -53,8 +53,9 @@ struct xe_exec_queue {
>   	struct xe_hw_fence_irq *fence_irq;
>   
>   	/**
> -	 * @last_fence: last fence on engine, protected by vm->lock in write
> -	 * mode if bind engine
> +	 * @last_fence: last fence on exec queue, protected by vm->lock in write
> +	 * mode if bind exec queue, protected by dma resv lock if non-bind exec
> +	 * queue
>   	 */
>   	struct dma_fence *last_fence;
>   
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index 73ef259aa387..2461e7d4814c 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -100,7 +100,7 @@ static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>   int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   			struct xe_sync_entry *sync,
>   			struct drm_xe_sync __user *sync_user,
> -			bool exec, bool no_dma_fences)
> +			bool exec, bool no_dma_fences, bool exec_nop)
>   {
>   	struct drm_xe_sync sync_in;
>   	int err;
> @@ -171,6 +171,9 @@ int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   		break;
>   
>   	case DRM_XE_SYNC_USER_FENCE:
> +		if (XE_IOCTL_DBG(xe, exec_nop))
> +			return -EOPNOTSUPP;
> +
>   		if (XE_IOCTL_DBG(xe, !signal))
>   			return -EOPNOTSUPP;
>   
> diff --git a/drivers/gpu/drm/xe/xe_sync.h b/drivers/gpu/drm/xe/xe_sync.h
> index 30958ddc4cdc..98f02bb34637 100644
> --- a/drivers/gpu/drm/xe/xe_sync.h
> +++ b/drivers/gpu/drm/xe/xe_sync.h
> @@ -15,7 +15,7 @@ struct xe_sched_job;
>   int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
>   			struct xe_sync_entry *sync,
>   			struct drm_xe_sync __user *sync_user,
> -			bool exec, bool compute_mode);
> +			bool exec, bool compute_mode, bool exec_nop);
>   int xe_sync_entry_wait(struct xe_sync_entry *sync);
>   int xe_sync_entry_add_deps(struct xe_sync_entry *sync,
>   			   struct xe_sched_job *job);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1483744936f..d39135a6a1d2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3077,7 +3077,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
>   		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
>   					  &syncs_user[num_syncs], false,
> -					  xe_vm_no_dma_fences(vm));
> +					  xe_vm_no_dma_fences(vm), false);
>   		if (err)
>   			goto free_syncs;
>   	}
