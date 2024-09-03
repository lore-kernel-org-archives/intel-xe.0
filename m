Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549FCCD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00BC310E52D;
	Tue,  3 Sep 2024 12:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rx3T54+l";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DA910E52B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKH42MPBYmGRwEigr3d5s600iIva9uiUrOTp/Gc7qDw=;
 b=Rx3T54+lHUkqk/yocrmVZl4ElddWnpg1ws27Ew7vxtQBZbkhrnrOe8gy8vtmhm/n+b8w3M
 /1+2UxBPKhq0XoIkXGPzv9a2WeIXE8ouJeB+kbBxv+U9hXj3ROOHZDm6Y24uvKzGKU53HJ
 RwLVi0NfBv9xhnLuH+Zm/7J6Ez2Zoxo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-Ae4Gq5dUOlS30Ezb1vLrsA-1; Tue, 03 Sep 2024 08:06:34 -0400
X-MC-Unique: Ae4Gq5dUOlS30Ezb1vLrsA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a870cad2633so459250666b.1
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365194; x=1725969994;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKH42MPBYmGRwEigr3d5s600iIva9uiUrOTp/Gc7qDw=;
 b=BYwk7tWIeWwaEuuKMtWnrvoekiGOzS8omUO9oEd8Vj+/MLOydP1qz9Hu1bxydqrhmj
 bhbXAf9UFe94N+n1ODVQ8RfSUsFk55GdfzaIjICwqCKM5TulztmhWcefNJuXnhiuwH/E
 /hICGqwXFtsPz5Z6NGp1rrVufeIPxAbFtbMWW3peRYwvOCbgVntSRQs8/8qjMgEiFOlD
 IDD+NPzi+p+wzWoLK+yy/cS5Ro900S6prM67UO37fd3Ii5/xjqmiKjGNjn5FqCvLWaLx
 ZMfLLpg8YKOBK/Evd8PoQSEtibY+7zpMaYaSqXk2cFIh/OMhmHNh01XDly0x0qANHW2O
 I4Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcBAKJjJTF4FK/W6l5KEltiP381YQVgNkugD42uPr51gGc1anMsiRlpYAbclZGkIjpJ57F9nJsVg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs1+IjIL8TnDtQpKxZlHT4SPlrOSwlKVkwDsi0svX0zx9DOky+
 TNlNyO+WeWxo305NlWnxyhp7JND+IHyZIyViUUZHLw5DANXr8xhAtocRo5U9Uga4TvQrEHqHc7Z
 o8B2SXvDHbWVzMwsP8EarpX/aP7TSrY955Pc7jMY62LG8SNAhbki4vUyBxZlqssh+
X-Received: by 2002:a17:907:980d:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a897f83a33bmr1262521566b.23.1725365193657; 
 Tue, 03 Sep 2024 05:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKoeIshuDSdtf/JGgIl6tnQAFAZn+DDFBpQM9QN52xxGXt/DVTGdF5osqSdNpaEvBaP2lGVw==
X-Received: by 2002:a17:907:980d:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a897f83a33bmr1262519066b.23.1725365193131; 
 Tue, 03 Sep 2024 05:06:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f0acsm674520966b.73.2024.09.03.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:06:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, John
 Stultz <jstultz@google.com>
Subject: Re: [PATCH v3 67/81] drm/hisilicon/hibmc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-68-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-68-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:32 +0200
Message-ID: <87v7zdc56f.fsf@minerva.mail-host-address-is-not-set>
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
> The hibmc driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

