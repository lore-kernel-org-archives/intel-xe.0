Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87103CD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:07:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556B810E533;
	Tue,  3 Sep 2024 12:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FCjn/aZb";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225C110E536
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Swr4IS8dbgShAURYPvnCTpzYM2TD6Zc8Nzbs4EI076g=;
 b=FCjn/aZbq3IU6mc9taUpXCVGF6R8ylKCcKp7sl7TFF8U/nmuzrPSvOw3smnue9DVtl4Hlg
 dBh+W7umYlnx1UdwVgHEeQZJN78O/EtfIZyF25R/DTxIwkOI77iI/cNm+S56uAY/OTrnSE
 gB87w05UI7NzMjbjZJ0rQK8q7bcAjgE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-iofYWLYPPbye-tBOS7Pn_w-1; Tue, 03 Sep 2024 08:07:23 -0400
X-MC-Unique: iofYWLYPPbye-tBOS7Pn_w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c960ee7aso1725247f8f.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365242; x=1725970042;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Swr4IS8dbgShAURYPvnCTpzYM2TD6Zc8Nzbs4EI076g=;
 b=Mydhur3lHXqyqhEI3FRwYGapnRmqA0l6NszF8qCiniLrRJBuNAgn0A4m62OTl966bZ
 bCz6wSoSZ85KgjM6l4swJrPPbV9WQo2gZXK6k7P66qnHmXHvz/55NNPPGGUOm68SFiQM
 AA7KWieiV0h9Jl61MmukVnu/PhsZCKXVzEzdr4r+97uQ6tCZAXHBfTk1RorDwvUv8Q7P
 ip1ZgspyFYJbPKXyIYF8xqnxYSZrLelFY4+epA0kueBhGMv0JRpSkIvVZLKE0zCcyvoO
 ZZ/hCZYP0Lyoo73eDJtpE+0i1f4ok683Dqf+k0uCuMEy0Pf6NfEfnx5IIdsRL+AGtm/3
 av5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX25C5Rv5rUrOdvJRTCsuE+ZR7vroaEmjn1vl0DvW2sKn6gMJQLXK8+bVdv3VMMIoBpqvS5YB8USg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUNqwTUHn1PG/HTD+lTZv4rNMn2hLd5g/A6ckcNI/5pLbhz9Ch
 Imf8c/nenClIYewroolK8qH7DM/eS5QooO8tErPfNXUMcRobvRgdkCBtoCgd/SA3loEVYuA22jv
 jvlUchpz+WrpkUL+5GNrJAstch70hCqoRxpnf1vgtV9LFxtvdAfp9xZ8ufNyTzJe+
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr13863875f8f.12.1725365241915; 
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NHKd/OZS0qGl6rQ/cQL7X9ho+DUsYgIVLhqFSVXN311ZJ1N/JkOGUvCE3TFPMHJvuHGT6Q==
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr13863856f8f.12.1725365241536; 
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c88c624f7sm27274635e9.39.2024.09.03.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 71/81] drm/vboxvideo: Run DRM default client setup
In-Reply-To: <20240830084456.77630-72-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-72-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:07:20 +0200
Message-ID: <87plplc553.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The vboxvideo driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

