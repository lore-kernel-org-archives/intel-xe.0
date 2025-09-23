Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A03C1CAC5B0
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 10:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB4510E5DD;
	Tue, 23 Sep 2025 10:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTEFj3hf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5BA10E5DD
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 10:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758622788; x=1790158788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+++57c5zlMPoTfLC4NDeM9x/214hH7RUGr2oseq4K88=;
 b=eTEFj3hf3i46wJMbpRMbVFWLxL6QwL8Lu3v7OtPqaxoxIwIMHjgyiRBn
 dfUGigL3Xwc25X4UlkspLyAYLSUNKXThZDSzfpy4YThKG6cgRa9YBBOHg
 5GNmI5zgM1bVIMmILDJjqufDaaxmfbD8fwOVuoXi/L7fpkn0ePo91jEXB
 5+K59ngKQodOWOnFjhD5R04nMfjoPWkJmsxr8bUHzP/Pe7c5TesKcW/gH
 B9QXoK01ii39cck1Fy2oK0v82J+5x9n8brjPa8PkKeLpDzBii8PFDVMcq
 c1n19FkFN10uA8jYLkNk13lrjdFk7/z6HiOkPHWiFnj/CG+tyw+IxvDgo Q==;
X-CSE-ConnectionGUID: K52k/OVyR/mKtjL9K/W0eg==
X-CSE-MsgGUID: tyGgK27cQO+1CPs6GHbxtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63527498"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="63527498"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 03:19:48 -0700
X-CSE-ConnectionGUID: 5lxkmSiRSi2p5M2H8x8Mkw==
X-CSE-MsgGUID: H3pavPtESx6Do6T6Iu+LMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="207483149"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 03:19:47 -0700
Date: Tue, 23 Sep 2025 13:19:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v12 11/13] drm/xe: Force flush system memory AuxCCS
 framebuffers before scan out
Message-ID: <aNJ0Pw9tvFA3jWDr@intel.com>
References: <20250923100812.88257-1-tvrtko.ursulin@igalia.com>
 <20250923100812.88257-12-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923100812.88257-12-tvrtko.ursulin@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 23, 2025 at 11:08:04AM +0100, Tvrtko Ursulin wrote:
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
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 14 +++++++++++++-
>  drivers/gpu/drm/xe/xe_bo_types.h       | 14 +++++++++-----
>  2 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d8aa23b8cf14..f247c0da6b9e 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -382,6 +382,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	struct xe_bo *bo = gem_to_xe_bo(obj);
>  	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
> +	bool first_pin;
>  	int ret = 0;
>  
>  	if (!vma)
> @@ -422,8 +423,11 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  			ret = xe_bo_validate(bo, NULL, true, &exec);
>  		drm_exec_retry_on_contention(&exec);
>  		xe_validation_retry_on_oom(&ctx, &ret);
> -		if (!ret)
> +		if (!ret) {
>  			ttm_bo_pin(&bo->ttm);
> +			first_pin = !bo->display_pin;
> +			bo->display_pin = true;
> +		}
>  	}
>  	if (ret)
>  		goto err;
> @@ -436,6 +440,14 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
>  	if (ret)
>  		goto err_unpin;
>  
> +	/*
> +	 * Force flush frame buffer data for non-coherent display access when
> +	 * AuxCCS formats are used.
> +	 */
> +	if (first_pin && !xe_bo_is_vram(bo) && !xe_bo_is_stolen(bo) &&
> +	    intel_fb_is_ccs_modifier(fb->base.modifier))
> +		drm_clflush_sg(xe_bo_sg(bo));

You still haven't found the actual bug that causes the dirty cache?

> +
>  	return vma;
>  
>  err_unpin:
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..8119d8d6d174 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -81,11 +81,6 @@ struct xe_bo {
>  	struct llist_node freed;
>  	/** @update_index: Update index if PT BO */
>  	int update_index;
> -	/** @created: Whether the bo has passed initial creation */
> -	bool created;
> -
> -	/** @ccs_cleared: true means that CCS region of BO is already cleared */
> -	bool ccs_cleared;
>  
>  	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
>  	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> @@ -100,6 +95,15 @@ struct xe_bo {
>  	/** @devmem_allocation: SVM device memory allocation */
>  	struct drm_pagemap_devmem devmem_allocation;
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
>  	struct list_head vram_userfault_link;
>  
> -- 
> 2.48.0

-- 
Ville Syrjälä
Intel
