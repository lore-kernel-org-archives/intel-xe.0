Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF907C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 16:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4A110E955;
	Wed, 26 Jun 2024 16:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l7rFuZDx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D38410E955
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 16:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719419989; x=1750955989;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GmlDtiB614R5H1w/6cH9a39f4KtVDh6TK75uosBBoX0=;
 b=l7rFuZDxIybJ67OXrEbKxOR/DBsXcOAdFDlnIY6z1MOiFdWbahBSSW6V
 rfgmg/G9ZsRXtTEiAi8qdjZCx7xluk8QE8Po1hHL804mtzCHkDxV02Zx1
 i850WnoK4MJ4cUUWvnjyWj18UQVw8TPT9NzGL0rqTVdR/29ejQRvYchLM
 0x7CIPyu6cXn82KDpQ0wx6hI3ZJysPOCJsFWjhCoQvzB5y4u64i7fSVnX
 Mf0TfneS6ll2Vd4RiLpjrMDu8XITaN9mNezKIdy0ICCreKa+v2Iq4PEGP
 lNaBdb+OJKNZzykzVGn9I0Y97wbxa7yb4blg1ps4YkxzdqjwT9iJeV28U A==;
X-CSE-ConnectionGUID: 7aIgx48CRoSwWfUUGFSoYw==
X-CSE-MsgGUID: 8vIw02nYReucpmoXKEBW/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19393553"
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="19393553"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:39:49 -0700
X-CSE-ConnectionGUID: /HLLZ5RYQHCW9KiuCgX+Dg==
X-CSE-MsgGUID: vnP6b4ObRSi+RUbrIYXENA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,267,1712646000"; d="scan'208";a="74826951"
Received: from unknown (HELO [10.245.245.26]) ([10.245.245.26])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 09:39:48 -0700
Message-ID: <8f7de441-bd7e-44d9-8183-d688d14139f5@intel.com>
Date: Wed, 26 Jun 2024 17:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/xe: Convert multiple bind ops into single job
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240626003920.4060633-1-matthew.brost@intel.com>
 <20240626003920.4060633-5-matthew.brost@intel.com>
 <6dc343ad-bd46-4402-bd0a-00ed2b366e7c@intel.com>
 <Znw+Ar2ZBt+3SaQu@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <Znw+Ar2ZBt+3SaQu@DUT025-TGLU.fm.intel.com>
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

On 26/06/2024 17:12, Matthew Brost wrote:
> On Wed, Jun 26, 2024 at 03:03:41PM +0100, Matthew Auld wrote:
>> On 26/06/2024 01:39, Matthew Brost wrote:
>>> This aligns with the uAPI of an array of binds or single bind that
>>> results in multiple GPUVA ops to be considered a single atomic
>>> operations.
>>>
>>> The implemenation is roughly:
>>> - xe_vma_ops is a list of xe_vma_op (GPUVA op)
>>> - each xe_vma_op resolves to 0-3 PT ops
>>> - xe_vma_ops creates a single job
>>> - if at any point during binding a failure occurs, xe_vma_ops contains
>>>     the information necessary unwind the PT and VMA (GPUVA) state
>>>
>>> v2:
>>>    - add missing dma-resv slot reservation (CI, testing)
>>> v4:
>>>    - Fix TLB invalidation (Paulo)
>>>    - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
>>> v5:
>>>    - Invert i, j usage (Matthew Auld)
>>>    - Add helper to test and add job dep (Matthew Auld)
>>>    - Return on anything but -ETIME for cpu bind (Matthew Auld)
>>>    - Return -ENOBUFS if suballoc of BB fails due to size (Matthew Auld)
>>>    - s/do/Do (Matthew Auld)
>>>    - Add missing comma (Matthew Auld)
>>>    - Do not assign return value to xe_range_fence_insert (Matthew Auld)
>>>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_bo_types.h |    2 +
>>>    drivers/gpu/drm/xe/xe_migrate.c  |  306 ++++-----
>>>    drivers/gpu/drm/xe/xe_migrate.h  |   32 +-
>>>    drivers/gpu/drm/xe/xe_pt.c       | 1102 +++++++++++++++++++-----------
>>>    drivers/gpu/drm/xe/xe_pt.h       |   14 +-
>>>    drivers/gpu/drm/xe/xe_pt_types.h |   36 +
>>>    drivers/gpu/drm/xe/xe_vm.c       |  519 +++-----------
>>>    drivers/gpu/drm/xe/xe_vm.h       |    2 +
>>>    drivers/gpu/drm/xe/xe_vm_types.h |   45 +-
>>>    9 files changed, 1036 insertions(+), 1022 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>>> index 86422e113d39..02d68873558a 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>> @@ -58,6 +58,8 @@ struct xe_bo {
>>>    #endif
>>>    	/** @freed: List node for delayed put. */
>>>    	struct llist_node freed;
>>> +	/** @update_index: Update index if PT BO */
>>> +	int update_index;
>>>    	/** @created: Whether the bo has passed initial creation */
>>>    	bool created;
>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>> index af62783d34ac..160bfcd510ae 100644
>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> @@ -1125,6 +1125,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
>>>    }
>>>    static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>>> +			  const struct xe_vm_pgtable_update_op *pt_op,
>>>    			  const struct xe_vm_pgtable_update *update,
>>>    			  struct xe_migrate_pt_update *pt_update)
>>>    {
>>> @@ -1159,8 +1160,12 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
>>>    		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
>>>    		bb->cs[bb->len++] = lower_32_bits(addr);
>>>    		bb->cs[bb->len++] = upper_32_bits(addr);
>>> -		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
>>> -			      update);
>>> +		if (pt_op->bind)
>>> +			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
>>> +				      ofs, chunk, update);
>>> +		else
>>> +			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
>>> +				   ofs, chunk, update);
>>>    		bb->len += chunk * 2;
>>>    		ofs += chunk;
>>> @@ -1185,114 +1190,58 @@ struct migrate_test_params {
>>>    static struct dma_fence *
>>>    xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>>> -			       struct xe_vm *vm, struct xe_bo *bo,
>>> -			       const struct  xe_vm_pgtable_update *updates,
>>> -			       u32 num_updates, bool wait_vm,
>>>    			       struct xe_migrate_pt_update *pt_update)
>>>    {
>>>    	XE_TEST_DECLARE(struct migrate_test_params *test =
>>>    			to_migrate_test_params
>>>    			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
>>>    	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
>>> -	struct dma_fence *fence;
>>> +	struct xe_vm *vm = pt_update->vops->vm;
>>> +	struct xe_vm_pgtable_update_ops *pt_update_ops =
>>> +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
>>>    	int err;
>>> -	u32 i;
>>> +	u32 i, j;
>>>    	if (XE_TEST_ONLY(test && test->force_gpu))
>>>    		return ERR_PTR(-ETIME);
>>> -	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
>>> -					  DMA_RESV_USAGE_KERNEL))
>>> -		return ERR_PTR(-ETIME);
>>> -
>>> -	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
>>> -					       DMA_RESV_USAGE_BOOKKEEP))
>>> -		return ERR_PTR(-ETIME);
>>> -
>>>    	if (ops->pre_commit) {
>>>    		pt_update->job = NULL;
>>>    		err = ops->pre_commit(pt_update);
>>>    		if (err)
>>>    			return ERR_PTR(err);
>>>    	}
>>> -	for (i = 0; i < num_updates; i++) {
>>> -		const struct xe_vm_pgtable_update *update = &updates[i];
>>> -
>>> -		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
>>> -			      update->ofs, update->qwords, update);
>>> -	}
>>> -
>>> -	if (vm) {
>>> -		trace_xe_vm_cpu_bind(vm);
>>> -		xe_device_wmb(vm->xe);
>>> -	}
>>> -
>>> -	fence = dma_fence_get_stub();
>>> -
>>> -	return fence;
>>> -}
>>> -
>>> -static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
>>> -			struct xe_sync_entry *syncs, u32 num_syncs)
>>> -{
>>> -	struct dma_fence *fence;
>>> -	int i;
>>> -	for (i = 0; i < num_syncs; i++) {
>>> -		fence = syncs[i].fence;
>>> -
>>> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> -				       &fence->flags))
>>> -			return false;
>>> -	}
>>> -	if (q) {
>>> -		fence = xe_exec_queue_last_fence_get(q, vm);
>>> -		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
>>> -			dma_fence_put(fence);
>>> -			return false;
>>> +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
>>> +		const struct xe_vm_pgtable_update_op *pt_op =
>>> +			&pt_update_ops->ops[i];
>>> +
>>> +		for (j = 0; j < pt_op->num_entries; j++) {
>>> +			const struct xe_vm_pgtable_update *update =
>>> +				&pt_op->entries[j];
>>> +
>>> +			if (pt_op->bind)
>>> +				ops->populate(pt_update, m->tile,
>>> +					      &update->pt_bo->vmap, NULL,
>>> +					      update->ofs, update->qwords,
>>> +					      update);
>>> +			else
>>> +				ops->clear(pt_update, m->tile,
>>> +					   &update->pt_bo->vmap, NULL,
>>> +					   update->ofs, update->qwords, update);
>>>    		}
>>> -		dma_fence_put(fence);
>>>    	}
>>> -	return true;
>>> +	trace_xe_vm_cpu_bind(vm);
>>> +	xe_device_wmb(vm->xe);
>>> +
>>> +	return dma_fence_get_stub();
>>>    }
>>> -/**
>>> - * xe_migrate_update_pgtables() - Pipelined page-table update
>>> - * @m: The migrate context.
>>> - * @vm: The vm we'll be updating.
>>> - * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
>>> - * @q: The exec queue to be used for the update or NULL if the default
>>> - * migration engine is to be used.
>>> - * @updates: An array of update descriptors.
>>> - * @num_updates: Number of descriptors in @updates.
>>> - * @syncs: Array of xe_sync_entry to await before updating. Note that waits
>>> - * will block the engine timeline.
>>> - * @num_syncs: Number of entries in @syncs.
>>> - * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
>>> - * pointers to callback functions and, if subclassed, private arguments to
>>> - * those.
>>> - *
>>> - * Perform a pipelined page-table update. The update descriptors are typically
>>> - * built under the same lock critical section as a call to this function. If
>>> - * using the default engine for the updates, they will be performed in the
>>> - * order they grab the job_mutex. If different engines are used, external
>>> - * synchronization is needed for overlapping updates to maintain page-table
>>> - * consistency. Note that the meaing of "overlapping" is that the updates
>>> - * touch the same page-table, which might be a higher-level page-directory.
>>> - * If no pipelining is needed, then updates may be performed by the cpu.
>>> - *
>>> - * Return: A dma_fence that, when signaled, indicates the update completion.
>>> - */
>>> -struct dma_fence *
>>> -xe_migrate_update_pgtables(struct xe_migrate *m,
>>> -			   struct xe_vm *vm,
>>> -			   struct xe_bo *bo,
>>> -			   struct xe_exec_queue *q,
>>> -			   const struct xe_vm_pgtable_update *updates,
>>> -			   u32 num_updates,
>>> -			   struct xe_sync_entry *syncs, u32 num_syncs,
>>> -			   struct xe_migrate_pt_update *pt_update)
>>> +static struct dma_fence *
>>> +__xe_migrate_update_pgtables(struct xe_migrate *m,
>>> +			     struct xe_migrate_pt_update *pt_update,
>>> +			     struct xe_vm_pgtable_update_ops *pt_update_ops)
>>>    {
>>>    	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
>>>    	struct xe_tile *tile = m->tile;
>>> @@ -1301,59 +1250,53 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>>>    	struct xe_sched_job *job;
>>>    	struct dma_fence *fence;
>>>    	struct drm_suballoc *sa_bo = NULL;
>>> -	struct xe_vma *vma = pt_update->vma;
>>>    	struct xe_bb *bb;
>>> -	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
>>> +	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
>>> +	u32 num_updates = 0, current_update = 0;
>>>    	u64 addr;
>>>    	int err = 0;
>>> -	bool usm = !q && xe->info.has_usm;
>>> -	bool first_munmap_rebind = vma &&
>>> -		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
>>> -	struct xe_exec_queue *q_override = !q ? m->q : q;
>>> -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>>> +	bool is_migrate = pt_update_ops->q == m->q;
>>> +	bool usm = is_migrate && xe->info.has_usm;
>>> +
>>> +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
>>> +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
>>> +		struct xe_vm_pgtable_update *updates = pt_op->entries;
>>> -	/* Use the CPU if no in syncs and engine is idle */
>>> -	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
>>> -		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
>>> -							num_updates,
>>> -							first_munmap_rebind,
>>> -							pt_update);
>>> -		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
>>> -			return fence;
>>> +		num_updates += pt_op->num_entries;
>>> +		for (j = 0; j < pt_op->num_entries; ++j) {
>>> +			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
>>
>> Why 0x1ff here? Should it not be MAX_PTE_PER_SDI? There is a failure in CI
>> here: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v5/shard-lnl-8/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
>>
> 
> Yes it should be MAX_PTE_PER_SDI, copy paste error or perhaps this code
> changed since my patch was originally authored. Will fix.
> 
>> Wondering if this is the cause? i.e we think we can fit more stores per
>> MI_STORE_DATA_IMM, since write_pgtable() below is using MAX_PTE_PER_SDI and
>> not 0x1ff?
> 
> Hmm, unsure. Will have to dig in on HW. The math to calculate batch_size
> could be wrong somewhere else too.
> 
>>
>>> +
>>> +			/* align noop + MI_STORE_DATA_IMM cmd prefix */
>>> +			batch_size += 4 * num_cmds + updates[j].qwords * 2;
>>> +		}
>>>    	}
>>>    	/* fixed + PTE entries */
>>>    	if (IS_DGFX(xe))
>>> -		batch_size = 2;
>>> +		batch_size += 2;
>>>    	else
>>> -		batch_size = 6 + num_updates * 2;
>>> -
>>> -	for (i = 0; i < num_updates; i++) {
>>> -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
>>> +		batch_size += 6 + num_updates * 2;
>>> -		/* align noop + MI_STORE_DATA_IMM cmd prefix */
>>> -		batch_size += 4 * num_cmds + updates[i].qwords * 2;
>>> -	}
>>> -
>>> -	/*
>>> -	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
>>> -	 *
>>> -	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
>>> -	 * Should be reasonably bound..
>>> -	 */
>>> -	xe_tile_assert(tile, batch_size < SZ_128K);
>>> +	bb = xe_bb_new(gt, batch_size, usm);
>>
>> So do we now validate that batch_size fits within the total pool size
>> somewhere, to avoid triggering the warning in drm_suballoc_new? Did your igt
>> not trigger the warning? Also the below check is not too late?
>>
> 
> I think the idea with xe_tile_assert is we should not expose asserts
> which user space can trigger. e.g. When I run [1] we shouldn't see
> asserts pop.
> 
> The below IGT passed so I think letting xe_bb_new fail and converting to
> -ENOBUFS is correct.

There was no warning when running it? drm_suballoc_new() treats that as 
a programmer error and throws a full blown warning when returning 
EINVAL. Unless I'm missing something here, we have to do the check before.

> 
> [1] https://patchwork.freedesktop.org/series/135143/
>   
>>> +	if (IS_ERR(bb)) {
>>> +		/*
>>> +		 * BB to large, return -ENOBUFS indicating user should split
>>> +		 * array of binds into smaller chunks.
>>> +		 */
>>> +		if (PTR_ERR(bb) == -EINVAL)
>>> +			return ERR_PTR(-ENOBUFS);
>>> -	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
>>> -	if (IS_ERR(bb))
>>>    		return ERR_CAST(bb);
>>> +	}
>>>    	/* For sysmem PTE's, need to map them in our hole.. */
>>>    	if (!IS_DGFX(xe)) {
>>>    		ppgtt_ofs = NUM_KERNEL_PDE - 1;
>>> -		if (q) {
>>> -			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
>>> +		if (!is_migrate) {
>>> +			u32 num_units = DIV_ROUND_UP(num_updates,
>>> +						     NUM_VMUSA_WRITES_PER_UNIT);
>>> -			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
>>> +			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
>>>    						 GFP_KERNEL, true, 0);
>>
>> And maybe here also?
>>
> 
> Hmm, I think here we should also convert IS_ERR(sa_bo) to -ENOBUFS. Will
> fix.
> 
>>>    			if (IS_ERR(sa_bo)) {
>>>    				err = PTR_ERR(sa_bo);
>>> @@ -1373,14 +1316,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>>>    		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
>>>    		bb->cs[bb->len++] = 0; /* upper_32_bits */
>>
>> Off camera this is doing:
>>
>> b->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
>>
>> What are certain that num_updates still can be done with single command
>> here?  Do we not need to break it up like we do with write_pgtable? If it's
> 
> The IGT assert from the CI failure will pop if we overun the allocated
> batch buffer. So I think we are good on our commands fitting.

Ok, sounds good.

> 
> We could potentially break this but kinda goes against the idea a single
> job per IOCTL. Also I don't really want to overengineer this when we
> have a planned UMD fallback path via returning -ENOBUFS and eventually
> want to move to CPU binds and this entire problem just goes away.
> 
> Matt
> 
>> not an issue I think would be good to add an assert to ensure it fits?
>>
>> <snip>
