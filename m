Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32575D767E3
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 16:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F051410E02D;
	Thu, 31 Oct 2024 16:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Nj+Bsm6B";
	dkim-atps=neutral
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B9510E8EE
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 16:45:00 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fabb837ddbso16520751fa.1
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 09:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730393099; x=1730997899; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kt+ok40lFX13Yzdkxs+h8BxbfiG8swFfP1jVOHqPZHk=;
 b=Nj+Bsm6BxGU8gnBzosCZfSjwX+iDJD4I9QmqsfGxZ7iBzeI/4IoFSYWGiVtcgom5sy
 niP4cXUUeaqrg1uqcG3PWWskQWi8tM3Aa9ZT4TzDY4pT2OFQZ6ug1vnzlcd27JSujnKH
 cZELpWyLEPYkswjYX7svaIRN/ciMTF0c7Bq/i+nctTqFhvcLSh7npMq0YXMWZ8JjYIs6
 W2mttKTetsYuO0UTETKSqncGBJ1R0OawUI17N8HLiyZKRzTI8AZduuSbQXl6IA2yFf+G
 CixvMQZ/MyYBo0gTSCY8EoAPjxVK7OD1GBDrtlU47ZkWtOz5KyqS5JtR9Bjl4vIrW7lY
 pj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730393099; x=1730997899;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kt+ok40lFX13Yzdkxs+h8BxbfiG8swFfP1jVOHqPZHk=;
 b=NKENC7u+5eFv4miRvYkCwXdYYQCSI5jlPr3tM4IbexZ4bi93sR74CHKs22KaXTHgCr
 HrAitT/dXGULGIE422NeHofRdTcjDmoFbox9lCym+UD/AhdxM/p/EsLEqE/J58ckGQjW
 tkxdm4t0sxcFdDLGf6KJ+PU+E9Jjb7wX9XkzIZEoUhWDuWjNg+0zebz5SevVlbd83PCU
 t/zgyHXFUBMxN+yNEw3e/M7+SOBj/3NLUsFt8oIQnplxXRQi7CY4BtW3WxlYCVDZTrAX
 JJSgbKNKIOGRn0MGuVOachrLa198LbdOzAP5qThkHS26e5LxgfbUrwiYvZ8UmvKxEEvm
 ALvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoRv73INIG3VVdEaxQ/5CAulB33uphWI13FkPU3dypjAVgyKPKb5GXU3bw0/co9BUu9ioyi7kEcA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi67wU953OrPqRs3IWmRhcasxG2IiQAsj6VJwLbUTbhY9fy/pt
 KpkjdHsvvgH+A0P928HjCKC5pUPAwLvko7xsDcX/Wrwt7hBTk3oNm3y341m/1gQ=
X-Google-Smtp-Source: AGHT+IHRQwOGhSkkEBtHlVJ+MZMA/jBWeUH8G5Fmi2dhuQ2z772Z0F7QMIMohuXdOiHSqhRBM4/r/w==
X-Received: by 2002:a2e:bc27:0:b0:2fb:5bd:8ff2 with SMTP id
 38308e7fff4ca-2fedb7a2d4fmr5016331fa.16.1730393098676; 
 Thu, 31 Oct 2024 09:44:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef3bbea1sm2684791fa.24.2024.10.31.09.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:44:57 -0700 (PDT)
Date: Thu, 31 Oct 2024 18:44:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFC 2/4] drm/nouveau/dp: Use the generic helper to
 control LTTPR transparent mode
Message-ID: <hh26gzyjhygphlrmhh2zkskoz7vezkgdepbx7fnzgfch75simf@hmr5ezp4khwi>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-2-cafbb9855f40@linaro.org>
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

On Thu, Oct 31, 2024 at 05:12:46PM +0200, Abel Vesa wrote:
> LTTPRs operating modes are defined by the DisplayPort standard and the
> generic framework now provides a helper to switch between them.
> So use the drm generic helper instead as it makes the code a bit cleaner.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dp.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
> index bcda0105160f1450df855281e0d932606a5095dd..80264e6186246903fa037861fe37493646de0c6e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dp.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
> @@ -80,15 +80,12 @@ nouveau_dp_probe_dpcd(struct nouveau_connector *nv_connector,
>  		int nr = drm_dp_lttpr_count(outp->dp.lttpr.caps);
>  
>  		if (nr) {
> -			drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -						DP_PHY_REPEATER_MODE_TRANSPARENT);
> +			drm_dp_lttpr_set_transparent_mode(aux, true);
>  
>  			if (nr > 0) {
> -				ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -							      DP_PHY_REPEATER_MODE_NON_TRANSPARENT);
> +				ret = drm_dp_lttpr_set_transparent_mode(aux, false);
>  				if (ret != 1) {
> -					drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE,
> -								DP_PHY_REPEATER_MODE_TRANSPARENT);
> +					drm_dp_lttpr_set_transparent_mode(aux, true);
>  				} else {
>  					outp->dp.lttpr.nr = nr;
>  				}

Could you please extract this true-false-true dance to a new helper too?
This way Intel driver can use the simple helper, the rest of the drivers
can benefit having the common code.

> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
