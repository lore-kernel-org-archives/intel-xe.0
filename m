Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844E7CA5FDD
	for <intel-xe@archiver.kernel.org>; Sat,  3 Oct 2026 10:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087DD10FB14;
	Sat,  3 Oct 2026 10:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f4wk1eEo";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119A010FB12
 for <intel-xe@lists.freedesktop.org>; Sat,  3 Oct 2026 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1791023994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yEazttUDpzXlqXpxwJlMZPomrWiWdlvAhL9J6+CU2p8=;
 b=f4wk1eEo9CdHqGaXqMDH9jtMslhTckkoTa4SmXzHlKiJey5wUWIth/AW9/JkuZnjSPJ8xF
 QrfKHQfjm29QywYBf622wzsSU6KDFT0wGi5oymqMeOKFsnPD0mBR3iebzPDPjs9lIm3iYN
 YRFjGjFSjvnQdY8fombqnJuG65U613A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-xdSRW333NZisyg1azXGm_A-1; Sat, 03 Oct 2026 06:39:51 -0400
X-MC-Unique: xdSRW333NZisyg1azXGm_A-1
X-Mimecast-MFC-AGG-ID: xdSRW333NZisyg1azXGm_A_1791023990
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a027f2e364so3897465e9.3
 for <intel-xe@lists.freedesktop.org>; Sat, 03 Oct 2026 03:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791023990; x=1791628790;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=yEazttUDpzXlqXpxwJlMZPomrWiWdlvAhL9J6+CU2p8=;
 b=fAwmw2fLeegquZRfoJ+lbjEuY7r3+H1dev7VNwY4uDHtqIdEUgMikFm0vZhglb6t4V
 lYdjc0czcIGch6DeGGdMEt546xcHYTIfG4nC1F0VVC05H6+GLp+0sD3HrIP7RaDXXJSj
 Hv1VYxvM8kWwOyGdACqpXiH2wiSSSpopPH1PNic0kjDBf2338LqgveqjBbDQY+aTDnKV
 mwrqHF5XuNH0U+/lc0aYoVjNGt4CDCXQcQFuMFr1sqhHSW/9qeSHGs7gyyvnrfp1A263
 dlpF7CwEafRnqyH6kt13K7pw6YsQ67SONsNXLatvwljf/AnTES9PREjGkXY9MjNDmhXc
 lGHA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnhZ4B0UtcDY01e4s1KPYikw8OZKYnCA+RADe6pquxsjRz2HEiw/OdsKbd+dwwic+Sz7WGysR6gg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kt9z3gkUkduG6c9v4ZsO2vv8N7ZG9Z9/2J3m76XIZZ9MVtmHmE
 kwdioWtbx8ZxHLEtBpjneTAPr87ZYlLtMx7bSYAosP0ME/ip/NE8Kq/ld1WQ9pXsCpLVw4zBeC1
 kwHJ8ErcTk/GWm/uSaVslQtPyv6DAWv7U9151CY+fPaYlx8zvNNSY3H5AKxC448+1tzRQ
X-Gm-Gg: AYBFou0iecmjqwmtUzhAG0NACk7XXpe8+Ofzj1xi44J27TQJr6QZKjjlcEzjyx5GnMc
 BoUKNCNgaFLSzh8s2CW50b09J+d3RC1PJYXzStFIcsL83Bs9AHzPup+mud3M3gRCoxNHURwx4f7
 j8chfq+ZkCYnstSTNbVHPG9RnBWfq61QdL720+Bmr0UVylmI46uzxmI+bcmSCIBkhDJfKWKJh6r
 kq51gQK+HSlEdIjFUAHckvjTvGH+6eR1TWGHT/VfNSVKCbu0EtN8/ZDmbcV+bIJbBjTu/aSKptY
 cjMr/74CIYvB4efNYBIr4rASKQPjFkln0s3VUVRDjxzUnKJxW91s2lKw4PtCwQN/mApTD8Dr76c
 zyO+UJKZsg9NLmm4Ovge8OyF0HYBd6cIAMt7Bfh3vJCs7F1NTBLcApttuHl2iMF3rXA==
X-Received: by 2002:a05:600c:5392:b0:4a1:6991:36d7 with SMTP id
 5b1f17b1804b1-4a1699137bfmr23376305e9.10.1791023989748; 
 Sat, 03 Oct 2026 03:39:49 -0700 (PDT)
X-Received: by 2002:a05:600c:5392:b0:4a1:6991:36d7 with SMTP id
 5b1f17b1804b1-4a1699137bfmr23376055e9.10.1791023989341; 
 Sat, 03 Oct 2026 03:39:49 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a02770fe4csm168249935e9.7.2026.10.03.03.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 03:39:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, Simona Vetter
 <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: Re: [PATCH v9 21/21] drm/solomon: add SSD130x connector luminance
 support
In-Reply-To: <20261002190030.211356-22-mario.limonciello@amd.com>
References: <20261002190030.211356-1-mario.limonciello@amd.com>
 <20261002190030.211356-22-mario.limonciello@amd.com>
Date: Sat, 03 Oct 2026 12:39:47 +0200
Message-ID: <xlv1wlrz5aq4.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -ZviSpDu6oSbT7_6bKmLuB0QbEoP8kxPhZx2KDSlA9A_1791023990
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

Mario Limonciello <mario.limonciello@amd.com> writes:

> Expose SSD130x contrast through the connector LUMINANCE property when
> DRM_LUMINANCE is enabled. Program contrast directly and retain the
> backlight class interface otherwise.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---

Actually, one more comment:

>  
> -static const struct backlight_ops ssd130xfb_bl_ops[] = {
> +static const struct backlight_ops ssd130xfb_bl_ops[] __maybe_unused = {
>  	[SSD130X_FAMILY] = {
>  		.update_status	= ssd130x_update_bl,
>  	},

I think that instead of __maybe_unused, this definition could also
be guarded by IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

