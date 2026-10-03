Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F15CA5FE3
	for <intel-xe@archiver.kernel.org>; Sat,  3 Oct 2026 11:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C0210E0A1;
	Sat,  3 Oct 2026 11:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KtLAu2Fu";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F7B10E0A1
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Oct 2026 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791026579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6DEk79+AjGFUJq3XsqFxT4woiJPH49kvRHU0q9Llf8=;
 b=KtLAu2Fu83rLHUTKWcTdBny9/bsAiAuLMZ2h7qlNP1g0WLz0bZ2zDbm5EXrWD3lmxMjzOm
 4LhxsK1P/fGGrf+Qt1o03vD51BC7SMzpr0M49KdvTDdKg8Hhx7N5kkxGpjuQanJgTx3FfD
 Guv4NIpvOWd58EMX81UpnHXJN5NyxNM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-L4RY0A0ON-GfdFAi0XKehQ-1; Sat, 03 Oct 2026 07:22:57 -0400
X-MC-Unique: L4RY0A0ON-GfdFAi0XKehQ-1
X-Mimecast-MFC-AGG-ID: L4RY0A0ON-GfdFAi0XKehQ_1791026576
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-48af11f8d62so230624f8f.0
 for <intel-xe@lists.freedesktop.org>; Sat, 03 Oct 2026 04:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791026576; x=1791631376;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=n6DEk79+AjGFUJq3XsqFxT4woiJPH49kvRHU0q9Llf8=;
 b=rNBDJZU+yXvKRKg8pFYLKcBkY8qJdwSDrrLJZtXB60lpBzipNop0T+t1YGNuxfCWwN
 CMwDfSvMz6Gi+cEI0WteuRMaGQcO2eyEbazn78itv5ShoSB2XaAZyMPiiV8KRjAhjH7h
 EjWw5ag3Vgy07oMhaeM49NNwyNQTaGXV1M2NCPI6v1MUvnAzWSKra/iPBL7WnXxOE4UI
 lVM+FiYsXFab2ejRGWlYBQCYoFM7YeZgYqJKTInAKFVGsgeG/yjKldxMJ6d9TmkoUg2j
 QnfTBEgK6ACXXxcdjI5x528U87aoFJ3iyOZvtxxBzxL9X/V9IqvAgDWlhi7jg/ej9cdd
 Tikg==
X-Forwarded-Encrypted: i=1;
 AKwUvByo2K2F/ffL/uRDwYu4vhvx2D5Ci/ZJVa9E4DYIrd+wD9c/JSMmWhwIEE0cNM7O+bK2klLUjTOUWw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJZIe8T8opK5ld+Dvy8/jWarMB/Bgljvn8qoyEEfWOaAPsDauAr
 4WyOiHnXX2BKFSSM76YZ3G6s97RNV6EBJ135MlHEOCiirU4VGaG/iq6Wkjqh234jo1VJZK/krBX
 RcR8QecXkgOKXrFjmFvsHyBl1J1lIXF2hyD8GRDgIoeY2hBCuSdK2R0OXOPLQBb32eKop
X-Gm-Gg: AYBFou3pqCX/LrOLf1P+smAof+pJ3JLm33EnUa5elCGk7kHcC2ieeTROPPkpPWegX5w
 UpZ7IJHt8DKJBulIypX9xT5F7LgmaPA38JXa65+w/5r8NS8vgqaTyiY/oTZBqIhQWfxXjHOU9vC
 p+PO6bFs6nc0lBGNzOKMlCCg/5A6DK346TgCTwdtKH2s+l1MWxqIhYVYlcz8qf/F3nxW08DKDl7
 1+H5H7oiZAjhk1PenZIWT5e4sj5st6avusxAP2/+29yCGqGDyQkef4XM2pNU/vo5h8TW7ksnGhR
 Ez8vEw8ypMinmAjUASW7iCseCVLH5YA6ruhGpULXVTw1YJGIGeFHrjHsvi7Cu1Urnsc4iWYHpm1
 UoduoVoXRWiGPBFzRceIsKGOOev5PgNZYPVDvMjjmaTdBpGjNFqM6JtKFSdHDxDFajA==
X-Received: by 2002:a05:6000:18aa:b0:48b:1b1:af12 with SMTP id
 ffacd0b85a97d-48b127623bamr8872505f8f.56.1791026575991; 
 Sat, 03 Oct 2026 04:22:55 -0700 (PDT)
X-Received: by 2002:a05:6000:18aa:b0:48b:1b1:af12 with SMTP id
 ffacd0b85a97d-48b127623bamr8872483f8f.56.1791026575557; 
 Sat, 03 Oct 2026 04:22:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b383065a4sm11069220f8f.44.2026.10.03.04.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 04:22:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v9 09/21] drm/tiny: migrate panel-mipi-dbi to connector
 luminance
In-Reply-To: <20261002190030.211356-10-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-10-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 13:22:51 +0200
Message-ID: <xlv1h5j3gh9w.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YrecFBntGgGBF7MlvU0dw-kr69RE14NLKRx8-zvap9I_1791026576
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

Mario Limonciello <mario.limonciello@amd.com> writes:

> Attach the connector LUMINANCE property for MIPI DBI compatible panels
> and retain the legacy backlight class interface only when DRM_LUMINANCE is
> disabled.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/gpu/drm/tiny/Kconfig          | 2 +-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
> index f0e72d4b6a470..e61a429538bc0 100644
> --- a/drivers/gpu/drm/tiny/Kconfig
> +++ b/drivers/gpu/drm/tiny/Kconfig
> @@ -73,7 +73,7 @@ config DRM_PANEL_MIPI_DBI
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_DMA_HELPER
>  	select DRM_MIPI_DBI
> -	select BACKLIGHT_CLASS_DEVICE
> +	select BACKLIGHT_CLASS_DEVICE if !DRM_LUMINANCE
>  	select VIDEOMODE_HELPERS
>  	help
>  	  Say Y here if you want to enable support for MIPI DBI compatible
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index 60cd65cae41d8..730f1b219fdec 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -485,6 +485,9 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
>  	drm_connector_helper_add(connector, &panel_mipi_dbi_connector_helper_funcs);
> +	ret = drm_mipi_dbi_connector_attach_luminance_property(connector);
> +	if (ret)
> +		return ret;
>

I don't see how this could work...

The drm_mipi_dbi_connector_attach_luminance_property() helper only attaches a
LUMINANCE property to the connector if DRM_LUMINANCE is enabled and backlight
is not NULL.

But if DRM_LUMINANCE is enabled, then backlight will always be NULL given that
the drivers/gpu/drm/tiny/panel-mipi-dbi.c driver does:

        dbidev->backlight = devm_of_find_backlight(dev);

and devm_of_find_backlight() is just a stub that unconditionally return NULL if
BACKLIGHT_CLASS_DEVICE is disabled:

https://elixir.bootlin.com/linux/v7.3-rc5/source/include/linux/backlight.h#L441

I don't think we will be able to add support for the LUMINANCE property to MIPI
DBI drivers unless the drivers DT binding are changed. Or maybe what this shows
is that a backlight backend is really needed.

I would leave these drivers out for now and then later figure out how to make
them work without breaking the backlight sysfs interface.

Maybe what can be done is to add a new CONFIG_BACKLIGHT_SYSFS Kconfig symbol,
that defaults to y but allows the sysfs interface to be disabled. That way,
you could still have CONFIG_BACKLIGHT_CLASS_DEVICE enabled but prevent the
uAPI breakage.

Then in this MIPI DBI drivers you could do:

select DRM_LUMINANCE if !CONFIG_BACKLIGHT_SYSFS, or something like that.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

