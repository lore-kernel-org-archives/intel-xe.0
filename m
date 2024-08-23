Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9986C531DC
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 08:04:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C8910E167;
	Fri, 23 Aug 2024 08:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ulrf9IG8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CEB810E167
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724400297; x=1755936297;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Oi9dR7gpGD3SKRA8eBCj1jcnAd46eZlyEhifL77MkIc=;
 b=Ulrf9IG8NYGNuXWH8h2nPN7oMtgsy8215a3G1L5o7Uwy8FscOFMh5TY4
 F2UIAS/anh5e5qvPcOJZBjr7wbZS8lFaA8+MYV2aGioUycsI2TWtwG1Ey
 zzehA1KJfxSJS7cn6GZeKSqp1zB03TqKR1N2hbXXN2+R7G8N9X6qW+Gnu
 X2ns3dS53QiW0U/AL1RC6gdUMEv6FZ3w9L2cbX3nRzD/X+BdcJhxIkaUg
 BUt70iFsWXdMfm1/Z3eD/QJi8wBf0Z40+Z6f9p+MvMlwufKDlTUStPiRF
 HKgBztWZHh71jUWBmUTvObCXGHSDOPfBLpJ72EMLR3aCzlV8Xi+B21i2y A==;
X-CSE-ConnectionGUID: liJZG/9WTBKEfiBV98optg==
X-CSE-MsgGUID: sP1uyu5aS6msscyATJ/psQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="34273040"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="34273040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 01:04:56 -0700
X-CSE-ConnectionGUID: lkCehV5DT0q2Cfisa5C6Xw==
X-CSE-MsgGUID: S2t7e+5LS6GrcaFMSjGoIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; d="scan'208";a="65930641"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.209])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 01:04:53 -0700
Date: Fri, 23 Aug 2024 10:04:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Juha-Pekka =?utf-8?B?SGVpa2tpbMOk?= <juha-pekka.heikkila@intel.com>
Subject: Re: [PATCH v4] drm/xe: Align all VRAM scanout buffers to 64k
 physical pages when needed.
Message-ID: <20240823080450.smmkbe44ctcbkh7n@zkempczy-mobl2>
References: <20240822174202.827626-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822174202.827626-1-maarten.lankhorst@linux.intel.com>
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

On Thu, Aug 22, 2024 at 07:42:02PM +0200, Maarten Lankhorst wrote:
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

I think last sentence is not true according to the code. Please adopt
the commit message according to the patch as you're limiting 64K
contiguous allocations to scanout buffers only.

> 
> Inspired by Zbigniews patch.

Rodrigo asked to remove this line.

> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Co-developed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
> ---
>  drivers/gpu/drm/xe/display/intel_fb_bo.c | 5 +++++
>  drivers/gpu/drm/xe/xe_bo.c               | 7 +++++++
>  drivers/gpu/drm/xe/xe_vm.c               | 3 ++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_fb_bo.c b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> index f835492f73fb4..6775c2557b9df 100644
> --- a/drivers/gpu/drm/xe/display/intel_fb_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_fb_bo.c
> @@ -28,6 +28,11 @@ int intel_fb_bo_framebuffer_init(struct intel_framebuffer *intel_fb,
>  	struct xe_device *xe = to_xe_device(bo->ttm.base.dev);
>  	int ret;
>  
> +	/* Only this specific format is affected, and it's only available on VRAM */
> +	if (XE_IOCTL_DBG(xe, mode_cmd->modifier[0] == I915_FORMAT_MOD_4_TILED_BMG_CCS &&
> +			     !(bo->flags & XE_BO_FLAG_NEEDS_64K)))
> +		return -EINVAL;

What I don't like here is hardcoded modifier. I see there's
dedicated ccs struct inside intel_modifier_desc. Maybe we could
add a field which would indicate display ccs 64k check required
and set it to true for I915_FORMAT_MOD_4_TILED_BMG_CCS? It seems
in the future we likely will have more platforms with same display
requirement, so adding modifier there will be enough and we won't
need to alter the above code to handle another exception.

Apart of above code works as expected, I tested it on !aligned
to 64K framebuffer and it was rejected as expected.

--
Zbigniew

> +
>  	xe_bo_get(bo);
>  
>  	ret = ttm_bo_reserve(&bo->ttm, true, false, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 6ed0e19552159..a7f48d971f4cf 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2019,6 +2019,13 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>  
>  	bo_flags |= args->placement << (ffs(XE_BO_FLAG_SYSTEM) - 1);
>  
> +	/* CCS formats need physical placement at a 64K alignment in VRAM. */
> +	if ((bo_flags & XE_BO_FLAG_VRAM_MASK) &&
> +	    (bo_flags & XE_BO_FLAG_SCANOUT) &&
> +	    !(xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K) &&
> +	    !(args->size % SZ_64K))
> +		bo_flags |= XE_BO_FLAG_NEEDS_64K;
> +
>  	if (args->flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM) {
>  		if (XE_IOCTL_DBG(xe, !(bo_flags & XE_BO_FLAG_VRAM_MASK)))
>  			return -EINVAL;
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
