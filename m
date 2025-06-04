Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43ADC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 12:10:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA3010E5F7;
	Wed,  4 Jun 2025 12:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oGsLgZjM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279C410E5F7
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 12:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749039026; x=1780575026;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=c+cu7ldrB2LVrav6KD2S98ImdT54ONnm7E+w8DcyP6Q=;
 b=oGsLgZjMBNVLQJs+oJ6N5BalrjVWx+hoROEDxOebb9NbNqAmBQjZeG3o
 9epjlnY8ZlijSdJ2fuMLsViJyGAsyqdUppRo7IhTFTL5oXd51U5uSJl0f
 A4mEmkt2iZ7Psx7ZqdAOsK9eJmS+Tc/F9HEJVZoDlUnnpOE5MtylAxGMF
 YhKJOjkL8k7NOEynTyUlRXugbsha4DHw2UTpC8q4z6yQZVXcREgUAyhLz
 Bz9rlG2UlcPlP/L83XhpJsW/ke7cpYNBWD7AgeJ2l4qTwlfy86rvoeiAG
 n7vlm+e2UDOW4WyYroZ1vtSbeB0/vlbvndr6B+yyQ9aO+PyBwvAKH0XqS A==;
X-CSE-ConnectionGUID: SoW/87JtQCe7kvc/q8Uowg==
X-CSE-MsgGUID: 4XlVnJBEScuSUq2G3cPApQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51263320"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="51263320"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:10:26 -0700
X-CSE-ConnectionGUID: 3jF3lTChTKm+2hH9iBIDkA==
X-CSE-MsgGUID: rsx1P2GtTHabzKKbvGw2yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="150212853"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 04 Jun 2025 05:10:22 -0700
Received: from [10.245.253.198] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.253.198])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CA57533BF1;
 Wed,  4 Jun 2025 13:10:20 +0100 (IST)
Message-ID: <2edc09f0-715a-4a30-8e73-9b0d2e228242@intel.com>
Date: Wed, 4 Jun 2025 14:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/vf: Introduce helpers to access GGTT
 configuration
To: Maarten Lankhorst <maarten@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: Tomasz Lis <tomasz.lis@intel.com>
References: <20250602103325.549-1-michal.wajdeczko@intel.com>
 <20250602103325.549-2-michal.wajdeczko@intel.com>
 <d499803a-8b64-40fa-adb4-ed42d91e011f@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d499803a-8b64-40fa-adb4-ed42d91e011f@lankhorst.se>
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



On 04.06.2025 11:36, Maarten Lankhorst wrote:
> Hey,
> 
> I'm trying for a different direction for this path series. I want to move all ggtt handling to xe_ggtt.c again,
> so I had to remove all the code that pokes around into xe_ggtt internals.
> 
> Can you test the patch I attached below instead?

oops, this series is already merged

> It might require the rest of my GGTT cleanup series, I will resubmit those if they don't apply.
> 
> On 2025-06-02 12:33, Michal Wajdeczko wrote:

...

> ----8<----
> 
> commit 40985bb758b283beba80d92e71e360aa2cc80783
> Author: Maarten Lankhorst <dev@lankhorst.se>
> Date:   Mon May 26 14:52:21 2025 +0200
> 
>     drm/xe: Make xe_ggtt_shift_nodes shift balloons as well
>     
>     Do not manipulate xe_ggtt from xe_gt_sriov_vf, instead give
>     xe_ggtt_shift_nodes() the ability to resize and move the balloon
>     nodes as well.
>     
>     Empty balloons do not get re-added. I'm not sure if this corner
>     case happens in practice though.
>     
>     This removes the need for ggtt->lock from xe_gt_sriov_vf, and
>     leaves the GGTT modification logic entirely in xe_ggtt.c
>     
>     Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>     Cc: Tomasz Lis <tomasz.lis@intel.com>
>     Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index c32803b31bada..1e5f8901bf513 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -462,22 +462,21 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>  }
>  
>  /**
> - * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
> + * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
>   * @node: the &xe_ggtt_node to hold reserved GGTT node
>   * @start: the starting GGTT address of the reserved region
>   * @end: then end GGTT address of the reserved region
>   *
> - * To be used in cases where ggtt->lock is already taken.
> - * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
> + * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
> +int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>  {
>  	struct xe_ggtt *ggtt = node->ggtt;
>  	int err;
>  
> -	xe_tile_assert(ggtt->tile, start < end);
> +	xe_tile_assert(ggtt->tile, start <= end);
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
>  	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> @@ -487,26 +486,41 @@ int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64
>  	node->base.start = start;
>  	node->base.size = end - start;
>  
> -	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> +	if (node->base.size)
> +		err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> +	else
> +		err = 0;
>  
>  	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>  		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
>  		       node->base.start, node->base.start + node->base.size, ERR_PTR(err)))
>  		return err;
>  
> +	if (start == xe_wopcm_size(tile_to_xe(ggtt->tile)))
> +		ggtt->balloon_start = &node->base;
> +	else if (end == ggtt->size)
> +		ggtt->balloon_end = &node->base;
> +
>  	xe_ggtt_dump_node(ggtt, &node->base, "balloon");
>  	return 0;
>  }
>  
>  /**
> - * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
> + * xe_ggtt_node_remove_balloon - release a reserved GGTT region
>   * @node: the &xe_ggtt_node with reserved GGTT region
>   *
> - * To be used in cases where ggtt->lock is already taken.
> - * See xe_ggtt_node_insert_balloon_locked() for details.
> + * See xe_ggtt_node_insert_balloon() for details.
>   */
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
> +void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>  {
> +	struct xe_ggtt *ggtt = node->ggtt;
> +
> +	if (ggtt && &node->base == ggtt->balloon_start)
> +		ggtt->balloon_start = NULL;
> +
> +	if (ggtt && &node->base == ggtt->balloon_end)
> +		ggtt->balloon_end = NULL;
> +
>  	if (!xe_ggtt_node_allocated(node))
>  		return;
>  
> @@ -517,18 +531,8 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>  	drm_mm_remove_node(&node->base);
>  }
>  
> -static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> -{
> -	struct xe_tile *tile = ggtt->tile;
> -	struct xe_device *xe = tile_to_xe(tile);
> -	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
> -
> -	xe_tile_assert(tile, start >= wopcm);
> -	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
> -}
> -
>  /**
> - * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
>   * @ggtt: the &xe_ggtt struct instance
>   * @shift: change to the location of area provisioned for current VF
>   *
> @@ -542,29 +546,73 @@ static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
>   * the list of nodes was either already damaged, or that the shift brings the address range
>   * outside of valid bounds. Both cases justify an assert rather than error code.
>   */
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)
>  {
>  	struct xe_tile *tile __maybe_unused = ggtt->tile;
>  	struct drm_mm_node *node, *tmpn;
> +	u64 ggtt_start __maybe_unused = xe_wopcm_size(tile_to_xe(ggtt->tile));
>  	LIST_HEAD(temp_list_head);
>  
> -	lockdep_assert_held(&ggtt->lock);
> +	mutex_lock(&ggtt->lock);
>  
> +	if (ggtt->balloon_start) {
> +		/*
> +		 * Balloon at the beginning, only end is adjusted,
> +		 * ensure it's possible with size >= 0)
> +		 */
> +		node = ggtt->balloon_start;
> +		xe_tile_assert(tile, node->start + shift + node->size < ggtt->size);
> +		xe_tile_assert(tile, node->start + shift + node->size > ggtt_start);
> +
> +		if (drm_mm_node_allocated(node))
> +			drm_mm_remove_node(node);
> +
> +		node->size += shift;
> +		if (node->size)
> +			list_add_tail(&node->node_list, &temp_list_head);
> +	}
> +
> +	if (ggtt->balloon_end) {
> +		/*
> +		 * Balloon at the end, only start is adjusted,
> +		 * ensure it's possible with (size >= 0)
> +		 */
> +		node = ggtt->balloon_end;
> +		xe_tile_assert(tile, node->start + shift >= ggtt_start);
> +		xe_tile_assert(tile, node->start + shift < ggtt->size);
> +
> +		if (drm_mm_node_allocated(node))
> +			drm_mm_remove_node(node);
> +
> +		node->start += shift;
> +		node->size -= shift;
> +		if (node->size)
> +			list_add_tail(&node->node_list, &temp_list_head);
> +	}
> +
> +	/* Remaining, actual nodes */
>  	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
> -			xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);
> +		drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> +			xe_tile_assert(tile, node->start + shift >= ggtt_start);
> +			xe_tile_assert(tile, node->start + shift + node->size <= ggtt->size);
> +		}
>  
>  	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
>  		drm_mm_remove_node(node);
> -		list_add(&node->node_list, &temp_list_head);
> +
> +		node->start += shift;
> +		list_add_tail(&node->node_list, &temp_list_head);
>  	}
>  
> +	/* Finally, insert balloons and nodes into their new locations */
>  	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
>  		list_del(&node->node_list);
> -		node->start += shift;
> +
>  		drm_mm_reserve_node(&ggtt->mm, node);
>  		xe_tile_assert(tile, drm_mm_node_allocated(node));
>  	}
> +
> +	mutex_unlock(&ggtt->lock);
>  }
>  
>  static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> @@ -608,7 +656,7 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>   * or xe_ggtt_node_remove_balloon().
>   * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
>   * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_transform(),
> - * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
> + * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   **/
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 3951d9af97aa8..48f96267a7891 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,10 +18,10 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> -int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> +int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>  				       u64 start, u64 size);
> -void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> -void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
> +void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  struct xe_ggtt_node *
> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
> index 18b5466ae8e6f..3454a3c7686d1 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
> @@ -12,6 +12,7 @@
>  
>  struct xe_bo;
>  struct xe_gt;
> +struct xe_ggtt_node;
>  
>  /**
>   * struct xe_ggtt - Main GGTT struct
> @@ -49,6 +50,10 @@ struct xe_ggtt {
>  	unsigned int access_count;
>  	/** @wq: Dedicated unordered work queue to process node removals */
>  	struct workqueue_struct *wq;
> +	/** @balloon_start: Optional balloon at the beginning of GGTT, may be zero-sized */
> +	struct drm_mm_node *balloon_start;
> +	/** @balloon_end: Optional balloon at the end of GGTT, may be zero-sized */
> +	struct drm_mm_node *balloon_end;

ha, it's similar what I was trying back in 2020, see [1]

[1] https://patchwork.freedesktop.org/patch/383138/?series=80177&rev=1

>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4ff7ae1a5f16c..8b8604bdedb48 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -600,12 +600,7 @@ static int vf_init_ggtt_balloons(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -/**
> - * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> - * @gt: the &xe_gt struct instance
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
> +static int vf_balloon_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -615,7 +610,6 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> -	lockdep_assert_held(&tile->mem.ggtt->lock);
>  
>  	if (!config->ggtt_size)
>  		return -ENODATA;
> @@ -638,7 +632,7 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>  	start = xe_wopcm_size(xe);
>  	end = config->ggtt_base;
>  	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> +		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[0],
>  							 start, end);
>  		if (err)
>  			return err;
> @@ -647,10 +641,11 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>  	start = config->ggtt_base + config->ggtt_size;
>  	end = GUC_GGTT_TOP;
>  	if (end != start) {
> -		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> +		err = xe_ggtt_node_insert_balloon(tile->sriov.vf.ggtt_balloon[1],
>  							 start, end);
>  		if (err) {
> -			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> +			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
> +			tile->sriov.vf.ggtt_balloon[0] = NULL;
>  			return err;
>  		}
>  	}
> @@ -658,38 +653,13 @@ int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>  	return 0;
>  }
>  
> -static int vf_balloon_ggtt(struct xe_gt *gt)
> -{
> -	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> -	int err;
> -
> -	mutex_lock(&ggtt->lock);
> -	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
> -	mutex_unlock(&ggtt->lock);
> -
> -	return err;
> -}
> -
> -/**
> - * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> - * @gt: the &xe_gt struct instance
> - */
> -void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
> -{
> -	struct xe_tile *tile = gt_to_tile(gt);
> -
> -	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> -}
> -
>  static void vf_deballoon_ggtt(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
>  
> -	mutex_lock(&tile->mem.ggtt->lock);
> -	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
> -	mutex_unlock(&tile->mem.ggtt->lock);
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);

as xe_ggtt would now understand balloons, do we (VF) still need to
maintain tile->sriov.vf.ggtt_balloon separately from the xe_ggtt?

or maybe we should go one more step and don't keep absolute GGTT
addresses in the drm_mm_node but just a relative offset from the start
point that would be also maintained in the xe_ggtt

then for the native/PF this start point would be WOPCM and for the VF
the ggtt_base config received from the GuC

the bonus will be that actual "shift" operation will be limited just to
touching the start point, and maybe there would be no need for balloons?

something like this:

int xe_ggtt_init_early(struct xe_ggtt *ggtt)
{
...
 	if (VF) {
		ggtt->begin = primary_gt->sriov.vf.config.ggtt_base;
		ggtt->size = primary_gt->sriov.vf.config.ggtt_size;
	} else {
		ggtt->begin = wopcm_size;
		ggtt->size = GUC_GGTT_TOP - ggtt->begin;
	}
	xe_tile_assert(..., ggtt->begin >= wopcm_size);
	xe_tile_assert(..., ggtt->begin + ggtt->size <= GUC_GGTT_TOP);

	drm_mm_init(&ggtt->mm, 0, ggtt->size);
...
}

u64 xe_ggtt_node_address(struct xe_ggtt_node *node)
{
	return xe_ggtt_node_allocated(node) ?
		node->ggtt->begin + node->base.start : 0;
}

void xe_ggtt_shift(struct xe_ggtt *ggtt, s64 shift)
{
	ggtt->begin += shift;

	xe_tile_assert(..., ggtt->begin >= wopcm_size);
	xe_tile_assert(..., ggtt->begin + ggtt->size <= GUC_GGTT_TOP);
}

>  }
>  
>  static void vf_fini_ggtt_balloons(struct xe_gt *gt)
> @@ -912,11 +882,7 @@ void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift)
>  
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>  
> -	mutex_lock(&ggtt->lock);
> -	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
> -	xe_ggtt_shift_nodes_locked(ggtt, shift);
> -	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
> -	mutex_unlock(&ggtt->lock);
> +	xe_ggtt_shift_nodes(ggtt, shift);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 9db41afddd5a8..8956fed594996 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,8 +18,6 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> -int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
> -void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>  s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
>  void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 shift);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
> 

