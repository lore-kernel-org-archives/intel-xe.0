Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D17DC369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 08:53:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C4F10E4E9;
	Mon, 14 Apr 2025 08:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiDp5GgS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD18D10E4E9
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 08:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744620813; x=1776156813;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hoO0UVH+ojwyGoswHc6XBf+m9wBvJtgjxXj6Diq/h2I=;
 b=IiDp5GgSPfiGer5ekqhLLFSBWOsgaW8tDafirvtIbk8IG8InYuTrR7s7
 NuzGVW0hiNiFgDwG+fmT0wKFMHeGKY1KgMug9Y77V7pz9znUNI6t+01Bi
 r3QH6yeA10kjkHl9zloodNn1In9FLaculHJWt7A57XvtlSE2v3YcETCxr
 Dx459vEaIY9dgWctxBabaH/lM6BenJ3dgxiB2HmfRG43p81Q8WeMV2fo/
 Bq36Tk3Zei9YwmOF3ngtV5r+cj6rY23cXj6MU313d7LoU9P4WeKxjYRvS
 fRTiSsnzzT7OFuUWLH94Ux6D8AQj+QXm2VMvtAk+RHIEDPh3wiuyNnOpI Q==;
X-CSE-ConnectionGUID: Rj8mklqwQwCTyruMxVTOLg==
X-CSE-MsgGUID: Ju+KcKCLS7y+g5qRZO+OTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45992240"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="45992240"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 01:53:31 -0700
X-CSE-ConnectionGUID: 35VRCjeKQvOKcrmHhbH0Lw==
X-CSE-MsgGUID: gE+j6akmQya+McQ+EbuIoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="130740516"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 14 Apr 2025 01:53:28 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2AA4428780;
 Mon, 14 Apr 2025 09:53:27 +0100 (IST)
Message-ID: <d4db6abc-745e-4d20-9943-9ed7d3cb86b0@intel.com>
Date: Mon, 14 Apr 2025 10:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] drm/xe/vf: Divide GGTT ballooning into allocation
 and insertion
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250411203626.3272415-1-tomasz.lis@intel.com>
 <20250411203626.3272415-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250411203626.3272415-2-tomasz.lis@intel.com>
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



On 11.04.2025 22:36, Tomasz Lis wrote:
> The balloon nodes, which are used to fill areas of GGTT inaccessible
> for a specific VF, were allocated and inserted into GGTT within one
> function. To be able to re-use that insertion code during VF
> migration recovery, we need to split it.
> 
> This patch separates allocation (init/fini functs) from the insertion
> of balloons (balloon/deballoon functs). Locks are also moved to ensure
> calls from post-migration recovery worker will not cause a deadlock.
> 
> v2: Moved declarations to proper header
> v3: Rephrased description, introduced "_locked" versions of some
>   functs, more lockdep checks, some functions renamed, altered error
>   handling, added missing kerneldocs.
> v4: Suffixed more functs with `_locked`, moved lockdep asserts,
>   fixed finalization in error path, added asserts
> v5: Renamed another few functs, used xe_ggtt_node_allocated(),
>   moved lockdep back again to avoid null dereference, added
>   asserts, improved comments
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c        |  35 ++++-----
>  drivers/gpu/drm/xe/xe_ggtt.h        |   6 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 114 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   2 +
>  4 files changed, 107 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 7062115909f2..5a37233f2420 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -429,16 +429,17 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
>  }
>  
>  /**
> - * xe_ggtt_node_insert_balloon - prevent allocation of specified GGTT addresses
> + * xe_ggtt_node_insert_balloon_locked - prevent allocation of specified GGTT addresses
>   * @node: the &xe_ggtt_node to hold reserved GGTT node
>   * @start: the starting GGTT address of the reserved region
>   * @end: then end GGTT address of the reserved region
>   *
> - * Use xe_ggtt_node_remove_balloon() to release a reserved GGTT node.
> + * To be used in cases where ggtt->lock is already taken.
> + * Use xe_ggtt_node_remove_balloon_locked() to release a reserved GGTT node.
>   *
>   * Return: 0 on success or a negative error code on failure.
>   */
> -int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
> +int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node, u64 start, u64 end)
>  {
>  	struct xe_ggtt *ggtt = node->ggtt;
>  	int err;
> @@ -447,14 +448,13 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
>  	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
>  	xe_tile_assert(ggtt->tile, !drm_mm_node_allocated(&node->base));
> +	lockdep_assert_held(&ggtt->lock);
>  
>  	node->base.color = 0;
>  	node->base.start = start;
>  	node->base.size = end - start;
>  
> -	mutex_lock(&ggtt->lock);
>  	err = drm_mm_reserve_node(&ggtt->mm, &node->base);
> -	mutex_unlock(&ggtt->lock);
>  
>  	if (xe_gt_WARN(ggtt->tile->primary_gt, err,
>  		       "Failed to balloon GGTT %#llx-%#llx (%pe)\n",
> @@ -466,27 +466,22 @@ int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
>  }
>  
>  /**
> - * xe_ggtt_node_remove_balloon - release a reserved GGTT region
> + * xe_ggtt_node_remove_balloon_locked - release a reserved GGTT region
>   * @node: the &xe_ggtt_node with reserved GGTT region
>   *
> - * See xe_ggtt_node_insert_balloon() for details.
> + * To be used in cases where ggtt->lock is already taken.
> + * See xe_ggtt_node_insert_balloon_locked() for details.
>   */
> -void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
> +void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>  {
> -	if (!node || !node->ggtt)
> +	if (!xe_ggtt_node_allocated(node))
>  		return;
>  
> -	if (!drm_mm_node_allocated(&node->base))
> -		goto free_node;
> +	lockdep_assert_held(&node->ggtt->lock);
>  
>  	xe_ggtt_dump_node(node->ggtt, &node->base, "remove-balloon");
>  
> -	mutex_lock(&node->ggtt->lock);
>  	drm_mm_remove_node(&node->base);
> -	mutex_unlock(&node->ggtt->lock);
> -
> -free_node:
> -	xe_ggtt_node_fini(node);
>  }
>  
>  /**
> @@ -537,12 +532,12 @@ int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
>   * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
>   * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
>   *
> - * This function will allocated the struct %xe_ggtt_node and return it's pointer.
> + * This function will allocate the struct %xe_ggtt_node and return its pointer.
>   * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * or xe_ggtt_node_remove_balloon().
> + * or xe_ggtt_node_remove_balloon_locked().
>   * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
>   * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * xe_ggtt_node_insert_balloon() will ensure the node is inserted or reserved in GGTT.
> + * xe_ggtt_node_insert_balloon_locked() will ensure the node is inserted or reserved in GGTT.
>   *
>   * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
>   **/
> @@ -564,7 +559,7 @@ struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
>   * @node: the &xe_ggtt_node to be freed
>   *
>   * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
> - * or xe_ggtt_node_insert_balloon(); and this @node is not going to be reused, then,
> + * or xe_ggtt_node_insert_balloon_locked(); and this @node is not going to be reused, then,
>   * this function needs to be called to free the %xe_ggtt_node struct
>   **/
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 27e7d67de004..d468af96b465 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -15,9 +15,9 @@ int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
>  struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
>  void xe_ggtt_node_fini(struct xe_ggtt_node *node);
> -int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
> -				u64 start, u64 size);
> -void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
> +int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
> +				       u64 start, u64 size);
> +void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a439261bf4d7..fa299da08684 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -560,35 +560,43 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.lmem_size;
>  }
>  
> -static struct xe_ggtt_node *
> -vf_balloon_ggtt_node(struct xe_ggtt *ggtt, u64 start, u64 end)
> +static int vf_init_ggtt_balloons(struct xe_gt *gt)
>  {
> -	struct xe_ggtt_node *node;
> -	int err;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -	node = xe_ggtt_node_init(ggtt);
> -	if (IS_ERR(node))
> -		return node;
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
>  
> -	err = xe_ggtt_node_insert_balloon(node, start, end);
> -	if (err) {
> -		xe_ggtt_node_fini(node);
> -		return ERR_PTR(err);
> +	tile->sriov.vf.ggtt_balloon[0] = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> +
> +	tile->sriov.vf.ggtt_balloon[1] = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> +		xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> +		return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
>  	}
>  
> -	return node;
> +	return 0;
>  }
>  
> -static int vf_balloon_ggtt(struct xe_gt *gt)
> +/**
> + * xe_gt_sriov_vf_balloon_ggtt_locked - Insert balloon nodes to limit used GGTT address range.
> + * @gt: the &xe_gt struct instance
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
>  	struct xe_tile *tile = gt_to_tile(gt);
> -	struct xe_ggtt *ggtt = tile->mem.ggtt;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u64 start, end;
> +	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>  	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +	lockdep_assert_held(&tile->mem.ggtt->lock);
>  
>  	if (!config->ggtt_size)
>  		return -ENODATA;
> @@ -611,31 +619,77 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
>  	start = xe_wopcm_size(xe);
>  	end = config->ggtt_base;
>  	if (end != start) {
> -		tile->sriov.vf.ggtt_balloon[0] = vf_balloon_ggtt_node(ggtt, start, end);
> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[0]))
> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[0]);
> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[0],
> +							 start, end);
> +		if (err)
> +			return err;
>  	}
>  
>  	start = config->ggtt_base + config->ggtt_size;
>  	end = GUC_GGTT_TOP;
>  	if (end != start) {
> -		tile->sriov.vf.ggtt_balloon[1] = vf_balloon_ggtt_node(ggtt, start, end);
> -		if (IS_ERR(tile->sriov.vf.ggtt_balloon[1])) {
> -			xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
> -			return PTR_ERR(tile->sriov.vf.ggtt_balloon[1]);
> +		err = xe_ggtt_node_insert_balloon_locked(tile->sriov.vf.ggtt_balloon[1],
> +							 start, end);
> +		if (err) {
> +			xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> +			return err;
>  		}
>  	}
>  
>  	return 0;
>  }
>  
> -static void deballoon_ggtt(struct drm_device *drm, void *arg)
> +static int vf_balloon_ggtt(struct xe_gt *gt)
>  {
> -	struct xe_tile *tile = arg;
> +	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
> +	int err;
> +
> +	mutex_lock(&ggtt->lock);
> +	err = xe_gt_sriov_vf_balloon_ggtt_locked(gt);
> +	mutex_unlock(&ggtt->lock);

btw, this explicit locking done by the caller seems to conflict with
another patch in flight [1] what's the plan if it would be accepted earlier?

[1] https://patchwork.freedesktop.org/patch/647204/?series=147326&rev=2

> +
> +	return err;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_deballoon_ggtt_locked - Remove balloon nodes.
> + * @gt: the &xe_gt struct instance
> + */
> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
>  
>  	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> -	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[1]);
> -	xe_ggtt_node_remove_balloon(tile->sriov.vf.ggtt_balloon[0]);
> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_node_remove_balloon_locked(tile->sriov.vf.ggtt_balloon[0]);
> +}
> +
> +static void vf_deballoon_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	mutex_lock(&tile->mem.ggtt->lock);
> +	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
> +	mutex_unlock(&tile->mem.ggtt->lock);
> +}
> +
> +static void vf_fini_ggtt_balloons(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_node_fini(tile->sriov.vf.ggtt_balloon[0]);
> +}
> +
> +static void cleanup_ggtt(struct drm_device *drm, void *arg)
> +{
> +	struct xe_tile *tile = arg;

looks that after refactor a better argument here could be "gt" instead
"tile" as then it could be passed as-is to below functions

or some day in the future we can try how it would look if some of the
static vf_ helper functions will take "tile" instead of "gt" ;)

> +
> +	vf_deballoon_ggtt(tile->primary_gt);
> +	vf_fini_ggtt_balloons(tile->primary_gt);
>  }
>  
>  /**
> @@ -655,11 +709,17 @@ int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
>  	if (xe_gt_is_media_type(gt))
>  		return 0;
>  
> -	err = vf_balloon_ggtt(gt);
> +	err = vf_init_ggtt_balloons(gt);
>  	if (err)
>  		return err;
>  
> -	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
> +	err = vf_balloon_ggtt(gt);
> +	if (err) {
> +		vf_fini_ggtt_balloons(gt);
> +		return err;
> +	}
> +
> +	return drmm_add_action_or_reset(&xe->drm, cleanup_ggtt, tile);

pass "gt" here to avoid reverse tile to gt dance in the action

>  }
>  
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index ba6c5d74e326..d717deb8af91 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,6 +18,8 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
> +void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  

otherwise LGTM

