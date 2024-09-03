Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AEECD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AFB10E537;
	Tue,  3 Sep 2024 12:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f0+EJh0b";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4CE10E53B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAf/TzZtq+rwzNtcBqcoWPNDNpw8IbIKF1x2SXWWyZs=;
 b=f0+EJh0bEfqtP20AhvQ5uchIpeCcH+Xof9NT/a1i5/CsqMjBGiWCfIBEgP78mhj6m5yrQC
 /mYF8LKyH5aTv7ADCcpbX90ZDP2Mf3qKcm4IE2Z+oMEWlGQGuM55z100LgJ25aRQmYsIs9
 ynmK8ONLXJQlK4PkAMfgMg5QveijLOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-pOMDBTocOr-HHmASid8yQg-1; Tue, 03 Sep 2024 08:07:46 -0400
X-MC-Unique: pOMDBTocOr-HHmASid8yQg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb9fa67d7so50471335e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365265; x=1725970065;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAf/TzZtq+rwzNtcBqcoWPNDNpw8IbIKF1x2SXWWyZs=;
 b=RcaKoYxGixbNAieYxcMO6WoNhQsqv32AKqFyU5S3KzVZ9lrGV6RcDew6yaZqElLpR7
 q65nIqOFqGXrvqd+V6ytxoKDaDLw/SkzE7oEUXXhfQD17LM4mHbtDtaNxigASrTBaUaO
 JspRu6h0hihW7KrGSlVBkGZ1YnFYuiTzMqyygeOwm+lZx3ugyaWam9YaphhyE/1FoTFc
 bN4E+XJAt+/rEt5xSPbfuzf8U4wOjU1E4OkkA4fCNk5L90cxQxqac2mHiZMasOx3KxUs
 GSKFBgAmPUyxHdnXwYopUgB85xTZUcMPg8tniq2LXto9fXyJOcmi1noiiYXKUoErTRgH
 WcRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8XU7CLnHAW+Pi5Cung1I9ASc1ijPSQpgyYMKTM/Pe4GKAv+AZB82vzouWY+4hfdJLCWZmVAq+MQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBfOO5lRHpVxeVsbF7HhF5JXydzSSHNFV+EapEnZkw6SM919TF
 wUFU2JS7d1lTNLAjAkksEW3UA1sCicqx/JmmaQ9MfMTBG9ycPPZG4sOplCvcMEVgZ+7ahC+vmCj
 NXpcaYKTm2TxKJjDJfX4Ol97MQ/uEhYq/1jvlqXvUKBFFm9ZYagMznvMDArmDE5kG
X-Received: by 2002:adf:f4d1:0:b0:374:c160:269e with SMTP id
 ffacd0b85a97d-374c1602776mr7846590f8f.22.1725365265438; 
 Tue, 03 Sep 2024 05:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCZGf4oyMzQD1xP820+OtoZdwpD9efRDqC8p6dHAxE3oooeovG0mBCFinpOGmjQ84JGX0fEg==
X-Received: by 2002:adf:f4d1:0:b0:374:c160:269e with SMTP id
 ffacd0b85a97d-374c1602776mr7846571f8f.22.1725365264915; 
 Tue, 03 Sep 2024 05:07:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b23f20d1sm11428477f8f.35.2024.09.03.05.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH v3 72/81] drm/vmwgfx: Run DRM default client setup
In-Reply-To: <20240830084456.77630-73-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-73-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:07:43 +0200
Message-ID: <87mskpc54g.fsf@minerva.mail-host-address-is-not-set>
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
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

