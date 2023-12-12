Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B81C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 12:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A884310E5CA;
	Tue, 12 Dec 2023 12:31:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D8510E5CA
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 12:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702384305; x=1733920305;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=w/94lPVziE4mkWLFarofEUDxWeKDtEKodrClQec8lEo=;
 b=eT1wMoTTiCL6h07csCLNn061mgcJhTIe0O/W3XRpGHPwGuODGwl6Jl1V
 4FzCBh/F+apEmse1mFCuGCvB+rC1qvw75AUa/Fntu0bMwSacvyEmYQyFo
 IsDo+HsMG0rukF7dWba+wDxkZcQlU+OrmhKM2DQ6Txtkc/Z1oebrn/fVS
 W/cuBnva6r04Yj5IBFQ9LAY7g77KtaeBkbBU8jhFw1yMsUOkj1CKvDdgI
 wBfxYVx0Dj3kKDepM/qVaqkl+8l44KjB2xL7XkGNqUxg7dzxqwtHc9h6t
 RMXEK2inp2oBA9PpwWlvktCGfK06pQH3z+sImfZD6lWUYqRdIma5srUdC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="8167812"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; 
   d="scan'208";a="8167812"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:31:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="917272212"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="917272212"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.140])
 ([10.249.254.140])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 04:31:43 -0800
Message-ID: <b9b295ef-7c34-8c9b-c539-8c9374365a4c@linux.intel.com>
Date: Tue, 12 Dec 2023 13:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 08/10] drm/xe/xe2: Handle flat ccs move for igfx.
Content-Language: en-US
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20231211134356.1645973-1-himal.prasad.ghimiray@intel.com>
 <20231211134356.1645973-9-himal.prasad.ghimiray@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231211134356.1645973-9-himal.prasad.ghimiray@intel.com>
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


On 12/11/23 14:43, Himal Prasad Ghimiray wrote:
> - Clear flat ccs during user bo creation.
> - copy ccs meta data between flat ccs and bo during eviction and
> restore.
> - Add a bool field ccs_cleared in bo, true means ccs region of bo is
> already cleared.
>
> v2:
>   - Rebase.
>
> v3:
>   - Maintain order of xe_bo_move_notify for ttm_bo_type_sg.
>
> v4:
>   - xe_migrate_copy can be used to copy src to dst bo on igfx too.
> Add a bool which handles only ccs metadata copy.
>
> v5:
> - on dgfx ccs should be cleared even if the bo is not compression enabled.
>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  4 +-
>   drivers/gpu/drm/xe/xe_bo.c            | 33 +++++++++-----
>   drivers/gpu/drm/xe/xe_bo_types.h      |  4 ++
>   drivers/gpu/drm/xe/xe_migrate.c       | 64 +++++++++++++++------------
>   drivers/gpu/drm/xe/xe_migrate.h       |  3 +-
>   5 files changed, 66 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index d6c23441632a..7a32faa2f688 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -152,7 +152,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>   
>   	expected = 0xc0c0c0c0c0c0c0c0;
>   	fence = xe_migrate_copy(m, remote, bo, remote->ttm.resource,
> -				bo->ttm.resource);
> +				bo->ttm.resource, false);
>   	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo remote -> vram" :
>   				 "Copying small bo remote -> vram", test)) {
>   		retval = xe_map_rd(xe, &bo->vmap, 0, u64);
> @@ -169,7 +169,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>   	xe_map_memset(xe, &bo->vmap, 0, 0xc0, bo->size);
>   
>   	fence = xe_migrate_copy(m, bo, remote, bo->ttm.resource,
> -				remote->ttm.resource);
> +				remote->ttm.resource, false);
>   	if (!sanity_fence_failed(xe, fence, big ? "Copying big bo vram -> remote" :
>   				 "Copying small bo vram -> remote", test)) {
>   		retval = xe_map_rd(xe, &remote->vmap, 0, u64);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 0df8f6a77040..455f68d2e6dd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -650,10 +650,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	bool move_lacks_source;
>   	bool tt_has_data;
>   	bool needs_clear;
> +	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
> +				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>   	int ret = 0;
> -
> -	/* Bo creation path, moving to system or TT. No clearing required. */
> -	if (!old_mem && ttm) {
> +	/* Bo creation path, moving to system or TT. */
> +	if ((!old_mem && ttm) && !handle_system_ccs) {
>   		ttm_bo_move_null(ttm_bo, new_mem);
>   		return 0;
>   	}
> @@ -668,14 +669,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>   
> -	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
> +	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> +						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
>   
>   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>   		(!ttm && ttm_bo->type == ttm_bo_type_device);
>   
> -	if ((move_lacks_source && !needs_clear) ||
> -	    (old_mem_type == XE_PL_SYSTEM &&
> -	     new_mem->mem_type == XE_PL_TT)) {
> +	if ((move_lacks_source && !needs_clear)) {
> +		ttm_bo_move_null(ttm_bo, new_mem);
> +		goto out;
> +	}
> +
> +	if (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT && !handle_system_ccs) {
>   		ttm_bo_move_null(ttm_bo, new_mem);
>   		goto out;
>   	}
> @@ -706,8 +711,11 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   			ret = timeout;
>   			goto out;
>   		}
> -		ttm_bo_move_null(ttm_bo, new_mem);
> -		goto out;
> +
> +		if (!handle_system_ccs) {
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +			goto out;
> +		}
>   	}
>   
>   	if (!move_lacks_source &&
> @@ -728,6 +736,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		migrate = mem_type_to_migrate(xe, new_mem->mem_type);
>   	else if (mem_type_is_vram(old_mem_type))
>   		migrate = mem_type_to_migrate(xe, old_mem_type);
> +	else
> +		migrate = xe->tiles[0].migrate;
>   
>   	xe_assert(xe, migrate);
>   
> @@ -770,8 +780,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   		if (move_lacks_source)
>   			fence = xe_migrate_clear(migrate, bo, new_mem);
>   		else
> -			fence = xe_migrate_copy(migrate,
> -						bo, bo, old_mem, new_mem);
> +			fence = xe_migrate_copy(migrate, bo, bo, old_mem,
> +						new_mem, handle_system_ccs);
>   		if (IS_ERR(fence)) {
>   			ret = PTR_ERR(fence);
>   			xe_device_mem_access_put(xe);
> @@ -1257,6 +1267,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>   			return bo;
>   	}
>   
> +	bo->ccs_cleared = false;
>   	bo->tile = tile;
>   	bo->size = size;
>   	bo->flags = flags;
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index f71dbc518958..64c2249a4e40 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -79,6 +79,10 @@ struct xe_bo {
>   	struct llist_node freed;
>   	/** @created: Whether the bo has passed initial creation */
>   	bool created;
> +
> +	/** @ccs_cleared */
> +	bool ccs_cleared;
> +
>   	/**
>   	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>   	 * objects.
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1ecf2274c7ba..55afa462f179 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -574,14 +574,14 @@ static u64 xe_migrate_batch_base(struct xe_migrate *m, bool usm)
>   
>   static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>   			       struct xe_bb *bb,
> -			       u64 src_ofs, bool src_is_vram,
> -			       u64 dst_ofs, bool dst_is_vram, u32 dst_size,
> +			       u64 src_ofs, bool src_is_indirect,
> +			       u64 dst_ofs, bool dst_is_indirect, u32 dst_size,
>   			       u64 ccs_ofs, bool copy_ccs)
>   {
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	u32 flush_flags = 0;
>   
> -	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_vram) {
> +	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
>   		/*
>   		 * If the src is already in vram, then it should already
>   		 * have been cleared by us, or has been populated by the
> @@ -590,28 +590,24 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>   		 * Otherwise if the bo doesn't have any CCS metadata attached,
>   		 * we still need to clear it for security reasons.
>   		 */
> -		u64 ccs_src_ofs =  src_is_vram ? src_ofs : m->cleared_mem_ofs;
> +		u64 ccs_src_ofs =  src_is_indirect ? src_ofs : m->cleared_mem_ofs;
>   
>   		emit_copy_ccs(gt, bb,
>   			      dst_ofs, true,
> -			      ccs_src_ofs, src_is_vram, dst_size);
> +			      ccs_src_ofs, src_is_indirect, dst_size);
>   
>   		flush_flags = MI_FLUSH_DW_CCS;
>   	} else if (copy_ccs) {
> -		if (!src_is_vram)
> +		if (!src_is_indirect)
>   			src_ofs = ccs_ofs;
> -		else if (!dst_is_vram)
> +		else if (!dst_is_indirect)
>   			dst_ofs = ccs_ofs;
>   
> -		/*
> -		 * At the moment, we don't support copying CCS metadata from
> -		 * system to system.
> -		 */
> -		xe_gt_assert(gt, src_is_vram || dst_is_vram);
> +		xe_gt_assert(gt, src_is_indirect || dst_is_indirect);
>   
> -		emit_copy_ccs(gt, bb, dst_ofs, dst_is_vram, src_ofs,
> -			      src_is_vram, dst_size);
> -		if (dst_is_vram)
> +		emit_copy_ccs(gt, bb, dst_ofs, dst_is_indirect, src_ofs,
> +			      src_is_indirect, dst_size);
> +		if (dst_is_indirect)
>   			flush_flags = MI_FLUSH_DW_CCS;
>   	}
>   
> @@ -627,6 +623,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>    * the buffer object @dst is currently bound to.
>    * @src: The source TTM resource.
>    * @dst: The dst TTM resource.
> + * @copy_only_ccs: If true copy only CCS metadata
>    *
>    * Copies the contents of @src to @dst: On flat CCS devices,
>    * the CCS metadata is copied as well if needed, or if not present,
> @@ -640,7 +637,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   				  struct xe_bo *src_bo,
>   				  struct xe_bo *dst_bo,
>   				  struct ttm_resource *src,
> -				  struct ttm_resource *dst)
> +				  struct ttm_resource *dst,
> +				  bool copy_only_ccs)
>   {
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -652,6 +650,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   	u64 src_L0, dst_L0;
>   	int pass = 0;
>   	int err;
> +	bool src_is_pltt = src->mem_type == XE_PL_TT;
> +	bool dst_is_pltt = dst->mem_type == XE_PL_TT;
>   	bool src_is_vram = mem_type_is_vram(src->mem_type);
>   	bool dst_is_vram = mem_type_is_vram(dst->mem_type);
>   	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
> @@ -716,8 +716,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		}
>   
>   		/* Add copy commands size here */
> -		batch_size += EMIT_COPY_DW +
> -			(xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0);
> +		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> +			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
>   
>   		bb = xe_bb_new(gt, batch_size, usm);
>   		if (IS_ERR(bb)) {
> @@ -743,10 +743,13 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
>   
> -		emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0,
> -			  XE_PAGE_SIZE);
> -		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_vram,
> -						  dst_L0_ofs, dst_is_vram,
> +		if (!copy_only_ccs)
> +			emit_copy(gt, bb, src_L0_ofs, dst_L0_ofs, src_L0, XE_PAGE_SIZE);
> +
> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs,
> +						  IS_DGFX(xe) ? src_is_vram : src_is_pltt,
> +						  dst_L0_ofs,
> +						  IS_DGFX(xe) ? dst_is_vram : dst_is_pltt,
>   						  src_L0, ccs_ofs, copy_ccs);
>   
>   		mutex_lock(&m->job_mutex);
> @@ -919,6 +922,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   	bool clear_vram = mem_type_is_vram(dst->mem_type);
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	struct xe_device *xe = gt_to_xe(gt);
> +	bool clear_system_ccs = (xe_bo_needs_ccs_pages(bo) && !IS_DGFX(xe)) ? true : false;
>   	struct dma_fence *fence = NULL;
>   	u64 size = bo->size;
>   	struct xe_res_cursor src_it;
> @@ -951,9 +955,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		batch_size = 2 +
>   			pte_update_size(m, clear_vram, src, &src_it,
>   					&clear_L0, &clear_L0_ofs, &clear_L0_pt,
> -					emit_clear_cmd_len(gt), 0,
> +					clear_system_ccs ? 0 : emit_clear_cmd_len(gt), 0,
>   					avail_pts);
> -		if (xe_device_has_flat_ccs(xe) && clear_vram)
> +
> +		if (xe_device_has_flat_ccs(xe))
>   			batch_size += EMIT_COPY_CCS_DW;
>   
>   		/* Clear commands */
> @@ -968,7 +973,6 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		}
>   
>   		size -= clear_L0;
> -
>   		/* Preemption is enabled again by the ring ops. */
>   		if (!clear_vram) {
>   			emit_pte(m, bb, clear_L0_pt, clear_vram, true, &src_it, clear_L0,
> @@ -979,9 +983,10 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
>   
> -		emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE,
> -			   clear_vram);
> -		if (xe_device_has_flat_ccs(xe) && clear_vram) {
> +		if (!clear_system_ccs)
> +			emit_clear(gt, bb, clear_L0_ofs, clear_L0, XE_PAGE_SIZE, clear_vram);
> +
> +		if (xe_device_has_flat_ccs(xe)) {
>   			emit_copy_ccs(gt, bb, clear_L0_ofs, true,
>   				      m->cleared_mem_ofs, false, clear_L0);
>   			flush_flags = MI_FLUSH_DW_CCS;
> @@ -1038,6 +1043,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   		return ERR_PTR(err);
>   	}
>   
> +	if (clear_system_ccs)
> +		bo->ccs_cleared = true;
> +
>   	return fence;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index c729241776ad..951f19318ea4 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -85,7 +85,8 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   				  struct xe_bo *src_bo,
>   				  struct xe_bo *dst_bo,
>   				  struct ttm_resource *src,
> -				  struct ttm_resource *dst);
> +				  struct ttm_resource *dst,
> +				  bool copy_only_ccs);
>   
>   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   				   struct xe_bo *bo,
