Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A61FD58E5C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 05:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164E810E15C;
	Mon,  2 Mar 2026 05:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ew5OrGV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607B710E15C
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 05:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772428288; x=1803964288;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PWDbMB4W5qaOwAROJ5xnRCo6ANujh7Q9qTMBrvuEOlo=;
 b=ew5OrGV0iYPXQSA6JVdKTiphuz5k5i3X8FYPpQKhBXWhKN7grWf9NFYU
 jwkI32LX5EI0t3pKuW3ctRJqMK5r5BzjIKggamE0790Gkn8ZoKUpSgvFP
 3W9EEUlGhaJrdiXc9yKP49UdFCnzcxe7cY2Grbn0sdE2GcJD2yNwESO57
 sZ15M2SM8jzCyJ6q3jYij2dT+j6rUBg56ZPby9IGs2FB3VUxX10KSiudb
 r6YvR23xBfxs9cW/ZzsTg8nBbQG4jtv0FC6coehgrY9m5Dn5KdSS/QnAd
 Jty9Qm7cBJu+YZTRDMKm7BeKlRDhT8WZcOkXt3sT624aIr6h0/w8wb9AQ g==;
X-CSE-ConnectionGUID: povlQrAVRL61E0rbbPLzvQ==
X-CSE-MsgGUID: aHO2nRQIRfquhhnMxQi5Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="98897862"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="98897862"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 21:11:27 -0800
X-CSE-ConnectionGUID: fpbbAX4CSmS51o/iT8rTyA==
X-CSE-MsgGUID: YOGw1GYcTUik6Plenzx4gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="222522498"
Received: from aiddamse-mobl3.gar.corp.intel.com (HELO [10.247.156.83])
 ([10.247.156.83])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2026 21:11:25 -0800
Message-ID: <061f6d41-b675-4430-9792-12951a2030b7@linux.intel.com>
Date: Mon, 2 Mar 2026 10:41:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH V4 3/7] drm/xe: Handle physical memory address error
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, Riana Tauro <riana.tauro@intel.com>
References: <20260227134453.1814649-9-tejas.upadhyay@intel.com>
 <20260227134453.1814649-12-tejas.upadhyay@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20260227134453.1814649-12-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 27-02-2026 19:14, Tejas Upadhyay wrote:
> This functionality represents a significant step in making
> the xe driver gracefully handle hardware memory degradation.
> By integrating with the DRM Buddy allocator, the driver
> can permanently "carve out" faulty memory so it isn't reused
> by subsequent allocations.
>
> Buddy Block Reservation:
> ----------------------
> When a memory address is reported as faulty, the driver instructs
> the DRM Buddy allocator to reserve a block of the specific page
> size (typically 4KB). This marks the memory as "dirty/used"
> indefinitely.
>
> Two-Stage Tracking:
> -----------------
> Offlined Pages:
> Pages that have been successfully isolated and removed from the
> available memory pool.
>
> Queued Pages:
> Addresses that have been flagged as faulty but are currently in
> use by a process. These are tracked until the associated buffer
> object (BO) is released or migrated, at which point they move
> to the "offlined" state.
>
> Sysfs Reporting:
> --------------
> The patch exposes these metrics through a standard interface,
> allowing administrators to monitor VRAM health:
> /sys/bus/pci/devices/<device_id>/vram_bad_bad_pages
>
> V3:
> -rename api, remove tile dependency and add status of reservation
> V2:
> - Fix mm->avail counter issue
> - Remove unused code and handle clean up in case of error
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 214 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h       |   2 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  23 +++
>  3 files changed, 231 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 4e852eed5170..42d531b1dabf 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -276,6 +276,26 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>  	.debug	= xe_ttm_vram_mgr_debug
>  };
>  
> +static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
> +{
> +	struct xe_ttm_offline_resource *pos, *n;
> +
> +	mutex_lock(&mgr->lock);
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		--mgr->n_offlined_pages;
> +		drm_buddy_free_list(&mgr->mm, &pos->blocks, 0);
> +		mgr->visible_avail += pos->used_visible_size;
> +		list_del(&pos->offlined_link);
> +		kfree(pos);
> +	}
> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> +		list_del(&pos->queued_link);
> +		mgr->n_queued_pages--;
> +		kfree(pos);
> +	}
> +	mutex_unlock(&mgr->lock);
> +}
> +
>  static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -287,6 +307,8 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>  	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>  		return;
>  
> +	xe_ttm_vram_free_bad_pages(dev, mgr);
> +
>  	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>  
>  	drm_buddy_fini(&mgr->mm);
> @@ -315,6 +337,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>  	man->func = &xe_ttm_vram_mgr_func;
>  	mgr->mem_type = mem_type;
>  	mutex_init(&mgr->lock);
> +	INIT_LIST_HEAD(&mgr->offlined_pages);
> +	INIT_LIST_HEAD(&mgr->queued_pages);
>  	mgr->default_page_size = default_page_size;
>  	mgr->visible_size = io_size;
>  	mgr->visible_avail = io_size;
> @@ -531,14 +555,190 @@ static struct ttm_buffer_object *xe_ttm_vram_addr_to_tbo(struct drm_buddy *mm, u
>  	return NULL;
>  }
>  
> -int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr)
> +static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, unsigned long addr,
> +					    struct xe_ttm_vram_mgr *vram_mgr, struct drm_buddy *mm)
>  {
> -	struct xe_ttm_vram_mgr *vram_mgr = &tile->mem.vram->ttm;
> -	struct drm_buddy mm = vram_mgr->mm;
> -	struct ttm_buffer_object *tbo;
> +	int ret = 0;
> +	u64 size = SZ_4K;
> +	struct ttm_buffer_object *tbo = NULL;
> +	struct xe_ttm_offline_resource *nentry;
> +	enum reserve_status {
> +		pending = 0,
> +		fail
> +	};
> +
> +	mutex_lock(&vram_mgr->lock);
> +	tbo = xe_ttm_vram_addr_to_tbo(mm, addr);
> +
> +	nentry = kzalloc(sizeof(*nentry), GFP_KERNEL);
> +	if (!nentry)
> +		return -ENOMEM;
> +	INIT_LIST_HEAD(&nentry->blocks);
> +	nentry->status = pending;
> +
> +	if (tbo) {
> +		struct xe_ttm_vram_mgr_resource *pvres;
> +		struct ttm_placement place = {};
> +		struct ttm_operation_ctx ctx = {
> +			.interruptible = false,
> +			.gfp_retry_mayfail = false,
> +		};
> +		bool locked;
> +		struct xe_ttm_offline_resource *pos, *n;
> +		struct xe_bo *pbo = ttm_to_xe_bo(tbo);
> +
> +		xe_bo_get(pbo);
> +		/* Critical kernel BO? */

There is a scope for recovery from KMD without relying on USER.

I believe this call will be executed as part of AER callback, so if you
had identified this case you could request for SBR and in the next boot
you can offline the page. In addition to this there shall be a check if
the address belongs to reserved memory and as well request SBR for that.

FYI , Riana.

> +		if (pbo->ttm.type == ttm_bo_type_kernel &&
> +		    !(pbo->flags & XE_BO_FLAG_FORCE_USER_VRAM)) {
> +			mutex_unlock(&vram_mgr->lock);
> +			kfree(nentry);
> +			xe_ttm_vram_free_bad_pages(&xe->drm, vram_mgr);
> +			xe_bo_put(pbo);
> +			drm_warn(&xe->drm,
> +				 "%s: corrupt addr: 0x%lx in critical kernel bo, wedge now\n",
> +				__func__, addr);
> +			/* Wedge the device */
> +			xe_device_declare_wedged(xe);
> +			return -EIO;
> +		}
> +		pvres = to_xe_ttm_vram_mgr_resource(pbo->ttm.resource);
> +		nentry->id = ++vram_mgr->n_queued_pages;
> +		nentry->blocks = pvres->blocks;
> +		list_add(&nentry->queued_link, &vram_mgr->queued_pages);
> +		mutex_unlock(&vram_mgr->lock);
> +

Also,  how will this behave if the BO is a ppgtt table, ring buffers,
LRCA etc.., will you signal fences and  ban the context?

Thanks,
Aravind.
> +		/* Purge BO containing address */
> +		spin_lock(&pbo->ttm.bdev->lru_lock);
> +		locked = dma_resv_trylock(pbo->ttm.base.resv);
> +		spin_unlock(&pbo->ttm.bdev->lru_lock);
> +		WARN_ON(!locked);
> +		ret = ttm_bo_validate(&pbo->ttm, &place, &ctx);
> +		drm_WARN_ON(&xe->drm, ret);
> +		xe_bo_put(pbo);
> +		if (locked)
> +			dma_resv_unlock(pbo->ttm.base.resv);
> +
> +		/* Reserve page at address addr*/
> +		mutex_lock(&vram_mgr->lock);
> +		ret = drm_buddy_alloc_blocks(mm, addr, addr + size,
> +					     size, size, &nentry->blocks,
> +					     DRM_BUDDY_RANGE_ALLOCATION);
> +
> +		if (ret) {
> +			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status = fail;
> +			mutex_unlock(&vram_mgr->lock);
> +			return ret;
> +		}
> +		if ((addr + size) <= vram_mgr->visible_size) {
> +			nentry->used_visible_size = size;
> +		} else {
> +			struct drm_buddy_block *block;
>  
> -	tbo = xe_ttm_vram_addr_to_tbo(&mm, addr);
> +			list_for_each_entry(block, &nentry->blocks, link) {
> +				u64 start = drm_buddy_block_offset(block);
>  
> -	return 0;
> +				if (start < vram_mgr->visible_size) {
> +					u64 end = start + drm_buddy_block_size(mm, block);
> +
> +					nentry->used_visible_size +=
> +						min(end, vram_mgr->visible_size) - start;
> +				}
> +			}
> +		}
> +		vram_mgr->visible_avail -= nentry->used_visible_size;
> +		list_for_each_entry_safe(pos, n, &vram_mgr->queued_pages, queued_link) {
> +			if (pos->id == nentry->id) {
> +				--vram_mgr->n_queued_pages;
> +				list_del(&pos->queued_link);
> +				break;
> +			}
> +		}
> +		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +		/* TODO: FW Integration: Send command to FW for offlining page */
> +		++vram_mgr->n_offlined_pages;
> +		mutex_unlock(&vram_mgr->lock);
> +		return ret;
> +
> +	} else {
> +		ret = drm_buddy_alloc_blocks(mm, addr, addr + size,
> +					     size, size, &nentry->blocks,
> +					     DRM_BUDDY_RANGE_ALLOCATION);
> +		if (ret) {
> +			drm_warn(&xe->drm, "Could not reserve page at addr:0x%lx, ret:%d\n",
> +				 addr, ret);
> +			nentry->status = fail;
> +			mutex_unlock(&vram_mgr->lock);
> +			return ret;
> +		}
> +		if ((addr + size) <= vram_mgr->visible_size) {
> +			nentry->used_visible_size = size;
> +		} else {
> +			struct drm_buddy_block *block;
> +
> +			list_for_each_entry(block, &nentry->blocks, link) {
> +				u64 start = drm_buddy_block_offset(block);
> +
> +				if (start < vram_mgr->visible_size) {
> +					u64 end = start + drm_buddy_block_size(mm, block);
> +
> +					nentry->used_visible_size +=
> +						min(end, vram_mgr->visible_size) - start;
> +				}
> +			}
> +		}
> +		vram_mgr->visible_avail -= nentry->used_visible_size;
> +		nentry->id = ++vram_mgr->n_offlined_pages;
> +		list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> +		/* TODO: FW Integration: Send command to FW for offlining page */
> +		mutex_unlock(&vram_mgr->lock);
> +	}
> +	/* Success */
> +	return ret;
> +}
> +
> +static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe,
> +							 resource_size_t addr)
> +{
> +	struct xe_vram_region *vr;
> +	struct xe_tile *tile;
> +	int id;
> +
> +	for_each_tile(tile, xe, id) {
> +		vr = tile->mem.vram;
> +		if ((addr <= vr->dpa_base + vr->actual_physical_size) &&
> +		    (addr + SZ_4K >= vr->dpa_base))
> +			return vr;
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * xe_ttm_vram_handle_addr_fault - Handle vram physical address error flaged
> + * @xe: pointer to parent device
> + * @addr: physical faulty address
> + *
> + * Handle the physcial faulty address error on specific tile.
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr)
> +{
> +	struct xe_ttm_vram_mgr *vram_mgr;
> +	struct xe_vram_region *vr;
> +	struct drm_buddy *mm;
> +	int ret;
> +
> +	vr = xe_ttm_vram_addr_to_region(xe, addr);
> +	WARN_ON(!vr);
> +	vram_mgr = &vr->ttm;
> +	mm = &vram_mgr->mm;
> +	 /* Reserve page at address */
> +	ret = xe_ttm_vram_reserve_page_at_addr(xe, addr, vram_mgr, mm);
> +	if (ret == -EIO)
> +		return 0; /* success, wedged by kernel. */
> +	return ret;
>  }
> -EXPORT_SYMBOL(xe_ttm_tbo_handle_addr_fault);
> +EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index 1d6075411ebf..8cc528434ceb 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -30,7 +30,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
>  u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>  void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>  			  u64 *used, u64 *used_visible);
> -int xe_ttm_tbo_handle_addr_fault(struct xe_tile *tile, unsigned long addr);
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, unsigned long addr);
>  static inline struct xe_ttm_vram_mgr_resource *
>  to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index a71e14818ec2..e1b48db27cfd 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
>  	struct ttm_resource_manager manager;
>  	/** @mm: DRM buddy allocator which manages the VRAM */
>  	struct drm_buddy mm;
> +	/** @offlined_pages: List of offlined pages */
> +	struct list_head offlined_pages;
> +	/** @n_offlined_pages: Number of offlined pages */
> +	u16 n_offlined_pages;
> +	/** @queued_pages: List of queued pages */
> +	struct list_head queued_pages;
> +       /** @n_queued_pages: Number of queued pages */
> +	u16 n_queued_pages;
>  	/** @visible_size: Proped size of the CPU visible portion */
>  	u64 visible_size;
>  	/** @visible_avail: CPU visible portion still unallocated */
> @@ -45,4 +53,19 @@ struct xe_ttm_vram_mgr_resource {
>  	unsigned long flags;
>  };
>  
> +struct xe_ttm_offline_resource {
> +	/** @offlined_link: Link to offlined pages */
> +	struct list_head offlined_link;
> +	/** @queued_link: Link to queued pages */
> +	struct list_head queued_link;
> +	/** @blocks: list of DRM buddy blocks */
> +	struct list_head blocks;
> +	/** @used_visible_size: How many CPU visible bytes this resource is using */
> +	u64 used_visible_size;
> +	/** @id: The id of an offline resource */
> +	u16 id;
> +	/** @status: reservation status of resource */
> +	bool status;
> +};
> +
>  #endif
