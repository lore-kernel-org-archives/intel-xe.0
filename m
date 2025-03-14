Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCCCC282EC
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 18:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017410EA38;
	Fri, 14 Mar 2025 18:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D7CnUhPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A56710EA38
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 18:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741976541; x=1773512541;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vF93pjJOn+SOnHg9LIma+EeZjlvlGLQQTnSMYewNBjc=;
 b=D7CnUhPqOE7NeiVIKsm+b1EADobjMFGoq+5phNegmVBOYCzoLOGByR8B
 wCb7j1tUenLY5lUjJq1LZnd9c0EEHMVYAWuYNjvbK4EOgv2WPPYCv9ewV
 qqMtgyJw9JzYRtqQGxrKu+sRLOTJwOJUMS6XIfhJYpZq52UbCkJv0e1o7
 N2q5zHZkatSFEU+uV/jJayfAgRTTD1pAg9jSjq/iAoU5i4m45gDlql2lR
 Mcjb6qDOHuPw6+aJjDAXyfqby2Yc5Sz3lj783U7Uf1j8/tuW8idlDW2AL
 FmAnYeEBq5fR+RuiJq2xdZeYsfpkWEBCLoSHh3OdKZW5tzYIHFooT4cLL Q==;
X-CSE-ConnectionGUID: XKvMjw85RE2tq35i/0fYuw==
X-CSE-MsgGUID: mA+sXQ4wRZq/BREopQCx+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43241528"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43241528"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 11:22:21 -0700
X-CSE-ConnectionGUID: wadZcnDLQGid8pRFg5kDiw==
X-CSE-MsgGUID: B7dzpqDeSvaiW0vaeDaFTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121305520"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa010.jf.intel.com with ESMTP; 14 Mar 2025 11:22:20 -0700
Received: from [10.245.97.41] (unknown [10.245.97.41])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 25C3E33BFA;
 Fri, 14 Mar 2025 18:22:17 +0000 (GMT)
Message-ID: <1e3f7420-574c-4693-b5c5-b30e1ad086d9@intel.com>
Date: Fri, 14 Mar 2025 19:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/sriov: Shifting GGTT area post migration
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250306222126.3382322-1-tomasz.lis@intel.com>
 <20250306222126.3382322-3-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250306222126.3382322-3-tomasz.lis@intel.com>
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



On 06.03.2025 23:21, Tomasz Lis wrote:
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
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_ggtt.c              | 163 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.h              |   2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c       |  26 ++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c          |  22 +++
>  6 files changed, 216 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5fcb2b4c2c13..6865d1cdd676 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -489,6 +489,169 @@ void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node)
>  	xe_ggtt_node_fini(node);
>  }
>  
> +static u64 drm_mm_node_end(struct drm_mm_node *node)
> +{
> +	return node->start + node->size;
> +}
> +
> +static void xe_ggtt_mm_shift_nodes(struct xe_ggtt *ggtt, struct drm_mm_node *balloon_beg,
> +				struct drm_mm_node *balloon_fin, s64 shift)
> +{
> +	struct drm_mm_node *node, *tmpn;
> +	LIST_HEAD(temp_list_head);
> +	int err;
> +
> +	lockdep_assert_held(&ggtt->lock);
> +
> +	/*
> +	 * Move nodes, from range previously assigned to this VF, into temp list.
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
> +/**
> + * xe_ggtt_node_shift_nodes - Shift GGTT nodes to adjust for a change in usable address range.
> + * @ggtt: the &xe_ggtt struct instance
> + * @balloon_beg: ggtt balloon node which preceds the area provisioned for current VF
> + * @balloon_fin: ggtt balloon node which follows the area provisioned for current VF
> + * @shift: change to the location of area provisioned for current VF
> + */
> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
> +			      struct xe_ggtt_node **balloon_fin, s64 shift)
> +{
> +	struct drm_mm_node *balloon_mm_beg, *balloon_mm_end;
> +	struct xe_ggtt_node *node;
> +
> +	if (!*balloon_beg)
> +	{
> +		node = xe_ggtt_node_init(ggtt);
> +		if (IS_ERR(node))
> +			goto out;
> +		node->base.color = 0;
> +		node->base.flags = 0;
> +		node->base.start = xe_wopcm_size(ggtt->tile->xe);
> +		node->base.size = 0;
> +		*balloon_beg = node;
> +	}
> +	balloon_mm_beg = &(*balloon_beg)->base;
> +
> +	if (!*balloon_fin)
> +	{
> +		node = xe_ggtt_node_init(ggtt);
> +		if (IS_ERR(node))
> +			goto out;
> +		node->base.color = 0;
> +		node->base.flags = 0;
> +		node->base.start = GUC_GGTT_TOP;
> +		node->base.size = 0;
> +		*balloon_fin = node;
> +	}
> +	balloon_mm_end = &(*balloon_fin)->base;
> +
> +	xe_tile_assert(ggtt->tile, (*balloon_beg)->ggtt);
> +	xe_tile_assert(ggtt->tile, (*balloon_fin)->ggtt);
> +
> +	xe_ggtt_mm_shift_nodes(ggtt, balloon_mm_beg, balloon_mm_end, shift);
> +out:
> +	if (*balloon_beg && !xe_ggtt_node_allocated(*balloon_beg))
> +	{
> +		node = *balloon_beg;
> +		*balloon_beg = NULL;
> +		xe_ggtt_node_fini(node);
> +	}
> +	if (*balloon_fin && !xe_ggtt_node_allocated(*balloon_fin))
> +	{
> +		node = *balloon_fin;
> +		*balloon_fin = NULL;
> +		xe_ggtt_node_fini(node);
> +	}
> +}
> +
>  /**
>   * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
>   * @node: the &xe_ggtt_node to be inserted
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 27e7d67de004..d9e133a155e6 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,6 +18,8 @@ void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  int xe_ggtt_node_insert_balloon(struct xe_ggtt_node *node,
>  				u64 start, u64 size);
>  void xe_ggtt_node_remove_balloon(struct xe_ggtt_node *node);
> +void xe_ggtt_node_shift_nodes(struct xe_ggtt *ggtt, struct xe_ggtt_node **balloon_beg,
> +			      struct xe_ggtt_node **balloon_fin, s64 shift);
>  
>  int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
>  int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index a439261bf4d7..dbd7010f0117 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -415,6 +415,7 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>  	xe_gt_sriov_dbg_verbose(gt, "GGTT %#llx-%#llx = %lluK\n",
>  				start, start + size - 1, size / SZ_1K);
>  
> +	config->ggtt_shift = start - (s64)config->ggtt_base;

btw, is it safe to keep ggtt_shift after we're done with fixups?

>  	config->ggtt_base = start;
>  	config->ggtt_size = size;
>  
> @@ -938,6 +939,31 @@ int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_fixup_ggtt_nodes - Shift GGTT allocations to match assigned range.
> + * @gt: the &xe_gt struct instance
> + * Return: 0 on success, ENODATA if fixups are unnecessary

if you really need to distinguish between nop/done then bool as return
will be better, but I'm not sure that caller needs to know

if we need to know whether there was a shift, and thus we need to start
the fixup sequence, then maybe we should have a separate function that
returns (and maybe clears) the ggtt_shift

> + *
> + * Since Global GTT is not virtualized, each VF has an assigned range
> + * within the global space. This range might have changed during migration,
> + * which requires all memory addresses pointing to GGTT to be shifted.
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
> +		xe_ggtt_node_shift_nodes(ggtt, &tile->sriov.vf.ggtt_balloon[0],
> +					 &tile->sriov.vf.ggtt_balloon[1], ggtt_shift);

maybe to make it a little simpler on the this xe_ggtt function side, we
should remove our balloon nodes before requesting shift_nodes(), and
then re-add balloon nodes here again?

> +	mutex_unlock(&ggtt->lock);
> +	return ggtt_shift ? 0 : ENODATA;

and it's quite unusual to return positive errno codes...

> +}
> +
>  static int vf_runtime_reg_cmp(const void *a, const void *b)
>  {
>  	const struct vf_runtime_reg *ra = a;
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index ba6c5d74e326..95a6c9c1dca0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -18,6 +18,7 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
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

primary_gt can't be MEDIA_TYPE

> +			continue;
> +		ret = xe_gt_sriov_vf_fixup_ggtt_nodes(gt);
> +		if (ret != ENODATA)
> +			err = ret;

for multi-tile platforms, this could overwrite previous error/status

> +	}
> +	return err;

err might be still uninitialized here

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
>  	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);

