Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D37CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01C510EF0B;
	Mon,  8 Jun 2026 08:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jF5v+8mO";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19B510EF0B
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780907003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0Ht//T4WLMlXL2YJt/QFg8MwvL+wOhTJzqBAxW5QqpA=;
 b=jF5v+8mOxNYLasjOsVsz5GFMIe3glvvrVXVc3b6+K1iapSUGr/Kl4S9Qrak03djc0M7RU0
 l7tlt1XXtafEASBYU7xb1+ZNMkYFbX0ZvICjWx9OJXUTqB2pczYxl/U5XIK3WoyOW4neXP
 RrnOv0UdWZJ9BH0dAX51byw4Yo6h6Co=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-7xsrSQ8FNpWb53JNGNDdYA-1; Mon, 08 Jun 2026 04:23:21 -0400
X-MC-Unique: 7xsrSQ8FNpWb53JNGNDdYA-1
X-Mimecast-MFC-AGG-ID: 7xsrSQ8FNpWb53JNGNDdYA_1780907001
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-68f9f08cfcaso3707155a12.2
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jun 2026 01:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780907000; x=1781511800;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Ht//T4WLMlXL2YJt/QFg8MwvL+wOhTJzqBAxW5QqpA=;
 b=CbAzQv5beXyaUKzsIg/LcIbuVgkoqqjYO6JDq+1+Ds+JNxTJQP5e7J6m85empyFOtC
 lfkFcAQQOcfLnDlBIiSbjCLFlOgMOudnhcOyjfQzlJuMF/es4kJhIgVzOClCiJutqGwS
 xRxx4QWkqJql7/6GlwaIVGDxLiC2UaRXxp7phwOCq5pAfGakm+shnnA39Yrq4luKDD0N
 nLWMvmX7MF1KSGdfRgFDJFc//Mlcq5TWvTQInkaLXmMApL1GyTnVkN15AdY75prH+hLg
 eyO2IyfhWAZw7FMD2QHuHHonI4cI6wbgwUiQdEhGPuPaiZSVWr+fdl/SxyzBcpIOp3sP
 l5dg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+LXZKfyLvFiRxU8XA2YYjPii7G/FSt2iJuFxSZ82EaYmApQXq/CQUV7Mmui4PorPF29Xs6MVtj4A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRrGJY9VdWW0WRYlSGI95i+7KrTamrBqKnvc9lUHEa/ZyX4B09
 I0yXfzfd9kHVEOJpk6XTIXe0Fi4f2EKi9hGpQvDFg4UzX2pMz23IRl7PWoHWSN1xcgVqApv2RoF
 K43SJmNwr0A8YysMuVwWepUTY/uUXvyBL2dpvwE8kWO1jHC+Vo+yBb7MHqmaqtkpUenr4IGD/mT
 9t
X-Gm-Gg: Acq92OES6BpSA//rARhLNgubn3bP6p03E3D6U8Y1SljUR4uZLuhTyrmF/9of8A45d/q
 W+b/Y3gcA5CUBGXhGd8h4bc6Ks+YaG1wPdqzZCr88iTtnHRj+1kfNsDYU2EQnh2Aak2PnRb8o5y
 cHjMknJAXuthybtRwSvSGjWTnBJoA90BSSCN1kYzITvcXABuwGZmMDPzRGh/Fdjd2c305ToHebG
 MmDmhoNJQN4LWqZJscw16Gb6NS0YUm9ADpEpN6362V89XejvTRpZlkb093qVBHcxNSk7kmA4iR9
 2HWBK4AWJE6nW6nLUbwGzGekLDTv0kEidojL7Xx9jBYVZ71unBxIywiZ3xlYRYEj7iqb0PZUq4A
 eUfLcoLGMyb4WwMtdzYDUwPSvrgyqbgWQfwu31rTIelfg0zZoy9RoKJr55cmV9ApGI2MnPdlq
X-Received: by 2002:a17:907:3d93:b0:bd5:7c2:70ca with SMTP id
 a640c23a62f3a-bf37311474cmr759764266b.48.1780907000395; 
 Mon, 08 Jun 2026 01:23:20 -0700 (PDT)
X-Received: by 2002:a17:907:3d93:b0:bd5:7c2:70ca with SMTP id
 a640c23a62f3a-bf37311474cmr759762766b.48.1780906999693; 
 Mon, 08 Jun 2026 01:23:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ec71:10ae:399e:d3c8?
 ([2a01:e0a:c:37e0:ec71:10ae:399e:d3c8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf054e05199sm807602266b.29.2026.06.08.01.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 01:23:19 -0700 (PDT)
Message-ID: <5a181a4b-9496-4c94-8f6d-257ea7cc69d3@redhat.com>
Date: Mon, 8 Jun 2026 10:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] drm/{i915,xe}/panic: drop dependency on struct
 intel_framebuffer
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <cover.1780394867.git.jani.nikula@intel.com>
 <d97abae79db3437c617cd4cb6193ba017b3a8d78.1780394867.git.jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d97abae79db3437c617cd4cb6193ba017b3a8d78.1780394867.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AGj6m1wW4LFofNefOf1XC0kloOMzhBrXZ0rnhqNdsHM_1780907001
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

On 02/06/2026 12:09, Jani Nikula wrote:
> Store tiling function pointer in struct intel_panic instead of struct
> intel_framebuffer, and store struct intel_panic pointer instead of
> struct intel_framebuffer pointer in struct drm_scanout_buffer private
> member.
> 
> To make this happen, pass the tiling function pointer to panic setup
> hook, and initialize sb->private in the hook for clarity.
> 
> This allows us to drop the dependency on struct intel_framebuffer from
> i915 and xe panic code.
> 
> Note: It would be less verbose to have a typedef for the tiling function
> pointer. However, there isn't a nice location for it that wouldn't also
> increase header interdependencies.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   .../drm/i915/display/intel_display_types.h    |  1 -
>   drivers/gpu/drm/i915/display/intel_parent.c   |  5 ++--
>   drivers/gpu/drm/i915/display/intel_parent.h   |  3 ++-
>   drivers/gpu/drm/i915/display/intel_plane.c    |  8 +++---
>   drivers/gpu/drm/i915/gem/i915_gem_panic.c     | 26 +++++++++++--------
>   drivers/gpu/drm/xe/display/xe_panic.c         | 15 ++++++-----
>   include/drm/intel/display_parent_interface.h  |  3 ++-
>   7 files changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index c21e0c0ef0b1..234fae44fb16 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -150,7 +150,6 @@ struct intel_framebuffer {
>   	unsigned int min_alignment;
>   	unsigned int vtd_guard;
>   
> -	unsigned int (*panic_tiling)(unsigned int x, unsigned int y, unsigned int width);
>   	struct intel_panic *panic;
>   };
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
> index 0b2bc2d38442..a5e41ea66921 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.c
> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
> @@ -252,9 +252,10 @@ struct intel_panic *intel_parent_panic_alloc(struct intel_display *display)
>   }
>   
>   int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic,
> -			     struct drm_scanout_buffer *sb, struct drm_gem_object *obj)
> +			     struct drm_scanout_buffer *sb, struct drm_gem_object *obj,
> +			     unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width))
>   {
> -	return display->parent->panic->setup(panic, sb, obj);
> +	return display->parent->panic->setup(panic, sb, obj, tiling);
>   }
>   
>   void intel_parent_panic_finish(struct intel_display *display, struct intel_panic *panic)
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
> index 4197d1b1af61..595d4148b8eb 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.h
> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
> @@ -106,7 +106,8 @@ void intel_parent_overlay_cleanup(struct intel_display *display);
>   /* panic */
>   struct intel_panic *intel_parent_panic_alloc(struct intel_display *display);
>   int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic,
> -			     struct drm_scanout_buffer *sb, struct drm_gem_object *obj);
> +			     struct drm_scanout_buffer *sb, struct drm_gem_object *obj,
> +			     unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width));
>   void intel_parent_panic_finish(struct intel_display *display, struct intel_panic *panic);
>   
>   /* pc8 */
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> index 75eae994433d..e2745b3be105 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -1580,17 +1580,17 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
>   	if (fb == intel_fbdev_framebuffer(display->fbdev.fbdev)) {
>   		intel_fbdev_get_map(display, &sb->map[0]);
>   	} else {
> +		unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width) = NULL;
>   		int ret;
>   		/* Can't disable tiling if DPT is in use */
>   		if (intel_fb_uses_dpt(&fb->base)) {
>   			if (fb->base.format->cpp[0] != 4)
>   				return -EOPNOTSUPP;
> -			fb->panic_tiling = intel_get_tiling_func(fb->base.modifier);
> -			if (!fb->panic_tiling)
> +			tiling = intel_get_tiling_func(fb->base.modifier);
> +			if (!tiling)
>   				return -EOPNOTSUPP;
>   		}
> -		sb->private = fb;
> -		ret = intel_parent_panic_setup(display, fb->panic, sb, obj);
> +		ret = intel_parent_panic_setup(display, fb->panic, sb, obj, tiling);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_panic.c b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> index 001ccfbf7ab7..91389d36f101 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> @@ -5,7 +5,6 @@
>   #include <drm/drm_panic.h>
>   #include <drm/intel/display_parent_interface.h>
>   
> -#include "display/intel_display_types.h"
>   #include "i915_gem_object.h"
>   #include "i915_gem_panic.h"
>   
> @@ -13,6 +12,8 @@ struct intel_panic {
>   	struct page **pages;
>   	int page;
>   	void *vaddr;
> +
> +	unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width);
>   };
>   
>   static void i915_panic_kunmap(struct intel_panic *panic)
> @@ -45,8 +46,8 @@ static struct page **i915_gem_object_panic_pages(struct drm_i915_gem_object *obj
>   static void i915_gem_object_panic_map_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
>   						unsigned int y, u32 color)
>   {
> -	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> -	unsigned int offset = fb->panic_tiling(sb->width, x, y);
> +	struct intel_panic *panic = sb->private;
> +	unsigned int offset = panic->tiling(sb->width, x, y);
>   
>   	iosys_map_wr(&sb->map[0], offset, u32, color);
>   }
> @@ -59,13 +60,12 @@ static void i915_gem_object_panic_map_set_pixel(struct drm_scanout_buffer *sb, u
>   static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
>   						 unsigned int y, u32 color)
>   {
> +	struct intel_panic *panic = sb->private;
>   	unsigned int new_page;
>   	unsigned int offset;
> -	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> -	struct intel_panic *panic = fb->panic;
>   
> -	if (fb->panic_tiling)
> -		offset = fb->panic_tiling(sb->width, x, y);
> +	if (panic->tiling)
> +		offset = panic->tiling(sb->width, x, y);
>   	else
>   		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
>   
> @@ -98,14 +98,15 @@ static struct intel_panic *i915_gem_object_alloc_panic(void)
>    * pfn is not supported yet.
>    */
>   static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -				       struct drm_gem_object *_obj)
> +				       struct drm_gem_object *_obj,
> +				       unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width))
>   {
> -	struct intel_framebuffer *fb = sb->private;
> -	bool panic_tiling = fb->panic_tiling;
>   	enum i915_map_type has_type;
>   	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
>   	void *ptr;
>   
> +	sb->private = panic;
> +
>   	ptr = page_unpack_bits(obj->mm.mapping, &has_type);
>   	if (ptr) {
>   		if (i915_gem_object_has_iomem(obj))
> @@ -113,8 +114,10 @@ static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_sca
>   		else
>   			iosys_map_set_vaddr(&sb->map[0], ptr);
>   
> -		if (panic_tiling)
> +		if (tiling) {
> +			panic->tiling = tiling;
>   			sb->set_pixel = i915_gem_object_panic_map_set_pixel;
> +		}
>   		return 0;
>   	}
>   	if (i915_gem_object_has_struct_page(obj)) {
> @@ -122,6 +125,7 @@ static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_sca
>   		if (!panic->pages)
>   			return -ENOMEM;
>   		panic->page = -1;
> +		panic->tiling = tiling;
>   		sb->set_pixel = i915_gem_object_panic_page_set_pixel;
>   		return 0;
>   	}
> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
> index 4b86760ec00a..12c6fb99015d 100644
> --- a/drivers/gpu/drm/xe/display/xe_panic.c
> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
> @@ -5,7 +5,6 @@
>   #include <drm/drm_panic.h>
>   #include <drm/intel/display_parent_interface.h>
>   
> -#include "intel_display_types.h"
>   #include "xe_bo.h"
>   #include "xe_panic.h"
>   #include "xe_res_cursor.h"
> @@ -17,6 +16,7 @@ struct intel_panic {
>   	int page;
>   
>   	struct xe_bo *bo;
> +	unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width);
>   };
>   
>   static void xe_panic_kunmap(struct intel_panic *panic)
> @@ -37,14 +37,13 @@ static void xe_panic_kunmap(struct intel_panic *panic)
>   static void xe_panic_page_set_pixel(struct drm_scanout_buffer *sb, unsigned int x,
>   				    unsigned int y, u32 color)
>   {
> -	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> -	struct intel_panic *panic = fb->panic;
> +	struct intel_panic *panic = sb->private;
>   	struct xe_bo *bo = panic->bo;
>   	unsigned int new_page;
>   	unsigned int offset;
>   
> -	if (fb->panic_tiling)
> -		offset = fb->panic_tiling(sb->width, x, y);
> +	if (panic->tiling)
> +		offset = panic->tiling(sb->width, x, y);
>   	else
>   		offset = y * sb->pitch[0] + x * sb->format->cpp[0];
>   
> @@ -86,7 +85,8 @@ static struct intel_panic *xe_panic_alloc(void)
>   }
>   
>   static int xe_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -			  struct drm_gem_object *obj)
> +			  struct drm_gem_object *obj,
> +			  unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width))
>   {
>   	struct xe_bo *bo = gem_to_xe_bo(obj);
>   
> @@ -95,8 +95,11 @@ static int xe_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *
>   
>   	panic->page = -1;
>   	panic->bo = bo;
> +	panic->tiling = tiling;
>   
> +	sb->private = panic;
>   	sb->set_pixel = xe_panic_page_set_pixel;
> +
>   	return 0;
>   }
>   
> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
> index b0362e231d84..de395df9ca30 100644
> --- a/include/drm/intel/display_parent_interface.h
> +++ b/include/drm/intel/display_parent_interface.h
> @@ -168,7 +168,8 @@ struct intel_display_overlay_interface {
>   struct intel_display_panic_interface {
>   	struct intel_panic *(*alloc)(void);
>   	int (*setup)(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -		     struct drm_gem_object *obj);
> +		     struct drm_gem_object *obj,
> +		     unsigned int (*tiling)(unsigned int x, unsigned int y, unsigned int width));
>   	void (*finish)(struct intel_panic *panic);
>   };
>   

