Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3875FE7D250
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 08:21:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7CB10E361;
	Tue, 26 Sep 2023 08:21:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6D710E361
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695716471; x=1727252471;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OuhPHMRsdMdOkNyQXpHereL/kY087YbgqtzlN1sfCU8=;
 b=I5dCb2rEJtSn1nTu67UuTSAj5nw5Qvw3BKjI4P6wF7DmYd/HB9iZbQMr
 VwCVgLRFje0n4Zk9f6zDeaUOb+p8l0Gmy165xuTbu47isdbDvKp+B+zPy
 /OpQ92SVz2ulx12nYqcNn5N0cfHwY7uQZcBdEvHNhoqUV/tTgu72cw/Io
 vt7mp+wMuf7u7ACAMBgpCb5YCHWwprbGYoIoBiuu/Irz/V6MA/tASLxA7
 wF9Is4E+fK8PEL1CW37vcq64pQiN4qF8hmPfexhSMwQh2TnyJUAvFAPmK
 1kv8nr4AzkAr3Ngn/eHKiMnEHFyRov0bhQym8iuDRtnOGNVm8/i0KUDwp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385362104"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="385362104"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:21:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698372834"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; d="scan'208";a="698372834"
Received: from respir1x-mobl1.ger.corp.intel.com (HELO [10.252.26.195])
 ([10.252.26.195])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 01:21:06 -0700
Message-ID: <67d532fa-2728-ec1b-0ecd-13ed8993b98e@intel.com>
Date: Tue, 26 Sep 2023 09:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: "Souza, Jose" <jose.souza@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230925132113.59900-9-matthew.auld@intel.com>
 <20230925132113.59900-10-matthew.auld@intel.com>
 <07f503196fccb3d6e005269821ad5055ee025d1f.camel@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <07f503196fccb3d6e005269821ad5055ee025d1f.camel@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v3 1/7] drm/xe/uapi: Add support for cache
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 25/09/2023 19:56, Souza, Jose wrote:
> On Mon, 2023-09-25 at 14:21 +0100, Matthew Auld wrote:
>> From: Pallavi Mishra <pallavi.mishra@intel.com>
>>
>> Allow userspace to specify the CPU caching mode to use for system memory
>> in addition to coherency modes during object creation. Modify gem create
>> handler and introduce xe_bo_create_user to replace xe_bo_create. In a
>> later patch we will support setting the pat_index as part of vm_bind,
>> where expectation is that the coherency mode extracted from the
>> pat_index must match the one set at object creation.
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
>>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Co-authored-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>> Cc: Carl Zhang <carl.zhang@intel.com>
>> Cc: Effie Yu <effie.yu@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c       | 105 ++++++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_bo.h       |   3 +-
>>   drivers/gpu/drm/xe/xe_bo_types.h |  10 +++
>>   drivers/gpu/drm/xe/xe_dma_buf.c  |   5 +-
>>   include/uapi/drm/xe_drm.h        |  57 ++++++++++++++++-
>>   5 files changed, 158 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 047eae071d03..f1ba0374901f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -326,7 +326,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>   	struct xe_device *xe = xe_bo_device(bo);
>>   	struct xe_ttm_tt *tt;
>>   	unsigned long extra_pages;
>> -	enum ttm_caching caching = ttm_cached;
>> +	enum ttm_caching caching;
>>   	int err;
>>   
>>   	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
>> @@ -340,13 +340,25 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>   		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>>   					   PAGE_SIZE);
>>   
>> +	switch (bo->smem_cpu_caching) {
>> +	case XE_GEM_CPU_CACHING_WC:
>> +		caching = ttm_write_combined;
>> +		break;
>> +	case XE_GEM_CPU_CACHING_UC:
>> +		caching = ttm_uncached;
>> +		break;
>> +	default:
>> +		caching = ttm_cached;
>> +		break;
>> +	}
>> +
>>   	/*
>>   	 * Display scanout is always non-coherent with the CPU cache.
>>   	 *
>>   	 * For Xe_LPG and beyond, PPGTT PTE lookups are also non-coherent and
>>   	 * require a CPU:WC mapping.
>>   	 */
>> -	if (bo->flags & XE_BO_SCANOUT_BIT ||
>> +	if ((!bo->smem_cpu_caching && bo->flags & XE_BO_SCANOUT_BIT) ||
>>   	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
>>   		caching = ttm_write_combined;
>>   
>> @@ -1190,9 +1202,10 @@ void xe_bo_free(struct xe_bo *bo)
>>   	kfree(bo);
>>   }
>>   
>> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   				    struct xe_tile *tile, struct dma_resv *resv,
>>   				    struct ttm_lru_bulk_move *bulk, size_t size,
>> +				    u16 smem_cpu_caching, u16 coh_mode,
>>   				    enum ttm_bo_type type, u32 flags)
>>   {
>>   	struct ttm_operation_ctx ctx = {
>> @@ -1230,6 +1243,8 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   	bo->tile = tile;
>>   	bo->size = size;
>>   	bo->flags = flags;
>> +	bo->smem_cpu_caching = smem_cpu_caching;
>> +	bo->coh_mode = coh_mode;
>>   	bo->ttm.base.funcs = &xe_gem_object_funcs;
>>   	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
>>   	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
>> @@ -1315,10 +1330,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
>>   }
>>   
>>   struct xe_bo *
>> -xe_bo_create_locked_range(struct xe_device *xe,
>> -			  struct xe_tile *tile, struct xe_vm *vm,
>> -			  size_t size, u64 start, u64 end,
>> -			  enum ttm_bo_type type, u32 flags)
>> +__xe_bo_create_locked(struct xe_device *xe,
>> +		      struct xe_tile *tile, struct xe_vm *vm,
>> +		      size_t size, u64 start, u64 end,
>> +		      u16 smem_cpu_caching, u16 coh_mode,
>> +		      enum ttm_bo_type type, u32 flags)
>>   {
>>   	struct xe_bo *bo = NULL;
>>   	int err;
>> @@ -1339,10 +1355,11 @@ xe_bo_create_locked_range(struct xe_device *xe,
>>   		}
>>   	}
>>   
>> -	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>> +	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>>   				   vm && !xe_vm_in_fault_mode(vm) &&
>>   				   flags & XE_BO_CREATE_USER_BIT ?
>>   				   &vm->lru_bulk_move : NULL, size,
>> +				   smem_cpu_caching, coh_mode,
>>   				   type, flags);
>>   	if (IS_ERR(bo))
>>   		return bo;
>> @@ -1376,11 +1393,35 @@ xe_bo_create_locked_range(struct xe_device *xe,
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
>> +				       u16 smem_cpu_caching, u16 coh_mode,
>> +				       enum ttm_bo_type type,
>> +				       u32 flags)
>> +{
>> +	struct xe_bo *bo = __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
>> +						 smem_cpu_caching, coh_mode, type,
>> +						 flags | XE_BO_CREATE_USER_BIT);
>> +	if (!IS_ERR(bo))
>> +		xe_bo_unlock_vm_held(bo);
>> +
>> +	return bo;
>>   }
>>   
>>   struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
>> @@ -1763,11 +1804,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   	struct drm_xe_gem_create *args = data;
>>   	struct xe_vm *vm = NULL;
>>   	struct xe_bo *bo;
>> -	unsigned int bo_flags = XE_BO_CREATE_USER_BIT;
>> +	unsigned int bo_flags;
> 
> bo_flags is not initialized then bits are set with or on it.

Thanks for catching. Will fix.

> 
>>   	u32 handle;
>>   	int err;
>>   
>> -	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
>> +	if (XE_IOCTL_DBG(xe, args->extensions) ||
>>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>>   		return -EINVAL;
>>   
>> @@ -1809,6 +1850,32 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>   	}
>>   
>> +	if (XE_IOCTL_DBG(xe, !args->coh_mode))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->coh_mode > XE_GEM_COH_AT_LEAST_1WAY))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->smem_cpu_caching > XE_GEM_CPU_CACHING_UC))
>> +		return -EINVAL;
>> +
>> +	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
>> +		if (XE_IOCTL_DBG(xe, !args->smem_cpu_caching))
>> +			return -EINVAL;
>> +
>> +		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe) &&
>> +				 bo_flags & XE_BO_SCANOUT_BIT &&
>> +				 args->smem_cpu_caching == XE_GEM_CPU_CACHING_WB))
>> +			return -EINVAL;
>> +
>> +		if (args->coh_mode == XE_GEM_COH_NONE) {
>> +			if (XE_IOCTL_DBG(xe, args->smem_cpu_caching == XE_GEM_CPU_CACHING_WB))
>> +				return -EINVAL;
>> +		}
>> +	} else if (XE_IOCTL_DBG(xe, args->smem_cpu_caching)) {
>> +		return -EINVAL;
>> +	}
> 
> still believe that smem_cpu_caching should != than 0 for lmem, please take a look at my reply in the previous version.
> 
>> +
>>   	if (args->vm_id) {
>>   		vm = xe_vm_lookup(xef, args->vm_id);
>>   		if (XE_IOCTL_DBG(xe, !vm))
>> @@ -1820,8 +1887,10 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   		}
>>   	}
>>   
>> -	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>> -			  bo_flags);
>> +	bo = xe_bo_create_user(xe, NULL, vm, args->size,
>> +			       args->smem_cpu_caching, args->coh_mode,
>> +			       ttm_bo_type_device,
>> +			       bo_flags);
>>   	if (IS_ERR(bo)) {
>>   		err = PTR_ERR(bo);
>>   		goto out_vm;
>> @@ -2113,10 +2182,12 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>   	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>>   			   page_size);
>>   
>> -	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
>> -			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>> -			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
>> -			  XE_BO_NEEDS_CPU_ACCESS);
>> +	bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>> +			       XE_GEM_CPU_CACHING_WC, XE_GEM_COH_NONE,
>> +			       ttm_bo_type_device,
>> +			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>> +			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
>> +			       XE_BO_NEEDS_CPU_ACCESS);
>>   	if (IS_ERR(bo))
>>   		return PTR_ERR(bo);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index e3c90d45e723..b3c7e33ed39a 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -83,9 +83,10 @@ struct sg_table;
>>   struct xe_bo *xe_bo_alloc(void);
>>   void xe_bo_free(struct xe_bo *bo);
>>   
>> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   				    struct xe_tile *tile, struct dma_resv *resv,
>>   				    struct ttm_lru_bulk_move *bulk, size_t size,
>> +				    u16 smem_cpu_caching, u16 coh_mode,
>>   				    enum ttm_bo_type type, u32 flags);
>>   struct xe_bo *
>>   xe_bo_create_locked_range(struct xe_device *xe,
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index 051fe990c133..d44ccacc683f 100644
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
>> +	 * @smem_cpu_caching: Caching mode for smem. Currently only used for
>> +	 * userspace objects.
>> +	 */
>> +	u16 smem_cpu_caching;
>>   };
>>   
>>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index cfde3be3b0dc..9da5cffeef13 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -214,8 +214,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
>>   	int ret;
>>   
>>   	dma_resv_lock(resv, NULL);
>> -	bo = __xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
>> -				   ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>> +	bo = ___xe_bo_create_locked(xe, storage, NULL, resv, NULL, dma_buf->size,
>> +				    0, 0, /* Will require 1way or 2way for vm_bind */
>> +				    ttm_bo_type_sg, XE_BO_CREATE_SYSTEM_BIT);
>>   	if (IS_ERR(bo)) {
>>   		ret = PTR_ERR(bo);
>>   		goto error;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index d48d8e3c898c..fc2016ebe102 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -456,8 +456,61 @@ struct drm_xe_gem_create {
>>   	 */
>>   	__u32 handle;
>>   
>> -	/** @pad: MBZ */
>> -	__u32 pad;
>> +	/**
>> +	 * @coh_mode: The coherency mode for this object. This will limit the
>> +	 * possible @smem_caching values.
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * XE_GEM_COH_NONE: GPU access is assumed to be not coherent with
>> +	 * CPU. CPU caches are not snooped.
>> +	 *
>> +	 * XE_GEM_COH_AT_LEAST_1WAY:
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
>> +	 * Note: On dgpu the GPU device never caches system memory (outside of
>> +	 * the special system-memory-read-only cache, which is anyway flushed by
>> +	 * KMD when nuking TLBs for a given object so should be no concern to
>> +	 * userspace). The device should be thought of as always 1WAY coherent,
>> +	 * with the addition that the GPU never caches system memory. At least
>> +	 * on current dgpu HW there is no way to turn off snooping so likely the
>> +	 * different coherency modes of the pat_index make no difference for
>> +	 * system memory.
>> +	 */
>> +#define XE_GEM_COH_NONE			1
>> +#define XE_GEM_COH_AT_LEAST_1WAY	2
>> +	__u16 coh_mode;
>> +
>> +	/**
>> +	 * @smem_cpu_caching: The CPU caching mode to select for system memory.
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * XE_GEM_CPU_CACHING_WB: Allocate the pages with write-back caching.
>> +	 * On iGPU this can't be used for scanout surfaces. The @coh_mode must
>> +	 * be XE_GEM_COH_AT_LEAST_1WAY.
>> +	 *
>> +	 * XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This is
>> +	 * uncached. Any @coh_mode is permitted. Scanout surfaces should likely
>> +	 * use this.
>> +	 *
>> +	 * XE_GEM_CPU_CACHING_UC: Allocate the pages as uncached. Any @coh_mode
>> +	 * is permitted. Scanout surfaces are permitted to use this.
>> +	 *
>> +	 * MUST be left as zero for VRAM-only objects.
>> +	 */
>> +#define XE_GEM_CPU_CACHING_WB                      1
>> +#define XE_GEM_CPU_CACHING_WC                      2
>> +#define XE_GEM_CPU_CACHING_UC                      3
>> +	__u16 smem_cpu_caching;
>>   
>>   	/** @reserved: Reserved */
>>   	__u64 reserved[2];
> 
