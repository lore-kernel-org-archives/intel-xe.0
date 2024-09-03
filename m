Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B770ECD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBD110E530;
	Tue,  3 Sep 2024 12:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BiVwh+Sc";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418A510E531
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zx4hxQtRMdOzrygXNdwQEDskzaynxlUA2aQcUcONdUA=;
 b=BiVwh+ScsdhggeB/RdB3+G3JoPbn3JtVOTgU+nmq/WEHINBE+GGl0LbltdHKarKNLICNKX
 l5rqu8MEwqmQeMzi+OlN6gtKcq71DSZtDzPI6LiaXMIzNBVJZCmUA26Vc1+IMA1/ljyqPg
 9YDudoBlp4DvU+EE97WP9mgydREFqg0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-vYRuSkHGP0C_K27O0J2Gjw-1; Tue, 03 Sep 2024 08:07:03 -0400
X-MC-Unique: vYRuSkHGP0C_K27O0J2Gjw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2f4062343deso50567181fa.1
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365221; x=1725970021;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zx4hxQtRMdOzrygXNdwQEDskzaynxlUA2aQcUcONdUA=;
 b=FMm7ZtStbeFmY/MNY3s1Uq2SGoIN6uXT3OiLlSwPEJ7mPG4WIwQ3NqHDYRx3CMmwu9
 ou9CqEI7kybZDLvq37GM7RhijzYO/IZ/vCZJqZTHRt4ZxzXupGezQjrf9njt0AZpgtlp
 MbRC2ekqBKJOv+fKn/Qt3kO0hN/kGaz3gcaV71yzbJhrznIBw1iZw1f7gXIDkIJWtaV/
 8cq9Sxlt5o0ssgoMrhokC9ghV9M5v1YxSHHNFVnNx1O8K27iY+lQmd5n8S/ktbyxmjYR
 e9yWLYcd2da5Kyjp5XMdjmmKQQG6sienC9/mvC3SNwEm9RQZupIHRfKPIstH7GlH8M+C
 skXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuaO42MiuIj67FA8tZR16dn8/5fWLkr26mOsoYhQqGz8OlPCtfXeP7K8M8U0qL+B/yyEz/cwo5Ow==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1rb8TfzwlQ2VjEj7uYswz0N3VZEiKU5aDV+iPCgfopp1XghR1
 YwKRgBdDEc7wvS2o8H5g0L6loPrWcY5MgtULz2+84zs+yWKqVJ84pE+HIk8zficXBuZ5b+zcdIo
 dj8WUQcQksrFm/WN+bnlJKbVegL2QhAndv/pwAUUX5FZa5ZjGEgiUjAPg3aYPdW1PpP/TVhlD
X-Received: by 2002:a2e:be07:0:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f62655044fmr76802001fa.7.1725365221300; 
 Tue, 03 Sep 2024 05:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhYL7VU+pPWXFbZvZO3luoy/PZCZxgIoqNkVLPQzNR06jKjtB+IuiohUKE273yPfAVbpvuDQ==
X-Received: by 2002:a2e:be07:0:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f62655044fmr76801781fa.7.1725365220740; 
 Tue, 03 Sep 2024 05:07:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e273e3sm168566335e9.30.2024.09.03.05.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 70/81] drm/qxl: Run DRM default client setup
In-Reply-To: <20240830084456.77630-71-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-71-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:59 +0200
Message-ID: <87seuhc55o.fsf@minerva.mail-host-address-is-not-set>
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
> The qxl driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

