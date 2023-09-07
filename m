Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A1DEE14DE
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 10:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E1310E228;
	Thu,  7 Sep 2023 10:23:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5961F10E228
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694082223; x=1725618223;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=RLw+2LnQFhfDWqx5xmBtHYOxjmpQVVgmstdFErriiyA=;
 b=n55vJvQVV2eX45asLHN/Fd7rsVCXpycckkfjISEH+MFz5Mzt7UVoFgoh
 EY+O4nkf4s85XYTAQvjV95JZNN+J/blBDdwV5eURR22JodCnWxfG59xFO
 WfYAgOyYLQsNTCllcxx6isL4ZCOQkLnE3JXdr9dbvm0gPwMWxHpqos8K/
 ZMkiZ8+kWqoaeKhJSDBKOlm5mNmBZBucPdM+4G6EEaT7ZWlKNa6xEgkPt
 6CtL5GVGel/I0VP2TvIzmby/LIoHUrHN5HNNBZk1HBEBXfiV+8vY/s1X/
 1wCo5VgiK5d5BNC06eW25493X35cgtPx+TjjsOpbxs5kGU2InbsHoSuMs Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="356796767"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="356796767"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 03:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="777021501"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="777021501"
Received: from lsilistr-mobl.ger.corp.intel.com (HELO [10.249.254.23])
 ([10.249.254.23])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 03:23:41 -0700
Message-ID: <817a5968-f4b6-56e3-0dbb-12d91ecda02d@linux.intel.com>
Date: Thu, 7 Sep 2023 12:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <ZPiSbH39eeMoNOQ2@fdugast-desk.home>
 <20230906181632.342494-1-rodrigo.vivi@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230906181632.342494-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Typo lingo and other small
 backwards compatible fixes.
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


On 9/6/23 20:16, Rodrigo Vivi wrote:
> Fix typos, lingo and other small things identified during uapi
> review.
>
> v2: Also fix ALIGNMENT typo at xe_query.c
> v3: Do not touch property to get/set. (Francois)
>
> Link: https://lore.kernel.org/all/863bebd0c624d6fc2b38c0a06b63e468b4185128.camel@linux.intel.com/
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c |  2 +-
>   include/uapi/drm/xe_drm.h     | 19 ++++++++++---------
>   2 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 1db77a7c9039..c3d396904c7b 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -195,7 +195,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
>   		config->info[XE_QUERY_CONFIG_FLAGS] =
>   			XE_QUERY_CONFIG_FLAGS_HAS_VRAM;
> -	config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT] =
> +	config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>   	config->info[XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>   	config->info[XE_QUERY_CONFIG_GT_COUNT] = xe->info.gt_count;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..902b5c4f3f5c 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -256,7 +256,7 @@ struct drm_xe_query_config {
>   #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>   #define XE_QUERY_CONFIG_FLAGS			1
>   	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> -#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
> +#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define XE_QUERY_CONFIG_VA_BITS			3
>   #define XE_QUERY_CONFIG_GT_COUNT		4
>   #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> @@ -449,7 +449,6 @@ struct drm_xe_gem_create {
>   	 * If a VM is specified, this BO must:
>   	 *
>   	 *  1. Only ever be bound to that VM.
> -	 *
>   	 *  2. Cannot be exported as a PRIME fd.
>   	 */
>   	__u32 vm_id;
> @@ -489,7 +488,7 @@ struct drm_xe_gem_mmap_offset {
>    * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
>    */
>   struct drm_xe_vm_bind_op_error_capture {
> -	/** @error: errno that occured */
> +	/** @error: errno that occurred */
>   	__s32 error;
>   
>   	/** @op: operation that encounter an error */
> @@ -609,7 +608,7 @@ struct drm_xe_vm_bind_op {
>   	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
>   	 * Once the user sees the error (via a ufence +
>   	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> -	 * via non-async unbinds, and then restart all queue'd async binds op via
> +	 * via non-async unbinds, and then restart all queued async binds op via
>   	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
>   	 * VM.
>   	 *
> @@ -620,7 +619,7 @@ struct drm_xe_vm_bind_op {
>   #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
>   	/*
>   	 * Valid on a faulting VM only, do the MAP operation immediately rather
> -	 * than differing the MAP to the page fault handler.
> +	 * than deferring the MAP to the page fault handler.
>   	 */
>   #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>   	/*
> @@ -907,7 +906,7 @@ struct drm_xe_mmio {
>   /**
>    * struct drm_xe_wait_user_fence - wait user fence
>    *
> - * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> + * Wait on user fence, XE will wake-up on every HW engine interrupt in the
>    * instances list and check if user fence is complete::
>    *
>    *	(*addr & MASK) OP (VALUE & MASK)
> @@ -1039,9 +1038,11 @@ struct drm_xe_vm_madvise {
>   	 */
>   #define DRM_XE_VM_MADVISE_PRIORITY		5
>   #define		DRM_XE_VMA_PRIORITY_LOW		0
> -#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
> -#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> -	/* Pin the VMA in memory, must be elevated user */
> +		/* Default */
> +#define		DRM_XE_VMA_PRIORITY_NORMAL	1
> +		/* Must be user with elevated privileges */
> +#define		DRM_XE_VMA_PRIORITY_HIGH	2
> +	/* Pin the VMA in memory, must be user with elevated privileges */
>   #define DRM_XE_VM_MADVISE_PIN			6
>   	/** @property: property to set */
>   	__u32 property;

LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>



