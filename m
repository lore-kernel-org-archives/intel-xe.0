Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC5ACCD192
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 12:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43E610E7B5;
	Wed, 15 Oct 2025 12:54:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kg1lf13t";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637B810E7B6
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 12:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760532849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=atGKcZC3sNvpACe/RaQhIJlYHUow16Jp47bgsa9EQHc=;
 b=Kg1lf13tTcB2rGQX5TFLSepfPgfXd6dwuYnu+Q7DHjQ7Lp1SVZXiywWd5x+MGtkVzJO4u/
 gbAsRUna4iEoiMwCTL8WFVgZQL/+iqHsEfuYQ4qclp/Pbihsi+P65uBelMhVxDCJZVcRqm
 Cz5VyjuFX8aCKqeXzP+LQzbVycJqqK0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-0qbPUjkNNT6jMoVHV84ONg-1; Wed, 15 Oct 2025 08:54:08 -0400
X-MC-Unique: 0qbPUjkNNT6jMoVHV84ONg-1
X-Mimecast-MFC-AGG-ID: 0qbPUjkNNT6jMoVHV84ONg_1760532847
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-46e509374dcso28746215e9.1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 05:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760532847; x=1761137647;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=atGKcZC3sNvpACe/RaQhIJlYHUow16Jp47bgsa9EQHc=;
 b=Zkm6CyHOBX0EsP+dCJptTeRInYHBFIHyICYIH8bcFg06fu6zr1q5ghgUgK8mOljpiW
 1TCWbyqBDqdJ7aBUgYW/TzgbdQshUdING7r4GSvfIP9hEJif/0MNU3AMdlqChlqekLtR
 EWLQmchQ1YzzufOqT7FmtGN+iUWRCBzqWAtFB1Km24zZwPEWWLdNzeaETbTeZIFFvmwW
 /LeSWhvAGbQT0cugGGdDgFLKTC+6NWmSMKN0Jxzh7clRW1DuYhg6pvsrfc+SmXLFOME0
 xQ1tQh0uRHmfLFmpk3ci1OV9BTVNhWziXR1yLeQhdS9LZB3509BsEZRMTDGzlz4hzonE
 6BYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjtlVcsiS2PTrlaFerEfu60kAirBWBHWCiIiX+zJn7oj1wH/QP+4/FETRwopmd+X6FVvpLjeDsBg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiwaexRCQXZvJJGJDxtrSTAvMCVUViDEO3s8AlfEjfCavaMZLK
 MPrmPjqKkckuq/TzJLjPiIalc8ThvegufWiH9AUuzBSUrtNac+rFtelmZR9q1ur9+JvFw/TDuqN
 Of0D71BhNWn2mkHadYfnVWjrt8cwkNEOzo9U7kxEyyyPU90+cCjTXic86WSLvb/8RIrDk
X-Gm-Gg: ASbGncvbGQKGrRkXFr+t0QEo6qug+r2UcYpd9tIhQ8mFBTG8wIORNDtm+bV02yitCCu
 vAFVp+AoYoyPEgn31CiEg8u+1o7KgNcR6+x5XW/OD5ONBfH4nWFvOphjTjUS94f0/0MSDYGIlxr
 GGzoRIT4xNqM6kor5fmUwruxpMdFCK3aqevqgKcpfzcdAKtlRM8Vtn/LLKXWz9iEl3PwXAe+Pit
 9zcfIz5TdKr2omlVkdsm8zFwvKds0hE/iGN6AAEdr5+vSECWX3ANoXhHZayFas7d0wrezR+ehqi
 cCP4DXncqH1zZ9GFVKvhulr4V0gwpT4hlMGiboD3BOrvtW8BEmqMIjVi1Gy57TPt/frMHhvzB7H
 aiAit
X-Received: by 2002:a05:600c:820a:b0:46e:4704:b01e with SMTP id
 5b1f17b1804b1-46fa9a8631fmr196980285e9.8.1760532846862; 
 Wed, 15 Oct 2025 05:54:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxoQhcABpT7E2xZX9M7ox7u7XqoMo6Q53VzGvuf10iEypikfE6GqHbt2GJa2fYRv+qbquU9w==
X-Received: by 2002:a05:600c:820a:b0:46e:4704:b01e with SMTP id
 5b1f17b1804b1-46fa9a8631fmr196980125e9.8.1760532846438; 
 Wed, 15 Oct 2025 05:54:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471092a2b1dsm620805e9.1.2025.10.15.05.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 05:54:05 -0700 (PDT)
Message-ID: <7e48cc48-564f-486e-b6b3-8fa95068387a@redhat.com>
Date: Wed, 15 Oct 2025 14:54:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/panic: fix panic structure allocation memory
 leak
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, Maarten Lankhorst <dev@lankhorst.se>,
 =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
References: <20251015095135.2183415-1-jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251015095135.2183415-1-jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Zo4b2TQSb3QoZSufXYBWoFo7wQPLHljz7S5qiAyqtM_1760532847
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

On 15/10/2025 11:51, Jani Nikula wrote:
> Separating the panic allocation from framebuffer allocation in commit
> 729c5f7ffa83 ("drm/{i915,xe}/panic: move framebuffer allocation where it
> belongs") failed to deallocate the panic structure anywhere.
> 
> The fix is two-fold. First, free the panic structure in
> intel_user_framebuffer_destroy() in the general case. Second, move the
> panic allocation later to intel_framebuffer_init() to not leak the panic
> structure in error paths (if any, now or later) between
> intel_framebuffer_alloc() and intel_framebuffer_init().
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> v2: Rebase
> 
> Fixes: 729c5f7ffa83 ("drm/{i915,xe}/panic: move framebuffer allocation where it belongs")
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Reported-by: Michał Grzelak <michal.grzelak@intel.com>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Tested-by: Michał Grzelak <michal.grzelak@intel.com> # v1
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_fb.c | 25 +++++++++++++------------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 9c256a2805e4..3958628c73e9 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -2114,6 +2114,7 @@ static void intel_user_framebuffer_destroy(struct drm_framebuffer *fb)
>   
>   	intel_frontbuffer_put(intel_fb->frontbuffer);
>   
> +	kfree(intel_fb->panic);
>   	kfree(intel_fb);
>   }
>   
> @@ -2212,16 +2213,22 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>   	struct intel_display *display = to_intel_display(obj->dev);
>   	struct drm_framebuffer *fb = &intel_fb->base;
>   	u32 max_stride;
> -	int ret = -EINVAL;
> +	int ret;
>   	int i;
>   
> +	intel_fb->panic = intel_panic_alloc();
> +	if (!intel_fb->panic)
> +		return -ENOMEM;
> +
>   	/*
>   	 * intel_frontbuffer_get() must be done before
>   	 * intel_fb_bo_framebuffer_init() to avoid set_tiling vs. addfb race.
>   	 */
>   	intel_fb->frontbuffer = intel_frontbuffer_get(obj);
> -	if (!intel_fb->frontbuffer)
> -		return -ENOMEM;
> +	if (!intel_fb->frontbuffer) {
> +		ret = -ENOMEM;
> +		goto err_free_panic;
> +	}
>   
>   	ret = intel_fb_bo_framebuffer_init(obj, mode_cmd);
>   	if (ret)
> @@ -2320,6 +2327,9 @@ int intel_framebuffer_init(struct intel_framebuffer *intel_fb,
>   	intel_fb_bo_framebuffer_fini(obj);
>   err_frontbuffer_put:
>   	intel_frontbuffer_put(intel_fb->frontbuffer);
> +err_free_panic:
> +	kfree(intel_fb->panic);
> +
>   	return ret;
>   }
>   
> @@ -2346,20 +2356,11 @@ intel_user_framebuffer_create(struct drm_device *dev,
>   struct intel_framebuffer *intel_framebuffer_alloc(void)
>   {
>   	struct intel_framebuffer *intel_fb;
> -	struct intel_panic *panic;
>   
>   	intel_fb = kzalloc(sizeof(*intel_fb), GFP_KERNEL);
>   	if (!intel_fb)
>   		return NULL;
>   
> -	panic = intel_panic_alloc();
> -	if (!panic) {
> -		kfree(intel_fb);
> -		return NULL;
> -	}
> -
> -	intel_fb->panic = panic;
> -
>   	return intel_fb;
>   }
>   

