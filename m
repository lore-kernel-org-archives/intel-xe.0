Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA39C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 20:02:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3806410E4B9;
	Wed, 26 Jul 2023 20:02:49 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA06910E4B9
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 20:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690401767; x=1721937767;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wnHKEI1+q9EpzV0MZHJQ/WIdcWn/SpbojlmLb8dVvyo=;
 b=k8lI+21w5BHjFmZ1k6BBTU6EcjRR7zaz9V+CJLtfNBx9kNyoW1CfvCqO
 aNvgtNFbjev5kHqel93zZPML7zf1cOGVKUIPYtSh+vG6zW/K6qZwR/WUf
 peHF1oH4K/b22o6aBmc5pX42G1lGUU90qzmCZf4Wd0gyH3D7sRC+Sq8t/
 ka6LxrUvCz4WhEPrdrrlUqXqOEjFdBLxTXxadWpGDmW6xfHkJqMz423cQ
 n94l7PEz6YqJXgOwmpNTw5rcSNE9VtVt25mwJLqgJq9fGMkayYSCacwnv
 JZRqCBabub6XIy4YIxiSfEOqOGFX/KH0G4YR03gtveaSXcFREtVd12ghH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="353020948"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; d="scan'208";a="353020948"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 13:02:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870045757"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.38.43])
 ([10.249.38.43])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 13:02:47 -0700
Message-ID: <1af18143-907c-bbac-7f4a-91cfacfc9ffb@linux.intel.com>
Date: Wed, 26 Jul 2023 22:02:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230726163721.353842-1-matthew.brost@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230726163721.353842-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Always use xe_vm_queue_rebind_worker
 helper
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


On 7/26/2023 6:37 PM, Matthew Brost wrote:
> Do not queue the rebind worker directly, rather use the helper
> xe_vm_queue_rebind_worker. This ensures we use the correct work queue.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pt.c |  3 +--
>   drivers/gpu/drm/xe/xe_vm.h | 14 +++++++-------
>   2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index d4660520ac2c..c4270e7747bf 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1472,8 +1472,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vma *vma, struct xe_engine *e,
>   		}
>   		if (!rebind && last_munmap_rebind &&
>   		    xe_vm_in_compute_mode(vm))
> -			queue_work(vm->xe->ordered_wq,
> -				   &vm->preempt.rebind_work);
> +			xe_vm_queue_rebind_worker(vm);
>   	} else {
>   		kfree(rfence);
>   		kfree(ifence);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index eaf11ac8ff51..4db777d7e375 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -185,6 +185,12 @@ extern struct ttm_device_funcs xe_ttm_funcs;
>   
>   struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
>   
> +static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> +{
> +	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
> +	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> +}
> +
>   /**
>    * xe_vm_reactivate_rebind() - Reactivate the rebind functionality on compute
>    * vms.
> @@ -198,7 +204,7 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
>   {
>   	if (xe_vm_in_compute_mode(vm) && vm->preempt.rebind_deactivated) {
>   		vm->preempt.rebind_deactivated = false;
> -		queue_work(system_unbound_wq, &vm->preempt.rebind_work);
> +		xe_vm_queue_rebind_worker(vm);
>   	}
>   }
>   
> @@ -206,12 +212,6 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma);
>   
>   int xe_vma_userptr_check_repin(struct xe_vma *vma);
>   
> -static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
> -{
> -	XE_WARN_ON(!xe_vm_in_compute_mode(vm));
> -	queue_work(vm->xe->ordered_wq, &vm->preempt.rebind_work);
> -}
> -
>   /*
>    * XE_ONSTACK_TV is used to size the tv_onstack array that is input
>    * to xe_vm_lock_dma_resv() and xe_vm_unlock_dma_resv().
