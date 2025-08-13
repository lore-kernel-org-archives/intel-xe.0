Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39539C87FCF
	for <intel-xe@archiver.kernel.org>; Wed, 13 Aug 2025 16:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD4810E739;
	Wed, 13 Aug 2025 16:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Upx0bcln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2148F10E739
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Aug 2025 16:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755104036; x=1786640036;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+I6LaP9RBtA6PbTeNOYS8yH/2CPrQbYrhwTaHUJY2Ic=;
 b=Upx0bclnth9kdNMutuIW5hW6GEy18kG1EDO+Xgpw/C4K6bo4JONYowQ4
 /v132dot5bHevRGsHtcWUxIIxv7utCpb52S7hSNFWOal/iVmMZZm/byv+
 u7XBCiUl7M2H6/Rr5avIIPTRCesAOSIJZtSJ/ZTy5xmdL5QA0Yqe3oRCh
 nBpyusI28W7MvJ6lJCMo0546is4TBh2eEo8CzTSWndS4w3gWjzbdLzBdh
 ScAm7WNdKEFLBgVA9+ogBsXAHjGB99KPbBSW6pCMsBOIvYqfL3cGsvxLj
 IPF4aPGvCc4PD8B4TRhSDPGwZZ4i3YeUVJlomI0DY2sI1IJjNnbLFzOKg A==;
X-CSE-ConnectionGUID: Hqr/L7I9TGmDuQlxiVcEyg==
X-CSE-MsgGUID: L5hdb+4LT0mCD+etr07SNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="44986214"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="44986214"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 09:53:55 -0700
X-CSE-ConnectionGUID: toKxbMstSkOamyhmneaxAQ==
X-CSE-MsgGUID: k1oh2m0cT/iGf0OXmlNp1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="167321317"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.245.238])
 ([10.245.245.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 09:53:55 -0700
Message-ID: <9f8f4dde-ef35-4177-aa8a-f983bb89f369@intel.com>
Date: Wed, 13 Aug 2025 17:53:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] drm/xe: Add initial support for separate kernel
 VRAM region on the tile
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
 <20250718081752.630122-2-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250718081752.630122-2-piotr.piorkowski@intel.com>
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

On 18/07/2025 09:17, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> So far, kernel and userspace allocations have shared the same VRAM region.
> However, in some scenarios, it may be necessary to reserve a separate
> VRAM area exclusively for kernel allocations.
> Let's add preliminary support for such a configuration.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c           | 87 ++++++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_bo.h           |  6 +-
>   drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
>   drivers/gpu/drm/xe/xe_tile.c         |  8 +++
>   drivers/gpu/drm/xe/xe_tile.h         |  5 ++
>   drivers/gpu/drm/xe/xe_vram.c         |  6 +-
>   6 files changed, 94 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 00ce067d5fd3..12e899726534 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -33,6 +33,7 @@
>   #include "xe_pxp.h"
>   #include "xe_res_cursor.h"
>   #include "xe_shrinker.h"
> +#include "xe_tile.h"
>   #include "xe_trace_bo.h"
>   #include "xe_ttm_stolen_mgr.h"
>   #include "xe_vm.h"
> @@ -208,6 +209,27 @@ static bool force_contiguous(u32 bo_flags)
>   	       bo_flags & XE_BO_FLAG_PINNED;
>   }
>   
> +static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
> +{
> +	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
> +	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
> +
> +	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
> +}
> +
> +static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,

Do you need bo_flags?

> +					   enum ttm_bo_type type)
> +{
> +	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
> +
> +	xe_assert(xe, tile_id < xe->info.tile_count);
> +
> +	if (type == ttm_bo_type_kernel)
> +		return xe->tiles[tile_id].mem.kernel_vram->placement;
> +	else
> +		return xe->tiles[tile_id].mem.vram->placement;
> +}
> +
>   static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>   		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
>   {
> @@ -240,12 +262,17 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
>   }
>   
>   static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
> -			 u32 bo_flags, u32 *c)
> +			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
>   {
> -	if (bo_flags & XE_BO_FLAG_VRAM0)
> -		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
> -	if (bo_flags & XE_BO_FLAG_VRAM1)
> -		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
> +	u32 vram_flag;
> +
> +	for_each_bo_flag_vram(vram_flag) {
> +		if (bo_flags & vram_flag) {

Would it be more natural to fold this into the macro somehow?

for_each_set_bo_vram_flag(vram_flag, bo_flags)
       bo_vram_flags_to_vram_placement(xe, vram_flag, type);

> +			u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
> +
> +			add_vram(xe, bo, bo->placements, bo_flags, pl, c);
> +		}
> +	}
>   }
>   
>   static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
> @@ -264,11 +291,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
>   }
>   
>   static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> -				       u32 bo_flags)
> +				       u32 bo_flags, enum ttm_bo_type type)
>   {
>   	u32 c = 0;
>   
> -	try_add_vram(xe, bo, bo_flags, &c);
> +	try_add_vram(xe, bo, bo_flags, type, &c);
>   	try_add_system(xe, bo, bo_flags, &c);
>   	try_add_stolen(xe, bo, bo_flags, &c);
>   
> @@ -284,10 +311,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>   }
>   
>   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> -			      u32 bo_flags)
> +			      u32 bo_flags, enum ttm_bo_type type)
>   {
>   	xe_bo_assert_held(bo);
> -	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
> +	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
>   }
>   
>   static void xe_evict_flags(struct ttm_buffer_object *tbo,
> @@ -1895,7 +1922,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   	}
>   
>   	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
> -		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
> +		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
>   		if (WARN_ON(err)) {
>   			xe_ttm_bo_destroy(&bo->ttm);
>   			return ERR_PTR(err);
> @@ -1953,34 +1980,33 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   }
>   
>   static int __xe_bo_fixed_placement(struct xe_device *xe,
> -				   struct xe_bo *bo,
> +				   struct xe_bo *bo, enum ttm_bo_type type,
>   				   u32 flags,
>   				   u64 start, u64 end, u64 size)
>   {
>   	struct ttm_place *place = bo->placements;
> +	u32 vram_flag, vram_stolen_flags;
>   
>   	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
>   		return -EINVAL;
>   
> +	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
> +	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
> +
> +	/* check if more than one VRAM/STOLEN flag is set */
> +	if ((vram_stolen_flags & (vram_stolen_flags - 1)) != 0)

hweight32() > 1 is more readable here?

> +		return -EINVAL;
> +
>   	place->flags = TTM_PL_FLAG_CONTIGUOUS;
>   	place->fpfn = start >> PAGE_SHIFT;
>   	place->lpfn = end >> PAGE_SHIFT;
>   
> -	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
> -	case XE_BO_FLAG_VRAM0:
> -		place->mem_type = XE_PL_VRAM0;
> -		break;
> -	case XE_BO_FLAG_VRAM1:
> -		place->mem_type = XE_PL_VRAM1;
> -		break;
> -	case XE_BO_FLAG_STOLEN:
> +	if (flags & XE_BO_FLAG_STOLEN)
>   		place->mem_type = XE_PL_STOLEN;
> -		break;
> -
> -	default:
> -		/* 0 or multiple of the above set */
> +	else if (vram_flag)
> +		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
> +	else
>   		return -EINVAL;
> -	}
>   
>   	bo->placement = (struct ttm_placement) {
>   		.num_placement = 1,
> @@ -2003,13 +2029,24 @@ __xe_bo_create_locked(struct xe_device *xe,
>   	if (vm)
>   		xe_vm_assert_held(vm);
>   
> +	/*
> +	 * In the case of kernel allocations, if the tile has dedicated kernel
> +	 * VRAM region, and tile->id does not match to tile->vram_id, it means
> +	 * that we are using unified VRAM and we need fix VRAM BO flags.
> +	 */
> +	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
> +	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
> +		flags &= ~XE_BO_FLAG_VRAM_MASK;
> +		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
> +	}
> +
>   	if (start || end != ~0ULL) {
>   		bo = xe_bo_alloc();
>   		if (IS_ERR(bo))
>   			return bo;
>   
>   		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
> -		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
> +		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
>   		if (err) {
>   			xe_bo_free(bo);
>   			return ERR_PTR(err);
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8cce413b5235..dde8e0274ff2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -61,6 +61,10 @@
>   #define XE_BO_FLAG_GGTTx(tile) \
>   	(XE_BO_FLAG_GGTT0 << (tile)->id)
>   
> +#define for_each_bo_flag_vram(bit__) \
> +	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
> +		for_each_if(((bit__) = __bit_tmp) & XE_BO_FLAG_VRAM_MASK)

Should this be exported or can it be moved to .c?

> +
>   #define XE_PTE_SHIFT			12
>   #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
>   #define XE_PTE_MASK			(XE_PAGE_SIZE - 1)
> @@ -127,7 +131,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
>   int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
>   
>   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> -			      u32 bo_flags);
> +			      u32 bo_flags, enum ttm_bo_type type);
>   
>   static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index eb6105523f23..3a417305c1b8 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -155,7 +155,15 @@ struct xe_tile {
>   	/** @mem: memory management info for tile */
>   	struct {
>   		/**
> -		 * @mem.vram: VRAM info for tile.
> +		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
> +		 *
> +		 * Although VRAM is associated with a specific tile, it can
> +		 * still be accessed by all tiles' GTs.
> +		 */
> +		struct xe_vram_region *kernel_vram;
> +
> +		/**
> +		 * @mem.vram: general purpose VRAM info for tile.
>   		 *
>   		 * Although VRAM is associated with a specific tile, it can
>   		 * still be accessed by all tiles' GTs.
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 0be0a5c57ef4..a14f549effdd 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
>   		return PTR_ERR(vram);
>   	tile->mem.vram = vram;
>   
> +	/*
> +	 * If the kernel_vram is not already allocated,
> +	 * it means that tile has common VRAM region for
> +	 * kernel and user space.
> +	 */
> +	if (!tile->mem.kernel_vram)
> +		tile->mem.kernel_vram = tile->mem.vram;
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
> index dceb6297aa01..5d834378b354 100644
> --- a/drivers/gpu/drm/xe/xe_tile.h
> +++ b/drivers/gpu/drm/xe/xe_tile.h
> @@ -23,4 +23,9 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
>   	return tile->id == 0;
>   }
>   
> +static inline bool xe_tile_has_separate_kernel_vram(const struct xe_tile *tile)
> +{
> +	return tile->mem.vram != tile->mem.kernel_vram;
> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index b44ebf50fedb..7adfccf68e4c 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -13,6 +13,7 @@
>   #include "regs/xe_gt_regs.h"
>   #include "regs/xe_regs.h"
>   #include "xe_assert.h"
> +#include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_mcr.h"
> @@ -283,8 +284,11 @@ static void vram_fini(void *arg)
>   
>   	xe->mem.vram->mapping = NULL;
>   
> -	for_each_tile(tile, xe, id)
> +	for_each_tile(tile, xe, id) {
>   		tile->mem.vram->mapping = NULL;
> +		if (tile->mem.kernel_vram)
> +			tile->mem.kernel_vram->mapping = NULL;
> +	}
>   }
>   
>   struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)

