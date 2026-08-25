Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA62C61DB4
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1999710E91D;
	Tue, 25 Aug 2026 06:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UEbWco1a";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D681B10E916;
 Tue, 25 Aug 2026 06:30:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BA0C0407EA;
 Tue, 25 Aug 2026 06:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A5E1F000E9;
 Tue, 25 Aug 2026 06:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639406;
 bh=3xU5YxHq7XYCGoN1zOt4KR768l0uMo9gRb2wQ4LEvIE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=UEbWco1aBFzOn3r8Hm/iYatqoNpdtdjc8dcM35o3yBMI1yv4cXKk3usSSXyeamvpF
 uH+8wIhCGZr3ek1n+ph3KdHOr3icwGZSM6wIuakZ+oStsaXqu/Kj1EqvDZOBOnTqvE
 gySnYBqe9smeBJ/n3I0TtNezCxSRYm17vyPKSkFqPhVFj+UX+Dr8OEP7wOnobkeDma
 lz4I4AIWn/VfQ7ej0gAFqAiLakvvfw4haZmyMoOT8eyxA5BOklByRdvXadlfDVEo2l
 iypzt2kuGuQ9TLOvEtQk2ymQ1lVaKdqCClcCqLNpkIRsXYGZlVqOB7CtJfUyTDNm6p
 ykJl4iF7eu8nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 06/15] drm/i915/alpm: Auxless wake time calculation
 for Xe3p
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-7-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-7-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:30:06 +0000
Message-Id: <20260825063006.77A5E1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Severe 32-bit signed integer overflow in `tml_phy_lock` calculatio=
n results in negative time values.
- [Medium] Missing error check on `drm_dp_lttpr_count()` return value allow=
s negative error codes to corrupt ALPM time calculations.
- [Medium] The bounds check for `aux_less_wake_lines` does not use the expa=
nded Xe3LPD mask, artificially limiting the maximum wake lines and potentia=
lly disabling ALPM on newer hardware.
--

--- Patch [6]: [PATCH v5 06/15] drm/i915/alpm: Auxless wake time calculatio=
n for Xe3p ---
commit d691d0d2ce1f7d50c7d92a8c206ccf76b71ba2ce
Author: Animesh Manna <animesh.manna@intel.com>
Subject: drm/i915/alpm: Auxless wake time calculation for Xe3p

This commit adds support for auxless waketime calculation for DP2.1 ALPM,
updating dependent parameters.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 4b15d96d0ad79..af2733805505e 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -105,21 +105,50 @@ static int get_lfps_half_cycle_clocks(const struct =
intel_crtc_state *crtc_state)
>  		1000 / (2 * LFPS_CYCLE_COUNT);
>  }
> =20
> +#define ML_PHY_LOCK_LEN		252
> +#define ML_PHY_LOCK_LEN_UHBR	396
> +
>  static int get_tphy2_p2_to_p0(const struct intel_crtc_state *crtc_state)
>  {
> -	return 12 * 1000;
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +
> +	return DISPLAY_VER(display) >=3D 35 ? (20 * 1000) : (12 * 1000);
>  }
> =20
> -static int get_establishment_period(const struct intel_crtc_state *crtc_=
state)
> +static int get_establishment_period(struct intel_dp *intel_dp,
> +				    const struct intel_crtc_state *crtc_state)
>  {
>  	int t1 =3D 50 * 1000;
> -	int tps4 =3D 252;
> +	int tps4 =3D intel_dp_is_uhbr(crtc_state) ? (ML_PHY_LOCK_LEN_UHBR * 32)=
 :
> +		   (ML_PHY_LOCK_LEN * 10);
>  	/* port_clock is link rate in 10kbit/s units */
> -	int tml_phy_lock =3D 1000 * 1000 * tps4 / crtc_state->port_clock;
> +	int tml_phy_lock =3D 1000 * 1000 * tps4 / crtc_state->port_clock / 10;

[Severity: High]
Does 1000 * 1000 * tps4 overflow the 32-bit signed integer before division?

For DP 2.1 UHBR, tps4 evaluates to 396 * 32 =3D 12672, yielding a product of
12,672,000,000. This exceeds the maximum 32-bit signed integer (2,147,483,6=
47)
and results in a negative intermediate value.

This negative value will propagate through the division and subsequent time
formulas, corrupting the wake times programmed into the hardware.

> +	int lttpr_count =3D 0;
>  	int tcds, establishment_period;
> =20
> -	tcds =3D (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
> -	establishment_period =3D (SILENCE_PERIOD_TIME + t1 + tcds);
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
> +		tcds =3D (7 + DIV_ROUND_UP(6500, tml_phy_lock) + 1) * tml_phy_lock;
> +	} else {
> +		tcds =3D 7 * tml_phy_lock;
> +		lttpr_count =3D drm_dp_lttpr_count(intel_dp->lttpr_common_caps);
> +	}
> +
> +	if (lttpr_count) {

[Severity: Medium]
Can drm_dp_lttpr_count() return a negative error code here?

If drm_dp_lttpr_count() returns a negative error code (e.g., -EINVAL or
-ERANGE), lttpr_count will evaluate to true in this check.

The code will then proceed into this block and use the negative value in
arithmetic like (lttpr_count - 1), causing a massive underflow in the
calculation of tdcs, tds, and establishment_period.

Should this explicitly check if (lttpr_count > 0)?

> +		int tlw =3D 13000;
> +		int tcs =3D 10000;
> +		int tlfps_period =3D get_lfps_cycle_time(crtc_state);
> +		int tdcs =3D (SILENCE_PERIOD_TIME + t1 + tcs +
> +			    (lttpr_count - 1) * (tlw + tlfps_period));
> +		int tacds =3D 70000;
> +		int tds =3D (lttpr_count - 1) * 7 * tml_phy_lock;
> +
> +		/* tdrl is same as tcds*/
> +		establishment_period =3D tlw + tlfps_period + tdcs + tacds + tds + tcd=
s;
> +	} else {
> +		/* TODO: Add a check for data realign by DPCD 0x116[3] */
> +
> +		establishment_period =3D (SILENCE_PERIOD_TIME + t1 + tcds);
> +	}
> =20
>  	return establishment_period;
>  }

[ ... ]

> @@ -161,7 +194,7 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *in=
tel_dp,
>  		lfps_half_cycle;
> =20
>  	aux_less_wake_time =3D
> -		_lnl_compute_aux_less_wake_time(crtc_state);
> +		_lnl_compute_aux_less_wake_time(intel_dp, crtc_state);
>  	aux_less_wake_lines =3D intel_usecs_to_scanlines(&crtc_state->hw.adjust=
ed_mode,
>  						       aux_less_wake_time);
>  	silence_period =3D get_silence_period_symbols(crtc_state);

[Severity: Medium]
Does the bounds check further down in this function still use the legacy ma=
sk?

Looking at the rest of _lnl_compute_aux_less_alpm_params():

    if (aux_less_wake_lines > ALPM_CTL_AUX_LESS_WAKE_TIME_MASK ||
        ...
        return false;

    if (display->params.psr_safest_params)
        aux_less_wake_lines =3D ALPM_CTL_AUX_LESS_WAKE_TIME_MASK;

Since this patch introduces ALPM_CTL_AUX_LESS_WAKE_TIME_MASK_XE3LPD for
platforms with DISPLAY_VER >=3D 35, will these checks artificially limit the
maximum wake lines to the older 6-bit mask (63) and potentially disable ALPM
on newer hardware?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D6
