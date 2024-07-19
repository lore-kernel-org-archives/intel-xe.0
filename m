Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F998C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 07:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8AB10E925;
	Fri, 19 Jul 2024 07:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJHEh8jX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F61C10E925
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721375405; x=1752911405;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=cjo4iJWn2YjZbtYgJh12OrnqvzAHG92LGSbZbIQYdVI=;
 b=XJHEh8jXHq7dVOn6e4nHyu8T6rW/+rDLygnkpZ2TjIimlXpB4WgGnWbO
 mVM/9XbqyAS29ElaKQ9BJ/aC1BTcO+HVq37fZWqbo8+WI3ZBotp0iLzBL
 7UBOjU5ct+PTzhbZcvFjg7nP37hhgnL+cpuhEHa9cLjODeTg3/b4Y9qhO
 4YDfoHbOodnlC8+KEjYsUSMAckMxhvwjwm1zyZ6NJ0Sj9a7GR8e+bDIkF
 YAQF6FTkdPQpkQwvOMibshNtr6qZyLBYFavG4UgmrIZjEnGxaU75hqD2E
 ZTaxLuRZ+OOcSg2/iqpRFZIaa+1JFxWhbd2xcLmfWibpdxuOXnnorOzo7 A==;
X-CSE-ConnectionGUID: qvMyNZ+4SDCzMxex1LOJow==
X-CSE-MsgGUID: TSgSR5bLRlyaccMxc3s4QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29555408"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="29555408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 00:50:05 -0700
X-CSE-ConnectionGUID: 1GXqPYTLSb+C8nT4wlhkEg==
X-CSE-MsgGUID: 4OGhDfUrQNODvGxbyzDBzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="55312684"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.36])
 ([10.245.245.36])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 00:50:04 -0700
Message-ID: <b242f2c3-1c7f-418b-b7f2-0cfd92ba3d67@intel.com>
Date: Fri, 19 Jul 2024 08:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drm/xe: Hold a PM ref when GT TLB invalidations
 are inflight
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240718185531.1500815-1-matthew.brost@intel.com>
 <20240718185531.1500815-4-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240718185531.1500815-4-matthew.brost@intel.com>
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

On 18/07/2024 19:55, Matthew Brost wrote:
> Avoid GT TLB invalidation timeouts by holding a PM ref when
> invalidations are inflight.
> 
> v2:
>   - Drop PM ref before signaling fence (CI)
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
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

Should this be moved to the previous patch, which introduces the fence 
on stack?
