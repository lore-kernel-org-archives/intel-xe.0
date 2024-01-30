Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8387C47DA9
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C9410F8CC;
	Tue, 30 Jan 2024 17:51:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ADB10F8CC
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706637090; x=1738173090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Z/nfUCDAidZZUu5DHY6ijzuBV5JQ/w1DVxwf/9negAM=;
 b=gfm1QWsUFdI4iBnxFh9/zE8ReLMfb0FF0EzEhzVKgBUzWtI2zZCyVzh1
 NikEmR1ofhtflcO5CNhkCWj4yt0LwfJixXM8v36biEsfTiGd1+49+/cOl
 Xzzldd9FltKcU2drpx2uwHdpAdhyLwH+zc47uUdsUISr3su9OSalkV980
 whR/oaHQgnDFK1+u1N6wfkUKlchBPw4Y1qwMGPN0mZP6/iXq/m6+dlqrc
 pFSYazebL5+v14G/toSj28fZ8ufQ9bEr7KhMjXWVgq9U9PXR0aTEhy7rD
 Zva9d5DT2rdh6ygcPjsNUDsLCWxWZfcop1OO5B20chA5S1xU8CqKC9C2v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10000564"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="10000564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:51:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3800094"
Received: from skofoed-mobl.ger.corp.intel.com (HELO [10.249.254.21])
 ([10.249.254.21])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 09:51:24 -0800
Message-ID: <5371fdb7-5c6d-4b29-93aa-90c031f776e0@linux.intel.com>
Date: Tue, 30 Jan 2024 18:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/vm: Subclass userptr vmas
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20240130170207.5219-1-thomas.hellstrom@linux.intel.com>
 <ZbkyFRIpbkjzWn1p@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <ZbkyFRIpbkjzWn1p@DUT025-TGLU.fm.intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 1/30/24 18:29, Matthew Brost wrote:
> On Tue, Jan 30, 2024 at 06:02:07PM +0100, Thomas Hellström wrote:
>> The construct allocating only parts of the vma structure when
>> the userptr part is not needed is very fragile. A developer could
>> add additional fields below the userptr part, and the code could
>> easily attempt to access the userptr part even if its not persent.
> I think we do something similar xe_sched_job wrt to the batch_addr
> field. We might want to clean that up too.
OK, yes we might want to try to get that in in the rc series, we got 
some comments from Linus and others on this, (see the xe chat for pointers).
>> So introduce xe_userptr_vma which subclasses struct xe_vma the
>> proper way, and accordingly modify a couple of interfaces.
>> This should also help if adding userptr helpers to drm_gpuvm.
>>
> Patch itself makes sense to me, good cleanup. One nit below.

Thanks, I'll fix that and the checkpatch.pl check, and add some links in 
the commit message.

/Thomas


>
>> Fixes: a4cc60a55fd9 ("drm/xe: Only alloc userptr part of xe_vma for userptrs")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  11 ++-
>>   drivers/gpu/drm/xe/xe_pt.c           |  32 ++++----
>>   drivers/gpu/drm/xe/xe_vm.c           | 114 ++++++++++++++-------------
>>   drivers/gpu/drm/xe/xe_vm.h           |  16 +++-
>>   drivers/gpu/drm/xe/xe_vm_types.h     |  16 ++--
>>   5 files changed, 108 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index 7ce67c9d30a7..78970259cea9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -165,7 +165,8 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   		goto unlock_vm;
>>   	}
>>   
>> -	if (!xe_vma_is_userptr(vma) || !xe_vma_userptr_check_repin(vma)) {
>> +	if (!xe_vma_is_userptr(vma) ||
>> +	    !xe_vma_userptr_check_repin(to_userptr_vma(vma))) {
>>   		downgrade_write(&vm->lock);
>>   		write_locked = false;
>>   	}
>> @@ -181,11 +182,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   	/* TODO: Validate fault */
>>   
>>   	if (xe_vma_is_userptr(vma) && write_locked) {
>> +		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
>> +
>>   		spin_lock(&vm->userptr.invalidated_lock);
>> -		list_del_init(&vma->userptr.invalidate_link);
>> +		list_del_init(&uvma->userptr.invalidate_link);
>>   		spin_unlock(&vm->userptr.invalidated_lock);
>>   
>> -		ret = xe_vma_userptr_pin_pages(vma);
>> +		ret = xe_vma_userptr_pin_pages(uvma);
>>   		if (ret)
>>   			goto unlock_vm;
>>   
>> @@ -220,7 +223,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>>   	dma_fence_put(fence);
>>   
>>   	if (xe_vma_is_userptr(vma))
>> -		ret = xe_vma_userptr_check_repin(vma);
>> +		ret = xe_vma_userptr_check_repin(to_userptr_vma(vma));
>>   	vma->usm.tile_invalidated &= ~BIT(tile->id);
>>   
>>   unlock_dma_resv:
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index de1030a47588..e45b37c3f0c2 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -618,8 +618,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   
>>   	if (!xe_vma_is_null(vma)) {
>>   		if (xe_vma_is_userptr(vma))
>> -			xe_res_first_sg(vma->userptr.sg, 0, xe_vma_size(vma),
>> -					&curs);
>> +			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
>> +					xe_vma_size(vma), &curs);
>>   		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
>>   			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
>>   				     xe_vma_size(vma), &curs);
>> @@ -906,17 +906,17 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
>>   
>>   #ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
>>   
>> -static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>> +static int xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
>>   {
>> -	u32 divisor = vma->userptr.divisor ? vma->userptr.divisor : 2;
>> +	u32 divisor = uvma->userptr.divisor ? uvma->userptr.divisor : 2;
>>   	static u32 count;
>>   
>>   	if (count++ % divisor == divisor - 1) {
>> -		struct xe_vm *vm = xe_vma_vm(vma);
>> +		struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>>   
>> -		vma->userptr.divisor = divisor << 1;
>> +		uvma->userptr.divisor = divisor << 1;
>>   		spin_lock(&vm->userptr.invalidated_lock);
>> -		list_move_tail(&vma->userptr.invalidate_link,
>> +		list_move_tail(&uvma->userptr.invalidate_link,
>>   			       &vm->userptr.invalidated);
>>   		spin_unlock(&vm->userptr.invalidated_lock);
>>   		return true;
>> @@ -927,7 +927,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>>   
>>   #else
>>   
>> -static bool xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>> +static bool xe_pt_userptr_inject_eagain(struct xe_userptr_vma *uvma)
>>   {
>>   	return false;
>>   }
>> @@ -1000,9 +1000,9 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   {
>>   	struct xe_pt_migrate_pt_update *userptr_update =
>>   		container_of(pt_update, typeof(*userptr_update), base);
>> -	struct xe_vma *vma = pt_update->vma;
>> -	unsigned long notifier_seq = vma->userptr.notifier_seq;
>> -	struct xe_vm *vm = xe_vma_vm(vma);
>> +	struct xe_userptr_vma *uvma = to_userptr_vma(pt_update->vma);
>> +	unsigned long notifier_seq = uvma->userptr.notifier_seq;
>> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
>>   	int err = xe_pt_vm_dependencies(pt_update->job,
>>   					&vm->rftree[pt_update->tile_id],
>>   					pt_update->start,
>> @@ -1023,7 +1023,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	 */
>>   	do {
>>   		down_read(&vm->userptr.notifier_lock);
>> -		if (!mmu_interval_read_retry(&vma->userptr.notifier,
>> +		if (!mmu_interval_read_retry(&uvma->userptr.notifier,
>>   					     notifier_seq))
>>   			break;
>>   
>> @@ -1032,11 +1032,11 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   		if (userptr_update->bind)
>>   			return -EAGAIN;
>>   
>> -		notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
>> +		notifier_seq = mmu_interval_read_begin(&uvma->userptr.notifier);
>>   	} while (true);
>>   
>>   	/* Inject errors to test_whether they are handled correctly */
>> -	if (userptr_update->bind && xe_pt_userptr_inject_eagain(vma)) {
>> +	if (userptr_update->bind && xe_pt_userptr_inject_eagain(uvma)) {
>>   		up_read(&vm->userptr.notifier_lock);
>>   		return -EAGAIN;
>>   	}
>> @@ -1297,7 +1297,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queue
>>   		vma->tile_present |= BIT(tile->id);
>>   
>>   		if (bind_pt_update.locked) {
>> -			vma->userptr.initial_bind = true;
>> +			to_userptr_vma(vma)->userptr.initial_bind = true;
>>   			up_read(&vm->userptr.notifier_lock);
>>   			xe_bo_put_commit(&deferred);
>>   		}
>> @@ -1642,7 +1642,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_exec_queu
>>   
>>   		if (!vma->tile_present) {
>>   			spin_lock(&vm->userptr.invalidated_lock);
>> -			list_del_init(&vma->userptr.invalidate_link);
>> +			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
>>   			spin_unlock(&vm->userptr.invalidated_lock);
>>   		}
>>   		up_read(&vm->userptr.notifier_lock);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index d096a8c00bd4..66593d841fa9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -46,7 +46,7 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>   
>>   /**
>>    * xe_vma_userptr_check_repin() - Advisory check for repin needed
>> - * @vma: The userptr vma
>> + * @uvma: The userptr vma
>>    *
>>    * Check if the userptr vma has been invalidated since last successful
>>    * repin. The check is advisory only and can the function can be called
>> @@ -56,15 +56,17 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>    *
>>    * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
>>    */
>> -int xe_vma_userptr_check_repin(struct xe_vma *vma)
>> +int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
>>   {
>> -	return mmu_interval_check_retry(&vma->userptr.notifier,
>> -					vma->userptr.notifier_seq) ?
>> +	return mmu_interval_check_retry(&uvma->userptr.notifier,
>> +					uvma->userptr.notifier_seq) ?
>>   		-EAGAIN : 0;
>>   }
>>   
>> -int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>> +int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
>>   {
>> +	struct xe_userptr *userptr = &uvma->userptr;
>> +	struct xe_vma *vma = &uvma->vma;
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>>   	struct xe_device *xe = vm->xe;
>>   	const unsigned long num_pages = xe_vma_size(vma) >> PAGE_SHIFT;
>> @@ -80,30 +82,30 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>   	if (vma->gpuva.flags & XE_VMA_DESTROYED)
>>   		return 0;
>>   
>> -	notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
>> -	if (notifier_seq == vma->userptr.notifier_seq)
>> +	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
>> +	if (notifier_seq == userptr->notifier_seq)
>>   		return 0;
>>   
>>   	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
>>   	if (!pages)
>>   		return -ENOMEM;
>>   
>> -	if (vma->userptr.sg) {
>> +	if (userptr->sg) {
>>   		dma_unmap_sgtable(xe->drm.dev,
>> -				  vma->userptr.sg,
>> +				  userptr->sg,
>>   				  read_only ? DMA_TO_DEVICE :
>>   				  DMA_BIDIRECTIONAL, 0);
>> -		sg_free_table(vma->userptr.sg);
>> -		vma->userptr.sg = NULL;
>> +		sg_free_table(userptr->sg);
>> +		userptr->sg = NULL;
>>   	}
>>   
>>   	pinned = ret = 0;
>>   	if (in_kthread) {
>> -		if (!mmget_not_zero(vma->userptr.notifier.mm)) {
>> +		if (!mmget_not_zero(userptr->notifier.mm)) {
>>   			ret = -EFAULT;
>>   			goto mm_closed;
>>   		}
>> -		kthread_use_mm(vma->userptr.notifier.mm);
>> +		kthread_use_mm(userptr->notifier.mm);
>>   	}
>>   
>>   	while (pinned < num_pages) {
>> @@ -123,32 +125,32 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>   	}
>>   
>>   	if (in_kthread) {
>> -		kthread_unuse_mm(vma->userptr.notifier.mm);
>> -		mmput(vma->userptr.notifier.mm);
>> +		kthread_unuse_mm(userptr->notifier.mm);
>> +		mmput(userptr->notifier.mm);
>>   	}
>>   mm_closed:
>>   	if (ret)
>>   		goto out;
>>   
>> -	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
>> +	ret = sg_alloc_table_from_pages_segment(&userptr->sgt, pages,
>>   						pinned, 0,
>>   						(u64)pinned << PAGE_SHIFT,
>>   						xe_sg_segment_size(xe->drm.dev),
>>   						GFP_KERNEL);
>>   	if (ret) {
>> -		vma->userptr.sg = NULL;
>> +		userptr->sg = NULL;
>>   		goto out;
>>   	}
>> -	vma->userptr.sg = &vma->userptr.sgt;
>> +	userptr->sg = &userptr->sgt;
>>   
>> -	ret = dma_map_sgtable(xe->drm.dev, vma->userptr.sg,
>> +	ret = dma_map_sgtable(xe->drm.dev, userptr->sg,
>>   			      read_only ? DMA_TO_DEVICE :
>>   			      DMA_BIDIRECTIONAL,
>>   			      DMA_ATTR_SKIP_CPU_SYNC |
>>   			      DMA_ATTR_NO_KERNEL_MAPPING);
>>   	if (ret) {
>> -		sg_free_table(vma->userptr.sg);
>> -		vma->userptr.sg = NULL;
>> +		sg_free_table(userptr->sg);
>> +		userptr->sg = NULL;
>>   		goto out;
>>   	}
>>   
>> @@ -167,8 +169,8 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>   	kvfree(pages);
>>   
>>   	if (!(ret < 0)) {
>> -		vma->userptr.notifier_seq = notifier_seq;
>> -		if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
>> +		userptr->notifier_seq = notifier_seq;
>> +		if (xe_vma_userptr_check_repin(uvma) == -EAGAIN)
>>   			goto retry;
>>   	}
>>   
>> @@ -635,7 +637,9 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>>   				   const struct mmu_notifier_range *range,
>>   				   unsigned long cur_seq)
>>   {
>> -	struct xe_vma *vma = container_of(mni, struct xe_vma, userptr.notifier);
>> +	struct xe_userptr *userptr = container_of(mni, typeof(*userptr), notifier);
>> +	struct xe_userptr_vma *uvma = container_of(userptr, typeof(*uvma), userptr);
>> +	struct xe_vma *vma = &uvma->vma;
>>   	struct xe_vm *vm = xe_vma_vm(vma);
>>   	struct dma_resv_iter cursor;
>>   	struct dma_fence *fence;
>> @@ -651,7 +655,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>>   	mmu_interval_set_seq(mni, cur_seq);
>>   
>>   	/* No need to stop gpu access if the userptr is not yet bound. */
>> -	if (!vma->userptr.initial_bind) {
>> +	if (!userptr->initial_bind) {
>>   		up_write(&vm->userptr.notifier_lock);
>>   		return true;
>>   	}
>> @@ -663,7 +667,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>>   	if (!xe_vm_in_fault_mode(vm) &&
>>   	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->tile_present) {
>>   		spin_lock(&vm->userptr.invalidated_lock);
>> -		list_move_tail(&vma->userptr.invalidate_link,
>> +		list_move_tail(&userptr->invalidate_link,
>>   			       &vm->userptr.invalidated);
>>   		spin_unlock(&vm->userptr.invalidated_lock);
>>   	}
>> @@ -703,7 +707,7 @@ static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
>>   
>>   int xe_vm_userptr_pin(struct xe_vm *vm)
>>   {
>> -	struct xe_vma *vma, *next;
>> +	struct xe_userptr_vma *uvma, *next;
>>   	int err = 0;
>>   	LIST_HEAD(tmp_evict);
>>   
>> @@ -711,22 +715,23 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>>   
>>   	/* Collect invalidated userptrs */
>>   	spin_lock(&vm->userptr.invalidated_lock);
>> -	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
>> +	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
>>   				 userptr.invalidate_link) {
>> -		list_del_init(&vma->userptr.invalidate_link);
>> -		list_move_tail(&vma->combined_links.userptr,
>> +		list_del_init(&uvma->userptr.invalidate_link);
>> +		list_move_tail(&uvma->userptr.repin_link,
>>   			       &vm->userptr.repin_list);
>>   	}
>>   	spin_unlock(&vm->userptr.invalidated_lock);
>>   
>>   	/* Pin and move to temporary list */
>> -	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
>> -				 combined_links.userptr) {
>> -		err = xe_vma_userptr_pin_pages(vma);
>> +	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
>> +				 userptr.repin_link) {
>> +		err = xe_vma_userptr_pin_pages(uvma);
>>   		if (err < 0)
>>   			return err;
>>   
>> -		list_move_tail(&vma->combined_links.userptr, &vm->rebind_list);
>> +		list_del_init(&uvma->userptr.repin_link);
>> +		list_move_tail(&uvma->vma.combined_links.rebind, &vm->rebind_list);
>>   	}
>>   
>>   	return 0;
>> @@ -801,10 +806,9 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   	xe_assert(vm->xe, end < vm->size);
>>   
>>   	if (!bo && !is_null)	/* userptr */
>> -		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>> +		vma = kzalloc(sizeof(struct xe_userptr_vma), GFP_KERNEL);
>>   	else
>> -		vma = kzalloc(sizeof(*vma) - sizeof(struct xe_userptr),
>> -			      GFP_KERNEL);
>> +		vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>>   	if (!vma) {
>>   		vma = ERR_PTR(-ENOMEM);
>>   		return vma;
>> @@ -848,13 +852,15 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   		drm_gpuvm_bo_put(vm_bo);
>>   	} else /* userptr or null */ {
>>   		if (!is_null) {
>> +			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
>>   			u64 size = end - start + 1;
>>   			int err;
>>   
>> -			INIT_LIST_HEAD(&vma->userptr.invalidate_link);
>> +			INIT_LIST_HEAD(&userptr->invalidate_link);
>> +			INIT_LIST_HEAD(&userptr->repin_link);
>>   			vma->gpuva.gem.offset = bo_offset_or_userptr;
>>   
>> -			err = mmu_interval_notifier_insert(&vma->userptr.notifier,
>> +			err = mmu_interval_notifier_insert(&userptr->notifier,
>>   							   current->mm,
>>   							   xe_vma_userptr(vma), size,
>>   							   &vma_userptr_notifier_ops);
>> @@ -864,7 +870,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>>   				return vma;
>>   			}
>>   
>> -			vma->userptr.notifier_seq = LONG_MAX;
>> +			userptr->notifier_seq = LONG_MAX;
>>   		}
>>   
>>   		xe_vm_get(vm);
>> @@ -880,13 +886,15 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>   	bool read_only = xe_vma_read_only(vma);
>>   
>>   	if (xe_vma_is_userptr(vma)) {
>> -		if (vma->userptr.sg) {
>> +		struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
>> +
>> +		if (userptr->sg) {
>>   			dma_unmap_sgtable(xe->drm.dev,
>> -					  vma->userptr.sg,
>> +					  userptr->sg,
>>   					  read_only ? DMA_TO_DEVICE :
>>   					  DMA_BIDIRECTIONAL, 0);
>> -			sg_free_table(vma->userptr.sg);
>> -			vma->userptr.sg = NULL;
>> +			sg_free_table(userptr->sg);
>> +			userptr->sg = NULL;
>>   		}
>>   
>>   		/*
>> @@ -894,7 +902,7 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
>>   		 * the notifer until we're sure the GPU is not accessing
>>   		 * them anymore
>>   		 */
>> -		mmu_interval_notifier_remove(&vma->userptr.notifier);
>> +		mmu_interval_notifier_remove(&userptr->notifier);
>>   		xe_vm_put(vm);
>>   	} else if (xe_vma_is_null(vma)) {
>>   		xe_vm_put(vm);
>> @@ -933,7 +941,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>>   		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
>>   
>>   		spin_lock(&vm->userptr.invalidated_lock);
>> -		list_del(&vma->userptr.invalidate_link);
>> +		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
>>   		spin_unlock(&vm->userptr.invalidated_lock);
>>   	} else if (!xe_vma_is_null(vma)) {
>>   		xe_bo_assert_held(xe_vma_bo(vma));
>> @@ -2150,7 +2158,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>>   		drm_exec_fini(&exec);
>>   
>>   	if (xe_vma_is_userptr(vma)) {
>> -		err = xe_vma_userptr_pin_pages(vma);
>> +		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>>   		if (err) {
>>   			prep_vma_destroy(vm, vma, false);
>>   			xe_vma_destroy_unlocked(vma);
>> @@ -2507,7 +2515,7 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>>   
>>   	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
>>   		lockdep_assert_held_write(&vm->lock);
>> -		err = xe_vma_userptr_pin_pages(vma);
>> +		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>>   		if (!err)
>>   			goto retry_userptr;
>>   
>> @@ -3130,8 +3138,8 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>>   	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
>>   		if (xe_vma_is_userptr(vma)) {
>>   			WARN_ON_ONCE(!mmu_interval_check_retry
>> -				     (&vma->userptr.notifier,
>> -				      vma->userptr.notifier_seq));
>> +				     (&to_userptr_vma(vma)->userptr.notifier,
>> +				      to_userptr_vma(vma)->userptr.notifier_seq));
>>   			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(xe_vma_vm(vma)),
>>   							     DMA_RESV_USAGE_BOOKKEEP));
>>   
>> @@ -3192,11 +3200,11 @@ int xe_analyze_vm(struct drm_printer *p, struct xe_vm *vm, int gt_id)
>>   		if (is_null) {
>>   			addr = 0;
>>   		} else if (is_userptr) {
>> +			struct sg_table *sg = to_userptr_vma(vma)->userptr.sg;
>>   			struct xe_res_cursor cur;
>>   
>> -			if (vma->userptr.sg) {
>> -				xe_res_first_sg(vma->userptr.sg, 0, XE_PAGE_SIZE,
>> -						&cur);
>> +			if (sg) {
>> +				xe_res_first_sg(sg, 0, XE_PAGE_SIZE, &cur);
>>   				addr = xe_res_dma(&cur);
>>   			} else {
>>   				addr = 0;
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index e9c907cbcd89..c1884f974a72 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -160,6 +160,18 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
>>   }
>>   
>> +/**
>> + * xe_userptr_vma() - Return a pointer to an embedding userptr vma
> s/xe_userptr_vma/to_userptr_vma
>
> Other than this, LGTM. With that:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>
>> + * @vma: Pointer to the embedded struct xe_vma
>> + *
>> + * Return: Pointer to the embedding userptr vma
>> + */
>> +static inline struct xe_userptr_vma *to_userptr_vma(struct xe_vma *vma)
>> +{
>> +	xe_assert(xe_vma_vm(vma)->xe, xe_vma_is_userptr(vma));
>> +	return container_of(vma, struct xe_userptr_vma, vma);
>> +}
>> +
>>   u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
>>   
>>   int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>> @@ -222,9 +234,9 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>>   	}
>>   }
>>   
>> -int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>> +int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
>>   
>> -int xe_vma_userptr_check_repin(struct xe_vma *vma);
>> +int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>>   
>>   bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index 63e8a50b88e9..1fec66ae2eb2 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -37,6 +37,8 @@ struct xe_vm;
>>   struct xe_userptr {
>>   	/** @invalidate_link: Link for the vm::userptr.invalidated list */
>>   	struct list_head invalidate_link;
>> +	/** @userptr: link into VM repin list if userptr. */
>> +	struct list_head repin_link;
>>   	/**
>>   	 * @notifier: MMU notifier for user pointer (invalidation call back)
>>   	 */
>> @@ -68,8 +70,6 @@ struct xe_vma {
>>   	 * resv.
>>   	 */
>>   	union {
>> -		/** @userptr: link into VM repin list if userptr. */
>> -		struct list_head userptr;
>>   		/** @rebind: link into VM if this VMA needs rebinding. */
>>   		struct list_head rebind;
>>   		/** @destroy: link to contested list when VM is being closed. */
>> @@ -105,11 +105,15 @@ struct xe_vma {
>>   	 * @pat_index: The pat index to use when encoding the PTEs for this vma.
>>   	 */
>>   	u16 pat_index;
>> +};
>>   
>> -	/**
>> -	 * @userptr: user pointer state, only allocated for VMAs that are
>> -	 * user pointers
>> -	 */
>> +/**
>> + * struct xe_userptr_vma - A userptr vma subclass
>> + * @vma: The vma.
>> + * @userptr: Additional userptr information.
>> + */
>> +struct xe_userptr_vma {
>> +	struct xe_vma vma;
>>   	struct xe_userptr userptr;
>>   };
>>   
>> -- 
>> 2.43.0
>>
