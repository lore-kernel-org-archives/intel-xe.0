Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C85C87FD3
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 15:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670B710E960;
	Fri,  8 Aug 2025 15:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wx9UMRzY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BE010E960
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 15:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754665832; x=1786201832;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+FMDeAiH9u7X7bhAs/rDz2XemJrSMg51OdAPshlnkEo=;
 b=Wx9UMRzYdeeia+4xkNtGNhdGhOLdXqJb6J0ooo/y8jLIY4X80SUQIJ2T
 taMcFdr6DqTrmFW5IDDbsnOD8jWcGsDvaDUQDpkzTHY1xit/AXd6wu1Cv
 HGUm1SgjT5lhWH1OPleuCv+bbs0aUxH5Xa/zNYpcHhGSidCN8lwAnUcYr
 tf5kcfxRt4wQi6QcJzTZD6Wl06QWcT5HwtqICXCyOaYXBZtYjLDIXXVNz
 jhfbUzqsi1/H4lr050PN2423oNCmUWUz9eV01oU4hjKIHml359vlguUMb
 J7FjdBwmM0L/qbTDYp95a84KKtotWa0rQGyaUEONTpHWT0nd3cK8149xZ w==;
X-CSE-ConnectionGUID: AomHUGmCSi2ndDsiu4LMaA==
X-CSE-MsgGUID: QKkrVJ5cSsqLJCnqICRvLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68381072"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68381072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:10:32 -0700
X-CSE-ConnectionGUID: 1yw/WSOFT0mItvo8o4rk9g==
X-CSE-MsgGUID: hP5mjGPpTq6j8T3SpWHEnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="164586838"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.245.211])
 ([10.245.245.211])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 08:10:31 -0700
Message-ID: <65ec0264-08ae-43a4-89c3-c6f3a51ecc0a@intel.com>
Date: Fri, 8 Aug 2025 16:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250808144404.1839829-1-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250808144404.1839829-1-piotr.piorkowski@intel.com>
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

On 08/08/2025 15:44, Piórkowski, Piotr wrote:
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
> Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c    | 2 +-
>   drivers/gpu/drm/xe/xe_pxp_submit.c | 2 +-
>   drivers/gpu/drm/xe/xe_vm.c         | 8 +++-----
>   drivers/gpu/drm/xe/xe_vm.h         | 2 +-
>   4 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 4effe10d815b..990403ee3752 100644
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
> index 432ea325677d..26948eb6e283 100644
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
> @@ -1660,8 +1660,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	vm->xe = xe;
>   
> +	vm->xef = xe_file_get(xef);

I think some of the error paths in here also need adjusting to have the 
put(), like with err_no_resv etc. Othewise I think looks OK.

I guess optional, but we could now potentially also move usm.asid and 
the pt tracking thing, and make that conditional on xef.

>   	vm->size = 1ull << xe->info.va_bits;
> -
>   	vm->flags = flags;
>   
>   	/**
> @@ -2097,7 +2097,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
>   		flags |= XE_VM_FLAG_FAULT_MODE;
>   
> -	vm = xe_vm_create(xe, flags);
> +	vm = xe_vm_create(xe, flags, xef);
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> @@ -2113,8 +2113,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
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

