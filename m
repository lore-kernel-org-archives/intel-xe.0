Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65B8C7618E
	for <intel-xe@archiver.kernel.org>; Fri, 21 Apr 2023 12:53:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D71810E096;
	Fri, 21 Apr 2023 12:53:00 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1699410E096
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Apr 2023 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682081579; x=1713617579;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OIydVl+h+ar7xyeuYSOMiupL4r0fyc6gvxxtJ9Di290=;
 b=ef5ETZ9xiZvR7w8YnWopL9ytS/Noc3t1cAqvLiuEPvrcdgEl3BtG5Yd/
 hYG58t40KF6eEiIsgweEvWPK1UkzMQGBAfXeNuRbje1p8iv+6AwwSlahq
 6itINyAWFLhhiLE691cyx1OUk1NkSpaDVFuaZF/hQfpv86a1A2E9hBt4S
 GzIg884+wyGtk2rYgz6whXMfcTeuAZGBqj6MG0UlOFqHHxQcakszMLrCJ
 jNLURarf88cqpaMEPyWgJNMiAwg0EdyZWyTPDhbPQmnlRDhL6bAGZHvyy
 r8H0JCCrEcZa/JbWrUyLFSSnMcxNzEUBQ892eyXeHWrXaAT8CDR/tOA1/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="348780768"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="348780768"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 05:52:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816415048"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="816415048"
Received: from jpoulsen-mobl.ger.corp.intel.com (HELO [10.249.254.125])
 ([10.249.254.125])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 05:52:57 -0700
Message-ID: <ba10858f-015a-208f-7a56-c034c269bd72@linux.intel.com>
Date: Fri, 21 Apr 2023 14:52:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230404014228.3738347-1-matthew.brost@intel.com>
 <20230404014228.3738347-5-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230404014228.3738347-5-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v5 4/8] drm/xe: Port Xe to GPUVA
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


On 4/4/23 03:42, Matthew Brost wrote:
> Rather than open coding VM binds and VMA tracking, use the GPUVA
> library. GPUVA provides a common infrastructure for VM binds to use mmap
> / munmap semantics and support for VK sparse bindings.
>
> The concepts are:
>
> 1) xe_vm inherits from drm_gpuva_manager
> 2) xe_vma inherits from drm_gpuva
> 3) xe_vma_op inherits from drm_gpuva_op
> 4) VM bind operations (MAP, UNMAP, PREFETCH, UNMAP_ALL) call into the
> GPUVA code to generate an VMA operations list which is parsed, commited,
> and executed.
>
> v2 (CI): Add break after default in case statement.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
>   drivers/gpu/drm/xe/xe_device.c              |    2 +-
>   drivers/gpu/drm/xe/xe_exec.c                |    2 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c        |   23 +-
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
>   drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
>   drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
>   drivers/gpu/drm/xe/xe_pt.c                  |  106 +-
>   drivers/gpu/drm/xe/xe_trace.h               |   10 +-
>   drivers/gpu/drm/xe/xe_vm.c                  | 1799 +++++++++----------
>   drivers/gpu/drm/xe/xe_vm.h                  |   66 +-
>   drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
>   drivers/gpu/drm/xe/xe_vm_types.h            |  165 +-
>   13 files changed, 1126 insertions(+), 1172 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5460e6fe3c1f..3a482c61c3ec 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -391,7 +391,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   {
>   	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
> -	struct xe_vma *vma;
> +	struct drm_gpuva *gpuva;
> +	struct drm_gem_object *obj = &bo->ttm.base;
>   	int ret = 0;
>   
>   	dma_resv_assert_held(bo->ttm.base.resv);
> @@ -404,8 +405,9 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   		dma_resv_iter_end(&cursor);
>   	}
>   
> -	list_for_each_entry(vma, &bo->vmas, bo_link) {
> -		struct xe_vm *vm = vma->vm;
> +	drm_gem_for_each_gpuva(gpuva, obj) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +		struct xe_vm *vm = xe_vma_vm(vma);
>   
>   		trace_xe_vma_evict(vma);
>   
> @@ -430,10 +432,8 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   			} else {
>   				ret = timeout;
>   			}
> -

Unrelated


>   		} else {
>   			bool vm_resv_locked = false;
> -			struct xe_vm *vm = vma->vm;
>   
>   			/*
>   			 * We need to put the vma on the vm's rebind_list,
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index a79f934e3d2d..d0d70adedba6 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -130,7 +130,7 @@ static struct drm_driver driver = {
>   	.driver_features =
>   	    DRIVER_GEM |
>   	    DRIVER_RENDER | DRIVER_SYNCOBJ |
> -	    DRIVER_SYNCOBJ_TIMELINE,
> +	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
>   	.open = xe_file_open,
>   	.postclose = xe_file_close,
>   
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index ea869f2452ef..214d82bc906b 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -118,7 +118,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>   		if (xe_vma_is_userptr(vma))
>   			continue;
>   
> -		err = xe_bo_validate(vma->bo, vm, false);
> +		err = xe_bo_validate(xe_vma_bo(vma), vm, false);
>   		if (err) {
>   			xe_vm_unlock_dma_resv(vm, tv_onstack, *tv, ww, objs);
>   			*tv = NULL;
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 1677640e1075..f7a066090a13 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -75,9 +75,10 @@ static bool vma_is_valid(struct xe_gt *gt, struct xe_vma *vma)
>   		!(BIT(gt->info.id) & vma->usm.gt_invalidated);
>   }
>   
> -static bool vma_matches(struct xe_vma *vma, struct xe_vma *lookup)
> +static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>   {
> -	if (lookup->start > vma->end || lookup->end < vma->start)
> +	if (page_addr > xe_vma_end(vma) - 1 ||
> +	    page_addr + SZ_4K < xe_vma_start(vma))
>   		return false;
>   
>   	return true;
> @@ -90,16 +91,14 @@ static bool only_needs_bo_lock(struct xe_bo *bo)
>   
>   static struct xe_vma *lookup_vma(struct xe_vm *vm, u64 page_addr)
>   {
> -	struct xe_vma *vma = NULL, lookup;
> +	struct xe_vma *vma = NULL;
>   
> -	lookup.start = page_addr;
> -	lookup.end = lookup.start + SZ_4K - 1;
>   	if (vm->usm.last_fault_vma) {   /* Fast lookup */
> -		if (vma_matches(vm->usm.last_fault_vma, &lookup))
> +		if (vma_matches(vm->usm.last_fault_vma, page_addr))
>   			vma = vm->usm.last_fault_vma;
>   	}
>   	if (!vma)
> -		vma = xe_vm_find_overlapping_vma(vm, &lookup);
> +		vma = xe_vm_find_overlapping_vma(vm, page_addr, SZ_4K);
>   
>   	return vma;
>   }
> @@ -170,7 +169,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   	}
>   
>   	/* Lock VM and BOs dma-resv */
> -	bo = vma->bo;
> +	bo = xe_vma_bo(vma);
>   	if (only_needs_bo_lock(bo)) {
>   		/* This path ensures the BO's LRU is updated */
>   		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> @@ -487,12 +486,8 @@ static struct xe_vma *get_acc_vma(struct xe_vm *vm, struct acc *acc)
>   {
>   	u64 page_va = acc->va_range_base + (ffs(acc->sub_granularity) - 1) *
>   		sub_granularity_in_byte(acc->granularity);
> -	struct xe_vma lookup;
> -
> -	lookup.start = page_va;
> -	lookup.end = lookup.start + SZ_4K - 1;
>   
> -	return xe_vm_find_overlapping_vma(vm, &lookup);
> +	return xe_vm_find_overlapping_vma(vm, page_va, SZ_4K);
>   }
>   
>   static int handle_acc(struct xe_gt *gt, struct acc *acc)
> @@ -536,7 +531,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>   		goto unlock_vm;
>   
>   	/* Lock VM and BOs dma-resv */
> -	bo = vma->bo;
> +	bo = xe_vma_bo(vma);
>   	if (only_needs_bo_lock(bo)) {
>   		/* This path ensures the BO's LRU is updated */
>   		ret = xe_bo_lock(bo, &ww, xe->info.tile_count, false);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index f279e21300aa..155f37aaf31c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -201,8 +201,8 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   	if (!xe->info.has_range_tlb_invalidation) {
>   		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
>   	} else {
> -		u64 start = vma->start;
> -		u64 length = vma->end - vma->start + 1;
> +		u64 start = xe_vma_start(vma);
> +		u64 length = xe_vma_size(vma);
>   		u64 align, end;
>   
>   		if (length < SZ_4K)
> @@ -215,12 +215,12 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   		 * address mask covering the required range.
>   		 */
>   		align = roundup_pow_of_two(length);
> -		start = ALIGN_DOWN(vma->start, align);
> -		end = ALIGN(vma->start + length, align);
> +		start = ALIGN_DOWN(xe_vma_start(vma), align);
> +		end = ALIGN(xe_vma_start(vma) + length, align);
>   		length = align;
>   		while (start + length < end) {
>   			length <<= 1;
> -			start = ALIGN_DOWN(vma->start, length);
> +			start = ALIGN_DOWN(xe_vma_start(vma), length);
>   		}
>   
>   		/*
> @@ -229,7 +229,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   		 */
>   		if (length >= SZ_2M) {
>   			length = max_t(u64, SZ_16M, length);
> -			start = ALIGN_DOWN(vma->start, length);
> +			start = ALIGN_DOWN(xe_vma_start(vma), length);
>   		}
>   
>   		XE_BUG_ON(length < SZ_4K);
> @@ -238,7 +238,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>   		XE_BUG_ON(!IS_ALIGNED(start, length));
>   
>   		action[len++] = MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> -		action[len++] = vma->vm->usm.asid;
> +		action[len++] = xe_vma_vm(vma)->usm.asid;
>   		action[len++] = lower_32_bits(start);
>   		action[len++] = upper_32_bits(start);
>   		action[len++] = ilog2(length) - ilog2(SZ_4K);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5e00b75d3ca2..e5ed9022a0a2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -783,13 +783,13 @@ static int parse_g2h_response(struct xe_guc_ct *ct, u32 *msg, u32 len)
>   	if (type == GUC_HXG_TYPE_RESPONSE_FAILURE) {
>   		g2h_fence->fail = true;
>   		g2h_fence->error =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[1]);
>   		g2h_fence->hint =
> -			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
> +			FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[1]);
>   	} else if (type == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>   		g2h_fence->retry = true;
>   		g2h_fence->reason =
> -			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[0]);
> +			FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, msg[1]);
>   	} else if (g2h_fence->response_buffer) {
>   		g2h_fence->response_len = response_len;
>   		memcpy(g2h_fence->response_buffer, msg + GUC_CTB_MSG_MIN_LEN,
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index e8978440c725..fee4c0028a2f 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1049,8 +1049,10 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>   		return ERR_PTR(-ETIME);
>   
>   	if (wait_vm && !dma_resv_test_signaled(&vm->resv,
> -					       DMA_RESV_USAGE_BOOKKEEP))
> +					       DMA_RESV_USAGE_BOOKKEEP)) {
> +		vm_dbg(&vm->xe->drm, "wait on VM for munmap");
>   		return ERR_PTR(-ETIME);
> +	}
>   
>   	if (ops->pre_commit) {
>   		err = ops->pre_commit(pt_update);
> @@ -1138,7 +1140,8 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>   	u64 addr;
>   	int err = 0;
>   	bool usm = !eng && xe->info.supports_usm;
> -	bool first_munmap_rebind = vma && vma->first_munmap_rebind;
> +	bool first_munmap_rebind = vma &&
> +		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
>   
>   	/* Use the CPU if no in syncs and engine is idle */
>   	if (no_in_syncs(syncs, num_syncs) && (!eng || xe_engine_is_idle(eng))) {
> @@ -1259,6 +1262,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>   	 * trigger preempts before moving forward
>   	 */
>   	if (first_munmap_rebind) {
> +		vm_dbg(&vm->xe->drm, "wait on first_munmap_rebind");
>   		err = job_add_deps(job, &vm->resv,
>   				   DMA_RESV_USAGE_BOOKKEEP);
>   		if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6b2943efcdbc..37a1ce6f62a3 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -94,7 +94,7 @@ static dma_addr_t vma_addr(struct xe_vma *vma, u64 offset,
>   				&cur);
>   		return xe_res_dma(&cur) + offset;
>   	} else {
> -		return xe_bo_addr(vma->bo, offset, page_size, is_vram);
> +		return xe_bo_addr(xe_vma_bo(vma), offset, page_size, is_vram);
>   	}
>   }
>   
> @@ -159,7 +159,7 @@ u64 gen8_pte_encode(struct xe_vma *vma, struct xe_bo *bo,
>   
>   	if (is_vram) {
>   		pte |= GEN12_PPGTT_PTE_LM;
> -		if (vma && vma->use_atomic_access_pte_bit)
> +		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>   			pte |= GEN12_USM_PPGTT_PTE_AE;
>   	}
>   
> @@ -738,7 +738,7 @@ static int
>   xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>   		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>   {
> -	struct xe_bo *bo = vma->bo;
> +	struct xe_bo *bo = xe_vma_bo(vma);
>   	bool is_vram = !xe_vma_is_userptr(vma) && bo && xe_bo_is_vram(bo);
>   	struct xe_res_cursor curs;
>   	struct xe_pt_stage_bind_walk xe_walk = {
> @@ -747,22 +747,23 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>   			.shifts = xe_normal_pt_shifts,
>   			.max_level = XE_PT_HIGHEST_LEVEL,
>   		},
> -		.vm = vma->vm,
> +		.vm = xe_vma_vm(vma),
>   		.gt = gt,
>   		.curs = &curs,
> -		.va_curs_start = vma->start,
> -		.pte_flags = vma->pte_flags,
> +		.va_curs_start = xe_vma_start(vma),
> +		.pte_flags = xe_vma_read_only(vma) ? PTE_READ_ONLY : 0,
>   		.wupd.entries = entries,
> -		.needs_64K = (vma->vm->flags & XE_VM_FLAGS_64K) && is_vram,
> +		.needs_64K = (xe_vma_vm(vma)->flags & XE_VM_FLAGS_64K) &&
> +			is_vram,
>   	};
> -	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
> +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[gt->info.id];
>   	int ret;
>   
>   	if (is_vram) {
>   		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
>   
>   		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
> -		if (vma && vma->use_atomic_access_pte_bit)
> +		if (vma && vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>   			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
>   		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
>   			gt_to_xe(gt)->mem.vram.io_start;
> @@ -778,17 +779,16 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
>   
>   	xe_bo_assert_held(bo);
>   	if (xe_vma_is_userptr(vma))
> -		xe_res_first_sg(vma->userptr.sg, 0, vma->end - vma->start + 1,
> -				&curs);
> +		xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma), &curs);
>   	else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
> -		xe_res_first(bo->ttm.resource, vma->bo_offset,
> -			     vma->end - vma->start + 1, &curs);
> +		xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
> +			     xe_vma_size(vma), &curs);
>   	else
> -		xe_res_first_sg(xe_bo_get_sg(bo), vma->bo_offset,
> -				vma->end - vma->start + 1, &curs);
> +		xe_res_first_sg(xe_bo_get_sg(bo), xe_vma_bo_offset(vma),
> +				xe_vma_size(vma), &curs);
>   
> -	ret = drm_pt_walk_range(&pt->drm, pt->level, vma->start, vma->end + 1,
> -				&xe_walk.drm);
> +	ret = drm_pt_walk_range(&pt->drm, pt->level, xe_vma_start(vma),
> +				xe_vma_end(vma), &xe_walk.drm);
>   
>   	*num_entries = xe_walk.wupd.num_used_entries;
>   	return ret;
> @@ -923,13 +923,13 @@ bool xe_pt_zap_ptes(struct xe_gt *gt, struct xe_vma *vma)
>   		},
>   		.gt = gt,
>   	};
> -	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
> +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[gt->info.id];
>   
>   	if (!(vma->gt_present & BIT(gt->info.id)))
>   		return false;
>   
> -	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
> -				 &xe_walk.drm);
> +	(void)drm_pt_walk_shared(&pt->drm, pt->level, xe_vma_start(vma),
> +				 xe_vma_end(vma), &xe_walk.drm);
>   
>   	return xe_walk.needs_invalidate;
>   }
> @@ -966,21 +966,21 @@ static void xe_pt_abort_bind(struct xe_vma *vma,
>   			continue;
>   
>   		for (j = 0; j < entries[i].qwords; j++)
> -			xe_pt_destroy(entries[i].pt_entries[j].pt, vma->vm->flags, NULL);
> +			xe_pt_destroy(entries[i].pt_entries[j].pt, xe_vma_vm(vma)->flags, NULL);
>   		kfree(entries[i].pt_entries);
>   	}
>   }
>   
>   static void xe_pt_commit_locks_assert(struct xe_vma *vma)
>   {
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   
>   	lockdep_assert_held(&vm->lock);
>   
>   	if (xe_vma_is_userptr(vma))
>   		lockdep_assert_held_read(&vm->userptr.notifier_lock);
>   	else
> -		dma_resv_assert_held(vma->bo->ttm.base.resv);
> +		dma_resv_assert_held(xe_vma_bo(vma)->ttm.base.resv);
>   
>   	dma_resv_assert_held(&vm->resv);
>   }
> @@ -1013,7 +1013,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
>   
>   			if (xe_pt_entry(pt_dir, j_))
>   				xe_pt_destroy(xe_pt_entry(pt_dir, j_),
> -					      vma->vm->flags, deferred);
> +					      xe_vma_vm(vma)->flags, deferred);
>   
>   			pt_dir->dir.entries[j_] = &newpte->drm;
>   		}
> @@ -1074,7 +1074,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>   	static u32 count;
>   
>   	if (count++ % divisor == divisor - 1) {
> -		struct xe_vm *vm = vma->vm;
> +		struct xe_vm *vm = xe_vma_vm(vma);
>   
>   		vma->userptr.divisor = divisor << 1;
>   		spin_lock(&vm->userptr.invalidated_lock);
> @@ -1117,7 +1117,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>   		container_of(pt_update, typeof(*userptr_update), base);
>   	struct xe_vma *vma = pt_update->vma;
>   	unsigned long notifier_seq = vma->userptr.notifier_seq;
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   
>   	userptr_update->locked = false;
>   
> @@ -1288,20 +1288,20 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>   		},
>   		.bind = true,
>   	};
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	u32 num_entries;
>   	struct dma_fence *fence;
>   	struct invalidation_fence *ifence = NULL;
>   	int err;
>   
>   	bind_pt_update.locked = false;
> -	xe_bo_assert_held(vma->bo);
> +	xe_bo_assert_held(xe_vma_bo(vma));
>   	xe_vm_assert_held(vm);
>   	XE_BUG_ON(xe_gt_is_media_type(gt));
>   
> -	vm_dbg(&vma->vm->xe->drm,
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
>   	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
> -	       vma->start, vma->end, e);
> +	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
>   
>   	err = xe_pt_prepare_bind(gt, vma, entries, &num_entries, rebind);
>   	if (err)
> @@ -1310,23 +1310,28 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>   
>   	xe_vm_dbg_print_entries(gt_to_xe(gt), entries, num_entries);
>   
> -	if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
> +	if (rebind && !xe_vm_no_dma_fences(xe_vma_vm(vma))) {
>   		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
>   		if (!ifence)
>   			return ERR_PTR(-ENOMEM);
>   	}
>   
>   	fence = xe_migrate_update_pgtables(gt->migrate,
> -					   vm, vma->bo,
> +					   vm, xe_vma_bo(vma),
>   					   e ? e : vm->eng[gt->info.id],
>   					   entries, num_entries,
>   					   syncs, num_syncs,
>   					   &bind_pt_update.base);
>   	if (!IS_ERR(fence)) {
> +		bool last_munmap_rebind = vma->gpuva.flags & XE_VMA_LAST_REBIND;
>   		LLIST_HEAD(deferred);
>   
> +
> +		if (last_munmap_rebind)
> +			vm_dbg(&vm->xe->drm, "last_munmap_rebind");
> +
>   		/* TLB invalidation must be done before signaling rebind */
> -		if (rebind && !xe_vm_no_dma_fences(vma->vm)) {
> +		if (rebind && !xe_vm_no_dma_fences(xe_vma_vm(vma))) {
>   			int err = invalidation_fence_init(gt, ifence, fence,
>   							  vma);
>   			if (err) {
> @@ -1339,12 +1344,12 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>   
>   		/* add shared fence now for pagetable delayed destroy */
>   		dma_resv_add_fence(&vm->resv, fence, !rebind &&
> -				   vma->last_munmap_rebind ?
> +				   last_munmap_rebind ?
>   				   DMA_RESV_USAGE_KERNEL :
>   				   DMA_RESV_USAGE_BOOKKEEP);
>   
> -		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
> -			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> +		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   					   DMA_RESV_USAGE_BOOKKEEP);
>   		xe_pt_commit_bind(vma, entries, num_entries, rebind,
>   				  bind_pt_update.locked ? &deferred : NULL);
> @@ -1357,8 +1362,7 @@ __xe_pt_bind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>   			up_read(&vm->userptr.notifier_lock);
>   			xe_bo_put_commit(&deferred);
>   		}
> -		if (!rebind && vma->last_munmap_rebind &&
> -		    xe_vm_in_compute_mode(vm))
> +		if (!rebind && last_munmap_rebind && xe_vm_in_compute_mode(vm))
>   			queue_work(vm->xe->ordered_wq,
>   				   &vm->preempt.rebind_work);
>   	} else {
> @@ -1506,14 +1510,14 @@ static unsigned int xe_pt_stage_unbind(struct xe_gt *gt, struct xe_vma *vma,
>   			.max_level = XE_PT_HIGHEST_LEVEL,
>   		},
>   		.gt = gt,
> -		.modified_start = vma->start,
> -		.modified_end = vma->end + 1,
> +		.modified_start = xe_vma_start(vma),
> +		.modified_end = xe_vma_end(vma),
>   		.wupd.entries = entries,
>   	};
> -	struct xe_pt *pt = vma->vm->pt_root[gt->info.id];
> +	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[gt->info.id];
>   
> -	(void)drm_pt_walk_shared(&pt->drm, pt->level, vma->start, vma->end + 1,
> -				 &xe_walk.drm);
> +	(void)drm_pt_walk_shared(&pt->drm, pt->level, xe_vma_start(vma),
> +				 xe_vma_end(vma), &xe_walk.drm);
>   
>   	return xe_walk.wupd.num_used_entries;
>   }
> @@ -1525,7 +1529,7 @@ xe_migrate_clear_pgtable_callback(struct xe_migrate_pt_update *pt_update,
>   				  const struct xe_vm_pgtable_update *update)
>   {
>   	struct xe_vma *vma = pt_update->vma;
> -	u64 empty = __xe_pt_empty_pte(gt, vma->vm, update->pt->level);
> +	u64 empty = __xe_pt_empty_pte(gt, xe_vma_vm(vma), update->pt->level);
>   	int i;
>   
>   	XE_BUG_ON(xe_gt_is_media_type(gt));
> @@ -1563,7 +1567,7 @@ xe_pt_commit_unbind(struct xe_vma *vma,
>   			     i++) {
>   				if (xe_pt_entry(pt_dir, i))
>   					xe_pt_destroy(xe_pt_entry(pt_dir, i),
> -						      vma->vm->flags, deferred);
> +						      xe_vma_vm(vma)->flags, deferred);
>   
>   				pt_dir->dir.entries[i] = NULL;
>   			}
> @@ -1612,19 +1616,19 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>   			.vma = vma,
>   		},
>   	};
> -	struct xe_vm *vm = vma->vm;
> +	struct xe_vm *vm = xe_vma_vm(vma);
>   	u32 num_entries;
>   	struct dma_fence *fence = NULL;
>   	struct invalidation_fence *ifence;
>   	LLIST_HEAD(deferred);
>   
> -	xe_bo_assert_held(vma->bo);
> +	xe_bo_assert_held(xe_vma_bo(vma));
>   	xe_vm_assert_held(vm);
>   	XE_BUG_ON(xe_gt_is_media_type(gt));
>   
> -	vm_dbg(&vma->vm->xe->drm,
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
>   	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
> -	       vma->start, vma->end, e);
> +	       xe_vma_start(vma), xe_vma_end(vma) - 1, e);
>   
>   	num_entries = xe_pt_stage_unbind(gt, vma, entries);
>   	XE_BUG_ON(num_entries > ARRAY_SIZE(entries));
> @@ -1663,8 +1667,8 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>   				   DMA_RESV_USAGE_BOOKKEEP);
>   
>   		/* This fence will be installed by caller when doing eviction */
> -		if (!xe_vma_is_userptr(vma) && !vma->bo->vm)
> -			dma_resv_add_fence(vma->bo->ttm.base.resv, fence,
> +		if (!xe_vma_is_userptr(vma) && !xe_vma_bo(vma)->vm)
> +			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
>   					   DMA_RESV_USAGE_BOOKKEEP);
>   		xe_pt_commit_unbind(vma, entries, num_entries,
>   				    unbind_pt_update.locked ? &deferred : NULL);
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 2f8eb7ebe9a7..12e12673fc91 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -18,7 +18,7 @@
>   #include "xe_gt_types.h"
>   #include "xe_guc_engine_types.h"
>   #include "xe_sched_job.h"
> -#include "xe_vm_types.h"
> +#include "xe_vm.h"
>   
>   DECLARE_EVENT_CLASS(xe_gt_tlb_invalidation_fence,
>   		    TP_PROTO(struct xe_gt_tlb_invalidation_fence *fence),
> @@ -368,10 +368,10 @@ DECLARE_EVENT_CLASS(xe_vma,
>   
>   		    TP_fast_assign(
>   			   __entry->vma = (unsigned long)vma;
> -			   __entry->asid = vma->vm->usm.asid;
> -			   __entry->start = vma->start;
> -			   __entry->end = vma->end;
> -			   __entry->ptr = (u64)vma->userptr.ptr;
> +			   __entry->asid = xe_vma_vm(vma)->usm.asid;
> +			   __entry->start = xe_vma_start(vma);
> +			   __entry->end = xe_vma_end(vma) - 1;
> +			   __entry->ptr = xe_vma_userptr(vma);
>   			   ),
>   
>   		    TP_printk("vma=0x%016llx, asid=0x%05x, start=0x%012llx, end=0x%012llx, ptr=0x%012llx,",

Is it possible to split this patch (for review and possible regression 
debugging purposes) to introduce new macros first in one patch and then 
have the relevant xe_vm changes in a separate patch?

Anyway I'll continue reviewing the patch as is.

/Thomas


