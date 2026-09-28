Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19C1CA5FA2
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 18:09:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1BD910EB48;
	Mon, 28 Sep 2026 18:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="PJhbHkIR";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB17A10EB52
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 18:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790618969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
 b=PJhbHkIRBFID5cswJ92776vll2KD9fgt0nDXJiPT4OZ0f/SvgmDkX8UF87Anx6/UkrWjPP
 5fzw94ZOd6SAHBX8zdIdHM+amGsRhWyLrT6KKRv9c8ZVZev/4ilzX8ghONdSJyg4rG8uGk
 ohi3QePa1nJcfZw2sf5/pvMfBxfM0ZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-ftLh8ANmPzqFlY56VxYTrw-1; Mon, 28 Sep 2026 14:09:28 -0400
X-MC-Unique: ftLh8ANmPzqFlY56VxYTrw-1
X-Mimecast-MFC-AGG-ID: ftLh8ANmPzqFlY56VxYTrw_1790618967
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49ffbad2c55so13242375e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 11:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790618967; x=1791223767;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=WblzAY3JRV9CtwzNMKeAP2oGeUzXJbmdjxKWRmzPjT0=;
 b=lg4UD+dMrTXjVDhcp79ItKfJ65m49xU6XbZGQWcE6yTZGgbnRfIoGiKQQbZM17o6jn
 eocCz7VNYH5pDJoXNgNlFjC+SWYWI7YlTRFlATPvzu4LPvsuMjkaCi0WcMrOxEu/h5yQ
 9XjL+Y7oJI96N2lQDCIh0qIOBT83/KIcisNw287l/YDMkupcTGAIG8BNbHNT6LNl4ex3
 6+KUgPconL8pw/trxgd8JP7Evi0CUw0BGP3XjZ38I/0JwRDxolZJaF1hA5HS9JcYWJPj
 tm8K4ntUSTWaEqMc/jM3wiCqyHFmspqL1ASTICtOsPBXHyDNYaj35CjUwcIiL9KFcUmk
 PK3g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwpLLClqjIuLFX/tLMiwiGLmHebE761mlHf3h2Obd0vxyTcsX75b2FZFpwnv4eFh5WUfI5Gk0/Jbg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mAHVFPdw0eqNU3Gw0a9kh02ih2ujoVBzN1RWpUZo7DgbK4KtM0
 iHZqMjt5bg/Q0j7xkFArAn4g3GM0TGmAX8Wp4GWQy3AApXXvPf5sXRWp/0sqe7E+BHsRP4hAZ/j
 ZDQhYef0xq+ZeIHMTJXfWZ96LRsQn1xlxOpKJH/FZZmkABdxid0AIe9Z1Rm914WR16uaI
X-Gm-Gg: AYBFou2uqtN5Afedg+HeLH5xZy3xQy2v3jD79tbFp6MfZMXexjnl0ICv7/qmKh1EV4+
 FiGVWXvXdqqR35ruuH8JRZequxQhr7Do08xzMRlZXYYekVVAC1xH9RaPC1oB7Ds+td76WJ9JqDg
 +vlUNFYDi2o5eNNt+/wRexEY1Y3F4s1T6LFd54ZVxWqldlx+tF99uuGz5mOvse7BLrO9dJ6zkFE
 zC7Vd/54rDfJgGs4kpWz2r5j3KQ4WKjPcvJf8uSMI2prDR9k8IDwJjvYVLQ2O1snXlpPrkG8mHm
 dJWnXMvbQ3QaYsiMsB1vHSDZEv9/DgS4EHL9fhE3SNKbtdZo9bDFWsUNx12fa7B30qUjPd9swZs
 BPOG7LsZiiAiXUJXyuR4j96FRE3iNc5UmbUtPQr9hPgI/uzt9nev/2xioQMIocU9ZdQ==
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id
 5b1f17b1804b1-49fe66f4c7dmr231739805e9.18.1790618966868; 
 Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
X-Received: by 2002:a05:600c:1389:b0:49f:dcc8:c735 with SMTP id
 5b1f17b1804b1-49fe66f4c7dmr231739375e9.18.1790618966445; 
 Mon, 28 Sep 2026 11:09:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d10cb7dsm3533065e9.0.2026.09.28.11.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 11:09:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, jani.nikula@linux.intel.com, Alexander.Deucher@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, sashiko-reviews@lists.linux.dev, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH v4 1/2] drm/fbdev: Move fbdev module parameters next to
 module init
In-Reply-To: <20260928080323.23909-2-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-2-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:09:23 +0200
Message-ID: <xlv133utfdt8.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z8J8tAJsaSX-uzvmJCS-_1qRoZVMrhRVnnptic5wD38_1790618967
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

Hello Thomas,

> Define the parameters for fbdev emulation in the source file with the
> module-initialization and exit code of drm_kms_helper.ko. The parameters
> control some aspects of DRM's fbdev emulation. Common usage looks like
>
>   drm_kms_helper.drm_fbdev_overalloc=200
>
> on the kernel's command line. This has been possible for many years
> and changing it would likely upset users.
>
> The emulation code is supposed to be moved into the module for DRM
> clients. Keeping the parameters in drm_kms_helper.ko avoids breaking
> systems the use them in the way described above.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

