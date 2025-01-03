Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C01E77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 18:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F28F10E90C;
	Fri,  3 Jan 2025 18:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mCOksrf7";
	dkim-atps=neutral
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08A410E90C
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 18:07:32 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54252789365so5783590e87.0
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Jan 2025 10:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735927591; x=1736532391; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
 b=mCOksrf7UMtQqgFZSPorSDGEl5/xZUAJxRvXmWaIbZnfR13BTF3hkmgw4Re3kTIaxf
 LBLsSLJZVGH0i985ajleS5XubvRiAMFNMNaguuN2XE5VoREKW2GKj3CTT/EOvbwewLZj
 kzOITbM/Tmixo4ATV0QsD2CoEKB8Hhb92PRPvgnW4ZEZj3m/EG78QIT+TjYYAaoC7pjE
 QivMMxO5WAzyIK4ASkN4JHeQQk3dk8gty+bN082FtY111huCs3XShrxHaaS1VSdpd/In
 /kc5cCFwoSEKM2eLpikCd6JU5iKiOcaMSG4VaIhjvX6agQCiyUoQcvcyoYDaryVu09NS
 loOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735927591; x=1736532391;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=155ezFoO+4fVmuNy4GZMEsWBNEAzYP4vCAeZ5fjCchw=;
 b=OJBjoI7fO4ewB9S3XK+F7WRxKQ4wKYR8yraZaLkMRPrDPZoudqqXK2FD4WtU9DA/2i
 QJPDDGtieyoGbzHBWk/n+HsDTuVSDMrWBtKYAlqZBPAkjbO22LToT1i4dL1c8EMmoipF
 vtpzykbFaO3C3at02bt7kdeqd6up046Z3hgPZvRmVpoqHBr8m6RM5gzpUMucMoeHYV/M
 tqar0yjGRcb+p/M8Q8Z9UgknvqncLZBOVk1l0LYhm2UNKudeFSLbnOLamSq4HAGztjNF
 zD77O6a9fRzhW8pXJDdcMOqrXcHfSdEO1LeqEH7fnIr9cb7yckug01XVwmuGAXAIZJSc
 wMdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY4EBj+sUZNJmlXBzusnH/RGjtZYRd0PSnqiwAZOhQutUSVRd0EwDd/gsSBfeZzTCR5KUdXMXHsA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGRy6wKNEpcao8FjNEEswSfD8X0BDPIZGMVO0Ux7u4CWSAvP6k
 8KnxceK2Ck3CgeUEz6lod+tn6WoUAx+NttHwQPyAsiOsAIXRO6ahzbBKxD4ireo=
X-Gm-Gg: ASbGncugQLYBsZ58gP/4sn0+igZf3liN3grYZOssmCplBYtF4ClR/SyixXFcqV5z4Tj
 D4uegsg1ah/vY0khWH3v7EfUrtjBM+CprO/dyltbdaCfc1/oK7jwofMve4wxay8Ho/0n+kOwKBd
 Fth0xv6yu/9Ls8yCGuF3NtFnPXxR86erXOIq22NYTxMnJG/35bkXawkTgRsi34Tlv+97lSO6Yy7
 K/ExAk/Hy3XRn8Ca7YohynRy2H3UEIe0I67wvPtlEK4iKp6lJIkr6xkWynSiJpd4oHRKuiLbvAF
 /4alzISVJRFZdqNcSX6cbe7fv7IE/IAripjJ
X-Google-Smtp-Source: AGHT+IGRom+Gus/1G1SgQhKlOCafo/OEVm4N6cFluXFzAfrnKOJhSwVzA8r9uuoBvSe2BPxSSW2YMg==
X-Received: by 2002:a05:6512:438b:b0:542:2999:2e43 with SMTP id
 2adb3069b0e04-54229992e47mr16954688e87.24.1735927591118; 
 Fri, 03 Jan 2025 10:06:31 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832a5bsm4176014e87.270.2025.01.03.10.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 10:06:29 -0800 (PST)
Date: Fri, 3 Jan 2025 20:06:28 +0200
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
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v3 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <yx2io7cuu5hescyocvkvzsaoiqhgbifknbxytqtusbno6y4xe2@e4bar6lemtdl>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-1-5c367f4b0763@linaro.org>
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

On Fri, Jan 03, 2025 at 02:58:15PM +0200, Abel Vesa wrote:
> According to the DisplayPort standard, LTTPRs have two operating
> modes:
>  - non-transparent - it replies to DPCD LTTPR field specific AUX
>    requests, while passes through all other AUX requests
>  - transparent - it passes through all AUX requests.
> 
> Switching between this two modes is done by the DPTX by issuing
> an AUX write to the DPCD PHY_REPEATER_MODE register.
> 
> Add a generic helper that allows switching between these modes.
> 
> Also add a generic wrapper for the helper that handles the explicit
> disabling of non-transparent mode and its disable->enable sequence
> mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> to move this handling out of the vendor specific driver implementation
> into the generic framework.
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 61 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 63 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
