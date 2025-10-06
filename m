Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F94ACCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 09:21:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40C110E0B1;
	Mon,  6 Oct 2025 09:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nx+w7GEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017ED10E0B1
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759742475; x=1791278475;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7/sbe+wn68odYYZUTAFiHrUWam1DgbpOJpJkxrOMyyM=;
 b=nx+w7GEW3S7B+Jprz+T+HQNM+CX/97dNAvL9lPTyhqYtYUDlMq7XUAKY
 VWZgabl2h5TzrM+eGRcYjpfVGehHlu8W8ojICC8OkKue8aK2u4yUW2bgv
 7z695itgHqjoPITyFGD4JF4kWjix1u2pSp01uplrKlmua47lqdlkOKEcd
 ddYFx9NNxqo++xPvYSntWj9dmYDSJeLZwzNq6YVkeWUOzrgCDcldalQrc
 GJp6llPUOdXaFO/+ldtftnpnjsRm+Ioi0kgP96dL/zfxmdJAVaG19AStW
 ISqjXKU13S1V/H/bC3Xtz5UU9FpdgssbLF6QswZdRr8S4j0S+iWLlV6MK g==;
X-CSE-ConnectionGUID: A6khVwsxTmax6wy5/+Vvtg==
X-CSE-MsgGUID: 2JLLL9pdTfiZi/8tlCy/3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="73013605"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="73013605"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:21:15 -0700
X-CSE-ConnectionGUID: e6rodQqnTeqXA/9FZQklMQ==
X-CSE-MsgGUID: qlXKpHa9T/e+Esft1LxhWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="203573846"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.52])
 ([10.245.245.52])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:21:13 -0700
Message-ID: <1d98010c-2348-4009-95d0-a305029d3f65@intel.com>
Date: Mon, 6 Oct 2025 10:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/xe: Add initial support for separate kernel
 VRAM region on the tile
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250922170707.1556781-1-piotr.piorkowski@intel.com>
 <20250922170707.1556781-2-piotr.piorkowski@intel.com>
 <38196129-26e3-46c1-aa5d-1a5cee11ccd9@intel.com>
 <20251003152159.lb5huif3f4vcwrrg@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251003152159.lb5huif3f4vcwrrg@intel.com>
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

On 03/10/2025 16:21, Piotr Piórkowski wrote:
> Matthew Auld <matthew.auld@intel.com> wrote on pią [2025-paź-03 12:15:39 +0100]:
>> On 22/09/2025 18:07, Piórkowski, Piotr wrote:
>>> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>>
>>> So far, kernel and userspace allocations have shared the same VRAM region.
>>> However, in some scenarios, it may be necessary to reserve a separate
>>> VRAM area exclusively for kernel allocations.
>>> Let's add preliminary support for such a configuration.
>>>
>>> v2:
>>> - replaced for_each_bo_flag_vram with the improved
>>>     for_each_set_bo_vram_flag helper (Matthew)
>>> - moved the VRAM flag iteration macro definition into xe_bo.c (Matthew)
>>> - drop unused bo_flgas from bo_vram_flags_to_vram_placement (Matthew)
>>> - use hweight32 helper in __xe_bo_fixed_placement for readability
>>>     (Matthew)
>>> v3: remove unnecessary VRAM fixup id
>>>
>>> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_bo.c           | 78 +++++++++++++++++++---------
>>>    drivers/gpu/drm/xe/xe_bo.h           |  2 +-
>>>    drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
>>>    drivers/gpu/drm/xe/xe_tile.c         |  8 +++
>>>    drivers/gpu/drm/xe/xe_tile.h         |  5 ++
>>>    drivers/gpu/drm/xe/xe_vram.c         |  6 ++-
>>>    6 files changed, 81 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index edc6e29f0cc1..0fe7ce1f15f3 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -34,6 +34,7 @@
>>>    #include "xe_res_cursor.h"
>>>    #include "xe_shrinker.h"
>>>    #include "xe_sriov_vf_ccs.h"
>>> +#include "xe_tile.h"
>>>    #include "xe_trace_bo.h"
>>>    #include "xe_ttm_stolen_mgr.h"
>>>    #include "xe_vm.h"
>>> @@ -81,6 +82,10 @@ static struct ttm_placement tt_placement = {
>>>    	.placement = tt_placement_flags,
>>>    };
>>> +#define for_each_set_bo_vram_flag(bit__, bo_flags__) \
>>> +	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
>>> +		for_each_if(((bit__) = __bit_tmp) & (bo_flags__) & XE_BO_FLAG_VRAM_MASK)
>>> +
>>>    bool mem_type_is_vram(u32 mem_type)
>>>    {
>>>    	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
>>> @@ -213,6 +218,27 @@ static bool force_contiguous(u32 bo_flags)
>>>    	       bo_flags & XE_BO_FLAG_PINNED;
>>>    }
>>> +static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
>>> +{
>>> +	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
>>> +	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
>>> +
>>> +	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
>>> +}
>>> +
>>> +static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
>>> +					   enum ttm_bo_type type)
>>> +{
>>> +	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
>>> +
>>> +	xe_assert(xe, tile_id < xe->info.tile_count);
>>> +
>>> +	if (type == ttm_bo_type_kernel)
>>> +		return xe->tiles[tile_id].mem.kernel_vram->placement;
>>> +	else
>>> +		return xe->tiles[tile_id].mem.vram->placement;
>>> +}
>>> +
>>>    static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>>>    		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>>>    {
>>> @@ -245,12 +271,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>>>    }
>>>    static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
>>> -			 u32 bo_flags, u32 *c)
>>> +			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
>>>    {
>>> -	if (bo_flags & XE_BO_FLAG_VRAM0)
>>> -		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
>>> -	if (bo_flags & XE_BO_FLAG_VRAM1)
>>> -		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
>>> +	u32 vram_flag;
>>> +
>>> +	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
>>> +		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
>>> +
>>> +		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
>>> +	}
>>>    }
>>>    static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>>> @@ -269,11 +298,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>>>    }
>>>    static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>>> -				       u32 bo_flags)
>>> +				       u32 bo_flags, enum ttm_bo_type type)
>>>    {
>>>    	u32 c = 0;
>>> -	try_add_vram(xe, bo, bo_flags, &c);
>>> +	try_add_vram(xe, bo, bo_flags, type, &c);
>>>    	try_add_system(xe, bo, bo_flags, &c);
>>>    	try_add_stolen(xe, bo, bo_flags, &c);
>>> @@ -289,10 +318,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>>>    }
>>>    int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>>> -			      u32 bo_flags)
>>> +			      u32 bo_flags, enum ttm_bo_type type)
>>>    {
>>>    	xe_bo_assert_held(bo);
>>> -	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
>>> +	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
>>>    }
>>>    static void xe_evict_flags(struct ttm_buffer_object *tbo,
>>> @@ -2152,7 +2181,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>>>    	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
>>>    	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
>>> -		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
>>> +		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
>>>    		if (WARN_ON(err)) {
>>>    			xe_ttm_bo_destroy(&bo->ttm);
>>>    			return ERR_PTR(err);
>>> @@ -2210,34 +2239,33 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>>>    }
>>>    static int __xe_bo_fixed_placement(struct xe_device *xe,
>>> -				   struct xe_bo *bo,
>>> +				   struct xe_bo *bo, enum ttm_bo_type type,
>>>    				   u32 flags,
>>>    				   u64 start, u64 end, u64 size)
>>>    {
>>>    	struct ttm_place *place = bo->placements;
>>> +	u32 vram_flag, vram_stolen_flags;
>>>    	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
>>>    		return -EINVAL;
>>> +	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
>>> +	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
>>
>> Nit: Can drop the extra parens around XE_BO_FLAG_STOLEN?
> 
> drivers/gpu/drm/xe/xe_bo.c:2266:35: error: suggest parentheses around arithmetic in operand of ‘|’ [-Werror=parentheses]
>   2266 |         vram_stolen_flags = flags & (XE_BO_FLAG_STOLEN) | vram_flag;
> 
> The compiler doesn't like it.

I was thinking like this:

(flags & XE_BO_FLAG_STOLEN) | vram_flag;

So no need for (XE_BO_FLAG_STOLEN), which makes it slightly harder to 
read. Anyway, doesn't really matter.

>>
>>> +
>>> +	/* check if more than one VRAM/STOLEN flag is set */
>>> +	if (hweight32(vram_stolen_flags) > 1)
>>> +		return -EINVAL;
>>> +
>>>    	place->flags = TTM_PL_FLAG_CONTIGUOUS;
>>>    	place->fpfn = start >> PAGE_SHIFT;
>>>    	place->lpfn = end >> PAGE_SHIFT;
>>> -	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
>>> -	case XE_BO_FLAG_VRAM0:
>>> -		place->mem_type = XE_PL_VRAM0;
>>> -		break;
>>> -	case XE_BO_FLAG_VRAM1:
>>> -		place->mem_type = XE_PL_VRAM1;
>>> -		break;
>>> -	case XE_BO_FLAG_STOLEN:
>>> +	if (flags & XE_BO_FLAG_STOLEN)
>>>    		place->mem_type = XE_PL_STOLEN;
>>> -		break;
>>> -
>>> -	default:
>>> -		/* 0 or multiple of the above set */
>>> +	else if (vram_flag)
>>> +		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
>>> +	else
>>>    		return -EINVAL;
>>
>> Nit: I think we can drop the else here, since we already checked this
>> condition above? Or drop the check above and rely on this?
> 
> Okay, I'll remove that return from else.
> 
>>
>>> -	}
>>>    	bo->placement = (struct ttm_placement) {
>>>    		.num_placement = 1,
>>> @@ -2266,7 +2294,7 @@ __xe_bo_create_locked(struct xe_device *xe,
>>>    			return bo;
>>>    		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
>>> -		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
>>> +		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
>>>    		if (err) {
>>>    			xe_bo_free(bo);
>>>    			return ERR_PTR(err);
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>> index a77af42b5f9e..9a8401300b15 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>>> @@ -122,7 +122,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
>>>    int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
>>>    int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>>> -			      u32 bo_flags);
>>> +			      u32 bo_flags, enum ttm_bo_type type);
>>>    static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
>>>    {
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index a6c361db11d9..621aa0ab3de3 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -158,7 +158,15 @@ struct xe_tile {
>>>    	/** @mem: memory management info for tile */
>>>    	struct {
>>>    		/**
>>> -		 * @mem.vram: VRAM info for tile.
>>> +		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
>>> +		 *
>>> +		 * Although VRAM is associated with a specific tile, it can
>>> +		 * still be accessed by all tiles' GTs.
>>> +		 */
>>> +		struct xe_vram_region *kernel_vram;
>>> +
>>> +		/**
>>> +		 * @mem.vram: general purpose VRAM info for tile.
>>>    		 *
>>>    		 * Although VRAM is associated with a specific tile, it can
>>>    		 * still be accessed by all tiles' GTs.
>>> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>>> index d49ba3401963..6edb5062c1da 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile.c
>>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>>> @@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
>>>    		return -ENOMEM;
>>>    	tile->mem.vram = vram;
>>> +	/*
>>> +	 * If the kernel_vram is not already allocated,
>>> +	 * it means that tile has common VRAM region for
>>> +	 * kernel and user space.
>>> +	 */
>>> +	if (!tile->mem.kernel_vram)
>>> +		tile->mem.kernel_vram = tile->mem.vram;
>>> +
>>>    	return 0;
>>>    }
>>> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
>>> index dceb6297aa01..5d834378b354 100644
>>> --- a/drivers/gpu/drm/xe/xe_tile.h
>>> +++ b/drivers/gpu/drm/xe/xe_tile.h
>>> @@ -23,4 +23,9 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
>>>    	return tile->id == 0;
>>>    }
>>> +static inline bool xe_tile_has_separate_kernel_vram(const struct xe_tile *tile)
>>> +{
>>> +	return tile->mem.vram != tile->mem.kernel_vram;
>>> +}
>>
>> Nothing seems use this helper AFAICT?
> 
> I think I'll use this later, but I can move it to the patch with usage.
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
> 
> Thanks, for review!
> Piotr
>>> +
>>>    #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>>> index b44ebf50fedb..7adfccf68e4c 100644
>>> --- a/drivers/gpu/drm/xe/xe_vram.c
>>> +++ b/drivers/gpu/drm/xe/xe_vram.c
>>> @@ -13,6 +13,7 @@
>>>    #include "regs/xe_gt_regs.h"
>>>    #include "regs/xe_regs.h"
>>>    #include "xe_assert.h"
>>> +#include "xe_bo.h"
>>>    #include "xe_device.h"
>>>    #include "xe_force_wake.h"
>>>    #include "xe_gt_mcr.h"
>>> @@ -283,8 +284,11 @@ static void vram_fini(void *arg)
>>>    	xe->mem.vram->mapping = NULL;
>>> -	for_each_tile(tile, xe, id)
>>> +	for_each_tile(tile, xe, id) {
>>>    		tile->mem.vram->mapping = NULL;
>>> +		if (tile->mem.kernel_vram)
>>> +			tile->mem.kernel_vram->mapping = NULL;
>>> +	}
>>>    }
>>>    struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
>>
> 

