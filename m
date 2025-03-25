Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95664C35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 09:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE8810E52C;
	Tue, 25 Mar 2025 09:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JcyvBqQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18A610E52C
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 09:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742895686; x=1774431686;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=m1nkw2kJozBqpDYXA60areJYj3ll8on+D9m4O3t7HiA=;
 b=JcyvBqQviymLzBryBWscWkN+a8aLqjLzsRCqSDwPa4eW0kozBqUARikS
 ZRI3a7TqriBxltmCTos/rRLJnyq3/Hk9fS8fY9IOoCjsxVQzHSZ/g5Krb
 UsjeSzRP7KdUWZErt53RX+z6aZn9FaBsuHfPl1hjy22IJjVUEMczy5DjT
 fkUMIING9WZQUM5YDCA7PAOoknpC1XA44CRucnldVEzdIlX5M2tXZ/ikc
 QkSsTMPDhxSFM7jaddrNLBHHaFVnNTc5MYBuYOuLpus+JcUrB6d7fRkli
 vTthj9905DEKtBMXDf3ZBAiXV1hTxawhDwBzBB+keXQWHaBVfsImueymG A==;
X-CSE-ConnectionGUID: FFC3MCzuQlu2BROkeUkDVQ==
X-CSE-MsgGUID: O9RPFGmASB6YQ/NMI8PYsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47915233"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="47915233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:41:25 -0700
X-CSE-ConnectionGUID: gAHhE9a4S56jQ0EtOPrGdQ==
X-CSE-MsgGUID: /v/ThcW4QoeYVGlX6VvFjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124039242"
Received: from savramon-mobl1 (HELO [10.245.244.111]) ([10.245.244.111])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:41:24 -0700
Message-ID: <143aa075-c7a1-4aeb-b36c-8c00ff6d27c5@linux.intel.com>
Date: Tue, 25 Mar 2025 10:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] drm/xe: Add mem_region to properties line in VM
 snapshot capture
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: jose.souza@intel.com, carlos.santa@intel.com
References: <20250320192831.3842138-1-matthew.brost@intel.com>
 <20250320192831.3842138-4-matthew.brost@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250320192831.3842138-4-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

On 2025-03-20 20:28, Matthew Brost wrote:
> Add memory region to properties line in VM snapshot capture indicating
> where the memory is located. The memory region corresponds to regions in
> the uAPI. This is useful information for debug and will help build a
> robust GPU hang replay tool.
> 
> The current format is:
> 
> [<vma address>]: <permissions>|<type>|mem_region=0x%x
> 
> Permissions has two options, either "read_only" or "read_write".
> 
> Type has three options, either "userptr", "null_sparse", or "bo".
> 
> Memory region is a bit mask of where the memory is located.
> 
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 8718fba3a6f3..a95d5765a258 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3713,6 +3713,7 @@ struct xe_vm_snapshot {
>  #define XE_VM_SNAP_FLAG_READ_ONLY	BIT(1)
>  #define XE_VM_SNAP_FLAG_IS_NULL		BIT(2)
>  		unsigned long flags;
> +		int uapi_mem_region;
>  		struct xe_bo *bo;
>  		void *data;
>  		struct mm_struct *mm;
> @@ -3758,6 +3759,18 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>  		if (bo) {
>  			snap->snap[i].bo = xe_bo_get(bo);
>  			snap->snap[i].bo_ofs = xe_vma_bo_offset(vma);
> +			switch (bo->ttm.resource->mem_type) {
> +			case XE_PL_SYSTEM:
> +			case XE_PL_TT:
> +				snap->snap[i].uapi_mem_region = 0;
> +				break;
> +			case XE_PL_VRAM0:
> +				snap->snap[i].uapi_mem_region = 1;
> +				break;
> +			case XE_PL_VRAM1:
> +				snap->snap[i].uapi_mem_region = 2;
> +				break;
> +			}
XE_PL_STOLEN is missing. It's possible to get a handle to the display created framebuffer using getfb2,
and then VM_BIND it. When implementing stolen it surprised me that this actually happens when starting X.org

It should be mapped as vram0 on discrete and sysmem on integrated, since it's not possible to allocate memory directly there for userspace.

And instead of custom enum values, set it to (memclass << 16 | instance) ?

>  		} else if (xe_vma_is_userptr(vma)) {
>  			struct mm_struct *mm =
>  				to_userptr_vma(vma)->userptr.notifier.mm;
> @@ -3769,10 +3782,13 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm)
>  
>  			snap->snap[i].bo_ofs = xe_vma_userptr(vma);
>  			snap->snap[i].flags |= XE_VM_SNAP_FLAG_USERPTR;
> +			snap->snap[i].uapi_mem_region = 0;
>  		} else if (xe_vma_is_null(vma)) {
>  			snap->snap[i].flags |= XE_VM_SNAP_FLAG_IS_NULL;
> +			snap->snap[i].uapi_mem_region = -1;
>  		} else {
>  			snap->snap[i].data = ERR_PTR(-ENOENT);
> +			snap->snap[i].uapi_mem_region = -1;
>  		}
>  		i++;
>  	}
> @@ -3841,13 +3857,16 @@ void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p)
>  	for (i = 0; i < snap->num_snaps; i++) {
>  		drm_printf(p, "[%llx].length: 0x%lx\n", snap->snap[i].ofs, snap->snap[i].len);
>  
> -		drm_printf(p, "[%llx].properties: %s|%s\n", snap->snap[i].ofs,
> +		drm_printf(p, "[%llx].properties: %s|%s|mem_region=0x%lx\n",
> +			   snap->snap[i].ofs,
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_READ_ONLY ?
>  			   "read_only" : "read_write",
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_IS_NULL ?
>  			   "null_sparse" :
>  			   snap->snap[i].flags & XE_VM_SNAP_FLAG_USERPTR ?
> -			   "userptr" : "bo");
> +			   "userptr" : "bo",
> +			   snap->snap[i].uapi_mem_region == -1 ? 0 :
> +			   BIT(snap->snap[i].uapi_mem_region));
>  
>  		if (IS_ERR(snap->snap[i].data)) {
>  			drm_printf(p, "[%llx].error: %li\n", snap->snap[i].ofs,

Kind regards,
~Maarten
