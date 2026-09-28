Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958FCCA5FA1
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 18:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF7010EB62;
	Mon, 28 Sep 2026 18:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hANFZopc";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A8210EB5F
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 18:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790619032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
 b=hANFZopcyLedUQhKEQkdBlYiherp/C3nUQ747CxrT374lOZGGIv2QoZiZHPUNYOm+PIToz
 7dnnCCpihtUy32qnGza1WpDmtSh+RO8rPj1CFTfdg80p4y/4/N5n2pTYm2LF4gxQr0eT/D
 mPT76c9OZAGILFsF8fORK692OatNQRw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-592-S9ctHRPUOAq39XLPnBOzEQ-1; Mon, 28 Sep 2026 14:10:31 -0400
X-MC-Unique: S9ctHRPUOAq39XLPnBOzEQ-1
X-Mimecast-MFC-AGG-ID: S9ctHRPUOAq39XLPnBOzEQ_1790619030
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-49ffe48d1dfso23756345e9.3
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 11:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790619030; x=1791223830;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=OFTht72VGYwnHy4rRuIiS5N5orHNND6LgvZVdS8G2Q0=;
 b=Ir4+epzhNdwNMPRjsP5bIS/AKdwpYXkmn/ldlI3TX9Zz5GI9QrReX3XREqlqHM0y2G
 kf8zxuICvB23CXiH9vw1sABrVPyNry6hqEzRRoyO6xlR12XBb9SQgRKKHlHhSBO/znBH
 /heUyPnelddUJlchnfdutSeLTr6upWlZ7hPrAaF8Vv5GTa6Nf63tcY4tTvxLWlbXm0xY
 UYsO9BvCnfOZAvUfluT37xNRmQlK35HreW82YpCLl1kAv8sNTDjuyqHVt8Ypl5l1u/k/
 ChJtxQV/QXHJDHJTYNqSUB4X/MIoDloIoq+KREKrf1jJrE1hRiGSV1F7r2+XziHUTsml
 VSXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwOOCvkX6EUa01AN/NC5du5jDInlJSTk8UEXWzrXK6heXIcLhMBIbGzMDRbKTdeM/+UVr4+qK9fzA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nHJJSodHhH0cHq10fa7mMkEYOfzsI1ys/UoijNpKcNqQhYZdYm
 3iAetGEJqhLnrVy8CbZFUQBqeUOEW5Z+oQ0gDd5S9KbE3xbc1yuQBBJONfQ0ryDBz8MlL1E0n0I
 3uU/o2d2d6JCWA35hRoUk5T++GSM8DnoNkzSKWE5AfCOj+DX0eQbXmlRZ5dKi7o1b7UHj
X-Gm-Gg: AYBFou39xitn7KB6zD1kTSHrsCs5me/Z8yrv5SHsu8FLvm3jBELfgiufTGvRrMLlAzK
 dYmVz5dSlr5lJ4+5ENvLcRMaV0L+yUX1Xo+HRIPAbeJhqUOHk801euqnwO1DRm3EkbZvAjuh//L
 hE7zfHF3VS6l8eef8WO1QfGd5+5/gzdl/+P3Im9nB326fXFhYhVbeKXKNOExNYXSde7n/9UmqqX
 6WX6nh28IaEvEB5OZo5xC7V9L+QykaISnqQiKPEBsuWNU+p91K+SMK45INAahoFM0LeslNeey+h
 uKRQGOwPMLU0d7RdFdT3uMeCUubIxt4+REWn9YkXtdh1xkZUE0h3R6Fowd9gogpBayHTN397VcJ
 P5CC01bcjWja2VWYPIzhhibJb9WTg/ygx+m8kmaTCRoArl65CFbwIunU3ra9qdyRU+A==
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a0023f8d93mr91712595e9.2.1790619030048; 
 Mon, 28 Sep 2026 11:10:30 -0700 (PDT)
X-Received: by 2002:a05:600c:4f44:b0:4a0:23f:8b0d with SMTP id
 5b1f17b1804b1-4a0023f8d93mr91712165e9.2.1790619029624; 
 Mon, 28 Sep 2026 11:10:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00cfe16a2sm9652415e9.4.2026.09.28.11.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 11:10:28 -0700 (PDT)
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
 Zimmermann <tzimmermann@suse.de>, Alex Deucher
 <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 2/2] drm/fbdev: Move fbdev helpers into client library
In-Reply-To: <20260928080323.23909-3-tzimmermann@suse.de>
References: <20260928080323.23909-1-tzimmermann@suse.de>
 <20260928080323.23909-3-tzimmermann@suse.de>
Date: Mon, 28 Sep 2026 20:10:27 +0200
Message-ID: <xlv1zex1dz70.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4iyxm-aVTMu_V-8jaLicqHr5z79D1jLNFGCvsuxeaUE_1790619030
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

> DRM's fbdev helpers are for the fbdev-emulation clients. Move them
> into the client-library module. Fix include statements throughout
> DRM drivers.
>
> While at it, rename the files from drm_fb_helper to drm_fbdev_helper.
> The old name was too reminiscent of DRM's framebuffer code.
>
> The GEM support code for fbdev remains part of DRM's memory managers.
>
> v4:
> - fix the depedendencies from v3
> v3:
> - remove obsolete dependencies from Kconfig
> v2:
> - update armada und docs
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

