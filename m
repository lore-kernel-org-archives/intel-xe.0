Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B028FCD342D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734E610E4AB;
	Tue,  3 Sep 2024 11:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SJhIq0ZX";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18B810E4A9
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0gkkLunGIQ2kaDQMdtHzMdkTGKuWZFk1+nOKDyR4as=;
 b=SJhIq0ZXyxyQb4AdDZ0E94bkQFXvWWocjTXmL8ZYukhP+RZig4pK65Qg8joVp611QBnBsw
 ZncHO9G5DLFblvKPxekGa7XgaUp3f9gkzYE0jBF1AYM5bJHxD1SrpD+/vMIvOTrKPOYBSv
 /jmnSsdbzGwC21PZcCVkAwMnoe89fWA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-D7YWvKnvNlOkNN1icb1mbQ-1; Tue, 03 Sep 2024 07:24:44 -0400
X-MC-Unique: D7YWvKnvNlOkNN1icb1mbQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5334191fc41so5004645e87.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362683; x=1725967483;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0gkkLunGIQ2kaDQMdtHzMdkTGKuWZFk1+nOKDyR4as=;
 b=P0KLOa2LTtK9hMn9LEFO68eYQgLHjannCMB4TvgKN2RyltdN0eGJIdvDwXOP9Q5n+n
 2/SnymZr3D2qekd6F1TF/NvRHNbyVFMT76aRtl2Z93L3htqU/K9ORdhAvQYvD3l4s1LA
 cf02VKGdMnA0GApCJo2nAmukl5jXs5xjTFmmQkOKZP3fAygMQdtuwS4IAsBB/hiA90Dd
 ZUoUYbl77dM6VYAHws4gLlVsSiv7WrO5OFCTVE67/PEmRBaHanGEu2SNZbL0AjLRWO/W
 wLdbHQ7989o3RHxRBt9ZOR6ASYMY7w5KOVJxFMupI+wqveVmNKclSFVImVx8Iyy/1xXa
 RuOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnnRXD8XIRbWR3ulZlVNsVSqrSUHC/uWLnBiwIznThTWKTDQtUbka1OP4lQSAxCpmBqTUDgUn3MQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFTFhBgQHkaXYfX+T4eB5GtHDWcZAk1WZ/Nxm93iUI2+h5ulbt
 ghyG5dq8gO6RmF4p2brc9aOBVURShYRdgrwlpsdNgCZfeWNMjX0BROxV3jRGxzRJZK/qF81+1r4
 eAXb22X/XRxg5CKJlyjFjeEjf95jPaw9lQPbnkCcMTmddVNJb6RY672Mqx4ODhVyI
X-Received: by 2002:a05:6512:3b99:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-53546b167famr9189258e87.7.1725362683203; 
 Tue, 03 Sep 2024 04:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV4RoPHMRrjPOqT1ox2wOnC/TMkJttXZQfXhIXmK0ZwIW9dx/0UkvKvAIAwP3zEiWjbdgR2g==
X-Received: by 2002:a05:6512:3b99:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-53546b167famr9189216e87.7.1725362682612; 
 Tue, 03 Sep 2024 04:24:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b9d54f98sm10542803f8f.69.2024.09.03.04.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:24:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 19/81] drm/imx/dcss: Run DRM default client setup
In-Reply-To: <20240830084456.77630-20-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-20-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:24:41 +0200
Message-ID: <87r0a1f092.fsf@minerva.mail-host-address-is-not-set>
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
> The dcss driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

