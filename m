Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B6CC5320E
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 16:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1E710E2F4;
	Mon, 19 Aug 2024 16:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bYDTDqt3";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F0010E2F4
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Md3KCJoK6feytlwXA33ydyo8XOfTQqPq8yxw0ziYE7M=;
 b=bYDTDqt32Hmm0VBHJpXn5uLaDpuOaLRmQJ+0TCgyXF2KdPv2DmE7je9I4p+dQFSDz/QMBu
 qlRZNqMOx8R+H2cQ8rP2+NqMK8ZVQguqjGxp0asaaTo1DP5FqjnCqG1R5JEw6uGCddskPR
 NoJ/F7r/Kjab0hK4hWsKbG5DO1O78Vk=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-MXdCBqgIPb2ARDOYxG4Uhw-1; Mon, 19 Aug 2024 12:42:43 -0400
X-MC-Unique: MXdCBqgIPb2ARDOYxG4Uhw-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2d3d413c4edso4604813a91.0
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 09:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085761; x=1724690561;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Md3KCJoK6feytlwXA33ydyo8XOfTQqPq8yxw0ziYE7M=;
 b=J2tLX2MFu7ebXI6cq6Frt+PbwucYxa+/t6DteTb3P7yPdfapjsRX5jg+5FRusl4f9O
 hTaW+G2bWEfxpcX37CD/Lypqfw5pSvXAUuvVjTru9dJ5PGYpf6cS7xGzeG9Zu4i6H4uu
 RpvRMTEDuPIXipPJ1QSu+uXoj47sRg2aHP2sJfbLihBYkupCu6kTDAIxTPS0h9OgYuAl
 19jWKg0ZrmSt5WF4anlVopNkq3W8M1jLJcTqcW38X/fMkAaz2omBlYsUeFw9mKhHD3z+
 XirycUyosCmwKqi5dNZeiRq40b+fNVL5mrCUumW/aZ9EzBhDeR3G8Kej+rZTlGW9orq0
 6SAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF//fey68VK5uZBcj+PHHr+DhQJ8bbJRVPBsUQb0f1pYD19/9TewSCUYYcZtbQfCzI5FkdnXXIfP7VSrNgHHh/MxVZdaKRf31J4KgfG8s=
X-Gm-Message-State: AOJu0Yz3p2qe3enLKwPBT5zNNCduub9LUy6CotYuhFsM8yu5/LQK5ljI
 fiHcK4Y17E1vohEj7TVu67EtuEG50U0SbAoiLReKQrhGMgxCgqj8yqcXj6IPReg9Jun319CWX8O
 GLH1/acnvBNgOuMRfUh7OYBIay7DQ2okEi5lY4Li9oHXmaiAEfa0arBlcEFkAv5kI
X-Received: by 2002:a17:90a:fe93:b0:2cf:fe5d:ea12 with SMTP id
 98e67ed59e1d1-2d3dfc7b35bmr13719471a91.24.1724085761051; 
 Mon, 19 Aug 2024 09:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNdEpvtSkAl5rzLqXEcAkgXsVKtNu15fJmALgqr6qS5TBLy4yzi6qcqcR03rEDCVVXij1Uw==
X-Received: by 2002:a17:90a:fe93:b0:2cf:fe5d:ea12 with SMTP id
 98e67ed59e1d1-2d3dfc7b35bmr13719449a91.24.1724085760670; 
 Mon, 19 Aug 2024 09:42:40 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3d32853f9sm8430017a91.30.2024.08.19.09.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:42:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 59/86] drm/solomon: Run DRM default client setup
In-Reply-To: <20240816125408.310253-60-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-60-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:42:36 +0200
Message-ID: <87ikvwa2gz.fsf@minerva.mail-host-address-is-not-set>
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
> The solomon driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

