Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB60C36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 16:20:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CAA10E05C;
	Fri,  4 Apr 2025 16:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcZOaYTe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5512410E1DF
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Apr 2025 16:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743783644; x=1775319644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ihaistmTKpO+PSiVH9xBszKogB2KVFRGJKs0mNMAKi8=;
 b=FcZOaYTeDnrKNZQVdZ1aMM9p2MburbNE1Fu9uzZgUBufYRP2xs1LSMtk
 /CNws/NV69VrHPNtVzSG9TiyxHAuwNsepDWVIZDT9u5o5WUxALQcOMxbU
 IDRKsfIbcrSP8XIVja2yqH6LAGGKorfAkcibBhFunybA9xSvMWqJYxwO0
 8IG4j/7z3IDlPBuSB6+liPB1CuTD/Cjo6qjgKqT4n9woFZa9pGzGtxKh2
 tuzqvKSPz1NgUAX8rLW0kVBNSN3ZRR237GXq2Hs5CvdbnE9UT48yLN4Sv
 VUo3Rpz/REtWKx/ZlgahgIPfN1SKCXmYM6tl7NCcv9Y3L88ZmGG4DrsoM Q==;
X-CSE-ConnectionGUID: MdrTr7c/RXeQEf5BCfPmyw==
X-CSE-MsgGUID: eWh/6cEaREu9SZxmPPrtmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="48880681"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="48880681"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 09:20:32 -0700
X-CSE-ConnectionGUID: Gofe+hwKSfi1z6aA/AJCLg==
X-CSE-MsgGUID: OiPhQma7Qx2APcLoCkfjCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="132557001"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 04 Apr 2025 09:20:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Apr 2025 19:20:29 +0300
Date: Fri, 4 Apr 2025 19:20:29 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v5 14/16] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Message-ID: <Z_AGzT44PmAp9JFk@intel.com>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
 <20250403190317.6064-15-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403190317.6064-15-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
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

On Thu, Apr 03, 2025 at 08:03:14PM +0100, Tvrtko Ursulin wrote:
> Even though frame buffer objects are created as write-combined, in
> practice, on top of all the ring buffer flushing, an additional clflush
> seems to be needed before display engine can coherently scan out the
> AuxCCS compressed data without transient artifacts.
> 
> If for comparison we look at how i915 handles things (where AuxCCS works
> fine), as it happens it has this same clflush before a frame buffer is
> pinned for display for the first time, courtesy the dynamic tracking of
> the buffer cache mode and setting the latter to uncached before handing
> to display.
> 
> Since xe considers the buffer object caching mode as static we can
> implement the same approach by adding a flag telling us if the buffer
> was ever pinned for display and flush on the first pin. Subsequent re-pins
> will not repeat the clflush but so far I have not observed any glitching
> after the first pin.

This doesn't make any sense to me. If you need a cflush for this 
then you should need a clflush for all framebuffers.

So feels like there's some kind of coherency bug somewhere. What
that would be I'm not sure. Eg. I don't recall there being a separate
MOCS field for aux. And clearly if you just have to do this for the
first pin then we must be using correct UC accesses for subsequent
rendering.

intel_fb_bo_framebuffer_init() also seems to have some hacks for
the case when the SCANOUT flag wasn't already set at time of
creation, but it doesn't do anything with caching stuff AFAICS.
So if you create a bo w/o the SCANOUT flag, dirty the caches,
and then feed it to the display do you see the cache dirt?

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>  2 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d11a003880dc..13030fd2728a 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -332,6 +332,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	struct i915_vma *vma = kzalloc(sizeof(*vma), GFP_KERNEL);
>  	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
> +	bool first_pin;
>  	int ret;
>  
>  	if (!vma)
> @@ -363,6 +364,9 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	if (ret)
>  		goto err;
>  
> +	first_pin = !bo->display_pin;
> +	bo->display_pin = true;
> +
>  	if (IS_DGFX(xe))
>  		ret = xe_bo_migrate(bo, XE_PL_VRAM0);
>  	else
> @@ -383,6 +387,15 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  
>  	/* Ensure DPT writes are flushed */
>  	xe_device_l2_flush(xe);
> +
> +	/*
> +	 * Force flush frame buffer data for non-coherent display access when
> +	 * AuxCCS formats are used.
> +	 */
> +	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
> +	    intel_fb_is_ccs_modifier(fb->base.modifier))
> +		drm_clflush_sg(xe_bo_sg(bo));
> +
>  	return vma;
>  
>  err_unpin:
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 15a92e3d4898..b900cb290b01 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -68,11 +68,6 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @update_index: Update index if PT BO */
>  	int update_index;
> -	/** @created: Whether the bo has passed initial creation */
> -	bool created;
> -
> -	/** @ccs_cleared */
> -	bool ccs_cleared;
>  
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> @@ -84,6 +79,15 @@ struct xe_bo {
>  	/** @devmem_allocation: SVM device memory allocation */
>  	struct drm_gpusvm_devmem devmem_allocation;
>  
> +	/** @created: Whether the bo has passed initial creation */
> +	bool created : 1;
> +
> +	/** @ccs_cleared */
> +	bool ccs_cleared : 1;
> +
> +	/** @display_pin: Was it ever pinned to display */
> +	bool display_pin : 1;
> +
>  	/** @vram_userfault_link: Link into @mem_access.vram_userfault.list */
>  		struct list_head vram_userfault_link;
>  
> -- 
> 2.48.0

-- 
Ville Syrjälä
Intel
