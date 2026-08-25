Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB2DC61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C33D10E90F;
	Tue, 25 Aug 2026 06:39:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SqC1odXG";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705C710E90F;
 Tue, 25 Aug 2026 06:39:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 399154056F;
 Tue, 25 Aug 2026 06:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014EB1F000E9;
 Tue, 25 Aug 2026 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639948;
 bh=ez/atb2PfRMJSG7r1mZyAx3GWTy8kKCacdcgCQYFFoM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=SqC1odXGtfQcMMMCAMJZNSXqf6vGk3niULrvE/05Bl2cEDHrWaNs6jMe9FqYqQH/d
 W8XBl6zG6a/yB5M90f3KyY/okYTofy0nS33XJ/2OqAccCzKoMeBCYxBAfJrmkn/MYf
 vuC3kH4JzEw1zW0kJb+8eJBxu3+3gx06itAxAZZn3YLBdgkmQND6ddfLKiyr/aHmbi
 CzUpdKD9jN50DF5z5pgbCDIkf+p9cb01oJn9A7yMIwSh1JYbKEickGtLoWENclgXp9
 V1SLp+GViYqSqlWBRHZAL1YBqdvhiXogtv5cflsRN9aSQt4QiSMM0WAz8SZRSX0xHz
 SfjASwqNqX4Yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/15] drm/i915/alpm: Compute and program switch to
 active latency
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-15-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-15-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:39:07 +0000
Message-Id: <20260825063908.014EB1F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Severe integer arithmetic precision loss in `get_switch_to_active`=
 calculates a latency of 0 for UHBR20 links and incorrect values for other =
UHBR links.
- [Medium] Missing bounds validation for the computed `switch_to_active` sc=
anline value.
--

--- Patch [14]: [PATCH v5 14/15] drm/i915/alpm: Compute and program switch =
to active latency ---
commit c70c27fb353539a13b15cf08616e266e5b7146a1
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Compute and program switch to active latency

This commit programs the ALPM switch-to-active latency into ALPM_CTL2. For
UHBR link rates, the latency is derived from the link symbol clock and
converted to scanlines. For non-UHBR rates, the latency is zero.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 8c17da9883d6d..5d2ac75615670 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c

[ ... ]

> @@ -270,6 +270,31 @@ static int get_establishment_period(struct intel_dp =
*intel_dp,
>  	return establishment_period;
>  }
> =20
> +
> +static int get_switch_to_active(const struct intel_crtc_state *crtc_stat=
e)
> +{
> +	int port_clock =3D crtc_state->port_clock;
> +	int switch_to_active;
> +
> +	if (intel_dp_is_uhbr(crtc_state)) {
> +		/* symbol_clock (fLink) in MHz */
> +		int symbol_clock =3D port_clock / intel_dp_link_symbol_size(port_clock=
) / 100;
> +
> +		/*
> +		 * tSwitch to Active =3D 32 * (ML_PHY_LOCK Length + 3 + 64) / fLink
> +		 *
> +		 * The "+ 3" term is the trailing zero padding after the
> +		 * POST_LT_SCRAMBLER_RESET, the "+ 64" term represents the MTP
> +		 * time slots. The result is in microseconds.
> +		 */
> +		switch_to_active =3D 32 * ((396 + 3 + 64) / symbol_clock);

[Severity: High]
Does this calculation lose precision by performing the division before the
multiplication?

For a UHBR20 link where symbol_clock is 625 MHz, the integer division
(396 + 3 + 64) / 625 will yield 0, resulting in a switch_to_active latency
of 0.

For UHBR10 (312 MHz) and UHBR13.5 (421 MHz), the division will yield 1,
making the result 32 instead of the mathematically correct values of ~47
and ~35, respectively.

Should this multiply before dividing, perhaps using DIV_ROUND_UP()?

> +	} else {
> +		switch_to_active =3D 0;
> +	}
> +
> +	return switch_to_active;
> +}
> +
>  /*
>   * AUX-Less Wake Time =3D CEILING( ((PHY P2 to P0) + tLFPS_Period, Max+
>   * tSilence, Max+ tPHY Establishment + tCDS) / tline)

[ ... ]

> @@ -329,7 +354,8 @@ _lnl_compute_aux_less_alpm_params(struct intel_dp *in=
tel_dp,
>  	crtc_state->alpm_state.aux_less_wake_lines =3D aux_less_wake_lines;
>  	crtc_state->alpm_state.silence_period_sym_clocks =3D silence_period;
>  	crtc_state->alpm_state.lfps_half_cycle_num_of_syms =3D lfps_half_cycle;
> -
> +	crtc_state->alpm_state.switch_to_active =3D intel_usecs_to_scanlines(&c=
rtc_state->hw.adjusted_mode,
> +									   get_switch_to_active(crtc_state));

[Severity: Medium]
Is it possible for the computed scanline value to exceed the hardware limit=
s?

Earlier in _lnl_compute_aux_less_alpm_params(), values like
aux_less_wake_lines and silence_period are checked against their hardware
bounds, and the function returns false if they exceed limits to safely reje=
ct
the configuration.

However, switch_to_active is programmed into a 5-bit register field
(ALPM_CTL2_SWITCH_TO_ACTIVE_LATENCY_MASK). If the converted scanline value
exceeds 31, it will be silently truncated when passed to the macro in
lnl_alpm_configure().

Should there be a bounds check for switch_to_active before applying it?

>  	return true;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D14
