Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B30CD342C
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 12:08:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A685B10E547;
	Tue,  3 Sep 2024 12:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eqktn143";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B861110E539
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+2kjQIs9q8n/JYo2kgRLarbQBGYwxsIauUZqYrHGHRk=;
 b=eqktn1432kAlQmyCr6GPDx31nlUZChePT1BjltR/v6SKjgLc9p5KKYnSCztR5AWUI4TLCP
 35sRvnTpCyBuo65I/wsbu91MK0jqLRBn20tpJwvU+Fr0AQIFl9bMcMd2c8VWW1xlLvypQh
 YzsgSsiw/5hUXU+XID35zo84sA71Qmc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-Ai4JSzXpMZCkpXO_D_DUYw-1; Tue, 03 Sep 2024 08:08:31 -0400
X-MC-Unique: Ai4JSzXpMZCkpXO_D_DUYw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42c82d3c7e5so20019495e9.2
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 05:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365310; x=1725970110;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2kjQIs9q8n/JYo2kgRLarbQBGYwxsIauUZqYrHGHRk=;
 b=t9J730LkT68Y9mTzjr5efaGZncUeJ9pYcrMIM43eNRs/XSTiSTDsaQKoqnlKMZaOFS
 xxIpU6+jvuuRBathqacx+YFl0zDpxPGnVH3nrk5qy8jBALWc8FKHY89s661QwMIpN2CH
 DQodqkJDFTCj1Wr+MGDz2ddIBOFiBYAYWzfXT3HYoYJHkd0V8nNKOXp6Y88OR29Lk3SU
 SXNkxA4jjuKPvvAGhRRTsQghgSkaJP0R+Vtm7Y1f+hfyK0NxOy0Wxg7mlJzeaMuJk3d7
 gRtzvjKDhCidAgg1whfQkyMTzYJ1uV0WM+7XXrYbzL9uWni5ultJgzNCyKe9uEshrQ0B
 +B+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW75TYWNMCoHRGtzoHy/OuR7c7vUma/Iyg0DSda/JOpyTItm/1KH9OJf9RhsJn910gemoT1pFMBfQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwT0wRTn6Hmnoo8YFjMZ5DJEBTqoy8ESMxX4KhAm72J165C3Xps
 QVmcwklsNbyP4J4N51p+3oKoYuhqCEQizp+gYzyuq0WUey0nAiYc8I61LA0rA/EwLTbd5rZtliY
 OhyBshlywAHvum5aXDmNBotpNp4cIXoxX+hLROENi/VTTWpEaHp56UQksHp7mItiH
X-Received: by 2002:a05:6000:1201:b0:374:b399:ad6e with SMTP id
 ffacd0b85a97d-374bf17d7eemr6675596f8f.35.1725365310215; 
 Tue, 03 Sep 2024 05:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHACC0i5llQBZQ7GHMHlMA55f2d++yOjIWrXMsMueQKdfzTBOjaiAt72tflYDm2X5ITcqKKvw==
X-Received: by 2002:a05:6000:1201:b0:374:b399:ad6e with SMTP id
 ffacd0b85a97d-374bf17d7eemr6675573f8f.35.1725365309653; 
 Tue, 03 Sep 2024 05:08:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b9859486sm10862586f8f.111.2024.09.03.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:08:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 73/81] drm/fbdev-ttm: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-74-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-74-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:08:28 +0200
Message-ID: <87jzftc537.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_ttm_setup() is unused. Remove it and
> its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_ttm.c | 119 --------------------------------
>  include/drm/drm_fbdev_ttm.h     |   6 --
>  2 files changed, 125 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

