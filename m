Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF02E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 12:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B2D910ED89;
	Thu,  9 Jan 2025 12:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B5Ear+Jh";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A6310ED8F
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 12:15:25 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4361f796586so9088215e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 09 Jan 2025 04:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736424864; x=1737029664; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qgi4e6BoGIUkq88BVzT7YBbI2Ar0NhYklw/AGMjsAlg=;
 b=B5Ear+JhPAVnF0evzlI3EQqzkt7dmuahMHwTSYE4mWta/F7T6iRE5RV7hp8pxQKhLX
 aoBWPCC+ndsTTQZ2/tiV8DXvNZTeES+atiSoc5XKtm83YcyzUPZMtkpkoCoZb1/+8v5+
 WC0LTNd8fg+PHZaPKxOMrYxv35LRs3FN2ltpYvgoGW6tWV6AWiyCBpE7GbxtszMdNzxg
 tHBPUoXAzuaJjOXOFiHiNABaY0CEGs4jBg1yk5xXDXT73tIyD+/PGiJr/6WX9izgDC1p
 /HRnLk0qSTogsgDlolVsmOPRHXNy4IsYxvVSGIhZ2vTIKRjxvg6tdumz74EqpTVwVGkF
 nkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736424864; x=1737029664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qgi4e6BoGIUkq88BVzT7YBbI2Ar0NhYklw/AGMjsAlg=;
 b=UJUn+LCuhtVDMwxn+QCUkMrqI3OP4Z7MIRz0NrAUnj4/rWhWmgrrfx8HsPGy1oGYnO
 FkPG6Pxok7wtIS99yJpBGmZJHwc5onVM5QoU2ovwgHkHpu+copWj465Iq19UrBm6iURK
 IWuceNZXQl/bwoRv4wMm2QuOR8XhGDCZpXiFVZuvb3R47BzHNG1ZSFrD7k6qeTzcQIjV
 ACUpvy263qHxMLlT3N8HXpyJ1D+DvLu9rumh0yoMlFc3jz9c4SUJfUDaWkzn7hSIFoO2
 lnMIbXfygNBCYNGZNqyV3qiMMqRRYQbrl58HiHvUCgokwy2QKzllz5QHIH+Qfelvhl9Z
 ttpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1wOYR19owDAz3sTULE8a4Iqw3IXKcvGf+GkUV/lQhXJp22i5EsgDXJ+DjxnfAk1PX9bIZK8FKUQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzr1G04We5lH3zIu6JDYH/m9/DWNUltZfkpsr4DQ2AeHap8SuHB
 kSmzQ8nZbivtCf29Mj40HJVgcTa9vJFVeXXqVAn6mgc+d8/1ZzyycYeoAdXrJow=
X-Gm-Gg: ASbGnct+GVWti0vhFRP8SyPvYU6BiqyVfICM5cY48JeV/FARwxqes+DplFVyYMLNfYl
 0JCpza/AXwV0xZoPFsTRub8qWBsaQATcZHiEQYQdXpIqo8Y5kTdvGqUim9xO4w+tOV+mphqVC2B
 3XEHqu5JIjVmu6vuKKXQEVkQdgW85QrY94QW/y9A5apT5k6O23bEDRiASbqDQ8ciVEkRAd0/aNE
 RHt5HjTXNXHG78C0ceq0ihoYsB/I+YPXNXWR+lrX+nkZSrWTyPfvWM=
X-Google-Smtp-Source: AGHT+IFZfJfwssLNpBYM5MjiXFRSaZImZ4dWDIr4RYjQoPZfimRRPYITmNGGjTmVo8KU+9ieJp1Ivg==
X-Received: by 2002:a05:600c:6b6f:b0:436:e86e:e4ab with SMTP id
 5b1f17b1804b1-436e86ee529mr33625975e9.30.1736424863901; 
 Thu, 09 Jan 2025 04:14:23 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da6401sm53853955e9.2.2025.01.09.04.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:14:23 -0800 (PST)
Date: Thu, 9 Jan 2025 14:14:21 +0200
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
Subject: Re: [PATCH v4 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z3+9nUwDyyYkB2Jl@linaro.org>
References: <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-0-918949bc2e3a@linaro.org>
 <20250108-drm-dp-msm-add-lttpr-transparent-mode-set-v4-1-918949bc2e3a@linaro.org>
 <b4z2o4sgyjyh7wqbybtifi5evhh7b3tgfujson6l5ajmjdwt3f@x2xz6iod54vz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4z2o4sgyjyh7wqbybtifi5evhh7b3tgfujson6l5ajmjdwt3f@x2xz6iod54vz>
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

On 25-01-08 16:17:47, Bjorn Andersson wrote:
> On Wed, Jan 08, 2025 at 04:31:43PM +0200, Abel Vesa wrote:
> > According to the DisplayPort standard, LTTPRs have two operating
> > modes:
> >  - non-transparent - it replies to DPCD LTTPR field specific AUX
> >    requests, while passes through all other AUX requests
> >  - transparent - it passes through all AUX requests.
> > 
> > Switching between this two modes is done by the DPTX by issuing
> > an AUX write to the DPCD PHY_REPEATER_MODE register.
> > 
> > Add a generic helper that allows switching between these modes.
> > 
> > Also add a generic wrapper for the helper that handles the explicit
> > disabling of non-transparent mode and its disable->enable sequence
> > mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
> > to move this handling out of the vendor specific driver implementation
> > into the generic framework.
> > 
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 62 +++++++++++++++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 64 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..fa7eff94d408718a1762834597f0cd51376d2596 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2817,6 +2817,68 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> >  }
> >  EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
> >  
> > +/**
> > + * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
> 
> kernel-doc functions should have () suffix

Yes, will add.

> 
> > + * @aux: DisplayPort AUX channel
> > + * @enable: Enable or disable transparent mode
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> 
> And this should be "Return: ...".

Will fix as well.

> 
> > + */
> > +int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
> > +{
> > +	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > +			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > +	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
> > +
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return (ret == 1) ? 0 : -EIO;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
> > +
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> 
> Documentation also explicitly says not to leave a blank line here...

Will drop the blank line.

> 
> Regards,
> Bjorn
> 

Thanks for reviewing!

Abel
