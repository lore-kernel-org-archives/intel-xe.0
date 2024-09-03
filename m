Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD2FCD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC2710E552;
	Tue,  3 Sep 2024 12:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KAro8FzY";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028AF10E553
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lYL4yI1IqzmTa462iF0M0rcy8Y9bEoz/jvmUsF6QjPQ=;
 b=KAro8FzYiRqMaGblGMtv4F+DwZAYmvsAv1omoQBGCDyLrUMS5459E4AuRBlndmzO2AQgM0
 CeGfozoBfALlP2z2qeQnntK3vr42QYEDkYUfEoCEc2/jQQzYvXOyiI3saylSM6W8kNXnza
 lZSaz2Z1K62aYg/57iTy1OwkQiEwlhk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-wG9P6LzjN5iOmprBKsNlVg-1; Tue, 03 Sep 2024 08:13:37 -0400
X-MC-Unique: wG9P6LzjN5iOmprBKsNlVg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42ac185e26cso48543655e9.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365616; x=1725970416;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lYL4yI1IqzmTa462iF0M0rcy8Y9bEoz/jvmUsF6QjPQ=;
 b=Y3JL/mVJh3enShD26eeBCYSq9P5MKLXHMVHaDSJ0LYb3WcpjaudO8DlJG+5NxW2M2t
 Fof/f4gm/PChyCCuVfsCHH1M9D4VjuJX9/yUbH9e+zdv8jroj/IaZY9l2HgpkpewT2+P
 RWafAF2vOtN6wtgz/wn9LYLy+NOz/o7HswNDRBtuXgHUX27jHkbagtuCWEaNzb/vCgR1
 bxv/vswoDffCt3LW9zP+ODceFO/Zzdv1EbBRaruOo83KO6p6tpxFynzzK+Y7HvoN+zaU
 xotP/oGFHHEfvTUfP20OTLHmhssXoX8MIFYH5Vny+EevQbq32W49fNLLa1D/ttI9oCuR
 vU8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDW1VO0rhsyFe9MF+muDYxRxGApOp8GtHuwZ6IUkphw8NChcr/zVR2EF+++THvSguN8xGk4Uwqdg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywax9IaIU4DZGhkDSy4BNPrH74l0JTG/5zOoeneoDUdOfjcOfWg
 YiA6Y+kCu4vmnqCOByLb9G8sz0UCDZgCIzJ+3zDoVlo/KYb7neYtTbo3tcPPopDZ7W4c/f8BZyg
 Q9cZEh1I8M7CRrWcvLqzuaZKpj5WaKfyisdz7fTEXmQJwhcCSSlr+pMz78FaKJ8dC
X-Received: by 2002:a05:600c:46c9:b0:42b:8a35:1acf with SMTP id
 5b1f17b1804b1-42bbb436e9amr93420895e9.25.1725365615908; 
 Tue, 03 Sep 2024 05:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKyGHamdOmgpgASh3pFqLFGqaTwSD2fibtBzdjqhIRmCcY1nScQMQjUyszdt7TYUTr28vP9g==
X-Received: by 2002:a05:600c:46c9:b0:42b:8a35:1acf with SMTP id
 5b1f17b1804b1-42bbb436e9amr93420625e9.25.1725365615408; 
 Tue, 03 Sep 2024 05:13:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df9705sm168910015e9.27.2024.09.03.05.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:13:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH v3 75/81] drm/exynos-drm: Run DRM default client setup
In-Reply-To: <20240830084456.77630-76-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-76-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:13:34 +0200
Message-ID: <87ed61c4up.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The exynos-drm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c   |   4 +-
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 101 ++--------------------
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  15 ++--
>  3 files changed, 19 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 7c59e1164a48..2a466d8179f4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -15,6 +15,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_fourcc.h>
> @@ -111,6 +112,7 @@ static const struct drm_driver exynos_drm_driver = {
>  	.dumb_create		= exynos_drm_gem_dumb_create,
>  	.gem_prime_import	= exynos_drm_gem_prime_import,
>  	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
> +	EXYNOS_DRM_FBDEV_DRIVER_OPS,
>  	.ioctls			= exynos_ioctls,
>  	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
>  	.fops			= &exynos_drm_driver_fops,
> @@ -288,7 +290,7 @@ static int exynos_drm_bind(struct device *dev)
>  	if (ret < 0)
>  		goto err_cleanup_poll;
>  
> -	exynos_drm_fbdev_setup(drm);
> +	drm_client_setup(drm, NULL);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index a379c8ca435a..73fa7b77d8d0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -22,9 +22,6 @@
>  #include "exynos_drm_fb.h"
>  #include "exynos_drm_fbdev.h"
>  
> -#define MAX_CONNECTOR		4

I see this constant was unused. Is an unrelated cleanup but I guess is OK too.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

