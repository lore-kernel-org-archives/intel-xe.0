Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F54CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EAE10E4CE;
	Tue,  3 Sep 2024 11:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HLY9NKrB";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793EB10E4CE
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOwnsv9Ex7Dst0oT+vzWucUQJDjqV43haxzxxhRT6eM=;
 b=HLY9NKrBpvAHx5vqqAkI1Vy0Sj/Klf9onGzs9p9RcRTIg9oiSwNssf+W1GE02N3PcHGaH2
 BKwfruHMs8a3DArfSZyipZAtCSzVlmozHNF/plnflx/hIWiSRGZ4ajDFFjeUH/hZ+SOHg0
 zh8pubzBBgw0KkBaDtiCJjhqLkPDCYo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-8IdAeTKpOeWnBMV41XeWlQ-1; Tue, 03 Sep 2024 07:29:08 -0400
X-MC-Unique: 8IdAeTKpOeWnBMV41XeWlQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3756212a589so756606f8f.2
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362947; x=1725967747;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOwnsv9Ex7Dst0oT+vzWucUQJDjqV43haxzxxhRT6eM=;
 b=xEF4V6ZXYXxkqoWx+RT9yknIO5aesBKqNvgcd+M8crd9M6FUYh5XEg+eLZUARJHEAN
 rO5kbhL4O+GVnX52vVtkp2XHlkxUaTNWVM280bapy7qT+y6TEpy7DhGB2ipmvcNVzgs2
 L3rXcm3ZXlYRoXNuwKCSehDHM7GoeanDkzXv34HJxPUFlN3iLmsMDmx1nRMR3FslWHaH
 YaNSyCGd7kp89IFUXjQTz9SK22DkgCSiisMYcurNy2ap6SZZRGDOxXGf8o3JIGXVbf7J
 X/yG4pgvCfM72Ja1JWcxvzA3YmWehIKfkft2N4nYiRkxLwWNLYwUvXO7CzVjNi8Z23/V
 FbIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF/ui7uCG6FMxi0AFJnTxnkgLa+We6Hi8FrSV4I46Y+jTmHLkL15DyyCKeJk0LMFU+L32et7DeIQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywpg/yOuER3Gu2EwnS/BCzDZEQiPIc4FG0gkLKPc9hZPOPoFPqz
 748sPYFzbpNiZCPl6ZSwtPM5pmwKAAHj83GFjA4Hi0PQSoDP2xeGogutXnhU6Hsj/qmb5KRTkXI
 /zK1X7xtQIdfbsdHZl7htNaa5SlkmaKoI0SWt7tRJRTPInW65woIVmeV8k50K5KeI
X-Received: by 2002:a5d:5309:0:b0:374:bf85:7d74 with SMTP id
 ffacd0b85a97d-374bf857f23mr7600167f8f.61.1725362947575; 
 Tue, 03 Sep 2024 04:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFplzXWPnS8z1FVY1e2/1mWosdqwoo68I7PXq6d9DOV9oX5IACg3DEStSkSK8s6tqHoRzr8g==
X-Received: by 2002:a5d:5309:0:b0:374:bf85:7d74 with SMTP id
 ffacd0b85a97d-374bf857f23mr7600141f8f.61.1725362947101; 
 Tue, 03 Sep 2024 04:29:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c9487bebsm6146536f8f.94.2024.09.03.04.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:29:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 30/81] drm/mxsfb: Run DRM default client setup
In-Reply-To: <20240830084456.77630-31-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-31-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:29:06 +0200
Message-ID: <875xrdf01p.fsf@minerva.mail-host-address-is-not-set>
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
> The mxsfb driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> v3:
> - fix driver name "msxfb" to "mxsfb"
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

