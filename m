Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003CAC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 08:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48F710E5B9;
	Thu, 11 May 2023 08:38:54 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA0B10E5B9
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683794332; x=1715330332;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HtkBhTNNmCdDFTUmlpb0XkvgUtHbx8wvjTeb2DwAkGs=;
 b=mAlewhPfwnWV6vd8+laHTNAJmhhxCB6Ao9wyPaupXm7TwaCiTW7O3G8B
 CD40YH1UZHRcmrB4ivv97ey/QQHPIGFFQU5Yvom67h6JrWa7iKO46iXXK
 Rls6jqtZBALITilQKAVi2xuFZtPgW+ohOPtEf+HBr4BR28a5oB2HZQM3N
 2oIqp8HRQZCZ1eGTsO9JESlc1jmiKO1P04CrYwu3Ick3b0oPmn1OJBmt/
 UXZPMGO2spCb4pVIROVX0Ueo4MxGrMHVDKn7bp925kQU0f1CJJXLx7NVY
 HcRVBtRaM+c3+S4BzC3Jz6Ykr64oab0SvnkyOM4bjpamvyIreH2OpsQe+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="334918980"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="334918980"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 01:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650064761"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="650064761"
Received: from cuphoff-mobl.ger.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 01:38:50 -0700
Message-ID: <e6958f86-4b5f-8dd1-4393-1285b85315f7@linux.intel.com>
Date: Thu, 11 May 2023 10:38:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-20-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-20-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 19/31] drm/xe: Reduce the number list
 links in xe_vma
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


On 5/2/23 02:17, Matthew Brost wrote:
> 5 list links in can be squashed into a union in xe_vma as being on the
> various list is mutually exclusive.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c |  2 +-
>   drivers/gpu/drm/xe/xe_pt.c           |  5 +-
>   drivers/gpu/drm/xe/xe_vm.c           | 29 ++++++------
>   drivers/gpu/drm/xe/xe_vm_types.h     | 71 +++++++++++++++-------------
>   4 files changed, 55 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index cfffe3398fe4..d7bf6b0a0697 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -157,7 +157,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   
>   	if (xe_vma_is_userptr(vma) && write_locked) {
>   		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		list_del_init(&vma->invalidate_link);
>   		spin_unlock(&vm->userptr.invalidated_lock);
>   
>   		ret = xe_vma_userptr_pin_pages(vma);
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 010f44260cda..8eab8e1bbaf0 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1116,8 +1116,7 @@ static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
>   
>   		vma->userptr.divisor = divisor << 1;
>   		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&vma->userptr.invalidate_link,
> -			       &vm->userptr.invalidated);
> +		list_move_tail(&vma->invalidate_link, &vm->userptr.invalidated);
>   		spin_unlock(&vm->userptr.invalidated_lock);
>   		return true;
>   	}
> @@ -1724,7 +1723,7 @@ __xe_pt_unbind_vma(struct xe_gt *gt, struct xe_vma *vma, struct xe_engine *e,
>   
>   		if (!vma->gt_present) {
>   			spin_lock(&vm->userptr.invalidated_lock);
> -			list_del_init(&vma->userptr.invalidate_link);
> +			list_del_init(&vma->invalidate_link);
>   			spin_unlock(&vm->userptr.invalidated_lock);
>   		}
>   		up_read(&vm->userptr.notifier_lock);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index e0ed7201aeb0..e5f2fffb2aec 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -677,8 +677,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
>   	if (!xe_vm_in_fault_mode(vm) &&
>   	    !(vma->gpuva.flags & XE_VMA_DESTROYED) && vma->gt_present) {
>   		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&vma->userptr.invalidate_link,
> -			       &vm->userptr.invalidated);
> +		list_move_tail(&vma->invalidate_link, &vm->userptr.invalidated);
>   		spin_unlock(&vm->userptr.invalidated_lock);
>   	}
>   
> @@ -726,8 +725,8 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
>   	/* Collect invalidated userptrs */
>   	spin_lock(&vm->userptr.invalidated_lock);
>   	list_for_each_entry_safe(vma, next, &vm->userptr.invalidated,
> -				 userptr.invalidate_link) {
> -		list_del_init(&vma->userptr.invalidate_link);
> +				 invalidate_link) {
> +		list_del_init(&vma->invalidate_link);
>   		list_move_tail(&vma->userptr_link, &vm->userptr.repin_list);
>   	}
>   	spin_unlock(&vm->userptr.invalidated_lock);
> @@ -830,12 +829,11 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>   		return vma;
>   	}
>   
> -	/* FIXME: Way to many lists, should be able to reduce this */
> +	/*
> +	 * userptr_link, destroy_link, notifier.rebind_link,
> +	 * invalidate_link
> +	 */
>   	INIT_LIST_HEAD(&vma->rebind_link);
> -	INIT_LIST_HEAD(&vma->unbind_link);
> -	INIT_LIST_HEAD(&vma->userptr_link);
> -	INIT_LIST_HEAD(&vma->userptr.invalidate_link);
> -	INIT_LIST_HEAD(&vma->notifier.rebind_link);
>   	INIT_LIST_HEAD(&vma->extobj.link);
>   
>   	INIT_LIST_HEAD(&vma->gpuva.gem.entry);
> @@ -953,15 +951,14 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
>   	struct xe_vm *vm = xe_vma_vm(vma);
>   
>   	lockdep_assert_held_write(&vm->lock);
> -	XE_BUG_ON(!list_empty(&vma->unbind_link));
>   
>   	if (xe_vma_is_userptr(vma)) {
>   		XE_WARN_ON(!(vma->gpuva.flags & XE_VMA_DESTROYED));
>   
>   		spin_lock(&vm->userptr.invalidated_lock);
> -		list_del_init(&vma->userptr.invalidate_link);
> +		if (!list_empty(&vma->invalidate_link))
> +			list_del_init(&vma->invalidate_link);
>   		spin_unlock(&vm->userptr.invalidated_lock);
> -		list_del(&vma->userptr_link);
>   	} else if (!xe_vma_is_null(vma)) {
>   		xe_bo_assert_held(xe_vma_bo(vma));
>   		drm_gpuva_unlink(&vma->gpuva);
> @@ -1328,7 +1325,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   			continue;
>   		}
>   
> -		list_add_tail(&vma->unbind_link, &contested);
> +		if (!list_empty(&vma->destroy_link))
> +			list_del_init(&vma->destroy_link);
> +		list_add_tail(&vma->destroy_link, &contested);
>   	}
>   
>   	/*
> @@ -1356,8 +1355,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   	 * Since we hold a refcount to the bo, we can remove and free
>   	 * the members safely without locking.
>   	 */
> -	list_for_each_entry_safe(vma, next_vma, &contested, unbind_link) {
> -		list_del_init(&vma->unbind_link);
> +	list_for_each_entry_safe(vma, next_vma, &contested, destroy_link) {
> +		list_del_init(&vma->destroy_link);
>   		xe_vma_destroy_unlocked(vma);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index d55ec8156caa..22def5483c12 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -50,21 +50,32 @@ struct xe_vma {
>   	 */
>   	u64 gt_present;
>   
> -	/** @userptr_link: link into VM repin list if userptr */
> -	struct list_head userptr_link;
> +	union {
> +		/** @userptr_link: link into VM repin list if userptr */
> +		struct list_head userptr_link;
>   
> -	/**
> -	 * @rebind_link: link into VM if this VMA needs rebinding, and
> -	 * if it's a bo (not userptr) needs validation after a possible
> -	 * eviction. Protected by the vm's resv lock.
> -	 */
> -	struct list_head rebind_link;
> +		/**
> +		 * @rebind_link: link into VM if this VMA needs rebinding, and
> +		 * if it's a bo (not userptr) needs validation after a possible
> +		 * eviction. Protected by the vm's resv lock.
> +		 */
> +		struct list_head rebind_link;

Since the different lists have very different locking protection, I'm 
pretty sure you can come up with a scenario where this is invalid, for 
example a userptr vma being on the vm->userptr.repin_list and the 
vm->rebind_list simultaneously, if we, for example do a repin and then 
hit an -EINTR during xe_vm_lock_dma_resv() and then immediately a new 
userptr invalidation (now the rebind_link and userptr.invalidate_link 
are used on different lists), and then a new repin (now the rebind_link 
and userptr_link are used on different lists, simultaneously).

If you want to do a union like this, we either need to have the exact 
same locking rules for the links or they should be used for completely 
different purposes that can never happen together, like the 
userptr.invalidate_link and the notifier.rebind_link, one used for 
userptr only and the other for bo only.

I'm also pretty sure that a vma can be on the rebind_list and the 
notifier.rebind_list simultaneously, due to the different locking, with 
a similar reasoning as above.

So without the rule of exact same locking rules, it becomes practically 
impossible to reason that using a union is safe.

/Thomas


