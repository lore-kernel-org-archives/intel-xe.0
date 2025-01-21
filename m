Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3DA2C02185
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 10:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5A910E53D;
	Tue, 21 Jan 2025 10:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OwGrH7JW";
	dkim-atps=neutral
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44E810E53D
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 10:21:55 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-305f529a987so44146701fa.2
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jan 2025 02:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737454854; x=1738059654; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=I2nFbxWQBsokcGgY7hPWhlAFzM7Qmu0ovahyH14nkRc=;
 b=OwGrH7JWiyo0Abv9O457FxbDRgYk8TlO/UDjF7CjNDRJCcS7XG4ZO4klWGG4Dl7anE
 Ma4eQzMLzOc9qNEYl6wa/hBlSudX4sOMl0Yl6OJRhE6cmw4KtfFNAkfgw9EfFUDg3U4W
 N6aSHZrXGk6Vpsv+xJBeRAAedZNxBmG2kMpXGLETWxLpsdU6csPY41PRW5IX7MXANMe+
 PpvjD6XsS9KvkeBZHz8vHPF5LqrahCGZ0YUHF9hiGHmXiK4RuSRkdX1I5fgEkVQ0dwBq
 4PbHSDHcNspLXuNfQSoIlBelXHpH1M6WVCJPD4yNr8Q39lV3VTMbstqmUKuxnxD2S3+W
 wphw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737454854; x=1738059654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I2nFbxWQBsokcGgY7hPWhlAFzM7Qmu0ovahyH14nkRc=;
 b=PNsILGLagnob5yPV3LViaVfGHQZquEpGnti1Pbk6thszuR4xAxL2x4dMXn1c3Ty4U6
 52IrmiGI+5w+fP0VhBHGLy5mR4Axq4N8R37796iY0TI5XQNdo68JwizyfYU1ztxeXJoN
 5vRiFzM/Pzj+4jZOyCLlPO2ZkdfwAtETDI7MmLF63pA0gd0QdSElLIUCYuPG1LZWa0tu
 q8ioa0e00jma/hMGBxxBbAR4cF1X+zEywIxhGMfb7T6sUOTI3JZ3IfJjeNp9mnVzdJlw
 4+04xIx3Zn4Hf3/C7+DVJlCNlw7fBiO/QepA8/M1qfDblp3KphdAft/h6SoNIFPgsEbA
 Dt5Q==
X-Gm-Message-State: AOJu0YyMo7N1SeBS9+pXm91QCTK/3veD3qvv1ibTgfZC12qAPOJyg5xj
 QJN6hi3Epz/6+uEMIX81X0lunDR9YcgMzG+2zHc/HGIH+QBnW9Rz8cnlqRD8w1g7Gomd7kUNbcF
 gsSQ=
X-Gm-Gg: ASbGnctqxe/l0qVn/ViibOAB6aKZ+Ft9L4Dl467zDTzWL+2iTovSjGChaKfF1Ewvvx5
 qPUyL40IxAI8mJRlsIIyhWSJ5LWYrZqc3iYVl/MdbwAAUhCvaveuRE5+3shuMCFSqdKiwe4a965
 Qr2foTNqhU3vKWJ9KuuESlxz9Z2jsgmiz7WaQcII99BuOKc6j03K7EMNytp3NalFR7xgrA1BIb7
 De1J+6iv5CcE8ERaKi4w6YELdFMLN2mgeP/ZmCXKZ0aUEIq91rYDzSLUpMnd4dD/As6/4RbGbHG
 S7iRBGmvrCSCVBtoQosLW152bLLty2SJ/2Stk6zvVEqNLnfArg==
X-Google-Smtp-Source: AGHT+IHjV5PDMcp54JhabBC1f0IqVkNBpOfsnJgpDLlax67qDrtQimC17ffsjCIjglRpaN2NGP62Uw==
X-Received: by 2002:a05:651c:896:b0:302:1b18:2bfe with SMTP id
 38308e7fff4ca-3072cb04523mr66011901fa.25.1737454854232; 
 Tue, 21 Jan 2025 02:20:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35b893sm20821891fa.63.2025.01.21.02.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:20:52 -0800 (PST)
Date: Tue, 21 Jan 2025 12:20:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, jani.nikula@intel.com, arun.r.murthy@intel.com
Subject: Re: [PATCH 2/3] drm/display/dp: Define function to setup Extended
 wake time
Message-ID: <czglpcoij5po45xhidmpmeplcqbu6rrmjsipbng5p2a6tygi7a@cfw2qbxe3zqa>
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
 <20250121060522.1296166-3-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121060522.1296166-3-suraj.kandpal@intel.com>
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

On Tue, Jan 21, 2025 at 11:35:21AM +0530, Suraj Kandpal wrote:
> Extended wake timeout request helps to give additional
> time by reading the DPCD register through which sink requests the
> minimal amount of time required to wake the sink up.
> Source  device shall keep retying the AUX tansaction till the
> extended timeout that is being granted for LTTPRs from the
> sink device.
> 
> Spec: DP v2.1 Section 3.6.12.3
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 47 +++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  1 +
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index da3c8521a7fa..9eae5ee85b13 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -459,6 +459,53 @@ void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
>  

Please provide kernel doc for this function.

> +void drm_dp_lttpr_wake_timeout_setup(struct drm_dp_aux *aux, bool transparent_mode)
> +{
> +	u8 val = 1;
> +	int ret;
> +

-- 
With best wishes
Dmitry
