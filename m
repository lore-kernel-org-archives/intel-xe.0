Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1895FEE57EE
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 10:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9754B10E04B;
	Fri,  8 Sep 2023 10:07:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4C010E04B;
 Fri,  8 Sep 2023 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694167674; x=1725703674;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4FRnbXwRFVc9NTHNqBqgIVfukQjyomn9/myiAjKVo74=;
 b=aSU0plMpf6ndgmI5r5NONDguDuW8TWymsgXb7kHoNyaD+KQNb9ZlS+yQ
 FcynJxW84SdXoNucIGX3qAB8UX3CgABeK9OVSWFg1w36nUGnCaqVgNfK3
 ReodWy4K8ph2Yp06uxfNsiVqOXtiJW9KwShrzXlR5Ept+tCl53d9/b3Z1
 b9TALNMLU4IcZ+O6S1OW9CNH2/vFtzdGtAPtpSg9fNKlj4xR1ZXA2Euiu
 FMX8M478SNJKf3r6BopcAD0mAibUuIG/P7EyjU01J3dhkFi9JvZCMFimN
 4vy1x6dCaS3ikepP2ip7t3UjtnjegYunMIGL3JBlr+gtuSoGpaj+9acsF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="362676586"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="362676586"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 03:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="885616972"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="885616972"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 03:07:32 -0700
Date: Fri, 8 Sep 2023 12:07:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230908100746.qsclr4wwmyvuka3f@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>
References: <20230901112158.nnctj5rt2yiimibx@kamilkon-desk.igk.intel.com>
 <20230907214358.399918-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230907214358.399918-1-rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH i-g-t] drm-uapi/xe_drm: Remove max_page_size
 and align with latest uapi.
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 2023-09-07 at 17:43:58 -0400, Rodrigo Vivi wrote:

one small nit just spotted, remove last dot '.' from end of Subject:

[PATCH i-g-t] drm-uapi/xe_drm: Remove max_page_size and align with latest uapi.
----------------------------------------------------------------------------- ^

You may keep my a-b with that.

Regards,
Kamil

> Align with commit ("drm/xe/uapi: Remove useless max_page_size")
> 
> v2: Rebase.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  include/drm-uapi/xe_drm.h | 23 ++++++++++-------------
>  tests/intel/xe_query.c    |  9 ++++-----
>  2 files changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index d1d49cd71..804c02270 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -174,10 +174,6 @@ struct drm_xe_query_mem_region {
>  	 * kernel.
>  	 */
>  	__u32 min_page_size;
> -	/**
> -	 * @max_page_size: Max page-size in bytes for this region.
> -	 */
> -	__u32 max_page_size;
>  	/**
>  	 * @total_size: The usable size in bytes for this region.
>  	 */
> @@ -256,7 +252,7 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define XE_QUERY_CONFIG_FLAGS			1
>  	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> -#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
> +#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> @@ -449,7 +445,6 @@ struct drm_xe_gem_create {
>  	 * If a VM is specified, this BO must:
>  	 *
>  	 *  1. Only ever be bound to that VM.
> -	 *
>  	 *  2. Cannot be exported as a PRIME fd.
>  	 */
>  	__u32 vm_id;
> @@ -489,7 +484,7 @@ struct drm_xe_gem_mmap_offset {
>   * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
>   */
>  struct drm_xe_vm_bind_op_error_capture {
> -	/** @error: errno that occured */
> +	/** @error: errno that occurred */
>  	__s32 error;
>  
>  	/** @op: operation that encounter an error */
> @@ -609,7 +604,7 @@ struct drm_xe_vm_bind_op {
>  	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
>  	 * Once the user sees the error (via a ufence +
>  	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> -	 * via non-async unbinds, and then restart all queue'd async binds op via
> +	 * via non-async unbinds, and then restart all queued async binds op via
>  	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
>  	 * VM.
>  	 *
> @@ -620,7 +615,7 @@ struct drm_xe_vm_bind_op {
>  #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
> -	 * than differing the MAP to the page fault handler.
> +	 * than deferring the MAP to the page fault handler.
>  	 */
>  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>  	/*
> @@ -907,7 +902,7 @@ struct drm_xe_mmio {
>  /**
>   * struct drm_xe_wait_user_fence - wait user fence
>   *
> - * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> + * Wait on user fence, XE will wake-up on every HW engine interrupt in the
>   * instances list and check if user fence is complete::
>   *
>   *	(*addr & MASK) OP (VALUE & MASK)
> @@ -1039,9 +1034,11 @@ struct drm_xe_vm_madvise {
>  	 */
>  #define DRM_XE_VM_MADVISE_PRIORITY		5
>  #define		DRM_XE_VMA_PRIORITY_LOW		0
> -#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
> -#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> -	/* Pin the VMA in memory, must be elevated user */
> +		/* Default */
> +#define		DRM_XE_VMA_PRIORITY_NORMAL	1
> +		/* Must be user with elevated privileges */
> +#define		DRM_XE_VMA_PRIORITY_HIGH	2
> +	/* Pin the VMA in memory, must be user with elevated privileges */
>  #define DRM_XE_VM_MADVISE_PIN			6
>  	/** @property: property to set */
>  	__u32 property;
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 8ec849130..c540e3351 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -228,9 +228,8 @@ test_query_mem_usage(int fd)
>  			mem_usage->regions[i].used,
>  			mem_usage->regions[i].total_size
>  		);
> -		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
> -		       mem_usage->regions[i].min_page_size,
> -		       mem_usage->regions[i].max_page_size);
> +		igt_info("min_page_size=0x%x\n",
> +		       mem_usage->regions[i].min_page_size);
>  
>  		igt_info("visible size=%lluMiB\n",
>  			 mem_usage->regions[i].cpu_visible_size >> 20);
> @@ -375,8 +374,8 @@ test_query_config(int fd)
>  	igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
>  		config->info[XE_QUERY_CONFIG_FLAGS] &
>  		XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
> -	igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
> -		config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
> +	igt_info("XE_QUERY_CONFIG_MIN_ALIGNMENT\t\t%#llx\n",
> +		config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT]);
>  	igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
>  		config->info[XE_QUERY_CONFIG_VA_BITS]);
>  	igt_info("XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
> -- 
> 2.41.0
> 
