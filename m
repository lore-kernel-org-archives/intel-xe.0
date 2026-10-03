Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB77ECA5FE3
	for <intel-xe@archiver.kernel.org>; Sat,  3 Oct 2026 10:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0910F10E92B;
	Sat,  3 Oct 2026 10:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UReXiafg";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065DE10E931
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Oct 2026 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791023458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x3OlQPuKLle/RWQyCvYbmxpN1t4vBLUkyyPtEqihZM4=;
 b=UReXiafghX64kpKGImsxTTKlDlI3P7ZvzxZc//n7Evfe82nc3yPdUOTGKjX2HrfCxdDlAW
 oXW2JwwrQ6I6QCCAr4ECDY9kicU8bmXgEJ2AinnMFWINqE+6WP3CHIMc0Oju3ZvFc472x9
 vaHydr8BpNTpO9Zf8p4vO1HTU1ktw6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-k-rFT5enM8mO3lOoOOrthg-1; Sat, 03 Oct 2026 06:30:57 -0400
X-MC-Unique: k-rFT5enM8mO3lOoOOrthg-1
X-Mimecast-MFC-AGG-ID: k-rFT5enM8mO3lOoOOrthg_1791023456
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-49e6862e924so4887405e9.0
 for <intel-xe@lists.freedesktop.org>; Sat, 03 Oct 2026 03:30:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791023456; x=1791628256;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=x3OlQPuKLle/RWQyCvYbmxpN1t4vBLUkyyPtEqihZM4=;
 b=k2gTm/X0bSFIoKcDiqlKPpx2VCF5NKJ3Afn5JrhV7HJUX2fxHp1eBtvjwIqqdsCVg8
 yYSYJ0/ID92qebecBfwxjY0wGFGTqxPFM5HD6plVCZjBheU7xAmN3dU4g1ARmImtPp69
 hRzrEqKxov0hFbDfHO4W1jRJT0v1cd230lEvXhl+7bPZxECPrwBTnf4gQRUJtXcAxwqB
 oW54vtfR0TkpcpYcdOKjw4DOsgsGDJ8K2OwIKcW4lRJgCkFzdG9jT+gelASBTE5/y1IZ
 XR5Xl49ecGrq6OSYUDQGGM7oc5Sw0NFeSOeAOJF6a42nDN4D6IzJN8cDXzaxrrOGuNPH
 4rhQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzdrJuyul64YMmZUzfLsadiHvpQpuVkQueizPa4tBj4b3WuYws66Z2wVRM29khudtNuxba3sDemDQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kBNR7KNzUoYyseaJOTgzVlKYKhzXqtvmk2XFYUsmzWSkMNNMBB
 zRuRhS49Qn/6fd28J1dhTW8GQtoOwQFrP44ZIiO6cvN1YJUpb2uhyJvuIouhOuMXDdKnjljeiAo
 PW+VdKMnbtCIBooL9nUoUuibt/zC7p2pGu3oyAWvhsNemOuMBu+5A/DgDPHMYTyftdnNa
X-Gm-Gg: AYBFou36vVFnOW0kJ53BhwmBzPrjuWoXV8EDaZ2+DSFbhX5Czr+obqUli+OE53wvzXL
 neMUlK+uULiDHXcwWuwZ+T5bH8d01fhY3/mn+ec4InKXm2+/quqFVtb+kUoQRFOv6qqCG1XMLaa
 Dsm2ij/P+fafKpqeUKFr+gp6pQTfj9FFISbH37svnnamIchZ3KMjO0gTHqjXfYjRTdJLqzgZ4g6
 boEUV10eVu1y8RHR6HquaTcAo/TctYNuxCoSjhWECnJIx7VGkiUuYIcIYM0WH7JH/47atxebQPl
 w8OQ5cHwVhPa644ES/GPnSyoEN0dKYWexp4ho4TNxEmwiNWdAyMQvrtt2Qs96goDPuFAq4LwBIV
 WFnBoT3gWThRQDyYzv361UDE/OXtzZijgD79QWJLL8ggGZrdg07byD/SWeqaQfNmEXQ==
X-Received: by 2002:a05:600c:3115:b0:49f:cac3:c68a with SMTP id
 5b1f17b1804b1-4a168105ddfmr30256065e9.31.1791023456065; 
 Sat, 03 Oct 2026 03:30:56 -0700 (PDT)
X-Received: by 2002:a05:600c:3115:b0:49f:cac3:c68a with SMTP id
 5b1f17b1804b1-4a168105ddfmr30255685e9.31.1791023455648; 
 Sat, 03 Oct 2026 03:30:55 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a03ff20831sm97747375e9.4.2026.10.03.03.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 03:30:55 -0700 (PDT)
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
Subject: Re: [PATCH v9 21/21] drm/solomon: add SSD130x connector luminance
 support
In-Reply-To: <20261002190030.211356-22-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-22-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 12:30:53 +0200
Message-ID: <xlv1zewv5b4y.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8NYpyxkoV0K98WOTF52nXoGItnEy3JmX62y2GWdNkc4_1791023456
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

Hello Mario,

> Expose SSD130x contrast through the connector LUMINANCE property when
> DRM_LUMINANCE is enabled. Program contrast directly and retain the
> backlight class interface otherwise.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

[...]

>  struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>  {
>  	struct ssd130x_device *ssd130x;
> +#ifndef CONFIG_DRM_LUMINANCE
>  	struct backlight_device *bl;
> +#endif

[...]

> +#ifndef CONFIG_DRM_LUMINANCE
>  	bl = devm_backlight_device_register(dev, dev_name(dev), dev, ssd130x,
>  					    &ssd130xfb_bl_ops[ssd130x->device_info->family_id],
>  					    NULL);
> @@ -2258,6 +2298,7 @@ struct ssd130x_device *ssd130x_probe(struct device *dev, struct regmap *regmap)
>  	bl->props.brightness = ssd130x->contrast;
>  	bl->props.max_brightness = MAX_CONTRAST;
>  	ssd130x->bl_dev = bl;
> +#endif

I think that IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE) makes more sense?

Other than that, the patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

