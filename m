Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1346C87FD2
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 13:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74C8710E10E;
	Mon, 11 Aug 2025 13:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGDQCrrq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B985010E3D6
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 13:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754918361; x=1786454361;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HsnahDEipj1gGYRjWoPeACDQkGO5oJd5wbH1opwvXLQ=;
 b=kGDQCrrqC7SncnjKw+PtHLu54Jo9BdRpjQOM4PLAswrgwmidFD4bEaqE
 I9O7zjkX4d8oRdete3m2IvzLi/zzGiuRBXsPuIG2Zyk5Jca20rBS1HW64
 E8jUsHeLP8pVlJFIxqPU6d7jQ2qg3Nf3R25brN1pxILlRq2KOAcCRSa9i
 MDmAOnYYjEZTNWD6QGGepweEy3VK4GlXn6vNB5MgCPE5V/O9/7BX3Q2R/
 CV0YDjeg1KU+PaXoxsz+VEV0lkIsY7xa97lk+1JVrvawvKBxMYAn959Ec
 M0BVrh7PFTcFmxeTntJEbYQZBzaBG05NWYJUrLVJwbgnXShiFFAb/ipw7 g==;
X-CSE-ConnectionGUID: LZ2FNYAuRQyq2+jgjwiFjw==
X-CSE-MsgGUID: IJ2NApfAQXC8tTFxnyNHFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="67439314"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="67439314"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 06:19:21 -0700
X-CSE-ConnectionGUID: NIvnHQMzSWCU6LboNl4lmQ==
X-CSE-MsgGUID: sIvLvguGROWH1AZ7rZf8fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="170031772"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.244.155])
 ([10.245.244.155])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 06:19:20 -0700
Message-ID: <b0152e7a-aebd-41df-a2f5-ea5ca8893983@intel.com>
Date: Mon, 11 Aug 2025 14:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Move ASID allocation and user PT BO
 tracking into xe_vm_create
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
 <20250811104358.2064150-3-piotr.piorkowski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250811104358.2064150-3-piotr.piorkowski@intel.com>
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
> Currently, ASID assignment for user VMs and page-table BO accounting for
> client memory tracking are performed in xe_vm_create_ioctl.
> To consolidate VM object initialization, move this logic to
> xe_vm_create.
> 
> v2:
>   - removed unnecessary duplicate BO tracking code
>   - using the local variable xef to verify whether the VM is being created
>     by userspace
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Having the vm initialisation fully contained within vm_create() seems 
less error prone to me.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 34 +++++++++++++++-------------------
>   1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 157e11bd2121..486d345b82de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1795,6 +1795,20 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
>   	if (number_tiles > 1)
>   		vm->composite_fence_ctx = dma_fence_context_alloc(1);
>   
> +	if (xef && xe->info.has_asid) {
> +		u32 asid;
> +
> +		down_write(&xe->usm.lock);
> +		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> +				      XA_LIMIT(1, XE_MAX_ASID - 1),
> +				      &xe->usm.next_asid, GFP_KERNEL);
> +		up_write(&xe->usm.lock);
> +		if (err < 0)
> +			goto err_unlock_close;
> +
> +		vm->usm.asid = asid;
> +	}
> +
>   	trace_xe_vm_create(vm);
>   
>   	return vm;
> @@ -2062,9 +2076,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	struct xe_device *xe = to_xe_device(dev);
>   	struct xe_file *xef = to_xe_file(file);
>   	struct drm_xe_vm_create *args = data;
> -	struct xe_tile *tile;
>   	struct xe_vm *vm;
> -	u32 id, asid;
> +	u32 id;
>   	int err;
>   	u32 flags = 0;
>   
> @@ -2104,23 +2117,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>   	if (IS_ERR(vm))
>   		return PTR_ERR(vm);
>   
> -	if (xe->info.has_asid) {
> -		down_write(&xe->usm.lock);
> -		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
> -				      XA_LIMIT(1, XE_MAX_ASID - 1),
> -				      &xe->usm.next_asid, GFP_KERNEL);
> -		up_write(&xe->usm.lock);
> -		if (err < 0)
> -			goto err_close_and_put;
> -
> -		vm->usm.asid = asid;
> -	}
> -
> -	/* Record BO memory for VM pagetable created against client */
> -	for_each_tile(tile, xe, id)
> -		if (vm->pt_root[id])
> -			xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
> -
>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
>   	/* Warning: Security issue - never enable by default */
>   	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);

