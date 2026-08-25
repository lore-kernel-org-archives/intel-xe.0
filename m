Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8BCC5DF94
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 06:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352FD10E91E;
	Tue, 25 Aug 2026 06:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Maswu0WK";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F28E10E916;
 Tue, 25 Aug 2026 06:31:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id A5925601DE;
 Tue, 25 Aug 2026 06:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B491F000E9;
 Tue, 25 Aug 2026 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787639513;
 bh=3TV+/bICgXt5ksruFGdP9eR3uhIcInISdtS/PwJVTmk=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Maswu0WK/aWBcJfkCZVfx7+OrrIvN44yrTCFPY9w7TEYZCvrkx5oRlwuSksIZt8ze
 zNsAMYtSeuy0xvwp3FJN1HlagGIMK6EPyq2cGYMiKm6aY2J77P7jaPRZaXGoJGSlvs
 YkkY5Ma5UQfN+yoU2t7cHOojRhGoxgX3RQsWl0A9ECxR27Gd0feMu2216tlIwRIExR
 Jza8rcHCYvMujdIzTQ3u8VmGhTknBvof4EC6uZIMtjEHKeHk0UrkE3PBSA3h3xiaoy
 YCB8yAvdYMbia/ggixFqImrNCi6jPOCYwwY/ZnvO6W10/UL9CjFd8Ppx7B40wEUhg6
 5GsychmzrLqcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/15] drm/i915/alpm: Half LFPS cycle calculation
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20260825054536.3455704-9-animesh.manna@intel.com>
References: <20260825054536.3455704-1-animesh.manna@intel.com>
 <20260825054536.3455704-9-animesh.manna@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 06:31:52 +0000
Message-Id: <20260825063153.27B491F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `get_lfps_half_cycle_clocks()` incorrectly uses the DP port clock =
(link rate) instead of the symbol clock, which inflates the cycle count and=
 causes it to exceed the 5-bit register mask for DP 2.1 UHBR rates, complet=
ely breaking ALPM.
--

--- Patch [8]: [PATCH v5 08/15] drm/i915/alpm: Half LFPS cycle calculation =
---
commit 3b44d7e9f6ce14c0e3f4bb3319784906c402099b
Author: Animesh Manna <animesh.manna@intel.com>

drm/i915/alpm: Half LFPS cycle calculation

Add support for half LFPS cycle calculation for DP2.1 ALPM as dependent
parameters got changed.

> diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/=
i915/display/intel_alpm.c
> index 078e04bb69d29..98aa418a6ff77 100644
> --- a/drivers/gpu/drm/i915/display/intel_alpm.c
> +++ b/drivers/gpu/drm/i915/display/intel_alpm.c
> @@ -80,12 +80,18 @@ static int get_silence_period_symbols(const struct in=
tel_crtc_state *crtc_state)

[Severity: High]
This isn't a bug introduced by this patch, but since this patch series
enables DP 2.1 ALPM, it exposes an issue in get_lfps_half_cycle_clocks()
(which is located nearby in this file).

Does get_lfps_half_cycle_clocks() incorrectly use the DP port clock
(link rate) instead of the symbol clock?

For legacy 8b/10b encoding, the link rate in 10 kbps is numerically equal
to the symbol clock in kHz. However, for 128b/132b (UHBR) rates introduced
in DP 2.1, the link rate is 3.2x the symbol clock. This inflates the symbol
count calculation by a factor of 3.2.

When this inflated value is checked against the 5-bit mask
(PORT_ALPM_LFPS_CTL_LAST_LFPS_HALF_CYCLE_DURATION_MASK) in
_lnl_compute_aux_less_alpm_params(), it unconditionally fails because it
exceeds the maximum value of 31. This causes ALPM configuration to abort for
any DP 2.1 UHBR display.

Other ALPM functions like get_silence_period_symbols() correctly use
intel_dp_link_symbol_clock(crtc_state->port_clock). Should
get_lfps_half_cycle_clocks() also be updated to use the symbol clock?

>  static void get_lfps_cycle_min_max_time(const struct intel_crtc_state *c=
rtc_state,
>  					int *min, int *max)
>  {
> -	if (crtc_state->port_clock < 540000) {
> -		*min =3D 65 * LFPS_CYCLE_COUNT;
> -		*max =3D 75 * LFPS_CYCLE_COUNT;
> -	} else {
> -		*min =3D 140;
> -		*max =3D 800;
> +	struct intel_display *display =3D to_intel_display(crtc_state);
> +
> +	*min =3D 320;
> +	*max =3D 1600;
> +	if (intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP)) {
> +		if (crtc_state->port_clock < 540000 && DISPLAY_VER(display) < 35) {
> +			*min =3D 65 * LFPS_CYCLE_COUNT;
> +			*max =3D 75 * LFPS_CYCLE_COUNT;
> +		} else {
> +			*min =3D 140;
> +			*max =3D 800;
> +		}
>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825054536.3455=
704-1-animesh.manna@intel.com?part=3D8
