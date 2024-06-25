Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78918C3064D
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 13:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271C910E64B;
	Tue, 25 Jun 2024 13:03:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQLX713C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D3310E64B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719320630; x=1750856630;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=v3V1bHkUdpPZkwCIZw/Q8JvEGnvTfij1BzRb3e3iwtU=;
 b=GQLX713Cy9xfveAtfLJIL8Ld9vC9GxbkpoKZ+b4q+gy+u516uFL2YM1W
 +g9q0nruv79DabF1x9yq45dGBiylBfDCb6EirIycVM/vGQA/INxQKlGUO
 t+qqLzmrl+Bf1W5Uv4jVfAGNQCblvIEQkkap5B7OtyNeJLP9uOhXbH/86
 bFaC0x9ZJip02Z6uWcAuvxRWJPUq2sHFJKvpSyXdE4EmIsvlWQV/ibZei
 BUjxUVur9wtJGvPnbRapS7K44K+FOfSHsT5Q6qqLJJ2SGAx9tXRLM4IrF
 McKhgix5tX3VztDCYn0Qou5UGHSzc9saq4p+DH1k8NxXxmK1RaeW1Xx4r g==;
X-CSE-ConnectionGUID: djffppBvQYqh4O6670uvKA==
X-CSE-MsgGUID: spOyi2c/TBWOGm1qRmaXxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="27742007"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="27742007"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:03:43 -0700
X-CSE-ConnectionGUID: gfoBYDCfQm+OODCi/XliBA==
X-CSE-MsgGUID: rbddxpXHRY2cKgTwgK/f1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="74403373"
Received: from opintica-mobl1 (HELO [10.245.244.205]) ([10.245.244.205])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 06:03:41 -0700
Message-ID: <d7193933-69c2-42b6-86cc-3938c1b00624@intel.com>
Date: Tue, 25 Jun 2024 14:03:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Add timeout to preempt fences
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240625055120.3997338-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240625055120.3997338-1-matthew.brost@intel.com>
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

Hi,

On 25/06/2024 06:51, Matthew Brost wrote:
> To adhere to dma fencing rules that fences must signal within a
> reasonable amount of time, add a 5 second timeout to preempt fences. If
> this timeout occurs, kill the associated VM as this fatal to the VM.
> 
> v2:
>   - Add comment for smp_wmb (Checkpatch)
>   - Fix kernel doc typo (Inspection)
>   - Add comment for killed check (Niranjana)
> 
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++--
>   drivers/gpu/drm/xe/xe_execlist.c         |  3 +-
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 41 ++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_preempt_fence.c    | 14 +++++++-
>   drivers/gpu/drm/xe/xe_vm.c               | 10 +++++-
>   drivers/gpu/drm/xe/xe_vm.h               |  2 ++
>   6 files changed, 65 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 201588ec33c3..1e51c978db7a 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -172,9 +172,11 @@ struct xe_exec_queue_ops {
>   	int (*suspend)(struct xe_exec_queue *q);
>   	/**
>   	 * @suspend_wait: Wait for an exec queue to suspend executing, should be
> -	 * call after suspend.
> +	 * call after suspend. In dma-fencing path thus must return within a
> +	 * reasonable amount of time. A non-zero return shall indicate an error
> +	 * waiting for suspend.
>   	 */
> -	void (*suspend_wait)(struct xe_exec_queue *q);
> +	int (*suspend_wait)(struct xe_exec_queue *q);
>   	/**
>   	 * @resume: Resume exec queue execution, exec queue must be in a suspended
>   	 * state and dma fence returned from most recent suspend call must be
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index db906117db6d..7502e3486eaf 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -422,10 +422,11 @@ static int execlist_exec_queue_suspend(struct xe_exec_queue *q)
>   	return 0;
>   }
>   
> -static void execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
> +static int execlist_exec_queue_suspend_wait(struct xe_exec_queue *q)
>   
>   {
>   	/* NIY */
> +	return 0;
>   }
>   
>   static void execlist_exec_queue_resume(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 373447758a60..9df97ee94fca 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1301,6 +1301,17 @@ static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *ms
>   	kfree(msg);
>   }
>   
> +static void __suspend_fence_signal(struct xe_exec_queue *q)
> +{
> +	if (!q->guc->suspend_pending)
> +		return;
> +
> +	q->guc->suspend_pending = false;
> +	smp_wmb();	/* Ensure suspend_pending change is visible */

I guess it was already like that, but where is the matching smp_rmb()? 
If adding smp_wmb() there should usually always be a barrier on the 
reader side.

If this is just simple wake_up() / wait_event() pattern with single 
dependant store/load vs wait/wakeup then I don't think we need explicit 
barrier, it should be handled already by the api IIRC.

> +
> +	wake_up(&q->guc->suspend_wait);
> +}
> +
>   static void suspend_fence_signal(struct xe_exec_queue *q)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -1310,9 +1321,7 @@ static void suspend_fence_signal(struct xe_exec_queue *q)
>   		  guc_read_stopped(guc));
>   	xe_assert(xe, q->guc->suspend_pending);
>   
> -	q->guc->suspend_pending = false;
> -	smp_wmb();
> -	wake_up(&q->guc->suspend_wait);
> +	__suspend_fence_signal(q);
>   }
>   
>   static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> @@ -1465,6 +1474,7 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>   {
>   	trace_xe_exec_queue_kill(q);
>   	set_exec_queue_killed(q);
> +	__suspend_fence_signal(q);
>   	xe_guc_exec_queue_trigger_cleanup(q);
>   }
>   
> @@ -1561,12 +1571,31 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
>   	return 0;
>   }
>   
> -static void guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
> +static int guc_exec_queue_suspend_wait(struct xe_exec_queue *q)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> +	int ret;
> +
> +	/*
> +	 * Likely don't need to check exec_queue_killed() as we clear
> +	 * suspend_pending upon kill but to be paranoid but races in which
> +	 * suspend_pending is set after kill also check kill here.
> +	 */
> +	ret = wait_event_timeout(q->guc->suspend_wait,
> +				 !q->guc->suspend_pending ||
> +				 exec_queue_killed(q) ||
> +				 guc_read_stopped(guc),
> +				 HZ * 5);
>   
> -	wait_event(q->guc->suspend_wait, !q->guc->suspend_pending ||
> -		   guc_read_stopped(guc));
> +	if (!ret) {
> +		xe_gt_warn(guc_to_gt(guc),
> +			   "Suspend fence, guc_id=%d, failed to respond",
> +			   q->guc->id);
> +		/* XXX: Trigger GT reset? */
> +		return -ETIME;
> +	}
> +
> +	return 0;
>   }
>   
>   static void guc_exec_queue_resume(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_preempt_fence.c b/drivers/gpu/drm/xe/xe_preempt_fence.c
> index e8b8ae5c6485..8356d9798206 100644
> --- a/drivers/gpu/drm/xe/xe_preempt_fence.c
> +++ b/drivers/gpu/drm/xe/xe_preempt_fence.c
> @@ -16,11 +16,23 @@ static void preempt_fence_work_func(struct work_struct *w)
>   	struct xe_preempt_fence *pfence =
>   		container_of(w, typeof(*pfence), preempt_work);
>   	struct xe_exec_queue *q = pfence->q;
> +	int err = 0;
>   
>   	if (pfence->error)
>   		dma_fence_set_error(&pfence->base, pfence->error);
> +	else if (!q->ops->reset_status(q))
> +		err = q->ops->suspend_wait(q);
>   	else
> -		q->ops->suspend_wait(q);
> +		dma_fence_set_error(&pfence->base, -ENOENT);
> +
> +	if (err) {
> +		dma_fence_set_error(&pfence->base, err);
> +
> +		down_write(&q->vm->lock);
> +		xe_vm_kill(q->vm, false);
> +		up_write(&q->vm->lock);

I think grabbing vm->lock will deadlock here, right? Calling vm_kill 
might also be scary? lockdep will not see it unless we have some way of 
triggering the error path here. For reference: 
3cd1585e57908b6efcd967465ef7685f40b2a294

> +	}
> +
>   
>   	dma_fence_signal(&pfence->base);
>   	/*
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5b166fa03684..e7c15b7877b1 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -311,7 +311,15 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>   
>   #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
>   
> -static void xe_vm_kill(struct xe_vm *vm, bool unlocked)
> +/**
> + * xe_vm_kill() - VM Kill
> + * @vm: The VM.
> + * @unlocked: Flag indicates the VM's dma-resv is not held
> + *
> + * Kill the VM by setting banned flag indicated VM is no longer available for
> + * use. If in preempt fence mode, also kill all exec queue attached to the VM.
> + */
> +void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>   {
>   	struct xe_exec_queue *q;
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index b481608b12f1..c864dba35e1d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -259,6 +259,8 @@ static inline struct dma_resv *xe_vm_resv(struct xe_vm *vm)
>   	return drm_gpuvm_resv(&vm->gpuvm);
>   }
>   
> +void xe_vm_kill(struct xe_vm *vm, bool unlocked);
> +
>   /**
>    * xe_vm_assert_held(vm) - Assert that the vm's reservation object is held.
>    * @vm: The vm
