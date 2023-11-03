Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D1C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 08:52:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3015710E4EE;
	Fri,  3 Nov 2023 08:52:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CC610E4EE
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 08:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699001539; x=1730537539;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OwrBvrYNYRytXDWP9noS0pjzc40oLTckKVFIELaHmmY=;
 b=lG1MofzmBwT7fnlsWbT9IzFiOjzvAnquBfFNRbI6PKSdukpoyAHrXomd
 Zf7pIUYxLJizhtiH1qM9WahDZ/R6yNFw1EYlnMSNlSVEMml8cHbjcMtC1
 p7w87MMs26AaGFzp1jVqwTxrz69q/NCrDmcOlr6L12hUd6NusplZ9klgW
 ApC1I7hlZU/+J1vjZh65OUaumnMukawRioarC6FlfOYTrS3Z1Ziwh14VW
 uLirzewaJDE9woAJeeWk/ox0OpNwq0GdJG6YNoH22JwtfsUcUELfho5WT
 8ekwPh0ahvsrQUKe+Cxc7Or4nFH1Hww+4/Nfs40rjj8XRrFB4zZq+Hh1N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391775179"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="391775179"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 01:52:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="885161139"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="885161139"
Received: from dvlaghat-mobl.ger.corp.intel.com (HELO [10.252.3.192])
 ([10.252.3.192])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 01:52:16 -0700
Message-ID: <ff139661-d73c-2907-85e4-15af91d8e973@intel.com>
Date: Fri, 3 Nov 2023 08:52:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
To: "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231011162923.292025-5-matthew.auld@intel.com>
 <20231011162923.292025-6-matthew.auld@intel.com>
 <SA1PR11MB699167F1A9661865342554F292A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <SA1PR11MB699167F1A9661865342554F292A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v8 1/3] drm/xe/uapi: Add support for cache
 and coherency mode
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
Cc: "Xu, Zhengguo" <zhengguo.xu@intel.com>, "Hazubski,
 Filip" <filip.hazubski@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>, "Zhang, Carl" <carl.zhang@intel.com>, "Yu,
 Effie" <effie.yu@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 03/11/2023 02:41, Zeng, Oak wrote:
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Auld
>> Sent: Wednesday, October 11, 2023 12:29 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Hazubski, Filip <filip.hazubski@intel.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>; Zhang, Carl <carl.zhang@intel.com>; Yu, Effie
>> <effie.yu@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: [Intel-xe] [PATCH v8 1/3] drm/xe/uapi: Add support for cache and
>> coherency mode
>>
>> From: Pallavi Mishra <pallavi.mishra@intel.com>
>>
>> Allow userspace to specify the CPU caching mode to use in addition to
>> coherency modes during object creation. Modify gem create handler and
>> introduce xe_bo_create_user to replace xe_bo_create. In a later patch we
>> will support setting the pat_index as part of vm_bind, where expectation
>> is that the coherency mode extracted from the pat_index must match the
>> one set at object creation.
>>
>> v2
>>    - s/smem_caching/smem_cpu_caching/ and
>>      s/XE_GEM_CACHING/XE_GEM_CPU_CACHING/. (Matt Roper)
>>    - Drop COH_2WAY and just use COH_NONE + COH_AT_LEAST_1WAY; KMD mostly
>>      just cares that zeroing/swap-in can't be bypassed with the given
>>      smem_caching mode. (Matt Roper)
>>    - Fix broken range check for coh_mode and smem_cpu_caching and also
>>      don't use constant value, but the already defined macros. (José)
>>    - Prefer switch statement for smem_cpu_caching -> ttm_caching. (José)
>>    - Add note in kernel-doc for dgpu and coherency modes for system
>>      memory. (José)
>> v3 (José):
>>    - Make sure to reject coh_mode == 0 for VRAM-only.
>>    - Also make sure to actually pass along the (start, end) for
>>      __xe_bo_create_locked.
>> v4
>>    - Drop UC caching mode. Can be added back if we need it. (Matt Roper)
>>    - s/smem_cpu_caching/cpu_caching. Idea is that VRAM is always WC, but
>>      that is currently implicit and KMD controlled. Make it explicit in
>>      the uapi with the limitation that it currently must be WC. For VRAM
>>      + SYS objects userspace must now select WC. (José)
>>    - Make sure to initialize bo_flags. (José)
>> v5
>>    - Make to align with the other uapi and prefix uapi constants with
>>      DRM_ (José)
>> v6:
>>    - Make it clear that zero cpu_caching is only allowed for kernel
>>      objects. (José)
>>
>> Testcase: igt@xe_mmap@cpu-caching-coh
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Co-developed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>> Cc: Carl Zhang <carl.zhang@intel.com>
>> Cc: Effie Yu <effie.yu@intel.com>
>> Tested-by: José Roberto de Souza <jose.souza@intel.com>
>> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c       | 115 ++++++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_bo.h       |   9 +--
>>   drivers/gpu/drm/xe/xe_bo_types.h |  10 +++
>>   drivers/gpu/drm/xe/xe_dma_buf.c  |   5 +-
>>   include/uapi/drm/xe_drm.h        |  50 +++++++++++++-
>>   5 files changed, 156 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 61789c0e88fb..8ce7d16c918a 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -326,7 +326,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>> ttm_buffer_object *ttm_bo,
>>   	struct xe_device *xe = xe_bo_device(bo);
>>   	struct xe_ttm_tt *tt;
>>   	unsigned long extra_pages;
>> -	enum ttm_caching caching = ttm_cached;
>> +	enum ttm_caching caching;
>>   	int err;
>>
>>   	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
>> @@ -340,13 +340,24 @@ static struct ttm_tt *xe_ttm_tt_create(struct
>> ttm_buffer_object *ttm_bo,
>>   		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>>   					   PAGE_SIZE);
>>
>> +	switch (bo->cpu_caching) {
>> +	case DRM_XE_GEM_CPU_CACHING_WC:
>> +		caching = ttm_write_combined;
>> +		break;
>> +	default:
>> +		caching = ttm_cached;
>> +		break;
>> +	}
>> +
>> +	WARN_ON((bo->flags & XE_BO_CREATE_USER_BIT) && !bo->cpu_caching);
>> +
>>   	/*
>>   	 * Display scanout is always non-coherent with the CPU cache.
>>   	 *
>>   	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
>>   	 * require a CPU:WC mapping.
>>   	 */
>> -	if (bo->flags & XE_BO_SCANOUT_BIT ||
>> +	if ((!bo->cpu_caching && bo->flags & XE_BO_SCANOUT_BIT) ||
>>   	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
>>   		caching = ttm_write_combined;
>>
>> @@ -1190,10 +1201,11 @@ void xe_bo_free(struct xe_bo *bo)
>>   	kfree(bo);
>>   }
>>
>> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> -				    struct xe_tile *tile, struct dma_resv *resv,
>> -				    struct ttm_lru_bulk_move *bulk, size_t size,
>> -				    enum ttm_bo_type type, u32 flags)
>> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> +				     struct xe_tile *tile, struct dma_resv *resv,
>> +				     struct ttm_lru_bulk_move *bulk, size_t size,
>> +				     u16 cpu_caching, u16 coh_mode,
>> +				     enum ttm_bo_type type, u32 flags)
>>   {
>>   	struct ttm_operation_ctx ctx = {
>>   		.interruptible = true,
>> @@ -1231,6 +1243,8 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device
>> *xe, struct xe_bo *bo,
>>   	bo->tile = tile;
>>   	bo->size = size;
>>   	bo->flags = flags;
>> +	bo->cpu_caching = cpu_caching;
>> +	bo->coh_mode = coh_mode;
>>   	bo->ttm.base.funcs = &xe_gem_object_funcs;
>>   	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
>>   	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
>> @@ -1315,11 +1329,12 @@ static int __xe_bo_fixed_placement(struct xe_device
>> *xe,
>>   	return 0;
>>   }
>>
>> -struct xe_bo *
>> -xe_bo_create_locked_range(struct xe_device *xe,
>> -			  struct xe_tile *tile, struct xe_vm *vm,
>> -			  size_t size, u64 start, u64 end,
>> -			  enum ttm_bo_type type, u32 flags)
>> +static struct xe_bo *
>> +__xe_bo_create_locked(struct xe_device *xe,
>> +		      struct xe_tile *tile, struct xe_vm *vm,
>> +		      size_t size, u64 start, u64 end,
>> +		      u16 cpu_caching, u16 coh_mode,
>> +		      enum ttm_bo_type type, u32 flags)
>>   {
>>   	struct xe_bo *bo = NULL;
>>   	int err;
>> @@ -1340,11 +1355,12 @@ xe_bo_create_locked_range(struct xe_device *xe,
>>   		}
>>   	}
>>
>> -	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>> -				   vm && !xe_vm_in_fault_mode(vm) &&
>> -				   flags & XE_BO_CREATE_USER_BIT ?
>> -				   &vm->lru_bulk_move : NULL, size,
>> -				   type, flags);
>> +	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>> +				    vm && !xe_vm_in_fault_mode(vm) &&
>> +				    flags & XE_BO_CREATE_USER_BIT ?
>> +				    &vm->lru_bulk_move : NULL, size,
>> +				    cpu_caching, coh_mode,
>> +				    type, flags);
>>   	if (IS_ERR(bo))
>>   		return bo;
>>
>> @@ -1377,11 +1393,35 @@ xe_bo_create_locked_range(struct xe_device *xe,
>>   	return ERR_PTR(err);
>>   }
>>
>> +struct xe_bo *
>> +xe_bo_create_locked_range(struct xe_device *xe,
>> +			  struct xe_tile *tile, struct xe_vm *vm,
>> +			  size_t size, u64 start, u64 end,
>> +			  enum ttm_bo_type type, u32 flags)
>> +{
>> +	return __xe_bo_create_locked(xe, tile, vm, size, start, end, 0, 0, type, flags);
>> +}
>> +
>>   struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>>   				  struct xe_vm *vm, size_t size,
>>   				  enum ttm_bo_type type, u32 flags)
>>   {
>> -	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
>> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);
>> +}
>> +
>> +static struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
>> +				       struct xe_vm *vm, size_t size,
>> +				       u16 cpu_caching, u16 coh_mode,
>> +				       enum ttm_bo_type type,
>> +				       u32 flags)
>> +{
>> +	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
>> +						 cpu_caching, coh_mode, type,
>> +						 flags | XE_BO_CREATE_USER_BIT);
>> +	if (!IS_ERR(bo))
>> +		xe_bo_unlock_vm_held(bo);
>> +
>> +	return bo;
>>   }
>>
>>   struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
>> @@ -1764,11 +1804,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void
>> *data,
>>   	struct drm_xe_gem_create *args = data;
>>   	struct xe_vm *vm = NULL;
>>   	struct xe_bo *bo;
>> -	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
>> +	unsigned int bo_flags;
>>   	u32 handle;
>>   	int err;
>>
>> -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
>> +	if (XE_IOCTL_DBG(xe, args->extensions) ||
>>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>   		return -EINVAL;
>>
>> @@ -1795,6 +1835,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void
>> *data,
>>   	if (XE_IOCTL_DBG(xe, args->size & ~PAGE_MASK))
>>   		return -EINVAL;
>>
>> +	bo_flags = 0;
>>   	if (args->flags & XE_GEM_CREATE_FLAG_DEFER_BACKING)
>>   		bo_flags |= XE_BO_DEFER_BACKING;
>>
>> @@ -1810,6 +1851,26 @@ int xe_gem_create_ioctl(struct drm_device *dev, void
>> *data,
>>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>   	}
>>
>> +	if (XE_IOCTL_DBG(xe, !args->coh_mode ||
>> +			 args->coh_mode > DRM_XE_GEM_COH_AT_LEAST_1WAY))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, !args->cpu_caching ||
>> +			 args->cpu_caching > DRM_XE_GEM_CPU_CACHING_WC))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_CREATE_VRAM_MASK &&
>> +			 args->cpu_caching != DRM_XE_GEM_CPU_CACHING_WC))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, bo_flags & XE_BO_SCANOUT_BIT &&
>> +			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->coh_mode == DRM_XE_GEM_COH_NONE &&
>> +			 args->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB))
>> +		return -EINVAL;
>> +
>>   	if (args->vm_id) {
>>   		vm = xe_vm_lookup(xef, args->vm_id);
>>   		if (XE_IOCTL_DBG(xe, !vm))
>> @@ -1821,8 +1882,10 @@ int xe_gem_create_ioctl(struct drm_device *dev, void
>> *data,
>>   		}
>>   	}
>>
>> -	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>> -			  bo_flags);
>> +	bo = xe_bo_create_user(xe, NULL, vm, args->size,
>> +			       args->cpu_caching, args->coh_mode,
>> +			       ttm_bo_type_device,
>> +			       bo_flags);
>>   	if (IS_ERR(bo)) {
>>   		err = PTR_ERR(bo);
>>   		goto out_vm;
>> @@ -2114,10 +2177,12 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>   	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>>   			   page_size);
>>
>> -	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
>> -
>> XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>> -			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
>> -			  XE_BO_NEEDS_CPU_ACCESS);
>> +	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>> +			       DRM_XE_GEM_CPU_CACHING_WC,
>> DRM_XE_GEM_COH_NONE,
>> +			       ttm_bo_type_device,
>> +
>> XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>> +			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
>> +			       XE_BO_NEEDS_CPU_ACCESS);
>>   	if (IS_ERR(bo))
>>   		return PTR_ERR(bo);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 78da28f4ea13..60a19e14937e 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -84,10 +84,11 @@ struct sg_table;
>>   struct xe_bo *xe_bo_alloc(void);
>>   void xe_bo_free(struct xe_bo *bo);
>>
>> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> -				    struct xe_tile *tile, struct dma_resv *resv,
>> -				    struct ttm_lru_bulk_move *bulk, size_t size,
>> -				    enum ttm_bo_type type, u32 flags);
>> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> +				     struct xe_tile *tile, struct dma_resv *resv,
>> +				     struct ttm_lru_bulk_move *bulk, size_t size,
>> +				     u16 cpu_caching, u16 coh_mode,
>> +				     enum ttm_bo_type type, u32 flags);
>>   struct xe_bo *
>>   xe_bo_create_locked_range(struct xe_device *xe,
>>   			  struct xe_tile *tile, struct xe_vm *vm,
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 051fe990c133..56f7f9a4975f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -76,6 +76,16 @@ struct xe_bo {
>>   	struct llist_node freed;
>>   	/** @created: Whether the bo has passed initial creation */
>>   	bool created;
>> +	/**
>> +	 * @coh_mode: Coherency setting. Currently only used for userspace
>> +	 * objects.
>> +	 */
>> +	u16 coh_mode;
>> +	/**
>> +	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>> +	 * objects.
>> +	 */
>> +	u16 cpu_caching;
>>   };
>>
>>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index cfde3be3b0dc..9da5cffeef13 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -214,8 +214,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo
>> *storage,
>>   	int ret;
>>
>>   	dma_resv_lock(resv, NULL);
>> -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
>> -				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>> +	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf-
>>> size,
>> +				    0, 0, /* Will require 1way or 2way for vm_bind */
>> +				    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>>   	if (IS_ERR(bo)) {
>>   		ret = PTR_ERR(bo);
>>   		goto error;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index d48d8e3c898c..ec4cdbc8d2bd 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -456,8 +456,54 @@ struct drm_xe_gem_create {
>>   	 */
>>   	__u32 handle;
>>
>> -	/** @pad: MBZ */
>> -	__u32 pad;
>> +	/**
>> +	 * @coh_mode: The coherency mode for this object. This will limit the
>> +	 * possible @cpu_caching values.
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * DRM_XE_GEM_COH_NONE: GPU access is assumed to be not coherent
>> with
>> +	 * CPU. CPU caches are not snooped.
>> +	 *
>> +	 * DRM_XE_GEM_COH_AT_LEAST_1WAY:
>> +	 *
>> +	 * CPU-GPU coherency must be at least 1WAY.
>> +	 *
>> +	 * If 1WAY then GPU access is coherent with CPU (CPU caches are snooped)
>> +	 * until GPU acquires. The acquire by the GPU is not tracked by CPU
>> +	 * caches.
>> +	 *
>> +	 * If 2WAY then should be fully coherent between GPU and CPU.  Fully
>> +	 * tracked by CPU caches. Both CPU and GPU caches are snooped.
>> +	 *
>> +	 * Note: On dgpu the GPU device never caches system memory. The device
>> +	 * should be thought of as always 1WAY coherent, with the addition that
>> +	 * the GPU never caches system memory. At least on current dgpu HW there
>> +	 * is no way to turn off snooping so likely the different coherency
>> +	 * modes of the pat_index make no difference for system memory.
>> +	 */
>> +#define DRM_XE_GEM_COH_NONE		1
>> +#define DRM_XE_GEM_COH_AT_LEAST_1WAY	2
>> +	__u16 coh_mode;
> 
> I wonder why you need a coh_mode at object create time. From the codes, you used this coh_mode parameter to check the cpu_caching parameter. And in patch 3 you use coh_mode to check the pat_index parameter.
> 
> So basically the coh_mode parameter is just used to validate other parameters. It is not used for CPU/GPU page table programming. In my opinion, those check are unnecessary. All interfaces provided to user should have some functional consequence, no just for parameter checking purpose. Isn't below scheme simpler:
> 
> Allow a cpu_caching mode for object create
> Allow a pat_index for vm bind
> Check pat_index to see whether it matches cpu_caching mode setting, i.e., if pat_index says 2-way coherence, cpu_caching shouldn't be wc.
> 
> Does this scheme work?

Yes, something like that should work. I think the main restriction is 
never allowing cpu_caching=wb with coh_none, and we can in thoery check 
for that at vm_bind. On the other hand having it fail at gem_create is a 
little nicer, plus the explicit coh_mode makes it clearer to userspace 
that we are talking about the coh_mode pat attribute in bspec, and that 
the vm_bind coh_mode(pat_index) must be at least as coherent. It's a bit 
of work to change at this point, but I think is maybe worth the 
simplification.

> 
> Oak
> 
> 
> 
> 
> 
> 
>> +
>> +	/**
>> +	 * @cpu_caching: The CPU caching mode to select for this object. If
>> +	 * mmaping the object the mode selected here will also be used.
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * DRM_XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back
>> caching.
>> +	 * On iGPU this can't be used for scanout surfaces. The @coh_mode must
>> +	 * be DRM_XE_GEM_COH_AT_LEAST_1WAY. Currently not allowed for
>> objects placed
>> +	 * in VRAM.
>> +	 *
>> +	 * DRM_XE_GEM_CPU_CACHING_WC: Allocate the pages as write-
>> combined. This is
>> +	 * uncached. Any @coh_mode is permitted. Scanout surfaces should likely
>> +	 * use this. All objects that can be placed in VRAM must use this.
>> +	 */
>> +#define DRM_XE_GEM_CPU_CACHING_WB                      1
>> +#define DRM_XE_GEM_CPU_CACHING_WC                      2
>> +	__u16 cpu_caching;
>>
>>   	/** @reserved: Reserved */
>>   	__u64 reserved[2];
>> --
>> 2.41.0
> 
