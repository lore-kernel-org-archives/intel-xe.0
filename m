Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A051CD8C9D
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jun 2026 08:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09ABF10EF02;
	Mon,  8 Jun 2026 08:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="T7zYkdro";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E65510EF01
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jun 2026 08:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1780906914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TvKi7hHK4zU3ZCrYZZQvS5ylH8i61p4Oua/8vay2eF8=;
 b=T7zYkdro2Z9y93zgA+lPltGRM1xz43ViWvswKwDAPQL1fwl3dlY1E541jpjNoGsTKiBN1G
 Z3QGa68jq2SaO04ch148JVroru6RsK/qus/NdTK5r766c89Vvr6dbYsATU2GVGlHzBrPzc
 mz8kg7oYHCitq4rMI6ppa9R4T9I+CzI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-V952K-qGMw-MyyiewRUtfw-1; Mon, 08 Jun 2026 04:21:53 -0400
X-MC-Unique: V952K-qGMw-MyyiewRUtfw-1
X-Mimecast-MFC-AGG-ID: V952K-qGMw-MyyiewRUtfw_1780906912
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-bec44ccbbd0so279751566b.2
 for <intel-xe@lists.freedesktop.org>; Mon, 08 Jun 2026 01:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780906912; x=1781511712;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TvKi7hHK4zU3ZCrYZZQvS5ylH8i61p4Oua/8vay2eF8=;
 b=k3H1chk/52NAMrmVSbGSeyTZajrN9I4uuAQsUSXmiydUfWgTEjQG/d8WEC7Hq2asaf
 ADKtcwbXA3O4CDr0psgh4g5l9AhaK96jnsmfLKMWHIZ7/DgHe9K7+SXkmed0UrIRAmOS
 k6rPPj3UhHnsBRwlT+4b5p7ermtIDD/kOkeo1CZaNu5alI0E0JS/BL1xNn04GDqDMroM
 Or3H0evpb5F/HtqQa/CGR8S7UlVAbirU9/2swtV6IZ60M/l7g3/RUZkaVV5838AveL3r
 5gAQfkn+AZZxxc4G0+fr+PcFfpiLz+ztkghdtaE6fZrBeYG8bz9dJzJQiqF8cG1mOxQE
 /Wdw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8njDhef4IODTOMylYZcfIw8PgjPdIyhhnlF4UI06a7AGkt3KEN88AEDl3BoO/9KU3JKy7G5hS5uw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/qmbkSRIOXROfo+qbJQN1AswLgb5rINZC4jdv3Vta5hU5FjFi
 V3giNMn+GqDojpF8sLY4bZ2m79PEdhgnbfUKBCktXAw0o0gevt7b5sLAfL2fIZ8L8q4bOMlnGfP
 3P4i7hZm/ZNU49ZDd/Gf0kaE8GjxUfFUQ0XMMBZsZA49Y3ptAZNx3k4BTgSBCwxGdL70K
X-Gm-Gg: Acq92OFiznd7eigW1LvYeEM/l1+ieGWSdDgoq+oXDu5N2CODD7U/7cGQnoL8D0MjPFK
 sbJhrwBBelacZFEw9jAatL9QwWNm+SHyRj236Kis2wJhq2hcn6HyOL5csMCBnBOqgzvbZaIbqyY
 gAwMEIeETffq3JJ2fjGHAGCziul006mg4s1SbZ8fNuKZRhzopI/MK4yN//eIy26NNfpaJWhXl9Y
 WVAiZsKoAoa5TX9I/0FuaVz29kN3mjhnCREViGrXzj4Z/FJSy9RXOUgdOqdvF+kd5OS+Ac9vUpt
 d3PGt6jPGr0KgBuxGUf1TJXyYHu1cqU/myLnTEVT+gfVxPVoC7W67CaHTCkKO4xH9jP8GIV0pnL
 dCG4dQ0quWDnvgsApF9dTC7zHTISko+HDqEFw0fBySXXZDlh6NFkIbLlOahN1McV0aHBKS72J
X-Received: by 2002:a17:907:1ca9:b0:be9:45e8:1767 with SMTP id
 a640c23a62f3a-bf370c61226mr781630966b.19.1780906912037; 
 Mon, 08 Jun 2026 01:21:52 -0700 (PDT)
X-Received: by 2002:a17:907:1ca9:b0:be9:45e8:1767 with SMTP id
 a640c23a62f3a-bf370c61226mr781629966b.19.1780906911490; 
 Mon, 08 Jun 2026 01:21:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ec71:10ae:399e:d3c8?
 ([2a01:e0a:c:37e0:ec71:10ae:399e:d3c8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf2f2da4447sm549097466b.10.2026.06.08.01.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2026 01:21:51 -0700 (PDT)
Message-ID: <2fcaa54c-7e80-4107-a38d-950c54f2b2cc@redhat.com>
Date: Mon, 8 Jun 2026 10:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/i915/panic: remove the extra layer from panic
 hooks
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <cover.1780394867.git.jani.nikula@intel.com>
 <69a776c2951b3d1f81d8eb3870cbc7fda4d1c6e0.1780394867.git.jani.nikula@intel.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <69a776c2951b3d1f81d8eb3870cbc7fda4d1c6e0.1780394867.git.jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VE2cctUJxAyDr4ymJ-ITbqsIHvdo9l-VCZ3LrbKzj0U_1780906912
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
> The extra layer in the panic hooks is useless. Remove it.
> 

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_panic.c | 30 ++++++-----------------
>   1 file changed, 7 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_panic.c b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> index 14ea45dcdd8f..bb26a0ece176 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_panic.c
> @@ -98,9 +98,11 @@ static struct intel_panic *i915_gem_object_alloc_panic(void)
>    * Use current vaddr if it exists, or setup a list of pages.
>    * pfn is not supported yet.
>    */
> -static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb,
> -				       struct drm_gem_object *_obj, bool panic_tiling)
> +static int i915_gem_object_panic_setup(struct intel_panic *panic, struct drm_scanout_buffer *sb)
>   {
> +	struct intel_framebuffer *fb = sb->private;
> +	struct drm_gem_object *_obj = intel_fb_bo(&fb->base);
> +	bool panic_tiling = fb->panic_tiling;
>   	enum i915_map_type has_type;
>   	struct drm_i915_gem_object *obj = to_intel_bo(_obj);
>   	void *ptr;
> @@ -135,26 +137,8 @@ static void i915_gem_object_panic_finish(struct intel_panic *panic)
>   	panic->pages = NULL;
>   }
>   
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
>   const struct intel_display_panic_interface i915_display_panic_interface = {
> -	.alloc = intel_panic_alloc,
> -	.setup = intel_panic_setup,
> -	.finish = intel_panic_finish,
> +	.alloc = i915_gem_object_alloc_panic,
> +	.setup = i915_gem_object_panic_setup,
> +	.finish = i915_gem_object_panic_finish,
>   };

