Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E454ACD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC0B10E576;
	Tue,  3 Sep 2024 12:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Q2pCAFLH";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1810E575
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725366165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0J18mFtPW85AHtY7ZOej0CYOhen09AyMbJhKjs06Zig=;
 b=Q2pCAFLHurXFyLPk0fEuTirB6wO6idsJ7N4usy3MBL+8BzSAn9BMgSTzAUztUE7NXOeQdW
 WUa7zqL+vGw3RoajSIXeniy16GN3TZuikzZxU+FCRFWJdrewA6N/LbzRcPgip6L5Y6Js2j
 TLMfQryFS6iNzT8dL4OH/8EJkwM+RfE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-yXLq9jAfMKuGIecN22qnzw-1; Tue, 03 Sep 2024 08:22:44 -0400
X-MC-Unique: yXLq9jAfMKuGIecN22qnzw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374b35856aeso2725936f8f.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725366163; x=1725970963;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0J18mFtPW85AHtY7ZOej0CYOhen09AyMbJhKjs06Zig=;
 b=ihBAagI8V0fsrn94i14pLQW/5ghcLqhheK99oS6UGmNcrOGaI6zJkDvp80/af70RJl
 miT6uBKu/95/CzYcerRUAyAs//FH3pe6IySzPfwoc31vcK5IGe1cus+qjKOJajywG4f9
 WCukbMPj8jiiBjJbpBrlXjAFV7r6X/sLvX8YhYlyjIMR3Qz54yji1j8wIeo7xV/d4HP/
 H4mb9JYevgTIr2FCK6I9IO62hgGCfP9zftHNAjCs6t0buKzIQlmMshg54Zo+TC1dVdUc
 w8wLRsW8DOWVlF1TIojcy4RReZ+cp5lYHTnvUGbGE9h71nRBP9cHFP0DKEaHotgJTV7h
 3Fjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzby259yCa0btZonGtvlShgLfMtHukJ6z4F2LQrLJC507VL1WNUJa00xKzdUrVXw3hQLIIkIe1vQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR4b4cW+lXcun4PawjTzTr9O2xxTpa7LPZ6iesdm4r4CCTYyI/
 fXmL2iP1QAvRlUp4vGyOvEAo93JxIiCIpd7wpkcXs1rS0D0rtXAKSx99YaGyHq/nSGS9onxZ1/k
 9uUbWz7U6XWw4cqKsKJFIQ2RKa1QVdVaPPlms4YE3fDm9YinfrSzteWwYpvGPKtlsa7sKRWVP
X-Received: by 2002:a5d:69d0:0:b0:374:c50e:377b with SMTP id
 ffacd0b85a97d-374fa04bda4mr1738360f8f.57.1725366162735; 
 Tue, 03 Sep 2024 05:22:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4S4eih2N9VBmWhzMozSzK8e8m/fVAd05vFao5JLuB0ET5xeJ36/8k/lqNYcQmxehh1CNfiA==
X-Received: by 2002:a5d:69d0:0:b0:374:c50e:377b with SMTP id
 ffacd0b85a97d-374fa04bda4mr1738344f8f.57.1725366162260; 
 Tue, 03 Sep 2024 05:22:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c819e356asm82859735e9.42.2024.09.03.05.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:22:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 81/81] drm/omapdrm: Run DRM default client setup
In-Reply-To: <20240830084456.77630-82-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-82-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:22:41 +0200
Message-ID: <87zfopapv2.fsf@minerva.mail-host-address-is-not-set>
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
> The omapdrm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c   |   1 +
>  drivers/gpu/drm/omapdrm/omap_fbdev.c | 131 ++++++---------------------
>  drivers/gpu/drm/omapdrm/omap_fbdev.h |   8 ++
>  3 files changed, 38 insertions(+), 102 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

