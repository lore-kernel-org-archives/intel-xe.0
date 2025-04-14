Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45CFC369B2
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 09:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFFE10E4FB;
	Mon, 14 Apr 2025 09:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k93J9Y2y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1742C10E4FB
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Apr 2025 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744622628; x=1776158628;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jKvC9UjoHhD8ht7OPG/ueNEL6+Psp14dMsOhsfRtGcM=;
 b=k93J9Y2y1njJKfYEAIpMQdU9jTXq1mY8oFu0D2wmjNgoFQMOSwPjgG0E
 MNcqVMTN/NbtGir8M6Bmac/itKiRbH5xzypc89qjh3WvUHGOLu4kFK99f
 emGga99O781YNwaH6wPYmKfeMKIoXA9aoxwHDnLHwtIZdoeutQYA5MW8V
 uUFuH/SBMyceL/HKI40i3ajazHFEE1W8u4/icFOU7+PMFDJPCHJ+jrEB8
 I+eKijbKFHJ4G3lSVqcpyEpU2HokqBOz1iunzg9LdECNHd6b/uk1abUSI
 E6zhwa5+1ZPkt19a5BsGNXGxcXpw0MZt9ljzDyR875K7orTsFiww3Ef9a A==;
X-CSE-ConnectionGUID: 4Fb6C8bWTXWyM8h6b5UfBw==
X-CSE-MsgGUID: j1CerLlsSKyomQbLT7/BpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49888322"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="49888322"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 02:23:45 -0700
X-CSE-ConnectionGUID: H4pu7YeFQXGbkwLCTf6wOQ==
X-CSE-MsgGUID: plFCE0MRQv+6pqH5arpiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="129752747"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa007.fm.intel.com with ESMTP; 14 Apr 2025 02:23:43 -0700
Received: from [10.245.114.177] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.114.177])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BCF3C33E85;
 Mon, 14 Apr 2025 10:23:41 +0100 (IST)
Message-ID: <179d9877-f260-49e3-a014-46c071a1c973@intel.com>
Date: Mon, 14 Apr 2025 11:23:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] drm/xe/vf: Shifting GGTT area post migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250411203626.3272415-1-tomasz.lis@intel.com>
 <20250411203626.3272415-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250411203626.3272415-3-tomasz.lis@intel.com>
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
> v7: Fixed typos, added `_locked` suffix to some functs, improved
>   readability of asserts, removed unneeded conditional
> v8: Moved one function, removed implementation detail from kerneldoc,
>   added asserts
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c              |  48 ++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h              |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 102 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++++
>  6 files changed, 177 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5a37233f2420..9fc0d57be00a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -484,6 +484,54 @@ void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node)
>  	drm_mm_remove_node(&node->base);
>  }
>  
> +static void xe_ggtt_assert_fit(struct xe_ggtt *ggtt, u64 start, u64 size)
> +{
> +	struct xe_tile *tile = ggtt->tile;
> +	struct xe_device *xe = tile_to_xe(tile);
> +	u64 __maybe_unused wopcm = xe_wopcm_size(xe);
> +
> +	xe_tile_assert(tile, start >= wopcm);
> +	xe_tile_assert(tile, start + size < ggtt->size - wopcm);
> +}
> +
> +/**
> + * xe_ggtt_shift_nodes_locked - Shift GGTT nodes to adjust for a change in usable address range.
> + * @ggtt: the &xe_ggtt struct instance
> + * @shift: change to the location of area provisioned for current VF
> + *
> + * This function moves all nodes from the GGTT VM, to a temp list. These nodes are expected
> + * to represent allocations in range formerly assigned to current VF, before the range changed.
> + * When the GGTT VM is completely clear of any nodes, they are re-added with shifted offsets.
> + *
> + * The function has no ability of failing - because it shifts existing nodes, without
> + * any additional processing. If the nodes were successfully existing at the old address,
> + * they will do the same at the new one. A fail inside this function would indicate that
> + * the list of nodes was either already damaged, or that the shift brings the address range
> + * outside of valid bounds. Both cases justify an assert rather than error code.
> + */
> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift)
> +{
> +	struct xe_tile *tile __maybe_unused = ggtt->tile;
> +	struct drm_mm_node *node, *tmpn;
> +	LIST_HEAD(temp_list_head);
> +	int err;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +

nit: my idea was to assert that we have room in the GGTT for that shift
ahead of doing any movements and if there is no easy way to get that
from the drm_mm is one call then do it like:

drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm)
	xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);

and then follow with pure code that we know it must be ok

> +	drm_mm_for_each_node_safe(node, tmpn, &ggtt->mm) {
> +		drm_mm_remove_node(node);
> +		list_add(&node->node_list, &temp_list_head);
> +	}
> +
> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> +		xe_ggtt_assert_fit(ggtt, node->start + shift, node->size);

so without this assert here (as we did it in a separate loop above)

> +		list_del(&node->node_list);
> +		node->start += shift;
> +		err = drm_mm_reserve_node(&ggtt->mm, node);
> +		xe_tile_assert(tile, !err);

maybe drop the 'err' assignment and just confirm that:

	xe_tile_assert(tile, xe_ggtt_node_allocated(node));

> +	}
> +}
> +
>  /**
>   * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>   * @node: the &xe_ggtt_node to be inserted
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index d468af96b465..4337a279ff3b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,6 +18,7 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  int xe_ggtt_node_insert_balloon_locked(struct xe_ggtt_node *node,
>  				       u64 start, u64 size);
>  void xe_ggtt_node_remove_balloon_locked(struct xe_ggtt_node *node);
> +void xe_ggtt_shift_nodes_locked(struct xe_ggtt *ggtt, s64 shift);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index fa299da08684..a822549169d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> +	config->ggtt_shift = start - (s64)config->ggtt_base;
>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
>  
> @@ -560,6 +561,24 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.lmem_size;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_ggtt_shift - Return shift in GGTT range due to VF migration
> + * @gt: the &xe_gt struct instance
> + *
> + * This function is for VF use only.
> + *
> + * Return: The shift value; could be negative
> + */
> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	return config->ggtt_shift;
> +}
> +
>  static int vf_init_ggtt_balloons(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -817,6 +836,89 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * DOC: GGTT nodes shifting during VF post-migration recovery
> + *
> + * The first fixup applied to the VF KMD structures as part of post-migration
> + * recovery is shifting nodes within &xe_ggtt instance. The nodes are moved
> + * from range previously assigned to this VF, into newly provisioned area.
> + * The changes include balloons, which are resized accordingly.
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

left side is little misaligned to above WOPCM (it that was the idea)

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
> + * memory content was copied to that new area. But the &xe_ggtt nodes are still
> + * tracking allocations using the old addresses. The nodes within VF owned area
> + * have to be shifted, and balloon nodes need to be resized to properly mask out
> + * areas not owned by the VF.
> + *
> + * Fixed &xe_ggtt nodes used for tracking allocations:
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

nit: function is about _GGTT_ so maybe we can drop ggtt_ prefix here?

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
> +	xe_gt_sriov_vf_deballoon_ggtt_locked(gt);
> +	xe_ggtt_shift_nodes_locked(ggtt, ggtt_shift);
> +	xe_gt_sriov_vf_balloon_ggtt_locked(gt);
> +	mutex_unlock(&ggtt->lock);
> +}
> +
>  /**
>   * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>   *   or just mark that a GuC is ready for it.
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index d717deb8af91..6e0da81d0359 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -20,6 +20,8 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  int xe_gt_sriov_vf_balloon_ggtt_locked(struct xe_gt *gt);
>  void xe_gt_sriov_vf_deballoon_ggtt_locked(struct xe_gt *gt);
> +s64 xe_gt_sriov_vf_ggtt_shift(struct xe_gt *gt);
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

btw, do we want to expose this in self_config where we already show GGTT
base and size? if so then update xe_gt_sriov_vf_print_config()

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

otherwise, LGTM

