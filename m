Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DE7CCD18B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 07:56:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C2B10E553;
	Wed, 18 Sep 2024 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRyI7jpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF16910E553
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 07:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726646202; x=1758182202;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=IFY1YEOTYur705hnMQiIEkwlrZXei/Mv5PPqfrYbwvY=;
 b=YRyI7jpoyXsyapQYl3hi7R1vBC7q6HHUzOxrsWQ2jhNFN7fnQQavo/4+
 p1HkBsJlLVGfyQPoY10Mi9JPak157JBQqEOWoKTI8PQkyoPcMLlw69jB5
 CC95+16PoD6Y+GevdRoe2fdAN1Befs9x5t1vKZJNnHZCHHjms/G6ozvW1
 jk8GdCtUNA4ifKdmJSTsc94ow3ikZaKTnowW5xwhbnjWLygKrrv+SMDwF
 UAkBtRHYSa8qyESwCZbSJn7JofLT7hLN+T1eFqHSbaUBLDErgmeyL5KpW
 kWwyT8kPGbv6EYmwIMNUMx2Lu+pxQWxtuUsxzb2U9QlFjSt1W5AaVGAXp Q==;
X-CSE-ConnectionGUID: gpUAymw/SSicosbecp2Hiw==
X-CSE-MsgGUID: iE51RKr7S92ZZMxc7ZA/hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36125110"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="36125110"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:56:40 -0700
X-CSE-ConnectionGUID: 5a9lQucXT3KogZzp9PV/uw==
X-CSE-MsgGUID: Iug4pB2aTg2x9wUfyVusxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69457826"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.137])
 ([10.245.245.137])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:56:28 -0700
Message-ID: <148ac588-d4bd-4a86-849b-5e28b530b3b7@intel.com>
Date: Wed, 18 Sep 2024 08:56:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Convert to USM lock to rwsem
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240918054436.1971839-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240918054436.1971839-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 18/09/2024 06:44, Matthew Brost wrote:
> Remove contention from GPU fault path for ASID->VM lookup.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 4 +---
>   drivers/gpu/drm/xe/xe_device_types.h | 2 +-
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 8 ++++----
>   drivers/gpu/drm/xe/xe_vm.c           | 8 ++++----
>   4 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4d3c794f134c..38eade07a004 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -335,9 +335,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   
>   	init_waitqueue_head(&xe->ufence_wq);
>   
> -	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
> -	if (err)
> -		goto err;
> +	init_rwsem(&xe->usm.lock);
>   
>   	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c92df0a2423f..4507a5756a05 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -395,7 +395,7 @@ struct xe_device {
>   		/** @usm.next_asid: next ASID, used to cyclical alloc asids */
>   		u32 next_asid;
>   		/** @usm.lock: protects UM state */
> -		struct mutex lock;
> +		struct rw_semaphore lock;
>   	} usm;
>   
>   	/** @pinned: pinned BO state */
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 00af059a8971..5c3af2bb5402 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -198,13 +198,13 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
>   		return -EFAULT;
>   
>   	/* ASID to VM */
> -	mutex_lock(&xe->usm.lock);
> +	down_read(&xe->usm.lock);
>   	vm = xa_load(&xe->usm.asid_to_vm, pf->asid);
>   	if (vm && xe_vm_in_fault_mode(vm))
>   		xe_vm_get(vm);
>   	else
>   		vm = NULL;
> -	mutex_unlock(&xe->usm.lock);
> +	up_read(&xe->usm.lock);
>   	if (!vm)
>   		return -EINVAL;
>   
> @@ -549,11 +549,11 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>   		return -EINVAL;
>   
>   	/* ASID to VM */
> -	mutex_lock(&xe->usm.lock);
> +	down_read(&xe->usm.lock);
>   	vm = xa_load(&xe->usm.asid_to_vm, acc->asid);
>   	if (vm)
>   		xe_vm_get(vm);
> -	mutex_unlock(&xe->usm.lock);
> +	up_read(&xe->usm.lock);
>   	if (!vm || !xe_vm_in_fault_mode(vm))
>   		return -EINVAL;

Looks like we potentially leak the vm here. Could maybe make this the 
same as above? Maybe even a small helper.

Anyway,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7acd5fc9d032..a3d7cb7cfd22 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1613,7 +1613,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   
>   	up_write(&vm->lock);
>   
> -	mutex_lock(&xe->usm.lock);
> +	down_write(&xe->usm.lock);
>   	if (vm->usm.asid) {
>   		void *lookup;
>   
> @@ -1623,7 +1623,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
>   		lookup = xa_erase(&xe->usm.asid_to_vm, vm->usm.asid);
>   		xe_assert(xe, lookup == vm);
>   	}
> -	mutex_unlock(&xe->usm.lock);
> +	up_write(&xe->usm.lock);
>   
>   	for_each_tile(tile, xe, id)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
> @@ -1772,11 +1772,11 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   		goto err_close_and_put;
>   
>   	if (xe->info.has_asid) {
> -		mutex_lock(&xe->usm.lock);
> +		down_write(&xe->usm.lock);
>   		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
>   				      XA_LIMIT(1, XE_MAX_ASID - 1),
>   				      &xe->usm.next_asid, GFP_KERNEL);
> -		mutex_unlock(&xe->usm.lock);
> +		up_write(&xe->usm.lock);
>   		if (err < 0)
>   			goto err_free_id;
>   
