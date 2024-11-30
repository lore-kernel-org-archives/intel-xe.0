Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89CCD735FC
	for <intel-xe@archiver.kernel.org>; Sat, 30 Nov 2024 09:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9241210E39C;
	Sat, 30 Nov 2024 09:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fSZvnln/";
	dkim-atps=neutral
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A3AB10E3A0
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Nov 2024 09:46:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53dde4f0f23so2693183e87.3
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Nov 2024 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732959994; x=1733564794; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O7ukQKCjj+sldLQHYrJwAT1f/L5D9PF1X7vziPXtA6w=;
 b=fSZvnln/cu+Ech3kTOFxIj9jZCskibDk+Yq8synRp+DQg23xcuYF4wisehl1Zkb1zF
 m6OTEqkn2lPjwz91Md9KpOkJjkyqEbeZ/3BdZ5Tx+Gv0UYOUoYDnpz5/PdJbhIE3KPvY
 xIpVxVduahWw3E+kF7lJBWQa9qDHoDAATfc6SpUa60GWjWIHdfAULSQQA5+hdp6nzYWF
 I6KK78YfwT2X3NLLVTZPS/jKtH7YX3CUAi+j3i6M8yXToJCWkoxIEortdGcr9LisxKu5
 eyx8k2Jzy89F1wwtpo0G4E7pV054XR5PGB/q4D9SQKM9mLVKSigjkKQMqtEp9Jd6153t
 eVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732959994; x=1733564794;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O7ukQKCjj+sldLQHYrJwAT1f/L5D9PF1X7vziPXtA6w=;
 b=cPvIwRu2/wixQsoOYTkBaCAnq/dP+s9dRJy1sfCVZXR6nexgb4eSw+zDzppnFPkp09
 /N7vtC/uWaCxBvpfhYTRafousgSLK912zsi3lKOKuvOtyFxnNUOXk+CfIh1UkslNCjdr
 Lq9XYqjhMU8ahnsYW/wskzrBDK/juAcWQI7D/exG7xld6BSv8p5E/HtonC2tJJoEOXf2
 po5Ws/nd5lSxdU1U3dWTJCyq417vZe6S+6PkHKPuCtzj14acH9S1NjGKqEjL3e8QuF83
 SzUdbGXeenvJnIUVpFX9Bm8bOTbub16y/pgYurCu4SzKY8tDR0BK+x0FKF4jpETdGQ1m
 ZfqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Mv11Kdfzeeiye7SpKMM4on+fTihTHJVW59G+1/2tbAip11gg1i4ROfZJihjqJT9mmrrgtTznkw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+0MAwTt3Ym8hO3FWcepCWK6tTNn6rikfrt32ywA73tx4HoaIT
 zg1ECPkwzpYYsjpiXzBA8h0aLm+33qOsCRKI5U+QabnAg+eU/z8/Fu8vQ2uUJno=
X-Gm-Gg: ASbGncsX3isFhmH6oBWozprKCCRLcj9k3ezYUaDbqr99MMZVPCy8OtLgzl6SLOhnExr
 3dCSe7DrvVvDklcQUbxkQRK+ZapDj0bGiTuLfx5FMdI+Z5bNbqG2tmgRtMQ/PAw8Y5zgzA0OoD7
 cYTqHfcp4OAXWSnkIM9jU2pYZx8TXV/KZwy2NQ9W88d4lf2eAjd0Mpv58GOlzEMhdcTQh1ezyFJ
 N2zs3h1o3VVjIfPGyHX4mgEgEyQJmq3+ImyKyw/X/J7N6AvoY6BO/mQ1Im+2hJMuvKCGPafPx5H
 PFG6yKV7ukGhPHi5XDpp0akwx9e5Xw==
X-Google-Smtp-Source: AGHT+IGGGm0wLvdw3rzGApBnosBq0rIEyEKzpB6WvavDO1jpjLzwEUcFhhstL3HqJPE15XR8fgV2sw==
X-Received: by 2002:a05:6512:2215:b0:53d:a321:db74 with SMTP id
 2adb3069b0e04-53df0112176mr9569064e87.50.1732959994479; 
 Sat, 30 Nov 2024 01:46:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df6496a38sm717132e87.214.2024.11.30.01.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 01:46:33 -0800 (PST)
Date: Sat, 30 Nov 2024 11:46:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Uma Shankar <uma.shankar@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 harry.wentland@amd.com, 
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com, 
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: Re: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
Message-ID: <bhjkznwq2776cpjun56fqi6qgfu7ezojxs6mv4itb3njws3aeu@ixhixfv6uknj>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-10-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126132730.1192571-10-uma.shankar@intel.com>
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

On Tue, Nov 26, 2024 at 06:57:14PM +0530, Uma Shankar wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> 
> Add helper to initialize 1D segmented LUT
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 27 ++++++++++++++++++++++++++-
>  include/drm/drm_colorop.h     |  4 ++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 111517c08216..871d5660e3b2 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -104,7 +104,6 @@ static int drm_create_colorop_capability_prop(struct drm_device *dev,
>  	return 0;
>  }
>  
> -__maybe_unused

Squash all three patches so that you don't have to play with
__maybe_unused. Then please expand commit message to describe the
problem that you are solving.

>  static int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
>  				    struct drm_plane *plane,
>  				    const struct drm_color_lut_range *ranges,
> @@ -338,6 +337,32 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
>  }
>  EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
>  

Missing kerneldoc

> +int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
> +					  struct drm_plane *plane,
> +					  const struct drm_color_lut_range *ranges,
> +					  size_t length, bool allow_bypass)
> +{
> +	int ret;
> +
> +	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT_MULTSEG, allow_bypass);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_colorop_lutcaps_init(colorop, plane, ranges, length);
> +	if (ret)
> +		return ret;
> +
> +	/* data */
> +	ret = drm_colorop_create_data_prop(dev, colorop);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_reset(colorop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_colorop_curve_1d_lut_multseg_init);
> +
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane, bool allow_bypass)
>  {
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 58e5b87c6d56..9268fffd04f6 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -391,6 +391,10 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
>  				  bool allow_bypass);
>  int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane, bool allow_bypass);
> +int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
> +					  struct drm_plane *plane,
> +					  const struct drm_color_lut_range *ranges,
> +					  size_t length, bool allow_bypass);
>  int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>  			     struct drm_plane *plane, bool allow_bypass);
>  int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
> -- 
> 2.42.0
> 

-- 
With best wishes
Dmitry
