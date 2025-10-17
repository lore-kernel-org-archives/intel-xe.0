Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBFFCCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E693910EC62;
	Fri, 17 Oct 2025 15:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="ZgOkMtoW";
	dkim-atps=neutral
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6195610EC62
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1760715341;
 bh=EzT5gMlpklliKoh743YgF4E1K7uzA6wwGWkZh72UZLI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ZgOkMtoWj/+cD2695Hr7XtqUjRCGvi/DLKcery9LbZTnrfnvIgoS9xLdP7zfzRHD8
 +H0bZB8yJpyum8Vt8B40Wih6s+wZYohJoUgp5k98yjuMP6KXPJiITOy0RD54YA2XCX
 k90wfVds8zLu53jXtFzUp1nHH9SsFKTkJeb/BxohhXzuefIv6g5+NSwSr6pEp8y84o
 +K79zW98wAcIK1Uu2CLjgI5YKjU3QaoVlqEZjaB1V1T8eAXosmy3WxKo4xR81VFeAA
 6hl9Eu3QIBY8AVfBD4cI5Eec15L5hbf20+LiVEHqq88kv7zlZ/Sd4XT+poJCsfB+15
 IDXWrQEdhdfXw==
Message-ID: <5e285430-fd5e-4cd1-82b1-2b84b4eb3808@lankhorst.se>
Date: Fri, 17 Oct 2025 17:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/display: Make panic support work on vram.
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-xe@lists.freedesktop.org
References: <20251016075701.379023-1-jfalempe@redhat.com>
 <20251016075701.379023-3-jfalempe@redhat.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20251016075701.379023-3-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Thanks for resubmitting, wnat me to push it?

Best regards,
~Maarten Lankhorst

Den 2025-10-16 kl. 09:52, skrev Jocelyn Falempe:
> From: Maarten Lankhorst <dev@lankhorst.se>
> 
> Add a special path for VRAM using xe_res iterators to ensure a panic
> screen is shown on VRAM as well.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/xe/display/xe_panic.c | 50 +++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
> index f32b23338331..df663286092a 100644
> --- a/drivers/gpu/drm/xe/display/xe_panic.c
> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
> @@ -8,20 +8,23 @@
>  #include "intel_fb.h"
>  #include "intel_panic.h"
>  #include "xe_bo.h"
> +#include "xe_res_cursor.h"
>  
>  struct intel_panic {
> -	struct page **pages;
> +	struct xe_res_cursor res;
> +	struct iosys_map vmap;
> +
>  	int page;
> -	void *vaddr;
>  };
>  
>  static void xe_panic_kunmap(struct intel_panic *panic)
>  {
> -	if (panic->vaddr) {
> -		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
> -		kunmap_local(panic->vaddr);
> -		panic->vaddr = NULL;
> +	if (!panic->vmap.is_iomem && iosys_map_is_set(&panic->vmap)) {
> +		drm_clflush_virt_range(panic->vmap.vaddr, PAGE_SIZE);
> +		kunmap_local(panic->vmap.vaddr);
>  	}
> +	iosys_map_clear(&panic->vmap);
> +	panic->page = -1;
>  }
>  
>  /*
> @@ -46,15 +49,29 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>  	new_page = offset >> PAGE_SHIFT;
>  	offset = offset % PAGE_SIZE;
>  	if (new_page != panic->page) {
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
>  		panic->page = new_page;
> -		panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
> -							  panic->page);
> -	}
> -	if (panic->vaddr) {
> -		u32 *pix = panic->vaddr + offset;
> -		*pix = color;
>  	}
> +
> +	if (iosys_map_is_set(&panic->vmap))
> +		iosys_map_wr(&panic->vmap, offset, u32, color);
>  }
>  
>  struct intel_panic *intel_panic_alloc(void)
> @@ -68,6 +85,12 @@ struct intel_panic *intel_panic_alloc(void)
>  
>  int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
>  {
> +	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> +	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
> +
> +	if (xe_bo_is_vram(bo) && !xe_bo_is_visible_vram(bo))
> +		return -ENODEV;
> +
>  	panic->page = -1;
>  	sb->set_pixel = xe_panic_page_set_pixel;
>  	return 0;
> @@ -76,5 +99,4 @@ int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
>  void intel_panic_finish(struct intel_panic *panic)
>  {
>  	xe_panic_kunmap(panic);
> -	panic->page = -1;
>  }

