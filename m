Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093B1E77180
	for <intel-xe@archiver.kernel.org>; Mon, 16 Dec 2024 18:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8FA10E76E;
	Mon, 16 Dec 2024 18:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQfw8HCl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3997310E724
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Dec 2024 18:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734375375; x=1765911375;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=8Fa4R9eRwcov8huasAROPJY+aQd9MZ6yTgTY7Rl/AgQ=;
 b=LQfw8HCl/XgqzMBymutc0QAqC+0htU+PXBFLdYE+GxTHF7wtYZDWwdAo
 siozLGtoE1GU/FhBwIbF7ywslSfKDfWTRIL5jZ+vQSg3ZgaJ2f7QDFt5w
 n57mC4GZl5h2D11Fdz1P3YLDklJ1a6N/FfFdIMlOC2HbPB3jdULBPZEY+
 RjC13pSBAO0bDDiwBuRq7nR+6VnfSRqyQNBHl/yyoSnAZDucP0Dlb4ph3
 2/HqwPD1dyUwjD5zGLc8DWJc5gLj5sdgVI8ec6iAYRTWEmdZlFExPx/C+
 wujpl/+CTOKaFhuRBewaQIPS59fzfOu3Z51bnjkRbswwgXgoxwZEJnCkf A==;
X-CSE-ConnectionGUID: TydM5++SRyKAxgMByoxjOw==
X-CSE-MsgGUID: 5GNCZluGTFimlfcGdw8sCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52298893"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; d="scan'208";a="52298893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:56:15 -0800
X-CSE-ConnectionGUID: gshrBM7lRJWgQwl7SppJYw==
X-CSE-MsgGUID: 9CI18sEUQomEZKoEBTa8yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120549615"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 [10.245.244.246]) ([10.245.244.246])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 10:56:14 -0800
Message-ID: <0cbac0f1-fc54-403b-b5ef-d5f769b0a0f1@intel.com>
Date: Mon, 16 Dec 2024 18:56:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/xe: use backup object for pinned save/restore
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241216162941.86070-8-matthew.auld@intel.com>
Content-Language: en-GB
In-Reply-To: <20241216162941.86070-8-matthew.auld@intel.com>
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

On 16/12/2024 16:29, Matthew Auld wrote:
> Currently we move pinned objects, relying on the fact that the lpfn/fpfn
> will force the placement to occupy the same pages when restoring.
> However this then limits all such pinned objects to be contig
> underneath. In addition it is likely a little fragile moving pinned
> objects in the first place. Rather than moving such objects rather copy
> the page contents to a secondary system memory object, that way the VRAM
> pages never move and remain pinned. This also opens the door for
> eventually having non-contig pinned objects that can also be
> saved/restored using blitter.
> 
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1182
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c       | 285 ++++++++++++++-----------------
>   drivers/gpu/drm/xe/xe_bo_evict.c |   8 -
>   drivers/gpu/drm/xe/xe_bo_types.h |   2 +
>   3 files changed, 131 insertions(+), 164 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 283cd0294570..6f073d12359a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -780,79 +780,43 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		xe_pm_runtime_get_noresume(xe);
>   	}
>   
> -	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
> -		/*
> -		 * Kernel memory that is pinned should only be moved on suspend
> -		 * / resume, some of the pinned memory is required for the
> -		 * device to resume / use the GPU to move other evicted memory
> -		 * (user memory) around. This likely could be optimized a bit
> -		 * futher where we find the minimum set of pinned memory
> -		 * required for resume but for simplity doing a memcpy for all
> -		 * pinned memory.
> -		 */
> -		ret = xe_bo_vmap(bo);
> -		if (!ret) {
> -			ret = ttm_bo_move_memcpy(ttm_bo, ctx, new_mem);
> -
> -			/* Create a new VMAP once kernel BO back in VRAM */
> -			if (!ret && resource_is_vram(new_mem)) {
> -				struct xe_mem_region *vram = res_to_mem_region(new_mem);
> -				void __iomem *new_addr = vram->mapping +
> -					(new_mem->start << PAGE_SHIFT);
> -
> -				if (XE_WARN_ON(new_mem->start == XE_BO_INVALID_OFFSET)) {
> -					ret = -EINVAL;
> -					xe_pm_runtime_put(xe);
> -					goto out;
> -				}
> -
> -				xe_assert(xe, new_mem->start ==
> -					  bo->placements->fpfn);
> -
> -				iosys_map_set_vaddr_iomem(&bo->vmap, new_addr);
> -			}
> -		}
> -	} else {
> -		if (move_lacks_source) {
> -			u32 flags = 0;
> -
> -			if (mem_type_is_vram(new_mem->mem_type))
> -				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
> -			else if (handle_system_ccs)
> -				flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> -
> -			fence = xe_migrate_clear(migrate, bo, new_mem, flags);
> -		}
> -		else
> -			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
> -						new_mem, handle_system_ccs);
> -		if (IS_ERR(fence)) {
> -			ret = PTR_ERR(fence);
> -			xe_pm_runtime_put(xe);
> -			goto out;
> -		}
> -		if (!move_lacks_source) {
> -			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
> -							true, new_mem);
> -			if (ret) {
> -				dma_fence_wait(fence, false);
> -				ttm_bo_move_null(ttm_bo, new_mem);
> -				ret = 0;
> -			}
> -		} else {
> -			/*
> -			 * ttm_bo_move_accel_cleanup() may blow up if
> -			 * bo->resource == NULL, so just attach the
> -			 * fence and set the new resource.
> -			 */
> -			dma_resv_add_fence(ttm_bo->base.resv, fence,
> -					   DMA_RESV_USAGE_KERNEL);
> +	if (move_lacks_source) {
> +		u32 flags = 0;
> +
> +		if (mem_type_is_vram(new_mem->mem_type))
> +			flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
> +		else if (handle_system_ccs)
> +			flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
> +
> +		fence = xe_migrate_clear(migrate, bo, new_mem, flags);
> +	} else
> +		fence = xe_migrate_copy(migrate, bo, bo, old_mem, new_mem,
> +					handle_system_ccs);
> +	if (IS_ERR(fence)) {
> +		ret = PTR_ERR(fence);
> +		xe_pm_runtime_put(xe);
> +		goto out;
> +	}
> +	if (!move_lacks_source) {
> +		ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict, true,
> +						new_mem);
> +		if (ret) {
> +			dma_fence_wait(fence, false);
>   			ttm_bo_move_null(ttm_bo, new_mem);
> +			ret = 0;
>   		}
> -
> -		dma_fence_put(fence);
> +	} else {
> +		/*
> +		 * ttm_bo_move_accel_cleanup() may blow up if
> +		 * bo->resource == NULL, so just attach the
> +		 * fence and set the new resource.
> +		 */
> +		dma_resv_add_fence(ttm_bo->base.resv, fence,
> +				   DMA_RESV_USAGE_KERNEL);
> +		ttm_bo_move_null(ttm_bo, new_mem);
>   	}
>   
> +	dma_fence_put(fence);
>   	xe_pm_runtime_put(xe);
>   
>   out:
> @@ -876,59 +840,70 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>    */
>   int xe_bo_evict_pinned(struct xe_bo *bo)
>   {
> -	struct ttm_place place = {
> -		.mem_type = XE_PL_TT,
> -	};
> -	struct ttm_placement placement = {
> -		.placement = &place,
> -		.num_placement = 1,
> -	};
> -	struct ttm_operation_ctx ctx = {
> -		.interruptible = false,
> -		.gfp_retry_mayfail = true,
> -	};
> -	struct ttm_resource *new_mem;
> -	int ret;
> +	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> +	struct xe_bo *backup;
> +	bool unmap = false;
> +	int ret = 0;
>   
> -	xe_bo_assert_held(bo);
> +	xe_bo_lock(bo, false);
>   
> -	if (WARN_ON(!bo->ttm.resource))
> -		return -EINVAL;
> +	if (WARN_ON(!bo->ttm.resource)) {
> +		ret = -EINVAL;
> +		goto out_unlock_bo;
> +	}
>   
> -	if (WARN_ON(!xe_bo_is_pinned(bo)))
> -		return -EINVAL;
> +	if (WARN_ON(!xe_bo_is_pinned(bo))) {
> +		ret = -EINVAL;
> +		goto out_unlock_bo;
> +	}
>   
>   	if (!xe_bo_is_vram(bo))
> -		return 0;
> +		goto out_unlock_bo;
>   
> -	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
> -	if (ret)
> -		return ret;
> -
> -	if (!bo->ttm.ttm) {
> -		bo->ttm.ttm = xe_ttm_tt_create(&bo->ttm, 0);
> -		if (!bo->ttm.ttm) {
> -			ret = -ENOMEM;
> -			goto err_res_free;
> -		}
> +	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size, ttm_bo_type_kernel,
> +			      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS | XE_BO_FLAG_PINNED);
> +	if (IS_ERR(backup)) {
> +		ret = PTR_ERR(backup);
> +		goto out_unlock_bo;
>   	}
>   
> -	ret = ttm_bo_populate(&bo->ttm, &ctx);
> -	if (ret)
> -		goto err_res_free;
> +	if (!xe_bo_is_user(bo)) {
> +		ret = xe_bo_vmap(backup);
> +		if (ret)
> +			goto out_backup;
>   
> -	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> -	if (ret)
> -		goto err_res_free;
> +		if (iosys_map_is_null(&bo->vmap)) {
> +			ret = xe_bo_vmap(bo);
> +			if (ret)
> +				goto out_backup;
> +			unmap = true;
> +		}
>   
> -	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
> -	if (ret)
> -		goto err_res_free;
> +		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo->vmap, 0,
> +				   bo->size);
> +	} else {
> +		struct dma_fence *fence;
>   
> -	return 0;
> +		fence = xe_migrate_copy(bo->tile->migrate, bo, backup,

Missed that bo->tile can be NULL here, for the external pin case. Need 
to fix this.

> +					bo->ttm.resource, backup->ttm.resource,
> +					false);
> +		if (IS_ERR(fence)) {
> +			ret = PTR_ERR(fence);
> +			goto out_backup;
> +		}
> +	}
>   
> -err_res_free:
> -	ttm_resource_free(&bo->ttm, &new_mem);
> +	bo->backup_obj = backup;
> +
> +out_backup:
> +	xe_bo_vunmap(backup);
> +	xe_bo_unlock(backup);
> +	if (ret)
> +		xe_bo_put(backup);
> +out_unlock_bo:
> +	if (unmap)
> +		xe_bo_vunmap(bo);
> +	xe_bo_unlock(bo);
>   	return ret;
>   }
>   
> @@ -949,47 +924,61 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>   		.interruptible = false,
>   		.gfp_retry_mayfail = false,
>   	};
> -	struct ttm_resource *new_mem;
> -	struct ttm_place *place = &bo->placements[0];
> +	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
> +	struct xe_bo *backup = bo->backup_obj;
> +	bool unmap = false;
>   	int ret;
>   
> -	xe_bo_assert_held(bo);
> -
> -	if (WARN_ON(!bo->ttm.resource))
> -		return -EINVAL;
> -
> -	if (WARN_ON(!xe_bo_is_pinned(bo)))
> -		return -EINVAL;
> +	if (!backup)
> +		return 0;
>   
> -	if (WARN_ON(xe_bo_is_vram(bo)))
> -		return -EINVAL;
> +	xe_bo_lock(backup, false);
>   
> -	if (WARN_ON(!bo->ttm.ttm && !xe_bo_is_stolen(bo)))
> -		return -EINVAL;
> +	ret = ttm_bo_validate(&backup->ttm, &backup->placement, &ctx);
> +	if (ret)
> +		goto out_backup;
>   
> -	if (!mem_type_is_vram(place->mem_type))
> -		return 0;
> +	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
> +		ret = -EBUSY;
> +		goto out_backup;
> +	}
>   
> -	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
> -	if (ret)
> -		return ret;
> +	if (!xe_bo_is_user(bo)) {
> +		ret = xe_bo_vmap(backup);
> +		if (ret)
> +			goto out_unlock_bo;
>   
> -	ret = ttm_bo_populate(&bo->ttm, &ctx);
> -	if (ret)
> -		goto err_res_free;
> +		if (iosys_map_is_null(&bo->vmap)) {
> +			ret = xe_bo_vmap(bo);
> +			if (ret)
> +				goto out_unlock_bo;
> +			unmap = true;
> +		}
>   
> -	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> -	if (ret)
> -		goto err_res_free;
> +		xe_map_memcpy_to(xe, &bo->vmap, 0, backup->vmap.vaddr,
> +				 bo->size);
> +	} else {
> +		struct dma_fence *fence;
>   
> -	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
> -	if (ret)
> -		goto err_res_free;
> +		fence = xe_migrate_copy(bo->tile->migrate, backup, bo,
> +					backup->ttm.resource, bo->ttm.resource,
> +					false);
> +		if (IS_ERR(fence)) {
> +			ret = PTR_ERR(fence);
> +			goto out_unlock_bo;
> +		}
> +	}
>   
> -	return 0;
> +	bo->backup_obj = NULL;
>   
> -err_res_free:
> -	ttm_resource_free(&bo->ttm, &new_mem);
> +out_unlock_bo:
> +	xe_bo_unlock(bo);
> +out_backup:
> +	if (unmap)
> +		xe_bo_vunmap(backup);
> +	xe_bo_unlock(backup);
> +	if (!bo->backup_obj)
> +		xe_bo_put(backup);
>   	return ret;
>   }
>   
> @@ -1913,22 +1902,6 @@ int xe_bo_pin(struct xe_bo *bo)
>   	if (err)
>   		return err;
>   
> -	/*
> -	 * For pinned objects in on DGFX, which are also in vram, we expect
> -	 * these to be in contiguous VRAM memory. Required eviction / restore
> -	 * during suspend / resume (force restore to same physical address).
> -	 */
> -	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
> -	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
> -		if (mem_type_is_vram(place->mem_type)) {
> -			xe_assert(xe, place->flags & TTM_PL_FLAG_CONTIGUOUS);
> -
> -			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
> -				       vram_region_gpu_offset(bo->ttm.resource)) >> PAGE_SHIFT;
> -			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
> -		}
> -	}
> -
>   	if (mem_type_is_vram(place->mem_type) || bo->flags & XE_BO_FLAG_GGTT) {
>   		spin_lock(&xe->pinned.lock);
>   		list_add_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 6a40eedd9db1..96764d8169f4 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -69,9 +69,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>   		list_move_tail(&bo->pinned_link, &still_in_list);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, false);
>   		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo);
>   		xe_bo_put(bo);
>   		if (ret) {
>   			spin_lock(&xe->pinned.lock);
> @@ -103,9 +101,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>   		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, false);
>   		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo);
>   		xe_bo_put(bo);
>   		if (ret)
>   			return ret;
> @@ -143,9 +139,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>   		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, false);
>   		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo);
>   		if (ret) {
>   			xe_bo_put(bo);
>   			return ret;
> @@ -213,9 +207,7 @@ int xe_bo_restore_user(struct xe_device *xe)
>   		xe_bo_get(bo);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, false);
>   		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo);
>   		xe_bo_put(bo);
>   		if (ret) {
>   			spin_lock(&xe->pinned.lock);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 46dc9e4e3e46..a1f1f637aa87 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -27,6 +27,8 @@ struct xe_vm;
>   struct xe_bo {
>   	/** @ttm: TTM base buffer object */
>   	struct ttm_buffer_object ttm;
> +	/** @backup_obj: The backup object when pinned and suspended (vram only) */
> +	struct xe_bo *backup_obj;
>   	/** @size: Size of this buffer object */
>   	size_t size;
>   	/** @flags: flags for this buffer object */

