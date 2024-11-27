Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357DAD6D245
	for <intel-xe@archiver.kernel.org>; Wed, 27 Nov 2024 22:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C448A10E052;
	Wed, 27 Nov 2024 22:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtEPnCRQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C93210E052
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Nov 2024 22:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732746634; x=1764282634;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tFOVH1EDx1dTOqKtGFj9kiV6V+45fIosH/WwRD/nXOo=;
 b=OtEPnCRQBh1+vIaTpVMgdTi3MH8f/6+5aUSBTjRnsUHNxRNepFPAb+Lt
 A8efOPAu/q3+sGJeC3muLU77RiLuJ3JxnuGYg0nuvTp8HN5SBkYJq/fUA
 UZFYJE9J8VwG5IerfMPimxbas1piLxla/DaW5dTo4G7QtunA/SGA5Tb9x
 I3EcRBBTB0zF0fNd67WscKINVWXDvUgZP8lbl/ilX93qA3Xcmm+uAn85X
 kVRHQnRBPhiK9gfg8Ag5SnNMpDU9iHrvC4btF8Zoz6rsWKKdOFz7ecMKN
 qM/Fz4q4CGk6bRROQmrhZD4KcvqQRadCy4SprekMKzxtDaNWHbRODVW72 Q==;
X-CSE-ConnectionGUID: x6DDFVycQPujy8kuS4h/5A==
X-CSE-MsgGUID: b5nGN6wxRBeC+FxygFCXhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36895279"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="36895279"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 14:30:33 -0800
X-CSE-ConnectionGUID: La4xwcj4SVene8ZkoRELBA==
X-CSE-MsgGUID: 6EO5nLohR7eVVGyhKQMt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="92902534"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 14:30:32 -0800
Received: from [10.245.96.154] (unknown [10.245.96.154])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 4DED72FC51;
 Wed, 27 Nov 2024 22:30:30 +0000 (GMT)
Message-ID: <20379fa5-3cbb-4753-8d65-de390197d6dd@intel.com>
Date: Wed, 27 Nov 2024 23:30:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe/sriov: Shifting GGTT area post migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241123031333.3435414-1-tomasz.lis@intel.com>
 <20241123031333.3435414-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241123031333.3435414-3-tomasz.lis@intel.com>
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



On 23.11.2024 04:13, Tomasz Lis wrote:
> We have only one GGTT for all IOV functions, with each VF having assigned
> a range of addresses for its use. After migration, a VF can receive a
> different range of addresses than it had initially.
> 
> This implements shifting GGTT addresses within drm_mm nodes, so that
> VMAs stay valid after migration. This will make the driver use new
> addresses when accessing GGTT from the moment the shifting ends.
> 
> By taking the ggtt->lock for the period of VMA fixups, this change
> also adds constaint on that mutex. Any locks used during the recovery

typo: constraint ?

> cannot ever wait for hardware response - because after migration,
> the hardware will not do anything until fixups are finished.
> 
> v2: Moved some functs to xe_ggtt.c; moved shift computation to just
>   after querying; improved documentation; switched some warns to asserts;
>   skipping fixups when GGTT shift eq 0; iterating through tiles (Michal)
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c              | 139 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h              |   3 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  25 ++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 ++++
>  6 files changed, 192 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 558fac8bb6fb..44500707f8ae 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -489,6 +489,145 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>  	xe_ggtt_node_fini(node);
>  }
>  
> +static u64 drm_mm_node_end(struct drm_mm_node *node)
> +{
> +	return node->start + node->size;
> +}
> +
> +u64 xe_ggtt_node_end(struct xe_ggtt_node *node)

please add proper kernel-doc

> +{
> +	return drm_mm_node_end(&node->base);
> +}
> +
> +static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
> +				struct drm_mm_node *balloon_fin, s64 shift)
> +{
> +	struct drm_mm_node *node, *tmpn;
> +	int err;
> +	LIST_HEAD(temp_list_head);

nit: please reorder vars to follow reverse-xmas-tree style

> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	/*
> +	 * Move nodes, from range previously assigned to this VF, into temp list.

hmm, now that function is taking generic params, maybe all this comment
should be in the VF file as full kernel-doc explaining GGTT fixup steps?

> +	 *
> +	 * The balloon_beg and balloon_fin nodes are there to eliminate unavailable
> +	 * ranges from use: first reserves the GGTT area below the range for current VF,
> +	 * and second reserves area above.
> +	 *
> +	 * Below is a GGTT layout of example VF, with a certain address range assigned to
> +	 * said VF, and inaccessible areas above and below:
> +	 *
> +	 *  0                                                                        4GiB
> +	 *  |<--------------------------- Total GGTT size ----------------------------->|
> +	 *      WOPCM                                                         GUC_TOP
> +	 *      |<-------------- Area mappable by xe_ggtt instance ---------------->|
> +	 *
> +	 *  +---+---------------------------------+----------+----------------------+---+
> +	 *  |\\\|/////////////////////////////////|  VF mem  |//////////////////////|\\\|
> +	 *  +---+---------------------------------+----------+----------------------+---+

hmm, I'm wondering if maybe after all recent GGTT refactoring it would
be easier to trim VF's xe_ggtt size at init() instead of playing with
two balloons?

then layout will look like:

PF:
    |<---------------- xe_ggtt.size ----------------------------->|
+---+-------------------------------------------------------------+---+
|   |/////////////////////////////////////////////////////////////|   |
+---+-------------------------------------------------------------+---+


VF: before migration
                   xe_ggtt.size |<-------->|
+---+---------------------------+----------+----------------------+---+
|                               |//////////|                          |
+---+---------------------------+----------+----------------------+---+

VF: after migration
                                    xe_ggtt.size |<-------->|
+---+--------------------------------------------+----------+-----+---+
|                                                |//////////|         |
+---+--------------------------------------------+----------+-----+---+

> +	 *
> +	 * Hardware enforced access rules before migration:
> +	 *
> +	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> +	 *
> +	 * drm_mm nodes used for tracking allocations:
> +	 *
> +	 *     |<----------- balloon ------------>|<- nodes->|<----- balloon ------>|
> +	 *
> +	 * After the migration, GGTT area assigned to the VF might have shifted, either
> +	 * to lower or to higher address. But we expect the total size and extra areas to
> +	 * be identical, as migration can only happen between matching platforms.
> +	 * Below is an example of GGTT layout of the VF after migration. Content of the
> +	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
> +	 *
> +	 *  +---+----------------------+----------+---------------------------------+---+
> +	 *  |\\\|//////////////////////|  VF mem  |/////////////////////////////////|\\\|
> +	 *  +---+----------------------+----------+---------------------------------+---+
> +	 *
> +	 * Hardware enforced access rules after migration:
> +	 *
> +	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
> +	 *
> +	 * So the VF has a new slice of GGTT assigned, and during migration process, the
> +	 * memory content was copied to that new area. But the drm_mm nodes within xe kmd
> +	 * are still tracking allocations using the old addresses. The nodes within VF
> +	 * owned area have to be shifted, and balloon nodes need to be resized to
> +	 * properly mask out areas not owned by the VF.
> +	 *
> +	 * Fixed drm_mm nodes used for tracking allocations:
> +	 *
> +	 *     |<------ balloon ------>|<- nodes->|<----------- balloon ----------->|
> +	 *
> +	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> +	 * overlap; but our node shifting will fix addresses properly regardless.

whether we use profile or not, we shouldn't make any assumptions about
overlap, so maybe just skip that comment?

> +	 *
> +	 */
> +	drm_mm_for_each_node_in_range_safe(node, tmpn, &ggtt->mm,
> +					   drm_mm_node_end(balloon_beg),
> +					   balloon_fin->start) {
> +		drm_mm_remove_node(node);
> +		list_add(&node->node_list, &temp_list_head);
> +	}
> +
> +	/* shift and re-add ballooning nodes */
> +	if (drm_mm_node_allocated(balloon_beg))
> +		drm_mm_remove_node(balloon_beg);
> +	if (drm_mm_node_allocated(balloon_fin))
> +		drm_mm_remove_node(balloon_fin);
> +	balloon_beg->size += shift;
> +	balloon_fin->start += shift;
> +	balloon_fin->size -= shift;
> +	if (balloon_beg->size != 0) {
> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_beg);
> +		xe_tile_assert(ggtt->tile, !err);
> +	}
> +	if (balloon_fin->size != 0) {
> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_fin);
> +		xe_tile_assert(ggtt->tile, !err);
> +	}
> +
> +	/*
> +	 * Now the GGTT VM contains only nodes outside of area assigned to this VF.
> +	 * We can re-add all VF nodes with shifted offsets.
> +	 */
> +	list_for_each_entry_safe(node, tmpn, &temp_list_head, node_list) {
> +		list_del(&node->node_list);
> +		node->start += shift;
> +		err = drm_mm_reserve_node(&ggtt->mm, node);
> +		xe_tile_assert(ggtt->tile, !err);
> +	}
> +}
> +
> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node *balloon_beg,
> +			      struct xe_ggtt_node *balloon_fin, s64 shift)

don't forget about kernel-doc

> +{
> +	struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
> +	struct drm_mm_node loc_beg, loc_end;
> +
> +	if (balloon_beg && balloon_beg->ggtt)
> +		balloon_mm_beg = &balloon_beg->base;
> +	else {
> +		loc_beg.color = 0;
> +		loc_beg.flags = 0;
> +		loc_beg.start = xe_wopcm_size(ggtt->tile->xe);
> +		loc_beg.size = 0;
> +		balloon_mm_beg = &loc_beg;
> +	}
> +
> +	if (balloon_fin && balloon_fin->ggtt)
> +		balloon_mm_end = &balloon_fin->base;
> +	else {
> +		loc_end.color = 0;
> +		loc_end.flags = 0;
> +		loc_end.start = GUC_GGTT_TOP;
> +		loc_end.size = 0;
> +		balloon_mm_end = &loc_end;
> +	}
> +
> +	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
> +}
> +
>  /**
>   * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>   * @node: the &xe_ggtt_node to be inserted
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 27e7d67de004..3d2ca6f7185d 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,12 +18,15 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>  				u64 start, u64 size);
>  void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node *balloon_beg,
> +			      struct xe_ggtt_node *balloon_fin, s64 shift);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>  			       u32 size, u32 align, u32 mm_flags);
>  void xe_ggtt_node_remove(struct xe_ggtt_node *node, bool invalidate);
>  bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
> +u64 xe_ggtt_node_end(struct xe_ggtt_node *node);
>  void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
>  int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index cca5d5732802..a1841862c97e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -389,6 +389,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> +	config->ggtt_shift = start - (s64)config->ggtt_base;

is this explicit cast really needed ?

>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
>  
> @@ -912,6 +913,30 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * @gt: the &xe_gt struct instance
> + *
> + * Since Global GTT is not virtualized, each VF has an assigned range
> + * within the global space. This range might have changed during migration,
> + * which requires all memory addresses pointing to GGTT to be shifted.

Return: ?

> + */
> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	s64 ggtt_shift;
> +
> +	mutex_lock(&ggtt->lock);
> +	ggtt_shift = config->ggtt_shift;
> +	if (ggtt_shift)
> +		xe_ggtt_node_shift_nodes(ggtt, tile->sriov.vf.ggtt_balloon[0],
> +					 tile->sriov.vf.ggtt_balloon[1], ggtt_shift);
> +	mutex_unlock(&ggtt->lock);
> +	return ggtt_shift ? 0 : ENODATA;
> +}
> +
>  static int vf_runtime_reg_cmp(const void *a, const void *b)
>  {
>  	const struct vf_runtime_reg *ra = a;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 912d20814261..49af35484a57 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> +int xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
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
> index c1275e64aa9c..4ee8fc70a744 100644
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
> @@ -170,6 +171,26 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>  	work_pending(&xe->sriov.vf.migration.worker);
>  }
>  
> +static int vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
> +{
> +	struct xe_tile *tile;
> +	unsigned int id;
> +	int err;
> +
> +	for_each_tile(tile, xe, id) {
> +		struct xe_gt *gt = tile->primary_gt;
> +		int ret;
> +
> +		/* media doesn't have its own ggtt */
> +		if (xe_gt_is_media_type(gt))
> +			continue;
> +		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
> +		if (ret != ENODATA)
> +			err = ret;
> +	}
> +	return err;
> +}
> +
>  /*
>   * Notify all GuCs about resource fixups apply finished.
>   */
> @@ -201,6 +222,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	if (unlikely(err))
>  		goto fail;
>  
> +	err = vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */

nit: ... add *more* recovery steps ... ?

>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);

