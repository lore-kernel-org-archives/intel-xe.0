Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE53C48295
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 12:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7396910F974;
	Mon,  5 Feb 2024 12:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtYfp6yi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA8A10F974
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 12:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707136872; x=1738672872;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+t+Rk+vWJ/cepb2CzuZipBMt3WWke7QSaJWR0n3PPD0=;
 b=BtYfp6yi2y4eaTlgJvzsqHFiLwKADzOv+c5R/eNcettwUoVaOswVaDVc
 tXxsCs0kQO7gWL0omQgYwg5awHD9tN8ROWxb537MqSBDlj4TS+2zwucSy
 9WnyGSZ5w0JUdO7jzR52gikMSrRyibWUC6ZwAIy6mKiU8ifuN5VPQQl33
 wUuNKU0z9Z55XkU9iH68ctV6U3YkG4N/GC5aUauqJWmQiuMg9VO0V1Frb
 X2xTb4ux1teCLU797It8DbIeC20eepXOeZemS2Wca9X45hl0bukRTUlVS
 D+IfsNjmZ/eyrfnFhXLrZQVa03XQYmTnPfGwhgQpAmkmutBvp2bzvkHbk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="408189"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="408189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 04:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5323933"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 04:41:10 -0800
Message-ID: <a70dff38-cb46-4f65-9b4d-36c0f6e5a6b4@intel.com>
Date: Mon, 5 Feb 2024 12:41:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 23/34] drm/xe: Ensure D0 on TLB invalidation
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-24-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-24-rodrigo.vivi@intel.com>
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
> Let's grab the runtime references around TLB invalidation
> to ensure that hardware is awake in D0.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 5 +++--
>   drivers/gpu/drm/xe/xe_pt.c | 3 +++
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 686d716c5581..17d3b7f69580 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -22,6 +22,7 @@
>   #include "xe_gt.h"
>   #include "xe_map.h"
>   #include "xe_migrate.h"
> +#include "xe_pm.h"
>   #include "xe_preempt_fence.h"
>   #include "xe_res_cursor.h"
>   #include "xe_trace.h"
> @@ -1136,7 +1137,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   	int idx, r = 0;
>   
>   	if (needs_rpm)
> -		xe_device_mem_access_get(xe);
> +		xe_pm_runtime_get(xe);
>   
>   	ret = ttm_bo_vm_reserve(tbo, vmf);
>   	if (ret)
> @@ -1176,7 +1177,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>   	dma_resv_unlock(tbo->base.resv);
>   out:
>   	if (needs_rpm)
> -		xe_device_mem_access_put(xe);
> +		xe_pm_runtime_put(xe);


Change should be split somewhere else, or needs different commit message?

>   
>   	return ret;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de1030a47588..8d1d4bea7323 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -11,6 +11,7 @@
>   #include "xe_gt.h"
>   #include "xe_gt_tlb_invalidation.h"
>   #include "xe_migrate.h"
> +#include "xe_pm.h"
>   #include "xe_pt_types.h"
>   #include "xe_pt_walk.h"
>   #include "xe_res_cursor.h"
> @@ -1104,8 +1105,10 @@ static void invalidation_fence_work_func(struct work_struct *w)
>   	struct invalidation_fence *ifence =
>   		container_of(w, struct invalidation_fence, work);
>   
> +	xe_pm_runtime_get(gt_to_xe(ifence->gt));
>   	trace_xe_gt_tlb_invalidation_fence_work_func(&ifence->base);
>   	xe_gt_tlb_invalidation_vma(ifence->gt, &ifence->base, ifence->vma);
> +	xe_pm_runtime_put(gt_to_xe(ifence->gt));

Feels slightly scary to call this from a worker? When the caller setup 
the fence stuff, in the prep stage, that would have been a good spot to 
call if_active and attach it.

>   }
>   
>   static int invalidation_fence_init(struct xe_gt *gt,
