Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801FEE7718B
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jan 2025 18:11:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD7210E7A1;
	Thu,  2 Jan 2025 18:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybqDJ5xg";
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C848210E069
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Dec 2024 12:46:17 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4368a293339so20300625e9.3
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Dec 2024 04:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735217176; x=1735821976; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UCdNvS5Djx3r+ijh8xS7MexSd/I3n9CUOOYzp0CujaU=;
 b=ybqDJ5xgC3o0tlbsoHZmSBJh4vFFyX2ftyV+w9EZQwLMwGmPNHyhsdu9x1a4A/dZ5D
 feMDUMPsqFVNvPXobYG2FhjLDnC/CJC8UWIXOY01sf7SnYQPfphJyoLefY+EY1DBrpFK
 LlXoD+QZlx/zm+4HTxzfdvtfxhxNQqm6IE1ldKt1sq6F3AaDVBzFnqojeHl2m3VnW2OC
 2uIg2uuLxauL1U8IQx/royh3W3D0lLQpHOrcCT/wqno08idI/2iclLteSG9Mq9nL6bVT
 5QE0OKA9EaCicb2FagKUfzACErfLPQR2SUaQWXSFfoaLbewH2dmMYZEu4u4R1hkBDg/K
 gjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735217176; x=1735821976;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UCdNvS5Djx3r+ijh8xS7MexSd/I3n9CUOOYzp0CujaU=;
 b=HWh3cdq+u2ysEHOxkLxAOuV/2DBrVZQlVBi/nczPPnQyLsLWxRpfUDxC1AfQyUVmp7
 4DcLgIc9n2TyCdL1T+MCYa2pm/sqZ9CMNZKFm5RvC+SWXQumfyCg6x9ziKW9ghvt++eN
 52BE2dLnadQKViX4i6BVISAG0L85Hddqa2d/uvNd0rEyYBCC3Srzt9WrYrZCZnjWKbzO
 wG42LZgiX/rM8I0TF9QI5OUkdk3M2dwMRfMn1EkSXodY2VvmY66adLCJ+Wz4+01UrtRP
 0s/wrGFHSGFF+WdAOnRhcuIObVkWm6VVrPXfmw2hh1b1Y1elS1gS34QMb9LYS1wOJzjk
 honQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOTliirscPYbrx6ai98f4SHX0nCnLp9AhMa2Y4qLLybDHerWwCSBg6L022F5HDiA0VCUXn+xaoew==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHJuBN4Yo9AEkQnaxPBxdF8akE8RB42ZlKfdbjj9gI8X4sZ5R/
 pmJ7MOgBtDwtkAYCS8cFFneQ4dSDZJObhoK4MK9ED7w5EaCr14FRqitoVvMmuuw=
X-Gm-Gg: ASbGncsP2S49+4EDhmjOz54LGFwggniZXJM15ZK6LUpOh6Nvidx8oUrBJeYsQc+2X02
 DWrG69kYpUeCLt4KjDukzO34sMFn4FwKAxa7Kqu9fpKSu0T1PH9j+vvyZ1y7XzjJ6+QGxhqvDal
 z2Y3sf5dpP6Y30iew9hKBKwZyhDj1UqwO0gua+Gx5WCdqJFr5QDQlqyjZqxWPHWipuu3rwphSFN
 rIYNbNndDXcwcw9rTCtvjVXGCQSNxo8LxJeawXvWoGzKKtLvlLJ8Lg=
X-Google-Smtp-Source: AGHT+IFdoO/zxiQ3FIpGhucTVIgGS2pedJeFOAxfk444aPe9ZZVT8fXnThIsGtTdQljhl+HRLuLbag==
X-Received: by 2002:a05:600c:1c1a:b0:436:1b81:b65c with SMTP id
 5b1f17b1804b1-43668646aebmr214219565e9.15.1735217176112; 
 Thu, 26 Dec 2024 04:46:16 -0800 (PST)
Received: from linaro.org ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea40csm231612665e9.1.2024.12.26.04.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2024 04:46:14 -0800 (PST)
Date: Thu, 26 Dec 2024 14:46:12 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/msm/dp: Add support for LTTPR handling
Message-ID: <Z21QFPYDfFOR905L@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
 <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-4-d5906ed38b28@linaro.org>
 <Z1moNToiIIB9auSl@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1moNToiIIB9auSl@hovoldconsulting.com>
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

On 24-12-11 15:56:53, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 03:04:15PM +0200, Abel Vesa wrote:
>  
> > +static void msm_dp_display_lttpr_init(struct msm_dp_display_private *dp)
> > +{
> > +	int lttpr_count;
> > +
> > +	if (drm_dp_read_lttpr_common_caps(dp->aux, dp->panel->dpcd,
> > +					  dp->lttpr_caps))
> > +		return;
> > +
> > +	lttpr_count = drm_dp_lttpr_count(dp->lttpr_caps);
> 
> I was gonna say shouldn't you handle errors here, but that explains the
> non-negative check I commented on the first patch in the series.

So lttpr_count is a bit weird. It's either between 0 and 8, or -ERANGE
if more than 8 LTTPRs are found, or -EINVAL if for some reason the
DP_PHY_REPEATER_CNT register contains an invalid value.
(see drm_dp_lttpr_count())

Now, I think I should just drop the lttr_count local variable here entirely.

> 
> This looks error prone, but I think you should at least update the
> kernel doc comment to drm_dp_lttpr_init() in the first patch so that
> it's clear that you pass in the number of LTTPRs *or* an errno.

Yes, I'll do that. Will mention all possible values and what they mean.
And will probably point to the drm_dp_lttpr_count() as well, just to be
safe.

> 
> > +
> > +	drm_dp_lttpr_init(dp->aux, lttpr_count);
> > +}
> > +
> >  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> >  {
> >  	struct drm_connector *connector = dp->msm_dp_display.connector;
> >  	const struct drm_display_info *info = &connector->display_info;
> >  	int rc = 0;
> >  
> > +	msm_dp_display_lttpr_init(dp);
> 
> It looks like you ignore errors on purpose so I guess that's fine.

Maybe I should at least throw an error, just like the i915 does.
Will do that.

> 
> > +
> >  	rc = msm_dp_panel_read_sink_caps(dp->panel, connector);
> >  	if (rc)
> >  		goto end;
> 
> Either way, this is needed for external display on my x1e80100 machines,
> while not breaking the X13s:
> 
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Johan

Thanks for reviewing and testing,
Abel
