Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D935CED61A
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 11:28:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C749A10E481;
	Tue, 18 Nov 2025 11:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="We0xo41x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52B910E481
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 11:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763465281; x=1795001281;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mkvR/ZnfyB7xsNr6eCZyJDLrZnUjSoNOaYHUSBw1O6A=;
 b=We0xo41x0EnobvQS4c/+5SRgOK7sufku+VHiFQGtvCg7kiA7pmoVxVwq
 LgHYI03tVMBxS+2q+JjXaQNO+5YbaHzrUMyteA3/MM+XqYtqK3GHpymag
 sbi66J/meE2tqoOb2EP6Ux+qB66UHGg1wEdQwXJvowNbBgEZt/w5lZyLH
 5ALfMf9eN3qfo/KUNbSPyS4iK6BoS1Kljk84+JDt70QWU3PmJyWqa06e8
 wlmI8FJRqdZyEQT4dUt8kqNM1JiQ6VJxdocQmkq/2Ek64Bz89hmcPdM6z
 eTrr9Kvb5MTNfmLqF8L2ScB3tHMEVJ7Ilkul5PoXXml/ASQGvo/NdejfV Q==;
X-CSE-ConnectionGUID: ghwP126kQbGCkD6JVRBqAQ==
X-CSE-MsgGUID: e5farlDAQlKK7/v8F44tbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90959678"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="90959678"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:28:01 -0800
X-CSE-ConnectionGUID: gKCKHJ/6TpWJzJUN4qOSAQ==
X-CSE-MsgGUID: 1TCyf1WHSVSxDWDrCGDR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221393149"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.117])
 ([10.245.245.117])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:28:01 -0800
Message-ID: <cb1fa9b4-2457-48c4-a89d-186c3b8fea19@intel.com>
Date: Tue, 18 Nov 2025 11:27:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe/uapi: Add NO_COMPRESSION BO flag and query
 capability
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
References: <20251118111342.3366359-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251118111342.3366359-2-sanjay.kumar.yadav@intel.com>
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

On 18/11/2025 11:13, Sanjay Yadav wrote:
> Introduce DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION to let userspace
> opt out of CCS compression on a per-BO basis. When set, the driver
> maps this to XE_BO_FLAG_NO_COMPRESSION, skips CCS metadata
> allocation/clearing, and rejects compressed PAT indices at vm_bind.
> This avoids extra memory ops and manual CCS state handling for buffers.
> 
> To allow userspace to detect at runtime whether the kernel supports this
> feature, add DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT and expose
> it via query_config() on Xe2+ platforms.
> 
> Mesa PR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/38425
> IGT PR: https://patchwork.freedesktop.org/patch/685180/
> 
> v2
> - Changed error code from -EINVAL to -EOPNOTSUPP for unsupported flag
>    usage on pre-Xe2 platforms
> - Fixed checkpatch warning in xe_vm.c
> - Fixed kernel-doc formatting in xe_drm.h
> 
> v3
> - Rebase
> - Updated commit title and description
> - Added UAPI for DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT and
>    exposed it via query_config()
> 
> v4
> - Rebase
> 
> v5
> - Included Mesa PR and IGT PR in the commit description
> - Used xe_pat_index_get_comp_en() to extract the compression
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Suggested-by: José Roberto de Souza <jose.souza@intel.com>
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c    | 15 +++++++++++++--
>   drivers/gpu/drm/xe/xe_bo.h    |  1 +
>   drivers/gpu/drm/xe/xe_query.c |  3 +++
>   drivers/gpu/drm/xe/xe_vm.c    |  5 +++++
>   include/uapi/drm/xe_drm.h     | 16 ++++++++++++++++
>   5 files changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index b0bd31d14bb9..c969c2bc4249 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -3183,7 +3183,8 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	if (XE_IOCTL_DBG(xe, args->flags &
>   			 ~(DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>   			   DRM_XE_GEM_CREATE_FLAG_SCANOUT |
> -			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)))
> +			   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
> +			   DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION)))
>   		return -EINVAL;
>   
>   	if (XE_IOCTL_DBG(xe, args->handle))
> @@ -3205,6 +3206,12 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>   		bo_flags |= XE_BO_FLAG_SCANOUT;
>   
> +	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION) {
> +		if (GRAPHICS_VER(xe) < 20)

XE_IOCTL_DBG(), so if UMD triggers this we get something which will be 
easier to pinpoint.

> +			return -EOPNOTSUPP;
> +		bo_flags |= XE_BO_FLAG_NO_COMPRESSION;
> +	}
> +
>   	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
>   
>   	/* CCS formats need physical placement at a 64K alignment in VRAM. */
> @@ -3526,8 +3533,12 @@ bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>   	 * Compression implies coh_none, therefore we know for sure that WB
>   	 * memory can't currently use compression, which is likely one of the
>   	 * common cases.
> +	 * Additionally, userspace may explicitly request no compression via the
> +	 * DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION flag, which should also disable
> +	 * CCS usage.
>   	 */
> -	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB)
> +	if (bo->cpu_caching == DRM_XE_GEM_CPU_CACHING_WB ||
> +	    bo->flags & XE_BO_FLAG_NO_COMPRESSION)
>   		return false;
>   
>   	return true;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 911d5b90461a..8ab4474129c3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -50,6 +50,7 @@
>   #define XE_BO_FLAG_GGTT3		BIT(23)
>   #define XE_BO_FLAG_CPU_ADDR_MIRROR	BIT(24)
>   #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
> +#define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
>   
>   /* this one is trigger internally only */
>   #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 1c0915e2cc16..b392c9b3f0c9 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -342,6 +342,9 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>   	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
>   		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
> +	if (GRAPHICS_VER(xe) >= 20)
> +		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 7cac646bdf1c..0cf5f538a4aa 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3484,6 +3484,11 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   {
>   	u16 coh_mode;
>   
> +	/* Reject compressed PAT index for BO with NO_COMPRESSION flag */

Nit: This is already clear from the code IMO. So could potentially drop 
this comment.

> +	if ((bo->flags & XE_BO_FLAG_NO_COMPRESSION) &&
> +	    xe_pat_index_get_comp_en(xe, pat_index))

Also here XE_IOCTL_DBG().

Otherwise,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +		return -EINVAL;
> +
>   	if (XE_IOCTL_DBG(xe, range > xe_bo_size(bo)) ||
>   	    XE_IOCTL_DBG(xe, obj_offset >
>   			 xe_bo_size(bo) - range)) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 47853659a705..b9840cb77360 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -403,6 +403,9 @@ struct drm_xe_query_mem_regions {
>    *      has low latency hint support
>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR - Flag is set if the
>    *      device has CPU address mirroring support
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
> + *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
> + *      This is exposed only on Xe2+.
>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>    *    required by this device, typically SZ_4K or SZ_64K
>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -421,6 +424,7 @@ struct drm_xe_query_config {
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM	(1 << 0)
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -791,6 +795,17 @@ struct drm_xe_device_query {
>    *    need to use VRAM for display surfaces, therefore the kernel requires
>    *    setting this flag for such objects, otherwise an error is thrown on
>    *    small-bar systems.
> + *  - %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION - Allows userspace to
> + *    hint that compression (CCS) should be disabled for the buffer being
> + *    created. This can avoid unnecessary memory operations and CCS state
> + *    management.
> + *    On pre-Xe2 platforms, this flag is currently rejected as compression
> + *    control is not supported via PAT index. On Xe2+ platforms, compression
> + *    is controlled via PAT entries. If this flag is set, the driver will reject
> + *    any VM bind that requests a PAT index enabling compression for this BO.
> + *    Note: On dGPU platforms, there is currently no change in behavior with
> + *    this flag, but future improvements may leverage it. The current benefit is
> + *    primarily applicable to iGPU platforms.
>    *
>    * @cpu_caching supports the following values:
>    *  - %DRM_XE_GEM_CPU_CACHING_WB - Allocate the pages with write-back
> @@ -837,6 +852,7 @@ struct drm_xe_gem_create {
>   #define DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING		(1 << 0)
>   #define DRM_XE_GEM_CREATE_FLAG_SCANOUT			(1 << 1)
>   #define DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM	(1 << 2)
> +#define DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION		(1 << 3)
>   	/**
>   	 * @flags: Flags, currently a mask of memory instances of where BO can
>   	 * be placed

