Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A994C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 18:52:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B4210E328;
	Wed, 22 Jan 2025 18:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f2+99VQ/";
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D1A10E328
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 18:52:33 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3043e84c687so211631fa.1
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 10:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737571952; x=1738176752; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=47EfM4ewVZOR1hXBHkBwrdrA6zHbkcECh3NcS2frWc4=;
 b=f2+99VQ/GZwDonNNX8azHpxLShMX5qxhTL7Is4fuByoOd9fhpkPgJxoiW8XA1jfgd7
 AaKmqeZxSR566gaDtPwhvLn5dir+0wVzK6xBKWUMiC4EhZRNcYERp+D5Zhf57ESrT2ar
 jzq1WfNH8LYZTPbHiNtcQwP6wwz7XkP+7P9rqYTkFSMDggijKGW4bz6zRbZXZyR3FeJr
 muTdcxxodprFOM/59WRAdH5eEvZstTID2GkPWd8JJHj+H3KbI3wsydm3iemWLOuYYAlV
 /Bkfylb+n91bJaMoqHloVj9zb5ENGWrX3kufJyrL0JneakUqNJz0xPicYlx9rkbXZjMP
 iAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737571952; x=1738176752;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=47EfM4ewVZOR1hXBHkBwrdrA6zHbkcECh3NcS2frWc4=;
 b=OHFhAL47ngl0nib0U2A/2+kUoDvrzbSBcp7KtQnxX7HFDiNs8HoHRn/3yvoSJBkh42
 KcFuTz+OtivOWhUH31GLj9JcQTCx9eEPTDuKpW+AjtHDEDx7Y0sos43FRnLethIbLmsU
 cev0zdJARNi1RS3zkKwRYSC2ilnGB7CegvspoqmPtRnjQRRumpsjA9RZbqf+dsbvFbFU
 tUHZPJ4gt9lSY/x/Jkyg0G7XNrHSjOndT+foQgRHb/Go/AUzOa8xMkwUBl3RR9eJXvK+
 liUpYSS5fPA0Jg2b7b6/UjJXmbYDL2CjGrdz/KO19Jh522nF9wWnHdaVIevyuOI2x6Qq
 O2mg==
X-Gm-Message-State: AOJu0YyG0wkFC8SLAK3g9ijcnBjJI+NRNvyEVND8mISj5Z5Vd9UfXjKS
 DdWAX1FdhpI7tQPwrqbAKP3GLEfktmbMrcbXJpbqugJUMmVj/ZWVtvvOz9PSQWc=
X-Gm-Gg: ASbGncsrxLSGIsZVfDuUmKN6dFfZoBruPFma1wywNhPeVmoiRIzrb2K+GWEMPp1PL9o
 dT/YWopdZO5CTTvRj+yVBVVnxNZMcglnWHh2q4YokwxJR91v0JPvA9Cj774Y94+pTRGOoSGarzL
 skFlWO4ZhkWH9oRkUKBAf3bKUzf/6IzCoWXTZSLCXdpBFBS7k+NvNEacZNzvr+SqEIDU15R2JdZ
 wz2+ztRgaHdRwOFA+wU98b4uwklK/XRa5uUjJBSirNr0wn82Oa1CSF8Wc62kY86IBEeCSh8xgNv
 tw3FjZD3SHFiHlWRP4tgBV6KC81/nGQ0IzHH4fWT8bMnmSfHSA==
X-Google-Smtp-Source: AGHT+IE3EDm7wv4jCkNZdaiwQQ2AGo8JcXsq1mg0NjOa/Kt+krzSnrpzbntaHjQxbskhwASEZ3Ro9A==
X-Received: by 2002:a2e:be21:0:b0:302:1dd5:6b34 with SMTP id
 38308e7fff4ca-3072cb1f983mr80371581fa.29.1737571951564; 
 Wed, 22 Jan 2025 10:52:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a27218asm27018491fa.0.2025.01.22.10.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 10:52:30 -0800 (PST)
Date: Wed, 22 Jan 2025 20:52:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, arun.r.murthy@intel.com
Subject: Re: [PATCH 2/3] drm/display/dp: Define function to setup Extended
 wake time
Message-ID: <dlmz7fn3ln7qcnb5ehae3nuzsauxunp4gqibuqwsqmjwrxfcdr@rrtybfduszrq>
References: <20250122053358.1545039-1-suraj.kandpal@intel.com>
 <20250122053358.1545039-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122053358.1545039-3-suraj.kandpal@intel.com>
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

On Wed, Jan 22, 2025 at 11:03:57AM +0530, Suraj Kandpal wrote:
> Extended wake timeout request helps to give additional
> time by reading the DPCD register through which sink requests the
> minimal amount of time required to wake the sink up.
> Source  device shall keep retying the AUX tansaction till the
> extended timeout that is being granted for LTTPRs from the
> sink device.
> 
> --v2
> -Add documentation [Dmitry]
> 
> Spec: DP v2.1 Section 3.6.12.3
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 58 +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 59 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you!

-- 
With best wishes
Dmitry
