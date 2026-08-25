Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE22C61CE3
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D26C10E91D;
	Tue, 25 Aug 2026 06:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NlXvKQSx";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D964010E919;
 Tue, 25 Aug 2026 06:40:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id AF86740F7F;
 Tue, 25 Aug 2026 06:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DE21F000E9;
 Tue, 25 Aug 2026 06:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787640049;
 bh=It9GG9fzvSr3SwSjDMXvsPCH+A/3J8M2U2OYMy1k6Jw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NlXvKQSxRtrQPkuWULw0mORqs26K3eF7mS9nbqtaE3SGqyA+KMn94zQvN1Ax2cheo
 JPiwniFNb8hVYzC37J65QK+f2zblauCcFAlsbqMjXTQ+wtOCTLpDq79EoQ/1Yafy/n
 OrIbE3rTDuOV6g7JdHRNdqTvGh7dI71OKpdYuhXYn4kfDJavp1R30sU4OWGCtBrWZj
 ra263v754jDVW1Gpb4QoTwMJowufg8LbNbdSeyKEk/iuyNrmYpzILyRG4RZrFYM51L
 gCvvZSpAnWmvddkVPNFBxAg3AEVcISTFtBrYwRag14gyNlbDtr1ZpGFQ7vgRhwrUdJ
 ClmBadFDh3oVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 15/15] drm/i915/alpm: Program zero-based LFPS half
 cycle duration
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-16-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-16-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:40:49 +0000
Message-Id: <20260825064049.76DE21F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] Calculation of LFPS half cycle clocks incorrectly uses the link bi=
t rate instead of the symbol clock, breaking UHBR configurations.
- [High] Signed 32-bit integer overflow in `get_establishment_period()` cau=
ses ALPM wake times to be calculated as negative values.
- [High] Premature integer division in `get_switch_to_active()` causes swit=
ch-to-active latency to incorrectly evaluate to 0 for UHBR20.
--

--- Patch [15]: [PATCH v5 15/15] drm/i915/alpm: Program zero-based LFPS hal=
f cycle duration ---
commit 6cd79e290a7ff8352dbda337c2c68d7456099444
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Program zero-based LFPS half cycle duration

The LFPS Half Cycle Duration field, as well as the First and Last LFPS
Half Cycle Duration fields, in PORT_ALPM_LFPS_CTL are zero-based: per
Bspec the value programmed must be N_Symbol - 1. get_lfps_half_cycle_clocks=
()
returned N_Symbol and programmed it directly into all three fields, making
each half cycle one symbol clock too long.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 5d2ac75615670..9768279f94ef5 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -123,8 +123,16 @@ static int get_lfps_cycle_count(const struct intel_c=
rtc_state *crtc_state)
> =20
>  static int get_lfps_half_cycle_clocks(const struct intel_crtc_state *crt=
c_state)
>  {
> -	return get_lfps_cycle_time(crtc_state) * crtc_state->port_clock / 1000 /
> -		1000 / (2 * get_lfps_cycle_count(crtc_state));
> +	int n_symbols =3D get_lfps_cycle_time(crtc_state) * crtc_state->port_cl=
ock /
> +			1000 / 1000 / (2 * get_lfps_cycle_count(crtc_state));

[Severity: High]
This is a pre-existing issue, but does this correctly calculate the frequen=
cy
multiplier for UHBR configurations?

For UHBR encoding (128b/132b), the symbol clock in kHz is
port_clock * 10 / 32, not port_clock. When used for UHBR20, using the
inflated bit rate results in n_symbols - 1 =3D 59, which exceeds
PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION_MASK (31).

Could this cause validation to fail and completely disable ALPM on UHBR
displays?

> +
> +	/*
> +	 * The LFPS half cycle duration fields (including the first and last
> +	 * half cycle) are zero-based, i.e. the value programmed is N_Symbol - =
1.
> +	 *
> +	 * Bspec: 71632
> +	 */
> +	return n_symbols - 1;
>  }

[ ... ]

> static int get_establishment_period(struct intel_dp *intel_dp,
> 				    const struct intel_crtc_state *crtc_state)
> {
[ ... ]
> 	int tps4 =3D intel_dp_is_uhbr(crtc_state) ? (ML_PHY_LOCK_LEN_UHBR * 32) :
> 		   (ML_PHY_LOCK_LEN * 10);
> 	/* port_clock is link rate in 10kbit/s units */
> 	int tml_phy_lock =3D 1000 * 1000 * tps4 / crtc_state->port_clock / 10;

[Severity: High]
This isn't a bug introduced by this patch, but can this intermediate
expression overflow?

The sub-expression "1000 * 1000 * tps4" evaluates using signed 32-bit
arithmetic. For non-UHBR links, tps4 is 2520, making the result
2,520,000,000. Since this exceeds INT_MAX (2,147,483,647), it wraps around
to -1,774,967,296.

Does this negative value propagate through to the final establishment_perio=
d,
causing incorrect ALPM hardware programming?

[ ... ]

> static int get_switch_to_active(const struct intel_crtc_state *crtc_state)
> {
[ ... ]
> 	if (intel_dp_is_uhbr(crtc_state)) {
> 		/* symbol_clock (fLink) in MHz */
> 		int symbol_clock =3D port_clock / intel_dp_link_symbol_size(port_clock)=
 / 100;
>=20
> 		/*
> 		 * tSwitch to Active =3D 32 * (ML_PHY_LOCK Length + 3 + 64) / fLink
> 		 *
> 		 * The "+ 3" term is the trailing zero padding after the
> 		 * POST_LT_SCRAMBLER_RESET, the "+ 64" term represents the MTP
> 		 * time slots. The result is in microseconds.
> 		 */
> 		switch_to_active =3D 32 * ((396 + 3 + 64) / symbol_clock);

[Severity: High]
This is a pre-existing issue, but does this integer division evaluate to 0
for UHBR20 links?

The expression "396 + 3 + 64" equals 463. For a UHBR20 link, symbol_clock is
625 MHz. The integer division 463 / 625 truncates to 0, resulting in an
overall latency of 0 scanlines instead of the intended ~23 microseconds.

Could this zero-latency configuration break the link state machine recovery
for UHBR20 displays?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D15
