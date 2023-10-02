Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5F8E784AF
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 09:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A7C10E267;
	Mon,  2 Oct 2023 09:01:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186BF10E26D
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 09:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696237235; x=1727773235;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=byH9BJOaSfN+9i5F958b2YDZtiOfInZm+CkK9KiyzdA=;
 b=IvuhH+PT9bD3DD6yrHWA0G/z3mkszwxvHRrEaBSg/PFMXIgft3m+iOol
 H4uBOpK+fA8S+MSJeoHbjauce2wlb37H/UYtuYjvLk7beX6TLlpDXCRCA
 KHtf5DLv3Ll7n+c89MUk+8LQpfZgC+p4+7cEltGvJw4jMOcBFHJBPOfhX
 OzLgPI7/Sjp18Mo5TFADmmHwE7kK8TDxqfvRUt9LMzCLD3tJsiN3x1AuE
 6T+18X3TRBICvYoEQVdUL2mBl447GszQXkm+6NO5Cbs7lzYLwgG+A1EUE
 4SghOgc5nq2Q8qBBbBtgIZ1aIOOcR14tlAJLXfi8myioSm0D7rHUaPDAG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="413519382"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="413519382"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="779879325"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="779879325"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO [10.249.254.231])
 ([10.249.254.231])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:00:33 -0700
Message-ID: <52925a17-67b5-3e93-95e5-f8715d58757c@linux.intel.com>
Date: Mon, 2 Oct 2023 11:00:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230927043118.3017207-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230927043118.3017207-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Drop -EAGAIN userptr invalidation
 dance from VM bind IOCTL
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


On 9/27/23 06:31, Matthew Brost wrote:
> This isn't needed as the nexr exec, preempt rebind worker, or page fault
> will issue a rebind. Drop thing complication.

s/thing/the/ ?

Also considering not a lot of code can actually be dropped and this 
enables us to build page-tables in the IOCTL rather than in the rebind 
worker it needs reconsidering? Also the prefetch OP will be more likely 
to succeed....

>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c | 61 +-------------------------------------
>   drivers/gpu/drm/xe/xe_vm.c | 10 -------
>   2 files changed, 1 insertion(+), 70 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index aec469842471..34954d354013 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1042,36 +1042,6 @@ static void xe_vm_dbg_print_entries(struct xe_device *xe,
>   {}
>   #endif
>   
> -#ifdef CONFIG_DRM_XE_USERPTR_INVAL_INJECT
> -
> -static int xe_pt_userptr_inject_eagain(struct xe_vma *vma)
Hmm. Regardless of the way we chose to handle a racing invalidation, 
wouldn't it make sense to keep this but perhaps rename it to 
inject_inval to make sure we properly test racing invalidations?
> -{
> -	u32 divisor = vma->userptr.divisor ? vma->userptr.divisor : 2;
> -	static u32 count;
> -
> -	if (count++ % divisor == divisor - 1) {
> -		struct xe_vm *vm = xe_vma_vm(vma);
> -
> -		vma->userptr.divisor = divisor << 1;
> -		spin_lock(&vm->userptr.invalidated_lock);
> -		list_move_tail(&vma->userptr.invalidate_link,
> -			       &vm->userptr.invalidated);
> -		spin_unlock(&vm->userptr.invalidated_lock);
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
> -#else
> -
> -static bool xe_pt_userptr_inject_eagain(struct xe_vma *vma)
> -{
> -	return false;
> -}
> -
> -#endif
> -
>   /**
>    * struct xe_pt_migrate_pt_update - Callback argument for pre-commit callbacks
>    * @base: Base we derive from.
> @@ -1139,7 +1109,6 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>   	struct xe_pt_migrate_pt_update *userptr_update =
>   		container_of(pt_update, typeof(*userptr_update), base);
>   	struct xe_vma *vma = pt_update->vma;
> -	unsigned long notifier_seq = vma->userptr.notifier_seq;
>   	struct xe_vm *vm = xe_vma_vm(vma);
>   	int err = xe_pt_vm_dependencies(pt_update->job,
>   					&vm->rftree[pt_update->tile_id],
> @@ -1149,36 +1118,8 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
>   	if (err)
>   		return err;
>   
> -	userptr_update->locked = false;
> -
> -	/*
> -	 * Wait until nobody is running the invalidation notifier, and
> -	 * since we're exiting the loop holding the notifier lock,
> -	 * nobody can proceed invalidating either.
> -	 *
> -	 * Note that we don't update the vma->userptr.notifier_seq since
> -	 * we don't update the userptr pages.
> -	 */
> -	do {
> -		down_read(&vm->userptr.notifier_lock);
> -		if (!mmu_interval_read_retry(&vma->userptr.notifier,
> -					     notifier_seq))
> -			break;

You need to keep the mmu_interval_read_retry() under the notifier lock. 
Otherwise page-table updates may race with page-table zapping. But if we 
don't do the repin dance you need to return 0 if 
mmu_interval_read_retry() is true.

> -
> -		up_read(&vm->userptr.notifier_lock);
> -
> -		if (userptr_update->bind)
> -			return -EAGAIN;
> -
> -		notifier_seq = mmu_interval_read_begin(&vma->userptr.notifier);
> -	} while (true);
> -
> -	/* Inject errors to test_whether they are handled correctly */
> -	if (userptr_update->bind && xe_pt_userptr_inject_eagain(vma)) {
> -		up_read(&vm->userptr.notifier_lock);
> -		return -EAGAIN;
Just return zero here if we don't do the repin.
> -	}
>   
> +	down_read(&vm->userptr.notifier_lock);
>   	userptr_update->locked = true;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 861d050871bb..147d5f901f24 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2757,7 +2757,6 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   	struct drm_exec exec;
>   	int err;
>   
> -retry_userptr:
>   	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>   	drm_exec_until_all_locked(&exec) {
>   		err = op_execute(&exec, vm, vma, op);
> @@ -2767,15 +2766,6 @@ static int __xe_vma_op_execute(struct xe_vm *vm, struct xe_vma *vma,
>   	}
>   	drm_exec_fini(&exec);
>   
> -	if (err == -EAGAIN && xe_vma_is_userptr(vma)) {
> -		lockdep_assert_held_write(&vm->lock);
> -		err = xe_vma_userptr_pin_pages(vma);
> -		if (!err)
> -			goto retry_userptr;
> -
> -		trace_xe_vma_fail(vma);
> -	}
> -
>   	return err;
>   }
>   
