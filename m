Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EF0CA0FE1
	for <intel-xe@archiver.kernel.org>; Fri,  1 Sep 2023 11:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B461A10E785;
	Fri,  1 Sep 2023 11:22:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C02F10E785;
 Fri,  1 Sep 2023 11:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693567327; x=1725103327;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XkGeU32BfC+YpEWU7rrKKtSzhywTeJf8baZnuSgVk2c=;
 b=W4ITiN5XKHPxF0TokFNE/B5pf4Gc1bi3d8W7aMtt6UB1vDm03gtj7eZX
 RYWAoddJL/T7k/mElONi3J1ILV4Mzk2Ot/WVlaDAT1ckJrOYjh9LMkERy
 iOt29CI2nvyzH5NESZgpb+JKP4sMf98aea42ILUb9m1tlF1aV7TzPZF6O
 MKadEclC2OxrTFMZ5QLzAg8c8FnWZ3qWwBMH9vul8CgmMGjo4biFe5gQ0
 XBeOv4lbHaTTKU/c4tsv4sIT4SqCFI3tTZYEchTWgsPuFR+r3C681L1YW
 y6voM5LrFZsq2pbSkxgTKuHhIOYtjes7TrDexD8z1qzt3S97ksCjXKqD9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442593343"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="442593343"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 04:22:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="830091266"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; d="scan'208";a="830091266"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmsmga003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 04:22:01 -0700
Date: Fri, 1 Sep 2023 13:21:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230901112158.nnctj5rt2yiimibx@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230830214719.113454-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230830214719.113454-1-rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [igt-dev] [PATCH i-g-t] drm-uapi/xe_drm: Remove
 max_page_size and align with latest uapi.
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Rodrigo,
On 2023-08-30 at 17:47:19 -0400, Rodrigo Vivi wrote:
> Align with commit ("drm/xe/uapi: Remove useless max_page_size")
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 27 ++++++++++++---------------
>  tests/xe/xe_query.c       |  9 ++++-----
>  2 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index d1d49cd71..c78abc6ae 100644
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
> @@ -727,7 +722,7 @@ struct drm_xe_exec_queue_set_property {
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> -	/** @property: property to set */
> +	/** @property: property to be set */
>  	__u32 property;
>  
>  	/** @value: property value */
> @@ -796,7 +791,7 @@ struct drm_xe_exec_queue_get_property {
>  	__u32 exec_queue_id;
>  
>  #define XE_EXEC_QUEUE_GET_PROPERTY_BAN			0
> -	/** @property: property to get */
> +	/** @property: property to be gotten */
>  	__u32 property;
>  
>  	/** @value: property value */
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
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index a4e40afdd..afdfe282b 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -227,9 +227,8 @@ test_query_mem_usage(int fd)
>  			mem_usage->regions[i].used,
>  			mem_usage->regions[i].total_size
>  		);
> -		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
> -		       mem_usage->regions[i].min_page_size,
> -		       mem_usage->regions[i].max_page_size);
> +		igt_info("min_page_size=0x%x\n",
> +			 mem_usage->regions[i].min_page_size);
>  
>  		igt_info("visible size=%lluMiB\n",
>  			 mem_usage->regions[i].cpu_visible_size >> 20);
> @@ -371,8 +370,8 @@ test_query_config(int fd)
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
