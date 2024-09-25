Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27469C369B1
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 09:24:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3FAB10E2F1;
	Wed, 25 Sep 2024 09:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SLa6BYI9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56FA510E2F1
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 09:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727256268; x=1758792268;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=I6qIVElgaR7O8BPW73Q41D+G7hk+ZpSQUAI3bLW41Z0=;
 b=SLa6BYI9bIq9U2EBNjj/YWq3YjGVpK/mxNR/0PXvSntR3ts1NEt+rDgm
 00LGgdYyrmrOp4OHyOqN1y5wytec9PWVQhvzH3/tuQj3b+bClkwS13Og2
 1F2zmBMOvQbH75VQ4o9YE7h9mXA7SKLlrE61ocBQpGhxprvrcC5E8ncRx
 Tsa/TkjG4H99VpSxo17zljZfDiGR8O1DSOWqtvRCZgpRqmh/FNt/Xpbje
 L+1SltHkTbNpq0rjxSbuXJ7vJT7eJTQHBMC5hyRWvkmzAJbpykLWUougd
 f2mey3g4npS+o2TXmqphG3kmW50SRgpFIYBD5j8JwIctt4NBo2tJQoUtU g==;
X-CSE-ConnectionGUID: h/LhFjgSS1u4IX38OP6Jfg==
X-CSE-MsgGUID: NsYbjvP0Q2iGz2G1wjFcrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="13917296"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="13917296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:24:27 -0700
X-CSE-ConnectionGUID: QpBXGGTCQyeFRiffhs9C+w==
X-CSE-MsgGUID: oWbSj22cT6+S5aToxGqnYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208";a="71797192"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.178.53])
 ([10.245.178.53])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:24:26 -0700
Message-ID: <5d47b5a8-fe4c-49fb-9f36-06916098829a@linux.intel.com>
Date: Wed, 25 Sep 2024 11:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/vm: move xa_alloc to prevent UAF
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
References: <20240925071426.144015-3-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240925071426.144015-3-matthew.auld@intel.com>
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


On 9/25/2024 9:14 AM, Matthew Auld wrote:
> Evil user can guess the next id of the vm before the ioctl completes and
> then call vm destroy ioctl to trigger UAF since create ioctl is still
> referencing the same vm. Move the xa_alloc all the way to the end to
> prevent this.
>
> v2:
>  - Rebase
>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <stable@vger.kernel.org> # v6.8+
Interesting find, LGTM:
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 31fe31db3fdc..ce9dca4d4e87 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1765,10 +1765,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	if (IS_ERR(vm))
>  		return PTR_ERR(vm);
>  
> -	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
> -	if (err)
> -		goto err_close_and_put;
> -
>  	if (xe->info.has_asid) {
>  		down_write(&xe->usm.lock);
>  		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> @@ -1776,12 +1772,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  				      &xe->usm.next_asid, GFP_KERNEL);
>  		up_write(&xe->usm.lock);
>  		if (err < 0)
> -			goto err_free_id;
> +			goto err_close_and_put;
>  
>  		vm->usm.asid = asid;
>  	}
>  
> -	args->vm_id = id;
>  	vm->xef = xe_file_get(xef);
>  
>  	/* Record BO memory for VM pagetable created against client */
> @@ -1794,10 +1789,15 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
>  #endif
>  
> +	/* user id alloc must always be last in ioctl to prevent UAF */
> +	err = xa_alloc(&xef->vm.xa, &id, vm, xa_limit_32b, GFP_KERNEL);
> +	if (err)
> +		goto err_close_and_put;
> +
> +	args->vm_id = id;
> +
>  	return 0;
>  
> -err_free_id:
> -	xa_erase(&xef->vm.xa, id);
>  err_close_and_put:
>  	xe_vm_close_and_put(vm);
>  
