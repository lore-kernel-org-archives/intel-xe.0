Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0829CD342D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED3A10E528;
	Tue,  3 Sep 2024 12:06:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N31SRYjy";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5A910E525
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KYNG7ZSPE/elB3b9WkJzkds2S1MCd8qjtTvrXcJahJw=;
 b=N31SRYjy+x7HGK4MuRlniMSrlHHNcidQCmPz3kDyNa5bgEoSm+q0SIKc8lsNqqb2vdJJ+I
 AyknSIUxcAKFZrgIjkjhSH7CpR1oe7kMb7V/lmX6W4odhQSiGVmpSAZ2Zu/suxHwcD1rDE
 8oN+nHfxIA82TD97c6V+QGOH4t248X0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-IdPLkbneM4K-oMvEDNXnbA-1; Tue, 03 Sep 2024 08:06:17 -0400
X-MC-Unique: IdPLkbneM4K-oMvEDNXnbA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a8683751595so440521966b.2
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365176; x=1725969976;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KYNG7ZSPE/elB3b9WkJzkds2S1MCd8qjtTvrXcJahJw=;
 b=m5oH1NG+et50ODlbI3nc4TG1v20mj0JA5yOxSko2cxZKVjz2uCxnh3YEzDi4UWmN3T
 sP3svCdBQSR+LYlZsy2vzm1lMRgkpUf7PzYoZ9UcpMs0QHHpIa3eOf9CigjDH7E8m50q
 atFSsQoelU3x8xY+E7ueldQ0pdpcsKVtapCp3T32RKBU6kenhFJbpW0b7DDGzQ+AwAkV
 Uk8OcuNLDt2m2mOnW2c8EytuteSJNuhbgbc+ymqISczgl2Mb1deqmgk4k5VHacHz9k2X
 4Lv3JdMLyWLpkWRFgbWIf8SC0cOQ/p/xhdvYvIDQiWLPdhd/1IV1Dwxh0FLTuHcDGzCD
 7C/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkhsX81BAS6rwb3tN1y/UgJmkWTPEOct/hHXSRg+0tNMLp4l+74zslAANteNKe4jkBlfKqWkBxCQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKgT6iGM+J5dp2eZso/2jwQhk1O3879ZS017f8OEfBNczBtBrv
 YLDjZfDiduYlujFdhCybd03jHt9KluJ+TlZZP8locUAtnmnNQOIFDXLE6bjBh5ALPIubGQueesq
 CVc5JpVqNMwue3fn+SipIvQha2lY9UrGxEwMJeiooAp/88xrsk70ZaI0Siwwr8SVb
X-Received: by 2002:a17:907:7250:b0:a79:fbf0:8106 with SMTP id
 a640c23a62f3a-a897f77eecdmr1349124866b.6.1725365176621; 
 Tue, 03 Sep 2024 05:06:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKHGdQu76q7cILNEki/LAIO6w7xbkB8ymwVL7bsW03a2bqt4zVKnQvFzb+qrennFW3Jt3aZg==
X-Received: by 2002:a17:907:7250:b0:a79:fbf0:8106 with SMTP id
 a640c23a62f3a-a897f77eecdmr1349122466b.6.1725365176148; 
 Tue, 03 Sep 2024 05:06:16 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892164f5sm672520766b.192.2024.09.03.05.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:06:15 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 66/81] drm/bochs: Run DRM default client setup
In-Reply-To: <20240830084456.77630-67-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-67-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:15 +0200
Message-ID: <87y149c56w.fsf@minerva.mail-host-address-is-not-set>
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
> The bochs driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/tiny/bochs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

