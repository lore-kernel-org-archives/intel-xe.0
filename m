Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B8EC27C4F
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 15:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7FC10F201;
	Fri, 21 Jun 2024 15:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWGjydEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0910F201
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718983443; x=1750519443;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BHTy4aeZF4Nv0r2QNDMc1gQWk11YhWHKCKZeKxd3MLA=;
 b=PWGjydELMKCej4oC1Jrr5O8AxnGIF5vKGBPdDr+EvlMSWMePGZnoWmNo
 QpTYS0bcYzm31reCYI2NMPwtwY/Db47h5Rz8N1cnF7jzqTZ1WcbK3o9Zc
 t1jBFuSVBiQprAOFo1uaaC3LZxbhb2HMr8Ho6t35k43OS/gH3JyXAIWbD
 fM7UbtJbOkW4J1/0lyep/xU7kxpnfs3eoB6X31vMI3xkTh3IDAdmloM4u
 fK9MoEZ9trkb5PnWmG4/RakoRFnw617S5DIkZKvgEzp+tamtzsoKp83Jo
 7kKXKcOK1qPJ1KrAde3+QJ2qVSyng0YZfEnGoAUFUaPuCjEAbvl1FB3TP A==;
X-CSE-ConnectionGUID: aEJ6z393TvK1AJVPzCoc+g==
X-CSE-MsgGUID: YRcan1x6RiyYuaIXFjGyrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19908096"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="19908096"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 08:24:03 -0700
X-CSE-ConnectionGUID: MEUBaxYvSbaGgXRUa7+G3A==
X-CSE-MsgGUID: jlNFqPOTRmuFPIl+nryucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="80124251"
Received: from johunt-mobl9.ger.corp.intel.com (HELO [10.245.244.53])
 ([10.245.244.53])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 08:24:02 -0700
Message-ID: <cc8cd054-361c-44a9-93e4-c4a48d33f139@intel.com>
Date: Fri, 21 Jun 2024 16:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] drm/xe: Convert multiple bind ops into single job
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240618171509.3336601-1-matthew.brost@intel.com>
 <20240618171509.3336601-5-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240618171509.3336601-5-matthew.brost@intel.com>
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

On 18/06/2024 18:15, Matthew Brost wrote:
> This aligns with the uAPI of an array of binds or single bind that
> results in multiple GPUVA ops to be considered a single atomic
> operations.
> 
> The implemenation is roughly:
> - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> - each xe_vma_op resolves to 0-3 PT ops
> - xe_vma_ops creates a single job
> - if at any point during binding a failure occurs, xe_vma_ops contains
>    the information necessary unwind the PT and VMA (GPUVA) state
> 
> v2:
>   - add missing dma-resv slot reservation (CI, testing)
> v4:
>   - Fix TLB invalidation (Paulo)
>   - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> 
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---

<snip>

> +
> +static int bind_op_prepare(struct xe_vm *vm, struct xe_tile *tile,
> +			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			   struct xe_vma *vma)
> +{
> +	u32 current_op = pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +	struct llist_head *deferred = &pt_update_ops->deferred;
> +	int err;
>   
>   	xe_bo_assert_held(xe_vma_bo(vma));
> -	xe_vm_assert_held(vm);
>   
>   	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> -	       "Preparing unbind, with range [%llx...%llx) engine %p.\n",
> -	       xe_vma_start(vma), xe_vma_end(vma), q);
> -
> -	num_entries = xe_pt_stage_unbind(tile, vma, entries);
> -	xe_tile_assert(tile, num_entries <= ARRAY_SIZE(entries));
> +	       "Preparing bind, with range [%llx...%llx)\n",
> +	       xe_vma_start(vma), xe_vma_end(vma) - 1);
>   
> -	xe_vm_dbg_print_entries(tile_to_xe(tile), entries, num_entries);
> -	xe_pt_calc_rfence_interval(vma, &unbind_pt_update, entries,
> -				   num_entries);
> +	pt_op->vma = NULL;
> +	pt_op->bind = true;
> +	pt_op->rebind = BIT(tile->id) & vma->tile_present;
>   
> -	err = dma_resv_reserve_fences(xe_vm_resv(vm), 1);
> -	if (!err && !xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> -		err = dma_resv_reserve_fences(xe_vma_bo(vma)->ttm.base.resv, 1);
> +	err = vma_reserve_fences(tile_to_xe(tile), vma);
>   	if (err)
> -		return ERR_PTR(err);
> +		return err;
>   
> -	ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> -	if (!ifence)
> -		return ERR_PTR(-ENOMEM);
> +	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> +				 &pt_op->num_entries);
> +	if (!err) {
> +		xe_tile_assert(tile, pt_op->num_entries <=
> +			       ARRAY_SIZE(pt_op->entries));
> +		xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> +					pt_op->num_entries, true);
>   
> -	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> -	if (!rfence) {
> -		kfree(ifence);
> -		return ERR_PTR(-ENOMEM);
> +		xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
> +		++pt_update_ops->current_op;
> +		pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> +
> +
> +		/*
> +		 * If rebind, we have to invalidate TLB on !LR vms to invalidate
> +		 * cached PTEs point to freed memory. on LR vms this is done

s/on/On/

> +		 * automatically when the context is re-enabled by the rebind worker,
> +		 * or in fault mode it was invalidated on PTE zapping.
> +		 *
> +		 * If !rebind, and scratch enabled VMs, there is a chance the scratch
> +		 * PTE is already cached in the TLB so it needs to be invalidated.
> +		 * on !LR VMs this is done in the ring ops preceding a batch, but on

ditto

> +		 * non-faulting LR, in particular on user-space batch buffer chaining,
> +		 * it needs to be done here.
> +		 */
> +		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> +		     xe_vm_in_preempt_fence_mode(vm)))
> +			pt_update_ops->needs_invalidation = true;
> +		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> +			/* We bump also if batch_invalidate_tlb is true */
> +			vm->tlb_flush_seqno++;
> +
> +		/* FIXME: Don't commit right away */
> +		vma->tile_staged |= BIT(tile->id);
> +		pt_op->vma = vma;
> +		xe_pt_commit_bind(vma, pt_op->entries, pt_op->num_entries,
> +				  pt_op->rebind, deferred);
>   	}
>   
> +	return err;
> +}
> +
> +static int unbind_op_prepare(struct xe_tile *tile,
> +			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			     struct xe_vma *vma)
> +{
> +	u32 current_op = pt_update_ops->current_op;
> +	struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[current_op];
> +	struct llist_head *deferred = &pt_update_ops->deferred;
> +	int err;
> +
> +	if (!((vma->tile_present | vma->tile_staged) & BIT(tile->id)))
> +		return 0;
> +
> +	xe_bo_assert_held(xe_vma_bo(vma));
> +
> +	vm_dbg(&xe_vma_vm(vma)->xe->drm,
> +	       "Preparing unbind, with range [%llx...%llx)\n",
> +	       xe_vma_start(vma), xe_vma_end(vma) - 1);
> +
>   	/*
> -	 * Even if we were already evicted and unbind to destroy, we need to
> -	 * clear again here. The eviction may have updated pagetables at a
> -	 * lower level, because it needs to be more conservative.
> +	 * Wait for invalidation to complete. Can corrupt internal page table
> +	 * state if an invalidation is running while preparing an unbind.
>   	 */
> -	fence = xe_migrate_update_pgtables(tile->migrate,
> -					   vm, NULL, q ? q :
> -					   vm->q[tile->id],
> -					   entries, num_entries,
> -					   syncs, num_syncs,
> -					   &unbind_pt_update.base);
> -	if (!IS_ERR(fence)) {
> -		int err;
> -
> -		err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> -					    &xe_range_fence_kfree_ops,
> -					    unbind_pt_update.base.start,
> -					    unbind_pt_update.base.last, fence);
> -		if (err)
> -			dma_fence_wait(fence, false);
> +	if (xe_vma_is_userptr(vma) && xe_vm_in_fault_mode(xe_vma_vm(vma)))
> +		mmu_interval_read_begin(&to_userptr_vma(vma)->userptr.notifier);
>   
> -		/* TLB invalidation must be done before signaling unbind */
> -		err = invalidation_fence_init(tile->primary_gt, ifence, fence,
> -					      xe_vma_start(vma),
> -					      xe_vma_end(vma),
> -					      xe_vma_vm(vma)->usm.asid);
> -		if (err) {
> -			dma_fence_put(fence);
> -			kfree(ifence);
> -			return ERR_PTR(err);
> +	pt_op->vma = vma;
> +	pt_op->bind = false;
> +	pt_op->rebind = false;
> +
> +	err = vma_reserve_fences(tile_to_xe(tile), vma);
> +	if (err)
> +		return err;
> +
> +	pt_op->num_entries = xe_pt_stage_unbind(tile, vma, pt_op->entries);
> +
> +	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> +				pt_op->num_entries, false);
> +	xe_pt_update_ops_rfence_interval(pt_update_ops, vma);
> +	++pt_update_ops->current_op;
> +	pt_update_ops->needs_userptr_lock |= xe_vma_is_userptr(vma);
> +	pt_update_ops->needs_invalidation = true;
> +
> +	/* FIXME: Don't commit right away */
> +	xe_pt_commit_unbind(vma, pt_op->entries, pt_op->num_entries,
> +			    deferred);
> +
> +	return 0;
> +}
> +
> +static int op_prepare(struct xe_vm *vm,
> +		      struct xe_tile *tile,
> +		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> +		      struct xe_vma_op *op)
> +{
> +	int err = 0;
> +
> +	xe_vm_assert_held(vm);
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +			break;
> +
> +		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma);
> +		pt_update_ops->wait_vm_kernel = true;
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		err = unbind_op_prepare(tile, pt_update_ops,
> +					gpuva_to_vma(op->base.remap.unmap->va));
> +
> +		if (!err && op->remap.prev) {
> +			err = bind_op_prepare(vm, tile, pt_update_ops,
> +					      op->remap.prev);
> +			pt_update_ops->wait_vm_bookkeep = true;
>   		}
> -		fence = &ifence->base.base;
> +		if (!err && op->remap.next) {
> +			err = bind_op_prepare(vm, tile, pt_update_ops,
> +					      op->remap.next);
> +			pt_update_ops->wait_vm_bookkeep = true;
> +		}
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		err = unbind_op_prepare(tile, pt_update_ops,
> +					gpuva_to_vma(op->base.unmap.va));
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		err = bind_op_prepare(vm, tile, pt_update_ops,
> +				      gpuva_to_vma(op->base.prefetch.va));
> +		pt_update_ops->wait_vm_kernel = true;
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
>   
> -		/* add shared fence now for pagetable delayed destroy */
> -		dma_resv_add_fence(xe_vm_resv(vm), fence,
> -				   DMA_RESV_USAGE_BOOKKEEP);
> +	return err;
> +}
>   
> -		/* This fence will be installed by caller when doing eviction */
> -		if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> -			dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> -					   DMA_RESV_USAGE_BOOKKEEP);
> -		xe_pt_commit_unbind(vma, entries, num_entries,
> -				    unbind_pt_update.locked ? &deferred : NULL);
> -		vma->tile_present &= ~BIT(tile->id);
> -	} else {
> -		kfree(rfence);
> -		kfree(ifence);
> +static void
> +xe_pt_update_ops_init(struct xe_vm_pgtable_update_ops *pt_update_ops)
> +{
> +	init_llist_head(&pt_update_ops->deferred);
> +	pt_update_ops->start = ~0x0ull;
> +	pt_update_ops->last = 0x0ull;
> +}
> +
> +/**
> + * xe_pt_update_ops_prepare() - Prepare PT update operations
> + * @tile: Tile of PT update operations
> + * @vops: VMA operationa
> + *
> + * Prepare PT update operations which includes updating internal PT state,
> + * allocate memory for page tables, populate page table being pruned in, and
> + * create PT update operations for leaf insertion / removal.
> + *
> + * Return: 0 on success, negative error code on error.
> + */
> +int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *vops)
> +{
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> +		&vops->pt_update_ops[tile->id];
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	lockdep_assert_held(&vops->vm->lock);
> +	xe_vm_assert_held(vops->vm);
> +
> +	xe_pt_update_ops_init(pt_update_ops);
> +
> +	err = dma_resv_reserve_fences(xe_vm_resv(vops->vm),
> +				      tile_to_xe(tile)->info.tile_count);
> +	if (err)
> +		return err;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		err = op_prepare(vops->vm, tile, pt_update_ops, op);
> +
> +		if (err)
> +			return err;
>   	}
>   
> -	if (!vma->tile_present)
> -		list_del_init(&vma->combined_links.rebind);
> +	xe_tile_assert(tile, pt_update_ops->current_op <=
> +		       pt_update_ops->num_ops);
> +
> +	return 0;
> +}
> +
> +static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> +			   struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			   struct xe_vma *vma, struct dma_fence *fence)
> +{
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +	vma->tile_present |= BIT(tile->id);
> +	vma->tile_staged &= ~BIT(tile->id);
> +	if (xe_vma_is_userptr(vma)) {
> +		lockdep_assert_held_read(&vm->userptr.notifier_lock);
> +		to_userptr_vma(vma)->userptr.initial_bind = true;
> +	}
>   
> -	if (unbind_pt_update.locked) {
> -		xe_tile_assert(tile, xe_vma_is_userptr(vma));
> +	/*
> +	 * Kick rebind worker if this bind triggers preempt fences and not in
> +	 * the rebind worker
> +	 */
> +	if (pt_update_ops->wait_vm_bookkeep &&
> +	    xe_vm_in_preempt_fence_mode(vm) &&
> +	    !current->mm)
> +		xe_vm_queue_rebind_worker(vm);
> +}
> +
> +static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
> +			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> +			     struct xe_vma *vma, struct dma_fence *fence)
> +{
> +	if (!xe_vma_has_no_bo(vma) && !xe_vma_bo(vma)->vm)
> +		dma_resv_add_fence(xe_vma_bo(vma)->ttm.base.resv, fence,
> +				   pt_update_ops->wait_vm_bookkeep ?
> +				   DMA_RESV_USAGE_KERNEL :
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +	vma->tile_present &= ~BIT(tile->id);
> +	if (!vma->tile_present) {
> +		list_del_init(&vma->combined_links.rebind);
> +		if (xe_vma_is_userptr(vma)) {
> +			lockdep_assert_held_read(&vm->userptr.notifier_lock);
>   
> -		if (!vma->tile_present) {
>   			spin_lock(&vm->userptr.invalidated_lock);
>   			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
>   			spin_unlock(&vm->userptr.invalidated_lock);
>   		}
> -		up_read(&vm->userptr.notifier_lock);
> -		xe_bo_put_commit(&deferred);
>   	}
> +}
> +
> +static void op_commit(struct xe_vm *vm,
> +		      struct xe_tile *tile,
> +		      struct xe_vm_pgtable_update_ops *pt_update_ops,
> +		      struct xe_vma_op *op, struct dma_fence *fence)
> +{
> +	xe_vm_assert_held(vm);
> +
> +	switch (op->base.op) {
> +	case DRM_GPUVA_OP_MAP:
> +		if (!op->map.immediate && xe_vm_in_fault_mode(vm))
> +			break;
> +
> +		bind_op_commit(vm, tile, pt_update_ops, op->map.vma, fence);
> +		break;
> +	case DRM_GPUVA_OP_REMAP:
> +		unbind_op_commit(vm, tile, pt_update_ops,
> +				 gpuva_to_vma(op->base.remap.unmap->va), fence);
> +
> +		if (op->remap.prev)
> +			bind_op_commit(vm, tile, pt_update_ops, op->remap.prev,
> +				       fence);
> +		if (op->remap.next)
> +			bind_op_commit(vm, tile, pt_update_ops, op->remap.next,
> +				       fence);
> +		break;
> +	case DRM_GPUVA_OP_UNMAP:
> +		unbind_op_commit(vm, tile, pt_update_ops,
> +				 gpuva_to_vma(op->base.unmap.va), fence);
> +		break;
> +	case DRM_GPUVA_OP_PREFETCH:
> +		bind_op_commit(vm, tile, pt_update_ops,
> +			       gpuva_to_vma(op->base.prefetch.va), fence);
> +		break;
> +	default:
> +		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> +	}
> +}
> +
> +static const struct xe_migrate_pt_update_ops migrate_ops = {
> +	.populate = xe_vm_populate_pgtable,
> +	.clear = xe_migrate_clear_pgtable_callback,
> +	.pre_commit = xe_pt_pre_commit,
> +};
> +
> +static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
> +	.populate = xe_vm_populate_pgtable,
> +	.clear = xe_migrate_clear_pgtable_callback,
> +	.pre_commit = xe_pt_userptr_pre_commit,
> +};
> +
> +/**
> + * xe_pt_update_ops_run() - Run PT update operations
> + * @tile: Tile of PT update operations
> + * @vops: VMA operationa
> + *
> + * Run PT update operations which includes committing internal PT state changes,
> + * creating job for PT update operations for leaf insertion / removal, and
> + * installing job fence in various places.
> +  *
> + * Return: fence on success, negative ERR_PTR on error.
> + */
> +struct dma_fence *
> +xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> +{
> +	struct xe_vm *vm = vops->vm;
> +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> +		&vops->pt_update_ops[tile->id];
> +	struct dma_fence *fence;
> +	struct invalidation_fence *ifence = NULL;
> +	struct xe_range_fence *rfence;
> +	struct xe_vma_op *op;
> +	int err = 0;
> +	struct xe_migrate_pt_update update = {
> +		.ops = pt_update_ops->needs_userptr_lock ?
> +			&userptr_migrate_ops :
> +			&migrate_ops,
> +		.vops = vops,
> +		.tile_id = tile->id

Nit: I think needs a comma here.

> +	};
> +
> +	lockdep_assert_held(&vm->lock);
> +	xe_vm_assert_held(vm);
> +
> +	if (!pt_update_ops->current_op) {
> +		xe_tile_assert(tile, xe_vm_in_fault_mode(vm));
> +
> +		return dma_fence_get_stub();
> +	}
> +
> +	if (pt_update_ops->needs_invalidation) {
> +		ifence = kzalloc(sizeof(*ifence), GFP_KERNEL);
> +		if (!ifence)
> +			return ERR_PTR(-ENOMEM);
> +	}
> +
> +	rfence = kzalloc(sizeof(*rfence), GFP_KERNEL);
> +	if (!rfence) {
> +		err = -ENOMEM;
> +		goto free_ifence;
> +	}
> +
> +	fence = xe_migrate_update_pgtables(tile->migrate, &update);
> +	if (IS_ERR(fence)) {
> +		err = PTR_ERR(fence);
> +		goto free_rfence;
> +	}
> +
> +	err = xe_range_fence_insert(&vm->rftree[tile->id], rfence,
> +				    &xe_range_fence_kfree_ops,
> +				    pt_update_ops->start,
> +				    pt_update_ops->last, fence);
> +	if (err)
> +		dma_fence_wait(fence, false);

Could maybe set err back to zero or don't set it? Just so we don't leave 
any possible booby traps later?

<snip>
