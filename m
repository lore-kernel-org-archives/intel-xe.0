Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAB0CD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 10:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6910310E3B0;
	Tue,  3 Sep 2024 10:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E52uMII6";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A3310E3A6
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725360124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6lwmVfPx2sszsBri4TFoZL/uMUGIYxHzznRQSGZUMD4=;
 b=E52uMII6OAGpiXMbmHRi4kDStzop1mfkPo6CKAkke0HeCO3gJ2UW3CL2LDjWrmKgNIw2sn
 OEB9kC1kSnmr/HLcOLPjGdlE5ZbYCXj1GWl4/HOz0pSGeu9EgAkWpp/YhyoZTE0NxJUbYI
 OoVfwI2Al3pQXzYGwuzoa5Q/b+ds1pY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61--3eaz4S-M8ivZWr3t2IN5w-1; Tue, 03 Sep 2024 06:42:03 -0400
X-MC-Unique: -3eaz4S-M8ivZWr3t2IN5w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c4c48c87so1481186f8f.2
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 03:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725360122; x=1725964922;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6lwmVfPx2sszsBri4TFoZL/uMUGIYxHzznRQSGZUMD4=;
 b=dMgUi3vmfAH6wjwqxxU6IvvrqamsVEz9OW97Gj3WXLRaWV1P+pIbIcjzcSrI6bhFoq
 dxlqiYUTK35QYj+GQkLeGWRk4/R3MuvjI6wuIDyEGkFlZO3iATxKx15ttakd0PCwQtMa
 O0W6n6fPjcKF3YEkot0Zo9KpcYI80yXJC2+KLSNkRfxJSUK4tSbr+GIBA0WZRhlnpzzn
 eRZy9c/jDVbSmsNZDYmH7v6LvPzxTqll4UPQqTWipI2g3gR1J7PKgI4XwK/BZF+ZwiHl
 WEtxFhdo2zoWJ+k+LSXEroygdTqdg2wVl1GEDaFgUSCmcQuWEt7BSTUDkOYKVRUsrMWE
 7ojw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX33lN4jEy4fFbkOVbWutxvlYAVOkWd00u+Ox84WaiX3DzYBqknnX/e6Ynidbv0O+1GZAErbWyc7Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTuJAzcpA7dip+0+xGDr2sKtvFd7mze4OSNNHvzAmQATqgFyDI
 eOtQdGI6RO6i1tRTi8WrpbB16lwVhMoMSs0nd+GYpS2XsGL/Q+0X+m1cDKHdP5/3qgld5sNMK6h
 mqjSdFAq5af9XSLNyvt+1VQxVEBg0WAlUSWhozETdhDfeDyYb4z1SIB86jk+qdln2
X-Received: by 2002:a05:6000:18a7:b0:376:7a68:bc42 with SMTP id
 ffacd0b85a97d-3767a68c23dmr1148279f8f.27.1725360122016; 
 Tue, 03 Sep 2024 03:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4YS9bNBLLWoNJTDrRNeKzv2DqbtrI+GY2Fyjm7bbAi6bx9DMubdkqlGYZw08xR/rtbBxWw==
X-Received: by 2002:a05:6000:18a7:b0:376:7a68:bc42 with SMTP id
 ffacd0b85a97d-3767a68c23dmr1148260f8f.27.1725360121455; 
 Tue, 03 Sep 2024 03:42:01 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a0asm167347215e9.13.2024.09.03.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 03:42:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 03/81] drm/fbdev: Add memory-agnostic fbdev client
In-Reply-To: <20240830084456.77630-4-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-4-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 12:42:00 +0200
Message-ID: <87jzftggsn.fsf@minerva.mail-host-address-is-not-set>
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

> Add an fbdev client that can work with any memory manager. The
> client implementation is the same as existing code in fbdev-dma or
> fbdev-shmem.
>
> Provide struct drm_driver.fbdev_probe for the new client to allocate
> the surface GEM buffer. The new callback replaces fb_probe of struct
> drm_fb_helper_funcs, which does the same.
>
> To use the new client, DRM drivers set fbdev_probe in their struct
> drm_driver instance and call drm_fbdev_client_setup(). Probing and
> creating the fbdev surface buffer is now independent from the other
> operations in struct drm_fb_helper. For the pixel format, the fbdev
> client either uses a specified format, the value in preferred_depth
> or 32-bit RGB.
>
> v2:
> - test for struct drm_fb_helper.funcs for NULL (Sui)
> - respect struct drm_mode_config.preferred_depth for default format
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

