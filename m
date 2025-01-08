Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42233E7719A
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 13:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A3A10E29C;
	Wed,  8 Jan 2025 13:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Mv33jmNc";
	dkim-atps=neutral
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290010E3CD
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 13:12:55 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb7so16974492e87.2
 for <intel-xe@lists.freedesktop.org>; Wed, 08 Jan 2025 05:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736341914; x=1736946714; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DRFucKupJRi3JrfmGRRAwshOALuZUCh2srHJV4yPz/M=;
 b=Mv33jmNcOx1uLVFuBEll+weXo+PS6GGZ/Volpyics+kpVx1OOClJqIxdn6JaWnu5eD
 FTli67TWA4DEHrrJdwv386+emn72S2cdjRQgIls0JBkybGqC0VCluOTzpqTAL6kE9AVu
 /jZlRK0qyFNYShVcV8BtJ7BxMmEzTV9aUewkcqmNmJGlEmzp92pOR0s1itIWFgFjzSu6
 n2gICtDhurxGX0pC/HTJIqtvQ3TR3HRkEJ9aZ6gYPvGUFMZ2kt9RaBj0JYn37lvOKwon
 voHI4PQBaQriMC1Bx8HiQpRukjrYO24wiM7Ym2ZyDLWyVlYTmnkxihlxj6apTRPF5H9s
 Et0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736341914; x=1736946714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DRFucKupJRi3JrfmGRRAwshOALuZUCh2srHJV4yPz/M=;
 b=uZNc546LVCYTQbSrldeW8xwJegCqub+uOmnAWnpaj10A7gYrKNFiT49amInHOsRUXd
 t6HlfskQtzoX4rFXbf1FhLtbis5mGF3nclY5dqvKRZKtob8cnpXyEyO9X3CJc+vdjjts
 xKp6EPElevBJHAJ7E37tq98WzeRSFSnYwiNjFsw51oDAoIQ3Cm9t/VINSF9eH0o6C4oe
 SxDvXISVtcQ+LIpt/MGTfSH4RMTsfbdz/Q95eXyQ7ZV4oIxsZPMFHmxWEZJgOrZVXwkE
 F5zMPqmv1XS3dNDpg90wmJZi6DwkdEVCB584DuzUo9YDu2evfmllO5mySguuZkKbkvpI
 ldSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJma0ciuxtjRMd1/j8mcOJLomLqz3NYVQZgtoEuIdNBRdeBdJcvyPGvoJEt1rLasmKa2kCq/XTCw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvnEMb73ij/FXwsm4+30/08iqI4wrNof5Ng+W1MWBiLBGar3N3
 R6dA0howHygEvllm+3AogMnT3wef/cs2TIZtQF2XqwPGJLj6Px4a9pKyWUJRZrI=
X-Gm-Gg: ASbGncs+cN+jQfq65yFcQFUb8oS+TNj7P2TfrWEcouPVKuedpcSoSc5TY77X7uMVrCG
 rog3ZoEVkG6H/PoN39kGSo7id3pndEPcJhiguJGQQ1+sX8ljDt1chRbcCJD6FIDu5TJyt7At2Hs
 hjWGpgq0qsXLWRoc4m1jjMWScA4lGEoojpctaDhuksrj+2VcKsObgQtAcbpryUqx7s14IVdnstw
 Lrxv55e6FSufc97lQsuxTEy3AY9PyZtrylRrxpeNWAMJAX0YFdkTUFk+PIymKfgGx7mNrYjXIMX
 QtLMpw6boJngZVOqthVzlVGUtF+9arh9eRlI
X-Google-Smtp-Source: AGHT+IH+8M6pwb6Rkal5Oy3icsCCUmDzxSkXtYlmI/444nM3KABxABMYN+TTayrP+FqimK/xSMwSqw==
X-Received: by 2002:a05:6512:acf:b0:542:63a8:3939 with SMTP id
 2adb3069b0e04-542845a6f01mr769532e87.8.1736341913844; 
 Wed, 08 Jan 2025 05:11:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238301efsm5581695e87.247.2025.01.08.05.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 05:11:52 -0800 (PST)
Date: Wed, 8 Jan 2025 15:11:50 +0200
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
 freedreno@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH v3 3/4] drm/i915/dp: Use the generic helper to control
 LTTPR transparent mode
Message-ID: <enzj72vy523bvlphbygxn42zocvhx24eghreffzrthomhy5jxo@2l4h345h7ojl>
References: <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-0-5c367f4b0763@linaro.org>
 <20250103-drm-dp-msm-add-lttpr-transparent-mode-set-v3-3-5c367f4b0763@linaro.org>
 <3p3wgzhtptjexplxrluod6sk36xeltpoh4hxg2yagssw7nh7hj@ikc4rssp6zej>
 <Z3vQfIIDDgnFJsDn@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3vQfIIDDgnFJsDn@linaro.org>
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

On Mon, Jan 06, 2025 at 02:45:48PM +0200, Abel Vesa wrote:
> On 25-01-03 20:09:42, Dmitry Baryshkov wrote:
> > On Fri, Jan 03, 2025 at 02:58:17PM +0200, Abel Vesa wrote:
> > > LTTPRs operating modes are defined by the DisplayPort standard and the
> > > generic framework now provides a helper to switch between them, which
> > > is handling the explicit disabling of non-transparent mode and its
> > > disable->enable sequence mentioned in the DP Standard v2.0 section
> > > 3.6.6.1.
> > > 
> > > So use the new drm generic helper instead as it makes the code a bit
> > > cleaner.
> > > 
> > > Acked-by: Imre Deak <imre.deak@intel.com>
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > > ---
> > >  .../gpu/drm/i915/display/intel_dp_link_training.c  | 24 +++++-----------------
> > >  1 file changed, 5 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > index 8b1977cfec503c70f07af716ee2c00e7605c6adf..c5bad311edf7b9a5cebb633b9e9692bae397f9ed 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> > > @@ -119,9 +119,6 @@ intel_dp_set_lttpr_transparent_mode(struct intel_dp *intel_dp, bool enable)
> > >  	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
> > >  			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
> > >  
> > > -	if (drm_dp_dpcd_write(&intel_dp->aux, DP_PHY_REPEATER_MODE, &val, 1) != 1)
> > > -		return false;
> > > -
> > >  	intel_dp->lttpr_common_caps[DP_PHY_REPEATER_MODE -
> > >  				    DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV] = val;
> > >  
> > > @@ -146,6 +143,7 @@ static bool intel_dp_lttpr_transparent_mode_enabled(struct intel_dp *intel_dp)
> > >  static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > >  {
> > >  	int lttpr_count;
> > > +	int ret;
> > >  
> > >  	if (!intel_dp_read_lttpr_common_caps(intel_dp, dpcd))
> > >  		return 0;
> > > @@ -172,22 +170,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > >  		return lttpr_count;
> > >  	}
> > >  
> > > -	/*
> > > -	 * See DP Standard v2.0 3.6.6.1. about the explicit disabling of
> > > -	 * non-transparent mode and the disable->enable non-transparent mode
> > > -	 * sequence.
> > > -	 */
> > > -	intel_dp_set_lttpr_transparent_mode(intel_dp, true);
> > > -
> > > -	/*
> > > -	 * In case of unsupported number of LTTPRs or failing to switch to
> > > -	 * non-transparent mode fall-back to transparent link training mode,
> > > -	 * still taking into account any LTTPR common lane- rate/count limits.
> > > -	 */
> > > -	if (lttpr_count < 0)
> > > -		goto out_reset_lttpr_count;
> > > -
> > > -	if (!intel_dp_set_lttpr_transparent_mode(intel_dp, false)) {
> > > +	ret = drm_dp_lttpr_init(&intel_dp->aux, lttpr_count);
> > > +	if (ret) {
> > >  		lt_dbg(intel_dp, DP_PHY_DPRX,
> > >  		       "Switching to LTTPR non-transparent LT mode failed, fall-back to transparent mode\n");
> > >  
> > > @@ -196,6 +180,8 @@ static int intel_dp_init_lttpr_phys(struct intel_dp *intel_dp, const u8 dpcd[DP_
> > >  		goto out_reset_lttpr_count;
> > >  	}
> > >  
> > > +	intel_dp_set_lttpr_transparent_mode(intel_dp, false);
> > > +
> > 
> > I think the code now misses a way to update intel_dp->lttpr_common_caps
> > in a transparent-mode case:
> > intel_dp_set_lttpr_transparent_mode(intel_dp, true).
> 
> It is being called if the drm_dp_lttpr_init() returns a non-zero value,
> but that is not part of the diff here.

Ack, thanks for the explanation. I'd suggest mentioning that in the
commit message.

> 
> > 
> > >  	return lttpr_count;
> > >  
> > >  out_reset_lttpr_count:
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
