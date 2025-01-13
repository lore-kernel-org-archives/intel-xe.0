Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86CDC02181
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 08:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA6510E4D6;
	Mon, 13 Jan 2025 08:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hiVqacxi";
	dkim-atps=neutral
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0A10E4C8
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 08:26:14 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso4126233e87.0
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 00:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736756713; x=1737361513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
 b=hiVqacxis646nluQSlcULkOd6N3WEai1ty5erEMJToixb8wsJ7WAfHeN6hYV7JxD5X
 5GLuhFwJAOfY5r4XQHDJh7nvzf1EXmzTJm4SzNxIkU19BtBdoLApxM+wB7w8NvIeJ5pH
 JT5QxgwX/FKDmuGA6F1d5ZOmpdbyy67hS/E0YCoNg2FwHRi6Rg9gDKRBsEWUJyHkMf4A
 Ch33Ea6ll7StVHNfhY4q1keqv+fwjC04vgmTCLwcmyX2B2Tfa1KQimwDnDExdGP5yV6Z
 +Y+r3jfYr5lwBPuWzYkK8PL7qWA/XSlNkaDjV2hsoMpBRbN86SrmbZJt+yZhrZuiK0E/
 zS/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736756713; x=1737361513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsOOejTFjVwFwvDCfWyTG69OVT7YoO10LJVJy5N++GA=;
 b=jtfavGCU291jvPMPrKYgDdHWpMVr7Kric2rNrOueR7D1Vn62MdD/fyfytfazjuco5q
 B/plWf7rOPGyNJcEV5B65iqXtMtcMyFmHBQ5JfHRiuM3V9IpGOJyfwXWXh3MMUKZkXf6
 vGtXjcotFl0lA9JltDoF7w5OLamVgdrM6GQYio55Ba3L/nAIrqAbdLLQdEdL5TMuIp/1
 rn8MNIahzHTZUh0mBBp5XDH8ES/G4jmH9HAMFo0ZYZoHg6svUbjLKYvhYZ8HfuKvYDCT
 UikUfzzDMkOzGAsCPXNAmpzBFrHt17Ufu3Rp6getswhGnalMTQDe+FQQu2llBhDbB510
 1E6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1+58A356NbM2m+ZAXMeyQK2oa77/q0MyC/a7kuQLpn+GGnL6j760OqqlGsy+rranoU1CKlg//Ig==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4gms23hOZn1COFwQhkQE1Gp3t33brig1qd9PU7yPrNqLCrKC4
 49ZL9haR5ngpLnfGVmAmxqVyTqp5u0PxCHQhikBYjA97vbAp/JtiMIgdzTin2ZQ=
X-Gm-Gg: ASbGncvQvznxCJUtlTvCddmZIT70b06n7IgOXoaeJa9oeJNs99Ij7yPPId0xAZyej47
 AkXGxHXxgDF/B37X3Q1jfiKsva7ZjPPENVsDjcvAAkBif7inHCuOa7xwsIvIjwMvMeCTcoW8Yoy
 t4bzaC8GAl53+ceimRbFH5KhxQ5kU2smTm1iYpdmWogWczrnrE5skknzynHn8NqeVq2Us8NjFlS
 yNdSUP4Ul7j0bJdJZGdZnJaegh6+mZjk3hYTTXrqcVyUjK80vEDm/TPoKf3e17sTQ3yOhY95EIb
 s5rntQ7Xx4ZkbtlU+yTlsdSyqywC2oXu8lSq
X-Google-Smtp-Source: AGHT+IERZWZtkZrsbkHThnFiBHKfz//tsYW/urMLTgJODZNi9Tp473Grr1NqQ4M0NySCRCOoV5n3Rw==
X-Received: by 2002:a05:6512:138c:b0:540:2188:763c with SMTP id
 2adb3069b0e04-542845b0b55mr6338144e87.37.1736756712614; 
 Mon, 13 Jan 2025 00:25:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec0659sm1286326e87.185.2025.01.13.00.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 00:25:11 -0800 (PST)
Date: Mon, 13 Jan 2025 10:25:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, 
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <bbw2n4ccn5jlq7q7lsw3xdnbieazgexkwkycrqvk5aoiq5q3wx@nz6gd3unwkg4>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109150310.219442-14-tzimmermann@suse.de>
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

On Thu, Jan 09, 2025 at 03:57:07PM +0100, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. The hardware requires the scnaline pitch to be a multiple
> of 32 pixels. Therefore compute the byte size of 32 pixels in the given
> color mode and align the pitch accordingly.

- scanline, not scnaline
- the statement about 32-pixel alignment needs an explanation that it is
  being currently handled by align_pitch().

With that in mind:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
