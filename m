Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4AECD13CF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230EB10E484;
	Tue,  3 Sep 2024 11:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RVm0TRaE";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CAFF10E484
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPIaWn3XKTIUYS+fskj3MRFK24/VwACXAg9gDBEvo1Q=;
 b=RVm0TRaEbuKhsGY740Jz1XcERq637dAA865C5NqGloni+OFgcDarEmQlckuMcqybVCq4H0
 iGq/49FZ1mgikHluXEx9D3vxccAbzHJIcC7Bos33dhMEynGCCncr7Xn1DWE9lPftqqSEa0
 T9rr6EuUM6SqzZVL5d7wEa19AdQBOh4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-DKw_98jZP6uzuk4m0_Skcw-1; Tue, 03 Sep 2024 07:15:01 -0400
X-MC-Unique: DKw_98jZP6uzuk4m0_Skcw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bbf928882so34078575e9.1
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362100; x=1725966900;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qPIaWn3XKTIUYS+fskj3MRFK24/VwACXAg9gDBEvo1Q=;
 b=uRTanwT8kpBXCyaODxbOd2B8lQ30chuaGzYPg+3fkVNBknSIp+RXCRZUttFPe2WsRT
 cOke58ViUfXN6DKxez0sEuzrEDjrp1MkvR5/Pn445iUkGINsaA9EyylQYhvzxhwERPnI
 p8blYD9lBdR5qGdbHe2mS1wlxz9kQSbcFZOR7EcAGnB/W8UGqMbfg9qe8HyOAcfrOwD4
 j2NWSvYGjaTq5MMbWJHxjTQvX4vlAACpFcGVu5qjuhOmRN0g0fuaXplwNgPu9ukywKyT
 iLEXW4ggRU4JV74UMXUTUnI6TFHFxRrzPk9AW850KFq1qVUwDHZ3IV9vNvUUiQHf4NgZ
 MGQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsSy0l43QSxICIADMYYiZfzO4qhCCOyp1a3T4Oft+dxAFzPjf5nEeLkfn5leWhpZ32iupfw5GTsg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhJkTVeqiMjiAs5kE3W46xerafROYWykv/GfnR/o8WilXvsplC
 CkFYkfefXkHvFTVisPwYD11kPHu5/IaAT60Fr0UhkKjb9JzDzCvIuQAoyAh2315AN2ZZmM+vjad
 tPCkT2U+62cPUeNMS/O34qlUG8nlXaPC5urFxdY5d2W3D/FD/wFngJxA+9F7Jxze2
X-Received: by 2002:adf:ffc6:0:b0:374:c075:ff34 with SMTP id
 ffacd0b85a97d-376dea47229mr253920f8f.38.1725362099845; 
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9s7pVNolnOfMNcbdY8XHk0ufGy7cJsjGqLu3OjVig8fSkTk0+X4NyG6sNUsFTrkUHEkNUg==
X-Received: by 2002:adf:ffc6:0:b0:374:c075:ff34 with SMTP id
 ffacd0b85a97d-376dea47229mr253900f8f.38.1725362099279; 
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba3da654sm10294803f8f.89.2024.09.03.04.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>
Subject: Re: [PATCH v3 12/81] drm/fsl-dcu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-13-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-13-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:14:58 +0200
Message-ID: <878qw9gf9p.fsf@minerva.mail-host-address-is-not-set>
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
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Alison Wang <alison.wang@nxp.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

