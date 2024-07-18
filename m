Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4AC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 12:45:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4CC10E7FC;
	Thu, 18 Jul 2024 12:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrS0qf+w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D733C10E803
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721306748; x=1752842748;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g9QCbNZ3PLNRS+ZuaHzEr1qDOlhMl0NZmVhcSo3p0Ts=;
 b=BrS0qf+wpOWam88MMGIvUx7Uq4+CYIG8Ye5SHpzXXA1/9wDfxAk4BOEH
 JeFnAUkpoE+hF6mQErTECNrWyr/T6mRIhXCNRlTbhZZr2eEQUIupZApip
 KYEtXMjvninajG80pKHpJWvhdQxdd0UsCH/xhTdT7NACdkr8VJui0vEPm
 amwD+qUHQCyjLToNhAcjIf9Io5fc/v1H1N8A0BDLcRUnZgOtIzTXViXIf
 SDerssflkMhGqJnXf0cVK9jzeTe3gLiDQlTazE24VsiQ9zSECB1voNLIb
 kh5jsoc5h8Grq58Fmjta2ha71NC5M21A2uq/ty3leutQfIBkwNsXTDPEj w==;
X-CSE-ConnectionGUID: b7Kf0YavQGes3ENgD0rA5A==
X-CSE-MsgGUID: SjKWOUvLRDqmP5O94JwiYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="22725969"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="22725969"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:45:48 -0700
X-CSE-ConnectionGUID: UOEZ9Sa2QICUaPB5+nYmuA==
X-CSE-MsgGUID: PRSv0ozFRsmO6Ee3u23Lwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="81771284"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 05:45:47 -0700
Message-ID: <bce63625-01a4-47e3-9a4f-bca84e1e46ed@linux.intel.com>
Date: Thu, 18 Jul 2024 14:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe: Hold a PM ref when GT TLB invalidations
 are inflight
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, rodrigo.vivi@intel.com
References: <20240718065935.1451330-1-matthew.brost@intel.com>
 <20240718065935.1451330-4-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240718065935.1451330-4-matthew.brost@intel.com>
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


On 7/18/2024 8:59 AM, Matthew Brost wrote:
> Avoid GT TLB invalidation timeouts by holding a PM ref when
> invalidations are inflight.
>
> v2:
>   - Drop PM ref before signaling fence (CI)
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

I didn't manage reproduce the issue today for some reason(may be because 
of different RIL machine changed timing) but the issue exists.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c   | 62 ++++++++++++-------
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h   |  1 +
>   .../gpu/drm/xe/xe_gt_tlb_invalidation_types.h |  4 ++
>   drivers/gpu/drm/xe/xe_vm.c                    |  4 +-
>   4 files changed, 47 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 668c1a3f06ac..481d83d07367 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -13,6 +13,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_sriov.h"
>   #include "xe_trace.h"
>   #include "regs/xe_guc_regs.h"
> @@ -35,6 +36,24 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
>   	return hw_tlb_timeout + 2 * delay;
>   }
>   
> +static void
> +__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
> +
> +	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
> +	xe_gt_tlb_invalidation_fence_fini(fence);
> +	dma_fence_signal(&fence->base);
> +	if (!stack)
> +		dma_fence_put(&fence->base);
> +}
> +
> +static void
> +invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	list_del(&fence->link);
> +	__invalidation_fence_signal(xe, fence);
> +}
>   
>   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   {
> @@ -56,10 +75,8 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>   		xe_gt_err(gt, "TLB invalidation fence timeout, seqno=%d recv=%d",
>   			  fence->seqno, gt->tlb_invalidation.seqno_recv);
>   
> -		list_del(&fence->link);
>   		fence->base.error = -ETIME;
> -		dma_fence_signal(&fence->base);
> -		dma_fence_put(&fence->base);
> +		invalidation_fence_signal(xe, fence);
>   	}
>   	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>   		queue_delayed_work(system_wq,
> @@ -89,24 +106,6 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>   	return 0;
>   }
>   
> -static void
> -__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> -{
> -	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
> -
> -	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
> -	dma_fence_signal(&fence->base);
> -	if (!stack)
> -		dma_fence_put(&fence->base);
> -}
> -
> -static void
> -invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> -{
> -	list_del(&fence->link);
> -	__invalidation_fence_signal(xe, fence);
> -}
> -
>   /**
>    * xe_gt_tlb_invalidation_reset - Initialize GT TLB invalidation reset
>    * @gt: graphics tile
> @@ -266,8 +265,10 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>   
>   		xe_gt_tlb_invalidation_fence_init(gt, &fence, true);
>   		ret = xe_gt_tlb_invalidation_guc(gt, &fence);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			xe_gt_tlb_invalidation_fence_fini(&fence);
>   			return ret;
> +		}
>   
>   		xe_gt_tlb_invalidation_fence_wait(&fence);
>   	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> @@ -492,12 +493,15 @@ static const struct dma_fence_ops invalidation_fence_ops = {
>    * @fence: TLB invalidation fence to initialize
>    * @stack: fence is stack variable
>    *
> - * Initialize TLB invalidation fence for use
> + * Initialize TLB invalidation fence for use. xe_gt_tlb_invalidation_fence_fini
> + * must be called if fence is not signaled.
>    */
>   void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>   				       struct xe_gt_tlb_invalidation_fence *fence,
>   				       bool stack)
>   {
> +	xe_pm_runtime_get_noresume(gt_to_xe(gt));
> +
>   	spin_lock_irq(&gt->tlb_invalidation.lock);
>   	dma_fence_init(&fence->base, &invalidation_fence_ops,
>   		       &gt->tlb_invalidation.lock,
> @@ -508,4 +512,16 @@ void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>   		set_bit(FENCE_STACK_BIT, &fence->base.flags);
>   	else
>   		dma_fence_get(&fence->base);
> +	fence->gt = gt;
> +}
> +
> +/**
> + * xe_gt_tlb_invalidation_fence_fini - Finalize TLB invalidation fence
> + * @fence: TLB invalidation fence to finalize
> + *
> + * Drop PM ref which fence took durinig init.
> + */
> +void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	xe_pm_runtime_put(gt_to_xe(fence->gt));
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index f430d5797af7..a84065fa324c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -28,6 +28,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>   				       struct xe_gt_tlb_invalidation_fence *fence,
>   				       bool stack);
> +void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fence);
>   
>   static inline void
>   xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> index 934c828efe31..de6e825e0851 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation_types.h
> @@ -8,6 +8,8 @@
>   
>   #include <linux/dma-fence.h>
>   
> +struct xe_gt;
> +
>   /**
>    * struct xe_gt_tlb_invalidation_fence - XE GT TLB invalidation fence
>    *
> @@ -17,6 +19,8 @@
>   struct xe_gt_tlb_invalidation_fence {
>   	/** @base: dma fence base */
>   	struct dma_fence base;
> +	/** @gt: GT which fence belong to */
> +	struct xe_gt *gt;
>   	/** @link: link into list of pending tlb fences */
>   	struct list_head link;
>   	/** @seqno: seqno of TLB invalidation to signal fence one */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4a29d5be7310..9a9c1e11545b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3218,8 +3218,10 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   			 */
>   			ret = xe_gt_tlb_invalidation_vma(tile->primary_gt,
>   							 &fence[id], vma);
> -			if (ret < 0)
> +			if (ret < 0) {
> +				xe_gt_tlb_invalidation_fence_fini(&fence[id]);
>   				goto wait;
> +			}
>   
>   			tile_needs_invalidate |= BIT(id);
>   		}
