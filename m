Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7881C83F03
	for <intel-xe@archiver.kernel.org>; Fri,  4 Jul 2025 08:41:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA9310E993;
	Fri,  4 Jul 2025 08:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmSMxjRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3DD10E993
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Jul 2025 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751618492; x=1783154492;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4CW1UO4iInE6y5RNJ/E312JsenjeJnroFS6XXIO+CTg=;
 b=gmSMxjRKWTXRoJ/W0ohwkR2mI0fUF3e+HDRJeCyjd3xNnJvYVwbMVgpA
 g3Ycjgts+Q13hKHPTbD+Im4ObX95uuZx6mEm1cB1FwXemKvsfw4shXYaj
 kM4LtRUBsGi8gWldU8WNXOwzFOhC+C8QZueoefjiWflhDv5pTjU5Hx/qN
 two0R//hEHlb8IcAt4shzr1i0r3DwtFMxWxVF6JxFAW+AocYGu0PYrUwP
 3mK51+wVmFO96c4Is1wJPnUcY7W6d7tNXGOAx/lgwsLtwVYCeeSVVy2qx
 utWBG5KkB9ONdyApUxjy2DDYMh0L416HqAGNJGFtAVmPynDwMBtKwhvKt Q==;
X-CSE-ConnectionGUID: 7YVRcwTNQVqR3CRkkqYUuA==
X-CSE-MsgGUID: fKloh18eS0+WQbdczudkXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54070546"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="54070546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:41:31 -0700
X-CSE-ConnectionGUID: fNgMwq5NS46sxb3EnwETIw==
X-CSE-MsgGUID: dSMEHUM/SQOo5o0uiwAToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="154674356"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.51])
 ([10.245.245.51])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:41:29 -0700
Message-ID: <28bc0b1e-c711-4c5d-879f-3aa310049400@intel.com>
Date: Fri, 4 Jul 2025 09:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] drm/xe: Unify the initialization of VRAM regions
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250702084424.3609863-1-piotr.piorkowski@intel.com>
 <20250702084424.3609863-5-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250702084424.3609863-5-piotr.piorkowski@intel.com>
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

On 02/07/2025 09:44, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Currently in the drivers we have defined VRAM regions per device and per
> tile. Initialization of these regions is done in two completely different
> ways. To simplify the logic of the code and make it easier to add new
> regions in the future, let's unify the way we initialize VRAM regions.
> 
> v2:
> - fix doc comments in struct xe_vram_region
> - remove unnecessary includes (Jani)
> v3:
> - move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
>    (Matthew)
> - replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
>    (Matthew)
> - Replace the tile id parameter with vram region in the xe_pf_begin
>    function.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
>   drivers/gpu/drm/xe/xe_query.c        |   3 +-
>   drivers/gpu/drm/xe/xe_tile.c         |  37 +++----
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
>   drivers/gpu/drm/xe/xe_vram.c         | 149 ++++++++++++++++-----------
>   drivers/gpu/drm/xe/xe_vram.h         |   2 +
>   drivers/gpu/drm/xe/xe_vram_types.h   |   8 ++
>   8 files changed, 134 insertions(+), 97 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 3522865c67c9..9cb50e0ed9f5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -23,6 +23,7 @@
>   #include "xe_svm.h"
>   #include "xe_trace_bo.h"
>   #include "xe_vm.h"
> +#include "xe_vram_types.h"
>   
>   struct pagefault {
>   	u64 page_addr;
> @@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
>   }
>   
>   static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
> -		       bool atomic, unsigned int id)
> +		       bool atomic, struct xe_vram_region *vram)
>   {
>   	struct xe_bo *bo = xe_vma_bo(vma);
>   	struct xe_vm *vm = xe_vma_vm(vma);
> @@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>   	if (err)
>   		return err;
>   
> -	if (atomic && IS_DGFX(vm->xe)) {
> +	if (atomic && vram) {
> +		xe_assert(vm->xe, IS_DGFX(vm->xe));
> +
>   		if (xe_vma_is_userptr(vma)) {
>   			err = -EACCES;
>   			return err;
>   		}
>   
>   		/* Migrate to VRAM, move should invalidate the VMA first */
> -		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
> +		err = xe_bo_migrate(bo, vram->placement);
>   		if (err)
>   			return err;
>   	} else if (bo) {
> @@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>   	/* Lock VM and BOs dma-resv */
>   	drm_exec_init(&exec, 0, 0);
>   	drm_exec_until_all_locked(&exec) {
> -		err = xe_pf_begin(&exec, vma, atomic, tile->id);
> +		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
>   		drm_exec_retry_on_contention(&exec);
>   		if (xe_vm_validate_should_retry(&exec, err, &end))
>   			err = -EAGAIN;
> @@ -572,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>   	/* Lock VM and BOs dma-resv */
>   	drm_exec_init(&exec, 0, 0);
>   	drm_exec_until_all_locked(&exec) {
> -		ret = xe_pf_begin(&exec, vma, true, tile->id);
> +		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
>   		drm_exec_retry_on_contention(&exec);
>   		if (ret)
>   			break;
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index ba9b7482605c..f02987753779 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -27,6 +27,7 @@
>   #include "xe_oa.h"
>   #include "xe_pxp.h"
>   #include "xe_ttm_vram_mgr.h"
> +#include "xe_vram_types.h"
>   #include "xe_wa.h"
>   
>   static const u16 xe_to_user_engine_class[] = {
> @@ -409,7 +410,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
>   			gt_list->gt_list[id].near_mem_regions = 0x1;
>   		else
>   			gt_list->gt_list[id].near_mem_regions =
> -				BIT(gt_to_tile(gt)->id) << 1;
> +				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
>   		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
>   			gt_list->gt_list[id].near_mem_regions;
>   
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index bd2ff91a7d1c..68b84111f26b 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -7,6 +7,7 @@
>   
>   #include <drm/drm_managed.h>
>   
> +#include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> @@ -114,11 +115,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
>   	if (!IS_DGFX(xe))
>   		return 0;
>   
> -	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
> -	if (!vram)
> -		return -ENOMEM;
> -
> -	vram->tile = tile;
> +	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
> +	if (IS_ERR(vram))
> +		return PTR_ERR(vram);
>   	tile->mem.vram = vram;
>   
>   	return 0;
> @@ -156,21 +155,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>   }
>   ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
>   
> -static int tile_ttm_mgr_init(struct xe_tile *tile)
> -{
> -	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	if (tile->mem.vram) {
> -		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
> -		if (err)
> -			return err;
> -		xe->info.mem_region_mask |= BIT(tile->id) << 1;
> -	}
> -
> -	return 0;
> -}
> -
>   /**
>    * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
>    * @tile: The tile to initialize.
> @@ -188,17 +172,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>   int xe_tile_init_noalloc(struct xe_tile *tile)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
> -	int err;
> -
> -	err = tile_ttm_mgr_init(tile);
> -	if (err)
> -		return err;
>   
>   	xe_wa_apply_tile_workarounds(tile);
>   
>   	if (xe->info.has_usm && IS_DGFX(xe))
>   		xe_devm_add(tile, tile->mem.vram);

Should we move this one below? It wants to interact with the vram, which 
is only fully setup below. I don't think there are any current issues, 
but perhaps less risky to keep existing behavior?

>   
> +	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
> +		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
> +
> +		if (err)
> +			return err;
> +		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
> +	}
> +
>   	return xe_tile_sysfs_init(tile);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 8f9b8a1d2c05..9175b4a2214b 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
>   }
>   
> -int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
> +/**
> + * xe_ttm_vram_mgr_init - initialize TTM VRAM region
> + * @xe: pointer to Xe device
> + * @vram: pointer to xe_vram_region that contains the memory region attributes
> + *
> + * Initialize the Xe TTM for given @vram region using the given parameters.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
>   {
> -	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_vram_region *vram = tile->mem.vram;
> -
> -	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
> +	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
>   				      xe_vram_region_usable_size(vram),
>   				      xe_vram_region_io_size(vram),
>   				      PAGE_SIZE);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index cc76050e376d..87b7fae5edba 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -11,11 +11,12 @@
>   enum dma_data_direction;
>   struct xe_device;
>   struct xe_tile;
> +struct xe_vram_region;
>   
>   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   			   u32 mem_type, u64 size, u64 io_size,
>   			   u64 default_page_size);
> -int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
> +int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
>   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
>   			      struct ttm_resource *res,
>   			      u64 offset, u64 length,
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 35fd7f5d7cff..002059b2dbdb 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -19,6 +19,7 @@
>   #include "xe_mmio.h"
>   #include "xe_module.h"
>   #include "xe_sriov.h"
> +#include "xe_ttm_vram_mgr.h"
>   #include "xe_vram.h"
>   #include "xe_vram_types.h"
>   
> @@ -137,7 +138,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
>   	return true;
>   }
>   
> -static int determine_lmem_bar_size(struct xe_device *xe)
> +static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>   
> @@ -148,17 +149,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
>   
>   	resize_vram_bar(xe);
>   
> -	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
> -	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
> -	if (!xe->mem.vram->io_size)
> +	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
> +	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
> +	if (!lmem_bar->io_size)
>   		return -EIO;
>   
>   	/* XXX: Need to change when xe link code is ready */
> -	xe->mem.vram->dpa_base = 0;
> +	lmem_bar->dpa_base = 0;
>   
>   	/* set up a map to the total memory area. */
> -	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
> -						xe->mem.vram->io_size);
> +	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
>   
>   	return 0;
>   }
> @@ -286,6 +286,65 @@ static void vram_fini(void *arg)
>   		tile->mem.vram->mapping = NULL;
>   }
>   
> +struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
> +{
> +	struct xe_vram_region *vram;
> +	struct drm_device *drm = &xe->drm;
> +
> +	xe_assert(xe, id < xe->info.tile_count);
> +
> +	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
> +	if (!vram)
> +		return NULL;
> +
> +	vram->id = id;
> +	vram->placement = placement;
> +	vram->tile = &xe->tiles[id];
> +
> +	return vram;
> +}
> +
> +static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
> +{
> +	struct drm_device *drm = &xe->drm;
> +
> +	if (vram->io_size < vram->usable_size)
> +		drm_info(drm, "Small BAR device\n");

Maybe move this out into the main loop and print once at the end? Seeing 
"Small BAR device" potentially more than once is odd?

> +
> +	drm_info(drm,
> +		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> +		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
> +	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> +		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
> +		 &vram->io_start, vram->io_start + (u64)vram->io_size);
> +}
> +
> +static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
> +			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
> +			    u64 region_size, resource_size_t remain_io_size)
> +{
> +	/* Check if VRAM region is already initialized */
> +	if (vram->mapping)
> +		return 0;
> +
> +	vram->actual_physical_size = region_size;
> +	vram->io_start = lmem_bar->io_start + offset;
> +	vram->io_size = min_t(u64, usable_size, remain_io_size);
> +
> +	if (!vram->io_size) {
> +		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +		return -ENODEV;
> +	}
> +
> +	vram->dpa_base = lmem_bar->dpa_base + offset;
> +	vram->mapping = lmem_bar->mapping + offset;
> +	vram->usable_size = usable_size;
> +
> +	print_vram_region_info(xe, vram);
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_vram_probe() - Probe VRAM configuration
>    * @xe: the &xe_device
> @@ -297,82 +356,52 @@ static void vram_fini(void *arg)
>   int xe_vram_probe(struct xe_device *xe)
>   {
>   	struct xe_tile *tile;
> -	resource_size_t io_size;
> +	struct xe_vram_region lmem_bar;
> +	resource_size_t remain_io_size;
>   	u64 available_size = 0;
>   	u64 total_size = 0;
> -	u64 tile_offset;
> -	u64 tile_size;
> -	u64 vram_size;
>   	int err;
>   	u8 id;
>   
>   	if (!IS_DGFX(xe))
>   		return 0;
>   
> -	/* Get the size of the root tile's vram for later accessibility comparison */
> -	tile = xe_device_get_root_tile(xe);
> -	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> -	if (err)
> -		return err;
> -
> -	err = determine_lmem_bar_size(xe);
> +	err = determine_lmem_bar_size(xe, &lmem_bar);
>   	if (err)
>   		return err;
> +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
>   
> -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> -		 &xe->mem.vram->io_size);
> +	remain_io_size = lmem_bar.io_size;
>   
> -	io_size = xe->mem.vram->io_size;
> -
> -	/* tile specific ranges */
>   	for_each_tile(tile, xe, id) {
> -		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> +		u64 region_size;
> +		u64 usable_size;
> +		u64 tile_offset;
> +
> +		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
>   		if (err)
>   			return err;
>   
> -		tile->mem.vram->actual_physical_size = tile_size;
> -		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
> -		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
> +		total_size += region_size;
> +		available_size += usable_size;
>   
> -		if (!tile->mem.vram->io_size) {
> -			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> -			return -ENODEV;
> -		}
> +		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
> +				       region_size, remain_io_size);
> +		if (err)
> +			return err;
>   
> -		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
> -		tile->mem.vram->usable_size = vram_size;
> -		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
> -
> -		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
> -			drm_info(&xe->drm, "Small BAR device\n");
> -		drm_info(&xe->drm,
> -			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> -			 id, tile->id, &tile->mem.vram->actual_physical_size,
> -			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
> -		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> -			 id, tile->id, &tile->mem.vram->dpa_base,
> -			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
> -			 &tile->mem.vram->io_start,
> -			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
> -
> -		/* calculate total size using tile size to get the correct HW sizing */
> -		total_size += tile_size;
> -		available_size += vram_size;
> -
> -		if (total_size > xe->mem.vram->io_size) {
> +		if (total_size > lmem_bar.io_size) {
>   			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> -				 &total_size, &xe->mem.vram->io_size);
> +				 &total_size, &lmem_bar.io_size);
>   		}
>   
> -		io_size -= min_t(u64, tile_size, io_size);
> +		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
>   	}
>   
> -	xe->mem.vram->actual_physical_size = total_size;
> -
> -	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> -		 &xe->mem.vram->actual_physical_size);
> -	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> -		 &available_size);
> +	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
> +			       lmem_bar.io_size);
> +	if (err)
> +		return err;
>   
>   	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> index d4bf1f9c2a72..72860f714fc6 100644
> --- a/drivers/gpu/drm/xe/xe_vram.h
> +++ b/drivers/gpu/drm/xe/xe_vram.h
> @@ -13,6 +13,8 @@ struct xe_vram_region;
>   
>   int xe_vram_probe(struct xe_device *xe);
>   
> +struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
> +
>   resource_size_t xe_vram_region_io_start(const struct xe_vram_region *vram);
>   resource_size_t xe_vram_region_io_size(const struct xe_vram_region *vram);
>   resource_size_t xe_vram_region_dpa_base(const struct xe_vram_region *vram);
> diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
> index a01838236036..6f36bd93c953 100644
> --- a/drivers/gpu/drm/xe/xe_vram_types.h
> +++ b/drivers/gpu/drm/xe/xe_vram_types.h
> @@ -23,6 +23,12 @@ struct xe_vram_region {
>   	/** @tile: Back pointer to tile */
>   	struct xe_tile *tile;
>   	/** @io_start: IO start address of this VRAM instance */

This kernel-doc is no longer directly above io_start member.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +	/**
> +	 * @id: VRAM region instance id
> +	 *
> +	 * The value should be unique for VRAM region.
> +	 */
> +	u8 id;
>   	resource_size_t io_start;
>   	/**
>   	 * @io_size: IO size of this VRAM instance
> @@ -54,6 +60,8 @@ struct xe_vram_region {
>   	void __iomem *mapping;
>   	/** @ttm: VRAM TTM manager */
>   	struct xe_ttm_vram_mgr ttm;
> +	/** @placement: TTM placement dedicated for this region */
> +	u32 placement;
>   #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
>   	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
>   	struct dev_pagemap pagemap;

