Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80654CD342D
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 13:08:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4310E59C;
	Tue,  3 Sep 2024 13:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qjjjgddi";
	dkim-atps=neutral
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C8B10E59B
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 13:08:12 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-82a1dadc2d2so211532839f.1
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725368892; x=1725973692; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZeRs4z3I8mmDPvKoL9y7zecAhLAZtwSgnEUeAq3N0pw=;
 b=qjjjgddi0YrLsTBZeuzFhaf3NymDMyNbzbONVzU2mJ0vk1k4QVdLyznLHfD9KZODWQ
 xaV+FHRSRA6hbLFGKxR9IIL5CXVnWH5GRSiAtTIhm/JQZasHgjmSHRJ3YzyVs1e3x/tB
 7Sm/XROWIVTgLPWR+Gw3lx8K0BCCo2MQ44aHfmeYS8ACt8E9R/GUp/6hnwotR84V3sKn
 XC0cciSn+Zmkr7T17wjsHiB0ngbJHQc4azs7jIXazI3rxFZdTLRHvawz7wKgDVDq4Zux
 76z1VuCzWcwMQQSsdA6gVBSO3KhdyfGHlMViVdYNuEwDFMvW7QwWZhhKoKaBxPEDe7VS
 WNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725368892; x=1725973692;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZeRs4z3I8mmDPvKoL9y7zecAhLAZtwSgnEUeAq3N0pw=;
 b=RN+3PT1NQiSICTCBmGp7N7sBj/GpArtEIIsV5qX7v2aWmHdLVpwLe38XXedrZ3ARV4
 FJsbyodGkPB8i4qQyQiLzyp1XWzwYybl1vEp4L6l00pXU0vQOaF4TBcayv0VY3h1igRt
 pakNBRHAx8X1E4O04qYQJmRnFCuFAJY96VkHmnHtC+/ZYcHj6pM/EYQdagokx1gYuGbg
 7p1UwGaASAGfw3R58Q+0l8NojbYKr4cEMYo8GdkuW+9i/mXD0dMyGy/O7cwbzTJDQpKE
 mPeg9CzsX0+FderBklArd3Cb7PRMt8U7pL41+x/in1Lgmt076QxUqc4bTF26u+Cqz/Ec
 hSBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXyrKcAXLDpeYASNjHgqowmGWrbKC799BxnWTd+RRvP1f5cvDGRXne+1d4UM/0XHNLwBK0qoQUkA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyq/vjAlL9YvH8ROWX0D7dkdVrvK6B5jUSO8ZrIAfAeCYroNkhc
 qds/dBivm6CppBOP2YIAS6ofZBQJodaNsJKeJUBEzBd0paNgftKiU6SCrxq91Wbl6NQ0+UTOLZO
 WJoF1xTdfXUgQzyGUek2ooltcabh1lHim/5sWnQ==
X-Google-Smtp-Source: AGHT+IGHAgnSMNvuVful4dbf9WKc4xkX76uqFfFYB8rGHdSebPTzop/+5Lxf4E1tJz0Qa5koqY5wyz6U/9g7ZRt6e8w=
X-Received: by 2002:a05:6e02:12cf:b0:39b:32f6:5e90 with SMTP id
 e9e14a558f8ab-39f4e0d41e1mr118881735ab.15.1725368891480; Tue, 03 Sep 2024
 06:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-78-tzimmermann@suse.de>
In-Reply-To: <20240830084456.77630-78-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 16:08:00 +0300
Message-ID: <CAA8EJpoX3X6+u7Nst4qj5J0hcUCeYQvULW1wMSjwnVyLQeszjA@mail.gmail.com>
Subject: Re: [PATCH v3 77/81] drm/msm: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 30 Aug 2024 at 11:45, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The msm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c   |   4 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  13 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c | 144 ++++++--------------------------
>  3 files changed, 38 insertions(+), 123 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
