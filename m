Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0913CC87FDB
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 13:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C573B10E10E;
	Mon, 11 Aug 2025 13:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nc5kQxWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02D310E10E
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 13:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754918019; x=1786454019;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=htifxZKxfYrf6iAR/p20GfxVe0yUsHF4HZsRjFBnztM=;
 b=nc5kQxWLDkIMsdKLyd7MYa+GQAMYGEYE7dHjvs5zmEdLDf4cs5GVbsBG
 D+CGwKfOSaDSrUaXUYMp+tKB4XQcGz/SGkNSC5FeEDALrlaGRXfOvRS4U
 CwuzoZqywEEEKwmnDSOpbMzY+lmCTweAkm937T7kb8ZdnAgsSmPYn4bcE
 +XF3zSP5g+EOIafZV7qIspOy/698Pi0DtZ3ulz5+uS1iGEMJzs7tToF0C
 DoUnbv80HnkmdO/FrRYLuPMQGLlwI/s3YKOzBigVEr1p67qkrkfGEnggY
 Sb9JhwqcoHQaWQLOdKQ3EuI+XUBK5grpZqMJQMkYTEq/DLe+KujXNlw96 g==;
X-CSE-ConnectionGUID: SEfTMZvuQTSLXhaEfWdh7g==
X-CSE-MsgGUID: 34ri0bRJQDic9ti3yjDTxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57311224"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57311224"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 06:13:39 -0700
X-CSE-ConnectionGUID: ssWuLkVFRAmjJXwDzExzfA==
X-CSE-MsgGUID: NWV+RW0QS3+8yFN7n2E9hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="166271043"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.155])
 ([10.245.244.155])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 06:13:38 -0700
Message-ID: <ba332352-f83f-41e2-b3df-5730142f386a@intel.com>
Date: Mon, 11 Aug 2025 14:13:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/xe: Assign ioctl xe file handler to vm in
 xe_vm_create
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
 <20250811104358.2064150-2-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250811104358.2064150-2-piotr.piorkowski@intel.com>
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

On 11/08/2025 11:43, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> In several code paths, such as xe_pt_create(), the vm->xef field is used
> to determine whether a VM originates from userspace or the kernel.
> 
> Previously, this handler was only assigned in xe_vm_create_ioctl(),
> after the VM was created by xe_vm_create(). However, xe_vm_create()
> triggers page table creation, and that function assumes vm->xef should
> be already set. This could lead to incorrect origin detection.
> 
> To fix this problem and ensure consistency in the initialization of
> the VM object, let's move the assignment of this handler to
> xe_vm_create.
> 
> v2:
>   - take reference to the xe file object only when xef is not NULL
>   - release the reference to the xe file object on the error path (Matthew)
> 
> Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
>   drivers/gpu/drm/xe/xe_pxp_submit.c |  2 +-
>   drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++-----
>   drivers/gpu/drm/xe/xe_vm.h         |  2 +-
>   4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index ac9f4d4988d2..915fccea7aeb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -411,7 +411,7 @@ int xe_migrate_init(struct xe_migrate *m)
>   
>   	/* Special layout, prepared below.. */
>   	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
> -			  XE_VM_FLAG_SET_TILE_ID(tile));
> +			  XE_VM_FLAG_SET_TILE_ID(tile), NULL);
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index d92ec0f515b0..ca95f2a4d4ef 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -101,7 +101,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
>   	xe_assert(xe, hwe);
>   
>   	/* PXP instructions must be issued from PPGTT */
> -	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
> +	vm = xe_vm_create(xe, XE_VM_FLAG_GSC, NULL);
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 148a2425006f..157e11bd2121 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1640,7 +1640,7 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
>   	}
>   }
>   
> -struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> +struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>   {
>   	struct drm_gem_object *vm_resv_obj;
>   	struct xe_vm *vm;
> @@ -1661,9 +1661,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	vm->xe = xe;
>   
>   	vm->size = 1ull << xe->info.va_bits;
> -
>   	vm->flags = flags;
>   
> +	if (xef)
> +		vm->xef = xe_file_get(xef);
>   	/**
>   	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
>   	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
> @@ -1814,6 +1815,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	for_each_tile(tile, xe, id)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
>   	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
> +	if (vm->xef)
> +		xe_file_put(vm->xef);
>   	kfree(vm);
>   	if (flags & XE_VM_FLAG_LR_MODE)
>   		xe_pm_runtime_put(xe);
> @@ -2097,7 +2100,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>   		flags |= XE_VM_FLAG_FAULT_MODE;
>   
> -	vm = xe_vm_create(xe, flags);
> +	vm = xe_vm_create(xe, flags, xef);
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> @@ -2113,8 +2116,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   		vm->usm.asid = asid;
>   	}
>   
> -	vm->xef = xe_file_get(xef);
> -
>   	/* Record BO memory for VM pagetable created against client */
>   	for_each_tile(tile, xe, id)
>   		if (vm->pt_root[id])
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 3475a118f666..2f213737c7e5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -26,7 +26,7 @@ struct xe_sync_entry;
>   struct xe_svm_range;
>   struct drm_exec;
>   
> -struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
> +struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef);
>   
>   struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
>   int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);

