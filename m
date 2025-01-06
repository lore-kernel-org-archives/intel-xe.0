Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154F2E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 13:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB08B10E672;
	Mon,  6 Jan 2025 13:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bFiMPWdQ";
	dkim-atps=neutral
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB7810E082
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 13:52:45 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-aa66ead88b3so328868866b.0
 for <intel-xe@lists.freedesktop.org>; Mon, 06 Jan 2025 05:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736171504; x=1736776304; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
 b=bFiMPWdQkatxioB351H5TaztJhibPSH+9d/AAAZM8H6WmSZSNuyuskfvTMF6r0GZKx
 jk6Qpk6G5mF0U3oopw9aTnUkgAFobf6n/3JLUEw+5a8MmyUq6HNB2Vaw6fkKNoIB6gfm
 +xjQW4EqxQaRf8uET/CC9fCN/WEPAwHqX4JM9Lc+C+Up7kMIb+GqsHqhd2CEgCbVTX50
 gVWQvy/WtpJbRv/KFRkaDyPBVdgqRMYAM/MsCFqq+4H5kja29J/Vi/x8QyVAeR2CoRKW
 FsDn7ZuYo2BO0Gj8oTwHdYSv/KUPgKka3pCTh6zsStiu7u3IbWvEpKqWZ2i2FkHAy9Cb
 x3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736171504; x=1736776304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M2cI20yQvFh0oTzvXey8G3cCYkJTkl8Kp3cskcOiadM=;
 b=YFttY5kXaYwIsyqZIcQmdM9erydd+uPil7gDjC3JmnELqDFVRZ0JtqMtNyuSoamYOA
 tLPWgBBAnRCJNcDioFUGJnTD3ziAVYQa+5sy5Z78D4m78so7CsQo+KaIuafqsBUF2+B0
 TEVY8GF7Px0WPFoYotDnBo6SkMcGZvrLtx2ihM0hyG7IJDodI2nCpktTmZbeuWpA9S3e
 ZtaoYhDNmss0T4LRXfwPy6kGAnbU4v76mYWT5U80T/aKHGtlU8QIALPXffbU8yJiur+q
 OxbHGDKmvFAe0GS9h83Ufix8LMIcbJ1jhHNxPc9eeXGPQd9RgqP+2AjQu1ZkoDD5R3HZ
 gbEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQgX4ma1BQSJqXkqKdSL3b9zEJw3zsh3AgGycqEgMLvQMHeczRGKkhG7y4VC5pKTsKAHuZ9qZbww==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7As7ztDY1fdcyS/yTjc5VvVcmUFuY9+pmEdEaVMtyMA7ip/fN
 +YZt8ayD+yLahGa6GofGp+q9GgZoDDzyqc1ce6APwC9oo9GxGuXqF4zp7IQUiDoMAMv8i1BL3Mn
 3
X-Gm-Gg: ASbGncsPlway6odkEziwoC1/1qSrFwvdDk1hqJeh2brNQ9n3jDMLRTFKPKuJeRqDcly
 x8hYEcE74ZbtfLB3ixyjpjZGTuR/svH0tcsNp0MumPLUZkwVZdeSJtgUAW3PnkAnpKbWOw+PGl7
 BhRNn8JrACZullAzQbEC2NAkQP5LGhfZzmrVxqYfZhbJsuMCbVdTuWPnyqm5EM8cp9f2L3L3vyj
 oyYXM8iULqtNhzjoatgfBqYNjtFo1NlJsNaHY1Tprd2tTe0CrDxOCE=
X-Google-Smtp-Source: AGHT+IGPXXCGpVVL8gkklF9ZQV+if58UuE9ZivrnPJUbIt2RzTzppNgGN6AJ5opvpHjGWhdKOASxmQ==
X-Received: by 2002:a05:6000:4b07:b0:385:fa20:658b with SMTP id
 ffacd0b85a97d-38a221f6135mr46513894f8f.24.1736167552118; 
 Mon, 06 Jan 2025 04:45:52 -0800 (PST)
Received: from linaro.org ([86.121.162.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b4274csm603466965e9.38.2025.01.06.04.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 04:45:51 -0800 (PST)
Date: Mon, 6 Jan 2025 14:45:48 +0200
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <Z3vQfIIDDgnFJsDn@linaro.org>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
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

On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > LTTPRs operating modes are defined by the DisplayPort standard and the
> > generic framework now provides a helper to switch between them, which
> > is handling the explicit disabling of non-transparent mode and its
> > disable->enable sequence mentioned in the DP Standard v2.0 section
> > 3.6.6.1.
> > 
> > So use the new drm generic helper instead as it makes the code a bit
> > cleaner.
> > 
> > Acked-by: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> >  1 file changed, 5 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> >  
> > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > -		return false;
> > -
> >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> >  
> > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> >  {
> >  	int lttpr_count;
> > +	int ret;
> >  
> >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> >  		return 0;
> > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		return lttpr_count;
> >  	}
> >  
> > -	/*
> > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > -	 * non-transparent mode and the disable->enable non-transparent mode
> > -	 * sequence.
> > -	 */
> > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > -
> > -	/*
> > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > -	 * non-transparent mode fall-back to transparent link training mode,
> > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > -	 */
> > -	if (lttpr_count < 0)
> > -		goto out_reset_lttpr_count;
> > -
> > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > +	if (ret) {
> >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> >  
> > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> >  		goto out_reset_lttpr_count;
> >  	}
> >  
> > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > +
> 
> I think the code now misses a way to update intel_dp->lttpr_common_caps
> in a transparent-mode case:
> intel_dp_set_lttpr_transparent_mode(intel_dp, true).

It is being called if the drm_dp_lttpr_init() returns a non-zero value,
but that is not part of the diff here.

> 
> >  	return lttpr_count;
> >  
> >  out_reset_lttpr_count:
> > 
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
