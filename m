Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46881C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 10:01:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED1410E5C8;
	Thu, 11 May 2023 10:01:38 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916DC10E5C7
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683799295; x=1715335295;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nA8ZmCa5JerFaKIH1oU+TSVq4hH7tD6lLcdAPjRLYak=;
 b=YvkQOJaqHb0lvoRTkc3DE2fS+0io6JjlRqFMa9Yx553jDEessnSyR0bI
 xaHENtmbmb+8mUogjiAqBJ6Ba0AuQc3SYpGWUdDVVSn3yjgHGhfnjCEVo
 gsp5M+E8Ti5LziH/pi7f9slkwkSGoIB5xhua1i0IGnmoX5cLbvyjAmPQx
 yPhA1TVat62vzIJEWgb34BAPFIWvX5b6YwCJuT9d182kJwoNnZFBCCnB0
 phJLsa8kYIGuOI7XPI234YngqFWqof8zhQrYtoUoKGdEpnfrkeJLq3otG
 3Lj5+xg6zBHn2GimducpnT2L/lrbQk2DYA6oasIbJ/saLqZkMKwJSqwIH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="353549421"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="353549421"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:01:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="843885950"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="843885950"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 03:01:26 -0700
Message-ID: <6e17b79e-6912-c33b-5f68-8dd6b8535553@linux.intel.com>
Date: Thu, 11 May 2023 12:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-28-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-28-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 27/31] drm/xe: Use drm_exec for locking
 rather than TTM exec helpers
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
Cc: Danilo Krummrich <dakr@redhat.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/2/23 02:17, Matthew Brost wrote:
> drm_exec is intended to replace TTM exec helpers, use drm_exec. Also
> combine parts of drm_exec with gpuva where it makes sense (locking,
> fence installation).
>
> Suggested-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   drivers/gpu/drm/drm_gpuva_mgr.c              |  67 ++++-
>   drivers/gpu/drm/i915/display/intel_display.c |   6 +-
>   drivers/gpu/drm/xe/Kconfig                   |   1 +
>   drivers/gpu/drm/xe/tests/xe_bo.c             |  26 +-
>   drivers/gpu/drm/xe/tests/xe_migrate.c        |   6 +-
>   drivers/gpu/drm/xe/xe_bo.c                   |  56 ++--
>   drivers/gpu/drm/xe/xe_bo.h                   |   6 +-
>   drivers/gpu/drm/xe/xe_bo_evict.c             |  24 +-
>   drivers/gpu/drm/xe/xe_bo_types.h             |   1 -
>   drivers/gpu/drm/xe/xe_engine.c               |   7 +-
>   drivers/gpu/drm/xe/xe_exec.c                 |  37 +--
>   drivers/gpu/drm/xe/xe_gt_pagefault.c         |  55 +---
>   drivers/gpu/drm/xe/xe_lrc.c                  |   8 +-
>   drivers/gpu/drm/xe/xe_migrate.c              |  13 +-
>   drivers/gpu/drm/xe/xe_vm.c                   | 283 ++++++++-----------
>   drivers/gpu/drm/xe/xe_vm.h                   |  27 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c           |  37 +--
>   include/drm/drm_gpuva_mgr.h                  |  16 +-
>   18 files changed, 315 insertions(+), 361 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
> index e8cd6e154336..93c912c34211 100644
> --- a/drivers/gpu/drm/drm_gpuva_mgr.c
> +++ b/drivers/gpu/drm/drm_gpuva_mgr.c
> @@ -483,6 +483,50 @@ drm_gpuva_manager_destroy(struct drm_gpuva_manager *mgr)
>   }
>   EXPORT_SYMBOL(drm_gpuva_manager_destroy);
>   
> +/**
> + * TODO
> + */
> +int drm_gpuva_manager_lock(struct drm_gpuva_manager *mgr, struct drm_exec *exec,
> +			   struct drm_gem_object *mgr_obj, bool intr,
> +			   unsigned int num_fences)
> +{
> +	struct drm_gpuva *gpuva;
> +	int ret;
> +
> +	drm_exec_init(exec, intr);
> +	drm_exec_while_not_all_locked(exec) {
> +		ret = drm_exec_prepare_obj(exec, mgr_obj, num_fences);
> +		drm_exec_continue_on_contention(exec);
> +		if (ret && ret != -EALREADY)
> +			goto err_exec;
> +
> +		drm_gpuva_for_each_extobj(gpuva, mgr) {
> +			ret = drm_exec_prepare_obj(exec, gpuva->gem.obj,
> +						   num_fences);
> +			drm_exec_break_on_contention(exec);
> +			if (ret && ret != -EALREADY)
> +				goto err_exec;
> +		}
> +	}
> +

I think that in the not too distant future we want to include the 
bo_validate() in the drm_exec_while_not_all_locked() loop (the WW 
transaction), in order to be able to use sleeping WW locks for eviction. 
And then this helper wouldn't be flexible enough, since we'd want o 
avoid vfuncs and probably want to open-code the loop in the driver.

Since Rodrigo already commented on splitting things up, could we do the 
drm_exec as a separate part before drm_exec / GPUVA integration, since, 
given the above, the latter might not lend itself very well to the 
needed flexibility.

/Thomas


> +	return 0;
> +
> +err_exec:
> +	drm_exec_fini(exec);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_gpuva_manager_lock);
> +
> +/**
> + * TODO
> + */
> +void drm_gpuva_manager_unlock(struct drm_gpuva_manager *mgr,
> +			      struct drm_exec *exec)
> +{
> +	drm_exec_fini(exec);
> +}
> +EXPORT_SYMBOL(drm_gpuva_manager_unlock);
> +
>   static inline bool
>   drm_gpuva_in_mm_range(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
>   {
> @@ -888,7 +932,7 @@ drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range)
>   EXPORT_SYMBOL(drm_gpuva_interval_empty);
>   
>   /**
> - * drm_gpuva_add_fence - add fence to private and all extobj dma-resv
> + * drm_gpuva_manager_add_fence - add fence to private and all extobj dma-resv
>    * @mgr: the &drm_gpuva_manager to add a fence to
>    * @fence: fence to add
>    * @private_usage: private dma-resv usage
> @@ -896,17 +940,24 @@ EXPORT_SYMBOL(drm_gpuva_interval_empty);
>    *
>    * Returns: true if the interval is empty, false otherwise
>    */
> -void drm_gpuva_add_fence(struct drm_gpuva_manager *mgr, struct dma_fence *fence,
> -			 enum dma_resv_usage private_usage,
> -			 enum dma_resv_usage extobj_usage)
> +void drm_gpuva_manager_add_fence(struct drm_gpuva_manager *mgr,
> +				 struct drm_exec *exec,
> +				 struct dma_fence *fence,
> +				 enum dma_resv_usage private_usage,
> +				 enum dma_resv_usage extobj_usage)
>   {
> -	struct drm_gpuva *gpuva;
> +	struct drm_gem_object *obj;
> +	unsigned long index;
> +
> +	dma_resv_assert_held(&mgr->resv);
>   
>   	dma_resv_add_fence(&mgr->resv, fence, private_usage);
> -	drm_gpuva_for_each_extobj(gpuva, mgr)
> -		dma_resv_add_fence(gpuva->gem.obj->resv, fence, extobj_usage);
> +	drm_exec_for_each_locked_object(exec, index, obj)
> +		if (likely(&mgr->resv != obj->resv))
> +			dma_resv_add_fence(obj->resv, fence, extobj_usage);
>   }
> -EXPORT_SYMBOL(drm_gpuva_add_fence);
> +EXPORT_SYMBOL(drm_gpuva_manager_add_fence);
> +
>   
>   /**
>    * drm_gpuva_map - helper to insert a &drm_gpuva from &drm_gpuva_fn_ops
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 28a227450329..aab1a3a0f06d 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -7340,11 +7340,11 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
>   	void *virtual;
>   	bool is_iomem;
>   	int ret;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   
>   	XE_BUG_ON(size != 8);
>   
> -	ret = xe_bo_lock(bo, &ww, 0, true);
> +	ret = xe_bo_lock(bo, &exec, 0, true);
>   	if (ret)
>   		return ret;
>   
> @@ -7361,7 +7361,7 @@ static int i915_gem_object_read_from_page(struct xe_bo *bo,
>   
>   	ttm_bo_kunmap(&map);
>   out_unlock:
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo, &exec);
>   	return ret;
>   }
>   #endif
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index f6f3b491d162..bbcc9b64b776 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -8,6 +8,7 @@ config DRM_XE
>   	select SHMEM
>   	select TMPFS
>   	select DRM_BUDDY
> +	select DRM_EXEC
>   	select DRM_KMS_HELPER
>   	select DRM_PANEL
>   	select DRM_SUBALLOC_HELPER
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 9bd381e5b7a6..316c6cf2bb86 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -175,17 +175,17 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   	unsigned int bo_flags = XE_BO_CREATE_USER_BIT |
>   		XE_BO_CREATE_VRAM_IF_DGFX(gt);
>   	struct xe_vm *vm = xe_migrate_get_vm(xe->gt[0].migrate);
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	int err, i;
>   
>   	kunit_info(test, "Testing device %s gt id %u vram id %u\n",
>   		   dev_name(xe->drm.dev), gt->info.id, gt->info.vram_id);
>   
>   	for (i = 0; i < 2; ++i) {
> -		xe_vm_lock(vm, &ww, 0, false);
> +		xe_vm_lock(vm, &exec, 0, false);
>   		bo = xe_bo_create(xe, NULL, vm, 0x10000, ttm_bo_type_device,
>   				  bo_flags);
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm, &exec);
>   		if (IS_ERR(bo)) {
>   			KUNIT_FAIL(test, "bo create err=%pe\n", bo);
>   			break;
> @@ -198,9 +198,9 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   			goto cleanup_bo;
>   		}
>   
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>   		err = xe_bo_pin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>   		if (err) {
>   			KUNIT_FAIL(test, "external bo pin err=%pe\n",
>   				   ERR_PTR(err));
> @@ -240,18 +240,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   
>   		if (i) {
>   			down_read(&vm->lock);
> -			xe_vm_lock(vm, &ww, 0, false);
> +			xe_vm_lock(vm, &exec, 0, false);
>   			err = xe_bo_validate(bo, bo->vm, false);
> -			xe_vm_unlock(vm, &ww);
> +			xe_vm_unlock(vm, &exec);
>   			up_read(&vm->lock);
>   			if (err) {
>   				KUNIT_FAIL(test, "bo valid err=%pe\n",
>   					   ERR_PTR(err));
>   				goto cleanup_all;
>   			}
> -			xe_bo_lock(external, &ww, 0, false);
> +			xe_bo_lock(external, &exec, 0, false);
>   			err = xe_bo_validate(external, NULL, false);
> -			xe_bo_unlock(external, &ww);
> +			xe_bo_unlock(external, &exec);
>   			if (err) {
>   				KUNIT_FAIL(test, "external bo valid err=%pe\n",
>   					   ERR_PTR(err));
> @@ -259,18 +259,18 @@ static int evict_test_run_gt(struct xe_device *xe, struct xe_gt *gt, struct kuni
>   			}
>   		}
>   
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>   		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>   
>   		xe_bo_put(external);
>   		xe_bo_put(bo);
>   		continue;
>   
>   cleanup_all:
> -		xe_bo_lock(external, &ww, 0, false);
> +		xe_bo_lock(external, &exec, 0, false);
>   		xe_bo_unpin_external(external);
> -		xe_bo_unlock(external, &ww);
> +		xe_bo_unlock(external, &exec);
>   cleanup_external:
>   		xe_bo_put(external);
>   cleanup_bo:
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 0f4371ad1fd9..e1482b4491b1 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -394,14 +394,14 @@ static int migrate_test_run_device(struct xe_device *xe)
>   
>   	for_each_gt(gt, xe, id) {
>   		struct xe_migrate *m = gt->migrate;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		kunit_info(test, "Testing gt id %d.\n", id);
> -		xe_vm_lock(m->eng->vm, &ww, 0, true);
> +		xe_vm_lock(m->eng->vm, &exec, 0, true);
>   		xe_device_mem_access_get(xe);
>   		xe_migrate_sanity_test(m, test);
>   		xe_device_mem_access_put(xe);
> -		xe_vm_unlock(m->eng->vm, &ww);
> +		xe_vm_unlock(m->eng->vm, &exec);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e0422ffb6327..a427edbf486b 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -8,6 +8,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
>   #include <drm/drm_gem_ttm_helper.h>
>   #include <drm/ttm/ttm_device.h>
>   #include <drm/ttm/ttm_placement.h>
> @@ -991,13 +992,13 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>   
>   	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		XE_BUG_ON(!xe_bo_is_user(bo));
>   
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>   		ttm_bo_set_bulk_move(&bo->ttm, NULL);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   	}
>   }
>   
> @@ -1402,11 +1403,6 @@ int xe_bo_pin_external(struct xe_bo *bo)
>   	}
>   
>   	ttm_bo_pin(&bo->ttm);
> -
> -	/*
> -	 * FIXME: If we always use the reserve / unreserve functions for locking
> -	 * we do not need this.
> -	 */
>   	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>   
>   	return 0;
> @@ -1461,11 +1457,6 @@ int xe_bo_pin(struct xe_bo *bo)
>   	}
>   
>   	ttm_bo_pin(&bo->ttm);
> -
> -	/*
> -	 * FIXME: If we always use the reserve / unreserve functions for locking
> -	 * we do not need this.
> -	 */
>   	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>   
>   	return 0;
> @@ -1496,11 +1487,6 @@ void xe_bo_unpin_external(struct xe_bo *bo)
>   	}
>   
>   	ttm_bo_unpin(&bo->ttm);
> -
> -	/*
> -	 * FIXME: If we always use the reserve / unreserve functions for locking
> -	 * we do not need this.
> -	 */
>   	ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>   }
>   
> @@ -1650,7 +1636,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_file *xef = to_xe_file(file);
>   	struct drm_xe_gem_create *args = data;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct xe_vm *vm = NULL;
>   	struct xe_bo *bo;
>   	unsigned bo_flags = XE_BO_CREATE_USER_BIT;
> @@ -1686,7 +1672,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		vm = xe_vm_lookup(xef, args->vm_id);
>   		if (XE_IOCTL_ERR(xe, !vm))
>   			return -ENOENT;
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, &exec, 0, true);
>   		if (err) {
>   			xe_vm_put(vm);
>   			return err;
> @@ -1703,7 +1689,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>   			  bo_flags);
>   	if (vm) {
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm, &exec);
>   		xe_vm_put(vm);
>   	}
>   
> @@ -1744,26 +1730,30 @@ int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
>   	return 0;
>   }
>   
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> +int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
>   	       int num_resv, bool intr)
>   {
> -	struct ttm_validate_buffer tv_bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	int err;
>   
> -	XE_BUG_ON(!ww);
> +	drm_exec_init(exec, intr);
> +	drm_exec_while_not_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> +					   num_resv);
> +		drm_exec_continue_on_contention(exec);
> +		if (err && err != -EALREADY)
> +			goto out_err;
> +	}
>   
> -	tv_bo.num_shared = num_resv;
> -	tv_bo.bo = &bo->ttm;;
> -	list_add_tail(&tv_bo.head, &objs);
> +	return 0;
>   
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +out_err:
> +	drm_exec_fini(exec);
> +	return err;
>   }
>   
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> +void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec)
>   {
> -	dma_resv_unlock(bo->ttm.base.resv);
> -	ww_acquire_fini(ww);
> +	drm_exec_fini(exec);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 9b401d30a130..5a80ebf72d10 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -75,6 +75,7 @@
>   
>   #define XE_BO_PROPS_INVALID	(-1)
>   
> +struct drm_exec;
>   struct sg_table;
>   
>   struct xe_bo *xe_bo_alloc(void);
> @@ -142,10 +143,9 @@ static inline void xe_bo_assert_held(struct xe_bo *bo)
>   		dma_resv_assert_held((bo)->ttm.base.resv);
>   }
>   
> -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> +int xe_bo_lock(struct xe_bo *bo, struct drm_exec *exec,
>   	       int num_resv, bool intr);
> -
> -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
> +void xe_bo_unlock(struct xe_bo *bo, struct drm_exec *exec);
>   
>   static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index 6642c5f52009..46d9d9eb110c 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2022 Intel Corporation
>    */
>   
> +#include <drm/drm_exec.h>
> +
>   #include "xe_bo_evict.h"
>   
>   #include "xe_bo.h"
> @@ -27,7 +29,7 @@
>   int xe_bo_evict_all(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct xe_bo *bo;
>   	struct xe_gt *gt;
>   	struct list_head still_in_list;
> @@ -62,9 +64,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>   		list_move_tail(&bo->pinned_link, &still_in_list);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>   		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   		xe_bo_put(bo);
>   		if (ret) {
>   			spin_lock(&xe->pinned.lock);
> @@ -96,9 +98,9 @@ int xe_bo_evict_all(struct xe_device *xe)
>   		list_move_tail(&bo->pinned_link, &xe->pinned.evicted);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>   		ret = xe_bo_evict_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   		xe_bo_put(bo);
>   		if (ret)
>   			return ret;
> @@ -123,7 +125,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>    */
>   int xe_bo_restore_kernel(struct xe_device *xe)
>   {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct xe_bo *bo;
>   	int ret;
>   
> @@ -140,9 +142,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>   		list_move_tail(&bo->pinned_link, &xe->pinned.kernel_bo_present);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>   		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   		if (ret) {
>   			xe_bo_put(bo);
>   			return ret;
> @@ -182,7 +184,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>    */
>   int xe_bo_restore_user(struct xe_device *xe)
>   {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct xe_bo *bo;
>   	struct xe_gt *gt;
>   	struct list_head still_in_list;
> @@ -204,9 +206,9 @@ int xe_bo_restore_user(struct xe_device *xe)
>   		xe_bo_get(bo);
>   		spin_unlock(&xe->pinned.lock);
>   
> -		xe_bo_lock(bo, &ww, 0, false);
> +		xe_bo_lock(bo, &exec, 0, false);
>   		ret = xe_bo_restore_pinned(bo);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   		xe_bo_put(bo);
>   		if (ret) {
>   			spin_lock(&xe->pinned.lock);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 06de3330211d..2ba34a8c9b66 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -11,7 +11,6 @@
>   #include <drm/drm_mm.h>
>   #include <drm/ttm/ttm_bo.h>
>   #include <drm/ttm/ttm_device.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>   #include <drm/ttm/ttm_placement.h>
>   
>   struct xe_device;
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index 91600b1e8249..8b425b777259 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -8,6 +8,7 @@
>   #include <linux/nospec.h>
>   
>   #include <drm/drm_device.h>
> +#include <drm/drm_exec.h>
>   #include <drm/drm_file.h>
>   #include <drm/xe_drm.h>
>   
> @@ -89,18 +90,18 @@ struct xe_engine *xe_engine_create(struct xe_device *xe, struct xe_vm *vm,
>   				   u32 logical_mask, u16 width,
>   				   struct xe_hw_engine *hwe, u32 flags)
>   {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct xe_engine *e;
>   	int err;
>   
>   	if (vm) {
> -		err = xe_vm_lock(vm, &ww, 0, true);
> +		err = xe_vm_lock(vm, &exec, 0, true);
>   		if (err)
>   			return ERR_PTR(err);
>   	}
>   	e = __xe_engine_create(xe, vm, logical_mask, width, hwe, flags);
>   	if (vm)
> -		xe_vm_unlock(vm, &ww);
> +		xe_vm_unlock(vm, &exec);
>   
>   	return e;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 2ae02f1500d5..9f7f1088c403 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -6,6 +6,7 @@
>   #include "xe_exec.h"
>   
>   #include <drm/drm_device.h>
> +#include <drm/drm_exec.h>
>   #include <drm/drm_file.h>
>   #include <drm/xe_drm.h>
>   
> @@ -92,21 +93,16 @@
>    *	Unlock all
>    */
>   
> -static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
> -			 struct ttm_validate_buffer tv_onstack[],
> -			 struct ttm_validate_buffer **tv,
> -			 struct list_head *objs)
> +static int xe_exec_begin(struct xe_engine *e, struct drm_exec *exec)
>   {
>   	struct xe_vm *vm = e->vm;
>   	struct xe_vma *vma;
> -	LIST_HEAD(dups);
>   	int err;
>   
> -	*tv = NULL;
>   	if (xe_vm_no_dma_fences(e->vm))
>   		return 0;
>   
> -	err = xe_vm_lock_dma_resv(vm, ww, tv_onstack, tv, objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, exec, true, 1);
>   	if (err)
>   		return err;
>   
> @@ -123,8 +119,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>   
>   		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
>   		if (err) {
> -			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
> -			*tv = NULL;
> +			xe_vm_unlock_dma_resv(vm, exec);
>   			return err;
>   		}
>   	}
> @@ -132,14 +127,10 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>   	return 0;
>   }
>   
> -static void xe_exec_end(struct xe_engine *e,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer *tv,
> -			struct ww_acquire_ctx *ww,
> -			struct list_head *objs)
> +static void xe_exec_end(struct xe_engine *e, struct drm_exec *exec)
>   {
>   	if (!xe_vm_no_dma_fences(e->vm))
> -		xe_vm_unlock_dma_resv(e->vm, tv_onstack, tv, ww, objs);
> +		xe_vm_unlock_dma_resv(e->vm, exec);
>   }
>   
>   int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> @@ -149,17 +140,14 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	struct drm_xe_exec *args = data;
>   	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
>   	u64 __user *addresses_user = u64_to_user_ptr(args->address);
> +	struct drm_exec exec;
>   	struct xe_engine *engine;
>   	struct xe_sync_entry *syncs = NULL;
>   	u64 addresses[XE_HW_ENGINE_MAX_INSTANCE];
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv = NULL;
>   	u32 i, num_syncs = 0;
>   	struct xe_sched_job *job;
>   	struct dma_fence *rebind_fence;
>   	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>   	bool write_locked;
>   	int err = 0;
>   
> @@ -270,7 +258,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   			goto err_unlock_list;
>   	}
>   
> -	err = xe_exec_begin(engine, &ww, tv_onstack, &tv, &objs);
> +	err = xe_exec_begin(engine, &exec);
>   	if (err)
>   		goto err_unlock_list;
>   
> @@ -361,9 +349,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	 * are written as we don't pass in a read / write list.
>   	 */
>   	if (!xe_vm_no_dma_fences(vm))
> -		drm_gpuva_add_fence(&vm->mgr, &job->drm.s_fence->finished,
> -				    DMA_RESV_USAGE_BOOKKEEP,
> -				    DMA_RESV_USAGE_WRITE);
> +		drm_gpuva_manager_add_fence(&vm->mgr, &exec,
> +					    &job->drm.s_fence->finished,
> +					    DMA_RESV_USAGE_BOOKKEEP,
> +					    DMA_RESV_USAGE_WRITE);
>   
>   	for (i = 0; i < num_syncs; i++)
>   		xe_sync_entry_signal(&syncs[i], job,
> @@ -387,7 +376,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	if (err)
>   		xe_sched_job_put(job);
>   err_engine_end:
> -	xe_exec_end(engine, tv_onstack, tv, &ww, &objs);
> +	xe_exec_end(engine, &exec);
>   err_unlock_list:
>   	if (write_locked)
>   		up_write(&vm->lock);
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index d7bf6b0a0697..1145c6eaa17d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -9,7 +9,7 @@
>   #include <linux/circ_buf.h>
>   
>   #include <drm/drm_managed.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
> +#include <drm/drm_exec.h>
>   
>   #include "xe_bo.h"
>   #include "xe_gt.h"
> @@ -84,11 +84,6 @@ static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>   	return true;
>   }
>   
> -static bool only_needs_bo_lock(struct xe_bo *bo)
> -{
> -	return bo && bo->vm;
> -}
> -
>   static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>   {
>   	struct xe_vma *vma = NULL;
> @@ -109,10 +104,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	struct xe_vm *vm;
>   	struct xe_vma *vma = NULL;
>   	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct dma_fence *fence;
>   	bool write_locked;
>   	int ret = 0;
> @@ -170,20 +162,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   
>   	/* Lock VM and BOs dma-resv */
>   	bo = xe_vma_bo(vma);
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		if (bo) {
> -			tv_bo.bo = &bo->ttm;
> -			tv_bo.num_shared = xe->info.tile_count;
> -			list_add(&tv_bo.head, &objs);
> -		}
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	}
> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>   	if (ret)
>   		goto unlock_vm;
>   
> @@ -226,10 +205,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	vma->usm.gt_invalidated &= ~BIT(gt->info.id);
>   
>   unlock_dma_resv:
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>   unlock_vm:
>   	if (!ret)
>   		vm->usm.last_fault_vma = vma;
> @@ -496,10 +472,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>   	struct xe_vm *vm;
>   	struct xe_vma *vma;
>   	struct xe_bo *bo;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	int ret = 0;
>   
>   	/* We only support ACC_TRIGGER at the moment */
> @@ -532,28 +505,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>   
>   	/* Lock VM and BOs dma-resv */
>   	bo = xe_vma_bo(vma);
> -	if (only_needs_bo_lock(bo)) {
> -		/* This path ensures the BO's LRU is updated */
> -		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> -	} else {
> -		tv_vm.num_shared = xe->info.tile_count;
> -		tv_vm.bo = xe_vm_ttm_bo(vm);
> -		list_add(&tv_vm.head, &objs);
> -		tv_bo.bo = &bo->ttm;
> -		tv_bo.num_shared = xe->info.tile_count;
> -		list_add(&tv_bo.head, &objs);
> -		ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> -	}
> +	ret = xe_vm_bo_lock(vm, bo, &exec, xe->info.tile_count, false);
>   	if (ret)
>   		goto unlock_vm;
>   
>   	/* Migrate to VRAM, move should invalidate the VMA first */
>   	ret = xe_bo_migrate(bo, XE_PL_VRAM0 + gt->info.vram_id);
>   
> -	if (only_needs_bo_lock(bo))
> -		xe_bo_unlock(bo, &ww);
> -	else
> -		ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, bo, &exec, true);
>   unlock_vm:
>   	up_read(&vm->lock);
>   	xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index ae605e7805de..3cc34efe8dd8 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2021 Intel Corporation
>    */
>   
> +#include <drm/drm_exec.h>
> +
>   #include "xe_lrc.h"
>   
>   #include "regs/xe_engine_regs.h"
> @@ -712,16 +714,16 @@ int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>   
>   void xe_lrc_finish(struct xe_lrc *lrc)
>   {
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   
>   	xe_hw_fence_ctx_finish(&lrc->fence_ctx);
>   	if (lrc->bo->vm)
> -		xe_vm_lock(lrc->bo->vm, &ww, 0, false);
> +		xe_vm_lock(lrc->bo->vm, &exec, 0, false);
>   	else
>   		xe_bo_lock_no_vm(lrc->bo, NULL);
>   	xe_bo_unpin(lrc->bo);
>   	if (lrc->bo->vm)
> -		xe_vm_unlock(lrc->bo->vm, &ww);
> +		xe_vm_unlock(lrc->bo->vm, &exec);
>   	else
>   		xe_bo_unlock_no_vm(lrc->bo);
>   	xe_bo_put(lrc->bo);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 91a06c925a1e..1dd497252640 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -9,6 +9,7 @@
>   #include <linux/sizes.h>
>   
>   #include <drm/drm_managed.h>
> +#include <drm/drm_exec.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/xe_drm.h>
>   
> @@ -86,13 +87,13 @@ struct xe_engine *xe_gt_migrate_engine(struct xe_gt *gt)
>   static void xe_migrate_fini(struct drm_device *dev, void *arg)
>   {
>   	struct xe_migrate *m = arg;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   
> -	xe_vm_lock(m->eng->vm, &ww, 0, false);
> +	xe_vm_lock(m->eng->vm, &exec, 0, false);
>   	xe_bo_unpin(m->pt_bo);
>   	if (m->cleared_bo)
>   		xe_bo_unpin(m->cleared_bo);
> -	xe_vm_unlock(m->eng->vm, &ww);
> +	xe_vm_unlock(m->eng->vm, &exec);
>   
>   	dma_fence_put(m->fence);
>   	if (m->cleared_bo)
> @@ -315,7 +316,7 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
>   	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_migrate *m;
>   	struct xe_vm *vm;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	int err;
>   
>   	XE_BUG_ON(xe_gt_is_media_type(gt));
> @@ -332,9 +333,9 @@ struct xe_migrate *xe_migrate_init(struct xe_gt *gt)
>   	if (IS_ERR(vm))
>   		return ERR_CAST(vm);
>   
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, &exec, 0, false);
>   	err = xe_migrate_prepare_vm(gt, m, vm);
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm, &exec);
>   	if (err) {
>   		xe_vm_close_and_put(vm);
>   		return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 4d734ec4d6ab..55cced8870e6 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -7,7 +7,7 @@
>   
>   #include <linux/dma-fence-array.h>
>   
> -#include <drm/ttm/ttm_execbuf_util.h>
> +#include <drm/drm_exec.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/xe_drm.h>
>   #include <linux/kthread.h>
> @@ -260,10 +260,10 @@ static void arm_preempt_fences(struct xe_vm *vm, struct list_head *list)
>   static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>   {
>   	struct xe_engine *e;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	int err;
>   
> -	err = xe_bo_lock(bo, &ww, vm->preempt.num_engines, true);
> +	err = xe_bo_lock(bo, &exec, vm->preempt.num_engines, true);
>   	if (err)
>   		return err;
>   
> @@ -274,11 +274,12 @@ static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
>   					   DMA_RESV_USAGE_BOOKKEEP);
>   		}
>   
> -	xe_bo_unlock(bo, &ww);
> +	xe_bo_unlock(bo, &exec);
>   	return 0;
>   }
>   
> -static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
> +static void resume_and_reinstall_preempt_fences(struct xe_vm *vm,
> +						struct drm_exec *exec)
>   {
>   	struct xe_engine *e;
>   
> @@ -288,18 +289,15 @@ static void resume_and_reinstall_preempt_fences(struct xe_vm *vm)
>   	list_for_each_entry(e, &vm->preempt.engines, compute.link) {
>   		e->ops->resume(e);
>   
> -		drm_gpuva_add_fence(&vm->mgr, e->compute.pfence,
> -				    DMA_RESV_USAGE_BOOKKEEP,
> -				    DMA_RESV_USAGE_BOOKKEEP);
> +		drm_gpuva_manager_add_fence(&vm->mgr, exec, e->compute.pfence,
> +					    DMA_RESV_USAGE_BOOKKEEP,
> +					    DMA_RESV_USAGE_BOOKKEEP);
>   	}
>   }
>   
>   int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>   {
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
> +	struct drm_exec exec;
>   	struct dma_fence *pfence;
>   	int err;
>   	bool wait;
> @@ -308,7 +306,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>   
>   	down_write(&vm->lock);
>   
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs, true, 1);
> +	err = xe_vm_lock_dma_resv(vm, &exec, true, 1);
>   	if (err)
>   		goto out_unlock_outer;
>   
> @@ -325,9 +323,9 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>   
>   	down_read(&vm->userptr.notifier_lock);
>   
> -	drm_gpuva_add_fence(&vm->mgr, pfence,
> -			    DMA_RESV_USAGE_BOOKKEEP,
> -			    DMA_RESV_USAGE_BOOKKEEP);
> +	drm_gpuva_manager_add_fence(&vm->mgr, &exec, pfence,
> +				    DMA_RESV_USAGE_BOOKKEEP,
> +				    DMA_RESV_USAGE_BOOKKEEP);
>   
>   	/*
>   	 * Check to see if a preemption on VM is in flight or userptr
> @@ -341,7 +339,7 @@ int xe_vm_add_compute_engine(struct xe_vm *vm, struct xe_engine *e)
>   	up_read(&vm->userptr.notifier_lock);
>   
>   out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm, &exec);
>   out_unlock_outer:
>   	up_write(&vm->lock);
>   
> @@ -367,25 +365,24 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>   		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
>   }
>   
> +static struct drm_gem_object *xe_vm_gem(struct xe_vm *vm)
> +{
> +	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> +		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> +
> +	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> +	return &vm->pt_root[idx]->bo->ttm.base;
> +}
> +
>   /**
>    * xe_vm_lock_dma_resv() - Lock the vm dma_resv object and the dma_resv
>    * objects of the vm's external buffer objects.
> - * @vm: The vm.
> - * @ww: Pointer to a struct ww_acquire_ctx locking context.
> - * @tv_onstack: Array size XE_ONSTACK_TV of storage for the struct
> - * ttm_validate_buffers used for locking.
> - * @tv: Pointer to a pointer that on output contains the actual storage used.
> - * @objs: List head for the buffer objects locked.
> + * @vm: The vm
>    * @intr: Whether to lock interruptible.
>    * @num_shared: Number of dma-fence slots to reserve in the locked objects.
>    *
>    * Locks the vm dma-resv objects and all the dma-resv objects of the
> - * buffer objects on the vm external object list. The TTM utilities require
> - * a list of struct ttm_validate_buffers pointing to the actual buffer
> - * objects to lock. Storage for those struct ttm_validate_buffers should
> - * be provided in @tv_onstack, and is typically reserved on the stack
> - * of the caller. If the size of @tv_onstack isn't sufficient, then
> - * storage will be allocated internally using kvmalloc().
> + * buffer objects on the vm external object list.
>    *
>    * The function performs deadlock handling internally, and after a
>    * successful return the ww locking transaction should be considered
> @@ -395,46 +392,18 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
>    * @intr is set to true, -EINTR or -ERESTARTSYS may be returned. In case
>    * of error, any locking performed has been reverted.
>    */
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec, bool intr,
>   			unsigned int num_shared)
>   {
> -	struct ttm_validate_buffer *tv_vm, *tv_bo;
>   	struct xe_vma *vma, *next;
> -	struct drm_gpuva *gpuva;
> -	LIST_HEAD(dups);
>   	int err;
>   
>   	lockdep_assert_held(&vm->lock);
>   
> -	if (vm->mgr.extobj.entries < XE_ONSTACK_TV) {
> -		tv_vm = tv_onstack;
> -	} else {
> -		tv_vm = kvmalloc_array(vm->mgr.extobj.entries + 1,
> -				       sizeof(*tv_vm),
> -				       GFP_KERNEL);
> -		if (!tv_vm)
> -			return -ENOMEM;
> -	}
> -	tv_bo = tv_vm + 1;
> -
> -	INIT_LIST_HEAD(objs);
> -	drm_gpuva_for_each_extobj(gpuva, &vm->mgr) {
> -		tv_bo->num_shared = num_shared;
> -		tv_bo->bo = &gem_to_xe_bo(gpuva->gem.obj)->ttm;
> -
> -		list_add_tail(&tv_bo->head, objs);
> -		tv_bo++;
> -	}
> -	tv_vm->num_shared = num_shared;
> -	tv_vm->bo = xe_vm_ttm_bo(vm);
> -	list_add_tail(&tv_vm->head, objs);
> -	err = ttm_eu_reserve_buffers(ww, objs, intr, &dups);
> +	err = drm_gpuva_manager_lock(&vm->mgr, exec, xe_vm_gem(vm), intr,
> +				     num_shared);
>   	if (err)
> -		goto out_err;
> +		return err;
>   
>   	spin_lock(&vm->notifier.list_lock);
>   	list_for_each_entry_safe(vma, next, &vm->notifier.rebind_list,
> @@ -447,34 +416,22 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>   	}
>   	spin_unlock(&vm->notifier.list_lock);
>   
> -	*tv = tv_vm;
>   	return 0;
> -
> -out_err:
> -	if (tv_vm != tv_onstack)
> -		kvfree(tv_vm);
> -
> -	return err;
>   }
>   
>   /**
>    * xe_vm_unlock_dma_resv() - Unlock reservation objects locked by
>    * xe_vm_lock_dma_resv()
>    * @vm: The vm.
> - * @tv_onstack: The @tv_onstack array given to xe_vm_lock_dma_resv().
> - * @tv: The value of *@tv given by xe_vm_lock_dma_resv().
> - * @ww: The ww_acquire_context used for locking.
> - * @objs: The list returned from xe_vm_lock_dma_resv().
>    *
>    * Unlocks the reservation objects and frees any memory allocated by
>    * xe_vm_lock_dma_resv().
>    */
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs)
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec)
>   {
> +	struct drm_gem_object *obj, *skip = xe_vm_gem(vm);
> +	unsigned long index;
> +
>   	/*
>   	 * Nothing should've been able to enter the list while we were locked,
>   	 * since we've held the dma-resvs of all the vm's external objects,
> @@ -483,19 +440,20 @@ void xe_vm_unlock_dma_resv(struct xe_vm *vm,
>   	 */
>   	XE_WARN_ON(!list_empty(&vm->notifier.rebind_list));
>   
> -	ttm_eu_backoff_reservation(ww, objs);
> -	if (tv && tv != tv_onstack)
> -		kvfree(tv);
> +	drm_exec_for_each_locked_object(exec, index, obj) {
> +		struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +		if (obj != skip)
> +			ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	}
> +	drm_gpuva_manager_unlock(&vm->mgr, exec);
>   }
>   
>   static void preempt_rebind_work_func(struct work_struct *w)
>   {
>   	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> +	struct drm_exec exec;
>   	struct xe_vma *vma;
> -	struct ttm_validate_buffer tv_onstack[XE_ONSTACK_TV];
> -	struct ttm_validate_buffer *tv;
> -	struct ww_acquire_ctx ww;
> -	struct list_head objs;
>   	struct dma_fence *rebind_fence;
>   	unsigned int fence_count = 0;
>   	LIST_HEAD(preempt_fences);
> @@ -536,8 +494,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   			goto out_unlock_outer;
>   	}
>   
> -	err = xe_vm_lock_dma_resv(vm, &ww, tv_onstack, &tv, &objs,
> -				  false, vm->preempt.num_engines);
> +	err = xe_vm_lock_dma_resv(vm, &exec, false, vm->preempt.num_engines);
>   	if (err)
>   		goto out_unlock_outer;
>   
> @@ -608,11 +565,11 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   
>   	/* Point of no return. */
>   	arm_preempt_fences(vm, &preempt_fences);
> -	resume_and_reinstall_preempt_fences(vm);
> +	resume_and_reinstall_preempt_fences(vm, &exec);
>   	up_read(&vm->userptr.notifier_lock);
>   
>   out_unlock:
> -	xe_vm_unlock_dma_resv(vm, tv_onstack, tv, &ww, &objs);
> +	xe_vm_unlock_dma_resv(vm, &exec);
>   out_unlock_outer:
>   	if (err == -EAGAIN) {
>   		trace_xe_vm_rebind_worker_retry(vm);
> @@ -963,27 +920,16 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   
>   static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>   {
> -	struct ttm_validate_buffer tv[2];
> -	struct ww_acquire_ctx ww;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	struct xe_bo *bo = xe_vma_bo(vma);
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	struct drm_exec exec;
>   	int err;
>   
> -	memset(tv, 0, sizeof(tv));
> -	tv[0].bo = xe_vm_ttm_bo(xe_vma_vm(vma));
> -	list_add(&tv[0].head, &objs);
> -
> -	if (bo) {
> -		tv[1].bo = &xe_bo_get(bo)->ttm;
> -		list_add(&tv[1].head, &objs);
> -	}
> -	err = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> +	err = xe_vm_bo_lock(vm, xe_bo_get(bo), &exec, 0, false);
>   	XE_WARN_ON(err);
> -
>   	xe_vma_destroy(vma, NULL);
> +	xe_vm_bo_unlock(vm, bo, &exec, false);
>   
> -	ttm_eu_backoff_reservation(&ww, &objs);
>   	if (bo)
>   		xe_bo_put(bo);
>   }
> @@ -1254,7 +1200,7 @@ static void vm_error_capture(struct xe_vm *vm, int err,
>   void xe_vm_close_and_put(struct xe_vm *vm)
>   {
>   	struct list_head contested;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct xe_device *xe = xe_vm_device(vm);
>   	struct xe_gt *gt;
>   	struct xe_vma *vma, *next_vma;
> @@ -1281,7 +1227,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	}
>   
>   	down_write(&vm->lock);
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, &exec, 0, false);
>   	drm_gpuva_iter_for_each(gpuva, it) {
>   		vma = gpuva_to_vma(gpuva);
>   
> @@ -1323,7 +1269,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   					      NULL);
>   		}
>   	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm, &exec);
>   
>   	/*
>   	 * VM is now dead, cannot re-add nodes to vm->vmas if it's NULL
> @@ -1356,7 +1302,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>   {
>   	struct xe_vm *vm =
>   		container_of(w, struct xe_vm, destroy_work);
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct xe_device *xe = xe_vm_device(vm);
>   	struct xe_gt *gt;
>   	u8 id;
> @@ -1382,14 +1328,14 @@ static void vm_destroy_work_func(struct work_struct *w)
>   	 * is needed for xe_vm_lock to work. If we remove that dependency this
>   	 * can be moved to xe_vm_close_and_put.
>   	 */
> -	xe_vm_lock(vm, &ww, 0, false);
> +	xe_vm_lock(vm, &exec, 0, false);
>   	for_each_gt(gt, xe, id) {
>   		if (vm->pt_root[id]) {
>   			xe_pt_destroy(vm->pt_root[id], vm->flags, NULL);
>   			vm->pt_root[id] = NULL;
>   		}
>   	}
> -	xe_vm_unlock(vm, &ww);
> +	xe_vm_unlock(vm, &exec);
>   
>   	trace_xe_vm_free(vm);
>   	dma_fence_put(vm->rebind_fence);
> @@ -1969,21 +1915,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
>   
>   #define VM_BIND_OP(op)	(op & 0xffff)
>   
> -struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
> -{
> -	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
> -		XE_VM_FLAG_GT_ID(vm->flags) : 0;
> -
> -	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
> -	return &vm->pt_root[idx]->bo->ttm;
> -}
> -
> -static void xe_vm_tv_populate(struct xe_vm *vm, struct ttm_validate_buffer *tv)
> -{
> -	tv->num_shared = 1;
> -	tv->bo = xe_vm_ttm_bo(vm);
> -}
> -
>   static void vm_set_async_error(struct xe_vm *vm, int err)
>   {
>   	lockdep_assert_held(&vm->lock);
> @@ -2088,7 +2019,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   			 u32 operation, u8 gt_mask, u32 region)
>   {
>   	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	struct drm_gpuva_ops *ops;
>   	struct drm_gpuva_op *__op;
>   	struct xe_vma_op *op;
> @@ -2136,11 +2067,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	case XE_VM_BIND_OP_UNMAP_ALL:
>   		XE_BUG_ON(!bo);
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return ERR_PTR(err);
>   		ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   
>   		drm_gpuva_for_each_op(__op, ops) {
>   			struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> @@ -2174,13 +2105,13 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>   {
>   	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>   	struct xe_vma *vma;
> -	struct ww_acquire_ctx ww;
> +	struct drm_exec exec;
>   	int err;
>   
>   	lockdep_assert_held_write(&vm->lock);
>   
>   	if (bo) {
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return ERR_PTR(err);
>   	}
> @@ -2189,7 +2120,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>   			    op->va.range - 1, read_only, null,
>   			    gt_mask);
>   	if (bo)
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   
>   	if (xe_vma_is_userptr(vma)) {
>   		err = xe_vma_userptr_pin_pages(vma);
> @@ -2441,19 +2372,15 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
>   static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   			       struct xe_vma_op *op)
>   {
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> -	struct ttm_validate_buffer tv_bo, tv_vm;
> -	struct ww_acquire_ctx ww;
>   	struct xe_bo *vbo;
> +	struct drm_exec exec;
>   	int err;
> +	bool lru_update = op->base.op != DRM_GPUVA_OP_UNMAP;
>   
>   	lockdep_assert_held_write(&vm->lock);
>   
> -	xe_vm_tv_populate(vm, &tv_vm);
> -	list_add_tail(&tv_vm.head, &objs);
>   	vbo = xe_vma_bo(vma);
> -	if (vbo) {
> +	if (vbo)
>   		/*
>   		 * An unbind can drop the last reference to the BO and
>   		 * the BO is needed for ttm_eu_backoff_reservation so
> @@ -2461,22 +2388,15 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   		 */
>   		xe_bo_get(vbo);
>   
> -		if (!vbo->vm) {
> -			tv_bo.bo = &vbo->ttm;
> -			tv_bo.num_shared = 1;
> -			list_add(&tv_bo.head, &objs);
> -		}
> -	}
> -
>   again:
> -	err = ttm_eu_reserve_buffers(&ww, &objs, true, &dups);
> +	err = xe_vm_bo_lock(vm, vbo, &exec, 1, false);
>   	if (err) {
>   		xe_bo_put(vbo);
>   		return err;
>   	}
>   
>   	xe_vm_assert_held(vm);
> -	xe_bo_assert_held(xe_vma_bo(vma));
> +	xe_bo_assert_held(vbo);
>   
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
> @@ -2552,7 +2472,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   		XE_BUG_ON("NOT POSSIBLE");
>   	}
>   
> -	ttm_eu_backoff_reservation(&ww, &objs);
> +	xe_vm_bo_unlock(vm, vbo, &exec, lru_update);
>   	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>   		lockdep_assert_held_write(&vm->lock);
>   		err = xe_vma_userptr_pin_pages(vma);
> @@ -3208,30 +3128,67 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	return err == -ENODATA ? 0 : err;
>   }
>   
> -/*
> - * XXX: Using the TTM wrappers for now, likely can call into dma-resv code
> - * directly to optimize. Also this likely should be an inline function.
> - */
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> +int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
>   	       int num_resv, bool intr)
>   {
> -	struct ttm_validate_buffer tv_vm;
> -	LIST_HEAD(objs);
> -	LIST_HEAD(dups);
> +	int err;
>   
> -	XE_BUG_ON(!ww);
> +	drm_exec_init(exec, intr);
> +	drm_exec_while_not_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
> +					   num_resv);
> +		drm_exec_continue_on_contention(exec);
> +		if (err && err != -EALREADY)
> +			goto out_err;
> +	}
>   
> -	tv_vm.num_shared = num_resv;
> -	tv_vm.bo = xe_vm_ttm_bo(vm);;
> -	list_add_tail(&tv_vm.head, &objs);
> +	return 0;
>   
> -	return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> +out_err:
> +	drm_exec_fini(exec);
> +	return err;
>   }
>   
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww)
> +void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec)
>   {
> -	dma_resv_unlock(xe_vm_resv(vm));
> -	ww_acquire_fini(ww);
> +	drm_exec_fini(exec);
> +}
> +
> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		  int num_resv, bool intr)
> +{
> +	int err;
> +
> +	drm_exec_init(exec, intr);
> +	drm_exec_while_not_all_locked(exec) {
> +		err = drm_exec_prepare_obj(exec, xe_vm_gem(vm),
> +					   num_resv);
> +		drm_exec_continue_on_contention(exec);
> +		if (err && err != -EALREADY)
> +			goto out_err;
> +
> +		if (bo && !bo->vm) {
> +			err = drm_exec_prepare_obj(exec, &bo->ttm.base,
> +						   num_resv);
> +			drm_exec_continue_on_contention(exec);
> +			if (err && err != -EALREADY)
> +				goto out_err;
> +		}
> +	}
> +
> +	return 0;
> +
> +out_err:
> +	drm_exec_fini(exec);
> +	return err;
> +}
> +
> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		     bool lru_update)
> +{
> +	if (lru_update && bo && (!bo->vm || xe_vm_no_dma_fences(vm)))
> +		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
> +	drm_exec_fini(exec);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index f279fa622260..47b981d9fc04 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -12,6 +12,7 @@
>   #include "xe_vm_types.h"
>   
>   struct drm_device;
> +struct drm_exec;
>   struct drm_printer;
>   struct drm_file;
>   
> @@ -38,10 +39,14 @@ static inline void xe_vm_put(struct xe_vm *vm)
>   	kref_put(&vm->refcount, xe_vm_free);
>   }
>   
> -int xe_vm_lock(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> +int xe_vm_lock(struct xe_vm *vm, struct drm_exec *exec,
>   	       int num_resv, bool intr);
> +void xe_vm_unlock(struct xe_vm *vm, struct drm_exec *exec);
>   
> -void xe_vm_unlock(struct xe_vm *vm, struct ww_acquire_ctx *ww);
> +int xe_vm_bo_lock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		  int num_resv, bool intr);
> +void xe_vm_bo_unlock(struct xe_vm *vm, struct xe_bo *bo, struct drm_exec *exec,
> +		     bool lru_update);
>   
>   static inline bool xe_vm_is_closed(struct xe_vm *vm)
>   {
> @@ -219,23 +224,9 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>   
>   int xe_vma_userptr_check_repin(struct xe_vma *vma);
>   
> -/*
> - * XE_ONSTACK_TV is used to size the tv_onstack array that is input
> - * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
> - */
> -#define XE_ONSTACK_TV 20
> -int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
> -			struct ttm_validate_buffer *tv_onstack,
> -			struct ttm_validate_buffer **tv,
> -			struct list_head *objs,
> -			bool intr,
> +int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec, bool intr,
>   			unsigned int num_shared);
> -
> -void xe_vm_unlock_dma_resv(struct xe_vm *vm,
> -			   struct ttm_validate_buffer *tv_onstack,
> -			   struct ttm_validate_buffer *tv,
> -			   struct ww_acquire_ctx *ww,
> -			   struct list_head *objs);
> +void xe_vm_unlock_dma_resv(struct xe_vm *vm, struct drm_exec *exec);
>   
>   int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 03508645fa08..a68bc6fec1de 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/nospec.h>
>   
> +#include <drm/drm_exec.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/xe_drm.h>
>   
> @@ -28,16 +29,16 @@ static int madvise_preferred_mem_class(struct xe_device *xe, struct xe_vm *vm,
>   
>   	for (i = 0; i < num_vmas; ++i) {
>   		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		bo = xe_vma_bo(vmas[i]);
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return err;
>   		bo->props.preferred_mem_class = value;
>   		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   	}
>   
>   	return 0;
> @@ -53,16 +54,16 @@ static int madvise_preferred_gt(struct xe_device *xe, struct xe_vm *vm,
>   
>   	for (i = 0; i < num_vmas; ++i) {
>   		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		bo = xe_vma_bo(vmas[i]);
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return err;
>   		bo->props.preferred_gt = value;
>   		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   	}
>   
>   	return 0;
> @@ -89,17 +90,17 @@ static int madvise_preferred_mem_class_gt(struct xe_device *xe,
>   
>   	for (i = 0; i < num_vmas; ++i) {
>   		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		bo = xe_vma_bo(vmas[i]);
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return err;
>   		bo->props.preferred_mem_class = mem_class;
>   		bo->props.preferred_gt = gt_id;
>   		xe_bo_placement_for_flags(xe, bo, bo->flags);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   	}
>   
>   	return 0;
> @@ -112,13 +113,13 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>   
>   	for (i = 0; i < num_vmas; ++i) {
>   		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		bo = xe_vma_bo(vmas[i]);
>   		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)))
>   			return -EINVAL;
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return err;
>   		bo->props.cpu_atomic = !!value;
> @@ -130,7 +131,7 @@ static int madvise_cpu_atomic(struct xe_device *xe, struct xe_vm *vm,
>   		 */
>   		if (bo->props.cpu_atomic)
>   			ttm_bo_unmap_virtual(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   	}
>   
>   	return 0;
> @@ -143,18 +144,18 @@ static int madvise_device_atomic(struct xe_device *xe, struct xe_vm *vm,
>   
>   	for (i = 0; i < num_vmas; ++i) {
>   		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		bo = xe_vma_bo(vmas[i]);
>   		if (XE_IOCTL_ERR(xe, !(bo->flags & XE_BO_CREATE_VRAM0_BIT) &&
>   				 !(bo->flags & XE_BO_CREATE_VRAM1_BIT)))
>   			return -EINVAL;
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return err;
>   		bo->props.device_atomic = !!value;
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   	}
>   
>   	return 0;
> @@ -174,16 +175,16 @@ static int madvise_priority(struct xe_device *xe, struct xe_vm *vm,
>   
>   	for (i = 0; i < num_vmas; ++i) {
>   		struct xe_bo *bo;
> -		struct ww_acquire_ctx ww;
> +		struct drm_exec exec;
>   
>   		bo = xe_vma_bo(vmas[i]);
>   
> -		err = xe_bo_lock(bo, &ww, 0, true);
> +		err = xe_bo_lock(bo, &exec, 0, true);
>   		if (err)
>   			return err;
>   		bo->ttm.priority = value;
>   		ttm_bo_move_to_lru_tail(&bo->ttm);
> -		xe_bo_unlock(bo, &ww);
> +		xe_bo_unlock(bo, &exec);
>   	}
>   
>   	return 0;
> diff --git a/include/drm/drm_gpuva_mgr.h b/include/drm/drm_gpuva_mgr.h
> index 943c8fcda533..a2f6d90ac899 100644
> --- a/include/drm/drm_gpuva_mgr.h
> +++ b/include/drm/drm_gpuva_mgr.h
> @@ -32,6 +32,8 @@
>   #include <linux/spinlock.h>
>   #include <linux/types.h>
>   
> +#include <drm/drm_exec.h>
> +
>   struct drm_gpuva_manager;
>   struct drm_gpuva_fn_ops;
>   struct drm_gpuva_prealloc;
> @@ -169,9 +171,17 @@ struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuva_manager *mgr, u64 end);
>   
>   bool drm_gpuva_interval_empty(struct drm_gpuva_manager *mgr, u64 addr, u64 range);
>   
> -void drm_gpuva_add_fence(struct drm_gpuva_manager *mgr, struct dma_fence *fence,
> -			 enum dma_resv_usage private_usage,
> -			 enum dma_resv_usage extobj_usage);
> +int drm_gpuva_manager_lock(struct drm_gpuva_manager *mgr, struct drm_exec *exec,
> +			   struct drm_gem_object *mgr_obj, bool intr,
> +			   unsigned int num_fences);
> +void drm_gpuva_manager_unlock(struct drm_gpuva_manager *mgr,
> +			      struct drm_exec *exec);
> +
> +void drm_gpuva_manager_add_fence(struct drm_gpuva_manager *mgr,
> +				 struct drm_exec *exec,
> +				 struct dma_fence *fence,
> +				 enum dma_resv_usage private_usage,
> +				 enum dma_resv_usage extobj_usage);
>   
>   /**
>    * drm_gpuva_evict - sets whether the backing GEM of this &drm_gpuva is evicted
