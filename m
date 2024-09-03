Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45196CD3420
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:27:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1620510E4BC;
	Tue,  3 Sep 2024 11:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Grw3lI6t";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7AE10E4BF
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YkFi1fyEEJj9fRFEj28CQ1Rb7oXd2qBLLQ3U3hDrnU=;
 b=Grw3lI6tItknWC0yN3PGLL+Od0Kk4NF8i8OkUmM5YgZImIuSmZ5IG/kf0WRKCi5rsx6E47
 j4bjS3ArXSqXMSqe4fTYDYdH1Xthk2gk1Unn4YyAJDQy4kHvTl3cb30EgjvYHgdhgPZpAI
 YmtGWEG9/aR9XdzwJoOYdHRPUyZq3Ho=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-zhRoPZ4OMr6GBBd-SMZXWA-1; Tue, 03 Sep 2024 07:27:19 -0400
X-MC-Unique: zhRoPZ4OMr6GBBd-SMZXWA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42bbadffbbdso41383175e9.0
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362838; x=1725967638;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YkFi1fyEEJj9fRFEj28CQ1Rb7oXd2qBLLQ3U3hDrnU=;
 b=d3MNI1rUbFYilybjNJ9v/9/b32l4NNXRMCnM3Y4fjb5wmWUhD/QOKRtD+9sTdAFq2F
 p90vvkrxjVcmXxTcXkRatdRq9LLuidO1m6DJ4YxtMMx5wZWuGCFxMoa55h0wpeDq1iay
 SZr4zyzg0fAyYyu2gv+m9ix+FbWYhoBjDzmCsnI8tPvymizL5j2+BKWSUZKpIT7csNDm
 cdzUHdiQpTLeT5BkXRrxzuCqSW3+0lXybzE4YhQUaNC1UL/qKwFLs+OOGqOATd6JMUcT
 G4XNE19Qihf2IU+Yu+RM8NPT80izBlIgBadLX7I6u47NXiDgATf8PS59V++f4RjZ1whf
 Ohfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVYRDIlb7/s+baKH3PQo3an+k+bnkKEQKHw2OQL6nZPggFKwQHtrxd8q/VRobtAsq20bWWnx2rgw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy19452HgyWhWVzyPiWOkFwFFWbKaiUbrhklwDS+uE6dr5Qdx29
 IOjl5rfkC3c9ir6QH8kCUgzQUMennIm/cK7TS5kuvHB3aPpJv/QR5mARvwpk52tabchkrJLXM5e
 wig89weUZfKfwKtym6joW7wo3Cr+GEUcS+O5Le68nKxD15FKFoBQM1R+3VMZhvGZ2
X-Received: by 2002:a05:600c:34d4:b0:426:6388:d59f with SMTP id
 5b1f17b1804b1-42c8de5f5acmr3366795e9.1.1725362837727; 
 Tue, 03 Sep 2024 04:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw8DiOnCu7RE+sIqOn4hIKBEfR8ZpeC8W2x9A+tmFPou1BHLNhfPrR0uHNJ780jkjZzKr9YQ==
X-Received: by 2002:a05:600c:34d4:b0:426:6388:d59f with SMTP id
 5b1f17b1804b1-42c8de5f5acmr3366515e9.1.1725362837007; 
 Tue, 03 Sep 2024 04:27:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb72fcca2sm94059455e9.1.2024.09.03.04.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:27:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 24/81] drm/logicvc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-25-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-25-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:27:15 +0200
Message-ID: <87frqhf04s.fsf@minerva.mail-host-address-is-not-set>
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
> The logicvc driver specifies a preferred color mode from the value
> in struct drm_mode_config.preferred_depth. The fbdev client also
> looks at this value for the default pixel format. Thus remove the
> format selection from logicvc.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/gpu/drm/logicvc/logicvc_drm.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

