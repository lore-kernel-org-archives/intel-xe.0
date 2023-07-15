Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C045C001DE
	for <intel-xe@archiver.kernel.org>; Sat, 15 Jul 2023 13:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0816510E124;
	Sat, 15 Jul 2023 13:12:06 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F314E10E124
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Jul 2023 13:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689426724; x=1720962724;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=c85GtcnFNBb6eKeImZtoSlKRSAmN7+vN8DiivAHUXPI=;
 b=IKE1YKI80e1B3OT5Dz8AevginDTlInUBVAEPwKoMtC3GMw6f5adCrIe4
 glTL/S7Hx7cWlHQvPkewXUbf1JR9yEO9+o3q+ELJbduSRZ7442Wci/vqT
 UA/2+DPWkWOQ7rKQ1BgP0nI97dEBzOurwbnfBEpp749VjV/QIwksnPTb8
 MewyFILv8ZW/5r6zfnGRCejD7KR1KDRBfajUYkBan1ySuJYTQARyhU/fx
 wquNH1Po3t23lnFYJnhPUa3jSfb/QimXkVSHl+Zg4yOceEKXYA1mTZ01r
 1QMpvxqI4DjH76kQixMS6MLkcW9wa2k53riRTHIbqFEHFTddZ7KX4cA/P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365699574"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; d="scan'208";a="365699574"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2023 06:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="699990307"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; d="scan'208";a="699990307"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.142])
 ([10.249.254.142])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2023 06:12:01 -0700
Message-ID: <1ebf9a3b-fcfc-e30f-eec5-e9c87c5be761@linux.intel.com>
Date: Sat, 15 Jul 2023 15:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230711212748.2029455-1-matthew.brost@intel.com>
 <20230711212748.2029455-3-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230711212748.2029455-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Reduce the number list links in
 xe_vma
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

Hi, Matthew,

On 7/11/23 23:27, Matthew Brost wrote:
> Combine the userptr, rebind, and destroy links into a union as
> the lists these links belong to are mutually exclusive.
>
> v2: Adjust which lists are combined (Thomas H)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c       |  6 +++--
>   drivers/gpu/drm/xe/xe_exec.c     |  2 +-
>   drivers/gpu/drm/xe/xe_pt.c       |  2 +-
>   drivers/gpu/drm/xe/xe_vm.c       | 45 ++++++++++++++++----------------
>   drivers/gpu/drm/xe/xe_vm_types.h | 28 +++++++++-----------
>   5 files changed, 41 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6353afa8d846..ca7f74ecb753 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -474,8 +474,10 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   			}
>   
>   			xe_vm_assert_held(vm);
> -			if (list_empty(&vma->rebind_link) && vma->tile_present)
> -				list_add_tail(&vma->rebind_link, &vm->rebind_list);
> +			if (list_empty(&vma->combined_links.rebind) &&
> +			    vma->tile_present)
> +				list_add_tail(&vma->combined_links.rebind,
> +					      &vm->rebind_list);
>   
>   			if (vm_resv_locked)
>   				dma_resv_unlock(&vm->resv);
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index ba13d20ed348..bc5bd4bdc582 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -120,7 +120,7 @@ static int xe_exec_begin(struct xe_engine *e, struct ww_acquire_ctx *ww,
>   	 * BOs have valid placements possibly moving an evicted BO back
>   	 * to a location where the GPU can access it).
>   	 */
> -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
>   		XE_WARN_ON(xe_vma_is_null(vma));
>   
>   		if (xe_vma_is_userptr(vma))
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index a8d96cbd53e3..3b43b32f4a33 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1690,7 +1690,7 @@ __xe_pt_unbind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e
>   	}
>   
>   	if (!vma->tile_present)
> -		list_del_init(&vma->rebind_link);
> +		list_del_init(&vma->combined_links.rebind);
>   
>   	if (unbind_pt_update.locked) {
>   		XE_WARN_ON(!xe_vma_is_userptr(vma));
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5f4f6dab270a..b2847be6de6a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -467,7 +467,8 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct ww_acquire_ctx *ww,
>   
>   		list_del_init(&vma->notifier.rebind_link);
>   		if (vma->tile_present && !(vma->gpuva.flags & XE_VMA_DESTROYED))
> -			list_move_tail(&vma->rebind_link, &vm->rebind_list);
> +			list_move_tail(&vma->combined_links.rebind,
> +				       &vm->rebind_list);
>   	}
>   	spin_unlock(&vm->notifier.list_lock);
>   
> @@ -608,7 +609,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   	if (err)
>   		goto out_unlock;
>   
> -	list_for_each_entry(vma, &vm->rebind_list, rebind_link) {
> +	list_for_each_entry(vma, &vm->rebind_list, combined_links.rebind) {
>   		if (xe_vma_has_no_bo(vma) ||
>   		    vma->gpuva.flags & XE_VMA_DESTROYED)
>   			continue;
> @@ -780,17 +781,20 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>   	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
>   				 userptr.invalidate_link) {
>   		list_del_init(&vma->userptr.invalidate_link);
> -		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
> +		if (list_empty(&vma->combined_links.userptr))
> +			list_move_tail(&vma->combined_links.userptr,
> +				       &vm->userptr.repin_list);
>   	}
>   	spin_unlock(&vm->userptr.invalidated_lock);
>   
>   	/* Pin and move to temporary list */
> -	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list, userptr_link) {
> +	list_for_each_entry_safe(vma, next, &vm->userptr.repin_list,
> +				 combined_links.userptr) {
>   		err = xe_vma_userptr_pin_pages(vma);
>   		if (err < 0)
>   			goto out_err;
>   
> -		list_move_tail(&vma->userptr_link, &tmp_evict);
> +		list_move_tail(&vma->combined_links.userptr, &tmp_evict);
>   	}
>   
>   	/* Take lock and move to rebind_list for rebinding. */
> @@ -798,10 +802,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>   	if (err)
>   		goto out_err;
>   
> -	list_for_each_entry_safe(vma, next, &tmp_evict, userptr_link) {
> -		list_del_init(&vma->userptr_link);
> -		list_move_tail(&vma->rebind_link, &vm->rebind_list);
> -	}
> +	list_for_each_entry_safe(vma, next, &tmp_evict, combined_links.userptr)
> +		list_move_tail(&vma->combined_links.rebind, &vm->rebind_list);
>   
>   	dma_resv_unlock(&vm->resv);
>   
> @@ -845,10 +847,11 @@ struct dma_fence *xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
>   		return NULL;
>   
>   	xe_vm_assert_held(vm);
> -	list_for_each_entry_safe(vma, next, &vm->rebind_list, rebind_link) {
> +	list_for_each_entry_safe(vma, next, &vm->rebind_list,
> +				 combined_links.rebind) {
>   		XE_WARN_ON(!vma->tile_present);
>   
> -		list_del_init(&vma->rebind_link);
> +		list_del_init(&vma->combined_links.rebind);
>   		dma_fence_put(fence);
>   		if (rebind_worker)
>   			trace_xe_vma_rebind_worker(vma);
> @@ -883,9 +886,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   		return vma;
>   	}
>   
> -	INIT_LIST_HEAD(&vma->rebind_link);
> -	INIT_LIST_HEAD(&vma->unbind_link);
> -	INIT_LIST_HEAD(&vma->userptr_link);
> +	INIT_LIST_HEAD(&vma->combined_links.rebind);
>   	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
>   	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>   	INIT_LIST_HEAD(&vma->extobj.link);
> @@ -1058,15 +1059,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   	struct xe_vm *vm = xe_vma_vm(vma);
>   
>   	lockdep_assert_held_write(&vm->lock);
> -	XE_BUG_ON(!list_empty(&vma->unbind_link));
> +	XE_BUG_ON(!list_empty(&vma->combined_links.destroy));
>   
>   	if (xe_vma_is_userptr(vma)) {
>   		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
>   
>   		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		list_del(&vma->userptr.invalidate_link);
>   		spin_unlock(&vm->userptr.invalidated_lock);
> -		list_del(&vma->userptr_link);
>   	} else if (!xe_vma_is_null(vma)) {
>   		xe_bo_assert_held(xe_vma_bo(vma));
>   
> @@ -1087,9 +1087,6 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   	}
>   
>   	xe_vm_assert_held(vm);
> -	if (!list_empty(&vma->rebind_link))
> -		list_del(&vma->rebind_link);
> -
>   	if (fence) {
>   		int ret = dma_fence_add_callback(fence, &vma->destroy_cb,
>   						 vma_destroy_cb);
> @@ -1443,11 +1440,12 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   
>   		/* easy case, remove from VMA? */
>   		if (xe_vma_has_no_bo(vma) || xe_vma_bo(vma)->vm) {
> +			list_del_init(&vma->combined_links.rebind);
>   			xe_vma_destroy(vma, NULL);
>   			continue;
>   		}
>   
> -		list_add_tail(&vma->unbind_link, &contested);
> +		list_move_tail(&vma->combined_links.destroy, &contested);
>   	}
>   
>   	/*
> @@ -1475,8 +1473,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	 * Since we hold a refcount to the bo, we can remove and free
>   	 * the members safely without locking.
>   	 */
> -	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> -		list_del_init(&vma->unbind_link);
> +	list_for_each_entry_safe(vma, next_vma, &contested,
> +				 combined_links.destroy) {
> +		list_del_init(&vma->combined_links.destroy);
>   		xe_vma_destroy_unlocked(vma);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index f17dc5d7370e..84bf1620214c 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -49,21 +49,19 @@ struct xe_vma {
>   	 */
>   	u64 tile_present;
>   
> -	/** @userptr_link: link into VM repin list if userptr */
> -	struct list_head userptr_link;
> -
> -	/**
> -	 * @rebind_link: link into VM if this VMA needs rebinding, and
> -	 * if it's a bo (not userptr) needs validation after a possible
> -	 * eviction. Protected by the vm's resv lock.
> -	 */
> -	struct list_head rebind_link;

The rebind_link and the userptr_link are not combinable. To be 
combinable they need to either be protected by the same lock or be kept 
mutually exclusive by some other *simple* argument, like construction / 
destruction, used for different subclasses etc.

The userptr_link is protected by the userptr.invalidated_lock and the 
rebind_link by the vm resv, and no simple argument can be made. In fact 
let's say that a userptr sits on or is being moved to the rebind list, 
and then the invalidation notifier gets called, which will try to move 
it to the userptr list again using the userptr link. In the best case it 
will fail the move since the list is not empty, in the worst case list 
corruption due to the list head is currently being modified.

So IMO for any list head being combined like this, we need to kerneldoc 
why this is possible, using either the lock argument or another simple 
argument like detailed above.

I *think* the notifier.rebind_list and the userptr_list are combinable, 
though, using the different vma subclass (userptr/bo) argument.

Thanks,

Thomas


> -
> -	/**
> -	 * @unbind_link: link or list head if an unbind of multiple VMAs, in
> -	 * single unbind op, is being done.
> -	 */
> -	struct list_head unbind_link;
> +	/** @combined_links: links into lists which are mutually exclusive */
> +	union {
> +		/** @userptr: link into VM repin list if userptr */
> +		struct list_head userptr;
> +		/**
> +		 * @rebind: link into VM if this VMA needs rebinding, and
> +		 * if it's a bo (not userptr) needs validation after a possible
> +		 * eviction. Protected by the vm's resv lock.
> +		 */
> +		struct list_head rebind;
> +		/** @destroy: link to contested list when VM is being closed */
> +		struct list_head destroy;
> +	} combined_links;
>   
>   	/** @destroy_cb: callback to destroy VMA when unbind job is done */
>   	struct dma_fence_cb destroy_cb;
