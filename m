Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D1D68BE7
	for <intel-xe@archiver.kernel.org>; Sat, 16 Nov 2024 19:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1714D10E15D;
	Sat, 16 Nov 2024 19:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SQYZ/MOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B7E10E15D
 for <intel-xe@lists.freedesktop.org>; Sat, 16 Nov 2024 19:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731785374; x=1763321374;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=4WtR6g/NxxRan5SnHuIUJvKJ1mrP1iyqcVM5WJvgy+g=;
 b=SQYZ/MOoW0AUEgcFzCHEsg5/ZoScWZB/fkIU0ua4MjXT+T86j2GwNWOS
 pTQKmVSMh9tkuTbiHZ5iKA4q1BF45jtzDhHGCC12YnqVgFkBuN98tIc3E
 OexZLSrg//9gWSPrcq/7LLcRUjSCuM848JitSyCt+UiXEEzaAHon83cOi
 MtXavtPG5VQR+m3Jq/pFkTPSLfFvIolScDRUDmojkTovEuhEFMCckyzoh
 dDRxYxadrf4KDdHRs7DpNnQp2/rlqxBAW2w5gc0hWzsSGZdIzEtv1CHLN
 OVN9rJxhgUIF7hqoxPrJG4DHHUeUcGOyj0xkrpYB7mBxF0ZQ5YD+cUIR+ Q==;
X-CSE-ConnectionGUID: H2YGHSMDSu6A7h94Ku6KMA==
X-CSE-MsgGUID: kWUTOYuiQqGTXWkj8nZZOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="57185146"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; d="scan'208";a="57185146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2024 11:29:34 -0800
X-CSE-ConnectionGUID: vGthfRm+SYi5N16bPS7NjQ==
X-CSE-MsgGUID: qgezfbIsQiW380oSZTaEkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; d="scan'208";a="93788603"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 11:29:29 -0800
Received: from [10.245.96.66] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.66])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 93F082878D;
 Sat, 16 Nov 2024 19:29:28 +0000 (GMT)
Message-ID: <8130fc0f-2978-4ad7-b0b7-8e2fbaa3e2db@intel.com>
Date: Sat, 16 Nov 2024 20:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe/sriov: Shifting GGTT area post migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241116021238.2486287-1-tomasz.lis@intel.com>
 <20241116021238.2486287-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241116021238.2486287-3-tomasz.lis@intel.com>
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



On 16.11.2024 03:12, Tomasz Lis wrote:
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
> cannot ever wait for hardware response - because after migration,
> the hardware will not do anything until fixups are finished.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 175 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |   1 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c    |  15 +++
>  3 files changed, 191 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index cca5d5732802..ae24c47ed8f8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -912,6 +912,181 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>  	return err;
>  }
>  
> +static u64 drm_mm_node_end(struct drm_mm_node *node)
> +{
> +	return node->start + node->size;
> +}
> +
> +static s64 vf_get_post_migration_ggtt_shift(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;

I'm wondering whether it would be possible to set/remember any GGTT
shift when VF was querying it's new config?

> +	struct xe_tile *tile = gt_to_tile(gt);
> +	u64 old_base;
> +	s64 ggtt_shift;
> +
> +	old_base = drm_mm_node_end(&tile->sriov.vf.ggtt_balloon[0]->base);
> +	ggtt_shift = config->ggtt_base - (s64)old_base;
> +
> +	xe_gt_sriov_info(gt, "GGTT base shifted from %#llx to %#llx\n",
> +		  old_base, old_base + ggtt_shift);
> +
> +	return ggtt_shift;
> +}
> +
> +static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
> +				struct drm_mm_node *balloon_fin, s64 shift)

there is way too much internals that should be just known to the xe_ggtt
maybe better to move most of this function to xe_ggtt.c ?

> +{
> +	struct drm_mm_node *node, *tmpn;
> +	int err;
> +	LIST_HEAD(temp_list_head);

nit: I think our Xe maintainers prefer declarations in Reverse Christmas
Tree Format

> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	/*
> +	 * Move nodes, from range previously assigned to this VF, into temp list.
> +	 *
> +	 * The balloon_beg and balloon_fin nodes are there to eliminate unavailable
> +	 * ranges from use: first reserves the GGTT area below the range for current VF,
> +	 * and second reserves area above. There may also exist extra nodes at the bottom
> +	 * or top of GGTT range, as long as there are no free spaces inbetween. Such
> +	 * extra nodes will be left unchanged.
> +	 *
> +	 * Below is a GGTT layout of example VF, with a certain address range assigned to
> +	 * said VF, and inaccessible areas above and below:
> +	 *
> +	 *  0                                                                  ggtt->size
> +	 *  |<--------------------------- Total GGTT size ----------------------------->|
> +	 *
> +	 *  +-----------+-------------------------+----------+--------------+-----------+
> +	 *  |\\\\\\\\\\\|/////////////////////////|  VF mem  |//////////////|\\\\\\\\\\\|
> +	 *  +-----------+-------------------------+----------+--------------+-----------+
> +	 *
> +	 * Hardware enforced access rules before migration:
> +	 *
> +	 *  |<------- inaccessible for VF ------->|<VF owned>|<-- inaccessible for VF ->|
> +	 *
> +	 * drm_mm nodes used for tracking allocations:
> +	 *
> +	 *  |<- extra ->|<------- balloon ------->|<- nodes->|<-- balloon ->|<- extra ->|

in Xe we don't have 'extra' regions since xe_ggtt already covers only
GuC accessible GGTT region, so it's like:

0                                                        4GiB
|<----------------- Total GGTT size ------------------------>|

    WOPCM                                      GUC_TOP
+-------+-------------------+-----------+------------+-------+
|\\\\\\\|///////////////////|  VF mem   |////////////|\\\\\\\|
+-------+-------------------+-----------+------------+-------+

        0                                  ggtt->size
        |<--balloon-------->|<--nodes-->|<-balloon->|

> +	 *
> +	 * After the migration, GGTT area assigned to the VF might have shifted, either
> +	 * to lower or to higher address. But we expect the total size and extra areas to
> +	 * be identical, as migration can only happen between matching platforms.
> +	 * Below is an example of GGTT layout of the VF after migration. Content of the
> +	 * GGTT for VF has been moved to a new area, and we receive its address from GuC:
> +	 *
> +	 *  +-----------+--------------+----------+-------------------------+-----------+
> +	 *  |\\\\\\\\\\\|//////////////|  VF mem  |/////////////////////////|\\\\\\\\\\\|
> +	 *  +-----------+--------------+----------+-------------------------+-----------+
> +	 *
> +	 * Hardware enforced access rules after migration:
> +	 *
> +	 *  |<- inaccessible for VF -->|<VF owned>|<------- inaccessible for VF ------->|
> +	 *
> +	 * So the VF has a new slice of GGTT assigned, and during migration process, the
> +	 * memory content was copied to that new area. But the drm_mm nodes within i915

i915 ?

> +	 * are still tracking allocations using the old addresses. The nodes within VF
> +	 * owned area have to be shifted, and balloon nodes need to be resized to
> +	 * properly mask out areas not owned by the VF.
> +	 *
> +	 * Fixed drm_mm nodes used for tracking allocations:

drm_mm nodes are implementation details of the xe_ggtt_nodes

> +	 *
> +	 *  |<- extra  ->|<- balloon ->|<-- VF -->|<-------- balloon ------>|<- extra ->|
> +	 *
> +	 * Due to use of GPU profiles, we do not expect the old and new GGTT ares to
> +	 * overlap; but our node shifting will fix addresses properly regardless.
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
> +		XE_WARN_ON(err);
> +	}
> +	if (balloon_fin->size != 0) {
> +		err = drm_mm_reserve_node(&ggtt->mm, balloon_fin);
> +		XE_WARN_ON(err);

maybe xe_tile_assert() will work here?

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
> +		XE_WARN_ON(err);

ditto

> +	}
> +}
> +
> +static void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node *balloon_beg,
> +				struct xe_ggtt_node *balloon_fin, s64 shift)
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
> +	drm_dbg(&ggtt->tile->xe->drm, "tli: node shift start beg %llx %llx end %llx %llx\n",
> +		balloon_mm_beg->start, balloon_mm_beg->size,
> +		balloon_mm_end->start, balloon_mm_end->size);
> +	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
> +	drm_dbg(&ggtt->tile->xe->drm, "tli: node shift end\n");

tli ? looks like your private debug logs

> +}
> +
> +/**
> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * @gt: the &xe_gt struct instance
> + *
> + * Since Global GTT is not virtualized, each VF has an assigned range
> + * within the global space. This range might have changed during migration,
> + * which requires all memory addresses pointing to GGTT to be shifted.
> + */
> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	s64 ggtt_shift;
> +
> +	mutex_lock(&ggtt->lock);
> +	ggtt_shift = vf_get_post_migration_ggtt_shift(gt);

do we still need to do anything if shift is 0?

> +	xe_ggtt_node_shift_nodes(ggtt, tile->sriov.vf.ggtt_balloon[0],
> +				 tile->sriov.vf.ggtt_balloon[1], ggtt_shift);
> +	mutex_unlock(&ggtt->lock);
> +}
> +
>  static int vf_runtime_reg_cmp(const void *a, const void *b)
>  {
>  	const struct vf_runtime_reg *ra = a;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 912d20814261..a8745ec23380 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -17,6 +17,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>  int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
> +void xe_gt_sriov_vf_fixup_ggtt_nodes(struct xe_gt *gt);
>  int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>  void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index c1275e64aa9c..5bcd55999e0e 100644
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
> @@ -170,6 +171,19 @@ static bool vf_post_migration_imminent(struct xe_device *xe)
>  	work_pending(&xe->sriov.vf.migration.worker);
>  }
>  
> +static void vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +
> +	for_each_gt(gt, xe, id) {

maybe for_each_tile() would be a better fit here?

> +		/* media doesn't have its own ggtt */
> +		if (xe_gt_is_media_type(gt))
> +			continue;
> +		xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
> +	}
> +}
> +
>  /*
>   * Notify all GuCs about resource fixups apply finished.
>   */
> @@ -201,6 +215,7 @@ static void vf_post_migration_recovery(struct xe_device *xe)
>  	if (unlikely(err))
>  		goto fail;
>  
> +	vf_post_migration_fixup_ggtt_nodes(xe);
>  	/* FIXME: add the recovery steps */
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);

