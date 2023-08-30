Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0E4C83F01
	for <intel-xe@archiver.kernel.org>; Wed, 30 Aug 2023 11:14:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C5110E4F7;
	Wed, 30 Aug 2023 11:14:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDD910E4F1
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Aug 2023 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693394042; x=1724930042;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ifYI39bkAqITWuoIAuTKgfxo4iQlEfRJquROAIkaUx0=;
 b=Q9d6eVWDDjGArHXT0nztq6rBSeDc0lZozUPLeow2EG5e5k6AtPWbcb/v
 PQ30QHZNK90EoHHLoaXpvFRJWhshdYJeQKW+xYvbRnT7x9/RdmxWK2tyO
 4t/YQ4BySNpXrN04kGmBep1nShEYXqIED8N3L1ESu98UQsW7GOy4MzulS
 hutBA00ai6xreBV6Ha4nAEBbQa4Gt1eTKPJM+L/LIywFFLvqdMuTNmsJ1
 9lxJpkN4XMWyzwL2KJ0Bg9YwWZBXDFyFWaBszgdg5JyaC5xkLxvqcPD+M
 zriOG0gbzw2snAKnsl29nIgu5f4IJw+abiHOm0HoMbZZDTLSYuxLB6C10 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="378329144"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="378329144"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="774084520"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="774084520"
Received: from mhanlon1-mobl.ger.corp.intel.com (HELO [10.252.22.82])
 ([10.252.22.82])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 04:13:58 -0700
Message-ID: <0c1835bd-7202-d0dd-1893-31f3905e18b2@intel.com>
Date: Wed, 30 Aug 2023 12:13:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Content-Language: en-GB
To: Matt Roper <matthew.d.roper@intel.com>
References: <20230829162840.73444-7-matthew.auld@intel.com>
 <20230829162840.73444-8-matthew.auld@intel.com>
 <20230829180942.GJ1529860@mdroper-desk1.amr.corp.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20230829180942.GJ1529860@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [RFC 1/5] drm/xe/uapi: Add support for cache and
 coherency mode
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
Cc: Filip Hazubski <filip.hazubski@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Carl Zhang <carl.zhang@intel.com>,
 Effie Yu <effie.yu@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 29/08/2023 19:09, Matt Roper wrote:
> On Tue, Aug 29, 2023 at 05:28:42PM +0100, Matthew Auld wrote:
>> From: Pallavi Mishra <pallavi.mishra@intel.com>
>>
>> Allow userspace to specify the CPU caching mode to use for system memory
>> in addition to coherency modes during object creation. Modify gem create
>> handler and introduce xe_bo_create_user to replace xe_bo_create. In a
>> later patch we will support setting the pat_index as part of vm_bind,
>> where expectation is that the coherency mode extracted from the
>> pat_index must match the one set at object creation.
> 
> Minor request:  can we add the word "cpu" to some of the fields and
> definitions?  Terms like WB and UC and such get used all over the place
> and it can get confusing when exactly we're talking about the the CPU
> cache behavior and when we're talking about the GPU cache behavior.
> Since this gets exposed via the uapi, it's best to be as explicit as
> possible.  E.g.,  "smem_cpu_caching" and "XE_GEM_CPU_CACHING_WB."

Ok, that seems fine to me. If no objections will tweak.

> 
> 
> It might be good to explain why we're defining coherency mode at object
> creation time instead of solely at vm_bind.  My understanding is that
> it's mainly so that we know whether it will be possible for userspace to
> pick a PAT that will bypass the CPU cache.  If they're able to do that,
> we need to clflush after clearing the buffer contents so that they can't
> potentially read old, stale data from memory.

AFAIK it mostly just prevents multiple bindings from mixing coherency 
modes for the same object. AFAIK that scenario was deemed to be avoided, 
and rather have it immutable at creation time. I think the flush will 
always happen if the pages are allocated on the CPU as WC/UC on x86.

> 
>>
>> Co-authored-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> 
> Nitpick:  As original author, Pallavi's s-o-b should come first, then
> your C-a-b, and then your s-o-b (which seems to be missing) right after
> it.

Oops, missed that. Will fix.

> 
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: José Roberto de Souza <jose.souza@intel.com>
>> Cc: Filip Hazubski <filip.hazubski@intel.com>
>> Cc: Carl Zhang <carl.zhang@intel.com>
>> Cc: Effie Yu <effie.yu@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c       | 95 +++++++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_bo.h       |  3 +-
>>   drivers/gpu/drm/xe/xe_bo_types.h | 10 ++++
>>   drivers/gpu/drm/xe/xe_dma_buf.c  |  5 +-
>>   include/uapi/drm/xe_drm.h        | 47 +++++++++++++++-
>>   5 files changed, 140 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 1ab682d61e3c..f60090fe8cd2 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -339,6 +339,15 @@ static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object *ttm_bo,
>>   		extra_pages = DIV_ROUND_UP(xe_device_ccs_bytes(xe, bo->size),
>>   					   PAGE_SIZE);
>>   
>> +	if (bo->smem_caching) {
>> +		if (bo->smem_caching == XE_GEM_CACHING_WB)
>> +			caching = ttm_cached;
>> +		else if (bo->smem_caching == XE_GEM_CACHING_WC)
>> +			caching = ttm_write_combined;
>> +		else if (bo->smem_caching == XE_GEM_CACHING_UC)
>> +			caching = ttm_uncached;
>> +	}
>> +
>>   	/*
>>   	 * Display scanout is always non-coherent with the CPU cache.
>>   	 *
>> @@ -1183,9 +1192,10 @@ void xe_bo_free(struct xe_bo *bo)
>>   	kfree(bo);
>>   }
>>   
>> -struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>> +struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   				    struct xe_tile *tile, struct dma_resv *resv,
>>   				    struct ttm_lru_bulk_move *bulk, size_t size,
>> +				    u16 smem_caching, u16 coh_mode,
>>   				    enum ttm_bo_type type, u32 flags)
>>   {
>>   	struct ttm_operation_ctx ctx = {
>> @@ -1223,6 +1233,8 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>>   	bo->tile = tile;
>>   	bo->size = size;
>>   	bo->flags = flags;
>> +	bo->smem_caching = smem_caching;
>> +	bo->coh_mode = coh_mode;
>>   	bo->ttm.base.funcs = &xe_gem_object_funcs;
>>   	bo->props.preferred_mem_class = XE_BO_PROPS_INVALID;
>>   	bo->props.preferred_gt = XE_BO_PROPS_INVALID;
>> @@ -1306,10 +1318,11 @@ static int __xe_bo_fixed_placement(struct xe_device *xe,
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
>> +		      u16 smem_caching, u16 coh_mode,
>> +		      enum ttm_bo_type type, u32 flags)
>>   {
>>   	struct xe_bo *bo = NULL;
>>   	int err;
>> @@ -1330,10 +1343,11 @@ xe_bo_create_locked_range(struct xe_device *xe,
>>   		}
>>   	}
>>   
>> -	bo = __xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>> +	bo = ___xe_bo_create_locked(xe, bo, tile, vm ? &vm->resv : NULL,
>>   				   vm && !xe_vm_in_fault_mode(vm) &&
>>   				   flags & XE_BO_CREATE_USER_BIT ?
>>   				   &vm->lru_bulk_move : NULL, size,
>> +				   smem_caching, coh_mode,
>>   				   type, flags);
>>   	if (IS_ERR(bo))
>>   		return bo;
>> @@ -1367,11 +1381,31 @@ xe_bo_create_locked_range(struct xe_device *xe,
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
>> +}
>> +
>>   struct xe_bo *xe_bo_create_locked(struct xe_device *xe, struct xe_tile *tile,
>>   				  struct xe_vm *vm, size_t size,
>>   				  enum ttm_bo_type type, u32 flags)
>>   {
>> -	return xe_bo_create_locked_range(xe, tile, vm, size, 0, ~0ULL, type, flags);
>> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL, 0, 0, type, flags);
> 
> It looks like xe_bo_create_locked() is only called from two tests now,
> right?  It's not obvious to me why caching=0, coh=0 is what we want for
> those tests?

AFAICT the bo test only applies to dgpu, it does use the ppGTT but that 
is via migrate vm stuff which I assume just uses 1way. I need to double 
check.

The other one also only uses the migration stuff and it should use 1way 
when encoding the PTEs. Hmm, actually emit_pte() looks like it now needs 
to use pat_index and the ->pte_encode().

> 
>> +}
>> +
>> +struct xe_bo *xe_bo_create_user(struct xe_device *xe, struct xe_tile *tile,
>> +				struct xe_vm *vm, size_t size,
>> +				enum ttm_bo_type type,
>> +				u16 smem_caching, u16 coh_mode,
>> +				u32 flags)
>> +{
>> +	return __xe_bo_create_locked(xe, tile, vm, size, 0, ~0ULL,
>> +				     smem_caching, coh_mode, type,
>> +				     flags | XE_BO_CREATE_USER_BIT);
>>   }
>>   
>>   struct xe_bo *xe_bo_create(struct xe_device *xe, struct xe_tile *tile,
>> @@ -1754,11 +1788,11 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   	struct ww_acquire_ctx ww;
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
>> @@ -1811,8 +1845,38 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>>   		bo_flags |= XE_BO_NEEDS_CPU_ACCESS;
>>   	}
>>   
>> -	bo = xe_bo_create(xe, NULL, vm, args->size, ttm_bo_type_device,
>> -			  bo_flags);
>> +	if (XE_IOCTL_DBG(xe, args->coh_mode > 2))
>> +		return -EINVAL;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->smem_caching > 2))
>> +		return -EINVAL;
>> +
>> +        if (bo_flags & XE_BO_CREATE_SYSTEM_BIT) {
> 
> Indentation whitespace looks wrong here (spaces where it should be
> tabs).

Yeah, not sure what happened here. Will fix.

> 
> 
> Matt
> 
>> +		if (XE_IOCTL_DBG(xe, !args->coh_mode))
>> +			return -EINVAL;
>> +
>> +		if (XE_IOCTL_DBG(xe, !args->smem_caching))
>> +			return -EINVAL;
>> +
>> +		if (XE_IOCTL_DBG(xe, !IS_DGFX(xe) &&
>> +				 bo_flags & XE_BO_SCANOUT_BIT &&
>> +				 args->smem_caching == XE_GEM_CACHING_WB))
>> +			return -EINVAL;
>> +
>> +		if (args->coh_mode == XE_GEM_COHERENCY_NONE) {
>> +			if (XE_IOCTL_DBG(xe, args->smem_caching == XE_GEM_CACHING_WB))
>> +				return -EINVAL;
>> +		} else if (args->coh_mode == XE_GEM_COHERENCY_2WAY) {
>> +			if (XE_IOCTL_DBG(xe, args->smem_caching != XE_GEM_CACHING_WB))
>> +				return -EINVAL;
>> +		}
>> +	} else if (XE_IOCTL_DBG(xe, args->smem_caching)) {
>> +		return -EINVAL;
>> +	}
>> +
>> +	bo = xe_bo_create_user(xe, NULL, vm, args->size,
>> +			       args->smem_caching, args->coh_mode,
>> +			       ttm_bo_type_device, bo_flags);
>>   	if (IS_ERR(bo)) {
>>   		err = PTR_ERR(bo);
>>   		goto out_vm;
>> @@ -2093,10 +2157,11 @@ int xe_bo_dumb_create(struct drm_file *file_priv,
>>   	args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>>   			   page_size);
>>   
>> -	bo = xe_bo_create(xe, NULL, NULL, args->size, ttm_bo_type_device,
>> -			  XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>> -			  XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
>> -			  XE_BO_NEEDS_CPU_ACCESS);
>> +	bo = xe_bo_create_user(xe, NULL, NULL, args->size, ttm_bo_type_device,
>> +			       XE_GEM_CACHING_WC, XE_GEM_COHERENCY_NONE,
>> +			       XE_BO_CREATE_VRAM_IF_DGFX(xe_device_get_root_tile(xe)) |
>> +			       XE_BO_CREATE_USER_BIT | XE_BO_SCANOUT_BIT |
>> +			       XE_BO_NEEDS_CPU_ACCESS);
>>   	if (IS_ERR(bo))
>>   		return PTR_ERR(bo);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 0823dda0f31b..2311ef3ffaf1 100644
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
>> +				    u16 smem_caching, u16 coh_mode,
>>   				    enum ttm_bo_type type, u32 flags);
>>   struct xe_bo *
>>   xe_bo_create_locked_range(struct xe_device *xe,
>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>> index f6ee920303af..a98ba5bed499 100644
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
>> +	 * @smem_caching: Caching mode for smem. Currently only used for
>> +	 * userspace objects.
>> +	 */
>> +	u16 smem_caching;
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
>> index 975dee1f770f..8ba7daf011bc 100644
>> --- a/drivers/gpu/drm/xe/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/xe_dma_buf.c
>> @@ -199,8 +199,9 @@ xe_dma_buf_init_obj(struct drm_device *dev, struct xe_bo *storage,
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
>> index 86f16d50e9cc..64bc66d4b550 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -461,8 +461,51 @@ struct drm_xe_gem_create {
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
>> +	 * XE_GEM_COHERENCY_NONE: GPU access is assumed to be not coherent with
>> +	 * CPU. CPU caches are not snooped.
>> +	 *
>> +	 * XE_GEM_COHERENCY_1WAY: GPU access is coherent with CPU (CPU caches
>> +	 * are snooped) until GPU acquires. The acquire by the GPU is not
>> +	 * tracked by CPU caches.
>> +	 *
>> +	 * XE_GEM_COHERENCY_2WAY: Fully coherent between GPU and CPU. Fully
>> +	 * tracked by CPU caches. Both CPU and GPU caches are snooped.
>> +	 */
>> +#define XE_GEM_COHERENCY_NONE                  1
>> +#define XE_GEM_COHERENCY_1WAY                  2
>> +#define XE_GEM_COHERENCY_2WAY                  3
>> +	__u16 coh_mode;
>> +
>> +	/**
>> +	 * @smem_caching: The CPU caching mode to select for system memory.
>> +	 *
>> +	 * Supported values:
>> +	 *
>> +	 * XE_GEM_CACHING_WB: Allocate the pages with write-back caching.  On
>> +	 * iGPU this can't be used for scanout surfaces. The @coh_mode must
>> +	 * either be XE_GEM_COHERENCY_1WAY or XE_GEM_COHERENCY_2WAY.
>> +	 *
>> +	 * XE_GEM_CACHING_WC: Allocate the pages as write-combined. This is
>> +	 * uncached. The @coh_mode must be XE_GEM_COHERENCY_NONE or
>> +	 * XE_GEM_COHERENCY_1WAY. Scanout surfaces should likely use this on
>> +	 * igpu.
>> +	 *
>> +	 * XE_GEM_CACHING_UC: Allocate the pages as uncached. The @coh_mode must
>> +	 * be XE_GEM_COHERENCY_NONE or XE_GEM_COHERENCY_1WAY. Scanout surfaces
>> +	 * are permitted to use this.
>> +	 *
>> +	 * MUST be left as zero for VRAM-only objects.
>> +	 */
>> +#define XE_GEM_CACHING_WB                      1
>> +#define XE_GEM_CACHING_WC                      2
>> +#define XE_GEM_CACHING_UC                      3
>> +	__u16 smem_caching;
>>   
>>   	/** @reserved: Reserved */
>>   	__u64 reserved[2];
>> -- 
>> 2.41.0
>>
> 
