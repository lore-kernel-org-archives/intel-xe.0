Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46315CD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:21:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0A510E570;
	Tue,  3 Sep 2024 12:21:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zc/rOa8I";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A56710E56F
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725366091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BELKt6Ttgttp44KZLo39NaUCnuGWPJGVPDpp4SZgL/I=;
 b=Zc/rOa8Id4nQTJWC67moQ31ZpBJJqsNp60pAQwqH8eACVSD9lpL8Sf3uujSrH5JTWPqlde
 qW2ktLd8tcBUgkxz7uOezilqJNbghsxPrXAFj4QD2spBLJ3iTVfVjrd8/q5JZinWJEdMlk
 +e+z8ltKGYbAw30yssX09OVGw4OVgzQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-iRNUSIkiNKKe_TWMZQp9cA-1; Tue, 03 Sep 2024 08:21:30 -0400
X-MC-Unique: iRNUSIkiNKKe_TWMZQp9cA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374cd315c68so1196105f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725366089; x=1725970889;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BELKt6Ttgttp44KZLo39NaUCnuGWPJGVPDpp4SZgL/I=;
 b=VwDfjUZC1XSh0X/+JFCvpkVoAukBGYbWTfYb6A6vreexl91jJCY0yMUj2E97tJ3fOq
 Y9T6rWKp0DWU/rOWuq3DLTSYjg1gJdZm3kdYWikOyH7KNyl15VU2kadjbIucWXNuSvOc
 RUUHIaQ0FOqB6z6zlOpmRu2RjlpNpGDA4vBJfG/4ER7hoBe/WFdVW3Qzodd1j5XrHyCo
 DuuZBNjw3s3JkmdhkTeN/xSH/Gx2oGpLzK/4ieF1U9Kj+L/fqJAo9qaoNN2osYh+eWnZ
 3b6uXOUF2q3P8T1OE+KwvEKoRmjoE4P3HQcaFJmW6c6APLfDszoFsOOsDKH+kCHR4/pA
 AbjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxAM1jHfezXKc8Kn64dzg81ZTD0FP4WGlEwK8ByQWOTARVUkDMQEjqZI1IpflIgozXb6tAdimwuQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQKThuhDygZsrZnLlyJKXL6KCG5JSeIlRo4Gr4Lp+UH24295bD
 z4TELF1kMan24DbP7Jbm6esKBfUpH5FIhtpeFsbpCoSd5hBSyQQek+T8zzvSPj5NnHF5O79hlQ7
 ChtJhuivvWsmmtrIKnWPCpOTgjTftlwTv6HZlq6sKpPRukBcol+nw70C10oI5loMF
X-Received: by 2002:adf:e444:0:b0:374:c1de:7e64 with SMTP id
 ffacd0b85a97d-374c1de81d6mr5378321f8f.42.1725366089287; 
 Tue, 03 Sep 2024 05:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF8EjxKd2aOIdtAzJFfWCYf1w8V/EizPUPJu8WLhb/9BPY/tZjtvJP/yhzDFusXvOdur9h1Q==
X-Received: by 2002:adf:e444:0:b0:374:c1de:7e64 with SMTP id
 ffacd0b85a97d-374c1de81d6mr5378299f8f.42.1725366088831; 
 Tue, 03 Sep 2024 05:21:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c958c471sm6157477f8f.25.2024.09.03.05.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:21:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 80/81] drm/omapdrm: Remove struct drm_fb_helper from
 struct omap_fbdev.
In-Reply-To: <20240830084456.77630-81-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-81-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:21:27 +0200
Message-ID: <8734mhc4hk.fsf@minerva.mail-host-address-is-not-set>
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

> Store instances of drm_fb_helper and struct omap_fbdev separately.
> This will allow omapdrm to use the common fbdev client, which allocates
> its own instance of struct drm_fb_helper.
>
> There is at most one instance of each per DRM device, so both can be
> referenced directly from the omap and DRM device structures. A later
> patchset might rework the common fbdev client to allow for storing
> both, drm_fb_helper and omap_fbdev, together in the same place.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.h   |  3 ++
>  drivers/gpu/drm/omapdrm/omap_fbdev.c | 42 +++++++++++++++-------------
>  2 files changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index 4c7217b35f6b..d903568fd8cc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -32,6 +32,7 @@
>  #define MODULE_NAME     "omapdrm"
>  

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

