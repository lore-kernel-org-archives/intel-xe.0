Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72C1CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702EC10E4C8;
	Tue,  3 Sep 2024 11:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VaiRqlmw";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C7E10E4C9
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LWaiVxUDn5x4EDUb0RXQKucUIM8lh/m7gazYhUKWNcw=;
 b=VaiRqlmwZgQ2Im5AzxgOrwVb1wCqKsRqKcwzeUHVIUrApaLPbhH/VhHmd74h3PV358bxeq
 5Ppsbg0v9VVH99Whh6yh+R9Dv95M6GDP9aSQLqUURWFr4hiFXheMAU5gmd0o+jqN5vUCGJ
 rX2jpQnkTh4WpvnCYdd++y0Y6LOVblY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-IZRKiKiUMm2zcndv7YQepw-1; Tue, 03 Sep 2024 07:28:37 -0400
X-MC-Unique: IZRKiKiUMm2zcndv7YQepw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-374c25d886aso1804447f8f.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362916; x=1725967716;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LWaiVxUDn5x4EDUb0RXQKucUIM8lh/m7gazYhUKWNcw=;
 b=PNPdcuXm0QJe4u0rDuaNS8SXsuoXZ431axNi93HahpFrmsq0cXJ51Nqwl4vpTo8iag
 AwgbjGN5L4PChpoGv7HGoNzx1Ep9ENO1L/CCtjMv8L7aXvL6WpSqS2uiIonFAjm47xZa
 +jE1ez600K2fV1ZybZv38WI0D3vrq/BaTXr+iEN+PQ3KFiXsVaYCoc4+VrJUqtdCJvEF
 xPsRBfjHuKae6Engin/34+1evVxeotNNQvHLtq2QwrAfotgqC6ntXPSBkgM+5g6lg5fJ
 FNkFnP8a6joUmmcMHxCtoLBz9EDQ0Wt4dtK4Reqle5jj9jYYl9tCOREzURiod5yU8d69
 wJSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSsjuNvZqU96GxuXGGrkqr2oRgGEjSHGF5ghUn/aUWNXDY7eNFOhu9H8bcHvYkB74vyKROZgcGeQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYvTRtVT4GSnwvPSqn3U4Uft/PB56BmiKpKUsRPugpv76hzMjf
 YBchuwrN+r7CaBQ7sjTpfT0e2fFa74+LD9yDGVk/n+ObI/G+vGVDav3kLeAW6W+wgaIyDJ6YAMj
 t866jA6W2yyZoB4OnRXUA/TElcrmupOw0OGzIXiUMYDnsho/q5Fq4+YAu5JARDi6C
X-Received: by 2002:a5d:6446:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-374c2659badmr6645354f8f.21.1725362916416; 
 Tue, 03 Sep 2024 04:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOC1T6h6rVXlfVpjA/pVe7KOeoA4/WKcQU1WD4uFO7ri9zXFh51Y6FFr5rxsYl8wc+Lnpi4g==
X-Received: by 2002:a5d:6446:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-374c2659badmr6645326f8f.21.1725362915923; 
 Tue, 03 Sep 2024 04:28:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c5ba7027sm7134412f8f.19.2024.09.03.04.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:28:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 29/81] drm/mxsfb/lcdif: Run DRM default client setup
In-Reply-To: <20240830084456.77630-30-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-30-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:28:34 +0200
Message-ID: <878qw9f02l.fsf@minerva.mail-host-address-is-not-set>
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
> The lcdif driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

