Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541D6E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 22:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAF310F1C3;
	Fri,  6 Dec 2024 22:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QG8MyGSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673E610F1C3
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 22:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733524345; x=1765060345;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nkhyB/t1EFRwmc0KQKBkVPqNILkS9n04iJnDrZ3E1EQ=;
 b=QG8MyGSa0F8hDXMiY0O1LNFBhxZcovhQjPgJAPWTIJmSuh9VdbvfPfgf
 Aw1KTKgsSt/ieiHaAMcsaV91SQ76EhgmOnPHfcCE8SdvT5UktO8DGbbb1
 jxYpTHqUBvORpFDivcBj/AfP2cmU3IJhC7Hn1xxM3vmJD91TvYwr7wGcL
 a+y7n/n77xxVax8Nkyka8mcYuw5hIdrEWZdO4aCK7bz85eatK3XTIhITP
 ULLDygCSxePYkrJVr9Ncd73WmhPAsfdoWoFVqLcikEvM7HEgQkzx1rvxU
 hdcLcpg/s8Rx2/Nrf43txoZQTyzIvZ9h+Jc9z8JZAmlVTpQ4gzd2oeCTp w==;
X-CSE-ConnectionGUID: lFetfgQMS2SEL6FzaH0JsA==
X-CSE-MsgGUID: 0Rg2IWbHQo2r9UbelhISmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="44565405"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="44565405"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 14:32:25 -0800
X-CSE-ConnectionGUID: AJ0WBb30RTCv+p7YTR+9Sg==
X-CSE-MsgGUID: h/TgdAxsSDOVeYXa33vAkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="131931405"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.128.63])
 ([10.245.128.63])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 14:32:23 -0800
Message-ID: <2a16ca11-71fa-4daa-ab31-4ed3bbe2f04e@linux.intel.com>
Date: Fri, 6 Dec 2024 23:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Call invalidation_fence_fini for PT inval fences
 in error state
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20241206015022.1567113-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241206015022.1567113-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 12/6/2024 2:50 AM, Daniele Ceraolo Spurio wrote:
> Invalidation_fence_init takes a PM reference, which is released in its
> _fini counterpart, so we need to make sure that the latter is called,
> even if the fence is in an error state.
>
> Since we already have a function that calls _fini() and signals the
> fence in the tlb inval code, we can expose that and call it from the PT
> code.
>
> Fixes: f002702290fc ("drm/xe: Hold a PM ref when GT TLB invalidations are inflight")

Cc: <stable@vger.kernel.org> # v6.11+

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 8 ++++++++
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 1 +
>  drivers/gpu/drm/xe/xe_pt.c                  | 3 +--
>  3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 4e9f89392160..665927b80e9e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -65,6 +65,14 @@ invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fe
>  	__invalidation_fence_signal(xe, fence);
>  }
>  
> +void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence)
> +{
> +	if (WARN_ON_ONCE(!fence->gt))
> +		return;
> +
> +	__invalidation_fence_signal(gt_to_xe(fence->gt), fence);
> +}
> +
>  static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>  {
>  	struct xe_gt *gt = container_of(work, struct xe_gt,
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> index f430d5797af7..00b1c6c01e8d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
> @@ -28,6 +28,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
>  void xe_gt_tlb_invalidation_fence_init(struct xe_gt *gt,
>  				       struct xe_gt_tlb_invalidation_fence *fence,
>  				       bool stack);
> +void xe_gt_tlb_invalidation_fence_signal(struct xe_gt_tlb_invalidation_fence *fence);
>  
>  static inline void
>  xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 684dc075deac..65c3c1688710 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1334,8 +1334,7 @@ static void invalidation_fence_cb(struct dma_fence *fence,
>  		queue_work(system_wq, &ifence->work);
>  	} else {
>  		ifence->base.base.error = ifence->fence->error;
> -		dma_fence_signal(&ifence->base.base);
> -		dma_fence_put(&ifence->base.base);
> +		xe_gt_tlb_invalidation_fence_signal(&ifence->base);
>  	}
>  	dma_fence_put(ifence->fence);
>  }
