Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E68C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 15:02:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC60510E83D;
	Thu, 23 Jan 2025 15:02:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlfzLyBq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E50F10E83D
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644564; x=1769180564;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JSa8IZanCFdpSB4VLX962V77071gUzd35x1P2zuPQTo=;
 b=PlfzLyBqJOo0akPFrKN0pahIngd3SC9p+LnGuKnUAUciorMXC1lAmkkW
 F9ALMCkYb1mKcsetXamdT5/evX9QQaQOMKoDjjMNxscKyijlUKgyQJ7/r
 7mX6Ki21HL9eHI57dQSN/GF9QeYLfnP3sP63Ojpfr88sEn7h49Gjm6Q/9
 ExOFpVDPWQ7Qhlj9fI+mPoBge9aLyknKCP2W1c1FCodAAISwUItXKvTtI
 PWNlqje42SCiduRiRmbrq10DoRQVgNvABRFJHMO91h0tdxo/u1nOidXIg
 Lkw+jL793R9FE6GDm8kdxCONHgdUprSBdclPuKSZAEp1WdcuK/6iAs3ym g==;
X-CSE-ConnectionGUID: GAIxalRiS6md7xpbaFykNQ==
X-CSE-MsgGUID: OVV3faRTRh6dA9KSDVbYqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37840562"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="37840562"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:02:44 -0800
X-CSE-ConnectionGUID: zhVUO0u8Sympm7QGx23EMQ==
X-CSE-MsgGUID: T63pRoITRCqtju/QA5XmrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="112481371"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.14])
 ([10.245.245.14])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:02:31 -0800
Message-ID: <a8c7fb80-1d0d-4715-b74d-1f558cb18d3b@intel.com>
Date: Thu, 23 Jan 2025 15:02:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/xe: use backup object for pinned save/restore
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
References: <20241218121837.226393-9-matthew.auld@intel.com>
 <20241218121837.226393-10-matthew.auld@intel.com>
 <LV3PR11MB86952D6AFA03C881D28B03F5F9E02@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <LV3PR11MB86952D6AFA03C881D28B03F5F9E02@LV3PR11MB8695.namprd11.prod.outlook.com>
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

On 23/01/2025 07:39, K V P, Satyanarayana wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Matthew Auld
>> Sent: Wednesday, December 18, 2024 5:49 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: [PATCH v2 1/7] drm/xe: use backup object for pinned save/restore
>>
>> Currently we move pinned objects, relying on the fact that the lpfn/fpfn
>> will force the placement to occupy the same pages when restoring.
>> However this then limits all such pinned objects to be contig
>> underneath. In addition it is likely a little fragile moving pinned
>> objects in the first place. Rather than moving such objects rather copy
>> the page contents to a secondary system memory object, that way the VRAM
>> pages never move and remain pinned. This also opens the door for
>> eventually having non-contig pinned objects that can also be
>> saved/restored using blitter.
>>
>> v2:
>>   - Make sure to drop the fence ref.
>>   - Handle NULL bo->migrate.
>>
>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1182
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c       | 293 +++++++++++++++----------------
>>   drivers/gpu/drm/xe/xe_bo_evict.c |   8 -
>>   drivers/gpu/drm/xe/xe_bo_types.h |   2 +
>>   3 files changed, 144 insertions(+), 159 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index e6c896ad5602..fa2d74a56283 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -780,79 +780,44 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>   		xe_pm_runtime_get_noresume(xe);
>>   	}
>>
>> -	if (xe_bo_is_pinned(bo) && !xe_bo_is_user(bo)) {
>> -		/*
>> -		 * Kernel memory that is pinned should only be moved on
>> suspend
>> -		 * / resume, some of the pinned memory is required for the
>> -		 * device to resume / use the GPU to move other evicted
>> memory
>> -		 * (user memory) around. This likely could be optimized a bit
>> -		 * futher where we find the minimum set of pinned memory
>> -		 * required for resume but for simplity doing a memcpy for all
>> -		 * pinned memory.
>> -		 */
>> -		ret = xe_bo_vmap(bo);
>> -		if (!ret) {
>> -			ret = ttm_bo_move_memcpy(ttm_bo, ctx,
>> new_mem);
>> -
>> -			/* Create a new VMAP once kernel BO back in VRAM
>> */
>> -			if (!ret && resource_is_vram(new_mem)) {
>> -				struct xe_mem_region *vram =
>> res_to_mem_region(new_mem);
>> -				void __iomem *new_addr = vram->mapping +
>> -					(new_mem->start << PAGE_SHIFT);
>> -
>> -				if (XE_WARN_ON(new_mem->start ==
>> XE_BO_INVALID_OFFSET)) {
>> -					ret = -EINVAL;
>> -					xe_pm_runtime_put(xe);
>> -					goto out;
>> -				}
>> -
>> -				xe_assert(xe, new_mem->start ==
>> -					  bo->placements->fpfn);
>> -
>> -				iosys_map_set_vaddr_iomem(&bo->vmap,
>> new_addr);
>> -			}
>> -		}
>> -	} else {
>> -		if (move_lacks_source) {
>> -			u32 flags = 0;
>> +	if (move_lacks_source) {
>> +		u32 flags = 0;
>>
>> -			if (mem_type_is_vram(new_mem->mem_type))
>> -				flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
>> -			else if (handle_system_ccs)
>> -				flags |=
>> XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
>> +		if (mem_type_is_vram(new_mem->mem_type))
>> +			flags |= XE_MIGRATE_CLEAR_FLAG_FULL;
>> +		else if (handle_system_ccs)
>> +			flags |= XE_MIGRATE_CLEAR_FLAG_CCS_DATA;
>>
>> -			fence = xe_migrate_clear(migrate, bo, new_mem,
>> flags);
>> -		}
>> -		else
>> -			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>> -						new_mem,
>> handle_system_ccs);
>> -		if (IS_ERR(fence)) {
>> -			ret = PTR_ERR(fence);
>> -			xe_pm_runtime_put(xe);
>> -			goto out;
>> -		}
>> -		if (!move_lacks_source) {
>> -			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence,
>> evict,
>> -							true, new_mem);
>> -			if (ret) {
>> -				dma_fence_wait(fence, false);
>> -				ttm_bo_move_null(ttm_bo, new_mem);
>> -				ret = 0;
>> -			}
>> -		} else {
>> -			/*
>> -			 * ttm_bo_move_accel_cleanup() may blow up if
>> -			 * bo->resource == NULL, so just attach the
>> -			 * fence and set the new resource.
>> -			 */
>> -			dma_resv_add_fence(ttm_bo->base.resv, fence,
>> -					   DMA_RESV_USAGE_KERNEL);
>> +		fence = xe_migrate_clear(migrate, bo, new_mem, flags);
>> +	} else {
>> +		fence = xe_migrate_copy(migrate, bo, bo, old_mem,
>> new_mem,
>> +					handle_system_ccs);
>> +	}
>> +	if (IS_ERR(fence)) {
>> +		ret = PTR_ERR(fence);
>> +		xe_pm_runtime_put(xe);
>> +		goto out;
>> +	}
>> +	if (!move_lacks_source) {
>> +		ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict, true,
>> +						new_mem);
>> +		if (ret) {
>> +			dma_fence_wait(fence, false);
>>   			ttm_bo_move_null(ttm_bo, new_mem);
>> +			ret = 0;
>>   		}
>> -
>> -		dma_fence_put(fence);
>> +	} else {
>> +		/*
>> +		 * ttm_bo_move_accel_cleanup() may blow up if
>> +		 * bo->resource == NULL, so just attach the
>> +		 * fence and set the new resource.
>> +		 */
>> +		dma_resv_add_fence(ttm_bo->base.resv, fence,
>> +				   DMA_RESV_USAGE_KERNEL);
>> +		ttm_bo_move_null(ttm_bo, new_mem);
>>   	}
>>
>> +	dma_fence_put(fence);
>>   	xe_pm_runtime_put(xe);
>>
>>   out:
>> @@ -884,59 +849,79 @@ static int xe_bo_move(struct ttm_buffer_object
>> *ttm_bo, bool evict,
>>    */
>>   int xe_bo_evict_pinned(struct xe_bo *bo)
>>   {
>> -	struct ttm_place place = {
>> -		.mem_type = XE_PL_TT,
>> -	};
>> -	struct ttm_placement placement = {
>> -		.placement = &place,
>> -		.num_placement = 1,
>> -	};
>> -	struct ttm_operation_ctx ctx = {
>> -		.interruptible = false,
>> -		.gfp_retry_mayfail = true,
>> -	};
>> -	struct ttm_resource *new_mem;
>> -	int ret;
>> +	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
>> +	struct xe_bo *backup;
>> +	bool unmap = false;
>> +	int ret = 0;
>>
>> -	xe_bo_assert_held(bo);
>> +	xe_bo_lock(bo, false);
>>
>> -	if (WARN_ON(!bo->ttm.resource))
>> -		return -EINVAL;
>> +	if (WARN_ON(!bo->ttm.resource)) {
>> +		ret = -EINVAL;
>> +		goto out_unlock_bo;
>> +	}
>>
>> -	if (WARN_ON(!xe_bo_is_pinned(bo)))
>> -		return -EINVAL;
>> +	if (WARN_ON(!xe_bo_is_pinned(bo))) {
>> +		ret = -EINVAL;
>> +		goto out_unlock_bo;
>> +	}
>>
>>   	if (!xe_bo_is_vram(bo))
>> -		return 0;
>> +		goto out_unlock_bo;
>> +
>> +	backup = xe_bo_create_locked(xe, NULL, NULL, bo->size,
>> ttm_bo_type_kernel,
>> +				     XE_BO_FLAG_SYSTEM |
>> XE_BO_FLAG_NEEDS_CPU_ACCESS |
>> +				     XE_BO_FLAG_PINNED);
>> +	if (IS_ERR(backup)) {
>> +		ret = PTR_ERR(backup);
>> +		goto out_unlock_bo;
>> +	}
>>
>> -	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem,
>> &ctx);
>> -	if (ret)
>> -		return ret;
>> +	if (!xe_bo_is_user(bo)) {
>> +		ret = xe_bo_vmap(backup);
>> +		if (ret)
>> +			goto out_backup;
>>
>> -	if (!bo->ttm.ttm) {
>> -		bo->ttm.ttm = xe_ttm_tt_create(&bo->ttm, 0);
>> -		if (!bo->ttm.ttm) {
>> -			ret = -ENOMEM;
>> -			goto err_res_free;
>> +		if (iosys_map_is_null(&bo->vmap)) {
>> +			ret = xe_bo_vmap(bo);
>> +			if (ret)
>> +				goto out_backup;
>> +			unmap = true;
>>   		}
>> -	}
>>
>> -	ret = ttm_bo_populate(&bo->ttm, &ctx);
>> -	if (ret)
>> -		goto err_res_free;
>> +		xe_map_memcpy_from(xe, backup->vmap.vaddr, &bo-
>>> vmap, 0,
>> +				   bo->size);
>> +	} else {
>> +		struct xe_migrate *migrate;
>> +		struct dma_fence *fence;
>>
>> -	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
>> -	if (ret)
>> -		goto err_res_free;
>> +		if (bo->tile)
>> +			migrate = bo->tile->migrate;
>> +		else
>> +			migrate = mem_type_to_migrate(xe, bo-
>>> ttm.resource->mem_type);
>>
>> -	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
>> -	if (ret)
>> -		goto err_res_free;
>> +		fence = xe_migrate_copy(migrate, bo, backup,
>> +					bo->ttm.resource, backup-
>>> ttm.resource,
>> +					false);
>> +		if (IS_ERR(fence)) {
>> +			ret = PTR_ERR(fence);
>> +			goto out_backup;
>> +		}
>>
>> -	return 0;
>> +		dma_fence_put(fence);
>> +	}
>>
>> -err_res_free:
>> -	ttm_resource_free(&bo->ttm, &new_mem);
>> +	bo->backup_obj = backup;
>> +
>> +out_backup:
>> +	xe_bo_vunmap(backup);
>> +	xe_bo_unlock(backup);
>> +	if (ret)
>> +		xe_bo_put(backup);
>> +out_unlock_bo:
>> +	if (unmap)
>> +		xe_bo_vunmap(bo);
>> +	xe_bo_unlock(bo);
>>   	return ret;
>>   }
>>
>> @@ -957,47 +942,69 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>>   		.interruptible = false,
>>   		.gfp_retry_mayfail = false,
>>   	};
>> -	struct ttm_resource *new_mem;
>> -	struct ttm_place *place = &bo->placements[0];
>> +	struct xe_device *xe = ttm_to_xe_device(bo->ttm.bdev);
>> +	struct xe_bo *backup = bo->backup_obj;
>> +	bool unmap = false;
>>   	int ret;
>>
>> -	xe_bo_assert_held(bo);
>> +	if (!backup)
>> +		return 0;
>>
>> -	if (WARN_ON(!bo->ttm.resource))
>> -		return -EINVAL;
>> +	xe_bo_lock(backup, false);
>>
>> -	if (WARN_ON(!xe_bo_is_pinned(bo)))
>> -		return -EINVAL;
>> +	ret = ttm_bo_validate(&backup->ttm, &backup->placement, &ctx);
>> +	if (ret)
>> +		goto out_backup;
>>
>> -	if (WARN_ON(xe_bo_is_vram(bo)))
>> -		return -EINVAL;
>> +	if (WARN_ON(!dma_resv_trylock(bo->ttm.base.resv))) {
>> +		ret = -EBUSY;
>> +		goto out_backup;
>> +	}
>>
>> -	if (WARN_ON(!bo->ttm.ttm && !xe_bo_is_stolen(bo)))
>> -		return -EINVAL;
>> +	if (!xe_bo_is_user(bo)) {
>> +		ret = xe_bo_vmap(backup);
>> +		if (ret)
>> +			goto out_unlock_bo;
>>
>> -	if (!mem_type_is_vram(place->mem_type))
>> -		return 0;
>> +		if (iosys_map_is_null(&bo->vmap)) {
>> +			ret = xe_bo_vmap(bo);
>> +			if (ret)
>> +				goto out_unlock_bo;
>> +			unmap = true;
>> +		}
>>
>> -	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem,
>> &ctx);
>> -	if (ret)
>> -		return ret;
>> +		xe_map_memcpy_to(xe, &bo->vmap, 0, backup-
>>> vmap.vaddr,
>> +				 bo->size);
>> +	} else {
>> +		struct xe_migrate *migrate;
>> +		struct dma_fence *fence;
>>
>> -	ret = ttm_bo_populate(&bo->ttm, &ctx);
>> -	if (ret)
>> -		goto err_res_free;
>> +		if (bo->tile)
>> +			migrate = bo->tile->migrate;
>> +		else
>> +			migrate = mem_type_to_migrate(xe, bo-
>>> ttm.resource->mem_type);
>>
>> -	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
>> -	if (ret)
>> -		goto err_res_free;
>> +		fence = xe_migrate_copy(migrate, backup, bo,
>> +					backup->ttm.resource, bo-
>>> ttm.resource,
>> +					false);
>> +		if (IS_ERR(fence)) {
>> +			ret = PTR_ERR(fence);
>> +			goto out_unlock_bo;
>> +		}
>>
>> -	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
>> -	if (ret)
>> -		goto err_res_free;
>> +		dma_fence_put(fence);
>> +	}
>>
>> -	return 0;
>> +	bo->backup_obj = NULL;
>>
>> -err_res_free:
>> -	ttm_resource_free(&bo->ttm, &new_mem);
>> +out_unlock_bo:
>> +	xe_bo_unlock(bo);
>> +out_backup:
>> +	if (unmap)
>> +		xe_bo_vunmap(backup);
>> +	xe_bo_unlock(backup);
>> +	if (!bo->backup_obj)
>> +		xe_bo_put(backup);
>>   	return ret;
>>   }
>>
>> @@ -1921,22 +1928,6 @@ int xe_bo_pin(struct xe_bo *bo)
>>   	if (err)
>>   		return err;
>>
>> -	/*
>> -	 * For pinned objects in on DGFX, which are also in vram, we expect
>> -	 * these to be in contiguous VRAM memory. Required eviction /
>> restore
>> -	 * during suspend / resume (force restore to same physical address).
>> -	 */
>> -	if (IS_DGFX(xe) && !(IS_ENABLED(CONFIG_DRM_XE_DEBUG) &&
>> -	    bo->flags & XE_BO_FLAG_INTERNAL_TEST)) {
>> -		if (mem_type_is_vram(place->mem_type)) {
>> -			xe_assert(xe, place->flags &
>> TTM_PL_FLAG_CONTIGUOUS);
>> -
>> -			place->fpfn = (xe_bo_addr(bo, 0, PAGE_SIZE) -
>> -				       vram_region_gpu_offset(bo-
>>> ttm.resource)) >> PAGE_SHIFT;
>> -			place->lpfn = place->fpfn + (bo->size >> PAGE_SHIFT);
>> -		}
>> -	}
>> -
>>   	if (mem_type_is_vram(place->mem_type) || bo->flags &
>> XE_BO_FLAG_GGTT) {
>>   		spin_lock(&xe->pinned.lock);
>>   		list_add_tail(&bo->pinned_link, &xe-
>>> pinned.kernel_bo_present);
>> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
>> b/drivers/gpu/drm/xe/xe_bo_evict.c
>> index 6a40eedd9db1..96764d8169f4 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
>> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
>> @@ -69,9 +69,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>>   		list_move_tail(&bo->pinned_link, &still_in_list);
>>   		spin_unlock(&xe->pinned.lock);
>>
>> -		xe_bo_lock(bo, false);
>>   		ret = xe_bo_evict_pinned(bo);
>> -		xe_bo_unlock(bo);
>>   		xe_bo_put(bo);
> 
> Any specific reason for removing locks in this function?

Just that now we need two locks, one for the bo here and another for the 
backup object, and they both need to be held at the same time when 
performing the copy. If you do lock(bo) -> lock(backup) you will likely 
get some kind of lockdep splat, if you don't also use the proper locking 
ctx and have the proper backoff and reacquire dance with dma-resv. But 
since bo here is pinned nothing should be able to see it outside of the 
suspend-resume code here so trylock should be enough. On the other hand 
the backup object could be contented so proper lock is needed there. So 
here I am changing this to lock(backup) -> trylock(bo), and it felt 
reasonable to hide that detail in evict_pinned.

> 
>>   		if (ret) {
>>   			spin_lock(&xe->pinned.lock);
>> @@ -103,9 +101,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>>   		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
>>   		spin_unlock(&xe->pinned.lock);
>>
>> -		xe_bo_lock(bo, false);
>>   		ret = xe_bo_evict_pinned(bo);
>> -		xe_bo_unlock(bo);
>>   		xe_bo_put(bo);
>>   		if (ret)
>>   			return ret;
>> @@ -143,9 +139,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>>   		list_move_tail(&bo->pinned_link, &xe-
>>> pinned.kernel_bo_present);
>>   		spin_unlock(&xe->pinned.lock);
>>
>> -		xe_bo_lock(bo, false);
>>   		ret = xe_bo_restore_pinned(bo);
>> -		xe_bo_unlock(bo);
>>   		if (ret) {
>>   			xe_bo_put(bo);
>>   			return ret;
>> @@ -213,9 +207,7 @@ int xe_bo_restore_user(struct xe_device *xe)
>>   		xe_bo_get(bo);
>>   		spin_unlock(&xe->pinned.lock);
>>
>> -		xe_bo_lock(bo, false);
>>   		ret = xe_bo_restore_pinned(bo);
>> -		xe_bo_unlock(bo);
>>   		xe_bo_put(bo);
>>   		if (ret) {
>>   			spin_lock(&xe->pinned.lock);
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h
>> b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 46dc9e4e3e46..a1f1f637aa87 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -27,6 +27,8 @@ struct xe_vm;
>>   struct xe_bo {
>>   	/** @ttm: TTM base buffer object */
>>   	struct ttm_buffer_object ttm;
>> +	/** @backup_obj: The backup object when pinned and suspended
>> (vram only) */
>> +	struct xe_bo *backup_obj;
>>   	/** @size: Size of this buffer object */
>>   	size_t size;
>>   	/** @flags: flags for this buffer object */
>> --
>> 2.47.1
> 

