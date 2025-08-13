Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B49AC87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 12:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F9310E4EB;
	Wed, 13 Aug 2025 12:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvX+GGes";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F3F10E4EB
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755087204; x=1786623204;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y/vgSFfq5a2LeQz7En0KpHugpCyWi97aIXcTq80sqRw=;
 b=RvX+GGesKxdJx0piPWAmGY/31/W5VCcndaUg7VVMmPcNGDezJgaYJjOm
 DPLK62T19SnFWhSHSLeCV0RWKn3LAaMWGTf9U5+hDI9CfI1tX+hVutyzH
 /w68FwqYMu9g0P9GuJdj3LVhRFp4JYwVF2P2TBMuhUj4FMBwQ1Dl+MslK
 gKwTn2X5QKfT6RV1drqcHyk6adiMFmVE2e6BuRzdkWcf3adh9wMpPw2Ks
 iJGnC/j6RjevG8Zo12cPDf1BU4UBK7KDmv732WFQiquCdt1DwlweiopgI
 SoB0VBmu54eSqKIUV4/80xgpp6ywouTP+JoK6qMWpjoz1GDJdCB6NCPiJ g==;
X-CSE-ConnectionGUID: zHAMz23STfWeAYxRPSIGRw==
X-CSE-MsgGUID: kENmvqlxQbCC5G04RacPBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57336985"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57336985"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:13:23 -0700
X-CSE-ConnectionGUID: eiL3E3MoTcGzCf9rWjE9yg==
X-CSE-MsgGUID: eBpS1ovkTuGnCjNLbAgtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166824976"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.238])
 ([10.245.245.238])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 05:13:22 -0700
Message-ID: <bce1c846-bdf9-4bf8-ba92-1baa896e2f70@intel.com>
Date: Wed, 13 Aug 2025 13:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] drm/xe: Convert pinned suspend eviction for
 exhaustive eviction
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-16-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250813105121.5945-16-thomas.hellstrom@linux.intel.com>
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

Hi,

On 13/08/2025 11:51, Thomas Hellström wrote:
> Pinned suspend eviction and preparation for eviction validates
> system memory for eviction buffers. Do that under a
> validation exclusive lock to avoid interfering with other
> processes validating system graphics memory.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 205 +++++++++++++++++++------------------
>   1 file changed, 108 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 82bf158426ad..efb9c88b6aa7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1139,43 +1139,47 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>   int xe_bo_notifier_prepare_pinned(struct xe_bo *bo)
>   {
>   	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>   	struct xe_bo *backup;
>   	int ret = 0;
>   
> -	xe_bo_lock(bo, false);
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, true) {

Ah, this reminded me of 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4288

Could this help with that? If you could maybe keep the exlusive mode 
turned on for the entire prepare/unprepare stage, to ensure other 
execs/validates back off until we are done?

> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_assert(xe, !ret);
> +		xe_assert(xe, !bo->backup_obj);
>   
> -	xe_assert(xe, !bo->backup_obj);
> +		/*
> +		 * Since this is called from the PM notifier we might have raced with
> +		 * someone unpinning this after we dropped the pinned list lock and
> +		 * grabbing the above bo lock.
> +		 */
> +		if (!xe_bo_is_pinned(bo))
> +			break;
>   
> -	/*
> -	 * Since this is called from the PM notifier we might have raced with
> -	 * someone unpinning this after we dropped the pinned list lock and
> -	 * grabbing the above bo lock.
> -	 */
> -	if (!xe_bo_is_pinned(bo))
> -		goto out_unlock_bo;
> +		if (!xe_bo_is_vram(bo))
> +			break;
>   
> -	if (!xe_bo_is_vram(bo))
> -		goto out_unlock_bo;
> +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +			break;
>   
> -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> -		goto out_unlock_bo;
> +		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> +					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +					   XE_BO_FLAG_PINNED, &exec);
> +		if (IS_ERR(backup)) {
> +			drm_exec_retry_on_contention(&exec);
> +			ret = PTR_ERR(backup);
> +			xe_validation_retry_on_oom(&ctx, &ret);
> +			break;
> +		}
>   
> -	backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> -				   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -				   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -				   XE_BO_FLAG_PINNED, exec);
> -	if (IS_ERR(backup)) {
> -		ret = PTR_ERR(backup);
> -		goto out_unlock_bo;
> +		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> +		ttm_bo_pin(&backup->ttm);
> +		bo->backup_obj = backup;
>   	}
>   
> -	backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> -	ttm_bo_pin(&backup->ttm);
> -	bo->backup_obj = backup;
> -
> -out_unlock_bo:
> -	xe_bo_unlock(bo);
>   	return ret;
>   }
>   
> @@ -1215,99 +1219,106 @@ int xe_bo_notifier_unprepare_pinned(struct xe_bo *bo)
>   int xe_bo_evict_pinned(struct xe_bo *bo)
>   {
>   	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> -	struct drm_exec *exec = XE_VALIDATION_UNIMPLEMENTED;
> +	struct xe_validation_ctx ctx;
> +	struct drm_exec exec;
>   	struct xe_bo *backup = bo->backup_obj;
>   	bool backup_created = false;
>   	bool unmap = false;
>   	int ret = 0;
>   
> -	xe_bo_lock(bo, false);
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, ret, true) {
> +		ret = drm_exec_lock_obj(&exec, &bo->ttm.base);
> +		drm_exec_retry_on_contention(&exec);
> +		xe_assert(xe, !ret);
>   
> -	if (WARN_ON(!bo->ttm.resource)) {
> -		ret = -EINVAL;
> -		goto out_unlock_bo;
> -	}
> +		if (WARN_ON(!bo->ttm.resource)) {
> +			ret = -EINVAL;
> +			break;
> +		}
>   
> -	if (WARN_ON(!xe_bo_is_pinned(bo))) {
> -		ret = -EINVAL;
> -		goto out_unlock_bo;
> -	}
> +		if (WARN_ON(!xe_bo_is_pinned(bo))) {
> +			ret = -EINVAL;
> +			break;
> +		}
>   
> -	if (!xe_bo_is_vram(bo))
> -		goto out_unlock_bo;
> +		if (!xe_bo_is_vram(bo))
> +			break;
>   
> -	if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> -		goto out_unlock_bo;
> +		if (bo->flags & XE_BO_FLAG_PINNED_NORESTORE)
> +			break;
>   
> -	if (!backup) {
> -		backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL, xe_bo_size(bo),
> -					   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> -					   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> -					   XE_BO_FLAG_PINNED, exec);
> -		if (IS_ERR(backup)) {
> -			ret = PTR_ERR(backup);
> -			goto out_unlock_bo;
> +		if (!backup) {
> +			backup = xe_bo_init_locked(xe, NULL, NULL, bo->ttm.base.resv, NULL,
> +						   xe_bo_size(bo),
> +						   DRM_XE_GEM_CPU_CACHING_WB, ttm_bo_type_kernel,
> +						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
> +						   XE_BO_FLAG_PINNED, &exec);
> +			if (IS_ERR(backup)) {
> +				drm_exec_retry_on_contention(&exec);
> +				ret = PTR_ERR(backup);
> +				xe_validation_retry_on_oom(&ctx, &ret);
> +				break;
> +			}
> +			backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> +			backup_created = true;
>   		}
> -		backup->parent_obj = xe_bo_get(bo); /* Released by bo_destroy */
> -		backup_created = true;
> -	}
>   
> -	if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> -		struct xe_migrate *migrate;
> -		struct dma_fence *fence;
> -
> -		if (bo->tile)
> -			migrate = bo->tile->migrate;
> -		else
> -			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
> +		if (xe_bo_is_user(bo) || (bo->flags & XE_BO_FLAG_PINNED_LATE_RESTORE)) {
> +			struct xe_migrate *migrate;
> +			struct dma_fence *fence;
>   
> -		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> -		if (ret)
> -			goto out_backup;
> +			if (bo->tile)
> +				migrate = bo->tile->migrate;
> +			else
> +				migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
>   
> -		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
> -		if (ret)
> -			goto out_backup;
> +			ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> +			if (ret)
> +				goto out_backup;
>   
> -		fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
> -					backup->ttm.resource, false);
> -		if (IS_ERR(fence)) {
> -			ret = PTR_ERR(fence);
> -			goto out_backup;
> -		}
> +			ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
> +			if (ret)
> +				goto out_backup;
>   
> -		dma_resv_add_fence(bo->ttm.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_resv_add_fence(backup->ttm.base.resv, fence,
> -				   DMA_RESV_USAGE_KERNEL);
> -		dma_fence_put(fence);
> -	} else {
> -		ret = xe_bo_vmap(backup);
> -		if (ret)
> -			goto out_backup;
> +			fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
> +						backup->ttm.resource, false);
> +			if (IS_ERR(fence)) {
> +				ret = PTR_ERR(fence);
> +				goto out_backup;
> +			}
>   
> -		if (iosys_map_is_null(&bo->vmap)) {
> -			ret = xe_bo_vmap(bo);
> +			dma_resv_add_fence(bo->ttm.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_resv_add_fence(backup->ttm.base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			dma_fence_put(fence);
> +		} else {
> +			ret = xe_bo_vmap(backup);
>   			if (ret)
>   				goto out_backup;
> -			unmap = true;
> -		}
>   
> -		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
> -				   xe_bo_size(bo));
> -	}
> +			if (iosys_map_is_null(&bo->vmap)) {
> +				ret = xe_bo_vmap(bo);
> +				if (ret)
> +					goto out_vunmap;
> +				unmap = true;
> +			}
>   
> -	if (!bo->backup_obj)
> -		bo->backup_obj = backup;
> +			xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
> +					   xe_bo_size(bo));
> +		}
>   
> +		if (!bo->backup_obj)
> +			bo->backup_obj = backup;
> +out_vunmap:
> +		xe_bo_vunmap(backup);
>   out_backup:
> -	xe_bo_vunmap(backup);
> -	if (ret && backup_created)
> -		xe_bo_put(backup);
> -out_unlock_bo:
> -	if (unmap)
> -		xe_bo_vunmap(bo);
> -	xe_bo_unlock(bo);
> +		if (ret && backup_created)
> +			xe_bo_put(backup);
> +		if (unmap)
> +			xe_bo_vunmap(bo);
> +	}
> +
>   	return ret;
>   }
>   

