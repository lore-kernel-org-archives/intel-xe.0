Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC50CD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4B510EF06;
	Mon,  8 Jun 2026 08:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IN5q5ido";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B33610EF02
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780906939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4kAa63BRayb7XHjBTyXwMyVrN9cu/EVgcoq30zcjEV4=;
 b=IN5q5idorUz1Pg5W8hWOJUK0RNfAcNeYNdI+NeWPEBihf2kK5Rt6ql94jdqtSHtvEag4d+
 tpW5bZRlncBOAfVsRE89WGwUSJUNQvMpdrg44+ELHFcYzResbyY61rCV061pQdWaT27RAw
 OQ8A0LlwA00mLDU/HBy2e2FMxcVC5pY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-5iclDlWMNkGBuQA1sOW98w-1; Mon, 08 Jun 2026 04:22:18 -0400
X-MC-Unique: 5iclDlWMNkGBuQA1sOW98w-1
X-Mimecast-MFC-AGG-ID: 5iclDlWMNkGBuQA1sOW98w_1780906937
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-460129ef947so2384050f8f.1
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jun 2026 01:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780906937; x=1781511737;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4kAa63BRayb7XHjBTyXwMyVrN9cu/EVgcoq30zcjEV4=;
 b=ji13xYvtAUaVy0VY5bIryTlewSlhqJjC8UBdKHykWfcn5ZroGtUk0g/xgf5pltE8xe
 cLXiza7wd5oBBdOcwYNskQgEDwrPurEox+X9t59yJSphN89FUw8CiNN6NhKMU2dNamG7
 PW11m2E9Gwm5lsudUrWmo91lJTDfykAoDWxjFduQI3mi0lqSWIV1W+bI24x4od1HE0V0
 qENrzY4JC9yVL64KhAZfh+d5WEGCWNu/z4GVGXAZdmePLlz+NDtHdslTQZtv9IT869MC
 hVV8UZt5haNI+6P9CsEKhXGpIDli1/f0iIQUzVYBwO4OcpH99qzvgGdHRnyYoLYqzTMA
 wxAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/2um5joKgwXleTmk6mwHbgnJmjdsoKw3UVhPiOy8vOEpXSi85aew/BDLtJvxgYTPZUt6V6soVtvg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoJwxwgnXWkj9Ro7DSRhDpUHmBOI26om3NuO3/9LOMw2EKGLAj
 Cyw3r5W/K0Jursw+qsAIO8Yiaeywns5gT288ZykkoAvMa1nTX16uThNSNq1Y5q0Xvpr/zi661pv
 9WUCpOoi1BCIsOPH17IxqsL68PPAy8vhOIP+EfJZvv3ImikT5fRthF/io+9aFeG+2or7k
X-Gm-Gg: Acq92OF1wSwCv7YxQgXikCsbFWCqqHNx+KgZbvhkmlOyPLvotBT7MddunSF/aD/jAf5
 kZqT+R6Lih4Ni91HvqRmI4+Q+MuYxwXhjNceFUV0T2l5udb8OuurZViQYLwxVv4tS4NAioSUhpV
 yGWFwnvDRtERVCJv7QNT88+nriMMPbNRnsiUUqR8lqlIX9Kq4J6OO4N30GTmRD1efB3U60WT9+W
 G/osZBo6YN1wJ1EKFs+8j/wICr/CDPqm6O7g1WHOnNB6dShTNoCsUtKyw1uI5yvnXkR/BEGgP4R
 vQjMWYdMbMDZXnFkUMWlShGksCE4ZCY9UZfpG8+mkAdQ9boL0LL9fRfbB2zIsOysTghD8iyhA7/
 ZJEFBrGcQrAIpinuEDZZYln6B7qiW831hIZKSsh6k1uvoi9PoaJVHaoUtAAcOMFXJZnrtyQ5T
X-Received: by 2002:a05:6000:178e:b0:460:3234:293e with SMTP id
 ffacd0b85a97d-46032342a79mr22044813f8f.41.1780906936897; 
 Mon, 08 Jun 2026 01:22:16 -0700 (PDT)
X-Received: by 2002:a05:6000:178e:b0:460:3234:293e with SMTP id
 ffacd0b85a97d-46032342a79mr22044776f8f.41.1780906936480; 
 Mon, 08 Jun 2026 01:22:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ec71:10ae:399e:d3c8?
 ([2a01:e0a:c:37e0:ec71:10ae:399e:d3c8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f351ac0sm90671301f8f.27.2026.06.08.01.22.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 01:22:16 -0700 (PDT)
Message-ID: <2efdd3ae-5428-42e9-8a02-3a991bc3d58e@redhat.com>
Date: Mon, 8 Jun 2026 10:22:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/{i915,xe}/panic: pass obj to panic setup
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <cover.1780394867.git.jani.nikula@intel.com>
 <840c4ccaced5f1c82277285938287776c8cdf513.1780394867.git.jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <840c4ccaced5f1c82277285938287776c8cdf513.1780394867.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: n7RH4De1jiBdRsmi8CDanA5dC9VbOXHu2ZqQ9oK-fNM_1780906937
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
> Start reducing i915 and xe core dependency on struct intel_framebuffer
> by passing the fb obj from display.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_parent.c  | 5 +++--
>   drivers/gpu/drm/i915/display/intel_parent.h  | 3 ++-
>   drivers/gpu/drm/i915/display/intel_plane.c   | 2 +-
>   drivers/gpu/drm/i915/gem/i915_gem_panic.c    | 5 ++---
>   drivers/gpu/drm/xe/display/xe_panic.c        | 6 +++---
>   include/drm/intel/display_parent_interface.h | 3 ++-
>   6 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.c b/drivers/gpu/drm/i915/display/intel_parent.c
> index a5816561be40..0b2bc2d38442 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.c
> +++ b/drivers/gpu/drm/i915/display/intel_parent.c
> @@ -251,9 +251,10 @@ struct intel_panic *intel_parent_panic_alloc(struct intel_display *display)
>   	return display->parent->panic->alloc();
>   }
>   
> -int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic, struct drm_scanout_buffer *sb)
> +int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic,
> +			     struct drm_scanout_buffer *sb, struct drm_gem_object *obj)
>   {
> -	return display->parent->panic->setup(panic, sb);
> +	return display->parent->panic->setup(panic, sb, obj);
>   }
>   
>   void intel_parent_panic_finish(struct intel_display *display, struct intel_panic *panic)
> diff --git a/drivers/gpu/drm/i915/display/intel_parent.h b/drivers/gpu/drm/i915/display/intel_parent.h
> index 27e35f891a6b..4197d1b1af61 100644
> --- a/drivers/gpu/drm/i915/display/intel_parent.h
> +++ b/drivers/gpu/drm/i915/display/intel_parent.h
> @@ -105,7 +105,8 @@ void intel_parent_overlay_cleanup(struct intel_display *display);
>   
>   /* panic */
>   struct intel_panic *intel_parent_panic_alloc(struct intel_display *display);
> -int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic, struct drm_scanout_buffer *sb);
> +int intel_parent_panic_setup(struct intel_display *display, struct intel_panic *panic,
> +			     struct drm_scanout_buffer *sb, struct drm_gem_object *obj);
>   void intel_parent_panic_finish(struct intel_display *display, struct intel_panic *panic);
>   
>   /* pc8 */
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> index f55a6a2f7dd1..75eae994433d 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -1590,7 +1590,7 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
>   				return -EOPNOTSUPP;
>   		}
>   		sb->private = fb;
> -		ret = intel_parent_panic_setup(display, fb->panic, sb);
> +		ret = intel_parent_panic_setup(display, fb->panic, sb, obj);
>   		if (ret)
>   			return ret;
>   	}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_panic.c b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> index bb26a0ece176..001ccfbf7ab7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> @@ -5,7 +5,6 @@
>   #include <drm/drm_panic.h>
>   #include <drm/intel/display_parent_interface.h>
>   
> -#include "display/intel_fb.h"
>   #include "display/intel_display_types.h"
>   #include "i915_gem_object.h"
>   #include "i915_gem_panic.h"
> @@ -98,10 +97,10 @@ static struct intel_panic *i915_gem_object_alloc_panic(void)
>    * Use current vaddr if it exists, or setup a list of pages.
>    * pfn is not supported yet.
>    */
> -static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
> +static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> +				       struct drm_gem_object *_obj)
>   {
>   	struct intel_framebuffer *fb = sb->private;
> -	struct drm_gem_object *_obj = intel_fb_bo(&fb->base);
>   	bool panic_tiling = fb->panic_tiling;
>   	enum i915_map_type has_type;
>   	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> diff --git a/drivers/gpu/drm/xe/display/xe_panic.c b/drivers/gpu/drm/xe/display/xe_panic.c
> index bebb21d617f0..d7f456eec597 100644
> --- a/drivers/gpu/drm/xe/display/xe_panic.c
> +++ b/drivers/gpu/drm/xe/display/xe_panic.c
> @@ -84,10 +84,10 @@ static struct intel_panic *xe_panic_alloc(void)
>   	return panic;
>   }
>   
> -static int xe_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
> +static int xe_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> +			  struct drm_gem_object *obj)
>   {
> -	struct intel_framebuffer *fb = (struct intel_framebuffer *)sb->private;
> -	struct xe_bo *bo = gem_to_xe_bo(intel_fb_bo(&fb->base));
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
>   
>   	if (xe_bo_is_vram(bo) && !xe_bo_is_visible_vram(bo))
>   		return -ENODEV;
> diff --git a/include/drm/intel/display_parent_interface.h b/include/drm/intel/display_parent_interface.h
> index 39991afeb173..b0362e231d84 100644
> --- a/include/drm/intel/display_parent_interface.h
> +++ b/include/drm/intel/display_parent_interface.h
> @@ -167,7 +167,8 @@ struct intel_display_overlay_interface {
>   
>   struct intel_display_panic_interface {
>   	struct intel_panic *(*alloc)(void);
> -	int (*setup)(struct intel_panic *panic, struct drm_scanout_buffer *sb);
> +	int (*setup)(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> +		     struct drm_gem_object *obj);
>   	void (*finish)(struct intel_panic *panic);
>   };
>   

