Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152E7C282EC
	for <intel-xe@archiver.kernel.org>; Mon, 17 Mar 2025 15:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8DF10E169;
	Mon, 17 Mar 2025 15:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4z5vWXP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFAF10E169
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Mar 2025 15:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742227138; x=1773763138;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J2l/olIUPC8pLNEMk2O1mT9AVdHO6yIFN++V2IIZIVs=;
 b=L4z5vWXPQmvzGm22BCuo4Y7WCA+AVcuHINgOkMorB3QEsX5Ns60LsDEo
 YL+B20RCAe9QibKywjAodVQSnN2PK+mZUM1MjkWgCL1Dd8LhlYNKg5+Td
 FKf0TDsWRZltVBiwTDi5R0p9WhMyLtxCMFxVrlWHGvL+UEyMrLdaewreo
 hN6yZD+ASZcC96KDrO0SNUaxP6C1JsOGhZhuUOn6VCbUSuj49+c2ON4Px
 FQQ8Vb4UVxSi/tBtv0oCFD4q9JUHeIl/W3wc/vkdbyNZSaMlo0t8HnpbX
 /Na8uVIhaGAt0dCP5u8GY+snda99irzsj5ifWVXb5SYpvxxoup7jRQFya Q==;
X-CSE-ConnectionGUID: wF9ruxaVRz6h5ywCNAjB9w==
X-CSE-MsgGUID: VTtfcpQjQpiKPb8uVg/tZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54702838"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="54702838"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 08:58:57 -0700
X-CSE-ConnectionGUID: 6bbwiwA9TEqZgdQhVTFSKQ==
X-CSE-MsgGUID: L9bjTnEAR1iIHMx8UOHZ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="121963403"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.8])
 ([10.245.245.8])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 08:58:56 -0700
Message-ID: <46faf433-a7d7-480e-be87-4989c5162ea1@intel.com>
Date: Mon, 17 Mar 2025 15:58:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/xe/bo: Add a bo remove callback
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Matthew Brost <matthew.brost@intel.com>
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
 <20250317104132.8200-4-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250317104132.8200-4-thomas.hellstrom@linux.intel.com>
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

On 17/03/2025 10:41, Thomas Hellström wrote:
> On device unbind, migrate exported bos, including pagemap bos to
> system. This allows importers to take proper action without
> disruption. In particular, SVM clients on remote devices may
> continue as if nothing happened, and can chose a different
> placement.
> 
> The evict_flags() placement is chosen in such a way that bos that
> aren't exported are purged.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo.c     | 96 +++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_bo.h     |  2 +
>   drivers/gpu/drm/xe/xe_device.c |  2 +
>   3 files changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 64f9c936eea0..c7c206041632 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -55,6 +55,8 @@ static struct ttm_placement sys_placement = {
>   	.placement = &sys_placement_flags,
>   };
>   
> +static struct ttm_placement purge_placement;
> +
>   static const struct ttm_place tt_placement_flags[] = {
>   	{
>   		.fpfn = 0,
> @@ -281,6 +283,8 @@ int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
>   static void xe_evict_flags(struct ttm_buffer_object *tbo,
>   			   struct ttm_placement *placement)
>   {
> +	struct xe_device *xe = container_of(tbo->bdev, typeof(*xe), ttm);
> +	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
>   	struct xe_bo *bo;
>   
>   	if (!xe_bo_is_xe_bo(tbo)) {
> @@ -290,7 +294,7 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>   			return;
>   		}
>   
> -		*placement = sys_placement;
> +		*placement = device_unplugged ? purge_placement : sys_placement;
>   		return;
>   	}
>   
> @@ -300,6 +304,11 @@ static void xe_evict_flags(struct ttm_buffer_object *tbo,
>   		return;
>   	}
>   
> +	if (device_unplugged && !tbo->base.dma_buf) {
> +		*placement = purge_placement;
> +		return;
> +	}

> +
>   	/*
>   	 * For xe, sg bos that are evicted to system just triggers a
>   	 * rebind of the sg list upon subsequent validation to XE_PL_TT.
> @@ -657,11 +666,20 @@ static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
>   	struct xe_ttm_tt *xe_tt = container_of(ttm_bo->ttm, struct xe_ttm_tt,
>   					       ttm);
>   	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	bool device_unplugged = drm_dev_is_unplugged(&xe->drm);
>   	struct sg_table *sg;
>   
>   	xe_assert(xe, attach);
>   	xe_assert(xe, ttm_bo->ttm);
>   
> +	if (device_unplugged && new_res->mem_type == XE_PL_SYSTEM &&
> +	    ttm_bo->sg) {
> +		dma_resv_wait_timeout(ttm_bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
> +				      false, MAX_SCHEDULE_TIMEOUT);
> +		dma_buf_unmap_attachment(attach, ttm_bo->sg, DMA_BIDIRECTIONAL);
> +		ttm_bo->sg = NULL;
> +	}

> +
>   	if (new_res->mem_type == XE_PL_SYSTEM)
>   		goto out;
>   
> @@ -2945,6 +2963,82 @@ void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo)
>   	list_del_init(&bo->vram_userfault_link);
>   }
>   
> +static void xe_bo_dma_unmap_pinned(struct xe_device *xe)

Should we prefix this with xe_device_ or something?
xe_device_unmap_pinned_bo() ?

> +{
> +	struct list_head still_in_list;
> +
> +	INIT_LIST_HEAD(&still_in_list);

LIST_HEAD(still_in_list);


> +	spin_lock(&xe->pinned.lock);
> +	for (;;) {
> +		struct xe_bo *bo = list_first_entry_or_null(&xe->pinned.kernel_bo_present,
> +							    typeof(*bo), pinned_link);
> +		struct ttm_buffer_object *ttm_bo;
> +		struct ttm_tt *tt;
> +		struct xe_ttm_tt *xe_tt;
> +
> +		if (!bo)
> +			break;
> +
> +		list_move_tail(&bo->pinned_link, &still_in_list);
> +		xe_bo_get(bo);
> +		spin_unlock(&xe->pinned.lock);
> +
> +		xe_bo_lock(bo, false);
> +		ttm_bo = &bo->ttm;
> +		tt = ttm_bo->ttm;
> +		if (tt) {
> +			xe_ttm_bo_delete_mem_notify(ttm_bo);

Do we actually need this?

> +			xe_tt = container_of(tt, typeof(*xe_tt), ttm);
> +			if (xe_tt->sg) {
> +				dma_unmap_sgtable(xe_tt->xe->drm.dev, xe_tt->sg,
> +						  DMA_BIDIRECTIONAL, 0);
> +				sg_free_table(xe_tt->sg);
> +				xe_tt->sg = NULL;
> +			}

Would it make sense to also call ttm_tt_unpopulate() here, so we nuke 
the pages?

> +		}
> +
> +		xe_bo_unlock(bo);
> +		xe_bo_put(bo);
> +		spin_lock(&xe->pinned.lock);
> +	}
> +	list_splice_tail(&still_in_list, &xe->pinned.kernel_bo_present);
> +	spin_unlock(&xe->pinned.lock);
> +}

We could potentially move this type of thing into xe_bo_evict.c?

> +
> +/**
> + * xe_bo_remove() - Handle bos when the pci_device is about to be removed
> + * @xe: The xe device.
> + *
> + * On pci_device removal we need to drop all dma mappings and move
> + * the data of exported bos out to system. This includes SVM bos and
> + * exported dma-buf bos. This is done by evicting all bos, but
> + * the evict placement in xe_evict_flags() is chosen such that all
> + * bos except those mentioned are purged, and thus their memory
> + * is released.
> + *
> + * For pinned bos, we're unmapping dma.
> + */
> +void xe_bo_remove(struct xe_device *xe)

xe_device_remove_bo() ?

> +{
> +	unsigned int mem_type;
> +
> +	/*
> +	 * Move pagemap bos and exported dma-buf to system.

..and purge everything else."

?

> +	 */
> +	for (mem_type = XE_PL_VRAM1; mem_type >= XE_PL_TT; --mem_type) {
> +		struct ttm_resource_manager *man =
> +			ttm_manager_type(&xe->ttm, mem_type);
> +
> +		if (man) {
> +			int ret = ttm_resource_manager_evict_all(&xe->ttm, man);
> +
> +			drm_WARN_ON(&xe->drm, ret);
> +		}
> +	}
> +
> +	xe_bo_dma_unmap_pinned(xe);
> +}
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   #include "tests/xe_bo.c"
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index bda3fdd408da..22b1c63f9311 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -405,6 +405,8 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>   		  const struct xe_bo_shrink_flags flags,
>   		  unsigned long *scanned);
>   
> +void xe_bo_remove(struct xe_device *xe);
> +
>   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>   /**
>    * xe_bo_is_mem_type - Whether the bo currently resides in the given
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5d79b439dd62..bf487f5f369f 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -919,6 +919,8 @@ void xe_device_remove(struct xe_device *xe)
>   	xe_display_unregister(xe);
>   
>   	drm_dev_unplug(&xe->drm);
> +
> +	xe_bo_remove(xe);
>   }
>   
>   void xe_device_shutdown(struct xe_device *xe)

