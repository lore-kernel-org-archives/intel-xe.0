Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C6C43458
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 11:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A95D10F302;
	Thu,  2 Jul 2026 11:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Po/El8y3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4495110F302
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Jul 2026 11:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782992294; x=1814528294;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kkpm+fYP+S6b8N8O34Dtrx/EmCukPzAMV3rvkD2jARU=;
 b=Po/El8y3c/7BfHtrQyETVWjW7PmGC2KSRA0628ybEhsRfU39gWAVznwj
 TusCiDbpSL9y+Bzml64lBKsHZjQ2/acjhF5UtBVNctmO7MQqeIbem4Jfw
 S6gLdOvztDp605Ek5W06f/8tWq2eg1RJcyJcvw8HgrZ420POqqyxIGsEC
 +aXVIcDHru3IOEvcvjKtxVSg8ZJ40wT9TSb0TAKxbb1IyucqAY2SGyD+X
 Hhs+yGe8yyNE10WayeLTfNdyZ1XIXzWk+s9sq6WQCL3yK98pNR0QArpxh
 hJ5bu38rRaKJHSJm8Czpc1kDcAilNPuqSxgVoj+h2ahn32zuHmg/34XzU w==;
X-CSE-ConnectionGUID: v10SiAkoTHiS9ZEEE8YIPg==
X-CSE-MsgGUID: ggvJ9MPyTDC03w78YDU4vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87422932"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="87422932"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:38:14 -0700
X-CSE-ConnectionGUID: P+O+pPJJRmulaPAgNHZjow==
X-CSE-MsgGUID: SI+exiczTy6h0xAcptcmIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="252993935"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.244.242])
 ([10.245.244.242])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 04:38:11 -0700
Message-ID: <c7e4c497-f305-49e4-b8f7-c697d8b13d9f@intel.com>
Date: Thu, 2 Jul 2026 12:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/migrate: Revamp PAT index selection for migrate
 PTEs
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
References: <20260702092829.206806-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260702092829.206806-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 02/07/2026 10:28, Sanjay Yadav wrote:
> Improve PAT index selection logic in xe_migrate.c to avoid unnecessary
> coherency overhead when host-side memory is uncached. Previously,
> we defaulted to XE_CACHE_WB, which enforces 2-way coherency and may
> trigger cacheline pulls from CPU even when host-side memory is never
> dirty.
> 
> This change introduces xe_migrate_pat_index() to choose the appropriate
> PAT index based on the actual TTM caching mode of the buffer object
> being mapped. For iGPUs with WC host mappings, we now prefer
> XE_CACHE_NONE to skip coherency snoops. For compressed PTEs on newer
> platforms, we select XE_CACHE_NONE_COMPRESSION.
> 
> This avoids unnecessary cache traffic for uncached host mappings.
> 
> v4:
> - Keep xe_migrate_prepare_vm() on XE_CACHE_WB since page tables require
>    page-walker coherency.
> - Pass BO into emit_pte() and select PAT attributes from the BO's TTM
>    caching mode.
> 
> Assisted-by: GitHub Copilot:claude-sonnet-5
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_migrate.c |  6 +--
>   drivers/gpu/drm/xe/xe_migrate.c       | 66 ++++++++++++++++++++-------
>   2 files changed, 52 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
> index 3c1be809be82..7bd3c2aaa090 100644
> --- a/drivers/gpu/drm/xe/tests/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
> @@ -256,7 +256,7 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test,
>   		xe_res_first_sg(xe_bo_sg(pt), 0, xe_bo_size(pt), &src_it);
>   
>   	emit_pte(m, bb, NUM_KERNEL_PDE - 1, xe_bo_is_vram(pt), false,
> -		 &src_it, XE_PAGE_SIZE, pt->ttm.resource);
> +		 &src_it, XE_PAGE_SIZE, pt->ttm.resource, pt);
>   
>   	run_sanity_job(m, xe, bb, bb->len, "Writing PTE for our fake PT", test);
>   
> @@ -434,13 +434,13 @@ static struct dma_fence *blt_copy(struct xe_tile *tile,
>   			xe_res_next(&src_it, src_L0);
>   		else
>   			emit_pte(m, bb, src_L0_pt, src_is_vram, false,
> -				 &src_it, src_L0, src);
> +				 &src_it, src_L0, src, src_bo);
>   
>   		if (dst_is_vram)
>   			xe_res_next(&dst_it, src_L0);
>   		else
>   			emit_pte(m, bb, dst_L0_pt, dst_is_vram, false,
> -				 &dst_it, src_L0, dst);
> +				 &dst_it, src_L0, dst, dst_bo);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 9428dd5e7760..c60a16a38518 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -117,6 +117,27 @@ static void xe_migrate_fini(void *arg)
>   	xe_exec_queue_put(m->q);
>   }
>   
> +static inline u16 xe_migrate_pat_index(struct xe_device *xe,
> +				       enum ttm_caching caching,
> +				       bool is_comp_pte)
> +{
> +	enum xe_cache_level cache_level;
> +
> +	/*
> +	 * Select the appropriate PAT index for buffer object PTEs programmed
> +	 * by emit_pte(). This does NOT apply to xe_migrate_prepare_vm()
> +	 * which must always use XE_CACHE_WB for page-walker coherency.

Why must page-walker use XE_CACHE_WB? I think either we allocate the 
paging structures as WB, in which case coherency matters, or we allocate 
with WC, and coherency does not matter (the normal mode). See also 
cached_pt. Essentially page-walker is often NOT coherent in the first place.

I agree we probably don't want to mess with that here, but comment maybe 
needs to be tweaked? "We choose not to mess with xe_migrate_prepare_vm() 
yet, for simplicity", or something.

> +	 */
> +	if (is_comp_pte && GRAPHICS_VERx100(xe) >= 2000)
> +		cache_level = XE_CACHE_NONE_COMPRESSION;
> +	else if (caching == ttm_cached)
> +		cache_level = XE_CACHE_WB;
> +	else
> +		cache_level = XE_CACHE_NONE;
> +
> +	return xe_cache_pat_idx(xe, cache_level);
> +}
> +
>   static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>   {
>   	XE_WARN_ON(slot >= NUM_PT_SLOTS);
> @@ -627,7 +648,8 @@ static void emit_pte(struct xe_migrate *m,
>   		     struct xe_bb *bb, u32 at_pt,
>   		     bool is_vram, bool is_comp_pte,
>   		     struct xe_res_cursor *cur,
> -		     u32 size, struct ttm_resource *res)
> +		     u32 size, struct ttm_resource *res,
> +		     struct xe_bo *bo)
>   {
>   	struct xe_device *xe = tile_to_xe(m->tile);
>   	struct xe_vm *vm = m->q->vm;
> @@ -635,13 +657,18 @@ static void emit_pte(struct xe_migrate *m,
>   	u32 ptes;
>   	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
>   	u64 cur_ofs;
> +	enum ttm_caching caching = ttm_cached;
>   
> -	/* Indirect access needs compression enabled uncached PAT index */
> -	if (GRAPHICS_VERx100(xe) >= 2000)
> -		pat_index = is_comp_pte ? xe_cache_pat_idx(xe, XE_CACHE_NONE_COMPRESSION) :
> -					  xe_cache_pat_idx(xe, XE_CACHE_WB);
> -	else
> -		pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
> +	if (bo && bo->ttm.ttm) {
> +		caching = bo->ttm.ttm->caching;
> +	} else if (res && res->bo) {
> +		struct xe_bo *res_bo = ttm_to_xe_bo(res->bo);

If we go via res->bo, why not just always do that? I don't think the bo 
!= res->bo. Also I dont think res shuld ever be NULL.

> +
> +		if (res_bo && res_bo->ttm.ttm)
> +			caching = res_bo->ttm.ttm->caching;
> +	}
> +
> +	pat_index = xe_migrate_pat_index(xe, caching, is_comp_pte);
>   
>   	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>   
> @@ -1000,16 +1027,16 @@ static struct dma_fence *__xe_migrate_copy(struct xe_migrate *m,
>   			xe_res_next(&src_it, src_L0);
>   		else
>   			emit_pte(m, bb, src_L0_pt, src_is_vram, copy_system_ccs || use_comp_pat,
> -				 &src_it, src_L0, src);
> +				 &src_it, src_L0, src, src_bo);
>   
>   		if (dst_is_vram && xe_migrate_allow_identity(src_L0, &dst_it))
>   			xe_res_next(&dst_it, src_L0);
>   		else if (!copy_only_ccs)
>   			emit_pte(m, bb, dst_L0_pt, dst_is_vram, copy_system_ccs,
> -				 &dst_it, src_L0, dst);
> +				 &dst_it, src_L0, dst, dst_bo);
>   
>   		if (copy_system_ccs)
> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src, src_bo);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
> @@ -1279,9 +1306,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>   			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>   			batch_size += EMIT_COPY_CCS_DW;
>   
> -			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
> +			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src,
> +				 src_bo);
>   
> -			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src,
> +				 src_bo);
>   
>   			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
>   							      flush_flags);
> @@ -1437,9 +1466,10 @@ struct dma_fence *xe_migrate_vram_copy_chunk(struct xe_bo *vram_bo, u64 vram_off
>   		if (xe_migrate_allow_identity(vram_L0, &vram_it))
>   			xe_res_next(&vram_it, vram_L0);
>   		else
> -			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram);
> +			emit_pte(m, bb, vram_L0_pt, true, use_comp_pat, &vram_it, vram_L0, vram,
> +				 vram_bo);
>   
> -		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem);
> +		emit_pte(m, bb, sysmem_L0_pt, false, false, &sysmem_it, vram_L0, sysmem, sysmem_bo);
>   
>   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>   		update_idx = bb->len;
> @@ -1663,7 +1693,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>   			xe_res_next(&src_it, clear_L0);
>   		} else {
>   			emit_pte(m, bb, clear_L0_pt, clear_vram,
> -				 clear_only_system_ccs, &src_it, clear_L0, dst);
> +				 clear_only_system_ccs, &src_it, clear_L0, dst, bo);
>   			flush_flags |= MI_INVALIDATE_TLB;
>   		}
>   
> @@ -1868,6 +1898,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   	int err = 0;
>   	bool is_migrate = pt_update_ops->q == m->q;
>   	bool usm = is_migrate && xe->info.has_usm;
> +	enum ttm_caching caching = ttm_cached;

If we don't account for the type of memory in this path, maybe just 
leave this path as-is for now?

>   
>   	for (i = 0; i < pt_update_ops->num_ops; ++i) {
>   		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> @@ -1896,7 +1927,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>   
>   	/* For sysmem PTE's, need to map them in our hole.. */
>   	if (!IS_DGFX(xe)) {
> -		u16 pat_index = xe_cache_pat_idx(xe, XE_CACHE_WB);
> +		u16 pat_index = xe_migrate_pat_index(xe, caching, false);
>   		u32 ptes, ofs;
>   
>   		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> @@ -2118,8 +2149,9 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>   				       struct drm_pagemap_addr *sram_addr,
>   				       u32 size, int level)
>   {
> -	u16 pat_index = xe_cache_pat_idx(tile_to_xe(m->tile), XE_CACHE_WB);
>   	u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
> +	enum ttm_caching caching = ttm_cached;
> +	u16 pat_index = xe_migrate_pat_index(tile_to_xe(m->tile), caching, false);
>   	u32 ptes;
>   	int i = 0;
>   

