Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E61CA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 10:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A965A10E916;
	Fri, 15 Aug 2025 10:32:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fkxhr6ed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED31910E916
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755253951; x=1786789951;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Dd7rFjtX5HggAlFTQ7ZxpMCR4M4IxLcXLS64R6ORYq4=;
 b=Fkxhr6edntBBmTzL6E9sNUOmMnrxwGPbSjpl3EA3ZB59GJRoSD8snkIW
 dwEU2y1w7DQvc6f/SWT2llvC6ua99pS7z2fRf9oObb3XeCzDHJe6muFsr
 mBS1y/LhsOCNhHH4FrPDul+5LFkw1H66yU9zJc51oE1FgTavjHWDyfzYB
 z2y9Pxoo+lRjOa5HA7Nuqt9rIsh+cMxn0fUCfpXm5IpvQ+iV3KlCsH1YG
 3/wpj8fm6U3qgpoM44pY/Yh/4bE+h+e3EmkJEnTPM69T3/YCxu7OnWFe8
 +b65dWm+dPHJ9M9KYp/1UJ0qGepR/DtABvWXY4kcl/PahfWnhsn8CwQ+1 A==;
X-CSE-ConnectionGUID: oZrzvh3PQkOOeSkdLAZnlA==
X-CSE-MsgGUID: uEo6VYYUTcefCTZnVx7b1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57290146"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="57290146"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 03:32:31 -0700
X-CSE-ConnectionGUID: 3Sm9/tStRWumaQ+1fJv+JQ==
X-CSE-MsgGUID: f1Sc8p1bSH28MQhZpJSs1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="172210654"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.39])
 ([10.245.245.39])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 03:32:29 -0700
Message-ID: <4092ca8d-8a08-4ce9-982d-6d4b8abca98c@intel.com>
Date: Fri, 15 Aug 2025 11:32:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/display: Make panic support work on vram.
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
References: <20250731152700.2196681-1-dev@lankhorst.se>
 <20250731152700.2196681-3-dev@lankhorst.se>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250731152700.2196681-3-dev@lankhorst.se>
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

On 31/07/2025 16:27, Maarten Lankhorst wrote:
> Add a special path for VRAM using xe_res iterators to ensure a panic
> screen is shown on VRAM as well.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/xe/display/intel_bo.c | 48 +++++++++++++++++++--------
>   1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> index 910632f57c3d6..f06bd8d98281a 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -9,6 +9,7 @@
>   #include "intel_display_types.h"
>   
>   #include "xe_bo.h"
> +#include "xe_res_cursor.h"
>   #include "intel_bo.h"
>   
>   bool intel_bo_is_tiled(struct drm_gem_object *obj)
> @@ -66,9 +67,10 @@ void intel_bo_describe(struct seq_file *m, struct drm_gem_object *obj)
>   }
>   
>   struct xe_panic_data {
> -	struct page **pages;
> +	struct xe_res_cursor res;
> +	struct iosys_map vmap;
> +
>   	int page;
> -	void *vaddr;
>   };
>   
>   struct xe_framebuffer {
> @@ -83,11 +85,12 @@ static inline struct xe_panic_data *to_xe_panic_data(struct intel_framebuffer *f
>   
>   static void xe_panic_kunmap(struct xe_panic_data *panic)
>   {
> -	if (panic->vaddr) {
> -		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
> -		kunmap_local(panic->vaddr);
> -		panic->vaddr = NULL;
> +	if (!panic->vmap.is_iomem && iosys_map_is_set(&panic->vmap)) {
> +		drm_clflush_virt_range(panic->vmap.vaddr, PAGE_SIZE);
> +		kunmap_local(panic->vmap.vaddr);
>   	}
> +	iosys_map_clear(&panic->vmap);
> +	panic->page = -1;
>   }
>   
>   /*
> @@ -112,15 +115,29 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>   	new_page = offset >> PAGE_SHIFT;
>   	offset = offset % PAGE_SIZE;
>   	if (new_page != panic->page) {
> -		xe_panic_kunmap(panic);
> +		if (xe_bo_is_vram(bo)) {
> +			/* Display is always mapped on root tile */
> +			struct xe_vram_region *vram = xe_bo_device(bo)->mem.vram;
> +
> +			if (panic->page < 0 || new_page < panic->page) {
> +				xe_res_first(bo->ttm.resource, new_page * PAGE_SIZE,
> +					     bo->ttm.base.size - new_page * PAGE_SIZE, &panic->res);
> +			} else {
> +				xe_res_next(&panic->res, PAGE_SIZE * (new_page - panic->page));
> +			}
> +			iosys_map_set_vaddr_iomem(&panic->vmap,
> +						  vram->mapping + panic->res.start);
> +		} else {
> +			xe_panic_kunmap(panic);
> +			iosys_map_set_vaddr(&panic->vmap,
> +					    ttm_bo_kmap_try_from_panic(&bo->ttm,
> +								       new_page));
> +		}
>   		panic->page = new_page;
> -		panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
> -							  panic->page);
> -	}
> -	if (panic->vaddr) {
> -		u32 *pix = panic->vaddr + offset;
> -		*pix = color;
>   	}
> +
> +	if (iosys_map_is_set(&panic->vmap))
> +		iosys_map_wr(&panic->vmap, offset, u32, color);

Just to double check. There is an l2 flush on BMG somewhere to ensure 
display engine sees this write?

>   }
>   
>   struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
> @@ -137,6 +154,10 @@ int intel_bo_panic_setup(struct drm_scanout_buffer *sb)
>   {
>   	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
>   	struct xe_panic_data *panic = to_xe_panic_data(fb);
> +	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
> +
> +	if (xe_bo_is_vram(bo) && !xe_bo_is_visible_vram(bo))
> +		return -ENODEV;
>   
>   	panic->page = -1;
>   	sb->set_pixel = xe_panic_page_set_pixel;
> @@ -148,5 +169,4 @@ void intel_bo_panic_finish(struct intel_framebuffer *fb)
>   	struct xe_panic_data *panic = to_xe_panic_data(fb);
>   
>   	xe_panic_kunmap(panic);
> -	panic->page = -1;
>   }

