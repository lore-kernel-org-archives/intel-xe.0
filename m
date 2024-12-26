Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB5FE77188
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jan 2025 18:11:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F5D10E7A3;
	Thu,  2 Jan 2025 18:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=linaro.org header.i=@linaro.org header.b="iieaJYY2";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EEF10E049
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Dec 2024 12:10:51 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso6206740f8f.2
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Dec 2024 04:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735214990; x=1735819790; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4yE0d6/fT2fHAjzAIYMLLWaXzKg6hYqakVFryoy6JvQ=;
 b=iieaJYY2CsLjdCc7/QLURDOjLPWQbiT9BsMn1GBf/YUGsxntQjc7WPMDtyBhUorG2E
 TA1wLo7Ruz6fiOLYHiVfpCYyZiSqnaAiODAW1kAsuGcihmLCAT9GJIyqDlTzZerl/L6V
 G0fHFZDMea7eDe2jT+xzWcBvZw7GfyDjEmZV0iCndjUKlCyJbkYdpjKhe1pQXbgb7Qg+
 yfiRO2Jn2YdDoEWk3fEjnke0gxNjG50f+9VGPmpNGs64YLIqrkc8amL5j1bvjME1VmYT
 nLzmSYnSkw2bhTV3gAf5t5j0d2M2O/qT7ISUqfLVeKQ9JvArJ7M/eLUjofzztN8AjrEd
 b/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735214990; x=1735819790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4yE0d6/fT2fHAjzAIYMLLWaXzKg6hYqakVFryoy6JvQ=;
 b=TvunKT4AmWY9Snz4BuvDLVwFUZyLqfyfEfhmc0th43SuugrfSnjHMehHrVwLpsKfZU
 G2j0/2eSIZJCqJbzCXWYQEgyGwN1C7sk6RY8q5nl7xIxzyIsjdOgYc9PCKpQ4FZkyjFr
 dY96hE1tlW9u1ISAjJosWqDrO0KJjDziytgdkXytGvZx2TdibzSVxDBWfHFbqbwvxMEg
 7rJwUii8bsJ6w70frN3Dmy0Fi5L6kd4T0j+tCaBfxBf0opanhNCAmlQxbjm2x+qfCXlM
 5VeV0HPmOrouQs0qd5Xod0nEB3S6I6bmuIXIrbXpE4f1Rr6yvpxmcQsrWVUtcMlrZYcS
 kJLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI8Xv60B0bgxifBnkq6UO/jn6yRxjmIm6X+usmOaJHjOrIpXqHT1RhsjYi2njN//odqmQO9+q6Jw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzablGWCUfvepZDl1Y+p90kxe+hUqiUrDesRSjGbOktaBGyrudT
 +wyJLONMP6fFSG1E461PIjOYK0OXYzfMlDn09Zs0jtgVK84+fKafZvJanl7OgkM=
X-Gm-Gg: ASbGncs8FQ0BOb5DKSU7pvKYovAfn3uKyDuX/398E05Nw/aH6kmLeimtbKkXC46KHj1
 8u10O2S96c/TVYSp1jWxTUXvb2YQ4t3c7q6x/XuHCAtwMOCIQiJh5WxroU65j67lSPShmY16Zkg
 pwSWGqoqexImej1HwAlI3f86fHI+LdxSTN7LpgK+lSgDDeXnpluAzbFJG0TAIkGk/kwDjk4w4qO
 mntHOF2//JT3PseAJPFtFvbOLQHcx3y0T4CK6LKEExA9m6mw11CVZY=
X-Google-Smtp-Source: AGHT+IE7Mzk62uTd4yycH28u5xCSB39eiD96qbQg0fIjJMfiTxkRYB+ECRA3AUQrSJ8HACLT9c1tFw==
X-Received: by 2002:a05:6000:400b:b0:385:ee3f:5cbf with SMTP id
 ffacd0b85a97d-38a221eab74mr22082237f8f.20.1735214990215; 
 Thu, 26 Dec 2024 04:09:50 -0800 (PST)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e1cesm19043982f8f.64.2024.12.26.04.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2024 04:09:48 -0800 (PST)
Date: Thu, 26 Dec 2024 14:09:46 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
Message-ID: <Z21HimmBvwwA7/KD@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
 <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <o6xcm7jdcay77b6kltj7zownk6je6umqlmxsuscbbubw4jlr5v@w4zuusufajwx>
X-Mailman-Approved-At: Thu, 02 Jan 2025 18:11:10 +0000
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

On 24-12-11 21:22:00, Dmitry Baryshkov wrote:
> On Wed, Dec 11, 2024 at 03:04:12PM +0200, Abel Vesa wrote:
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
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
> >  include/drm/display/drm_dp_helper.h     |  2 ++
> >  2 files changed, 52 insertions(+)
> > 
> 
> 
> > +/**
> > + * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
> > + *
> > + * @aux: DisplayPort AUX channel
> > + * @lttpr_count: Number of LTTPRs
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
> > +{
> > +	if (!lttpr_count)
> > +		return 0;
> > +
> > +	/*
> > +	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
> > +	 * non-transparent mode and the disable->enable non-transparent mode
> > +	 * sequence.
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> > +
> > +	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
> > +		return 0;
> > +
> > +	/*
> > +	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
> > +	 * the number of LTTPRs is invalid
> > +	 */
> > +	drm_dp_lttpr_set_transparent_mode(aux, true);
> 
> This means that if lttpr_count < 0, then there will be two requests to
> set LTTPRs to a transparent mode. Is that expected?

Yes, exactly. If counting the LTTPRs (see drm_dp_lttpr_count) results in an
invalid number (e.g. more than 8), then according to the DP standard,
we need to roll back to transparent mode.

Do you think I need to re-word the comment above more to make it more
clearer?

> 
> > +
> > +	return -EINVAL;
> > +}
> > +EXPORT_SYMBOL(drm_dp_lttpr_init);
> > +
> 
> -- 
> With best wishes
> Dmitry

Thanks for reviewing,
Abel
