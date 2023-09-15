Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C3FEE642F
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 07:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E534F10E168;
	Fri, 15 Sep 2023 07:37:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8927C10E168
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694763441; x=1726299441;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=n0Qt3V2RoJfd1qMGL09A3ZnzaMsywz2fyouAPkPQvoU=;
 b=KH8vKx8h/7SqlAl0d8+VAw/yrXNjZ6K4ofRBE7Vtk7MzJ73qCob6YZY+
 MoOeUKXU0ML2lHtK8V4MsW0yQglGrmFQ/7jo5sWwO13SWT65ZQ5I2c13j
 qXTg8AsRMLxBwLc/WX/HbJNBmNYJ6WuvAQwKOLg/CFfp7rf9DHm5LKCI4
 mpFHY1lnaV9ZpfWonRhKyguSyXpLF8HVW7FSMjanXC19EPImeP/LxMD7Z
 NRHEjMRf27dLJ9jgmeuh4PEGEHRWV/jArRUZ8x/pZG9TMJ0ksD/NLW/VD
 K+DADnxfiudTb8nYzhYILZqstAJy5TbTHpNLKl6Or69mYnhRuqyc1aiVN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358598754"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="358598754"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:37:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918562741"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000"; d="scan'208";a="918562741"
Received: from sfaughnx-mobl.ger.corp.intel.com (HELO [10.252.9.88])
 ([10.252.9.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:37:18 -0700
Message-ID: <bbe242aa-fa35-13a1-3f46-edbf8536e66f@intel.com>
Date: Fri, 15 Sep 2023 08:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <20230914153112.455547-9-matthew.auld@intel.com>
 <20230914234702.GW2706891@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230914234702.GW2706891@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe/uapi: Add support for cache
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
Cc: Effie Yu <effie.yu@intel.com>, Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 15/09/2023 00:47, Matt Roper wrote:
> On Thu, Sep 14, 2023 at 04:31:14PM +0100, Matthew Auld wrote:
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
>> index 27726d4f3423..f3facd788f15 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -325,7 +325,7 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>   	struct xe_device *xe = xe_bo_device(bo);
>>   	struct xe_ttm_tt *tt;
>>   	unsigned long extra_pages;
>> -	enum ttm_caching caching = ttm_cached;
>> +	enum ttm_caching caching;
>>   	int err;
>>   
>>   	tt = kzalloc(sizeof(*tt), GFP_KERNEL);
>> @@ -339,13 +339,25 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
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
> 
> Is this change just so that we'll honor XE_GEM_CPU_CACHING_UC rather
> than promoting to WC?  More questions about that farther down...

smem_cpu_caching is sometimes left as zero, like for kernel internal 
object and maybe some other places, so we just pick WB if not set, 
unless there was XE_BO_SCANOUT_BIT. For example initial-fb is allocated 
by KMD with XE_BO_SCANOUT_BIT.

> 
> It seems farther down we're allowing CPU:WB for scanout on dgpu.  Is
> that safe?  I thought display was non-coherent with the CPU cache no
> matter what the GT-side coherency situation was.  Assuming it is safe,
> then the first part of the comment above this block is no longer
> accurate.

Userspace sometimes like to do VRAM + SMEM. On dgpu you can only scanout 
from VRAM, such that prior to the scanout it will force migrate to VRAM, 
if required. So no actual scanout on dgpu can happen with smem, and so 
there shouldn't be any non-coherent display access. That was at least my 
thinking.

> 
>>   	    (xe->info.graphics_verx100 >= 1270 && bo->flags & XE_BO_PAGETABLE))
>>   		caching = ttm_write_combined;
>>   
>> @@ -1184,9 +1196,10 @@ void xe_bo_free(struct xe_bo *bo)
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
>> @@ -1224,6 +1237,8 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   	bo->tile = tile;
>>   	bo->size = size;
>>   	bo->flags = flags;
>> +	bo->smem_cpu_caching = smem_cpu_caching;
>> +	bo->coh_mode = coh_mode;
>>   	bo->ttm.base.funcs = &xe_gem_object_funcs;
>>   	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
>>   	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
>> @@ -1307,10 +1322,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
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
>> @@ -1331,10 +1347,11 @@ xe_bo_create_locked_range(struct xe_device *xe,
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
>> @@ -1368,11 +1385,35 @@ xe_bo_create_locked_range(struct xe_device *xe,
>>   	return ERR_PTR(err);
>>   }
>>   
>> +struct xe_bo *
>> +xe_bo_create_locked_range(struct xe_device *xe,
>> +			  struct xe_tile *tile, struct xe_vm *vm,
>> +			  size_t size, u64 start, u64 end,
>> +			  enum ttm_bo_type type, u32 flags)
>> +{
>> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);
> 
> It's a bit hard to keep track of all these wrappers, but I think this
> one gets used via
> 
>    initial_plane_bo -> xe_bo_create_pin_map_at -> xe_bo_create_locked_range
> 
> right?  For that path, wouldn't we want XE_GEM_CPU_CACHING_WC for the
> the smem_caching?

Right, that's the reason for the smem_cpu_caching == 0 && SCANOUT check 
in xe_ttm_tt_create. I figured default policy for kernel objects is 
always WB, unless it's used for scanout. That at least matches the 
current behaviour I think.

> 
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
>> @@ -1755,11 +1796,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
>> @@ -1801,6 +1842,32 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>   	}
>>   
>> +	if (XE_IOCTL_DBG(xe, args->coh_mode > XE_GEM_COH_AT_LEAST_1WAY))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->smem_cpu_caching > XE_GEM_CPU_CACHING_UC))
>> +		return -EINVAL;
>> +
>> +	if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
>> +		if (XE_IOCTL_DBG(xe, !args->coh_mode))
>> +			return -EINVAL;
>> +
>> +		if (XE_IOCTL_DBG(xe, !args->smem_cpu_caching))
>> +			return -EINVAL;
>> +
>> +		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe) &&
>> +				 bo_flags & XE_BO_SCANOUT_BIT &&
>> +				 args->smem_cpu_caching == XE_GEM_CPU_CACHING_WB))
>> +			return -EINVAL;
> 
> This reminds me...do we have a check anywhere that rejects the
> combination (dgfx && scanout && smem)?  on dgpus, the scanout must
> always be in vram.

I think it is rejected in _xe_pin_fb_vma() when trying to migrate to 
VRAM0. If you didn't set VRAM as one of the placements it will fail, at 
least for userspace. But yeah, I guess would be good to also add some 
checks at gem_create.

> 
>> +
>> +		if (args->coh_mode == XE_GEM_COH_NONE) {
>> +			if (XE_IOCTL_DBG(xe, args->smem_cpu_caching == XE_GEM_CPU_CACHING_WB))
>> +				return -EINVAL;
>> +		}
>> +	} else if (XE_IOCTL_DBG(xe, args->smem_cpu_caching)) {
>> +		return -EINVAL;
> 
> Isn't this going to fail for dumb framebuffers?  In xe_bo_dumb_create()
> you always pass XE_GEM_CPU_CACHING_WC, which will be combined with a
> vram placement.

Ok, I guess better make it conditional on dgpu instead in 
xe_bo_dumb_create().

> 
> 
> BTW, is there any check for the ioctl being called with no placement
> (neither system nor vram bits set)?  What happens in that case?

It looks like it is checked with:

if (XE_IOCTL_DBG(xe, !(args->flags & xe->info.mem_region_mask)))
     return -EINVAL;

> 
>> +	}
>> +
>>   	if (args->vm_id) {
>>   		vm = xe_vm_lookup(xef, args->vm_id);
>>   		if (XE_IOCTL_DBG(xe, !vm))
>> @@ -1812,8 +1879,10 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
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
>> @@ -2105,10 +2174,12 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
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
>> index 4a68d869b3b5..4a0ee81fe598 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -81,9 +81,10 @@ struct sg_table;
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
>> index 2ea9ad423170..9bee220a6872 100644
>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>> @@ -68,6 +68,16 @@ struct xe_bo {
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
> 
> Would it be more accurate to say "CPU caching behavior requested by
> userspace" since in the end the caching actually used may be something
> different (especially if this value isn't filled by userspace).

Ok, will fix.

> 
>> +	 * userspace objects.
>> +	 */
>> +	u16 smem_cpu_caching;
>>   };
>>   
>>   #define intel_bo_to_drm_bo(bo) (&(bo)->ttm.base)
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index 09343b8b3e96..ac20dbc27a2b 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -200,8 +200,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
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
>> index 00d5cb4ef85e..737bb1d4c6f7 100644
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
> 
> I don't follow this last part.  The distinction between non-coherent vs
> 1-way coherent means the GPU does or does not snoop the CPU's caches.
> Whether the *GPU* caches ever contain smem data should be orthogonal?

The spec seems to be make that distinction. "Discrete GPUs do not 
support caching of system memory in the device. The coherency mode that 
is supported in discrete GPUs are the one-way coherency mode with no 
caching of system memory inside the discrete GPU". So wether you select 
none, 1way or 2way there should be no difference for system memory on 
dgpu, that's at least what I was trying to get accross.

> 
> I'm also not sure it's a good idea to state that dgpu's never cache
> system memory in the UAPI documentation.  That's true for the platforms
> we have today, but I don't think it's something that's guaranteed to be
> true forever.  I don't think there's a technical reason why a future
> dGPU couldn't start doing that?

Yes, it could in theory start doing that, or even caching VRAM on the 
CPU side. Should I tweak with "current platforms including xe2"? Or 
should I just remove? The motivation here is just to make clearer: "what 
do I pick for current dgpu, and does it matter?".

> 
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
> 
> As noted above, I'm not sure whether the scanout limitation is igpu-only
> or not.  Do you have a bspec reference that clarifies the behavior there?

I guess answered above. We only scanout from VRAM on dgpu, but you are 
free to select VRAM + SMEM.

> 
>> +	 *
>> +	 * XE_GEM_CPU_CACHING_WC: Allocate the pages as write-combined. This is
>> +	 * uncached. Any @coh_mode is permitted. Scanout surfaces should likely
>> +	 * use this.
>> +	 *
>> +	 * XE_GEM_CPU_CACHING_UC: Allocate the pages as uncached. Any @coh_mode
>> +	 * is permitted. Scanout surfaces are permitted to use this.
> 
> Is there any specific reason why userspace would need to request UC
> rather than WC?  They both effectively act like uncached access from a
> coherency point of view, but WC does some batching up of writes for
> efficiency.
> 
> If we don't have a solid usecase for CACHING_UC today, I'd suggest
> leaving it out for now.  We can always add it to the uapi in the future
> if there's a need for it, but it's much harder to go the other direction
> and remove it.

Yup agree, will drop.

> 
> 
> Matt
> 
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
>> -- 
>> 2.41.0
>>
> 
