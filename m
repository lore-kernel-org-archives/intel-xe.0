Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277ACC4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 11:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4BD10E668;
	Tue,  6 Feb 2024 11:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="USYwifZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C6710E668
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Feb 2024 11:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707217251; x=1738753251;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Or4O8x+t6GM6tMHOxhOmWNgznfICWqaVxbRweS0EiUE=;
 b=USYwifZXpQRoncAcyn8ArFjBKqk6/2T6uq0FEV3RoqSUdhv2zMkr8wbh
 s2TrNGWKLbB+GBDKnOx74+eICIpaRitPrxEgo9E7l3tRBUbYtwG+WIJQp
 PSyopi4oqCxqN7ylSQ5KSS5fd5+UYPxk4xM43eDAAM733tamGZPgia2JC
 5uaxS2pLsJCdt+jHULwcnLkjUMBa723nwOKvzH2uzzvxoaEVTqg3MUuuT
 Qg0cj743fQF12U6938sQSzHbrB3ZDDz561fUH3a/2vYPHlz19FX/Trax7
 yfPaVPYoWrqsiuikVszVHyF8J2XK+w+S0ZDMgtbM90hGm82opXUElXujp Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4532469"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="4532469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 03:00:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="987933"
Received: from osultan-mobl.ger.corp.intel.com (HELO [10.251.218.238])
 ([10.251.218.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 03:00:46 -0800
Message-ID: <a891bd71-e46b-4db2-a5c6-006688d67979@linux.intel.com>
Date: Tue, 6 Feb 2024 12:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove TEST_VM_ASYNC_OPS_ERROR
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240206045010.2981051-1-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240206045010.2981051-1-matthew.brost@intel.com>
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

Hey,

This should not have been upstreamed, so lets remove it!

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2024-02-06 05:50, Matthew Brost wrote:
> TEST_VM_ASYNC_OPS_ERROR is broken and unused. Remove for now and will
> pull back in a later time when it is used, fixed, and properly hidden
> behind a Kconfig option. Also fixup the supported flags value.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs"
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c       | 28 +---------------------------
>   drivers/gpu/drm/xe/xe_vm_types.h |  8 --------
>   2 files changed, 1 insertion(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index ed594fa2f8da..b49a5065b0e2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -37,8 +37,6 @@
>   #include "generated/xe_wa_oob.h"
>   #include "xe_wa.h"
>   
> -#define TEST_VM_ASYNC_OPS_ERROR
> -
>   static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>   {
>   	return vm->gpuvm.r_obj;
> @@ -2065,7 +2063,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
>   	struct drm_gpuva_ops *ops;
>   	struct drm_gpuva_op *__op;
> -	struct xe_vma_op *op;
>   	struct drm_gpuvm_bo *vm_bo;
>   	int err;
>   
> @@ -2112,15 +2109,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>   	if (IS_ERR(ops))
>   		return ops;
>   
> -#ifdef TEST_VM_ASYNC_OPS_ERROR
> -	if (operation & FORCE_ASYNC_OP_ERROR) {
> -		op = list_first_entry_or_null(&ops->list, struct xe_vma_op,
> -					      base.entry);
> -		if (op)
> -			op->inject_error = true;
> -	}
> -#endif
> -
>   	drm_gpuva_for_each_op(__op, ops) {
>   		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>   
> @@ -2563,13 +2551,6 @@ static int xe_vma_op_execute(struct xe_vm *vm, struct xe_vma_op *op)
>   
>   	lockdep_assert_held_write(&vm->lock);
>   
> -#ifdef TEST_VM_ASYNC_OPS_ERROR
> -	if (op->inject_error) {
> -		op->inject_error = false;
> -		return -ENOMEM;
> -	}
> -#endif
> -
>   	switch (op->base.op) {
>   	case DRM_GPUVA_OP_MAP:
>   		ret = __xe_vma_op_execute(vm, op->map.vma, op);
> @@ -2729,16 +2710,9 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>   	return 0;
>   }
>   
> -#ifdef TEST_VM_ASYNC_OPS_ERROR
> -#define SUPPORTED_FLAGS	\
> -	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
> -	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> -#else
>   #define SUPPORTED_FLAGS	\
>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
> -	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
> -	 0xffff)
> -#endif
> +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL)
>   #define XE_64K_PAGE_MASK 0xffffull
>   #define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 1fec66ae2eb2..5ac9c5bebabc 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -21,9 +21,6 @@ struct xe_bo;
>   struct xe_sync_entry;
>   struct xe_vm;
>   
> -#define TEST_VM_ASYNC_OPS_ERROR
> -#define FORCE_ASYNC_OP_ERROR	BIT(31)
> -
>   #define XE_VMA_READ_ONLY	DRM_GPUVA_USERBITS
>   #define XE_VMA_DESTROYED	(DRM_GPUVA_USERBITS << 1)
>   #define XE_VMA_ATOMIC_PTE_BIT	(DRM_GPUVA_USERBITS << 2)
> @@ -360,11 +357,6 @@ struct xe_vma_op {
>   	/** @flags: operation flags */
>   	enum xe_vma_op_flags flags;
>   
> -#ifdef TEST_VM_ASYNC_OPS_ERROR
> -	/** @inject_error: inject error to test async op error handling */
> -	bool inject_error;
> -#endif
> -
>   	union {
>   		/** @map: VMA map operation specific data */
>   		struct xe_vma_op_map map;
