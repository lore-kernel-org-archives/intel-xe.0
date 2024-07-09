Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095C5C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 15:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C579B10E153;
	Tue,  9 Jul 2024 15:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ND0Y1WRk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5302310E153
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720540584; x=1752076584;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0dv6tmaycrhqK+fhUFiRO2mesObbX0xY3sSG3ThN3/o=;
 b=ND0Y1WRkCGHrB/l1h9CBscQ0SVLAsuu5s8xp/9woBm9qb8BOQ8IFJ9+8
 zjYacFNsq2Mri9+EuMLexCuECvBA2wiPJK0GoDfkcpsJnhncJBf9vqGNL
 HsdaK31c/Oewpm77WWGiz/O7xMycmifLH8B7b/05GozU2vh0kvnO3cgqs
 JA4v8n0p+Op4I0Hrzr5r515c9bSocs6S9bT5j4Lrfwn3E84M0jhgSXsKz
 cJobMATq4ThquOgGbJ0U82Avj5YZz3UNfDWXCaH+vCluUKeOmLIlkDUAI
 pU7Ha0YkqGeu+n2FlLb+L9f20XWspoFEv+VQP2YFvzlUrvYtlzOe1oVZT A==;
X-CSE-ConnectionGUID: ZuCSr5V6TeaIzQml1zO+UQ==
X-CSE-MsgGUID: cx5RL+QZTzCkT2m9n6ba1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="35344041"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="35344041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:56:24 -0700
X-CSE-ConnectionGUID: OrTjlITcQMuAoyVqVi1drA==
X-CSE-MsgGUID: iyHU2bj4Q16MpG/3qERfaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="48342393"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:56:22 -0700
Message-ID: <e381835e-a69d-48d4-81f9-185b2ee5124a@linux.intel.com>
Date: Tue, 9 Jul 2024 17:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] drm/xe: Add xe_gt_tlb_invalidation_fence_init
 helper
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <20240708040331.766264-2-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240708040331.766264-2-matthew.brost@intel.com>
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


On 7/8/2024 6:03 AM, Matthew Brost wrote:
> Other layers should not be touching struct xe_gt_tlb_invalidation_fence
> directly, add helper for initialization.
>
> v2:
>   - Add dma_fence_get and list init to xe_gt_tlb_invalidation_fence_init
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 36 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  3 ++
>   drivers/gpu/drm/xe/xe_pt.c                  | 26 +--------------
>   3 files changed, 40 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index d9359976ab8b..92a18a0e4acd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -508,3 +508,39 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   
>   	return 0;
>   }
> +
> +static const char *
> +invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
> +{
> +	return "xe";
> +}
> +
> +static const char *
> +invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
> +{
> +	return "invalidation_fence";
> +}
> +
> +static const struct dma_fence_ops invalidation_fence_ops = {
> +	.get_driver_name = invalidation_fence_get_driver_name,
> +	.get_timeline_name = invalidation_fence_get_timeline_name,
> +};
> +
> +/**
> + * xe_gt_tlb_invalidation_fence_init - Initialize TLB invalidation fence
> + * @gt: GT
> + * @fence: TLB invalidation fence to initialize
> + *
> + * Initialize TLB invalidation fence for use
> + */
> +void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> +				       struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	spin_lock_irq(&gt->tlb_invalidation.lock);
> +	dma_fence_init(&fence->base, &invalidation_fence_ops,
> +		       &gt->tlb_invalidation.lock,
> +		       dma_fence_context_alloc(1), 1);
> +	spin_unlock_irq(&gt->tlb_invalidation.lock);
> +	INIT_LIST_HEAD(&fence->link);
> +	dma_fence_get(&fence->base);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index bf3bebd9f985..948f4a2f5214 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -26,4 +26,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
>   int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno);
>   int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>   
> +void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
> +				       struct xe_gt_tlb_invalidation_fence *fence);
> +
>   #endif	/* _XE_GT_TLB_INVALIDATION_ */
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index f391de908033..1caa99b22c73 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1317,23 +1317,6 @@ struct invalidation_fence {
>   	u32 asid;
>   };
>   
> -static const char *
> -invalidation_fence_get_driver_name(struct dma_fence *dma_fence)
> -{
> -	return "xe";
> -}
> -
> -static const char *
> -invalidation_fence_get_timeline_name(struct dma_fence *dma_fence)
> -{
> -	return "invalidation_fence";
> -}
> -
> -static const struct dma_fence_ops invalidation_fence_ops = {
> -	.get_driver_name = invalidation_fence_get_driver_name,
> -	.get_timeline_name = invalidation_fence_get_timeline_name,
> -};
> -
>   static void invalidation_fence_cb(struct dma_fence *fence,
>   				  struct dma_fence_cb *cb)
>   {
> @@ -1372,15 +1355,8 @@ static void invalidation_fence_init(struct xe_gt *gt,
>   
>   	trace_xe_gt_tlb_invalidation_fence_create(gt_to_xe(gt), &ifence->base);
>   
> -	spin_lock_irq(&gt->tlb_invalidation.lock);
> -	dma_fence_init(&ifence->base.base, &invalidation_fence_ops,
> -		       &gt->tlb_invalidation.lock,
> -		       dma_fence_context_alloc(1), 1);
> -	spin_unlock_irq(&gt->tlb_invalidation.lock);
> -
> -	INIT_LIST_HEAD(&ifence->base.link);
> +	xe_gt_tlb_invalidation_fence_init(gt, &ifence->base);
>   
> -	dma_fence_get(&ifence->base.base);	/* Ref for caller */
>   	ifence->fence = fence;
>   	ifence->gt = gt;
>   	ifence->start = start;
