Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EB4C27C75
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 09:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEC910E9A9;
	Thu, 13 Jun 2024 09:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhbNvpu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B615F10E9A9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 09:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718269634; x=1749805634;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ogukPMx0ZZ/MVx2pdKDyDL0rSVWCQed/TMKe1t9iAX4=;
 b=IhbNvpu9rSYz7lyTesj/18eCax9v21iHrNDTEj8vxJEqgQ9dzKCIPlYx
 dqeyP7veI3sPoYz/PfvXxgFRJUxF1zhliB1ZnPcyeKL+CXcOy36FV8w/x
 zcX4Lio7QYXK/ldjAstNjHFGpBMyCkgcTOvGWMtYlVXUCXE/qPTtY/pfn
 lPY383PDQ1/Wfw3raUBwyku7rNYdZjSp2GJs7kJ+YyNSaSHMkfPbEKeg2
 Vl9rwbVa1bIp7sZ0Gw+pLWyHvBRh+6MgCAIvkYT/A+fryyLAah4CpwNW5
 /yH+bTMSZzbBGmQHH97SaelKAMtoj6I+t2L1VhOzDvJVNh7nlG94KV4BX g==;
X-CSE-ConnectionGUID: RZOcNEydQUieaW+l9nN4uw==
X-CSE-MsgGUID: mskvrEENTQ6qZuTenZZW1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26480300"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="26480300"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:07:12 -0700
X-CSE-ConnectionGUID: fbvdgsQRQ8qtLjiim7n7Hw==
X-CSE-MsgGUID: AOXeNwFkR2iP3luOV6z2nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39942612"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.244.62])
 ([10.245.244.62])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:06:55 -0700
Message-ID: <bf641257-628d-44e7-a7bf-75bef1e31615@intel.com>
Date: Thu, 13 Jun 2024 10:06:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix missing runtime outer protection for
 ggtt_remove_node
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240612182038.249360-1-rodrigo.vivi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240612182038.249360-1-rodrigo.vivi@intel.com>
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

On 12/06/2024 19:20, Rodrigo Vivi wrote:
> Defer the ggtt node removal to a thread if runtime_pm is not active.
> 
> The ggtt node removal can be called from multiple places, including
> places where we cannot protect with outer callers and places we are
> within other locks. So, try to grab the runtime reference if the
> device is already active, otherwise defer the removal to a separate
> thread from where we are sure we can wake the device up.
> 
> v2: - use xe wq instead of system wq (Matt and CI)
>      - Avoid GFP_KERNEL to be future proof since this removal can
>      be called from outside our drivers and we don't want to block
>      if atomic is needed. (Matt)
> v3: amend forgot chunk declaring xe_device.
> v4: Use a xe_ggtt_region to encapsulate the node and remova info,
>      wihtout the need for any memory allocation at runtime.
> v5: Actually fill the delayed_removal.invalidate (Matt)
> 
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/display/xe_fb_pin.c |  10 +--
>   drivers/gpu/drm/xe/xe_bo.c             |   2 +-
>   drivers/gpu/drm/xe/xe_bo.h             |   6 +-
>   drivers/gpu/drm/xe/xe_bo_types.h       |   6 +-
>   drivers/gpu/drm/xe/xe_ggtt.c           | 113 +++++++++++++++++--------
>   drivers/gpu/drm/xe/xe_ggtt.h           |   1 -
>   drivers/gpu/drm/xe/xe_ggtt_types.h     |  21 +++++
>   7 files changed, 112 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index a2f417209124..b54d8850463a 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -153,7 +153,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>   	}
>   
>   	vma->dpt = dpt;
> -	vma->node = dpt->ggtt_node;
> +	vma->node = dpt->ggtt_region.node;
>   	return 0;
>   }
>   
> @@ -203,8 +203,8 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
>   	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>   		align = max_t(u32, align, SZ_64K);
>   
> -	if (bo->ggtt_node.size && view->type == I915_GTT_VIEW_NORMAL) {
> -		vma->node = bo->ggtt_node;
> +	if (bo->ggtt_region.node.size && view->type == I915_GTT_VIEW_NORMAL) {
> +		vma->node = bo->ggtt_region.node;
>   	} else if (view->type == I915_GTT_VIEW_NORMAL) {
>   		u32 x, size = bo->ttm.base.size;
>   
> @@ -322,8 +322,8 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
>   
>   	if (vma->dpt)
>   		xe_bo_unpin_map_no_vm(vma->dpt);
> -	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node) ||
> -		 vma->bo->ggtt_node.start != vma->node.start)
> +	else if (!drm_mm_node_allocated(&vma->bo->ggtt_region.node) ||
> +		 vma->bo->ggtt_region.node.start != vma->node.start)
>   		xe_ggtt_remove_node(ggtt, &vma->node, false);
>   
>   	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2bae01ce4e5b..c807c0fe8d4a 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1072,7 +1072,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
>   
>   	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
>   
> -	if (bo->ggtt_node.size)
> +	if (bo->ggtt_region.node.size)
>   		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
>   
>   #ifdef CONFIG_PROC_FS
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 6de894c728f5..79e77dac48f3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -194,9 +194,9 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
>   static inline u32
>   xe_bo_ggtt_addr(struct xe_bo *bo)
>   {
> -	XE_WARN_ON(bo->ggtt_node.size > bo->size);
> -	XE_WARN_ON(bo->ggtt_node.start + bo->ggtt_node.size > (1ull << 32));
> -	return bo->ggtt_node.start;
> +	XE_WARN_ON(bo->ggtt_region.node.size > bo->size);
> +	XE_WARN_ON(bo->ggtt_region.node.start + bo->ggtt_region.node.size > (1ull << 32));
> +	return bo->ggtt_region.node.start;
>   }
>   
>   int xe_bo_vmap(struct xe_bo *bo);
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 86422e113d39..d905fa5e1b52 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -14,6 +14,8 @@
>   #include <drm/ttm/ttm_execbuf_util.h>
>   #include <drm/ttm/ttm_placement.h>
>   
> +#include "xe_ggtt_types.h"
> +
>   struct xe_device;
>   struct xe_vm;
>   
> @@ -38,8 +40,8 @@ struct xe_bo {
>   	struct ttm_place placements[XE_BO_MAX_PLACEMENTS];
>   	/** @placement: current placement for this BO */
>   	struct ttm_placement placement;
> -	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
> -	struct drm_mm_node ggtt_node;
> +	/** @ggtt_region: GGTT region node if this BO is mapped in the GGTT */
> +	struct xe_ggtt_region ggtt_region;
>   	/** @vmap: iosys map of this buffer */
>   	struct iosys_map vmap;
>   	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 8ff91fd1b7c8..5f7c335020ce 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -389,7 +389,7 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   {
>   	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
>   	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
> -	u64 start = bo->ggtt_node.start;
> +	u64 start = bo->ggtt_region.node.start;
>   	u64 offset, pte;
>   
>   	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
> @@ -398,6 +398,75 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   	}
>   }
>   
> +static void ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			     bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +	bool bound;
> +	int idx;
> +
> +	bound = drm_dev_enter(&xe->drm, &idx);
> +
> +	mutex_lock(&ggtt->lock);
> +	if (bound)
> +		xe_ggtt_clear(ggtt, node->start, node->size);
> +	drm_mm_remove_node(node);
> +	node->size = 0;
> +	mutex_unlock(&ggtt->lock);
> +
> +	if (!bound)
> +		return;
> +
> +	if (invalidate)
> +		xe_ggtt_invalidate(ggtt);
> +
> +	drm_dev_exit(idx);
> +}
> +
> +static void ggtt_remove_node_work_func(struct work_struct *work)
> +{
> +	struct xe_ggtt_region *ggtt_region = container_of(work,
> +							  typeof(*ggtt_region),
> +							  delayed_removal.work);
> +	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
> +
> +	xe_pm_runtime_get(xe);
> +	ggtt_remove_node(ggtt_region->ggtt, &ggtt_region->node,
> +			 ggtt_region->delayed_removal.invalidate);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static void ggtt_queue_remove_node(struct drm_mm_node *node, bool invalidate)
> +{
> +	struct xe_ggtt_region *ggtt_region = container_of(node,
> +							  typeof(*ggtt_region),
> +							  node);
> +	struct xe_device *xe = tile_to_xe(ggtt_region->ggtt->tile);
> +
> +	ggtt_region->delayed_removal.invalidate = invalidate;
> +	queue_work(xe->unordered_wq, &ggtt_region->delayed_removal.work);

What prevents ggtt_region from being freed before the queued work 
completes? The ggtt_region looks to be embedded in the bo which is 
potentially freed shorty after this.

> +}
> +
> +void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> +			 bool invalidate)
> +{
> +	struct xe_device *xe = tile_to_xe(ggtt->tile);
> +
> +	if (xe_pm_runtime_get_if_active(xe)) {
> +		ggtt_remove_node(ggtt, node, invalidate);
> +		xe_pm_runtime_put(xe);
> +	} else {
> +		ggtt_queue_remove_node(node, invalidate);
> +	}
> +}
> +
> +static void ggtt_region_init(struct xe_ggtt *ggtt,
> +			     struct xe_ggtt_region *ggtt_region)
> +{
> +	INIT_WORK(&ggtt_region->delayed_removal.work, ggtt_remove_node_work_func);
> +	ggtt_region->ggtt = ggtt;
> +}
> +
>   static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   				  u64 start, u64 end)
>   {
> @@ -407,9 +476,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
>   		alignment = SZ_64K;
>   
> -	if (XE_WARN_ON(bo->ggtt_node.size)) {
> +	if (XE_WARN_ON(bo->ggtt_region.node.size)) {
>   		/* Someone's already inserted this BO in the GGTT */
> -		xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +		xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
>   		return 0;
>   	}
>   
> @@ -417,9 +486,11 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   	if (err)
>   		return err;
>   
> +	ggtt_region_init(ggtt, &bo->ggtt_region);
> +
>   	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
>   	mutex_lock(&ggtt->lock);
> -	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node, bo->size,
> +	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_region.node, bo->size,
>   					  alignment, 0, start, end, 0);
>   	if (!err)
>   		xe_ggtt_map_bo(ggtt, bo);
> @@ -443,43 +514,15 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
>   }
>   
> -void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
> -			 bool invalidate)
> -{
> -	struct xe_device *xe = tile_to_xe(ggtt->tile);
> -	bool bound;
> -	int idx;
> -
> -	bound = drm_dev_enter(&xe->drm, &idx);
> -	if (bound)
> -		xe_pm_runtime_get_noresume(xe);
> -
> -	mutex_lock(&ggtt->lock);
> -	if (bound)
> -		xe_ggtt_clear(ggtt, node->start, node->size);
> -	drm_mm_remove_node(node);
> -	node->size = 0;
> -	mutex_unlock(&ggtt->lock);
> -
> -	if (!bound)
> -		return;
> -
> -	if (invalidate)
> -		xe_ggtt_invalidate(ggtt);
> -
> -	xe_pm_runtime_put(xe);
> -	drm_dev_exit(idx);
> -}
> -
>   void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
>   {
> -	if (XE_WARN_ON(!bo->ggtt_node.size))
> +	if (XE_WARN_ON(!bo->ggtt_region.node.size))
>   		return;
>   
>   	/* This BO is not currently in the GGTT */
> -	xe_tile_assert(ggtt->tile, bo->ggtt_node.size == bo->size);
> +	xe_tile_assert(ggtt->tile, bo->ggtt_region.node.size == bo->size);
>   
> -	xe_ggtt_remove_node(ggtt, &bo->ggtt_node,
> +	xe_ggtt_remove_node(ggtt, &bo->ggtt_region.node,
>   			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 4a41a1762358..75511b5f43eb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -30,7 +30,6 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>   int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
>   			 u64 start, u64 end);
>   void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
> -
>   int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
>   
>   #ifdef CONFIG_PCI_IOV
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index d8c584d9a8c3..bea66aa0d843 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -36,4 +36,25 @@ struct xe_ggtt {
>   	struct drm_mm mm;
>   };
>   
> +/**
> + * struct xe_ggtt_region - GGTT region node
> + * It needs to be initialized before the drm_mm_node insertion in the GGTT.
> + */
> +struct xe_ggtt_region {
> +	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
> +	struct xe_ggtt *ggtt;
> +	/** @node: The drm_mm_node itself */
> +	struct drm_mm_node node;
> +	/**
> +	 * @delayed_removal: Information for removal through work thread when
> +	 * device runtime_pm is suspended
> +	 */
> +	struct {
> +		/** @delayed_removal.work: The work struct for the delayed removal */
> +		struct work_struct work;
> +		/** @delayed_removal.invalidate: If it needs invalidation upon removal */
> +		bool invalidate;
> +	} delayed_removal;
> +};
> +
>   #endif
