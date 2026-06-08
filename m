Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21200CD8C8E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB6F10EEF9;
	Mon,  8 Jun 2026 08:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gRJUjL47";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C68D10EEF8
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780906803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=odzki8KzKQsTgmm6V22LkznvI6NCDgiT0tOohYo98hw=;
 b=gRJUjL47inp+B7PmXAuhVJ2BiiSyKvWn5pLjoFijWbKW7FwtjjNWkLXk6TerB2WsZqxlPU
 Tif55fJwl/j22XAfMcv/W+U4VkBlq5U0ApZyMMZF6Vsr0Q9T+6S2XZo93+ye3T+66XDSvD
 YF7p0k+24Uh/xxqurHG53EhUdStok3E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-OxKI2qoPMA2AYLKyME3hDw-1; Mon, 08 Jun 2026 04:19:56 -0400
X-MC-Unique: OxKI2qoPMA2AYLKyME3hDw-1
X-Mimecast-MFC-AGG-ID: OxKI2qoPMA2AYLKyME3hDw_1780906796
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-490a060eb84so26659725e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jun 2026 01:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780906796; x=1781511596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=odzki8KzKQsTgmm6V22LkznvI6NCDgiT0tOohYo98hw=;
 b=SFGrGoqKZKWe6Py3jjHfIEn1p/hVY9Ei4lSGKH2fpfEknfeUeofUNn5AwUtbGsX7IS
 OIF7+i2Pdq+R0bxDWqjagNZDNjKIZVf1ZWtHIhauaVizz2Ckxknp0aLa3p7rTzMknykh
 LCGwcxcyxDvEzK/LUYp+AWb7KQfST3SNWWfHYXOsC8iSAhCuKeX5e3TVJgNeiD1Vbw4v
 515x1b3MVV9HwrqUAakufyGnhzrpXQ4VwaHLu95eyaXkssFOcXPNxfh2KcE6b1If/g5E
 LPUtM8SzX1A9N5/IZ0q4xmq7Q/i9HPdeBWCsx3V2XHYC2n3hTqv1K+8qJPHYGIsA+JKz
 90Kw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GRQGsiH2RXSJJNbnjwPWET9lI0saCCTxkTVubiI2OPJslhnXDmLAPR28sFQVe7liLQbilXRP/Eg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFrTSn0YG6BjF2Hwv2Tf+WJzq9kDdSFORLsxL0gKxzLMPv5nFd
 GtxJLKtiWQgJR9o3d6G8c0siLRdD0oOMTKL2KyH0Ajsuin2HP4a3T3oeTrOJQLvMRkxqBprraiv
 OiUuC6WTQU0TX7Ug5N3o2cixMg29EkH4BrF+5tArm27w/y0B+Qo+IUmcdg0Wz5KGsnjRf2OLlAW
 wP
X-Gm-Gg: Acq92OGqNaJ40h+nmVGeiQvxCkvc6oHjVKkbjybYSM/ARMlv84y+8xKv38KReF7sTGc
 ZbtbLIyoTkCbhkN1MUeCanrg6I//wn16ppxsItT7YDK7xzWxuGwABoVmylkbxV7J1u4+mm8oeAm
 0xjHUbdwjTCbOuCMGDKPN+4d3SIwf1XfuvMFW7oM1G473YaCAc5Bw26bQypEyRAYhzE+CwDXnv2
 RU+UW3Xup+zpKbqPhWFb2YxBNVruSN7WQvNULuCMcqaHNSrRuzavPM6MyWHoxgowviMjAJQrW/Q
 ZOPXzC63WNNl+RYzBZadEHATyFMQ+CG7ZKD5iZiVvTUhHx8qXOwyLX8CjalVIhkSYDelseDGEFs
 kFag/9qHEPa5VR7pmIUtGffNE2l4j/VC9ySP9ujoNAQsYtcJSXnDVk/MPvo6mIe8NW+jy+fmJ
X-Received: by 2002:a05:600c:6096:b0:48f:e3e7:3d39 with SMTP id
 5b1f17b1804b1-490c25c70cfmr230366375e9.11.1780906795647; 
 Mon, 08 Jun 2026 01:19:55 -0700 (PDT)
X-Received: by 2002:a05:600c:6096:b0:48f:e3e7:3d39 with SMTP id
 5b1f17b1804b1-490c25c70cfmr230366105e9.11.1780906795208; 
 Mon, 08 Jun 2026 01:19:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ec71:10ae:399e:d3c8?
 ([2a01:e0a:c:37e0:ec71:10ae:399e:d3c8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc413adbsm376120945e9.15.2026.06.08.01.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 01:19:54 -0700 (PDT)
Message-ID: <6781487e-e2b5-4769-b626-4b8559735a42@redhat.com>
Date: Mon, 8 Jun 2026 10:19:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/i915/panic: split out i915_gem_panic.[ch]
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <cover.1780394867.git.jani.nikula@intel.com>
 <f2093946e723aa27e856987d13692eb0308a4d85.1780394867.git.jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <f2093946e723aa27e856987d13692eb0308a4d85.1780394867.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dDiDuu-wjoVWcsdJ152yBkrJPYOLCgi7pBP-3xB9T0Y_1780906796
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 02/06/2026 12:09, Jani Nikula wrote:
> The panic handling is a bit special and isolated part of
> i915_gem_pages.c. Split it out to i915_gem_panic.[ch].

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile              |   1 +
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |   7 --
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c  | 128 -------------------
>   drivers/gpu/drm/i915/gem/i915_gem_panic.c  | 135 +++++++++++++++++++++
>   drivers/gpu/drm/i915/gem/i915_gem_panic.h  |  18 +++
>   drivers/gpu/drm/i915/i915_panic.c          |   2 +-
>   6 files changed, 155 insertions(+), 136 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_panic.c
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_panic.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 07802a7f4ce5..091b6647c383 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -167,6 +167,7 @@ gem-y += \
>   	gem/i915_gem_object.o \
>   	gem/i915_gem_object_frontbuffer.o \
>   	gem/i915_gem_pages.o \
> +	gem/i915_gem_panic.o \
>   	gem/i915_gem_phys.o \
>   	gem/i915_gem_pm.o \
>   	gem/i915_gem_region.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 8878539c10ed..2c5d20e4dbaf 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -17,8 +17,6 @@
>   #include "i915_vma_types.h"
>   
>   enum intel_region_id;
> -struct drm_scanout_buffer;
> -struct intel_panic;
>   
>   #define obj_to_i915(obj__) to_i915((obj__)->base.dev)
>   
> @@ -693,11 +691,6 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
>   int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
>   int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
>   
> -struct intel_panic *i915_gem_object_alloc_panic(void);
> -int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -				struct drm_gem_object *_obj, bool panic_tiling);
> -void i915_gem_object_panic_finish(struct intel_panic *panic);
> -
>   /**
>    * i915_gem_object_pin_map - return a contiguous mapping of the entire object
>    * @obj: the object to map into kernel address space
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index df35bdb755e4..59e3d4de7d3c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -6,11 +6,8 @@
>   #include <linux/vmalloc.h>
>   
>   #include <drm/drm_cache.h>
> -#include <drm/drm_panic.h>
>   #include <drm/drm_print.h>
>   
> -#include "display/intel_fb.h"
> -#include "display/intel_display_types.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_tlb.h"
>   
> @@ -359,131 +356,6 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
>   	return vaddr ?: ERR_PTR(-ENOMEM);
>   }
>   
> -struct intel_panic {
> -	struct page **pages;
> -	int page;
> -	void *vaddr;
> -};
> -
> -static void i915_panic_kunmap(struct intel_panic *panic)
> -{
> -	if (panic->vaddr) {
> -		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
> -		kunmap_local(panic->vaddr);
> -		panic->vaddr = NULL;
> -	}
> -}
> -
> -static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj)
> -{
> -	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
> -	struct page *page;
> -	struct page **pages;
> -	struct sgt_iter iter;
> -
> -	/* For a 3840x2160 32 bits Framebuffer, this should require ~64K */
> -	pages = kmalloc_objs(*pages, n_pages, GFP_ATOMIC);
> -	if (!pages)
> -		return NULL;
> -
> -	i = 0;
> -	for_each_sgt_page(page, iter, obj->mm.pages)
> -		pages[i++] = page;
> -	return pages;
> -}
> -
> -static void i915_gem_object_panic_map_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
> -						unsigned int y, u32 color)
> -{
> -	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> -	unsigned int offset = fb->panic_tiling(sb->width, x, y);
> -
> -	iosys_map_wr(&sb->map[0], offset, u32, color);
> -}
> -
> -/*
> - * The scanout buffer pages are not mapped, so for each pixel,
> - * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
> - * Try to keep the map from the previous pixel, to avoid too much map/unmap.
> - */
> -static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
> -						 unsigned int y, u32 color)
> -{
> -	unsigned int new_page;
> -	unsigned int offset;
> -	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> -	struct intel_panic *panic = fb->panic;
> -
> -	if (fb->panic_tiling)
> -		offset = fb->panic_tiling(sb->width, x, y);
> -	else
> -		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
> -
> -	new_page = offset >> PAGE_SHIFT;
> -	offset = offset % PAGE_SIZE;
> -	if (new_page != panic->page) {
> -		i915_panic_kunmap(panic);
> -		panic->page = new_page;
> -		panic->vaddr =
> -			kmap_local_page_try_from_panic(panic->pages[panic->page]);
> -	}
> -	if (panic->vaddr) {
> -		u32 *pix = panic->vaddr + offset;
> -		*pix = color;
> -	}
> -}
> -
> -struct intel_panic *i915_gem_object_alloc_panic(void)
> -{
> -	struct intel_panic *panic;
> -
> -	panic = kzalloc_obj(*panic);
> -
> -	return panic;
> -}
> -
> -/*
> - * Setup the gem framebuffer for drm_panic access.
> - * Use current vaddr if it exists, or setup a list of pages.
> - * pfn is not supported yet.
> - */
> -int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -				struct drm_gem_object *_obj, bool panic_tiling)
> -{
> -	enum i915_map_type has_type;
> -	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> -	void *ptr;
> -
> -	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
> -	if (ptr) {
> -		if (i915_gem_object_has_iomem(obj))
> -			iosys_map_set_vaddr_iomem(&sb->map[0], (void __iomem *)ptr);
> -		else
> -			iosys_map_set_vaddr(&sb->map[0], ptr);
> -
> -		if (panic_tiling)
> -			sb->set_pixel = i915_gem_object_panic_map_set_pixel;
> -		return 0;
> -	}
> -	if (i915_gem_object_has_struct_page(obj)) {
> -		panic->pages = i915_gem_object_panic_pages(obj);
> -		if (!panic->pages)
> -			return -ENOMEM;
> -		panic->page = -1;
> -		sb->set_pixel = i915_gem_object_panic_page_set_pixel;
> -		return 0;
> -	}
> -	return -EOPNOTSUPP;
> -}
> -
> -void i915_gem_object_panic_finish(struct intel_panic *panic)
> -{
> -	i915_panic_kunmap(panic);
> -	panic->page = -1;
> -	kfree(panic->pages);
> -	panic->pages = NULL;
> -}
> -
>   /* get, pin, and map the pages of the object into kernel space */
>   void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>   			      enum i915_map_type type)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_panic.c b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> new file mode 100644
> index 000000000000..7407c5668c71
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/* Copyright © 2026 Intel Corporation */
> +
> +#include <drm/drm_cache.h>
> +#include <drm/drm_panic.h>
> +
> +#include "display/intel_fb.h"
> +#include "display/intel_display_types.h"
> +#include "i915_gem_object.h"
> +#include "i915_gem_panic.h"
> +
> +struct intel_panic {
> +	struct page **pages;
> +	int page;
> +	void *vaddr;
> +};
> +
> +static void i915_panic_kunmap(struct intel_panic *panic)
> +{
> +	if (panic->vaddr) {
> +		drm_clflush_virt_range(panic->vaddr, PAGE_SIZE);
> +		kunmap_local(panic->vaddr);
> +		panic->vaddr = NULL;
> +	}
> +}
> +
> +static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj)
> +{
> +	unsigned long n_pages = obj->base.size >> PAGE_SHIFT, i;
> +	struct page *page;
> +	struct page **pages;
> +	struct sgt_iter iter;
> +
> +	/* For a 3840x2160 32 bits Framebuffer, this should require ~64K */
> +	pages = kmalloc_objs(*pages, n_pages, GFP_ATOMIC);
> +	if (!pages)
> +		return NULL;
> +
> +	i = 0;
> +	for_each_sgt_page(page, iter, obj->mm.pages)
> +		pages[i++] = page;
> +	return pages;
> +}
> +
> +static void i915_gem_object_panic_map_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
> +						unsigned int y, u32 color)
> +{
> +	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> +	unsigned int offset = fb->panic_tiling(sb->width, x, y);
> +
> +	iosys_map_wr(&sb->map[0], offset, u32, color);
> +}
> +
> +/*
> + * The scanout buffer pages are not mapped, so for each pixel,
> + * use kmap_local_page_try_from_panic() to map the page, and write the pixel.
> + * Try to keep the map from the previous pixel, to avoid too much map/unmap.
> + */
> +static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
> +						 unsigned int y, u32 color)
> +{
> +	unsigned int new_page;
> +	unsigned int offset;
> +	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> +	struct intel_panic *panic = fb->panic;
> +
> +	if (fb->panic_tiling)
> +		offset = fb->panic_tiling(sb->width, x, y);
> +	else
> +		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
> +
> +	new_page = offset >> PAGE_SHIFT;
> +	offset = offset % PAGE_SIZE;
> +	if (new_page != panic->page) {
> +		i915_panic_kunmap(panic);
> +		panic->page = new_page;
> +		panic->vaddr =
> +			kmap_local_page_try_from_panic(panic->pages[panic->page]);
> +	}
> +	if (panic->vaddr) {
> +		u32 *pix = panic->vaddr + offset;
> +		*pix = color;
> +	}
> +}
> +
> +struct intel_panic *i915_gem_object_alloc_panic(void)
> +{
> +	struct intel_panic *panic;
> +
> +	panic = kzalloc_obj(*panic);
> +
> +	return panic;
> +}
> +
> +/*
> + * Setup the gem framebuffer for drm_panic access.
> + * Use current vaddr if it exists, or setup a list of pages.
> + * pfn is not supported yet.
> + */
> +int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> +				struct drm_gem_object *_obj, bool panic_tiling)
> +{
> +	enum i915_map_type has_type;
> +	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> +	void *ptr;
> +
> +	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
> +	if (ptr) {
> +		if (i915_gem_object_has_iomem(obj))
> +			iosys_map_set_vaddr_iomem(&sb->map[0], (void __iomem *)ptr);
> +		else
> +			iosys_map_set_vaddr(&sb->map[0], ptr);
> +
> +		if (panic_tiling)
> +			sb->set_pixel = i915_gem_object_panic_map_set_pixel;
> +		return 0;
> +	}
> +	if (i915_gem_object_has_struct_page(obj)) {
> +		panic->pages = i915_gem_object_panic_pages(obj);
> +		if (!panic->pages)
> +			return -ENOMEM;
> +		panic->page = -1;
> +		sb->set_pixel = i915_gem_object_panic_page_set_pixel;
> +		return 0;
> +	}
> +	return -EOPNOTSUPP;
> +}
> +
> +void i915_gem_object_panic_finish(struct intel_panic *panic)
> +{
> +	i915_panic_kunmap(panic);
> +	panic->page = -1;
> +	kfree(panic->pages);
> +	panic->pages = NULL;
> +}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_panic.h b/drivers/gpu/drm/i915/gem/i915_gem_panic.h
> new file mode 100644
> index 000000000000..91ab6722d37c
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_panic.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Copyright © 2026 Intel Corporation */
> +
> +#ifndef __I915_GEM_PANIC_H__
> +#define __I915_GEM_PANIC_H__
> +
> +#include <linux/types.h>
> +
> +struct drm_gem_object;
> +struct drm_scanout_buffer;
> +struct intel_panic;
> +
> +struct intel_panic *i915_gem_object_alloc_panic(void);
> +int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> +				struct drm_gem_object *_obj, bool panic_tiling);
> +void i915_gem_object_panic_finish(struct intel_panic *panic);
> +
> +#endif /* __I915_GEM_PANIC_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_panic.c b/drivers/gpu/drm/i915/i915_panic.c
> index 728be077e8e8..412db72797d8 100644
> --- a/drivers/gpu/drm/i915/i915_panic.c
> +++ b/drivers/gpu/drm/i915/i915_panic.c
> @@ -6,7 +6,7 @@
>   
>   #include "display/intel_display_types.h"
>   #include "display/intel_fb.h"
> -#include "gem/i915_gem_object.h"
> +#include "gem/i915_gem_panic.h"
>   
>   #include "i915_panic.h"
>   

