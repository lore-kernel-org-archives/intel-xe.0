Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4746E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 13:30:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6E110E6DB;
	Thu, 19 Feb 2026 13:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsCWFxLb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DEB10E6DB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771507842; x=1803043842;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/NyhkVjIhi7BiHwahjRdMdsrI1JyTB3+7uzND7EX2vw=;
 b=TsCWFxLbKU8T9Q0xOJzKcHlsqjLI8IRFeDT0xLRjP2MoIEfVmo0jx9ZP
 Fd02jfsrV9Yqka00ubVxNy1/6cN5ASi6nyRlvo+exrOmZKDWVobPm4+/1
 ymM8ujI0N+T15VzkxcMcNjHAXtrDIK16184bykbdVvsvLFvdHsUeryd+V
 aifLPutGiKffGEs7ePxn9rxorXhk7qf6rxjGwSrxgTaI6/U5UDR+xinMS
 IKN14dug4lN1Izqa8mE521s72A0pPN6DWS48pR6Pd5tQquuafsneMwcCU
 MgEGIJ1clV3bElhEMoyy4NoD/3TuOHD0w4dvdukd/W0TIYoJwIZYSYNJM A==;
X-CSE-ConnectionGUID: dgtIMdbgTrmgF2hMmBlVmg==
X-CSE-MsgGUID: KwdHWH34Sdqw/JEXn6kjow==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83311596"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="83311596"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:30:41 -0800
X-CSE-ConnectionGUID: uW0jmy9GRbKdVUsPebB1lw==
X-CSE-MsgGUID: OV9f3eWNQHiMi+FdOOfylg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213183647"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.244.167])
 ([10.245.244.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 05:30:40 -0800
Message-ID: <073a3aa0-e070-420a-a229-15e51a379a54@intel.com>
Date: Thu, 19 Feb 2026 13:30:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/4] drm/xe/xe3p_lpg: Enable L2 flush optimization
 feature
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
Cc: thomas.hellstrom@linux.intel.com
References: <20260219113743.1588081-6-tejas.upadhyay@intel.com>
 <20260219113743.1588081-9-tejas.upadhyay@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260219113743.1588081-9-tejas.upadhyay@intel.com>
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

On 19/02/2026 11:37, Tejas Upadhyay wrote:
> When set, the L2 flush optimization feature will control
> whether L2 is in Persistent or Transient mode through
> monitoring of media activity.
> 
> To enable L2 flush optimization include new feature flag
> GUC_CTL_ENABLE_L2FLUSH_OPT for Novalake platforms when
> media type is detected.
> 
> Also, restrict userptr, svm and dmabuf mappings to be
> either 2WAY or XA+1WAY
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c        | 3 +++
>   drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
>   drivers/gpu/drm/xe/xe_vm.c         | 7 +++++++
>   drivers/gpu/drm/xe/xe_vm_madvise.c | 4 ++++
>   4 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index cbbb4d665b8f..97c33c3dd520 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -98,6 +98,9 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>   	if (xe_guc_using_main_gamctrl_queues(guc))
>   		flags |= GUC_CTL_MAIN_GAMCTRL_QUEUES;
>   
> +	if (GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe) && xe_gt_is_media_type(guc_to_gt(guc)))
> +		flags |= GUC_CTL_ENABLE_L2FLUSH_OPT;
> +
>   	return flags;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index a33ea288b907..39ff7b3e960b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -67,6 +67,7 @@ struct guc_update_exec_queue_policy {
>   #define   GUC_CTL_ENABLE_PSMI_LOGGING	BIT(7)
>   #define   GUC_CTL_MAIN_GAMCTRL_QUEUES	BIT(9)
>   #define   GUC_CTL_DISABLE_SCHEDULER	BIT(14)
> +#define   GUC_CTL_ENABLE_L2FLUSH_OPT	BIT(15)
>   
>   #define GUC_CTL_DEBUG			3
>   #define   GUC_LOG_VERBOSITY		REG_GENMASK(1, 0)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c06fd250e037..091825a34138 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3474,6 +3474,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
> +		    XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
> +				 (op == DRM_XE_VM_BIND_OP_MAP_USERPTR ||
> +				  /* dmabuf */
> +				  op == DRM_XE_VM_BIND_OP_MAP ||

This is not really dma-buf, but rather all BOs. You likely need to add 
something in xe_vm_bind_ioctl_validate_bo(), checking for dma-buf. See 
the coh checks, for example.

> +				  /* svm */
> +				  op == (DRM_XE_VM_BIND_OP_MAP && is_cpu_addr_mirror)) &&
> +				 (pat_index != 19 || coh_mode != XE_COH_2WAY)) ||
>   		    XE_IOCTL_DBG(xe, comp_en &&
>   				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
>   		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index 1a1ad8c07d49..e68ee5b092d6 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -304,6 +304,10 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>   		if (XE_WARN_ON(coh_mode > XE_COH_2WAY))
>   			return false;
>   
> +		if (XE_IOCTL_DBG(xe, xe_device_is_l2_flush_optimized(xe) &&
> +				 (pat_index != 19 || coh_mode != XE_COH_2WAY)))

I think you need to make this conditional on what the vma(s) are 
mapping? So dma-buf, userptr, svm and normal BOs?

> +			return false;
> +
>   		if (XE_IOCTL_DBG(xe, args->pat_index.pad))
>   			return false;
>   

