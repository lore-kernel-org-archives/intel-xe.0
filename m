Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B88CCD3429
	for <intel-xe@archiver.kernel.org>; Tue,  3 Sep 2024 11:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8EA10E4AA;
	Tue,  3 Sep 2024 11:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZujRTfTJ";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1063510E4AA
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Sep 2024 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zFn6JoF0nYLgSLX6ae98mppLG4Otb/JZ15e4mfDfaw0=;
 b=ZujRTfTJHrONbOoXv5MohoK/L/kHZL9YE1u/haGAncepJfaDZ9COjHI9WMfZUb/0vcTTQs
 9PaQ1uOUdPgY/OoITigOeno+CfH1btQXLtoO4+ctQIvtiJsLY+hts/KH7dhiCm8Od3wZIX
 PzYipL+NOcU8HkVsXYBmshdQftpHVC8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-_tjZNvAqOdGweyxXGEDMRA-1; Tue, 03 Sep 2024 07:25:09 -0400
X-MC-Unique: _tjZNvAqOdGweyxXGEDMRA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42bb68e1706so48036615e9.3
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Sep 2024 04:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362708; x=1725967508;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zFn6JoF0nYLgSLX6ae98mppLG4Otb/JZ15e4mfDfaw0=;
 b=IZkO2Z7mFyYSpLx2ulnvUqNMzJvT1Bx7y/DBbtpP9hFfCb8arzgzPwK/4sXpIuiK3B
 5mb72gG14f2yMkmfvOoBi6cKUuN1h7pkbA6vXlZXf+29GU3YthdPn5I5rTcxbofDxaxH
 H9BDBbgd3K2Eq7347EzEBI044hOkDReOUTYSUfmBkEDghKnA9cEdlHeONJTWeQ+AXUHH
 XKFM6BflCZdA4W390jHmE4Q3ReqAM1zdFqOt8yM5Ylb5Ij7XgbxMa82yh/lbCuslNaVW
 RQddVYbdzbnn+dqENRrovBQpZurr+8leyWUrVgwy0tFYpK89jMmMIAyxHJfgJALhJXsq
 oKBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOsvMzbIMkWyl7FAEMqA/aM/62FMuPfcLvduCKxpoSjTbF96DrS4VLdG0wy1EASwwRZ2yfFpLq4w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXrPSx2Qk+3S3OHiCB2q5emDrcdAGY3PRwXgOa+tLtTTg1qKMH
 hKWqS44VNVSC7cZieKNQo+bX6TMMUC9kJkfenezu9855qB5fgCCxak+TauQ3Wr5cQPYKWyn0n0B
 PBY8Q3UXsHxYmucoAScNuLToqjIlWMAUpt7XMWIi2oFthRWZctWibVdrUpYr0N2uo
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-42c880ef921mr26586245e9.9.1725362708103; 
 Tue, 03 Sep 2024 04:25:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3cH0MWc81rircp2ansVoCb3NK3NEk+umLvTdA45IVUNkVz9xLI+VziTu6VQR/1xOKKJstjw==
X-Received: by 2002:a05:600c:5110:b0:426:6710:223c with SMTP id
 5b1f17b1804b1-42c880ef921mr26586015e9.9.1725362707597; 
 Tue, 03 Sep 2024 04:25:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bc00877c4sm121472685e9.6.2024.09.03.04.25.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:25:07 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 20/81] drm/imx/ipuv3: Run DRM default client setup
In-Reply-To: <20240830084456.77630-21-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-21-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:25:06 +0200
Message-ID: <87o755f08d.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

