Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF8ECA5FDD
	for <intel-xe@archiver.kernel.org>; Sat,  3 Oct 2026 11:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5E110E0A1;
	Sat,  3 Oct 2026 11:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WdHajL1f";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBDA10E861
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Oct 2026 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791025397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7CGE6fSevJn03ZxUp3hLxD+nUmt71trIKNdG07R2pFc=;
 b=WdHajL1feBd/YrIuv9WlPvxtr0VDEDrK7+VeumKdDBtWB07YsE12+iPa/3p61Es+MBraby
 eOA0Vz5xmHBVVbzZ+SKYHxOrbTged7wtkBgfeVrFFrzFQsxO4mU7juY1rs2ZB93j0NTNZf
 k8t+px4d7mcW405+ZEUHfPPao6j7tq8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-BCNMP1WfOuWguCC5_8cs9g-1; Sat, 03 Oct 2026 07:03:16 -0400
X-MC-Unique: BCNMP1WfOuWguCC5_8cs9g-1
X-Mimecast-MFC-AGG-ID: BCNMP1WfOuWguCC5_8cs9g_1791025395
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-48c4445512dso289164f8f.2
 for <intel-xe@lists.freedesktop.org>; Sat, 03 Oct 2026 04:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791025395; x=1791630195;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=7CGE6fSevJn03ZxUp3hLxD+nUmt71trIKNdG07R2pFc=;
 b=mBjiAlxgLLkBim7NxX3d7eeGT2w5K/AzJA7M8NlyMiqPMgBuHnebpANN63b6W0JHR6
 SkP+at4haiHtwRiBVNj3Nq6gPb71IvCKOoV3UAMOak+EzS+Yc91lnT44WNNHkQHysca+
 TE++mQv0w77NOv0UjM7bMDsuZdSVDppnpW2yJxJ8LllWwNVhK71OrLA5GdfuOc7aAr8J
 QBCI2DWcqg7gsBawiXUMx4sCAwSFRxAsaoQC7jOaN4O8EqoYftscj03NBR0kZTzjYK4p
 /C6T0TwOIf45xr1T7ddP7u9Fu9d3nV/K4d8e1Y25LalHD1NeMAn1SZzL+NeV2qRhO4eq
 jwCQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByJYOgOfPZCE7rYCD75eFOGg2vAfR0Cnn6/aE/IVTb7Iqa+FkRIhlj69zNppI9n9tYdsxD42KzsEg==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJzcEQY2IlSeHZwdI8exxT+gElt7JLkn4DRg+QdI4KeGVl364WC
 /hMn8w6jqBaHycrNpTcbgNMCCtnXhHRdAaUz9hWsLqtwMOiTtIV0Hs3H5BXfKIJJ8DQPkJKrb+A
 FAZbSiCdqyPxjQnzcVPzbst2yfoGiD8YCFE2NQPAmytw+zZgjnykbF+rKXlgW57g0Ra4q
X-Gm-Gg: AYBFou1kcyypNAeCophr6CQHLmlmLnCxRQ9Izmd0kyLDrhFSchm84eoh2yhoLmSlHS8
 /hOyJiOx9yWIqvMxGklN3kdnZ5olptygwb5g59YuDLbGFjkjLJT7uHojvL4U9DVnIqCTQYjRO9y
 8WWS1S5h4zs2AbRNj07k7WUoLtCPoN0fMfabltFSrv1H/x7/oQosM0RRX2j6gEHjXYq3ylrOBgI
 HNfB0ciOMa1mE4pJutUyorZXh1p3fcq/BWrLT8wqVxhGVz+pkSGcvp88QwX0AORMqMX7WlfkF6q
 CLX/FLhnMzOJ6wHxcbHq4vYnnBaSpi5ZxE/jMsGMi1pf4DkSGSyVTru/EkHAOAWdYdbzlk0pA93
 FfMD4eCKHpP5tDLDKkc4lgY8QhuXkevijOGkzsxoalpwEOVVcWjosC0Sxh7RwS82r0g==
X-Received: by 2002:a5d:6f01:0:b0:48a:fdde:5241 with SMTP id
 ffacd0b85a97d-48c47fdf4c3mr3224371f8f.31.1791025394937; 
 Sat, 03 Oct 2026 04:03:14 -0700 (PDT)
X-Received: by 2002:a5d:6f01:0:b0:48a:fdde:5241 with SMTP id
 ffacd0b85a97d-48c47fdf4c3mr3224335f8f.31.1791025394453; 
 Sat, 03 Oct 2026 04:03:14 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b82253dc9sm11935413f8f.3.2026.10.03.04.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 04:03:12 -0700 (PDT)
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
Subject: Re: [PATCH v9 08/21] drm/mipi-dbi: add connector luminance helpers
In-Reply-To: <20261002190030.211356-9-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-9-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 13:03:11 +0200
Message-ID: <xlv1ld8fgi6o.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m79o-RPb3xSgPxi_hQKSFUmmS5ZAszMBO5_-RA9Nwck_1791025395
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

> Add common helpers for MIPI DBI drivers to attach the connector LUMINANCE
> property and forward updates to their backlight backend when
> CONFIG_DRM_LUMINANCE is enabled.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

[...]

> +int drm_mipi_dbi_connector_attach_luminance_property(struct drm_connector *connector)
> +{
> +	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(connector->dev);
> +	struct backlight_device *backlight = dbidev->backlight;
> +
> +	if (!IS_ENABLED(CONFIG_DRM_LUMINANCE) || !backlight)
> +		return 0;
> +
> +	return drm_connector_attach_luminance_property(connector, 0,
> +					backlight->props.max_brightness,
> +					backlight->props.brightness);
> +}
> +EXPORT_SYMBOL(drm_mipi_dbi_connector_attach_luminance_property);
> +

Drivers that call drm_connector_attach_luminance_property(), make it
conditional with if IS_ENABLED(CONFIG_DRM_LUMINANCE). I wonder if
should be the same for drivers calling this helper.

That is, instead of bailing out due !IS_ENABLED(CONFIG_DRM_LUMINANCE),
to make drivers do:

        if (!IS_ENABLED(CONFIG_DRM_LUMINANCE) {
               ret = drm_mipi_dbi_connector_attach_luminance_property(connector);
        ...
        }

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

