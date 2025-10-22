Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DF6CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 08:00:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F72C10E6D0;
	Wed, 22 Oct 2025 08:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="lcOm/+nh";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC91F10E6D0
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 08:00:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-46e542196c7so3786355e9.0
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 01:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1761120049; x=1761724849;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IpadlxGWTcZyNHTa6t9ZquNgO1DjXNpj7hPliLlbiBk=;
 b=lcOm/+nhJEHGfrrXdzgj2JiCd7a0+vvLvK5FJJjRx5DTT+J3VctDw9tWMz1LmgkAFj
 TV5m/urTJAK51/MjdFzuV1w6pkaH+Svc2+jSLM+tP/ijKDCCYfgGh+H/hGGvCXNhx78z
 zxN3uYivhWFqTAlusUEU1N2+cKwNSe0D/F8FR3Dg8bjKTN2ISMdckMEudPShaP5mNecB
 kxdoZ0aCroqplcyD7VD2bjaU5CPeVzBjHUHBtIl4M+7MKAcCGjM0IBazrIXqHHLptCR6
 4GYXjmtlYr5r4xswTMOyZ+0NajgDjX0hiOxxdjeVvMGBcy1y+1YhHB3s7tIhpjN0JHdu
 K8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761120049; x=1761724849;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IpadlxGWTcZyNHTa6t9ZquNgO1DjXNpj7hPliLlbiBk=;
 b=Fh6IsC7A19FylvQ1SBz0njIigNjFZBdlBdA3iEpFXIt0Zy/LZ+sK9YcVZxWVQOFxPi
 9+Y8unq/wCe1MS5Menxoyc7a11piUU8dfLpWKFL5vvCYTfj7iEmWpLR6bJKhT/QIFhls
 emsvFlE+3Rp251MgLDdg6iAgVa7piHcEXawtnkq8ODzvlxBZn/AaeST+eVb0k3Mey62r
 boAOUxkx2AI0P3q09LUvJD8DNvszw5u836+l2oblWnTEN2QLYd60B7iUU4wGBtSBgvXs
 5Qy8D+5lI0MRmcSLvcg780fkakd39t4EacvnxfDyaVu2cD47c9EDgpo+tU6srVlVyePZ
 oJvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ZnKbp0jIBY12anUfa9KQw6g9ySKpxv4N/3djGt5JP4TP11orLHEpvwwce8wTWfAkBHrupofgLw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynXzpEDv0AflWZp4DWWg0TGJrvvCdrYQK6n3g8ZHbq5hRsJz/3
 NwnRY9lkjEnpI/zdECdJgvDyHEc3uYehRwZe5M9MEjcFc3T4GnQsVpHAoZaOViHXY4o=
X-Gm-Gg: ASbGnctyGTvv6R7f6sg/uxGpHVaBPwFVG/DdyKf4KCsX7speqxP7lYHG1rGyo2BOY3H
 6q5ZTiD5sZaV+VI+rok4QnLFM/M7SzQ41RyVCtUlU73hokXT2QCAprq1bz0XmjcH9q303jcmh8S
 cmk8PWbGL1RAHHWqJUhDCEKTlnPtfvKxPK4oQ8Z+Q4cXpX++0PKXoPOORt1Fh8TahQ4ZXzrt6KO
 5PjodH8TBvEpsihtK6RaFTtnedQ7ikt+AcLaYgdtvSwfVjCwnUzbKQE8fpQ1IEn932IttQu8Ubw
 amJeGg7Qsth8RXUXFPAubMjr9N6+fFHwIK4GDCz+BjbJJB6rfIMw5sBxPguofg4AN+WxED+yHFE
 U2vydWzNkBlgOYq9QzKFsdxGPd3eEcuYZQaXkPPJYboREWsT/vibj8Tppm1D7yIjOLsGHvyTrV1
 gh5s0k4sj9E12mlBnLqfllhE6z/PPxjZMp0zSe
X-Google-Smtp-Source: AGHT+IEgONFEaUlAi/3lXbK0Nu1pZcVdrcKVFRyIIPWnEpBiW4S6p3gLXARYvn0/veweJwIravEsZA==
X-Received: by 2002:a7b:cb04:0:b0:471:ea1:a460 with SMTP id
 5b1f17b1804b1-475c6f5d7c1mr3258855e9.11.1761120048840; 
 Wed, 22 Oct 2025 01:00:48 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5bbc50sm24217059f8f.21.2025.10.22.01.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 01:00:48 -0700 (PDT)
Message-ID: <f7f83835-adaa-426a-94a5-21ad3bb240ff@ursulin.net>
Date: Wed, 22 Oct 2025 09:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe: Avoid serializing unbind jobs on prior TLB
 invalidations
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: carlos.santa@intel.com, thomas.hellstrom@linux.intel.com,
 Philipp Stanner <phasta@kernel.org>
References: <20251017165217.493595-1-matthew.brost@intel.com>
 <20251017165217.493595-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251017165217.493595-2-matthew.brost@intel.com>
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


On 17/10/2025 17:52, Matthew Brost wrote:
> When a burst of unbind jobs is issued, a dependency chain can form
> between the TLB invalidation of a previous unbind job and the current
> one. This leads to undesirable serialization, causing current jobs to
> wait unnecessarily for prior TLB invalidations, execute on the GPU when
> not needed, and significantly slow down the unbind burst—resulting in up
> to a 4× slowdown.
> 
> To break this chain, mask the last bind queue dependency if the last
> fence's DMA context matches the TLB invalidation context. This allows
> full pipelining of unbinds and TLB invalidations while preserving
> correct dma-fence signaling semantics.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c          |  3 +-
>   drivers/gpu/drm/xe/xe_exec_queue.c    | 18 +++++++++--
>   drivers/gpu/drm/xe/xe_exec_queue.h    |  3 +-
>   drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++--
>   drivers/gpu/drm/xe/xe_sched_job.c     | 44 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_sched_job.h     |  7 ++++-
>   drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
>   drivers/gpu/drm/xe/xe_tlb_inval_job.h |  2 ++
>   8 files changed, 98 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 0dc27476832b..6034cfc8be06 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -294,7 +294,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_put_job;
>   
>   	if (!xe_vm_in_lr_mode(vm)) {
> -		err = xe_sched_job_last_fence_add_dep(job, vm);
> +		err = xe_sched_job_last_fence_add_dep(job, vm, NO_MASK_DEP,
> +						      NO_MASK_DEP);
>   		if (err)
>   			goto err_put_job;
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 90cbc95f8e2e..d6f69d9bccba 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -25,6 +25,7 @@
>   #include "xe_migrate.h"
>   #include "xe_pm.h"
>   #include "xe_ring_ops_types.h"
> +#include "xe_sched_job.h"
>   #include "xe_trace.h"
>   #include "xe_vm.h"
>   #include "xe_pxp.h"
> @@ -1106,11 +1107,17 @@ void xe_exec_queue_last_fence_set(struct xe_exec_queue *q, struct xe_vm *vm,
>    * xe_exec_queue_last_fence_test_dep - Test last fence dependency of queue
>    * @q: The exec queue
>    * @vm: The VM the engine does a bind or exec for
> + * @mask_ctx0: Mask dma-fence context0
> + * @mask_ctx1: Mask dma-fence context1
> + *
> + * Test last fence dependency of queue, skipping masked dma fence contexts.
>    *
>    * Returns:
> - * -ETIME if there exists an unsignalled last fence dependency, zero otherwise.
> + * -ETIME if there exists an unsignalled and unmasked last fence dependency,
> + * zero otherwise.
>    */
> -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
> +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm,
> +				      u64 mask_ctx0, u64 mask_ctx1)
>   {
>   	struct dma_fence *fence;
>   	int err = 0;
> @@ -1119,6 +1126,13 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>   	if (fence) {
>   		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
>   			0 : -ETIME;
> +
> +		if (err == -ETIME) {
> +			if (xe_sched_job_mask_dependency(fence, mask_ctx0,
> +							 mask_ctx1))
> +				err = 0;
> +		}
> +
>   		dma_fence_put(fence);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a4dfbe858bda..99a35b22a46c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -85,7 +85,8 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
>   void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct xe_vm *vm,
>   				  struct dma_fence *fence);
>   int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> -				      struct xe_vm *vm);
> +				      struct xe_vm *vm, u64 mask_ctx0,
> +				      u64 mask_ctx1);
>   void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
>   
>   int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d22fd1ccc0ba..bba9ae559f57 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1341,10 +1341,21 @@ static int xe_pt_vm_dependencies(struct xe_sched_job *job,
>   	}
>   
>   	if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> +		u64 mask_ctx0 = NO_MASK_DEP, mask_ctx1 = NO_MASK_DEP;
> +
> +		if (ijob)
> +			mask_ctx0 = xe_tlb_inval_job_fence_context(ijob);
> +		if (mjob)
> +			mask_ctx1 = xe_tlb_inval_job_fence_context(mjob);
> +
>   		if (job)
> -			err = xe_sched_job_last_fence_add_dep(job, vm);
> +			err = xe_sched_job_last_fence_add_dep(job, vm,
> +							      mask_ctx0,
> +							      mask_ctx1);
>   		else
> -			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> +			err = xe_exec_queue_last_fence_test_dep(pt_update_ops->q,
> +								vm, mask_ctx0,
> +								mask_ctx1);
>   	}
>   
>   	for (i = 0; job && !err && i < vops->num_syncs; i++)
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..7cbdd87904c6 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -6,6 +6,7 @@
>   #include "xe_sched_job.h"
>   
>   #include <uapi/drm/xe_drm.h>
> +#include <linux/dma-fence-array.h>
>   #include <linux/dma-fence-chain.h>
>   #include <linux/slab.h>
>   
> @@ -295,19 +296,60 @@ void xe_sched_job_push(struct xe_sched_job *job)
>   	xe_sched_job_put(job);
>   }
>   
> +/**
> + * xe_sched_job_mask_dependency() - Determine if a dma-fence dependency can be masked
> + * @fence: The dma-fence to check
> + * @mask_ctx0: First context to compare against the fence's context
> + * @mask_ctx1: Second context to compare against the fence's context
> + *
> + * This function checks whether the context of the given dma-fence matches
> + * either of the provided mask contexts. If a match is found, the dependency
> + * represented by the fence can be skipped. If the fence is a dma-fence-array,
> + * its individual fences are unwound and checked.
> + *
> + * Return: true if the fence can be masked (i.e., skipped), false otherwise.
> + */
> +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> +				  u64 mask_ctx1)
> +{
> +	if (dma_fence_is_array(fence)) {
> +		struct dma_fence *__fence;
> +		int index;
> +
> +		dma_fence_array_for_each(__fence, index, fence)
> +			if (__fence->context == mask_ctx0 ||
> +			    __fence->context == mask_ctx1)
> +				return true;
> +	} else if (fence->context == mask_ctx0 ||
> +		   fence->context == mask_ctx1) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>   /**
>    * xe_sched_job_last_fence_add_dep - Add last fence dependency to job
>    * @job:job to add the last fence dependency to
>    * @vm: virtual memory job belongs to
> + * @mask_ctx0: Mask dma-fence context0
> + * @mask_ctx1: Mask dma-fence context1
> + *
> + * Add last fence dependency to job, skipping masked dma fence contexts.
>    *
>    * Returns:
>    * 0 on success, or an error on failing to expand the array.
>    */
> -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm)
> +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> +				    u64 mask_ctx0, u64 mask_ctx1)
>   {
>   	struct dma_fence *fence;
>   
>   	fence = xe_exec_queue_last_fence_get(job->q, vm);
> +	if (xe_sched_job_mask_dependency(fence, mask_ctx0, mask_ctx1)) {
> +		dma_fence_put(fence);
> +		return 0;
> +	}
>   
>   	return drm_sched_job_add_dependency(&job->drm, fence);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> index 3dc72c5c1f13..81d8e848e605 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> @@ -58,7 +58,8 @@ bool xe_sched_job_completed(struct xe_sched_job *job);
>   void xe_sched_job_arm(struct xe_sched_job *job);
>   void xe_sched_job_push(struct xe_sched_job *job);
>   
> -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm);
> +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct xe_vm *vm,
> +				    u64 mask_ctx0, u64 mask_ctx1);
>   void xe_sched_job_init_user_fence(struct xe_sched_job *job,
>   				  struct xe_sync_entry *sync);
>   
> @@ -93,4 +94,8 @@ void xe_sched_job_snapshot_print(struct xe_sched_job_snapshot *snapshot, struct
>   int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv *resv,
>   			  enum dma_resv_usage usage);
>   
> +#define NO_MASK_DEP	(~0x0ull)
> +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64 mask_ctx0,
> +				  u64 mask_ctx1);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> index 492def04a559..f2fe7f9fbb22 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> @@ -32,6 +32,8 @@ struct xe_tlb_inval_job {
>   	u64 start;
>   	/** @end: End address to invalidate */
>   	u64 end;
> +	/** @fence_context: Fence context for job */
> +	u64 fence_context;
>   	/** @asid: Address space ID to invalidate */
>   	u32 asid;
>   	/** @fence_armed: Fence has been armed */
> @@ -101,6 +103,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, struct xe_tlb_inval *tlb_inval,
>   	job->asid = asid;
>   	job->fence_armed = false;
>   	job->dep.ops = &dep_job_ops;
> +	job->fence_context = entity->fence_context + 1;

As a side note, hardcoding the assumption on how scheduler allocates 
contexts is not great given recent efforts to make drivers know less of 
the scheduler internals.

But what I really wanted to ask is, having only glanced the patch 
briefly, could xe performance problem here also be solved by unwrapping 
the container fences at the DRM scheduler dependency tracking level?

I am asking because amdgpu recently posted a patch to unwrap in their 
code for potentially similar performance reasons, and if now xe wants 
something similar, or even the same, it is an interesting question where 
to do it.

Also, I have a patch (not sure if I posted it so far) which unwraps in 
drm_sched_job_add_dependency() and converst the dependency xarray to 
unwrapped dma-fence-array. Initial idea there was to allow scheduler 
worker to only be woken up once, once all deps are signaled, but now if 
two drivers seems to be unwrapping fences maybe there is a case to be 
made for doing it in the core.

Regards,

Tvrtko

>   	kref_init(&job->refcount);
>   	xe_exec_queue_get(q);	/* Pairs with put in xe_tlb_inval_job_destroy */
>   
> @@ -266,3 +269,14 @@ void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job)
>   	if (!IS_ERR_OR_NULL(job))
>   		kref_put(&job->refcount, xe_tlb_inval_job_destroy);
>   }
> +
> +/**
> + * xe_tlb_inval_job_fence_context() - TLB invalidation job fence context
> + * @job: TLB invalidation job object
> + *
> + * Return: TLB invalidation job fence context
> + */
> +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job)
> +{
> +	return job->fence_context;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> index e63edcb26b50..2576165c2228 100644
> --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> @@ -30,4 +30,6 @@ void xe_tlb_inval_job_get(struct xe_tlb_inval_job *job);
>   
>   void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job);
>   
> +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job);
> +
>   #endif

