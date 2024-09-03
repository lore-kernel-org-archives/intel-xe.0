Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73D7CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DE4B10E495;
	Tue,  3 Sep 2024 11:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RWlDFUbw";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454A410E496
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H24uYoqbfGl2vUBYr+//xmtelWdObhpGCRj8ekWugog=;
 b=RWlDFUbwKfQJ4D+WMECz9OTP+Ws0jfTGI0uUmRNQdv5Qu7/KDKiOZc52P3egwBA1VJRN8f
 Q4JTtW26ivCT+kHJN0sjo72geXAKIb4FOVtYZh0S+U+8DJmNih7UmrpAULYJ5lLlzUN/uV
 COv/xZ4Ub3SMOq47RlAg/hpk8kEsLBg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-vwceId6BNHGH3djjF7HJZA-1; Tue, 03 Sep 2024 07:20:33 -0400
X-MC-Unique: vwceId6BNHGH3djjF7HJZA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374baf9f142so2072443f8f.2
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362432; x=1725967232;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H24uYoqbfGl2vUBYr+//xmtelWdObhpGCRj8ekWugog=;
 b=lYbJ9JL3tWwfbO7xrUt4sO5WBC7GgdC78kc4oEOeNdVN6Mll6YfkmNFgu+5gwjhb0p
 8czMNKdZC1/kWW0XE/jBUfv0nOTyOND6nVOfA/L9oxhe7ZwNWg2FujPqGft6953i50Q+
 IiTqYnmxnCxJ2agtqid/lyBMNEqLbxENzWA7DkECu9HNTG6eqXJRjbbuCK1lnpmbmJz9
 2PDoNl2/QYVueeK7PVcLLsPtc3RPqVC6p9MWROARrt7wXUMVhW1EQoSMChi0qdPn9Caw
 a2cKJJOkAsYV0RP4jeQ7KoWgh+XX02HJZeEXtKlnf/H7kPFZ5S+0c/Ibc/UYHxUeyNIU
 LeOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzF/85eJm7t2HI+H5oy/ehkCoXghepXkOGGx5diCxPiq8B/GcY/IjkUx3tsCHvMpAVguiZ2hCmWg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+Vq7+8ZYYbzOsYlqSxFCFVTyCWv6Drhb85QxpnMGKP+vfyWhu
 ePaj6O6d6/4u3TTK83l3ZZXQ9ew9j65VzHxYDhAOLoAyNyBqDkRYrTi/J/+w2dMkuqO+s+67dCW
 3BMtyrwquMWPc40fBZNAwSDlRE09aMAKSczH84lqdOdFFECmGPp57J0RUuEzWzwZU
X-Received: by 2002:adf:e9c4:0:b0:374:bad0:2b72 with SMTP id
 ffacd0b85a97d-374bad02cdfmr6548891f8f.11.1725362432182; 
 Tue, 03 Sep 2024 04:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwpteDh/jYV60lwH9EfcQ38ojTrOG4EYTUpYCdQn17HGXGrVhhlQh31XG3MTmZZx8V6M3Sw==
X-Received: by 2002:adf:e9c4:0:b0:374:bad0:2b72 with SMTP id
 ffacd0b85a97d-374bad02cdfmr6548866f8f.11.1725362431651; 
 Tue, 03 Sep 2024 04:20:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e27364sm166897175e9.34.2024.09.03.04.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:20:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 14/81] drm/hx8357d: Run DRM default client setup
In-Reply-To: <20240830084456.77630-15-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-15-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:20:30 +0200
Message-ID: <8734mhgf0h.fsf@minerva.mail-host-address-is-not-set>
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
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/hx8357d.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

