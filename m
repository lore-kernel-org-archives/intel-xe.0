Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D34CA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 10:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C567810E255;
	Fri, 15 Aug 2025 10:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BfrJuJG+";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BD710E255
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755253319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhyNr3ZLu8T/snH3pftSkEE0tAYmpA8VH8FF0g4E1aU=;
 b=BfrJuJG+dgWjtspZt84A+KnaRiok18fVj6p5JKKQ4oCMFjYmq0KYAmo4r1fZdyg4vpl/V3
 YBPXAe1eRTjC8LniAFo1o7fRxk9pP0aBVVJy4tx+8NMnhWmRn4/Szf9QNlPyfXwKKLDhSV
 mMa91Gu4uI21hxRQ2gcn2r8daTGplr8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-vW-XeXbcNVGUSQsdzPG-bQ-1; Fri, 15 Aug 2025 06:21:57 -0400
X-MC-Unique: vW-XeXbcNVGUSQsdzPG-bQ-1
X-Mimecast-MFC-AGG-ID: vW-XeXbcNVGUSQsdzPG-bQ_1755253316
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b10418aso9643865e9.3
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 03:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755253316; x=1755858116;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XhyNr3ZLu8T/snH3pftSkEE0tAYmpA8VH8FF0g4E1aU=;
 b=N/b6ahPu2fBzEtFlBVu9fN0KclJ3E2xjgc7Fikuv0YoYvTpvxAX+MPIvdOL+p4ac0r
 d0T0yyX6CataSyMJHfVhbSORtxFy33CxUZnN/QnQG6ZvFS5afidkOba3PikCStbFyQr6
 sVoDMiyVDPRD1QFLxDTP9VHNjXHhW4Dqc14ZTcLjgfck04d9E6KhKWEt953XQpIc8oPX
 phW4wBiXlVJPK9pLiCZwJCk1j+AYMaBMWJkHXO6KHZyaaHarHIIuQTigGxlbz8TtYe4x
 C7zhHgmJp2MaOxH3AfDm2mFtwxMWyCDjsKCEJi/McFr9fLdcjIeQOZaWiERmbpXgf61/
 ibDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVX8+bNhup3wd0+xUKDfJCaMnnrSRgHAEqseIgVctGjjgOY1b4YOFZr8XgULSNmpRN2UVTarxG8VA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj4BO5k72lS/0xS0hdmZMqSheu2NusI1FOLjxi9M//xTeyh/bg
 d8xMSSayNTE7EjU2M2AErFHS4/GkhF9u6wg0x6FxkOTdkdo3ng1laJ6tMuwdBI3CS1ktYcFCPcP
 9lBsDlk7DJgv2KMNOoIncg17yztTV4beIQV0eX9F0VOwfgKdmDbdGVQZE8NAEQRDVfssQtR+4n2
 R9
X-Gm-Gg: ASbGncu/JVF3A8H1KmcflgcjrnAOrIcPxkZOdHGdoKLESqQLc90meG40pyzXOIUj4BM
 WqsP9tkRC10HY+KViqL5V06Bfqv3ytPOcmwZrtMPQwlHsLVO4Idp92+MG7ktoIP2juL6G9fhI5X
 55FQ0RAf3dMpmoI9X0xzx71+btwcRgFz+k6ZdXLzhAXDywpWmfj+I9E0C0agTi00eGmJc4GZV0N
 +Ykg9S4BjKiC7AWWmYoU589Zk7JCl7bcuWi3McGuiolZXOYtb18RVSgPtIC/kLNVlxvig7I1Hph
 5BaVdIZmABVMn5Zro6+axKh+llVGoftiDskIgTwzbRPUaj3Lgut79ISDgCBFIcy+PjYYyCLRVPD
 a9Z4=
X-Received: by 2002:a05:600c:1c11:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-45a217855b7mr16793415e9.0.1755253316011; 
 Fri, 15 Aug 2025 03:21:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPOixr62OSKrQ6Cd3IAmpnjaqSyzXU4VYMp+leCi5UIUOwx4ukW7yUbqwYkz0aHVtK7mVLyQ==
X-Received: by 2002:a05:600c:1c11:b0:439:643a:c8d5 with SMTP id
 5b1f17b1804b1-45a217855b7mr16793195e9.0.1755253315597; 
 Fri, 15 Aug 2025 03:21:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a2231f7e8sm14086045e9.14.2025.08.15.03.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 03:21:55 -0700 (PDT)
Message-ID: <ae9776eb-1ba6-4b98-a2e7-ea7f63bd4b57@redhat.com>
Date: Fri, 15 Aug 2025 12:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/display: Make panic support work on vram.
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
References: <20250731152700.2196681-1-dev@lankhorst.se>
 <20250731152700.2196681-3-dev@lankhorst.se>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250731152700.2196681-3-dev@lankhorst.se>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c5r7ASpdqV3vuuKQqKHbk-sEHR6yZC0eCwSfFKz1CiM_1755253316
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

On 31/07/2025 17:27, Maarten Lankhorst wrote:
> Add a special path for VRAM using xe_res iterators to ensure a panic
> screen is shown on VRAM as well.

As no one else step up, to review it:

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

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

