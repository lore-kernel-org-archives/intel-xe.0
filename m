Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E58CD3429
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:35:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8390910E4EB;
	Tue,  3 Sep 2024 11:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qkgqp+vF";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0A010E4E8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TSTF58qr8+XEIh+oYno8E8uAlH24T+aQUMezZd/qxQM=;
 b=Qkgqp+vFxk59jYI6KmXgftiUt2H4gkyvP5PCRf7YH0z240Bay1/09+1lEMLiVCRKs7caqt
 XAUgrdTYjsVcfvwlu7x1ADWNseNQ3mblyDw624yR5DNDtST7ijkugIbkCEwW3jKbb1hlBx
 Yw8ZtJnrFjl6ES6VZehRR8kF7BM3yYk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-K3224vvzO_-mdNteAo-4LA-1; Tue, 03 Sep 2024 07:35:49 -0400
X-MC-Unique: K3224vvzO_-mdNteAo-4LA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb8610792so46131115e9.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363348; x=1725968148;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSTF58qr8+XEIh+oYno8E8uAlH24T+aQUMezZd/qxQM=;
 b=tOdCPVjnkAXMYIjPVXF6PsKtG9xeCgck7oXDNcx52yMZzNIOO68uzTK+Tc490xgC1w
 8NXJJb2a2fOXrPlMaO1IlZWiFv68vyiDORk+Dm/wE7w/22AI1LR4dcOR4OD7ifOWx4up
 A8g9qnHV4Wj8JHme/Bbubxca+/PoRP3m2itNh7+w6RtxYxaPY8+54B4trwQRK2nbiJsX
 zf9/pL39/3jF31irgV3n1AWfyr4tEMlT3PBdlY6J+gkrBE/qOBMqEnuEZfdu8JMlrzQJ
 oJpFXGXLKzjzQPbQn5WO4RZcC/bb0qOYFNAovDyxGMNsTf2w2tJKHJfdWSaXTKW9XKtK
 5fmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNNDjCeDFnCuroB7bmx29o1WfKVe6sCMbqaEDOjoA0hVuN0bs4pdBRZG20HXwV/hkdep6sZZb9QQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1pNa0KNpU3kn+j25AsUBODnAHU/pOOnFg3l8OakPi3DykRJmi
 FKpbYYYa/l0guAUuygMFx3c6tEYtxA3sXCpQFRWcvQgQfHu+YlgRjlUW5Qaq2T6YjpzEGxA9tJr
 lWvpHXmGyFFS69XZooA5soXbli5KhAvDsYkNw1Y7ozHO7ZVVKJz2tuWScF/RWtS3Z
X-Received: by 2002:a05:600c:1ca8:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42bb02edaf6mr130000875e9.13.1725363348474; 
 Tue, 03 Sep 2024 04:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtyX2uOKVFE476IZPot6lc0AMFObvLiZGeI1TgAffaxGluqt7ZPRIl9eZVAwWXt4J+zTGPbA==
X-Received: by 2002:a05:600c:1ca8:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42bb02edaf6mr130000635e9.13.1725363347900; 
 Tue, 03 Sep 2024 04:35:47 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a42sm165399665e9.11.2024.09.03.04.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:35:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 49/81] drm/fbdev-dma: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-50-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-50-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:35:46 +0200
Message-ID: <87o755dl65.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_dma_setup() is unused. Remove it and
> its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 120 +-------------------------------
>  include/drm/drm_fbdev_dma.h     |   7 --
>  2 files changed, 1 insertion(+), 126 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

