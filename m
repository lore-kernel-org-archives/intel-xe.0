Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE1BC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 16:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC0A10E68A;
	Wed, 14 May 2025 16:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CbWXvbFW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315B110E68A
 for <intel-xe@lists.freedesktop.org>; Wed, 14 May 2025 16:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747240608; x=1778776608;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Kk6MIMm+HkB197Prz2I62JECfog71U5+DK3O/1OrknQ=;
 b=CbWXvbFWpmKWSxMz48TKksKFO2HUBjfby7wUJfodbt3ryXfoymAUCnjm
 1qDd2fQvHjFEZ2WCbu7VA8jXfFB7LAHdc7ZqkU3ADIhjuDJpHQb20qFpW
 DQulgI5FBjG39kFcV4nYMLaeDRfnbmvVRaawqikMeiaSUXjVZNQPXKo87
 WTzA2EWY43+o6l2XfAqaaHcu2uPiWp1A1sKbVHDzjyfmtsb0cIWIvF8Fg
 7M89DfT/4tTQcQ8dfjMBFYQNVNP9n0B/8ZiDMqo3g01DlrdaSdVVtxD/0
 /KG+VpIa+FFxSNgz4upDruzv49Z9zfrkVUBdU1X7RXYbkMiMZOeLmRSZz g==;
X-CSE-ConnectionGUID: rFiBKyGvRnG0Oy/oc6BBSw==
X-CSE-MsgGUID: s3tQjgjeRE2S4zqI9rEcmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59785675"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="59785675"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 09:36:47 -0700
X-CSE-ConnectionGUID: lOC+dNswSdSBKOqLlteLDg==
X-CSE-MsgGUID: rfm5GOeJSbyOc0cCr4CZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; d="scan'208";a="169168316"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 14 May 2025 09:36:45 -0700
Received: from [10.246.5.201] (mwajdecz-MOBL.ger.corp.intel.com [10.246.5.201])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id DFE9B3433D;
 Wed, 14 May 2025 17:36:43 +0100 (IST)
Message-ID: <b9a5c2fa-c1f8-4fe4-8846-7cc5c152d3f0@intel.com>
Date: Wed, 14 May 2025 18:36:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] drm/xe/sa: Avoid caching GGTT address within the
 manager
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250513224952.701343-1-tomasz.lis@intel.com>
 <20250513224952.701343-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250513224952.701343-2-tomasz.lis@intel.com>
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



On 14.05.2025 00:49, Tomasz Lis wrote:
> Non-virtualized resources require fixups after SRIOV VF migration.
> Caching GGTT references rather than re-computing them from the
> underlying Buffer Object is something we want to avoid, as such
> code would require additional fixup step and additional locking
> around all the places where the address is accessed.
> 
> This change removes the cached 

GPU

> address

from the Sub-Allocation Manager

> and introduces a function
> which recomputes and returns the address instead.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c | 3 ++-
>  drivers/gpu/drm/xe/xe_guc_buf.c    | 2 +-
>  drivers/gpu/drm/xe/xe_sa.c         | 1 -
>  drivers/gpu/drm/xe/xe_sa.h         | 8 +++++++-
>  drivers/gpu/drm/xe/xe_sa_types.h   | 1 -
>  5 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 119a55bb7580..8aa84050c18b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -29,6 +29,7 @@
>  #include "xe_pm.h"
>  #include "xe_reg_sr.h"
>  #include "xe_reg_whitelist.h"
> +#include "xe_sa.h"
>  #include "xe_sriov.h"
>  #include "xe_tuning.h"
>  #include "xe_uc_debugfs.h"
> @@ -146,7 +147,7 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  
>  	xe_pm_runtime_get(gt_to_xe(gt));
>  	drm_suballoc_dump_debug_info(&tile->mem.kernel_bb_pool->base, p,
> -				     tile->mem.kernel_bb_pool->gpu_addr);
> +				     xe_sa_bo_manager_gpu_addr(tile->mem.kernel_bb_pool));
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_guc_buf.c b/drivers/gpu/drm/xe/xe_guc_buf.c
> index 0193c94dd6a0..c459c71a3510 100644
> --- a/drivers/gpu/drm/xe/xe_guc_buf.c
> +++ b/drivers/gpu/drm/xe/xe_guc_buf.c
> @@ -168,7 +168,7 @@ u64 xe_guc_cache_gpu_addr_from_ptr(struct xe_guc_buf_cache *cache, const void *p
>  	if (offset < 0 || offset + size > cache->sam->base.size)
>  		return 0;
>  
> -	return cache->sam->gpu_addr + offset;
> +	return xe_sa_bo_manager_gpu_addr(cache->sam) + offset;
>  }
>  
>  #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index 1d43e183ca21..fedd017d6dd3 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -69,7 +69,6 @@ struct xe_sa_manager *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size, u3
>  	}
>  	sa_manager->bo = bo;
>  	sa_manager->is_iomem = bo->vmap.is_iomem;
> -	sa_manager->gpu_addr = xe_bo_ggtt_addr(bo);
>  
>  	if (bo->vmap.is_iomem) {
>  		sa_manager->cpu_ptr = kvzalloc(managed_size, GFP_KERNEL);
> diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
> index 1170ee5a81a8..614d858b2183 100644
> --- a/drivers/gpu/drm/xe/xe_sa.h
> +++ b/drivers/gpu/drm/xe/xe_sa.h
> @@ -7,6 +7,7 @@
>  
>  #include <linux/sizes.h>
>  #include <linux/types.h>

while here, add separation line between <> and "" includes

> +#include "xe_bo.h"
>  #include "xe_sa_types.h"
>  
>  struct dma_fence;
> @@ -43,9 +44,14 @@ to_xe_sa_manager(struct drm_suballoc_manager *mng)
>  	return container_of(mng, struct xe_sa_manager, base);
>  }
>  

it wouldn't hurt to add kernel-doc for this new public function

> +static inline u64 xe_sa_bo_manager_gpu_addr(struct xe_sa_manager *sa_manager)

IMO this should be:

s/xe_sa_bo_manager_gpu_addr/xe_sa_manager_gpu_addr

since we have struct xe_sa_manager, not xe_sa_bo_manager

> +{
> +	return xe_bo_ggtt_addr(sa_manager->bo);
> +}
> +
>  static inline u64 xe_sa_bo_gpu_addr(struct drm_suballoc *sa)
>  {
> -	return to_xe_sa_manager(sa->manager)->gpu_addr +
> +	return xe_sa_bo_manager_gpu_addr(to_xe_sa_manager(sa->manager)) +
>  		drm_suballoc_soffset(sa);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_sa_types.h b/drivers/gpu/drm/xe/xe_sa_types.h
> index 2b070ff1292e..cb7238799dcb 100644
> --- a/drivers/gpu/drm/xe/xe_sa_types.h
> +++ b/drivers/gpu/drm/xe/xe_sa_types.h
> @@ -12,7 +12,6 @@ struct xe_bo;
>  struct xe_sa_manager {
>  	struct drm_suballoc_manager base;
>  	struct xe_bo *bo;
> -	u64 gpu_addr;
>  	void *cpu_ptr;
>  	bool is_iomem;
>  };

with nits fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

