Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED7BCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 10:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A4EF10E342;
	Mon, 17 Nov 2025 10:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qv0xn7XT";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BB7510E33A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763374783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
 b=Qv0xn7XT351EP4000yIc+/f+dIjGouHejtUFBzsPi173Fdp2O5Fh4TjCZejbabcero3sYq
 JNBrMnog8mer21geky3YxCi8SWwGJVjpCnc08bOJ/iLehE27+cGW4KsvKfjtF+KBUvJn/T
 K1Xqr7QFyHCWITcABElN0fnvCdRwvzI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-_LFwkI0YN-KtdgZXPzL44Q-1; Mon, 17 Nov 2025 05:19:42 -0500
X-MC-Unique: _LFwkI0YN-KtdgZXPzL44Q-1
X-Mimecast-MFC-AGG-ID: _LFwkI0YN-KtdgZXPzL44Q_1763374781
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-429c76c8a1bso2451075f8f.0
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 02:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763374781; x=1763979581;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Sj1yzB+yodW9emJVWyrm3VZBnBWrcQvlOUnMxJLYhU=;
 b=RJeEbcKjFTuODgMY2mZb9euuUsV2mUu386RnVY1mK1Tsselg97Ci7mWncBUz0yoQG3
 auXPMou9wgbk7BkgNOV7BVt8c4CvCmrZdUYdN/LshLWkCkG8ik+XFfluJ5nWavZlAbQp
 Jox5JfrhuTbEDSPjbJayKKS77M2S3WJfCmTu5tuydfM9nXMRU8OJQ4LIEPe5vSbvHqFQ
 snY3JflUnQwkqtrtpWY3iW6i6HqklVE9bfGWJ6pOSuo8EX26zIEfKvVYCzwv6iotgCS1
 wivZBdiBTWBi+n/EqCgqPA9O0ppEHVNZSvEjrKSi7Kpi/msObC8Es7oBGwHuE+J/FbZ7
 Hx7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKamIVGSiSuBnUtGqKTaou34nL33B6/50eHJ2qQKCCR5DcRnyo2AWBbCjWm1Ge1Znz3AxEfm7dYA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLCvr1yOZVVytuNjvyJPbXXLonuQkogHtRtfziilkncTiu5IY6
 7H54HHMa+l3mmIe1SjymximxJKMUtUGphIbSOkSYJ0fuI2BsIQKhCs2NDHHfn+jdK/TEnrX+EAR
 QqUaL3nrE7YFpWJ5/7j2i6sYEmYH1r36OsSUHlA5rs2Q+WdwSMNQf7eQVj1d8kYFJN5Et
X-Gm-Gg: ASbGncsdD9+OLtIm6gUph9P5BtPZ8arvqnuSO+T3k6vCzirdp6k/na1/9zD0IJ8OwjZ
 Z1xLc2aqY3WIrH7WMEkltBY9auGnJj4/p7OYfZg5g0MTeBSlqfErt6V9r1K1evIFtHjt/fFtX8t
 hfdSZBK0kDNrHWoHvUoWBWjOVkqvE3BBXuGpjsZnCLFAVxQbmU1mjcbQqfBXQ9HGTO5XkW0MQRT
 j5VpGrXY01PPcJ2KyTPTOOkFNf5XI+wu1odwHTQ6PVS5G5imsvBtSqZz9Do24Cpj/pQYqqN3DBK
 J4q5AG3s5er+CDAY51ZGT3mCVL7dIHdP2P4wSNbUGvb/L934SFNlM67e0vvU0E1Ys7UXgBBmJo9
 PE0jjnz7vO8YrG6y9HcMh2mS7Z/j7dDnXnGgvWZIA
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id
 ffacd0b85a97d-42b593847f2mr10779166f8f.47.1763374780932; 
 Mon, 17 Nov 2025 02:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuLJzRkeZwRTSmYiDMNFB5b9Y04M5/X3K0AsCLwjmRlR2lS/HTXuIsn1n38y2t71o3SspdXw==
X-Received: by 2002:a5d:5f47:0:b0:427:9e6:3a64 with SMTP id
 ffacd0b85a97d-42b593847f2mr10779119f8f.47.1763374780429; 
 Mon, 17 Nov 2025 02:19:40 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b8d6sm26377484f8f.28.2025.11.17.02.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 02:19:39 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@gmail.com,
 simona@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org,
 tomi.valkeinen@ideasonboard.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in
 single place
In-Reply-To: <20251027081245.80262-1-tzimmermann@suse.de>
References: <20251027081245.80262-1-tzimmermann@suse.de>
Date: Mon, 17 Nov 2025 11:19:38 +0100
Message-ID: <87ikf9kll1.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xCfMHIwsFg5VQQHjpLHFUNiabzKTJgTcXZDeSRFcNEk_1763374781
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

> Move the calls to drm_fb_helper_alloc_info() from drivers into a
> single place in fbdev helpers. Allocates struct fb_info for a new
> framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> create an fbdev screen buffer. Also release the instance on errors
> by calling drm_fb_helper_release_info().
>
> Simplifies the code and fixes the error cleanup for some of the
> drivers.
>
> Regular release of the struct fb_info instance still happens in
> drm_fb_helper_fini() as before.
>
> v2:
> - remove error rollback in driver implementations (kernel test robot)
> - initialize info in TTM implementation (kernel test robot)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

It simplifies the drivers' code indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

