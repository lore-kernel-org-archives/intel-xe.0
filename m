Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CC3C54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 14:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9320810EC20;
	Fri, 23 Feb 2024 14:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E8RlOOzj";
	dkim-atps=neutral
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C5510E972
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 15:11:26 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2d204e102a9so101390761fa.0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 07:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708614684; x=1709219484;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
 b=E8RlOOzj+fvUj6RTK9I62HdmZUzcEaos4LoKkR1vVmcLQRmnRcHD4lHyTi2vSBW65V
 XjrmxB9U3l7Z9Kd66FfL0/fh7nUZmlnrD9UqikDPmqmJz0XZazLDqV8gXBlV+fWRwe6t
 ja+rkGGR9bP/rrid3Pmm85+KGq62zvsxjjXZtQCXJIS7fcXP14VS2qakSyYvVHyBJJ/R
 O60ERtOIlxte7f1WpGIDCADYYcWgyFLSy12Lt2Noa2Nq8jrZFJ4JDD5lr7vu36BkmlNl
 nWMMND4Iklys4gm0ALYr+CmMjbzRbH8q65J6UfJLBuA8twtKVXsQH5czPMVIODxF+qvZ
 ua3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708614684; x=1709219484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+1MyTAa9W6rwmrz4X17WTkjYYC8wuvxkD+qfkCmD8gA=;
 b=OS8OCfq2TwOm+wxXRmU7lU034gNYufWU/9fZRpCvrLSPMpzTHdRiWVRV0sMLR178FW
 AHkpHoQ7OtDFPjTQYiJIQcRqGVHZZxqasVgwqijNAT4rL9IZ7T8JoqaUbOEmPwnAwv/Q
 e/qwM7Ztr3SggwJBDD7Pc9psCCRP7JkvJVw3KG50J3XofSXPMUCVXxslTwYDj7inZTvz
 gM4t/U4XVVtPVXdepU9Xbm+dTGQar5/+wrPcv47FFvlsHiReyVeFhF4IMYvu97fLzY+2
 xiq930cxO3Lm9YniOVovT3f1hhIpbzmSvhyzFfh+Dn3ZjXSD8lAQ2a8FpNj61iBQdaq8
 vEjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3+9k4PCAXpQRjIXeUsj8nct6CiZua40ziWADMWOjObIEXDW0hwaleNz08sl2hUJL4FnzqrDg7fsw4a2uJzqH0RdKYJS3u0tNkY6VFWVk=
X-Gm-Message-State: AOJu0YzsXM9YtVi7lL8kRRmxloAB/770lAe5TE2UrpFOMwV+kc/QWRM7
 2OzRY+e5PbHlLMkiOt0p+JmW2T7O9B17SWZFmCfrLPrPYFthlgSz1gdsBLOjDN6B1BCTk/NZVbk
 adUXM+/w2+YS6PvXLdQn56lsSDIP0xxbkzYWpGA==
X-Google-Smtp-Source: AGHT+IGw3hbqPWYN/3vfhhQBFzrTvi1PbeoR9WvH0886TzS1KyGrr602I8E8lLCB6pIuc8bHxZF8tDM1xPYr0gG8zd8=
X-Received: by 2002:a2e:b166:0:b0:2d2:6002:c239 with SMTP id
 a6-20020a2eb166000000b002d26002c239mr1510902ljm.3.1708614684451; Thu, 22 Feb
 2024 07:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20240222145838.12916-1-kabel@kernel.org>
In-Reply-To: <20240222145838.12916-1-kabel@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Feb 2024 16:11:11 +0100
Message-ID: <CAMRc=McWhC0ZdR55TMkkdVov=dwT0=H-4_c4J-bq0quRpvyoBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] devm-helpers: Add resource managed version of mutex
 init
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Aleksandr Mezin <mezin.alexander@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-gpio@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-hwmon@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 23 Feb 2024 14:28:01 +0000
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

On Thu, Feb 22, 2024 at 3:58=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> A few drivers are doing resource-managed mutex initialization by
> implementing ad-hoc one-liner mutex dropping functions and using them
> with devm_add_action_or_reset(). Help drivers avoid these repeated
> one-liners by adding managed version of mutex initialization.
>
> Use the new function devm_mutex_init() in the following drivers:
>   drivers/gpio/gpio-pisosr.c
>   drivers/gpio/gpio-sim.c

Yes, please!

For GPIO part:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
