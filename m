Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3935AD735FC
	for <intel-xe@archiver.kernel.org>; Sat, 30 Nov 2024 09:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E254A10E12A;
	Sat, 30 Nov 2024 09:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hsaOwrPO";
	dkim-atps=neutral
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7829410E12A
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Nov 2024 09:43:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53df1e063d8so3272200e87.3
 for <intel-xe@lists.freedesktop.org>; Sat, 30 Nov 2024 01:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732959799; x=1733564599; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CTGBtqe5NJuPcDpf6dQX3m2vAT1n9KYqpgUQSwBGip8=;
 b=hsaOwrPO2QYnU3VwkfOjKiO+K9OrsbJc4CbFutO87xFOwngpBOZov4sRtd2U7HQgzU
 1BXgYpu10dHr+tJYFzjkNhVW+ZKWJWry2n6yhG/a/wP0BDCLKKA7c9faia5BAw8ml6ko
 giEMYnYc15l50RQ4nJLI/gG+Jszh3kHSo44O122eRJAAoa541AIfWtdkEZmqCryapqSn
 lSBTlO1FmBypfxcqOHNl37Zv1H+UUu2mC9j5hBHuVMAs8Wl/VSCVbV7tdu7e/bSE+pm6
 9EfJ+4hnIGxNEbKHBz4FphYw93m1hwnP5M6LogTZ9UWr6ajAKFB5tfz65RAlZdXV1qh8
 6ZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732959799; x=1733564599;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CTGBtqe5NJuPcDpf6dQX3m2vAT1n9KYqpgUQSwBGip8=;
 b=Cgmf3B7ttxj2x+XnuaQxyuVjZY3XDK68KupOqBgN0acFFUKvSZ4Zfbczf6c7ln5uud
 T2GmMtle5LK576deN0PHdSt93QiqCYDx1ikybvyD+zU7YiR122G8qdXMlvsWyTu7Qe6t
 ACOman3nE0gyTy2noCI6ViYlTKFAIvrt8NLV242u6X+sRrnBVWR/rNk96phl0rnkJQOx
 wWPSbZHuFl7CU3pCbVsLz5euhg1+MPJsn9peJAMKucoQqdyqaua/FahlHPWFatQciexg
 HiXHvPhAr55J3e6H+EBNdCMkaHxP2e/ABw2CJo98xGB9N4/vnf8xa9lnK769fWtwZlVC
 6WFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKrFD7LQx3KVVOJF4k3NPbmjqY6+NQrMQHej/SC701r433jfAZnINmoAoyibVLPCdufHZnhRkVBw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVdI2V76Rw+EEVPQx2q9qDJ/a9+DMDS9BT54dZgL9eMPv7/AaB
 1+GYDBKBj3iRTj7kW+bzMDplRf3u+WgGsxv2DyH1Iby6Te0eF/JVWFyo/AZ/mf8=
X-Gm-Gg: ASbGncvK95U+BHYVN1QBQR7uMsixXHYowESd/CnGnpyYUxLEOZV8H5Cwz8h8OzphElz
 FSmlkdofNiv5h2kDEkcrCvdgUl9CmV95ovYZ96/CiyUVFoyv7RPwvY3S8TpE6yIsl1bXuoqNUzK
 DwjLQwcHgitpc1eeA9nFXupLQUP5lsmQs+CZCK18671QjRaPLhUAmmiSsQl+lVrSreRURev86kE
 MIIp2JSdPPPI3HbVyoqCBkNzdRWzMqoyUAW8afHEF77a5CQOPMTH9+nsbrhvVIJouu2dBsZmstD
 Y+ZDEPDU6JcbyeGEqn6+nhc71t//HA==
X-Google-Smtp-Source: AGHT+IFuDWo+AA1UbdMQRc9r+KwOao8NefSFqqyTX0pSLZcVq04GBJO7eJY6YG6HIoN0U/cABkUg0A==
X-Received: by 2002:a05:6512:291:b0:53d:f09e:99b0 with SMTP id
 2adb3069b0e04-53df09e99f6mr6738623e87.0.1732959798660; 
 Sat, 30 Nov 2024 01:43:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64a0742sm725518e87.261.2024.11.30.01.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2024 01:43:17 -0800 (PST)
Date: Sat, 30 Nov 2024 11:43:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Uma Shankar <uma.shankar@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 harry.wentland@amd.com, 
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com
Subject: Re: [v2 05/25] drm: Add Color ops capability property
Message-ID: <5jv337lffqqkebsy4ttn62peqnb5a7d4igqe5fvgrzi2kkzjfk@vub74vxn2nqk>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
 <20241126132730.1192571-6-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126132730.1192571-6-uma.shankar@intel.com>
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

On Tue, Nov 26, 2024 at 06:57:10PM +0530, Uma Shankar wrote:
> Add capability property which a colorop can expose it's
> hardware's abilities. It's a blob property that can be
> filled with respective data structures depending on the
> colorop. The user space is expected to read this property
> and program the colorop accordingly.

If it's a blob, where is its contents documented? Also please point out
the non-IGT userspace implementation that uses the property.

> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c |  3 +++
>  include/drm/drm_colorop.h         | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index ba68358c0ffe..46cc7b0df6e8 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -780,6 +780,9 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
>  		*val = state->size;
>  	} else if (property == colorop->data_property) {
>  		*val = (state->data) ? state->data->base.id : 0;
> +	} else if (property == colorop->hw_caps_property) {
> +		*val = state->hw_caps ?
> +			state->hw_caps->base.id : 0;
>  	} else {
>  		return -EINVAL;
>  	}
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 56b51fafebdf..58e5b87c6d56 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -146,6 +146,11 @@ struct drm_colorop_state {
>  	 * Number of entries of the custom LUT. This should be read-only.
>  	 */
>  	uint32_t size;
> +	/**
> +	 * @hw_caps:
> +	 *
> +	 */
> +	struct drm_property_blob *hw_caps;
>  
>  	/**
>  	 * @lut_3d_modes:
> @@ -297,6 +302,13 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *curve_1d_type_property;
>  
> +	/**
> +	 * @hwlut_caps_property:
> +	 *
> +	 * Property to expose hardware lut capbilities.
> +	 */
> +	struct drm_property *hw_caps_property;
> +
>  	/**
>  	 * @multiplier_property:
>  	 *
> -- 
> 2.42.0
> 

-- 
With best wishes
Dmitry
