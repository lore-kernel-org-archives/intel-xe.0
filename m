Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA92CD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36E810E4B5;
	Tue,  3 Sep 2024 11:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DyGhs449";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDFE10E4B2
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9sC7HLJXuWub0EarNCELOa44xh6zW87AqTRwbOpLZOM=;
 b=DyGhs44946t9L5gXofHZLFswweWf8vEDG7z41UK+mTOm9vH7P6axyYLWFDGV6N3kIn8x0Y
 0q2ur1Ug8gEaYB5uklswwZ9kSzFMkwL1nEBO85399VOvWnkdStg1dckYzAdgQW6gCq9/My
 lBaFb3uYd6JVXh7qXJIHGjv24fQ5QeI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-SQYh55-gMiGQ3zTbd1caHg-1; Tue, 03 Sep 2024 07:25:45 -0400
X-MC-Unique: SQYh55-gMiGQ3zTbd1caHg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374b385b146so1949204f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362744; x=1725967544;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9sC7HLJXuWub0EarNCELOa44xh6zW87AqTRwbOpLZOM=;
 b=F+MAIUv3rsToVhV0rQwdYS0ZXB+hBfLH83Zx7roKjQyGvynY6F3igP0KVWBpK6AUMF
 sx4bblztiBI+cw+qzReWPJnNZ+SbMLtmRpnyHtMUML01A+GLlgQAFc2qA5QAdqm0b4uL
 HPjC2Eu0+MR6qpahe/MWPvJ9sk86qjnK/z5dsaXZyGpVCU8IPwYHf0FJLKRmiX1hqI1w
 v8NyLrm1Hze6Pbuk/GiR7ZdyP0wKpc7OumaZ/zSFKY9t7DrsGgJYIBd/n1852MTX4Kh3
 WTzXh4R4oVcYQsnRxDOz5Hfxof5KWcyNPdeRXkaqmfiegMi7TvkYsDK2ERoeB/ltWa+7
 0Q4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmUIN6vJrXk3eaFHRUnzGtrwZyCi7nS7hvHC2jT98/DVB3Vnl/oPiMjxpeQIJRqUIgn0NcLpg/Cg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0g7NKYAt9mC0KeWzQ5Bc25G6hBjoEecvPOrH+Bry9dzIkaJqL
 3MMyJ+NPOuharhRFGa9pHYCcWlyEVhPsPi+83Hg2i2sYq6VAUFhBpI2aP5fIW5Qf1MwRMusbEK3
 gd/qBr3p/Hh1c4zs3lFdVxvdcWyr3OnIrUDIJ2dSFdiYuBYWYeGeFioauqrjMr61w
X-Received: by 2002:adf:f747:0:b0:376:27b7:da7d with SMTP id
 ffacd0b85a97d-376dd71ab0fmr356717f8f.32.1725362744043; 
 Tue, 03 Sep 2024 04:25:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA3yj2kCeHDSDWyAEM2Yi0qle8pXxFLZPw8+JMts+88BoPIGSyVA7+QhDZU1CF/5hz8VqrKg==
X-Received: by 2002:adf:f747:0:b0:376:27b7:da7d with SMTP id
 ffacd0b85a97d-376dd71ab0fmr356701f8f.32.1725362743587; 
 Tue, 03 Sep 2024 04:25:43 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc36bd88sm139874945e9.24.2024.09.03.04.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:25:43 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>
Subject: Re: [PATCH v3 21/81] drm/imx/lcdc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-22-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-22-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:25:42 +0200
Message-ID: <87le09f07d.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

