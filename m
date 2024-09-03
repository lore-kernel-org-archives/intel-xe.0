Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EEBCD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D861F10E520;
	Tue,  3 Sep 2024 12:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R408A1nw";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A93910E521
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHMOo9WHt2Js8QMS+ivCDnsW0bhD6c2SxEScDuVLqTo=;
 b=R408A1nwYeFS2DHdgQFFqvLyQ5duuZMlmLzWTnBg792SuCrJa01su05TU0o6A9SyMLuj4n
 RXDfUOwQp9yO+JMQxxpkkyCpuWgLGwk7u/QxcKiQFoHw5a4hsS3iqW4TDrYonNZwCNUBFy
 C5dekUbjXhXtfpVnX233qWHDMaXv3ro=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-6QjYo-w1PdiURZM_NZwKTQ-1; Tue, 03 Sep 2024 08:05:32 -0400
X-MC-Unique: 6QjYo-w1PdiURZM_NZwKTQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5343d2af7easo4768449e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365131; x=1725969931;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHMOo9WHt2Js8QMS+ivCDnsW0bhD6c2SxEScDuVLqTo=;
 b=OzvOb0XLc2rABKEiesjiGF2hejfxg4haN5X6XPqg8G7KQGv69cN3f4dDAL7XS5mKkr
 yN3pU7H2RmuC1YWkAI55sHuxIrm8ouCt7A6VxoKQTTdvOEXNX0WGPYWh4WV4nMSinRXN
 yaa/5bgP0HxWSKJLtMylrxDXD+xHHBaX9yG/Gqd18DA5smM8s5cN7YsRwriS8+zW0oVn
 baE++SenJvjzWNu+rnN5Oa2c2GjBwbl7GfuxTCOPvG5U0wruwoUWodHa1GpBTMm/v3zI
 nqV5IH1TdDLSiIr9l/Osxf4JcSz5tymDsT7EhApBBBlJtQyx4LZWP/2UNvUHeq/V5HRQ
 1geg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWffk8BBSOrQBCddIeYIvHr1BGV5bf5y4V0916UaL3PxEcRqKYLxAI50DmoGZxrLnk+AdiGxbwnfQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdBTi6QWO5RaAE0VOoGzvsThGqfp20CyFKTOxFPpgdDDz69yMT
 oTZ0WqiyJL/R33MLyDliy/AQuL9GFg14DWOnjVS2dKeKUfexFieNzq727+bu4VXqFjF8Zz/MGsI
 4qTCmB2MvY0jgriSXoIeSLeNNCIGqK4Je8QV6BkLOrDNyYxilDCD/hod349kzL4Kq
X-Received: by 2002:a05:6512:10d2:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53546aff5a3mr8192619e87.20.1725365131110; 
 Tue, 03 Sep 2024 05:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpghN3bq0VjJ2vU/J5Df8ul1O4uqOm+Qk8JhPzaDhtvMoqfngbzTsco324Pw6cFzJjTlVtzw==
X-Received: by 2002:a05:6512:10d2:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53546aff5a3mr8192591e87.20.1725365130473; 
 Tue, 03 Sep 2024 05:05:30 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4ddc8sm14049200f8f.21.2024.09.03.05.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:05:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 64/81] drm/fbdev-ttm: Support struct
 drm_driver.fbdev_probe
In-Reply-To: <20240830084456.77630-65-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-65-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:05:29 +0200
Message-ID: <871q21djsm.fsf@minerva.mail-host-address-is-not-set>
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

> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and reimplement the old fb_probe callback on top of it. Provide an
> initializer macro for struct drm_driver that sets the callback
> according to the kernel configuration.
>
> This change allows the common fbdev client to run on top of TTM-
> based DRM drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_ttm.c | 142 +++++++++++++++++---------------
>  include/drm/drm_fbdev_ttm.h     |  13 +++
>  2 files changed, 90 insertions(+), 65 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

