Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE2BCD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2458210E4D6;
	Tue,  3 Sep 2024 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hU/UiXTF";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D6710E4D6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+7KjPkZaY6LPM2R/IvEHcw05+p3Okl3omvvBGG6T0MA=;
 b=hU/UiXTFoUOV/r3VTLKJxeVWdEhiWyBjsVYpsjBVhHg7uAgXEVtXMAYMzZfFwSsu4qeJ9Z
 lFFOMWZVGRutRZyzTTTXmCal7s9ruq9m5cpI7GRWOg/wAO7ejHHEIycUWGOMIgZ801C3Gi
 jn7v5E/J2PamqT0z2pqbnf/4l/w7xbs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-Vsr7x8-6Nx6Z4YIB5wVjuQ-1; Tue, 03 Sep 2024 07:30:43 -0400
X-MC-Unique: Vsr7x8-6Nx6Z4YIB5wVjuQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c90d24e3so1933155f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363042; x=1725967842;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+7KjPkZaY6LPM2R/IvEHcw05+p3Okl3omvvBGG6T0MA=;
 b=Fi3vfU3nm7qUW0Zk2lITDZwtZnXmEhbp7lDNcpNqMDpC9TeyW0L1IxZAjP4tnfA/Kk
 afVdhbalIfOHumkShgomrGi4foggoJ2ykUcIjLWSiG2UBlPU/drqCkTIXwiZC4fdpaSV
 uUJz5NBZzstfv7LPTz0sByTXPEQ6hlERnB2BcZPHmpvsELtTmfSkvtQouOfPGhI6kZ1/
 w9pU5Cd+IO8D19c5ZklqZCsagh5Xo5VnfKb7tichP1+LF7l/P/XrpRLOJYcqXBwfYbQj
 3cH12Dd6EoTe2iL154iwOPQB7JkIljvmYXy4qDCnyAZoZ/L4vwfdxF3v4tYUlSgnA6/Q
 wlIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUcC5T4fa/wukRzdljgJqjxhPen9nGoIgK8TvJ84sWRDz58d5bq/cVxLxmRAzih+LhitXwsohccA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw91Hr8KClpzQdUmnxBl4pxzFnkzQrG8NWUo9ABbQ80OIVtKYh6
 9N7zsr1j0wqo62BToJnDrCjK2yTRCEKQQVvcjf4JK+iyUI2/uVnMZQcV0AeIbjuEO48dCCCpHtI
 ZO0CwPCHiM4BmLIa1CePM0PgYEtmhWrmDtrGvjTaupMWsWOZ68j2pGZGhReohpwDy
X-Received: by 2002:a5d:4fc4:0:b0:374:cafe:c55f with SMTP id
 ffacd0b85a97d-374cafec737mr4142335f8f.20.1725363041821; 
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaxU5bJuIzUDf8RSjazoPcbW/KJpDG6+5g7d7j21W0xhBI7SOXf/r+/zCa6XdnhnO6fGnIQQ==
X-Received: by 2002:a5d:4fc4:0:b0:374:cafe:c55f with SMTP id
 ffacd0b85a97d-374cafec737mr4142303f8f.20.1725363041396; 
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4d391sm14089852f8f.3.2024.09.03.04.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v3 39/81] drm/sti: Run DRM default client setup
In-Reply-To: <20240830084456.77630-40-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-40-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:30:40 +0200
Message-ID: <87zfopdlen.fsf@minerva.mail-host-address-is-not-set>
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
> The sti driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/gpu/drm/sti/sti_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

