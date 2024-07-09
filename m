Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC96DC3DA41
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 15:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A57E10E59C;
	Tue,  9 Jul 2024 15:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eGAP0Wsu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4F110E59C
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 15:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720540668; x=1752076668;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zMubvm/K6fYEBMRSIgGKPL5ID9RUMf8GhoCNRCP/S3w=;
 b=eGAP0Wsu6Fqvaln2foc0DH+2VO0qVrRtdXijQhehRT9/TYSFUxpVGtYt
 UJxdbNaDTVBNdXrAH3jeWSQgaJijK5LzlxcWuWHuyaM1zjrWlRGns4C7f
 2s/h2ii1PFGc9rcLR8rtrNE+MlxhNpM1AjJjLMwzlKTiVuc/0Y/D61E2R
 6EQGsNB5itiLX0HldOj7WUKuMCJzcF/64DzyKp95mphIVpx2HIjVslotX
 9RUY3Jqvj1Tn74P5UXWHxRdyUvFa7CG3kOjcXG0+Hmt9yq9xAxg4c8KY9
 JKaOA9nJ0OxXJuzUnzMdnQdbXPtZgFWfcVm9SZ6aYESp/8w/g/UDWc6fv A==;
X-CSE-ConnectionGUID: jK+8GWuzTZKOR4j8Ll7Gxw==
X-CSE-MsgGUID: WqhBxhx6SIKLAFWMc8iypg==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="12455062"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="12455062"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:57:48 -0700
X-CSE-ConnectionGUID: 4csEj0p6QUuRaFh3cC8JZQ==
X-CSE-MsgGUID: 5tldMjdrQVugHL21L9+YWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52842165"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.254.89])
 ([10.94.254.89])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 08:57:46 -0700
Message-ID: <f838e080-7c3f-4f45-9e06-b5dcfc3f1461@linux.intel.com>
Date: Tue, 9 Jul 2024 17:57:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] drm/xe:
 s/tlb_invalidation.lock/tlb_invalidation.fence_lock
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, farah.kassabri@intel.com, michal.wajdeczko@intel.com
References: <20240708040331.766264-1-matthew.brost@intel.com>
 <20240708040331.766264-4-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240708040331.766264-4-matthew.brost@intel.com>
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
> tlb_invalidation.lock is the lock for GT TLB invalidation fences, name
> this accurately.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++----
>   drivers/gpu/drm/xe/xe_gt_types.h            | 4 ++--
>   2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 687214d07ac7..147840b66ba9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -80,7 +80,7 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
>   	gt->tlb_invalidation.seqno = 1;
>   	INIT_LIST_HEAD(&gt->tlb_invalidation.pending_fences);
>   	spin_lock_init(&gt->tlb_invalidation.pending_lock);
> -	spin_lock_init(&gt->tlb_invalidation.lock);
> +	spin_lock_init(&gt->tlb_invalidation.fence_lock);
>   	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
>   			  xe_gt_tlb_fence_timeout);
>   
> @@ -491,11 +491,11 @@ static const struct dma_fence_ops invalidation_fence_ops = {
>   void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>   				       struct xe_gt_tlb_invalidation_fence *fence)
>   {
> -	spin_lock_irq(&gt->tlb_invalidation.lock);
> +	spin_lock_irq(&gt->tlb_invalidation.fence_lock);
>   	dma_fence_init(&fence->base, &invalidation_fence_ops,
> -		       &gt->tlb_invalidation.lock,
> +		       &gt->tlb_invalidation.fence_lock,
>   		       dma_fence_context_alloc(1), 1);
> -	spin_unlock_irq(&gt->tlb_invalidation.lock);
> +	spin_unlock_irq(&gt->tlb_invalidation.fence_lock);
>   	INIT_LIST_HEAD(&fence->link);
>   	dma_fence_get(&fence->base);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 6b5e0b45efb0..d190a66514c0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -192,8 +192,8 @@ struct xe_gt {
>   		 * xe_gt_tlb_fence_timeout after the timeut interval is over.
>   		 */
>   		struct delayed_work fence_tdr;
> -		/** @tlb_invalidation.lock: protects TLB invalidation fences */
> -		spinlock_t lock;
> +		/** @tlb_invalidation.fence_lock: protects TLB invalidation fences */
> +		spinlock_t fence_lock;
>   	} tlb_invalidation;
>   
>   	/**
