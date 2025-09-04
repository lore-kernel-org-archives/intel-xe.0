Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF533CA1015
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 11:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D616610EA15;
	Thu,  4 Sep 2025 11:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aMs7NPU6";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1749310EA1C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 11:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756986421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHTlOa6UNeDwG2J7Ek8NZzySxxKAaE1NmJG0gyaITeQ=;
 b=aMs7NPU6xc+Q7WVL1mIxpnKezMVhgnWaRfQ0s6NU/+V3FhAcXJJXOU0Itlx9+Go5MkMxQT
 8Rs1OcJJ/ahmoj8AkQ28qkTpzNoM7ZahcLlP9gA07OelLB39Zc/e6x3AykFGASNPVQk1uO
 U8BxJIfj1PBVbPNS14pBfbHPqTD73wI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-3KWeh6hTORqJAAWZvut1VQ-1; Thu, 04 Sep 2025 07:46:58 -0400
X-MC-Unique: 3KWeh6hTORqJAAWZvut1VQ-1
X-Mimecast-MFC-AGG-ID: 3KWeh6hTORqJAAWZvut1VQ_1756986417
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45b8af0b986so6086355e9.1
 for <intel-xe@lists.freedesktop.org>; Thu, 04 Sep 2025 04:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756986417; x=1757591217;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RHTlOa6UNeDwG2J7Ek8NZzySxxKAaE1NmJG0gyaITeQ=;
 b=RHzKbFpCXq5Qq4sxenZyfJGJiXq8ro3cvpGNqoLOZlJZN0Z1S02FiKiOZBUo99b0Dl
 p4vFxzXEsnq3wx4xLI+4Ck+ElE7xUguBvQsGvSWENwagqBl+D80hMCd3ctzdCbM7nrlw
 SUEQOJ1SW76hwyvDGqy2DsH7v1Md+7wGy0jj5gAvGd8Y+2RWK7/rBVqYF1UJTbCyYQ5H
 AgUo763uYuVPLv7JmdgdDr3ORd0oLbg6G/m8vxhtfC5WahKc+PzoqmExeX0w2F5ylyzd
 Y2uOZdgbEYzBWhHr/jejkmSD/uGQyExuzIIKlqHlx4gKFT8tHYgy1uRtMbfHky1ihJzN
 eZaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvAN4Mlo0hRlSJ+wa0cBo2PJzuXAejKxz0D9u5zbWkPI9BfLn1ztScL2EVLGAj7FOT4ns5PKXdhg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNJ2vdYTl9Fp8Wm/ARRXZmGLy8Zcs0dAhyc+qMbiVXR3V6aDhg
 DhD/zUVgRQh7kUjyX6NB41dUXVr624eGSrRTaPARoPWOWjUC5JQO+R7aLELv/xadYIQZRiNKHaC
 8snB9zjGwx4/scjcgQPdP4O+GqbWXgdiuuDWFiDxTAIDeoij60jmt++mz1JIfh1hxl5Dy
X-Gm-Gg: ASbGncvXzr+1wv6YaWGJ06ioa7TjQpC+QfGOGc7ZhisSmKL26UGoxatGcb8IP8Faeoq
 uID/diZjVfV3SJ+lIOX6K408x9LoFI1VFqebYhcMFgjoxLmZQFF7xr++g/1+U+/rrrr5UUEKu0b
 qeWOTQPP/Pncwq1UeAXuJUcEkv77xTUuWMbgBnqpOEcCtQLzyy6NKaubIsIRHu6AInZGc+OTFvU
 piU/I6wUXAwiO8+M+in5Sze/0CwxpfzrevNNcf7NxrMzeHlU4Td4xRx8tpRuz7RXDL19AF1pUaj
 JUOw9HmgBJnlYXQk57K6n8+OESyTGcXwsbQEiooFyWXl9HW5QhZhzDBwdhNsaenl69RLa5g4vrr
 6SLk=
X-Received: by 2002:a05:600d:1c:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-45b8b957228mr126583905e9.8.1756986417264; 
 Thu, 04 Sep 2025 04:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcBESs0bnQlj7e2HoDXLZr6A8Ni5vaw0eir5JaOdkoa5mA4hedJQiZYq7hmJjzO/2MD8VZGg==
X-Received: by 2002:a05:600d:1c:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-45b8b957228mr126583715e9.8.1756986416822; 
 Thu, 04 Sep 2025 04:46:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3e177488999sm1842730f8f.36.2025.09.04.04.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 04:46:56 -0700 (PDT)
Message-ID: <d34b0f39-2cea-4153-b019-163520f4e486@redhat.com>
Date: Thu, 4 Sep 2025 13:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] drm/{i915, xe}/panic: refactor framebuffer allocation
 etc.
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
References: <cover.1756835342.git.jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cover.1756835342.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XaqtfKDRR9_rF9AuulXpA11vV2cW20BfRRUTalRnHK8_1756986417
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

On 02/09/2025 19:51, Jani Nikula wrote:
> Split out intel_panic functionality separate from intel_bo abstraction,
> and lift the framebuffer allocation back to where it belongs in
> intel_fb.c.
> 
> There's more that should be improved, ideally making struct
> intel_framebuffer opaque towards i915 and xe, but this already goes
> along way in adjusting where the abstractions should happen.

Thanks for this series, this makes sense, and moving the panic part to 
intel_panic.c is a good idea.

I think this may conflict with 
https://patchwork.freedesktop.org/series/150887/ but that should be 
trivial to resolve.

For the whole series:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Best regards,

-- 

Jocelyn

> 
> BR,
> Jani.
> 
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> 
> 
> Jani Nikula (8):
>    drm/i915/fb: add intel_framebuffer_alloc()
>    drm/{i915,xe}/panic: split out intel_panic.[ch]
>    drm/{i915,xe}/panic: rename intel_bo_panic_*() to intel_panic_*()
>    drm/{i915,xe}/fb: add panic pointer member to struct intel_framebuffer
>    drm/{i915,xe}/panic: rename struct {i915,xe}_panic_data to struct
>      intel_panic
>    drm/{i915,xe}/panic: move framebuffer allocation where it belongs
>    drm/{i915,xe}/panic: convert intel_panic_finish() to struct
>      intel_panic
>    drm/{i915,xe}/panic: pass struct intel_panic to intel_panic_setup()
> 
>   drivers/gpu/drm/i915/Makefile                 |  1 +
>   drivers/gpu/drm/i915/display/i9xx_plane.c     |  4 +-
>   drivers/gpu/drm/i915/display/intel_bo.c       | 15 ---
>   drivers/gpu/drm/i915/display/intel_bo.h       |  3 -
>   .../drm/i915/display/intel_display_types.h    |  2 +
>   drivers/gpu/drm/i915/display/intel_fb.c       | 23 ++++-
>   drivers/gpu/drm/i915/display/intel_fb.h       |  3 +
>   drivers/gpu/drm/i915/display/intel_panic.c    | 27 ++++++
>   drivers/gpu/drm/i915/display/intel_panic.h    | 14 +++
>   drivers/gpu/drm/i915/display/intel_plane.c    |  6 +-
>   .../drm/i915/display/skl_universal_plane.c    |  3 +-
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    | 11 ++-
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 40 +++-----
>   drivers/gpu/drm/xe/Makefile                   |  1 +
>   drivers/gpu/drm/xe/display/intel_bo.c         | 91 -------------------
>   drivers/gpu/drm/xe/display/xe_panic.c         | 80 ++++++++++++++++
>   16 files changed, 176 insertions(+), 148 deletions(-)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_panic.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_panic.h
>   create mode 100644 drivers/gpu/drm/xe/display/xe_panic.c
> 

