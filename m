Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E1DF8D753
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 15:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E4710E8EC;
	Thu, 16 Apr 2026 15:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PHfjoi2Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F3410E8EC
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Apr 2026 15:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776353616; x=1807889616;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2hdpz9PBrn2g978JS7gaTbosIX4/SaOtBcn7UWuEPUI=;
 b=PHfjoi2QMXFvDS1e1IDsvJiJqdYTWF0mc0HhXGzyrMbwrWOik5WJa/Nx
 I5dbSzeXSw7qvQwtoGFj6zYDLzFxWRgTM679IBD/2IQFS0loL6tEl/19t
 nBMGThCtdoU/iGnwqXaFCLLd913CgicXVHh9x8ccevog6DT731I1+YlEo
 Xy+bN/fVxLN0vSeRsbc3yogfxmcAmSdfGP2Mo5S3swV0BWFFe/0CSqHa+
 dYC11X1VzjhSt9F+2d8mReVR2corsdCT95T2ipHEJQc7Z3hqvIu93sPqL
 8K5Irxt3PqEPUY3pkdQL5q2KXgCKs8iAPyKvtqBZR15ojA0LXKRCewnDY w==;
X-CSE-ConnectionGUID: b087ikDoSiKHYilY67B9QQ==
X-CSE-MsgGUID: dzi/ZSwsTFmD2mRjKNgU5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88807705"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88807705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:33:36 -0700
X-CSE-ConnectionGUID: q5gfsa+hS5O3h5th0dAHlQ==
X-CSE-MsgGUID: oVYEC8vATc6Wy3p/3wvHoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="234779151"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.31])
 ([10.245.245.31])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:33:34 -0700
Message-ID: <eb06fdbd-7fe7-4030-9de5-6f6a04473924@linux.intel.com>
Date: Thu, 16 Apr 2026 17:33:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Convert stolen memory over to ttm_range_manager
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20260416151935.388354-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260416151935.388354-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

Den 2026-04-16 kl. 17:19, skrev Sanjay Yadav:
> Stolen memory requires physically contiguous allocations for display
> scanout and compressed framebuffers. The stolen memory manager was
> sharing the gpu_buddy allocator backend with the VRAM manager, but
> buddy manages non-contiguous power-of-two blocks making it a poor fit.
> Stolen memory also has fundamentally different allocation patterns:
> 
> - Allocation sizes are not power-of-two. Since buddy rounds up to the
>   next power-of-two block size, a ~17MB request can fail even with
>   ~22MB free, because the free space is fragmented across non-fitting
>   power-of-two blocks.
> - Hardware restrictions prevent using the first 4K page of stolen for
>   certain allocations (e.g., FBC). The display code sets fpfn=1 to
>   enforce this, but when fpfn != 0, gpu_buddy enables
>   GPU_BUDDY_RANGE_ALLOCATION mode which disables the try_harder
>   coalescing path, further reducing allocation success.
> 
> This combination caused FBC compressed framebuffer (CFB) allocation
> failures on platforms like NVL/PTL. In case of NVL where stolen memory
> is ~56MB and the initial plane framebuffer consumes ~34MB at probe time,
> leaving ~22MB for subsequent allocations.
> 
> Use ttm_range_man_init_nocheck() to set up a drm_mm-backed TTM resource
> manager for stolen memory. This reuses the TTM core's ttm_range_manager
> callbacks, avoiding duplicate implementations.
> 
> Tested on NVL with a 4K DP display: stolen_mm shows a single ~22MB
> contiguous free hole after initial plane framebuffer allocation, and
> FBC successfully allocates its CFB from that region. The corresponding
> IGT was previously skipped and now passes.
> 
> v2:
> - Clarify that stolen memory requires contiguous allocations (Matt B)
> - Properly handle xe_ttm_resource_visible() for stolen instead of
>   unconditionally returning true (Matt A)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7631
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Assisted-by: GitHub Copilot:claude-sonnet-4.6
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
Acked-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

The changes look good, I never considered the differences between the
buddy allocator and range manager. Glad to see this works a lot better!

One thing I did notice that in most cases, is there any reason for the
range manager to use pages? It should be able to use bytes and remove
a lot of shifts to convert between bytes and pages in the code.

>  drivers/gpu/drm/xe/xe_bo.c             | 16 +++++--
>  drivers/gpu/drm/xe/xe_device_types.h   |  3 ++
>  drivers/gpu/drm/xe/xe_res_cursor.h     | 14 +++++-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 64 +++++++++-----------------
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  9 ++++
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c   | 11 ++---
>  6 files changed, 63 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index a7c2dc7f224c..b737edf04d60 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -599,11 +599,17 @@ static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct ttm_tt *tt)
>  	kfree(tt);
>  }
>  
> -static bool xe_ttm_resource_visible(struct ttm_resource *mem)
> +static bool xe_ttm_resource_visible(struct xe_device *xe, struct ttm_resource *mem)
>  {
> -	struct xe_ttm_vram_mgr_resource *vres =
> -		to_xe_ttm_vram_mgr_resource(mem);
> +	struct xe_ttm_vram_mgr_resource *vres;
>  
> +	if (mem->mem_type == XE_PL_STOLEN) {
> +		struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
> +
> +		return mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe);
> +	}
> +
> +	vres = to_xe_ttm_vram_mgr_resource(mem);
>  	return vres->used_visible_size == mem->size;
>  }
>  
> @@ -621,7 +627,7 @@ bool xe_bo_is_visible_vram(struct xe_bo *bo)
>  	if (drm_WARN_ON(bo->ttm.base.dev, !xe_bo_is_vram(bo)))
>  		return false;
>  
> -	return xe_ttm_resource_visible(bo->ttm.resource);
> +	return xe_ttm_resource_visible(xe_bo_device(bo), bo->ttm.resource);
>  }
>  
>  static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
> @@ -637,7 +643,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
>  	case XE_PL_VRAM1: {
>  		struct xe_vram_region *vram = res_to_mem_region(mem);
>  
> -		if (!xe_ttm_resource_visible(mem))
> +		if (!xe_ttm_resource_visible(xe, mem))
>  			return -EINVAL;
>  
>  		mem->bus.offset = mem->start << PAGE_SHIFT;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 150c76b2acaf..ffb84659c413 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -42,6 +42,7 @@ struct xe_ggtt;
>  struct xe_i2c;
>  struct xe_pat_ops;
>  struct xe_pxp;
> +struct xe_ttm_stolen_mgr;
>  struct xe_vram_region;
>  
>  /**
> @@ -278,6 +279,8 @@ struct xe_device {
>  		struct ttm_resource_manager sys_mgr;
>  		/** @mem.sys_mgr: system memory shrinker. */
>  		struct xe_shrinker *shrinker;
> +		/** @mem.stolen_mgr: stolen memory manager. */
> +		struct xe_ttm_stolen_mgr *stolen_mgr;
>  	} mem;
>  
>  	/** @sriov: device level virtualization data */
> diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> index 5f4ab08c0686..0522caafd89d 100644
> --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> @@ -101,7 +101,15 @@ static inline void xe_res_first(struct ttm_resource *res,
>  	cur->mem_type = res->mem_type;
>  
>  	switch (cur->mem_type) {
> -	case XE_PL_STOLEN:
> +	case XE_PL_STOLEN: {
> +		/* res->start is in pages (ttm_range_manager). */
> +		cur->start = (res->start << PAGE_SHIFT) + start;
> +		cur->size = size;
> +		cur->remaining = size;
> +		cur->node = NULL;
> +		cur->mm = NULL;
> +		break;
> +	}
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1: {
>  		struct gpu_buddy_block *block;
> @@ -289,6 +297,10 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
>  
>  	switch (cur->mem_type) {
>  	case XE_PL_STOLEN:
> +		/* Just advance within the contiguous region. */
> +		cur->start += size;
> +		cur->size = cur->remaining;
> +		break;
>  	case XE_PL_VRAM0:
>  	case XE_PL_VRAM1:
>  		start = size - cur->size;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 27c9d72222cf..5e9070739e65 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -19,30 +19,11 @@
>  #include "xe_device.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> -#include "xe_res_cursor.h"
>  #include "xe_sriov.h"
>  #include "xe_ttm_stolen_mgr.h"
> -#include "xe_ttm_vram_mgr.h"
>  #include "xe_vram.h"
>  #include "xe_wa.h"
>  
> -struct xe_ttm_stolen_mgr {
> -	struct xe_ttm_vram_mgr base;
> -
> -	/* PCI base offset */
> -	resource_size_t io_base;
> -	/* GPU base offset */
> -	resource_size_t stolen_base;
> -
> -	void __iomem *mapping;
> -};
> -
> -static inline struct xe_ttm_stolen_mgr *
> -to_stolen_mgr(struct ttm_resource_manager *man)
> -{
> -	return container_of(man, struct xe_ttm_stolen_mgr, base.manager);
> -}
> -
>  /**
>   * xe_ttm_stolen_cpu_access_needs_ggtt() - If we can't directly CPU access
>   * stolen, can we then fallback to mapping through the GGTT.
> @@ -210,12 +191,19 @@ static u64 detect_stolen(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>  #endif
>  }
>  
> +static void xe_ttm_stolen_mgr_fini(struct drm_device *dev, void *arg)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +
> +	ttm_range_man_fini_nocheck(&xe->ttm, XE_PL_STOLEN);
> +}
> +
>  int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	struct xe_ttm_stolen_mgr *mgr;
>  	u64 stolen_size, io_size;
> -	int err;
> +	int ret;
>  
>  	mgr = drmm_kzalloc(&xe->drm, sizeof(*mgr), GFP_KERNEL);
>  	if (!mgr)
> @@ -244,12 +232,12 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	if (mgr->io_base && !xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		io_size = stolen_size;
>  
> -	err = __xe_ttm_vram_mgr_init(xe, &mgr->base, XE_PL_STOLEN, stolen_size,
> -				     io_size, PAGE_SIZE);
> -	if (err) {
> -		drm_dbg_kms(&xe->drm, "Stolen mgr init failed: %i\n", err);
> -		return err;
> -	}
> +	ret = ttm_range_man_init_nocheck(&xe->ttm, XE_PL_STOLEN, false,
> +					 stolen_size >> PAGE_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	xe->mem.stolen_mgr = mgr;
>  
>  	drm_dbg_kms(&xe->drm, "Initialized stolen memory support with %llu bytes\n",
>  		    stolen_size);
> @@ -257,36 +245,32 @@ int xe_ttm_stolen_mgr_init(struct xe_device *xe)
>  	if (io_size)
>  		mgr->mapping = devm_ioremap_wc(&pdev->dev, mgr->io_base, io_size);
>  
> -	return 0;
> +	return drmm_add_action_or_reset(&xe->drm, xe_ttm_stolen_mgr_fini, mgr);
>  }
>  
>  u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -	struct xe_ttm_stolen_mgr *mgr = to_stolen_mgr(ttm_mgr);
> -	struct xe_res_cursor cur;
> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>  
>  	XE_WARN_ON(!mgr->io_base);
>  
>  	if (xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>  		return mgr->io_base + xe_bo_ggtt_addr(bo) + offset;
>  
> -	xe_res_first(bo->ttm.resource, offset, 4096, &cur);
> -	return mgr->io_base + cur.start;
> +	/* Range allocator: res->start is in pages. */
> +	return mgr->io_base + (bo->ttm.resource->start << PAGE_SHIFT) + offset;
>  }
>  
>  static int __xe_ttm_stolen_io_mem_reserve_bar2(struct xe_device *xe,
>  					       struct xe_ttm_stolen_mgr *mgr,
>  					       struct ttm_resource *mem)
>  {
> -	struct xe_res_cursor cur;
> -
>  	if (!mgr->io_base)
>  		return -EIO;
>  
> -	xe_res_first(mem, 0, 4096, &cur);
> -	mem->bus.offset = cur.start;
> +	/* Range allocator always produces contiguous allocations. */
> +	mem->bus.offset = mem->start << PAGE_SHIFT;
>  
>  	drm_WARN_ON(&xe->drm, !(mem->placement & TTM_PL_FLAG_CONTIGUOUS));
>  
> @@ -329,8 +313,7 @@ static int __xe_ttm_stolen_io_mem_reserve_stolen(struct xe_device *xe,
>  
>  int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>  {
> -	struct ttm_resource_manager *ttm_mgr = ttm_manager_type(&xe->ttm, XE_PL_STOLEN);
> -	struct xe_ttm_stolen_mgr *mgr = ttm_mgr ? to_stolen_mgr(ttm_mgr) : NULL;
> +	struct xe_ttm_stolen_mgr *mgr = xe->mem.stolen_mgr;
>  
>  	if (!mgr || !mgr->io_base)
>  		return -EIO;
> @@ -343,8 +326,5 @@ int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem)
>  
>  u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe)
>  {
> -	struct xe_ttm_stolen_mgr *mgr =
> -		to_stolen_mgr(ttm_manager_type(&xe->ttm, XE_PL_STOLEN));
> -
> -	return mgr->stolen_base;
> +	return xe->mem.stolen_mgr->stolen_base;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> index 8e877d1e839b..049e91e77326 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> @@ -12,6 +12,15 @@ struct ttm_resource;
>  struct xe_bo;
>  struct xe_device;
>  
> +struct xe_ttm_stolen_mgr {
> +	/* PCI base offset */
> +	resource_size_t io_base;
> +	/* GPU base offset */
> +	resource_size_t stolen_base;
> +
> +	void __iomem *mapping;
> +};
> +
>  int xe_ttm_stolen_mgr_init(struct xe_device *xe);
>  int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>  bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 5fd0d5506a7e..79ef8e1b5e5c 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -301,14 +301,13 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  			   u64 default_page_size)
>  {
>  	struct ttm_resource_manager *man = &mgr->manager;
> +	const char *name;
>  	int err;
>  
> -	if (mem_type != XE_PL_STOLEN) {
> -		const char *name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> -		man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> -		if (IS_ERR(man->cg))
> -			return PTR_ERR(man->cg);
> -	}
> +	name = mem_type == XE_PL_VRAM0 ? "vram0" : "vram1";
> +	man->cg = drmm_cgroup_register_region(&xe->drm, name, size);
> +	if (IS_ERR(man->cg))
> +		return PTR_ERR(man->cg);
>  
>  	man->func = &xe_ttm_vram_mgr_func;
>  	mgr->mem_type = mem_type;

