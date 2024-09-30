Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFD0CF6497
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 11:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A82310E008;
	Mon, 30 Sep 2024 11:49:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iMDs7fC0";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960CE10E008
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727696987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hRHusF2u13MvXHMTKgH6gtL/plFCBlz+aey7QHJzopk=;
 b=iMDs7fC0nd5oK2id//Y7BoLLvBJdy2YG8pWhG4+Yt0hmm8ZPdtjyCN82F1YGfUOADGhq8i
 o5kBDwNyUA7pgwXZF05/swrAm0h1O0hqcAEUbktYdffzha+y4cOoLpriSZY/GhWdx5+ksi
 qYxBGFI6pKMNISP4CePIyB7oK1ElThk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-oUXFxgWIPmyHaCPW9CgC8Q-1; Mon, 30 Sep 2024 07:49:46 -0400
X-MC-Unique: oUXFxgWIPmyHaCPW9CgC8Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cb9e14ab6so32549345e9.3
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Sep 2024 04:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727696985; x=1728301785;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hRHusF2u13MvXHMTKgH6gtL/plFCBlz+aey7QHJzopk=;
 b=nmqUPFuxqzbJsMCBQvGDx7E45HftoTWygQIIB5ExoCU3xmwIUoWa9vOiHYaAiCgeRt
 b/EHzw75q9emF/U7wi4CeDtyZQ0Ltdq3kzj2XxCR6RnpAD6FfV/vDDzbK/GOFgfgY0zP
 y92/YMWKYoFEHe5cHy9m9AEcheIAALaet+GxcdkCfPXOunx/ilXTACRI6JinQzRLlTQN
 b9igNtXDbLD9X8VZ0VPGLF5AeWGRGb1teXbUtOD7xA3zqFBrbJHUeQocUbn2BlJQoC5L
 YtwjlOjQan6oKefN+PHPO4i2wQdfT+boFN5KnqN261Wl4uD9VRzabPNXj3MnDKbZzuFE
 X16A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXmUaSuEDFYGaWk1ItdbUdru6DBFMlVE3yCNXtJIyAFAWxiREEW8VYql5AssE2e4C0lbbqfdDZ4Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsOKMR7zAixe39WpzmuWSi+V70gKo8SZo7LyO3YxhlxQ8JYllc
 mfgTcKHFcB95rtOIXYoFjlQX/R18RIO/im+YcY+NVtWjVJ/RDygRarPB6D1sOTDekJxDFLApw36
 9pR/iv7VdebmUue5ZMbiWU9xN7Fj3vy+epJteOOsiFWNgIYnGBRpgA2hSEI11iEtv
X-Received: by 2002:adf:e44c:0:b0:37c:d225:6d33 with SMTP id
 ffacd0b85a97d-37cd5b10603mr7648022f8f.55.1727696985234; 
 Mon, 30 Sep 2024 04:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRSGiGfEDOq94l9bERm0mGRovZs/S+44uf5VGWQUgGYf4IhIky78bVci0l0GCqb8jHV0O02A==
X-Received: by 2002:adf:e44c:0:b0:37c:d225:6d33 with SMTP id
 ffacd0b85a97d-37cd5b10603mr7648003f8f.55.1727696984799; 
 Mon, 30 Sep 2024 04:49:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd56e6596sm8910891f8f.63.2024.09.30.04.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:49:44 -0700 (PDT)
Message-ID: <50d1f4d1-538c-4e4d-83eb-4b85f7642eb7@redhat.com>
Date: Mon, 30 Sep 2024 13:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm: Select fbdev helpers for modules that require
 them
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240927144252.31813-1-tzimmermann@suse.de>
 <20240927144252.31813-5-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240927144252.31813-5-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
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

On 27/09/2024 16:37, Thomas Zimmermann wrote:
> Fbdev emulation for SHMEM and TTM requires helpers from the fbdev
> subsystem. Select them from the modules that use them instead of the
> core DRM module.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 1df4e627e3d3..88b2ba55fe16 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -11,7 +11,6 @@ menuconfig DRM
>   	select DRM_PANEL_ORIENTATION_QUIRKS
>   	select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>   	select FB_CORE if DRM_FBDEV_EMULATION
> -	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	select HDMI
>   	select I2C
>   	select DMA_SHARED_BUFFER
> @@ -332,6 +331,7 @@ config DRM_TTM_HELPER
>   	tristate
>   	depends on DRM
>   	select DRM_TTM
> +	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
>   	  Helpers for ttm-based gem objects
>   
> @@ -345,6 +345,7 @@ config DRM_GEM_DMA_HELPER
>   config DRM_GEM_SHMEM_HELPER
>   	tristate
>   	depends on DRM && MMU
> +	select FB_SYSMEM_HELPERS_DEFERRED if DRM_FBDEV_EMULATION
>   	help
>   	  Choose this if you need the GEM shmem helper functions
>   

