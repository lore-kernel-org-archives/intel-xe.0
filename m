Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA54C3600C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F025B10E23E;
	Tue,  8 Apr 2025 13:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JP1LAAcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F6910E23E
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744118627; x=1775654627;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HDIttaZ9uiFGYJkYlufWORe1/otfJ3iZkL3KvVFufd8=;
 b=JP1LAAcE45kifPg6gznOVNnjvCWeOQqEr199OBlMjHkXQn2MCKGpkBSx
 Zqtq/X8pVGsRe2rOYLT1sE4oSII4rMqIm9yI6z06C3dn1f1j2Ny4CWXt0
 uuO6CkG1rKjMyQEOGUFZtzLk/8Hklr14K5CHEum8B8CWYaLNwR6wGFb2w
 NDdt+CGQrAZRWDFg1s6Bvx+gduVuks78u9UyF0+8a3v9Vg06hC8zE0leC
 ZR/PVVN4EEp450cawwf6TLo6lS99FOmWTY15MoUDjEy4S4C8pOaqTm+Vw
 jWXRGXlQI9p7isjvW2ISGUYPZHGpGsszN9xg+Oo7l3kfIwCjTwyzBzje/ g==;
X-CSE-ConnectionGUID: ZDO9xQrBQMqyOwDuihKxHg==
X-CSE-MsgGUID: E3gRqTvpTiCoBTJ058GIsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56531257"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="56531257"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 06:23:46 -0700
X-CSE-ConnectionGUID: +m4lK1T3Qc6nvVtgwZUW6Q==
X-CSE-MsgGUID: BKSg0IbORv67g0wVGHDXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="133424754"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2025 06:23:44 -0700
Received: from [10.245.96.73] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.73])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 54B4C34320;
 Tue,  8 Apr 2025 14:23:43 +0100 (IST)
Message-ID: <bb10b91b-9a47-4642-a023-15ae4780b7b4@intel.com>
Date: Tue, 8 Apr 2025 15:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/xe/vf: Shifting GGTT area post migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250403184055.2317409-1-tomasz.lis@intel.com>
 <20250403184055.2317409-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250403184055.2317409-3-tomasz.lis@intel.com>
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



On 03.04.2025 20:40, Tomasz Lis wrote:
> We have only one GGTT for all IOV functions, with each VF having assigned
> a range of addresses for its use. After migration, a VF can receive a
> different range of addresses than it had initially.
> 
> This implements shifting GGTT addresses within drm_mm nodes, so that
> VMAs stay valid after migration. This will make the driver use new
> addresses when accessing GGTT from the moment the shifting ends.
> 
> By taking the ggtt->lock for the period of VMA fixups, this change
> also adds constraint on that mutex. Any locks used during the recovery
> cannot ever wait for hardware response - because after migration,
> the hardware will not do anything until fixups are finished.
> 
> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>   after querying; improved documentation; switched some warns to asserts;
>   skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
> v3: Updated kerneldocs, removed unused funct, properly allocate
>   balloning nodes if non existent
> v4: Re-used ballooning functions from VF init, used bool in place of
>   standard error codes
> v5: Renamed one function
> v6: Subject tag change, several kerneldocs updated, some functions
>   renamed, some moved, added several asserts, shuffled declarations
>   of variables, revealed more detail in high level functions
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c              | 39 ++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h              |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 93 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  2 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          | 22 ++++++
>  6 files changed, 159 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 769a8dc9be6e..ab6717671542 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -484,6 +484,45 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>  	drm_mm_remove_node(&node->base);
>  }
>  
> +/**
> + * xe_ggtt_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
> + * @ggtt: the &xe_ggtt struct instance
> + * @shift: change to the location of area provisioned for current VF
> + *
> + * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
> + * to represent allocations in range formerly assigned to current VF, before the range changed.
> + * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
> + *
> + * The function has no ability of failing - because it shifts existing nodes, without
> + * any additional processing. If the nodes were successfully existing at the old address,
> + * they will do the same at the new one. A fail inside this function would indicate that> + * the list of nodes was either already damaged, or that the shift
brings the address ramge

typo

> + * outside of valid bounds. Both cases justify an assert rather than error code.
> + */
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift)

xe_ggtt_shift_nodes_locked() ?

> +{

	struct xe_tile *tile __maybe_unused = ggtt->tile;

> +	struct drm_mm_node *node, *tmpn;
> +	LIST_HEAD(temp_list_head);
> +	int err;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +

what about doing early exit here if shift is 0?

	if (!shift)
		return;

your asserts below will be simpler

> +	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {

btw, shouldn't we have asserts here instead?

> +		drm_mm_remove_node(node);
> +		list_add(&node->node_list, &temp_list_head);
> +	}
> +
> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> +		xe_tile_assert(ggtt->tile, shift >= 0 || node->start >= (u64)(-shift));

shouldn't this be:

xe_tile_assert(tile, node->start + shift >= xe_wopcm_size(xe));
xe_tile_assert(tile, node->start + node->size + shift <
		ggtt->size - xe_wopcm_size(xe));

or maybe better introduce:

xe_ggtt_assert_fit(ggtt, start, size)
{
	xe_tile_assert(tile, start >= wopcm);
	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
}

and then:

	xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);

> +		xe_tile_assert(ggtt->tile, shift <= 0 || node->start + node->size <
> +			       node->start + node->size + (u64)shift);
> +		list_del(&node->node_list);
> +		node->start += shift;
> +		err = drm_mm_reserve_node(&ggtt->mm, node);
> +		xe_tile_assert(ggtt->tile, !err);
> +	}
> +}
> +
>  /**
>   * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>   * @node: the &xe_ggtt_node to be inserted
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 27e7d67de004..eb39023c4e1b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>  				u64 start, u64 size);
>  void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
> +void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, s64 shift);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index c3ca33725161..50b0c3b7be8c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -415,12 +415,20 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> +	config->ggtt_shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
>  
>  	return config->ggtt_size ? 0 : -ENODATA;
>  }
>  
> +s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)

public functions are required to have kernel-doc

> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +
> +	return config->ggtt_shift;
> +}
> +
>  static int vf_get_lmem_info(struct xe_gt *gt)
>  {
>  	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> @@ -809,6 +817,91 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * DOC: GGTT nodes shifting during VF post-migration recovery
> + *
> + * The first fixup applied to the VF KMD structures as part of post-migration
> + * recovery is shifting nodes within xe_ggtt instance. The nodes are moved
> + * from range previously assigned to this VF, into newly provisioned area.
> + * The chanes include balloons, which are resized accordingly.

typo

> + *
> + * The balloon nodes are there to eliminate unavailable ranges from use: one
> + * reserves the GGTT area below the range for current VF, and another one
> + * reserves area above.
> + *
> + * Below is a GGTT layout of example VF, with a certain address range assigned to
> + * said VF, and inaccessible areas above and below:
> + *
> + *  0                                                                        4GiB
> + *  |<--------------------------- Total GGTT size ----------------------------->|
> + *      WOPCM                                                         GUC_TOP
> + *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
> + *
> + *  +---+---------------------------------+----------+----------------------+---+
> + *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
> + *  +---+---------------------------------+----------+----------------------+---+
> + *
> + * Hardware enforced access rules before migration:
> + *
> + *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> + *
> + * GGTT nodes used for tracking allocations:
> + *
> + *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
> + *
> + * After the migration, GGTT area assigned to the VF might have shifted, either
> + * to lower or to higher address. But we expect the total size and extra areas to
> + * be identical, as migration can only happen between matching platforms.
> + * Below is an example of GGTT layout of the VF after migration. Content of the
> + * GGTT for VF has been moved to a new area, and we receive its address from GuC:
> + *
> + *  +---+----------------------+----------+---------------------------------+---+
> + *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
> + *  +---+----------------------+----------+---------------------------------+---+
> + *
> + * Hardware enforced access rules after migration:
> + *
> + *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
> + *
> + * So the VF has a new slice of GGTT assigned, and during migration process, the
> + * memory content was copied to that new area. But the drm_mm nodes within xe kmd
> + * are still tracking allocations using the old addresses. The nodes within VF
> + * owned area have to be shifted, and balloon nodes need to be resized to
> + * properly mask out areas not owned by the VF.
> + *
> + * Fixed drm_mm nodes used for tracking allocations:
> + *
> + *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> + *
> + * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> + * overlap; but our node shifting will fix addresses properly regardless.
> + */
> +
> +/**
> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * @gt: the &xe_gt struct instance
> + * @ggtt_shift: the shift value
> + *
> + * Since Global GTT is not virtualized, each VF has an assigned range
> + * within the global space. This range might have changed during migration,
> + * which requires all memory addresses pointing to GGTT to be shifted.
> + */
> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	mutex_lock(&ggtt->lock);
> +	if (ggtt_shift) {

early exit before taking a lock?

> +		xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
> +		xe_ggtt_shift_nodes(ggtt, ggtt_shift);
> +		xe_gt_sriov_vf_balloon_ggtt_locked(gt);
> +	}
> +	mutex_unlock(&ggtt->lock);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>   *   or just mark that a GuC is ready for it.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index d717deb8af91..904a600063e6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>  void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
> +s32 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt, s64 ggtt_shift);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index a57f13b5afcd..5ccbdf8d08b6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -40,6 +40,8 @@ struct xe_gt_sriov_vf_selfconfig {
>  	u64 ggtt_base;
>  	/** @ggtt_size: assigned size of the GGTT region. */
>  	u64 ggtt_size;
> +	/** @ggtt_shift: difference in ggtt_base on last migration */
> +	s64 ggtt_shift;
>  	/** @lmem_size: assigned size of the LMEM. */
>  	u64 lmem_size;
>  	/** @num_ctxs: assigned number of GuC submission context IDs. */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index c1275e64aa9c..e70f1ceabbb3 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_gt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_pm.h"
> @@ -170,6 +171,25 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>  	work_pending(&xe->sriov.vf.migration.worker);
>  }
>  
> +static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)

nit: the "fixup" word in the function name here, which means "shift"
here, slightly conflicts with the "fixup" in the steps we plan to do
later, where we actually will do some "fixup" due to shifted GGTT

so maybe:

s/vf_post_migration_fixup_ggtt_nodes/vf_post_migration_shift_ggtt_nodes
s/xe_gt_sriov_vf_fixup_ggtt_nodes/xe_gt_sriov_vf_shift_ggtt_nodes

but likely you will resist like always ...

> +{
> +	bool need_fixups = false;
> +	struct xe_tile *tile;
> +	unsigned int id;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_gt *gt = tile->primary_gt;
> +		s64 shift;
> +
> +		shift = xe_gt_sriov_vf_ggtt_shift(gt);
> +		if (shift) {
> +			need_fixups = true;
> +			xe_gt_sriov_vf_fixup_ggtt_nodes(gt, shift);
> +		}
> +	}
> +	return need_fixups;
> +}
> +
>  /*
>   * Notify all GuCs about resource fixups apply finished.
>   */
> @@ -191,6 +211,7 @@ static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
>  
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
> +	bool need_fixups;
>  	int err;
>  
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	if (unlikely(err))
>  		goto fail;
>  
> +	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);

