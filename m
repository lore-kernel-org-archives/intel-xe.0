Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DC0E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 11:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1808910ED7C;
	Thu,  9 Jan 2025 11:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i1HueGXP";
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1818010ED7B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 11:50:15 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4368a293339so10097515e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Jan 2025 03:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736423413; x=1737028213; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SBUIkyq8HThi2u/QbO+9Ek4VXanc8mg0IJge15zLjYc=;
 b=i1HueGXPRAqV4nwUNppXRQUm28V4fYI/SqF0aHr5fzbW7MoMYKC6ipU/9Ltq4pV+Gq
 uWqG+Gxvo87jtQSlh7hMtAP/xTEvrfsngpDnamE/6NAr1/nNWiFYUxJLSQujvvW2vevw
 /4zQc7XIobLhDq/KsJledq5B2nItZVLV9Dg9+wGT0vHidsovFNzJaNZXRTbHdP7eoxUz
 1cYdt5a+ZOJk84lRBitKHmwZTE6ldNHNIX4llHqlNvvNC6bPvVHa0j7/kUMbT9Chp1V6
 WAzj8YQgQlF6zgncT8Rr1mybOk/HKp/nwg3rpSX1PdFoSuRKoLE5NxBoEBVPU8RZXwO0
 jD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736423413; x=1737028213;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SBUIkyq8HThi2u/QbO+9Ek4VXanc8mg0IJge15zLjYc=;
 b=YMNdk63VC0CvQWI+EkHa5tFBaWn2+wslRE4NiTUydQOGzXVTQqGPCrUKPxm3SURfxx
 sDpwrXaIR08xeNRf3Qi2iBkQ/dri8hyRke6A32OQq6CIoApFRJR+XtdxJ7qwK/K98ikq
 62ZFqha7B80ilpI9t0XBDGcSxYc8XJSP2AEXBYN9K6Vb+Q+WcwKvLB/ea0GXv828XNK6
 L/bxnNiFBcMI1aMAWTTtsi/UryVeAonuItAQyCth8gMyC+GnYSVy4vgczxzv6qiEePkO
 r0F22NNFposAAKrGg3s2nwok/2117TXgc69Kt1+idB81pAauJoQXVjwxXh09HHdUgG/L
 JClg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdOLTzR4G3p33chYFR93ssAGMfH1VQbmAnjVMhuJaxIjZkEaSbgPHC+jt1+y250CjZDfeC35Ajiw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdiAb2EJ+w4fYq58IzJm7tz3hUVKgoBgdCzailESt51Q2C5AN4
 OR/mAON6QHNcJco9kBrUoNm3H0m2MKQl3SJEugefIQI/rk18rIm7ky6SSQssgZc=
X-Gm-Gg: ASbGnctyEi+3y/OM2/3UScwPrsuljoCzBwXxUweov4K0+wPTdXH+s6cLGa1octtCx5O
 G9OZ1Xjo3B4pPUVp3gt+rcnt4j/9AN1s5etsZwEx/A2ubD3WNfjwMlGCDVr+pw5IGuyGcwh8e92
 yJ/mAG4edMqg1Iq+VTKHFjkzZchzUte0rkao/zSsu3yYq205ZWbq02jP4ooururyq/EYBxMDaNC
 BpUjfcb+Oi9GPUgBF2WL2Ob5LNMwt9wOy7k5K93seo/xyKTFBkYIQs=
X-Google-Smtp-Source: AGHT+IE6bPuwfgpmvhR0wnVywkO+uV/zmxqYUYfEIWBePuS9J7kF881P4MIK7Z1l4XbIG4X4Nze9zA==
X-Received: by 2002:a05:600c:3152:b0:434:f9e1:5cf8 with SMTP id
 5b1f17b1804b1-436e271d3a2mr66267645e9.31.1736423413467; 
 Thu, 09 Jan 2025 03:50:13 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3838a3sm1628874f8f.33.2025.01.09.03.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 03:50:12 -0800 (PST)
Date: Thu, 9 Jan 2025 13:50:10 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z3+38i2MTgwNGKSU@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-4-918949bc2e3a@linaro.org>
 <zfyl7xvkackpv2tfabvcjqt6e3uxxgyxwg6t4fvjrlzeg5m6nf@wc5suvzcm54u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zfyl7xvkackpv2tfabvcjqt6e3uxxgyxwg6t4fvjrlzeg5m6nf@wc5suvzcm54u>
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

On 25-01-08 16:25:31, Bjorn Andersson wrote:
> On Wed, Jan 08, 2025 at 04:31:46PM +0200, Abel Vesa wrote:
> > Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> > 1.4a specification. As the name suggests, these PHY repeaters are
> > capable of adjusting their output for link training purposes.
> > 
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > The msm DP driver is currently lacking any handling of LTTPRs.
> > This means that if at least one LTTPR is found between DPTX and DPRX,
> > the link training would fail if that LTTPR was not already configured
> > in transparent mode.
> > 
> > The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> > that before link training with the LTTPR is started, the DPTX may place
> > the LTTPR in non-transparent mode by first switching to transparent mode
> > and then to non-transparent mode. This operation seems to be needed only
> > on first link training and doesn't need to be done again until device is
> > unplugged.
> > 
> > It has been observed on a few X Elite-based platforms which have
> > such LTTPRs in their board design that the DPTX needs to follow the
> > procedure described above in order for the link training to be successful.
> > 
> > So add support for reading the LTTPR DPCD caps to figure out the number
> > of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> > at least one such an LTTPR, set its operation mode to transparent mode
> > first and then to non-transparent, just like the mentioned section of
> > the specification mandates.
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 24dd37f1682bf5016bb0efbeb44489061deff060..ad09daa4c8ab5c0eb67890509b94e72820bab870 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -107,6 +107,8 @@ struct msm_dp_display_private {
> >  	struct msm_dp_event event_list[DP_EVENT_Q_MAX];
> >  	spinlock_t event_lock;
> >  
> > +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> 
> As far as I can see these 8 bytes are read and acted upon only within
> msm_dp_display_lttpr_init() below. Any particular reason why you don't
> just put them on the stack?

Sure, I can do that. My rationale here was that this caps hold more than
just LTTPRs count. Thinks like max lane count or max link rate are part of
the LTTPR common caps. There are drm generic helpers for each one where
you need to pass on these caps. Yes, at this point they are not used in
the drm/msm, but looking at the i915 and nouveau, they seem to be
useful at some point. This is why I followed the i915 to safekeep them
in this container struct.

Anyway, I'll drop them from here and put them on stack.

> 
> Regards,
> Bjorn

Thanks for reviewing!

Abel

