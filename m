Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C6DCD342D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EC010E501;
	Tue,  3 Sep 2024 12:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DxP0n6L4";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3B010E50A
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HnbFxSgYkBRN5Q+wqX95+Hyx0YeccZ2urpdeGG0ywWk=;
 b=DxP0n6L4G0ADhggofM8dAiGXpsuhWSl3rfVcDj7ZaplzlARyIWN3DkyxvdW1Bnl6ZryLqS
 K8HQ6P41QY7sqP5snFnNSSjiAfTqO7ebJ3mh2iY4aBNAZr9vEwTSkETL/liu8dM0OmYEkB
 FJu2yqAW9lPzIZyFkrAvkOn+Lo1n72w=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-fhFMtTNDMlmn77YDYltx3g-1; Tue, 03 Sep 2024 08:01:43 -0400
X-MC-Unique: fhFMtTNDMlmn77YDYltx3g-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5343a54e108so5526409e87.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364902; x=1725969702;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnbFxSgYkBRN5Q+wqX95+Hyx0YeccZ2urpdeGG0ywWk=;
 b=Lw1gOZ9CnNNOQcpC4aBY4LkWCEEqMF881wBDIiqh8bGHu7syY6VZnL4vUk0f1Z/L/f
 RwXp0RsWEF83C2CDJdYDwT85yiGgo1g6UJCX0o86xMcBIorCG0YgZNC9Ffr37ywfRkHo
 b/i0vi+MFC5t3A425hWvE9IIz2OY4YYPqrp4uJHTRyKbAUOueugt03lnI0A2IoiJjlIc
 QOZ4DHPBBMcH7QKJPi84RdG4Nqpz1AInIFSD0r0fWplkJqS0bsiUFCuaToX/hG+tuphQ
 XZZGh8yGOtEXMalQpexjH886ILsRxoWE6crqC0RUcHNM65yZUuwdi/vD+AiO/lgBN+7i
 mkog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNMsvpSpqhQ5kp78235qG1DbL3UBho1Xq6/qZ+dmHoUOZBxT00uKVXA7zY5Rojr9G7VZKdV8O2Jg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwPytneiNMsGRJ5nIHEO6mWbcHR/wVjphCcmVy4WekznBMp07nR
 hp+rFdQdzHgYAiaR+SiUu4Wsn+xhIlcXaJN9VupKbKdTWOY7w4Ga7uA+cAG0cSSrgPGcpbNKUZA
 6+mkR7ayfDYe69i24he1giEbGEaW1Or/3TWgzVfJ24p0yhT+gGIvbNSYWejxnP5r6
X-Received: by 2002:a05:6512:280c:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-53546b92af7mr10669820e87.44.1725364901771; 
 Tue, 03 Sep 2024 05:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDjxWGjvuovR8Aopi451WacRBX2Wf/wOeUhWBSbhzIhjLIYAAi1Vp+ANICqYmaRYGmnJV2vg==
X-Received: by 2002:a05:6512:280c:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-53546b92af7mr10669769e87.44.1725364901129; 
 Tue, 03 Sep 2024 05:01:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb2dcsm169907915e9.1.2024.09.03.05.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:01:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3 60/81] drm/udl: Run DRM default client setup
In-Reply-To: <20240830084456.77630-61-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-61-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:01:40 +0200
Message-ID: <87cylldjyz.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

