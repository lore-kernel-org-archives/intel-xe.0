Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C23C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 19:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AA310E72C;
	Wed, 11 Jun 2025 19:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hl9M2EyU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B9E10E72C
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749669953; x=1781205953;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BfmCrPSaLbKuKZvcWhgBEbxtxGEuU4o1Zagsw0T5uNA=;
 b=Hl9M2EyU1vOen0m80Lyfq0SiE7S/EcUtvRQtaQqbYi4OmsqkQ75Q+1w5
 VbOSA61eHgaHXARx00CjVHgnGE+NooAcb404NGqjdpi2RcFALxlHnkC5j
 Td3Rg2OgF3E9LEe3Pwf857v37Zi8/a+ZPFM39pShUB78ryT5aLgF/lv++
 63hguDuvYM9/FYMgPMrZhRhe2d8SsKLt64FW8Wt2xWceZRzJs81Vmr+YZ
 niPASbyVx8tp27ivDrjSjgkZ9/SX/xLvfsmPfnowiSkfnpNAVvhmYZ8Q0
 jeNyoFt9D8rQySKSlIwonUqKeIdkmXH/Px2DivXjESC0A2FVOAimGDIk3 A==;
X-CSE-ConnectionGUID: 3lq6n5giQDGCLqv3LKfuNQ==
X-CSE-MsgGUID: nohAt27GSCKhxkfOV4K+Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63174653"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63174653"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:25:52 -0700
X-CSE-ConnectionGUID: SyO3rvwvQ8iRoBim6Mm6jA==
X-CSE-MsgGUID: QtRJSFJJTXmN393jrT8zrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147280687"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.245.201])
 ([10.245.245.201])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 12:25:51 -0700
Message-ID: <3ebdd4d0-caeb-4d1a-a56a-a572e0685d8e@linux.intel.com>
Date: Wed, 11 Jun 2025 21:25:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't use drm exec locking in SVM pagefaults
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com
References: <20250603174012.2195759-1-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250603174012.2195759-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 2025-06-03 19:40, Matthew Brost wrote:
> Only the VM dma-resv lock is needed in SVM pagefaults so
> xe_vm_lock/unlock can be used instead of drm exec. Micro optimization
> but should save some CPU cycles in a critical path.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 36 +++++++++++++-----------------------
>  1 file changed, 13 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index f27fb9b588de..952b75a4264d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -858,7 +858,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			vm->xe->atomic_svm_timeslice_ms : 0,
>  	};
>  	struct xe_svm_range *range;
> -	struct drm_exec exec;
>  	struct dma_fence *fence;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> @@ -933,30 +932,21 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	range_debug(range, "PAGE FAULT - BIND");
>  
>  retry_bind:
> -	drm_exec_init(&exec, 0, 0);
> -	drm_exec_until_all_locked(&exec) {
> -		err = drm_exec_lock_obj(&exec, vm->gpuvm.r_obj);
> -		drm_exec_retry_on_contention(&exec);
> -		if (err) {
> -			drm_exec_fini(&exec);
> -			goto err_out;
> -		}
> -
> -		fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> -		if (IS_ERR(fence)) {
> -			drm_exec_fini(&exec);
> -			err = PTR_ERR(fence);
> -			if (err == -EAGAIN) {
> -				ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> -				range_debug(range, "PAGE FAULT - RETRY BIND");
> -				goto retry;
> -			}
> -			if (xe_vm_validate_should_retry(&exec, err, &end))
> -				goto retry_bind;
> -			goto err_out;
> +	xe_vm_lock(vm, false);
> +	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
> +	if (IS_ERR(fence)) {
> +		xe_vm_unlock(vm);
> +		err = PTR_ERR(fence);
> +		if (err == -EAGAIN) {
> +			ctx.timeslice_ms <<= 1;	/* Double timeslice if we have to retry */
> +			range_debug(range, "PAGE FAULT - RETRY BIND");
> +			goto retry;
>  		}
> +		if (xe_vm_validate_should_retry(NULL, err, &end))
> +			goto retry_bind;
> +		goto err_out;
>  	}
> -	drm_exec_fini(&exec);
> +	xe_vm_unlock(vm);
>  
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
