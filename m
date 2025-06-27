Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C2EC7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 15:38:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD3C10E331;
	Fri, 27 Jun 2025 15:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BR0Cb8Kr";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748AF10E331
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 15:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751038690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PiAx3LmQsmFYawUKhTNqyNq8SoNIeLgUmSoj7+xAyms=;
 b=BR0Cb8KrB+di4Dh0YXmQHu5AKuj1Knzm3Zfa5OQOKzSLMxiEwmr6E5Z9gX6QBDvXnEsubY
 gq0tgepF33Wc328BdLlq7wULyjwz1KN+Ul0Vunnz8ldRRXFdONuhX+B46dMOoswWxpSYEg
 D+H6xIFAZhLaszRivnRlKPRw1HS4FZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-GrAQxBWfMZysYLgiwpgR9A-1; Fri, 27 Jun 2025 11:38:08 -0400
X-MC-Unique: GrAQxBWfMZysYLgiwpgR9A-1
X-Mimecast-MFC-AGG-ID: GrAQxBWfMZysYLgiwpgR9A_1751038688
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45311704d22so53435e9.2
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 08:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751038687; x=1751643487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PiAx3LmQsmFYawUKhTNqyNq8SoNIeLgUmSoj7+xAyms=;
 b=GUlSjXKWdt54kBkgQJ53V3HGngak83uqif6fXTzxleo0qd6+3QAf+eJ3ByFWVsAGPb
 sKnFch7pWxarsI+uYu3u76GUAEzM37BiX8YKvW/1itr7tL6ElVQZKqll4S7K2Mmx7vyH
 YBcWWxVmSyHBD9CF51/edVGq6EZN0NqThZm4jh01J3lTp61dgCGWEBMjFs056JBYThzx
 J7CJL8wxNBP04q4HmF6qdbICSRjJQ/jgW8wS6kmyIsile1rCq9VyaBUnVmnHuAQoKTyd
 mrzsn5wmlPzLnTaIZqrTLa7hqyW3Ue5DossjmGlDrQjnMjqZDZX0IFyVjMGPEIhpPisV
 lJmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW126t0mbgI35gPd3KbiESzF+zYHMMt8N5zBoeBvoHMIHx2nfpzgX+yPnAIaIuUeJKzweFf6CdqGQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8uCLgfZJqpp8UBuTZ2vTzRMb9reOxHA1uRQKgYspOdrM4srYZ
 OWJ7KXHveEm/4IQoXElU0ixg9n8zS1RuRGM9fUOBKU+rD0vOinhSTJ5BtL/BM7ozQRk+ja28FjI
 kcpoFBuZIHbQwugkfsTaE3PKHcIRb/g/bAQ7I3zpeFf69XFmPQk2qLzADfqDKqfxyHJElmqEj92
 BY
X-Gm-Gg: ASbGncsh30d65Ox+MfZFUCIS1SPBjuRfOjd73Vk35s7TJoZEachKbWI1eI302DJapF/
 AIx/C5IfeGn7ozE4O9iWq0hbzAhpISY16XD5iMZaLPRkzNaZqw5SZ9GcxPujXcBKs0wj5MAerfV
 ysaCDJley1IBzrryqCxcc+Rp4wSSSdk6def1RGlcsgHZCaevUp35QBgGd7HdLA5Q0PXiTjTM7jF
 NDcBO3tUEGuADhHpsH46KxrjA8WNREQHNewhtzuo1qQ7XUQsGKXyQIVKLZst4sarZ8JSWulsoW9
 oX5NWRFjt7is1WjFzawydnJ03MHXpeyRxmeVfWBdneviU1osIJLzWFFLq31xYQ==
X-Received: by 2002:a05:600c:8b01:b0:450:d30e:ff96 with SMTP id
 5b1f17b1804b1-4538ee5dc58mr41341565e9.0.1751038687277; 
 Fri, 27 Jun 2025 08:38:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFK45o7iHJs2wjikvvTP5NGnuFrD1vN/2KzKnvd/sFD9k/2QSJZOcINnJgCyI6TcBduNdT4Q==
X-Received: by 2002:a05:600c:8b01:b0:450:d30e:ff96 with SMTP id
 5b1f17b1804b1-4538ee5dc58mr41341185e9.0.1751038686665; 
 Fri, 27 Jun 2025 08:38:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7ec69dsm2969946f8f.6.2025.06.27.08.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 08:38:06 -0700 (PDT)
Message-ID: <8ebcbb94-0488-400a-9036-0a1b9fd4c95a@redhat.com>
Date: Fri, 27 Jun 2025 17:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/display: Make panic support work on vram.
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
References: <20250627151307.23001-4-dev@lankhorst.se>
 <20250627151307.23001-6-dev@lankhorst.se>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250627151307.23001-6-dev@lankhorst.se>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VxP5xh_UKEAyTWFA2XCzHFWdZfOMUJAi4cqb0ZLEQhQ_1751038688
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 27/06/2025 17:13, Maarten Lankhorst wrote:
> Add a special path for VRAM using xe_res iterators to ensure a panic
> screen is shown on VRAM as well.
> 

I was considering using a different set_pixel() function for VRAM, but 
in fact both implementations share a lot of things, so it's better this way.

vmap and vaddr are a bit redundant, you can rewrite xe_panic_kunmap()
to use vmap instead, and remove vaddr, like this:

if (!panic->vmap.is_iomem && panic->vmap.vaddr) {
	drm_clflush_virt_range(panic->vmap.vaddr, PAGE_SIZE);
	kunmap_local(panic->vmap.vaddr);
	iosys_map_clear(&panic->vmap);
}

With this change:

Acked-by: Jocelyn Falempe <jfalempe@redhat.com>


Best regards,

-- 

Jocelyn


> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>   drivers/gpu/drm/xe/display/intel_bo.c | 36 +++++++++++++++++++++------
>   1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> index 910632f57c3d6..03be519207397 100644
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
> @@ -69,6 +70,9 @@ struct xe_panic_data {
>   	struct page **pages;
>   	int page;
>   	void *vaddr;
> +
> +	struct xe_res_cursor res;
> +	struct iosys_map vmap;
>   };
>   
>   struct xe_framebuffer {
> @@ -112,15 +116,29 @@ static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int
>   	new_page = offset >> PAGE_SHIFT;
>   	offset = offset % PAGE_SIZE;
>   	if (new_page != panic->page) {
> -		xe_panic_kunmap(panic);
> +		if (xe_bo_is_vram(bo)) {
> +			/* Display is always mapped on root tile */
> +			struct xe_vram_region *vram = &xe_bo_device(bo)->mem.vram;
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
> +			panic->vaddr = ttm_bo_kmap_try_from_panic(&bo->ttm,
> +								  new_page);
> +			iosys_map_set_vaddr(&panic->vmap, panic->vaddr);
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
>   }
>   
>   struct intel_framebuffer *intel_bo_alloc_framebuffer(void)
> @@ -137,6 +155,10 @@ int intel_bo_panic_setup(struct drm_scanout_buffer *sb)
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

