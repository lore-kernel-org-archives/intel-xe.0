Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B90CCD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC61C10E564;
	Tue,  3 Sep 2024 12:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CjfGhaK2";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6910E55C
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+pVSR+7TVbjbUaLmGraYgM7q/wqENOvzyHgdTPQixk4=;
 b=CjfGhaK2Gpg/KjYT+bYxyB4OsIqZnFmc1DpBm1b5yJtlcDjV5GVn7cHJavoJOba7n3EOTh
 pX4GURpH75UgTDIpiYMRncTVLzxQLwMSEcPz6O3+6wdxh/DbcCWuqG9eH3BumQDLs1MyQn
 kVxU6WV6T7xKFzwhMAmnDk3Zg3ObGRU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-GZF2NQfaPDuOyF0M8I970w-1; Tue, 03 Sep 2024 08:18:13 -0400
X-MC-Unique: GZF2NQfaPDuOyF0M8I970w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42ba94a0555so48379165e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365892; x=1725970692;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+pVSR+7TVbjbUaLmGraYgM7q/wqENOvzyHgdTPQixk4=;
 b=CtvwEcMnTkwom2A3vakpbSAy3aco4kwJKQ/8EnaQOW8igCh2MjCX4ni3Y+QmdKj7Vq
 +QGJka+/PQXDXUJZ1/76d4tAHy5A3CP0oLvK+WkDi0mXT2bH8j+/g9dJMj8p/T7/naOZ
 ml1gLtJNGlyIWdwSpEcRwGxXMot82KWaFN41ualpAt8TsBMeQtWMMlEXXWhox8S670Rj
 9Hxev9grcmExZDGc9z4Pn67TLcblDO/f3OYufVstr4t00z9pXsBwChiWkLmmKNra39vL
 uq0is63FOI3BhX/zlImme2A7XCPJQKTlRuAb9KOuXCUdOtAIPoQpM1maMNdUlNa1XvLt
 MhIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIcb4GnQmK0mCxDVqX3TLZOJJZHxlYfZR6nlc4lyXYpE0Beystly2cOPW1X0iUPBx8fxJrMEYPog==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvrbynCz6alqEmNZopsw2HXqo2W484e02vVHZE7y3vHbad0B7x
 7YKvQXg19rPBK1HPySoD5IHasX/50w7czGISZmH5NPCyGr85HLdWHzpqOoG1vUvfWeJxlAYKSN+
 yxkbRLUMb4rSzOqJdTLuobQjno4qCm6ROhyee+4i/CKHNV33nkLlGlf6ZKkAxNWj7UrakvKt8
X-Received: by 2002:a05:600c:511d:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42c82f53210mr49626375e9.13.1725365891689; 
 Tue, 03 Sep 2024 05:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1PB5397pxPS+al287j5eSLcqH0EiAmMQ60AOH/NehoWOvOhNnHbQE2ALKLczHDDhpPV0k3A==
X-Received: by 2002:a05:600c:511d:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42c82f53210mr49626185e9.13.1725365891158; 
 Tue, 03 Sep 2024 05:18:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e367b3sm168493655e9.48.2024.09.03.05.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:18:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 79/81] drm/tegra: Run DRM default client setup
In-Reply-To: <20240830084456.77630-80-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-80-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:18:10 +0200
Message-ID: <875xrdc4n1.fsf@minerva.mail-host-address-is-not-set>
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
> The tegra driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c   |  5 +-
>  drivers/gpu/drm/tegra/drm.h   | 12 +++--
>  drivers/gpu/drm/tegra/fbdev.c | 98 +++--------------------------------
>  3 files changed, 19 insertions(+), 96 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

