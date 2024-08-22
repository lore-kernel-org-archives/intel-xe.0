Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439C8C52D7C
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 12:12:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FAB410E9E2;
	Thu, 22 Aug 2024 12:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrisN8h5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8A010E89F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724328761; x=1755864761;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5HvboVK5J4HJfnFcAqYBmXh7BosLPZEtGeZsLp/2phM=;
 b=XrisN8h5bhsKGY2+sRQwSB0CH/azbtoesl5ns+GGC7Okx7yXZ5/3G9xN
 2LnOcSb/QCcAhF8g6rLUShai43NgTWQAbbLrVAWBHL4yPbWkw6x4IAF9a
 gUx0OzmnEZWXFUW6CtaGOwVNzbueyoFq9HEQODylIdj8b/3q8utkp8R8R
 fNNWFpLAYBHezigsfYg9z4ArLuKNbXrVktLG/1XSFKdYrGmA11mNjd5R1
 4dKtdsZ2XQEchXVTx5PuPeupb6dXdLToxKIeUheZGYyvJSNptrXxcGbkX
 aCfA3wr1nEOm94TRHpO0bOMhuHtvbXRu9kl3P5riuy2dafiFcrURTmIN3 A==;
X-CSE-ConnectionGUID: IQJilax6SHCE1T3+qjp4Gw==
X-CSE-MsgGUID: NDzRmjoFRkezJoeEwKZmjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22341553"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22341553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:12:35 -0700
X-CSE-ConnectionGUID: fdYPt6EkQciBTh9Ky2u5eg==
X-CSE-MsgGUID: x81mLj+ASPWn04b9bPofqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61274712"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 05:12:33 -0700
Date: Thu, 22 Aug 2024 14:12:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Align all 64k VRAM buffers physically
 when multiple of 64k.
Message-ID: <20240822121230.bwkl5txsawu3tkn6@zkempczy-mobl2>
References: <20240821205637.552424-1-maarten.lankhorst@linux.intel.com>
 <20240821205637.552424-2-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240821205637.552424-2-maarten.lankhorst@linux.intel.com>
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

On Wed, Aug 21, 2024 at 10:56:35PM +0200, Maarten Lankhorst wrote:
> For CCS formats on affected platforms, CCS can be used freely, but
> display engine requires a multiple of 64k physical pages. No other
> changes are needed.
> 
> At the BO creation time we don't know if the BO will be used for CCS
> or not. If the scanout flag is set, and the BO is a multiple of 64k,
> we take the safe route and force the physical alignment of 64k pages.
> 
> If the BO is not a multiple of 64k, or the scanout flag was not set
> at BO creation, we reject it for usage as CCS in display. The physical
> pages are likely not aligned correctly, and this will cause corruption
> when used as FB.
> 
> This is a slightly different approach from my previous patch. Instead
> of requiring a scanout flag at FB creation, we now make all buffers of
> the right size physically aligned correctly, so no change from userspace
> is needed.
> 
> It will be interesting to see if it affects performance in any way,
> could potentially even improve things with 64k PTE's.
> 
> Inspired by Zbigniews patch.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> ---
>  drivers/gpu/drm/xe/display/intel_fb_bo.c |  6 ++++++
>  drivers/gpu/drm/xe/xe_bo.c               | 10 ++++++++++
>  drivers/gpu/drm/xe/xe_device_types.h     |  1 +
>  drivers/gpu/drm/xe/xe_vm.c               |  3 ++-
>  4 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> index f835492f73fb4..407367719abe2 100644
> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> @@ -7,6 +7,7 @@
>  #include <drm/ttm/ttm_bo.h>
>  
>  #include "intel_display_types.h"
> +#include "intel_fb.h"
>  #include "intel_fb_bo.h"
>  #include "xe_bo.h"
>  
> @@ -28,6 +29,11 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
>  	struct xe_device *xe = to_xe_device(bo->ttm.base.dev);
>  	int ret;
>  
> +	if (XE_IOCTL_DBG(xe, intel_fb_is_ccs_modifier(mode_cmd->modifier[0]) &&
> +			     (xe->info.vram_flags & XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS) &&
> +			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))
> +		return -EINVAL;

Sth is wrong with intel_fb_is_ccs_modifier(), it is returning false for
kms_ccs crc-primary-basic-4-tiled-bmg-ccs subtest and is not falling
here.

--
Zbigniew

> +>  	xe_bo_get(bo);
>  
>  	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6ed0e19552159..3a753f4644cb6 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2017,6 +2017,16 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
>  		bo_flags |= XE_BO_FLAG_SCANOUT;
>  
> +	/*
> +	 * Lets see what happens if we simply align any buffer that's
> +	 * a multiple of 64k to 64k in places where it's not officially
> +	 * needed.
> +	 */
> +	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
> +	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
> +	    !(args->size % SZ_64K))
> +		bo_flags |= XE_BO_FLAG_NEEDS_64K;
> +
>  	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
>  
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5ed6f5434f42c..12ddab91a01c0 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -47,6 +47,7 @@ struct xe_pat_ops;
>  #define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
>  
>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
> +#define XE_VRAM_FLAGS_DISPLAY_NEED64K_CCS	BIT(1)
>  
>  #define XE_GT0		0
>  #define XE_GT1		1
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d1bfd0b6e9558..af215f6d6588b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2878,7 +2878,8 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>  		return -EINVAL;
>  	}
>  
> -	if (bo->flags & XE_BO_FLAG_INTERNAL_64K) {
> +	if ((bo->flags & XE_BO_FLAG_INTERNAL_64K) &&
> +	    (xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)) {
>  		if (XE_IOCTL_DBG(xe, obj_offset &
>  				 XE_64K_PAGE_MASK) ||
>  		    XE_IOCTL_DBG(xe, addr & XE_64K_PAGE_MASK) ||
> -- 
> 2.45.2
> 
