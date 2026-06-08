Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C30FCD8C92
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4012B10EEFE;
	Mon,  8 Jun 2026 08:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I+68rarX";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3521710EEFD
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780906843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PnAAdjcaAYJ8mdyllqYpgwzAqcrvtzDdSQeDNN5TUTs=;
 b=I+68rarXOkCGn5NSzJ6kihxCo/giCkMolsNxUhBp6x74OGJYI6jOmnqI/YJiyRIJYQMMap
 meOTNIcZ4IKxPWjt1C2c9gmZZq8KkJ5fodUkJPfjJorx8Kbj9lacfKIXtuhX3Oi6u4yZWN
 Q3DNFz3FO8WSBSJrv6i8UIxyv/iucmc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-_Uzm6th5NMyNbFdWZeh3yA-1; Mon, 08 Jun 2026 04:20:38 -0400
X-MC-Unique: _Uzm6th5NMyNbFdWZeh3yA-1
X-Mimecast-MFC-AGG-ID: _Uzm6th5NMyNbFdWZeh3yA_1780906837
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-becd1c46294so387619166b.2
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jun 2026 01:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780906837; x=1781511637;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PnAAdjcaAYJ8mdyllqYpgwzAqcrvtzDdSQeDNN5TUTs=;
 b=b92ZbSOwdnaESKhBKHZqWKvTeSw6UVJ2Rjm6xSHyBifQtFONtU6jOCZfIpaKfhp2B7
 xilYleK0Frr10rCVelnER929QMIOJMd/h20sA7QeO3fbKg0yJQv4fsB6sFmLru6w7Ah+
 Ni4CVvaKIH3E7kXaoZ7SFK2i3FOjGKpUHYdO1gAoEyzSBflG1xvrmE+JFXdOD8Zep80O
 OQDgD9aWf0seIhscR1ElSBTYcqenhLh88IGiGrUxXrDu9pIVrJQMgBQewgFujqa3c0zj
 ndU9Azcf+O87qzJHLqOvBNai7CWBu41L5nQkYK9VEz+kAb0yBSK2njQ96Zi4+i5ae5a2
 cjhg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9tdmP86ubekZZOtKDJXCxfoNiBV9OP80D/u5Rv4hti1zGbCR9kok2iEyAM51vJOeAEY4qja8aDnw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUXoesCvL1Vno5hlNVlT9AI7Aneao3kG4CEmg/HyptGNCockql
 GCScR1U6vaX53NT3TZxvWrugihpoKl66COptWSJiWqIWwNtdIsj4RqRmPp6cSQB2DqEZ9UY1Mim
 SbNm6Ue6p523n2b2LLVG+eAr0fHjbPmLsatqll6+j/u2e9XB0dx6xJvoKnWq71UFmZRcY6+5iFt
 tb
X-Gm-Gg: Acq92OFUSPNkhfC6ullA0Pb9YW1szUkIEGOK/AQDpsDsjSgtll14/V7eg37lN0GCjjY
 pcu7PFSeojgZjIif/+obkYcmmfSVaIL/hk8+Ck5sj+MxMCEzGr+gvNnV2H8wkYHW0Pk4ZCmRK/d
 J6NYFk5/JYTsH0YxatRVy5j/xYrD7CPf5NnUq8PqCK7+rU0CyLo6S5SW5tWQP0wu1moV1Nvoe27
 y+UtPCfDSczECsVCGXX6yy2T2A2Z4rUcB/sH/qvIxIR3mWKQpXjOY97bPwbOZ44YOM6pgReDfkw
 /gbDUE4b8SY/aSI3yyl89/5CSh2LSb1mv0YALKjrxy0mlPt8gT8gDM0HIClDC3cW3jLSdRD9BsP
 KrQV5v6+Q1leT8tPu3m3ybn76WeoukDhv5pFI24S57KO3tqdM4Xc2nnuO1GeqJrJQybqxOi8N
X-Received: by 2002:a17:907:a315:b0:bed:83ee:922b with SMTP id
 a640c23a62f3a-bf36fd9c96dmr670551266b.7.1780906837250; 
 Mon, 08 Jun 2026 01:20:37 -0700 (PDT)
X-Received: by 2002:a17:907:a315:b0:bed:83ee:922b with SMTP id
 a640c23a62f3a-bf36fd9c96dmr670549666b.7.1780906836688; 
 Mon, 08 Jun 2026 01:20:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ec71:10ae:399e:d3c8?
 ([2a01:e0a:c:37e0:ec71:10ae:399e:d3c8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf054e051a5sm833263066b.35.2026.06.08.01.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 01:20:36 -0700 (PDT)
Message-ID: <ab4f30a7-0a9b-4ea2-9541-37d403ff44aa@redhat.com>
Date: Mon, 8 Jun 2026 10:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/i915/panic: squash i915_panic.c into
 i915_gem_panic.c
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <cover.1780394867.git.jani.nikula@intel.com>
 <4c294d6402e003040b934d94a0b14bd42704e21f.1780394867.git.jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4c294d6402e003040b934d94a0b14bd42704e21f.1780394867.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lUeNeEoaoNarElHNkrCYj0eRKLTJsfLNlq34zt1VigU_1780906837
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
> Having two small files for panic handling is a bit too much. Merge
> i915_panic.c into i915_gem_panic.c. This is just code movement, cleanups
> will follow.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile             |  3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_panic.c | 33 ++++++++++++++++++---
>   drivers/gpu/drm/i915/gem/i915_gem_panic.h |  9 +-----
>   drivers/gpu/drm/i915/i915_driver.c        |  2 +-
>   drivers/gpu/drm/i915/i915_panic.c         | 35 -----------------------
>   drivers/gpu/drm/i915/i915_panic.h         |  9 ------
>   6 files changed, 32 insertions(+), 59 deletions(-)
>   delete mode 100644 drivers/gpu/drm/i915/i915_panic.c
>   delete mode 100644 drivers/gpu/drm/i915/i915_panic.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 091b6647c383..1fd7a1a5f315 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -83,8 +83,7 @@ i915-y += \
>   	i915_fb_pin.o \
>   	i915_hdcp_gsc.o \
>   	i915_initial_plane.o \
> -	i915_overlay.o \
> -	i915_panic.o
> +	i915_overlay.o
>   
>   # "Graphics Technology" (aka we talk to the gpu)
>   gt-y += \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_panic.c b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> index 7407c5668c71..14ea45dcdd8f 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> @@ -3,6 +3,7 @@
>   
>   #include <drm/drm_cache.h>
>   #include <drm/drm_panic.h>
> +#include <drm/intel/display_parent_interface.h>
>   
>   #include "display/intel_fb.h"
>   #include "display/intel_display_types.h"
> @@ -83,7 +84,7 @@ static void i915_gem_object_panic_page_set_pixel(struct drm_scanout_buffer *sb,
>   	}
>   }
>   
> -struct intel_panic *i915_gem_object_alloc_panic(void)
> +static struct intel_panic *i915_gem_object_alloc_panic(void)
>   {
>   	struct intel_panic *panic;
>   
> @@ -97,8 +98,8 @@ struct intel_panic *i915_gem_object_alloc_panic(void)
>    * Use current vaddr if it exists, or setup a list of pages.
>    * pfn is not supported yet.
>    */
> -int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -				struct drm_gem_object *_obj, bool panic_tiling)
> +static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> +				       struct drm_gem_object *_obj, bool panic_tiling)
>   {
>   	enum i915_map_type has_type;
>   	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
> @@ -126,10 +127,34 @@ int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_bu
>   	return -EOPNOTSUPP;
>   }
>   
> -void i915_gem_object_panic_finish(struct intel_panic *panic)
> +static void i915_gem_object_panic_finish(struct intel_panic *panic)
>   {
>   	i915_panic_kunmap(panic);
>   	panic->page = -1;
>   	kfree(panic->pages);
>   	panic->pages = NULL;
>   }
> +
> +static struct intel_panic *intel_panic_alloc(void)
> +{
> +	return i915_gem_object_alloc_panic();
> +}
> +
> +static int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
> +{
> +	struct intel_framebuffer *fb = sb->private;
> +	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
> +
> +	return i915_gem_object_panic_setup(panic, sb, obj, fb->panic_tiling);
> +}
> +
> +static void intel_panic_finish(struct intel_panic *panic)
> +{
> +	return i915_gem_object_panic_finish(panic);
> +}
> +
> +const struct intel_display_panic_interface i915_display_panic_interface = {
> +	.alloc = intel_panic_alloc,
> +	.setup = intel_panic_setup,
> +	.finish = intel_panic_finish,
> +};
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_panic.h b/drivers/gpu/drm/i915/gem/i915_gem_panic.h
> index 91ab6722d37c..82c3aca6f1f3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_panic.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_panic.h
> @@ -6,13 +6,6 @@
>   
>   #include <linux/types.h>
>   
> -struct drm_gem_object;
> -struct drm_scanout_buffer;
> -struct intel_panic;
> -
> -struct intel_panic *i915_gem_object_alloc_panic(void);
> -int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -				struct drm_gem_object *_obj, bool panic_tiling);
> -void i915_gem_object_panic_finish(struct intel_panic *panic);
> +extern const struct intel_display_panic_interface i915_display_panic_interface;
>   
>   #endif /* __I915_GEM_PANIC_H__ */
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index 60d5e06675ab..8294899a52d4 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -80,6 +80,7 @@
>   #include "gem/i915_gem_ioctls.h"
>   #include "gem/i915_gem_mman.h"
>   #include "gem/i915_gem_object_frontbuffer.h"
> +#include "gem/i915_gem_panic.h"
>   #include "gem/i915_gem_pm.h"
>   #include "gt/intel_gt.h"
>   #include "gt/intel_gt_pm.h"
> @@ -112,7 +113,6 @@
>   #include "i915_irq.h"
>   #include "i915_memcpy.h"
>   #include "i915_overlay.h"
> -#include "i915_panic.h"
>   #include "i915_perf.h"
>   #include "i915_query.h"
>   #include "i915_reg.h"
> diff --git a/drivers/gpu/drm/i915/i915_panic.c b/drivers/gpu/drm/i915/i915_panic.c
> deleted file mode 100644
> index 412db72797d8..000000000000
> --- a/drivers/gpu/drm/i915/i915_panic.c
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/* Copyright © 2025 Intel Corporation */
> -
> -#include <drm/drm_panic.h>
> -#include <drm/intel/display_parent_interface.h>
> -
> -#include "display/intel_display_types.h"
> -#include "display/intel_fb.h"
> -#include "gem/i915_gem_panic.h"
> -
> -#include "i915_panic.h"
> -
> -static struct intel_panic *intel_panic_alloc(void)
> -{
> -	return i915_gem_object_alloc_panic();
> -}
> -
> -static int intel_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
> -{
> -	struct intel_framebuffer *fb = sb->private;
> -	struct drm_gem_object *obj = intel_fb_bo(&fb->base);
> -
> -	return i915_gem_object_panic_setup(panic, sb, obj, fb->panic_tiling);
> -}
> -
> -static void intel_panic_finish(struct intel_panic *panic)
> -{
> -	return i915_gem_object_panic_finish(panic);
> -}
> -
> -const struct intel_display_panic_interface i915_display_panic_interface = {
> -	.alloc = intel_panic_alloc,
> -	.setup = intel_panic_setup,
> -	.finish = intel_panic_finish,
> -};
> diff --git a/drivers/gpu/drm/i915/i915_panic.h b/drivers/gpu/drm/i915/i915_panic.h
> deleted file mode 100644
> index 743d8c861c42..000000000000
> --- a/drivers/gpu/drm/i915/i915_panic.h
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/* Copyright © 2025 Intel Corporation */
> -
> -#ifndef __I915_PANIC_H__
> -#define __I915_PANIC_H__
> -
> -extern const struct intel_display_panic_interface i915_display_panic_interface;
> -
> -#endif /* __I915_PANIC_H__ */

