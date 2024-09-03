Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BE7CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB8E10E4E5;
	Tue,  3 Sep 2024 11:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LBYUyt4A";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8D410E4E0
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c51g429CqBiAb8sLxTg967o4LCr9w5BY0m8TTXdBTJI=;
 b=LBYUyt4AukJGQpQGT8yQX0XtdOUMXzBvvU40LrIW8LpWM+h8FP03LtFLZ29g6e+nd2CZzg
 z1/mKYPqQuAptohD9pjPTN2sIjv6EANpUIt7meyZsR2VhFLAMZNX4Gq5AMHes2xAXvPMqq
 uGPmuHWOBgixtcLFVB8Gc4mBHiy/GQg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-HSQgE2zoOhSNo1hQ8S8jwA-1; Tue, 03 Sep 2024 07:32:21 -0400
X-MC-Unique: HSQgE2zoOhSNo1hQ8S8jwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb8610792so46105795e9.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363140; x=1725967940;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c51g429CqBiAb8sLxTg967o4LCr9w5BY0m8TTXdBTJI=;
 b=N965U+NjYMrtm0/R0RrIXv6S3udaaXfRTjC4TlHL1QcVkvtkNf4N4NstF/q7p4pqnW
 zwk+Eoy8qsvZzkR6pDSyBqFyiR1mU6WKATjGegdLLhnE/Zunk3eiLkTRjWMW+Iqrf81Q
 xQduMT0/vJXay97vyF/+arAHx+40zFzGo+F3PL27uH9uQgPmum5K23dyeuN1qu4oJLLl
 7RdEEor8H/v7ZYNLoFZbfeyUoN10UCRI1iu7uA/4+YkGJO5N/VTuA4XOgVTQ9VnbxNtF
 +/3lfqadb2Mv/IqZwLnI+nAJnRzn4l2+/kLCCDro8OZyk5Qar4ZGQizzJAxxtWi/lbsj
 dNIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcJ2PZRilsX3o8SBbGqOSxi0v+a2ID0ewLEVhalTbXrphqVRV+sRZyV8zeaCQ1f1SN/0sBm2L/pA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+OR3ysnAhXMFtH1mrGGwBJLSuRs1d+1xNPkei+JkvwxxLeGkK
 3f4Y4NpISB9o2aV7/Uo+T0tqTjPHYG5caQUYoLfj4O5UwQ/tBRuIbMvFkFPa4yOkSF6i6Y1bs02
 ZsuvNms115ezO7fNfO/fPcbK5brCKZz2/3Ug89nwwNB6qgN/Ip9wQJZd9KikkcrDpxp4e48By
X-Received: by 2002:a05:600c:4591:b0:42a:a6aa:4135 with SMTP id
 5b1f17b1804b1-42bb0308417mr139793685e9.20.1725363140438; 
 Tue, 03 Sep 2024 04:32:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp42gNprz2um//CdGf3nf4XLE2F7OEX9FA43AbT1f7fMaJeIdKj5LbeBnDqdBCONucMiA4yQ==
X-Received: by 2002:a05:600c:4591:b0:42a:a6aa:4135 with SMTP id
 5b1f17b1804b1-42bb0308417mr139793465e9.20.1725363140014; 
 Tue, 03 Sep 2024 04:32:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b67ff88dsm11060831f8f.26.2024.09.03.04.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:32:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 43/81] drm/tilcdc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-44-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-44-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:32:18 +0200
Message-ID: <87r0a1dlbx.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup_with_color_mode() to run the kernel's default
> client setup for DRM. Set fbdev_probe in struct drm_driver, so that
> the client setup can start the common fbdev client.
>
> v3:
> - add DRM_FBDEV_DMA_DRIVER_OPS macro
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

