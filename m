Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C58D767E6
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 16:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A290110E8F5;
	Thu, 31 Oct 2024 16:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eQ7s9rDk";
	dkim-atps=neutral
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBD310E02D
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 16:54:30 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2fb587d0436so13666341fa.2
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730393668; x=1730998468; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LcG1Cptwud8AIi8pa0Ca3S8gnx7zEHdaWmbNdickIkk=;
 b=eQ7s9rDkH7x/9tbsRPbw07Jf/D54ws+RfTZX4yHAdEuFowzvfMTzR4QB9QL1D4WLA2
 ApZ9+XijHoSiPzZ89IvZOd6rN4M3p8bRdo4+1Xppl9XlHTwoHJqhK5q0aN1gi51Cgh6O
 WaVhSrbu/AnV247ilCRpZHE/ZI2Iw/bkuJkWsK0qLsFe3goly5hdVEE8omG8tH164ABj
 6X9xj5Qlerime4L8KKoCtSXl+y0CGio9+JFrlWKpktwJxHcju2iuVjGOA0WlrrggwRGi
 eAQvCnvUjAaUHSjIBr7k9atiXgb3Gc0fUef+nt3ZsgjQTks73eWOq/7uHnFJ2Byas9mb
 IOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730393668; x=1730998468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LcG1Cptwud8AIi8pa0Ca3S8gnx7zEHdaWmbNdickIkk=;
 b=ejztc+EkhbvQ4fw2JN6paPKZ9E+1AMuUO/RRRantuM7wwK+knzVbaLJQco1vwhPcGq
 +B0BVmzv8o4E/tzN6KlaMyZlAozk/Z0CPrdhWdCJqobF4nAX3VUen6feCYlrDqB/SPh2
 SCp0vw3wn/0uwfzrOsj3JWdnluR8PotALdoTlygi3d7ih7ytJxuQIHs7It7I70DT1GTE
 kLAA9YdQVjtCw76VSdwLFMtgRF7Wj9X/bTa0X4aHv0KD+o+Pq8PsChcqpKpOtUweDT6y
 41Z6Qrsh2wxz7wnToJi8NejIi/Rhh+hJW7esPqIYz85F55+0pTIsRcX3xDkiDadNFoYk
 0mCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuiM2Ej4r9q93Sasxhg1IZ8ppPlfZ51CoPXhrzTYEz3S62nwuDkMDsxxz3leejleg+DgHEtiM2IQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRazUVKnOCGb6pLUXelVCfDRBS6UIQk6E7zAriBk+KP3aOyN/+
 LgwBBuGARkCANr0Tga50Nn0EHTkirCy8IOUKR7L+Dm7a2SYFjJtQ1JNyXdK+2e8=
X-Google-Smtp-Source: AGHT+IFbZzedgv73FPhHSopZrrz16kElbA7K8+QBYnMOAyeDwtCyC0BGEf/LrmGOrhd3qp//daS0zw==
X-Received: by 2002:a05:651c:1541:b0:2fb:5688:55a4 with SMTP id
 38308e7fff4ca-2fedb7a2fe0mr3529681fa.17.1730393668492; 
 Thu, 31 Oct 2024 09:54:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fdef6182dfsm2668051fa.71.2024.10.31.09.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 09:54:27 -0700 (PDT)
Date: Thu, 31 Oct 2024 18:54:25 +0200
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
Subject: Re: [PATCH RFC 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <6lpeexb5menpwrzcnmr367x4lmhvzyovhdybn54mnwk55ieehy@mos4oso67boo>
References: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
 <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-4-cafbb9855f40@linaro.org>
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

On Thu, Oct 31, 2024 at 05:12:48PM +0200, Abel Vesa wrote:
> Link Training Tunable PHY Repeaters (LTTPRs) are defined in DisplayPort
> 1.4a specification. As the name suggests, these PHY repeaters are
> capable of adjusting their output for link training purposes.
> 
> The msm DP driver is currently lacking any handling of LTTPRs.
> This means that if at least one LTTPR is found between DPTX and DPRX,
> the link training would fail if that LTTPR was not already configured
> in transparent mode.

It might be nice to mention what is the transparent mode, especially for
those who do not have the standard at hand.

> The section 3.6.6.1 from the DisplayPort v2.0 specification mandates
> that before link training with the LTTPR is started, the DPTX may place
> the LTTPR in non-transparent mode by first switching to transparent mode
> and then to non-transparent mode. This operation seems to be needed only
> on first link training and doesn't need to be done again until device is
> unplugged.
> 
> It has been observed on a few X Elite-based platforms which have
> such LTTPRs in their board design that the DPTX needs to follow the
> procedure described above in order for the link training to be successful.
> 
> So add support for reading the LTTPR DPCD caps to figure out the number
> of such LTTPRs first. Then, for platforms (or Type-C dongles) that have
> at least one such an LTTPR, set its operation mode to transparent mode
> first and then to non-transparent, just like the mentioned section of
> the specification mandates.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index f01980b0888a40b719d3958cb96c6341feada077..5d3d318d7b87ce3bf567d8b7435931d8e087f713 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -107,6 +107,8 @@ struct dp_display_private {
>  	struct dp_event event_list[DP_EVENT_Q_MAX];
>  	spinlock_t event_lock;
>  
> +	u8 lttpr_caps[DP_LTTPR_COMMON_CAP_SIZE];
> +
>  	bool wide_bus_supported;
>  
>  	struct dp_audio *audio;
> @@ -367,12 +369,35 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>  	return 0;
>  }
>  
> +static void dp_display_lttpr_init(struct dp_display_private *dp)
> +{
> +	int lttpr_count;
> +
> +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> +					  dp->lttpr_caps))
> +		return;
> +
> +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> +
> +	if (lttpr_count) {
> +		drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> +
> +		if (lttpr_count > 0) {
> +			if (drm_dp_lttpr_set_transparent_mode(dp->aux, false) != 1)
> +				drm_dp_lttpr_set_transparent_mode(dp->aux, true);
> +		}
> +	}
> +}
> +
>  static int dp_display_process_hpd_high(struct dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->dp_display.connector;
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
>  
> +	if (!dp->dp_display.is_edp)
> +		dp_display_lttpr_init(dp);

Why is it limited to non-eDP cases only.

> +
>  	rc = dp_panel_read_sink_caps(dp->panel, connector);
>  	if (rc)
>  		goto end;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
