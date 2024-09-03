Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A147ECD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5659510E46D;
	Tue,  3 Sep 2024 11:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jv1iQGsD";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DF110E44F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725361739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KNCsJ15HkUgltOPMm708gH3cAto2XwAuJxZwET5MHs=;
 b=Jv1iQGsDscG4vY8v3IFxvipGXQOyKUxFNWFIKt/GK4B+KQgs/WCoMPZuTgYrEWCnNbKI7j
 tO7q4BYEnp4KtyTmRrrNUF6ve6V2vC8T4eyFHZ4vtg7uNW3Uv9nkcZXw5rJPfSA8NlxMi4
 GYb58T03oEvyJhaNW9uNTaNJYP75cNE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-K8clOMKBMbe9Jk881B5h7Q-1; Tue, 03 Sep 2024 07:08:58 -0400
X-MC-Unique: K8clOMKBMbe9Jk881B5h7Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42c7b6358a6so25209505e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725361737; x=1725966537;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5KNCsJ15HkUgltOPMm708gH3cAto2XwAuJxZwET5MHs=;
 b=pji/7yn/MPdHNClW6jcNRwFGpjoCRv0bT62UjDoHLL1nCCeAoe2nJPqm+mjFl3z9qf
 cxw4D5AtNktyTRdY1iuWfL3EJfVn7STIcMYw/ZF5IJmnh/0IF82P1fg86b/7tyP4tDje
 n7R+Jb3kluPQvTuiqmWiTzv+ljBD15fWdwsif0NchKZqL1VT3iKeEP05akmPNKtD7Sma
 Dnmq84G/U+4Rb/qN0JRZxDOpXhgA3CtQVs9euuZcHBrYuNjMK85jsNa3LlZXij8/ytEd
 Qa4DggeZtR4hNpWxCi+okqyLR//tsBXkPJ6hmMBjDAewqtB5JEMkRv6ApKWE5E7ESVDU
 OuOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5UVvT0avYKiP8QKhguWwquOeimFjz2LqOuH3+UQSgy4xZgKT/F19JCaKeUmZDfWavy/sbVdKPOg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywluru6CpfABG6QnR6nVAeAd6SlILRljgpw3SR1A6n03cEk63nd
 H0KXLWd5g+B+7/7ui/aLY5UX/aKx8D5DhNm5x/XQeVHmrxQky2QswE2iVq3mp4liYDmV+AsQd1g
 sCsZoXlucUJyLzaKlDWEFHNRozMxmw1l4/7g11oWNxeGQQwGkhdT0QhmfbnzHEGuc
X-Received: by 2002:a05:600c:6592:b0:426:61ef:ec36 with SMTP id
 5b1f17b1804b1-42c82f13bb8mr49158825e9.0.1725361736880; 
 Tue, 03 Sep 2024 04:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/LIzZrmcj69ybDsKA77dubjSmW4Tpk5zW1Gf9bYbxoUzrG0GhAgYYbYf75Z9LDiQ3xPDERQ==
X-Received: by 2002:a05:600c:6592:b0:426:61ef:ec36 with SMTP id
 5b1f17b1804b1-42c82f13bb8mr49158605e9.0.1725361736297; 
 Tue, 03 Sep 2024 04:08:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc36bd88sm139398275e9.24.2024.09.03.04.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:08:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 05/81] drm/fbdev-dma: Support struct
 drm_driver.fbdev_probe
In-Reply-To: <20240830084456.77630-6-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-6-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:08:55 +0200
Message-ID: <87h6axgfjs.fsf@minerva.mail-host-address-is-not-set>
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
> and reimplement the old fb_probe callback on top of it. Provide an
> initializer macro for struct drm_driver that sets the callback
> according to the kernel configuration.
>
> This change allows the common fbdev client to run on top of DMA-
> based DRM drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 60 ++++++++++++++++++++-------------
>  include/drm/drm_fbdev_dma.h     | 12 +++++++
>  2 files changed, 48 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 7ef5a48c8029..aeccf7f7a522 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -86,6 +86,40 @@ static const struct fb_ops drm_fbdev_dma_fb_ops = {
>  
>  static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  					 struct drm_fb_helper_surface_size *sizes)
> +{

static inline for this wrapper maybe ?

> +	return drm_fbdev_dma_driver_fbdev_probe(fb_helper, sizes);
> +}
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

