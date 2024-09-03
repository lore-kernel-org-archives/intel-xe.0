Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB49FCD342F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691F210E4BB;
	Tue,  3 Sep 2024 11:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zx9+lQAp";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9947710E4B9
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vdWgGVoYLM430WyC+dlybsR86ICY1TW+TxFH6owfPF0=;
 b=Zx9+lQApr6MbIIhBlHhaBvCAaBHBCVIkZrjcIGDn20l3G6o7Ebwm+BlcAf6pC7Dk/bDTb2
 6zdTSJv6LFq/UGbryCM/Z/BZQN8fTI7aczP33nMxA2HGK3DLTJT1eyLXiisOAWg7jNssuc
 s1leMkVZGNNv4cf2+NpaoC5REHIlm2U=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-pEXzHCa7P8GoblQ6Uf2OJw-1; Tue, 03 Sep 2024 07:26:19 -0400
X-MC-Unique: pEXzHCa7P8GoblQ6Uf2OJw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5334824e68dso849058e87.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362778; x=1725967578;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdWgGVoYLM430WyC+dlybsR86ICY1TW+TxFH6owfPF0=;
 b=p88DhXJnFOsrj3OQcefsBS9hlOb4AHRhpf0Vp/E+R2/bynEt0eEbFOIc+3pbAQCSqC
 zZOaZjzt2MFncIyRjxmA/4nffw8ylLvNhTRv0mwZk21aHZtqIgHTkm8dORNt9X6JBwnV
 3qJ2jA880sEuCodrsjs7V/m8Er01ORfx/aKc3jI+L2jJfeq5mceY9lbBT0MFrL06r9wB
 xuB4ZCpkZJDSLE+YXAwFpFt1G0XQB+lqNv9Ep6RsK6MIZQ6M8bDT1ZuFDd4gGXy9iGaK
 C6FttHaoOVW9JKAip4DW0j0FK24zl7yJrehvfJ17h0ReYvxKLlIHxDqmEJD1iGkkic3c
 IPRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlKk6npwreuFL394Iv92rJnoXPT8hgEa9yYFTPbHRGYUXLMwewL7QkZqJ04hTcW547lOxuX9WqVA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9GOxQS7XJGU+XpAqM7HgUpGIY8g/0wu9CV40pHsfHXUiiLlU1
 Tj6xYGkEP916oXMmgf9MvC/yQwy2zaR/3qEgEF1VBozqGfkEdNxaAOdcinQNotDtRDrdQdqcfp8
 nuF4Mxd0RKrI5HzbCBn4cC5basCNBX3/Q58Gxqm/4kTQKN35JpadFrReZlg0+x7oS
X-Received: by 2002:a05:6512:1294:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-53546b04544mr8808346e87.16.1725362778310; 
 Tue, 03 Sep 2024 04:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHwRLJHDZdrQkwQWAm+tFo/D0GDWaihGfGc3BFYX5j5bYPJbZDKSAndVvvzTOghOv1AtRVHQ==
X-Received: by 2002:a05:6512:1294:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-53546b04544mr8808321e87.16.1725362777673; 
 Tue, 03 Sep 2024 04:26:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba7b4271fsm200957535e9.29.2024.09.03.04.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:26:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Edmund Dea
 <edmund.j.dea@intel.com>
Subject: Re: [PATCH v3 23/81] drm/kmb: Run DRM default client setup
In-Reply-To: <20240830084456.77630-24-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-24-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:26:16 +0200
Message-ID: <87ikvdf06f.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Edmund Dea <edmund.j.dea@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

